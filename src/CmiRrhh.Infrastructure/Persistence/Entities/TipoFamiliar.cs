using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class TipoFamiliar
{
    public int IdTipoFam { get; set; }

    public string? DescripTipoFam { get; set; }

    public virtual ICollection<Familiar> Familiars { get; set; } = new List<Familiar>();
}
