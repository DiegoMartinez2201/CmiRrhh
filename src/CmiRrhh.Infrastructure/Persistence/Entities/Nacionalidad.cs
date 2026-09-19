using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Nacionalidad
{
    public int IdNacionalidad { get; set; }

    public string? Descripcion { get; set; }

    public string? Abreviatura { get; set; }

    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();
}
