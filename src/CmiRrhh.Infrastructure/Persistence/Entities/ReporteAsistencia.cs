using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class ReporteAsistencia
{
    public DateTime Fecha { get; set; }

    public int IdEmpleado { get; set; }

    public string? Estado { get; set; }

    public decimal? Mt { get; set; }
}
