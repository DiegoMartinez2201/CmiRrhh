using System.Diagnostics;
using CmiRrhh.Domain;
using CmiRrhh.Domain.Interfaces.Repositories;

namespace CmiRrhh.Application.Services;

public sealed record ImportacionResultado(
    DateTime FechaInicio,
    DateTime FechaFin,
    TimeSpan Duracion,
    bool Exitoso,
    string? Error);

public interface IAsistenciaImportacionService
{
    Task<int> ContarMarcacionesExistentesAsync(DateTime fechaInicio, DateTime fechaFin, CancellationToken cancellationToken = default);

    Task<ImportacionResultado> ImportarAsync(
        DateTime fechaInicio,
        DateTime fechaFin,
        bool confirmarReimportacion,
        CancellationToken cancellationToken = default);
}

public sealed class AsistenciaImportacionService : IAsistenciaImportacionService
{
    public const int MaxDiasRango = 7;

    private readonly IAsistenciaRepository _asistencias;
    private readonly IAsistenciaReporteRepository _reportes;

    public AsistenciaImportacionService(
        IAsistenciaRepository asistencias,
        IAsistenciaReporteRepository reportes)
    {
        _asistencias = asistencias;
        _reportes = reportes;
    }

    public Task<int> ContarMarcacionesExistentesAsync(
        DateTime fechaInicio, DateTime fechaFin, CancellationToken cancellationToken = default)
    {
        ValidarRango(fechaInicio, fechaFin);
        return _asistencias.ContarMarcacionesEnRangoAsync(fechaInicio.Date, fechaFin.Date, cancellationToken);
    }

    public async Task<ImportacionResultado> ImportarAsync(
        DateTime fechaInicio,
        DateTime fechaFin,
        bool confirmarReimportacion,
        CancellationToken cancellationToken = default)
    {
        ValidarRango(fechaInicio, fechaFin);

        var existentes = await ContarMarcacionesExistentesAsync(fechaInicio, fechaFin, cancellationToken);
        if (existentes > 0 && !confirmarReimportacion)
        {
            throw new InvalidOperationException(
                $"Ya existen {existentes} marcaciones en este rango. Marque 'Reimportar de todos modos' para continuar.");
        }

        var inicio = fechaInicio.Date;
        var fin = fechaFin.Date;
        var fi = inicio.ToString("yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
        var ff = fin.ToString("yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);

        var reloj = Stopwatch.StartNew();
        try
        {
            await _reportes.ImportarBioAsync(fi, ff, cancellationToken);
            reloj.Stop();
            return new ImportacionResultado(inicio, fin, reloj.Elapsed, true, null);
        }
        catch (Exception ex) when (SqlServerError.EsViolacionClaveUnica(ex))
        {
            reloj.Stop();
            return new ImportacionResultado(
                inicio,
                fin,
                reloj.Elapsed,
                false,
                "La importación se detuvo por un conflicto de datos (posible reproceso de una marca ya registrada). Revisa el rango antes de reintentar.");
        }
        catch (Exception ex)
        {
            reloj.Stop();
            return new ImportacionResultado(
                inicio,
                fin,
                reloj.Elapsed,
                false,
                $"La importación no se completó: {ex.Message}");
        }
    }

    private static void ValidarRango(DateTime fechaInicio, DateTime fechaFin)
    {
        if (fechaFin.Date < fechaInicio.Date)
        {
            throw new ArgumentException("La fecha fin no puede ser anterior a la fecha inicio.", nameof(fechaFin));
        }

        var dias = (fechaFin.Date - fechaInicio.Date).TotalDays + 1;
        if (dias > MaxDiasRango)
        {
            throw new ArgumentException(
                $"El rango no puede superar {MaxDiasRango} días (proceso pesado contra el biométrico).",
                nameof(fechaFin));
        }
    }
}
