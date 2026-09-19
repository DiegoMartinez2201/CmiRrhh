using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Usuario
{
    public int IdUsuario { get; set; }

    public string? Login { get; set; }

    public string? Descripcion { get; set; }

    public DateTime? Fecha { get; set; }

    public bool? Estado { get; set; }

    public int? IdEmpleado { get; set; }

    public virtual Empleado? IdEmpleadoNavigation { get; set; }

    public virtual ICollection<Rol> IdRols { get; set; } = new List<Rol>();
}
