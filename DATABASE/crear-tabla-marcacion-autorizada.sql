-- Crea la tabla MarcacionAutorizada, usada por la nueva pantalla "Marcaciones autorizadas"
-- para guardar el motivo y el documento de referencia (Asistencia no tiene esas columnas).
-- Es una tabla nueva, propia de la app web: no toca ninguna tabla del sistema legado.
-- Seguro de correr más de una vez (no hace nada si la tabla ya existe).

IF OBJECT_ID('dbo.MarcacionAutorizada', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.MarcacionAutorizada
    (
        Id             INT IDENTITY(1,1) NOT NULL,
        IdEmpleado     INT NOT NULL,
        Fecha          DATE NOT NULL,
        Tipo           VARCHAR(10) NOT NULL,   -- 'Entrada' o 'Salida'
        Hora           VARCHAR(8) NOT NULL,
        Motivo         VARCHAR(200) NOT NULL,
        Documento      VARCHAR(100) NOT NULL,
        Usuario        VARCHAR(50) NULL,
        FechaRegistro  DATETIME NOT NULL CONSTRAINT DF_MarcacionAutorizada_FechaRegistro DEFAULT (GETDATE()),
        CONSTRAINT PK_MarcacionAutorizada PRIMARY KEY (Id),
        CONSTRAINT FK_MarcacionAutorizada_Empleado FOREIGN KEY (IdEmpleado)
            REFERENCES dbo.Empleado (IdEmpleado)
    );

    PRINT 'Tabla MarcacionAutorizada creada.';
END
ELSE
BEGIN
    PRINT 'La tabla MarcacionAutorizada ya existe; no se hizo ningún cambio.';
END
