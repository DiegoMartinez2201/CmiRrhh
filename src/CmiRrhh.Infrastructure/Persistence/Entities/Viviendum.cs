using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Viviendum
{
    public int? IdEmpleado { get; set; }

    public int IdVivienda { get; set; }

    public int? IdTenencia { get; set; }

    public int? IdTipo { get; set; }

    public int? IdMaterial { get; set; }

    public int? IdConservacion { get; set; }

    public string? NumDormitorio { get; set; }

    public string? NumServHig { get; set; }

    public int? IdUbicacion { get; set; }

    public int? IdAlumbrado { get; set; }

    public string? OtroAlumbrado { get; set; }

    public int? IdAgua { get; set; }

    public string? OtroAgua { get; set; }

    public int? IdExcretas { get; set; }

    public string? OtroExcreta { get; set; }

    public string? NumCompart { get; set; }

    public string? Observacion { get; set; }

    public string? NumPerDorm { get; set; }

    public bool? Telefono { get; set; }

    public bool? Cable { get; set; }

    public bool? Internet { get; set; }

    public bool? Otros { get; set; }

    public virtual AguaViv? IdAguaNavigation { get; set; }

    public virtual AlumbradoViv? IdAlumbradoNavigation { get; set; }

    public virtual ConservacionViv? IdConservacionNavigation { get; set; }

    public virtual Empleado? IdEmpleadoNavigation { get; set; }

    public virtual ExcretasViv? IdExcretasNavigation { get; set; }

    public virtual MaterialViv? IdMaterialNavigation { get; set; }

    public virtual TenenciaViv? IdTenenciaNavigation { get; set; }

    public virtual TipoViv? IdTipoNavigation { get; set; }

    public virtual UbicacionViv? IdUbicacionNavigation { get; set; }
}
