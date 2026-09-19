namespace CmiRrhh.Domain.Models;

/// <summary>
/// Fila del reporte de asistencias por rango.
/// <c>sys.dm_exec_describe_first_result_set_for_object(spRRHH_GetReporteAsistencia)</c> no
/// describe columnas: el SP no tiene SELECT final; es un proceso que borra/llena
/// <c>RegAsisDiario</c> usando <c>cDifTpos</c> (WITH ENCRYPTION). Las columnas de la tabla
/// de trabajo se tomaron empíricamente de <c>INFORMATION_SCHEMA</c> / SELECT de
/// <c>RegAsisDiario</c>. Nombres, documento y área se agregan para la UI (la grilla
/// legado no mostraba solo Ids). Hor_Ent/Hor_Sal salen de <c>Asistencia</c>.
/// </summary>
public sealed class AsistenciaReporteRow
{
    public DateTime Fecha { get; init; }

    public int IdEmpleado { get; init; }

    public string NombresCompletos { get; init; } = string.Empty;

    public string? NumDocId { get; init; }

    public string? AreaOrganizacional { get; init; }

    public string? Estado { get; init; }

    public string? MinTarde { get; init; }

    public string? MinNormales { get; init; }

    public string? HorEnt { get; init; }

    public string? HorSal { get; init; }
}
