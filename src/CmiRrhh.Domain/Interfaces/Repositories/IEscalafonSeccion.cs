using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

/// <summary>
/// Una sección de la ficha escalafonaria (periodos laborales, estudios, ...). Cada sección es una
/// implementación registrada en DI: agregar una nueva no obliga a tocar el servicio ni la pantalla (OCP).
/// </summary>
public interface IEscalafonSeccion
{
    DefinicionSeccionEscalafon Definicion { get; }

    /// <summary>Opciones de los campos de tipo Opcion, por clave de campo.</summary>
    Task<IReadOnlyDictionary<string, IReadOnlyList<CatalogoItem>>> OpcionesAsync(CancellationToken cancellationToken = default);

    Task<IReadOnlyList<FilaEscalafon>> ListarAsync(int idEmpleado, CancellationToken cancellationToken = default);

    /// <summary>Reglas entre campos (por ejemplo, fecha final no anterior a la inicial). Devuelve el error o null.</summary>
    string? ValidarReglas(IReadOnlyDictionary<string, string> valores);

    /// <summary>Agrega (clave null) o modifica un registro. Devuelve el mensaje de error, o null si salió bien.</summary>
    Task<string?> GuardarAsync(
        int idEmpleado,
        string? clave,
        IReadOnlyDictionary<string, string> valores,
        CancellationToken cancellationToken = default);

    /// <summary>Elimina un registro. Devuelve el mensaje de error, o null si salió bien.</summary>
    Task<string?> EliminarAsync(int idEmpleado, string clave, CancellationToken cancellationToken = default);
}
