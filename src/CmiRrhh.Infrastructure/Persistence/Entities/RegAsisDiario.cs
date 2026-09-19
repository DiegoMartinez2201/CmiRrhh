using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RegAsisDiario
{
    public DateTime Fecha { get; set; }

    public int IdEmpleado { get; set; }

    public string? MinNormales { get; set; }

    public string? MinTarde { get; set; }

    public string? Estado { get; set; }
}
