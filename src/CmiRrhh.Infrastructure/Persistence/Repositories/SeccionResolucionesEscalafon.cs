using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

/// <summary>Pestaña Resoluciones (tabla Resolucion) de la ficha escalafonaria.</summary>
public static class SeccionResolucionesEscalafon
{
    public static IServiceCollection AddSeccionResoluciones(this IServiceCollection services)
    {
        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<Resolucion>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<Resolucion>
            {
                Clave = "resoluciones",
                Titulo = "Resoluciones",
                Campos = new[]
                {
                    new CampoEscalafonEf<Resolucion>(
                        new CampoEscalafon("tipo", "Tipo de resolución", TipoCampoEscalafon.Opcion),
                        e => e.IdTipoResolucion?.ToString(CultureInfo.InvariantCulture),
                        (e, v) => e.IdTipoResolucion = ValoresEscalafon.AEntero(v)),
                    new CampoEscalafonEf<Resolucion>(
                        new CampoEscalafon("fecha", "Fecha de resolución", TipoCampoEscalafon.Fecha),
                        e => ValoresEscalafon.Texto(e.FechaResolucion),
                        (e, v) => e.FechaResolucion = ValoresEscalafon.ASoloFecha(v)),
                    // Mensaje del legado: «Debe ingresar un Número de Resolución».
                    new CampoEscalafonEf<Resolucion>(
                        new CampoEscalafon("numero", "Número de resolución", TipoCampoEscalafon.Texto, 50),
                        e => e.NumeroResolucion, (e, v) => e.NumeroResolucion = v)
                },
                Cargar = (ctx, id, ct) => ctx.Resolucions.Where(r => r.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdResolucion.ToString(CultureInfo.InvariantCulture),
                // La clave es (empleado, n.º): el legado usa cantidad + 1, que se repite tras borrar; aquí es máximo + 1.
                Crear = (ctx, id, existentes, ct) => Task.FromResult(new Resolucion
                {
                    IdEmpleado = id,
                    IdResolucion = existentes.Select(r => r.IdResolucion).DefaultIfEmpty(0).Max() + 1
                }),
                Ordenar = lista => lista.OrderByDescending(r => r.FechaResolucion),
                Opciones = async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
                {
                    ["tipo"] = await ctx.TipoResolucions.AsNoTracking().OrderBy(x => x.IdTipoResolucion)
                        .Select(x => new CatalogoItem { Id = x.IdTipoResolucion, Nombre = x.DescripTipoResolucion ?? x.IdTipoResolucion.ToString() })
                        .ToListAsync(ct)
                }
            }));

        return services;
    }
}
