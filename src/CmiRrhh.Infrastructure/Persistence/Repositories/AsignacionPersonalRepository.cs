using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class AsignacionPersonalRepository : IAsignacionPersonalRepository
{
    private const string EstadoActivo = "1";

    private readonly CmiDbContext _context;

    public AsignacionPersonalRepository(CmiDbContext context)
    {
        _context = context;
    }

    public async Task<IReadOnlyList<PersonalAsignacionRow>> ListarActivosAsync(
        int? idTipoTrabajador, string? apellido, CancellationToken cancellationToken = default)
    {
        // Regla 1: una sola consulta LINQ sobre Empleado + Persona (FK), con parámetros de EF.
        var consulta = _context.Empleados.AsNoTracking().Where(e => e.Estado == EstadoActivo);

        if (idTipoTrabajador is not null)
        {
            consulta = consulta.Where(e => e.IdTipoTrabajador == idTipoTrabajador);
        }

        var prefijo = apellido?.Trim();
        if (!string.IsNullOrEmpty(prefijo))
        {
            consulta = consulta.Where(e => e.IdPersonaNavigation!.ApellidoPaterno != null
                                           && e.IdPersonaNavigation.ApellidoPaterno.Contains(prefijo));
        }

        var filas = await consulta
            .OrderBy(e => e.IdPersonaNavigation!.ApellidoPaterno)
            .ThenBy(e => e.IdPersonaNavigation!.Nombres)
            .Select(e => new
            {
                e.IdEmpleado,
                Dni = e.IdPersonaNavigation!.NumDocId,
                e.IdPersonaNavigation.ApellidoPaterno,
                e.IdPersonaNavigation.ApellidoMaterno,
                e.IdPersonaNavigation.Nombres,
                e.IdHorario,
                e.IdLocal
            })
            .ToListAsync(cancellationToken);

        return filas
            .Select(f => new PersonalAsignacionRow
            {
                IdEmpleado = f.IdEmpleado,
                Dni = f.Dni?.Trim(),
                NombresCompletos = $"{f.ApellidoPaterno} {f.ApellidoMaterno}, {f.Nombres}".Trim(),
                IdHorario = f.IdHorario,
                IdLocal = f.IdLocal
            })
            .ToList();
    }

    public async Task<int> AsignarAsync(
        IReadOnlyCollection<int> idEmpleados, int? idHorario, int? idLocal, CancellationToken cancellationToken = default)
    {
        if (idEmpleados.Count == 0 || (idHorario is null && idLocal is null))
        {
            return 0;
        }

        var ids = idEmpleados.Distinct().ToList();
        var actualizados = 0;

        // Dos UPDATE masivos parametrizados dentro de una transacción: o se aplica todo o nada.
        await using var tx = await _context.Database.BeginTransactionAsync(cancellationToken);

        // Un UPDATE parametrizado por empleado (igualdad simple). Se evita Contains(lista) porque
        // EF Core 8 lo traduce a OPENJSON, función que esta base de datos no soporta.
        foreach (var id in ids)
        {
            var idActual = id;
            var filas = 0;

            if (idHorario is not null)
            {
                filas = await _context.Empleados
                    .Where(e => e.IdEmpleado == idActual && e.Estado == EstadoActivo)
                    .ExecuteUpdateAsync(s => s.SetProperty(e => e.IdHorario, idHorario), cancellationToken);
            }

            if (idLocal is not null)
            {
                filas = await _context.Empleados
                    .Where(e => e.IdEmpleado == idActual && e.Estado == EstadoActivo)
                    .ExecuteUpdateAsync(s => s.SetProperty(e => e.IdLocal, idLocal), cancellationToken);
            }

            actualizados += filas;
        }

        await tx.CommitAsync(cancellationToken);
        return actualizados;
    }
}
