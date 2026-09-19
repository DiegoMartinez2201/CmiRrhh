using CmiRrhh.Domain.Interfaces;

namespace CmiRrhh.Infrastructure.Persistence.Verificadores;

/// <summary>
/// Prueba de extensión OCP: un tipo nuevo de evento laboral se agrega
/// implementando <see cref="IVerificadorEventoLaboral"/> y registrándolo en DI,
/// sin modificar los verificadores existentes ni el resolutor.
/// </summary>
public sealed class VerificadorRefrigerio : IVerificadorEventoLaboral
{
    public string TipoEvento => "Refrigerio";

    public Task<bool> ExisteAsync(int idEmpleado, DateTime fecha, CancellationToken cancellationToken = default)
    {
        // TODO: reemplazar por la fuente real cuando exista (tabla o SP de refrigerio).
        _ = idEmpleado;
        _ = fecha;
        _ = cancellationToken;
        return Task.FromResult(false);
    }
}
