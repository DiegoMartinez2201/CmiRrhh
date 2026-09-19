namespace CmiRrhh.Domain.Models;

/// <summary>
/// Agrupa los 29 parámetros de Ingresa_Empleado / Actualiza_Empleado.
/// Se completa desde las entidades scaffold <c>Persona</c> + <c>Empleado</c>
/// (los datos de identidad viven en Persona, no en la tabla Empleado).
/// </summary>
public sealed class EmpleadoFicha
{
    public int? IdPersona { get; set; }
    public int? IdEmpleado { get; set; }
    public int Year { get; set; }
    public int IdAreaOrganiz { get; set; }
    public int TipoDocIdent { get; set; }
    public string? NumDoc { get; set; }
    public string? ApellidoPaterno { get; set; }
    public string? ApellidoMaterno { get; set; }
    public string? Nombres { get; set; }
    public string? UbigeoNac { get; set; }
    public DateTime FechaNacimiento { get; set; }
    public string? Direccion { get; set; }
    public string? Telefono { get; set; }
    public string? FonoLab { get; set; }
    public string? FonoCel { get; set; }
    public string? FonoOtro { get; set; }
    public string? Email { get; set; }
    public string? UbigeoDireccion { get; set; }
    public int IdNacionalidad { get; set; }
    public string? Sexo { get; set; }
    public int IdEstadoCivil { get; set; }
    public int IdDiscapacidad { get; set; }
    public string? ExpSocial { get; set; }
    public DateTime FechaIngreso { get; set; }
    public int IdTipoSangre { get; set; }
    public string? Brevete { get; set; }
    public string? LibretaMilitar { get; set; }
    public string? GradoInstruccion { get; set; }
    public string? NumRuc { get; set; }
    public int IdTipoTrabajador { get; set; }
    public byte[]? Foto { get; set; }
}
