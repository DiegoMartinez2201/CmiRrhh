using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class TenenciaViv
{
    public int IdTenencia { get; set; }

    public string? DescripTenencia { get; set; }

    public virtual ICollection<Viviendum> Vivienda { get; set; } = new List<Viviendum>();
}
