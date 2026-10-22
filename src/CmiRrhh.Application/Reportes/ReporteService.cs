using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Reportes;

public sealed record ResultadoReporte(bool Exitoso, string? Error, ReporteTabla? Tabla);

public interface IReporteService
{
    IReadOnlyList<DefinicionReporte> Reportes();

    DefinicionReporte? Definicion(string clave);

    Task<ResultadoReporte> EjecutarAsync(string clave, IReadOnlyDictionary<string, string?> parametros, CancellationToken cancellationToken = default);

    /// <summary>Opciones del parámetro «Profesión».</summary>
    Task<IReadOnlyList<string>> ListarProfesionesAsync(CancellationToken cancellationToken = default);

    /// <summary>Opciones del parámetro «Área»: unidades orgánicas del año vigente.</summary>
    Task<IReadOnlyList<CatalogoItem>> ListarAreasAsync(CancellationToken cancellationToken = default);
}

/// <summary>Resuelve el reporte por clave, valida sus parámetros según su tipo y lo ejecuta.</summary>
public sealed class ReporteService : IReporteService
{
    private readonly IReadOnlyDictionary<string, IReporteTabular> _reportes;

    private readonly IReporteRepository _repositorio;
    private readonly IFichaPersonalRepository _fichas;

    public ReporteService(
        IEnumerable<IReporteTabular> reportes,
        IReporteRepository repositorio,
        IFichaPersonalRepository fichas)
    {
        _reportes = reportes.ToDictionary(r => r.Definicion.Clave, StringComparer.OrdinalIgnoreCase);
        _repositorio = repositorio;
        _fichas = fichas;
    }

    public Task<IReadOnlyList<string>> ListarProfesionesAsync(CancellationToken cancellationToken = default)
        => _repositorio.ListarProfesionesAsync(cancellationToken);

    public Task<IReadOnlyList<CatalogoItem>> ListarAreasAsync(CancellationToken cancellationToken = default)
        => _fichas.ListarAreasAsync(DateTime.Today.Year, cancellationToken);

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

            validos[p.Clave] = crudo?.Trim() ?? string.Empty;
        }

        var rango = ValidarRango(validos);
        if (rango is not null)
        {
            return new ResultadoReporte(false, rango, null);
        }

        try
        {
            var tabla = await reporte.EjecutarAsync(validos, cancellationToken);
            return new ResultadoReporte(true, null, tabla);
        }
        catch (Exception ex) when (ex is not OperationCanceledException)
        {
            // Un error de base de datos o de reglas del reporte se muestra en la pantalla, no como página de error.
            return new ResultadoReporte(false, "No se pudo generar el reporte: " + ex.Message, null);
        }
    }

    private static string? Validar(ParametroReporte p, string? valor)
    {
        if (string.IsNullOrEmpty(valor))
        {
            return p.Tipo switch
            {
                TipoParametroReporte.Dni => null,
                TipoParametroReporte.Locales => "Debe seleccionar un lugar de marcado.",
                _ => $"Indique «{p.Etiqueta}»."
            };
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
            case TipoParametroReporte.Profesion:
                return valor.Length <= 200 ? null : "La profesión no es válida.";
            case TipoParametroReporte.Area:
                return int.TryParse(valor, NumberStyles.Integer, CultureInfo.InvariantCulture, out var a) && a >= 0
                    ? null : "La unidad orgánica no es válida.";
            case TipoParametroReporte.AreaObligatoria:
                return int.TryParse(valor, NumberStyles.Integer, CultureInfo.InvariantCulture, out var ao) && ao > 0
                    ? null : "Debe seleccionar una Oficina por lo menos.";
            case TipoParametroReporte.SiNo:
                return valor is "0" or "1" ? null : $"«{p.Etiqueta}» no es válido.";
            case TipoParametroReporte.Dni:
                return valor.Length <= 8 && valor.All(char.IsDigit) ? null : "El DNI debe tener hasta 8 dígitos.";
            case TipoParametroReporte.Locales:
                return valor.Split(',').All(x => int.TryParse(x, NumberStyles.Integer, CultureInfo.InvariantCulture, out var l) && l > 0)
                    ? null : "Los lugares de marcado no son válidos.";
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
