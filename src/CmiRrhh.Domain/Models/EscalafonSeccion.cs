namespace CmiRrhh.Domain.Models;

public enum TipoCampoEscalafon
{
    Texto,

    /// <summary>Fecha; el valor viaja como yyyy-MM-dd.</summary>
    Fecha,

    /// <summary>Elección de una lista; el valor viaja como el id de la opción.</summary>
    Opcion,

    /// <summary>Casilla; el valor viaja como "1" o "0".</summary>
    SiNo
}

/// <summary>Campo de una sección de la ficha escalafonaria.</summary>
/// <param name="SoloAlta">Se puede indicar al agregar pero no al modificar (forma parte de la clave del registro).</param>
/// <param name="EnLista">Si se muestra como columna en la tabla de la sección.</param>
public sealed record CampoEscalafon(
    string Clave,
    string Etiqueta,
    TipoCampoEscalafon Tipo,
    int MaxLongitud = 0,
    bool Requerido = true,
    bool SoloAlta = false,
    bool EnLista = true);

/// <param name="RegistroUnico">
/// La sección tiene un solo registro por trabajador (sus datos viven en la ficha del empleado):
/// solo se modifica; no se agrega ni se elimina.
/// </param>
/// <param name="PermiteEliminar">
/// Si los registros se pueden eliminar. Los asegurados, por ejemplo, no se eliminan: se les da de baja con su motivo.
/// </param>
public sealed record DefinicionSeccionEscalafon(
    string Clave, string Titulo, IReadOnlyList<CampoEscalafon> Campos, bool RegistroUnico = false, bool PermiteEliminar = true);

/// <summary>Registro de una sección: su clave dentro del empleado, los valores crudos y los textos a mostrar.</summary>
public sealed class FilaEscalafon
{
    public string Clave { get; init; } = string.Empty;

    public IReadOnlyDictionary<string, string> Valores { get; init; } = new Dictionary<string, string>();

    public IReadOnlyDictionary<string, string> Visibles { get; init; } = new Dictionary<string, string>();
}
