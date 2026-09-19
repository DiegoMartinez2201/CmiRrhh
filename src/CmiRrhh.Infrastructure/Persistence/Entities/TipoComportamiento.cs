using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class TipoComportamiento
{
    public int IdTipoComportamiento { get; set; }

    public string? TipoCompDescrip { get; set; }

    public virtual ICollection<Comportamiento> Comportamientos { get; set; } = new List<Comportamiento>();
}
