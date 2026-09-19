using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Horario
{
    public int IdHorario { get; set; }

    public string? Ingreso1 { get; set; }

    public string? Salida1 { get; set; }

    public string? Ingreso2 { get; set; }

    public string? Salida2 { get; set; }

    public string? DescripHorario { get; set; }

    public bool? Estado { get; set; }

    public bool? SgtDia { get; set; }

    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();

    public virtual ICollection<HorarioTemporal> HorarioTemporals { get; set; } = new List<HorarioTemporal>();
}
