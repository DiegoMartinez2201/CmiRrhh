using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

/// <summary>
/// Consulta de la estructura orgánica (ISP: solo lectura, separada de los repositorios de personal).
/// </summary>
public interface IEstructuraOrganizacionalRepository
{
    /// <summary>Años con estructura definida, del más reciente al más antiguo.</summary>
    Task<IReadOnlyList<int>> ListarAniosAsync(CancellationToken cancellationToken = default);

    /// <summary>Equivalente a RRHHClass.llena_tree: unidades del año y la unidad de la que dependen.</summary>
    Task<IReadOnlyList<UnidadOrganica>> ListarUnidadesAsync(int anio, CancellationToken cancellationToken = default);

    /// <summary>
    /// Equivalente a RRHHClass.buscar_empleado_tree (sp_RRHH_Busca_Empleado_tree): personal activo
    /// de una unidad en el año. <paramref name="idTipoTrabajador"/> 0 = todos los tipos.
    /// </summary>
    Task<IReadOnlyList<PersonalUnidadRow>> ListarPersonalAsync(
        int anio,
        int idAreaOrganiz,
        int idTipoTrabajador,
        CancellationToken cancellationToken = default);
}
