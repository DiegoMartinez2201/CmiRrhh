using System.ComponentModel.DataAnnotations;
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

    public FichaModel(IPersonalFichaService fichas)
    {
        _fichas = fichas;
    }

    [BindProperty(SupportsGet = true)]
    public int? Id { get; set; }

    [BindProperty]
    public FichaInput Input { get; set; } = new();

    public FichaCatalogos Catalogos { get; private set; } = new();

    public IReadOnlyList<string> Errores { get; private set; } = Array.Empty<string>();

    [TempData]
    public string? MensajeExito { get; set; }

    public bool EsEdicion => Id is not null;

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
        Catalogos = await _fichas.CatalogosAsync(ficha.Year, cancellationToken);
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
            ficha.Foto = actual.Foto;
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
