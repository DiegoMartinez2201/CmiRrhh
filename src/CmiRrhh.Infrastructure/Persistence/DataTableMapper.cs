using System.Data;
using System.Globalization;

namespace CmiRrhh.Infrastructure.Persistence;

internal static class DataTableMapper
{
    public static IReadOnlyList<T> Map<T>(DataTable table, Func<DataRow, T> selector)
    {
        var list = new List<T>(table.Rows.Count);
        foreach (DataRow row in table.Rows)
        {
            list.Add(selector(row));
        }

        return list;
    }

    public static string String(DataRow row, string column)
    {
        var value = row[column];
        return value is DBNull or null
            ? string.Empty
            : Convert.ToString(value, CultureInfo.InvariantCulture) ?? string.Empty;
    }

    public static string? StringOrNull(DataRow row, string column)
    {
        var value = row[column];
        return value is DBNull or null
            ? null
            : Convert.ToString(value, CultureInfo.InvariantCulture);
    }

    public static int Int(DataRow row, string column)
    {
        var value = row[column];
        return value is DBNull or null ? 0 : Convert.ToInt32(value, CultureInfo.InvariantCulture);
    }

    public static DateTime? Date(DataRow row, string column)
    {
        var value = row[column];
        return value is DBNull or null ? null : Convert.ToDateTime(value, CultureInfo.InvariantCulture);
    }

    public static bool? Bool(DataRow row, string column)
    {
        var value = row[column];
        return value is DBNull or null ? null : Convert.ToBoolean(value, CultureInfo.InvariantCulture);
    }
}
