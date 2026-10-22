using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public sealed record MarcacionAutorizadaResultado(bool Exitoso, string? Mensaje);

public interface IMarcacionAutorizadaService
{
    Task<IReadOnlyList<MarcacionAutorizadaRow>> ListarAsync(int idEmpleado, CancellationToken cancellationToken = default);

    Task<MarcacionAutorizadaResultado> AutorizarAsync(
        int idEmpleado, DateOnly fecha, bool esEntrada, string hora, string motivo, string documento, string? usuario,
        CancellationToken cancellationToken = default);
}

public sealed class MarcacionAutorizadaService : IMarcacionAutorizadaService
{
    private readonly IAsistenciaRepository _asistencias;
    private readonly IMarcacionAutorizadaRepository _marcaciones;

    public MarcacionAutorizadaService(IAsistenciaRepository asistencias, IMarcacionAutorizadaRepository marcaciones)
    {
        _asistencias = asistencias;
        _marcaciones = marcaciones;
    }

    public Task<IReadOnlyList<MarcacionAutorizadaRow>> ListarAsync(int idEmpleado, CancellationToken cancellationToken = default)
        => _marcaciones.ListarAsync(idEmpleado, cancellationToken);

    public async Task<MarcacionAutorizadaResultado> AutorizarAsync(
        int idEmpleado, DateOnly fecha, bool esEntrada, string hora, string motivo, string documento, string? usuario,
        CancellationToken cancellationToken = default)
    {
        // Reglas de "Marcaciones autorizadas" (sección 4.5): se elige un motivo y se
        // ingresa el documento de referencia; aquí "elegir entrada o salida" ya viene
        // resuelto por esEntrada (la UI no deja marcar ambas — ese caso usa Permisos).
        if (string.IsNullOrWhiteSpace(motivo))
        {
            return new MarcacionAutorizadaResultado(false, "Debe elegir un motivo.");
        }

        if (string.IsNullOrWhiteSpace(documento))
        {
            return new MarcacionAutorizadaResultado(false, "Debe ingresar el documento de referencia.");
        }

        if (string.IsNullOrWhiteSpace(hora))
        {
            return new MarcacionAutorizadaResultado(false, "Debe autorizar una entrada o una salida con hora.");
        }

        var tipo = esEntrada ? "Entrada" : "Salida";
        await _asistencias.AutorizarMarcacionAsync(idEmpleado, fecha.ToDateTime(TimeOnly.MinValue), esEntrada, hora, cancellationToken);
        await _marcaciones.RegistrarAsync(idEmpleado, fecha, tipo, hora, motivo.Trim(), documento.Trim(), usuario, cancellationToken);

        return new MarcacionAutorizadaResultado(true, "Se Grabó Correctamente.");
    }
}
