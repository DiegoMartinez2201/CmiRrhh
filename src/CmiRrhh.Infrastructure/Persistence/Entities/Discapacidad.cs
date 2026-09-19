using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Discapacidad
{
    public int IdDiscapacidad { get; set; }

    public string? DescripDiscapacidad { get; set; }

    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();

    public virtual ICollection<Familiar> Familiars { get; set; } = new List<Familiar>();
}
