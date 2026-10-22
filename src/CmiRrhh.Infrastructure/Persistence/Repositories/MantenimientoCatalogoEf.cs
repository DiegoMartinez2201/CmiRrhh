using System.Linq.Expressions;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

/// <summary>Campo de un catálogo ligado a una propiedad de su entidad.</summary>
public sealed class CampoEf<T>
{
    public CampoEf(string clave, string etiqueta, int maxLongitud, Func<T, string?> leer, Action<T, string?> escribir, bool requerido = true, bool esOpcion = false)
    {
        Campo = new CampoCatalogo(clave, etiqueta, maxLongitud, requerido, esOpcion);
        Leer = leer;
        Escribir = escribir;
    }

    public CampoCatalogo Campo { get; }

    public Func<T, string?> Leer { get; }

    public Action<T, string?> Escribir { get; }
}

/// <summary>
/// Mantenimiento genérico (listar / crear / editar / eliminar) de una tabla de catálogo con id entero manual.
/// Todo el acceso a datos pasa por EF Core con parámetros; no hay SQL concatenado.
/// </summary>
public sealed class MantenimientoCatalogoEf<T> : IMantenimientoCatalogo where T : class, new()
{
    private readonly CmiDbContext _context;
    private readonly Expression<Func<T, int>> _id;
    private readonly Func<T, int> _leerId;
    private readonly Action<T, int> _escribirId;
    private readonly IReadOnlyList<CampoEf<T>> _campos;
    private readonly Func<CmiDbContext, CancellationToken, Task<IReadOnlyDictionary<string, IReadOnlyList<OpcionCatalogo>>>>? _opciones;

    public MantenimientoCatalogoEf(
        CmiDbContext context,
        string clave,
        string titulo,
        Expression<Func<T, int>> id,
        Action<T, int> escribirId,
        IReadOnlyList<CampoEf<T>> campos,
        Func<CmiDbContext, CancellationToken, Task<IReadOnlyDictionary<string, IReadOnlyList<OpcionCatalogo>>>>? opciones = null)
    {
        _opciones = opciones;
        _context = context;
        _id = id;
        _leerId = id.Compile();
        _escribirId = escribirId;
        _campos = campos;
        Definicion = new DefinicionCatalogo(clave, titulo, campos.Select(c => c.Campo).ToList());
    }

    public DefinicionCatalogo Definicion { get; }

    public Task<IReadOnlyDictionary<string, IReadOnlyList<OpcionCatalogo>>> OpcionesAsync(CancellationToken cancellationToken = default)
        => _opciones is null
            ? Task.FromResult<IReadOnlyDictionary<string, IReadOnlyList<OpcionCatalogo>>>(
                new Dictionary<string, IReadOnlyList<OpcionCatalogo>>())
            : _opciones(_context, cancellationToken);

    public async Task<IReadOnlyList<FilaCatalogo>> ListarAsync(CancellationToken cancellationToken = default)
    {
        var entidades = await _context.Set<T>().AsNoTracking().ToListAsync(cancellationToken);
        return entidades
            .OrderBy(_leerId)
            .Select(e => new FilaCatalogo { Id = _leerId(e), Valores = LeerValores(e) })
            .ToList();
    }

    public async Task<int> CrearAsync(IReadOnlyDictionary<string, string> valores, CancellationToken cancellationToken = default)
    {
        var ids = await _context.Set<T>().AsNoTracking().Select(_id).ToListAsync(cancellationToken);
        var nuevoId = (ids.Count == 0 ? 0 : ids.Max()) + 1;

        var entidad = new T();
        _escribirId(entidad, nuevoId);
        Aplicar(entidad, valores);

        _context.Set<T>().Add(entidad);
        await _context.SaveChangesAsync(cancellationToken);
        return nuevoId;
    }

    public async Task<bool> ActualizarAsync(int id, IReadOnlyDictionary<string, string> valores, CancellationToken cancellationToken = default)
    {
        var entidad = await _context.Set<T>().FindAsync(new object[] { id }, cancellationToken);
        if (entidad is null)
        {
            return false;
        }

        Aplicar(entidad, valores);
        await _context.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<string?> EliminarAsync(int id, CancellationToken cancellationToken = default)
    {
        var entidad = await _context.Set<T>().FindAsync(new object[] { id }, cancellationToken);
        if (entidad is null)
        {
            return "El registro ya no existe.";
        }

        try
        {
            _context.Set<T>().Remove(entidad);
            await _context.SaveChangesAsync(cancellationToken);
            return null;
        }
        catch (DbUpdateException)
        {
            // Violación de clave foránea: otros registros usan este valor.
            _context.ChangeTracker.Clear();
            return "No se puede eliminar: el registro está siendo usado por otros datos.";
        }
    }

    private Dictionary<string, string> LeerValores(T entidad)
        => _campos.ToDictionary(c => c.Campo.Clave, c => (c.Leer(entidad) ?? string.Empty).Trim());

    private void Aplicar(T entidad, IReadOnlyDictionary<string, string> valores)
    {
        foreach (var campo in _campos)
        {
            valores.TryGetValue(campo.Campo.Clave, out var valor);
            var texto = valor?.Trim();
            campo.Escribir(entidad, string.IsNullOrEmpty(texto) ? null : texto);
        }
    }
}

/// <summary>Registro en DI de todos los catálogos mantenibles.</summary>
public static class MantenimientosCatalogoRegistro
{
    public static IServiceCollection AddMantenimientosCatalogo(this IServiceCollection services)
    {
        Registrar(services, ctx => new MantenimientoCatalogoEf<Cargo>(
            ctx, "cargos", "Cargos", e => e.IdCargo, (e, id) => e.IdCargo = id,
            new[]
            {
                new CampoEf<Cargo>("cargo", "Cargo", 50, e => e.Cargo1, (e, v) => e.Cargo1 = v ?? string.Empty),
                new CampoEf<Cargo>("abreviatura", "Abreviatura", 8, e => e.Abreviatura, (e, v) => e.Abreviatura = v, requerido: false)
            }));

        Registrar(services, ctx => new MantenimientoCatalogoEf<TipoSangre>(
            ctx, "grupos-sanguineos", "Grupos sanguíneos", e => e.IdTipoSangre, (e, id) => e.IdTipoSangre = id,
            new[] { new CampoEf<TipoSangre>("descripcion", "Grupo sanguíneo", 5, e => e.DescripTs, (e, v) => e.DescripTs = v) }));

        Registrar(services, ctx => new MantenimientoCatalogoEf<TipoTrabajador>(
            ctx, "condicion-laboral", "Condición laboral (tipo de trabajador)", e => e.IdTipoTrabajador, (e, id) => e.IdTipoTrabajador = id,
            new[]
            {
                new CampoEf<TipoTrabajador>("descripcion", "Descripción", 30, e => e.Descripcion, (e, v) => e.Descripcion = v),
                new CampoEf<TipoTrabajador>("observaciones", "Observaciones", 150, e => e.Observaciones, (e, v) => e.Observaciones = v, requerido: false)
            }));

        Registrar(services, ctx => new MantenimientoCatalogoEf<Nacionalidad>(
            ctx, "nacionalidades", "Nacionalidades", e => e.IdNacionalidad, (e, id) => e.IdNacionalidad = id,
            new[]
            {
                new CampoEf<Nacionalidad>("descripcion", "Nacionalidad", 50, e => e.Descripcion, (e, v) => e.Descripcion = v),
                new CampoEf<Nacionalidad>("abreviatura", "Abreviatura", 3, e => e.Abreviatura, (e, v) => e.Abreviatura = v, requerido: false)
            }));

        Registrar(services, ctx => new MantenimientoCatalogoEf<RegimenPension>(
            ctx, "regimen-pensiones", "Régimen de pensiones", e => e.IdRegimenPen, (e, id) => e.IdRegimenPen = id,
            new[] { new CampoEf<RegimenPension>("ley", "Ley / régimen", 5, e => e.LeyRegimen, (e, v) => e.LeyRegimen = v) }));

        Registrar(services, ctx => new MantenimientoCatalogoEf<EstadoCivil>(
            ctx, "estado-civil", "Estado civil", e => e.IdEstadoCivil, (e, id) => e.IdEstadoCivil = id,
            new[]
            {
                new CampoEf<EstadoCivil>("descripcion", "Estado civil", 11, e => e.DescripEstCivil, (e, v) => e.DescripEstCivil = v),
                new CampoEf<EstadoCivil>("abreviatura", "Abreviatura", 3, e => e.AbrevEstCiv, (e, v) => e.AbrevEstCiv = v, requerido: false)
            }));

        Registrar(services, ctx => new MantenimientoCatalogoEf<TipoInstitucion>(
            ctx, "tipo-institucion", "Tipo de institución", e => e.IdTipoInstitucion, (e, id) => e.IdTipoInstitucion = id,
            new[] { new CampoEf<TipoInstitucion>("descripcion", "Descripción", 15, e => e.DescripTipoInstitucion, (e, v) => e.DescripTipoInstitucion = v) }));

        Registrar(services, ctx => new MantenimientoCatalogoEf<TipoDocId>(
            ctx, "tipo-documento-identidad", "Tipo de documento de identidad", e => e.TipoDocId1, (e, id) => e.TipoDocId1 = id,
            new[] { new CampoEf<TipoDocId>("descripcion", "Descripción", 40, e => e.Descripcion, (e, v) => e.Descripcion = v) }));

        Registrar(services, ctx => new MantenimientoCatalogoEf<TipoEstudio>(
            ctx, "tipo-estudios", "Tipo de estudios", e => e.IdTipoEstudios, (e, id) => e.IdTipoEstudios = id,
            new[] { new CampoEf<TipoEstudio>("descripcion", "Descripción", 15, e => e.DescripTipoEst, (e, v) => e.DescripTipoEst = v) }));

        Registrar(services, ctx => new MantenimientoCatalogoEf<TipoPermiso>(
            ctx, "tipo-permiso", "Tipo de permiso", e => e.IdTipoPermiso, (e, id) => e.IdTipoPermiso = id,
            new[] { new CampoEf<TipoPermiso>("descripcion", "Descripción", 50, e => e.DescripTipoPermiso, (e, v) => e.DescripTipoPermiso = v) }));

        Registrar(services, ctx => new MantenimientoCatalogoEf<MotivoPerm>(
            ctx, "motivo-permiso", "Motivo de permiso", e => e.IdMotivo, (e, id) => e.IdMotivo = id,
            new[]
            {
                new CampoEf<MotivoPerm>("descripcion", "Descripción", 50, e => e.DescripMotivo,
                    // El sistema legado guarda siempre el motivo como activo; no es un dato que se elija.
                    (e, v) => { e.DescripMotivo = v; e.Activo = true; }),
                new CampoEf<MotivoPerm>("tipoPermiso", "Tipo de permiso", 10, e => e.IdTipoPermiso?.ToString(),
                    (e, v) => e.IdTipoPermiso = int.TryParse(v, out var n) ? n : null, esOpcion: true),
                new CampoEf<MotivoPerm>("modalidad", "Modalidad", 1, e => e.TipoModalidad, (e, v) => e.TipoModalidad = v,
                    requerido: false, esOpcion: true),
                new CampoEf<MotivoPerm>("abrev", "Abreviatura", 3, e => e.Abrev, (e, v) => e.Abrev = v, requerido: false),
                new CampoEf<MotivoPerm>("salario", "Asalariado", 1, e => e.Salario is null ? null : (e.Salario.Value ? "1" : "0"),
                    (e, v) => e.Salario = v is null ? null : v == "1", requerido: false, esOpcion: true),
            },
            async (c, ct) =>
            {
                var tipos = await c.TipoPermisos.AsNoTracking().OrderBy(t => t.IdTipoPermiso).ToListAsync(ct);
                var sino = new[] { new OpcionCatalogo("1", "Sí"), new OpcionCatalogo("0", "No") };
                return new Dictionary<string, IReadOnlyList<OpcionCatalogo>>
                {
                    ["tipoPermiso"] = tipos.Select(t => new OpcionCatalogo(t.IdTipoPermiso.ToString(), (t.DescripTipoPermiso ?? string.Empty).Trim())).ToList(),
                    ["modalidad"] = new[] { new OpcionCatalogo("P", "P"), new OpcionCatalogo("C", "C") },
                    ["salario"] = sino,
                };
            }));

        return services;
    }

    private static void Registrar(IServiceCollection services, Func<CmiDbContext, IMantenimientoCatalogo> fabrica)
        => services.AddScoped<IMantenimientoCatalogo>(sp => fabrica(sp.GetRequiredService<CmiDbContext>()));
}
