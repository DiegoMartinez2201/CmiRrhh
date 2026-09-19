using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class TitulosEmpleado
{
    public string NumColegiatura { get; set; } = null!;

    public string? DenominacionGrado { get; set; }

    public string? Institucion { get; set; }

    public DateTime? Fecha { get; set; }

    public int? IdEmpleado { get; set; }

    public virtual Empleado? IdEmpleadoNavigation { get; set; }
}
