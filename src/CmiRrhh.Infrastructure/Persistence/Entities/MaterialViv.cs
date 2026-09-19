using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class MaterialViv
{
    public int IdMaterial { get; set; }

    public string? DescripMaterial { get; set; }

    public virtual ICollection<Viviendum> Vivienda { get; set; } = new List<Viviendum>();
}
