using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhDinamicaFamiliar
{
    public int IdDinamica { get; set; }

    public int? IdEmpleado { get; set; }

    public int? IdTipoFam { get; set; }

    public int? IdRelaPareja { get; set; }

    public int? IdRelaPh { get; set; }

    public int? IdRelacHermano { get; set; }

    public string? Observacion { get; set; }

    public virtual Empleado? IdEmpleadoNavigation { get; set; }

    public virtual RrhhRelacPareja? IdRelaParejaNavigation { get; set; }

    public virtual RrhhRelacPh? IdRelaPhNavigation { get; set; }

    public virtual RrhhRelacHermano? IdRelacHermanoNavigation { get; set; }

    public virtual RrhhTipoFamilium? IdTipoFamNavigation { get; set; }
}
