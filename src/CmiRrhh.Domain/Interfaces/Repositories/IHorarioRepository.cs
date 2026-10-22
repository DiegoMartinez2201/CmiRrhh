using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface IHorarioRepository
{
    // --- Horario especial (HorarioTemporal) — ya existente ---

    Task<int> SiguienteIdHorarioTemporalAsync(int idEmpleado, CancellationToken cancellationToken = default);

    Task EliminarHorarioTemporalAsync(int idEmpleado, int n, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<HorarioTemporalRow>> ListarHorariosTemporalesAsync(int idEmpleado, CancellationToken cancellationToken = default);

    /// <summary>
    /// Inserta un registro de horario especial para el empleado. Equivalente EF directo:
    /// no se encontró un SP de inserción para HorarioTemporal en RRHHClass (solo
    /// sp_SgtID_HorarioTemporal y sp_Elimnar_HorarioTemporal).
    /// </summary>
    Task RegistrarHorarioTemporalAsync(
        int idEmpleado,
        int n,
        int idHorario,
        DateOnly fechaInicio,
        DateOnly fechaFin,
        string? nroDocumento,
        string? sisgedo,
        CancellationToken cancellationToken = default);

    /// <summary>
    /// True si el empleado ya tiene asignado ese horario en un rango que se solapa con
    /// [fechaInicio, fechaFin]. Base de la regla "que el empleado no tenga ya ese horario".
    /// </summary>
    Task<bool> TieneHorarioTemporalSolapadoAsync(
        int idEmpleado, int idHorario, DateOnly fechaInicio, DateOnly fechaFin, CancellationToken cancellationToken = default);

    // --- Mantenimiento de Horarios (catálogo) — nuevo ---

    Task<IReadOnlyList<HorarioRow>> ListarHorariosAsync(CancellationToken cancellationToken = default);

    Task<HorarioRow?> ObtenerHorarioAsync(int idHorario, CancellationToken cancellationToken = default);

    Task<bool> ExisteHorarioAsync(int idHorario, CancellationToken cancellationToken = default);

    Task<int> CrearHorarioAsync(HorarioDatos datos, CancellationToken cancellationToken = default);

    Task ActualizarHorarioAsync(int idHorario, HorarioDatos datos, CancellationToken cancellationToken = default);

    /// <summary>
    /// Equivalente a "No se puede Eliminar el Horario, porque existen Empleados en ese Horario".
    /// </summary>
    Task<bool> TieneEmpleadosAsignadosAsync(int idHorario, CancellationToken cancellationToken = default);

    Task EliminarHorarioAsync(int idHorario, CancellationToken cancellationToken = default);
}
