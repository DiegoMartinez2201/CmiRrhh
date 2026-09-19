using CmiRrhh.Application;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Infrastructure;
using CmiRrhh.Infrastructure.Development;
using CmiRrhh.Infrastructure.Persistence;
using CmiRrhh.Infrastructure.Persistence.Repositories;
using CmiRrhh.Infrastructure.Persistence.Verificadores;
using CmiRrhh.Web.Middleware;
using Microsoft.AspNetCore.Authentication.Cookies;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddApplication();
builder.Services.AddInfrastructure(builder.Configuration);
builder.Services.AddScoped<IStoredProcedureExecutor, EfStoredProcedureExecutor>();
builder.Services.AddScoped<IEmpleadoRepository, EmpleadoRepository>();
builder.Services.AddScoped<IHorarioRepository, HorarioRepository>();
builder.Services.AddScoped<IReporteRepository, ReporteRepository>();

builder.Services.AddScoped<PermisoRepository>();
builder.Services.AddScoped<IPermisoRepository>(sp => sp.GetRequiredService<PermisoRepository>());
builder.Services.AddScoped<IPermisoReporteRepository>(sp => sp.GetRequiredService<PermisoRepository>());

builder.Services.AddScoped<AsistenciaRepository>();
builder.Services.AddScoped<IAsistenciaRepository>(sp => sp.GetRequiredService<AsistenciaRepository>());
builder.Services.AddScoped<IAsistenciaReporteRepository>(sp => sp.GetRequiredService<AsistenciaRepository>());
builder.Services.AddScoped<ICatalogoRepository, CatalogoRepository>();

builder.Services.AddScoped<IVerificadorEventoLaboral, VerificadorMarcacion>();
builder.Services.AddScoped<IVerificadorEventoLaboral, VerificadorAsistencia>();
builder.Services.AddScoped<IVerificadorEventoLaboral, VerificadorRefrigerio>();
builder.Services.AddScoped<VerificadorEventoLaboralResolver>();

builder.Services.AddRazorPages(options =>
{
    options.Conventions.AuthorizeFolder("/");
    options.Conventions.AuthorizeFolder("/Asistencias", AuthConstants.AsistenciasPolicy);
    options.Conventions.AuthorizePage("/Asistencias/Correccion", AuthConstants.AsistenciasEscrituraPolicy);
    options.Conventions.AuthorizePage("/Asistencias/ImportarBiometrico", AuthConstants.AsistenciasEscrituraPolicy);
    options.Conventions.AllowAnonymousToPage("/Account/Login");
    options.Conventions.AllowAnonymousToPage("/Error");
});

builder.Services
    .AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options =>
    {
        options.LoginPath = "/Account/Login";
        options.LogoutPath = "/Account/Logout";
        options.AccessDeniedPath = "/Account/AccessDenied";
        options.ExpireTimeSpan = TimeSpan.FromHours(8);
        options.SlidingExpiration = true;
        options.Cookie.Name = "CmiRrhh.Auth";
        options.Cookie.HttpOnly = true;
        options.Cookie.SecurePolicy = CookieSecurePolicy.SameAsRequest;
        options.Cookie.SameSite = SameSiteMode.Lax;
    });

builder.Services.AddAuthorization(options =>
{
    options.AddPolicy(AuthConstants.AsistenciasPolicy, policy =>
        policy.RequireRole(
            AuthConstants.RolAsistencias,
            AuthConstants.RolAsistenciasCas,
            AuthConstants.RolReportesAsistencias));
    options.AddPolicy(AuthConstants.AsistenciasEscrituraPolicy, policy =>
        policy.RequireRole(
            AuthConstants.RolAsistencias,
            AuthConstants.RolAsistenciasCas));
});

var app = builder.Build();

if (args.Any(a => string.Equals(a, "migrate-users", StringComparison.OrdinalIgnoreCase)))
{
    if (!app.Environment.IsDevelopment())
    {
        app.Logger.LogError("migrate-users solo está permitido en Development.");
        return;
    }

    await MigracionCredencialesTemporales.EjecutarAsync(app.Services, app.Logger);
    return;
}

if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}
else
{
    await DevelopmentAuthSeeder.EnsureTestCredentialAsync(
        app.Services,
        app.Logger);
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();
app.UseMiddleware<RequirePasswordChangeMiddleware>();

app.MapRazorPages();

app.Run();
