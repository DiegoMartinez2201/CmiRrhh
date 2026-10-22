using System.Globalization;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

/// <summary>Conversión entre los valores de texto de los formularios y los tipos de las entidades.</summary>
internal static class ValoresEscalafon
{
    public static string? Texto(DateTime? fecha) => fecha?.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

    public static DateTime? AFecha(string? texto)
        => DateTime.TryParseExact(texto, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out var f) ? f : null;

    public static string? Texto(DateOnly? fecha) => fecha?.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);

    public static DateOnly? ASoloFecha(string? texto)
        => DateOnly.TryParseExact(texto, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out var f) ? f : null;

    public static int? AEntero(string? texto)
        => int.TryParse(texto, NumberStyles.Integer, CultureInfo.InvariantCulture, out var n) ? n : null;

    public static string Texto(bool? valor) => valor == true ? "1" : "0";

    public static string Visible(CampoEscalafon campo, string valor, IReadOnlyDictionary<string, IReadOnlyList<CatalogoItem>> opciones)
    {
        if (string.IsNullOrEmpty(valor))
        {
            return string.Empty;
        }

        switch (campo.Tipo)
        {
            case TipoCampoEscalafon.Fecha:
                var fecha = AFecha(valor);
                return fecha is null ? valor : fecha.Value.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
            case TipoCampoEscalafon.SiNo:
                return valor == "1" ? "Sí" : "No";
            case TipoCampoEscalafon.Opcion:
                return opciones.TryGetValue(campo.Clave, out var lista)
                    ? lista.FirstOrDefault(o => o.Id.ToString(CultureInfo.InvariantCulture) == valor)?.Nombre ?? valor
                    : valor;
            default:
                return valor;
        }
    }
}

/// <summary>Campo de una sección ligado a una propiedad de su entidad.</summary>
public sealed class CampoEscalafonEf<T>
{
    public CampoEscalafonEf(CampoEscalafon campo, Func<T, string?> leer, Action<T, string?> escribir)
    {
        Campo = campo;
        Leer = leer;
        Escribir = escribir;
    }

    public CampoEscalafon Campo { get; }

    public Func<T, string?> Leer { get; }

    public Action<T, string?> Escribir { get; }
}

/// <summary>Cómo cargar, crear, ordenar y validar los registros de una sección concreta.</summary>
public sealed class ConfiguracionSeccionEscalafon<T> where T : class
{
    public required string Clave { get; init; }

    public required string Titulo { get; init; }

    public required IReadOnlyList<CampoEscalafonEf<T>> Campos { get; init; }

    /// <summary>Registros del empleado (con seguimiento de cambios, para poder modificarlos).</summary>
    public required Func<CmiDbContext, int, CancellationToken, Task<List<T>>> Cargar { get; init; }

    /// <summary>Clave del registro dentro del empleado (única entre sus registros).</summary>
    public required Func<T, string> ClaveDe { get; init; }

    /// <summary>Crea un registro nuevo (sin agregarlo) con el empleado y la siguiente clave ya asignados.</summary>
    public required Func<CmiDbContext, int, IReadOnlyList<T>, CancellationToken, Task<T>> Crear { get; init; }

    /// <summary>
    /// Alternativa a <see cref="Crear"/> para secciones que necesitan los valores del formulario al crear el registro
    /// (por ejemplo, reutilizar una persona ya registrada por su documento). Si se define, se usa en lugar de Crear.
    /// </summary>
    public Func<CmiDbContext, int, IReadOnlyList<T>, IReadOnlyDictionary<string, string>, CancellationToken, Task<T>>? CrearConValores { get; init; }

    public Func<List<T>, IEnumerable<T>>? Ordenar { get; init; }

    public Func<CmiDbContext, CancellationToken, Task<Dictionary<string, IReadOnlyList<CatalogoItem>>>>? Opciones { get; init; }

    public Func<IReadOnlyDictionary<string, string>, string?>? Reglas { get; init; }

    /// <summary>Reglas que necesitan consultar la base (duplicados, por ejemplo). Recibe la clave (null = alta).</summary>
    public Func<CmiDbContext, int, string?, IReadOnlyDictionary<string, string>, CancellationToken, Task<string?>>? ReglasBd { get; init; }

    /// <summary>Un solo registro por empleado: solo se modifica (clave = código del empleado).</summary>
    public bool RegistroUnico { get; init; }

    /// <summary>Si es false, la sección no admite eliminar registros (se les da de baja con sus propios campos).</summary>
    public bool PermiteEliminar { get; init; } = true;

    /// <summary>Ajustes entre campos tras asignar los valores y antes de guardar (por ejemplo, vaciar los que no aplican).</summary>
    public Action<T, IReadOnlyDictionary<string, string>>? Normalizar { get; init; }
}

/// <summary>
/// Sección de la ficha escalafonaria sobre una tabla de EF. El acceso a datos es siempre por EF con
/// parámetros; los valores llegan validados desde la capa de aplicación.
/// </summary>
public sealed class SeccionEscalafonEf<T> : IEscalafonSeccion where T : class
{
    private readonly CmiDbContext _context;
    private readonly ConfiguracionSeccionEscalafon<T> _config;

    public SeccionEscalafonEf(CmiDbContext context, ConfiguracionSeccionEscalafon<T> config)
    {
        _context = context;
        _config = config;
        Definicion = new DefinicionSeccionEscalafon(config.Clave, config.Titulo, config.Campos.Select(c => c.Campo).ToList(), config.RegistroUnico, config.PermiteEliminar);
    }

    public DefinicionSeccionEscalafon Definicion { get; }

    public async Task<IReadOnlyDictionary<string, IReadOnlyList<CatalogoItem>>> OpcionesAsync(CancellationToken cancellationToken = default)
    {
        if (_config.Opciones is null)
        {
            return new Dictionary<string, IReadOnlyList<CatalogoItem>>();
        }

        return await _config.Opciones(_context, cancellationToken);
    }

    public async Task<IReadOnlyList<FilaEscalafon>> ListarAsync(int idEmpleado, CancellationToken cancellationToken = default)
    {
        var opciones = await OpcionesAsync(cancellationToken);
        var entidades = await _config.Cargar(_context, idEmpleado, cancellationToken);
        var ordenadas = (_config.Ordenar?.Invoke(entidades) ?? entidades).ToList();

        return ordenadas
            .Select(e =>
            {
                var valores = _config.Campos.ToDictionary(c => c.Campo.Clave, c => (c.Leer(e) ?? string.Empty).Trim());
                var visibles = _config.Campos.ToDictionary(
                    c => c.Campo.Clave,
                    c => ValoresEscalafon.Visible(c.Campo, valores[c.Campo.Clave], opciones));
                return new FilaEscalafon { Clave = _config.ClaveDe(e), Valores = valores, Visibles = visibles };
            })
            .ToList();
    }

    public string? ValidarReglas(IReadOnlyDictionary<string, string> valores) => _config.Reglas?.Invoke(valores);

    public async Task<string?> GuardarAsync(
        int idEmpleado,
        string? clave,
        IReadOnlyDictionary<string, string> valores,
        CancellationToken cancellationToken = default)
    {
        if (!await _context.Empleados.AsNoTracking().AnyAsync(e => e.IdEmpleado == idEmpleado, cancellationToken))
        {
            return "El empleado no existe.";
        }

        var existentes = await _config.Cargar(_context, idEmpleado, cancellationToken);
        if (_config.RegistroUnico)
        {
            // Hay un solo registro por empleado: si ya existe se modifica; si todavía no, este guardado lo crea.
            var unico = existentes.FirstOrDefault();
            clave = unico is null ? null : _config.ClaveDe(unico);
        }

        var esAlta = clave is null;

        T? entidad;
        if (esAlta)
        {
            entidad = _config.CrearConValores is not null
                ? await _config.CrearConValores(_context, idEmpleado, existentes, valores, cancellationToken)
                : await _config.Crear(_context, idEmpleado, existentes, cancellationToken);
        }
        else
        {
            entidad = existentes.FirstOrDefault(e => _config.ClaveDe(e) == clave);
            if (entidad is null)
            {
                return "El registro ya no existe.";
            }
        }

        if (_config.ReglasBd is not null)
        {
            var error = await _config.ReglasBd(_context, idEmpleado, clave, valores, cancellationToken);
            if (error is not null)
            {
                return error;
            }
        }

        foreach (var campo in _config.Campos)
        {
            if (!esAlta && campo.Campo.SoloAlta)
            {
                continue;
            }

            valores.TryGetValue(campo.Campo.Clave, out var valor);
            campo.Escribir(entidad, string.IsNullOrWhiteSpace(valor) ? null : valor.Trim());
        }

        _config.Normalizar?.Invoke(entidad, valores);

        if (esAlta)
        {
            _context.Set<T>().Add(entidad);
        }

        try
        {
            await _context.SaveChangesAsync(cancellationToken);
            return null;
        }
        catch (DbUpdateException)
        {
            _context.ChangeTracker.Clear();
            return "No se pudo guardar el registro: los datos no son válidos o ya existe uno igual.";
        }
    }

    public async Task<string?> EliminarAsync(int idEmpleado, string clave, CancellationToken cancellationToken = default)
    {
        if (_config.RegistroUnico)
        {
            return "Este registro no se puede eliminar; solo se modifica.";
        }

        if (!_config.PermiteEliminar)
        {
            return "Este registro no se elimina: se le da de baja indicando el motivo y la fecha.";
        }

        var existentes = await _config.Cargar(_context, idEmpleado, cancellationToken);
        var entidad = existentes.FirstOrDefault(e => _config.ClaveDe(e) == clave);
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
            _context.ChangeTracker.Clear();
            return "No se puede eliminar: el registro está siendo usado por otros datos.";
        }
    }
}

/// <summary>Registro en DI de las secciones de la ficha escalafonaria.</summary>
public static class SeccionesEscalafonRegistro
{
    private static string? OrdenFechas(IReadOnlyDictionary<string, string> v, string desde, string hasta, string mensaje)
    {
        var a = ValoresEscalafon.AFecha(v.GetValueOrDefault(desde));
        var b = ValoresEscalafon.AFecha(v.GetValueOrDefault(hasta));
        return a is not null && b is not null && b < a ? mensaje : null;
    }

    public static IServiceCollection AddSeccionesEscalafon(this IServiceCollection services)
    {
        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<PeriodoLaboral>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<PeriodoLaboral>
            {
                Clave = "periodos",
                Titulo = "Periodos laborales",
                Campos = new[]
                {
                    new CampoEscalafonEf<PeriodoLaboral>(
                        new CampoEscalafon("fechaIngreso", "Fecha de ingreso a la institución", TipoCampoEscalafon.Fecha),
                        e => ValoresEscalafon.Texto(e.FechaIngreso), (e, v) => e.FechaIngreso = ValoresEscalafon.AFecha(v)),
                    new CampoEscalafonEf<PeriodoLaboral>(
                        new CampoEscalafon("numResol", "N° de resolución de ingreso", TipoCampoEscalafon.Texto, 30, Requerido: false),
                        e => e.NumResoIngreInstitu, (e, v) => e.NumResoIngreInstitu = v),
                    new CampoEscalafonEf<PeriodoLaboral>(
                        new CampoEscalafon("fechaResol", "Fecha de la resolución", TipoCampoEscalafon.Fecha, Requerido: false),
                        e => ValoresEscalafon.Texto(e.FechaResoIngreInstitu), (e, v) => e.FechaResoIngreInstitu = ValoresEscalafon.AFecha(v)),
                    new CampoEscalafonEf<PeriodoLaboral>(
                        new CampoEscalafon("fechaSalida", "Fin del periodo en la institución", TipoCampoEscalafon.Fecha, Requerido: false),
                        e => ValoresEscalafon.Texto(e.FechaSalida), (e, v) => e.FechaSalida = ValoresEscalafon.AFecha(v)),
                    new CampoEscalafonEf<PeriodoLaboral>(
                        new CampoEscalafon("judicial", "¿Es judicial?", TipoCampoEscalafon.SiNo, Requerido: false),
                        e => ValoresEscalafon.Texto(e.Judicial), (e, v) => e.Judicial = v == "1"),
                    new CampoEscalafonEf<PeriodoLaboral>(
                        new CampoEscalafon("obs", "Observación", TipoCampoEscalafon.Texto, 2000, Requerido: false, EnLista: false),
                        e => e.Obs, (e, v) => e.Obs = v)
                },
                Cargar = (ctx, id, ct) => ctx.PeriodoLaborals.Where(p => p.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.NroPeriodo.ToString(CultureInfo.InvariantCulture),
                Crear = (ctx, id, existentes, ct) => Task.FromResult(new PeriodoLaboral
                {
                    IdEmpleado = id,
                    NroPeriodo = (existentes.Count == 0 ? 0 : existentes.Max(p => p.NroPeriodo)) + 1
                }),
                Ordenar = lista => lista.OrderByDescending(p => p.NroPeriodo),
                Reglas = v => OrdenFechas(v, "fechaIngreso", "fechaSalida", "El fin del periodo no puede ser anterior a la fecha de ingreso.")
            }));

        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<ExpLaboral>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<ExpLaboral>
            {
                Clave = "experiencia",
                Titulo = "Experiencia laboral",
                Campos = new[]
                {
                    new CampoEscalafonEf<ExpLaboral>(
                        new CampoEscalafon("nomInstitucion", "Institución o entidad", TipoCampoEscalafon.Texto, 120),
                        e => e.NomInstitucion, (e, v) => e.NomInstitucion = v),
                    new CampoEscalafonEf<ExpLaboral>(
                        new CampoEscalafon("idTipoInstitucion", "Tipo de institución", TipoCampoEscalafon.Opcion),
                        e => e.IdTipoInstitucion?.ToString(CultureInfo.InvariantCulture), (e, v) => e.IdTipoInstitucion = ValoresEscalafon.AEntero(v)),
                    new CampoEscalafonEf<ExpLaboral>(
                        new CampoEscalafon("cargo", "Cargo", TipoCampoEscalafon.Texto, 40),
                        e => e.Cargo, (e, v) => e.Cargo = v),
                    new CampoEscalafonEf<ExpLaboral>(
                        new CampoEscalafon("unidadOrganica", "Unidad orgánica", TipoCampoEscalafon.Texto, 100, Requerido: false),
                        e => e.UnidadOrganica, (e, v) => e.UnidadOrganica = v),
                    new CampoEscalafonEf<ExpLaboral>(
                        new CampoEscalafon("fechaIngreso", "Fecha de ingreso", TipoCampoEscalafon.Fecha),
                        e => ValoresEscalafon.Texto(e.FechaIngreso), (e, v) => e.FechaIngreso = ValoresEscalafon.AFecha(v)),
                    new CampoEscalafonEf<ExpLaboral>(
                        new CampoEscalafon("fechaEgreso", "Fecha de egreso", TipoCampoEscalafon.Fecha, Requerido: false),
                        e => ValoresEscalafon.Texto(e.FechaEgreso), (e, v) => e.FechaEgreso = ValoresEscalafon.AFecha(v))
                },
                Cargar = (ctx, id, ct) => ctx.ExpLaborals.Where(p => p.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdExpLab.ToString(CultureInfo.InvariantCulture),
                Crear = (ctx, id, existentes, ct) => Task.FromResult(new ExpLaboral
                {
                    IdEmpleado = id,
                    IdExpLab = (existentes.Count == 0 ? 0 : existentes.Max(p => p.IdExpLab)) + 1
                }),
                Ordenar = lista => lista.OrderByDescending(p => p.FechaIngreso),
                Opciones = async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
                {
                    ["idTipoInstitucion"] = (await ctx.TipoInstitucions.AsNoTracking().OrderBy(t => t.DescripTipoInstitucion).ToListAsync(ct))
                        .Select(t => new CatalogoItem { Id = t.IdTipoInstitucion, Nombre = (t.DescripTipoInstitucion ?? string.Empty).Trim() })
                        .ToList()
                },
                Reglas = v => OrdenFechas(v, "fechaIngreso", "fechaEgreso", "La fecha de egreso no puede ser anterior a la de ingreso.")
            }));

        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<EstudiosRealizado>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<EstudiosRealizado>
            {
                Clave = "estudios",
                Titulo = "Estudios realizados",
                Campos = new[]
                {
                    // El tipo de estudios forma parte de la clave del registro: solo se elige al agregar.
                    new CampoEscalafonEf<EstudiosRealizado>(
                        new CampoEscalafon("idTipoEstudios", "Tipo de estudios", TipoCampoEscalafon.Opcion, SoloAlta: true),
                        e => e.IdTipoEstudios == 0 ? null : e.IdTipoEstudios.ToString(CultureInfo.InvariantCulture),
                        (e, v) => e.IdTipoEstudios = ValoresEscalafon.AEntero(v) ?? 0),
                    new CampoEscalafonEf<EstudiosRealizado>(
                        new CampoEscalafon("centroEstudios", "Centro de estudios", TipoCampoEscalafon.Texto, 150),
                        e => e.CentroEstudios, (e, v) => e.CentroEstudios = v),
                    new CampoEscalafonEf<EstudiosRealizado>(
                        new CampoEscalafon("especialidad", "Especialidad", TipoCampoEscalafon.Texto, 100, Requerido: false),
                        e => e.Especialidad, (e, v) => e.Especialidad = v),
                    new CampoEscalafonEf<EstudiosRealizado>(
                        new CampoEscalafon("idEstadoEstudio", "Estado", TipoCampoEscalafon.Opcion, Requerido: false),
                        e => e.IdEstadoEstudio?.ToString(CultureInfo.InvariantCulture), (e, v) => e.IdEstadoEstudio = ValoresEscalafon.AEntero(v)),
                    new CampoEscalafonEf<EstudiosRealizado>(
                        new CampoEscalafon("anioInicio", "Inicio", TipoCampoEscalafon.Fecha, Requerido: false),
                        e => ValoresEscalafon.Texto(e.AñoInicio), (e, v) => e.AñoInicio = ValoresEscalafon.AFecha(v)),
                    new CampoEscalafonEf<EstudiosRealizado>(
                        new CampoEscalafon("anioTermino", "Término", TipoCampoEscalafon.Fecha, Requerido: false),
                        e => ValoresEscalafon.Texto(e.AñoTermino), (e, v) => e.AñoTermino = ValoresEscalafon.AFecha(v))
                },
                Cargar = (ctx, id, ct) => ctx.EstudiosRealizados.Where(p => p.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => $"{e.IdTipoEstudios}-{e.Correlativo}",
                Crear = (ctx, id, existentes, ct) => Task.FromResult(new EstudiosRealizado
                {
                    IdEmpleado = id,
                    Correlativo = (existentes.Count == 0 ? 0 : existentes.Max(p => p.Correlativo)) + 1
                }),
                Ordenar = lista => lista.OrderBy(p => p.IdTipoEstudios).ThenBy(p => p.Correlativo),
                Opciones = async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
                {
                    ["idTipoEstudios"] = (await ctx.TipoEstudios.AsNoTracking().OrderBy(t => t.IdTipoEstudios).ToListAsync(ct))
                        .Select(t => new CatalogoItem { Id = t.IdTipoEstudios, Nombre = (t.DescripTipoEst ?? string.Empty).Trim() })
                        .ToList(),
                    ["idEstadoEstudio"] = (await ctx.EstadoEstudios.AsNoTracking().OrderBy(t => t.IdEstadoEstudio).ToListAsync(ct))
                        .Select(t => new CatalogoItem { Id = t.IdEstadoEstudio, Nombre = (t.DescripEstadoEstudio ?? string.Empty).Trim() })
                        .ToList()
                },
                Reglas = v => OrdenFechas(v, "anioInicio", "anioTermino", "El término no puede ser anterior al inicio.")
            }));

        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<TitulosEmpleado>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<TitulosEmpleado>
            {
                Clave = "titulos",
                Titulo = "Títulos y grados",
                Campos = new[]
                {
                    // El número de colegiatura es la clave primaria de la tabla: solo se indica al agregar.
                    new CampoEscalafonEf<TitulosEmpleado>(
                        new CampoEscalafon("numColegiatura", "N° de colegiatura", TipoCampoEscalafon.Texto, 20, SoloAlta: true),
                        e => e.NumColegiatura, (e, v) => e.NumColegiatura = v ?? string.Empty),
                    new CampoEscalafonEf<TitulosEmpleado>(
                        new CampoEscalafon("denominacionGrado", "Denominación del grado y/o título", TipoCampoEscalafon.Texto, 100),
                        e => e.DenominacionGrado, (e, v) => e.DenominacionGrado = v),
                    new CampoEscalafonEf<TitulosEmpleado>(
                        new CampoEscalafon("institucion", "Institución o entidad", TipoCampoEscalafon.Texto, 60),
                        e => e.Institucion, (e, v) => e.Institucion = v),
                    new CampoEscalafonEf<TitulosEmpleado>(
                        new CampoEscalafon("fecha", "Fecha", TipoCampoEscalafon.Fecha, Requerido: false),
                        e => ValoresEscalafon.Texto(e.Fecha), (e, v) => e.Fecha = ValoresEscalafon.AFecha(v))
                },
                Cargar = (ctx, id, ct) => ctx.TitulosEmpleados.Where(p => p.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.NumColegiatura.Trim(),
                Crear = (ctx, id, existentes, ct) => Task.FromResult(new TitulosEmpleado { IdEmpleado = id }),
                Ordenar = lista => lista.OrderByDescending(p => p.Fecha),
                ReglasBd = async (ctx, id, clave, valores, ct) =>
                {
                    // Regla del legado: la colegiatura no puede repetirse (es la clave primaria de la tabla).
                    if (clave is not null)
                    {
                        return null;
                    }

                    var numero = (valores.GetValueOrDefault("numColegiatura") ?? string.Empty).Trim();
                    var dueño = await ctx.TitulosEmpleados.AsNoTracking()
                        .Where(t => t.NumColegiatura == numero)
                        .Select(t => t.IdEmpleado)
                        .FirstOrDefaultAsync(ct);
                    if (dueño is null)
                    {
                        var existe = await ctx.TitulosEmpleados.AsNoTracking().AnyAsync(t => t.NumColegiatura == numero, ct);
                        return existe ? "Ya está registrado ese N° de colegiatura. Por favor verifique." : null;
                    }

                    var persona = await ctx.Empleados.AsNoTracking()
                        .Where(e => e.IdEmpleado == dueño.Value)
                        .Select(e => new { e.IdPersonaNavigation!.ApellidoPaterno, e.IdPersonaNavigation.ApellidoMaterno, e.IdPersonaNavigation.Nombres })
                        .FirstOrDefaultAsync(ct);
                    var nombre = persona is null
                        ? $"código {dueño}"
                        : $"{persona.ApellidoPaterno} {persona.ApellidoMaterno} {persona.Nombres}".Trim();
                    return $"Ya está registrado ese N° de colegiatura en el empleado: {nombre}. Por favor verifique.";
                }
            }));

        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<Capacitacion>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<Capacitacion>
            {
                Clave = "capacitaciones",
                Titulo = "Capacitaciones",
                Campos = new[]
                {
                    new CampoEscalafonEf<Capacitacion>(
                        new CampoEscalafon("nombreCurso", "Nombre del curso", TipoCampoEscalafon.Texto, 300),
                        e => e.NombreCurso, (e, v) => e.NombreCurso = v),
                    new CampoEscalafonEf<Capacitacion>(
                        new CampoEscalafon("institucionOrganizadora", "Institución organizadora", TipoCampoEscalafon.Texto, 300, Requerido: false),
                        e => e.InstitucionOrganizadora, (e, v) => e.InstitucionOrganizadora = v),
                    new CampoEscalafonEf<Capacitacion>(
                        new CampoEscalafon("fechaInicio", "Fecha de inicio", TipoCampoEscalafon.Fecha, Requerido: false),
                        e => ValoresEscalafon.Texto(e.FechaInicio), (e, v) => e.FechaInicio = ValoresEscalafon.AFecha(v)),
                    new CampoEscalafonEf<Capacitacion>(
                        new CampoEscalafon("fechaFin", "Fecha de fin", TipoCampoEscalafon.Fecha, Requerido: false),
                        e => ValoresEscalafon.Texto(e.FechaFin), (e, v) => e.FechaFin = ValoresEscalafon.AFecha(v)),
                    new CampoEscalafonEf<Capacitacion>(
                        new CampoEscalafon("numHoras", "N° de horas", TipoCampoEscalafon.Texto, 5, Requerido: false),
                        e => e.NumHoras, (e, v) => e.NumHoras = v)
                },
                Cargar = (ctx, id, ct) => ctx.Capacitacions.Where(p => p.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdCapacitacion.ToString(CultureInfo.InvariantCulture),
                // IdCapacitacion no es identity: el siguiente id sale del máximo de toda la tabla.
                Crear = async (ctx, id, existentes, ct) => new Capacitacion
                {
                    IdEmpleado = id,
                    IdCapacitacion = ((await ctx.Capacitacions.AsNoTracking().MaxAsync(c => (int?)c.IdCapacitacion, ct)) ?? 0) + 1
                },
                Ordenar = lista => lista.OrderByDescending(p => p.FechaInicio),
                Reglas = v => OrdenFechas(v, "fechaInicio", "fechaFin", "La fecha de fin no puede ser anterior a la de inicio.")
            }));


        services.AddScoped<IEscalafonSeccion>(sp => new SeccionEscalafonEf<Viviendum>(
            sp.GetRequiredService<CmiDbContext>(),
            new ConfiguracionSeccionEscalafon<Viviendum>
            {
                Clave = "vivienda",
                Titulo = "Vivienda",
                Campos = new[]
                {
                    OpcionVivienda("tenencia", "Tenencia", e => e.IdTenencia, (e, v) => e.IdTenencia = v, enLista: true),
                    OpcionVivienda("tipo", "Tipo de vivienda", e => e.IdTipo, (e, v) => e.IdTipo = v, enLista: true),
                    OpcionVivienda("material", "Material predominante", e => e.IdMaterial, (e, v) => e.IdMaterial = v, enLista: true),
                    OpcionVivienda("conservacion", "Estado de conservación", e => e.IdConservacion, (e, v) => e.IdConservacion = v),
                    OpcionVivienda("ubicacion", "Ubicación", e => e.IdUbicacion, (e, v) => e.IdUbicacion = v),
                    TextoVivienda("numDormitorio", "N° de dormitorios", 2, e => e.NumDormitorio, (e, v) => e.NumDormitorio = v, enLista: true),
                    TextoVivienda("numPerDorm", "N° de personas por dormitorio", 2, e => e.NumPerDorm, (e, v) => e.NumPerDorm = v),
                    TextoVivienda("numServHig", "N° de servicios higiénicos", 2, e => e.NumServHig, (e, v) => e.NumServHig = v),
                    TextoVivienda("numCompart", "N° de familias que comparten", 2, e => e.NumCompart, (e, v) => e.NumCompart = v),
                    OpcionVivienda("alumbrado", "Alumbrado", e => e.IdAlumbrado, (e, v) => e.IdAlumbrado = v),
                    TextoVivienda("otroAlumbrado", "Otro alumbrado", 50, e => e.OtroAlumbrado, (e, v) => e.OtroAlumbrado = v),
                    OpcionVivienda("agua", "Abastecimiento de agua", e => e.IdAgua, (e, v) => e.IdAgua = v),
                    TextoVivienda("otroAgua", "Otro abastecimiento de agua", 50, e => e.OtroAgua, (e, v) => e.OtroAgua = v),
                    OpcionVivienda("excretas", "Eliminación de excretas", e => e.IdExcretas, (e, v) => e.IdExcretas = v),
                    TextoVivienda("otroExcreta", "Otra eliminación de excretas", 50, e => e.OtroExcreta, (e, v) => e.OtroExcreta = v),
                    new CampoEscalafonEf<Viviendum>(
                        new CampoEscalafon("telefono", "Teléfono", TipoCampoEscalafon.SiNo, EnLista: false),
                        e => ValoresEscalafon.Texto(e.Telefono), (e, v) => e.Telefono = v == "1"),
                    new CampoEscalafonEf<Viviendum>(
                        new CampoEscalafon("cable", "Cable", TipoCampoEscalafon.SiNo, EnLista: false),
                        e => ValoresEscalafon.Texto(e.Cable), (e, v) => e.Cable = v == "1"),
                    new CampoEscalafonEf<Viviendum>(
                        new CampoEscalafon("internet", "Internet", TipoCampoEscalafon.SiNo, EnLista: false),
                        e => ValoresEscalafon.Texto(e.Internet), (e, v) => e.Internet = v == "1"),
                    new CampoEscalafonEf<Viviendum>(
                        new CampoEscalafon("otros", "Otros servicios", TipoCampoEscalafon.SiNo, EnLista: false),
                        e => ValoresEscalafon.Texto(e.Otros), (e, v) => e.Otros = v == "1"),
                    TextoVivienda("observacion", "Observación", 200, e => e.Observacion, (e, v) => e.Observacion = v)
                },
                Cargar = (ctx, id, ct) => ctx.Vivienda.Where(p => p.IdEmpleado == id).ToListAsync(ct),
                ClaveDe = e => e.IdVivienda.ToString(CultureInfo.InvariantCulture),
                // IdVivienda no es identity: el siguiente id sale del máximo de toda la tabla.
                Crear = async (ctx, id, existentes, ct) => new Viviendum
                {
                    IdEmpleado = id,
                    IdVivienda = ((await ctx.Vivienda.AsNoTracking().MaxAsync(c => (int?)c.IdVivienda, ct)) ?? 0) + 1
                },
                Ordenar = lista => lista.OrderByDescending(p => p.IdVivienda),
                Reglas = v =>
                {
                    // Los contadores son varchar(2) en la base: solo dígitos.
                    foreach (var clave in new[] { "numDormitorio", "numPerDorm", "numServHig", "numCompart" })
                    {
                        var valor = v.GetValueOrDefault(clave);
                        if (!string.IsNullOrEmpty(valor) && !valor.All(char.IsAsciiDigit))
                        {
                            return "Los campos de cantidad solo admiten números.";
                        }
                    }

                    return null;
                },
                Opciones = async (ctx, ct) => new Dictionary<string, IReadOnlyList<CatalogoItem>>
                {
                    ["tenencia"] = await ctx.TenenciaVivs.AsNoTracking().OrderBy(x => x.IdTenencia)
                        .Select(x => new CatalogoItem { Id = x.IdTenencia, Nombre = x.DescripTenencia ?? x.IdTenencia.ToString() }).ToListAsync(ct),
                    ["tipo"] = await ctx.TipoVivs.AsNoTracking().OrderBy(x => x.IdTipo)
                        .Select(x => new CatalogoItem { Id = x.IdTipo, Nombre = x.DescripTipo ?? x.IdTipo.ToString() }).ToListAsync(ct),
                    ["material"] = await ctx.MaterialVivs.AsNoTracking().OrderBy(x => x.IdMaterial)
                        .Select(x => new CatalogoItem { Id = x.IdMaterial, Nombre = x.DescripMaterial ?? x.IdMaterial.ToString() }).ToListAsync(ct),
                    ["conservacion"] = await ctx.ConservacionVivs.AsNoTracking().OrderBy(x => x.IdConservacion)
                        .Select(x => new CatalogoItem { Id = x.IdConservacion, Nombre = x.DescripConserva ?? x.IdConservacion.ToString() }).ToListAsync(ct),
                    ["ubicacion"] = await ctx.UbicacionVivs.AsNoTracking().OrderBy(x => x.IdUbicacion)
                        .Select(x => new CatalogoItem { Id = x.IdUbicacion, Nombre = x.DescripUbicacion ?? x.IdUbicacion.ToString() }).ToListAsync(ct),
                    ["alumbrado"] = await ctx.AlumbradoVivs.AsNoTracking().OrderBy(x => x.IdAlumbrado)
                        .Select(x => new CatalogoItem { Id = x.IdAlumbrado, Nombre = x.DescripAlumbrado ?? x.IdAlumbrado.ToString() }).ToListAsync(ct),
                    ["agua"] = await ctx.AguaVivs.AsNoTracking().OrderBy(x => x.IdAgua)
                        .Select(x => new CatalogoItem { Id = x.IdAgua, Nombre = x.DescripAgua ?? x.IdAgua.ToString() }).ToListAsync(ct),
                    ["excretas"] = await ctx.ExcretasVivs.AsNoTracking().OrderBy(x => x.IdExcretas)
                        .Select(x => new CatalogoItem { Id = x.IdExcretas, Nombre = x.DescripExcretas ?? x.IdExcretas.ToString() }).ToListAsync(ct)
                }
            }));

        return services;
    }

    private static CampoEscalafonEf<Viviendum> OpcionVivienda(
        string clave, string etiqueta, Func<Viviendum, int?> leer, Action<Viviendum, int?> escribir, bool enLista = false)
        => new(
            new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Opcion, Requerido: false, EnLista: enLista),
            e => leer(e)?.ToString(CultureInfo.InvariantCulture),
            (e, v) => escribir(e, ValoresEscalafon.AEntero(v)));

    private static CampoEscalafonEf<Viviendum> TextoVivienda(
        string clave, string etiqueta, int max, Func<Viviendum, string?> leer, Action<Viviendum, string?> escribir, bool enLista = false)
        => new(
            new CampoEscalafon(clave, etiqueta, TipoCampoEscalafon.Texto, max, Requerido: false, EnLista: enLista),
            leer,
            escribir);
}
