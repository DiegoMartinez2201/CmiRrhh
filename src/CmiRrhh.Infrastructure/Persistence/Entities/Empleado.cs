using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Empleado
{
    public int IdEmpleado { get; set; }

    public int Year { get; set; }

    public int IdAreaOrganiz { get; set; }

    public int? IdPersona { get; set; }

    public string? ExpSocial { get; set; }

    public DateTime? FechaIngreso { get; set; }

    public int? IdAfp { get; set; }

    public string? Brevete { get; set; }

    public int? IdEstadoCivil { get; set; }

    public string? Sexo { get; set; }

    public string? CtaCorriente { get; set; }

    public string? NroAfp { get; set; }

    public DateTime? FechaAfp { get; set; }

    public int? IdSeguro { get; set; }

    public string? NroSeguro { get; set; }

    public int? IdTipoSangre { get; set; }

    public string? DecLey { get; set; }

    public byte[]? Foto { get; set; }

    public int? IdTipoTrabajador { get; set; }

    public string? Estado { get; set; }

    public int? IdCargo { get; set; }

    public int? IdDiscapacidad { get; set; }

    public string? Profesion { get; set; }

    public bool? JefeHogar { get; set; }

    public string? CargaFam { get; set; }

    public string? NumHijos { get; set; }

    public int? IdViveCon { get; set; }

    public string? ObsFam { get; set; }

    public string? AspecSalud { get; set; }

    public string? AspecEducacion { get; set; }

    public string? AspecRecreacion { get; set; }

    public string? AspecPsico { get; set; }

    public string? AspecSocial { get; set; }

    public string? DiagnosSocial { get; set; }

    public int? IdNacionalidad { get; set; }

    public string? NumLibretaMilitar { get; set; }

    public string? GradoInstruccion { get; set; }

    public int? IdRegimenPen { get; set; }

    public string? NumRuc { get; set; }

    public string? NumAutogenSalud { get; set; }

    public string? NumResolCese { get; set; }

    public DateTime? FechaResolCese { get; set; }

    public string? NumResol20530 { get; set; }

    public DateTime? FechaResol20530 { get; set; }

    public string? NumResolPenMen { get; set; }

    public DateTime? FechaResolPenMen { get; set; }

    public string? NumResoIngreEsta { get; set; }

    public DateTime? FechaIngreEstado { get; set; }

    public DateTime? FechaResolIngreEsta { get; set; }

    public string? NumResoIngreInstitu { get; set; }

    public DateTime? FechaResoIngreInstitu { get; set; }

    public int? IdHorario { get; set; }

    public Guid? Userid { get; set; }

    public int? IdLocal { get; set; }

    public virtual ICollection<Asistencium> Asistencia { get; set; } = new List<Asistencium>();

    public virtual ICollection<Capacitacion> Capacitacions { get; set; } = new List<Capacitacion>();

    public virtual ICollection<Comportamiento> Comportamientos { get; set; } = new List<Comportamiento>();

    public virtual EstructOrganiz EstructOrganiz { get; set; } = null!;

    public virtual ICollection<EstudiosRealizado> EstudiosRealizados { get; set; } = new List<EstudiosRealizado>();

    public virtual ICollection<ExpLaboral> ExpLaborals { get; set; } = new List<ExpLaboral>();

    public virtual ICollection<Familiar> Familiars { get; set; } = new List<Familiar>();

    public virtual ICollection<HorarioTemporal> HorarioTemporals { get; set; } = new List<HorarioTemporal>();

    public virtual Afp? IdAfpNavigation { get; set; }

    public virtual Cargo? IdCargoNavigation { get; set; }

    public virtual Discapacidad? IdDiscapacidadNavigation { get; set; }

    public virtual EstadoCivil? IdEstadoCivilNavigation { get; set; }

    public virtual Horario? IdHorarioNavigation { get; set; }

    public virtual Local? IdLocalNavigation { get; set; }

    public virtual Nacionalidad? IdNacionalidadNavigation { get; set; }

    public virtual Persona? IdPersonaNavigation { get; set; }

    public virtual RegimenPension? IdRegimenPenNavigation { get; set; }

    public virtual TipoSangre? IdTipoSangreNavigation { get; set; }

    public virtual TipoTrabajador? IdTipoTrabajadorNavigation { get; set; }

    public virtual ViveCon? IdViveConNavigation { get; set; }

    public virtual ICollection<Marcacion> Marcacions { get; set; } = new List<Marcacion>();

    public virtual ICollection<PeriodoLaboral> PeriodoLaborals { get; set; } = new List<PeriodoLaboral>();

    public virtual ICollection<Permiso> Permisos { get; set; } = new List<Permiso>();

    public virtual ICollection<Resolucion> Resolucions { get; set; } = new List<Resolucion>();

    public virtual ICollection<Rotacion> Rotacions { get; set; } = new List<Rotacion>();

    public virtual ICollection<RrhhAsegurado> RrhhAsegurados { get; set; } = new List<RrhhAsegurado>();

    public virtual ICollection<RrhhAspSocio> RrhhAspSocios { get; set; } = new List<RrhhAspSocio>();

    public virtual ICollection<RrhhDinamicaFamiliar> RrhhDinamicaFamiliars { get; set; } = new List<RrhhDinamicaFamiliar>();

    public virtual ICollection<RrhhFuncFam> RrhhFuncFams { get; set; } = new List<RrhhFuncFam>();

    public virtual ICollection<RrhhSalud> RrhhSaluds { get; set; } = new List<RrhhSalud>();

    public virtual ICollection<TitulosEmpleado> TitulosEmpleados { get; set; } = new List<TitulosEmpleado>();

    public virtual ICollection<Usuario> Usuarios { get; set; } = new List<Usuario>();

    public virtual ICollection<Viviendum> Vivienda { get; set; } = new List<Viviendum>();

    public virtual ICollection<EstructOrganiz> EstructOrganizs { get; set; } = new List<EstructOrganiz>();
}
