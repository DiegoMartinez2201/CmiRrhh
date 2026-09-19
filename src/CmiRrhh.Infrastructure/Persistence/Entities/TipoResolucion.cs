using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class TipoResolucion
{
    public int IdTipoResolucion { get; set; }

    public string? DescripTipoResolucion { get; set; }

    public virtual ICollection<Resolucion> Resolucions { get; set; } = new List<Resolucion>();
}
