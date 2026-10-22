namespace CmiRrhh.Domain.Models;

/// <summary>Fila de la pantalla "Asignar horarios / local": empleado activo con su horario y local actuales.</summary>
public sealed class PersonalAsignacionRow
{
    public int IdEmpleado { get; init; }

    public string? Dni { get; init; }

    public string NombresCompletos { get; init; } = string.Empty;

    public int? IdHorario { get; init; }

    public int? IdLocal { get; init; }
}
