namespace CmiRrhh.Domain.Models;

/// <summary>Elemento de catálogo cuyo código es texto (p. ej. Ubigeo de 6 caracteres).</summary>
public sealed class CatalogoTexto
{
    public string Codigo { get; init; } = string.Empty;

    public string Nombre { get; init; } = string.Empty;
}

/// <summary>
/// Todos los combos que necesita el formulario de alta/edición de personal.
/// Se cargan juntos para que la pantalla dependa de una sola abstracción.
/// </summary>
public sealed class FichaCatalogos
{
    /// <summary>Año de la estructura organizacional cuyas áreas se listan.</summary>
    public int Anio { get; init; }

    public IReadOnlyList<CatalogoItem> TiposDocumento { get; init; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<CatalogoItem> Nacionalidades { get; init; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<CatalogoItem> EstadosCiviles { get; init; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<CatalogoItem> Discapacidades { get; init; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<CatalogoItem> TiposSangre { get; init; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<CatalogoItem> TiposTrabajador { get; init; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<CatalogoItem> Areas { get; init; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<CatalogoTexto> Ubigeos { get; init; } = Array.Empty<CatalogoTexto>();
}
