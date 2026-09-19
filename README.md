# CMI RRHH — Migración a Web (ASP.NET Core)

Migración del módulo de Recursos Humanos del sistema de escritorio **CMI** (Windows Forms, VB.NET) a una aplicación web en **ASP.NET Core 8 (Razor Pages)**, en arquitectura por capas, manteniendo **SQL Server** como base de datos.

## Stack

- .NET 8 / ASP.NET Core Razor Pages
- Entity Framework Core 8.0.10 (Database First para el esquema legado, Code First solo para `Usuario_Credencial`)
- SQL Server (base `CMI`)

## Arquitectura

```
CmiRrhh.slnx
├── src/
│   ├── CmiRrhh.Domain/          # Interfaces, modelos de dominio (sin dependencias externas)
│   ├── CmiRrhh.Application/     # Casos de uso, servicios (no referencia Infrastructure)
│   ├── CmiRrhh.Infrastructure/  # EF Core, repositorios, entidades scaffolded
│   └── CmiRrhh.Web/             # Razor Pages, Program.cs, appsettings
└── tests/
    └── CmiRrhh.Application.Tests/
```

Regla de dependencia: `Web` → `Application` → `Domain` ← `Infrastructure`. `Application` nunca referencia `Infrastructure` directamente (se inyecta por interfaz).

## Requisitos previos

- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- SQL Server (Express o superior) instalado localmente
- Herramienta `dotnet-ef` (se instala como herramienta local del proyecto, ver abajo)

## Puesta en marcha (primera vez, cada miembro del equipo)

### 1. Obtener la base de datos

La base de datos **no se distribuye por este repositorio** (el `.bak` es un archivo pesado y no es código). Pide el archivo `.bak` de `CMI` al responsable del proyecto por un medio aparte (Drive, USB, etc.) y restáuralo en tu SQL Server local:

```sql
RESTORE DATABASE CMI
FROM DISK = 'C:\ruta\donde\guardaste\CMI.bak'
WITH MOVE 'CMI_Data' TO 'C:\ruta\datos\CMI.mdf',
     MOVE 'CMI_Log'  TO 'C:\ruta\datos\CMI_log.ldf';
```

(Ajusta los nombres lógicos `CMI_Data`/`CMI_Log` según lo que indique tu instalador — si no los conoces, ejecuta primero `RESTORE FILELISTONLY FROM DISK = '...'` para verlos.)

Si no tienes el `.bak` pero sí necesitas reconstruir el **esquema** desde cero, en `database/script_generado.sql` está el script generado a partir de la base original (no incluye datos, y **no incluye los objetos con `WITH ENCRYPTION`** — ver `database/objetos_fallidos.txt` para el detalle de esos 155 objetos).

### 2. Clonar el repositorio

```powershell
git clone git@github.com:DiegoMartinez2201/CmiRrhh.git
cd CmiRrhh
```

### 3. Configurar la cadena de conexión (User Secrets)

La cadena de conexión **no se guarda en Git**. Cada integrante la configura en su máquina con [User Secrets](https://learn.microsoft.com/aspnet/core/security/app-secrets) (solo entorno Development). `appsettings.Development.json.example` es solo una referencia de las claves; no hace falta copiarlo.

```powershell
dotnet user-secrets init --project src/CmiRrhh.Web
dotnet user-secrets set "ConnectionStrings:CMI" "Server=.\SQLEXPRESS;Database=CMI;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=True" --project src/CmiRrhh.Web
```

Sustituye `Server=.\SQLEXPRESS` por la instancia de **tu** máquina si es distinta (por ejemplo `Server=NOMBRE-PC\SQLEXPRESS`). El valor queda fuera del repo (`%APPDATA%\Microsoft\UserSecrets\...`) y en Development se combina automáticamente con `appsettings.json`; `GetConnectionString("CMI")` sigue resolviendo igual, sin cambios en `Program.cs`.

### 4. Restaurar herramientas y paquetes

```powershell
dotnet tool restore
dotnet restore
```

### 5. Aplicar migraciones de EF Core

Solo la tabla `Usuario_Credencial` (autenticación) se maneja con migraciones de EF Core; el resto del esquema viene del `.bak` restaurado en el paso 1.

```powershell
dotnet ef database update --project src/CmiRrhh.Infrastructure --startup-project src/CmiRrhh.Web
```

### 6. Compilar y correr

```powershell
dotnet build CmiRrhh.slnx
dotnet run --project src/CmiRrhh.Web/CmiRrhh.Web.csproj --launch-profile http
```

La app queda disponible en `http://localhost:5242` (o el puerto que indique la consola) y redirige automáticamente a `/Account/Login`.

### 7. Credenciales de prueba (solo entorno Development)

Si la tabla `Usuario_Credencial` está vacía, al iniciar en modo `Development` la app crea una credencial para el **primer usuario activo con rol RRHH** (`IdSistema = 0500000`). En el backup de QA ese login suele ser `user_7`.

- **Contraseña temporal:** `CmiDev#2026` (pide cambiarla en el primer ingreso)
- El login exacto se imprime en la consola al arrancar (`Credencial de desarrollo creada. Login=...`)

## Flujo de trabajo en equipo

- Cada miembro tiene su **propia copia local** de la base `CMI` (restaurada del mismo `.bak`), no una compartida.
- El código y las migraciones de esquema sí se comparten por Git — si alguien agrega una migración nueva, el resto debe correr `dotnet ef database update` tras hacer `git pull`.
- Cambios de esquema en tablas del legado (fuera de `Usuario_Credencial`) se coordinan aparte, ya que ese modelo es Database First (scaffolded), no se edita a mano en `CmiRrhh.Infrastructure/Persistence/Entities`.

## Estructura de la carpeta `database/`

```
database/
├── script_generado.sql       # Script del esquema original (sin objetos cifrados)
└── objetos_fallidos.txt      # Lista de los 155 objetos WITH ENCRYPTION no incluidos
```

## Documentación técnica

La documentación completa (arquitectura, hallazgos, SRP/OCP) se mantiene como documento vivo. Ver `docs/README.md`.

## Rutas disponibles

| Ruta | Descripción | Autorización |
|------|-------------|--------------|
| /Account/Login | Inicio de sesión | Pública |
| / | Inicio (bienvenida, roles) | Cualquier usuario autenticado |
| /Asistencias/Consulta | Consulta de asistencias por rango de fechas | Rol: ASISTENCIAS, ASISTENCIAS - CAS, REPORTES ASISTENCIAS |
| /Asistencias/Correccion | Corrección manual de hora de salida | Rol: ASISTENCIAS, ASISTENCIAS - CAS |
| /Asistencias/ImportarBiometrico | Importación de marcaciones desde biométrico | Rol: ASISTENCIAS, ASISTENCIAS - CAS |
| /Asistencias/Planilla | Planilla de asistencias por tipo/local | Rol: ASISTENCIAS, ASISTENCIAS - CAS, REPORTES ASISTENCIAS |

Consulta y Planilla usan la policy `Asistencias`. Corrección e Importación usan `AsistenciasEscritura` (además de la policy de la carpeta `/Asistencias`).

## Estado del proyecto

- [x] Fase 1 — Scaffold de EF Core (Database First)
- [x] Fase 2 — Autenticación y autorización propias
- [x] Fase 3 — Refactorización SRP/DRY (repositorios por dominio)
- [x] Fase 4 — Refactorización OCP (Strategy Pattern)
- [x] Paso 3 — Migración masiva de credenciales (86 usuarios)
- [x] Fase 7 — DIP (ejecutor de SP inyectable) e ISP (interfaces divididas)
- [x] Fase 5 — Módulo Asistencias (Razor Pages):
  - Consulta de asistencias por rango
  - Corrección manual de salida
  - Importación de marcaciones biométricas
  - Planilla de asistencias (con filtros por tipo de trabajador y locales)
- [ ] Fase 5 (continuación) — Otros módulos: Permisos, Empleados, Horarios
- [ ] Fase 6 — Reportes adicionales
- [ ] Migrar las 4 rutas de importación por archivo Access (backlog, pendiente de confirmar si siguen en uso real)
