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

    /// <summary>Equivalente a "Primero debe asignar un Horario al trabajador" (Empleado.IdHorario != null).</summary>
    Task<bool> TieneHorarioAsignadoAsync(int idEmpleado, CancellationToken cancellationToken = default);

    /// <summary>
    /// Aplica el efecto de "Marcaciones autorizadas": upsert de Hor_Ent+Flag_Ent o
    /// Hor_Sal+Flag_Sal según <paramref name="esEntrada"/> (crea la fila de Asistencia si
    /// no existe, porque el legado permite autorizar una marcación de un día sin asistencia previa).
    /// </summary>
    Task AutorizarMarcacionAsync(int idEmpleado, DateTime fecha, bool esEntrada, string hora, CancellationToken cancellationToken = default);

    /// <summary>
    /// "Suspender asistencia": anula el control de asistencia de ese día (Estado = false).
    /// Requiere que la fila ya exista (se valida aparte con ExisteAsistenciaAsync/Verificador).
    /// </summary>
    Task SuspenderAsistenciaAsync(int idEmpleado, DateTime fecha, CancellationToken cancellationToken = default);
}
