using System.Data;
using System.Globalization;
using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class EstructuraOrganizacionalRepository : IEstructuraOrganizacionalRepository
{
    private readonly CmiDbContext _context;
    private readonly IStoredProcedureExecutor _executor;

    public EstructuraOrganizacionalRepository(CmiDbContext context, IStoredProcedureExecutor executor)
    {
        _context = context;
        _executor = executor;
    }

    public async Task<IReadOnlyList<int>> ListarAniosAsync(CancellationToken cancellationToken = default)
    {
        return await _context.EstructOrganizs.AsNoTracking()
            .Select(a => a.Year)
            .Distinct()
            .OrderByDescending(a => a)
            .ToListAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<UnidadOrganica>> ListarUnidadesAsync(int anio, CancellationToken cancellationToken = default)
    {
        // Misma consulta del legado (llena_tree), con el año como parámetro.
        var filas = await _context.EstructOrganizs.AsNoTracking()
            .Where(a => a.Year == anio)
            .OrderBy(a => a.AreaOrganizacional)
            .Select(a => new { a.IdAreaOrganiz, a.AreaOrganizacional, a.Sigla, a.IdDependeDe })
            .ToListAsync(cancellationToken);

        return filas
            .Select(a => new UnidadOrganica
            {
                Id = a.IdAreaOrganiz,
                Nombre = (a.AreaOrganizacional ?? string.Empty).Trim(),
                Sigla = (a.Sigla ?? string.Empty).Trim(),
                IdPadre = a.IdDependeDe
            })
            .ToList();
    }

    public async Task<IReadOnlyList<PersonalUnidadRow>> ListarPersonalAsync(
        int anio,
        int idAreaOrganiz,
        int idTipoTrabajador,
        CancellationToken cancellationToken = default)
    {
        // sp_RRHH_Busca_Empleado_tree no está cifrado; @estado = 1 devuelve solo personal activo.
        var table = await _executor.QueryAsync(
            "sp_RRHH_Busca_Empleado_tree",
            cancellationToken,
            _executor.In("@idAreaOrganiz", idAreaOrganiz, SqlDbType.Int),
            _executor.In("@year", anio, SqlDbType.Int),
            _executor.In("@estado", true, SqlDbType.Bit),
            _executor.In("@tipotrabajador", idTipoTrabajador, SqlDbType.Int));

        var filas = new List<PersonalUnidadRow>(table.Rows.Count);
        foreach (DataRow row in table.Rows)
        {
            filas.Add(new PersonalUnidadRow
            {
                IdTipoTrabajador = Entero(table, row, "idtipoTrabajador"),
                Codigo = Entero(table, row, "Codigo"),
                Dni = Texto(table, row, "DNI"),
                NombresCompletos = Texto(table, row, "NombresCompletos", "Nombres Completos"),
                Cargo = Texto(table, row, "Cargo")
            });
        }

        return filas.OrderBy(f => f.NombresCompletos, StringComparer.CurrentCultureIgnoreCase).ToList();
    }

    // La vista subyacente ha tenido nombres de columna con y sin espacio: se aceptan ambas formas.
    private static string Texto(DataTable table, DataRow row, params string[] columnas)
    {
        foreach (var c in columnas)
        {
            if (table.Columns.Contains(c) && row[c] is not DBNull)
            {
                return row[c]?.ToString()?.Trim() ?? string.Empty;
            }
        }

        return string.Empty;
    }

    private static int Entero(DataTable table, DataRow row, string columna)
        => table.Columns.Contains(columna) && row[columna] is not DBNull
            ? Convert.ToInt32(row[columna], CultureInfo.InvariantCulture)
            : 0;
}
