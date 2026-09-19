using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class TipoPermiso
{
    public int IdTipoPermiso { get; set; }

    public string? DescripTipoPermiso { get; set; }

    public virtual ICollection<MotivoPerm> MotivoPerms { get; set; } = new List<MotivoPerm>();
}
