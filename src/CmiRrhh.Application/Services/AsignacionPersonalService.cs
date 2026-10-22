using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public sealed record AsignacionResultado(bool Exitoso, string Mensaje);

public interface IAsignacionPersonalService
{
    Task<IReadOnlyList<PersonalAsignacionRow>> ListarAsync(
        int? idTipoTrabajador, string? apellido, CancellationToken cancellationToken = default);

    Task<AsignacionResultado> AsignarAsync(
        IReadOnlyCollection<int> idEmpleados, int? idHorario, int? idLocal, CancellationToken cancellationToken = default);
}

public sealed class AsignacionPersonalService : IAsignacionPersonalService
{
    private readonly IAsignacionPersonalRepository _asignaciones;
    private readonly IHorarioRepository _horarios;
    private readonly ICatalogoRepository _catalogo;

    public AsignacionPersonalService(
        IAsignacionPersonalRepository asignaciones, IHorarioRepository horarios, ICatalogoRepository catalogo)
    {
        _asignaciones = asignaciones;
        _horarios = horarios;
        _catalogo = catalogo;
    }

    public Task<IReadOnlyList<PersonalAsignacionRow>> ListarAsync(
        int? idTipoTrabajador, string? apellido, CancellationToken cancellationToken = default)
        => _asignaciones.ListarActivosAsync(idTipoTrabajador, apellido, cancellationToken);

    public async Task<AsignacionResultado> AsignarAsync(
        IReadOnlyCollection<int> idEmpleados, int? idHorario, int? idLocal, CancellationToken cancellationToken = default)
    {
        if (idEmpleados.Count == 0)
        {
            return new AsignacionResultado(false, "Seleccione al menos un empleado.");
        }

        if (idHorario is null && idLocal is null)
        {
            return new AsignacionResultado(false, "Elija el horario o el local que desea asignar.");
        }

        if (idHorario is not null && !await _horarios.ExisteHorarioAsync(idHorario.Value, cancellationToken))
        {
            return new AsignacionResultado(false, "El horario seleccionado no existe.");
        }

        if (idLocal is not null
            && (await _catalogo.ListarLocalesAsync(cancellationToken)).All(l => l.Id != idLocal.Value))
        {
            return new AsignacionResultado(false, "El local seleccionado no existe.");
        }

        var n = await _asignaciones.AsignarAsync(idEmpleados, idHorario, idLocal, cancellationToken);
        return new AsignacionResultado(true, $"Asignación aplicada a {n} empleado(s).");
    }
}
