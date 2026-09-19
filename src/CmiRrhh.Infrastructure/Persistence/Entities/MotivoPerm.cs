using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class MotivoPerm
{
    public int IdMotivo { get; set; }

    public string? DescripMotivo { get; set; }

    public bool? Salario { get; set; }

    public int? IdTipoPermiso { get; set; }

    public string? Abrev { get; set; }

    public string? TipoModalidad { get; set; }

    public bool? Activo { get; set; }

    public virtual TipoPermiso? IdTipoPermisoNavigation { get; set; }

    public virtual ICollection<Permiso> Permisos { get; set; } = new List<Permiso>();
}
