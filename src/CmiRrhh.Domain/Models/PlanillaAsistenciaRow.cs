using System.Collections.ObjectModel;

namespace CmiRrhh.Domain.Models;

/// <summary>
/// Fila de <c>spRRHH_RepPlanillaAsistencias</c>. El SP es SQL dinámico con PIVOT:
/// columnas fijas + una columna por fecha en <c>@Fechas</c> (dd/MM/yyyy).
/// <c>MinTardeT</c>, <c>DiasTardeT</c> y <c>DiasAsistidos</c> son literales '0' en el SP actual
/// (no se calculan); se conservan por si el procedimiento se corrige después.
/// </summary>
public sealed class PlanillaAsistenciaRow
{
    public int IdEmpleado { get; init; }

    public string NombresC { get; init; } = string.Empty;

    public string MinTardeT { get; init; } = "0";

    public string DiasTardeT { get; init; } = "0";

    public string DiasAsistidos { get; init; } = "0";

    public IReadOnlyDictionary<string, string?> EstadosPorFecha { get; init; }
        = new ReadOnlyDictionary<string, string?>(new Dictionary<string, string?>());
}
