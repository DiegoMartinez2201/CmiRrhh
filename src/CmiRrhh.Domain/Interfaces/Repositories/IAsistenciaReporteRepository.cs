using System.Data;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface IAsistenciaReporteRepository
{
    Task<IReadOnlyList<AsistenciaReporteRow>> ListarAsistenciasAsync(string fechaInicio, string fechaFin, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<PlanillaAsistenciaRow>> LlenarPlanillaAsistenciaAsync(string fechas, string idTipoTrabajador, string idLocales, CancellationToken cancellationToken = default);

    // Pendiente de migrar a DTO en Fase 5 (cuando se construya la Razor Page y se conozcan las columnas de la UI).
    Task<DataTable> ReporteAsistenciaDiariaAsync(
        string fechaInicio,
        string fechaFin,
        string dni,
        int? area,
        int? tipo,
        string? year,
        string idLocales,
        int opt = 0,
        CancellationToken cancellationToken = default);

    Task ImportarBioAsync(string fechaInicial, string fechaFinal, CancellationToken cancellationToken = default);
}
