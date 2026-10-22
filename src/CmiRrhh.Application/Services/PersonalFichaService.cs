using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

/// <summary>Resultado de guardar una ficha: éxito con el código, o la lista de errores de validación.</summary>
public sealed record ResultadoGuardadoFicha(bool Ok, int? IdEmpleado, IReadOnlyList<string> Errores)
{
    public static ResultadoGuardadoFicha Exito(int idEmpleado) => new(true, idEmpleado, Array.Empty<string>());

    public static ResultadoGuardadoFicha Fallo(IReadOnlyList<string> errores) => new(false, null, errores);
}

public interface IPersonalFichaService
{
    Task<EmpleadoFicha?> ObtenerAsync(int idEmpleado, CancellationToken cancellationToken = default);

    Task<FichaCatalogos> CatalogosAsync(int? anioEstructura, CancellationToken cancellationToken = default);

    /// <summary>Valida y guarda: alta si <c>IdEmpleado</c> es null, edición en caso contrario.</summary>
    Task<ResultadoGuardadoFicha> GuardarAsync(EmpleadoFicha ficha, CancellationToken cancellationToken = default);

    /// <summary>Dependencias (área por año) del empleado.</summary>
    Task<IReadOnlyList<EmpleadoAreaRow>> ListarDependenciasAsync(int idEmpleado, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<CatalogoItem>> ListarAreasAsync(int anio, CancellationToken cancellationToken = default);

    /// <summary>Cambia el área del empleado en un año de la estructura organizacional.</summary>
    Task<ResultadoGuardadoFicha> CambiarAreaAsync(int idEmpleado, int anio, int idArea, CancellationToken cancellationToken = default);
}

public sealed class PersonalFichaService : IPersonalFichaService
{
    private static readonly DateTime FechaMinimaSql = new(1900, 1, 1);
    private static readonly DateTime FechaMaximaSmallDateTime = new(2079, 6, 6);

    private readonly IFichaPersonalRepository _fichas;
    private readonly IEmpleadoRepository _empleados;

    public PersonalFichaService(IFichaPersonalRepository fichas, IEmpleadoRepository empleados)
    {
        _fichas = fichas;
        _empleados = empleados;
    }

    public Task<EmpleadoFicha?> ObtenerAsync(int idEmpleado, CancellationToken cancellationToken = default)
        => _fichas.ObtenerAsync(idEmpleado, cancellationToken);

    public Task<FichaCatalogos> CatalogosAsync(int? anioEstructura, CancellationToken cancellationToken = default)
        => _fichas.CargarCatalogosAsync(anioEstructura, cancellationToken);

    public async Task<ResultadoGuardadoFicha> GuardarAsync(EmpleadoFicha ficha, CancellationToken cancellationToken = default)
    {
        Normalizar(ficha);

        var errores = Validar(ficha);
        if (errores.Count > 0)
        {
            return ResultadoGuardadoFicha.Fallo(errores);
        }

        // Regla del legado: "Verifique el DNI, Ya existe ese Número".
        if (await _fichas.ExisteDocumentoAsync(ficha.TipoDocIdent, ficha.NumDoc!, ficha.IdPersona, cancellationToken))
        {
            return ResultadoGuardadoFicha.Fallo(new[] { "Verifique el DNI: ya existe una persona registrada con ese número de documento." });
        }

        if (ficha.IdEmpleado is null)
        {
            var nuevoId = await _empleados.IngresarEmpleadoAsync(ficha, cancellationToken);
            return ResultadoGuardadoFicha.Exito(nuevoId);
        }

        await _empleados.ActualizarEmpleadoAsync(ficha, cancellationToken);
        return ResultadoGuardadoFicha.Exito(ficha.IdEmpleado.Value);
    }

    public Task<IReadOnlyList<EmpleadoAreaRow>> ListarDependenciasAsync(int idEmpleado, CancellationToken cancellationToken = default)
        => _empleados.ListarEmpleadoAreasAsync(idEmpleado, cancellationToken);

    public Task<IReadOnlyList<CatalogoItem>> ListarAreasAsync(int anio, CancellationToken cancellationToken = default)
        => _fichas.ListarAreasAsync(anio, cancellationToken);

    public async Task<ResultadoGuardadoFicha> CambiarAreaAsync(
        int idEmpleado, int anio, int idArea, CancellationToken cancellationToken = default)
    {
        if (idArea <= 0)
        {
            return ResultadoGuardadoFicha.Fallo(new[] { "Seleccione el área nueva." });
        }

        var areas = await _fichas.ListarAreasAsync(anio, cancellationToken);
        if (areas.All(a => a.Id != idArea))
        {
            return ResultadoGuardadoFicha.Fallo(new[] { $"El área seleccionada no existe en la estructura {anio}." });
        }

        var actuales = await _empleados.ListarEmpleadoAreasAsync(idEmpleado, cancellationToken);
        if (actuales.All(a => a.Year != anio))
        {
            return ResultadoGuardadoFicha.Fallo(new[] { $"El empleado no tiene una dependencia registrada en el año {anio}." });
        }

        await _empleados.ActualizarAreaEmpleadoAsync(idEmpleado, anio, idArea, cancellationToken);
        return ResultadoGuardadoFicha.Exito(idEmpleado);
    }

    private static void Normalizar(EmpleadoFicha f)
    {
        f.NumDoc = f.NumDoc?.Trim();
        f.ApellidoPaterno = f.ApellidoPaterno?.Trim();
        f.ApellidoMaterno = f.ApellidoMaterno?.Trim();
        f.Nombres = f.Nombres?.Trim();
        f.Direccion = f.Direccion?.Trim();
        f.Email = f.Email?.Trim();
        f.Sexo = f.Sexo?.Trim().ToUpperInvariant();
        // Los parámetros del procedimiento almacenado no aceptan NULL en estos campos de texto.
        f.ApellidoMaterno ??= string.Empty;
        f.Direccion ??= string.Empty;
        f.Telefono = f.Telefono?.Trim() ?? string.Empty;
        f.FonoLab = f.FonoLab?.Trim() ?? string.Empty;
        f.FonoCel = f.FonoCel?.Trim() ?? string.Empty;
        f.FonoOtro = f.FonoOtro?.Trim() ?? string.Empty;
        f.Email ??= string.Empty;
        f.ExpSocial = f.ExpSocial?.Trim() ?? string.Empty;
        f.Brevete = f.Brevete?.Trim() ?? string.Empty;
        f.LibretaMilitar = f.LibretaMilitar?.Trim() ?? string.Empty;
        f.GradoInstruccion = f.GradoInstruccion?.Trim() ?? string.Empty;
        f.NumRuc = f.NumRuc?.Trim() ?? string.Empty;
    }

    private static List<string> Validar(EmpleadoFicha f)
    {
        var e = new List<string>();

        if (f.TipoDocIdent <= 0) e.Add("Seleccione el tipo de documento.");
        if (string.IsNullOrWhiteSpace(f.NumDoc)) e.Add("Ingrese el número de documento.");
        else if (f.NumDoc.Length > 12 || !f.NumDoc.All(char.IsLetterOrDigit))
            e.Add("El número de documento debe ser alfanumérico y de hasta 12 caracteres.");

        if (string.IsNullOrWhiteSpace(f.ApellidoPaterno)) e.Add("Ingrese el apellido paterno.");
        if (string.IsNullOrWhiteSpace(f.Nombres)) e.Add("Ingrese los nombres.");
        if (f.Sexo is not ("M" or "F")) e.Add("Seleccione el sexo.");

        if (f.FechaNacimiento < FechaMinimaSql || f.FechaNacimiento >= DateTime.Today)
            e.Add("La fecha de nacimiento no es válida.");
        if (f.FechaIngreso < FechaMinimaSql || f.FechaIngreso > FechaMaximaSmallDateTime)
            e.Add("La fecha de ingreso no es válida.");
        else if (f.FechaNacimiento >= FechaMinimaSql && f.FechaIngreso <= f.FechaNacimiento)
            e.Add("La fecha de ingreso debe ser posterior a la de nacimiento.");

        if (f.IdNacionalidad <= 0) e.Add("Seleccione la nacionalidad.");
        if (f.IdEstadoCivil <= 0) e.Add("Seleccione el estado civil.");
        if (f.IdTipoSangre <= 0) e.Add("Seleccione el grupo sanguíneo.");
        if (f.IdTipoTrabajador <= 0) e.Add("Seleccione el tipo de trabajador.");
        if (f.IdAreaOrganiz <= 0) e.Add("Seleccione el área organizacional.");
        if (string.IsNullOrWhiteSpace(f.UbigeoNac)) e.Add("Seleccione el lugar de nacimiento.");
        if (string.IsNullOrWhiteSpace(f.UbigeoDireccion)) e.Add("Seleccione el distrito del domicilio.");

        if (!string.IsNullOrEmpty(f.Email) && !f.Email.Contains('@'))
            e.Add("El correo electrónico no es válido.");

        Limite(e, f.ApellidoPaterno, 30, "El apellido paterno");
        Limite(e, f.ApellidoMaterno, 30, "El apellido materno");
        Limite(e, f.Nombres, 100, "Los nombres");
        Limite(e, f.Direccion, 100, "La dirección");
        Limite(e, f.Email, 50, "El correo");
        Limite(e, f.Telefono, 15, "El teléfono");
        Limite(e, f.FonoLab, 15, "El teléfono laboral");
        Limite(e, f.FonoCel, 15, "El celular");
        Limite(e, f.FonoOtro, 15, "El otro teléfono");
        Limite(e, f.ExpSocial, 20, "La experiencia social");
        Limite(e, f.Brevete, 12, "El brevete");
        Limite(e, f.LibretaMilitar, 10, "La libreta militar");
        Limite(e, f.GradoInstruccion, 80, "El grado de instrucción");
        Limite(e, f.NumRuc, 12, "El RUC");

        return e;
    }

    private static void Limite(List<string> errores, string? valor, int max, string campo)
    {
        if (valor is not null && valor.Length > max)
        {
            errores.Add($"{campo} no puede superar {max} caracteres.");
        }
    }
}
