using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public sealed class PlanillaAsistenciaRequest
{
    public DateTime FechaInicio { get; init; }

    public DateTime FechaFin { get; init; }

    public string IdTipoTrabajador { get; init; } = "";

    public IReadOnlyList<int> IdLocales { get; init; } = Array.Empty<int>();
}

public static class PlanillaAsistenciaParametros
{
    public const int MaxDiasCalendario = 15;
    public const int MaxCaracteresLocales = 50;

    private static readonly string[] TiposValidos = { "1", "2", "3", "4", "5", "6", "7" };

    public static string ConstruirParametroFechas(DateTime inicio, DateTime fin)
    {
        var desde = inicio.Date;
        var hasta = fin.Date;
        if (hasta < desde)
        {
            throw new ArgumentException("Rango inválido.");
        }

        if ((hasta - desde).Days > MaxDiasCalendario - 1)
        {
            throw new ArgumentException("El rango no puede superar 15 días.");
        }

        var fechas = new List<string>();
        for (var f = desde; f <= hasta; f = f.AddDays(1))
        {
            fechas.Add($"[{f.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture)}]");
        }

        return string.Join(",", fechas);
    }

    public static string ConstruirParametroLocales(IReadOnlyList<int> idLocales)
    {
        if (idLocales.Count == 0)
        {
            return "0";
        }

        var parametro = string.Join(",", idLocales.Distinct());
        if (parametro.Length > MaxCaracteresLocales)
        {
            throw new ArgumentException(
                $"La lista de locales supera el límite de {MaxCaracteresLocales} caracteres del SP. Seleccione menos locales.");
        }

        return parametro;
    }

    public static string ValidarTipoTrabajador(string idTipoTrabajador)
    {
        if (!TiposValidos.Contains(idTipoTrabajador, StringComparer.Ordinal))
        {
            throw new ArgumentException("Tipo de trabajador inválido.");
        }

        return idTipoTrabajador;
    }
}

public interface IAsistenciaPlanillaService
{
    Task<IReadOnlyList<PlanillaAsistenciaRow>> ConsultarAsync(
        PlanillaAsistenciaRequest request, CancellationToken cancellationToken = default);
}

public sealed class AsistenciaPlanillaService : IAsistenciaPlanillaService
{
    private readonly IAsistenciaReporteRepository _reportes;
    private readonly ICatalogoRepository _catalogo;

    public AsistenciaPlanillaService(IAsistenciaReporteRepository reportes, ICatalogoRepository catalogo)
    {
        _reportes = reportes;
        _catalogo = catalogo;
    }

    public async Task<IReadOnlyList<PlanillaAsistenciaRow>> ConsultarAsync(
        PlanillaAsistenciaRequest request, CancellationToken cancellationToken = default)
    {
        var tipo = PlanillaAsistenciaParametros.ValidarTipoTrabajador(request.IdTipoTrabajador);
        var fechas = PlanillaAsistenciaParametros.ConstruirParametroFechas(request.FechaInicio, request.FechaFin);

        if (request.IdLocales.Count > 0
            && !await _catalogo.ExistenTodosLosLocalesAsync(request.IdLocales, cancellationToken))
        {
            throw new ArgumentException("Uno o más locales no existen.");
        }

        var locales = PlanillaAsistenciaParametros.ConstruirParametroLocales(request.IdLocales);
        return await _reportes.LlenarPlanillaAsistenciaAsync(fechas, tipo, locales, cancellationToken);
    }
}
