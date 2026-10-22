using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public sealed record FeriadoResultado(bool Exitoso, string? Mensaje);

public interface IFeriadoService
{
    Task<IReadOnlyList<FeriadoRow>> ListarAsync(CancellationToken cancellationToken = default);

    Task<FeriadoResultado> AgregarAsync(DateOnly fecha, string? motivo, CancellationToken cancellationToken = default);

    Task EliminarAsync(int idFeriado, CancellationToken cancellationToken = default);
}

public sealed class FeriadoService : IFeriadoService
{
    private readonly IFeriadoRepository _feriados;

    public FeriadoService(IFeriadoRepository feriados)
    {
        _feriados = feriados;
    }

    public Task<IReadOnlyList<FeriadoRow>> ListarAsync(CancellationToken cancellationToken = default)
        => _feriados.ListarAsync(cancellationToken);

    public async Task<FeriadoResultado> AgregarAsync(DateOnly fecha, string? motivo, CancellationToken cancellationToken = default)
    {
        // Regla 4.5: "Ya a Agregado esa Fecha" si hay duplicado.
        if (await _feriados.ExisteFechaAsync(fecha, cancellationToken))
        {
            return new FeriadoResultado(false, "Ya a Agregado esa Fecha.");
        }

        await _feriados.AgregarAsync(fecha, motivo, cancellationToken);
        return new FeriadoResultado(true, "Se Grabó Correctamente.");
    }

    public Task EliminarAsync(int idFeriado, CancellationToken cancellationToken = default)
        => _feriados.EliminarAsync(idFeriado, cancellationToken);
}
