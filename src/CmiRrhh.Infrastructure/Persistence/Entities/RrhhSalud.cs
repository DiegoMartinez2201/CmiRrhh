using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhSalud
{
    public int IdSalud { get; set; }

    public int? IdEmpleado { get; set; }

    public bool? EnferCronica { get; set; }

    public string? EnferCronicaDescrip { get; set; }

    public bool? FamDiscapacidad { get; set; }

    public string? FamDiscapDescrip { get; set; }

    public bool? Alergico { get; set; }

    public string? AlergicoDescrip { get; set; }

    public int? IdAcudeEnferm { get; set; }

    public virtual RrhhAcudeEnferm? IdAcudeEnfermNavigation { get; set; }

    public virtual Empleado? IdEmpleadoNavigation { get; set; }
}
