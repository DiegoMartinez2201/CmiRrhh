namespace CmiRrhh.Domain.Models;

/// <summary>Motivo de permiso que aparece como columna en el estadístico de permisos.</summary>
public sealed record MotivoEstadistica(int IdMotivo, string Abrev, string Descripcion);
