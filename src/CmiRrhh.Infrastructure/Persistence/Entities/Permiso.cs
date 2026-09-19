using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Permiso
{
    public int IdEmpleado { get; set; }

    public int Npermiso { get; set; }

    public DateTime? FechaInicio { get; set; }

    public DateTime? FechaFin { get; set; }

    public string? HoraSal { get; set; }

    public string? HoraRet { get; set; }

    public bool? Dia { get; set; }

    public bool? Retorno { get; set; }

    public int? IdMotivo { get; set; }

    public string? Lugar { get; set; }

    public string? Referencia { get; set; }

    public string? Autorizacion { get; set; }

    public string? Obs { get; set; }

    public string? AutorizacionRrhh { get; set; }

    public bool? Autorizado { get; set; }

    public virtual Empleado IdEmpleadoNavigation { get; set; } = null!;

    public virtual MotivoPerm? IdMotivoNavigation { get; set; }
}
