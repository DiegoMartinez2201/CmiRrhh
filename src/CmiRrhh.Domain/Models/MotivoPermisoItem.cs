namespace CmiRrhh.Domain.Models;

/// <summary>
/// Catálogo de motivos de permiso (tabla MotivoPerm), con el dato de tipo de permiso ya
/// resuelto para mostrarlo en el combo de la Razor Page sin una segunda consulta en cascada.
/// </summary>
public sealed class MotivoPermisoItem
{
    public int IdMotivo { get; init; }

    public string DescripMotivo { get; init; } = string.Empty;

    public int? IdTipoPermiso { get; init; }

    public string? DescripTipoPermiso { get; init; }

    public bool Salario { get; init; }

    public string? TipoModalidad { get; init; }
}
