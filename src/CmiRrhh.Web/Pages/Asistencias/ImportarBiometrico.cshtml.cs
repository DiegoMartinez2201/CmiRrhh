using System.ComponentModel.DataAnnotations;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Asistencias;

[Authorize(Policy = AuthConstants.AsistenciasEscrituraPolicy)]
public class ImportarBiometricoModel : PageModel
{
    private readonly IAsistenciaImportacionService _importacion;

    public ImportarBiometricoModel(IAsistenciaImportacionService importacion)
    {
        _importacion = importacion;
    }

    [BindProperty(SupportsGet = true)]
    [DataType(DataType.Date)]
    [Display(Name = "Fecha inicio")]
    public DateTime? FechaInicio { get; set; }

    [BindProperty(SupportsGet = true)]
    [DataType(DataType.Date)]
    [Display(Name = "Fecha fin")]
    public DateTime? FechaFin { get; set; }

    [BindProperty]
    [Display(Name = "Entiendo que este proceso puede tardar varios minutos")]
    public bool ConfirmoDuracion { get; set; }

    [BindProperty]
    [Display(Name = "Reimportar de todos modos (puede fallar por datos ya existentes)")]
    public bool ConfirmoReimportacion { get; set; }

    public bool RangoConsultado { get; private set; }

    public int MarcacionesExistentes { get; private set; }

    public ImportacionResultado? Resultado { get; private set; }

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        await ConsultarRangoAsync(cancellationToken);
    }

    public async Task<IActionResult> OnPostAsync(CancellationToken cancellationToken)
    {
        if (!await ConsultarRangoAsync(cancellationToken))
        {
            return Page();
        }

        if (!ConfirmoDuracion)
        {
            ModelState.AddModelError(
                nameof(ConfirmoDuracion),
                "Debe confirmar que entiende que el proceso puede tardar varios minutos.");
            return Page();
        }

        try
        {
            Resultado = await _importacion.ImportarAsync(
                FechaInicio!.Value,
                FechaFin!.Value,
                ConfirmoReimportacion,
                cancellationToken);
        }
        catch (ArgumentException ex)
        {
            ModelState.AddModelError(string.Empty, ex.Message);
        }
        catch (InvalidOperationException ex)
        {
            ModelState.AddModelError(string.Empty, ex.Message);
        }

        MarcacionesExistentes = await _importacion.ContarMarcacionesExistentesAsync(
            FechaInicio!.Value,
            FechaFin!.Value,
            cancellationToken);

        return Page();
    }

    private async Task<bool> ConsultarRangoAsync(CancellationToken cancellationToken)
    {
        if (FechaInicio is null && FechaFin is null)
        {
            return false;
        }

        if (FechaInicio is null || FechaFin is null)
        {
            ModelState.AddModelError(string.Empty, "Indique fecha inicio y fecha fin.");
            return false;
        }

        try
        {
            MarcacionesExistentes = await _importacion.ContarMarcacionesExistentesAsync(
                FechaInicio.Value, FechaFin.Value, cancellationToken);
            RangoConsultado = true;
            return true;
        }
        catch (ArgumentException ex)
        {
            ModelState.AddModelError(string.Empty, ex.Message);
            return false;
        }
    }
}
