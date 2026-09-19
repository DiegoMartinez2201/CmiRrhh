using CmiRrhh.Application.Services;

namespace CmiRrhh.Application.Tests;

public class PlanillaAsistenciaParametrosTests
{
    [Fact]
    public void ConstruirParametroFechas_GeneraIdentificadoresPivot()
    {
        var valor = PlanillaAsistenciaParametros.ConstruirParametroFechas(
            new DateTime(2024, 12, 29),
            new DateTime(2024, 12, 31));

        Assert.Equal("[29/12/2024],[30/12/2024],[31/12/2024]", valor);
    }

    [Fact]
    public void ConstruirParametroFechas_RechazaMasDeQuinceDias()
    {
        var ex = Assert.Throws<ArgumentException>(() =>
            PlanillaAsistenciaParametros.ConstruirParametroFechas(
                new DateTime(2024, 12, 1),
                new DateTime(2024, 12, 16)));

        Assert.Contains("15 días", ex.Message);
    }

    [Fact]
    public void ValidarTipoTrabajador_RechazaValorFueraDeCatalogo()
    {
        Assert.Throws<ArgumentException>(() => PlanillaAsistenciaParametros.ValidarTipoTrabajador("9"));
        Assert.Throws<ArgumentException>(() => PlanillaAsistenciaParametros.ValidarTipoTrabajador("1;DROP"));
        Assert.Equal("1", PlanillaAsistenciaParametros.ValidarTipoTrabajador("1"));
    }

    [Fact]
    public void ConstruirParametroLocales_SoloEnterosODefaultCero()
    {
        Assert.Equal("0", PlanillaAsistenciaParametros.ConstruirParametroLocales(Array.Empty<int>()));
        Assert.Equal("1,9", PlanillaAsistenciaParametros.ConstruirParametroLocales(new[] { 1, 9 }));
    }
}
