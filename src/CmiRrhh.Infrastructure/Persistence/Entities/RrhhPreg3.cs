using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhPreg3
{
    public int IdPregunta3 { get; set; }

    public string? Respues3 { get; set; }

    public virtual ICollection<RrhhAspSocio> RrhhAspSocios { get; set; } = new List<RrhhAspSocio>();
}
