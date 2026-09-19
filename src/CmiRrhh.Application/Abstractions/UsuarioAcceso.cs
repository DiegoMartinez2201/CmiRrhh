namespace CmiRrhh.Application.Abstractions;

public sealed class UsuarioAcceso
{
    public required int IdUsuario { get; init; }

    public required string Login { get; init; }

    public required string DisplayName { get; init; }

    public int? IdEmpleado { get; init; }

    public required IReadOnlyList<string> Roles { get; init; }
}
