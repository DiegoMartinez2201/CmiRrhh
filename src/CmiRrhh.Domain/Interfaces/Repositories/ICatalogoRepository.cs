using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface ICatalogoRepository
{
    Task<IReadOnlyList<CatalogoItem>> ListarLocalesAsync(CancellationToken cancellationToken = default);

    Task<IReadOnlyList<CatalogoItem>> ListarTiposTrabajadorAsync(CancellationToken cancellationToken = default);

    Task<bool> ExistenTodosLosLocalesAsync(IReadOnlyList<int> idLocales, CancellationToken cancellationToken = default);
}
