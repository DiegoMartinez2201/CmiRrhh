using System.ComponentModel.DataAnnotations;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Asistencias;

[Authorize(Policy = AuthConstants.AsistenciasEscrituraPolicy)]
public class MarcacionesAutorizadasModel : PageModel
{
    private readonly IMarcacionAutorizadaService _marcaciones;

    public MarcacionesAutorizadasModel(IMarcacionAutorizadaService marcaciones)
    {
        _marcaciones = marcaciones;
    }

    [BindProperty(SupportsGet = true)]
    [Required(ErrorMessage = "Indique el empleado.")]
    [Display(Name = "Id empleado")]
    public int? IdEmpleado { get; set; }

    [BindProperty]
    public NuevaMarcacionInput Nueva { get; set; } = new();

    public IReadOnlyList<MarcacionAutorizadaRow> Resultados { get; private set; } = Array.Empty<MarcacionAutorizadaRow>();

    public bool ConsultaEjecutada { get; private set; }

    [TempData]
    public string? MensajeOk { get; set; }

    [TempData]
    public string? MensajeError { get; set; }

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        await ConsultarSiCorrespondeAsync(cancellationToken);
    }

    public async Task<IActionResult> OnPostAutorizarAsync(CancellationToken cancellationToken)
    {
        if (IdEmpleado is null or <= 0)
        {
            ModelState.AddModelError(string.Empty, "Indique el empleado.");
            return Page();
        }

        if (!ModelState.IsValid)
        {
            await ConsultarSiCorrespondeAsync(cancellationToken);
            return Page();
        }

        var resultado = await _marcaciones.AutorizarAsync(
            IdEmpleado.Value,
            Nueva.Fecha,
            Nueva.Tipo == "Entrada",
            Nueva.Hora,
            Nueva.Motivo,
            Nueva.Documento,
            User.Identity?.Name,
            cancellationToken);

        if (!resultado.Exitoso)
        {
            MensajeError = resultado.Mensaje;
            await ConsultarSiCorrespondeAsync(cancellationToken);
            return Page();
        }

        MensajeOk = resultado.Mensaje;
        return RedirectToPage(new { IdEmpleado });
    }

    private async Task ConsultarSiCorrespondeAsync(CancellationToken cancellationToken)
    {
        if (IdEmpleado is null or <= 0)
        {
            return;
        }

        Resultados = await _marcaciones.ListarAsync(IdEmpleado.Value, cancellationToken);
        ConsultaEjecutada = true;
    }

    public sealed class NuevaMarcacionInput
    {
        [Required(ErrorMessage = "Indique la fecha.")]
        [Display(Name = "Fecha")]
        [DataType(DataType.Date)]
        public DateOnly Fecha { get; set; } = DateOnly.FromDateTime(DateTime.Today);

        // Si hay que justificar ingreso y salida a la vez, el legado indica usar Permisos
        // (sección 4.5) — por eso aquí solo se puede elegir uno de los dos, nunca ambos.
        [Required(ErrorMessage = "Elija si autoriza una Entrada o una Salida.")]
        [Display(Name = "Autoriza")]
        public string Tipo { get; set; } = "Entrada";

        [Required(ErrorMessage = "Indique la hora.")]
        [Display(Name = "Hora")]
        public string Hora { get; set; } = string.Empty;

        [Required(ErrorMessage = "Debe elegir un motivo.")]
        [Display(Name = "Motivo")]
        public string Motivo { get; set; } = string.Empty;

        [Required(ErrorMessage = "Debe ingresar el documento de referencia.")]
        [Display(Name = "Documento de referencia")]
        public string Documento { get; set; } = string.Empty;
    }
}
