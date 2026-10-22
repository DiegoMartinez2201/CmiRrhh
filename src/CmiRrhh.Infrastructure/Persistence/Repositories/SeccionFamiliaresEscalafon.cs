using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

/// <summary>
/// Pestaña Familiares de la ficha escalafonaria. Cada familiar vive en dos tablas: Persona (nombres, documento,
/// fecha de nacimiento, domicilio, teléfono) y Familiar (parentesco y datos propios de la relación). Al agregar,
/// EF inserta ambas filas en la misma transacción; al eliminar se quita la relación Familiar y la Persona se
/// conserva (otras tablas, como los asegurados, pueden referenciarla).
/// </summary>
public static class SeccionFamiliaresEscalafon
{
    private const string Masculino = "1";
    private const string Femenino = "2";

    private static CampoEscalafonEf<Familiar> CampoPersona(
        string clave, string etiqueta, int max, Func<Persona, string?> leer, Action<Persona, string?> escribir,
        bool requerido = false, bool enLista = false)
        => new(
            new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Texto, max, Requerido: requerido, EnLista: enLista),
            e => leer(e.IdPersonaNavigation),
            (e, v) => escribir(e.IdPersonaNavigation, v));

    private static CampoEscalafonEf<Familiar> OpcionFamiliar(
        string clave, string etiqueta, Func<Familiar, int?> leer, Action<Familiar, int?> escribir,
        bool requerido = false, bool enLista = false)
        => new(
            new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Opcion, Requerido: requerido, EnLista: enLista),
            e => leer(e)?.ToString(CultureInfo.InvariantCulture),
            (e, v) => escribir(e, ValoresEscalafon.AEntero(v)));

    public static IServiceCollection AddSeccionFamiliares(this IServiceCollection services)
    {
        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<Familiar>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<Familiar>
            {
                Clave = "familiares",
                Titulo = "Familiares",
                Campos = new[]
                {
                    OpcionFamiliar("tipoDoc", "Tipo de documento", e => e.IdPersonaNavigation.TipoDocId, (e, v) => e.IdPersonaNavigation.TipoDocId = v),
                    CampoPersona("numDoc", "N° de documento", 12, p => p.NumDocId, (p, v) => p.NumDocId = v),
                    CampoPersona("apellidoPaterno", "Apellido paterno", 30, p => p.ApellidoPaterno, (p, v) => p.ApellidoPaterno = v, requerido: true, enLista: true),
                    CampoPersona("apellidoMaterno", "Apellido materno", 30, p => p.ApellidoMaterno, (p, v) => p.ApellidoMaterno = v, enLista: true),
                    CampoPersona("nombres", "Nombres", 100, p => p.Nombres, (p, v) => p.Nombres = v, requerido: true, enLista: true),
                    OpcionFamiliar("parentesco", "Parentesco", e => e.IdTipoFam, (e, v) => e.IdTipoFam = v, requerido: true, enLista: true),
                    new CampoEscalafonEf<Familiar>(
                        new CampoEscalafon("fechaNacimiento", "Fecha de nacimiento", TipoCampoEscalafon.Fecha, Requerido: false, EnLista: true),
                        e => ValoresEscalafon.Texto(e.IdPersonaNavigation.FechaNacimiento),
                        (e, v) => e.IdPersonaNavigation.FechaNacimiento = ValoresEscalafon.AFecha(v)),
                    new CampoEscalafonEf<Familiar>(
                        new CampoEscalafon("sexo", "Sexo", TipoCampoEscalafon.Opcion, Requerido: false, EnLista: true),
                        e => (e.FamSexo ?? string.Empty).Trim().ToUpperInvariant() switch { "M" => Masculino, "F" => Femenino, _ => null },
                        (e, v) => e.FamSexo = v switch { Masculino => "M", Femenino => "F", _ => null }),
                    OpcionFamiliar("tipoSangre", "Tipo de sangre", e => e.IdTipoSangre, (e, v) => e.IdTipoSangre = v),
                    OpcionFamiliar("estadoCivil", "Estado civil", e => e.IdEstadoCivil, (e, v) => e.IdEstadoCivil = v),
                    OpcionFamiliar("discapacidad", "Discapacidad", e => e.IdDiscapacidad, (e, v) => e.IdDiscapacidad = v),
                    new CampoEscalafonEf<Familiar>(
                        new CampoEscalafon("viveCasa", "Vive en casa", TipoCampoEscalafon.SiNo, EnLista: true),
                        e => ValoresEscalafon.Texto(e.ViveCasa), (e, v) => e.ViveCasa = v == "1"),
                    CampoPersona("direccion", "Domicilio actual", 100, p => p.Direccion, (p, v) => p.Direccion = v),
                    CampoPersona("telefono", "Teléfono", 15, p => p.Telefono, (p, v) => p.Telefono = v),
                    new CampoEscalafonEf<Familiar>(
                        new CampoEscalafon("autogenerado", "N° autogenerado", TipoCampoEscalafon.Texto, 15, Requerido: false),
                        e => e.NumAutogenSalud, (e, v) => e.NumAutogenSalud = v),
                    new CampoEscalafonEf<Familiar>(
                        new CampoEscalafon("gradoInstruccion", "Grado de instrucción", TipoCampoEscalafon.Texto, 15, Requerido: false),
                        e => e.FamGradoInstruc, (e, v) => e.FamGradoInstruc = v),
                    new CampoEscalafonEf<Familiar>(
                        new CampoEscalafon("laboraInstitucion", "Labora en la institución", TipoCampoEscalafon.SiNo),
                        e => ValoresEscalafon.Texto(e.LaboraInstitucion), (e, v) => e.LaboraInstitucion = v == "1"),
                    new CampoEscalafonEf<Familiar>(
                        new CampoEscalafon("ocupacion", "Ocupación", TipoCampoEscalafon.Texto, 20, Requerido: false),
                        e => e.FamOcupacion, (e, v) => e.FamOcupacion = v),
                    // Estos tres los muestra el legado solo al rol Bienestar; aquí son opcionales para todos.
                    new CampoEscalafonEf<Familiar>(
                        new CampoEscalafon("lugarTrabajo", "Lugar de trabajo", TipoCampoEscalafon.Texto, 50, Requerido: false),
                        e => e.FamLugTrab, (e, v) => e.FamLugTrab = v),
                    new CampoEscalafonEf<Familiar>(
                        new CampoEscalafon("enfermedad", "Enfermedad", TipoCampoEscalafon.Texto, 200, Requerido: false),
                        e => e.Enfermedad, (e, v) => e.Enfermedad = v),
                    new CampoEscalafonEf<Familiar>(
                        new CampoEscalafon("tiempoEnfermedad", "Tiempo de enfermedad", TipoCampoEscalafon.Texto, 200, Requerido: false),
                        e => e.TiempoEnfermedad, (e, v) => e.TiempoEnfermedad = v)
                },
                Cargar = (ctx, id, ct) => ctx.Familiars.Include(f => f.IdPersonaNavigation).Where(f => f.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdPersona.ToString(CultureInfo.InvariantCulture),
                // IdPersona no es identity: el siguiente id sale del máximo de toda la tabla Persona. Como el legado,
                // el tipo de persona es siempre 'N' (natural).
                Crear = async (ctx, id, existentes, ct) => await NuevoFamiliarAsync(ctx, id, ct),
                // Como el legado: si el documento ya pertenece a una persona registrada, el familiar se enlaza a esa
                // persona en vez de crear otra.
                CrearConValores = async (ctx, id, existentes, valores, ct) =>
                {
                    var persona = await PersonaPorDocumentoAsync(ctx, valores, ct);
                    return persona is null
                        ? await NuevoFamiliarAsync(ctx, id, ct)
                        : new Familiar { IdEmpleado = id, IdPersona = persona.IdPersona, IdPersonaNavigation = persona };
                },
                ReglasBd = async (ctx, id, clave, valores, ct) =>
                {
                    if (clave is not null)
                    {
                        return null;
                    }

                    var persona = await PersonaPorDocumentoAsync(ctx, valores, ct);
                    if (persona is null)
                    {
                        return null;
                    }

                    var yaEsFamiliar = await ctx.Familiars.AsNoTracking()
                        .AnyAsync(f => f.IdEmpleado == id && f.IdPersona == persona.IdPersona, ct);
                    return yaEsFamiliar ? "Ese familiar ya está registrado para este trabajador." : null;
                },
                Ordenar = lista => lista.OrderBy(f => f.IdTipoFam).ThenBy(f => f.IdPersonaNavigation.ApellidoPaterno),
                Reglas = v =>
                {
                    var nacimiento = ValoresEscalafon.AFecha(v.GetValueOrDefault("fechaNacimiento"));
                    return nacimiento is not null && nacimiento > DateTime.Today
                        ? "La fecha de nacimiento no puede ser futura."
                        : null;
                },
                Opciones = async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
                {
                    ["tipoDoc"] = await ctx.TipoDocIds.AsNoTracking().OrderBy(x => x.TipoDocId1)
                        .Select(x => new CatalogoItem { Id = x.TipoDocId1, Nombre = x.Descripcion ?? x.TipoDocId1.ToString() }).ToListAsync(ct),
                    ["parentesco"] = await ctx.TipoFamiliars.AsNoTracking().OrderBy(x => x.IdTipoFam)
                        .Select(x => new CatalogoItem { Id = x.IdTipoFam, Nombre = x.DescripTipoFam ?? x.IdTipoFam.ToString() }).ToListAsync(ct),
                    ["sexo"] = new List<CatalogoItem>
                    {
                        new() { Id = 1, Nombre = "Masculino" },
                        new() { Id = 2, Nombre = "Femenino" }
                    },
                    ["tipoSangre"] = await ctx.TipoSangres.AsNoTracking().OrderBy(x => x.IdTipoSangre)
                        .Select(x => new CatalogoItem { Id = x.IdTipoSangre, Nombre = x.DescripTs ?? x.IdTipoSangre.ToString() }).ToListAsync(ct),
                    ["estadoCivil"] = await ctx.EstadoCivils.AsNoTracking().OrderBy(x => x.IdEstadoCivil)
                        .Select(x => new CatalogoItem { Id = x.IdEstadoCivil, Nombre = x.DescripEstCivil ?? x.IdEstadoCivil.ToString() }).ToListAsync(ct),
                    ["discapacidad"] = await ctx.Discapacidads.AsNoTracking().OrderBy(x => x.IdDiscapacidad)
                        .Select(x => new CatalogoItem { Id = x.IdDiscapacidad, Nombre = x.DescripDiscapacidad ?? x.IdDiscapacidad.ToString() }).ToListAsync(ct)
                }
            }));

        return services;
    }

    private static async Task<Familiar> NuevoFamiliarAsync(CmiDbContext ctx, int idEmpleado, CancellationToken ct)
    {
        var siguiente = ((await ctx.Personas.AsNoTracking().MaxAsync(p => (int?)p.IdPersona, ct)) ?? 0) + 1;
        return new Familiar
        {
            IdEmpleado = idEmpleado,
            IdPersona = siguiente,
            IdPersonaNavigation = new Persona
            {
                IdPersona = siguiente,
                TipoPersona = "N",
                FechaRegistro = DateTime.Today
            }
        };
    }

    /// <summary>Persona ya registrada con ese tipo y número de documento (solo si hay una y es única).</summary>
    internal static async Task<Persona?> PersonaPorDocumentoAsync(
        CmiDbContext ctx, IReadOnlyDictionary<string, string> valores, CancellationToken ct)
    {
        var numero = (valores.GetValueOrDefault("numDoc") ?? string.Empty).Trim();
        var tipo = ValoresEscalafon.AEntero(valores.GetValueOrDefault("tipoDoc"));
        if (numero.Length == 0 || tipo is null)
        {
            return null;
        }

        var coincidencias = await ctx.Personas
            .Where(p => p.NumDocId == numero && p.TipoDocId == tipo)
            .Take(2)
            .ToListAsync(ct);
        return coincidencias.Count == 1 ? coincidencias[0] : null;
    }
}
