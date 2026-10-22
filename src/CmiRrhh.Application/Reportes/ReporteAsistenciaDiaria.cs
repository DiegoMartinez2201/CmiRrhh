using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Reportes;

/// <summary>
/// Consulta de asistencia diaria (legado FrmConsultaAsistDiaria): entrada y salida por día, de toda un área o tipo de
/// trabajador, o de una sola persona si se indica su DNI. Se limita a los lugares de marcado elegidos.
/// </summary>
public sealed class ReporteAsistenciaDiaria : IReporteTabular
{
    private readonly IAsistenciaReporteRepository _asistencias;

    public ReporteAsistenciaDiaria(IAsistenciaReporteRepository asistencias)
    {
        _asistencias = asistencias;
    }

    public DefinicionReporte Definicion { get; } = new(
        "asistencia-diaria",
        "Asistencia diaria",
        "Hora de entrada y salida por día en el rango indicado. Filtre por unidad orgánica y tipo de trabajador, o escriba un DNI para ver a una sola persona; el DNI tiene prioridad.",
        new[]
        {
            new ParametroReporte("desde", "Desde", TipoParametroReporte.Fecha),
            new ParametroReporte("hasta", "Hasta", TipoParametroReporte.Fecha),
            new ParametroReporte("dni", "DNI (opcional)", TipoParametroReporte.Dni),
            new ParametroReporte("area", "Unidad orgánica", TipoParametroReporte.Area),
            new ParametroReporte("tipo", "Tipo de trabajador", TipoParametroReporte.TipoTrabajador),
            new ParametroReporte("locales", "Lugar de marcado", TipoParametroReporte.Locales)
        });

    public async Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default)
    {
        var desde = DateTime.Parse(parametros["desde"], CultureInfo.InvariantCulture);
        var hasta = DateTime.Parse(parametros["hasta"], CultureInfo.InvariantCulture);
        var dni = parametros["dni"];
        var area = int.Parse(parametros["area"], CultureInfo.InvariantCulture);
        var tipo = int.Parse(parametros["tipo"], CultureInfo.InvariantCulture);
        var porPersona = dni.Length > 0;

        // Como el legado: con DNI no se filtra por área ni tipo; 0 = «todos» se envía como NULL.
        var tabla = await _asistencias.ReporteAsistenciaDiariaAsync(
            desde.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture),
            hasta.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture),
            dni,
            !porPersona && area > 0 ? area : null,
            !porPersona && tipo > 0 ? tipo : null,
            null,
            parametros["locales"],
            0,
            cancellationToken);

        // Las columnas de legado: nombres, NombreDia, FechaAsistencia, HoraE, HoraS.
        var legado = new[] { "nombres", "NombreDia", "FechaAsistencia", "HoraE", "HoraS" };
        if (!legado.All(c => tabla.Columns.Contains(c)))
        {
            return FilaReporte.Tabla(tabla);
        }

        return new ReporteTabla
        {
            Columnas = new[] { "Nombres completos", "Día", "Fecha", "Hora entrada", "Hora salida" },
            Filas = tabla.Rows.Cast<System.Data.DataRow>()
                .Select(f => (IReadOnlyList<string>)legado.Select(c => FilaReporte.Texto(f, c)).ToList())
                .ToList()
        };
    }
}
