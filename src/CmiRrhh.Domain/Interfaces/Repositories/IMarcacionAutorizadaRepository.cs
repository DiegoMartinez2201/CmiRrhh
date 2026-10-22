using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface IMarcacionAutorizadaRepository
{
    Task<int> RegistrarAsync(
        int idEmpleado, DateOnly fecha, string tipo, string hora, string motivo, string documento, string? usuario,
        CancellationToken cancellationToken = default);

    Task<IReadOnlyList<MarcacionAutorizadaRow>> ListarAsync(int idEmpleado, CancellationToken cancellationToken = default);
}
