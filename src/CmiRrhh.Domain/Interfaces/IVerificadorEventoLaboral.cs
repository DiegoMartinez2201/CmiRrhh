namespace CmiRrhh.Domain.Interfaces;

public interface IVerificadorEventoLaboral
{
    string TipoEvento { get; }

    Task<bool> ExisteAsync(int idEmpleado, DateTime fecha, CancellationToken cancellationToken = default);
}
