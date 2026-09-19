using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class PermisoAud
{
    public int Id { get; set; }

    public DateTime? FechaAud { get; set; }

    public string? Usuario { get; set; }

    public string? Pc { get; set; }

    public string? Operacion { get; set; }

    public int? IdEmpleado { get; set; }

    public int? Npermiso { get; set; }

    public DateTime? FechaInicioAnt { get; set; }

    public DateTime? FechaFinAnt { get; set; }

    public int? IdMotivoAnt { get; set; }

    public string? ReferenciaAnt { get; set; }

    public string? AutorizacionAnt { get; set; }

    public string? ObsAnt { get; set; }

    public DateTime? FechaInicioAct { get; set; }

    public DateTime? FechaFinAct { get; set; }

    public int? IdMotivoAct { get; set; }

    public string? ReferenciaAct { get; set; }

    public string? AutorizacionAct { get; set; }

    public string? ObsAct { get; set; }
}
