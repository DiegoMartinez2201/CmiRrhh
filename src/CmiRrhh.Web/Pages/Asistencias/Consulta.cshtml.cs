using System.ComponentModel.DataAnnotations;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Asistencias;

[Authorize(Policy = AuthConstants.AsistenciasPolicy)]
public class ConsultaModel : PageModel
{
    public const int MaxDiasRango = 31;

    private readonly IAsistenciaConsultaService _consulta;

    public ConsultaModel(IAsistenciaConsultaService consulta)
    {
        _consulta = consulta;
    }

    [BindProperty(SupportsGet = true)]
    [DataType(DataType.Date)]
    [Display(Name = "Fecha inicio")]
    public DateTime? FechaInicio { get; set; }

    [BindProperty(SupportsGet = true)]
    [DataType(DataType.Date)]
    [Display(Name = "Fecha fin")]
    public DateTime? FechaFin { get; set; }

    public IReadOnlyList<AsistenciaReporteRow> Resultados { get; private set; } = Array.Empty<AsistenciaReporteRow>();

    public bool ConsultaEjecutada { get; private set; }

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        if (FechaInicio is null && FechaFin is null)
        {
            return;
        }

        if (FechaInicio is null || FechaFin is null)
        {
            ModelState.AddModelError(string.Empty, "Indique fecha inicio y fecha fin.");
            return;
        }

        if (FechaFin.Value.Date < FechaInicio.Value.Date)
        {
            ModelState.AddModelError(nameof(FechaFin), "La fecha fin no puede ser anterior a la fecha inicio.");
            return;
        }

        if ((FechaFin.Value.Date - FechaInicio.Value.Date).TotalDays > MaxDiasRango)
        {
            ModelState.AddModelError(string.Empty, $"El rango no puede superar {MaxDiasRango} días (el proceso diario recorre todos los empleados).");
            return;
        }

        if (!ModelState.IsValid)
        {
            return;
        }

        Resultados = await _consulta.ConsultarAsync(FechaInicio.Value, FechaFin.Value, cancellationToken);
        ConsultaEjecutada = true;
    }
}
