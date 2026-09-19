using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhAcudeEnferm
{
    public int IdAcudeEnferm { get; set; }

    public string? AcudeEnfermDescrip { get; set; }

    public virtual ICollection<RrhhSalud> RrhhSaluds { get; set; } = new List<RrhhSalud>();
}
