using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class HorarioTemporal
{
    public int IdEmpleado { get; set; }

    public int N { get; set; }

    public DateOnly? FechaInicio { get; set; }

    public DateOnly? FechaFin { get; set; }

    public int? HorarioAsignado { get; set; }

    public string? NroDocumento { get; set; }

    public string? Sisgedo { get; set; }

    public DateTime? FechaRegistro { get; set; }

    public virtual Horario? HorarioAsignadoNavigation { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;
}
