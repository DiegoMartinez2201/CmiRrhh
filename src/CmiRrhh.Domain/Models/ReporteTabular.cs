namespace CmiRrhh.Domain.Models;

public enum TipoParametroReporte
{
    Mes,
    Fecha,
    Cargo,

    /// <summary>Tipo de trabajador opcional: 0 = todos.</summary>
    TipoTrabajador,

    /// <summary>Tipo de trabajador obligatorio (no admite «todos»).</summary>
    TipoTrabajadorObligatorio,

    /// <summary>Tipo de permiso opcional: 0 = todos.</summary>
    TipoPermiso
}

/// <summary>Parámetro que el usuario debe indicar antes de ejecutar un reporte.</summary>
public sealed record ParametroReporte(string Clave, string Etiqueta, TipoParametroReporte Tipo);

public sealed record DefinicionReporte(
    string Clave, string Titulo, string Descripcion, IReadOnlyList<ParametroReporte> Parametros);

/// <summary>Resultado de un reporte ya listo para mostrarse o exportar.</summary>
public sealed class ReporteTabla
{
    public IReadOnlyList<string> Columnas { get; init; } = Array.Empty<string>();

    public IReadOnlyList<IReadOnlyList<string>> Filas { get; init; } = Array.Empty<IReadOnlyList<string>>();
}
