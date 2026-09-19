using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class RrhhFeriado
{
    public int IdFeriado { get; set; }

    public DateTime? Fecha { get; set; }

    public string? Motivo { get; set; }
}
