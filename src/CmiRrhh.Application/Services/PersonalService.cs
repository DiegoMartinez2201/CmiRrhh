using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public sealed record PersonalFiltro(
    int? Codigo,
    string? NumDoc,
    string? Apellido,
    int? IdTipoTrabajador,
    bool Activo,
    int? Anio);

public interface IPersonalService
{
    Task<IReadOnlyList<PersonalRow>> BuscarAsync(PersonalFiltro filtro, CancellationToken cancellationToken = default);
}

public sealed class PersonalService : IPersonalService
{
    private readonly IPersonalRepository _personal;

    public PersonalService(IPersonalRepository personal)
    {
        _personal = personal;
    }

    public Task<IReadOnlyList<PersonalRow>> BuscarAsync(PersonalFiltro filtro, CancellationToken cancellationToken = default)
    {
        // El SP espera '' (no NULL) para documento y apellido sin filtrar.
        var numDoc = (filtro.NumDoc ?? string.Empty).Trim();
        var apellido = (filtro.Apellido ?? string.Empty).Trim();

        return _personal.BuscarAsync(
            filtro.Codigo,
            numDoc,
            apellido,
            filtro.IdTipoTrabajador,
            filtro.Activo,
            filtro.Anio,
            cancellationToken);
    }
}
