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

    /// <summary>
    /// Registra un nuevo permiso (equivalente a la inserción que hacía el formulario legado
    /// FrmPermiso directamente contra la tabla Permiso; no existe un SP de inserción documentado
    /// en RRHHClass, por lo que se usa EF Core directamente, igual que el resto de las altas
    /// migradas en la Fase 3/5). El número de permiso (Npermiso) debe obtenerse antes con
    /// <see cref="SiguienteIdPermisoAsync"/> y pasarse ya calculado, para que la validación de
    /// "ya está de permiso" y el cálculo del siguiente id se hagan sobre el mismo snapshot.
    /// </summary>
    Task RegistrarPermisoAsync(
        int idEmpleado,
        int nPermiso,
        int idMotivo,
        DateTime fechaInicio,
        DateTime fechaFin,
        string? horaSalida,
        string? horaRetorno,
        bool todoElDia,
        bool retorno,
        string? lugar,
        string? referencia,
        string? autorizacion,
        string? observaciones,
        CancellationToken cancellationToken = default);
}
