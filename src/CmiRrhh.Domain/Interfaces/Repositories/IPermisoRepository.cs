using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface IPermisoRepository
{
    Task<int> SiguienteIdPermisoAsync(int idEmpleado, CancellationToken cancellationToken = default);

    Task EliminarPermisoAsync(int idEmpleado, int nPermiso, CancellationToken cancellationToken = default);

    /// <summary>
    /// Queda fuera de <c>IVerificadorEventoLaboral</c>: usa un rango de fechas, no una fecha puntual.
    /// </summary>
    Task<int> ExistePermisoAsync(int idEmpleado, string fechaInicio, string fechaFin, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<PermisoRow>> ListarPermisosAsync(int idEmpleado, int? tipoPermiso, int? motivo, CancellationToken cancellationToken = default);
}
