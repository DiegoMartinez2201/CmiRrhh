namespace CmiRrhh.Domain.Models;

/// <summary>
/// Fila de la tabla <c>Horario</c> (mantenimiento "Información de Horarios" — sección 4.5
/// del documento de exploración funcional).
/// </summary>
public sealed class HorarioRow
{
    public int IdHorario { get; init; }

    public string? DescripHorario { get; init; }

    public string? Ingreso1 { get; init; }

    public string? Salida1 { get; init; }

    public string? Ingreso2 { get; init; }

    public string? Salida2 { get; init; }

    public bool? Estado { get; init; }

    public bool? SgtDia { get; init; }

    public bool TieneEmpleadosAsignados { get; init; }
}
