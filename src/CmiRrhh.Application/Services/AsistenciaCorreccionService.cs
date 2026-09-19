using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public interface IAsistenciaCorreccionService
{
    Task<AsistenciaDiaRow?> BuscarAsync(int idEmpleado, DateTime fecha, CancellationToken cancellationToken = default);

    Task CorregirSalidaAsync(int idEmpleado, DateTime fecha, string horaSalida, CancellationToken cancellationToken = default);
}

public sealed class AsistenciaCorreccionService : IAsistenciaCorreccionService
{
    private readonly IAsistenciaRepository _asistencias;
    private readonly VerificadorEventoLaboralResolver _verificadores;

    public AsistenciaCorreccionService(
        IAsistenciaRepository asistencias,
        VerificadorEventoLaboralResolver verificadores)
    {
        _asistencias = asistencias;
        _verificadores = verificadores;
    }

    public Task<AsistenciaDiaRow?> BuscarAsync(int idEmpleado, DateTime fecha, CancellationToken cancellationToken = default)
    {
        var dia = fecha.Date.ToString("yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
        return _asistencias.ObtenerAsistenciaDiaAsync(idEmpleado, dia, cancellationToken);
    }

    public async Task CorregirSalidaAsync(int idEmpleado, DateTime fecha, string horaSalida, CancellationToken cancellationToken = default)
    {
        var existe = await _verificadores.Resolver("Asistencia").ExisteAsync(idEmpleado, fecha.Date, cancellationToken);
        if (!existe)
        {
            throw new InvalidOperationException(
                "No existe una asistencia registrada para este empleado en esta fecha; no se puede corregir la salida.");
        }

        await _asistencias.ActualizarAsistenciaAsync(idEmpleado, fecha.Date, horaSalida, true, cancellationToken);
    }
}
