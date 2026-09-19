namespace CmiRrhh.Application.Abstractions;

public interface IUsuarioAccesoRepository
{
    Task<UsuarioAcceso?> FindActiveByLoginAsync(string login, CancellationToken cancellationToken = default);

    Task<UsuarioCredencialSnapshot?> GetCredencialAsync(int idUsuario, CancellationToken cancellationToken = default);

    Task UpdateCredencialAsync(UsuarioCredencialSnapshot credencial, CancellationToken cancellationToken = default);
}
