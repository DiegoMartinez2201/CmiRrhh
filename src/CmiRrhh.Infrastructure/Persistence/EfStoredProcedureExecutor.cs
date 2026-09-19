using System.Data;
using CmiRrhh.Domain.Interfaces;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence;

/// <summary>
/// Ejecuta SPs a través de la conexión del <see cref="CmiDbContext"/> (no abre un SqlConnection propio).
/// Solo se usa para result sets de procedimientos cuyo shape no está en el scaffold.
/// </summary>
public sealed class EfStoredProcedureExecutor : IStoredProcedureExecutor
{
    private readonly CmiDbContext _context;

    public EfStoredProcedureExecutor(CmiDbContext context)
    {
        _context = context;
    }

    public Task<DataTable> QueryAsync(string procedimiento, CancellationToken cancellationToken, params SqlParameter[] parametros)
        => QueryAsync(_context, procedimiento, cancellationToken, parametros);

    public Task ExecuteAsync(string procedimiento, CancellationToken cancellationToken, params SqlParameter[] parametros)
        => ExecuteAsync(_context, procedimiento, cancellationToken, parametros);

    public SqlParameter In(string name, object? value, SqlDbType type, int? size = null)
    {
        var parameter = size is null
            ? new SqlParameter(name, type) { Value = value ?? DBNull.Value }
            : new SqlParameter(name, type, size.Value) { Value = value ?? DBNull.Value };
        return parameter;
    }

    public SqlParameter Out(string name, SqlDbType type, int size = 0)
    {
        return new SqlParameter(name, type, size) { Direction = ParameterDirection.Output };
    }

    private static async Task<DataTable> QueryAsync(
        DbContext context,
        string procedureName,
        CancellationToken cancellationToken,
        params SqlParameter[] parameters)
    {
        var connection = context.Database.GetDbConnection();
        var openedHere = connection.State != ConnectionState.Open;
        if (openedHere)
        {
            await connection.OpenAsync(cancellationToken);
        }

        try
        {
            await using var command = connection.CreateCommand();
            command.CommandText = procedureName;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            foreach (var parameter in parameters)
            {
                command.Parameters.Add(parameter);
            }

            var table = new DataTable();
            await using var reader = await command.ExecuteReaderAsync(cancellationToken);
            table.Load(reader);
            return table;
        }
        finally
        {
            if (openedHere)
            {
                await connection.CloseAsync();
            }
        }
    }

    private static async Task ExecuteAsync(
        DbContext context,
        string procedureName,
        CancellationToken cancellationToken,
        params SqlParameter[] parameters)
    {
        var connection = context.Database.GetDbConnection();
        var openedHere = connection.State != ConnectionState.Open;
        if (openedHere)
        {
            await connection.OpenAsync(cancellationToken);
        }

        try
        {
            await using var command = connection.CreateCommand();
            command.CommandText = procedureName;
            command.CommandType = CommandType.StoredProcedure;
            command.CommandTimeout = 0;
            foreach (var parameter in parameters)
            {
                command.Parameters.Add(parameter);
            }

            await command.ExecuteNonQueryAsync(cancellationToken);
        }
        finally
        {
            if (openedHere)
            {
                await connection.CloseAsync();
            }
        }
    }
}
