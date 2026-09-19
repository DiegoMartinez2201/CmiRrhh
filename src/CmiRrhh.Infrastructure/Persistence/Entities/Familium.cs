using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Familium
{
    public string IdFamilia { get; set; } = null!;

    public string? Descripcion { get; set; }

    public string? Observaciones { get; set; }

    public string IdClase { get; set; } = null!;

    public string IdGrupo { get; set; } = null!;
}
