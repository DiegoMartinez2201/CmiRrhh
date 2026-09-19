using System.ComponentModel.DataAnnotations;
using System.Globalization;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace CmiRrhh.Web.Pages.Asistencias;

[Authorize(Policy = AuthConstants.AsistenciasPolicy)]
public class PlanillaModel : PageModel
{
    private readonly IAsistenciaPlanillaService _planilla;
    private readonly ICatalogoService _catalogos;

    public PlanillaModel(IAsistenciaPlanillaService planilla, ICatalogoService catalogos)
    {
        _planilla = planilla;
        _catalogos = catalogos;
    }

    [BindProperty(SupportsGet = true)]
    [DataType(DataType.Date)]
    [Display(Name = "Fecha inicio")]
    public DateTime? FechaInicio { get; set; }

    [BindProperty(SupportsGet = true)]
    [DataType(DataType.Date)]
    [Display(Name = "Fecha fin")]
    public DateTime? FechaFin { get; set; }

    [BindProperty(SupportsGet = true)]
    [Display(Name = "Tipo de trabajador")]
    public string? IdTipoTrabajador { get; set; }

    [BindProperty(SupportsGet = true)]
    [Display(Name = "Locales")]
    public int[] IdLocales { get; set; } = Array.Empty<int>();

    public SelectList TiposTrabajador { get; private set; } = new(Array.Empty<CatalogoItem>(), "Id", "Nombre");

    public MultiSelectList Locales { get; private set; } = new(Array.Empty<CatalogoItem>(), "Id", "Nombre");

    public IReadOnlyList<PlanillaAsistenciaRow> Resultados { get; private set; } = Array.Empty<PlanillaAsistenciaRow>();

    public IReadOnlyList<string> FechasColumnas { get; private set; } = Array.Empty<string>();

    public bool ConsultaEjecutada { get; private set; }

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        await CargarCatalogosAsync(cancellationToken);

        if (FechaInicio is null && FechaFin is null && string.IsNullOrWhiteSpace(IdTipoTrabajador))
        {
            return;
        }

        if (FechaInicio is null || FechaFin is null)
        {
            ModelState.AddModelError(string.Empty, "Indique fecha inicio y fecha fin.");
            return;
        }

        if (string.IsNullOrWhiteSpace(IdTipoTrabajador))
        {
            ModelState.AddModelError(nameof(IdTipoTrabajador), "Seleccione el tipo de trabajador.");
            return;
        }

        FechasColumnas = ConstruirColumnas(FechaInicio.Value, FechaFin.Value);

        if (!ModelState.IsValid)
        {
            return;
        }

        try
        {
            Resultados = await _planilla.ConsultarAsync(
                new PlanillaAsistenciaRequest
                {
                    FechaInicio = FechaInicio.Value,
                    FechaFin = FechaFin.Value,
                    IdTipoTrabajador = IdTipoTrabajador,
                    IdLocales = IdLocales
                },
                cancellationToken);
            ConsultaEjecutada = true;
        }
        catch (ArgumentException ex)
        {
            ModelState.AddModelError(string.Empty, ex.Message);
        }
    }

    private async Task CargarCatalogosAsync(CancellationToken cancellationToken)
    {
        var tipos = await _catalogos.ListarTiposTrabajadorAsync(cancellationToken);
        var locales = await _catalogos.ListarLocalesAsync(cancellationToken);
        TiposTrabajador = new SelectList(tipos, "Id", "Nombre", IdTipoTrabajador);
        Locales = new MultiSelectList(locales, "Id", "Nombre", IdLocales);
    }

    private static IReadOnlyList<string> ConstruirColumnas(DateTime inicio, DateTime fin)
    {
        if (fin.Date < inicio.Date)
        {
            return Array.Empty<string>();
        }

        var columnas = new List<string>();
        for (var f = inicio.Date; f <= fin.Date; f = f.AddDays(1))
        {
            columnas.Add(f.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture));
        }

        return columnas;
    }
}
