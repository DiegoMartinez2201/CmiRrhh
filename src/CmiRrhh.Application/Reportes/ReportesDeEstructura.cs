using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Reportes;

/// <summary>Lista de personal por tipo de trabajador (spRRHH_Report_CuadroPer, encriptado: se muestran sus columnas tal cual).</summary>
public sealed class ReporteListaPersonal : IReporteTabular
{
    private readonly IReporteRepository _reportes;

    public ReporteListaPersonal(IReporteRepository reportes)
    {
        _reportes = reportes;
    }

    public DefinicionReporte Definicion { get; } = new(
        "lista-personal",
        "Lista de personal",
        "Cuadro del personal del tipo de trabajador elegido.",
        new[] { new ParametroReporte("tipo", "Tipo de trabajador", TipoParametroReporte.TipoTrabajadorObligatorio) });

    public async Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default)
    {
        var tipo = int.Parse(parametros["tipo"], CultureInfo.InvariantCulture);
        return FilaReporte.Tabla(await _reportes.GenerarCuadroPersonalAsync(tipo, cancellationToken));
    }
}

/// <summary>
/// Personal por oficina (spRRHH_Report_Oficina_Unico: columnas AreaOrganizacional y NombresCompletos). Con «incluir dependencias» suma las unidades que
/// dependen de la elegida, resueltas con la estructura orgánica del año vigente.
/// </summary>
public sealed class ReportePersonalPorOficina : IReporteTabular
{
    private readonly IReporteRepository _reportes;
    private readonly IEstructuraOrganizacionalRepository _estructura;

    public ReportePersonalPorOficina(IReporteRepository reportes, IEstructuraOrganizacionalRepository estructura)
    {
        _reportes = reportes;
        _estructura = estructura;
    }

    public DefinicionReporte Definicion { get; } = new(
        "personal-por-oficina",
        "Personal por oficina",
        "Personal de una oficina; opcionalmente incluye las oficinas que dependen de ella.",
        new[]
        {
            new ParametroReporte("area", "Oficina", TipoParametroReporte.AreaObligatoria),
            new ParametroReporte("dependencias", "Incluir dependencias", TipoParametroReporte.SiNo)
        });

    public async Task<ReporteTabla> EjecutarAsync(IReadOnlyDictionary<string, string> parametros, CancellationToken cancellationToken = default)
    {
        var area = int.Parse(parametros["area"], CultureInfo.InvariantCulture);
        var incluir = parametros["dependencias"] == "1";

        var areas = new List<int> { area };
        if (incluir)
        {
            var unidades = await _estructura.ListarUnidadesAsync(DateTime.Today.Year, cancellationToken);
            for (var i = 0; i < areas.Count; i++)
            {
                var actual = areas[i];
                areas.AddRange(unidades.Where(u => u.IdPadre == actual && !areas.Contains(u.Id)).Select(u => u.Id));
            }
        }

        var tablas = new List<System.Data.DataTable>();
        foreach (var id in areas)
        {
            tablas.Add(await _reportes.GenerarReporteOficinaAsync(id, cancellationToken));
        }

        var filas = tablas
            .SelectMany(t => t.Rows.Cast<System.Data.DataRow>())
            .Select(f => (IReadOnlyList<string>)new[]
            {
                FilaReporte.Texto(f, "AreaOrganizacional"),
                FilaReporte.Texto(f, "NombresCompletos")
            })
            .OrderBy(f => f[0], StringComparer.OrdinalIgnoreCase)
            .ThenBy(f => f[1], StringComparer.OrdinalIgnoreCase)
            .ToList();

        if (filas.Count == 0)
        {
            throw new InvalidOperationException("No existen Trabajadores Registrados para esta Area.");
        }

        return new ReporteTabla { Columnas = new[] { "Área organizacional", "Apellidos y nombres" }, Filas = filas };
    }
}
