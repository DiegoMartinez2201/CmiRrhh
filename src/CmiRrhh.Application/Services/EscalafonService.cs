using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public sealed record ResultadoEscalafon(bool Ok, IReadOnlyList<string> Errores)
{
    public static ResultadoEscalafon Exito() => new(true, Array.Empty<string>());

    public static ResultadoEscalafon Fallo(params string[] errores) => new(false, errores);

    public static ResultadoEscalafon Fallo(IReadOnlyList<string> errores) => new(false, errores);
}

public interface IEscalafonService
{
    /// <summary>Secciones disponibles, en el orden en que se muestran como pestañas.</summary>
    IReadOnlyList<DefinicionSeccionEscalafon> Secciones();

    Task<IReadOnlyList<FilaEscalafon>> ListarAsync(string seccion, int idEmpleado, CancellationToken cancellationToken = default);

    Task<IReadOnlyDictionary<string, IReadOnlyList<CatalogoItem>>> OpcionesAsync(string seccion, CancellationToken cancellationToken = default);

    /// <summary>Valida y agrega (clave null) o modifica un registro de la sección.</summary>
    Task<ResultadoEscalafon> GuardarAsync(
        string seccion,
        int idEmpleado,
        string? clave,
        IReadOnlyDictionary<string, string?> valores,
        CancellationToken cancellationToken = default);

    Task<ResultadoEscalafon> EliminarAsync(string seccion, int idEmpleado, string clave, CancellationToken cancellationToken = default);
}

/// <summary>Resuelve la sección por clave, valida los valores según su definición y delega en ella.</summary>
public sealed class EscalafonService : IEscalafonService
{
    // Las fechas de estas tablas son smalldatetime/datetime: se acota al rango que SQL Server admite.
    private static readonly DateTime FechaMinima = new(1900, 1, 1);
    private static readonly DateTime FechaMaxima = new(2079, 6, 6);

    private readonly IReadOnlyList<IEscalafonSeccion> _secciones;

    public EscalafonService(IEnumerable<IEscalafonSeccion> secciones)
    {
        _secciones = secciones.ToList();
    }

    public IReadOnlyList<DefinicionSeccionEscalafon> Secciones() => _secciones.Select(s => s.Definicion).ToList();

    private IEscalafonSeccion? Buscar(string clave)
        => _secciones.FirstOrDefault(s => string.Equals(s.Definicion.Clave, clave, StringComparison.OrdinalIgnoreCase));

    public Task<IReadOnlyList<FilaEscalafon>> ListarAsync(string seccion, int idEmpleado, CancellationToken cancellationToken = default)
    {
        var s = Buscar(seccion);
        return s is null
            ? Task.FromResult<IReadOnlyList<FilaEscalafon>>(Array.Empty<FilaEscalafon>())
            : s.ListarAsync(idEmpleado, cancellationToken);
    }

    public Task<IReadOnlyDictionary<string, IReadOnlyList<CatalogoItem>>> OpcionesAsync(string seccion, CancellationToken cancellationToken = default)
    {
        var s = Buscar(seccion);
        return s is null
            ? Task.FromResult<IReadOnlyDictionary<string, IReadOnlyList<CatalogoItem>>>(new Dictionary<string, IReadOnlyList<CatalogoItem>>())
            : s.OpcionesAsync(cancellationToken);
    }

    public async Task<ResultadoEscalafon> GuardarAsync(
        string seccion,
        int idEmpleado,
        string? clave,
        IReadOnlyDictionary<string, string?> valores,
        CancellationToken cancellationToken = default)
    {
        var s = Buscar(seccion);
        if (s is null)
        {
            return ResultadoEscalafon.Fallo("La sección solicitada no existe.");
        }

        var esAlta = clave is null;
        var opciones = await s.OpcionesAsync(cancellationToken);
        var errores = new List<string>();
        var limpios = new Dictionary<string, string>();

        foreach (var campo in s.Definicion.Campos)
        {
            // Los campos de la clave del registro no se modifican: se conserva el valor existente.
            if (!esAlta && campo.SoloAlta)
            {
                continue;
            }

            valores.TryGetValue(campo.Clave, out var crudo);
            var valor = (crudo ?? string.Empty).Trim();

            switch (campo.Tipo)
            {
                case TipoCampoEscalafon.SiNo:
                    limpios[campo.Clave] = valor is "1" or "true" or "on" ? "1" : "0";
                    break;

                case TipoCampoEscalafon.Texto:
                    if (valor.Length == 0)
                    {
                        if (campo.Requerido)
                        {
                            errores.Add($"Debe ingresar «{campo.Etiqueta}».");
                        }
                    }
                    else if (campo.MaxLongitud > 0 && valor.Length > campo.MaxLongitud)
                    {
                        errores.Add($"«{campo.Etiqueta}» admite como máximo {campo.MaxLongitud} caracteres.");
                    }
                    else
                    {
                        limpios[campo.Clave] = valor;
                    }

                    break;

                case TipoCampoEscalafon.Fecha:
                    if (valor.Length == 0)
                    {
                        if (campo.Requerido)
                        {
                            errores.Add($"Debe ingresar «{campo.Etiqueta}».");
                        }
                    }
                    else if (!DateTime.TryParseExact(valor, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out var fecha)
                             || fecha < FechaMinima || fecha > FechaMaxima)
                    {
                        errores.Add($"«{campo.Etiqueta}» no es una fecha válida.");
                    }
                    else
                    {
                        limpios[campo.Clave] = valor;
                    }

                    break;

                case TipoCampoEscalafon.Opcion:
                    if (valor.Length == 0)
                    {
                        if (campo.Requerido)
                        {
                            errores.Add($"Seleccione «{campo.Etiqueta}».");
                        }
                    }
                    else if (!opciones.TryGetValue(campo.Clave, out var lista)
                             || !lista.Any(o => o.Id.ToString(CultureInfo.InvariantCulture) == valor))
                    {
                        errores.Add($"«{campo.Etiqueta}» no es una opción válida.");
                    }
                    else
                    {
                        limpios[campo.Clave] = valor;
                    }

                    break;
            }
        }

        if (errores.Count == 0)
        {
            var regla = s.ValidarReglas(limpios);
            if (regla is not null)
            {
                errores.Add(regla);
            }
        }

        if (errores.Count > 0)
        {
            return ResultadoEscalafon.Fallo(errores);
        }

        // Los valores de los campos de solo alta no viajan al modificar; la sección tampoco los escribe.
        var error = await s.GuardarAsync(idEmpleado, clave, limpios, cancellationToken);
        return error is null ? ResultadoEscalafon.Exito() : ResultadoEscalafon.Fallo(error);
    }

    public async Task<ResultadoEscalafon> EliminarAsync(string seccion, int idEmpleado, string clave, CancellationToken cancellationToken = default)
    {
        var s = Buscar(seccion);
        if (s is null)
        {
            return ResultadoEscalafon.Fallo("La sección solicitada no existe.");
        }

        var error = await s.EliminarAsync(idEmpleado, clave, cancellationToken);
        return error is null ? ResultadoEscalafon.Exito() : ResultadoEscalafon.Fallo(error);
    }
}
