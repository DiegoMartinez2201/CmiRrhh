using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class FeriadoRepository : IFeriadoRepository
{
    private readonly CmiDbContext _context;

    public FeriadoRepository(CmiDbContext context)
    {
        _context = context;
    }

    public async Task<IReadOnlyList<FeriadoRow>> ListarAsync(CancellationToken cancellationToken = default)
    {
        return await _context.RrhhFeriados
            .AsNoTracking()
            .OrderBy(f => f.Fecha)
            .Select(f => new FeriadoRow
            {
                IdFeriado = f.IdFeriado,
                Fecha = f.Fecha,
                Motivo = f.Motivo
            })
            .ToListAsync(cancellationToken);
    }

    public async Task<bool> ExisteFechaAsync(DateOnly fecha, CancellationToken cancellationToken = default)
    {
        // Regla 1: GetFeriado del legado compara por char(10) estilo 103 (dd/mm/yyyy),
        // es decir, solo la parte de fecha — equivalente a comparar por .Date aquí.
        var dia = fecha.ToDateTime(TimeOnly.MinValue);
        var diaSiguiente = dia.AddDays(1);
        return await _context.RrhhFeriados.AsNoTracking()
            .AnyAsync(f => f.Fecha >= dia && f.Fecha < diaSiguiente, cancellationToken);
    }

    public async Task<int> AgregarAsync(DateOnly fecha, string? motivo, CancellationToken cancellationToken = default)
    {
        var siguiente = await _context.RrhhFeriados
            .Select(f => (int?)f.IdFeriado)
            .MaxAsync(cancellationToken) ?? 0;

        var entidad = new RrhhFeriado
        {
            IdFeriado = siguiente + 1,
            Fecha = fecha.ToDateTime(TimeOnly.MinValue),
            Motivo = motivo
        };
        _context.RrhhFeriados.Add(entidad);
        await _context.SaveChangesAsync(cancellationToken);
        return entidad.IdFeriado;
    }

    public async Task EliminarAsync(int idFeriado, CancellationToken cancellationToken = default)
    {
        var entidad = await _context.RrhhFeriados.FirstOrDefaultAsync(f => f.IdFeriado == idFeriado, cancellationToken);
        if (entidad is null)
        {
            return;
        }

        _context.RrhhFeriados.Remove(entidad);
        await _context.SaveChangesAsync(cancellationToken);
    }
}
