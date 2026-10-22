using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public interface IFichaImpresaService
{
    /// <summary>Bloques I a IV de la ficha escalafonaria impresa, con las etiquetas del sistema legado.</summary>
    Task<IReadOnlyList<BloqueFicha>> ObtenerBloquesAsync(int idEmpleado, CancellationToken cancellationToken = default);
}

/// <summary>Arma los bloques de la ficha impresa a partir de los datos del repositorio; no accede a la base de datos.</summary>
public sealed class FichaImpresaService : IFichaImpresaService
{
    private readonly IFichaImpresaRepository _repositorio;

    public FichaImpresaService(IFichaImpresaRepository repositorio)
    {
        _repositorio = repositorio;
    }

    public async Task<IReadOnlyList<BloqueFicha>> ObtenerBloquesAsync(int idEmpleado, CancellationToken cancellationToken = default)
    {
        var d = await _repositorio.ObtenerAsync(idEmpleado, cancellationToken);
        var p = d.Personales;
        var l = d.Laborales;

        string P(string col) => p.TryGetValue(col, out var v) ? v : string.Empty;
        string L(string col) => l.TryGetValue(col, out var v) ? v : string.Empty;
        static string Unir(params string[] partes) => string.Join(" ", partes.Where(x => !string.IsNullOrWhiteSpace(x)));
        static string Lista(params string[] partes) => string.Join(" / ", partes.Where(x => !string.IsNullOrWhiteSpace(x)));

        var familiares = new TablaFicha(
            "4.5 Composición familiar",
            new[] { "Nombres y apellidos", "Edad", "Sexo", "Parentesco", "Grado de inst.", "E. civil", "Vive en casa", "Lab. instit." },
            d.Familiares.Select(f => (IReadOnlyList<string>)new[]
            {
                Dato(f, "NombresFamilia"), Dato(f, "edadFamiliar"), Dato(f, "FamSexo"), Dato(f, "DescripTipoFam"),
                Dato(f, "FamGradoInstruc"), Dato(f, "DescripEstCivil"), Dato(f, "ViveCasa"), Dato(f, "LaboraInstitucion")
            }).ToList());

        return new[]
        {
            new BloqueFicha("I. Identificación", false, new[]
            {
                new CampoFicha("Cód. sistema", P("idempleado")),
                new CampoFicha("Fecha de inscrip.", P("FechaRegistro"))
            }),
            new BloqueFicha("II. Datos personales del trabajador", false, new[]
            {
                new CampoFicha("Apellido paterno", P("Apellido_Paterno")),
                new CampoFicha("Apellido materno", P("Apellido_Materno")),
                new CampoFicha("Nombres", P("Nombres")),
                new CampoFicha("Documento de identidad", Unir(P("TipoDoc"), P("NumDocId"))),
                new CampoFicha("Edad", P("edadEmpleado")),
                new CampoFicha("Sexo", P("sexo")),
                new CampoFicha("N.º libreta militar", P("NumLibretaMilitar")),
                new CampoFicha("N.º RUC", P("NumRUC")),
                new CampoFicha("N.º de brevete", P("brevete")),
                new CampoFicha("Grupo sanguíneo", P("DescripTS")),
                new CampoFicha("Nacionalidad", P("Nacionalidad")),
                new CampoFicha("Fecha de nac.", P("FechaNacimiento")),
                new CampoFicha("Lugar de nacimiento", Lista(P("desdistrito"), P("desprovincia"), P("desdepartamento"))),
                new CampoFicha("Teléfono (domicilio)", P("Telefono")),
                new CampoFicha("Teléfono (centro laboral)", P("FonoCentroLab")),
                new CampoFicha("Celular", P("NumCelular")),
                new CampoFicha("Otro", P("Fax")),
                new CampoFicha("Estado civil", P("EstadoCivil")),
                new CampoFicha("Discapacidad", P("Discapacidad")),
                new CampoFicha("Grado de instrucción", P("gradoInstruccion")),
                new CampoFicha("Dirección", P("direccion")),
                new CampoFicha("Domicilio (distrito / provincia / departamento)", Lista(P("DistCasa"), P("ProvCasa"), P("depCasa")))
            }),
            new BloqueFicha("III. Aspecto laboral del trabajador", false, new[]
            {
                new CampoFicha("Lugar de trabajo", L("AreaOrganizacional")),
                new CampoFicha("Condición laboral", L("CondicionLab")),
                new CampoFicha("Profesión u ocupación", L("profesion")),
                new CampoFicha("Cargo que desempeña o labor que realiza", L("cargo")),
                new CampoFicha("N.º autogenerado de salud", L("NumAutogenSalud")),
                new CampoFicha("Reg. pensión", L("LeyRegimen")),
                new CampoFicha("AFP", L("DescripAFP")),
                new CampoFicha("Fecha inscrip. AFP", L("FechaAFP")),
                new CampoFicha("Núm. CUSPP", L("NroAFP"))
            }),
            new BloqueFicha("Para el personal activo", true, new[]
            {
                new CampoFicha("N.º resolución de ingreso al Estado", L("NumResoIngreEsta")),
                new CampoFicha("Fecha de ingreso al Estado", L("FechaIngreEstado")),
                new CampoFicha("N.º resolución de ingreso a la institución", L("NumResoIngreInstitu"))
            }),
            new BloqueFicha("Para el personal pensionista", true, new[]
            {
                new CampoFicha("N.º resolución de incorporación a la 20530", L("NumResol20530")),
                new CampoFicha("Fecha de incorporación a la 20530", L("FechaResol20530")),
                new CampoFicha("N.º resolución de cese", L("NumResolCese")),
                new CampoFicha("Fecha de cese", L("FechaResolCese")),
                new CampoFicha("N.º resolución de pensionista mensual - cesantía", L("NumResolPenMen")),
                new CampoFicha("Fecha de pensión mensual - cesantía", L("FechaResolPenMen"))
            }),
            new BloqueFicha("IV. Aspecto socio-familiar del trabajador", false, new[]
            {
                new CampoFicha("¿Con quién vives actualmente?", P("Descripvivecon")),
                new CampoFicha("¿Eres jefe de hogar?", P("JefeHogar")),
                new CampoFicha("Carga familiar", P("CargaFam")),
                new CampoFicha("Hijos", P("Numhijos")),
                new CampoFicha("Observaciones", P("ObsFam"))
            }, familiares)
        };
    }

    private static string Dato(IReadOnlyDictionary<string, string> fila, string columna)
        => fila.TryGetValue(columna, out var v) ? v : string.Empty;
}
