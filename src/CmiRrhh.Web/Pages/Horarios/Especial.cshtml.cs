using System.ComponentModel.DataAnnotations;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Horarios;

[Authorize(Policy = AuthConstants.AsistenciasEscrituraPolicy)]
public class EspecialModel : PageModel
{
    private readonly IHorarioService _horarios;

    public EspecialModel(IHorarioService horarios)
    {
        _horarios = horarios;
    }

    [BindProperty(SupportsGet = true)]
    [Required(ErrorMessage = "Indique el empleado.")]
    [Display(Name = "Id empleado")]
    public int? IdEmpleado { get; set; }

    [BindProperty]
    public NuevoTemporalInput Nuevo { get; set; } = new();

    public List<SelectListItem> HorariosSelect { get; private set; } = new();

    public IReadOnlyList<HorarioTemporalRow> Resultados { get; private set; } = Array.Empty<HorarioTemporalRow>();

    public bool ConsultaEjecutada { get; private set; }

    [TempData]
    public string? MensajeOk { get; set; }

    [TempData]
    public string? MensajeError { get; set; }

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        await CargarHorariosAsync(cancellationToken);
        await ConsultarSiCorrespondeAsync(cancellationToken);
    }

    public async Task<IActionResult> OnPostAgregarAsync(CancellationToken cancellationToken)
    {
        await CargarHorariosAsync(cancellationToken);

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

        var resultado = await _horarios.RegistrarTemporalAsync(
            IdEmpleado.Value,
            Nuevo.IdHorario,
            Nuevo.FechaInicio,
            Nuevo.FechaFin,
            Nuevo.NroDocumento,
            Nuevo.Sisgedo,
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

    public async Task<IActionResult> OnPostEliminarAsync(int n, CancellationToken cancellationToken)
    {
        if (IdEmpleado is null or <= 0)
        {
            ModelState.AddModelError(string.Empty, "Indique el empleado.");
            await CargarHorariosAsync(cancellationToken);
            return Page();
        }

        await _horarios.EliminarTemporalAsync(IdEmpleado.Value, n, cancellationToken);
        MensajeOk = "Se eliminó el horario especial.";
        return RedirectToPage(new { IdEmpleado });
    }

    private async Task CargarHorariosAsync(CancellationToken cancellationToken)
    {
        var horarios = await _horarios.ListarAsync(cancellationToken);
        HorariosSelect = horarios
            .Where(h => h.Estado != false)
            .Select(h => new SelectListItem($"{h.DescripHorario} ({h.Ingreso1}-{h.Salida2})", h.IdHorario.ToString()))
            .ToList();
    }

    private async Task ConsultarSiCorrespondeAsync(CancellationToken cancellationToken)
    {
        if (IdEmpleado is null or <= 0)
        {
            return;
        }

        Resultados = await _horarios.ListarTemporalesAsync(IdEmpleado.Value, cancellationToken);
        ConsultaEjecutada = true;
    }

    public sealed class NuevoTemporalInput
    {
        [Required(ErrorMessage = "Elija un horario.")]
        [Display(Name = "Horario")]
        public int IdHorario { get; set; }

        [Required(ErrorMessage = "Indique la fecha de inicio.")]
        [Display(Name = "Fecha inicio")]
        [DataType(DataType.Date)]
        public DateOnly FechaInicio { get; set; } = DateOnly.FromDateTime(DateTime.Today);

        [Required(ErrorMessage = "Indique la fecha de término.")]
        [Display(Name = "Fecha fin")]
        [DataType(DataType.Date)]
        public DateOnly FechaFin { get; set; } = DateOnly.FromDateTime(DateTime.Today);

        [Display(Name = "N° documento (SISGEDO)")]
        public string? NroDocumento { get; set; }

        [Display(Name = "Referencia SISGEDO")]
        public string? Sisgedo { get; set; }
    }
}
