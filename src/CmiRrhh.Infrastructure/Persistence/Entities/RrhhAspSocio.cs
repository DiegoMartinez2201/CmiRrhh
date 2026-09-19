using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhAspSocio
{
    public int IdAspSocio { get; set; }

    public int? IdEmpleado { get; set; }

    public int? IdPregunta1 { get; set; }

    public int? IdPregunta2 { get; set; }

    public int? IdPregunta3 { get; set; }

    public string? PrincipProblemas { get; set; }

    public string? PropMejoraInstitu { get; set; }

    public string? Hobby { get; set; }

    public string? ActRecreaInstitu { get; set; }

    public virtual Empleado? IdEmpleadoNavigation { get; set; }

    public virtual RrhhPreg1? IdPregunta1Navigation { get; set; }

    public virtual RrhhPreg2? IdPregunta2Navigation { get; set; }

    public virtual RrhhPreg3? IdPregunta3Navigation { get; set; }
}
