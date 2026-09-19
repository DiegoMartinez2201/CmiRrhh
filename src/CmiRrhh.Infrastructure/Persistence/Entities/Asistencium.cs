using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Asistencium
{
    public DateTime Fecha { get; set; }

    public int IdEmpleado { get; set; }

    public string? HorEnt { get; set; }

    public string? HorSal { get; set; }

    public string? AlmSal { get; set; }

    public string? AlmEnt { get; set; }

    public bool? FlagEnt { get; set; }

    public bool? FlagSal { get; set; }

    public bool? Estado { get; set; }

    public int? IdHorario { get; set; }

    public string? Usuario { get; set; }

    public string? Pc { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;
}
