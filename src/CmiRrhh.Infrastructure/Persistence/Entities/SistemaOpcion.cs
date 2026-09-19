using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class SistemaOpcion
{
    public string IdSistemaOpcion { get; set; } = null!;

    public string? Descripcion { get; set; }

    public bool? ConClave { get; set; }

    public string? Clave { get; set; }

    public virtual ICollection<RolAcceso> RolAccesos { get; set; } = new List<RolAcceso>();
}
