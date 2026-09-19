using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhTipoFamilium
{
    public int IdTipoFam { get; set; }

    public string? TipoFamDescrip { get; set; }

    public virtual ICollection<RrhhDinamicaFamiliar> RrhhDinamicaFamiliars { get; set; } = new List<RrhhDinamicaFamiliar>();
}
