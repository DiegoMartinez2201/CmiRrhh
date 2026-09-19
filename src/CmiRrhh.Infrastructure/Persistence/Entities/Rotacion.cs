using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Rotacion
{
    public int IdEmpleado { get; set; }

    public int IdRotacion { get; set; }

    public DateOnly? FechaMemo { get; set; }

    public string? NroMemo { get; set; }

    public int? IdAreaOrganiz { get; set; }

    public int Year { get; set; }

    public virtual EstructOrganiz? EstructOrganiz { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;
}
