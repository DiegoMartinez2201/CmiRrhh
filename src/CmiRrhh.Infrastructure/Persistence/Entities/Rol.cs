using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Rol
{
    public int IdRol { get; set; }

    public string? Descripcion { get; set; }

    public string? IdSistema { get; set; }

    public virtual ICollection<RolAcceso> RolAccesos { get; set; } = new List<RolAcceso>();

    public virtual ICollection<Usuario> IdUsuarios { get; set; } = new List<Usuario>();
}
