namespace CmiRrhh.Domain.Auth;

public interface IAuthenticationService
{
    Task<LoginResult> LoginAsync(string login, string password, CancellationToken cancellationToken = default);

    Task ChangePasswordAsync(int idUsuario, string nuevaPassword, CancellationToken cancellationToken = default);
}
