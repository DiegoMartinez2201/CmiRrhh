using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class EstudiosRealizado
{
    public int IdTipoEstudios { get; set; }

    public int IdEmpleado { get; set; }

    public int Correlativo { get; set; }

    public string? CentroEstudios { get; set; }

    public DateTime? AñoInicio { get; set; }

    public string? Especialidad { get; set; }

    public DateTime? AñoTermino { get; set; }

    public int? IdEstadoEstudio { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;

    public virtual EstadoEstudio? IdEstadoEstudioNavigation { get; set; }

    public virtual TipoEstudio IdTipoEstudiosNavigation { get; set; } = null!;
}
