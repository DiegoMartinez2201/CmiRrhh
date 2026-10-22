using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

/// <summary>
/// Lecturas de apoyo para el formulario de alta/edición de personal (ISP: separado de
/// <see cref="IEmpleadoRepository"/>, que concentra las escrituras mediante procedimientos almacenados).
/// </summary>
public interface IFichaPersonalRepository
{
    /// <summary>Carga la ficha completa (Persona + Empleado) o null si el código no existe.</summary>
    Task<EmpleadoFicha?> ObtenerAsync(int idEmpleado, CancellationToken cancellationToken = default);

    /// <summary>
    /// ¿Existe otra persona con el mismo tipo y número de documento?
    /// <paramref name="excluirIdPersona"/> evita que una edición choque consigo misma.
    /// </summary>
    Task<bool> ExisteDocumentoAsync(int tipoDocumento, string numeroDocumento, int? excluirIdPersona, CancellationToken cancellationToken = default);

    /// <summary>Áreas de la estructura organizacional de un año, ordenadas por nombre.</summary>
    Task<IReadOnlyList<CatalogoItem>> ListarAreasAsync(int anio, CancellationToken cancellationToken = default);

    /// <summary>Carga los combos del formulario para el año de estructura indicado (null = el más reciente).</summary>
    Task<FichaCatalogos> CargarCatalogosAsync(int? anioEstructura, CancellationToken cancellationToken = default);
}
