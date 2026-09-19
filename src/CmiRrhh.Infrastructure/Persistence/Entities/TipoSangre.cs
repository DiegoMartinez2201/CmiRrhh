using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class TipoSangre
{
    public int IdTipoSangre { get; set; }

    public string? DescripTs { get; set; }

    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();

    public virtual ICollection<Familiar> Familiars { get; set; } = new List<Familiar>();
}
