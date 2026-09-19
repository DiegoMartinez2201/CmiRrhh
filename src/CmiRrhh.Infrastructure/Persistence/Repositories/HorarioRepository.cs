using System.Data;
using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
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
}
