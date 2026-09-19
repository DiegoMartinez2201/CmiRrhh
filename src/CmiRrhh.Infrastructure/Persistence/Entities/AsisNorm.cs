using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class AsisNorm
{
    public DateTime FecAsi { get; set; }

    public string HorEnt { get; set; } = null!;

    public string HorSal { get; set; } = null!;

    public int PersCod { get; set; }

    public string? FlagEnt { get; set; }

    public string? FlagSal { get; set; }

    public string? AlmSal { get; set; }

    public string? AlmEnt { get; set; }
}
