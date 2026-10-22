using System.ComponentModel.DataAnnotations;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Permisos;

// Reutiliza las políticas de Asistencias: el documento de exploración funcional (sección 4.3)
// confirma que los roles 3 y 4 pierden, como un solo bloque, "las opciones de asistencia:
// importación, horarios, ..., asistencia, faltas, permisos, feriados, motivos y tipos de
// permiso, y el récord semanal" — es decir, Permisos no tiene un rol propio en el sistema
// legado, comparte el mismo con Asistencias.
[Authorize(Policy = AuthConstants.AsistenciasEscrituraPolicy)]
public class RegistroModel : PageModel
{
    private readonly IPermisoService _permisos;

    public RegistroModel(IPermisoService permisos)
    {
        _permisos = permisos;
    }

    [BindProperty]
    [Required(ErrorMessage = "Indique el empleado.")]
    [Display(Name = "Id empleado")]
    public int? IdEmpleado { get; set; }

    [BindProperty]
    [Required(ErrorMessage = "Debe elegirse un motivo válido.")]
    [Display(Name = "Motivo")]
    public int? IdMotivo { get; set; }

    [BindProperty]
    [Required]
    [DataType(DataType.Date)]
    [Display(Name = "Fecha inicio")]
    public DateTime? FechaInicio { get; set; }

    [BindProperty]
    [Required]
    [DataType(DataType.Date)]
    [Display(Name = "Fecha fin")]
    public DateTime? FechaFin { get; set; }

    [BindProperty]
    [Display(Name = "Hora de salida")]
    public string? HoraSalida { get; set; }

    [BindProperty]
    [Display(Name = "Hora de retorno")]
    public string? HoraRetorno { get; set; }

    [BindProperty]
    [Display(Name = "Todo el día")]
    public bool TodoElDia { get; set; }

    [BindProperty]
    [Display(Name = "Retorno")]
    public bool Retorno { get; set; }

    [BindProperty]
    [Display(Name = "Lugar")]
    public string? Lugar { get; set; }

    [BindProperty]
    [Display(Name = "Documento de referencia")]
    public string? Referencia { get; set; }

    [BindProperty]
    [Display(Name = "Autorización")]
    public string? Autorizacion { get; set; }

    [BindProperty]
    [Display(Name = "Observaciones")]
    public string? Observaciones { get; set; }

    public IReadOnlyList<MotivoPermisoItem> Motivos { get; private set; } = Array.Empty<MotivoPermisoItem>();

    public List<SelectListItem> MotivosSelect { get; private set; } = new();

    [TempData]
    public string? MensajeOk { get; set; }

    [TempData]
    public bool? AvisoNoAsistioHoy { get; set; }

    [TempData]
    public bool? AvisoYaSeRetiro { get; set; }

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        await CargarMotivosAsync(cancellationToken);
    }

    public async Task<IActionResult> OnPostAsync(CancellationToken cancellationToken)
    {
        if (!ModelState.IsValid)
        {
            await CargarMotivosAsync(cancellationToken);
            return Page();
        }

        try
        {
            var resultado = await _permisos.RegistrarAsync(
                IdEmpleado!.Value,
                IdMotivo!.Value,
                FechaInicio!.Value,
                FechaFin!.Value,
                HoraSalida,
                HoraRetorno,
                TodoElDia,
                Retorno,
                Lugar,
                Referencia,
                Autorizacion,
                Observaciones,
                DateTime.Today,
                cancellationToken);

            MensajeOk = $"Se grabó correctamente el permiso N° {resultado.NPermiso}.";
            AvisoNoAsistioHoy = resultado.AvisoNoAsistioHoy;
            AvisoYaSeRetiro = resultado.AvisoYaSeRetiro;

            return RedirectToPage(new { IdEmpleado });
        }
        catch (InvalidOperationException ex)
        {
            ModelState.AddModelError(string.Empty, ex.Message);
            await CargarMotivosAsync(cancellationToken);
            return Page();
        }
    }

    private async Task CargarMotivosAsync(CancellationToken cancellationToken)
    {
        Motivos = await _permisos.ListarMotivosAsync(cancellationToken);
        MotivosSelect = Motivos
            .Select(m => new SelectListItem(
                $"{m.DescripTipoPermiso} — {m.DescripMotivo}{(m.Salario ? "" : " (no asalariado)")}",
                m.IdMotivo.ToString()))
            .ToList();
    }
}
