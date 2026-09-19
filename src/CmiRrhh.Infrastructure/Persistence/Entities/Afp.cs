using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Afp
{
    public int IdAfp { get; set; }

    public string? DescripAfp { get; set; }

    public string? DireccAfp { get; set; }

    public string? TelefAfp { get; set; }

    public string? NomContAfp { get; set; }

    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();
}
