namespace CmiRrhh.Domain.Models;

/// <summary>Columna editable de un catálogo de mantenimiento.</summary>
public sealed record CampoCatalogo(string Clave, string Etiqueta, int MaxLongitud, bool Requerido = true, bool EsOpcion = false);

/// <summary>Opción de un campo desplegable: valor guardado y texto mostrado.</summary>
public sealed record OpcionCatalogo(string Valor, string Texto);

/// <summary>Descripción de un catálogo: su clave de URL, su título y sus campos.</summary>
public sealed record DefinicionCatalogo(string Clave, string Titulo, IReadOnlyList<CampoCatalogo> Campos);

/// <summary>Fila de un catálogo: su id y el valor de cada campo (por clave de campo).</summary>
public sealed class FilaCatalogo
{
    public int Id { get; init; }

    public IReadOnlyDictionary<string, string> Valores { get; init; } = new Dictionary<string, string>();
}
