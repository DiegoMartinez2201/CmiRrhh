using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class MotivoBaja
{
    public int IdMotivoBaja { get; set; }

    public string? Descripcion { get; set; }

    public virtual ICollection<RrhhAsegurado> RrhhAsegurados { get; set; } = new List<RrhhAsegurado>();
}
