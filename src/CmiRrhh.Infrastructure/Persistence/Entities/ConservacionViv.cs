using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class ConservacionViv
{
    public int IdConservacion { get; set; }

    public string? DescripConserva { get; set; }

    public virtual ICollection<Viviendum> Vivienda { get; set; } = new List<Viviendum>();
}
