namespace CmiRrhh.Domain.Models;

/// <summary>
/// Fila de <c>spRRHH_llenarHorarioTemporal</c> (columnas de <c>sys.dm_exec_describe_first_result_set_for_object</c>).
/// </summary>
public sealed class HorarioTemporalRow
{
    public int N { get; init; }

    public DateTime? FechaInicio { get; init; }

    public DateTime? FechaFin { get; init; }

    public string? DescripHorario { get; init; }

    public string? Ingreso1 { get; init; }

    public string? Salida2 { get; init; }

    public string? NroDocumento { get; init; }

    public string? Sisgedo { get; init; }
}
