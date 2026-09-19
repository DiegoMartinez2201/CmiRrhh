using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Comportamiento
{
    public int IdComportamiento { get; set; }

    public DateTime? Fecha { get; set; }

    public int? IdEmpleado { get; set; }

    public string? NumResol { get; set; }

    public string? Titulo { get; set; }

    public string? Descripcion { get; set; }

    public int? IdTipoComportamiento { get; set; }

    public virtual Empleado? IdEmpleadoNavigation { get; set; }

    public virtual TipoComportamiento? IdTipoComportamientoNavigation { get; set; }
}
