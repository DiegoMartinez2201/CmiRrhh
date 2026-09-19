using CmiRrhh.Application.Services;
using CmiRrhh.Domain.Auth;
using Microsoft.Extensions.DependencyInjection;

namespace CmiRrhh.Application;

public static class DependencyInjection
{
    public static IServiceCollection AddApplication(this IServiceCollection services)
    {
        services.AddScoped<IAuthenticationService, AuthenticationService>();
        services.AddScoped<IAsistenciaConsultaService, AsistenciaConsultaService>();
        services.AddScoped<IAsistenciaCorreccionService, AsistenciaCorreccionService>();
        services.AddScoped<IAsistenciaImportacionService, AsistenciaImportacionService>();
        services.AddScoped<IAsistenciaPlanillaService, AsistenciaPlanillaService>();
        services.AddScoped<ICatalogoService, CatalogoService>();
        return services;
    }
}
