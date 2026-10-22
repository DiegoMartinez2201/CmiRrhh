using System.Data;
using System.Globalization;
using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

/// <summary>Obtiene los datos de la ficha impresa con los mismos procedimientos que usa el sistema legado.</summary>
public sealed class FichaImpresaRepository : IFichaImpresaRepository
{
    private readonly IStoredProcedureExecutor _executor;

    public FichaImpresaRepository(IStoredProcedureExecutor executor)
    {
        _executor = executor;
    }

    public async Task<FichaImpresaDatos> ObtenerAsync(int idEmpleado, CancellationToken cancellationToken = default)
    {
        var personales = await EjecutarAsync("spRRHH_Ficha_DatosPersonales", idEmpleado, cancellationToken);
        var laborales = await EjecutarAsync("spRRHH_Ficha_ExpLab_Datos", idEmpleado, cancellationToken);
        var familiares = await EjecutarAsync("spRRHH_Ficha_Det_Familiar", idEmpleado, cancellationToken);

        return new FichaImpresaDatos
        {
            Personales = personales.FirstOrDefault() ?? new Dictionary<string, string>(),
            Laborales = laborales.FirstOrDefault() ?? new Dictionary<string, string>(),
            Familiares = familiares
        };
    }

    private async Task<List<IReadOnlyDictionary<string, string>>> EjecutarAsync(string procedimiento, int idEmpleado, CancellationToken cancellationToken)
    {
        var tabla = await _executor.QueryAsync(
            procedimiento,
            cancellationToken,
            _executor.In("@CodEmple", idEmpleado, SqlDbType.Int));

        return tabla.Rows.Cast<DataRow>().Select(Convertir).ToList();
    }

    private static IReadOnlyDictionary<string, string> Convertir(DataRow fila)
    {
        var valores = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        foreach (DataColumn columna in fila.Table.Columns)
        {
            valores[columna.ColumnName] = fila[columna] switch
            {
                DBNull => string.Empty,
                DateTime fecha => fecha.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture),
                bool b => b ? "Sí" : "No",
                byte[] => string.Empty,
                var otro => Convert.ToString(otro, CultureInfo.InvariantCulture)?.Trim() ?? string.Empty
            };
        }

        return valores;
    }
}
