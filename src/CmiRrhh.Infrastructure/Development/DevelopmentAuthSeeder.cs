using CmiRrhh.Application.Abstractions;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Infrastructure.Persistence;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace CmiRrhh.Infrastructure.Development;

public static class DevelopmentAuthSeeder
{
    public const string TestPassword = "CmiDev#2026";

    public static async Task EnsureTestCredentialAsync(IServiceProvider services, ILogger logger)
    {
        using var scope = services.CreateScope();
        var db = scope.ServiceProvider.GetRequiredService<CmiDbContext>();
        var hasher = scope.ServiceProvider.GetRequiredService<IPasswordHasher>();

        if (await db.UsuarioCredenciales.AnyAsync())
        {
            return;
        }

        var usuario = await db.Usuarios
            .Where(u => u.Estado == true
                        && u.IdRols.Any(r => r.IdSistema != null && r.IdSistema.Trim() == AuthConstants.RrhhSistemaId))
            .OrderBy(u => u.IdUsuario)
            .FirstOrDefaultAsync();

        if (usuario is null)
        {
            logger.LogWarning("No hay usuarios activos con rol RRHH para crear la credencial de desarrollo.");
            return;
        }

        db.UsuarioCredenciales.Add(new UsuarioCredencial
        {
            IdUsuario = usuario.IdUsuario,
            PasswordHash = hasher.Hash(TestPassword),
            RequiereCambioPassword = true,
            IntentosFallidos = 0
        });

        await db.SaveChangesAsync();

        logger.LogWarning(
            "Credencial de desarrollo creada. Login='{Login}' Password='{Password}'. Debe cambiarse al ingresar.",
            usuario.Login?.Trim(),
            TestPassword);
    }
}
