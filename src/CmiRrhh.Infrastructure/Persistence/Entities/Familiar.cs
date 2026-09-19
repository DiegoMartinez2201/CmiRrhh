using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Familiar
{
    public int IdEmpleado { get; set; }

    public int IdPersona { get; set; }

    public string? FamSexo { get; set; }

    public string? FamLugTrab { get; set; }

    public int? IdEstadoCivil { get; set; }

    public string? NumAutogenSalud { get; set; }

    public string? FamOcupacion { get; set; }

    public string? FamGradoInstruc { get; set; }

    public int? IdTipoFam { get; set; }

    public bool? ViveCasa { get; set; }

    public bool? LaboraInstitucion { get; set; }

    public int? IdDiscapacidad { get; set; }

    public string? Procedencia { get; set; }

    public string? Enfermedad { get; set; }

    public string? TiempoEnfermedad { get; set; }

    public int? IdTipoSangre { get; set; }

    public virtual Discapacidad? IdDiscapacidadNavigation { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;

    public virtual EstadoCivil? IdEstadoCivilNavigation { get; set; }

    public virtual Persona IdPersonaNavigation { get; set; } = null!;

    public virtual TipoFamiliar? IdTipoFamNavigation { get; set; }

    public virtual TipoSangre? IdTipoSangreNavigation { get; set; }
}
