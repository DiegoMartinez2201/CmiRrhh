using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhRelacPh
{
    public int IdRelacPh { get; set; }

    public string? RelacPhdescrip { get; set; }

    public virtual ICollection<RrhhDinamicaFamiliar> RrhhDinamicaFamiliars { get; set; } = new List<RrhhDinamicaFamiliar>();
}
