using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public sealed record ResultadoMantenimiento(bool Exitoso, string Mensaje);

public interface IMantenimientoCatalogoService
{
    IReadOnlyList<DefinicionCatalogo> Catalogos();

    DefinicionCatalogo? Definicion(string clave);

    Task<IReadOnlyList<FilaCatalogo>> ListarAsync(string clave, CancellationToken cancellationToken = default);

    Task<ResultadoMantenimiento> GuardarAsync(
        string clave, int? id, IReadOnlyDictionary<string, string?> valores, CancellationToken cancellationToken = default);

    Task<ResultadoMantenimiento> EliminarAsync(string clave, int id, CancellationToken cancellationToken = default);
}

/// <summary>
/// Orquesta los catálogos registrados en DI (Strategy + OCP): resuelve el catálogo por clave,
/// valida y delega el acceso a datos. No conoce ningún catálogo concreto.
/// </summary>
public sealed class MantenimientoCatalogoService : IMantenimientoCatalogoService
{
    private readonly IReadOnlyDictionary<string, IMantenimientoCatalogo> _catalogos;

    public MantenimientoCatalogoService(IEnumerable<IMantenimientoCatalogo> catalogos)
    {
        _catalogos = catalogos.ToDictionary(c => c.Definicion.Clave, StringComparer.OrdinalIgnoreCase);
    }

    public IReadOnlyList<DefinicionCatalogo> Catalogos()
        => _catalogos.Values.Select(c => c.Definicion).OrderBy(d => d.Titulo).ToList();

    public DefinicionCatalogo? Definicion(string clave)
        => _catalogos.TryGetValue(clave, out var c) ? c.Definicion : null;

    public Task<IReadOnlyList<FilaCatalogo>> ListarAsync(string clave, CancellationToken cancellationToken = default)
        => Obtener(clave).ListarAsync(cancellationToken);

    public async Task<ResultadoMantenimiento> GuardarAsync(
        string clave, int? id, IReadOnlyDictionary<string, string?> valores, CancellationToken cancellationToken = default)
    {
        var catalogo = Obtener(clave);
        var limpios = new Dictionary<string, string>();

        foreach (var campo in catalogo.Definicion.Campos)
        {
            valores.TryGetValue(campo.Clave, out var crudo);
            var valor = crudo?.Trim() ?? string.Empty;

            if (campo.Requerido && valor.Length == 0)
            {
                return new ResultadoMantenimiento(false, $"Ingrese el campo «{campo.Etiqueta}».");
            }

            if (valor.Length > campo.MaxLongitud)
            {
                return new ResultadoMantenimiento(false, $"«{campo.Etiqueta}» admite hasta {campo.MaxLongitud} caracteres.");
            }

            limpios[campo.Clave] = valor;
        }

        // Evita duplicados por el primer campo (la descripción principal), sin distinguir mayúsculas.
        var principal = catalogo.Definicion.Campos[0].Clave;
        var existentes = await catalogo.ListarAsync(cancellationToken);
        if (existentes.Any(f => f.Id != id
                                && string.Equals(f.Valores[principal], limpios[principal], StringComparison.OrdinalIgnoreCase)))
        {
            return new ResultadoMantenimiento(false, $"Ya existe un registro con «{limpios[principal]}».");
        }

        if (id is null)
        {
            var nuevo = await catalogo.CrearAsync(limpios, cancellationToken);
            return new ResultadoMantenimiento(true, $"Registro creado con el código {nuevo}.");
        }

        return await catalogo.ActualizarAsync(id.Value, limpios, cancellationToken)
            ? new ResultadoMantenimiento(true, "Registro actualizado.")
            : new ResultadoMantenimiento(false, "El registro ya no existe.");
    }

    public async Task<ResultadoMantenimiento> EliminarAsync(string clave, int id, CancellationToken cancellationToken = default)
    {
        var motivo = await Obtener(clave).EliminarAsync(id, cancellationToken);
        return motivo is null
            ? new ResultadoMantenimiento(true, "Registro eliminado.")
            : new ResultadoMantenimiento(false, motivo);
    }

    private IMantenimientoCatalogo Obtener(string clave)
        => _catalogos.TryGetValue(clave, out var c)
            ? c
            : throw new KeyNotFoundException($"No existe el catálogo '{clave}'.");
}
