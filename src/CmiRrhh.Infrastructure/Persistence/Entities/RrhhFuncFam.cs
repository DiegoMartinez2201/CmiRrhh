using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhFuncFam
{
    public int IdFuncFamiliar { get; set; }

    public int? IdEmpleado { get; set; }

    public string? Com1 { get; set; }

    public string? Com2 { get; set; }

    public string? Afec1 { get; set; }

    public string? Afec2 { get; set; }

    public string? Decis1 { get; set; }

    public string? Decis2 { get; set; }

    public string? Soc1 { get; set; }

    public string? Soc2 { get; set; }

    public string? Soc3 { get; set; }

    public virtual Empleado? IdEmpleadoNavigation { get; set; }
}
