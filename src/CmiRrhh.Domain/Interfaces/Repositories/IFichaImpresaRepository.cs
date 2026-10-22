using CmiRrhh.Domain.Models;

namespace CmiRrhh.Domain.Interfaces.Repositories;

public interface IFichaImpresaRepository
{
    /// <summary>spRRHH_Ficha_DatosPersonales, spRRHH_Ficha_ExpLab_Datos y spRRHH_Ficha_Det_Familiar del trabajador.</summary>
    Task<FichaImpresaDatos> ObtenerAsync(int idEmpleado, CancellationToken cancellationToken = default);
}
