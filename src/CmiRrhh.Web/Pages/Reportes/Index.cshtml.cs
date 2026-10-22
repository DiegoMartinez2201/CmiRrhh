using System.Text;
using CmiRrhh.Application.Reportes;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Reportes;

/// <summary>Visor de reportes de personal: parámetros, tabla imprimible y descarga CSV.</summary>
public class IndexModel : PageModel
{
    private readonly IReporteService _reportes;
    private readonly IMantenimientoCatalogoService _catalogos;
    private readonly ICatalogoService _catalogo;

    public IndexModel(IReporteService reportes, IMantenimientoCatalogoService catalogos, ICatalogoService catalogo)
    {
        _reportes = reportes;
        _catalogos = catalogos;
        _catalogo = catalogo;
    }

    [BindProperty(SupportsGet = true)]
    public string? Clave { get; set; }

    /// <summary>Valores de los parámetros, por clave (query string: P[mes]=3).</summary>
    [BindProperty(SupportsGet = true)]
    public Dictionary<string, string?> P { get; set; } = new();

    /// <summary>Solo se ejecuta el reporte cuando el usuario pulsa «Generar».</summary>
    [BindProperty(SupportsGet = true)]
    public bool Ejecutar { get; set; }

    public IReadOnlyList<DefinicionReporte> Reportes { get; private set; } = Array.Empty<DefinicionReporte>();

    public DefinicionReporte? Actual { get; private set; }

    public ReporteTabla? Tabla { get; private set; }

    public string? Error { get; private set; }

    public IReadOnlyList<CatalogoItem> Cargos { get; private set; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<CatalogoItem> TiposTrabajador { get; private set; } = Array.Empty<CatalogoItem>();

    public IReadOnlyList<CatalogoItem> TiposPermiso { get; private set; } = Array.Empty<CatalogoItem>();

    public static readonly string[] Meses =
    {
        "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio",
        "Julio", "Agosto", "Setiembre", "Octubre", "Noviembre", "Diciembre"
    };

    public async Task OnGetAsync(CancellationToken cancellationToken)
    {
        await PrepararAsync(cancellationToken);

        if (Actual is null || !Ejecutar)
        {
            return;
        }

        var r = await _reportes.EjecutarAsync(Actual.Clave, P, cancellationToken);
        Tabla = r.Tabla;
        Error = r.Error;
    }

    public async Task<IActionResult> OnGetCsvAsync(CancellationToken cancellationToken)
    {
        await PrepararAsync(cancellationToken);
        if (Actual is null)
        {
            return RedirectToPage();
        }

        var r = await _reportes.EjecutarAsync(Actual.Clave, P, cancellationToken);
        if (!r.Exitoso || r.Tabla is null)
        {
            return RedirectToPage(new { clave = Clave });
        }

        var sb = new StringBuilder();
        sb.AppendLine(string.Join(",", r.Tabla.Columnas.Select(Csv)));
        foreach (var fila in r.Tabla.Filas)
        {
            sb.AppendLine(string.Join(",", fila.Select(Csv)));
        }

        // BOM UTF-8 para que Excel respete las tildes.
        var bytes = new UTF8Encoding(true).GetPreamble().Concat(Encoding.UTF8.GetBytes(sb.ToString())).ToArray();
        return File(bytes, "text/csv", $"{Actual.Clave}-{DateTime.Today:yyyyMMdd}.csv");
    }

    private async Task PrepararAsync(CancellationToken cancellationToken)
    {
        Reportes = _reportes.Reportes();
        Actual = !string.IsNullOrEmpty(Clave) ? _reportes.Definicion(Clave) : null;

        if (Actual is null)
        {
            return;
        }

        if (Actual.Parametros.Any(p => p.Tipo == TipoParametroReporte.Cargo))
        {
            Cargos = (await _catalogos.ListarAsync("cargos", cancellationToken))
                .Select(f => new CatalogoItem { Id = f.Id, Nombre = f.Valores["cargo"] })
                .OrderBy(c => c.Nombre)
                .ToList();
        }

        if (Actual.Parametros.Any(p => p.Tipo is TipoParametroReporte.TipoTrabajador or TipoParametroReporte.TipoTrabajadorObligatorio))
        {
            TiposTrabajador = await _catalogo.ListarTiposTrabajadorAsync(cancellationToken);
        }

        if (Actual.Parametros.Any(p => p.Tipo == TipoParametroReporte.TipoPermiso))
        {
            TiposPermiso = (await _catalogos.ListarAsync("tipo-permiso", cancellationToken))
                .Select(f => new CatalogoItem { Id = f.Id, Nombre = f.Valores["descripcion"] })
                .OrderBy(c => c.Nombre)
                .ToList();
        }
    }

    private static string Csv(string valor)
        => "\"" + valor.Replace("\"", "\"\"") + "\"";
}
