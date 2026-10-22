using CmiRrhh.Application.Abstractions;
using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Infrastructure.Persistence;
using CmiRrhh.Infrastructure.Persistence.Repositories;
using CmiRrhh.Infrastructure.Security;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CmiRrhh.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services, IConfiguration configuration)
    {
        services.AddDbContext<CmiDbContext>(options =>
            // La base CMI es antigua: con el nivel de compatibilidad por defecto EF Core 8 traduce
            // Contains(lista) a OPENJSON, que SQL Server no entiende ("Incorrect syntax near '$'").
            // Nivel 100 fuerza la traducción clásica: WHERE Id IN (@p0, @p1, ...).
            options.UseSqlServer(
                configuration.GetConnectionString("CMI"),
                sql => sql.UseCompatibilityLevel(100)));

        services.AddScoped<IStoredProcedureExecutor, EfStoredProcedureExecutor>();
        services.AddScoped<IUsuarioAccesoRepository, UsuarioAccesoRepository>();
        services.AddScoped<IEmpleadoRepository, EmpleadoRepository>();
        services.AddScoped<IHorarioRepository, HorarioRepository>();
        services.AddScoped<IReporteRepository, ReporteRepository>();

        services.AddScoped<PermisoRepository>();
        services.AddScoped<IPermisoRepository>(sp => sp.GetRequiredService<PermisoRepository>());
        services.AddScoped<IPermisoReporteRepository>(sp => sp.GetRequiredService<PermisoRepository>());

        services.AddScoped<AsistenciaRepository>();
        services.AddScoped<IAsistenciaRepository>(sp => sp.GetRequiredService<AsistenciaRepository>());
        services.AddScoped<IAsistenciaReporteRepository>(sp => sp.GetRequiredService<AsistenciaRepository>());
        services.AddScoped<ICatalogoRepository, CatalogoRepository>();
        // El orden de registro es el de las pestañas: «Aspecto laboral» va primero, como en el sistema legado.
        services.AddSeccionLaboral();
        services.AddSeccionesEscalafon();
        services.AddSeccionFamiliares();
        services.AddSeccionDisciplina();
        services.AddSeccionResoluciones();
        services.AddSeccionRotaciones();
        services.AddSeccionesAspectos();
        services.AddSeccionAsegurados();
        services.AddScoped<IFichaImpresaRepository, FichaImpresaRepository>();

        services.AddSingleton<IPasswordHasher, AspNetPasswordHasher>();
        services.AddSingleton<IClock, SystemClock>();
        services.AddSingleton<IProcesadorImagen, Imaging.ImageSharpProcesadorImagen>();
        return services;
    }
}
