using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class TipoDoc
{
    public string IdTipodoc { get; set; } = null!;

    public string? Descripcion { get; set; }

    public int? Numero { get; set; }

    public byte? Serie { get; set; }

    public string Anio { get; set; } = null!;
}
