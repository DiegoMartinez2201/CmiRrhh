namespace CmiRrhh.Application.DTOs;

public sealed class ChangePasswordRequest
{
    public int IdUsuario { get; set; }

    public string NuevaPassword { get; set; } = string.Empty;

    public string Confirmacion { get; set; } = string.Empty;
}
