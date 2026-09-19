using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Marcacion
{
    public DateTime Fecha { get; set; }

    public string? Estado { get; set; }

    public int IdEmpleado { get; set; }

    public string? Lugar { get; set; }

    public int? IdHorario { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;
}
