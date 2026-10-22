using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

/// <summary>Pestaña Rotaciones (tabla Rotacion) de la ficha escalafonaria.</summary>
public static class SeccionRotacionesEscalafon
{
    public static IServiceCollection AddSeccionRotaciones(this IServiceCollection services)
    {
        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<Rotacion>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<Rotacion>
            {
                Clave = "rotaciones",
                Titulo = "Rotaciones",
                Campos = new[]
                {
                    new CampoEscalafonEf<Rotacion>(
                        new CampoEscalafon("fechaMemo", "Fecha del memorándum", TipoCampoEscalafon.Fecha),
                        e => ValoresEscalafon.Texto(e.FechaMemo),
                        (e, v) => e.FechaMemo = ValoresEscalafon.ASoloFecha(v)),
                    // Mensaje del legado: «Debe ingresar un número de Memorandum».
                    new CampoEscalafonEf<Rotacion>(
                        new CampoEscalafon("nroMemo", "N° de memorándum", TipoCampoEscalafon.Texto, 50),
                        e => e.NroMemo, (e, v) => e.NroMemo = v),
                    // Como el legado, la rotación queda en el año actual (Year es parte de la clave de la unidad).
                    new CampoEscalafonEf<Rotacion>(
                        new CampoEscalafon("area", "Oficina destino", TipoCampoEscalafon.Opcion),
                        e => e.IdAreaOrganiz?.ToString(CultureInfo.InvariantCulture),
                        (e, v) =>
                        {
                            e.IdAreaOrganiz = ValoresEscalafon.AEntero(v);
                            e.Year = DateTime.Today.Year;
                        })
                },
                Cargar = (ctx, id, ct) => ctx.Rotacions.Where(r => r.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdRotacion.ToString(CultureInfo.InvariantCulture),
                // La clave es (empleado, n.º): el legado usa cantidad + 1, que se repite tras borrar; aquí es máximo + 1.
                Crear = (ctx, id, existentes, ct) => Task.FromResult(new Rotacion
                {
                    IdEmpleado = id,
                    IdRotacion = existentes.Select(r => r.IdRotacion).DefaultIfEmpty(0).Max() + 1,
                    Year = DateTime.Today.Year
                }),
                Ordenar = lista => lista.OrderByDescending(r => r.FechaMemo),
                ReglasBd = async (ctx, id, clave, valores, ct) =>
                {
                    // La rotación se guarda en el año actual: la unidad destino debe existir en ese año.
                    var area = ValoresEscalafon.AEntero(valores.GetValueOrDefault("area"));
                    var anio = DateTime.Today.Year;
                    var existe = await ctx.EstructOrganizs.AsNoTracking()
                        .AnyAsync(u => u.Year == anio && u.IdAreaOrganiz == area, ct);
                    return existe ? null : $"La oficina destino no existe en la estructura del año {anio}.";
                },
                Opciones = async (ctx, ct) =>
                {
                    // Una fila por unidad (la del año más reciente), para que también se muestren las rotaciones antiguas.
                    var unidades = await ctx.EstructOrganizs.AsNoTracking()
                        .Select(u => new { u.IdAreaOrganiz, u.Year, u.AreaOrganizacional })
                        .ToListAsync(ct);
                    var lista = unidades
                        .GroupBy(u => u.IdAreaOrganiz)
                        .Select(g => g.OrderByDescending(u => u.Year).First())
                        .OrderBy(u => u.AreaOrganizacional)
                        .Select(u => new CatalogoItem { Id = u.IdAreaOrganiz, Nombre = u.AreaOrganizacional.Trim() })
                        .ToList();
                    return new Dictionary<string, IReadOnlyList<CatalogoItem>> { ["area"] = lista };
                }
            }));

        return services;
    }
}
