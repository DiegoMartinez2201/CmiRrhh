using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RolAcceso
{
    public int IdRol { get; set; }

    public string? Permiso { get; set; }

    public string IdSistemaOpcion { get; set; } = null!;

    public virtual Rol IdRolNavigation { get; set; } = null!;

    public virtual SistemaOpcion IdSistemaOpcionNavigation { get; set; } = null!;
}
