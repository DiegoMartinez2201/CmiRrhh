using System.Globalization;
using System.Text.RegularExpressions;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Reportes;

/// <summary>
/// Estadístico de permisos por trabajador (spRRHH_EstadisticaPermiso): minutos de tardanza y días de
/// permiso por motivo en un rango de fechas.
/// </summary>
/// <remarks>
/// El procedimiento arma SQL dinámico concatenando las listas de motivos y áreas, y sus variables tienen
/// un tamaño fijo (varchar 150 / 450 / 450). Para que ese texto nunca provenga del usuario, las listas se
/// construyen aquí: los ids son enteros leídos de la base y las abreviaturas se toman de Motivo_Perm y se
/// descartan si tienen caracteres fuera de un conjunto seguro. Si no caben en una sola llamada, se hacen
/// varias (por tandas de motivos y de unidades) y los resultados se unen por trabajador.
/// </remarks>
public sealed partial class ReporteEstadisticaPermisos : IReporteTabular
{
    // Límites de las variables del procedimiento (varchar(150), varchar(450), varchar(450)).
    private const int MaxIdMotivos = 150;
    private const int MaxMotivos = 450;
    private const int MaxIdAreas = 450;

    [GeneratedRegex(@"^[\p{L}\p{N} _.\-]{1,10}$")]
    private static partial Regex AbrevSegura();

    private readonly IPermisoReporteRepository _permisos;
    private readonly IFichaPersonalRepository _fichas;

    public ReporteEstadisticaPermisos(IPermisoReporteRepository permisos, IFichaPersonalRepository fichas)
    {
        _permisos = permisos;
        _fichas = fichas;
    }

    public DefinicionReporte Definicion { get; } = new(
        "estadistico-permisos",
        "Estadístico de permisos",
        "Por trabajador: tardanza acumulada y días de permiso por motivo (abreviatura) dentro del rango. Un trabajador por fila; unidades del año actual.",
        new[]
        {
            new ParametroReporte("desde", "Desde", TipoParametroReporte.Fecha),
            new ParametroReporte("hasta", "Hasta", TipoParametroReporte.Fecha),
            new ParametroReporte("tipo", "Tipo de trabajador", TipoParametroReporte.TipoTrabajadorObligatorio),
            new ParametroReporte("area", "Unidad orgánica", TipoParametroReporte.Area)
        });

    private sealed class FilaTrabajador
    {
        public string Nombre = string.Empty;
        public string Area = string.Empty;
        public string Tarde = string.Empty;
        public string DiasTarde = string.Empty;
        public Dictionary<string, string> PorMotivo = new(StringComparer.OrdinalIgnoreCase);
    }

    private sealed record GrupoMotivo(string Abrev, List<int> Ids);

    public async Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default)
    {
        var desde = DateTime.Parse(parametros["desde"], CultureInfo.InvariantCulture);
        var hasta = DateTime.Parse(parametros["hasta"], CultureInfo.InvariantCulture);
        var tipo = int.Parse(parametros["tipo"], CultureInfo.InvariantCulture);
        var area = int.Parse(parametros["area"], CultureInfo.InvariantCulture);

        // El procedimiento recibe el tipo como char(1): solo admite 1..9.
        if (tipo is < 1 or > 9)
        {
            throw new InvalidOperationException("El estadístico solo admite tipos de trabajador del 1 al 9.");
        }

        // Misma regla del procedimiento: planilla (1) = modalidad P; cualquier otro tipo = C.
        var modalidad = tipo == 1 ? "P" : "C";
        var grupos = (await _permisos.ListarMotivosEstadisticaAsync(modalidad, cancellationToken))
            .Where(m => AbrevSegura().IsMatch(m.Abrev))
            .GroupBy(m => m.Abrev, StringComparer.OrdinalIgnoreCase)
            .Select(g => new GrupoMotivo(g.First().Abrev, g.Select(m => m.IdMotivo).ToList()))
            .ToList();
        if (grupos.Count == 0)
        {
            throw new InvalidOperationException("No hay motivos de permiso activos para esta modalidad.");
        }

        var areas = area > 0
            ? new List<int> { area }
            : (await _fichas.ListarAreasAsync(DateTime.Today.Year, cancellationToken)).Select(a => a.Id).ToList();
        if (areas.Count == 0)
        {
            throw new InvalidOperationException("No hay unidades orgánicas definidas para el año actual.");
        }

        var tandasMotivos = DividirMotivos(grupos);
        var tandasAreas = DividirAreas(areas);

        var inicio = desde.ToString("yyyyMMdd", CultureInfo.InvariantCulture);
        var fin = hasta.ToString("yyyyMMdd", CultureInfo.InvariantCulture);
        var trabajadores = new Dictionary<string, FilaTrabajador>();

        foreach (var tandaAreas in tandasAreas)
        {
            var idAreas = string.Join(",", tandaAreas.Select(a => a.ToString(CultureInfo.InvariantCulture)));

            foreach (var tanda in tandasMotivos)
            {
                var idMotivos = string.Join(",", tanda.SelectMany(g => g.Ids).Select(i => i.ToString(CultureInfo.InvariantCulture)));
                var lista = string.Join(",", tanda.Select(g => "[" + g.Abrev + "]"));

                var tabla = await _permisos.EstadisticaPermisoAsync(
                    tipo.ToString(CultureInfo.InvariantCulture), inicio, fin, idMotivos, lista, lista, idAreas, cancellationToken);

                foreach (System.Data.DataRow f in tabla.Rows)
                {
                    var clave = FilaReporte.Texto(f, "IdEmpleado");
                    if (!trabajadores.TryGetValue(clave, out var t))
                    {
                        t = new FilaTrabajador
                        {
                            Nombre = FilaReporte.Texto(f, "NombresCompletos"),
                            Area = FilaReporte.Texto(f, "AreaOrganizacional"),
                            Tarde = FilaReporte.Texto(f, "Tarde"),
                            DiasTarde = FilaReporte.Texto(f, "DiasTarde")
                        };
                        trabajadores[clave] = t;
                    }

                    foreach (var g in tanda)
                    {
                        t.PorMotivo[g.Abrev] = FilaReporte.Texto(f, g.Abrev);
                    }
                }
            }
        }

        // Solo se muestran los motivos con algún dato en el rango: hay decenas de motivos activos y casi
        // todos quedan vacíos, lo que volvería la tabla ilegible.
        var conDatos = grupos
            .Where(g => trabajadores.Values.Any(t => t.PorMotivo.TryGetValue(g.Abrev, out var v) && v.Length > 0))
            .ToList();

        var columnas = new List<string> { "Apellidos y nombres", "Área organizacional", "Tardanza (hh:mm)", "Días con tardanza" };
        columnas.AddRange(conDatos.Select(g => g.Abrev));

        return new ReporteTabla
        {
            Columnas = columnas,
            Filas = trabajadores.Values
                .OrderBy(t => t.Area, StringComparer.CurrentCultureIgnoreCase)
                .ThenBy(t => t.Nombre, StringComparer.CurrentCultureIgnoreCase)
                .Select(t =>
                {
                    var fila = new List<string> { t.Nombre, t.Area, t.Tarde, t.DiasTarde };
                    fila.AddRange(conDatos.Select(g => t.PorMotivo.TryGetValue(g.Abrev, out var v) ? v : string.Empty));
                    return (IReadOnlyList<string>)fila;
                })
                .ToList()
        };
    }

    /// <summary>Agrupa motivos en tandas cuyas listas de ids y de abreviaturas caben en el procedimiento.</summary>
    private static List<List<GrupoMotivo>> DividirMotivos(IReadOnlyList<GrupoMotivo> grupos)
    {
        var tandas = new List<List<GrupoMotivo>>();
        var actual = new List<GrupoMotivo>();
        var largoIds = 0;
        var largoLista = 0;

        foreach (var g in grupos)
        {
            var ids = string.Join(",", g.Ids).Length + 1;   // +1 por la coma separadora
            var lista = g.Abrev.Length + 3;                  // "[x],"
            if (actual.Count > 0 && (largoIds + ids > MaxIdMotivos || largoLista + lista > MaxMotivos))
            {
                tandas.Add(actual);
                actual = new List<GrupoMotivo>();
                largoIds = 0;
                largoLista = 0;
            }

            actual.Add(g);
            largoIds += ids;
            largoLista += lista;
        }

        tandas.Add(actual);
        return tandas;
    }

    private static List<List<int>> DividirAreas(IReadOnlyList<int> areas)
    {
        var tandas = new List<List<int>>();
        var actual = new List<int>();
        var largo = 0;

        foreach (var a in areas)
        {
            var l = a.ToString(CultureInfo.InvariantCulture).Length + 1;
            if (actual.Count > 0 && largo + l > MaxIdAreas)
            {
                tandas.Add(actual);
                actual = new List<int>();
                largo = 0;
            }

            actual.Add(a);
            largo += l;
        }

        tandas.Add(actual);
        return tandas;
    }
}
