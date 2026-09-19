using System.Data;
using System.Globalization;
using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class AsistenciaRepository : IAsistenciaRepository, IAsistenciaReporteRepository
{
    private readonly CmiDbContext _context;
    private readonly IStoredProcedureExecutor _executor;
    private readonly VerificadorEventoLaboralResolver _verificadores;

    public AsistenciaRepository(
        CmiDbContext context,
        IStoredProcedureExecutor executor,
        VerificadorEventoLaboralResolver verificadores)
    {
        _context = context;
        _executor = executor;
        _verificadores = verificadores;
    }

    public async Task<int> ExisteMarcacionAsync(int idEmpleado, string fecha, CancellationToken cancellationToken = default)
    {
        // Camino legado conservado por compatibilidad. El camino OCP recomendado es
        // VerificadorEventoLaboralResolver.Resolver("Marcacion").ExisteAsync(...).
        // La igualdad de Fecha se resuelve en VerificadorMarcacion (equivalente al SP).
        var dia = ParseFecha(fecha);
        var existe = await _verificadores.Resolver("Marcacion").ExisteAsync(idEmpleado, dia, cancellationToken);
        return existe ? 1 : 0;
    }

    public async Task<int> ExisteAsistenciaAsync(int idEmpleado, string fecha, CancellationToken cancellationToken = default)
    {
        // Camino legado conservado por compatibilidad. El camino OCP recomendado es
        // VerificadorEventoLaboralResolver.Resolver("Asistencia").ExisteAsync(...).
        // La igualdad de Fecha se resuelve en VerificadorAsistencia (equivalente al SP).
        var dia = ParseFecha(fecha);
        var existe = await _verificadores.Resolver("Asistencia").ExisteAsync(idEmpleado, dia, cancellationToken);
        return existe ? 1 : 0;
    }

    public async Task ActualizarAsistenciaAsync(int idEmpleado, DateTime fecha, string horSal, bool flagSal, CancellationToken cancellationToken = default)
    {
        // Regla 1: UPDATE de Hor_Sal / Flag_Sal en una sola fila de Asistencia.
        var asistencia = await _context.Asistencia
            .FirstOrDefaultAsync(a => a.IdEmpleado == idEmpleado && a.Fecha == fecha, cancellationToken)
            ?? throw new InvalidOperationException("No existe la asistencia indicada.");

        asistencia.HorSal = horSal;
        asistencia.FlagSal = flagSal;
        await _context.SaveChangesAsync(cancellationToken);
    }

    public Task<DataTable> ObtenerAsistenciasPorDiaAsync(string fecha, CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_GetAsistencias arma el listado diario con joins de horario/empleado.
        return _executor.QueryAsync(
            "spRRHH_GetAsistencias",
            cancellationToken,
            _executor.In("@dia", fecha, SqlDbType.Char, 8));
    }

    public async Task<IReadOnlyList<AsistenciaReporteRow>> ListarAsistenciasAsync(string fechaInicio, string fechaFin, CancellationToken cancellationToken = default)
    {
        // Regla 3: el legado llamaba spRRHH_GetRepAsistencias (no existe en CMI).
        // spRRHH_GetReporteAsistencia no tiene result set: borra/llena RegAsisDiario
        // usando cDifTpos (WITH ENCRYPTION). Se ejecuta igual y luego se lee la tabla.
        var inicio = ParseFecha(fechaInicio).Date;
        var fin = ParseFecha(fechaFin).Date;
        var fi = inicio.ToString("yyyyMMdd", CultureInfo.InvariantCulture);
        var ff = fin.ToString("yyyyMMdd", CultureInfo.InvariantCulture);

        await AsegurarRangoTempFechaAsync(inicio, fin, cancellationToken);

        await _executor.ExecuteAsync(
            "spRRHH_GetReporteAsistencia",
            cancellationToken,
            _executor.In("@FI", fi, SqlDbType.NVarChar, 16),
            _executor.In("@ff", ff, SqlDbType.NVarChar, 16),
            _executor.In("@Anio", DBNull.Value, SqlDbType.Int),
            _executor.In("@idTipoTrabajador", DBNull.Value, SqlDbType.Int));

        var finExclusivo = fin.AddDays(1);
        return await (
            from r in _context.RegAsisDiarios.AsNoTracking()
            join e in _context.Empleados.AsNoTracking() on r.IdEmpleado equals e.IdEmpleado
            join p in _context.Personas.AsNoTracking() on e.IdPersona equals p.IdPersona
            join eo in _context.EstructOrganizs.AsNoTracking()
                on new { e.Year, e.IdAreaOrganiz } equals new { eo.Year, eo.IdAreaOrganiz } into areas
            from eo in areas.DefaultIfEmpty()
            join a in _context.Asistencia.AsNoTracking()
                on new { r.IdEmpleado, r.Fecha } equals new { a.IdEmpleado, a.Fecha } into marcas
            from a in marcas.DefaultIfEmpty()
            where r.Fecha >= inicio && r.Fecha < finExclusivo
            orderby p.ApellidoPaterno, p.ApellidoMaterno, p.Nombres, r.Fecha
            select new AsistenciaReporteRow
            {
                Fecha = r.Fecha,
                IdEmpleado = r.IdEmpleado,
                NombresCompletos = ((p.ApellidoPaterno ?? string.Empty) + " " + (p.ApellidoMaterno ?? string.Empty)).Trim()
                    + (string.IsNullOrWhiteSpace(p.Nombres) ? string.Empty : ", " + p.Nombres),
                NumDocId = p.NumDocId,
                AreaOrganizacional = eo != null ? eo.AreaOrganizacional : null,
                Estado = r.Estado,
                MinTarde = r.MinTarde,
                MinNormales = r.MinNormales,
                HorEnt = a != null ? a.HorEnt : null,
                HorSal = a != null ? a.HorSal : null
            }).ToListAsync(cancellationToken);
    }

    private async Task AsegurarRangoTempFechaAsync(DateTime inicio, DateTime fin, CancellationToken cancellationToken)
    {
        var finExclusivo = fin.AddDays(1);
        var existentes = await _context.RrhhTempFechas
            .AsNoTracking()
            .Where(t => t.Fecha != null && t.Fecha >= inicio && t.Fecha < finExclusivo)
            .Select(t => t.Fecha!.Value)
            .ToListAsync(cancellationToken);

        var dias = existentes.Select(d => d.Date).ToHashSet();
        for (var dia = inicio; dia <= fin; dia = dia.AddDays(1))
        {
            if (dias.Contains(dia))
            {
                continue;
            }

            _context.RrhhTempFechas.Add(new RrhhTempFecha { Fecha = dia });
        }

        if (_context.ChangeTracker.HasChanges())
        {
            await _context.SaveChangesAsync(cancellationToken);
        }
    }

    public async Task<IReadOnlyList<PlanillaAsistenciaRow>> LlenarPlanillaAsistenciaAsync(
        string fechas, string idTipoTrabajador, string idLocales, CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_RepPlanillaAsistencias arma un PIVOT dinámico (SQL concatenado).
        // @idAreaOrganiz DEBE ser '00': si no, el SP ignora @idLocales y filtra por área
        // con Year=2014 hardcodeado (investigación Fase 5 Planilla). El legado no enviaba
        // este parámetro (default '00'); Fase 3 lo mandaba como DBNull y caía en esa rama.
        var table = await _executor.QueryAsync(
            "spRRHH_RepPlanillaAsistencias",
            cancellationToken,
            _executor.In("@Fechas", fechas, SqlDbType.NVarChar),
            _executor.In("@idTipoTrabajador", idTipoTrabajador, SqlDbType.Char, 1),
            _executor.In("@idAreaOrganiz", "00", SqlDbType.Char, 2),
            _executor.In("@idLocales", idLocales, SqlDbType.VarChar, 50));

        return MapPlanilla(table);
    }

    private static IReadOnlyList<PlanillaAsistenciaRow> MapPlanilla(DataTable table)
    {
        var fechaCols = new List<string>();
        foreach (DataColumn column in table.Columns)
        {
            if (EsColumnaFechaPivot(column.ColumnName))
            {
                fechaCols.Add(column.ColumnName);
            }
        }

        return DataTableMapper.Map(table, row =>
        {
            var estados = new Dictionary<string, string?>(fechaCols.Count, StringComparer.Ordinal);
            foreach (var fecha in fechaCols)
            {
                estados[fecha] = DataTableMapper.StringOrNull(row, fecha);
            }

            return new PlanillaAsistenciaRow
            {
                IdEmpleado = DataTableMapper.Int(row, "IdEmpleado"),
                NombresC = DataTableMapper.String(row, "NombresC"),
                MinTardeT = DataTableMapper.String(row, "MinTardeT"),
                DiasTardeT = DataTableMapper.String(row, "DiasTardeT"),
                DiasAsistidos = DataTableMapper.String(row, "DiasAsistidos"),
                EstadosPorFecha = estados
            };
        });
    }

    private static bool EsColumnaFechaPivot(string nombre)
        => DateTime.TryParseExact(
            nombre,
            "dd/MM/yyyy",
            CultureInfo.InvariantCulture,
            DateTimeStyles.None,
            out _);

    public Task<DataTable> ReporteAsistenciaDiariaAsync(
        string fechaInicio,
        string fechaFin,
        string dni,
        int? area,
        int? tipo,
        string? year,
        string idLocales,
        int opt = 0,
        CancellationToken cancellationToken = default)
    {
        // Regla 2: el método original ejecutaba spGetAsistenciasDetalle (filtros múltiples).
        _ = year;
        return _executor.QueryAsync(
            "spGetAsistenciasDetalle",
            cancellationToken,
            _executor.In("@FechaIni", ParseFecha(fechaInicio), SqlDbType.SmallDateTime),
            _executor.In("@FechaFin", ParseFecha(fechaFin), SqlDbType.SmallDateTime),
            _executor.In("@Dni", dni, SqlDbType.VarChar, 8),
            _executor.In("@Area", area, SqlDbType.Int),
            _executor.In("@TipoEmpleado", tipo, SqlDbType.Int),
            _executor.In("@idLocales", idLocales, SqlDbType.VarChar, 500),
            _executor.In("@opt", opt, SqlDbType.Int));
    }

    public async Task<AsistenciaDiaRow?> ObtenerAsistenciaDiaAsync(int codigo, string fecha, CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_GetAsistenciaDia (no cifrado) es SELECT * de Asistencia del día.
        var table = await _executor.QueryAsync(
            "spRRHH_GetAsistenciaDia",
            cancellationToken,
            _executor.In("@IdEmpleado", codigo, SqlDbType.Int),
            _executor.In("@Fecha", fecha, SqlDbType.Char, 8));

        if (table.Rows.Count == 0)
        {
            return null;
        }

        var row = table.Rows[0];
        return new AsistenciaDiaRow
        {
            Fecha = DataTableMapper.Date(row, "Fecha") ?? default,
            IdEmpleado = DataTableMapper.Int(row, "IdEmpleado"),
            HorEnt = DataTableMapper.StringOrNull(row, "Hor_Ent"),
            HorSal = DataTableMapper.StringOrNull(row, "Hor_Sal"),
            AlmSal = DataTableMapper.StringOrNull(row, "Alm_Sal"),
            AlmEnt = DataTableMapper.StringOrNull(row, "Alm_Ent"),
            FlagEnt = DataTableMapper.Bool(row, "Flag_Ent"),
            FlagSal = DataTableMapper.Bool(row, "Flag_Sal"),
            Estado = DataTableMapper.Bool(row, "Estado"),
            IdHorario = table.Rows[0].IsNull("idHorario") ? null : DataTableMapper.Int(row, "idHorario"),
            Usuario = DataTableMapper.StringOrNull(row, "Usuario"),
            Pc = DataTableMapper.StringOrNull(row, "PC")
        };
    }

    public Task<int> ContarMarcacionesEnRangoAsync(DateTime fechaInicio, DateTime fechaFin, CancellationToken cancellationToken = default)
    {
        var inicio = fechaInicio.Date;
        var finExclusivo = fechaFin.Date.AddDays(1);
        return _context.Marcacions.AsNoTracking()
            .CountAsync(m => m.Fecha >= inicio && m.Fecha < finExclusivo, cancellationToken);
    }

    public Task ImportarBioAsync(string fechaInicial, string fechaFinal, CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_ImportarAsistenciaBio carga marcas biométricas (proceso batch, no CRUD de una tabla).
        return _executor.ExecuteAsync(
            "spRRHH_ImportarAsistenciaBio",
            cancellationToken,
            _executor.In("@FechaInicio", fechaInicial, SqlDbType.NVarChar, 16),
            _executor.In("@FechaFin", fechaFinal, SqlDbType.NVarChar, 16));
    }

    private static DateTime ParseFecha(string fecha)
    {
        if (DateTime.TryParse(fecha, CultureInfo.CurrentCulture, DateTimeStyles.None, out var parsed))
        {
            return parsed;
        }

        if (DateTime.TryParseExact(
                fecha,
                new[] { "yyyyMMdd", "dd/MM/yyyy", "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss" },
                CultureInfo.InvariantCulture,
                DateTimeStyles.None,
                out parsed))
        {
            return parsed;
        }

        throw new FormatException($"Fecha no reconocida: {fecha}");
    }
}
