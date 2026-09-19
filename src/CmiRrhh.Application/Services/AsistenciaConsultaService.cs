using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Application.Services;

public interface IAsistenciaConsultaService
{
    Task<IReadOnlyList<AsistenciaReporteRow>> ConsultarAsync(
        DateTime fechaInicio, DateTime fechaFin, CancellationToken cancellationToken = default);
}

public sealed class AsistenciaConsultaService : IAsistenciaConsultaService
{
    private readonly IAsistenciaReporteRepository _repo;

    public AsistenciaConsultaService(IAsistenciaReporteRepository repo)
    {
        _repo = repo;
    }

    public Task<IReadOnlyList<AsistenciaReporteRow>> ConsultarAsync(
        DateTime fechaInicio, DateTime fechaFin, CancellationToken cancellationToken = default)
    {
        if (fechaFin.Date < fechaInicio.Date)
        {
            throw new ArgumentException("La fecha fin no puede ser anterior a la fecha inicio.", nameof(fechaFin));
        }

        var inicio = fechaInicio.Date.ToString("yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
        var fin = fechaFin.Date.ToString("yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture);
        return _repo.ListarAsistenciasAsync(inicio, fin, cancellationToken);
    }
}
