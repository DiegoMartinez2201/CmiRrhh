namespace CmiRrhh.Domain.Models;

/// <summary>
/// Fila de <c>spRRHH_GetAsistenciaDia</c> (no cifrado; columnas de
/// <c>sys.dm_exec_describe_first_result_set_for_object</c> = <c>SELECT *</c> de <c>Asistencia</c>).
/// </summary>
public sealed class AsistenciaDiaRow
{
    public DateTime Fecha { get; init; }

    public int IdEmpleado { get; init; }

    public string? HorEnt { get; init; }

    public string? HorSal { get; init; }

    public string? AlmSal { get; init; }

    public string? AlmEnt { get; init; }

    public bool? FlagEnt { get; init; }

    public bool? FlagSal { get; init; }

    public bool? Estado { get; init; }

    public int? IdHorario { get; init; }

    public string? Usuario { get; init; }

    public string? Pc { get; init; }
}
