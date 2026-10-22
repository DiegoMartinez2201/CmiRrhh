using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class FichaPersonalRepository : IFichaPersonalRepository
{
    private readonly CmiDbContext _context;

    public FichaPersonalRepository(CmiDbContext context)
    {
        _context = context;
    }

    public async Task<EmpleadoFicha?> ObtenerAsync(int idEmpleado, CancellationToken cancellationToken = default)
    {
        var e = await _context.Empleados
            .AsNoTracking()
            .Where(x => x.IdEmpleado == idEmpleado)
            .Select(x => new
            {
                x.IdEmpleado,
                x.IdPersona,
                x.Year,
                x.IdAreaOrganiz,
                x.IdNacionalidad,
                x.Sexo,
                x.IdEstadoCivil,
                x.IdDiscapacidad,
                x.ExpSocial,
                x.FechaIngreso,
                x.IdTipoSangre,
                x.Brevete,
                x.NumLibretaMilitar,
                x.GradoInstruccion,
                x.NumRuc,
                x.IdTipoTrabajador,
                x.Foto,
                P = x.IdPersonaNavigation
            })
            .FirstOrDefaultAsync(cancellationToken);

        if (e is null)
        {
            return null;
        }

        return new EmpleadoFicha
        {
            IdEmpleado = e.IdEmpleado,
            IdPersona = e.IdPersona,
            Year = e.Year,
            IdAreaOrganiz = e.IdAreaOrganiz,
            TipoDocIdent = e.P?.TipoDocId ?? 0,
            NumDoc = e.P?.NumDocId?.Trim(),
            ApellidoPaterno = e.P?.ApellidoPaterno,
            ApellidoMaterno = e.P?.ApellidoMaterno,
            Nombres = e.P?.Nombres,
            UbigeoNac = e.P?.IdUbigeo,
            FechaNacimiento = e.P?.FechaNacimiento ?? default,
            Direccion = e.P?.Direccion,
            Telefono = e.P?.Telefono,
            FonoLab = e.P?.FonoCentroLab,
            FonoCel = e.P?.NumCelular,
            FonoOtro = e.P?.Fax,
            Email = e.P?.Email,
            UbigeoDireccion = e.P?.UbigeoDireccion,
            IdNacionalidad = e.IdNacionalidad ?? 0,
            Sexo = e.Sexo,
            IdEstadoCivil = e.IdEstadoCivil ?? 0,
            IdDiscapacidad = e.IdDiscapacidad ?? 0,
            ExpSocial = e.ExpSocial,
            FechaIngreso = e.FechaIngreso ?? default,
            IdTipoSangre = e.IdTipoSangre ?? 0,
            Brevete = e.Brevete,
            LibretaMilitar = e.NumLibretaMilitar,
            GradoInstruccion = e.GradoInstruccion,
            NumRuc = e.NumRuc,
            IdTipoTrabajador = e.IdTipoTrabajador ?? 0,
            Foto = e.Foto
        };
    }

    public Task<bool> ExisteDocumentoAsync(
        int tipoDocumento, string numeroDocumento, int? excluirIdPersona, CancellationToken cancellationToken = default)
    {
        var numero = numeroDocumento.Trim();
        return _context.Personas
            .AsNoTracking()
            .AnyAsync(p => p.TipoDocId == tipoDocumento
                           && p.NumDocId != null
                           && p.NumDocId.Trim() == numero
                           && (excluirIdPersona == null || p.IdPersona != excluirIdPersona),
                cancellationToken);
    }

    public async Task<FichaCatalogos> CargarCatalogosAsync(int? anioEstructura, CancellationToken cancellationToken = default)
    {
        // Las consultas son secuenciales a propósito: un DbContext no admite operaciones en paralelo.
        var anio = anioEstructura
                   ?? await _context.EstructOrganizs.AsNoTracking().MaxAsync(a => (int?)a.Year, cancellationToken)
                   ?? DateTime.Today.Year;

        var tiposDoc = await _context.TipoDocIds.AsNoTracking()
            .OrderBy(t => t.TipoDocId1)
            .Select(t => new CatalogoItem { Id = t.TipoDocId1, Nombre = t.Descripcion ?? t.TipoDocId1.ToString() })
            .ToListAsync(cancellationToken);

        var nacionalidades = await _context.Nacionalidads.AsNoTracking()
            .OrderBy(n => n.Descripcion)
            .Select(n => new CatalogoItem { Id = n.IdNacionalidad, Nombre = n.Descripcion ?? n.IdNacionalidad.ToString() })
            .ToListAsync(cancellationToken);

        var estadosCiviles = await _context.EstadoCivils.AsNoTracking()
            .OrderBy(n => n.IdEstadoCivil)
            .Select(n => new CatalogoItem { Id = n.IdEstadoCivil, Nombre = n.DescripEstCivil ?? n.IdEstadoCivil.ToString() })
            .ToListAsync(cancellationToken);

        var discapacidades = await _context.Discapacidads.AsNoTracking()
            .OrderBy(n => n.IdDiscapacidad)
            .Select(n => new CatalogoItem { Id = n.IdDiscapacidad, Nombre = n.DescripDiscapacidad ?? n.IdDiscapacidad.ToString() })
            .ToListAsync(cancellationToken);

        var tiposSangre = await _context.TipoSangres.AsNoTracking()
            .OrderBy(n => n.IdTipoSangre)
            .Select(n => new CatalogoItem { Id = n.IdTipoSangre, Nombre = n.DescripTs ?? n.IdTipoSangre.ToString() })
            .ToListAsync(cancellationToken);

        var tiposTrabajador = await _context.TipoTrabajadors.AsNoTracking()
            .OrderBy(n => n.IdTipoTrabajador)
            .Select(n => new CatalogoItem { Id = n.IdTipoTrabajador, Nombre = n.Descripcion ?? n.IdTipoTrabajador.ToString() })
            .ToListAsync(cancellationToken);

        var areas = await _context.EstructOrganizs.AsNoTracking()
            .Where(a => a.Year == anio)
            .OrderBy(a => a.AreaOrganizacional)
            .Select(a => new CatalogoItem { Id = a.IdAreaOrganiz, Nombre = a.AreaOrganizacional })
            .ToListAsync(cancellationToken);

        var ubigeos = await _context.Ubigeos.AsNoTracking()
            .OrderBy(u => u.Departamento).ThenBy(u => u.Provincia).ThenBy(u => u.Distrito)
            .Select(u => new CatalogoTexto
            {
                Codigo = u.IdUbigeo,
                Nombre = u.Departamento + " / " + u.Provincia + " / " + u.Distrito
            })
            .ToListAsync(cancellationToken);

        return new FichaCatalogos
        {
            Anio = anio,
            TiposDocumento = tiposDoc,
            Nacionalidades = nacionalidades,
            EstadosCiviles = estadosCiviles,
            Discapacidades = discapacidades,
            TiposSangre = tiposSangre,
            TiposTrabajador = tiposTrabajador,
            Areas = areas,
            Ubigeos = ubigeos
        };
    }
}
