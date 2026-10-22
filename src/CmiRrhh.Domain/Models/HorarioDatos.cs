namespace CmiRrhh.Domain.Models;

/// <summary>
/// Datos de entrada para Agregar/Modificar un Horario (mantenimiento "Información de
/// Horarios"). Separado de <see cref="HorarioRow"/> porque este último incluye datos
/// calculados (p. ej. <c>TieneEmpleadosAsignados</c>) que no se escriben desde el formulario.
/// </summary>
public sealed class HorarioDatos
{
    public string DescripHorario { get; init; } = string.Empty;

    public string? Ingreso1 { get; init; }

    public string? Salida1 { get; init; }

    public string? Ingreso2 { get; init; }

    public string? Salida2 { get; init; }

    public bool Estado { get; init; } = true;

    public bool SgtDia { get; init; }
}
