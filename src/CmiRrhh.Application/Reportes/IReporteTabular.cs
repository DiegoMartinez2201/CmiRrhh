using System.Data;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Reportes;

/// <summary>
/// Un reporte tabular del sistema. Cada reporte es una clase propia registrada en DI (Strategy + OCP):
/// agregar uno nuevo no modifica <see cref="ReporteService"/> ni la página.
/// Los parámetros llegan ya validados y tipados como texto por clave.
/// </summary>
public interface IReporteTabular
{
    DefinicionReporte Definicion { get; }

    Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default);
}

internal static class FilaReporte
{
    /// <summary>Valor de una columna como texto limpio; vacío si la columna no existe o es NULL.</summary>
    public static string Texto(DataRow fila, string columna)
    {
        if (!fila.Table.Columns.Contains(columna) || fila[columna] is DBNull)
        {
            return string.Empty;
        }

        return fila[columna] is DateTime fecha
            ? fecha.ToString("dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture)
            : Convert.ToString(fila[columna], System.Globalization.CultureInfo.InvariantCulture)?.Trim() ?? string.Empty;
    }
}
