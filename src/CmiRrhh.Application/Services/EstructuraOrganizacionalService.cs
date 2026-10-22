using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

/// <summary>Árbol de un año más la ruta de ancestros de la unidad seleccionada (para desplegarla).</summary>
public sealed record ArbolEstructura(
    IReadOnlyList<NodoUnidad> Raices,
    int TotalUnidades,
    IReadOnlySet<int> RutaSeleccion);

public interface IEstructuraOrganizacionalService
{
    Task<IReadOnlyList<int>> ListarAniosAsync(CancellationToken cancellationToken = default);

    Task<ArbolEstructura> ObtenerArbolAsync(int anio, int? idSeleccionada, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<PersonalUnidadRow>> ListarPersonalAsync(
        int anio, int idAreaOrganiz, int idTipoTrabajador, CancellationToken cancellationToken = default);
}

public sealed class EstructuraOrganizacionalService : IEstructuraOrganizacionalService
{
    private readonly IEstructuraOrganizacionalRepository _estructura;

    public EstructuraOrganizacionalService(IEstructuraOrganizacionalRepository estructura)
    {
        _estructura = estructura;
    }

    public Task<IReadOnlyList<int>> ListarAniosAsync(CancellationToken cancellationToken = default)
        => _estructura.ListarAniosAsync(cancellationToken);

    public Task<IReadOnlyList<PersonalUnidadRow>> ListarPersonalAsync(
        int anio, int idAreaOrganiz, int idTipoTrabajador, CancellationToken cancellationToken = default)
        => _estructura.ListarPersonalAsync(anio, idAreaOrganiz, Math.Max(0, idTipoTrabajador), cancellationToken);

    public async Task<ArbolEstructura> ObtenerArbolAsync(int anio, int? idSeleccionada, CancellationToken cancellationToken = default)
    {
        var unidades = await _estructura.ListarUnidadesAsync(anio, cancellationToken);
        var nodos = unidades.GroupBy(u => u.Id).ToDictionary(g => g.Key, g => new NodoUnidad(g.First()));

        var raices = new List<NodoUnidad>();
        foreach (var nodo in nodos.Values)
        {
            var padre = nodo.Unidad.IdPadre;
            if (padre is not null && padre != nodo.Unidad.Id && nodos.TryGetValue(padre.Value, out var nodoPadre))
            {
                nodoPadre.Hijos.Add(nodo);
            }
            else
            {
                // Sin padre, padre inexistente o auto-referencia: se muestra como unidad de primer nivel.
                raices.Add(nodo);
            }
        }

        // Los datos podrían traer ciclos (A depende de B y B de A): ninguno de sus nodos queda como raíz
        // y se perderían en silencio; se descartan aquí para que el árbol siempre termine.
        var visitados = new HashSet<int>();
        void Marcar(NodoUnidad n)
        {
            if (!visitados.Add(n.Unidad.Id))
            {
                return;
            }

            n.Hijos.Sort((a, b) => string.Compare(a.Unidad.Nombre, b.Unidad.Nombre, StringComparison.CurrentCultureIgnoreCase));
            foreach (var h in n.Hijos.ToList())
            {
                Marcar(h);
            }
        }

        raices.Sort((a, b) => string.Compare(a.Unidad.Nombre, b.Unidad.Nombre, StringComparison.CurrentCultureIgnoreCase));
        foreach (var r in raices)
        {
            Marcar(r);
        }

        var ruta = new HashSet<int>();
        if (idSeleccionada is int sel && nodos.TryGetValue(sel, out var actual))
        {
            var cursor = actual.Unidad;
            while (cursor.IdPadre is int p && p != cursor.Id && ruta.Add(p) && nodos.TryGetValue(p, out var np))
            {
                cursor = np.Unidad;
            }
        }

        return new ArbolEstructura(raices, visitados.Count, ruta);
    }
}
