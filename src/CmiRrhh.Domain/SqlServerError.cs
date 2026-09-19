using Microsoft.Data.SqlClient;

namespace CmiRrhh.Domain;

public static class SqlServerError
{
    public static bool EsViolacionClaveUnica(Exception exception)
    {
        for (var current = exception; current is not null; current = current.InnerException)
        {
            if (current is SqlException sql && (sql.Number == 2627 || sql.Number == 2601))
            {
                return true;
            }
        }

        return false;
    }
}
