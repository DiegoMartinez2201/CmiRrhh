using System.Globalization;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Reportes;

public sealed record ResultadoReporte(bool Exitoso, string? Error, ReporteTabla? Tabla);

public interface IReporteService
{
    IReadOnlyList<DefinicionReporte> Reportes();

    DefinicionReporte? Definicion(string clave);

    Task<ResultadoReporte> EjecutarAsync(string clave, IReadOnlyDictionary<string, string?> parametros, CancellationToken cancellationToken = default);
}

/// <summary>Resuelve el reporte por clave, valida sus parámetros según su tipo y lo ejecuta.</summary>
public sealed class ReporteService : IReporteService
{
    private readonly IReadOnlyDictionary<string, IReporteTabular> _reportes;

    public ReporteService(IEnumerable<IReporteTabular> reportes)
    {
        _reportes = reportes.ToDictionary(r => r.Definicion.Clave, StringComparer.OrdinalIgnoreCase);
    }

    public IReadOnlyList<DefinicionReporte> Reportes()
        => _reportes.Values.Select(r => r.Definicion).OrderBy(d => d.Titulo).ToList();

    public DefinicionReporte? Definicion(string clave)
        => _reportes.TryGetValue(clave, out var r) ? r.Definicion : null;

    public async Task<ResultadoReporte> EjecutarAsync(
        string clave, IReadOnlyDictionary<string, string?> parametros, CancellationToken cancellationToken = default)
    {
        if (!_reportes.TryGetValue(clave, out var reporte))
        {
            return new ResultadoReporte(false, "El reporte solicitado no existe.", null);
        }

        var validos = new Dictionary<string, string>();
        foreach (var p in reporte.Definicion.Parametros)
        {
            parametros.TryGetValue(p.Clave, out var crudo);
            var error = Validar(p, crudo?.Trim());
            if (error is not null)
            {
                return new ResultadoReporte(false, error, null);
            }

            validos[p.Clave] = crudo!.Trim();
        }

        var rango = ValidarRango(validos);
        if (rango is not null)
        {
            return new ResultadoReporte(false, rango, null);
        }

        var tabla = await reporte.EjecutarAsync(validos, cancellationToken);
        return new ResultadoReporte(true, null, tabla);
    }

    private static string? Validar(ParametroReporte p, string? valor)
    {
        if (string.IsNullOrEmpty(valor))
        {
            return $"Indique «{p.Etiqueta}».";
        }

        switch (p.Tipo)
        {
            case TipoParametroReporte.Mes:
                return int.TryParse(valor, NumberStyles.Integer, CultureInfo.InvariantCulture, out var mes) && mes is >= 1 and <= 12
                    ? null : "El mes no es válido.";
            case TipoParametroReporte.Fecha:
                return DateTime.TryParse(valor, CultureInfo.InvariantCulture, DateTimeStyles.None, out var f) && f.Year >= 1900
                    ? null : $"«{p.Etiqueta}» no es una fecha válida.";
            case TipoParametroReporte.Cargo:
                return int.TryParse(valor, NumberStyles.Integer, CultureInfo.InvariantCulture, out var c) && c > 0
                    ? null : "Seleccione un cargo.";
            case TipoParametroReporte.TipoTrabajador:
                return int.TryParse(valor, NumberStyles.Integer, CultureInfo.InvariantCulture, out var t) && t >= 0
                    ? null : "El tipo de trabajador no es válido.";
            case TipoParametroReporte.TipoTrabajadorObligatorio:
                return int.TryParse(valor, NumberStyles.Integer, CultureInfo.InvariantCulture, out var to) && to > 0
                    ? null : "Seleccione el tipo de trabajador.";
            case TipoParametroReporte.TipoPermiso:
                return int.TryParse(valor, NumberStyles.Integer, CultureInfo.InvariantCulture, out var tp) && tp >= 0
                    ? null : "El tipo de permiso no es válido.";
            default:
                return null;
        }
    }

    private static string? ValidarRango(IReadOnlyDictionary<string, string> v)
    {
        if (v.TryGetValue("desde", out var d) && v.TryGetValue("hasta", out var h)
            && DateTime.Parse(h, CultureInfo.InvariantCulture) < DateTime.Parse(d, CultureInfo.InvariantCulture))
        {
            return "La fecha final no puede ser anterior a la inicial.";
        }

        return null;
    }
}
