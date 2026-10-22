using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Personal;

/// <summary>
/// Ficha Social / Escalafonaria: una pestaña por sección (periodos, experiencia, estudios, títulos,
/// capacitaciones, ...) con Agregar, Modificar y Eliminar. Las secciones salen del servicio, de modo que
/// agregar una nueva no exige cambiar esta página.
/// </summary>
public class EscalafonariaModel : PageModel
{
    public const string ClaveNuevo = "nuevo";

    private readonly IEscalafonService _escalafon;
    private readonly IPersonalFichaService _fichas;

    public EscalafonariaModel(IEscalafonService escalafon, IPersonalFichaService fichas)
    {
        _escalafon = escalafon;
        _fichas = fichas;
    }

    [BindProperty(SupportsGet = true)]
    public int Id { get; set; }

    [BindProperty(SupportsGet = true)]
    public string? Seccion { get; set; }

    /// <summary>Clave del registro que se modifica, o «nuevo» para agregar; vacío = solo la lista.</summary>
    [BindProperty(SupportsGet = true)]
    public string? Editar { get; set; }

    /// <summary>Valores del formulario por clave de campo (V[clave]).</summary>
    [BindProperty]
    public Dictionary<string, string?> V { get; set; } = new();

    public EmpleadoFicha? Empleado { get; private set; }

    public IReadOnlyList<DefinicionSeccionEscalafon> Secciones { get; private set; } = Array.Empty<DefinicionSeccionEscalafon>();

    public DefinicionSeccionEscalafon? Actual { get; private set; }

    public IReadOnlyList<FilaEscalafon> Filas { get; private set; } = Array.Empty<FilaEscalafon>();

    public IReadOnlyDictionary<string, IReadOnlyList<CatalogoItem>> Opciones { get; private set; }
        = new Dictionary<string, IReadOnlyList<CatalogoItem>>();

    public IReadOnlyList<string> Errores { get; private set; } = Array.Empty<string>();

    [TempData]
    public string? Mensaje { get; set; }

    public bool FormularioAbierto => !string.IsNullOrEmpty(Editar);

    public bool EsAlta => string.Equals(Editar, ClaveNuevo, StringComparison.OrdinalIgnoreCase);

    public FilaEscalafon? FilaEditando { get; private set; }

    public string NombreEmpleado
        => Empleado is null
            ? string.Empty
            : $"{Empleado.ApellidoPaterno} {Empleado.ApellidoMaterno}, {Empleado.Nombres}".Trim();

    /// <summary>Valor a mostrar en un campo: lo que el usuario escribió o, si no, el del registro en edición.</summary>
    public string ValorDe(string clave)
    {
        if (V.TryGetValue(clave, out var enviado) && enviado is not null)
        {
            return enviado;
        }

        return FilaEditando is not null && FilaEditando.Valores.TryGetValue(clave, out var guardado) ? guardado : string.Empty;
    }

    public async Task<IActionResult> OnGetAsync(CancellationToken cancellationToken)
    {
        return await CargarAsync(cancellationToken) ? Page() : NotFound();
    }

    public async Task<IActionResult> OnPostGuardarAsync(CancellationToken cancellationToken)
    {
        if (!await CargarAsync(cancellationToken, cargarFilas: false) || Actual is null)
        {
            return NotFound();
        }

        var clave = EsAlta ? null : Editar;
        var resultado = await _escalafon.GuardarAsync(Actual.Clave, Id, clave, V, cancellationToken);
        if (resultado.Ok)
        {
            Mensaje = EsAlta ? "Registro agregado correctamente." : "Registro actualizado correctamente.";
            return RedirectToPage(new { id = Id, seccion = Actual.Clave });
        }

        // Se vuelve a mostrar el formulario con lo que el usuario escribió.
        Errores = resultado.Errores;
        await CargarFilasAsync(cancellationToken);
        return Page();
    }

    public async Task<IActionResult> OnPostEliminarAsync(string clave, CancellationToken cancellationToken)
    {
        if (!await CargarAsync(cancellationToken, cargarFilas: false) || Actual is null)
        {
            return NotFound();
        }

        var resultado = await _escalafon.EliminarAsync(Actual.Clave, Id, clave, cancellationToken);
        Mensaje = resultado.Ok ? "Registro eliminado." : string.Join(" ", resultado.Errores);
        return RedirectToPage(new { id = Id, seccion = Actual.Clave });
    }

    private async Task<bool> CargarAsync(CancellationToken cancellationToken, bool cargarFilas = true)
    {
        Empleado = await _fichas.ObtenerAsync(Id, cancellationToken);
        if (Empleado is null)
        {
            return false;
        }

        Secciones = _escalafon.Secciones();
        Actual = Secciones.FirstOrDefault(s => string.Equals(s.Clave, Seccion, StringComparison.OrdinalIgnoreCase))
                 ?? Secciones.FirstOrDefault();
        if (Actual is null)
        {
            return true;
        }

        Seccion = Actual.Clave;
        Opciones = await _escalafon.OpcionesAsync(Actual.Clave, cancellationToken);

        if (cargarFilas)
        {
            await CargarFilasAsync(cancellationToken);
        }

        return true;
    }

    private async Task CargarFilasAsync(CancellationToken cancellationToken)
    {
        if (Actual is null)
        {
            return;
        }

        Filas = await _escalafon.ListarAsync(Actual.Clave, Id, cancellationToken);
        if (FormularioAbierto && !EsAlta)
        {
            FilaEditando = Filas.FirstOrDefault(f => f.Clave == Editar);
        }
    }
}
