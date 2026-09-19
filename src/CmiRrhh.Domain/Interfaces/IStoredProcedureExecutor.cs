using System.Data;
using Microsoft.Data.SqlClient;

namespace CmiRrhh.Domain.Interfaces;

/// <summary>
/// Abstracción del ejecutor de stored procedures (DIP).
/// El <c>CmiDbContext</c> se inyecta en la implementación: Domain no referencia Infrastructure ni EF.
/// </summary>
public interface IStoredProcedureExecutor
{
    Task<DataTable> QueryAsync(string procedimiento, CancellationToken cancellationToken, params SqlParameter[] parametros);

    Task ExecuteAsync(string procedimiento, CancellationToken cancellationToken, params SqlParameter[] parametros);

    SqlParameter In(string name, object? value, SqlDbType type, int? size = null);

    SqlParameter Out(string name, SqlDbType type, int size = 0);
}
