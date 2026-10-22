using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

/// <summary>
/// Consulta de personal (ISP: separada de IEmpleadoRepository, que además escribe fichas).
/// </summary>
public interface IPersonalRepository
{
    /// <summary>
    /// Equivalente a RRHHClass.buscar_empleado (spRRHH_busca_empleado) con resultado tipado.
    /// </summary>
    /// <param name="anio">Año de la estructura organizacional; null = todos los años.</param>
    Task<IReadOnlyList<PersonalRow>> BuscarAsync(
        int? codigo,
        string numDoc,
        string apellido,
        int? idTipoTrabajador,
        bool activo,
        int? anio,
        CancellationToken cancellationToken = default);
}
