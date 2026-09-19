using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface IHorarioRepository
{
    Task<int> SiguienteIdHorarioTemporalAsync(int idEmpleado, CancellationToken cancellationToken = default);

    Task EliminarHorarioTemporalAsync(int idEmpleado, int n, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<HorarioTemporalRow>> ListarHorariosTemporalesAsync(int idEmpleado, CancellationToken cancellationToken = default);
}
