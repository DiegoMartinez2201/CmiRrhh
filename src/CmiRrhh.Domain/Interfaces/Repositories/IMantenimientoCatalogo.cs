using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

/// <summary>
/// Un catálogo mantenible (Cargos, Estado Civil, ...). Cada catálogo es una implementación distinta
/// registrada en DI: agregar uno nuevo no obliga a modificar el servicio ni la pantalla (OCP).
/// </summary>
public interface IMantenimientoCatalogo
{
    DefinicionCatalogo Definicion { get; }

    Task<IReadOnlyList<FilaCatalogo>> ListarAsync(CancellationToken cancellationToken = default);

    /// <summary>Crea el registro con el siguiente id disponible (los ids de estas tablas no son identity).</summary>
    Task<int> CrearAsync(IReadOnlyDictionary<string, string> valores, CancellationToken cancellationToken = default);

    /// <summary>Devuelve false si el id no existe.</summary>
    Task<bool> ActualizarAsync(int id, IReadOnlyDictionary<string, string> valores, CancellationToken cancellationToken = default);

    /// <summary>Elimina el registro; devuelve el motivo si no se pudo (no existe o está en uso).</summary>
    Task<string?> EliminarAsync(int id, CancellationToken cancellationToken = default);

    /// <summary>Opciones de los campos desplegables (por clave de campo). Por defecto, el catálogo no tiene ninguno.</summary>
    Task<IReadOnlyDictionary<string, IReadOnlyList<OpcionCatalogo>>> OpcionesAsync(CancellationToken cancellationToken = default)
        => Task.FromResult<IReadOnlyDictionary<string, IReadOnlyList<OpcionCatalogo>>>(
            new Dictionary<string, IReadOnlyList<OpcionCatalogo>>());
}
