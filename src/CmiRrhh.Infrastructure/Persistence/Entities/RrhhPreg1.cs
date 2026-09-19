using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhPreg1
{
    public int IdPregunta1 { get; set; }

    public string? Respues1 { get; set; }

    public virtual ICollection<RrhhAspSocio> RrhhAspSocios { get; set; } = new List<RrhhAspSocio>();
}
