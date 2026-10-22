using System.ComponentModel.DataAnnotations;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Horarios;

[Authorize(Policy = AuthConstants.AsistenciasEscrituraPolicy)]
public class FeriadosModel : PageModel
{
    private readonly IFeriadoService _feriados;

    public FeriadosModel(IFeriadoService feriados)
    {
        _feriados = feriados;
    }

    [BindProperty]
    public NuevoFeriadoInput Nuevo { get; set; } = new();

    public IReadOnlyList<FeriadoRow> Feriados { get; private set; } = Array.Empty<FeriadoRow>();

    [TempData]
    public string? MensajeOk { get; set; }

    [TempData]
    public string? MensajeError { get; set; }

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        Feriados = await _feriados.ListarAsync(cancellationToken);
    }

    public async Task<IActionResult> OnPostAgregarAsync(CancellationToken cancellationToken)
    {
        if (!ModelState.IsValid)
        {
            Feriados = await _feriados.ListarAsync(cancellationToken);
            return Page();
        }

        var resultado = await _feriados.AgregarAsync(Nuevo.Fecha, Nuevo.Motivo, cancellationToken);
        if (!resultado.Exitoso)
        {
            MensajeError = resultado.Mensaje;
            Feriados = await _feriados.ListarAsync(cancellationToken);
            return Page();
        }

        MensajeOk = resultado.Mensaje;
        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostEliminarAsync(int idFeriado, CancellationToken cancellationToken)
    {
        await _feriados.EliminarAsync(idFeriado, cancellationToken);
        MensajeOk = "Se eliminó el feriado.";
        return RedirectToPage();
    }

    public sealed class NuevoFeriadoInput
    {
        [Required(ErrorMessage = "Indique la fecha.")]
        [Display(Name = "Fecha")]
        [DataType(DataType.Date)]
        public DateOnly Fecha { get; set; } = DateOnly.FromDateTime(DateTime.Today);

        [Display(Name = "Motivo")]
        public string? Motivo { get; set; }
    }
}
