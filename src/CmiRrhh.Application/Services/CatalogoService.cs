using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public interface ICatalogoService
{
    Task<IReadOnlyList<CatalogoItem>> ListarLocalesAsync(CancellationToken cancellationToken = default);

    Task<IReadOnlyList<CatalogoItem>> ListarTiposTrabajadorAsync(CancellationToken cancellationToken = default);
}

public sealed class CatalogoService : ICatalogoService
{
    private readonly ICatalogoRepository _catalogo;

    public CatalogoService(ICatalogoRepository catalogo)
    {
        _catalogo = catalogo;
    }

    public Task<IReadOnlyList<CatalogoItem>> ListarLocalesAsync(CancellationToken cancellationToken = default)
        => _catalogo.ListarLocalesAsync(cancellationToken);

    public Task<IReadOnlyList<CatalogoItem>> ListarTiposTrabajadorAsync(CancellationToken cancellationToken = default)
        => _catalogo.ListarTiposTrabajadorAsync(cancellationToken);
}
