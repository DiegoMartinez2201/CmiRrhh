using System;
using System.Collections.Generic;

namespace CmiRrhh.Infrastructure.Persistence.Entities;

public partial class Institucion
{
    public int IdInstitucion { get; set; }

    public string? Descripcion { get; set; }

    public string? Direccion { get; set; }
}
