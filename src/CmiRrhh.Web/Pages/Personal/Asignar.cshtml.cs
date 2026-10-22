using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Personal;

/// <summary>Equivalente a "Asignar Horarios" y "Asignar Local" del sistema legado (asignación masiva).</summary>
public class AsignarModel : PageModel
{
    private readonly IAsignacionPersonalService _asignaciones;
    private readonly ICatalogoService _catalogo;
    private readonly IHorarioService _horarios;

    public AsignarModel(IAsignacionPersonalService asignaciones, ICatalogoService catalogo, IHorarioService horarios)
    {
        _asignaciones = asignaciones;
        _catalogo = catalogo;
        _horarios = horarios;
    }

    [BindProperty(SupportsGet = true)]
    public int? IdTipoTrabajador { get; set; }

    [BindProperty(SupportsGet = true)]
    public string? Apellido { get; set; }

    [BindProperty]
    public List<int> Seleccionados { get; set; } = new();

    [BindProperty]
    public int? IdHorarioNuevo { get; set; }

    [BindProperty]
    public int? IdLocalNuevo { get; set; }

    public IReadOnlyList<PersonalAsignacionRow> Filas { get; private set; } = Array.Empty<PersonalAsignacionRow>();

    public IReadOnlyList<CatalogoItem> TiposTrabajador { get; private set; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<CatalogoItem> Locales { get; private set; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<HorarioRow> Horarios { get; private set; } = Array.Empty<HorarioRow>();

    [TempData]
    public string? Mensaje { get; set; }

    [TempData]
    public bool MensajeOk { get; set; }

    public string HorarioTexto(int? id)
        => id is null ? "—" : Horarios.FirstOrDefault(h => h.IdHorario == id)?.DescripHorario ?? id.ToString()!;

    public string LocalTexto(int? id)
        => id is null ? "—" : Locales.FirstOrDefault(l => l.Id == id)?.Nombre ?? id.ToString()!;

    public async Task OnGetAsync(CancellationToken cancellationToken)
        => await CargarAsync(cancellationToken);

    public async Task<IActionResult> OnPostAsync(CancellationToken cancellationToken)
    {
        var r = await _asignaciones.AsignarAsync(Seleccionados, IdHorarioNuevo, IdLocalNuevo, cancellationToken);
        Mensaje = r.Mensaje;
        MensajeOk = r.Exitoso;
        return RedirectToPage(new { IdTipoTrabajador, Apellido });
    }

    private async Task CargarAsync(CancellationToken cancellationToken)
    {
        TiposTrabajador = await _catalogo.ListarTiposTrabajadorAsync(cancellationToken);
        Locales = await _catalogo.ListarLocalesAsync(cancellationToken);
        Horarios = (await _horarios.ListarAsync(cancellationToken)).Where(h => h.Estado != false).ToList();
        Filas = await _asignaciones.ListarAsync(IdTipoTrabajador, Apellido, cancellationToken);
    }
}
