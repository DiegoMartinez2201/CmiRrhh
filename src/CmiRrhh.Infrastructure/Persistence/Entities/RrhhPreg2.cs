using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhPreg2
{
    public int IdPregunta2 { get; set; }

    public string? Respues2 { get; set; }

    public virtual ICollection<RrhhAspSocio> RrhhAspSocios { get; set; } = new List<RrhhAspSocio>();
}
