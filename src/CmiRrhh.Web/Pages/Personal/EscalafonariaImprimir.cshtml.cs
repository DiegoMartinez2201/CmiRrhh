using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Personal;

/// <summary>Versión imprimible de la ficha escalafonaria: datos del trabajador y todas sus secciones.</summary>
public class EscalafonariaImprimirModel : PageModel
{
    private readonly IEscalafonService _escalafon;
    private readonly IPersonalFichaService _fichas;
    private readonly IFichaImpresaService _impresa;

    public EscalafonariaImprimirModel(IEscalafonService escalafon, IPersonalFichaService fichas, IFichaImpresaService impresa)
    {
        _escalafon = escalafon;
        _fichas = fichas;
        _impresa = impresa;
    }

    [BindProperty(SupportsGet = true)]
    public int Id { get; set; }

    public EmpleadoFicha? Empleado { get; private set; }

    /// <summary>Bloques I a IV (identificación, datos personales, aspecto laboral y socio-familiar).</summary>
    public IReadOnlyList<BloqueFicha> Bloques { get; private set; } = Array.Empty<BloqueFicha>();

    /// <summary>Cada sección con sus registros, en el orden de las pestañas.</summary>
    public IReadOnlyList<(DefinicionSeccionEscalafon Seccion, IReadOnlyList<FilaEscalafon> Filas)> Secciones { get; private set; }
        = Array.Empty<(DefinicionSeccionEscalafon, IReadOnlyList<FilaEscalafon>)>();

    public string NombreEmpleado
        => Empleado is null
            ? string.Empty
            : $"{Empleado.ApellidoPaterno} {Empleado.ApellidoMaterno}, {Empleado.Nombres}".Trim();

    public async Task<IActionResult> OnGetAsync(CancellationToken cancellationToken)
    {
        Empleado = await _fichas.ObtenerAsync(Id, cancellationToken);
        if (Empleado is null)
        {
            return NotFound();
        }

        Bloques = await _impresa.ObtenerBloquesAsync(Id, cancellationToken);

        var lista = new List<(DefinicionSeccionEscalafon, IReadOnlyList<FilaEscalafon>)>();
        foreach (var seccion in _escalafon.Secciones().Where(s => !s.RegistroUnico))
        {
            lista.Add((seccion, await _escalafon.ListarAsync(seccion.Clave, Id, cancellationToken)));
        }

        Secciones = lista;
        return Page();
    }
}
