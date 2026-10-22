using System.ComponentModel.DataAnnotations;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Asistencias;

[Authorize(Policy = AuthConstants.AsistenciasEscrituraPolicy)]
public class SuspenderAsistenciaModel : PageModel
{
    private readonly ISuspensionAsistenciaService _suspensiones;

    public SuspenderAsistenciaModel(ISuspensionAsistenciaService suspensiones)
    {
        _suspensiones = suspensiones;
    }

    [BindProperty]
    public SuspensionInput Form { get; set; } = new();

    [TempData]
    public string? MensajeOk { get; set; }

    [TempData]
    public string? MensajeError { get; set; }

    public void OnGet()
    {
    }

    public async Task<IActionResult> OnPostAsync(CancellationToken cancellationToken)
    {
        if (!ModelState.IsValid)
        {
            return Page();
        }

        var resultado = await _suspensiones.SuspenderAsync(Form.IdEmpleado, Form.Fecha, cancellationToken);
        if (!resultado.Exitoso)
        {
            MensajeError = resultado.Mensaje;
        }
        else
        {
            MensajeOk = resultado.Mensaje;
        }

        return RedirectToPage();
    }

    public sealed class SuspensionInput
    {
        [Required(ErrorMessage = "Indique el empleado.")]
        [Display(Name = "Id empleado")]
        public int IdEmpleado { get; set; }

        [Required(ErrorMessage = "Indique la fecha.")]
        [Display(Name = "Fecha")]
        [DataType(DataType.Date)]
        public DateOnly Fecha { get; set; } = DateOnly.FromDateTime(DateTime.Today);
    }
}
