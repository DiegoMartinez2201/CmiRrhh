using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Persona
{
    public int IdPersona { get; set; }

    public string? Nombres { get; set; }

    public string? ApellidoPaterno { get; set; }

    public string? ApellidoMaterno { get; set; }

    public int? TipoDocId { get; set; }

    public string? NumDocId { get; set; }

    public string? Direccion { get; set; }

    public string? Telefono { get; set; }

    public string? Fax { get; set; }

    public string? Email { get; set; }

    public string? IdUbigeo { get; set; }

    public string? UbigeoDireccion { get; set; }

    public string? TipoPersona { get; set; }

    public DateTime? FechaNacimiento { get; set; }

    public DateTime? FechaRegistro { get; set; }

    public string? NumCelular { get; set; }

    public string? FonoCentroLab { get; set; }

    public virtual ICollection<Empleado> Empleados { get; set; } = new List<Empleado>();

    public virtual ICollection<Familiar> Familiars { get; set; } = new List<Familiar>();

    public virtual ICollection<RrhhAsegurado> RrhhAsegurados { get; set; } = new List<RrhhAsegurado>();
}
