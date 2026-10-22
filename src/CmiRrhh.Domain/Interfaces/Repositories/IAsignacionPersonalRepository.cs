using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

/// <summary>
/// Asignación masiva de horario y local al personal activo. Equivale a
/// sp_Listar_Empleado_Horario, sp_Update_Empleado_idHorario_By_idEmpleado y
/// sp_Update_Empleado_idLocal_By_idEmpleado del sistema legado.
/// </summary>
public interface IAsignacionPersonalRepository
{
    Task<IReadOnlyList<PersonalAsignacionRow>> ListarActivosAsync(
        int? idTipoTrabajador, string? apellido, CancellationToken cancellationToken = default);

    /// <summary>Asigna el horario y/o el local indicados (null = no tocar) a los empleados dados. Devuelve cuántos se actualizaron.</summary>
    Task<int> AsignarAsync(
        IReadOnlyCollection<int> idEmpleados, int? idHorario, int? idLocal, CancellationToken cancellationToken = default);
}
