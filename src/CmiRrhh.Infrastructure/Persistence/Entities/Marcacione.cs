using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Marcacione
{
    public DateTime Fecha { get; set; }

    public string Valor { get; set; } = null!;

    public string? Estado { get; set; }

    public string? Proceso { get; set; }
}
