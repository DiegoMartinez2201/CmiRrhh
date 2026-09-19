using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class ResponsableXuo
{
    public int IdResponsable { get; set; }

    public int? Year { get; set; }

    public int? IdAreaOrganiz { get; set; }

    public string? AreaOrganizacional { get; set; }

    public int? IdDependeDe { get; set; }

    public int? IdEmpleado { get; set; }

    public DateTime? FInicio { get; set; }

    public DateTime? FTermino { get; set; }
}
