using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface IFeriadoRepository
{
    Task<IReadOnlyList<FeriadoRow>> ListarAsync(CancellationToken cancellationToken = default);

    /// <summary>
    /// Equivalente a "Ya a Agregado esa Fecha" del formulario legado de Feriados.
    /// </summary>
    Task<bool> ExisteFechaAsync(DateOnly fecha, CancellationToken cancellationToken = default);

    Task<int> AgregarAsync(DateOnly fecha, string? motivo, CancellationToken cancellationToken = default);

    Task EliminarAsync(int idFeriado, CancellationToken cancellationToken = default);
}
