using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;

namespace CmiRrhh.Application.Services;

public sealed record SuspensionAsistenciaResultado(bool Exitoso, string? Mensaje);

public interface ISuspensionAsistenciaService
{
    Task<SuspensionAsistenciaResultado> SuspenderAsync(int idEmpleado, DateOnly fecha, CancellationToken cancellationToken = default);
}

public sealed class SuspensionAsistenciaService : ISuspensionAsistenciaService
{
    private readonly IAsistenciaRepository _asistencias;
    private readonly VerificadorEventoLaboralResolver _verificadores;

    public SuspensionAsistenciaService(IAsistenciaRepository asistencias, VerificadorEventoLaboralResolver verificadores)
    {
        _asistencias = asistencias;
        _verificadores = verificadores;
    }

    public async Task<SuspensionAsistenciaResultado> SuspenderAsync(int idEmpleado, DateOnly fecha, CancellationToken cancellationToken = default)
    {
        // Reglas de "Suspender asistencia" (sección 4.5): requiere horario asignado y
        // que exista una asistencia registrada ese día.
        if (!await _asistencias.TieneHorarioAsignadoAsync(idEmpleado, cancellationToken))
        {
            return new SuspensionAsistenciaResultado(false, "Primero debe asignar un Horario al trabajador.");
        }

        var fechaCompleta = fecha.ToDateTime(TimeOnly.MinValue);
        var existe = await _verificadores.Resolver("Asistencia").ExisteAsync(idEmpleado, fechaCompleta, cancellationToken);
        if (!existe)
        {
            return new SuspensionAsistenciaResultado(false, "No existe una asistencia registrada para este empleado en esta fecha.");
        }

        await _asistencias.SuspenderAsistenciaAsync(idEmpleado, fechaCompleta, cancellationToken);
        return new SuspensionAsistenciaResultado(true, "Se aplicó la suspensión de asistencia.");
    }
}
