using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Estructura;

/// <summary>Datos que necesita la vista parcial recursiva de un nodo del árbol.</summary>
public sealed record NodoVista(
    NodoUnidad Nodo,
    int Anio,
    int? Seleccionada,
    int IdTipoTrabajador,
    IReadOnlySet<int> Ruta,
    int Nivel);

/// <summary>
/// Equivalente al árbol de unidades orgánicas del sistema legado (llena_tree + buscar_empleado_tree):
/// a la izquierda la estructura del año; al elegir una unidad se lista su personal activo.
/// </summary>
public class IndexModel : PageModel
{
    private readonly IEstructuraOrganizacionalService _estructura;
    private readonly ICatalogoService _catalogo;

    public IndexModel(IEstructuraOrganizacionalService estructura, ICatalogoService catalogo)
    {
        _estructura = estructura;
        _catalogo = catalogo;
    }

    [BindProperty(SupportsGet = true)]
    public int? Anio { get; set; }

    [BindProperty(SupportsGet = true)]
    public int? IdArea { get; set; }

    /// <summary>0 / vacío = todos los tipos de trabajador.</summary>
    [BindProperty(SupportsGet = true)]
    public int? IdTipoTrabajador { get; set; }

    public IReadOnlyList<int> Anios { get; private set; } = Array.Empty<int>();

    public IReadOnlyList<CatalogoItem> TiposTrabajador { get; private set; } = Array.Empty<CatalogoItem>();

    public ArbolEstructura Arbol { get; private set; } = new(Array.Empty<NodoUnidad>(), 0, new HashSet<int>());

    public UnidadOrganica? UnidadSeleccionada { get; private set; }

    public IReadOnlyList<PersonalUnidadRow> Personal { get; private set; } = Array.Empty<PersonalUnidadRow>();

    public string? MensajeError { get; private set; }

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        try
        {
            Anios = await _estructura.ListarAniosAsync(cancellationToken);
            TiposTrabajador = await _catalogo.ListarTiposTrabajadorAsync(cancellationToken);

            if (Anios.Count == 0)
            {
                return;
            }

            // Año pedido si existe; si no, el actual si tiene estructura; si no, el más reciente.
            Anio = Anio is int pedido && Anios.Contains(pedido)
                ? pedido
                : Anios.Contains(DateTime.Today.Year) ? DateTime.Today.Year : Anios[0];

            Arbol = await _estructura.ObtenerArbolAsync(Anio.Value, IdArea, cancellationToken);

            if (IdArea is int area)
            {
                UnidadSeleccionada = Buscar(Arbol.Raices, area);
                if (UnidadSeleccionada is not null)
                {
                    Personal = await _estructura.ListarPersonalAsync(
                        Anio.Value, area, IdTipoTrabajador ?? 0, cancellationToken);
                }
            }
        }
        catch (Exception ex) when (ex is not OperationCanceledException)
        {
            MensajeError = "No se pudo cargar la estructura orgánica: " + ex.Message;
        }
    }

    private static UnidadOrganica? Buscar(IEnumerable<NodoUnidad> nodos, int id)
    {
        foreach (var n in nodos)
        {
            if (n.Unidad.Id == id)
            {
                return n.Unidad;
            }

            var hijo = Buscar(n.Hijos, id);
            if (hijo is not null)
            {
                return hijo;
            }
        }

        return null;
    }
}
