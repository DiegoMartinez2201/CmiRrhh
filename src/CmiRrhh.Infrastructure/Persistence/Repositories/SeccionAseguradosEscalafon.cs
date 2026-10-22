using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

/// <summary>
/// Pestaña «Registro de asegurados» (tabla RRHH_Asegurado + Persona). Reglas del legado (FrmRegistroAsegurado):
/// el N.º de partida es de la partida de matrimonio para el cónyuge y la resolución de mayor de edad con
/// discapacidad para el hijo; solo el hijo tiene «reevaluar» (2, 3 o 5 años); el motivo de baja 2 guarda el N.º de
/// partida de defunción y el 5 «otros motivos». Los datos de la persona solo se indican al registrar. Los
/// asegurados no se eliminan: se les da de baja con su motivo y fecha.
/// </summary>
public static class SeccionAseguradosEscalafon
{
    private static readonly string[] Vinculos = { "Conyuge", "Concubino", "Gestante", "Hijo" };
    private static readonly string[] NombresVinculo = { "Cónyuge", "Concubino(a)", "Gestante", "Hijo(a)" };
    private const string Hijo = "Hijo";
    private const string Conyuge = "Conyuge";
    private const int BajaPorDefuncion = 2;
    private const int BajaOtrosMotivos = 5;

    private static CampoEscalafonEf<RrhhAsegurado> CampoPersona(
        string clave, string etiqueta, int max, Func<Persona, string?> leer, Action<Persona, string?> escribir,
        bool requerido = false, bool enLista = false)
        => new(
            new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Texto, max, Requerido: requerido, SoloAlta: true, EnLista: enLista),
            e => leer(e.IdPersonaNavigation!),
            (e, v) => escribir(e.IdPersonaNavigation!, v));

    private static CampoEscalafonEf<RrhhAsegurado> Opcion(
        string clave, string etiqueta, Func<RrhhAsegurado, string?> leer, Action<RrhhAsegurado, string?> escribir,
        bool requerido = false, bool soloAlta = false, bool enLista = false)
        => new(
            new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Opcion, Requerido: requerido, SoloAlta: soloAlta, EnLista: enLista),
            leer, escribir);

    private static CampoEscalafonEf<RrhhAsegurado> Fecha(
        string clave, string etiqueta, Func<RrhhAsegurado, DateTime?> leer, Action<RrhhAsegurado, DateTime?> escribir,
        bool requerido = false, bool soloAlta = false, bool enLista = false)
        => new(
            new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Fecha, Requerido: requerido, SoloAlta: soloAlta, EnLista: enLista),
            e => ValoresEscalafon.Texto(leer(e)), (e, v) => escribir(e, ValoresEscalafon.AFecha(v)));

    private static string? Vinculo(RrhhAsegurado e)
    {
        var i = Array.IndexOf(Vinculos, (e.VinculoFamiliar ?? string.Empty).Trim());
        return i < 0 ? null : (i + 1).ToString(CultureInfo.InvariantCulture);
    }

    private static string? VinculoDe(IReadOnlyDictionary<string, string> valores)
    {
        var i = ValoresEscalafon.AEntero(valores.GetValueOrDefault("vinculo"));
        return i is >= 1 && i <= Vinculos.Length ? Vinculos[i.Value - 1] : null;
    }

    public static IServiceCollection AddSeccionAsegurados(this IServiceCollection services)
    {
        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<RrhhAsegurado>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<RrhhAsegurado>
            {
                Clave = "asegurados",
                Titulo = "Asegurados",
                PermiteEliminar = false,
                Campos = new[]
                {
                    Opcion("tipoDoc", "Tipo de documento",
                        e => e.IdPersonaNavigation!.TipoDocId?.ToString(CultureInfo.InvariantCulture),
                        (e, v) => e.IdPersonaNavigation!.TipoDocId = ValoresEscalafon.AEntero(v), requerido: true, soloAlta: true),
                    CampoPersona("numDoc", "N° de documento de identidad", 12, p => p.NumDocId, (p, v) => p.NumDocId = v, requerido: true),
                    CampoPersona("apellidoPaterno", "Apellido paterno", 30, p => p.ApellidoPaterno, (p, v) => p.ApellidoPaterno = v,
                        requerido: true, enLista: true),
                    CampoPersona("apellidoMaterno", "Apellido materno", 30, p => p.ApellidoMaterno, (p, v) => p.ApellidoMaterno = v, enLista: true),
                    CampoPersona("nombres", "Nombres", 100, p => p.Nombres, (p, v) => p.Nombres = v, requerido: true, enLista: true),
                    new CampoEscalafonEf<RrhhAsegurado>(
                        new CampoEscalafon("fechaNacimiento", "Fecha de nacimiento", TipoCampoEscalafon.Fecha, Requerido: false, SoloAlta: true, EnLista: false),
                        e => ValoresEscalafon.Texto(e.IdPersonaNavigation!.FechaNacimiento),
                        (e, v) => e.IdPersonaNavigation!.FechaNacimiento = ValoresEscalafon.AFecha(v)),
                    CampoPersona("direccion", "Dirección", 100, p => p.Direccion, (p, v) => p.Direccion = v),

                    Opcion("sexo", "Sexo",
                        e => (e.Sexo ?? string.Empty).Trim().ToUpperInvariant() switch { "M" => "1", "F" => "2", _ => null },
                        (e, v) => e.Sexo = v switch { "1" => "M", "2" => "F", _ => null }, requerido: true),
                    Opcion("estadoCivil", "Estado civil",
                        e => e.IdEstadoCivil?.ToString(CultureInfo.InvariantCulture),
                        (e, v) => e.IdEstadoCivil = ValoresEscalafon.AEntero(v), requerido: true),
                    Opcion("vinculo", "Vínculo familiar", Vinculo, (e, v) => { }, requerido: true, enLista: true),

                    // Campos que dependen del vínculo y del motivo de baja: se asignan en Normalizar.
                    new CampoEscalafonEf<RrhhAsegurado>(
                        new CampoEscalafon("nroPartida", "N.º de partida (cónyuge) o de resolución (hijo mayor con discapacidad)",
                            TipoCampoEscalafon.Texto, 50, Requerido: false, EnLista: false),
                        e => (e.VinculoFamiliar ?? string.Empty).Trim() switch
                        {
                            Hijo => e.NroResolMayorIndiscap,
                            Conyuge => e.NroPartida,
                            _ => null
                        },
                        (e, v) => { }),
                    Opcion("reevaluar", "Reevaluar (solo hijo)", e => (e.Reevaluar ?? string.Empty).Trim() is { Length: > 0 } r ? r : null,
                        (e, v) => e.Reevaluar = v),
                    Fecha("inicioVinculo", "Inicio del vínculo", e => e.FechaInicioVinculo, (e, v) => e.FechaInicioVinculo = v,
                        requerido: true, enLista: true),
                    Opcion("motivoBaja", "Motivo de baja",
                        e => e.IdMotivoBaja?.ToString(CultureInfo.InvariantCulture),
                        (e, v) => e.IdMotivoBaja = ValoresEscalafon.AEntero(v), enLista: true),
                    Fecha("finVinculo", "Fin del vínculo", e => e.FechaFinVinculo, (e, v) => e.FechaFinVinculo = v, enLista: true),
                    new CampoEscalafonEf<RrhhAsegurado>(
                        new CampoEscalafon("detalleBaja", "N.º de partida de defunción u otros motivos (según el motivo de baja)",
                            TipoCampoEscalafon.Texto, 50, Requerido: false, EnLista: false),
                        e => e.IdMotivoBaja switch
                        {
                            BajaPorDefuncion => e.NroPartidaDef,
                            BajaOtrosMotivos => e.OtrosMotivos,
                            _ => null
                        },
                        (e, v) => { })
                },
                Cargar = (ctx, id, ct) => ctx.RrhhAsegurados.Include(a => a.IdPersonaNavigation).Where(a => a.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.NroBeneficiario.ToString(CultureInfo.InvariantCulture),
                Crear = (ctx, id, existentes, ct) => throw new InvalidOperationException("Use CrearConValores."),
                // Como el legado: si el documento ya pertenece a una persona registrada, se enlaza a ella.
                CrearConValores = async (ctx, id, existentes, valores, ct) =>
                {
                    var persona = await SeccionFamiliaresEscalafon.PersonaPorDocumentoAsync(ctx, valores, ct);
                    if (persona is null)
                    {
                        var siguiente = ((await ctx.Personas.AsNoTracking().MaxAsync(p => (int?)p.IdPersona, ct)) ?? 0) + 1;
                        persona = new Persona { IdPersona = siguiente, TipoPersona = "N", FechaRegistro = DateTime.Today };
                    }

                    return new RrhhAsegurado
                    {
                        IdEmpleado = id,
                        NroBeneficiario = existentes.Select(a => a.NroBeneficiario).DefaultIfEmpty(0).Max() + 1,
                        IdPersona = persona.IdPersona,
                        IdPersonaNavigation = persona
                    };
                },
                ReglasBd = async (ctx, id, clave, valores, ct) =>
                {
                    if (clave is not null)
                    {
                        return null;
                    }

                    var persona = await SeccionFamiliaresEscalafon.PersonaPorDocumentoAsync(ctx, valores, ct);
                    if (persona is null)
                    {
                        return null;
                    }

                    var yaRegistrado = await ctx.RrhhAsegurados.AsNoTracking()
                        .AnyAsync(a => a.IdEmpleado == id && a.IdPersona == persona.IdPersona, ct);
                    return yaRegistrado ? "Ese asegurado ya está registrado para este trabajador." : null;
                },
                Ordenar = lista => lista.OrderBy(a => a.NroBeneficiario),
                Normalizar = (e, valores) =>
                {
                    e.VinculoFamiliar = VinculoDe(valores);
                    var numero = valores.GetValueOrDefault("nroPartida");
                    numero = string.IsNullOrWhiteSpace(numero) ? null : numero.Trim();

                    // Solo el hijo guarda resolución y «reevaluar»; solo el cónyuge guarda partida.
                    e.NroResolMayorIndiscap = e.VinculoFamiliar == Hijo ? numero : null;
                    e.NroPartida = e.VinculoFamiliar == Conyuge ? numero : null;
                    if (e.VinculoFamiliar != Hijo)
                    {
                        e.Reevaluar = null;
                    }

                    // Sin motivo de baja no hay fecha de fin ni detalle.
                    var detalle = valores.GetValueOrDefault("detalleBaja");
                    detalle = string.IsNullOrWhiteSpace(detalle) ? null : detalle.Trim();
                    if (e.IdMotivoBaja is null)
                    {
                        e.FechaFinVinculo = null;
                    }

                    e.NroPartidaDef = e.IdMotivoBaja == BajaPorDefuncion ? detalle : null;
                    e.OtrosMotivos = e.IdMotivoBaja == BajaOtrosMotivos ? detalle : null;
                },
                Reglas = v =>
                {
                    var nacimiento = ValoresEscalafon.AFecha(v.GetValueOrDefault("fechaNacimiento"));
                    if (nacimiento is not null && nacimiento > DateTime.Today)
                    {
                        return "La fecha de nacimiento no puede ser futura.";
                    }

                    var inicio = ValoresEscalafon.AFecha(v.GetValueOrDefault("inicioVinculo"));
                    var fin = ValoresEscalafon.AFecha(v.GetValueOrDefault("finVinculo"));
                    var motivo = v.GetValueOrDefault("motivoBaja");
                    if (!string.IsNullOrEmpty(motivo) && fin is null)
                    {
                        return "Indique el fin del vínculo cuando hay un motivo de baja.";
                    }

                    return inicio is not null && fin is not null && fin < inicio
                        ? "El fin del vínculo no puede ser anterior a su inicio."
                        : null;
                },
                Opciones = async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
                {
                    ["tipoDoc"] = await ctx.TipoDocIds.AsNoTracking().OrderBy(x => x.TipoDocId1)
                        .Select(x => new CatalogoItem { Id = x.TipoDocId1, Nombre = x.Descripcion ?? x.TipoDocId1.ToString() }).ToListAsync(ct),
                    ["sexo"] = new List<CatalogoItem>
                    {
                        new() { Id = 1, Nombre = "Masculino" },
                        new() { Id = 2, Nombre = "Femenino" }
                    },
                    ["estadoCivil"] = await ctx.EstadoCivils.AsNoTracking().OrderBy(x => x.IdEstadoCivil)
                        .Select(x => new CatalogoItem { Id = x.IdEstadoCivil, Nombre = x.DescripEstCivil ?? x.IdEstadoCivil.ToString() }).ToListAsync(ct),
                    ["vinculo"] = NombresVinculo
                        .Select((n, i) => new CatalogoItem { Id = i + 1, Nombre = n })
                        .ToList(),
                    ["reevaluar"] = new List<CatalogoItem>
                    {
                        new() { Id = 2, Nombre = "2 años" },
                        new() { Id = 3, Nombre = "3 años" },
                        new() { Id = 5, Nombre = "5 años" }
                    },
                    ["motivoBaja"] = await ctx.MotivoBajas.AsNoTracking().OrderBy(x => x.IdMotivoBaja)
                        .Select(x => new CatalogoItem { Id = x.IdMotivoBaja, Nombre = x.Descripcion ?? x.IdMotivoBaja.ToString() }).ToListAsync(ct)
                }
            }));

        return services;
    }
}
