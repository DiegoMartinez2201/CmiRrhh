using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhRelacHermano
{
    public int IdRelacHermano { get; set; }

    public string? RelacHermanoDescrip { get; set; }

    public virtual ICollection<RrhhDinamicaFamiliar> RrhhDinamicaFamiliars { get; set; } = new List<RrhhDinamicaFamiliar>();
}
