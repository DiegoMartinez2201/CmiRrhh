using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Text.RegularExpressions;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Asistencias;

[Authorize(Policy = AuthConstants.AsistenciasEscrituraPolicy)]
public class CorreccionModel : PageModel
{
    private static readonly Regex HoraRegex = new(
        @"^(?:[01]\d|2[0-3]):[0-5]\d(?::[0-5]\d)?$",
        RegexOptions.CultureInvariant | RegexOptions.Compiled);

    private readonly IAsistenciaCorreccionService _correccion;

    public CorreccionModel(IAsistenciaCorreccionService correccion)
    {
        _correccion = correccion;
    }

    [BindProperty(SupportsGet = true)]
    [Display(Name = "Id empleado")]
    public int? IdEmpleado { get; set; }

    [BindProperty(SupportsGet = true)]
    [DataType(DataType.Date)]
    [Display(Name = "Fecha")]
    public DateTime? Fecha { get; set; }

    [BindProperty]
    [Display(Name = "Hora de salida")]
    public string? HoraSalida { get; set; }

    public AsistenciaDiaRow? Actual { get; private set; }

    public bool BusquedaEjecutada { get; private set; }

    [TempData]
    public string? MensajeOk { get; set; }

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        await BuscarSiCorrespondeAsync(cancellationToken);
        if (Actual is not null && string.IsNullOrWhiteSpace(HoraSalida))
        {
            HoraSalida = (Actual.HorSal ?? string.Empty).Trim();
        }
    }

    public async Task<IActionResult> OnPostAsync(CancellationToken cancellationToken)
    {
        if (IdEmpleado is null or <= 0 || Fecha is null)
        {
            ModelState.AddModelError(string.Empty, "Indique empleado y fecha.");
            return Page();
        }

        if (!TryNormalizarHora(HoraSalida, out var horaNormalizada))
        {
            ModelState.AddModelError(nameof(HoraSalida), "La hora de salida debe tener formato HH:mm o HH:mm:ss.");
            await BuscarSiCorrespondeAsync(cancellationToken);
            return Page();
        }

        try
        {
            await _correccion.CorregirSalidaAsync(IdEmpleado.Value, Fecha.Value, horaNormalizada, cancellationToken);
        }
        catch (InvalidOperationException ex)
        {
            ModelState.AddModelError(string.Empty, ex.Message);
            await BuscarSiCorrespondeAsync(cancellationToken);
            return Page();
        }

        MensajeOk = "La hora de salida se corrigió correctamente.";
        return RedirectToPage(new
        {
            IdEmpleado,
            Fecha = Fecha.Value.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)
        });
    }

    private async Task BuscarSiCorrespondeAsync(CancellationToken cancellationToken)
    {
        if (IdEmpleado is null && Fecha is null)
        {
            return;
        }

        if (IdEmpleado is null or <= 0 || Fecha is null)
        {
            ModelState.AddModelError(string.Empty, "Indique empleado y fecha para buscar.");
            return;
        }

        Actual = await _correccion.BuscarAsync(IdEmpleado.Value, Fecha.Value, cancellationToken);
        BusquedaEjecutada = true;
    }

    internal static bool TryNormalizarHora(string? valor, out string hora)
    {
        hora = string.Empty;
        if (string.IsNullOrWhiteSpace(valor))
        {
            return false;
        }

        var texto = valor.Trim();
        if (!HoraRegex.IsMatch(texto))
        {
            return false;
        }

        if (texto.Length == 5)
        {
            texto += ":00";
        }

        hora = texto;
        return true;
    }
}
