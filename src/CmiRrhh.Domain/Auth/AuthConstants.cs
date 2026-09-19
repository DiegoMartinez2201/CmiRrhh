namespace CmiRrhh.Domain.Auth;

public static class AuthConstants
{
    public const string RrhhSistemaId = "0500000";
    public const string IdEmpleadoClaimType = "id_empleado";
    public const string PasswordChangeClaimType = "pwd_change";
    public const int MaxFailedAttempts = 3;
    public const int LockoutMinutes = 15;
    public const int MinPasswordLength = 10;

    public const string AsistenciasPolicy = "Asistencias";
    public const string AsistenciasEscrituraPolicy = "AsistenciasEscritura";
    public const string RolAsistencias = "ASISTENCIAS";
    public const string RolAsistenciasCas = "ASISTENCIAS - CAS";
    public const string RolReportesAsistencias = "REPORTES ASISTENCIAS";
}

