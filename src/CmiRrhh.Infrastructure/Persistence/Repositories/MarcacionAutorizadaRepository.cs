using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class MarcacionAutorizadaRepository : IMarcacionAutorizadaRepository
{
    private readonly CmiDbContext _context;

    public MarcacionAutorizadaRepository(CmiDbContext context)
    {
        _context = context;
    }

    public async Task<int> RegistrarAsync(
        int idEmpleado, DateOnly fecha, string tipo, string hora, string motivo, string documento, string? usuario,
        CancellationToken cancellationToken = default)
    {
        var entidad = new MarcacionAutorizada
        {
            IdEmpleado = idEmpleado,
            Fecha = fecha.ToDateTime(TimeOnly.MinValue),
            Tipo = tipo,
            Hora = hora,
            Motivo = motivo,
            Documento = documento,
            Usuario = usuario,
            FechaRegistro = DateTime.Now
        };
        _context.MarcacionesAutorizadas.Add(entidad);
        await _context.SaveChangesAsync(cancellationToken);
        return entidad.Id;
    }

    public async Task<IReadOnlyList<MarcacionAutorizadaRow>> ListarAsync(int idEmpleado, CancellationToken cancellationToken = default)
    {
        return await _context.MarcacionesAutorizadas
            .AsNoTracking()
            .Where(m => m.IdEmpleado == idEmpleado)
            .OrderByDescending(m => m.Fecha)
            .ThenByDescending(m => m.Id)
            .Select(m => new MarcacionAutorizadaRow
            {
                Id = m.Id,
                Fecha = m.Fecha,
                Tipo = m.Tipo,
                Hora = m.Hora,
                Motivo = m.Motivo,
                Documento = m.Documento,
                Usuario = m.Usuario,
                FechaRegistro = m.FechaRegistro
            })
            .ToListAsync(cancellationToken);
    }
}
