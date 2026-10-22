using System.Data;
using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using Microsoft.Data.SqlClient;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class ReporteRepository : IReporteRepository
{
    private readonly IStoredProcedureExecutor _executor;

    public ReporteRepository(CmiDbContext context, IStoredProcedureExecutor executor)
    {
        ArgumentNullException.ThrowIfNull(context);
        _executor = executor;
    }

    public Task<DataTable> GenerarCuadroPersonalAsync(int tipo, CancellationToken cancellationToken = default)
    {
        // Regla 3: spRRHH_Report_CuadroPer está WITH ENCRYPTION.
        return _executor.QueryAsync(
            "spRRHH_Report_CuadroPer",
            cancellationToken,
            _executor.In("@Tipo", tipo, SqlDbType.Int));
    }

    public Task<DataTable> GenerarCumplesAsync(int mes, CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_Report_Cumple arma el listado mensual (joins de ficha/persona).
        return _executor.QueryAsync(
            "spRRHH_Report_Cumple",
            cancellationToken,
            _executor.In("@mes", mes, SqlDbType.Int));
    }

    public Task<DataTable> GenerarReporteOficinaAsync(int codigoOficina, CancellationToken cancellationToken = default)
    {
        // Regla 3: spRRHH_Report_Oficina_Unico está WITH ENCRYPTION.
        return _executor.QueryAsync(
            "spRRHH_Report_Oficina_Unico",
            cancellationToken,
            _executor.In("@idarea", codigoOficina, SqlDbType.Int));
    }

    public Task<DataTable> GenerarReporteOficinaDependenciaAsync(string sigla, CancellationToken cancellationToken = default)
    {
        // Regla 3: spRRHH_Report_Oficina está WITH ENCRYPTION.
        return _executor.QueryAsync(
            "spRRHH_Report_Oficina",
            cancellationToken,
            _executor.In("@sigla", sigla, SqlDbType.VarChar, 100));
    }

    public Task<DataTable> GenerarReporteFichaEmpleadoAsync(string fechaInicio, string fechaTermino, int tipo, CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_Report_FechaIngreso filtra ingresos/egresos por rango y tipo.
        return _executor.QueryAsync(
            "spRRHH_Report_FechaIngreso",
            cancellationToken,
            _executor.In("@FechaIni", fechaInicio, SqlDbType.Char, 8),
            _executor.In("@FechaFin", fechaTermino, SqlDbType.Char, 8),
            _executor.In("@tipo", tipo, SqlDbType.Int));
    }

    public Task<DataTable> GenerarReporteCargosAsync(int idCargo, CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_Rep_cargos lista trabajadores del cargo (joins de ficha).
        return _executor.QueryAsync(
            "spRRHH_Rep_cargos",
            cancellationToken,
            _executor.In("@idCargo", idCargo, SqlDbType.Int));
    }

    public Task<DataTable> AgregarReporteAsync(int idEmpleado, int opcion, CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_AgregarReporte arma el dataset auxiliar de reporte.
        return _executor.QueryAsync(
            "spRRHH_AgregarReporte",
            cancellationToken,
            _executor.In("@idEmpleado", idEmpleado, SqlDbType.Int),
            _executor.In("@opt", opcion, SqlDbType.Int));
    }

    public Task<DataTable> ListarTrabajadoresAsync(int idTipoTrabajador, CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_ListarTrabajadores filtra por modalidad con joins de organigrama.
        return _executor.QueryAsync(
            "spRRHH_ListarTrabajadores",
            cancellationToken,
            _executor.In("@IdTipoTrabajador", idTipoTrabajador, SqlDbType.Int));
    }

    public Task<DataTable> ObtenerHorasExtrasAsync(string fechaInicio, string fechaFin, int? tipo, CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_ObtenerHorasExtras calcula extras en un rango (no es un SELECT plano).
        return _executor.QueryAsync(
            "spRRHH_ObtenerHorasExtras",
            cancellationToken,
            _executor.In("@FechaI", fechaInicio, SqlDbType.VarChar, 8),
            _executor.In("@FechaF", fechaFin, SqlDbType.VarChar, 8),
            _executor.In("@tipo", tipo, SqlDbType.Int));
    }

    public Task<DataTable> GenerarFaltasAsync(string fecha, int? idTipoTrabajador, int? idAreaOrganiz, int? anio, CancellationToken cancellationToken = default)
    {
        // spRRHH_Faltas compara convert(char(10), Fecha, 103) = @fecha, por eso la fecha va como dd/MM/yyyy.
        // @Anio filtra Empleado.Year (año de la ficha del empleado, no el de la fecha): NULL = sin filtro,
        // que es lo que envía el legado por defecto. Las vistas no repiten empleados por año.
        return _executor.QueryAsync(
            "spRRHH_Faltas",
            cancellationToken,
            _executor.In("@fecha", fecha, SqlDbType.Char, 10),
            _executor.In("@idTipoTrabajador", idTipoTrabajador, SqlDbType.Int),
            _executor.In("@idAreaOrganiz", idAreaOrganiz, SqlDbType.Int),
            _executor.In("@Anio", anio, SqlDbType.Int));
    }

    public async Task<IReadOnlyList<string>> ListarProfesionesAsync(CancellationToken cancellationToken = default)
    {
        var tabla = await _executor.QueryAsync("sp_RRHH_ListarProfesiones", cancellationToken);
        return tabla.Rows.Cast<DataRow>()
            .Select(f => f[0]?.ToString()?.Trim() ?? string.Empty)
            .Where(p => p.Length > 0)
            .Distinct(StringComparer.CurrentCultureIgnoreCase)
            .OrderBy(p => p, StringComparer.CurrentCultureIgnoreCase)
            .ToList();
    }

    public Task<DataTable> GenerarReporteProfesionAsync(string profesion, CancellationToken cancellationToken = default)
    {
        // spRRHH_Rep_profesion compara e.Profesion = @profesion con el texto exacto de la lista.
        return _executor.QueryAsync(
            "spRRHH_Rep_profesion",
            cancellationToken,
            _executor.In("@profesion", profesion, SqlDbType.NVarChar, 200));
    }
}
