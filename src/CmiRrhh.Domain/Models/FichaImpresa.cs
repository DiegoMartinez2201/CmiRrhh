namespace CmiRrhh.Domain.Models;

/// <summary>
/// Datos crudos de la ficha impresa tal como los devuelven los procedimientos del sistema legado:
/// cada fila es columna → texto ya formateado (fechas dd/MM/yyyy, casillas Sí/No).
/// </summary>
public sealed class FichaImpresaDatos
{
    public IReadOnlyDictionary<string, string> Personales { get; init; } = new Dictionary<string, string>();

    public IReadOnlyDictionary<string, string> Laborales { get; init; } = new Dictionary<string, string>();

    public IReadOnlyList<IReadOnlyDictionary<string, string>> Familiares { get; init; } = Array.Empty<IReadOnlyDictionary<string, string>>();
}

/// <summary>Par etiqueta/valor de la ficha impresa.</summary>
public sealed record CampoFicha(string Etiqueta, string Valor);

/// <summary>Tabla de la ficha impresa (por ejemplo, la composición familiar).</summary>
public sealed record TablaFicha(string Titulo, IReadOnlyList<string> Columnas, IReadOnlyList<IReadOnlyList<string>> Filas);

/// <summary>Bloque de la ficha impresa: título, campos y, opcionalmente, una tabla al final.</summary>
public sealed record BloqueFicha(string Titulo, bool EsSubbloque, IReadOnlyList<CampoFicha> Campos, TablaFicha? Tabla = null);
