using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Verificadores;

public sealed class VerificadorMarcacion : IVerificadorEventoLaboral
{
    private readonly CmiDbContext _context;

    public string TipoEvento => "Marcacion";

    public VerificadorMarcacion(CmiDbContext context)
    {
        _context = context;
    }

    public Task<bool> ExisteAsync(int idEmpleado, DateTime fecha, CancellationToken cancellationToken = default)
    {
        // Verificado vs sp_Verficar_Existe_Marcacion (OBJECT_DEFINITION, no cifrado):
        //   WHERE fecha = @Fecha AND idEmpleado = @idEmpleado
        // @Fecha es varchar(19). SQL convierte el varchar a datetime (precedencia de tipos)
        // y compara igualdad exacta: no hay CONVERT/CAST a solo fecha ni rango de día.
        // Marcacion.Fecha es datetime; ~99% de las filas tienen componente de hora.
        // m.Fecha == fecha replica el SP. Un rango de día encontraría marcas que el SP no.
        return _context.Marcacions.AnyAsync(
            m => m.IdEmpleado == idEmpleado && m.Fecha == fecha,
            cancellationToken);
    }
}
