using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class UbicacionViv
{
    public int IdUbicacion { get; set; }

    public string? DescripUbicacion { get; set; }

    public virtual ICollection<Viviendum> Vivienda { get; set; } = new List<Viviendum>();
}
