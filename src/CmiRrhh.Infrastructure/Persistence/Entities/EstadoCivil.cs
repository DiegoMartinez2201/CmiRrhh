using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class EstadoCivil
{
    public int IdEstadoCivil { get; set; }

    public string? DescripEstCivil { get; set; }

    public string? AbrevEstCiv { get; set; }

    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();

    public virtual ICollection<Familiar> Familiars { get; set; } = new List<Familiar>();

    public virtual ICollection<RrhhAsegurado> RrhhAsegurados { get; set; } = new List<RrhhAsegurado>();
}
