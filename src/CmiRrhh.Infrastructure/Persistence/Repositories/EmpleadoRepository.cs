using System.Data;
using System.Globalization;
using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;
using CmiRrhh.Infrastructure.Persistence.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class EmpleadoRepository : IEmpleadoRepository
{
    private readonly CmiDbContext _context;
    private readonly IStoredProcedureExecutor _executor;

    public EmpleadoRepository(CmiDbContext context, IStoredProcedureExecutor executor)
    {
        _context = context;
        _executor = executor;
    }

    public Task<DataTable> BuscarEmpleadoAsync(
        int? codigo,
        string? numDoc,
        string? apellido,
        int? idTipoTrabajador,
        int activo,
        int anio,
        int idRol = 0,
        CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_busca_empleado aplica filtros opcionales + año + rol + estado
        // sobre varias tablas (no es un WHERE simple de una sola entidad).
        return _executor.QueryAsync(
            "spRRHH_busca_empleado",
            cancellationToken,
            _executor.In("@idempleado", codigo, SqlDbType.Int),
            _executor.In("@NumdocId", numDoc, SqlDbType.VarChar, 12),
            _executor.In("@Apellido_Paterno", apellido, SqlDbType.VarChar, 30),
            _executor.In("@IdTipoTrabajador", idTipoTrabajador, SqlDbType.Int),
            _executor.In("@Anio", anio.ToString(CultureInfo.InvariantCulture), SqlDbType.Char, 4),
            _executor.In("@idRol", idRol, SqlDbType.Int),
            _executor.In("@activo", activo, SqlDbType.Bit));
    }

    public async Task<DataTable> BuscarEmpleadoPorCodigoAsync(int codigo, CancellationToken cancellationToken = default)
    {
        // Regla 1: búsqueda por PK de Empleado + navegación a Persona (FK, no joins condicionales).
        var row = await _context.Empleados
            .AsNoTracking()
            .Where(e => e.IdEmpleado == codigo)
            .Select(e => new
            {
                e.IdPersonaNavigation!.Nombres,
                e.IdPersonaNavigation.ApellidoPaterno,
                e.IdPersonaNavigation.ApellidoMaterno,
                e.Sexo,
                e.IdPersonaNavigation.TipoDocId,
                e.IdPersonaNavigation.NumDocId,
                e.IdNacionalidad,
                e.IdPersonaNavigation.FechaNacimiento,
                e.IdPersonaNavigation.Telefono,
                e.IdPersonaNavigation.NumCelular,
                e.IdPersonaNavigation.FonoCentroLab,
                e.IdPersonaNavigation.Fax,
                e.IdEstadoCivil,
                e.IdDiscapacidad,
                e.IdPersonaNavigation.IdUbigeo,
                e.IdPersonaNavigation.Direccion,
                e.IdPersonaNavigation.UbigeoDireccion,
                e.ExpSocial,
                e.Foto,
                e.IdPersona,
                e.Year,
                e.IdAreaOrganiz,
                e.IdPersonaNavigation.FechaRegistro,
                e.IdPersonaNavigation.Email,
                e.IdTipoSangre,
                e.GradoInstruccion,
                e.NumLibretaMilitar,
                e.Brevete,
                e.NumRuc,
                e.IdHorario,
                e.IdTipoTrabajador
            })
            .FirstOrDefaultAsync(cancellationToken);

        var table = new DataTable();
        table.Columns.Add("Nombres");
        table.Columns.Add("Apellido_paterno");
        table.Columns.Add("Apellido_Materno");
        table.Columns.Add("Sexo");
        table.Columns.Add("TipoDocID", typeof(int));
        table.Columns.Add("NumDocID");
        table.Columns.Add("idNacionalidad", typeof(int));
        table.Columns.Add("FechaNacimiento", typeof(DateTime));
        table.Columns.Add("Telefono");
        table.Columns.Add("Numcelular");
        table.Columns.Add("FonoCentrolab");
        table.Columns.Add("Fax");
        table.Columns.Add("IdEstadoCivil", typeof(int));
        table.Columns.Add("IdDiscapacidad", typeof(int));
        table.Columns.Add("IdUbigeo");
        table.Columns.Add("Direccion");
        table.Columns.Add("UbigeoDireccion");
        table.Columns.Add("ExpSocial");
        table.Columns.Add("foto", typeof(byte[]));
        table.Columns.Add("idpersona", typeof(int));
        table.Columns.Add("year", typeof(int));
        table.Columns.Add("idAreaOrganiz", typeof(int));
        table.Columns.Add("FechaRegistro", typeof(DateTime));
        table.Columns.Add("email");
        table.Columns.Add("idtiposangre", typeof(int));
        table.Columns.Add("gradoinstruccion");
        table.Columns.Add("numlibretamilitar");
        table.Columns.Add("brevete");
        table.Columns.Add("NumRUC");
        table.Columns.Add("idhorario", typeof(int));
        table.Columns.Add("idtipotrabajador", typeof(int));

        if (row is not null)
        {
            table.Rows.Add(
                row.Nombres, row.ApellidoPaterno, row.ApellidoMaterno, row.Sexo,
                row.TipoDocId, row.NumDocId, row.IdNacionalidad, row.FechaNacimiento,
                row.Telefono, row.NumCelular, row.FonoCentroLab, row.Fax,
                row.IdEstadoCivil, row.IdDiscapacidad, row.IdUbigeo, row.Direccion,
                row.UbigeoDireccion, row.ExpSocial, row.Foto, row.IdPersona,
                row.Year, row.IdAreaOrganiz, row.FechaRegistro, row.Email,
                row.IdTipoSangre, row.GradoInstruccion, row.NumLibretaMilitar, row.Brevete,
                row.NumRuc, row.IdHorario, row.IdTipoTrabajador);
        }

        return table;
    }

    public async Task<int> IngresarEmpleadoAsync(EmpleadoFicha empleado, CancellationToken cancellationToken = default)
    {
        // Regla 3: spRRHH_GrabarEmpleado está WITH ENCRYPTION (inserta Persona + Empleado).
        // No se reescribe en LINQ. El objeto EmpleadoFicha sustituye los 29 parámetros;
        // internamente se proyecta a las entidades scaffold antes de armar el SP.
        var entidad = ToEmpleadoEntity(empleado);
        var persona = ToPersonaEntity(empleado);

        var nuevoId = _executor.Out("@codEmpleNuevo", SqlDbType.Int);
        await _executor.ExecuteAsync(
            "spRRHH_GrabarEmpleado",
            cancellationToken,
            _executor.In("@year", entidad.Year, SqlDbType.Int),
            _executor.In("@idorganiz", entidad.IdAreaOrganiz, SqlDbType.Int),
            _executor.In("@TipoDocIdent", persona.TipoDocId, SqlDbType.Int),
            _executor.In("@NumDoc", persona.NumDocId, SqlDbType.Char, 12),
            _executor.In("@Apellido_Paterno", persona.ApellidoPaterno, SqlDbType.VarChar, 30),
            _executor.In("@Apellido_Materno", persona.ApellidoMaterno, SqlDbType.VarChar, 30),
            _executor.In("@Nombres", persona.Nombres, SqlDbType.VarChar, 100),
            _executor.In("@ubigeoNac", persona.IdUbigeo, SqlDbType.Char, 6),
            _executor.In("@fechaNac", persona.FechaNacimiento, SqlDbType.DateTime),
            _executor.In("@Direccion", persona.Direccion, SqlDbType.VarChar, 100),
            _executor.In("@Fono", persona.Telefono, SqlDbType.VarChar, 15),
            _executor.In("@FonoLab", persona.FonoCentroLab, SqlDbType.VarChar, 15),
            _executor.In("@FonoCel", persona.NumCelular, SqlDbType.VarChar, 15),
            _executor.In("@FonoOtro", persona.Fax, SqlDbType.VarChar, 15),
            _executor.In("@Mail", persona.Email, SqlDbType.VarChar, 50),
            _executor.In("@UbigeoDireccion", persona.UbigeoDireccion, SqlDbType.Char, 6),
            _executor.In("@idNacionalidad", entidad.IdNacionalidad, SqlDbType.Int),
            _executor.In("@sexo", entidad.Sexo, SqlDbType.Char, 1),
            _executor.In("@idEstCivil", entidad.IdEstadoCivil, SqlDbType.Int),
            _executor.In("@idDiscapacidad", entidad.IdDiscapacidad, SqlDbType.Int),
            _executor.In("@expSocial", entidad.ExpSocial, SqlDbType.VarChar, 20),
            _executor.In("@FechaIngreso", entidad.FechaIngreso, SqlDbType.SmallDateTime),
            _executor.In("@idtiposangre", entidad.IdTipoSangre, SqlDbType.Int),
            _executor.In("@brevete", entidad.Brevete, SqlDbType.VarChar, 12),
            _executor.In("@libmilitar", entidad.NumLibretaMilitar, SqlDbType.VarChar, 10),
            _executor.In("@gradoinstrucc", entidad.GradoInstruccion, SqlDbType.VarChar, 80),
            _executor.In("@numruc", entidad.NumRuc, SqlDbType.VarChar, 12),
            _executor.In("@idtipoTrabajador", entidad.IdTipoTrabajador, SqlDbType.Int),
            new SqlParameter("@Foto", SqlDbType.Image) { Value = (object?)entidad.Foto ?? DBNull.Value },
            nuevoId);

        return Convert.ToInt32(nuevoId.Value, CultureInfo.InvariantCulture);
    }

    public Task ActualizarEmpleadoAsync(EmpleadoFicha empleado, CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_ActualizaEmpleado actualiza Persona y Empleado en un solo procedimiento
        // (joins/actualizaciones cruzadas, no un UPDATE de una tabla).
        var entidad = ToEmpleadoEntity(empleado);
        var persona = ToPersonaEntity(empleado);

        return _executor.ExecuteAsync(
            "spRRHH_ActualizaEmpleado",
            cancellationToken,
            _executor.In("@CodPer", persona.IdPersona, SqlDbType.Int),
            _executor.In("@codEmple", entidad.IdEmpleado, SqlDbType.Int),
            _executor.In("@year", entidad.Year, SqlDbType.Int),
            _executor.In("@idorganiz", entidad.IdAreaOrganiz, SqlDbType.Int),
            _executor.In("@TipoDocIdent", persona.TipoDocId, SqlDbType.Int),
            _executor.In("@NumDoc", persona.NumDocId, SqlDbType.Char, 12),
            _executor.In("@Apellido_Paterno", persona.ApellidoPaterno, SqlDbType.VarChar, 30),
            _executor.In("@Apellido_Materno", persona.ApellidoMaterno, SqlDbType.VarChar, 30),
            _executor.In("@Nombres", persona.Nombres, SqlDbType.VarChar, 100),
            _executor.In("@ubigeoNac", persona.IdUbigeo, SqlDbType.Char, 6),
            _executor.In("@fechaNac", persona.FechaNacimiento, SqlDbType.DateTime),
            _executor.In("@Direccion", persona.Direccion, SqlDbType.VarChar, 100),
            _executor.In("@Fono", persona.Telefono, SqlDbType.VarChar, 15),
            _executor.In("@FonoLab", persona.FonoCentroLab, SqlDbType.VarChar, 15),
            _executor.In("@FonoCel", persona.NumCelular, SqlDbType.VarChar, 15),
            _executor.In("@FonoOtro", persona.Fax, SqlDbType.VarChar, 15),
            _executor.In("@Mail", persona.Email, SqlDbType.VarChar, 50),
            _executor.In("@UbigeoDireccion", persona.UbigeoDireccion, SqlDbType.Char, 6),
            _executor.In("@idNacionalidad", entidad.IdNacionalidad, SqlDbType.Int),
            _executor.In("@sexo", entidad.Sexo, SqlDbType.Char, 1),
            _executor.In("@idEstCivil", entidad.IdEstadoCivil, SqlDbType.Int),
            _executor.In("@idDiscapacidad", entidad.IdDiscapacidad, SqlDbType.Int),
            _executor.In("@expSocial", entidad.ExpSocial, SqlDbType.VarChar, 20),
            _executor.In("@FechaIngreso", entidad.FechaIngreso, SqlDbType.SmallDateTime),
            _executor.In("@idtiposangre", entidad.IdTipoSangre, SqlDbType.Int),
            _executor.In("@brevete", entidad.Brevete, SqlDbType.VarChar, 12),
            _executor.In("@libmilitar", entidad.NumLibretaMilitar, SqlDbType.VarChar, 10),
            _executor.In("@gradoinstrucc", entidad.GradoInstruccion, SqlDbType.VarChar, 80),
            _executor.In("@numruc", entidad.NumRuc, SqlDbType.VarChar, 12),
            _executor.In("@idtipoTrabajador", entidad.IdTipoTrabajador, SqlDbType.Int),
            new SqlParameter("@Foto", SqlDbType.Image) { Value = (object?)entidad.Foto ?? DBNull.Value });
    }

    public async Task<IReadOnlyList<EmpleadoAreaRow>> ListarEmpleadoAreasAsync(int idEmpleado, CancellationToken cancellationToken = default)
    {
        // Regla 1: lectura de Empleado_Area vía navegación many-to-many ya scaffoldeada.
        var empleado = await _context.Empleados
            .AsNoTracking()
            .Include(e => e.EstructOrganizs)
            .FirstOrDefaultAsync(e => e.IdEmpleado == idEmpleado, cancellationToken);

        if (empleado is null)
        {
            return Array.Empty<EmpleadoAreaRow>();
        }

        return empleado.EstructOrganizs
            .Select(area => new EmpleadoAreaRow
            {
                Year = area.Year,
                IdAreaOrganiz = area.IdAreaOrganiz,
                AreaOrganizacional = area.AreaOrganizacional
            })
            .ToList();
    }

    public async Task ActualizarAreaEmpleadoAsync(int idEmpleado, int anio, int idAreaOrganiz, CancellationToken cancellationToken = default)
    {
        // Regla 1: el SP original solo hace UPDATE de Empleado_Area (una tabla).
        // La PK de la tabla puente incluye idAreaOrganiz, así que EF reemplaza la fila del año.
        var empleado = await _context.Empleados
            .Include(e => e.EstructOrganizs)
            .FirstOrDefaultAsync(e => e.IdEmpleado == idEmpleado, cancellationToken)
            ?? throw new InvalidOperationException($"No existe el empleado {idEmpleado}.");

        foreach (var actual in empleado.EstructOrganizs.Where(a => a.Year == anio).ToList())
        {
            empleado.EstructOrganizs.Remove(actual);
        }

        var nueva = await _context.EstructOrganizs.FindAsync(new object[] { anio, idAreaOrganiz }, cancellationToken)
            ?? throw new InvalidOperationException($"No existe el área {idAreaOrganiz} del año {anio}.");

        empleado.EstructOrganizs.Add(nueva);
        await _context.SaveChangesAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<PersonaLookup>> BuscarPersonasAsync(string apellidoPaterno, CancellationToken cancellationToken = default)
    {
        // Regla 1: filtro LIKE sobre Persona.TipoPersona = 'N'.
        var prefijo = apellidoPaterno.Trim();
        return await _context.Personas
            .AsNoTracking()
            .Where(p => p.TipoPersona == "N" && p.ApellidoPaterno != null && p.ApellidoPaterno.StartsWith(prefijo))
            .Select(p => new PersonaLookup
            {
                IdPersona = p.IdPersona,
                ApellidoPaterno = p.ApellidoPaterno,
                ApellidoMaterno = p.ApellidoMaterno,
                Nombres = p.Nombres
            })
            .ToListAsync(cancellationToken);
    }

    private static Empleado ToEmpleadoEntity(EmpleadoFicha ficha)
    {
        return new Empleado
        {
            IdEmpleado = ficha.IdEmpleado ?? 0,
            Year = ficha.Year,
            IdAreaOrganiz = ficha.IdAreaOrganiz,
            IdPersona = ficha.IdPersona,
            IdNacionalidad = ficha.IdNacionalidad,
            Sexo = ficha.Sexo,
            IdEstadoCivil = ficha.IdEstadoCivil,
            IdDiscapacidad = ficha.IdDiscapacidad,
            ExpSocial = ficha.ExpSocial,
            FechaIngreso = ficha.FechaIngreso,
            IdTipoSangre = ficha.IdTipoSangre,
            Brevete = ficha.Brevete,
            NumLibretaMilitar = ficha.LibretaMilitar,
            GradoInstruccion = ficha.GradoInstruccion,
            NumRuc = ficha.NumRuc,
            IdTipoTrabajador = ficha.IdTipoTrabajador,
            Foto = ficha.Foto
        };
    }

    private static Persona ToPersonaEntity(EmpleadoFicha ficha)
    {
        return new Persona
        {
            IdPersona = ficha.IdPersona ?? 0,
            TipoDocId = ficha.TipoDocIdent,
            NumDocId = ficha.NumDoc,
            ApellidoPaterno = ficha.ApellidoPaterno,
            ApellidoMaterno = ficha.ApellidoMaterno,
            Nombres = ficha.Nombres,
            IdUbigeo = ficha.UbigeoNac,
            FechaNacimiento = ficha.FechaNacimiento,
            Direccion = ficha.Direccion,
            Telefono = ficha.Telefono,
            FonoCentroLab = ficha.FonoLab,
            NumCelular = ficha.FonoCel,
            Fax = ficha.FonoOtro,
            Email = ficha.Email,
            UbigeoDireccion = ficha.UbigeoDireccion
        };
    }
}
