using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface ICatalogoRepository
{
    Task<IReadOnlyList<CatalogoItem>> ListarLocalesAsync(CancellationToken cancellationToken = default);

    Task<IReadOnlyList<CatalogoItem>> ListarTiposTrabajadorAsync(CancellationToken cancellationToken = default);

    Task<bool> ExistenTodosLosLocalesAsync(IReadOnlyList<int> idLocales, CancellationToken cancellationToken = default);

    /// <summary>
    /// Motivos de permiso activos (MotivoPerm.Activo = 1), con su tipo de permiso ya resuelto.
    /// Equivalente al combo "Motivo" del formulario legado de Permisos.
    /// </summary>
    Task<IReadOnlyList<MotivoPermisoItem>> ListarMotivosPermisoAsync(CancellationToken cancellationToken = default);
}
