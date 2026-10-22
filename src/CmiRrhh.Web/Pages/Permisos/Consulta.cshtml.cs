using System.ComponentModel.DataAnnotations;
using System.Globalization;
using System.Text;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Permisos;

[Authorize(Policy = AuthConstants.AsistenciasPolicy)]
public class ConsultaModel : PageModel
{
    private readonly IPermisoService _permisos;

    public ConsultaModel(IPermisoService permisos)
    {
        _permisos = permisos;
    }

    [BindProperty(SupportsGet = true)]
    [Required(ErrorMessage = "Indique el empleado.")]
    [Display(Name = "Id empleado")]
    public int? IdEmpleado { get; set; }

    [BindProperty(SupportsGet = true)]
    [Display(Name = "Tipo de permiso")]
    public int? IdTipoPermiso { get; set; }

    [BindProperty(SupportsGet = true)]
    [Display(Name = "Motivo")]
    public int? IdMotivo { get; set; }

    public IReadOnlyList<PermisoRow> Resultados { get; private set; } = Array.Empty<PermisoRow>();

    public List<SelectListItem> MotivosSelect { get; private set; } = new();

    public bool ConsultaEjecutada { get; private set; }

    [TempData]
    public string? MensajeOk { get; set; }

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        await CargarMotivosAsync(cancellationToken);
        await ConsultarSiCorrespondeAsync(cancellationToken);
    }

    public async Task<IActionResult> OnPostEliminarAsync(int nPermiso, CancellationToken cancellationToken)
    {
        if (IdEmpleado is null or <= 0)
        {
            ModelState.AddModelError(string.Empty, "Indique el empleado.");
            await CargarMotivosAsync(cancellationToken);
            return Page();
        }

        await _permisos.EliminarAsync(IdEmpleado.Value, nPermiso, cancellationToken);
        MensajeOk = $"Se eliminó el permiso N° {nPermiso}.";
        return RedirectToPage(new { IdEmpleado, IdTipoPermiso, IdMotivo });
    }

    // "Exportar a Excel" del formulario legado: se entrega como CSV (abre directo en Excel) en
    // vez de un .xlsx nativo, para no agregar una dependencia (ClosedXML/EPPlus) sin confirmar
    // con el equipo si hace falta formato de libro real (hojas, estilos) más adelante.
    public async Task<IActionResult> OnGetExportarAsync(CancellationToken cancellationToken)
    {
        if (IdEmpleado is null or <= 0)
        {
            return RedirectToPage(new { IdEmpleado, IdTipoPermiso, IdMotivo });
        }

        var filas = await _permisos.ListarAsync(IdEmpleado.Value, IdTipoPermiso, IdMotivo, cancellationToken);

        var sb = new StringBuilder();
        sb.AppendLine("Tipo;Motivo;NPermiso;FechaInicio;FechaFin;HoraSalida;HoraRetorno;TodoElDia;Retorno;Lugar;Referencia;Autorizacion");
        foreach (var fila in filas)
        {
            sb.AppendLine(string.Join(';', new[]
            {
                fila.DescripTipoPermiso,
                fila.DescripMotivo,
                fila.NPermiso.ToString(CultureInfo.InvariantCulture),
                fila.FechaInicio?.ToString("dd/MM/yyyy") ?? string.Empty,
                fila.FechaFin?.ToString("dd/MM/yyyy") ?? string.Empty,
                fila.HoraSal ?? string.Empty,
                fila.HoraRet ?? string.Empty,
                fila.Dia == true ? "Sí" : "No",
                fila.Retorno == true ? "Sí" : "No",
                fila.Lugar ?? string.Empty,
                fila.Referencia ?? string.Empty,
                fila.Autorizacion ?? string.Empty
            }));
        }

        var bytes = Encoding.UTF8.GetPreamble().Concat(Encoding.UTF8.GetBytes(sb.ToString())).ToArray();
        return File(bytes, "text/csv", $"permisos_{IdEmpleado}.csv");
    }

    private async Task CargarMotivosAsync(CancellationToken cancellationToken)
    {
        var motivos = await _permisos.ListarMotivosAsync(cancellationToken);
        MotivosSelect = motivos
            .Select(m => new SelectListItem($"{m.DescripTipoPermiso} — {m.DescripMotivo}", m.IdMotivo.ToString()))
            .ToList();
    }

    private async Task ConsultarSiCorrespondeAsync(CancellationToken cancellationToken)
    {
        if (IdEmpleado is null or <= 0)
        {
            return;
        }

        Resultados = await _permisos.ListarAsync(IdEmpleado.Value, IdTipoPermiso, IdMotivo, cancellationToken);
        ConsultaEjecutada = true;
    }
}
