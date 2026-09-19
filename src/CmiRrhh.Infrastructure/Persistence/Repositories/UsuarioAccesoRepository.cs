using CmiRrhh.Application.Abstractions;
using CmiRrhh.Domain.Auth;
using CmiRrhh.Infrastructure.Persistence;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class UsuarioAccesoRepository : IUsuarioAccesoRepository
{
    private readonly CmiDbContext _db;

    public UsuarioAccesoRepository(CmiDbContext db)
    {
        _db = db;
    }

    public async Task<UsuarioAcceso?> FindActiveByLoginAsync(string login, CancellationToken cancellationToken = default)
    {
        var normalized = login.Trim();
        if (normalized.Length == 0)
        {
            return null;
        }

        var usuario = await _db.Usuarios
            .AsNoTracking()
            .Where(u => u.Estado == true && u.Login != null && u.Login.Trim() == normalized)
            .Select(u => new
            {
                u.IdUsuario,
                Login = u.Login!,
                u.Descripcion,
                u.IdEmpleado,
                Roles = u.IdRols
                    .Where(r => r.IdSistema != null && r.IdSistema.Trim() == AuthConstants.RrhhSistemaId && r.Descripcion != null)
                    .Select(r => r.Descripcion!.Trim())
                    .Where(d => d.Length > 0)
                    .ToList()
            })
            .FirstOrDefaultAsync(cancellationToken);

        if (usuario is null)
        {
            return null;
        }

        var displayName = string.IsNullOrWhiteSpace(usuario.Descripcion)
            ? usuario.Login.Trim()
            : usuario.Descripcion.Trim();

        return new UsuarioAcceso
        {
            IdUsuario = usuario.IdUsuario,
            Login = usuario.Login.Trim(),
            DisplayName = displayName,
            IdEmpleado = usuario.IdEmpleado,
            Roles = usuario.Roles
        };
    }

    public async Task<UsuarioCredencialSnapshot?> GetCredencialAsync(int idUsuario, CancellationToken cancellationToken = default)
    {
        var entity = await _db.UsuarioCredenciales
            .AsNoTracking()
            .FirstOrDefaultAsync(c => c.IdUsuario == idUsuario, cancellationToken);

        if (entity is null)
        {
            return null;
        }

        return ToSnapshot(entity);
    }

    public async Task UpdateCredencialAsync(UsuarioCredencialSnapshot credencial, CancellationToken cancellationToken = default)
    {
        var entity = await _db.UsuarioCredenciales
            .FirstOrDefaultAsync(c => c.IdUsuario == credencial.IdUsuario, cancellationToken);

        if (entity is null)
        {
            throw new InvalidOperationException($"No existe credencial para el usuario {credencial.IdUsuario}.");
        }

        entity.PasswordHash = credencial.PasswordHash;
        entity.RequiereCambioPassword = credencial.RequiereCambioPassword;
        entity.IntentosFallidos = credencial.IntentosFallidos;
        entity.FechaBloqueo = credencial.FechaBloqueo;
        await _db.SaveChangesAsync(cancellationToken);
    }

    private static UsuarioCredencialSnapshot ToSnapshot(UsuarioCredencial entity)
    {
        return new UsuarioCredencialSnapshot
        {
            IdUsuario = entity.IdUsuario,
            PasswordHash = entity.PasswordHash,
            RequiereCambioPassword = entity.RequiereCambioPassword,
            IntentosFallidos = entity.IntentosFallidos,
            FechaBloqueo = entity.FechaBloqueo
        };
    }
}
