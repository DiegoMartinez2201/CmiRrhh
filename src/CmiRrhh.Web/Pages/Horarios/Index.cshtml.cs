using System.ComponentModel.DataAnnotations;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Horarios;

[Authorize(Policy = AuthConstants.AsistenciasEscrituraPolicy)]
public class IndexModel : PageModel
{
    private readonly IHorarioService _horarios;

    public IndexModel(IHorarioService horarios)
    {
        _horarios = horarios;
    }

    [BindProperty]
    public HorarioInput Form { get; set; } = new();

    public IReadOnlyList<HorarioRow> Horarios { get; private set; } = Array.Empty<HorarioRow>();

    public bool EditandoExistente => Form.IdHorario.HasValue;

    [TempData]
    public string? MensajeOk { get; set; }

    [TempData]
    public string? MensajeError { get; set; }

    public async Task OnGetAsync(int? editar, CancellationToken cancellationToken)
    {
        await CargarAsync(cancellationToken);

        if (editar is int id)
        {
            var existente = Horarios.FirstOrDefault(h => h.IdHorario == id);
            if (existente is not null)
            {
                Form = HorarioInput.DesdeFila(existente);
            }
        }
    }

    public async Task<IActionResult> OnPostGuardarAsync(CancellationToken cancellationToken)
    {
        if (!ModelState.IsValid)
        {
            await CargarAsync(cancellationToken);
            return Page();
        }

        var datos = Form.AHorarioDatos();
        var resultado = Form.IdHorario is int id
            ? await _horarios.ActualizarAsync(id, datos, cancellationToken)
            : await _horarios.CrearAsync(datos, cancellationToken);

        if (!resultado.Exitoso)
        {
            MensajeError = resultado.Mensaje;
            await CargarAsync(cancellationToken);
            return Page();
        }

        MensajeOk = resultado.Mensaje;
        return RedirectToPage();
    }

    public async Task<IActionResult> OnPostEliminarAsync(int idHorario, CancellationToken cancellationToken)
    {
        var resultado = await _horarios.EliminarAsync(idHorario, cancellationToken);
        if (!resultado.Exitoso)
        {
            MensajeError = resultado.Mensaje;
        }
        else
        {
            MensajeOk = "Se eliminó el horario.";
        }

        return RedirectToPage();
    }

    private async Task CargarAsync(CancellationToken cancellationToken)
    {
        Horarios = await _horarios.ListarAsync(cancellationToken);
    }

    public sealed class HorarioInput
    {
        public int? IdHorario { get; set; }

        [Required(ErrorMessage = "Indique una descripción.")]
        [Display(Name = "Descripción")]
        public string DescripHorario { get; set; } = string.Empty;

        [Display(Name = "Ingreso")]
        public string? Ingreso1 { get; set; }

        [Display(Name = "Salida almuerzo")]
        public string? Salida1 { get; set; }

        [Display(Name = "Entrada almuerzo")]
        public string? Ingreso2 { get; set; }

        [Display(Name = "Salida")]
        public string? Salida2 { get; set; }

        [Display(Name = "Activo")]
        public bool Estado { get; set; } = true;

        [Display(Name = "Entra al día siguiente")]
        public bool SgtDia { get; set; }

        public static HorarioInput DesdeFila(HorarioRow fila) => new()
        {
            IdHorario = fila.IdHorario,
            DescripHorario = fila.DescripHorario ?? string.Empty,
            Ingreso1 = fila.Ingreso1,
            Salida1 = fila.Salida1,
            Ingreso2 = fila.Ingreso2,
            Salida2 = fila.Salida2,
            Estado = fila.Estado ?? true,
            SgtDia = fila.SgtDia ?? false
        };

        public HorarioDatos AHorarioDatos() => new()
        {
            DescripHorario = DescripHorario.Trim(),
            Ingreso1 = Ingreso1,
            Salida1 = Salida1,
            Ingreso2 = Ingreso2,
            Salida2 = Salida2,
            Estado = Estado,
            SgtDia = SgtDia
        };
    }
}
