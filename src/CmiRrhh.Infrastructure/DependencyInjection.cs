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
            options.UseSqlServer(configuration.GetConnectionString("CMI")));

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

        services.AddSingleton<IPasswordHasher, AspNetPasswordHasher>();
        services.AddSingleton<IClock, SystemClock>();
        return services;
    }
}
