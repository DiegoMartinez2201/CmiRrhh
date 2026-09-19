using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Resolucion
{
    public int IdEmpleado { get; set; }

    public int IdResolucion { get; set; }

    public int? IdTipoResolucion { get; set; }

    public DateOnly? FechaResolucion { get; set; }

    public string? NumeroResolucion { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;

    public virtual TipoResolucion? IdTipoResolucionNavigation { get; set; }
}
