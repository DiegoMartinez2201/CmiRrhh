using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhAsegurado
{
    public int IdEmpleado { get; set; }

    public int NroBeneficiario { get; set; }

    public int? IdPersona { get; set; }

    public int? IdEstadoCivil { get; set; }

    public string? Sexo { get; set; }

    public string? VinculoFamiliar { get; set; }

    public string? NroPartida { get; set; }

    public string? NroResolMayorIndiscap { get; set; }

    public DateTime? FechaInicioVinculo { get; set; }

    public int? IdMotivoBaja { get; set; }

    public string? NroPartidaDef { get; set; }

    public string? OtrosMotivos { get; set; }

    public DateTime? FechaFinVinculo { get; set; }

    public string? Reevaluar { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;

    public virtual EstadoCivil? IdEstadoCivilNavigation { get; set; }

    public virtual MotivoBaja? IdMotivoBajaNavigation { get; set; }

    public virtual Persona? IdPersonaNavigation { get; set; }
}
