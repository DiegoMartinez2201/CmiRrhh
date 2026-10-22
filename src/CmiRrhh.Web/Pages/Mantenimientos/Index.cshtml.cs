using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Mantenimientos;

/// <summary>Mantenimiento de catálogos: una sola pantalla para todos, elegida con ?clave=...</summary>
public class IndexModel : PageModel
{
    private readonly IMantenimientoCatalogoService _catalogos;

    public IndexModel(IMantenimientoCatalogoService catalogos)
    {
        _catalogos = catalogos;
    }

    [BindProperty(SupportsGet = true)]
    public string? Clave { get; set; }

    /// <summary>Id del registro que se está editando (null = alta).</summary>
    [BindProperty(SupportsGet = true)]
    public int? EditarId { get; set; }

    [BindProperty]
    public Dictionary<string, string?> Valores { get; set; } = new();

    public IReadOnlyList<DefinicionCatalogo> Catalogos { get; private set; } = Array.Empty<DefinicionCatalogo>();

    public DefinicionCatalogo? Actual { get; private set; }

    public IReadOnlyList<FilaCatalogo> Filas { get; private set; } = Array.Empty<FilaCatalogo>();

    /// <summary>Error de validación mostrado en la misma petición (no sobrevive a una redirección).</summary>
    public string? MensajeAhora { get; private set; }

    [TempData]
    public string? Mensaje { get; set; }

    [TempData]
    public bool MensajeOk { get; set; }

    public async Task<IActionResult> OnGetAsync(CancellationToken cancellationToken)
    {
        await CargarAsync(cancellationToken);

        if (EditarId is not null && Actual is not null)
        {
            var fila = Filas.FirstOrDefault(f => f.Id == EditarId);
            if (fila is null)
            {
                EditarId = null;
            }
            else
            {
                Valores = fila.Valores.ToDictionary(k => k.Key, k => (string?)k.Value);
            }
        }

        return Page();
    }

    public async Task<IActionResult> OnPostGuardarAsync(CancellationToken cancellationToken)
    {
        if (string.IsNullOrEmpty(Clave) || _catalogos.Definicion(Clave) is null)
        {
            return RedirectToPage();
        }

        var r = await _catalogos.GuardarAsync(Clave, EditarId, Valores, cancellationToken);
        if (!r.Exitoso)
        {
            // Se vuelve a mostrar el formulario con lo digitado y el mensaje de error.
            await CargarAsync(cancellationToken);
            MensajeAhora = r.Mensaje;
            return Page();
        }

        Mensaje = r.Mensaje;
        MensajeOk = true;
        return RedirectToPage(new { clave = Clave });
    }

    public async Task<IActionResult> OnPostEliminarAsync(int id, CancellationToken cancellationToken)
    {
        if (string.IsNullOrEmpty(Clave) || _catalogos.Definicion(Clave) is null)
        {
            return RedirectToPage();
        }

        var r = await _catalogos.EliminarAsync(Clave, id, cancellationToken);
        Mensaje = r.Mensaje;
        MensajeOk = r.Exitoso;
        return RedirectToPage(new { clave = Clave });
    }

    private async Task CargarAsync(CancellationToken cancellationToken)
    {
        Catalogos = _catalogos.Catalogos();
        Actual = !string.IsNullOrEmpty(Clave) ? _catalogos.Definicion(Clave) : null;
        Filas = Actual is null ? Array.Empty<FilaCatalogo>() : await _catalogos.ListarAsync(Actual.Clave, cancellationToken);
    }
}
