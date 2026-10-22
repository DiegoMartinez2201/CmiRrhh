using System.ComponentModel.DataAnnotations;
using CmiRrhh.Application.Abstractions;
using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CmiRrhh.Web.Pages.Personal;

/// <summary>
/// Alta y edición de personal (datos básicos, complementarios y domicilio).
/// Sin id en la ruta = "Nuevo personal"; con id = "Editar personal".
/// </summary>
public class FichaModel : PageModel
{
    private readonly IPersonalFichaService _fichas;
    private readonly IProcesadorImagen _imagenes;

    public FichaModel(IPersonalFichaService fichas, IProcesadorImagen imagenes)
    {
        _fichas = fichas;
        _imagenes = imagenes;
    }

    [BindProperty(SupportsGet = true)]
    public int? Id { get; set; }

    [BindProperty]
    public FichaInput Input { get; set; } = new();

    public FichaCatalogos Catalogos { get; private set; } = new();

    public IReadOnlyList<string> Errores { get; private set; } = Array.Empty<string>();

    /// <summary>Foto nueva (opcional). Si no se envía, se conserva la existente.</summary>
    [BindProperty]
    public IFormFile? FotoArchivo { get; set; }

    public IReadOnlyList<EmpleadoAreaRow> Dependencias { get; private set; } = Array.Empty<EmpleadoAreaRow>();

    public IReadOnlyList<CatalogoItem> AreasDelAnio { get; private set; } = Array.Empty<CatalogoItem>();

    /// <summary>Año de estructura sobre el que se cambia la dependencia.</summary>
    [BindProperty(SupportsGet = true)]
    public int? AnioDependencia { get; set; }

    public bool TieneFoto { get; private set; }

    [TempData]
    public string? MensajeExito { get; set; }

    public bool EsEdicion => Id is not null;

    // Límite de lo que se sube; la foto guardada queda mucho más pequeña tras comprimirla.
    private const int MaxBytesFoto = 5 * 1_048_576;

    /// <summary>Tipo MIME según los primeros bytes (no se confía en la extensión ni en el Content-Type).</summary>
    private static string? TipoImagen(byte[] b)
    {
        if (b.Length > 3 && b[0] == 0xFF && b[1] == 0xD8) return "image/jpeg";
        if (b.Length > 8 && b[0] == 0x89 && b[1] == 0x50 && b[2] == 0x4E && b[3] == 0x47) return "image/png";
        if (b.Length > 3 && b[0] == 0x47 && b[1] == 0x49 && b[2] == 0x46) return "image/gif";
        if (b.Length > 2 && b[0] == 0x42 && b[1] == 0x4D) return "image/bmp";
        // WebP: contenedor RIFF con la marca "WEBP" en el byte 8.
        if (b.Length > 12 && b[0] == 0x52 && b[1] == 0x49 && b[2] == 0x46 && b[3] == 0x46
            && b[8] == 0x57 && b[9] == 0x45 && b[10] == 0x42 && b[11] == 0x50) return "image/webp";
        return null;
    }

    public async Task<IActionResult> OnGetFotoAsync(int id, CancellationToken cancellationToken)
    {
        var ficha = await _fichas.ObtenerAsync(id, cancellationToken);
        var tipo = ficha?.Foto is { Length: > 0 } ? TipoImagen(ficha.Foto) : null;
        return tipo is null ? NotFound() : File(ficha!.Foto!, tipo);
    }

    public async Task<IActionResult> OnPostCambiarAreaAsync(int anioArea, int idAreaNueva, CancellationToken cancellationToken)
    {
        if (Id is null)
        {
            return NotFound();
        }

        var r = await _fichas.CambiarAreaAsync(Id.Value, anioArea, idAreaNueva, cancellationToken);
        MensajeExito = r.Ok ? $"Se actualizó la dependencia del año {anioArea}." : string.Join(" ", r.Errores);
        return RedirectToPage(new { id = Id, anioDependencia = anioArea });
    }

    private async Task CargarDependenciasAsync(CancellationToken cancellationToken)
    {
        if (Id is null)
        {
            return;
        }

        Dependencias = (await _fichas.ListarDependenciasAsync(Id.Value, cancellationToken))
            .OrderByDescending(d => d.Year).ToList();
        var anio = AnioDependencia ?? Dependencias.FirstOrDefault()?.Year;
        if (anio is not null)
        {
            AnioDependencia = anio;
            AreasDelAnio = await _fichas.ListarAreasAsync(anio.Value, cancellationToken);
        }
    }

    public async Task<IActionResult> OnGetAsync(CancellationToken cancellationToken)
    {
        if (Id is null)
        {
            Input = new FichaInput { Sexo = "M" };
            Catalogos = await _fichas.CatalogosAsync(null, cancellationToken);
            Input.Year = Catalogos.Anio;
            return Page();
        }

        var ficha = await _fichas.ObtenerAsync(Id.Value, cancellationToken);
        if (ficha is null)
        {
            return NotFound();
        }

        Input = FichaInput.Desde(ficha);
        TieneFoto = ficha.Foto is { Length: > 0 };
        Catalogos = await _fichas.CatalogosAsync(ficha.Year, cancellationToken);
        await CargarDependenciasAsync(cancellationToken);
        return Page();
    }

    public async Task<IActionResult> OnPostAsync(CancellationToken cancellationToken)
    {
        var anio = Input.Year > 0 ? Input.Year : (int?)null;
        Catalogos = await _fichas.CatalogosAsync(anio, cancellationToken);

        if (!ModelState.IsValid)
        {
            Errores = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).Distinct().ToList();
            return Page();
        }

        var ficha = Input.ParaGuardar(Id);

        if (FotoArchivo is { Length: > 0 })
        {
            if (FotoArchivo.Length > MaxBytesFoto)
            {
                Errores = new[] { "La foto no debe superar 5 MB." };
                await CargarDependenciasAsync(cancellationToken);
                return Page();
            }

            using var ms = new MemoryStream();
            await FotoArchivo.CopyToAsync(ms, cancellationToken);
            // El procesador decodifica la imagen (valida que lo sea), la reduce y la comprime a WebP.
            var procesada = _imagenes.Comprimir(ms.ToArray());
            if (procesada is null)
            {
                Errores = new[] { "El archivo de la foto no es una imagen válida (use JPG, PNG, GIF, BMP o WebP)." };
                await CargarDependenciasAsync(cancellationToken);
                return Page();
            }

            ficha.Foto = procesada.Bytes;
        }

        if (Id is not null)
        {
            // La foto no se edita en este formulario: se conserva la existente para que
            // spRRHH_ActualizaEmpleado no la sobrescriba con NULL.
            var actual = await _fichas.ObtenerAsync(Id.Value, cancellationToken);
            if (actual is null)
            {
                return NotFound();
            }

            ficha.IdPersona = actual.IdPersona;
            ficha.Foto ??= actual.Foto;
        }

        try
        {
            var resultado = await _fichas.GuardarAsync(ficha, cancellationToken);
            if (!resultado.Ok)
            {
                Errores = resultado.Errores;
                return Page();
            }

            MensajeExito = EsEdicion
                ? "Los datos del personal se actualizaron correctamente."
                : $"Personal registrado correctamente con el código {resultado.IdEmpleado}.";
            return RedirectToPage(new { id = resultado.IdEmpleado });
        }
        catch (Exception ex) when (ex is not OperationCanceledException)
        {
            Errores = new[] { "No se pudo guardar: " + ex.Message };
            return Page();
        }
    }

    /// <summary>Modelo del formulario; se traduce a <see cref="EmpleadoFicha"/> al guardar.</summary>
    public sealed class FichaInput
    {
        public int Year { get; set; }
        public int TipoDocIdent { get; set; }
        public string? NumDoc { get; set; }
        public string? ApellidoPaterno { get; set; }
        public string? ApellidoMaterno { get; set; }
        public string? Nombres { get; set; }
        public string? Sexo { get; set; }

        [DataType(DataType.Date)]
        public DateTime? FechaNacimiento { get; set; }

        public string? UbigeoNac { get; set; }
        public int IdNacionalidad { get; set; }
        public int IdEstadoCivil { get; set; }
        public int IdDiscapacidad { get; set; }
        public int IdTipoSangre { get; set; }

        public string? Direccion { get; set; }
        public string? UbigeoDireccion { get; set; }
        public string? Telefono { get; set; }
        public string? FonoLab { get; set; }
        public string? FonoCel { get; set; }
        public string? FonoOtro { get; set; }
        public string? Email { get; set; }

        public int IdAreaOrganiz { get; set; }
        public int IdTipoTrabajador { get; set; }

        [DataType(DataType.Date)]
        public DateTime? FechaIngreso { get; set; }

        public string? ExpSocial { get; set; }
        public string? Brevete { get; set; }
        public string? LibretaMilitar { get; set; }
        public string? GradoInstruccion { get; set; }
        public string? NumRuc { get; set; }

        public static FichaInput Desde(EmpleadoFicha f) => new()
        {
            Year = f.Year,
            TipoDocIdent = f.TipoDocIdent,
            NumDoc = f.NumDoc,
            ApellidoPaterno = f.ApellidoPaterno,
            ApellidoMaterno = f.ApellidoMaterno,
            Nombres = f.Nombres,
            Sexo = f.Sexo?.Trim(),
            FechaNacimiento = f.FechaNacimiento == default ? null : f.FechaNacimiento,
            UbigeoNac = f.UbigeoNac?.Trim(),
            IdNacionalidad = f.IdNacionalidad,
            IdEstadoCivil = f.IdEstadoCivil,
            IdDiscapacidad = f.IdDiscapacidad,
            IdTipoSangre = f.IdTipoSangre,
            Direccion = f.Direccion,
            UbigeoDireccion = f.UbigeoDireccion?.Trim(),
            Telefono = f.Telefono,
            FonoLab = f.FonoLab,
            FonoCel = f.FonoCel,
            FonoOtro = f.FonoOtro,
            Email = f.Email,
            IdAreaOrganiz = f.IdAreaOrganiz,
            IdTipoTrabajador = f.IdTipoTrabajador,
            FechaIngreso = f.FechaIngreso == default ? null : f.FechaIngreso,
            ExpSocial = f.ExpSocial,
            Brevete = f.Brevete,
            LibretaMilitar = f.LibretaMilitar,
            GradoInstruccion = f.GradoInstruccion,
            NumRuc = f.NumRuc
        };

        public EmpleadoFicha ParaGuardar(int? idEmpleado) => new()
        {
            IdEmpleado = idEmpleado,
            Year = Year,
            TipoDocIdent = TipoDocIdent,
            NumDoc = NumDoc,
            ApellidoPaterno = ApellidoPaterno,
            ApellidoMaterno = ApellidoMaterno,
            Nombres = Nombres,
            Sexo = Sexo,
            FechaNacimiento = FechaNacimiento ?? default,
            UbigeoNac = UbigeoNac,
            IdNacionalidad = IdNacionalidad,
            IdEstadoCivil = IdEstadoCivil,
            IdDiscapacidad = IdDiscapacidad,
            IdTipoSangre = IdTipoSangre,
            Direccion = Direccion,
            UbigeoDireccion = UbigeoDireccion,
            Telefono = Telefono,
            FonoLab = FonoLab,
            FonoCel = FonoCel,
            FonoOtro = FonoOtro,
            Email = Email,
            IdAreaOrganiz = IdAreaOrganiz,
            IdTipoTrabajador = IdTipoTrabajador,
            FechaIngreso = FechaIngreso ?? default,
            ExpSocial = ExpSocial,
            Brevete = Brevete,
            LibretaMilitar = LibretaMilitar,
            GradoInstruccion = GradoInstruccion,
            NumRuc = NumRuc
        };
    }
}
