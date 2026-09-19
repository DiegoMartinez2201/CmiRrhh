namespace CmiRrhh.Domain.Interfaces;

public sealed class VerificadorEventoLaboralResolver
{
    private readonly IEnumerable<IVerificadorEventoLaboral> _verificadores;

    public VerificadorEventoLaboralResolver(IEnumerable<IVerificadorEventoLaboral> verificadores)
    {
        _verificadores = verificadores;
    }

    public IVerificadorEventoLaboral Resolver(string tipoEvento)
    {
        return _verificadores.FirstOrDefault(v => v.TipoEvento == tipoEvento)
               ?? throw new InvalidOperationException($"No hay verificador registrado para '{tipoEvento}'.");
    }
}
