using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class TipoInstitucion
{
    public int IdTipoInstitucion { get; set; }

    public string? DescripTipoInstitucion { get; set; }

    public virtual ICollection<ExpLaboral> ExpLaborals { get; set; } = new List<ExpLaboral>();
}
