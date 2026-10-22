using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Reportes;

/// <summary>Relación de permisos otorgados en un rango de fechas (spRRHH_RepPermisos).</summary>
public sealed class ReporteRelacionPermisos : IReporteTabular
{
    private readonly IPermisoReporteRepository _permisos;

    public ReporteRelacionPermisos(IPermisoReporteRepository permisos)
    {
        _permisos = permisos;
    }

    public DefinicionReporte Definicion { get; } = new(
        "relacion-permisos",
        "Relación de permisos",
        "Permisos cuyo inicio cae en el rango indicado, con su cargo, área, motivo y horario.",
        new[]
        {
            new ParametroReporte("desde", "Desde", TipoParametroReporte.Fecha),
            new ParametroReporte("hasta", "Hasta", TipoParametroReporte.Fecha),
            new ParametroReporte("tipoPermiso", "Tipo de permiso", TipoParametroReporte.TipoPermiso),
            new ParametroReporte("tipo", "Tipo de trabajador", TipoParametroReporte.TipoTrabajador)
        });

    public async Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default)
    {
        var desde = DateTime.Parse(parametros["desde"], CultureInfo.InvariantCulture);
        var hasta = DateTime.Parse(parametros["hasta"], CultureInfo.InvariantCulture);
        var tipoPermiso = int.Parse(parametros["tipoPermiso"], CultureInfo.InvariantCulture);
        var tipo = int.Parse(parametros["tipo"], CultureInfo.InvariantCulture);

        // 0 = «todos»: el procedimiento espera NULL para no filtrar.
        var tabla = await _permisos.ReportePermisosAsync(
            desde.ToString("yyyyMMdd", CultureInfo.InvariantCulture),
            hasta.ToString("yyyyMMdd", CultureInfo.InvariantCulture),
            tipoPermiso == 0 ? null : tipoPermiso,
            null,
            tipo == 0 ? null : tipo,
            cancellationToken);

        return new ReporteTabla
        {
            Columnas = new[]
            {
                "Apellidos y nombres", "Cargo", "Área organizacional", "Motivo",
                "Desde", "Hasta", "Hora salida", "Hora retorno", "Lugar", "Observaciones"
            },
            Filas = tabla.Rows.Cast<System.Data.DataRow>()
                .Select(f => (IReadOnlyList<string>)new[]
                {
                    FilaReporte.Texto(f, "Nombres"),
                    FilaReporte.Texto(f, "Cargo"),
                    FilaReporte.Texto(f, "AreaOrganizacional"),
                    FilaReporte.Texto(f, "Descrip_Motivo"),
                    FilaReporte.Texto(f, "FechaInicio"),
                    FilaReporte.Texto(f, "FEchaFin"),
                    FilaReporte.Texto(f, "Hora_Sal"),
                    FilaReporte.Texto(f, "Hora_ret"),
                    FilaReporte.Texto(f, "Lugar"),
                    FilaReporte.Texto(f, "Observaciones")
                })
                .ToList()
        };
    }
}

/// <summary>Sobretiempo acumulado por trabajador en un rango (spRRHH_ObtenerHorasExtras).</summary>
public sealed class ReporteHorasExtras : IReporteTabular
{
    private readonly IReporteRepository _reportes;

    public ReporteHorasExtras(IReporteRepository reportes)
    {
        _reportes = reportes;
    }

    public DefinicionReporte Definicion { get; } = new(
        "horas-extras",
        "Horas extras (sobretiempo)",
        "Horas trabajadas después de la hora de salida (o en fines de semana y feriados) por trabajador activo.",
        new[]
        {
            new ParametroReporte("desde", "Desde", TipoParametroReporte.Fecha),
            new ParametroReporte("hasta", "Hasta", TipoParametroReporte.Fecha),
            new ParametroReporte("tipo", "Tipo de trabajador", TipoParametroReporte.TipoTrabajadorObligatorio)
        });

    public async Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default)
    {
        var desde = DateTime.Parse(parametros["desde"], CultureInfo.InvariantCulture);
        var hasta = DateTime.Parse(parametros["hasta"], CultureInfo.InvariantCulture);
        var tipo = int.Parse(parametros["tipo"], CultureInfo.InvariantCulture);

        var tabla = await _reportes.ObtenerHorasExtrasAsync(
            desde.ToString("yyyyMMdd", CultureInfo.InvariantCulture),
            hasta.ToString("yyyyMMdd", CultureInfo.InvariantCulture),
            tipo,
            cancellationToken);

        return new ReporteTabla
        {
            Columnas = new[] { "Código", "Apellidos y nombres", "Sobretiempo (hh:mm)" },
            Filas = tabla.Rows.Cast<System.Data.DataRow>()
                .Select(f => (IReadOnlyList<string>)new[]
                {
                    FilaReporte.Texto(f, "idempleado"),
                    FilaReporte.Texto(f, "NombreCompleto"),
                    FilaReporte.Texto(f, "Sobretiempo")
                })
                .ToList()
        };
    }
}
