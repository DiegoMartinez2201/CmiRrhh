using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class AlumbradoViv
{
    public int IdAlumbrado { get; set; }

    public string? DescripAlumbrado { get; set; }

    public virtual ICollection<Viviendum> Vivienda { get; set; } = new List<Viviendum>();
}
