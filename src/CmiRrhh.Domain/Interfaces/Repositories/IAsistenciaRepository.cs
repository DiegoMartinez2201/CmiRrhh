using System.Data;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface IAsistenciaRepository
{
    Task<int> ExisteMarcacionAsync(int idEmpleado, string fecha, CancellationToken cancellationToken = default);

    Task<int> ExisteAsistenciaAsync(int idEmpleado, string fecha, CancellationToken cancellationToken = default);

    Task ActualizarAsistenciaAsync(int idEmpleado, DateTime fecha, string horSal, bool flagSal, CancellationToken cancellationToken = default);

    // Pendiente de migrar a DTO en Fase 5 (cuando se construya la Razor Page y se conozcan las columnas de la UI).
    Task<DataTable> ObtenerAsistenciasPorDiaAsync(string fecha, CancellationToken cancellationToken = default);

    Task<AsistenciaDiaRow?> ObtenerAsistenciaDiaAsync(int codigo, string fecha, CancellationToken cancellationToken = default);

    Task<int> ContarMarcacionesEnRangoAsync(DateTime fechaInicio, DateTime fechaFin, CancellationToken cancellationToken = default);
}
