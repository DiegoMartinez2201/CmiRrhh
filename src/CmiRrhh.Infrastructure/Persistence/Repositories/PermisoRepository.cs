using System.Data;
using System.Globalization;
using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class PermisoRepository : IPermisoRepository, IPermisoReporteRepository
{
    private readonly CmiDbContext _context;
    private readonly IStoredProcedureExecutor _executor;

    public PermisoRepository(CmiDbContext context, IStoredProcedureExecutor executor)
    {
        _context = context;
        _executor = executor;
    }

    public async Task<int> SiguienteIdPermisoAsync(int idEmpleado, CancellationToken cancellationToken = default)
    {
        // Regla 1: ISNULL(MAX(NPermiso),0)+1 sobre Permiso del empleado.
        var maximo = await _context.Permisos
            .Where(p => p.IdEmpleado == idEmpleado)
            .Select(p => (int?)p.Npermiso)
            .MaxAsync(cancellationToken);
        return (maximo ?? 0) + 1;
    }

    public async Task EliminarPermisoAsync(int idEmpleado, int nPermiso, CancellationToken cancellationToken = default)
    {
        // Regla 1: DELETE de una fila de Permiso por PK (IdEmpleado, NPermiso).
        var permiso = await _context.Permisos
            .FirstOrDefaultAsync(p => p.IdEmpleado == idEmpleado && p.Npermiso == nPermiso, cancellationToken);
        if (permiso is null)
        {
            return;
        }

        _context.Permisos.Remove(permiso);
        await _context.SaveChangesAsync(cancellationToken);
    }

    public async Task<int> ExistePermisoAsync(int idEmpleado, string fechaInicio, string fechaFin, CancellationToken cancellationToken = default)
    {
        // ExistePermiso queda FUERA de IVerificadorEventoLaboral (Strategy de eventos puntuales).
        // Opera sobre un rango FechaInicio/FechaFin, no sobre una fecha única; encajarlo en
        // ExisteAsync(idEmpleado, fecha) distorsionaría el contrato. Se mantiene aquí (Fase 3, Regla 1).
        //
        // Verificado vs sp_ExistePermiso_Permiso (OBJECT_DEFINITION, no cifrado):
        //   @FechaInicio/@FechaFin char(8)
        //   (@FechaInicio BETWEEN CONVERT(char(8), FechaInicio, 112) AND CONVERT(char(8), FechaFin, 112))
        //   OR (@FechaFin BETWEEN ...). Style 112 = yyyyMMdd (solo fecha); BETWEEN es inclusivo.
        // El SP solo pregunta si algún extremo del rango cae dentro de un permiso existente
        // (no detecta un permiso contenido por completo en el rango consultado).
        // LINQ usa solape inclusivo estándar (inicio <= FechaFin && fin >= FechaInicio):
        // mismos bordes inclusivos que BETWEEN, y además cubre el caso contenido.
        // Permiso.FechaInicio/FechaFin son datetime a 00:00:00 en todas las filas actuales.
        var inicio = ParseFecha(fechaInicio);
        var fin = ParseFecha(fechaFin);
        return await _context.Permisos.CountAsync(
            p => p.IdEmpleado == idEmpleado
                 && p.FechaInicio != null
                 && p.FechaFin != null
                 && inicio <= p.FechaFin
                 && fin >= p.FechaInicio,
            cancellationToken);
    }

    public async Task<IReadOnlyList<PermisoRow>> ListarPermisosAsync(int idEmpleado, int? tipoPermiso, int? motivo, CancellationToken cancellationToken = default)
    {
        // Regla 1 (listado simple): spRRHH_llenarPermiso; se mapea a DTO (PoC Fase 7).
        var table = await _executor.QueryAsync(
            "spRRHH_llenarPermiso",
            cancellationToken,
            _executor.In("@IdEmpleado", idEmpleado, SqlDbType.Int),
            _executor.In("@idTipoPermiso", tipoPermiso, SqlDbType.Int),
            _executor.In("@idmotivo", motivo, SqlDbType.Int));

        return DataTableMapper.Map(table, row => new PermisoRow
        {
            DescripTipoPermiso = DataTableMapper.String(row, "DescripTipoPermiso"),
            DescripMotivo = DataTableMapper.String(row, "Descrip_Motivo"),
            NPermiso = DataTableMapper.Int(row, "NPermiso"),
            FechaInicio = DataTableMapper.Date(row, "FechaInicio"),
            FechaFin = DataTableMapper.Date(row, "FechaFin"),
            HoraSal = DataTableMapper.StringOrNull(row, "Hora_Sal"),
            HoraRet = DataTableMapper.StringOrNull(row, "Hora_Ret"),
            Dia = DataTableMapper.Bool(row, "dia"),
            Retorno = DataTableMapper.Bool(row, "Retorno"),
            Lugar = DataTableMapper.StringOrNull(row, "Lugar"),
            Referencia = DataTableMapper.StringOrNull(row, "Referencia"),
            Autorizacion = DataTableMapper.StringOrNull(row, "Autorizacion"),
            IdEmpleado = DataTableMapper.Int(row, "IdEmpleado")
        });
    }

    public Task<DataTable> ReportePermisosAsync(
        string fechaInicio,
        string fechaFin,
        int? tipoPermiso,
        int? motivo,
        int? idTipoTrabajador,
        CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_RepPermisos es un reporte con varios filtros opcionales.
        return _executor.QueryAsync(
            "spRRHH_RepPermisos",
            cancellationToken,
            _executor.In("@FechaInicio", fechaInicio, SqlDbType.NVarChar, 16),
            _executor.In("@FechaFin", fechaFin, SqlDbType.NVarChar, 16),
            _executor.In("@idTipoPermiso", tipoPermiso, SqlDbType.Int),
            _executor.In("@idmotivo", motivo, SqlDbType.Int),
            _executor.In("@idtipoEmpleado", idTipoTrabajador, SqlDbType.Int));
    }

    public Task<DataTable> EstadisticaPermisoAsync(
        string idTipoTrabajador,
        string fechaInicio,
        string fechaFin,
        string idMotivos,
        string motivos,
        string motivosNull,
        string idAreas,
        CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_EstadisticaPermiso agrega por listas de motivos/áreas (lógica de reporte).
        return _executor.QueryAsync(
            "spRRHH_EstadisticaPermiso",
            cancellationToken,
            _executor.In("@IdTipoTrabajador", idTipoTrabajador, SqlDbType.Char, 1),
            _executor.In("@FechaInicio", fechaInicio, SqlDbType.Char, 8),
            _executor.In("@FechaFin", fechaFin, SqlDbType.Char, 8),
            _executor.In("@idMotivos", idMotivos, SqlDbType.VarChar, 150),
            _executor.In("@Motivos", motivos, SqlDbType.VarChar, 450),
            _executor.In("@MotivosNull", motivosNull, SqlDbType.VarChar, 2050),
            _executor.In("@idAreas", idAreas, SqlDbType.VarChar, 450));
    }

    public Task<DataTable> ResumenEstadisticaPermisoAsync(
        string fechaInicio,
        string fechaFin,
        int idMotivo,
        int idArea,
        CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_ResumenEstadisticaPermiso resume permisos por área/motivo.
        return _executor.QueryAsync(
            "spRRHH_ResumenEstadisticaPermiso",
            cancellationToken,
            _executor.In("@idAreaOrganiz", idArea, SqlDbType.Int),
            _executor.In("@idMotivo", idMotivo, SqlDbType.Int),
            _executor.In("@FechaInicio", fechaInicio, SqlDbType.Char, 8),
            _executor.In("@FechaFin", fechaFin, SqlDbType.Char, 8),
            _executor.In("@IdTipoTrabajador", DBNull.Value, SqlDbType.Int));
    }

    private static DateTime ParseFecha(string fecha)
    {
        if (DateTime.TryParse(fecha, CultureInfo.CurrentCulture, DateTimeStyles.None, out var parsed))
        {
            return parsed;
        }

        if (DateTime.TryParseExact(
                fecha,
                new[] { "yyyyMMdd", "dd/MM/yyyy", "yyyy-MM-dd" },
                CultureInfo.InvariantCulture,
                DateTimeStyles.None,
                out parsed))
        {
            return parsed;
        }

        throw new FormatException($"Fecha no reconocida: {fecha}");
    }
}
