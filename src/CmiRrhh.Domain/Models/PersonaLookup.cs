namespace CmiRrhh.Domain.Models;

public sealed class PersonaLookup
{
    public int IdPersona { get; init; }
    public string? ApellidoPaterno { get; init; }
    public string? ApellidoMaterno { get; init; }
    public string? Nombres { get; init; }
}
