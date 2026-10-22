using System.Data;
using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class HorarioRepository : IHorarioRepository
{
    private readonly CmiDbContext _context;
    private readonly IStoredProcedureExecutor _executor;

    public HorarioRepository(CmiDbContext context, IStoredProcedureExecutor executor)
    {
        _context = context;
        _executor = executor;
    }

    public async Task<int> SiguienteIdHorarioTemporalAsync(int idEmpleado, CancellationToken cancellationToken = default)
    {
        // Regla 1: ISNULL(MAX(N),0)+1 sobre HorarioTemporal del empleado.
        var maximo = await _context.HorarioTemporals
            .Where(h => h.IdEmpleado == idEmpleado)
            .Select(h => (int?)h.N)
            .MaxAsync(cancellationToken);
        return (maximo ?? 0) + 1;
    }

    public async Task EliminarHorarioTemporalAsync(int idEmpleado, int n, CancellationToken cancellationToken = default)
    {
        // Regla 1: DELETE de HorarioTemporal por PK (IdEmpleado, N).
        var horario = await _context.HorarioTemporals
            .FirstOrDefaultAsync(h => h.IdEmpleado == idEmpleado && h.N == n, cancellationToken);
        if (horario is null)
        {
            return;
        }

        _context.HorarioTemporals.Remove(horario);
        await _context.SaveChangesAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<HorarioTemporalRow>> ListarHorariosTemporalesAsync(int idEmpleado, CancellationToken cancellationToken = default)
    {
        // Regla 1 (listado simple): spRRHH_llenarHorarioTemporal; se mapea a DTO (PoC Fase 7).
        var table = await _executor.QueryAsync(
            "spRRHH_llenarHorarioTemporal",
            cancellationToken,
            _executor.In("@IdEmpleado", idEmpleado, SqlDbType.Int));

        return DataTableMapper.Map(table, row => new HorarioTemporalRow
        {
            N = DataTableMapper.Int(row, "N"),
            FechaInicio = DataTableMapper.Date(row, "FechaInicio"),
            FechaFin = DataTableMapper.Date(row, "FechaFin"),
            DescripHorario = DataTableMapper.StringOrNull(row, "Descrip_Horario"),
            Ingreso1 = DataTableMapper.StringOrNull(row, "Ingreso1"),
            Salida2 = DataTableMapper.StringOrNull(row, "Salida2"),
            NroDocumento = DataTableMapper.StringOrNull(row, "NroDocumento"),
            Sisgedo = DataTableMapper.StringOrNull(row, "Sisgedo")
        });
    }

    public async Task RegistrarHorarioTemporalAsync(
        int idEmpleado,
        int n,
        int idHorario,
        DateOnly fechaInicio,
        DateOnly fechaFin,
        string? nroDocumento,
        string? sisgedo,
        CancellationToken cancellationToken = default)
    {
        // Regla 1: INSERT directo en HorarioTemporal; no se encontró SP de alta en RRHHClass.
        _context.HorarioTemporals.Add(new HorarioTemporal
        {
            IdEmpleado = idEmpleado,
            N = n,
            HorarioAsignado = idHorario,
            FechaInicio = fechaInicio,
            FechaFin = fechaFin,
            NroDocumento = nroDocumento,
            Sisgedo = sisgedo,
            FechaRegistro = DateTime.Now
        });
        await _context.SaveChangesAsync(cancellationToken);
    }

    public async Task<bool> TieneHorarioTemporalSolapadoAsync(
        int idEmpleado, int idHorario, DateOnly fechaInicio, DateOnly fechaFin, CancellationToken cancellationToken = default)
    {
        return await _context.HorarioTemporals.AsNoTracking().AnyAsync(
            h => h.IdEmpleado == idEmpleado
                 && h.HorarioAsignado == idHorario
                 && h.FechaInicio != null && h.FechaFin != null
                 && h.FechaInicio <= fechaFin && h.FechaFin >= fechaInicio,
            cancellationToken);
    }

    public async Task<IReadOnlyList<HorarioRow>> ListarHorariosAsync(CancellationToken cancellationToken = default)
    {
        return await _context.Horarios
            .AsNoTracking()
            .OrderBy(h => h.DescripHorario)
            .Select(h => new HorarioRow
            {
                IdHorario = h.IdHorario,
                DescripHorario = h.DescripHorario,
                Ingreso1 = h.Ingreso1,
                Salida1 = h.Salida1,
                Ingreso2 = h.Ingreso2,
                Salida2 = h.Salida2,
                Estado = h.Estado,
                SgtDia = h.SgtDia,
                TieneEmpleadosAsignados = h.Empleados.Any()
            })
            .ToListAsync(cancellationToken);
    }

    public async Task<HorarioRow?> ObtenerHorarioAsync(int idHorario, CancellationToken cancellationToken = default)
    {
        return await _context.Horarios
            .AsNoTracking()
            .Where(h => h.IdHorario == idHorario)
            .Select(h => new HorarioRow
            {
                IdHorario = h.IdHorario,
                DescripHorario = h.DescripHorario,
                Ingreso1 = h.Ingreso1,
                Salida1 = h.Salida1,
                Ingreso2 = h.Ingreso2,
                Salida2 = h.Salida2,
                Estado = h.Estado,
                SgtDia = h.SgtDia,
                TieneEmpleadosAsignados = h.Empleados.Any()
            })
            .FirstOrDefaultAsync(cancellationToken);
    }

    public Task<bool> ExisteHorarioAsync(int idHorario, CancellationToken cancellationToken = default)
        => _context.Horarios.AsNoTracking().AnyAsync(h => h.IdHorario == idHorario, cancellationToken);

    public async Task<int> CrearHorarioAsync(HorarioDatos datos, CancellationToken cancellationToken = default)
    {
        // Regla 1: INSERT directo; no se encontró SP de alta de Horario en RRHHClass
        // (mantenimiento de catálogo simple, como Feriados).
        var siguiente = await _context.Horarios
            .Select(h => (int?)h.IdHorario)
            .MaxAsync(cancellationToken) ?? 0;

        var entidad = new Horario
        {
            IdHorario = siguiente + 1,
            DescripHorario = datos.DescripHorario,
            Ingreso1 = datos.Ingreso1,
            Salida1 = datos.Salida1,
            Ingreso2 = datos.Ingreso2,
            Salida2 = datos.Salida2,
            Estado = datos.Estado,
            SgtDia = datos.SgtDia
        };
        _context.Horarios.Add(entidad);
        await _context.SaveChangesAsync(cancellationToken);
        return entidad.IdHorario;
    }

    public async Task ActualizarHorarioAsync(int idHorario, HorarioDatos datos, CancellationToken cancellationToken = default)
    {
        var entidad = await _context.Horarios.FirstOrDefaultAsync(h => h.IdHorario == idHorario, cancellationToken)
            ?? throw new InvalidOperationException("No existe el horario indicado.");

        entidad.DescripHorario = datos.DescripHorario;
        entidad.Ingreso1 = datos.Ingreso1;
        entidad.Salida1 = datos.Salida1;
        entidad.Ingreso2 = datos.Ingreso2;
        entidad.Salida2 = datos.Salida2;
        entidad.Estado = datos.Estado;
        entidad.SgtDia = datos.SgtDia;
        await _context.SaveChangesAsync(cancellationToken);
    }

    public Task<bool> TieneEmpleadosAsignadosAsync(int idHorario, CancellationToken cancellationToken = default)
        => _context.Empleados.AsNoTracking().AnyAsync(e => e.IdHorario == idHorario, cancellationToken);

    public async Task EliminarHorarioAsync(int idHorario, CancellationToken cancellationToken = default)
    {
        var entidad = await _context.Horarios.FirstOrDefaultAsync(h => h.IdHorario == idHorario, cancellationToken);
        if (entidad is null)
        {
            return;
        }

        _context.Horarios.Remove(entidad);
        await _context.SaveChangesAsync(cancellationToken);
    }
}
