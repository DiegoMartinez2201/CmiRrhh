namespace CmiRrhh.Domain.Models;

public sealed class MarcacionAutorizadaRow
{
    public int Id { get; init; }

    public DateTime Fecha { get; init; }

    public string Tipo { get; init; } = string.Empty;

    public string Hora { get; init; } = string.Empty;

    public string Motivo { get; init; } = string.Empty;

    public string Documento { get; init; } = string.Empty;

    public string? Usuario { get; init; }

    public DateTime FechaRegistro { get; init; }
}
