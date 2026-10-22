namespace CmiRrhh.Domain.Models;

/// <summary>Unidad orgánica de un año (fila de EstructOrganiz).</summary>
public sealed class UnidadOrganica
{
    public int Id { get; init; }

    public string Nombre { get; init; } = string.Empty;

    public string Sigla { get; init; } = string.Empty;

    /// <summary>Unidad de la que depende (IdDependeDe); null en las unidades de primer nivel.</summary>
    public int? IdPadre { get; init; }
}

/// <summary>Trabajador asignado a una unidad (columnas de sp_RRHH_Busca_Empleado_tree).</summary>
public sealed class PersonalUnidadRow
{
    public int IdTipoTrabajador { get; init; }

    public int Codigo { get; init; }

    public string Dni { get; init; } = string.Empty;

    public string NombresCompletos { get; init; } = string.Empty;

    public string Cargo { get; init; } = string.Empty;
}

/// <summary>Nodo del árbol de unidades orgánicas ya armado.</summary>
public sealed class NodoUnidad
{
    public NodoUnidad(UnidadOrganica unidad)
    {
        Unidad = unidad;
    }

    public UnidadOrganica Unidad { get; }

    public List<NodoUnidad> Hijos { get; } = new();

    /// <summary>Cantidad total de unidades por debajo de este nodo.</summary>
    public int TotalDescendientes => Hijos.Sum(h => 1 + h.TotalDescendientes);
}
