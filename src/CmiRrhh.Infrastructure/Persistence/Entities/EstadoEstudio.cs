using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class EstadoEstudio
{
    public int IdEstadoEstudio { get; set; }

    public string? DescripEstadoEstudio { get; set; }

    public virtual ICollection<EstudiosRealizado> EstudiosRealizados { get; set; } = new List<EstudiosRealizado>();
}
