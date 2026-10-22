namespace CmiRrhh.Domain.Models;

/// <summary>
/// Fila de la grilla "Relación Personal" / "Búsqueda Personal" del sistema legado.
/// Columnas de spRRHH_busca_empleado: IdTipoTrabajador, Codigo, DNI, NombresCompletos,
/// AreaOrganizacional, cargo.
/// </summary>
public sealed class PersonalRow
{
    public int IdTipoTrabajador { get; init; }

    public int Codigo { get; init; }

    public string Dni { get; init; } = string.Empty;

    public string NombresCompletos { get; init; } = string.Empty;

    public string AreaOrganizacional { get; init; } = string.Empty;

    public string Cargo { get; init; } = string.Empty;
}
