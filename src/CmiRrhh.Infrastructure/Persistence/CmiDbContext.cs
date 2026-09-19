using System;
using System.Collections.Generic;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence;

public partial class CmiDbContext : DbContext
{
    public CmiDbContext(DbContextOptions<CmiDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Afp> Afps { get; set; }

    public virtual DbSet<AguaViv> AguaVivs { get; set; }

    public virtual DbSet<AlumbradoViv> AlumbradoVivs { get; set; }

    public virtual DbSet<AsisNorm> AsisNorms { get; set; }

    public virtual DbSet<AsistenciaAud> AsistenciaAuds { get; set; }

    public virtual DbSet<Asistencium> Asistencia { get; set; }

    public virtual DbSet<AuxRrhhReporteAsistencium> AuxRrhhReporteAsistencia { get; set; }

    public virtual DbSet<Capacitacion> Capacitacions { get; set; }

    public virtual DbSet<Cargo> Cargos { get; set; }

    public virtual DbSet<Comportamiento> Comportamientos { get; set; }

    public virtual DbSet<ConservacionViv> ConservacionVivs { get; set; }

    public virtual DbSet<Discapacidad> Discapacidads { get; set; }

    public virtual DbSet<Empleado> Empleados { get; set; }

    public virtual DbSet<EstadoCivil> EstadoCivils { get; set; }

    public virtual DbSet<EstadoEstudio> EstadoEstudios { get; set; }

    public virtual DbSet<EstructOrganiz> EstructOrganizs { get; set; }

    public virtual DbSet<EstudiosRealizado> EstudiosRealizados { get; set; }

    public virtual DbSet<ExcretasViv> ExcretasVivs { get; set; }

    public virtual DbSet<ExpLaboral> ExpLaborals { get; set; }

    public virtual DbSet<Familiar> Familiars { get; set; }

    public virtual DbSet<Familium> Familia { get; set; }

    public virtual DbSet<Horario> Horarios { get; set; }

    public virtual DbSet<HorarioTemporal> HorarioTemporals { get; set; }

    public virtual DbSet<Institucion> Institucions { get; set; }

    public virtual DbSet<Limitacion> Limitacions { get; set; }

    public virtual DbSet<Local> Locals { get; set; }

    public virtual DbSet<Marcacion> Marcacions { get; set; }

    public virtual DbSet<Marcacione> Marcaciones { get; set; }

    public virtual DbSet<MaterialViv> MaterialVivs { get; set; }

    public virtual DbSet<MotivoBaja> MotivoBajas { get; set; }

    public virtual DbSet<MotivoPerm> MotivoPerms { get; set; }

    public virtual DbSet<Nacionalidad> Nacionalidads { get; set; }

    public virtual DbSet<PeriodoLaboral> PeriodoLaborals { get; set; }

    public virtual DbSet<Permiso> Permisos { get; set; }

    public virtual DbSet<PermisoAud> PermisoAuds { get; set; }

    public virtual DbSet<Persona> Personas { get; set; }

    public virtual DbSet<RegAsisDiario> RegAsisDiarios { get; set; }

    public virtual DbSet<RegimenPension> RegimenPensions { get; set; }

    public virtual DbSet<ReporteAsistencia> ReporteAsistencias { get; set; }

    public virtual DbSet<Resolucion> Resolucions { get; set; }

    public virtual DbSet<ResponsableXuo> ResponsableXuos { get; set; }

    public virtual DbSet<Rol> Rols { get; set; }

    public virtual DbSet<RolAcceso> RolAccesos { get; set; }

    public virtual DbSet<Rotacion> Rotacions { get; set; }

    public virtual DbSet<RrhhAcudeEnferm> RrhhAcudeEnferms { get; set; }

    public virtual DbSet<RrhhAsegurado> RrhhAsegurados { get; set; }

    public virtual DbSet<RrhhAspSocio> RrhhAspSocios { get; set; }

    public virtual DbSet<RrhhDinamicaFamiliar> RrhhDinamicaFamiliars { get; set; }

    public virtual DbSet<RrhhFeriado> RrhhFeriados { get; set; }

    public virtual DbSet<RrhhFuncFam> RrhhFuncFams { get; set; }

    public virtual DbSet<RrhhPreg1> RrhhPreg1s { get; set; }

    public virtual DbSet<RrhhPreg2> RrhhPreg2s { get; set; }

    public virtual DbSet<RrhhPreg3> RrhhPreg3s { get; set; }

    public virtual DbSet<RrhhRelacHermano> RrhhRelacHermanos { get; set; }

    public virtual DbSet<RrhhRelacPareja> RrhhRelacParejas { get; set; }

    public virtual DbSet<RrhhRelacPh> RrhhRelacPhs { get; set; }

    public virtual DbSet<RrhhSalud> RrhhSaluds { get; set; }

    public virtual DbSet<RrhhTempFecha> RrhhTempFechas { get; set; }

    public virtual DbSet<RrhhTipoFamilium> RrhhTipoFamilia { get; set; }

    public virtual DbSet<SistemaOpcion> SistemaOpcions { get; set; }

    public virtual DbSet<TenenciaViv> TenenciaVivs { get; set; }

    public virtual DbSet<TipoComportamiento> TipoComportamientos { get; set; }

    public virtual DbSet<TipoDoc> TipoDocs { get; set; }

    public virtual DbSet<TipoDocId> TipoDocIds { get; set; }

    public virtual DbSet<TipoEstudio> TipoEstudios { get; set; }

    public virtual DbSet<TipoFamiliar> TipoFamiliars { get; set; }

    public virtual DbSet<TipoInstitucion> TipoInstitucions { get; set; }

    public virtual DbSet<TipoPermiso> TipoPermisos { get; set; }

    public virtual DbSet<TipoResolucion> TipoResolucions { get; set; }

    public virtual DbSet<TipoSangre> TipoSangres { get; set; }

    public virtual DbSet<TipoTrabajador> TipoTrabajadors { get; set; }

    public virtual DbSet<TipoViv> TipoVivs { get; set; }

    public virtual DbSet<TitulosEmpleado> TitulosEmpleados { get; set; }

    public virtual DbSet<UbicacionViv> UbicacionVivs { get; set; }

    public virtual DbSet<Ubigeo> Ubigeos { get; set; }

    public virtual DbSet<Usuario> Usuarios { get; set; }

    public virtual DbSet<ViveCon> ViveCons { get; set; }

    public virtual DbSet<Viviendum> Vivienda { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.UseCollation("Modern_Spanish_CI_AS");

        modelBuilder.Entity<Afp>(entity =>
        {
            entity.HasKey(e => e.IdAfp).HasName("PK__AFP__5091BB2E");

            entity.ToTable("AFP");

            entity.Property(e => e.IdAfp)
                .ValueGeneratedNever()
                .HasColumnName("IdAFP");
            entity.Property(e => e.DescripAfp)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("DescripAFP");
            entity.Property(e => e.DireccAfp)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("DireccAFP");
            entity.Property(e => e.NomContAfp)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("NomContAFP");
            entity.Property(e => e.TelefAfp)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("TelefAFP");
        });

        modelBuilder.Entity<AguaViv>(entity =>
        {
            entity.HasKey(e => e.IdAgua).HasName("PK__Agua__6EE13824");

            entity.ToTable("AguaViv");

            entity.Property(e => e.IdAgua).ValueGeneratedNever();
            entity.Property(e => e.DescripAgua)
                .HasMaxLength(33)
                .IsUnicode(false);
        });

        modelBuilder.Entity<AlumbradoViv>(entity =>
        {
            entity.HasKey(e => e.IdAlumbrado).HasName("PK__Alumbrado__70C98096");

            entity.ToTable("AlumbradoViv");

            entity.Property(e => e.IdAlumbrado).ValueGeneratedNever();
            entity.Property(e => e.DescripAlumbrado)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<AsisNorm>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("asis_norm");

            entity.Property(e => e.AlmEnt)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .UseCollation("SQL_Latin1_General_CP1_CI_AS")
                .HasColumnName("alm_ent");
            entity.Property(e => e.AlmSal)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .UseCollation("SQL_Latin1_General_CP1_CI_AS")
                .HasColumnName("alm_sal");
            entity.Property(e => e.FecAsi)
                .HasColumnType("datetime")
                .HasColumnName("Fec_Asi");
            entity.Property(e => e.FlagEnt)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength()
                .UseCollation("SQL_Latin1_General_CP1_CI_AS")
                .HasColumnName("flag_ent");
            entity.Property(e => e.FlagSal)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength()
                .UseCollation("SQL_Latin1_General_CP1_CI_AS")
                .HasColumnName("flag_sal");
            entity.Property(e => e.HorEnt)
                .HasMaxLength(8)
                .IsFixedLength()
                .UseCollation("SQL_Latin1_General_CP1_CI_AS")
                .HasColumnName("Hor_Ent");
            entity.Property(e => e.HorSal)
                .HasMaxLength(8)
                .IsFixedLength()
                .UseCollation("SQL_Latin1_General_CP1_CI_AS")
                .HasColumnName("Hor_Sal");
            entity.Property(e => e.PersCod).HasColumnName("pers_cod");
        });

        modelBuilder.Entity<AsistenciaAud>(entity =>
        {
            entity.ToTable("Asistencia_Aud");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.FechaAnt)
                .HasMaxLength(50)
                .HasColumnName("Fecha_Ant");
            entity.Property(e => e.FechaAud)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_aud");
            entity.Property(e => e.HoraEntAct)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("Hora_Ent_Act");
            entity.Property(e => e.HoraEntAnt)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("Hora_Ent_Ant");
            entity.Property(e => e.HoraSalAct)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("Hora_Sal_Act");
            entity.Property(e => e.HoraSalAnt)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("Hora_Sal_Ant");
            entity.Property(e => e.IdEmpleado).HasColumnName("idEmpleado");
            entity.Property(e => e.Operacion)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Pc).HasMaxLength(50);
            entity.Property(e => e.Usuario).HasMaxLength(50);
        });

        modelBuilder.Entity<Asistencium>(entity =>
        {
            entity.HasKey(e => new { e.Fecha, e.IdEmpleado }).HasName("PK__Asistencia__417A6027");

            entity.ToTable(tb =>
                {
                    tb.HasTrigger("tr_aud_asis_norm");
                    tb.HasTrigger("tr_aud_asis_norm_Insert");
                });

            entity.Property(e => e.Fecha).HasColumnType("datetime");
            entity.Property(e => e.AlmEnt)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("Alm_Ent");
            entity.Property(e => e.AlmSal)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("Alm_Sal");
            entity.Property(e => e.FlagEnt).HasColumnName("Flag_Ent");
            entity.Property(e => e.FlagSal).HasColumnName("Flag_Sal");
            entity.Property(e => e.HorEnt)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("Hor_Ent");
            entity.Property(e => e.HorSal)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("Hor_Sal");
            entity.Property(e => e.IdHorario).HasColumnName("idHorario");
            entity.Property(e => e.Pc)
                .HasMaxLength(50)
                .HasColumnName("PC");
            entity.Property(e => e.Usuario).HasMaxLength(50);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.Asistencia)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Asistenci__IdEmp__6B7099F3");
        });

        modelBuilder.Entity<AuxRrhhReporteAsistencium>(entity =>
        {
            entity.HasKey(e => e.IdEmpleado);

            entity.ToTable("AuxRRHH_ReporteAsistencia");

            entity.Property(e => e.IdEmpleado)
                .ValueGeneratedNever()
                .HasColumnName("idEmpleado");
        });

        modelBuilder.Entity<Capacitacion>(entity =>
        {
            entity.HasKey(e => e.IdCapacitacion).HasName("PK__Capacitaciones__23AA061E");

            entity.ToTable("Capacitacion");

            entity.Property(e => e.IdCapacitacion).ValueGeneratedNever();
            entity.Property(e => e.FechaFin).HasColumnType("datetime");
            entity.Property(e => e.FechaInicio).HasColumnType("datetime");
            entity.Property(e => e.InstitucionOrganizadora)
                .HasMaxLength(300)
                .IsUnicode(false);
            entity.Property(e => e.NombreCurso)
                .HasMaxLength(300)
                .IsUnicode(false);
            entity.Property(e => e.NumHoras)
                .HasMaxLength(5)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.Capacitacions)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK__Capacitac__IdEmp__6A7C75BA");
        });

        modelBuilder.Entity<Cargo>(entity =>
        {
            entity.HasKey(e => e.IdCargo).HasName("PK__Cargo__49E4BD9F");

            entity.ToTable("Cargo");

            entity.Property(e => e.IdCargo).ValueGeneratedNever();
            entity.Property(e => e.Abreviatura)
                .HasMaxLength(8)
                .IsUnicode(false);
            entity.Property(e => e.Cargo1)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Cargo");
        });

        modelBuilder.Entity<Comportamiento>(entity =>
        {
            entity.HasKey(e => e.IdComportamiento).HasName("PK__Comportamiento__6F212F46");

            entity.ToTable("Comportamiento");

            entity.Property(e => e.IdComportamiento)
                .ValueGeneratedNever()
                .HasColumnName("idComportamiento");
            entity.Property(e => e.Descripcion)
                .HasMaxLength(2000)
                .IsUnicode(false);
            entity.Property(e => e.Fecha).HasColumnType("datetime");
            entity.Property(e => e.IdTipoComportamiento).HasColumnName("idTipoComportamiento");
            entity.Property(e => e.NumResol)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Titulo)
                .HasMaxLength(1000)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.Comportamientos)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK__Comportam__IdEmp__68942D48");

            entity.HasOne(d => d.IdTipoComportamientoNavigation).WithMany(p => p.Comportamientos)
                .HasForeignKey(d => d.IdTipoComportamiento)
                .HasConstraintName("FK__Comportam__idTip__7015537F");
        });

        modelBuilder.Entity<ConservacionViv>(entity =>
        {
            entity.HasKey(e => e.IdConservacion).HasName("PK__Conservacion__72B1C908");

            entity.ToTable("ConservacionViv");

            entity.Property(e => e.IdConservacion).ValueGeneratedNever();
            entity.Property(e => e.DescripConserva)
                .HasMaxLength(17)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Discapacidad>(entity =>
        {
            entity.HasKey(e => e.IdDiscapacidad).HasName("PK__Discapacidad__749A117A");

            entity.ToTable("Discapacidad");

            entity.Property(e => e.IdDiscapacidad).ValueGeneratedNever();
            entity.Property(e => e.DescripDiscapacidad)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("Descrip_Discapacidad");
        });

        modelBuilder.Entity<Empleado>(entity =>
        {
            entity.HasKey(e => e.IdEmpleado).HasName("PK__Empleado__4B03CA61");

            entity.ToTable("Empleado");

            entity.HasIndex(e => e.IdPersona, "IDX_idPersona");

            entity.Property(e => e.IdEmpleado).ValueGeneratedNever();
            entity.Property(e => e.AspecEducacion)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.AspecPsico)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.AspecRecreacion)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.AspecSalud)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.AspecSocial)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.Brevete)
                .HasMaxLength(12)
                .IsUnicode(false);
            entity.Property(e => e.CargaFam)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.CtaCorriente)
                .HasMaxLength(16)
                .IsUnicode(false);
            entity.Property(e => e.DecLey)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.DiagnosSocial)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.Estado)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.ExpSocial)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.FechaAfp)
                .HasColumnType("datetime")
                .HasColumnName("FechaAFP");
            entity.Property(e => e.FechaIngreEstado).HasColumnType("datetime");
            entity.Property(e => e.FechaIngreso).HasColumnType("smalldatetime");
            entity.Property(e => e.FechaResoIngreInstitu).HasColumnType("datetime");
            entity.Property(e => e.FechaResol20530).HasColumnType("datetime");
            entity.Property(e => e.FechaResolCese).HasColumnType("datetime");
            entity.Property(e => e.FechaResolIngreEsta).HasColumnType("datetime");
            entity.Property(e => e.FechaResolPenMen).HasColumnType("datetime");
            entity.Property(e => e.Foto).HasColumnType("image");
            entity.Property(e => e.GradoInstruccion)
                .HasMaxLength(80)
                .IsUnicode(false);
            entity.Property(e => e.IdAfp).HasColumnName("IdAFP");
            entity.Property(e => e.IdAreaOrganiz).HasColumnName("idAreaOrganiz");
            entity.Property(e => e.IdHorario).HasColumnName("idHorario");
            entity.Property(e => e.IdLocal).HasColumnName("idLocal");
            entity.Property(e => e.NroAfp)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("NroAFP");
            entity.Property(e => e.NroSeguro)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.NumAutogenSalud)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.NumHijos)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.NumLibretaMilitar)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.NumResoIngreEsta)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.NumResoIngreInstitu)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.NumResol20530)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.NumResolCese)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.NumResolPenMen)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.NumRuc)
                .HasMaxLength(12)
                .IsUnicode(false)
                .HasColumnName("NumRUC");
            entity.Property(e => e.ObsFam).HasMaxLength(500);
            entity.Property(e => e.Profesion)
                .HasMaxLength(80)
                .IsUnicode(false);
            entity.Property(e => e.Sexo)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();

            entity.HasOne(d => d.IdAfpNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdAfp)
                .HasConstraintName("FK__Empleado__IdAFP__5769A146");

            entity.HasOne(d => d.IdCargoNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdCargo)
                .HasConstraintName("FK__Empleado__IdCarg__52A4EC29");

            entity.HasOne(d => d.IdDiscapacidadNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdDiscapacidad)
                .HasConstraintName("FK__Empleado__IdDisc__51B0C7F0");

            entity.HasOne(d => d.IdEstadoCivilNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdEstadoCivil)
                .HasConstraintName("FK__Empleado__IdEsta__56757D0D");

            entity.HasOne(d => d.IdHorarioNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdHorario)
                .HasConstraintName("FK__Empleado__idHora__4DE0370C");

            entity.HasOne(d => d.IdLocalNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdLocal)
                .HasConstraintName("FK_Empleado_Local");

            entity.HasOne(d => d.IdNacionalidadNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdNacionalidad)
                .HasConstraintName("FK__Empleado__IdNaci__4FC87F7E");

            entity.HasOne(d => d.IdPersonaNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdPersona)
                .HasConstraintName("FK__Empleado__IdPers__585DC57F");

            entity.HasOne(d => d.IdRegimenPenNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdRegimenPen)
                .HasConstraintName("FK__Empleado__IdRegi__4ED45B45");

            entity.HasOne(d => d.IdTipoSangreNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdTipoSangre)
                .HasConstraintName("FK__Empleado__IdTipo__548D349B");

            entity.HasOne(d => d.IdTipoTrabajadorNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdTipoTrabajador)
                .HasConstraintName("FK__Empleado__IdTipo__53991062");

            entity.HasOne(d => d.IdViveConNavigation).WithMany(p => p.Empleados)
                .HasForeignKey(d => d.IdViveCon)
                .HasConstraintName("FK__Empleado__IdVive__50BCA3B7");

            entity.HasOne(d => d.EstructOrganiz).WithMany(p => p.Empleados)
                .HasForeignKey(d => new { d.Year, d.IdAreaOrganiz })
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Empleado__5A460DF1");
        });

        modelBuilder.Entity<EstadoCivil>(entity =>
        {
            entity.HasKey(e => e.IdEstadoCivil).HasName("PK__EstadoCivil__564A9484");

            entity.ToTable("EstadoCivil");

            entity.Property(e => e.IdEstadoCivil).ValueGeneratedNever();
            entity.Property(e => e.AbrevEstCiv)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.DescripEstCivil)
                .HasMaxLength(11)
                .IsUnicode(false);
        });

        modelBuilder.Entity<EstadoEstudio>(entity =>
        {
            entity.HasKey(e => e.IdEstadoEstudio).HasName("PK__EstadoEstudios__25924E90");

            entity.ToTable("EstadoEstudio");

            entity.Property(e => e.IdEstadoEstudio).ValueGeneratedNever();
            entity.Property(e => e.DescripEstadoEstudio)
                .HasMaxLength(10)
                .IsUnicode(false);
        });

        modelBuilder.Entity<EstructOrganiz>(entity =>
        {
            entity.HasKey(e => new { e.Year, e.IdAreaOrganiz }).HasName("PK__EstructOrganiz__7524215F");

            entity.ToTable("EstructOrganiz");

            entity.Property(e => e.IdAreaOrganiz).HasColumnName("idAreaOrganiz");
            entity.Property(e => e.Abrev)
                .HasMaxLength(10)
                .IsUnicode(false);
            entity.Property(e => e.ApruebaPedido)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.AreaOrganizacional)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.IdDependeDe).HasColumnName("idDependeDe");
            entity.Property(e => e.InversPublic).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.Mision)
                .HasMaxLength(1000)
                .IsUnicode(false);
            entity.Property(e => e.MontoAprobacion).HasColumnType("decimal(18, 2)");
            entity.Property(e => e.NroTrabajaUo).HasColumnName("NroTrabajaUO");
            entity.Property(e => e.PresupAnual).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.PresupCompra).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.PresupUtilizado).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.PromedMensSueld).HasColumnType("decimal(11, 2)");
            entity.Property(e => e.Sigla)
                .HasMaxLength(6)
                .IsUnicode(false);
            entity.Property(e => e.Vision)
                .HasMaxLength(1000)
                .IsUnicode(false);

            entity.HasOne(d => d.EstructOrganizNavigation).WithMany(p => p.InverseEstructOrganizNavigation)
                .HasForeignKey(d => new { d.YearDe, d.IdDependeDe })
                .HasConstraintName("FK__EstructOrganiz__76184598");

            entity.HasMany(d => d.IdEmpleados).WithMany(p => p.EstructOrganizs)
                .UsingEntity<Dictionary<string, object>>(
                    "EmpleadoArea",
                    r => r.HasOne<Empleado>().WithMany()
                        .HasForeignKey("IdEmpleado")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__Empleado___IdEmp__5087998D"),
                    l => l.HasOne<EstructOrganiz>().WithMany()
                        .HasForeignKey("Year", "IdAreaOrganiz")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__Empleado_Area__517BBDC6"),
                    j =>
                    {
                        j.HasKey("Year", "IdAreaOrganiz", "IdEmpleado").HasName("PK__Empleado_Area__4F937554");
                        j.ToTable("Empleado_Area");
                        j.IndexerProperty<int>("IdAreaOrganiz").HasColumnName("idAreaOrganiz");
                    });
        });

        modelBuilder.Entity<EstudiosRealizado>(entity =>
        {
            entity.HasKey(e => new { e.IdTipoEstudios, e.IdEmpleado, e.Correlativo }).HasName("PK__EstudiosRealizad__2B4B27E6");

            entity.ToTable("EstudiosRealizado");

            entity.Property(e => e.AñoInicio).HasColumnType("datetime");
            entity.Property(e => e.AñoTermino).HasColumnType("datetime");
            entity.Property(e => e.CentroEstudios)
                .HasMaxLength(150)
                .IsUnicode(false);
            entity.Property(e => e.Especialidad)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.EstudiosRealizados)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_EstudiosRealizado_Empleado");

            entity.HasOne(d => d.IdEstadoEstudioNavigation).WithMany(p => p.EstudiosRealizados)
                .HasForeignKey(d => d.IdEstadoEstudio)
                .HasConstraintName("FK_EstudiosRealizado_EstadoEstudio");

            entity.HasOne(d => d.IdTipoEstudiosNavigation).WithMany(p => p.EstudiosRealizados)
                .HasForeignKey(d => d.IdTipoEstudios)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_EstudiosRealizado_TipoEstudio");
        });

        modelBuilder.Entity<ExcretasViv>(entity =>
        {
            entity.HasKey(e => e.IdExcretas).HasName("PK__Excretas__7C3B3342");

            entity.ToTable("ExcretasViv");

            entity.Property(e => e.IdExcretas).ValueGeneratedNever();
            entity.Property(e => e.DescripExcretas)
                .HasMaxLength(33)
                .IsUnicode(false);
        });

        modelBuilder.Entity<ExpLaboral>(entity =>
        {
            entity.HasKey(e => new { e.IdEmpleado, e.IdExpLab }).HasName("PK__ExpLaboral__2D337058");

            entity.ToTable("ExpLaboral");

            entity.Property(e => e.Cargo)
                .HasMaxLength(40)
                .IsUnicode(false);
            entity.Property(e => e.FechaEgreso).HasColumnType("datetime");
            entity.Property(e => e.FechaIngreso).HasColumnType("datetime");
            entity.Property(e => e.NomInstitucion)
                .HasMaxLength(120)
                .IsUnicode(false);
            entity.Property(e => e.UnidadOrganica)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.ExpLaborals)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__ExpLabora__IdEmp__65B7C09D");

            entity.HasOne(d => d.IdTipoInstitucionNavigation).WithMany(p => p.ExpLaborals)
                .HasForeignKey(d => d.IdTipoInstitucion)
                .HasConstraintName("FK_ExpLaboral_TipoInstitucion");
        });

        modelBuilder.Entity<Familiar>(entity =>
        {
            entity.HasKey(e => new { e.IdEmpleado, e.IdPersona }).HasName("PK__Familiar__11413D20");

            entity.ToTable("Familiar");

            entity.Property(e => e.Enfermedad)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.FamGradoInstruc)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.FamLugTrab)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.FamOcupacion)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.FamSexo)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.NumAutogenSalud)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.Procedencia)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.TiempoEnfermedad)
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.HasOne(d => d.IdDiscapacidadNavigation).WithMany(p => p.Familiars)
                .HasForeignKey(d => d.IdDiscapacidad)
                .HasConstraintName("FK__Familiar__IdDisc__1511CE04");

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.Familiars)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Familiar__IdEmpl__64C39C64");

            entity.HasOne(d => d.IdEstadoCivilNavigation).WithMany(p => p.Familiars)
                .HasForeignKey(d => d.IdEstadoCivil)
                .HasConstraintName("FK__Familiar__IdEsta__16FA1676");

            entity.HasOne(d => d.IdPersonaNavigation).WithMany(p => p.Familiars)
                .HasForeignKey(d => d.IdPersona)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Familiar__IdPers__17EE3AAF");

            entity.HasOne(d => d.IdTipoFamNavigation).WithMany(p => p.Familiars)
                .HasForeignKey(d => d.IdTipoFam)
                .HasConstraintName("FK__Familiar__IdTipo__1605F23D");

            entity.HasOne(d => d.IdTipoSangreNavigation).WithMany(p => p.Familiars)
                .HasForeignKey(d => d.IdTipoSangre)
                .HasConstraintName("FK__Familiar__IdTipo__141DA9CB");
        });

        modelBuilder.Entity<Familium>(entity =>
        {
            entity.HasKey(e => new { e.IdFamilia, e.IdClase, e.IdGrupo }).HasName("PK__Familia__6E0C4425");

            entity.Property(e => e.IdFamilia)
                .HasMaxLength(4)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.IdClase)
                .HasMaxLength(2)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.IdGrupo)
                .HasMaxLength(3)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(140)
                .IsUnicode(false);
            entity.Property(e => e.Observaciones)
                .HasMaxLength(120)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Horario>(entity =>
        {
            entity.HasKey(e => e.IdHorario).HasName("PK__Horario__4CEC12D3");

            entity.ToTable("Horario");

            entity.Property(e => e.IdHorario)
                .ValueGeneratedNever()
                .HasColumnName("idHorario");
            entity.Property(e => e.DescripHorario)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("Descrip_Horario");
            entity.Property(e => e.Ingreso1)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Ingreso2)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Salida1)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Salida2)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength();
        });

        modelBuilder.Entity<HorarioTemporal>(entity =>
        {
            entity.HasKey(e => new { e.IdEmpleado, e.N });

            entity.ToTable("HorarioTemporal", tb => tb.HasTrigger("trg_update_HorarioTemporal"));

            entity.Property(e => e.IdEmpleado).HasColumnName("idEmpleado");
            entity.Property(e => e.FechaRegistro)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.NroDocumento).HasMaxLength(50);
            entity.Property(e => e.Sisgedo).HasMaxLength(50);

            entity.HasOne(d => d.HorarioAsignadoNavigation).WithMany(p => p.HorarioTemporals)
                .HasForeignKey(d => d.HorarioAsignado)
                .HasConstraintName("FK_HorarioTemporal_Horario");

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.HorarioTemporals)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_HorarioTemporal_Empleado");
        });

        modelBuilder.Entity<Institucion>(entity =>
        {
            entity.HasKey(e => e.IdInstitucion).HasName("PK__Institucion__666B225D");

            entity.ToTable("Institucion");

            entity.Property(e => e.IdInstitucion).ValueGeneratedNever();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(120)
                .IsUnicode(false);
            entity.Property(e => e.Direccion)
                .HasMaxLength(120)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Limitacion>(entity =>
        {
            entity.HasKey(e => e.IdLimitacion).HasName("PK__Limitacion__5C2D8B0C");

            entity.ToTable("Limitacion", tb =>
                {
                    tb.HasTrigger("tD_Limitacion");
                    tb.HasTrigger("tU_Limitacion");
                });

            entity.Property(e => e.IdLimitacion).ValueGeneratedNever();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(500)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Local>(entity =>
        {
            entity.HasKey(e => e.IdLocal);

            entity.ToTable("Local");

            entity.Property(e => e.IdLocal)
                .ValueGeneratedNever()
                .HasColumnName("idLocal");
            entity.Property(e => e.NombreLocal).HasMaxLength(50);
        });

        modelBuilder.Entity<Marcacion>(entity =>
        {
            entity.HasKey(e => new { e.Fecha, e.IdEmpleado }).HasName("PK__Marcacion__6F412AD7");

            entity.ToTable("Marcacion");

            entity.Property(e => e.Fecha).HasColumnType("datetime");
            entity.Property(e => e.Estado)
                .HasMaxLength(2)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.IdHorario).HasColumnName("idHorario");
            entity.Property(e => e.Lugar)
                .HasMaxLength(10)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.Marcacions)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Marcacion__IdEmp__70354F10");
        });

        modelBuilder.Entity<Marcacione>(entity =>
        {
            entity
                .HasNoKey()
                .ToTable("marcaciones");

            entity.Property(e => e.Estado)
                .HasMaxLength(2)
                .IsUnicode(false)
                .IsFixedLength()
                .UseCollation("SQL_Latin1_General_CP1_CI_AS");
            entity.Property(e => e.Fecha).HasColumnType("datetime");
            entity.Property(e => e.Proceso)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength()
                .UseCollation("SQL_Latin1_General_CP1_CI_AS");
            entity.Property(e => e.Valor)
                .HasMaxLength(15)
                .IsUnicode(false)
                .UseCollation("SQL_Latin1_General_CP1_CI_AS");
        });

        modelBuilder.Entity<MaterialViv>(entity =>
        {
            entity.HasKey(e => e.IdMaterial).HasName("PK__Material__727CBEDE");

            entity.ToTable("MaterialViv");

            entity.Property(e => e.IdMaterial).ValueGeneratedNever();
            entity.Property(e => e.DescripMaterial)
                .HasMaxLength(12)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MotivoBaja>(entity =>
        {
            entity.HasKey(e => e.IdMotivoBaja);

            entity.ToTable("MotivoBaja");

            entity.Property(e => e.IdMotivoBaja)
                .ValueGeneratedNever()
                .HasColumnName("idMotivoBaja");
            entity.Property(e => e.Descripcion)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<MotivoPerm>(entity =>
        {
            entity.HasKey(e => e.IdMotivo).HasName("PK__Motivo_Perm__37F0F5ED");

            entity.ToTable("Motivo_Perm");

            entity.Property(e => e.IdMotivo)
                .ValueGeneratedNever()
                .HasColumnName("idMotivo");
            entity.Property(e => e.Abrev)
                .HasMaxLength(3)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.DescripMotivo)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Descrip_Motivo");
            entity.Property(e => e.IdTipoPermiso).HasColumnName("idTipoPermiso");
            entity.Property(e => e.TipoModalidad)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();

            entity.HasOne(d => d.IdTipoPermisoNavigation).WithMany(p => p.MotivoPerms)
                .HasForeignKey(d => d.IdTipoPermiso)
                .HasConstraintName("FK__Motivo_Pe__idTip__3CB5AB0A");
        });

        modelBuilder.Entity<Nacionalidad>(entity =>
        {
            entity.HasKey(e => e.IdNacionalidad).HasName("PK__Nacionalidad__768259EC");

            entity.ToTable("Nacionalidad");

            entity.Property(e => e.IdNacionalidad).ValueGeneratedNever();
            entity.Property(e => e.Abreviatura)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.Descripcion)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<PeriodoLaboral>(entity =>
        {
            entity.HasKey(e => new { e.IdEmpleado, e.NroPeriodo }).HasName("PK__PeriodoLaboral__37BBEBC3");

            entity.ToTable("PeriodoLaboral");

            entity.Property(e => e.FechaIngreso).HasColumnType("smalldatetime");
            entity.Property(e => e.FechaResoIngreInstitu).HasColumnType("datetime");
            entity.Property(e => e.FechaSalida).HasColumnType("smalldatetime");
            entity.Property(e => e.NumResoIngreInstitu)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.Obs)
                .HasMaxLength(2000)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.PeriodoLaborals)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__PeriodoLa__IdEmp__38B00FFC");
        });

        modelBuilder.Entity<Permiso>(entity =>
        {
            entity.HasKey(e => new { e.IdEmpleado, e.Npermiso }).HasName("PK__Permiso__58B2CB3A");

            entity.ToTable("Permiso", tb =>
                {
                    tb.HasTrigger("tr_aud_permiso");
                    tb.HasTrigger("tr_aud_permiso_Insert");
                });

            entity.Property(e => e.Npermiso).HasColumnName("NPermiso");
            entity.Property(e => e.Autorizacion)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.AutorizacionRrhh)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("AutorizacionRRHH");
            entity.Property(e => e.FechaFin).HasColumnType("datetime");
            entity.Property(e => e.FechaInicio).HasColumnType("datetime");
            entity.Property(e => e.HoraRet)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("Hora_Ret");
            entity.Property(e => e.HoraSal)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("Hora_Sal");
            entity.Property(e => e.IdMotivo).HasColumnName("idMotivo");
            entity.Property(e => e.Lugar)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.Obs)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.Referencia)
                .HasMaxLength(100)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.Permisos)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Permiso__IdEmple__5A9B13AC");

            entity.HasOne(d => d.IdMotivoNavigation).WithMany(p => p.Permisos)
                .HasForeignKey(d => d.IdMotivo)
                .HasConstraintName("FK__Permiso__idMotiv__59A6EF73");
        });

        modelBuilder.Entity<PermisoAud>(entity =>
        {
            entity.ToTable("Permiso_Aud");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AutorizacionAct)
                .HasMaxLength(150)
                .HasColumnName("Autorizacion_Act");
            entity.Property(e => e.AutorizacionAnt)
                .HasMaxLength(150)
                .HasColumnName("Autorizacion_Ant");
            entity.Property(e => e.FechaAud)
                .HasColumnType("datetime")
                .HasColumnName("fecha_aud");
            entity.Property(e => e.FechaFinAct)
                .HasColumnType("datetime")
                .HasColumnName("FechaFin_Act");
            entity.Property(e => e.FechaFinAnt)
                .HasColumnType("datetime")
                .HasColumnName("FechaFin_Ant");
            entity.Property(e => e.FechaInicioAct)
                .HasColumnType("datetime")
                .HasColumnName("FechaInicio_Act");
            entity.Property(e => e.FechaInicioAnt)
                .HasColumnType("datetime")
                .HasColumnName("FechaInicio_Ant");
            entity.Property(e => e.IdEmpleado).HasColumnName("idEmpleado");
            entity.Property(e => e.IdMotivoAct).HasColumnName("idMotivo_Act");
            entity.Property(e => e.IdMotivoAnt).HasColumnName("idMotivo_Ant");
            entity.Property(e => e.Npermiso).HasColumnName("NPermiso");
            entity.Property(e => e.ObsAct)
                .HasMaxLength(150)
                .HasColumnName("Obs_Act");
            entity.Property(e => e.ObsAnt)
                .HasMaxLength(150)
                .HasColumnName("Obs_Ant");
            entity.Property(e => e.Operacion)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("operacion");
            entity.Property(e => e.Pc).HasMaxLength(50);
            entity.Property(e => e.ReferenciaAct)
                .HasMaxLength(150)
                .HasColumnName("Referencia_Act");
            entity.Property(e => e.ReferenciaAnt)
                .HasMaxLength(150)
                .HasColumnName("Referencia_Ant");
            entity.Property(e => e.Usuario).HasMaxLength(50);
        });

        modelBuilder.Entity<Persona>(entity =>
        {
            entity.HasKey(e => e.IdPersona).HasName("PK__Persona__2EC6B30F");

            entity.ToTable("Persona");

            entity.HasIndex(e => new { e.ApellidoPaterno, e.ApellidoMaterno, e.Nombres }, "IX_Nombre");

            entity.HasIndex(e => new { e.NumDocId, e.TipoDocId }, "IX_NumDocId");

            entity.Property(e => e.IdPersona).ValueGeneratedNever();
            entity.Property(e => e.ApellidoMaterno)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("Apellido_Materno");
            entity.Property(e => e.ApellidoPaterno)
                .HasMaxLength(30)
                .IsUnicode(false)
                .HasColumnName("Apellido_Paterno");
            entity.Property(e => e.Direccion)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Fax)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.FechaNacimiento).HasColumnType("datetime");
            entity.Property(e => e.FechaRegistro).HasColumnType("datetime");
            entity.Property(e => e.FonoCentroLab)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.IdUbigeo)
                .HasMaxLength(6)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Nombres)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.NumCelular)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.NumDocId)
                .HasMaxLength(12)
                .IsUnicode(false)
                .IsFixedLength()
                .HasColumnName("NumDocID");
            entity.Property(e => e.Telefono)
                .HasMaxLength(15)
                .IsUnicode(false);
            entity.Property(e => e.TipoDocId).HasColumnName("TipoDocID");
            entity.Property(e => e.TipoPersona)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.UbigeoDireccion)
                .HasMaxLength(6)
                .IsUnicode(false)
                .IsFixedLength();
        });

        modelBuilder.Entity<RegAsisDiario>(entity =>
        {
            entity.HasKey(e => new { e.Fecha, e.IdEmpleado }).HasName("PK__RegAsisDiario__4362A899");

            entity.ToTable("RegAsisDiario");

            entity.HasIndex(e => new { e.Fecha, e.IdEmpleado }, "Indice");

            entity.Property(e => e.Fecha).HasColumnType("datetime");
            entity.Property(e => e.Estado)
                .HasMaxLength(3)
                .IsUnicode(false);
            entity.Property(e => e.MinNormales)
                .HasMaxLength(4)
                .IsUnicode(false);
            entity.Property(e => e.MinTarde)
                .HasMaxLength(18)
                .IsUnicode(false);
        });

        modelBuilder.Entity<RegimenPension>(entity =>
        {
            entity.HasKey(e => e.IdRegimenPen).HasName("PK__RegimenPension__21C1BDAC");

            entity.ToTable("RegimenPension");

            entity.Property(e => e.IdRegimenPen).ValueGeneratedNever();
            entity.Property(e => e.LeyRegimen)
                .HasMaxLength(5)
                .IsUnicode(false);
        });

        modelBuilder.Entity<ReporteAsistencia>(entity =>
        {
            entity.HasKey(e => new { e.Fecha, e.IdEmpleado });

            entity.ToTable("Reporte_Asistencias");

            entity.Property(e => e.Fecha).HasColumnType("datetime");
            entity.Property(e => e.Estado)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Mt).HasColumnType("decimal(18, 2)");
        });

        modelBuilder.Entity<Resolucion>(entity =>
        {
            entity.HasKey(e => new { e.IdEmpleado, e.IdResolucion });

            entity.ToTable("Resolucion");

            entity.Property(e => e.IdEmpleado).HasColumnName("idEmpleado");
            entity.Property(e => e.IdResolucion).HasColumnName("idResolucion");
            entity.Property(e => e.IdTipoResolucion).HasColumnName("idTipoResolucion");
            entity.Property(e => e.NumeroResolucion).HasMaxLength(50);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.Resolucions)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Resolucion_Empleado");

            entity.HasOne(d => d.IdTipoResolucionNavigation).WithMany(p => p.Resolucions)
                .HasForeignKey(d => d.IdTipoResolucion)
                .HasConstraintName("FK_Resolucion_TipoResolucion");
        });

        modelBuilder.Entity<ResponsableXuo>(entity =>
        {
            entity.HasKey(e => e.IdResponsable).HasName("PK__ResponsableXUO__0F382DC6");

            entity.ToTable("ResponsableXUO");

            entity.Property(e => e.IdResponsable).ValueGeneratedNever();
            entity.Property(e => e.AreaOrganizacional)
                .HasMaxLength(80)
                .IsUnicode(false);
            entity.Property(e => e.FInicio)
                .HasColumnType("smalldatetime")
                .HasColumnName("F_Inicio");
            entity.Property(e => e.FTermino)
                .HasColumnType("smalldatetime")
                .HasColumnName("F_Termino");
            entity.Property(e => e.IdAreaOrganiz).HasColumnName("idAreaOrganiz");
            entity.Property(e => e.IdDependeDe).HasColumnName("idDependeDe");
        });

        modelBuilder.Entity<Rol>(entity =>
        {
            entity.HasKey(e => e.IdRol).HasName("PK__Rol__61DC42C1");

            entity.ToTable("Rol");

            entity.Property(e => e.IdRol).ValueGeneratedNever();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.IdSistema)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength();
        });

        modelBuilder.Entity<RolAcceso>(entity =>
        {
            entity.HasKey(e => new { e.IdRol, e.IdSistemaOpcion }).HasName("PK__Rol_Acceso__7390DEA8");

            entity.ToTable("Rol_Acceso");

            entity.Property(e => e.IdSistemaOpcion)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Permiso)
                .HasMaxLength(8)
                .IsUnicode(false)
                .IsFixedLength();

            entity.HasOne(d => d.IdRolNavigation).WithMany(p => p.RolAccesos)
                .HasForeignKey(d => d.IdRol)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Rol_Acces__IdRol__766D4B53");

            entity.HasOne(d => d.IdSistemaOpcionNavigation).WithMany(p => p.RolAccesos)
                .HasForeignKey(d => d.IdSistemaOpcion)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Rol_Acces__IdSis__7579271A");
        });

        modelBuilder.Entity<Rotacion>(entity =>
        {
            entity.HasKey(e => new { e.IdEmpleado, e.IdRotacion });

            entity.ToTable("Rotacion");

            entity.Property(e => e.IdEmpleado).HasColumnName("idEmpleado");
            entity.Property(e => e.IdRotacion).HasColumnName("idRotacion");
            entity.Property(e => e.IdAreaOrganiz).HasColumnName("idAreaOrganiz");
            entity.Property(e => e.NroMemo).HasMaxLength(50);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.Rotacions)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Rotacion_Empleado");

            entity.HasOne(d => d.EstructOrganiz).WithMany(p => p.Rotacions)
                .HasForeignKey(d => new { d.Year, d.IdAreaOrganiz })
                .HasConstraintName("FK_Rotacion_EstructOrganiz");
        });

        modelBuilder.Entity<RrhhAcudeEnferm>(entity =>
        {
            entity.HasKey(e => e.IdAcudeEnferm).HasName("PK__RRHH_AcudeEnferm__59F10836");

            entity.ToTable("RRHH_AcudeEnferm");

            entity.Property(e => e.IdAcudeEnferm)
                .ValueGeneratedNever()
                .HasColumnName("idAcudeEnferm");
            entity.Property(e => e.AcudeEnfermDescrip)
                .HasMaxLength(16)
                .IsUnicode(false);
        });

        modelBuilder.Entity<RrhhAsegurado>(entity =>
        {
            entity.HasKey(e => new { e.IdEmpleado, e.NroBeneficiario }).HasName("PK_RRHH_Asegurados");

            entity.ToTable("RRHH_Asegurado");

            entity.Property(e => e.IdEmpleado).HasColumnName("idEmpleado");
            entity.Property(e => e.FechaFinVinculo).HasColumnType("datetime");
            entity.Property(e => e.FechaInicioVinculo).HasColumnType("datetime");
            entity.Property(e => e.IdEstadoCivil).HasColumnName("idEstadoCivil");
            entity.Property(e => e.IdMotivoBaja).HasColumnName("idMotivoBaja");
            entity.Property(e => e.IdPersona).HasColumnName("idPersona");
            entity.Property(e => e.NroPartida)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.NroPartidaDef)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.NroResolMayorIndiscap)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.OtrosMotivos)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Reevaluar)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Sexo)
                .HasMaxLength(1)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.VinculoFamiliar)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.RrhhAsegurados)
                .HasForeignKey(d => d.IdEmpleado)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_RRHH_Asegurados_Empleado");

            entity.HasOne(d => d.IdEstadoCivilNavigation).WithMany(p => p.RrhhAsegurados)
                .HasForeignKey(d => d.IdEstadoCivil)
                .HasConstraintName("FK_RRHH_Asegurados_EstadoCivil");

            entity.HasOne(d => d.IdMotivoBajaNavigation).WithMany(p => p.RrhhAsegurados)
                .HasForeignKey(d => d.IdMotivoBaja)
                .HasConstraintName("FK_RRHH_Asegurados_MotivoBaja");

            entity.HasOne(d => d.IdPersonaNavigation).WithMany(p => p.RrhhAsegurados)
                .HasForeignKey(d => d.IdPersona)
                .HasConstraintName("FK_RRHH_Asegurados_Persona");
        });

        modelBuilder.Entity<RrhhAspSocio>(entity =>
        {
            entity.HasKey(e => e.IdAspSocio).HasName("PK__RRHH_AspSocio__619229FE");

            entity.ToTable("RRHH_AspSocio");

            entity.Property(e => e.IdAspSocio)
                .ValueGeneratedNever()
                .HasColumnName("idAspSocio");
            entity.Property(e => e.ActRecreaInstitu)
                .HasMaxLength(400)
                .IsUnicode(false);
            entity.Property(e => e.Hobby)
                .HasMaxLength(400)
                .IsUnicode(false)
                .HasColumnName("hobby");
            entity.Property(e => e.IdPregunta1).HasColumnName("idPregunta1");
            entity.Property(e => e.IdPregunta2).HasColumnName("idPregunta2");
            entity.Property(e => e.IdPregunta3).HasColumnName("idPregunta3");
            entity.Property(e => e.PrincipProblemas)
                .HasMaxLength(400)
                .IsUnicode(false);
            entity.Property(e => e.PropMejoraInstitu)
                .HasMaxLength(400)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.RrhhAspSocios)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK__RRHH_AspS__IdEmp__61E72FB9");

            entity.HasOne(d => d.IdPregunta1Navigation).WithMany(p => p.RrhhAspSocios)
                .HasForeignKey(d => d.IdPregunta1)
                .HasConstraintName("FK__RRHH_AspS__idPre__759922AB");

            entity.HasOne(d => d.IdPregunta2Navigation).WithMany(p => p.RrhhAspSocios)
                .HasForeignKey(d => d.IdPregunta2)
                .HasConstraintName("FK__RRHH_AspS__idPre__74A4FE72");

            entity.HasOne(d => d.IdPregunta3Navigation).WithMany(p => p.RrhhAspSocios)
                .HasForeignKey(d => d.IdPregunta3)
                .HasConstraintName("FK__RRHH_AspS__idPre__73B0DA39");
        });

        modelBuilder.Entity<RrhhDinamicaFamiliar>(entity =>
        {
            entity.HasKey(e => e.IdDinamica).HasName("PK__RRHH_DinamicaFam__6B1B9438");

            entity.ToTable("RRHH_DinamicaFamiliar");

            entity.Property(e => e.IdDinamica)
                .ValueGeneratedNever()
                .HasColumnName("idDinamica");
            entity.Property(e => e.IdRelaPareja).HasColumnName("idRelaPareja");
            entity.Property(e => e.IdRelaPh).HasColumnName("idRelaPH");
            entity.Property(e => e.IdRelacHermano).HasColumnName("idRelacHermano");
            entity.Property(e => e.IdTipoFam).HasColumnName("idTipoFam");
            entity.Property(e => e.Observacion)
                .HasMaxLength(200)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.RrhhDinamicaFamiliars)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK__RRHH_Dina__IdEmp__60F30B80");

            entity.HasOne(d => d.IdRelaParejaNavigation).WithMany(p => p.RrhhDinamicaFamiliars)
                .HasForeignKey(d => d.IdRelaPareja)
                .HasConstraintName("FK__RRHH_Dina__idRel__7969B38F");

            entity.HasOne(d => d.IdRelaPhNavigation).WithMany(p => p.RrhhDinamicaFamiliars)
                .HasForeignKey(d => d.IdRelaPh)
                .HasConstraintName("FK__RRHH_Dina__idRel__78758F56");

            entity.HasOne(d => d.IdRelacHermanoNavigation).WithMany(p => p.RrhhDinamicaFamiliars)
                .HasForeignKey(d => d.IdRelacHermano)
                .HasConstraintName("FK__RRHH_Dina__idRel__77816B1D");

            entity.HasOne(d => d.IdTipoFamNavigation).WithMany(p => p.RrhhDinamicaFamiliars)
                .HasForeignKey(d => d.IdTipoFam)
                .HasConstraintName("FK__RRHH_Dina__idTip__7A5DD7C8");
        });

        modelBuilder.Entity<RrhhFeriado>(entity =>
        {
            entity.HasKey(e => e.IdFeriado).HasName("PK__RRHH_Feriado__4F296100");

            entity.ToTable("RRHH_Feriado");

            entity.Property(e => e.IdFeriado)
                .ValueGeneratedNever()
                .HasColumnName("idFeriado");
            entity.Property(e => e.Fecha).HasColumnType("datetime");
            entity.Property(e => e.Motivo)
                .HasMaxLength(200)
                .IsUnicode(false);
        });

        modelBuilder.Entity<RrhhFuncFam>(entity =>
        {
            entity.HasKey(e => e.IdFuncFamiliar).HasName("PK__RRHH_FuncFam__6D03DCAA");

            entity.ToTable("RRHH_FuncFam");

            entity.Property(e => e.IdFuncFamiliar)
                .ValueGeneratedNever()
                .HasColumnName("idFuncFamiliar");
            entity.Property(e => e.Afec1)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Afec2)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Com1)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Com2)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Decis1)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Decis2)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Soc1)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Soc2)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Soc3)
                .HasMaxLength(2)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.RrhhFuncFams)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK__RRHH_Func__IdEmp__5FFEE747");
        });

        modelBuilder.Entity<RrhhPreg1>(entity =>
        {
            entity.HasKey(e => e.IdPregunta1).HasName("PK__RRHH_Preg1__5FA9E18C");

            entity.ToTable("RRHH_Preg1");

            entity.Property(e => e.IdPregunta1)
                .ValueGeneratedNever()
                .HasColumnName("idPregunta1");
            entity.Property(e => e.Respues1)
                .HasMaxLength(83)
                .IsUnicode(false);
        });

        modelBuilder.Entity<RrhhPreg2>(entity =>
        {
            entity.HasKey(e => e.IdPregunta2).HasName("PK__RRHH_Preg2__5DC1991A");

            entity.ToTable("RRHH_Preg2");

            entity.Property(e => e.IdPregunta2)
                .ValueGeneratedNever()
                .HasColumnName("idPregunta2");
            entity.Property(e => e.Respues2)
                .HasMaxLength(22)
                .IsUnicode(false);
        });

        modelBuilder.Entity<RrhhPreg3>(entity =>
        {
            entity.HasKey(e => e.IdPregunta3).HasName("PK__RRHH_Preg3__5BD950A8");

            entity.ToTable("RRHH_Preg3");

            entity.Property(e => e.IdPregunta3)
                .ValueGeneratedNever()
                .HasColumnName("idPregunta3");
            entity.Property(e => e.Respues3)
                .HasMaxLength(23)
                .IsUnicode(false);
        });

        modelBuilder.Entity<RrhhRelacHermano>(entity =>
        {
            entity.HasKey(e => e.IdRelacHermano).HasName("PK__RRHH_RelacHerman__637A7270");

            entity.ToTable("RRHH_RelacHermano");

            entity.Property(e => e.IdRelacHermano)
                .ValueGeneratedNever()
                .HasColumnName("idRelacHermano");
            entity.Property(e => e.RelacHermanoDescrip)
                .HasMaxLength(12)
                .IsUnicode(false);
        });

        modelBuilder.Entity<RrhhRelacPareja>(entity =>
        {
            entity.HasKey(e => e.IdRelacPareja).HasName("PK__RRHH_RelacPareja__674B0354");

            entity.ToTable("RRHH_RelacPareja");

            entity.Property(e => e.IdRelacPareja)
                .ValueGeneratedNever()
                .HasColumnName("idRelacPareja");
            entity.Property(e => e.RelacParejaDescrip)
                .HasMaxLength(12)
                .IsUnicode(false);
        });

        modelBuilder.Entity<RrhhRelacPh>(entity =>
        {
            entity.HasKey(e => e.IdRelacPh).HasName("PK__RRHH_RelacPH__6562BAE2");

            entity.ToTable("RRHH_RelacPH");

            entity.Property(e => e.IdRelacPh)
                .ValueGeneratedNever()
                .HasColumnName("idRelacPH");
            entity.Property(e => e.RelacPhdescrip)
                .HasMaxLength(14)
                .IsUnicode(false)
                .HasColumnName("RelacPHDescrip");
        });

        modelBuilder.Entity<RrhhSalud>(entity =>
        {
            entity.HasKey(e => e.IdSalud).HasName("PK__RRHH_Salud__6EEC251C");

            entity.ToTable("RRHH_Salud");

            entity.Property(e => e.IdSalud)
                .ValueGeneratedNever()
                .HasColumnName("idSalud");
            entity.Property(e => e.AlergicoDescrip)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.EnferCronicaDescrip)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.FamDiscapDescrip)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.IdAcudeEnferm).HasColumnName("idAcudeEnferm");

            entity.HasOne(d => d.IdAcudeEnfermNavigation).WithMany(p => p.RrhhSaluds)
                .HasForeignKey(d => d.IdAcudeEnferm)
                .HasConstraintName("FK__RRHH_Salu__idAcu__7D3A4473");

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.RrhhSaluds)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK__RRHH_Salu__IdEmp__5F0AC30E");
        });

        modelBuilder.Entity<RrhhTempFecha>(entity =>
        {
            entity.ToTable("RRHH_TempFecha");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Fecha).HasColumnType("datetime");
        });

        modelBuilder.Entity<RrhhTipoFamilium>(entity =>
        {
            entity.HasKey(e => e.IdTipoFam).HasName("PK__RRHH_TipoFamilia__69334BC6");

            entity.ToTable("RRHH_TipoFamilia");

            entity.Property(e => e.IdTipoFam)
                .ValueGeneratedNever()
                .HasColumnName("idTipoFam");
            entity.Property(e => e.TipoFamDescrip)
                .HasMaxLength(10)
                .IsUnicode(false);
        });

        modelBuilder.Entity<SistemaOpcion>(entity =>
        {
            entity.HasKey(e => e.IdSistemaOpcion).HasName("PK__SistemaOpcion__6FC04DC4");

            entity.ToTable("SistemaOpcion");

            entity.Property(e => e.IdSistemaOpcion)
                .HasMaxLength(7)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Clave)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.Descripcion)
                .HasMaxLength(150)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TenenciaViv>(entity =>
        {
            entity.HasKey(e => e.IdTenencia).HasName("PK__Tenencia__000BC426");

            entity.ToTable("TenenciaViv");

            entity.Property(e => e.IdTenencia).ValueGeneratedNever();
            entity.Property(e => e.DescripTenencia)
                .HasMaxLength(30)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TipoComportamiento>(entity =>
        {
            entity.HasKey(e => e.IdTipoComportamiento).HasName("PK__TipoComportamien__6D38E6D4");

            entity.ToTable("TipoComportamiento");

            entity.Property(e => e.IdTipoComportamiento)
                .ValueGeneratedNever()
                .HasColumnName("idTipoComportamiento");
            entity.Property(e => e.TipoCompDescrip)
                .HasMaxLength(8)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TipoDoc>(entity =>
        {
            entity.HasKey(e => new { e.IdTipodoc, e.Anio });

            entity.ToTable("TipoDoc");

            entity.Property(e => e.IdTipodoc)
                .HasMaxLength(2)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Anio)
                .HasMaxLength(4)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(40)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TipoDocId>(entity =>
        {
            entity.HasKey(e => e.TipoDocId1);

            entity.ToTable("TipoDocID", tb =>
                {
                    tb.HasTrigger("tD_TipoDocID");
                    tb.HasTrigger("tU_TipoDocID");
                });

            entity.Property(e => e.TipoDocId1)
                .ValueGeneratedNever()
                .HasColumnName("TipoDocID");
            entity.Property(e => e.Descripcion)
                .HasMaxLength(40)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TipoEstudio>(entity =>
        {
            entity.HasKey(e => e.IdTipoEstudios).HasName("PK__TipoEstudios__5C036DDA");

            entity.ToTable("TipoEstudio");

            entity.Property(e => e.IdTipoEstudios).ValueGeneratedNever();
            entity.Property(e => e.DescripTipoEst)
                .HasMaxLength(15)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TipoFamiliar>(entity =>
        {
            entity.HasKey(e => e.IdTipoFam).HasName("PK__TipoFamiliar__4EA972BC");

            entity.ToTable("TipoFamiliar");

            entity.Property(e => e.IdTipoFam).ValueGeneratedNever();
            entity.Property(e => e.DescripTipoFam)
                .HasMaxLength(10)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TipoInstitucion>(entity =>
        {
            entity.HasKey(e => e.IdTipoInstitucion).HasName("PK__TipoInstitucion__03FC509B");

            entity.ToTable("TipoInstitucion");

            entity.Property(e => e.IdTipoInstitucion).ValueGeneratedNever();
            entity.Property(e => e.DescripTipoInstitucion)
                .HasMaxLength(15)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TipoPermiso>(entity =>
        {
            entity.HasKey(e => e.IdTipoPermiso).HasName("PK__TipoPermiso__3608AD7B");

            entity.ToTable("TipoPermiso");

            entity.Property(e => e.IdTipoPermiso)
                .ValueGeneratedNever()
                .HasColumnName("idTipoPermiso");
            entity.Property(e => e.DescripTipoPermiso)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TipoResolucion>(entity =>
        {
            entity.HasKey(e => e.IdTipoResolucion);

            entity.ToTable("TipoResolucion");

            entity.Property(e => e.IdTipoResolucion)
                .ValueGeneratedNever()
                .HasColumnName("idTipoResolucion");
            entity.Property(e => e.DescripTipoResolucion).HasMaxLength(50);
        });

        modelBuilder.Entity<TipoSangre>(entity =>
        {
            entity.HasKey(e => e.IdTipoSangre)
                .HasName("XPKTipoSangre")
                .IsClustered(false);

            entity.ToTable("TipoSangre");

            entity.Property(e => e.IdTipoSangre).ValueGeneratedNever();
            entity.Property(e => e.DescripTs)
                .HasMaxLength(5)
                .IsUnicode(false)
                .HasColumnName("DescripTS");
        });

        modelBuilder.Entity<TipoTrabajador>(entity =>
        {
            entity.HasKey(e => e.IdTipoTrabajador);

            entity.ToTable("TipoTrabajador");

            entity.Property(e => e.IdTipoTrabajador).ValueGeneratedNever();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(30)
                .IsUnicode(false);
            entity.Property(e => e.Observaciones)
                .HasMaxLength(150)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TipoViv>(entity =>
        {
            entity.HasKey(e => e.IdTipo).HasName("PK__Tipo__01F40C98");

            entity.ToTable("TipoViv");

            entity.Property(e => e.IdTipo).ValueGeneratedNever();
            entity.Property(e => e.DescripTipo)
                .HasMaxLength(20)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TitulosEmpleado>(entity =>
        {
            entity.HasKey(e => e.NumColegiatura).HasName("PK__TitulosEmpleado__277A9702");

            entity.ToTable("TitulosEmpleado");

            entity.Property(e => e.NumColegiatura)
                .HasMaxLength(20)
                .IsUnicode(false);
            entity.Property(e => e.DenominacionGrado)
                .HasMaxLength(100)
                .IsUnicode(false);
            entity.Property(e => e.Fecha).HasColumnType("datetime");
            entity.Property(e => e.Institucion)
                .HasMaxLength(60)
                .IsUnicode(false);

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.TitulosEmpleados)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK__TitulosEm__IdEmp__5E169ED5");
        });

        modelBuilder.Entity<UbicacionViv>(entity =>
        {
            entity.HasKey(e => e.IdUbicacion).HasName("PK__Ubicacion__03DC550A");

            entity.ToTable("UbicacionViv");

            entity.Property(e => e.IdUbicacion).ValueGeneratedNever();
            entity.Property(e => e.DescripUbicacion)
                .HasMaxLength(22)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Ubigeo>(entity =>
        {
            entity.HasKey(e => e.IdUbigeo);

            entity.ToTable("Ubigeo", tb =>
                {
                    tb.HasTrigger("tD_Ubigeo");
                    tb.HasTrigger("tU_Ubigeo");
                });

            entity.Property(e => e.IdUbigeo)
                .HasMaxLength(6)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Departamento)
                .HasMaxLength(2)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(120)
                .IsUnicode(false);
            entity.Property(e => e.Distrito)
                .HasMaxLength(2)
                .IsUnicode(false)
                .IsFixedLength();
            entity.Property(e => e.Provincia)
                .HasMaxLength(2)
                .IsUnicode(false)
                .IsFixedLength();
        });

        modelBuilder.Entity<Usuario>(entity =>
        {
            entity.HasKey(e => e.IdUsuario).HasName("PK__Usuario__65ACD3A5");

            entity.ToTable("Usuario");

            entity.Property(e => e.IdUsuario).ValueGeneratedNever();
            entity.Property(e => e.Descripcion)
                .HasMaxLength(40)
                .IsUnicode(false);
            entity.Property(e => e.Fecha).HasColumnType("datetime");
            entity.Property(e => e.Login)
                .HasMaxLength(20)
                .IsUnicode(false)
                .IsFixedLength();

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.Usuarios)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK__Usuario__IdEmple__5C2E5663");

            entity.HasMany(d => d.IdRols).WithMany(p => p.IdUsuarios)
                .UsingEntity<Dictionary<string, object>>(
                    "UsuarioRol",
                    r => r.HasOne<Rol>().WithMany()
                        .HasForeignKey("IdRol")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__Usuario_R__IdRol__6B65ACFB"),
                    l => l.HasOne<Usuario>().WithMany()
                        .HasForeignKey("IdUsuario")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__Usuario_R__IdUsu__6C59D134"),
                    j =>
                    {
                        j.HasKey("IdUsuario", "IdRol").HasName("PK__Usuario_Rol__67951C17");
                        j.ToTable("Usuario_Rol");
                    });
        });

        modelBuilder.Entity<ViveCon>(entity =>
        {
            entity.HasKey(e => e.IdViveCon).HasName("PK__ViveCon__786AA25E");

            entity.ToTable("ViveCon");

            entity.Property(e => e.IdViveCon).ValueGeneratedNever();
            entity.Property(e => e.DescripViveCon)
                .HasMaxLength(27)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Viviendum>(entity =>
        {
            entity.HasKey(e => e.IdVivienda).HasName("PK__Vivienda__13298592");

            entity.Property(e => e.IdVivienda).ValueGeneratedNever();
            entity.Property(e => e.NumCompart)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.NumDormitorio)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.NumPerDorm)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.NumServHig)
                .HasMaxLength(2)
                .IsUnicode(false);
            entity.Property(e => e.Observacion)
                .HasMaxLength(200)
                .IsUnicode(false);
            entity.Property(e => e.OtroAgua)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.OtroAlumbrado)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.OtroExcreta)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.IdAguaNavigation).WithMany(p => p.Vivienda)
                .HasForeignKey(d => d.IdAgua)
                .HasConstraintName("FK__Vivienda__IdAgua__1ACAA75A");

            entity.HasOne(d => d.IdAlumbradoNavigation).WithMany(p => p.Vivienda)
                .HasForeignKey(d => d.IdAlumbrado)
                .HasConstraintName("FK__Vivienda__IdAlum__1BBECB93");

            entity.HasOne(d => d.IdConservacionNavigation).WithMany(p => p.Vivienda)
                .HasForeignKey(d => d.IdConservacion)
                .HasConstraintName("FK__Vivienda__IdCons__1DA71405");

            entity.HasOne(d => d.IdEmpleadoNavigation).WithMany(p => p.Vivienda)
                .HasForeignKey(d => d.IdEmpleado)
                .HasConstraintName("FK__Vivienda__IdEmpl__5B3A322A");

            entity.HasOne(d => d.IdExcretasNavigation).WithMany(p => p.Vivienda)
                .HasForeignKey(d => d.IdExcretas)
                .HasConstraintName("FK__Vivienda__IdExcr__19D68321");

            entity.HasOne(d => d.IdMaterialNavigation).WithMany(p => p.Vivienda)
                .HasForeignKey(d => d.IdMaterial)
                .HasConstraintName("FK__Vivienda__IdMate__1E9B383E");

            entity.HasOne(d => d.IdTenenciaNavigation).WithMany(p => p.Vivienda)
                .HasForeignKey(d => d.IdTenencia)
                .HasConstraintName("FK__Vivienda__IdTene__208380B0");

            entity.HasOne(d => d.IdTipoNavigation).WithMany(p => p.Vivienda)
                .HasForeignKey(d => d.IdTipo)
                .HasConstraintName("FK__Vivienda__IdTipo__1F8F5C77");

            entity.HasOne(d => d.IdUbicacionNavigation).WithMany(p => p.Vivienda)
                .HasForeignKey(d => d.IdUbicacion)
                .HasConstraintName("FK__Vivienda__IdUbic__1CB2EFCC");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
