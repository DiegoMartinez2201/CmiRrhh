using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Reportes;

/// <summary>Personal activo sin registro de asistencia en una fecha (spRRHH_Faltas).</summary>
public sealed class ReporteFaltas : IReporteTabular
{
    private readonly IReporteRepository _reportes;

    public ReporteFaltas(IReporteRepository reportes)
    {
        _reportes = reportes;
    }

    public DefinicionReporte Definicion { get; } = new(
        "faltas",
        "Faltas del día",
        "Personal activo sin registro de asistencia en la fecha elegida, con filtro opcional por tipo de trabajador y unidad orgánica.",
        new[]
        {
            new ParametroReporte("fecha", "Fecha", TipoParametroReporte.Fecha),
            new ParametroReporte("tipo", "Tipo de trabajador", TipoParametroReporte.TipoTrabajador),
            new ParametroReporte("area", "Unidad orgánica", TipoParametroReporte.Area)
        });

    public async Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default)
    {
        var fecha = DateTime.Parse(parametros["fecha"], CultureInfo.InvariantCulture);
        var tipo = int.Parse(parametros["tipo"], CultureInfo.InvariantCulture);
        var area = int.Parse(parametros["area"], CultureInfo.InvariantCulture);

        // 0 = «todos»: el procedimiento espera NULL para no filtrar. El año se envía NULL: las vistas
        // de las que lee filtran por Empleado.Year (año de la ficha), no por el año de la fecha.
        var tabla = await _reportes.GenerarFaltasAsync(
            fecha.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture),
            tipo > 0 ? tipo : null,
            area > 0 ? area : null,
            null,
            cancellationToken);

        return new ReporteTabla
        {
            Columnas = new[] { "Área organizacional", "Código", "Documento", "Apellidos y nombres", "Descripción" },
            Filas = tabla.Rows.Cast<System.Data.DataRow>()
                .Select(f => (IReadOnlyList<string>)new[]
                {
                    FilaReporte.Texto(f, "AreaOrganizacional"),
                    FilaReporte.Texto(f, "IdEmpleado"),
                    FilaReporte.Texto(f, "NumDocID"),
                    FilaReporte.Texto(f, "NombresC"),
                    FilaReporte.Texto(f, "Descripcion")
                })
                .OrderBy(f => f[0], StringComparer.CurrentCultureIgnoreCase)
                .ThenBy(f => f[3], StringComparer.CurrentCultureIgnoreCase)
                .ToList()
        };
    }
}

/// <summary>Personal activo (planilla) por profesión (spRRHH_Rep_profesion).</summary>
public sealed class ReportePersonalPorProfesion : IReporteTabular
{
    private readonly IReporteRepository _reportes;

    public ReportePersonalPorProfesion(IReporteRepository reportes)
    {
        _reportes = reportes;
    }

    public DefinicionReporte Definicion { get; } = new(
        "personal-por-profesion",
        "Personal por profesión",
        "Personal activo de planilla que tiene la profesión elegida, con su unidad orgánica del año actual.",
        new[] { new ParametroReporte("profesion", "Profesión", TipoParametroReporte.Profesion) });

    public async Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default)
    {
        var tabla = await _reportes.GenerarReporteProfesionAsync(parametros["profesion"], cancellationToken);

        return new ReporteTabla
        {
            Columnas = new[] { "Profesión", "Área organizacional", "Apellido paterno", "Apellido materno", "Nombres" },
            Filas = tabla.Rows.Cast<System.Data.DataRow>()
                .Select(f => (IReadOnlyList<string>)new[]
                {
                    FilaReporte.Texto(f, "Profesion"),
                    FilaReporte.Texto(f, "AreaOrganizacional"),
                    FilaReporte.Texto(f, "Apellido_Paterno"),
                    FilaReporte.Texto(f, "Apellido_Materno"),
                    FilaReporte.Texto(f, "nombres")
                })
                .ToList()
        };
    }
}
