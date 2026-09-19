using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Cargo
{
    public int IdCargo { get; set; }

    public string Cargo1 { get; set; } = null!;

    public string? Abreviatura { get; set; }

    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();
}
