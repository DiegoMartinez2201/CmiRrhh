using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class TipoTrabajador
{
    public int IdTipoTrabajador { get; set; }

    public string? Descripcion { get; set; }

    public string? Observaciones { get; set; }

    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();
}
