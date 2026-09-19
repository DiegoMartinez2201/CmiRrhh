using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class AsistenciaAud
{
    public int Id { get; set; }

    public DateTime? FechaAud { get; set; }

    public string? Usuario { get; set; }

    public string? Pc { get; set; }

    public string? Operacion { get; set; }

    public int? IdEmpleado { get; set; }

    public string? FechaAnt { get; set; }

    public string? HoraSalAnt { get; set; }

    public string? HoraEntAnt { get; set; }

    public string? HoraSalAct { get; set; }

    public string? HoraEntAct { get; set; }
}
