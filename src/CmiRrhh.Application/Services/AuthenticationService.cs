using CmiRrhh.Application.Abstractions;
using CmiRrhh.Domain.Auth;

namespace CmiRrhh.Application.Services;

public sealed class AuthenticationService : IAuthenticationService
{
    private readonly IUsuarioAccesoRepository _usuarios;
    private readonly IPasswordHasher _passwordHasher;
    private readonly IClock _clock;

    public AuthenticationService(
        IUsuarioAccesoRepository usuarios,
        IPasswordHasher passwordHasher,
        IClock clock)
    {
        _usuarios = usuarios;
        _passwordHasher = passwordHasher;
        _clock = clock;
    }

    public async Task<LoginResult> LoginAsync(string login, string password, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(login) || string.IsNullOrWhiteSpace(password))
        {
            return LoginResult.Failed();
        }

        var usuario = await _usuarios.FindActiveByLoginAsync(login.Trim(), cancellationToken);
        if (usuario is null)
        {
            return LoginResult.Failed();
        }

        var credencial = await _usuarios.GetCredencialAsync(usuario.IdUsuario, cancellationToken);
        if (credencial is null)
        {
            return LoginResult.Failed();
        }

        if (credencial.FechaBloqueo is DateTime lockedUntil && lockedUntil > _clock.UtcNow)
        {
            return LoginResult.LockedOut();
        }

        if (credencial.FechaBloqueo is not null)
        {
            credencial.IntentosFallidos = 0;
            credencial.FechaBloqueo = null;
        }

        if (!_passwordHasher.Verify(credencial.PasswordHash, password))
        {
            credencial.IntentosFallidos++;
            if (credencial.IntentosFallidos >= AuthConstants.MaxFailedAttempts)
            {
                credencial.FechaBloqueo = _clock.UtcNow.AddMinutes(AuthConstants.LockoutMinutes);
                await _usuarios.UpdateCredencialAsync(credencial, cancellationToken);
                return LoginResult.LockedOut();
            }

            await _usuarios.UpdateCredencialAsync(credencial, cancellationToken);
            return LoginResult.Failed();
        }

        credencial.IntentosFallidos = 0;
        credencial.FechaBloqueo = null;
        await _usuarios.UpdateCredencialAsync(credencial, cancellationToken);

        return LoginResult.Success(
            usuario.IdUsuario,
            usuario.IdEmpleado,
            usuario.Login,
            usuario.DisplayName,
            usuario.Roles,
            credencial.RequiereCambioPassword);
    }

    public async Task ChangePasswordAsync(int idUsuario, string nuevaPassword, CancellationToken cancellationToken = default)
    {
        if (idUsuario <= 0)
        {
            throw new ArgumentOutOfRangeException(nameof(idUsuario));
        }

        if (string.IsNullOrWhiteSpace(nuevaPassword) || nuevaPassword.Length < AuthConstants.MinPasswordLength)
        {
            throw new ArgumentException(
                $"La contraseña debe tener al menos {AuthConstants.MinPasswordLength} caracteres.",
                nameof(nuevaPassword));
        }

        var credencial = await _usuarios.GetCredencialAsync(idUsuario, cancellationToken)
            ?? throw new InvalidOperationException("El usuario no tiene credencial registrada.");

        credencial.PasswordHash = _passwordHasher.Hash(nuevaPassword);
        credencial.RequiereCambioPassword = false;
        credencial.IntentosFallidos = 0;
        credencial.FechaBloqueo = null;
        await _usuarios.UpdateCredencialAsync(credencial, cancellationToken);
    }
}
