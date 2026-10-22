using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

/// <summary>
/// Resultado de registrar un permiso: además de confirmar el alta, informa (sin bloquear)
/// si el empleado no asistió hoy o ya se retiró del centro laboral, tal como describe el
/// formulario legado ("se avisa si el empleado no asistió hoy o ya se retiró").
/// </summary>
public sealed class RegistroPermisoResultado
{
    public int NPermiso { get; init; }

    public bool AvisoNoAsistioHoy { get; init; }

    public bool AvisoYaSeRetiro { get; init; }
}

public interface IPermisoService
{
    Task<IReadOnlyList<MotivoPermisoItem>> ListarMotivosAsync(CancellationToken cancellationToken = default);

    Task<IReadOnlyList<PermisoRow>> ListarAsync(int idEmpleado, int? tipoPermiso, int? motivo, CancellationToken cancellationToken = default);

    Task<RegistroPermisoResultado> RegistrarAsync(
        int idEmpleado,
        int idMotivo,
        DateTime fechaInicio,
        DateTime fechaFin,
        string? horaSalida,
        string? horaRetorno,
        bool todoElDia,
        bool retorno,
        string? lugar,
        string? referencia,
        string? autorizacion,
        string? observaciones,
        DateTime hoy,
        CancellationToken cancellationToken = default);

    Task EliminarAsync(int idEmpleado, int nPermiso, CancellationToken cancellationToken = default);
}

public sealed class PermisoService : IPermisoService
{
    private readonly IPermisoRepository _permisos;
    private readonly ICatalogoRepository _catalogo;
    private readonly IAsistenciaRepository _asistencias;

    public PermisoService(IPermisoRepository permisos, ICatalogoRepository catalogo, IAsistenciaRepository asistencias)
    {
        _permisos = permisos;
        _catalogo = catalogo;
        _asistencias = asistencias;
    }

    public Task<IReadOnlyList<MotivoPermisoItem>> ListarMotivosAsync(CancellationToken cancellationToken = default)
        => _catalogo.ListarMotivosPermisoAsync(cancellationToken);

    public Task<IReadOnlyList<PermisoRow>> ListarAsync(int idEmpleado, int? tipoPermiso, int? motivo, CancellationToken cancellationToken = default)
        => _permisos.ListarPermisosAsync(idEmpleado, tipoPermiso, motivo, cancellationToken);

    public async Task<RegistroPermisoResultado> RegistrarAsync(
        int idEmpleado,
        int idMotivo,
        DateTime fechaInicio,
        DateTime fechaFin,
        string? horaSalida,
        string? horaRetorno,
        bool todoElDia,
        bool retorno,
        string? lugar,
        string? referencia,
        string? autorizacion,
        string? observaciones,
        DateTime hoy,
        CancellationToken cancellationToken = default)
    {
        // Regla (4.6 del documento de exploración): fecha de inicio no mayor a la de término
        // ni menor a la fecha actual.
        if (fechaInicio.Date > fechaFin.Date)
        {
            throw new InvalidOperationException("La fecha de inicio no puede ser mayor a la fecha de término.");
        }

        if (fechaInicio.Date < hoy.Date)
        {
            throw new InvalidOperationException("La fecha de inicio no puede ser menor a la fecha actual.");
        }

        // "Todo el Día" y "Retorno" son excluyentes.
        if (todoElDia && retorno)
        {
            throw new InvalidOperationException("No puede marcar \"Todo el Día\" y \"Retorno\" a la vez.");
        }

        // No se puede agregar otro permiso si el empleado ya está de permiso en ese rango.
        var yaDePermiso = await _permisos.ExistePermisoAsync(
            idEmpleado,
            fechaInicio.ToString("yyyyMMdd", CultureInfo.InvariantCulture),
            fechaFin.ToString("yyyyMMdd", CultureInfo.InvariantCulture),
            cancellationToken);
        if (yaDePermiso > 0)
        {
            throw new InvalidOperationException("El empleado ya está de permiso en el rango de fechas indicado.");
        }

        // Aviso (no bloqueante) si el empleado no asistió hoy o ya se retiró del centro laboral.
        var asistenciaHoy = await _asistencias.ObtenerAsistenciaDiaAsync(
            idEmpleado,
            hoy.ToString("yyyyMMdd", CultureInfo.InvariantCulture),
            cancellationToken);
        var avisoNoAsistio = asistenciaHoy is null || string.IsNullOrWhiteSpace(asistenciaHoy.HorEnt);
        var avisoYaSeRetiro = asistenciaHoy is not null && !string.IsNullOrWhiteSpace(asistenciaHoy.HorSal);

        int nPermiso;
        try
        {
            nPermiso = await _permisos.SiguienteIdPermisoAsync(idEmpleado, cancellationToken);
            await _permisos.RegistrarPermisoAsync(
                idEmpleado,
                nPermiso,
                idMotivo,
                fechaInicio,
                fechaFin,
                horaSalida,
                horaRetorno,
                todoElDia,
                retorno,
                lugar,
                referencia,
                autorizacion,
                observaciones,
                cancellationToken);
        }
        catch (Exception ex) when (ex is not InvalidOperationException)
        {
            // Mensaje genérico del formulario legado cuando la operación falla.
            throw new InvalidOperationException("No se pudo completar la operación.", ex);
        }

        return new RegistroPermisoResultado
        {
            NPermiso = nPermiso,
            AvisoNoAsistioHoy = avisoNoAsistio,
            AvisoYaSeRetiro = avisoYaSeRetiro
        };
    }

    public Task EliminarAsync(int idEmpleado, int nPermiso, CancellationToken cancellationToken = default)
        => _permisos.EliminarPermisoAsync(idEmpleado, nPermiso, cancellationToken);
}
