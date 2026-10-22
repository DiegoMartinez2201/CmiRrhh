using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

/// <summary>
/// Pestañas de «aspectos» de la ficha social con un solo registro por trabajador: familiar (datos del Empleado),
/// psicológico, social, diagnóstico social, salud (RRHH_Salud) y recreacional (RRHH_AspSocio).
/// Todas usan la sección genérica de registro único; cada una solo declara sus campos.
/// </summary>
public static class SeccionesAspectosEscalafon
{
    public static IServiceCollection AddSeccionesAspectos(this IServiceCollection services)
    {
        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<Empleado>(
            sp.GetRequiredService<CmiDbContext>(),
            ConfigEmpleado("aspecto-familiar", "Aspecto familiar", new[]
            {
                Opcion<Empleado>("viveCon", "¿Con quién vive actualmente?", false, e => e.IdViveCon, (e, v) => e.IdViveCon = v),
                SiNo<Empleado>("jefeHogar", "¿Es jefe de hogar?", e => e.JefeHogar, (e, v) => e.JefeHogar = v),
                Texto<Empleado>("cargaFam", "Carga familiar", 2, false, e => e.CargaFam, (e, v) => e.CargaFam = v),
                Texto<Empleado>("numHijos", "N.º de hijos", 2, false, e => e.NumHijos, (e, v) => e.NumHijos = v),
                Texto<Empleado>("obsFam", "Observaciones", 500, false, e => e.ObsFam, (e, v) => e.ObsFam = v)
            },
            async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
            {
                ["viveCon"] = (await ctx.ViveCons.AsNoTracking().OrderBy(v => v.IdViveCon).ToListAsync(ct))
                    .Select(v => new CatalogoItem { Id = v.IdViveCon, Nombre = (v.DescripViveCon ?? string.Empty).Trim() }).ToList()
            })));

        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<Empleado>(
            sp.GetRequiredService<CmiDbContext>(),
            ConfigEmpleado("aspecto-psicologico", "Aspecto psicológico", new[]
            {
                Texto<Empleado>("descripcion", "Descripción", 1000, false, e => e.AspecPsico, (e, v) => e.AspecPsico = v)
            })));

        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<Empleado>(
            sp.GetRequiredService<CmiDbContext>(),
            ConfigEmpleado("aspecto-social", "Aspecto social", new[]
            {
                Texto<Empleado>("descripcion", "Descripción", 1000, false, e => e.AspecSocial, (e, v) => e.AspecSocial = v)
            })));

        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<Empleado>(
            sp.GetRequiredService<CmiDbContext>(),
            ConfigEmpleado("diagnostico-social", "Diagnóstico social", new[]
            {
                Texto<Empleado>("descripcion", "Descripción", 1000, false, e => e.DiagnosSocial, (e, v) => e.DiagnosSocial = v)
            })));

        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<RrhhSalud>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<RrhhSalud>
            {
                Clave = "aspecto-salud",
                Titulo = "Aspecto de salud",
                RegistroUnico = true,
                Campos = new[]
                {
                    SiNo<RrhhSalud>("enferCronica", "Enfermedad crónica o discapacidad", e => e.EnferCronica, (e, v) => e.EnferCronica = v),
                    Texto<RrhhSalud>("enferCronicaDescrip", "Mencione (enfermedad crónica)", 200, false,
                        e => e.EnferCronicaDescrip, (e, v) => e.EnferCronicaDescrip = v),
                    SiNo<RrhhSalud>("famDiscapacidad", "Miembros de la familia con discapacidad", e => e.FamDiscapacidad, (e, v) => e.FamDiscapacidad = v),
                    Texto<RrhhSalud>("famDiscapDescrip", "Mencione (discapacidad en la familia)", 200, false,
                        e => e.FamDiscapDescrip, (e, v) => e.FamDiscapDescrip = v),
                    SiNo<RrhhSalud>("alergico", "Es alérgico a algún medicamento", e => e.Alergico, (e, v) => e.Alergico = v),
                    Texto<RrhhSalud>("alergicoDescrip", "Especifique (alergia)", 200, false,
                        e => e.AlergicoDescrip, (e, v) => e.AlergicoDescrip = v),
                    Opcion<RrhhSalud>("acudeEnferm", "Dónde acude en caso de enfermedad", false, e => e.IdAcudeEnferm, (e, v) => e.IdAcudeEnferm = v)
                },
                Cargar = (ctx, id, ct) => ctx.RrhhSaluds.Where(s => s.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdSalud.ToString(CultureInfo.InvariantCulture),
                // El legado asigna id = último + 1 sobre toda la tabla (no hay identity).
                Crear = async (ctx, id, existentes, ct) => new RrhhSalud
                {
                    IdEmpleado = id,
                    IdSalud = ((await ctx.RrhhSaluds.AsNoTracking().MaxAsync(s => (int?)s.IdSalud, ct)) ?? 0) + 1
                },
                Opciones = async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
                {
                    ["acudeEnferm"] = (await ctx.RrhhAcudeEnferms.AsNoTracking().OrderBy(a => a.IdAcudeEnferm).ToListAsync(ct))
                        .Select(a => new CatalogoItem { Id = a.IdAcudeEnferm, Nombre = (a.AcudeEnfermDescrip ?? string.Empty).Trim() }).ToList()
                }
            }));

        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<RrhhAspSocio>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<RrhhAspSocio>
            {
                Clave = "aspecto-recreacional",
                Titulo = "Aspecto recreacional",
                RegistroUnico = true,
                Campos = new[]
                {
                    Opcion<RrhhAspSocio>("pregunta1", "Pregunta 1", false, e => e.IdPregunta1, (e, v) => e.IdPregunta1 = v),
                    Opcion<RrhhAspSocio>("pregunta2", "Pregunta 2", false, e => e.IdPregunta2, (e, v) => e.IdPregunta2 = v),
                    Opcion<RrhhAspSocio>("pregunta3", "Pregunta 3", false, e => e.IdPregunta3, (e, v) => e.IdPregunta3 = v),
                    Texto<RrhhAspSocio>("principProblemas", "Principales problemas conocidos que existen en la institución", 400, false,
                        e => e.PrincipProblemas, (e, v) => e.PrincipProblemas = v),
                    Texto<RrhhAspSocio>("propMejora", "Qué propone para mejorar esas situaciones problemáticas", 400, false,
                        e => e.PropMejoraInstitu, (e, v) => e.PropMejoraInstitu = v),
                    Texto<RrhhAspSocio>("hobby", "Cuál es su hobby", 400, false, e => e.Hobby, (e, v) => e.Hobby = v),
                    Texto<RrhhAspSocio>("actRecrea", "Qué actividades recreativas le gustaría realizar en el centro de trabajo", 400, false,
                        e => e.ActRecreaInstitu, (e, v) => e.ActRecreaInstitu = v)
                },
                Cargar = (ctx, id, ct) => ctx.RrhhAspSocios.Where(s => s.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdAspSocio.ToString(CultureInfo.InvariantCulture),
                Crear = async (ctx, id, existentes, ct) => new RrhhAspSocio
                {
                    IdEmpleado = id,
                    IdAspSocio = ((await ctx.RrhhAspSocios.AsNoTracking().MaxAsync(s => (int?)s.IdAspSocio, ct)) ?? 0) + 1
                },
                Opciones = async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
                {
                    ["pregunta1"] = (await ctx.RrhhPreg1s.AsNoTracking().OrderBy(p => p.IdPregunta1).ToListAsync(ct))
                        .Select(p => new CatalogoItem { Id = p.IdPregunta1, Nombre = (p.Respues1 ?? string.Empty).Trim() }).ToList(),
                    ["pregunta2"] = (await ctx.RrhhPreg2s.AsNoTracking().OrderBy(p => p.IdPregunta2).ToListAsync(ct))
                        .Select(p => new CatalogoItem { Id = p.IdPregunta2, Nombre = (p.Respues2 ?? string.Empty).Trim() }).ToList(),
                    ["pregunta3"] = (await ctx.RrhhPreg3s.AsNoTracking().OrderBy(p => p.IdPregunta3).ToListAsync(ct))
                        .Select(p => new CatalogoItem { Id = p.IdPregunta3, Nombre = (p.Respues3 ?? string.Empty).Trim() }).ToList()
                }
            }));

        // Dinámica familiar (RRHH_DinamicaFamiliar): cuatro listas de opciones; el legado no edita su campo Observacion.
        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<RrhhDinamicaFamiliar>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<RrhhDinamicaFamiliar>
            {
                Clave = "dinamica-familiar",
                Titulo = "Dinámica familiar",
                RegistroUnico = true,
                Campos = new[]
                {
                    Opcion<RrhhDinamicaFamiliar>("tipoFam", "Tipo de familia", false, e => e.IdTipoFam, (e, v) => e.IdTipoFam = v),
                    Opcion<RrhhDinamicaFamiliar>("relPareja", "Relación de pareja", false, e => e.IdRelaPareja, (e, v) => e.IdRelaPareja = v),
                    Opcion<RrhhDinamicaFamiliar>("relPadresHijos", "Relación padres - hijos", false, e => e.IdRelaPh, (e, v) => e.IdRelaPh = v),
                    Opcion<RrhhDinamicaFamiliar>("relHermanos", "Relación entre hermanos", false, e => e.IdRelacHermano, (e, v) => e.IdRelacHermano = v)
                },
                Cargar = (ctx, id, ct) => ctx.RrhhDinamicaFamiliars.Where(d => d.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdDinamica.ToString(CultureInfo.InvariantCulture),
                Crear = async (ctx, id, existentes, ct) => new RrhhDinamicaFamiliar
                {
                    IdEmpleado = id,
                    IdDinamica = ((await ctx.RrhhDinamicaFamiliars.AsNoTracking().MaxAsync(d => (int?)d.IdDinamica, ct)) ?? 0) + 1
                },
                Opciones = async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
                {
                    ["tipoFam"] = (await ctx.RrhhTipoFamilia.AsNoTracking().OrderBy(t => t.IdTipoFam).ToListAsync(ct))
                        .Select(t => new CatalogoItem { Id = t.IdTipoFam, Nombre = (t.TipoFamDescrip ?? string.Empty).Trim() }).ToList(),
                    ["relPareja"] = (await ctx.RrhhRelacParejas.AsNoTracking().OrderBy(t => t.IdRelacPareja).ToListAsync(ct))
                        .Select(t => new CatalogoItem { Id = t.IdRelacPareja, Nombre = (t.RelacParejaDescrip ?? string.Empty).Trim() }).ToList(),
                    ["relPadresHijos"] = (await ctx.RrhhRelacPhs.AsNoTracking().OrderBy(t => t.IdRelacPh).ToListAsync(ct))
                        .Select(t => new CatalogoItem { Id = t.IdRelacPh, Nombre = (t.RelacPhdescrip ?? string.Empty).Trim() }).ToList(),
                    ["relHermanos"] = (await ctx.RrhhRelacHermanos.AsNoTracking().OrderBy(t => t.IdRelacHermano).ToListAsync(ct))
                        .Select(t => new CatalogoItem { Id = t.IdRelacHermano, Nombre = (t.RelacHermanoDescrip ?? string.Empty).Trim() }).ToList()
                }
            }));

        // Funcionamiento familiar (RRHH_FuncFam): nueve respuestas N / AV / CS (el legado guarda el texto de la opción).
        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<RrhhFuncFam>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<RrhhFuncFam>
            {
                Clave = "funcionamiento-familiar",
                Titulo = "Funcionamiento familiar",
                RegistroUnico = true,
                Campos = new[]
                {
                    Respuesta<RrhhFuncFam>("com1", "Comunicación: es verbal, fluida y abierta siempre", e => e.Com1, (e, v) => e.Com1 = v),
                    Respuesta<RrhhFuncFam>("com2", "Comunicación: solo cuando hay dificultades", e => e.Com2, (e, v) => e.Com2 = v),
                    Respuesta<RrhhFuncFam>("afec1", "Afectividad: se brindan abrazos, besos, palabras cariñosas", e => e.Afec1, (e, v) => e.Afec1 = v),
                    Respuesta<RrhhFuncFam>("afec2", "Afectividad: se aceptan y toleran entre sí", e => e.Afec2, (e, v) => e.Afec2 = v),
                    Respuesta<RrhhFuncFam>("soc1", "Socialización: participan de clubs, juntas vecinales y otros", e => e.Soc1, (e, v) => e.Soc1 = v),
                    Respuesta<RrhhFuncFam>("soc2", "Socialización: realizan sus propias actividades familiares", e => e.Soc2, (e, v) => e.Soc2 = v),
                    Respuesta<RrhhFuncFam>("soc3", "Socialización: buenas relaciones con amigos y vecinos", e => e.Soc3, (e, v) => e.Soc3 = v),
                    Respuesta<RrhhFuncFam>("decis1", "Toma de decisiones, ante un problema: todos participan en la solución", e => e.Decis1, (e, v) => e.Decis1 = v),
                    Respuesta<RrhhFuncFam>("decis2", "Toma de decisiones, ante un problema: solo los padres buscan la solución", e => e.Decis2, (e, v) => e.Decis2 = v)
                },
                Cargar = (ctx, id, ct) => ctx.RrhhFuncFams.Where(f => f.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdFuncFamiliar.ToString(CultureInfo.InvariantCulture),
                Crear = async (ctx, id, existentes, ct) => new RrhhFuncFam
                {
                    IdEmpleado = id,
                    IdFuncFamiliar = ((await ctx.RrhhFuncFams.AsNoTracking().MaxAsync(f => (int?)f.IdFuncFamiliar, ct)) ?? 0) + 1
                },
                Opciones = (ctx, ct) =>
                {
                    IReadOnlyList<CatalogoItem> respuestas = RespuestasFuncionamiento
                        .Select((r, i) => new CatalogoItem { Id = i + 1, Nombre = r })
                        .ToList();
                    return Task.FromResult(new Dictionary<string, IReadOnlyList<CatalogoItem>>
                    {
                        ["com1"] = respuestas, ["com2"] = respuestas, ["afec1"] = respuestas, ["afec2"] = respuestas,
                        ["soc1"] = respuestas, ["soc2"] = respuestas, ["soc3"] = respuestas,
                        ["decis1"] = respuestas, ["decis2"] = respuestas
                    });
                }
            }));

        return services;
    }

    /// <summary>Sección de registro único sobre las columnas del propio Empleado.</summary>
    private static ConfiguracionSeccionEscalafon<Empleado> ConfigEmpleado(
        string clave,
        string titulo,
        IReadOnlyList<CampoEscalafonEf<Empleado>> campos,
        Func<CmiDbContext, CancellationToken, Task<Dictionary<string, IReadOnlyList<CatalogoItem>>>>? opciones = null)
        => new()
        {
            Clave = clave,
            Titulo = titulo,
            RegistroUnico = true,
            Campos = campos,
            Cargar = (ctx, id, ct) => ctx.Empleados.Where(e => e.IdEmpleado == id).ToListAsync(ct),
            ClaveDe = e => e.IdEmpleado.ToString(CultureInfo.InvariantCulture),
            Crear = (ctx, id, existentes, ct) => throw new InvalidOperationException("Esta sección no admite altas."),
            Opciones = opciones
        };

    private static CampoEscalafonEf<T> Texto<T>(
        string clave, string etiqueta, int max, bool requerido, Func<T, string?> leer, Action<T, string?> escribir)
        => new(new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Texto, max, Requerido: requerido,
            EnLista: max <= 200 || clave == "descripcion"), leer, escribir);

    private static CampoEscalafonEf<T> Opcion<T>(
        string clave, string etiqueta, bool requerido, Func<T, int?> leer, Action<T, int?> escribir)
        => new(new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Opcion, Requerido: requerido),
            e => leer(e)?.ToString(CultureInfo.InvariantCulture), (e, v) => escribir(e, ValoresEscalafon.AEntero(v)));

    private static CampoEscalafonEf<T> SiNo<T>(string clave, string etiqueta, Func<T, bool?> leer, Action<T, bool?> escribir)
        => new(new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.SiNo),
            e => ValoresEscalafon.Texto(leer(e)), (e, v) => escribir(e, v == "1"));

    /// <summary>Respuestas del legado para el funcionamiento familiar, tal como se guardan en la columna.</summary>
    private static readonly string[] RespuestasFuncionamiento = { "N", "AV", "CS" };

    private static CampoEscalafonEf<T> Respuesta<T>(string clave, string etiqueta, Func<T, string?> leer, Action<T, string?> escribir)
        => new(new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Opcion, Requerido: false),
            e =>
            {
                var i = Array.IndexOf(RespuestasFuncionamiento, (leer(e) ?? string.Empty).Trim());
                return i < 0 ? null : (i + 1).ToString(CultureInfo.InvariantCulture);
            },
            (e, v) =>
            {
                var i = ValoresEscalafon.AEntero(v);
                escribir(e, i is >= 1 && i <= RespuestasFuncionamiento.Length ? RespuestasFuncionamiento[i.Value - 1] : null);
            });
}
