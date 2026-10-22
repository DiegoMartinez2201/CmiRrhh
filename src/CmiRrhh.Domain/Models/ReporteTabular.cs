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
    TipoPermiso,

    /// <summary>Profesión (lista de las registradas).</summary>
    Profesion,

    /// <summary>Unidad orgánica opcional del año vigente: 0 = todas.</summary>
    Area,

    /// <summary>Unidad orgánica obligatoria del año vigente (no admite «todas»).</summary>
    AreaObligatoria,

    /// <summary>Sí/No: llega como «1» o «0».</summary>
    SiNo,

    /// <summary>DNI opcional (hasta 8 dígitos); puede quedar vacío.</summary>
    Dni,

    /// <summary>Uno o más lugares de marcado (locales): llega como identificadores separados por coma, p. ej. «1,3».</summary>
    Locales
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
