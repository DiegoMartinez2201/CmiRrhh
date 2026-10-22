using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Reportes;

/// <summary>Cumpleaños del mes del personal activo (spRRHH_Report_Cumple).</summary>
public sealed class ReporteCumpleanos : IReporteTabular
{
    private readonly IReporteRepository _reportes;

    public ReporteCumpleanos(IReporteRepository reportes)
    {
        _reportes = reportes;
    }

    public DefinicionReporte Definicion { get; } = new(
        "cumpleanos",
        "Cumpleaños del mes",
        "Personal activo que cumple años en el mes elegido, ordenado por área y día.",
        new[] { new ParametroReporte("mes", "Mes", TipoParametroReporte.Mes) });

    public async Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default)
    {
        var mes = int.Parse(parametros["mes"], CultureInfo.InvariantCulture);
        var tabla = await _reportes.GenerarCumplesAsync(mes, cancellationToken);

        return new ReporteTabla
        {
            Columnas = new[] { "Área organizacional", "Apellidos y nombres", "Día", "Mes", "Edad" },
            Filas = tabla.Rows.Cast<System.Data.DataRow>()
                .Select(f => (IReadOnlyList<string>)new[]
                {
                    FilaReporte.Texto(f, "AreaOrganizacional"),
                    FilaReporte.Texto(f, "NombresCompletos"),
                    FilaReporte.Texto(f, "Dia"),
                    FilaReporte.Texto(f, "MESletras"),
                    FilaReporte.Texto(f, "edadEmpleado")
                })
                .ToList()
        };
    }
}

/// <summary>Personal por fecha de ingreso institucional (spRRHH_Report_FechaIngreso).</summary>
public sealed class ReporteFechaIngreso : IReporteTabular
{
    private readonly IReporteRepository _reportes;

    public ReporteFechaIngreso(IReporteRepository reportes)
    {
        _reportes = reportes;
    }

    public DefinicionReporte Definicion { get; } = new(
        "fecha-ingreso",
        "Personal por fecha de ingreso",
        "Personal activo cuya fecha de ingreso está en el rango indicado, con su tiempo de servicio.",
        new[]
        {
            new ParametroReporte("desde", "Ingreso desde", TipoParametroReporte.Fecha),
            new ParametroReporte("hasta", "Ingreso hasta", TipoParametroReporte.Fecha),
            new ParametroReporte("tipo", "Tipo de trabajador", TipoParametroReporte.TipoTrabajador)
        });

    public async Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default)
    {
        var desde = DateTime.Parse(parametros["desde"], CultureInfo.InvariantCulture);
        var hasta = DateTime.Parse(parametros["hasta"], CultureInfo.InvariantCulture);
        var tipo = int.Parse(parametros["tipo"], CultureInfo.InvariantCulture);

        var tabla = await _reportes.GenerarReporteFichaEmpleadoAsync(
            desde.ToString("yyyyMMdd", CultureInfo.InvariantCulture),
            hasta.ToString("yyyyMMdd", CultureInfo.InvariantCulture),
            tipo,
            cancellationToken);

        return new ReporteTabla
        {
            Columnas = new[] { "Área organizacional", "Apellidos y nombres", "Fecha de ingreso", "Tiempo de servicio" },
            Filas = tabla.Rows.Cast<System.Data.DataRow>()
                .Select(f => (IReadOnlyList<string>)new[]
                {
                    FilaReporte.Texto(f, "AreaOrganizacional"),
                    FilaReporte.Texto(f, "NombresCompletos"),
                    FilaReporte.Texto(f, "FechadeIngreso"),
                    $"{FilaReporte.Texto(f, "años")} años, {FilaReporte.Texto(f, "meses")} meses, {FilaReporte.Texto(f, "dias")} días"
                })
                .ToList()
        };
    }
}

/// <summary>Personal activo por cargo (spRRHH_Rep_cargos).</summary>
public sealed class ReportePersonalPorCargo : IReporteTabular
{
    private readonly IReporteRepository _reportes;

    public ReportePersonalPorCargo(IReporteRepository reportes)
    {
        _reportes = reportes;
    }

    public DefinicionReporte Definicion { get; } = new(
        "personal-por-cargo",
        "Personal por cargo",
        "Personal activo (planilla) que ocupa el cargo elegido.",
        new[] { new ParametroReporte("cargo", "Cargo", TipoParametroReporte.Cargo) });

    public async Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default)
    {
        var idCargo = int.Parse(parametros["cargo"], CultureInfo.InvariantCulture);
        var tabla = await _reportes.GenerarReporteCargosAsync(idCargo, cancellationToken);

        return new ReporteTabla
        {
            Columnas = new[] { "Cargo", "Área organizacional", "Apellido paterno", "Apellido materno", "Nombres" },
            Filas = tabla.Rows.Cast<System.Data.DataRow>()
                .Select(f => (IReadOnlyList<string>)new[]
                {
                    FilaReporte.Texto(f, "cargo"),
                    FilaReporte.Texto(f, "AreaOrganizacional"),
                    FilaReporte.Texto(f, "Apellido_Paterno"),
                    FilaReporte.Texto(f, "Apellido_Materno"),
                    FilaReporte.Texto(f, "nombres")
                })
                .ToList()
        };
    }
}
