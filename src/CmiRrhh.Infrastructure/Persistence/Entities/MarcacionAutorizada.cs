namespace CmiRrhh.Infrastructure.Persistence.Entities;

/// <summary>
/// Tabla nueva, propia de la app (no existía en el legado): registra el motivo y el
/// documento de referencia de cada "Marcación autorizada", porque <c>Asistencia</c> solo
/// tiene columnas de hora/flag y no tiene dónde guardar esos dos datos. El efecto real
/// sobre el control de asistencia (Hor_Ent/Hor_Sal + Flag) se sigue aplicando sobre
/// <c>Asistencia</c>; esta tabla es el respaldo/justificación de esa autorización.
/// </summary>
public class MarcacionAutorizada
{
    public int Id { get; set; }

    public int IdEmpleado { get; set; }

    public DateTime Fecha { get; set; }

    /// <summary>"Entrada" o "Salida".</summary>
    public string Tipo { get; set; } = string.Empty;

    public string Hora { get; set; } = string.Empty;

    public string Motivo { get; set; } = string.Empty;

    public string Documento { get; set; } = string.Empty;

    public string? Usuario { get; set; }

    public DateTime FechaRegistro { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;
}
