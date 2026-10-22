namespace CmiRrhh.Domain.Models;

/// <summary>
/// Fila de <c>RRHH_Feriado</c> (mantenimiento "Feriados" — sección 4.5 del documento de
/// exploración funcional: agrega y elimina feriados no laborables).
/// </summary>
public sealed class FeriadoRow
{
    public int IdFeriado { get; init; }

    public DateTime? Fecha { get; init; }

    public string? Motivo { get; init; }
}
