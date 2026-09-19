using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class TipoEstudio
{
    public int IdTipoEstudios { get; set; }

    public string? DescripTipoEst { get; set; }

    public virtual ICollection<EstudiosRealizado> EstudiosRealizados { get; set; } = new List<EstudiosRealizado>();
}
