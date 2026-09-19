using System.Data;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface IPermisoReporteRepository
{
    // Pendiente de migrar a DTO en Fase 5 (cuando se construya la Razor Page y se conozcan las columnas de la UI).
    Task<DataTable> ReportePermisosAsync(
        string fechaInicio,
        string fechaFin,
        int? tipoPermiso,
        int? motivo,
        int? idTipoTrabajador,
        CancellationToken cancellationToken = default);

    // Pendiente de migrar a DTO en Fase 5 (cuando se construya la Razor Page y se conozcan las columnas de la UI).
    Task<DataTable> EstadisticaPermisoAsync(
        string idTipoTrabajador,
        string fechaInicio,
        string fechaFin,
        string idMotivos,
        string motivos,
        string motivosNull,
        string idAreas,
        CancellationToken cancellationToken = default);

    // Pendiente de migrar a DTO en Fase 5 (cuando se construya la Razor Page y se conozcan las columnas de la UI).
    Task<DataTable> ResumenEstadisticaPermisoAsync(
        string fechaInicio,
        string fechaFin,
        int idMotivo,
        int idArea,
        CancellationToken cancellationToken = default);
}
