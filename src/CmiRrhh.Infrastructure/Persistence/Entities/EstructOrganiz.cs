using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class EstructOrganiz
{
    public int Year { get; set; }

    public int IdAreaOrganiz { get; set; }

    public string AreaOrganizacional { get; set; } = null!;

    public string Abrev { get; set; } = null!;

    public string Sigla { get; set; } = null!;

    public decimal? PresupAnual { get; set; }

    public decimal? PromedMensSueld { get; set; }

    public int? NroTrabajaUo { get; set; }

    public string? Mision { get; set; }

    public string? Vision { get; set; }

    public int? IdPresupuesto { get; set; }

    public int? YearDe { get; set; }

    public int? IdDependeDe { get; set; }

    public int? IdEmpleado { get; set; }

    public decimal? InversPublic { get; set; }

    public string? ApruebaPedido { get; set; }

    public decimal? MontoAprobacion { get; set; }

    public decimal? PresupCompra { get; set; }

    public decimal? PresupUtilizado { get; set; }

    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();

    public virtual EstructOrganiz? EstructOrganizNavigation { get; set; }

    public virtual ICollection<EstructOrganiz> InverseEstructOrganizNavigation { get; set; } = new List<EstructOrganiz>();

    public virtual ICollection<Rotacion> Rotacions { get; set; } = new List<Rotacion>();

    public virtual ICollection<Empleado> IdEmpleados { get; set; } = new List<Empleado>();
}
