namespace CmiRrhh.Domain.Auth;

public sealed class LoginResult
{
    public bool Succeeded { get; private init; }
    public bool IsLockedOut { get; private init; }
    public string? ErrorMessage { get; private init; }
    public int IdUsuario { get; private init; }
    public int? IdEmpleado { get; private init; }
    public string Login { get; private init; } = string.Empty;
    public string DisplayName { get; private init; } = string.Empty;
    public IReadOnlyList<string> Roles { get; private init; } = Array.Empty<string>();
    public bool RequiereCambioPassword { get; private init; }

    public static LoginResult Success(
        int idUsuario,
        int? idEmpleado,
        string login,
        string displayName,
        IReadOnlyList<string> roles,
        bool requiereCambioPassword)
    {
        return new LoginResult
        {
            Succeeded = true,
            IdUsuario = idUsuario,
            IdEmpleado = idEmpleado,
            Login = login,
            DisplayName = displayName,
            Roles = roles,
            RequiereCambioPassword = requiereCambioPassword
        };
    }

    public static LoginResult Failed(string? message = null)
    {
        return new LoginResult
        {
            Succeeded = false,
            ErrorMessage = message ?? "Usuario o contraseña incorrectos."
        };
    }

    public static LoginResult LockedOut()
    {
        return new LoginResult
        {
            Succeeded = false,
            IsLockedOut = true,
            ErrorMessage = $"Cuenta bloqueada temporalmente. Intente nuevamente en {AuthConstants.LockoutMinutes} minutos."
        };
    }
}
