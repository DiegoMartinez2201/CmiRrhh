using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Personal;

/// <summary>
/// Equivalente a "Relación Personal" + "Búsqueda Personal" del sistema legado (solo lectura).
/// Sin filtros lista todo el personal activo ("relación"); con filtros es la "búsqueda".
/// </summary>
public class IndexModel : PageModel
{
    // Tope de filas mostradas para no renderizar miles de filas de una vez.
    public const int MaximoFilas = 1000;

    private readonly IPersonalService _personal;
    private readonly ICatalogoService _catalogo;

    public IndexModel(IPersonalService personal, ICatalogoService catalogo)
    {
        _personal = personal;
        _catalogo = catalogo;
    }

    [BindProperty(SupportsGet = true)]
    public int? Codigo { get; set; }

    [BindProperty(SupportsGet = true)]
    public string? NumDoc { get; set; }

    [BindProperty(SupportsGet = true)]
    public string? Apellido { get; set; }

    [BindProperty(SupportsGet = true)]
    public int? IdTipoTrabajador { get; set; }

    /// <summary>"1" = activos (por defecto), "0" = inactivos.</summary>
    [BindProperty(SupportsGet = true)]
    public string Estado { get; set; } = "1";

    [BindProperty(SupportsGet = true)]
    public int? Anio { get; set; }

    public IReadOnlyList<CatalogoItem> TiposTrabajador { get; private set; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<PersonalRow> Resultados { get; private set; } = Array.Empty<PersonalRow>();

    public int TotalEncontrados { get; private set; }

    public string? MensajeError { get; private set; }

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        TiposTrabajador = await _catalogo.ListarTiposTrabajadorAsync(cancellationToken);

        try
        {
            var filtro = new PersonalFiltro(
                Codigo,
                NumDoc,
                Apellido,
                IdTipoTrabajador,
                Estado != "0",
                Anio);

            var todos = await _personal.BuscarAsync(filtro, cancellationToken);
            TotalEncontrados = todos.Count;
            Resultados = todos.Take(MaximoFilas).ToList();
        }
        catch (Exception ex) when (ex is not OperationCanceledException)
        {
            MensajeError = "No se pudo completar la búsqueda: " + ex.Message;
        }
    }
}
