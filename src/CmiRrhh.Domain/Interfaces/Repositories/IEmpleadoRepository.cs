using System.Data;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface IEmpleadoRepository
{
    // Pendiente de migrar a DTO en Fase 5 (cuando se construya la Razor Page y se conozcan las columnas de la UI).
    Task<DataTable> BuscarEmpleadoAsync(
        int? codigo,
        string? numDoc,
        string? apellido,
        int? idTipoTrabajador,
        int activo,
        int anio,
        int idRol = 0,
        CancellationToken cancellationToken = default);

    // Pendiente de migrar a DTO en Fase 5 (cuando se construya la Razor Page y se conozcan las columnas de la UI).
    Task<DataTable> BuscarEmpleadoPorCodigoAsync(int codigo, CancellationToken cancellationToken = default);

    Task<int> IngresarEmpleadoAsync(EmpleadoFicha empleado, CancellationToken cancellationToken = default);

    Task ActualizarEmpleadoAsync(EmpleadoFicha empleado, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<EmpleadoAreaRow>> ListarEmpleadoAreasAsync(int idEmpleado, CancellationToken cancellationToken = default);

    Task ActualizarAreaEmpleadoAsync(int idEmpleado, int anio, int idAreaOrganiz, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<PersonaLookup>> BuscarPersonasAsync(string apellidoPaterno, CancellationToken cancellationToken = default);
}
