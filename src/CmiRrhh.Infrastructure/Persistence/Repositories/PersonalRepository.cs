using System.Data;
using System.Globalization;
using CmiRrhh.Domain.Interfaces;
using CmiRrhh.Domain.Interfaces.Repositories;
using CmiRrhh.Domain.Models;

namespace CmiRrhh.Infrastructure.Persistence.Repositories;

public sealed class PersonalRepository : IPersonalRepository
{
    private readonly IStoredProcedureExecutor _executor;

    public PersonalRepository(IStoredProcedureExecutor executor)
    {
        _executor = executor;
    }

    public async Task<IReadOnlyList<PersonalRow>> BuscarAsync(
        int? codigo,
        string numDoc,
        string apellido,
        int? idTipoTrabajador,
        bool activo,
        int? anio,
        CancellationToken cancellationToken = default)
    {
        // Regla 2: spRRHH_busca_empleado (definición en script_generado.sql, no cifrado) une una
        // vista, Empleado_Area y EstructOrganiz; @NumdocId y @Apellido_Paterno NO tienen default:
        // hay que enviar '' (nunca NULL) o los predicados "= ''" / LIKE NULL descartan todo.
        // @idRol = 0 => sin restricción por tipo de trabajador (rol 3/4 del legado no aplican aquí).
        var table = await _executor.QueryAsync(
            "spRRHH_busca_empleado",
            cancellationToken,
            _executor.In("@idempleado", codigo, SqlDbType.Int),
            _executor.In("@NumdocId", numDoc ?? string.Empty, SqlDbType.VarChar, 12),
            _executor.In("@Apellido_Paterno", apellido ?? string.Empty, SqlDbType.VarChar, 30),
            _executor.In("@IdTipoTrabajador", idTipoTrabajador, SqlDbType.Int),
            _executor.In("@Anio", anio?.ToString(CultureInfo.InvariantCulture), SqlDbType.Char, 4),
            _executor.In("@idRol", 0, SqlDbType.Int),
            _executor.In("@activo", activo, SqlDbType.Bit));

        var filas = new List<PersonalRow>(table.Rows.Count);
        var vistos = new HashSet<(int Codigo, string Area)>();
        foreach (DataRow row in table.Rows)
        {
            var codigoFila = Convert.ToInt32(row["Codigo"], CultureInfo.InvariantCulture);
            var area = row["AreaOrganizacional"]?.ToString()?.Trim() ?? string.Empty;

            // Sin filtro de año, un empleado reaparece una vez por cada año en Empleado_Area.
            if (!vistos.Add((codigoFila, area)))
            {
                continue;
            }

            filas.Add(new PersonalRow
            {
                IdTipoTrabajador = row["IdTipoTrabajador"] is DBNull
                    ? 0
                    : Convert.ToInt32(row["IdTipoTrabajador"], CultureInfo.InvariantCulture),
                Codigo = codigoFila,
                Dni = row["DNI"]?.ToString()?.Trim() ?? string.Empty,
                NombresCompletos = row["NombresCompletos"]?.ToString()?.Trim() ?? string.Empty,
                AreaOrganizacional = area,
                Cargo = row["cargo"]?.ToString()?.Trim() ?? string.Empty
            });
        }

        return filas;
    }
}
