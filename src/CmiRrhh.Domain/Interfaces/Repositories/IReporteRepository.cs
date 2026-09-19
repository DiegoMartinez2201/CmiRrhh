using System.Data;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface IReporteRepository
{
    // Los métodos de este contrato siguen devolviendo DataTable.
    // Pendiente de migrar a DTO en Fase 5 (cuando se construya la Razor Page y se conozcan las columnas de la UI).
    Task<DataTable> GenerarCuadroPersonalAsync(int tipo, CancellationToken cancellationToken = default);

    Task<DataTable> GenerarCumplesAsync(int mes, CancellationToken cancellationToken = default);

    Task<DataTable> GenerarReporteOficinaAsync(int codigoOficina, CancellationToken cancellationToken = default);

    Task<DataTable> GenerarReporteOficinaDependenciaAsync(string sigla, CancellationToken cancellationToken = default);

    Task<DataTable> GenerarReporteFichaEmpleadoAsync(string fechaInicio, string fechaTermino, int tipo, CancellationToken cancellationToken = default);

    Task<DataTable> GenerarReporteCargosAsync(int idCargo, CancellationToken cancellationToken = default);

    Task<DataTable> AgregarReporteAsync(int idEmpleado, int opcion, CancellationToken cancellationToken = default);

    Task<DataTable> ListarTrabajadoresAsync(int idTipoTrabajador, CancellationToken cancellationToken = default);

    Task<DataTable> ObtenerHorasExtrasAsync(string fechaInicio, string fechaFin, int? tipo, CancellationToken cancellationToken = default);
}
