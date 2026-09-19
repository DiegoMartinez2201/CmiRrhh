using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class PeriodoLaboral
{
    public int IdEmpleado { get; set; }

    public int NroPeriodo { get; set; }

    public string? NumResoIngreInstitu { get; set; }

    public DateTime? FechaSalida { get; set; }

    public DateTime? FechaResoIngreInstitu { get; set; }

    public DateTime? FechaIngreso { get; set; }

    public bool? Judicial { get; set; }

    public string? Obs { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;
}
