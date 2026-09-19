namespace CmiRrhh.Infrastructure.Persistence.Entities;

public class UsuarioCredencial
{
    public int IdUsuario { get; set; }

    public string PasswordHash { get; set; } = string.Empty;

    public bool RequiereCambioPassword { get; set; }

    public int IntentosFallidos { get; set; }

    public DateTime? FechaBloqueo { get; set; }

    public virtual Usuario Usuario { get; set; } = null!;
}
