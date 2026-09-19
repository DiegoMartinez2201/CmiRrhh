using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhRelacPareja
{
    public int IdRelacPareja { get; set; }

    public string? RelacParejaDescrip { get; set; }

    public virtual ICollection<RrhhDinamicaFamiliar> RrhhDinamicaFamiliars { get; set; } = new List<RrhhDinamicaFamiliar>();
}
