using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class CatalogoRepository : ICatalogoRepository
{
    private readonly CmiDbContext _context;

    public CatalogoRepository(CmiDbContext context)
    {
        _context = context;
    }

    public async Task<IReadOnlyList<CatalogoItem>> ListarLocalesAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Locals.AsNoTracking()
            .OrderBy(l => l.IdLocal)
            .Select(l => new CatalogoItem
            {
                Id = l.IdLocal,
                Nombre = l.NombreLocal ?? l.IdLocal.ToString()
            })
            .ToListAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<CatalogoItem>> ListarTiposTrabajadorAsync(CancellationToken cancellationToken = default)
    {
        return await _context.TipoTrabajadors.AsNoTracking()
            .OrderBy(t => t.IdTipoTrabajador)
            .Select(t => new CatalogoItem
            {
                Id = t.IdTipoTrabajador,
                Nombre = t.Descripcion ?? t.IdTipoTrabajador.ToString()
            })
            .ToListAsync(cancellationToken);
    }

    public async Task<bool> ExistenTodosLosLocalesAsync(
        IReadOnlyList<int> idLocales, CancellationToken cancellationToken = default)
    {
        var distintos = idLocales.Distinct().ToList();
        if (distintos.Count == 0)
        {
            return true;
        }

        var existentes = await _context.Locals.AsNoTracking()
            .CountAsync(l => distintos.Contains(l.IdLocal), cancellationToken);
        return existentes == distintos.Count;
    }

    public async Task<IReadOnlyList<MotivoPermisoItem>> ListarMotivosPermisoAsync(CancellationToken cancellationToken = default)
    {
        return await _context.MotivoPerms.AsNoTracking()
            .Where(m => m.Activo == true)
            .OrderBy(m => m.IdTipoPermisoNavigation!.DescripTipoPermiso)
            .ThenBy(m => m.DescripMotivo)
            .Select(m => new MotivoPermisoItem
            {
                IdMotivo = m.IdMotivo,
                DescripMotivo = m.DescripMotivo ?? m.IdMotivo.ToString(),
                IdTipoPermiso = m.IdTipoPermiso,
                DescripTipoPermiso = m.IdTipoPermisoNavigation != null ? m.IdTipoPermisoNavigation.DescripTipoPermiso : null,
                Salario = m.Salario == true,
                TipoModalidad = m.TipoModalidad
            })
            .ToListAsync(cancellationToken);
    }
}
