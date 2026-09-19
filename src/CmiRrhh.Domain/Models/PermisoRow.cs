namespace CmiRrhh.Domain.Models;

/// <summary>
/// Fila de <c>spRRHH_llenarPermiso</c> (columnas de <c>sys.dm_exec_describe_first_result_set_for_object</c>).
/// </summary>
public sealed class PermisoRow
{
    public string DescripTipoPermiso { get; init; } = string.Empty;

    public string DescripMotivo { get; init; } = string.Empty;

    public int NPermiso { get; init; }

    public DateTime? FechaInicio { get; init; }

    public DateTime? FechaFin { get; init; }

    public string? HoraSal { get; init; }

    public string? HoraRet { get; init; }

    public bool? Dia { get; init; }

    public bool? Retorno { get; init; }

    public string? Lugar { get; init; }

    public string? Referencia { get; init; }

    public string? Autorizacion { get; init; }

    public int IdEmpleado { get; init; }
}
