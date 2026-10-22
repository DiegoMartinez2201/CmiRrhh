using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public sealed record HorarioResultado(bool Exitoso, string? Mensaje, int? IdHorario = null);

public interface IHorarioService
{
    Task<IReadOnlyList<HorarioRow>> ListarAsync(CancellationToken cancellationToken = default);

    Task<HorarioRow?> ObtenerAsync(int idHorario, CancellationToken cancellationToken = default);

    Task<HorarioResultado> CrearAsync(HorarioDatos datos, CancellationToken cancellationToken = default);

    Task<HorarioResultado> ActualizarAsync(int idHorario, HorarioDatos datos, CancellationToken cancellationToken = default);

    Task<HorarioResultado> EliminarAsync(int idHorario, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<HorarioTemporalRow>> ListarTemporalesAsync(int idEmpleado, CancellationToken cancellationToken = default);

    Task<HorarioResultado> RegistrarTemporalAsync(
        int idEmpleado, int idHorario, DateOnly fechaInicio, DateOnly fechaFin, string? nroDocumento, string? sisgedo,
        CancellationToken cancellationToken = default);

    Task EliminarTemporalAsync(int idEmpleado, int n, CancellationToken cancellationToken = default);
}

public sealed class HorarioService : IHorarioService
{
    private readonly IHorarioRepository _horarios;

    public HorarioService(IHorarioRepository horarios)
    {
        _horarios = horarios;
    }

    public Task<IReadOnlyList<HorarioRow>> ListarAsync(CancellationToken cancellationToken = default)
        => _horarios.ListarHorariosAsync(cancellationToken);

    public Task<HorarioRow?> ObtenerAsync(int idHorario, CancellationToken cancellationToken = default)
        => _horarios.ObtenerHorarioAsync(idHorario, cancellationToken);

    public async Task<HorarioResultado> CrearAsync(HorarioDatos datos, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(datos.DescripHorario))
        {
            return new HorarioResultado(false, "Indique una descripción para el horario.");
        }

        var id = await _horarios.CrearHorarioAsync(datos, cancellationToken);
        return new HorarioResultado(true, "Se Grabó Correctamente.", id);
    }

    public async Task<HorarioResultado> ActualizarAsync(int idHorario, HorarioDatos datos, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(datos.DescripHorario))
        {
            return new HorarioResultado(false, "Indique una descripción para el horario.");
        }

        if (!await _horarios.ExisteHorarioAsync(idHorario, cancellationToken))
        {
            return new HorarioResultado(false, "No existe el horario indicado.");
        }

        await _horarios.ActualizarHorarioAsync(idHorario, datos, cancellationToken);
        return new HorarioResultado(true, "Se Grabó Correctamente.", idHorario);
    }

    public async Task<HorarioResultado> EliminarAsync(int idHorario, CancellationToken cancellationToken = default)
    {
        // Regla 4.5: "No se puede Eliminar el Horario, porque existen Empleados en ese Horario".
        if (await _horarios.TieneEmpleadosAsignadosAsync(idHorario, cancellationToken))
        {
            return new HorarioResultado(false, "No se puede Eliminar el Horario, porque existen Empleados en ese Horario.");
        }

        await _horarios.EliminarHorarioAsync(idHorario, cancellationToken);
        return new HorarioResultado(true, null);
    }

    public Task<IReadOnlyList<HorarioTemporalRow>> ListarTemporalesAsync(int idEmpleado, CancellationToken cancellationToken = default)
        => _horarios.ListarHorariosTemporalesAsync(idEmpleado, cancellationToken);

    public async Task<HorarioResultado> RegistrarTemporalAsync(
        int idEmpleado, int idHorario, DateOnly fechaInicio, DateOnly fechaFin, string? nroDocumento, string? sisgedo,
        CancellationToken cancellationToken = default)
    {
        // Reglas de "Horario especial" (sección 4.5):
        // - la fecha de inicio no sea mayor a la de término
        // - se elija un horario válido
        // - el empleado no tenga ya ese horario (interpretado como solape de rango para el mismo IdHorario)
        if (fechaInicio > fechaFin)
        {
            return new HorarioResultado(false, "La fecha de inicio no puede ser mayor a la de término.");
        }

        if (!await _horarios.ExisteHorarioAsync(idHorario, cancellationToken))
        {
            return new HorarioResultado(false, "Elija un horario válido.");
        }

        if (await _horarios.TieneHorarioTemporalSolapadoAsync(idEmpleado, idHorario, fechaInicio, fechaFin, cancellationToken))
        {
            return new HorarioResultado(false, "El empleado ya tiene asignado ese horario en ese rango de fechas.");
        }

        var siguiente = await _horarios.SiguienteIdHorarioTemporalAsync(idEmpleado, cancellationToken);
        await _horarios.RegistrarHorarioTemporalAsync(
            idEmpleado, siguiente, idHorario, fechaInicio, fechaFin, nroDocumento, sisgedo, cancellationToken);
        return new HorarioResultado(true, "Se Grabó Correctamente.");
    }

    public Task EliminarTemporalAsync(int idEmpleado, int n, CancellationToken cancellationToken = default)
        => _horarios.EliminarHorarioTemporalAsync(idEmpleado, n, cancellationToken);
}
