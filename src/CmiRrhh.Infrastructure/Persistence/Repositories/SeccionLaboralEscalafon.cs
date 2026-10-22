using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

/// <summary>
/// Pestaña «Aspecto laboral» (columnas del propio Empleado): condición laboral, profesión, cargo, régimen de pensión,
/// AFP, resoluciones de ingreso al Estado y, para pensionistas, de cese e incorporación a la 20530.
/// Reglas del legado (FrmFichaSocial.btnGuardar): los datos de AFP solo valen con el régimen 3 y los de pensionista
/// solo si el personal es pensionista; en otro caso se vacían.
/// </summary>
public static class SeccionLaboralEscalafon
{
    private const int RegimenConAfp = 3;
    private const string Activo = "0";
    private const string Pensionista = "1";

    public static IServiceCollection AddSeccionLaboral(this IServiceCollection services)
    {
        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<Empleado>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<Empleado>
            {
                Clave = "laboral",
                Titulo = "Aspecto laboral",
                RegistroUnico = true,
                Campos = new[]
                {
                    Opcion("tipoTrabajador", "Condición laboral", true, true,
                        e => e.IdTipoTrabajador, (e, v) => e.IdTipoTrabajador = v),
                    Texto("profesion", "Profesión u ocupación", 80, true, e => e.Profesion, (e, v) => e.Profesion = v),
                    Opcion("cargo", "Cargo que desempeña", false, true, e => e.IdCargo, (e, v) => e.IdCargo = v),
                    Texto("autogenSalud", "N.º autogenerado de salud", 15, false, e => e.NumAutogenSalud, (e, v) => e.NumAutogenSalud = v),
                    Opcion("regimen", "Régimen de pensión", false, true, e => e.IdRegimenPen, (e, v) => e.IdRegimenPen = v),
                    Opcion("afp", "AFP (solo régimen 3)", false, false, e => e.IdAfp, (e, v) => e.IdAfp = v),
                    Texto("nroAfp", "N.º CUSPP (AFP)", 20, false, e => e.NroAfp, (e, v) => e.NroAfp = v),
                    Fecha("fechaAfp", "Fecha de inscripción AFP", false, e => e.FechaAfp, (e, v) => e.FechaAfp = v),

                    Texto("resoIngresoEstado", "N.º resolución de ingreso al Estado", 30, false,
                        e => e.NumResoIngreEsta, (e, v) => e.NumResoIngreEsta = v),
                    Fecha("fechaResoIngresoEstado", "Fecha de la resolución de ingreso al Estado", false,
                        e => e.FechaResolIngreEsta, (e, v) => e.FechaResolIngreEsta = v),
                    Fecha("fechaIngresoEstado", "Fecha de ingreso al Estado", false,
                        e => e.FechaIngreEstado, (e, v) => e.FechaIngreEstado = v),

                    // Campo calculado: no se guarda; indica si se conservan los datos de pensionista.
                    new CampoEscalafonEf<Empleado>(
                        new CampoEscalafon("tipoPersonal", "Tipo de personal", TipoCampoEscalafon.Opcion),
                        e => EsPensionista(e) ? Pensionista : Activo,
                        (e, v) => { }),
                    Texto("resolCese", "N.º resolución de cese", 20, false, e => e.NumResolCese, (e, v) => e.NumResolCese = v),
                    Fecha("fechaCese", "Fecha de cese", false, e => e.FechaResolCese, (e, v) => e.FechaResolCese = v),
                    Texto("resol20530", "N.º resolución de incorporación a la 20530", 20, false,
                        e => e.NumResol20530, (e, v) => e.NumResol20530 = v),
                    Fecha("fecha20530", "Fecha de incorporación a la 20530", false,
                        e => e.FechaResol20530, (e, v) => e.FechaResol20530 = v),
                    Texto("resolPension", "N.º resolución de pensión mensual - cesantía", 20, false,
                        e => e.NumResolPenMen, (e, v) => e.NumResolPenMen = v),
                    Fecha("fechaPension", "Fecha de pensión mensual - cesantía", false,
                        e => e.FechaResolPenMen, (e, v) => e.FechaResolPenMen = v)
                },
                Cargar = (ctx, id, ct) => ctx.Empleados.Where(e => e.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdEmpleado.ToString(CultureInfo.InvariantCulture),
                Crear = (ctx, id, existentes, ct) => throw new InvalidOperationException("El aspecto laboral no admite altas."),
                Normalizar = (e, valores) =>
                {
                    if (e.IdRegimenPen != RegimenConAfp)
                    {
                        e.IdAfp = null;
                        e.NroAfp = null;
                        e.FechaAfp = null;
                    }

                    if (valores.GetValueOrDefault("tipoPersonal") != Pensionista)
                    {
                        e.NumResolCese = null;
                        e.FechaResolCese = null;
                        e.NumResol20530 = null;
                        e.FechaResol20530 = null;
                        e.NumResolPenMen = null;
                        e.FechaResolPenMen = null;
                    }
                },
                Opciones = async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
                {
                    ["tipoTrabajador"] = (await ctx.TipoTrabajadors.AsNoTracking().OrderBy(t => t.Descripcion).ToListAsync(ct))
                        .Select(t => new CatalogoItem { Id = t.IdTipoTrabajador, Nombre = (t.Descripcion ?? string.Empty).Trim() }).ToList(),
                    ["cargo"] = (await ctx.Cargos.AsNoTracking().OrderBy(c => c.Cargo1).ToListAsync(ct))
                        .Select(c => new CatalogoItem { Id = c.IdCargo, Nombre = c.Cargo1.Trim() }).ToList(),
                    ["regimen"] = (await ctx.RegimenPensions.AsNoTracking().OrderBy(r => r.IdRegimenPen).ToListAsync(ct))
                        .Select(r => new CatalogoItem { Id = r.IdRegimenPen, Nombre = (r.LeyRegimen ?? string.Empty).Trim() }).ToList(),
                    ["afp"] = (await ctx.Afps.AsNoTracking().OrderBy(a => a.DescripAfp).ToListAsync(ct))
                        .Select(a => new CatalogoItem { Id = a.IdAfp, Nombre = (a.DescripAfp ?? string.Empty).Trim() }).ToList(),
                    // «Activo» = 0 y «Pensionista» = 1, como el combo del formulario legado.
                    ["tipoPersonal"] = new[]
                    {
                        new CatalogoItem { Id = 0, Nombre = "Activo" },
                        new CatalogoItem { Id = 1, Nombre = "Pensionista" }
                    }
                },
                Reglas = v =>
                {
                    var pensionista = v.GetValueOrDefault("tipoPersonal") == Pensionista;
                    var cese = ValoresEscalafon.AFecha(v.GetValueOrDefault("fechaCese"));
                    var ingreso = ValoresEscalafon.AFecha(v.GetValueOrDefault("fechaIngresoEstado"));
                    return pensionista && cese is not null && ingreso is not null && cese < ingreso
                        ? "La fecha de cese no puede ser anterior a la fecha de ingreso al Estado."
                        : null;
                }
            }));

        return services;
    }

    private static bool EsPensionista(Empleado e)
        => !string.IsNullOrWhiteSpace(e.NumResolCese) || e.FechaResolCese is not null
           || !string.IsNullOrWhiteSpace(e.NumResol20530) || e.FechaResol20530 is not null
           || !string.IsNullOrWhiteSpace(e.NumResolPenMen) || e.FechaResolPenMen is not null;

    private static CampoEscalafonEf<Empleado> Texto(
        string clave, string etiqueta, int max, bool enLista, Func<Empleado, string?> leer, Action<Empleado, string?> escribir)
        => new(new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Texto, max, Requerido: false, EnLista: enLista), leer, escribir);

    private static CampoEscalafonEf<Empleado> Fecha(
        string clave, string etiqueta, bool requerido, Func<Empleado, DateTime?> leer, Action<Empleado, DateTime?> escribir)
        => new(new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Fecha, Requerido: requerido, EnLista: false),
            e => ValoresEscalafon.Texto(leer(e)), (e, v) => escribir(e, ValoresEscalafon.AFecha(v)));

    private static CampoEscalafonEf<Empleado> Opcion(
        string clave, string etiqueta, bool requerido, bool enLista, Func<Empleado, int?> leer, Action<Empleado, int?> escribir)
        => new(new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Opcion, Requerido: requerido, EnLista: enLista),
            e => leer(e)?.ToString(CultureInfo.InvariantCulture), (e, v) => escribir(e, ValoresEscalafon.AEntero(v)));
}
