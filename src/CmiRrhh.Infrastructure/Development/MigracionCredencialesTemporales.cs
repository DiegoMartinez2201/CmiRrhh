using System.Text;
using CmiRrhh.Application.Abstractions;
using CmiRrhh.Infrastructure.Persistence;
using CmiRrhh.Infrastructure.Persistence.Entities;
using CmiRrhh.Infrastructure.Security;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace CmiRrhh.Infrastructure.Development;

public sealed record MigracionCredencialesResultado(
    int UsuariosPendientes,
    int CredencialesGeneradas,
    string? RutaCsv);

public static class MigracionCredencialesTemporales
{
    public static async Task<MigracionCredencialesResultado> EjecutarAsync(
        IServiceProvider services,
        ILogger logger,
        CancellationToken cancellationToken = default)
    {
        using var scope = services.CreateScope();
        var db = scope.ServiceProvider.GetRequiredService<CmiDbContext>();
        var hasher = scope.ServiceProvider.GetRequiredService<IPasswordHasher>();

        var pendientes = await db.Usuarios
            .AsNoTracking()
            .Where(u => u.Estado == true
                        && u.Login != null
                        && u.Login != string.Empty
                        && u.Credencial == null)
            .OrderBy(u => u.IdUsuario)
            .Select(u => new { u.IdUsuario, u.Login })
            .ToListAsync(cancellationToken);

        if (pendientes.Count == 0)
        {
            logger.LogInformation("No hay usuarios activos pendientes de credencial. Nada que migrar.");
            Console.WriteLine("No hay usuarios activos pendientes de credencial. Nada que migrar.");
            return new MigracionCredencialesResultado(0, 0, null);
        }

        var filasCsv = new List<(string Login, string Password)>(pendientes.Count);
        var entidades = new List<UsuarioCredencial>(pendientes.Count);

        foreach (var usuario in pendientes)
        {
            var password = TemporaryPasswordGenerator.Generate();
            entidades.Add(new UsuarioCredencial
            {
                IdUsuario = usuario.IdUsuario,
                PasswordHash = hasher.Hash(password),
                RequiereCambioPassword = true,
                IntentosFallidos = 0,
                FechaBloqueo = null
            });
            filasCsv.Add((usuario.Login!.Trim(), password));
        }

        var directorio = Path.Combine(
            Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
            "CmiRrhh");
        Directory.CreateDirectory(directorio);

        var rutaCsv = Path.Combine(
            directorio,
            $"credenciales-temporales-{DateTime.Now:yyyyMMdd-HHmmss}.csv");

        await using var tx = await db.Database.BeginTransactionAsync(cancellationToken);
        db.UsuarioCredenciales.AddRange(entidades);
        await db.SaveChangesAsync(cancellationToken);
        await File.WriteAllTextAsync(rutaCsv, BuildCsv(filasCsv), new UTF8Encoding(encoderShouldEmitUTF8Identifier: true), cancellationToken);
        await tx.CommitAsync(cancellationToken);

        logger.LogWarning(
            "Migración de credenciales: {Pendientes} usuarios pendientes, {Generadas} credenciales creadas. CSV: {Ruta}. Entregar por un canal seguro y eliminar el archivo después.",
            pendientes.Count,
            entidades.Count,
            rutaCsv);

        Console.WriteLine($"Usuarios activos pendientes: {pendientes.Count}");
        Console.WriteLine($"Credenciales generadas: {entidades.Count}");
        Console.WriteLine($"CSV: {rutaCsv}");
        Console.WriteLine("Entregar el CSV por un canal seguro y eliminarlo después. No se guarda en la base ni en Git.");

        return new MigracionCredencialesResultado(pendientes.Count, entidades.Count, rutaCsv);
    }

    private static string BuildCsv(IReadOnlyList<(string Login, string Password)> filas)
    {
        var sb = new StringBuilder();
        sb.AppendLine("Login,ContraseñaTemporal");
        foreach (var (login, password) in filas)
        {
            sb.Append(CsvField(login));
            sb.Append(',');
            sb.Append(CsvField(password));
            sb.AppendLine();
        }

        return sb.ToString();
    }

    private static string CsvField(string value)
    {
        if (value.Contains('"') || value.Contains(',') || value.Contains('\n') || value.Contains('\r'))
        {
            return $"\"{value.Replace("\"", "\"\"")}\"";
        }

        return value;
    }
}
