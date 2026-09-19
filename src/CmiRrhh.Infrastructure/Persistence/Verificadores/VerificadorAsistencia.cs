using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Verificadores;

public sealed class VerificadorAsistencia : IVerificadorEventoLaboral
{
    private readonly CmiDbContext _context;

    public string TipoEvento => "Asistencia";

    public VerificadorAsistencia(CmiDbContext context)
    {
        _context = context;
    }

    public Task<bool> ExisteAsync(int idEmpleado, DateTime fecha, CancellationToken cancellationToken = default)
    {
        // Verificado vs sp_Verficar_Existe_Asistencia (OBJECT_DEFINITION, no cifrado):
        //   WHERE fecha = @Fecha AND idEmpleado = @idEmpleado
        // Misma igualdad exacta que Marcacion (@Fecha varchar(19) → datetime).
        // Asistencia.Fecha es datetime, pero todas las filas están a 00:00:00;
        // a.Fecha == fecha (medianoche) es equivalente al SP y al criterio de día.
        return _context.Asistencia.AnyAsync(
            a => a.IdEmpleado == idEmpleado && a.Fecha == fecha,
            cancellationToken);
    }
}
