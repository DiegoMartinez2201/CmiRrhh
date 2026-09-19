namespace CmiRrhh.Application.Abstractions;

public sealed class UsuarioCredencialSnapshot
{
    public required int IdUsuario { get; init; }

    public required string PasswordHash { get; set; }

    public required bool RequiereCambioPassword { get; set; }

    public required int IntentosFallidos { get; set; }

    public DateTime? FechaBloqueo { get; set; }
}
