using CmiRrhh.Application.Reportes;
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
        services.AddScoped<IPermisoService, PermisoService>();
        services.AddScoped<IHorarioService, HorarioService>();
        services.AddScoped<IFeriadoService, FeriadoService>();
        services.AddScoped<IPersonalService, PersonalService>();
        services.AddScoped<IPersonalFichaService, PersonalFichaService>();
        services.AddScoped<IAsignacionPersonalService, AsignacionPersonalService>();
        services.AddScoped<IMantenimientoCatalogoService, MantenimientoCatalogoService>();

        // Reportes tabulares: cada uno es una estrategia; agregar otro = una línea más aquí.
        services.AddScoped<IReporteTabular, ReporteCumpleanos>();
        services.AddScoped<IReporteTabular, ReporteFechaIngreso>();
        services.AddScoped<IReporteTabular, ReportePersonalPorCargo>();
        services.AddScoped<IReporteTabular, ReporteRelacionPermisos>();
        services.AddScoped<IReporteTabular, ReporteHorasExtras>();
        services.AddScoped<IReporteService, ReporteService>();
        services.AddScoped<IMarcacionAutorizadaService, MarcacionAutorizadaService>();
        services.AddScoped<ISuspensionAsistenciaService, SuspensionAsistenciaService>();
        return services;
    }
}
