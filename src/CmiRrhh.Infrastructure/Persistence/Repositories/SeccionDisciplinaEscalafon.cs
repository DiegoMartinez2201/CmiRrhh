using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

/// <summary>Pestaña Disciplina (tabla Comportamiento) de la ficha escalafonaria.</summary>
public static class SeccionDisciplinaEscalafon
{
    public static IServiceCollection AddSeccionDisciplina(this IServiceCollection services)
    {
        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<Comportamiento>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<Comportamiento>
            {
                Clave = "disciplina",
                Titulo = "Disciplina",
                Campos = new[]
                {
                    new CampoEscalafonEf<Comportamiento>(
                        new CampoEscalafon("tipo", "Tipo", TipoCampoEscalafon.Opcion),
                        e => e.IdTipoComportamiento?.ToString(CultureInfo.InvariantCulture),
                        (e, v) => e.IdTipoComportamiento = ValoresEscalafon.AEntero(v)),
                    new CampoEscalafonEf<Comportamiento>(
                        new CampoEscalafon("numResol", "N° de documento", TipoCampoEscalafon.Texto, 200),
                        e => e.NumResol, (e, v) => e.NumResol = v),
                    new CampoEscalafonEf<Comportamiento>(
                        new CampoEscalafon("fecha", "Fecha", TipoCampoEscalafon.Fecha),
                        e => ValoresEscalafon.Texto(e.Fecha), (e, v) => e.Fecha = ValoresEscalafon.AFecha(v)),
                    new CampoEscalafonEf<Comportamiento>(
                        new CampoEscalafon("titulo", "Título", TipoCampoEscalafon.Texto, 1000, Requerido: false),
                        e => e.Titulo, (e, v) => e.Titulo = v),
                    new CampoEscalafonEf<Comportamiento>(
                        new CampoEscalafon("descripcion", "Descripción", TipoCampoEscalafon.Texto, 2000, Requerido: false, EnLista: false),
                        e => e.Descripcion, (e, v) => e.Descripcion = v)
                },
                Cargar = (ctx, id, ct) => ctx.Comportamientos.Where(c => c.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdComportamiento.ToString(CultureInfo.InvariantCulture),
                // idComportamiento no es identity: el siguiente id sale del máximo de toda la tabla.
                Crear = async (ctx, id, existentes, ct) => new Comportamiento
                {
                    IdEmpleado = id,
                    IdComportamiento = ((await ctx.Comportamientos.AsNoTracking().MaxAsync(c => (int?)c.IdComportamiento, ct)) ?? 0) + 1
                },
                Ordenar = lista => lista.OrderByDescending(c => c.Fecha),
                Opciones = async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
                {
                    ["tipo"] = await ctx.TipoComportamientos.AsNoTracking().OrderBy(x => x.IdTipoComportamiento)
                        .Select(x => new CatalogoItem { Id = x.IdTipoComportamiento, Nombre = x.TipoCompDescrip ?? x.IdTipoComportamiento.ToString() })
                        .ToListAsync(ct)
                }
            }));

        return services;
    }
}
