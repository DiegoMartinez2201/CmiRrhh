IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Membership_BasicAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Membership_FullAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Membership_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Membership_ReportingAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Personalization_BasicAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Personalization_FullAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Personalization_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Personalization_ReportingAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Profile_BasicAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Profile_FullAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Profile_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Profile_ReportingAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_BasicAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Roles_BasicAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Roles_FullAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_Roles_ReportingAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_Roles_ReportingAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'aspnet_WebEvent_FullAccess')
EXEC sys.sp_executesql N'CREATE SCHEMA [aspnet_WebEvent_FullAccess]'

GO
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'dir')
EXEC sys.sp_executesql N'CREATE SCHEMA [dir]'

GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AFP]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AFP](
	[IdAFP] [int] NOT NULL,
	[DescripAFP] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[DireccAFP] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[TelefAFP] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[NomContAFP] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAFP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AguaViv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AguaViv](
	[IdAgua] [int] NOT NULL,
	[DescripAgua] [varchar](33) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAgua] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlumbradoViv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AlumbradoViv](
	[IdAlumbrado] [int] NOT NULL,
	[DescripAlumbrado] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAlumbrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asis_norm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[asis_norm](
	[Fec_Asi] [datetime] NOT NULL,
	[Hor_Ent] [nchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Hor_Sal] [nchar](8) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[pers_cod] [int] NOT NULL,
	[flag_ent] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[flag_sal] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[alm_sal] [char](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[alm_ent] [char](8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asistencia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Asistencia](
	[Fecha] [datetime] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Hor_Ent] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Hor_Sal] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Alm_Sal] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Alm_Ent] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Flag_Ent] [bit] NULL,
	[Flag_Sal] [bit] NULL,
	[Estado] [bit] NULL,
	[idHorario] [int] NULL,
	[Usuario] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[PC] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC,
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Asistenci__IdEmp__6B7099F3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asistencia]'))
ALTER TABLE [dbo].[Asistencia]  WITH CHECK ADD  CONSTRAINT [FK__Asistenci__IdEmp__6B7099F3] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Asistenci__IdEmp__6B7099F3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Asistencia]'))
ALTER TABLE [dbo].[Asistencia] CHECK CONSTRAINT [FK__Asistenci__IdEmp__6B7099F3]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_aud_asis_norm]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[tr_aud_asis_norm] ON [dbo].[Asistencia]
FOR  UPDATE
AS
SET NOCOUNT ON;

DECLARE @insertado int, @borrado int
SELECT @insertado=count(*) FROM inserted
SELECT @borrado =count(*) FROM deleted

DECLARE @usuario varchar(50), @fecha datetime, @pc varchar(50), @operacion char(1)
SELECT @usuario=suser_sname(), @fecha=getdate(), @pc=host_name()


declare @IdEmpleado int, @FechaAsistencia  datetime, @Hor_Ent char(8), @Hor_Sal char(8), @Hor_Ent_act char(8), @Hor_Sal_act char(8)


IF @insertado>0
BEGIN
	IF @borrado>0 -- Actualización
		BEGIN
			SELECT @operacion=''A''
			SELECT @IdEmpleado = IdEmpleado, @FechaAsistencia = Fecha ,  @Hor_Ent = Hor_Ent, @Hor_Sal= Hor_Sal  from  deleted
			SELECT  @Hor_Ent_act = Hor_Ent, @Hor_Sal_act= Hor_Sal  from  inserted
		
			INSERT Asistencia_aud (Fecha_aud,Usuario,Pc,Operacion,idEmpleado,Fecha_Ant,Hora_Sal_Ant,Hora_Ent_Ant,Hora_Ent_Act,Hora_Sal_Act)  
			values( @fecha  ,  @usuario  ,@pc  , @operacion , @IdEmpleado , @FechaAsistencia,    @Hor_Sal,@Hor_Ent,@Hor_Ent_act,@Hor_Sal_act ) 
		END
	else
		Begin
			SELECT @operacion=''I''
			SELECT @IdEmpleado = IdEmpleado, @FechaAsistencia = Fecha  from  inserted
			
			INSERT Asistencia_aud (Fecha_aud,Usuario,Pc,Operacion,idEmpleado,Fecha_Ant)  
			values( @fecha  ,  @usuario  ,@pc  , @operacion , @IdEmpleado , @FechaAsistencia) 
		End		
END' 
GO
ALTER TABLE [dbo].[Asistencia] ENABLE TRIGGER [tr_aud_asis_norm]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_aud_asis_norm_Insert]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER tr_aud_asis_norm_Insert ON Asistencia
FOR  INSERT
AS
SET NOCOUNT ON;

DECLARE @insertado int
SELECT @insertado=count(*) FROM inserted

DECLARE @usuario varchar(50), @fecha datetime, @pc varchar(50), @operacion char(1)
SELECT @usuario=suser_sname(), @fecha=getdate(), @pc=host_name()


declare @IdEmpleado int, @FechaAsistencia  datetime, @Hor_Ent char(8), @Hor_Sal char(8)

IF @insertado>0
BEGIN
	
			SELECT @operacion=''I''
			SELECT @IdEmpleado = IdEmpleado, @FechaAsistencia = Fecha,  @Hor_Ent = Hor_Ent, @Hor_Sal= Hor_Sal  from  inserted
			
			INSERT Asistencia_aud (Fecha_aud,Usuario,Pc,Operacion,idEmpleado,Fecha_Ant,Hora_Sal_Ant,Hora_Ent_Ant )  
			values( @fecha  ,  @usuario  ,@pc  , @operacion , @IdEmpleado , @FechaAsistencia, @Hor_Sal, @Hor_Ent) 
END' 
GO
ALTER TABLE [dbo].[Asistencia] ENABLE TRIGGER [tr_aud_asis_norm_Insert]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asistencia_Aud]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Asistencia_Aud](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha_aud] [datetime] NULL,
	[Usuario] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Pc] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Operacion] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[idEmpleado] [int] NULL,
	[Fecha_Ant] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Hora_Sal_Ant] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Hora_Ent_Ant] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Hora_Sal_Act] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Hora_Ent_Act] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_Asistencia_Aud] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Applications](
	[ApplicationName] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[LoweredApplicationName] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY NONCLUSTERED 
(
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications]') AND name = N'aspnet_Applications_Index')
CREATE CLUSTERED INDEX [aspnet_Applications_Index] ON [dbo].[aspnet_Applications]
(
	[LoweredApplicationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Ap__Appli__42AE7B82]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Applications] ADD  DEFAULT (newid()) FOR [ApplicationId]
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Membership](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Password] [nvarchar](128) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PasswordFormat] [int] NOT NULL,
	[PasswordSalt] [nvarchar](128) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MobilePIN] [nvarchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[Email] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[LoweredEmail] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[PasswordQuestion] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[PasswordAnswer] [nvarchar](128) COLLATE Modern_Spanish_CI_AS NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NOT NULL,
	[LastPasswordChangedDate] [datetime] NOT NULL,
	[LastLockoutDate] [datetime] NOT NULL,
	[FailedPasswordAttemptCount] [int] NOT NULL,
	[FailedPasswordAttemptWindowStart] [datetime] NOT NULL,
	[FailedPasswordAnswerAttemptCount] [int] NOT NULL,
	[FailedPasswordAnswerAttemptWindowStart] [datetime] NOT NULL,
	[Comment] [ntext] COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]') AND name = N'aspnet_Membership_index')
CREATE CLUSTERED INDEX [aspnet_Membership_index] ON [dbo].[aspnet_Membership]
(
	[ApplicationId] ASC,
	[LoweredEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Me__Passw__57A99868]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Membership] ADD  DEFAULT ((0)) FOR [PasswordFormat]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__Appli__55C14FF6]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Me__UserI__56B5742F]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Membership]'))
ALTER TABLE [dbo].[aspnet_Membership]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Paths](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NOT NULL,
	[Path] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[LoweredPath] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]') AND name = N'aspnet_Paths_index')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Paths_index] ON [dbo].[aspnet_Paths]
(
	[ApplicationId] ASC,
	[LoweredPath] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Pa__PathI__084CCFC3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Paths] ADD  DEFAULT (newid()) FOR [PathId]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pa__Appli__0758AB8A]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Paths]'))
ALTER TABLE [dbo].[aspnet_Paths]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers](
	[PathId] [uniqueidentifier] NOT NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__0D1184E0]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers]'))
ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_PersonalizationPerUser](
	[Id] [uniqueidentifier] NOT NULL,
	[PathId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NULL,
	[PageSettings] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND name = N'aspnet_PersonalizationPerUser_index1')
CREATE UNIQUE CLUSTERED INDEX [aspnet_PersonalizationPerUser_index1] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[PathId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]') AND name = N'aspnet_PersonalizationPerUser_ncindex2')
CREATE UNIQUE NONCLUSTERED INDEX [aspnet_PersonalizationPerUser_ncindex2] ON [dbo].[aspnet_PersonalizationPerUser]
(
	[UserId] ASC,
	[PathId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Perso__Id__0FEDF18B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser] ADD  DEFAULT (newid()) FOR [Id]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__PathI__10E215C4]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([PathId])
REFERENCES [dbo].[aspnet_Paths] ([PathId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pe__UserI__11D639FD]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser]'))
ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Profile](
	[UserId] [uniqueidentifier] NOT NULL,
	[PropertyNames] [ntext] COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PropertyValuesString] [ntext] COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PropertyValuesBinary] [image] NOT NULL,
	[LastUpdatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Pr__UserI__6ABC6CDC]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Profile]'))
ALTER TABLE [dbo].[aspnet_Profile]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Roles](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[RoleName] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[LoweredRoleName] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Description] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]') AND name = N'aspnet_Roles_index1')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Roles_index1] ON [dbo].[aspnet_Roles]
(
	[ApplicationId] ASC,
	[LoweredRoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Ro__RoleI__7539FB4F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Roles] ADD  DEFAULT (newid()) FOR [RoleId]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Ro__Appli__7445D716]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Roles]'))
ALTER TABLE [dbo].[aspnet_Roles]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_SchemaVersions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_SchemaVersions](
	[Feature] [nvarchar](128) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[CompatibleSchemaVersion] [nvarchar](128) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[IsCurrentVersion] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Feature] ASC,
	[CompatibleSchemaVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[LoweredUserName] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MobileAlias] [nvarchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL,
PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND name = N'aspnet_Users_Index')
CREATE UNIQUE CLUSTERED INDEX [aspnet_Users_Index] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LoweredUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users]') AND name = N'aspnet_Users_Index2')
CREATE NONCLUSTERED INDEX [aspnet_Users_Index2] ON [dbo].[aspnet_Users]
(
	[ApplicationId] ASC,
	[LastActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__UserI__467F0C66]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__Mobil__4773309F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__aspnet_Us__IsAno__486754D8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__Appli__458AE82D]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_Users]'))
ALTER TABLE [dbo].[aspnet_Users]  WITH CHECK ADD FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[aspnet_Applications] ([ApplicationId])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_UsersInRoles](
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]') AND name = N'aspnet_UsersInRoles_index')
CREATE NONCLUSTERED INDEX [aspnet_UsersInRoles_index] ON [dbo].[aspnet_UsersInRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__RoleI__790A8C33]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[aspnet_Roles] ([RoleId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__aspnet_Us__UserI__781667FA]') AND parent_object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles]'))
ALTER TABLE [dbo].[aspnet_UsersInRoles]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_WebEvent_Events]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[aspnet_WebEvent_Events](
	[EventId] [char](32) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[EventTimeUtc] [datetime] NOT NULL,
	[EventTime] [datetime] NOT NULL,
	[EventType] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[EventSequence] [decimal](19, 0) NOT NULL,
	[EventOccurrence] [decimal](19, 0) NOT NULL,
	[EventCode] [int] NOT NULL,
	[EventDetailCode] [int] NOT NULL,
	[Message] [nvarchar](1024) COLLATE Modern_Spanish_CI_AS NULL,
	[ApplicationPath] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[ApplicationVirtualPath] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[MachineName] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[RequestUrl] [nvarchar](1024) COLLATE Modern_Spanish_CI_AS NULL,
	[ExceptionType] [nvarchar](256) COLLATE Modern_Spanish_CI_AS NULL,
	[Details] [ntext] COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AuxRRHH_ReporteAsistencia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AuxRRHH_ReporteAsistencia](
	[idEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_AuxRRHH_ReporteAsistencia] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Capacitacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Capacitacion](
	[IdCapacitacion] [int] NOT NULL,
	[NombreCurso] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFin] [datetime] NULL,
	[NumHoras] [varchar](5) COLLATE Modern_Spanish_CI_AS NULL,
	[InstitucionOrganizadora] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
	[IdEmpleado] [int] NULL,
 CONSTRAINT [PK__Capacitaciones__23AA061E] PRIMARY KEY CLUSTERED 
(
	[IdCapacitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Capacitac__IdEmp__6A7C75BA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Capacitacion]'))
ALTER TABLE [dbo].[Capacitacion]  WITH CHECK ADD  CONSTRAINT [FK__Capacitac__IdEmp__6A7C75BA] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Capacitac__IdEmp__6A7C75BA]') AND parent_object_id = OBJECT_ID(N'[dbo].[Capacitacion]'))
ALTER TABLE [dbo].[Capacitacion] CHECK CONSTRAINT [FK__Capacitac__IdEmp__6A7C75BA]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Cargo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Cargo](
	[IdCargo] [int] NOT NULL,
	[Cargo] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Abreviatura] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Comportamiento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Comportamiento](
	[idComportamiento] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[IdEmpleado] [int] NULL,
	[NumResol] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[Titulo] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[Descripcion] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
	[idTipoComportamiento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idComportamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Comportam__IdEmp__68942D48]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comportamiento]'))
ALTER TABLE [dbo].[Comportamiento]  WITH CHECK ADD  CONSTRAINT [FK__Comportam__IdEmp__68942D48] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Comportam__IdEmp__68942D48]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comportamiento]'))
ALTER TABLE [dbo].[Comportamiento] CHECK CONSTRAINT [FK__Comportam__IdEmp__68942D48]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Comportam__idTip__7015537F]') AND parent_object_id = OBJECT_ID(N'[dbo].[Comportamiento]'))
ALTER TABLE [dbo].[Comportamiento]  WITH CHECK ADD FOREIGN KEY([idTipoComportamiento])
REFERENCES [dbo].[TipoComportamiento] ([idTipoComportamiento])
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ConservacionViv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ConservacionViv](
	[IdConservacion] [int] NOT NULL,
	[DescripConserva] [varchar](17) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Dim_Date]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Dim_Date](
	[DateKey] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [tinyint] NOT NULL,
	[Weekday] [tinyint] NOT NULL,
	[WeekDayName] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[WeekDayName_Short] [char](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[WeekDayName_FirstLetter] [char](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekOfMonth] [tinyint] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[Month] [tinyint] NOT NULL,
	[MonthName] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MonthName_Short] [char](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MonthName_FirstLetter] [char](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Year] [int] NOT NULL,
	[MMYYYY] [char](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[MonthYear] [char](7) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[IsWeekend] [bit] NOT NULL,
	[IsHoliday] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Discapacidad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Discapacidad](
	[IdDiscapacidad] [int] NOT NULL,
	[Descrip_Discapacidad] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDiscapacidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[idAreaOrganiz] [int] NOT NULL,
	[IdPersona] [int] NULL,
	[ExpSocial] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaIngreso] [smalldatetime] NULL,
	[IdAFP] [int] NULL,
	[Brevete] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[IdEstadoCivil] [int] NULL,
	[Sexo] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[CtaCorriente] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
	[NroAFP] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaAFP] [datetime] NULL,
	[IdSeguro] [int] NULL,
	[NroSeguro] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[IdTipoSangre] [int] NULL,
	[DecLey] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[Foto] [image] NULL,
	[IdTipoTrabajador] [int] NULL,
	[Estado] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[IdCargo] [int] NULL,
	[IdDiscapacidad] [int] NULL,
	[Profesion] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[JefeHogar] [bit] NULL,
	[CargaFam] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[NumHijos] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[IdViveCon] [int] NULL,
	[ObsFam] [nvarchar](500) COLLATE Modern_Spanish_CI_AS NULL,
	[AspecSalud] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[AspecEducacion] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[AspecRecreacion] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[AspecPsico] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[AspecSocial] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[DiagnosSocial] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[IdNacionalidad] [int] NULL,
	[NumLibretaMilitar] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[GradoInstruccion] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[IdRegimenPen] [int] NULL,
	[NumRUC] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
	[NumAutogenSalud] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[NumResolCese] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaResolCese] [datetime] NULL,
	[NumResol20530] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaResol20530] [datetime] NULL,
	[NumResolPenMen] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaResolPenMen] [datetime] NULL,
	[NumResoIngreEsta] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaIngreEstado] [datetime] NULL,
	[FechaResolIngreEsta] [datetime] NULL,
	[NumResoIngreInstitu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaResoIngreInstitu] [datetime] NULL,
	[idHorario] [int] NULL,
	[Userid] [uniqueidentifier] NULL,
	[idLocal] [int] NULL,
 CONSTRAINT [PK__Empleado__4B03CA61] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND name = N'IDX_idPersona')
CREATE NONCLUSTERED INDEX [IDX_idPersona] ON [dbo].[Empleado]
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__5A460DF1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__5A460DF1] FOREIGN KEY([Year], [idAreaOrganiz])
REFERENCES [dbo].[EstructOrganiz] ([Year], [idAreaOrganiz])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__5A460DF1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__5A460DF1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdAFP__5769A146]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__IdAFP__5769A146] FOREIGN KEY([IdAFP])
REFERENCES [dbo].[AFP] ([IdAFP])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdAFP__5769A146]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__IdAFP__5769A146]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdCarg__52A4EC29]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__IdCarg__52A4EC29] FOREIGN KEY([IdCargo])
REFERENCES [dbo].[Cargo] ([IdCargo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdCarg__52A4EC29]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__IdCarg__52A4EC29]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdDisc__51B0C7F0]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__IdDisc__51B0C7F0] FOREIGN KEY([IdDiscapacidad])
REFERENCES [dbo].[Discapacidad] ([IdDiscapacidad])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdDisc__51B0C7F0]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__IdDisc__51B0C7F0]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdEsta__56757D0D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__IdEsta__56757D0D] FOREIGN KEY([IdEstadoCivil])
REFERENCES [dbo].[EstadoCivil] ([IdEstadoCivil])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdEsta__56757D0D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__IdEsta__56757D0D]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__idHora__4DE0370C]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__idHora__4DE0370C] FOREIGN KEY([idHorario])
REFERENCES [dbo].[Horario] ([idHorario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__idHora__4DE0370C]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__idHora__4DE0370C]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdNaci__4FC87F7E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__IdNaci__4FC87F7E] FOREIGN KEY([IdNacionalidad])
REFERENCES [dbo].[Nacionalidad] ([IdNacionalidad])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdNaci__4FC87F7E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__IdNaci__4FC87F7E]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdPers__585DC57F]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__IdPers__585DC57F] FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdPers__585DC57F]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__IdPers__585DC57F]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdRegi__4ED45B45]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__IdRegi__4ED45B45] FOREIGN KEY([IdRegimenPen])
REFERENCES [dbo].[RegimenPension] ([IdRegimenPen])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdRegi__4ED45B45]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__IdRegi__4ED45B45]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdTipo__53991062]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__IdTipo__53991062] FOREIGN KEY([IdTipoTrabajador])
REFERENCES [dbo].[TipoTrabajador] ([IdTipoTrabajador])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdTipo__53991062]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__IdTipo__53991062]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdTipo__548D349B]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__IdTipo__548D349B] FOREIGN KEY([IdTipoSangre])
REFERENCES [dbo].[TipoSangre] ([IdTipoSangre])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdTipo__548D349B]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__IdTipo__548D349B]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdVive__50BCA3B7]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK__Empleado__IdVive__50BCA3B7] FOREIGN KEY([IdViveCon])
REFERENCES [dbo].[ViveCon] ([IdViveCon])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado__IdVive__50BCA3B7]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK__Empleado__IdVive__50BCA3B7]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_aspnet_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_aspnet_Users] FOREIGN KEY([Userid])
REFERENCES [dbo].[aspnet_Users] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_aspnet_Users]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_aspnet_Users]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Local]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado]  WITH CHECK ADD  CONSTRAINT [FK_Empleado_Local] FOREIGN KEY([idLocal])
REFERENCES [dbo].[Local] ([idLocal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Empleado_Local]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado]'))
ALTER TABLE [dbo].[Empleado] CHECK CONSTRAINT [FK_Empleado_Local]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado_Area]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleado_Area](
	[Year] [int] NOT NULL,
	[idAreaOrganiz] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Year] ASC,
	[idAreaOrganiz] ASC,
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado___IdEmp__5087998D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado_Area]'))
ALTER TABLE [dbo].[Empleado_Area]  WITH CHECK ADD FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Empleado_Area__517BBDC6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Empleado_Area]'))
ALTER TABLE [dbo].[Empleado_Area]  WITH CHECK ADD FOREIGN KEY([Year], [idAreaOrganiz])
REFERENCES [dbo].[EstructOrganiz] ([Year], [idAreaOrganiz])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstadoCivil]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EstadoCivil](
	[IdEstadoCivil] [int] NOT NULL,
	[DescripEstCivil] [varchar](11) COLLATE Modern_Spanish_CI_AS NULL,
	[AbrevEstCiv] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK__EstadoCivil__564A9484] PRIMARY KEY CLUSTERED 
(
	[IdEstadoCivil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstadoEstudio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EstadoEstudio](
	[IdEstadoEstudio] [int] NOT NULL,
	[DescripEstadoEstudio] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstadoEstudio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstructOrganiz]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EstructOrganiz](
	[Year] [int] NOT NULL,
	[idAreaOrganiz] [int] NOT NULL,
	[AreaOrganizacional] [varchar](200) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Abrev] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Sigla] [varchar](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[PresupAnual] [decimal](11, 2) NULL,
	[PromedMensSueld] [decimal](11, 2) NULL,
	[NroTrabajaUO] [int] NULL,
	[Mision] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[Vision] [varchar](1000) COLLATE Modern_Spanish_CI_AS NULL,
	[IdPresupuesto] [int] NULL,
	[YearDe] [int] NULL,
	[idDependeDe] [int] NULL,
	[IdEmpleado] [int] NULL,
	[InversPublic] [decimal](11, 2) NULL,
	[ApruebaPedido] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[MontoAprobacion] [decimal](18, 2) NULL,
	[PresupCompra] [decimal](11, 2) NULL,
	[PresupUtilizado] [decimal](11, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Year] ASC,
	[idAreaOrganiz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__EstructOrganiz__76184598]') AND parent_object_id = OBJECT_ID(N'[dbo].[EstructOrganiz]'))
ALTER TABLE [dbo].[EstructOrganiz]  WITH CHECK ADD FOREIGN KEY([YearDe], [idDependeDe])
REFERENCES [dbo].[EstructOrganiz] ([Year], [idAreaOrganiz])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EstudiosRealizado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EstudiosRealizado](
	[IdTipoEstudios] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Correlativo] [int] NOT NULL,
	[CentroEstudios] [varchar](150) COLLATE Modern_Spanish_CI_AS NULL,
	[AñoInicio] [datetime] NULL,
	[Especialidad] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[AñoTermino] [datetime] NULL,
	[IdEstadoEstudio] [int] NULL,
 CONSTRAINT [PK__EstudiosRealizad__2B4B27E6] PRIMARY KEY CLUSTERED 
(
	[IdTipoEstudios] ASC,
	[IdEmpleado] ASC,
	[Correlativo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EstudiosRealizado_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[EstudiosRealizado]'))
ALTER TABLE [dbo].[EstudiosRealizado]  WITH CHECK ADD  CONSTRAINT [FK_EstudiosRealizado_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EstudiosRealizado_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[EstudiosRealizado]'))
ALTER TABLE [dbo].[EstudiosRealizado] CHECK CONSTRAINT [FK_EstudiosRealizado_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EstudiosRealizado_EstadoEstudio]') AND parent_object_id = OBJECT_ID(N'[dbo].[EstudiosRealizado]'))
ALTER TABLE [dbo].[EstudiosRealizado]  WITH CHECK ADD  CONSTRAINT [FK_EstudiosRealizado_EstadoEstudio] FOREIGN KEY([IdEstadoEstudio])
REFERENCES [dbo].[EstadoEstudio] ([IdEstadoEstudio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EstudiosRealizado_EstadoEstudio]') AND parent_object_id = OBJECT_ID(N'[dbo].[EstudiosRealizado]'))
ALTER TABLE [dbo].[EstudiosRealizado] CHECK CONSTRAINT [FK_EstudiosRealizado_EstadoEstudio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EstudiosRealizado_TipoEstudio]') AND parent_object_id = OBJECT_ID(N'[dbo].[EstudiosRealizado]'))
ALTER TABLE [dbo].[EstudiosRealizado]  WITH CHECK ADD  CONSTRAINT [FK_EstudiosRealizado_TipoEstudio] FOREIGN KEY([IdTipoEstudios])
REFERENCES [dbo].[TipoEstudio] ([IdTipoEstudios])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EstudiosRealizado_TipoEstudio]') AND parent_object_id = OBJECT_ID(N'[dbo].[EstudiosRealizado]'))
ALTER TABLE [dbo].[EstudiosRealizado] CHECK CONSTRAINT [FK_EstudiosRealizado_TipoEstudio]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExcretasViv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ExcretasViv](
	[IdExcretas] [int] NOT NULL,
	[DescripExcretas] [varchar](33) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdExcretas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ExpLaboral]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ExpLaboral](
	[IdEmpleado] [int] NOT NULL,
	[IdExpLab] [int] NOT NULL,
	[NomInstitucion] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[Cargo] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaIngreso] [datetime] NULL,
	[FechaEgreso] [datetime] NULL,
	[UnidadOrganica] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[IdTipoInstitucion] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC,
	[IdExpLab] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ExpLabora__IdEmp__65B7C09D]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExpLaboral]'))
ALTER TABLE [dbo].[ExpLaboral]  WITH CHECK ADD  CONSTRAINT [FK__ExpLabora__IdEmp__65B7C09D] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__ExpLabora__IdEmp__65B7C09D]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExpLaboral]'))
ALTER TABLE [dbo].[ExpLaboral] CHECK CONSTRAINT [FK__ExpLabora__IdEmp__65B7C09D]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExpLaboral_TipoInstitucion]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExpLaboral]'))
ALTER TABLE [dbo].[ExpLaboral]  WITH CHECK ADD  CONSTRAINT [FK_ExpLaboral_TipoInstitucion] FOREIGN KEY([IdTipoInstitucion])
REFERENCES [dbo].[TipoInstitucion] ([IdTipoInstitucion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ExpLaboral_TipoInstitucion]') AND parent_object_id = OBJECT_ID(N'[dbo].[ExpLaboral]'))
ALTER TABLE [dbo].[ExpLaboral] CHECK CONSTRAINT [FK_ExpLaboral_TipoInstitucion]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Familia](
	[IdFamilia] [char](4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](140) COLLATE Modern_Spanish_CI_AS NULL,
	[Observaciones] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[IdClase] [char](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[IdGrupo] [char](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK__Familia__6E0C4425] PRIMARY KEY CLUSTERED 
(
	[IdFamilia] ASC,
	[IdClase] ASC,
	[IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Familiar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Familiar](
	[IdEmpleado] [int] NOT NULL,
	[IdPersona] [int] NOT NULL,
	[FamSexo] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[FamLugTrab] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[IdEstadoCivil] [int] NULL,
	[NumAutogenSalud] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[FamOcupacion] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[FamGradoInstruc] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[IdTipoFam] [int] NULL,
	[ViveCasa] [bit] NULL,
	[LaboraInstitucion] [bit] NULL,
	[IdDiscapacidad] [int] NULL,
	[Procedencia] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Enfermedad] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[TiempoEnfermedad] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[IdTipoSangre] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC,
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Familiar__IdDisc__1511CE04]') AND parent_object_id = OBJECT_ID(N'[dbo].[Familiar]'))
ALTER TABLE [dbo].[Familiar]  WITH CHECK ADD FOREIGN KEY([IdDiscapacidad])
REFERENCES [dbo].[Discapacidad] ([IdDiscapacidad])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Familiar__IdEmpl__64C39C64]') AND parent_object_id = OBJECT_ID(N'[dbo].[Familiar]'))
ALTER TABLE [dbo].[Familiar]  WITH CHECK ADD  CONSTRAINT [FK__Familiar__IdEmpl__64C39C64] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Familiar__IdEmpl__64C39C64]') AND parent_object_id = OBJECT_ID(N'[dbo].[Familiar]'))
ALTER TABLE [dbo].[Familiar] CHECK CONSTRAINT [FK__Familiar__IdEmpl__64C39C64]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Familiar__IdEsta__16FA1676]') AND parent_object_id = OBJECT_ID(N'[dbo].[Familiar]'))
ALTER TABLE [dbo].[Familiar]  WITH CHECK ADD FOREIGN KEY([IdEstadoCivil])
REFERENCES [dbo].[EstadoCivil] ([IdEstadoCivil])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Familiar__IdPers__17EE3AAF]') AND parent_object_id = OBJECT_ID(N'[dbo].[Familiar]'))
ALTER TABLE [dbo].[Familiar]  WITH CHECK ADD FOREIGN KEY([IdPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Familiar__IdTipo__141DA9CB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Familiar]'))
ALTER TABLE [dbo].[Familiar]  WITH CHECK ADD FOREIGN KEY([IdTipoSangre])
REFERENCES [dbo].[TipoSangre] ([IdTipoSangre])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Familiar__IdTipo__1605F23D]') AND parent_object_id = OBJECT_ID(N'[dbo].[Familiar]'))
ALTER TABLE [dbo].[Familiar]  WITH CHECK ADD FOREIGN KEY([IdTipoFam])
REFERENCES [dbo].[TipoFamiliar] ([IdTipoFam])
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Horario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Horario](
	[idHorario] [int] NOT NULL,
	[Ingreso1] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Salida1] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Ingreso2] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Salida2] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Descrip_Horario] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [bit] NULL,
	[SgtDia] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HorarioTemporal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HorarioTemporal](
	[idEmpleado] [int] NOT NULL,
	[N] [int] NOT NULL,
	[FechaInicio] [date] NULL,
	[FechaFin] [date] NULL,
	[HorarioAsignado] [int] NULL,
	[NroDocumento] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Sisgedo] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaRegistro] [datetime] NULL,
 CONSTRAINT [PK_HorarioTemporal] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC,
	[N] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_HorarioTemporal_FechaRegistro]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HorarioTemporal] ADD  CONSTRAINT [DF_HorarioTemporal_FechaRegistro]  DEFAULT (getdate()) FOR [FechaRegistro]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorarioTemporal_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[HorarioTemporal]'))
ALTER TABLE [dbo].[HorarioTemporal]  WITH CHECK ADD  CONSTRAINT [FK_HorarioTemporal_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorarioTemporal_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[HorarioTemporal]'))
ALTER TABLE [dbo].[HorarioTemporal] CHECK CONSTRAINT [FK_HorarioTemporal_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorarioTemporal_Horario]') AND parent_object_id = OBJECT_ID(N'[dbo].[HorarioTemporal]'))
ALTER TABLE [dbo].[HorarioTemporal]  WITH CHECK ADD  CONSTRAINT [FK_HorarioTemporal_Horario] FOREIGN KEY([HorarioAsignado])
REFERENCES [dbo].[Horario] ([idHorario])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HorarioTemporal_Horario]') AND parent_object_id = OBJECT_ID(N'[dbo].[HorarioTemporal]'))
ALTER TABLE [dbo].[HorarioTemporal] CHECK CONSTRAINT [FK_HorarioTemporal_Horario]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_update_HorarioTemporal]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER trg_update_HorarioTemporal
   ON [dbo].[HorarioTemporal]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE [dbo].[HorarioTemporal]
	SET [FechaRegistro] = GETDATE()
	 WHERE EXISTS
  (SELECT '''' FROM inserted
  WHERE [dbo].[HorarioTemporal].idEmpleado = inserted.idEmpleado
    AND [dbo].[HorarioTemporal].N = inserted.N)
END
' 
GO
ALTER TABLE [dbo].[HorarioTemporal] ENABLE TRIGGER [trg_update_HorarioTemporal]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Inconveniente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Inconveniente](
	[IdObjetivo] [int] NOT NULL,
	[Id_Actividad] [int] NOT NULL,
	[IdInconveniente] [int] NOT NULL,
	[Inconveniente] [varchar](70) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Importancia] [int] NOT NULL,
	[Desventaja] [varchar](70) COLLATE Modern_Spanish_CI_AS NULL,
	[Observacion] [varchar](300) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdObjetivo] ASC,
	[Id_Actividad] ASC,
	[IdInconveniente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Institucion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Institucion](
	[IdInstitucion] [int] NOT NULL,
	[Descripcion] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
	[Direccion] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK__Institucion__666B225D] PRIMARY KEY CLUSTERED 
(
	[IdInstitucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Limitacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Limitacion](
	[IdLimitacion] [int] NOT NULL,
	[Descripcion] [varchar](500) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLimitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tD_Limitacion]'))
EXEC dbo.sp_executesql @statement = N'create trigger tD_Limitacion on Limitacion for DELETE as
/* ERwin Builtin Thu Apr 10 13:25:35 2008 */
/* DELETE trigger on Limitacion */
begin
  declare  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Thu Apr 10 13:25:35 2008 */
    /* Limitacion R/206 Recomendacion ON PARENT DELETE SET NULL */
    update Recomendacion
      set
        /* Recomendacion.IdLimitacion = NULL */
        Recomendacion.IdLimitacion = NULL
      from Recomendacion,deleted
      where
        /* Recomendacion.IdLimitacion = deleted.IdLimitacion */
        Recomendacion.IdLimitacion = deleted.IdLimitacion


    /* ERwin Builtin Thu Apr 10 13:25:35 2008 */
    return
error:
    raiserror @errno @errmsg
    rollback transaction
end' 
GO
ALTER TABLE [dbo].[Limitacion] ENABLE TRIGGER [tD_Limitacion]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tU_Limitacion]'))
EXEC dbo.sp_executesql @statement = N'create trigger tU_Limitacion on Limitacion for UPDATE as
/* ERwin Builtin Thu Apr 10 13:25:35 2008 */
/* UPDATE trigger on Limitacion */
begin
  declare  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insIdLimitacion int,
           @errno   int,
           @errmsg  varchar(255)

  select @numrows = @@rowcount
  /* ERwin Builtin Thu Apr 10 13:25:35 2008 */
  /* Limitacion R/206 Recomendacion ON PARENT UPDATE SET NULL */
  if
    /* update(IdLimitacion) */
    update(IdLimitacion)
  begin
    update Recomendacion
      set
        /* Recomendacion.IdLimitacion = NULL */
        Recomendacion.IdLimitacion = NULL
      from Recomendacion,deleted
      where
        /* Recomendacion.IdLimitacion = deleted.IdLimitacion */
        Recomendacion.IdLimitacion = deleted.IdLimitacion
  end


  /* ERwin Builtin Thu Apr 10 13:25:35 2008 */
  return
error:
    raiserror @errno @errmsg
    rollback transaction
end' 
GO
ALTER TABLE [dbo].[Limitacion] ENABLE TRIGGER [tU_Limitacion]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Local]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Local](
	[idLocal] [int] NOT NULL,
	[NombreLocal] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [bit] NULL,
 CONSTRAINT [PK_Local] PRIMARY KEY CLUSTERED 
(
	[idLocal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Marcacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Marcacion](
	[Fecha] [datetime] NOT NULL,
	[Estado] [char](2) COLLATE Modern_Spanish_CI_AS NULL,
	[IdEmpleado] [int] NOT NULL,
	[Lugar] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
	[idHorario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC,
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Marcacion__IdEmp__70354F10]') AND parent_object_id = OBJECT_ID(N'[dbo].[Marcacion]'))
ALTER TABLE [dbo].[Marcacion]  WITH CHECK ADD  CONSTRAINT [FK__Marcacion__IdEmp__70354F10] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Marcacion__IdEmp__70354F10]') AND parent_object_id = OBJECT_ID(N'[dbo].[Marcacion]'))
ALTER TABLE [dbo].[Marcacion] CHECK CONSTRAINT [FK__Marcacion__IdEmp__70354F10]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[marcaciones]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[marcaciones](
	[Fecha] [datetime] NOT NULL,
	[Valor] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Estado] [char](2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Proceso] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MaterialViv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MaterialViv](
	[IdMaterial] [int] NOT NULL,
	[DescripMaterial] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Motivo_Perm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Motivo_Perm](
	[idMotivo] [int] NOT NULL,
	[Descrip_Motivo] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Salario] [bit] NULL,
	[idTipoPermiso] [int] NULL,
	[Abrev] [char](3) COLLATE Modern_Spanish_CI_AS NULL,
	[TipoModalidad] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[Activo] [bit] NULL,
 CONSTRAINT [PK__Motivo_Perm__37F0F5ED] PRIMARY KEY CLUSTERED 
(
	[idMotivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Motivo_Pe__idTip__3CB5AB0A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Motivo_Perm]'))
ALTER TABLE [dbo].[Motivo_Perm]  WITH CHECK ADD  CONSTRAINT [FK__Motivo_Pe__idTip__3CB5AB0A] FOREIGN KEY([idTipoPermiso])
REFERENCES [dbo].[TipoPermiso] ([idTipoPermiso])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Motivo_Pe__idTip__3CB5AB0A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Motivo_Perm]'))
ALTER TABLE [dbo].[Motivo_Perm] CHECK CONSTRAINT [FK__Motivo_Pe__idTip__3CB5AB0A]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MotivoBaja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MotivoBaja](
	[idMotivoBaja] [int] NOT NULL,
	[Descripcion] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_MotivoBaja] PRIMARY KEY CLUSTERED 
(
	[idMotivoBaja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Nacionalidad]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Nacionalidad](
	[IdNacionalidad] [int] NOT NULL,
	[Descripcion] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Abreviatura] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNacionalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PeriodoLaboral]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PeriodoLaboral](
	[IdEmpleado] [int] NOT NULL,
	[NroPeriodo] [int] NOT NULL,
	[NumResoIngreInstitu] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaSalida] [smalldatetime] NULL,
	[FechaResoIngreInstitu] [datetime] NULL,
	[FechaIngreso] [smalldatetime] NULL,
	[Judicial] [bit] NULL,
	[Obs] [varchar](2000) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK__PeriodoLaboral__37BBEBC3] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC,
	[NroPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PeriodoLa__IdEmp__38B00FFC]') AND parent_object_id = OBJECT_ID(N'[dbo].[PeriodoLaboral]'))
ALTER TABLE [dbo].[PeriodoLaboral]  WITH CHECK ADD  CONSTRAINT [FK__PeriodoLa__IdEmp__38B00FFC] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__PeriodoLa__IdEmp__38B00FFC]') AND parent_object_id = OBJECT_ID(N'[dbo].[PeriodoLaboral]'))
ALTER TABLE [dbo].[PeriodoLaboral] CHECK CONSTRAINT [FK__PeriodoLa__IdEmp__38B00FFC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Permiso](
	[IdEmpleado] [int] NOT NULL,
	[NPermiso] [int] NOT NULL,
	[FechaInicio] [datetime] NULL,
	[FechaFin] [datetime] NULL,
	[Hora_Sal] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Hora_Ret] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[Dia] [bit] NULL,
	[Retorno] [bit] NULL,
	[idMotivo] [int] NULL,
	[Lugar] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Referencia] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[Autorizacion] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Obs] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[AutorizacionRRHH] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Autorizado] [bit] NULL,
 CONSTRAINT [PK__Permiso__58B2CB3A] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC,
	[NPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Permiso__IdEmple__5A9B13AC]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permiso]'))
ALTER TABLE [dbo].[Permiso]  WITH CHECK ADD  CONSTRAINT [FK__Permiso__IdEmple__5A9B13AC] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Permiso__IdEmple__5A9B13AC]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permiso]'))
ALTER TABLE [dbo].[Permiso] CHECK CONSTRAINT [FK__Permiso__IdEmple__5A9B13AC]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Permiso__idMotiv__59A6EF73]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permiso]'))
ALTER TABLE [dbo].[Permiso]  WITH CHECK ADD  CONSTRAINT [FK__Permiso__idMotiv__59A6EF73] FOREIGN KEY([idMotivo])
REFERENCES [dbo].[Motivo_Perm] ([idMotivo])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Permiso__idMotiv__59A6EF73]') AND parent_object_id = OBJECT_ID(N'[dbo].[Permiso]'))
ALTER TABLE [dbo].[Permiso] CHECK CONSTRAINT [FK__Permiso__idMotiv__59A6EF73]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_aud_permiso]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER tr_aud_permiso ON Permiso
FOR  UPDATE
AS
SET NOCOUNT ON;

DECLARE @insertado int, @borrado int
SELECT @insertado=count(*) FROM inserted
SELECT @borrado =count(*) FROM deleted

DECLARE @usuario varchar(50), @fecha datetime, @pc varchar(50), @operacion char(1)
SELECT @usuario=suser_sname(), @fecha=getdate(), @pc=host_name()


declare @IdEmpleado int, @FechaAsistencia  datetime, @Hor_Ent char(8), @Hor_Sal char(8), @Hor_Ent_act char(8), @Hor_Sal_act char(8)

declare 
@NPermiso int,
@FechaInicio datetime, 
@FechaFin datetime,
@idMotivo int,
@Referencia varchar(150),
@Autorizacion varchar(150),
@Obs varchar(150),
@FechaInicio_Act datetime, 
@FechaFin_Act datetime,
@idMotivo_Act int,
@Referencia_Act varchar(150),
@Autorizacion_Act varchar(150),
@Obs_Act varchar(150)

IF @insertado>0
BEGIN
	IF @borrado>0 -- Actualización
		BEGIN
			SELECT @operacion=''A''
			SELECT @IdEmpleado=IdEmpleado, @NPermiso=NPermiso, @FechaInicio=FechaInicio, @FechaFin=FechaFin,@idMotivo=idMotivo ,@Referencia=Referencia,
@Autorizacion=Autorizacion ,@Obs=Obs from deleted

			SELECT  @FechaInicio_Act=FechaInicio, @FechaFin_Act=FechaFin,@idMotivo_Act=idMotivo ,@Referencia_Act=Referencia,
@Autorizacion_Act=Autorizacion ,@Obs_Act=Obs  from  inserted
		
			INSERT Permiso_Aud(fecha_aud, Usuario, Pc, operacion,idEmpleado,NPermiso,FechaInicio_Ant,FechaFin_Ant, idMotivo_Ant, Referencia_Ant,Autorizacion_Ant, Obs_Ant, FechaInicio_Act,FechaFin_Act,idMotivo_Act,Referencia_Act,Autorizacion_Act, Obs_Act)  
			values( @fecha, @usuario,@pc,@operacion,@IdEmpleado,@NPermiso,@FechaInicio,@FechaFin,@idMotivo,@Referencia,@Autorizacion, @Obs, @FechaInicio_Act,@FechaFin_Act, @idMotivo_Act, @Referencia_Act, @Autorizacion_Act, @Obs_Act ) 
		END
	
END' 
GO
ALTER TABLE [dbo].[Permiso] ENABLE TRIGGER [tr_aud_permiso]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_aud_permiso_Insert]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER tr_aud_permiso_Insert ON Permiso
FOR  INSERT
AS
SET NOCOUNT ON;

DECLARE @insertado int
SELECT @insertado=count(*) FROM inserted

DECLARE @usuario varchar(50), @fecha datetime, @pc varchar(50), @operacion char(1)
SELECT @usuario=suser_sname(), @fecha=getdate(), @pc=host_name()


declare @IdEmpleado int, 
@NPermiso int,
@FechaInicio datetime, 
@FechaFin datetime,
@idMotivo int,
@Referencia varchar(150),
@Autorizacion varchar(150),
@Obs varchar(150)

IF @insertado>0
BEGIN
	
			SELECT @operacion=''I''
			
			SELECT @IdEmpleado=IdEmpleado, @NPermiso=NPermiso, @FechaInicio=FechaInicio, @FechaFin=FechaFin,@idMotivo=idMotivo ,@Referencia=Referencia,
@Autorizacion=Autorizacion ,@Obs=Obs from inserted
			
			INSERT Permiso_Aud(fecha_aud, Usuario, Pc, operacion,idEmpleado,NPermiso,FechaInicio_Act,FechaFin_Act,idMotivo_Act,Referencia_Act,Autorizacion_Act, Obs_Act)  
			values( @fecha, @usuario,@pc,@operacion,@IdEmpleado,@NPermiso,@FechaInicio,@FechaFin,@idMotivo,@Referencia,@Autorizacion, @Obs) 
END' 
GO
ALTER TABLE [dbo].[Permiso] ENABLE TRIGGER [tr_aud_permiso_Insert]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permiso_Aud]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Permiso_Aud](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha_aud] [datetime] NULL,
	[Usuario] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Pc] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[operacion] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[idEmpleado] [int] NULL,
	[NPermiso] [int] NULL,
	[FechaInicio_Ant] [datetime] NULL,
	[FechaFin_Ant] [datetime] NULL,
	[idMotivo_Ant] [int] NULL,
	[Referencia_Ant] [nvarchar](150) COLLATE Modern_Spanish_CI_AS NULL,
	[Autorizacion_Ant] [nvarchar](150) COLLATE Modern_Spanish_CI_AS NULL,
	[Obs_Ant] [nvarchar](150) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaInicio_Act] [datetime] NULL,
	[FechaFin_Act] [datetime] NULL,
	[idMotivo_Act] [int] NULL,
	[Referencia_Act] [nvarchar](150) COLLATE Modern_Spanish_CI_AS NULL,
	[Autorizacion_Act] [nvarchar](150) COLLATE Modern_Spanish_CI_AS NULL,
	[Obs_Act] [nvarchar](150) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_Permiso_Aud] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persona]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Persona](
	[IdPersona] [int] NOT NULL,
	[Nombres] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[Apellido_Paterno] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[Apellido_Materno] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[TipoDocID] [int] NULL,
	[NumDocID] [char](12) COLLATE Modern_Spanish_CI_AS NULL,
	[Direccion] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[Telefono] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[Fax] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[Email] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[IdUbigeo] [char](6) COLLATE Modern_Spanish_CI_AS NULL,
	[UbigeoDireccion] [char](6) COLLATE Modern_Spanish_CI_AS NULL,
	[TipoPersona] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaNacimiento] [datetime] NULL,
	[FechaRegistro] [datetime] NULL,
	[NumCelular] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
	[FonoCentroLab] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK__Persona__2EC6B30F] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Persona]') AND name = N'IX_Nombre')
CREATE NONCLUSTERED INDEX [IX_Nombre] ON [dbo].[Persona]
(
	[Apellido_Paterno] ASC,
	[Apellido_Materno] ASC,
	[Nombres] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Persona]') AND name = N'IX_NumDocId')
CREATE NONCLUSTERED INDEX [IX_NumDocId] ON [dbo].[Persona]
(
	[NumDocID] ASC,
	[TipoDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RegAsisDiario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RegAsisDiario](
	[Fecha] [datetime] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[MinNormales] [varchar](4) COLLATE Modern_Spanish_CI_AS NULL,
	[MinTarde] [varchar](18) COLLATE Modern_Spanish_CI_AS NULL,
	[Estado] [varchar](3) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK__RegAsisDiario__4362A899] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC,
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[RegAsisDiario]') AND name = N'Indice')
CREATE NONCLUSTERED INDEX [Indice] ON [dbo].[RegAsisDiario]
(
	[Fecha] ASC,
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RegimenPension]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RegimenPension](
	[IdRegimenPen] [int] NOT NULL,
	[LeyRegimen] [varchar](5) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRegimenPen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Reporte_Asistencias]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Reporte_Asistencias](
	[Fecha] [datetime] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Estado] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[Mt] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Reporte_Asistencias] PRIMARY KEY CLUSTERED 
(
	[Fecha] ASC,
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resolucion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Resolucion](
	[idEmpleado] [int] NOT NULL,
	[idResolucion] [int] NOT NULL,
	[idTipoResolucion] [int] NULL,
	[FechaResolucion] [date] NULL,
	[NumeroResolucion] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_Resolucion] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC,
	[idResolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Resolucion_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Resolucion]'))
ALTER TABLE [dbo].[Resolucion]  WITH CHECK ADD  CONSTRAINT [FK_Resolucion_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Resolucion_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Resolucion]'))
ALTER TABLE [dbo].[Resolucion] CHECK CONSTRAINT [FK_Resolucion_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Resolucion_TipoResolucion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Resolucion]'))
ALTER TABLE [dbo].[Resolucion]  WITH CHECK ADD  CONSTRAINT [FK_Resolucion_TipoResolucion] FOREIGN KEY([idTipoResolucion])
REFERENCES [dbo].[TipoResolucion] ([idTipoResolucion])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Resolucion_TipoResolucion]') AND parent_object_id = OBJECT_ID(N'[dbo].[Resolucion]'))
ALTER TABLE [dbo].[Resolucion] CHECK CONSTRAINT [FK_Resolucion_TipoResolucion]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ResponsableXUO]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ResponsableXUO](
	[IdResponsable] [int] NOT NULL,
	[Year] [int] NULL,
	[idAreaOrganiz] [int] NULL,
	[AreaOrganizacional] [varchar](80) COLLATE Modern_Spanish_CI_AS NULL,
	[idDependeDe] [int] NULL,
	[IdEmpleado] [int] NULL,
	[F_Inicio] [smalldatetime] NULL,
	[F_Termino] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdResponsable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rol]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] NOT NULL,
	[Descripcion] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[IdSistema] [char](7) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rol_Acceso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rol_Acceso](
	[IdRol] [int] NOT NULL,
	[Permiso] [char](8) COLLATE Modern_Spanish_CI_AS NULL,
	[IdSistemaOpcion] [char](7) COLLATE Modern_Spanish_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC,
	[IdSistemaOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Rol_Acces__IdRol__766D4B53]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rol_Acceso]'))
ALTER TABLE [dbo].[Rol_Acceso]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Rol_Acces__IdSis__7579271A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rol_Acceso]'))
ALTER TABLE [dbo].[Rol_Acceso]  WITH CHECK ADD FOREIGN KEY([IdSistemaOpcion])
REFERENCES [dbo].[SistemaOpcion] ([IdSistemaOpcion])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rotacion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Rotacion](
	[idEmpleado] [int] NOT NULL,
	[idRotacion] [int] NOT NULL,
	[FechaMemo] [date] NULL,
	[NroMemo] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[idAreaOrganiz] [int] NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Rotacion] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC,
	[idRotacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Rotacion_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rotacion]'))
ALTER TABLE [dbo].[Rotacion]  WITH CHECK ADD  CONSTRAINT [FK_Rotacion_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Rotacion_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rotacion]'))
ALTER TABLE [dbo].[Rotacion] CHECK CONSTRAINT [FK_Rotacion_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Rotacion_EstructOrganiz]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rotacion]'))
ALTER TABLE [dbo].[Rotacion]  WITH CHECK ADD  CONSTRAINT [FK_Rotacion_EstructOrganiz] FOREIGN KEY([Year], [idAreaOrganiz])
REFERENCES [dbo].[EstructOrganiz] ([Year], [idAreaOrganiz])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Rotacion_EstructOrganiz]') AND parent_object_id = OBJECT_ID(N'[dbo].[Rotacion]'))
ALTER TABLE [dbo].[Rotacion] CHECK CONSTRAINT [FK_Rotacion_EstructOrganiz]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_AcudeEnferm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_AcudeEnferm](
	[idAcudeEnferm] [int] NOT NULL,
	[AcudeEnfermDescrip] [varchar](16) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idAcudeEnferm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_Asegurado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_Asegurado](
	[idEmpleado] [int] NOT NULL,
	[NroBeneficiario] [int] NOT NULL,
	[idPersona] [int] NULL,
	[idEstadoCivil] [int] NULL,
	[Sexo] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
	[VinculoFamiliar] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[NroPartida] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[NroResolMayorIndiscap] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaInicioVinculo] [datetime] NULL,
	[idMotivoBaja] [int] NULL,
	[NroPartidaDef] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[OtrosMotivos] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[FechaFinVinculo] [datetime] NULL,
	[Reevaluar] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_RRHH_Asegurados] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC,
	[NroBeneficiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RRHH_Asegurados_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_Asegurado]'))
ALTER TABLE [dbo].[RRHH_Asegurado]  WITH CHECK ADD  CONSTRAINT [FK_RRHH_Asegurados_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RRHH_Asegurados_Empleado]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_Asegurado]'))
ALTER TABLE [dbo].[RRHH_Asegurado] CHECK CONSTRAINT [FK_RRHH_Asegurados_Empleado]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RRHH_Asegurados_EstadoCivil]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_Asegurado]'))
ALTER TABLE [dbo].[RRHH_Asegurado]  WITH CHECK ADD  CONSTRAINT [FK_RRHH_Asegurados_EstadoCivil] FOREIGN KEY([idEstadoCivil])
REFERENCES [dbo].[EstadoCivil] ([IdEstadoCivil])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RRHH_Asegurados_EstadoCivil]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_Asegurado]'))
ALTER TABLE [dbo].[RRHH_Asegurado] CHECK CONSTRAINT [FK_RRHH_Asegurados_EstadoCivil]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RRHH_Asegurados_MotivoBaja]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_Asegurado]'))
ALTER TABLE [dbo].[RRHH_Asegurado]  WITH CHECK ADD  CONSTRAINT [FK_RRHH_Asegurados_MotivoBaja] FOREIGN KEY([idMotivoBaja])
REFERENCES [dbo].[MotivoBaja] ([idMotivoBaja])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RRHH_Asegurados_MotivoBaja]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_Asegurado]'))
ALTER TABLE [dbo].[RRHH_Asegurado] CHECK CONSTRAINT [FK_RRHH_Asegurados_MotivoBaja]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RRHH_Asegurados_Persona]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_Asegurado]'))
ALTER TABLE [dbo].[RRHH_Asegurado]  WITH CHECK ADD  CONSTRAINT [FK_RRHH_Asegurados_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([IdPersona])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_RRHH_Asegurados_Persona]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_Asegurado]'))
ALTER TABLE [dbo].[RRHH_Asegurado] CHECK CONSTRAINT [FK_RRHH_Asegurados_Persona]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_AspSocio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_AspSocio](
	[idAspSocio] [int] NOT NULL,
	[IdEmpleado] [int] NULL,
	[idPregunta1] [int] NULL,
	[idPregunta2] [int] NULL,
	[idPregunta3] [int] NULL,
	[PrincipProblemas] [varchar](400) COLLATE Modern_Spanish_CI_AS NULL,
	[PropMejoraInstitu] [varchar](400) COLLATE Modern_Spanish_CI_AS NULL,
	[hobby] [varchar](400) COLLATE Modern_Spanish_CI_AS NULL,
	[ActRecreaInstitu] [varchar](400) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idAspSocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_AspS__IdEmp__61E72FB9]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_AspSocio]'))
ALTER TABLE [dbo].[RRHH_AspSocio]  WITH CHECK ADD  CONSTRAINT [FK__RRHH_AspS__IdEmp__61E72FB9] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_AspS__IdEmp__61E72FB9]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_AspSocio]'))
ALTER TABLE [dbo].[RRHH_AspSocio] CHECK CONSTRAINT [FK__RRHH_AspS__IdEmp__61E72FB9]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_AspS__idPre__73B0DA39]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_AspSocio]'))
ALTER TABLE [dbo].[RRHH_AspSocio]  WITH CHECK ADD FOREIGN KEY([idPregunta3])
REFERENCES [dbo].[RRHH_Preg3] ([idPregunta3])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_AspS__idPre__74A4FE72]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_AspSocio]'))
ALTER TABLE [dbo].[RRHH_AspSocio]  WITH CHECK ADD FOREIGN KEY([idPregunta2])
REFERENCES [dbo].[RRHH_Preg2] ([idPregunta2])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_AspS__idPre__759922AB]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_AspSocio]'))
ALTER TABLE [dbo].[RRHH_AspSocio]  WITH CHECK ADD FOREIGN KEY([idPregunta1])
REFERENCES [dbo].[RRHH_Preg1] ([idPregunta1])
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_DinamicaFamiliar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_DinamicaFamiliar](
	[idDinamica] [int] NOT NULL,
	[IdEmpleado] [int] NULL,
	[idTipoFam] [int] NULL,
	[idRelaPareja] [int] NULL,
	[idRelaPH] [int] NULL,
	[idRelacHermano] [int] NULL,
	[Observacion] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idDinamica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_Dina__IdEmp__60F30B80]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_DinamicaFamiliar]'))
ALTER TABLE [dbo].[RRHH_DinamicaFamiliar]  WITH CHECK ADD  CONSTRAINT [FK__RRHH_Dina__IdEmp__60F30B80] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_Dina__IdEmp__60F30B80]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_DinamicaFamiliar]'))
ALTER TABLE [dbo].[RRHH_DinamicaFamiliar] CHECK CONSTRAINT [FK__RRHH_Dina__IdEmp__60F30B80]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_Dina__idRel__77816B1D]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_DinamicaFamiliar]'))
ALTER TABLE [dbo].[RRHH_DinamicaFamiliar]  WITH CHECK ADD FOREIGN KEY([idRelacHermano])
REFERENCES [dbo].[RRHH_RelacHermano] ([idRelacHermano])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_Dina__idRel__78758F56]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_DinamicaFamiliar]'))
ALTER TABLE [dbo].[RRHH_DinamicaFamiliar]  WITH CHECK ADD FOREIGN KEY([idRelaPH])
REFERENCES [dbo].[RRHH_RelacPH] ([idRelacPH])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_Dina__idRel__7969B38F]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_DinamicaFamiliar]'))
ALTER TABLE [dbo].[RRHH_DinamicaFamiliar]  WITH CHECK ADD FOREIGN KEY([idRelaPareja])
REFERENCES [dbo].[RRHH_RelacPareja] ([idRelacPareja])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_Dina__idTip__7A5DD7C8]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_DinamicaFamiliar]'))
ALTER TABLE [dbo].[RRHH_DinamicaFamiliar]  WITH CHECK ADD FOREIGN KEY([idTipoFam])
REFERENCES [dbo].[RRHH_TipoFamilia] ([idTipoFam])
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_Feriado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_Feriado](
	[idFeriado] [int] NOT NULL,
	[Fecha] [datetime] NULL,
	[Motivo] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idFeriado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_FuncFam]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_FuncFam](
	[idFuncFamiliar] [int] NOT NULL,
	[IdEmpleado] [int] NULL,
	[Com1] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[Com2] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[Afec1] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[Afec2] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[Decis1] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[Decis2] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[Soc1] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[Soc2] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[Soc3] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idFuncFamiliar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_Func__IdEmp__5FFEE747]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_FuncFam]'))
ALTER TABLE [dbo].[RRHH_FuncFam]  WITH CHECK ADD  CONSTRAINT [FK__RRHH_Func__IdEmp__5FFEE747] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_Func__IdEmp__5FFEE747]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_FuncFam]'))
ALTER TABLE [dbo].[RRHH_FuncFam] CHECK CONSTRAINT [FK__RRHH_Func__IdEmp__5FFEE747]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_Preg1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_Preg1](
	[idPregunta1] [int] NOT NULL,
	[Respues1] [varchar](83) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idPregunta1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_Preg2]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_Preg2](
	[idPregunta2] [int] NOT NULL,
	[Respues2] [varchar](22) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idPregunta2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_Preg3]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_Preg3](
	[idPregunta3] [int] NOT NULL,
	[Respues3] [varchar](23) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idPregunta3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_RelacHermano]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_RelacHermano](
	[idRelacHermano] [int] NOT NULL,
	[RelacHermanoDescrip] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idRelacHermano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_RelacPareja]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_RelacPareja](
	[idRelacPareja] [int] NOT NULL,
	[RelacParejaDescrip] [varchar](12) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idRelacPareja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_RelacPH]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_RelacPH](
	[idRelacPH] [int] NOT NULL,
	[RelacPHDescrip] [varchar](14) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idRelacPH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_Salud]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_Salud](
	[idSalud] [int] NOT NULL,
	[IdEmpleado] [int] NULL,
	[EnferCronica] [bit] NULL,
	[EnferCronicaDescrip] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[FamDiscapacidad] [bit] NULL,
	[FamDiscapDescrip] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[Alergico] [bit] NULL,
	[AlergicoDescrip] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[idAcudeEnferm] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idSalud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_Salu__idAcu__7D3A4473]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_Salud]'))
ALTER TABLE [dbo].[RRHH_Salud]  WITH CHECK ADD FOREIGN KEY([idAcudeEnferm])
REFERENCES [dbo].[RRHH_AcudeEnferm] ([idAcudeEnferm])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_Salu__IdEmp__5F0AC30E]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_Salud]'))
ALTER TABLE [dbo].[RRHH_Salud]  WITH CHECK ADD  CONSTRAINT [FK__RRHH_Salu__IdEmp__5F0AC30E] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__RRHH_Salu__IdEmp__5F0AC30E]') AND parent_object_id = OBJECT_ID(N'[dbo].[RRHH_Salud]'))
ALTER TABLE [dbo].[RRHH_Salud] CHECK CONSTRAINT [FK__RRHH_Salu__IdEmp__5F0AC30E]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_TempFecha]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_TempFecha](
	[Fecha] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_RRHH_TempFecha] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RRHH_TipoFamilia]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[RRHH_TipoFamilia](
	[idTipoFam] [int] NOT NULL,
	[TipoFamDescrip] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoFam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SistemaOpcion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SistemaOpcion](
	[IdSistemaOpcion] [char](7) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](150) COLLATE Modern_Spanish_CI_AS NULL,
	[ConClave] [bit] NULL,
	[Clave] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSistemaOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysLogEvent]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysLogEvent](
	[fecha] [datetime] NULL,
	[Aplicacion] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[PC] [nvarchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[Login] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[usuario] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[Evento] [nvarchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[Sentencia] [nvarchar](2000) COLLATE Modern_Spanish_CI_AS NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TenenciaViv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TenenciaViv](
	[IdTenencia] [int] NOT NULL,
	[DescripTenencia] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTenencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoComportamiento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoComportamiento](
	[idTipoComportamiento] [int] NOT NULL,
	[TipoCompDescrip] [varchar](8) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoComportamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoDoc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoDoc](
	[IdTipodoc] [char](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[Numero] [int] NULL,
	[Serie] [tinyint] NULL,
	[Anio] [char](4) COLLATE Modern_Spanish_CI_AS NOT NULL,
 CONSTRAINT [PK_TipoDoc] PRIMARY KEY CLUSTERED 
(
	[IdTipodoc] ASC,
	[Anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoDocID]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoDocID](
	[TipoDocID] [int] NOT NULL,
	[Descripcion] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_TipoDocID] PRIMARY KEY CLUSTERED 
(
	[TipoDocID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tD_TipoDocID]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER tD_TipoDocID ON TipoDocID FOR DELETE AS
/* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
/* DELETE trigger on TipoDocID */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
    /* TipoDocID FK_Persona_TipoDocID Persona on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000107b0", PARENT_OWNER="dbo", PARENT_TABLE="TipoDocID"
    CHILD_OWNER="dbo", CHILD_TABLE="Persona"
    P2C_VERB_PHRASE="FK_Persona_TipoDocID", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Persona_TipoDocID", FK_COLUMNS="TipoDocID" */
    IF EXISTS (
      SELECT * FROM deleted,Persona
      WHERE
        /*  %JoinFKPK(Persona,deleted," = "," AND") */
        Persona.TipoDocID = deleted.TipoDocID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = ''Cannot delete TipoDocID because Persona exists.''
      GOTO ERROR
    END


    /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END' 
GO
ALTER TABLE [dbo].[TipoDocID] ENABLE TRIGGER [tD_TipoDocID]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tU_TipoDocID]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER tU_TipoDocID ON TipoDocID FOR UPDATE AS
/* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
/* UPDATE trigger on TipoDocID */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insTipoDocID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
  /* TipoDocID FK_Persona_TipoDocID Persona on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00012ad4", PARENT_OWNER="dbo", PARENT_TABLE="TipoDocID"
    CHILD_OWNER="dbo", CHILD_TABLE="Persona"
    P2C_VERB_PHRASE="FK_Persona_TipoDocID", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Persona_TipoDocID", FK_COLUMNS="TipoDocID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TipoDocID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Persona
      WHERE
        /*  %JoinFKPK(Persona,deleted," = "," AND") */
        Persona.TipoDocID = deleted.TipoDocID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = ''Cannot update TipoDocID because Persona exists.''
      GOTO ERROR
    END
  END


  /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END' 
GO
ALTER TABLE [dbo].[TipoDocID] ENABLE TRIGGER [tU_TipoDocID]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoEstudio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoEstudio](
	[IdTipoEstudios] [int] NOT NULL,
	[DescripTipoEst] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoEstudios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoFamiliar]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoFamiliar](
	[IdTipoFam] [int] NOT NULL,
	[DescripTipoFam] [varchar](10) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoFam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoInstitucion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoInstitucion](
	[IdTipoInstitucion] [int] NOT NULL,
	[DescripTipoInstitucion] [varchar](15) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoInstitucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoMoneda]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoMoneda](
	[IdTipoMoneda] [int] NOT NULL,
	[Descripcion] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[Abreviatura] [varchar](5) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK__TipoMoneda__4381D8D3] PRIMARY KEY CLUSTERED 
(
	[IdTipoMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoMovimiento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoMovimiento](
	[IdTipoMovimiento] [char](1) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[IdTipodoc] [char](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[TipoOperacion] [char](1) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK__TipoMovimiento__797DF6D1] PRIMARY KEY CLUSTERED 
(
	[IdTipoMovimiento] ASC,
	[IdTipodoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoPermiso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoPermiso](
	[idTipoPermiso] [int] NOT NULL,
	[DescripTipoPermiso] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoRecurso]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoRecurso](
	[IdTipoRecurso] [char](3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_TipoRecurso_1] PRIMARY KEY CLUSTERED 
(
	[IdTipoRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoResolucion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoResolucion](
	[idTipoResolucion] [int] NOT NULL,
	[DescripTipoResolucion] [nvarchar](50) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_TipoResolucion] PRIMARY KEY CLUSTERED 
(
	[idTipoResolucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoSangre]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoSangre](
	[IdTipoSangre] [int] NOT NULL,
	[DescripTS] [varchar](5) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [XPKTipoSangre] PRIMARY KEY NONCLUSTERED 
(
	[IdTipoSangre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoTrabajador]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoTrabajador](
	[IdTipoTrabajador] [int] NOT NULL,
	[Descripcion] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[Observaciones] [varchar](150) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_TipoTrabajador] PRIMARY KEY CLUSTERED 
(
	[IdTipoTrabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoTransaccion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoTransaccion](
	[Anio] [char](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[IdTipoTransaccion] [char](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_TipoTransaccion] PRIMARY KEY CLUSTERED 
(
	[IdTipoTransaccion] ASC,
	[Anio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TipoViv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TipoViv](
	[IdTipo] [int] NOT NULL,
	[DescripTipo] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TitulosEmpleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TitulosEmpleado](
	[NumColegiatura] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[DenominacionGrado] [varchar](100) COLLATE Modern_Spanish_CI_AS NULL,
	[Institucion] [varchar](60) COLLATE Modern_Spanish_CI_AS NULL,
	[Fecha] [datetime] NULL,
	[IdEmpleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[NumColegiatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TitulosEm__IdEmp__5E169ED5]') AND parent_object_id = OBJECT_ID(N'[dbo].[TitulosEmpleado]'))
ALTER TABLE [dbo].[TitulosEmpleado]  WITH CHECK ADD  CONSTRAINT [FK__TitulosEm__IdEmp__5E169ED5] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__TitulosEm__IdEmp__5E169ED5]') AND parent_object_id = OBJECT_ID(N'[dbo].[TitulosEmpleado]'))
ALTER TABLE [dbo].[TitulosEmpleado] CHECK CONSTRAINT [FK__TitulosEm__IdEmp__5E169ED5]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UbicacionViv]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UbicacionViv](
	[IdUbicacion] [int] NOT NULL,
	[DescripUbicacion] [varchar](22) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ubigeo]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ubigeo](
	[IdUbigeo] [char](6) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Departamento] [char](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Provincia] [char](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Distrito] [char](2) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](120) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK_Ubigeo] PRIMARY KEY CLUSTERED 
(
	[IdUbigeo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tD_Ubigeo]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER tD_Ubigeo ON Ubigeo FOR DELETE AS
/* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
/* DELETE trigger on Ubigeo */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
    /* Ubigeo FK_Meta_Ubigeo Meta on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001fa22", PARENT_OWNER="dbo", PARENT_TABLE="Ubigeo"
    CHILD_OWNER="dbo", CHILD_TABLE="Meta"
    P2C_VERB_PHRASE="FK_Meta_Ubigeo", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Meta_Ubigeo", FK_COLUMNS="IdUbigeo" */
    IF EXISTS (
      SELECT * FROM deleted,Meta
      WHERE
        /*  %JoinFKPK(Meta,deleted," = "," AND") */
        Meta.IdUbigeo = deleted.IdUbigeo
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = ''Cannot delete Ubigeo because Meta exists.''
      GOTO ERROR
    END

    /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
    /* Ubigeo FK_Persona_Ubigeo Persona on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Ubigeo"
    CHILD_OWNER="dbo", CHILD_TABLE="Persona"
    P2C_VERB_PHRASE="FK_Persona_Ubigeo", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Persona_Ubigeo", FK_COLUMNS="IdUbigeo" */
    IF EXISTS (
      SELECT * FROM deleted,Persona
      WHERE
        /*  %JoinFKPK(Persona,deleted," = "," AND") */
        Persona.IdUbigeo = deleted.IdUbigeo
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = ''Cannot delete Ubigeo because Persona exists.''
      GOTO ERROR
    END


    /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END' 
GO
ALTER TABLE [dbo].[Ubigeo] ENABLE TRIGGER [tD_Ubigeo]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tU_Ubigeo]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER tU_Ubigeo ON Ubigeo FOR UPDATE AS
/* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
/* UPDATE trigger on Ubigeo */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdUbigeo char(6),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
  /* Ubigeo FK_Meta_Ubigeo Meta on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000241ba", PARENT_OWNER="dbo", PARENT_TABLE="Ubigeo"
    CHILD_OWNER="dbo", CHILD_TABLE="Meta"
    P2C_VERB_PHRASE="FK_Meta_Ubigeo", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Meta_Ubigeo", FK_COLUMNS="IdUbigeo" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdUbigeo)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Meta
      WHERE
        /*  %JoinFKPK(Meta,deleted," = "," AND") */
        Meta.IdUbigeo = deleted.IdUbigeo
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = ''Cannot update Ubigeo because Meta exists.''
      GOTO ERROR
    END
  END

  /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
  /* Ubigeo FK_Persona_Ubigeo Persona on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Ubigeo"
    CHILD_OWNER="dbo", CHILD_TABLE="Persona"
    P2C_VERB_PHRASE="FK_Persona_Ubigeo", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Persona_Ubigeo", FK_COLUMNS="IdUbigeo" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdUbigeo)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Persona
      WHERE
        /*  %JoinFKPK(Persona,deleted," = "," AND") */
        Persona.IdUbigeo = deleted.IdUbigeo
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = ''Cannot update Ubigeo because Persona exists.''
      GOTO ERROR
    END
  END


  /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END' 
GO
ALTER TABLE [dbo].[Ubigeo] ENABLE TRIGGER [tU_Ubigeo]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UnidadMedida]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UnidadMedida](
	[IdUnidadMedida] [char](4) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[Descripcion] [varchar](30) COLLATE Modern_Spanish_CI_AS NULL,
	[Abreviado] [char](4) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [PK__UnidadMedida__6FF48C97] PRIMARY KEY CLUSTERED 
(
	[IdUnidadMedida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] NOT NULL,
	[Login] [char](20) COLLATE Modern_Spanish_CI_AS NULL,
	[Descripcion] [varchar](40) COLLATE Modern_Spanish_CI_AS NULL,
	[Fecha] [datetime] NULL,
	[Estado] [bit] NULL,
	[IdEmpleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Usuario__IdEmple__5C2E5663]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario]'))
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK__Usuario__IdEmple__5C2E5663] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Usuario__IdEmple__5C2E5663]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario]'))
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK__Usuario__IdEmple__5C2E5663]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Usuario_Rol]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Usuario_Rol](
	[IdUsuario] [int] NOT NULL,
	[IdRol] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Usuario_R__IdRol__6B65ACFB]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_Rol]'))
ALTER TABLE [dbo].[Usuario_Rol]  WITH CHECK ADD FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Usuario_R__IdUsu__6C59D134]') AND parent_object_id = OBJECT_ID(N'[dbo].[Usuario_Rol]'))
ALTER TABLE [dbo].[Usuario_Rol]  WITH CHECK ADD FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ViveCon]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ViveCon](
	[IdViveCon] [int] NOT NULL,
	[DescripViveCon] [varchar](27) COLLATE Modern_Spanish_CI_AS NULL,
PRIMARY KEY CLUSTERED 
(
	[IdViveCon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vivienda]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vivienda](
	[IdEmpleado] [int] NULL,
	[IdVivienda] [int] NOT NULL,
	[IdTenencia] [int] NULL,
	[IdTipo] [int] NULL,
	[IdMaterial] [int] NULL,
	[IdConservacion] [int] NULL,
	[NumDormitorio] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[NumServHig] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[IdUbicacion] [int] NULL,
	[IdAlumbrado] [int] NULL,
	[OtroAlumbrado] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[IdAgua] [int] NULL,
	[OtroAgua] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[IdExcretas] [int] NULL,
	[OtroExcreta] [varchar](50) COLLATE Modern_Spanish_CI_AS NULL,
	[NumCompart] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[Observacion] [varchar](200) COLLATE Modern_Spanish_CI_AS NULL,
	[NumPerDorm] [varchar](2) COLLATE Modern_Spanish_CI_AS NULL,
	[Telefono] [bit] NULL,
	[Cable] [bit] NULL,
	[Internet] [bit] NULL,
	[Otros] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVivienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Vivienda__IdAgua__1ACAA75A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vivienda]'))
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD FOREIGN KEY([IdAgua])
REFERENCES [dbo].[AguaViv] ([IdAgua])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Vivienda__IdAlum__1BBECB93]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vivienda]'))
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD FOREIGN KEY([IdAlumbrado])
REFERENCES [dbo].[AlumbradoViv] ([IdAlumbrado])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Vivienda__IdCons__1DA71405]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vivienda]'))
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD FOREIGN KEY([IdConservacion])
REFERENCES [dbo].[ConservacionViv] ([IdConservacion])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Vivienda__IdEmpl__5B3A322A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vivienda]'))
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD  CONSTRAINT [FK__Vivienda__IdEmpl__5B3A322A] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Vivienda__IdEmpl__5B3A322A]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vivienda]'))
ALTER TABLE [dbo].[Vivienda] CHECK CONSTRAINT [FK__Vivienda__IdEmpl__5B3A322A]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Vivienda__IdExcr__19D68321]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vivienda]'))
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD FOREIGN KEY([IdExcretas])
REFERENCES [dbo].[ExcretasViv] ([IdExcretas])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Vivienda__IdMate__1E9B383E]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vivienda]'))
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD FOREIGN KEY([IdMaterial])
REFERENCES [dbo].[MaterialViv] ([IdMaterial])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Vivienda__IdTene__208380B0]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vivienda]'))
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD FOREIGN KEY([IdTenencia])
REFERENCES [dbo].[TenenciaViv] ([IdTenencia])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Vivienda__IdTipo__1F8F5C77]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vivienda]'))
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD FOREIGN KEY([IdTipo])
REFERENCES [dbo].[TipoViv] ([IdTipo])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__Vivienda__IdUbic__1CB2EFCC]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vivienda]'))
ALTER TABLE [dbo].[Vivienda]  WITH CHECK ADD FOREIGN KEY([IdUbicacion])
REFERENCES [dbo].[UbicacionViv] ([IdUbicacion])
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[aba_vs_Deta_Consolidado_Contrato]'))
EXEC dbo.sp_executesql @statement = N'CREATE view aba_vs_Deta_Consolidado_Contrato 
as 
select dc.idcontrato, dc.idconsolidado, c.idseleccion, c.fechaadjudicacion as FechaSeleccion, 
       dc.item as Item, dc.idbien as Codigo, b.descripcion as Descripcion, dc.cantidadPro as CantidadContrato,
	   dc.saldo as Saldo, '''' as Cantidad,  dc.preciopro as Precio, Round( dc.preciopro* (0.19), 4) as IGV,
	   '''' as Monto, '''' as Detalle, dp.idmeta as CodMeta, m.descripcion as Meta, '''' as CodGasto, 
       '''' as GastoP, (''20'' + left(idpedido,2)) as MetaAnio, rtrim(u.descripcion) as U_MEDIDA, b.idunidadmedida as IDMEDIDA,
	   p.idproveedor, rtrim(p.razonsocial) as desproveedor				   
from consolidado c 
	 inner join deta_consolidado dc on c.idconsolidado=dc.idconsolidado 
	 inner join deta_pedido dp on dc.idconsolidado=dp.idconsolidado and dc.idbien=dp.idbien 
	 inner join bien b on dp.idbien=b.idbien
     inner join unidadmedida u on b.idunidadmedida=u.idunidadmedida
	 inner join meta m on dp.idmeta=m.idmeta and m.Anio=year(getdate())
	 left join proveedor p on dc.buenapro=p.idproveedor' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[aba_vs_financiamiento]'))
EXEC dbo.sp_executesql @statement = N'CREATE view aba_vs_financiamiento
as 
select idfinanciamiento as codigo,descripcion from financiamiento' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[aba_vs_RecepcionBien]'))
EXEC dbo.sp_executesql @statement = N'

CREATE view aba_vs_RecepcionBien
as 
SELECT     X.Fecha, X.RazonSocial, X.TipoOrden, X.IdOrden, X.IdBien, X.Descripcion, X.Abreviado AS Abreviatura, X.Stock, X.CantidadOrdenada, 
                      ISNULL(Y.CantidadRecibida, 0) AS CantidadRecibida, CASE WHEN (x.CantidadOrdenada - isnull(y.CantidadRecibida, 0)) 
                      = 0 THEN ''Entregado'' WHEN (x.CantidadOrdenada - isnull(y.CantidadRecibida, 0)) < x.CantidadOrdenada AND 
                      (x.CantidadOrdenada - isnull(y.CantidadRecibida, 0)) > 0 THEN ''Parcialmente Entregado'' WHEN (x.CantidadOrdenada - isnull(y.CantidadRecibida, 0)) 
                      = x.CantidadOrdenada THEN ''Por Entregar'' END AS Estado, X.CantidadOrdenada - ISNULL(Y.CantidadRecibida, 0) AS Saldo, 
                      0.0000 AS CantidadIngreso, X.Costo, X.Meta
FROM         (SELECT     oc.Fecha, oc.IdProveedor, p.RazonSocial, oc.TipoOrden, oc.IdOrden, do.IdBien, b.Descripcion, um.Abreviado, ab.Stock, 
                                              do.Cantidad AS CantidadOrdenada, cast( ((do.Precio) + cast(isnull(do.Igv,''0.0'') as decimal(11,4))) as numeric(9,2))AS Costo, do.Meta
                       FROM          dbo.OrdenCompra AS oc INNER JOIN
                                              dbo.Deta_Orden AS do ON oc.TipoOrden = do.TipoOrden AND oc.IdOrden = do.IdOrden LEFT OUTER JOIN
                                              dbo.Bien AS b ON do.IdBien = b.IdBien LEFT OUTER JOIN
                                              dbo.Almacen_Bien AS ab ON b.IdBien = ab.IdBien LEFT OUTER JOIN
                                              dbo.UnidadMedida AS um ON b.IdUnidadMedida = um.IdUnidadMedida LEFT OUTER JOIN
                                              dbo.Proveedor AS p ON oc.IdProveedor = p.IdProveedor
                       WHERE      (oc.TipoOrden = ''B'') AND (ab.IdAlmacen = ''01'')) AS X LEFT OUTER JOIN
                          (SELECT     m.IdOrden, m.TipoOrden, dm.IdBien, SUM(dm.Cantidad) AS CantidadRecibida
                            FROM          dbo.Movimiento AS m INNER JOIN
                                                   dbo.Deta_Movimiento AS dm ON m.IdMovimiento = dm.IdMovimiento
                            WHERE      (m.TipoOrden = ''B'')
                            GROUP BY m.IdOrden, m.TipoOrden, dm.IdBien) AS Y ON X.TipoOrden = Y.TipoOrden AND X.IdOrden = Y.IdOrden AND X.IdBien = Y.IdBien



' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Aba_vw_Adjudicacion_Consolidado_Contrato]'))
EXEC dbo.sp_executesql @statement = N'CREATE view Aba_vw_Adjudicacion_Consolidado_Contrato
as 
select 
c.idconsolidado,
c.idseleccion,
dc.idcontrato,
cc.fecha as fechacontrato,
cc.plazodias As Plazoentrega,
cc.monto,
cc.concepto,
cc.estado as estadocontrato,
c.anio,
c.fecha,
c.fecharemitido,
c.fechaadjudicacion,
c.tipoadjudicacion,
c.estado as estadoConsolidado,
dc.item,
dc.idbien,
dc.cantidad,
dc.precio,
dc.importe,
dc.buenapro,
dc.observaciones,
dc.saldo,
dc.preciopro,
dc.importepro,
dc.cantidadpro,
P.razonsocial,
p.estado as estadoProveedor,
b.descripcion,
b.estado as estadoBien,
b.idunidadmedida,
b.desunidad,
b.tipo
from consolidado c 
inner join deta_consolidado dc on c.idconsolidado=dc.idconsolidado
left join contrato cc on dc.idcontrato=cc.idcontrato
inner join proveedor p on dc.buenapro=p.idproveedor		
inner join vs_aba_listarbienes b on dc.idbien=b.idbien
--where dc.idcontrato is not null' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ANT_VS_Personal_GRLL]'))
EXEC dbo.sp_executesql @statement = N'CREATE view [dbo].[ANT_VS_Personal_GRLL]
as
select p.idpersona, p.apellido_Paterno, p.apellido_Materno, Persona=p.apellido_Paterno + '' '' + p.apellido_Materno + '' '' + p.nombres
from  persona p
where p.tipopersona=''N''' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vistaUnidad]'))
EXEC dbo.sp_executesql @statement = N'
create view vistaUnidad
as
select idunidadmedida,uy.unidad
from unidadmoya uy 
	inner join unidadmedida um on uy.abreviado=um.abreviado
' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_ABA_BIENUNIMED]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VS_ABA_BIENUNIMED]
AS 
select substring(B.IDBIEN,2,12) as Codigo, B.DESCRIPCION AS DescripcionS,b.tipo,U.DESCRIPCION as DescripcionU, B.PRECIOREF, B.IDUNIDADMEDIDA AS IdUMedida
from bien B,unidaDMEDIDA  U
WHERE u.IDUNIDADMEDIDA=B.IDUNIDADMEDIDA' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_aba_CorrelativoBien]'))
EXEC dbo.sp_executesql @statement = N'CREATE view [dbo].[vs_aba_CorrelativoBien]
as 
select idgrupo, idclase, idfamilia,max(cast(substring(idbien,10,4) as integer)) as numero  
from bien
group by idgrupo, idclase, idfamilia' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_ABA_Departamentos]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW vs_ABA_Departamentos
WITH SCHEMABINDING
AS
SELECT u.idUbigeo,u.Departamento,RTRIM(u.Descripcion ) AS Descripcion
FROM dbo.Ubigeo as u WHERE u.provincia=''00'' AND u.distrito=''00''' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_aba_Detalle]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view vs_aba_Detalle
as
SELECT     do.TipoOrden, do.IdOrden, ISNULL(oc.Estado, '' '') AS estado, do.Item, do.IdBien AS Codigo, b.Descripcion, do.Cantidad, do.Precio + do.Igv AS Precio, 
                      do.Observaciones AS Detalle, do.Meta AS CodMeta, m.Descripcion AS Meta, do.IdGasto AS CodGasto, v.Descripcion AS GastoP, do.MetaAnio, 
                      do.Importe AS Monto, u.Descripcion AS [U Medida], do.IdUnidadMedida AS IDMEDIDA
FROM         dbo.OrdenCompra AS oc INNER JOIN
                      dbo.Deta_Orden AS do ON oc.IdOrden = do.IdOrden AND oc.TipoOrden = do.TipoOrden INNER JOIN
                      dbo.Bien AS b ON do.IdBien = b.IdBien INNER JOIN
                      dbo.UnidadMedida AS u ON do.IdUnidadMedida = u.IdUnidadMedida INNER JOIN
                      dbo.Meta AS m ON do.Meta = m.IdMeta and do.metaanio=m.anio INNER JOIN
                      dbo.vs_ABA_GastoPublico AS v ON do.IdGasto = v.IdGastoPublico and do.metaanio=v.anio

' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_aba_Gastofull]'))
EXEC dbo.sp_executesql @statement = N'create view vs_aba_Gastofull
as
SELECT     IdTipoTransaccion + ''.'' + IdGenerica + ''.'' + IdSubGenerica + '' '' + IdSubGenerica_Det + ''.'' + IdEspecifica + '' '' + IdEspecifica_Det AS IdGastoPublico, Anio,
                       Descripcion
FROM         dbo.Especifica_Det' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_ABA_GastoPublico]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view vs_aba_gastopublico 
as
SELECT ltrim(rtrim(IdTipoTransaccion + ''.'' + IdGenerica + ''.'' + IdSubGenerica + '' '' + IdSubGenerica_Det + ''.'' + IdEspecifica + '' '' + IdEspecifica_Det)) AS IdGastoPublico, Anio, Descripcion
FROM dbo.Especifica_Det' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_ABA_LISTARBIEN_ALMACEN]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW VS_ABA_LISTARBIEN_ALMACEN
AS
SELECT AB.IDALMACEN,''ALMACEN '' + A.DESCRIPCION AS DESCRIPCION, ab.STOCK, AB.IDBIEN
FROM ALMACEN_BIEN AB, ALMACEN A
WHERE ab.IDALMACEN=a.IDALMACEN' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_ABA_ListarBienes]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view [dbo].[vs_ABA_ListarBienes]
--WITH ENCRYPTION
as
select b.idbien,b.descripcion
	,observaciones=isnull(b.observaciones,'''')
	,b.estado
	,idunidadmedida=isnull(b.idunidadmedida,'''')
	,rtrim(u.descripcion) as desunidad	
	,u.abreviado as desunidadcorta	
	,precioref=ISNULL(b.precioref,0)
	,b.idfamilia
	,rtrim(f.descripcion) as desfamilia
	,b.idclase
	,rtrim(c.descripcion) as desclase
	,b.idgrupo
	,rtrim(g.descripcion) as desgrupo
	,b.tipo
	,b.fecharef
	,b.esactivofijo
	
from bien b
	inner join unidadmedida u on u.idunidadmedida=b.idunidadmedida	
	inner join familia f on f.idfamilia=b.idfamilia and f.idclase=b.idclase and f.idgrupo=b.idgrupo
	inner join clase c on c.idclase=f.idclase and c.idgrupo=f.idgrupo
	inner join grupo g on g.idgrupo=c.idgrupo
' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_ABA_ListarMetas]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.vs_ABA_ListarMetas
AS
SELECT     m.IdFuncion + ''.'' + m.IdPrograma + ''.'' + m.IdSubPrograma + ''.'' + m.IdProgramaProp + ''. '' + SUBSTRING(m.IdActividad, 1, 1) + ''.'' + SUBSTRING(m.IdActividad, 2, 6) 
                      + ''. '' + SUBSTRING(m.IdComponente, 1, 1) + ''.'' + SUBSTRING(m.IdComponente, 2, 6) AS Codigo, m.CodigoMeta AS CorreMeta, m.IdMeta, m.Localizacion, 
                      m.Descripcion AS DescMeta, m.Anio, f.IdFinalidad, f.Descripcion AS DescFina
FROM         dbo.Meta AS m LEFT OUTER JOIN
                      dbo.finalidad AS f ON m.IdFinalidad = f.IdFinalidad AND m.Anio = f.Anio LEFT OUTER JOIN
                      dbo.Ubigeo AS u ON m.IdUbigeo = u.IdUbigeo LEFT OUTER JOIN
                      dbo.UnidadMedida AS um ON m.IdUnidadMedida = um.IdUnidadMedida
' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_ABA_LISTARPROVEEDOR]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW VS_ABA_LISTARPROVEEDOR
AS 
SELECt PRO.IDPROVEEDOR,PRO.RAZONSOCIAL,PER.DIRECCION,PRO.ESTADO,Per.idpersona
fROM proveedor PRO, PERSONA PER
WHERE PRO.IDPERSONA=PER.IDPERSONA' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_ABA_META]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW VS_ABA_META
AS 
SELECT SUBSTRING(IDMETA,3,6)AS IDMETA,DESCRIPCION FROM META' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_aba_MetaFull]'))
EXEC dbo.sp_executesql @statement = N'
create view vs_aba_MetaFull
as 
SELECT   m.Anio,IdMeta,m.Descripcion
FROM         dbo.Meta AS m INNER JOIN
                      dbo.finalidad AS f ON m.IdFinalidad = f.IdFinalidad AND m.Anio = f.Anio INNER JOIN
                      dbo.Ubigeo AS u ON m.IdUbigeo = u.IdUbigeo INNER JOIN
                      dbo.UnidadMedida AS um ON m.IdUnidadMedida = um.IdUnidadMedida' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_aba_NroBien]'))
EXEC dbo.sp_executesql @statement = N'CREATE view [dbo].[vs_aba_NroBien]
as 

SELECT  F.IDFAMILIA,F.IDGRUPO,F.IDCLASE,ISNULL(V.NUMERO,0) AS NUMERO
FROM FAMILIA f
LEFT JOIN
VS_ABA_CORRELATIVOBIEN V
ON F.IDFAMILIA=V.IDFAMILIA AND
   F.IDCLASE=V.IDCLASE AND
   f.IDGRUPO=V.IDGRUPO' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_aba_NroMaxMovimiento]'))
EXEC dbo.sp_executesql @statement = N'CREATE view [dbo].[vs_aba_NroMaxMovimiento]
as
select idmovimiento, 
substring(idmovimiento,1,2) as anio , 
CAST(substring(idmovimiento,3,8) AS INT) as numero 
from movimiento
' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_ABA_NROMAXPERJ]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[VS_ABA_NROMAXPERJ]

as

select mAX(idpersona) AS NROMAX_PJ from persona' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_ABA_NROMAXPN]'))
EXEC dbo.sp_executesql @statement = N'create VIEW VS_ABA_NROMAXPN

as

select mAX(idpersona) AS NROMAX_PN from persona where tipopersona=''N''' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_ABA_Provincias]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[vs_ABA_Provincias]
WITH SCHEMABINDING
AS
SELECT u.IdUbigeo,u.departamento,d.descripcion as desdepartamento,u.provincia,RTRIM(u.descripcion) as desprovincia
FROM dbo.Ubigeo as u 
	INNER JOIN dbo.vs_ABA_Departamentos d ON u.departamento=d.departamento
WHERE provincia<>''00''  and u.distrito=''00''

' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_CJr_Norma]'))
EXEC dbo.sp_executesql @statement = N'CREATE view [dbo].[vs_CJr_Norma]
as
select
nr.idTipoProyec,
nr.NumProyecto,
tn.DescripTipoNorma, 
nr.idTipoNorma,
nr.numOrdenanza,
nr.FechaOrdenanza,
pun.NumOficio as OfPubliNorma,
oPUN.FechaEmision as FechaOfPubliNorma,
tme.TipoMedioDescrip,
pub.nombremedio,
pub.FechaPublicacion,
pub.paginas,
nn.numOficio as OfcioNotificacion,
onn.fechaEmision as FEchaOfcioNotificacion
from dbo.CJRNormaRegional nr
left join dbo.CJRTipoNorma tn on tn.idTipoNorma=nr.idTipoNorma
left join dbo.CJRPublicacionNorma pun on pun.numordenanza=nr.numordenanza and pun.idTipoNorma=nr.idTipoNorma
left join dbo.CJROficio oPUN on oPUN.numOficio=pun.numOficio
left join dbo.CJRPublicacion pub on pub.numordenanza=nr.numordenanza and pub.idTipoNorma=nr.idTipoNorma
left join dbo.CJRTipoMedio tme on pub.idTipoMedio=tme.idTipomedio
left join dbo.CJRNotificacionNorma nn on nn.numordenanza=nr.numordenanza and nn.idTipoNorma=nr.idTipoNorma
left join dbo.CJROficio onN on onN.numOficio=nn.numOficio' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_CJr_ProyectoNor]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[vs_CJr_ProyectoNor]
as
select 
pro.NumOficioIniciativa,
pro.numtema,
tp.DescripTipoProyec,
pro.numproyecto,
pro.idTipoProyec,
tc.numoficio as OfTrasComision,
oTC.FechaEmision as FechaOfTrasComision,
dc.numdictamen,
dc.fechadictamen,
dc.aprobado,
ta.AprobacionDescrip,
ts.SesionDescrip,
s.FechaSesion,
pn.numOficio as OfPromulNorma,
opn.FechaEmision as FechaOfPromulNorma,
dn.numoficio as OfDevolucion,
oDN.FechaEmision as FechaOfDevolucion
from dbo.CJRProyectoNormativo pro
left join dbo.CJRTipoProyecto tp on pro.idTipoProyec=tp.idTipoProyec
left join dbo.CJRTrasladoComision tc on pro.numproyecto =tc.numproyecto and pro.idTipoProyec=tc.idTipoProyec
left join dbo.CJROficio oTC on oTC.numoficio=tc.numoficio
left join dbo.CJRDictamenComision dc on dc.numproyecto =pro.numproyecto and dc.idTipoProyec=pro.idTipoProyec
left join dbo.CJRTipoAprobacion ta on ta.idAprobacion=dc.idAprobacion
left join dbo.CJRSesion s on s.numproyecto =pro.numproyecto and s.idTipoProyec=pro.idTipoProyec
left join dbo.CJRTipoSesion ts on ts.idTipoSesion=s.idTipoSesion
left join dbo.CJRPromulgacionNorma pn on pn.numproyecto =pro.numproyecto and pn.idTipoProyec=pro.idTipoProyec
left join dbo.CJROficio oPN on oPN.numOficio=pn.numOficio
left join dbo.CJRDevolucionNorma dn on dn.numproyecto =pro.numproyecto and dn.idTipoProyec=pro.idTipoProyec
left join dbo.CJROficio oDN on oDN.numOficio=pn.numOficio
' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_Faltas]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.vs_Faltas
AS
SELECT     p.Apellido_Paterno + '' '' + p.Apellido_Materno + '' '' + p.Nombres AS NombresC, p.NumDocID, p.IdPersona, e.IdEmpleado, e.Year, e.idAreaOrganiz, 
                      e.IdTipoTrabajador, e.Estado, O.AreaOrganizacional, t.Descripcion, a.Fecha, O.Year AS Anio
FROM         dbo.Persona AS p INNER JOIN
                      dbo.Empleado AS e ON p.IdPersona = e.IdPersona INNER JOIN
                      dbo.EstructOrganiz AS O ON O.idAreaOrganiz = e.idAreaOrganiz AND O.Year = e.Year INNER JOIN
                      dbo.TipoTrabajador AS t ON t.IdTipoTrabajador = e.IdTipoTrabajador INNER JOIN
                      dbo.Asistencia AS a ON a.IdEmpleado = e.IdEmpleado
' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_GetEmpleado]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.vs_GetEmpleado
AS
SELECT     p.Apellido_Paterno + '' '' + p.Apellido_Materno + '' '' + p.Nombres AS NombresC, p.NumDocID, p.IdPersona, e.IdEmpleado, e.Year, e.idAreaOrganiz, 
                      e.IdTipoTrabajador, e.Estado, O.AreaOrganizacional, O.Year AS Anio, t.Descripcion
FROM         dbo.Persona AS p INNER JOIN
                      dbo.Empleado AS e ON p.IdPersona = e.IdPersona INNER JOIN
                      dbo.EstructOrganiz AS O ON O.idAreaOrganiz = e.idAreaOrganiz AND O.Year = e.Year INNER JOIN
                      dbo.TipoTrabajador AS t ON t.IdTipoTrabajador = e.IdTipoTrabajador
' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_PER_ListarEmpleados]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.vs_PER_ListarEmpleados
AS
SELECT     e.IdEmpleado, p.NumDocID, RTRIM(p.Apellido_Paterno) + '' '' + RTRIM(p.Apellido_Materno) + '' '' + RTRIM(p.Nombres) AS nombre, p.Telefono, p.Direccion, p.Email, 
                      e.Sexo, ea.Year, ea.idAreaOrganiz
FROM         dbo.Persona AS p INNER JOIN
                      dbo.Empleado AS e ON p.IdPersona = e.IdPersona INNER JOIN
                      dbo.Empleado_Area AS ea ON e.IdEmpleado = ea.IdEmpleado
WHERE     (ea.Year = YEAR(GETDATE()))
' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_prueba]'))
EXEC dbo.sp_executesql @statement = N'create view vs_prueba
as
select  m.idtipomovimiento as tipomov, m.fecha as fecha, dm.idbien as idbien, 
        --b.descripcion as descbien, um.descripcion as descuni,
        --isnull(stockini,0) as stockini, 
		dm.cantidad as cantidad, 
		--case when idtipomovimiento=''1'' then isnull(stockini,0) + dm.cantidad when idtipomovimiento=''3'' then isnull(stockini,0) - dm.cantidad end as Saldo,
        dm.Precio_Costo as costo
		--,m.idmovimiento
from movimiento m inner join deta_movimiento dm on m.idmovimiento=dm.idmovimiento
                  inner join bien b on dm.idbien=b.idbien
				  inner join unidadmedida um on b.idunidadmedida=um.idunidadmedida' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VS_TRA_ACUERDO_ARTICULO]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[VS_TRA_ACUERDO_ARTICULO]
AS
SELECT Nro_Acuerdo,Nro_Articulo,Sumilla_Articulo,CASE WHEN Tramite=1 THEN ''SI'' ELSE ''NO'' END AS Tramite,ISNULL(Nro_Tramite,0) AS Nro_Tramite
FROM Tra_Articulo_Acuerdo' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_tra_listar_movimiento_tramite]'))
EXEC dbo.sp_executesql @statement = N'CREATE view vs_tra_listar_movimiento_tramite
as
SELECT     m.IdMovimiento, RIGHT(m.IdMovimiento, 6) AS nummovimiento, m.IdTramite, m.IdTramite AS numtramite, m.IdEmpleado AS idempleado_emisor, 
                      e.nombre AS desempleado_emisor, c.idcargo AS idcargo_emisor, c.cargo AS descargo_emisor, c.idareaorganiz AS idarea_emisor, 
                      c.areaorganizacional AS desarea_emisor, dbo.FormatDateLaboral(t.FechaEmision) AS f_emision_tramite, t.Estado AS estado_tramite, t.Asunto, 
                      m.NumRecepcion, t.IdAreaOrganiz AS IdAreaProc, t.desareatramite AS DesAreaProc, p.IdProcedimiento, p.Descripcion, p.Ambito, 
                      dbo.FormatDateLaboral(m.FechaIngreso) AS f_ingreso_etapa, m.AreaIngreso, a1.AreaOrganizacional AS desareaingreso, 
                      dbo.FormatDateLaboral(m.FechaSalida) AS f_salida_etapa, m.AreaDestino, a2.AreaOrganizacional AS desareadestino, m.IdEtapaProc, 
                      ep.Descripcion AS desetapa, peac.idcargo AS idcargo_responsable, peac.cargo AS cargo_responsable, m.TiempoDias AS tiempodias_etapa, 
                      m.TiempoHrs AS tiempohrs_etapa, ISNULL(m.TiempoMin, 0) AS TiempoMin_etapa, m.Estado AS estado_etapa, t.IdTipoSilencio, t.destiposilencio, 
                      t.FechaAprobacion, t.PersonaRechazo, dbo.TRA_CargoRechazo(t.PersonaRechazo) AS cargorechazo, t.FechaRechazo, t.AreaRechazo, 
                      ISNULL(m.Doc_Fisico, 0) AS Doc_Fisico, t.MotivoRechazo, m.MovimientoDestino, dbo.FormatDateLaboral(dbo.Get_DateFinishTra(m.FechaIngreso, 
                      m.TiempoDias, m.TiempoHrs, m.TiempoMin)) AS T_Salida_O_Etapa, CASE WHEN m.fechaingreso IS NULL THEN NULL 
                      ELSE CASE WHEN dbo.Get_DateFinishTra(m.fechaingreso, m.TiempoDias, m.TiempoHrs, m.TiempoMin)<= getdate() 
                      THEN ''Atrasado'' ELSE ''A Tiempo'' END END AS Puntualidad_Etapa, dbo.Tra_T_Restante_Excedido(dbo.Get_DateFinishTra(m.FechaIngreso, 
                      ISNULL(m.TiempoDias, 0), ISNULL(m.TiempoHrs, 0), ISNULL(m.TiempoMin, 0)), GETDATE()) AS T_Excedido_Restante_Etapa, ISNULL(tra.TiempoDias, 
                      0) AS T_Dias_Tramite, ISNULL(tra.TiempoHrs, 0) AS T_Hrs_Tramite, ISNULL(tra.TiempoMin, 0) AS T_Min_Tramite, 
                      dbo.FormatDateLaboral(dbo.Get_DateFinishTra(t.FechaEmision, ISNULL(tra.TiempoDias, 0), ISNULL(tra.TiempoHrs, 0), ISNULL(tra.TiempoMin, 0))) 
                      AS T_Salida_O_Tramite, CASE WHEN t .fechaemision IS NULL THEN NULL ELSE CASE WHEN dbo.Get_DateFinishTra(t .fechaemision, tra.tiempodias, 
                      tra.tiempohrs, tra.tiempoMin) < getdate() THEN ''Atrasado'' ELSE ''A Tiempo'' END END AS Puntualidad_Tramite, 
                      dbo.Tra_T_Restante_Excedido(dbo.Get_DateFinishTra(t.FechaEmision, ISNULL(tra.TiempoDias, 0), ISNULL(tra.TiempoHrs, 0), ISNULL(tra.TiempoMin, 
                      0)), GETDATE()) AS T_Excedido_Restante_Tramite, t.IdDocumento, t.Doc_Codigo, t.desc_TipoDoc, t.Referencia, t.suscritopor
FROM         dbo.TRAMovimiento AS m INNER JOIN
                      dbo.vs_TRA_ListarTramite AS t ON m.IdTramite = t.IdTramite INNER JOIN
                      dbo.TRATramite AS tra ON t.IdTramite = tra.IdTramite INNER JOIN
                      dbo.EstructOrganiz AS a1 ON m.AreaIngreso = a1.idAreaOrganiz AND m.Anio = a1.Year INNER JOIN
                      dbo.vs_PER_ListarEmpleados AS e ON m.IdEmpleado = e.idempleado INNER JOIN
                      dbo.vs_tra_usuario_area_cargo AS c ON m.IdEmpleado = c.idempleado INNER JOIN
                      dbo.vs_tra_proc_etapa_area_cargo AS peac ON m.IdEtapaProc = peac.idetapaproc LEFT OUTER JOIN
                      dbo.EstructOrganiz AS a2 ON m.AreaDestino = a2.idAreaOrganiz AND m.Anio = a2.Year LEFT OUTER JOIN
                      dbo.TRAEtapa_Procedimiento AS ep ON m.IdEtapaProc = ep.IdEtapaProc LEFT OUTER JOIN
                      dbo.TRAProcedimiento AS p ON t.IdProcedimiento = p.IdProcedimiento' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_tra_listar_movimiento_tramite_G]'))
EXEC dbo.sp_executesql @statement = N'CREATE view vs_tra_listar_movimiento_tramite_G
as
SELECT     X.IdMovimiento, X.nummovimiento, X.IdTramite, X.numtramite, X.idempleado_emisor, X.desempleado_emisor, X.idcargo_emisor, X.descargo_emisor, 
                      X.idarea_emisor, X.desarea_emisor, X.f_emision_tramite, 
                      CASE WHEN x.estado_tramite = ''PE'' THEN ''Pendiente'' WHEN x.estado_tramite = ''RE'' THEN ''Por Recepcionar'' WHEN X.estado_tramite = ''TR'' THEN ''En Ejecucion''
                       WHEN x.estado_tramite = ''XX'' THEN ''Observado'' WHEN x.estado_tramite = ''OK'' THEN ''Finalizado'' END AS estado_tramite, X.Asunto, 
                      X.NumRecepcion, X.IdAreaProc, X.DesAreaProc, X.IdProcedimiento, X.Descripcion, X.Ambito, X.f_ingreso_etapa, X.AreaIngreso, X.desareaingreso, 
                      X.f_salida_etapa, X.AreaDestino, X.desareadestino, X.IdEtapaProc, X.desetapa, X.idcargo_responsable, X.cargo_responsable, X.tiempodias_etapa, 
                      X.tiempohrs_etapa, X.TiempoMin_etapa, X.estado_etapa, X.IdTipoSilencio, X.destiposilencio, X.FechaAprobacion, X.PersonaRechazo, 
                      dbo.TRA_CargoRechazo(X.PersonaRechazo) AS cargorechazo, X.FechaRechazo, X.AreaRechazo, X.MotivoRechazo, X.MovimientoDestino, 
                      X.T_Salida_O_Etapa, X.Puntualidad_Etapa, X.T_Excedido_Restante_Etapa, X.T_Dias_Tramite, X.T_Hrs_Tramite, X.T_Min_Tramite, 
                      X.T_Salida_O_Tramite, X.Puntualidad_Tramite, X.T_Excedido_Restante_Tramite, X.IdDocumento, X.Referencia, X.suscritopor, ISNULL(X.Doc_Codigo, 
                      '''') AS Doc_Codigo
FROM         (SELECT     IdMovimiento, nummovimiento, IdTramite, numtramite, idempleado_emisor, desempleado_emisor, idcargo_emisor, descargo_emisor, 
                                              idarea_emisor, desarea_emisor, f_emision_tramite, estado_tramite, Asunto, NumRecepcion, IdAreaProc, DesAreaProc, IdProcedimiento, 
                                              Descripcion, Ambito, f_ingreso_etapa, AreaIngreso, desareaingreso, f_salida_etapa, AreaDestino, desareadestino, IdEtapaProc, desetapa, 
                                              idcargo_responsable, cargo_responsable, tiempodias_etapa, tiempohrs_etapa, TiempoMin_etapa, estado_etapa, IdTipoSilencio, 
                                              destiposilencio, FechaAprobacion, PersonaRechazo, FechaRechazo, AreaRechazo, MotivoRechazo, MovimientoDestino, 
                                              T_Salida_O_Etapa, Puntualidad_Etapa, T_Excedido_Restante_Etapa, T_Dias_Tramite, T_Hrs_Tramite, T_Min_Tramite, T_Salida_O_Tramite,
                                               Puntualidad_Tramite, T_Excedido_Restante_Tramite, IdDocumento, Referencia, suscritopor, Doc_Codigo
                       FROM          dbo.vs_tra_listar_movimiento_tramite) AS X INNER JOIN
                          (SELECT     w.IdTramite, w.IdEtapaProc, w.idmovimiento
                            FROM          (SELECT     IdTramite, IdEtapaProc, MAX(IdMovimiento) AS idmovimiento
                                                    FROM          dbo.vs_tra_listar_movimiento_tramite
                                                    GROUP BY IdTramite, IdEtapaProc) AS w INNER JOIN
                                                       (SELECT     IdTramite, MIN(IdEtapaProc) AS idetapaproc
                                                         FROM          dbo.vs_tra_listar_movimiento_tramite
                                                         GROUP BY IdTramite) AS Q ON w.IdTramite = Q.IdTramite AND w.IdEtapaProc = Q.idetapaproc) AS y ON X.IdTramite = y.IdTramite AND 
                      X.IdEtapaProc = y.IdEtapaProc AND X.IdMovimiento = y.idmovimiento' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_TRA_ListarEtapaProcedimiento]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view vs_tra_listaretapaprocedimiento
as 
SELECT RIGHT(ep.IdEtapaProc, 2) AS codigo, ep.IdEtapaProc, ep.Descripcion, isnull(ep.TiempoDias,0) as Dias ,isnull(ep.TiempoHrs,0) as Horas,
       isnull(ep.tiempoMin,0) as Minutos, ep.IdTipoDoc, ep.Observaciones,ep.Year AS anio, ep.idAreaOrganiz, e.AreaOrganizacional AS desarea, 
       ep.IdCargo, c.Cargo, ep.IdProcedimiento, ep.Item,
       cast(isnull(ep.TiempoDias,0) as varchar(2)) + '' Dia(s) : '' + cast(isnull(ep.TiempoHrs,0) as varchar(2)) + '' Hora(s) : '' + cast(isnull(ep.tiempoMin,0) as varchar(2)) + '' Min(s)'' as Tiempo, 
       ep.EtapaAnterior, ep.Estado, ep.SecStandard, ep.SecAlterna
FROM dbo.TRAEtapa_Procedimiento AS ep INNER JOIN
     dbo.EstructOrganiz AS e ON ep.idAreaOrganiz = e.idAreaOrganiz AND ep.Year = e.Year INNER JOIN
     dbo.Cargo AS c ON ep.IdCargo = c.IdCargo
' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_TRA_ListarMovimiento]'))
EXEC dbo.sp_executesql @statement = N'
CREATE view vs_TRA_ListarMovimiento
as

SELECT     m.IdMovimiento, RIGHT(m.IdMovimiento, 6) AS nummovimiento, RIGHT(m.IdTramite, 6) AS numtramite, m.IdTramite, t.FechaEmision AS fechatramite, 
                      t.Asunto, t.IdAreaOrganiz, t.desareatramite, m.FechaIngreso, m.NumRecepcion, m.AreaIngreso, e.AreaOrganizacional AS desareaingreso, 
                      m.IdEmpleado, p.nombre AS desempleado, m.Estado, m.FechaSalida, m.AreaDestino, de.AreaOrganizacional AS desareadestino, m.TiempoDias, 
                      m.TiempoHrs, isnull(m.tiempoMin,0) as TiempoMin, ep.Descripcion AS desetapa, m.IdEtapaProc, t.IdTipoSilencio, t.destiposilencio, m.MovimientoDestino, t.Estado AS estadotramite, 
                      CASE WHEN dbo.TRA_VerificarAtraso(m.tiempodias, m.tiempohrs, m.fechaingreso) > 0 THEN ''NO'' ELSE ''SI'' END AS atrasado,
                          (SELECT     ISNULL(tm.FechaSalida, tr.FechaTramite) AS Expr1
                            FROM          dbo.TRAMovimiento AS tm INNER JOIN
                                                   dbo.TRATramite AS tr ON tm.IdTramite = tr.IdTramite
                            WHERE      (tm.IdMovimiento = m.IdMovimiento)) AS fechaenvio, tp.Ambito, tp.IdProcedimiento
FROM         dbo.TRAMovimiento AS m INNER JOIN
                      dbo.vs_TRA_ListarTramite AS t ON m.IdTramite = t.IdTramite INNER JOIN
                      dbo.EstructOrganiz AS e ON m.AreaIngreso = e.idAreaOrganiz AND m.Anio = e.Year INNER JOIN
                      dbo.vs_PER_ListarEmpleados AS p ON m.IdEmpleado = p.idempleado LEFT OUTER JOIN
                      dbo.EstructOrganiz AS de ON m.AreaDestino = de.idAreaOrganiz AND m.Anio = de.Year LEFT OUTER JOIN
                      dbo.TRAEtapa_Procedimiento AS ep ON m.IdEtapaProc = ep.IdEtapaProc LEFT OUTER JOIN
                      dbo.TRAProcedimiento AS tp ON t.IdProcedimiento = tp.IdProcedimiento' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_tra_ListarMovimientoTiempo]'))
EXEC dbo.sp_executesql @statement = N'

CREATE view vs_tra_ListarMovimientoTiempo
as
SELECT  idmovimiento, 
        nummovimiento, 
        numtramite, 
        idtramite, 
        fechatramite, 
        asunto, 
        idareaorganiz, 
        desareatramite, 
        fechaingreso, 
        numrecepcion, 
        areaingreso, 
        desareaingreso, 
        idempleado, 
        desempleado, 
        estado, 
        fechasalida, 
        areadestino, 
        desareadestino, 
        tiempodias, 
        tiempohrs, 
        desetapa, 
        idetapaproc, 
        idtiposilencio, 
        destiposilencio, 
        movimientodestino, 
        estadotramite, 
        atrasado, 
        fechaenvio, 
        ambito, 
        idprocedimiento, 
		dbo.Get_DateFinishTra(fechaingreso,TiempoDias,TiempoHrs,TiempoMin) as T_SalidaEtapa,
        (fechaingreso + tiempodias + dbo.TRA_NroDiaAdd(tiempohrs)) + tiempohrs / 24 AS T_SalidaEtapa2, 
		ISNULL(fechasalida, GETDATE()) AS T_Transcurrido, 
        CASE WHEN dbo.Get_DateFinishTra(fechaingreso,TiempoDias,TiempoHrs,TiempoMin)< isnull(fechasalida, getdate())  THEN ''Atrasado'' ELSE ''A Tiempo'' END AS EstadoReal, 
        CASE WHEN dbo.Get_DateFinishTra(fechaingreso,TiempoDias,TiempoHrs,TiempoMin)< isnull(fechasalida, getdate())  THEN (isnull(fechasalida, getdate()) - dbo.Get_DateFinishTra(fechaingreso,TiempoDias,TiempoHrs,TiempoMin) )
             ELSE dbo.Get_DateFinishTra(fechaingreso,TiempoDias,TiempoHrs,TiempoMin) - isnull(fechasalida, getdate()) 
             END AS T_Diferencia, 
	    dbo.Tra_T_Restante_Excedido(dbo.Get_DateFinishTra(fechaingreso,TiempoDias,TiempoHrs,TiempoMin), ISNULL(fechasalida, GETDATE())) AS T_Excedido_Restante

FROM    dbo.vs_TRA_ListarMovimiento' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_tra_ListarProcArea]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.vs_tra_ListarProcArea
AS
SELECT     p.IdProcedimiento, p.Descripcion, p.Ambito, p.IdAreaOrganiz AS areatramite, ep.idAreaOrganiz AS areainicio, ISNULL(p.TiempoDias, 0) AS tiempodias, 
                      ISNULL(p.TiempoHrs, 0) AS tiempohrs, ISNULL(p.TiempoMin, 0) AS tiempomin, p.Tipo, p.TraCodigo, p.Estado, p.Anio
FROM         dbo.TRAEtapa_Procedimiento AS ep RIGHT OUTER JOIN
                      dbo.TRAProcedimiento AS p ON ep.IdProcedimiento = p.IdProcedimiento
WHERE     (ep.Item = 1) OR
                      (ep.IdEtapaProc IS NULL) AND (p.Estado = 1)
' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_TRA_ListarProcedimiento]'))
EXEC dbo.sp_executesql @statement = N'CREATE view vs_tra_listarprocedimiento
as 
SELECT p.IdProcedimiento, RIGHT(p.IdProcedimiento, 4) AS codigoid, p.TraCodigo AS codigo, p.Descripcion, p.IdTipoSilencio, 
       isnull(p.TiempoDias,0) as Dias,  isnull(p.TiempoHrs,0) as Horas, isnull(p.tiempoMin,0) as Minutos, 
       cast(isnull(p.TiempoDias,0) as varchar(2)) + '' Dia(s) : '' + cast(isnull(p.TiempoHrs,0) as varchar(2)) + '' Hora(s) : '' + cast(isnull(p.tiempoMin,0) as varchar(2)) + '' Min(s)'' as Tiempo,
       ts.Descripcion AS destiposilencio, p.Observaciones, p.Anio, p.Estado, p.IdAreaOrganiz, e.AreaOrganizacional AS desarea, p.Tipo, p.Ambito
FROM dbo.TRAProcedimiento AS p INNER JOIN
     dbo.TRATipoSilencio AS ts ON p.IdTipoSilencio = ts.IdTipoSilencio LEFT OUTER JOIN
     dbo.EstructOrganiz AS e ON p.IdAreaOrganiz = e.idAreaOrganiz AND p.Anio = e.Year 

' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_TRA_ListarTramite]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[vs_TRA_ListarTramite]
AS
SELECT t.IdTramite, RIGHT(t.IdTramite, 6) AS numtramite, t.Anio, t.IdProcedimiento, p.Descripcion AS desprocedimiento, t.Estado, 
                    CASE t .estado WHEN ''RE'' THEN ''POR RECEPCIONAR'' 
                                   WHEN ''PE'' THEN ''PENDIENTE'' 
                                   WHEN ''TR'' THEN ''EN ATENCION'' 
                                   WHEN ''OK'' THEN ''ATENDIDO''
								   WHEN ''XX'' THEN ''OBSERVADO'' END AS desestado, t.IdDocumento,d.codigo as Doc_Codigo,  td.descripcion as desc_TipoDoc, 
                    d.FechaEmision, d.Asunto, d.Referencia, d.Folio, d.suscritopor,t.IdAreaOrganiz, e.AreaOrganizacional AS desareatramite, 
                    a.AreaOrganizacional AS desareadoc, p.IdTipoSilencio, ts.Descripcion AS destiposilencio, t.FechaAprobacion, t.PersonaRechazo, 
                    t.FechaRechazo, t.AreaRechazo, t.MotivoRechazo
FROM dbo.TRATramite AS t INNER JOIN
                    dbo.TRAProcedimiento AS p ON t.IdProcedimiento = p.IdProcedimiento INNER JOIN
                    dbo.TRADocumento AS d ON t.IdDocumento = d.IdDocumento AND t.IdTipoDoc = d.IdTipoDoc AND t.IdAreaOrganiz = d.IdAreaOrganiz INNER JOIN
					dbo.tratipodoc as td on t.idtipodoc=td.idtipodoc inner join
					dbo.EstructOrganiz AS e ON t.IdAreaOrganiz = e.idAreaOrganiz AND e.Year = YEAR(GETDATE()) INNER JOIN
                    dbo.EstructOrganiz AS a ON d.IdAreaOrganiz = a.idAreaOrganiz AND a.Year = YEAR(GETDATE()) INNER JOIN
                    dbo.TRATipoSilencio AS ts ON p.IdTipoSilencio = ts.IdTipoSilencio' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_tra_proc_etapa_area_cargo]'))
EXEC dbo.sp_executesql @statement = N'CREATE view [dbo].[vs_tra_proc_etapa_area_cargo]
as

select 
p.idprocedimiento,
p.descripcion as Procedimiento, 
e.idetapaproc, 
e.descripcion as Etapa, 
e.idareaorganiz,
a.areaorganizacional as Area,
c.idcargo,
c.cargo as cargo

from TRAPROCEDIMIENTO p, TRAETAPA_PROCEDIMIENTO e, ESTRUCTORGANIZ a
, cargo c
where p.idprocedimiento= e.idprocedimiento and
	  e.idareaorganiz=a.idareaorganiz and
	  A.YEAR=YEAR(GETDATE()) AND
	  e.idcargo=c.idcargo' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_tra_Puntualidad_Tramite]'))
EXEC dbo.sp_executesql @statement = N'create view vs_tra_Puntualidad_Tramite
as 
select a.idtramite, b.idprocedimiento, 
       a.f_inicial,
       dbo.TRA_F_Salida_Oficial(c.tiempodias,c.tiempohrs,a.f_inicial) as f_salida_oficial,
	   a.f_final,
       case when  dbo.TRA_F_Salida_Oficial(c.tiempodias,c.tiempohrs,a.f_inicial) < a.f_final then ''Atrasado'' else ''A tiempo'' end as Puntualidad,
      dbo.tra_t_restante_excedido(dbo.TRA_F_Salida_Oficial(c.tiempodias,c.tiempohrs,a.f_inicial),a.f_final) as T_Excedido_Restante
from
(SELECT idtramite,
       min(fechaingreso) as F_Inicial, 
       max(fechasalida) as F_Final 
FROM TRAMovimiento
group by idtramite) A,
(select idtramite,idprocedimiento 
from tratramite) B,
(select idprocedimiento,tiempodias,tiempohrs
from traprocedimiento) C
where a.idtramite=b.idtramite and
	  b.idprocedimiento=c.idprocedimiento' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_tra_usuario_area_cargo]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW dbo.vs_tra_usuario_area_cargo
AS
SELECT     u.IdUsuario, u.Login, p.Nombres, p.Apellido_Paterno, p.Apellido_Materno, a.AreaOrganizacional, c.Cargo, e.IdEmpleado, e.IdPersona, ea.idAreaOrganiz, 
                      e.IdCargo
FROM         dbo.Empleado_Area AS ea INNER JOIN
                      dbo.Empleado AS e ON ea.IdEmpleado = e.IdEmpleado INNER JOIN
                      dbo.Usuario AS u ON e.IdEmpleado = u.IdEmpleado INNER JOIN
                      dbo.Persona AS p ON e.IdPersona = p.IdPersona INNER JOIN
                      dbo.Cargo AS c ON e.IdCargo = c.IdCargo INNER JOIN
                      dbo.EstructOrganiz AS a ON e.idAreaOrganiz = a.idAreaOrganiz
WHERE     (ea.Year = YEAR(GETDATE())) AND (a.Year = YEAR(GETDATE())) AND (u.Estado = 1)
' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_tra_Usuario_online]'))
EXEC dbo.sp_executesql @statement = N'CREATE view [dbo].[vs_tra_Usuario_online]
as
select a.idusuario,
       a.login,
       a.nombres,
       a.apellido_paterno,
       a.apellido_materno,
       a.areaorganizacional,
       a.cargo,
       a.idempleado,
       a.idpersona,
       a.idareaorganiz,
       a.idcargo,
       b.pc_name,
       b.ip_address,
	   b.estado 
from vs_tra_usuario_area_cargo a, 
     trausuario_ip b
where a.idusuario=b.idusuario' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vs_tra_Usuario_Tramite_PC_IP]'))
EXEC dbo.sp_executesql @statement = N'create view vs_tra_Usuario_Tramite_PC_IP
as
select b.idusuario, b.login,b.areaorganizacional,b.cargo
from 
vs_tra_proc_etapa_area_cargo a, vs_tra_usuario_area_cargo b
where a.idareaorganiz=b.idareaorganiz and a.idcargo=b.idcargo' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Applications]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Applications]
  AS SELECT [dbo].[aspnet_Applications].[ApplicationName], [dbo].[aspnet_Applications].[LoweredApplicationName], [dbo].[aspnet_Applications].[ApplicationId], [dbo].[aspnet_Applications].[Description]
  FROM [dbo].[aspnet_Applications]
  ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_MembershipUsers]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_MembershipUsers]
  AS SELECT [dbo].[aspnet_Membership].[UserId],
            [dbo].[aspnet_Membership].[PasswordFormat],
            [dbo].[aspnet_Membership].[MobilePIN],
            [dbo].[aspnet_Membership].[Email],
            [dbo].[aspnet_Membership].[LoweredEmail],
            [dbo].[aspnet_Membership].[PasswordQuestion],
            [dbo].[aspnet_Membership].[PasswordAnswer],
            [dbo].[aspnet_Membership].[IsApproved],
            [dbo].[aspnet_Membership].[IsLockedOut],
            [dbo].[aspnet_Membership].[CreateDate],
            [dbo].[aspnet_Membership].[LastLoginDate],
            [dbo].[aspnet_Membership].[LastPasswordChangedDate],
            [dbo].[aspnet_Membership].[LastLockoutDate],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAttemptWindowStart],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptCount],
            [dbo].[aspnet_Membership].[FailedPasswordAnswerAttemptWindowStart],
            [dbo].[aspnet_Membership].[Comment],
            [dbo].[aspnet_Users].[ApplicationId],
            [dbo].[aspnet_Users].[UserName],
            [dbo].[aspnet_Users].[MobileAlias],
            [dbo].[aspnet_Users].[IsAnonymous],
            [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Membership] INNER JOIN [dbo].[aspnet_Users]
      ON [dbo].[aspnet_Membership].[UserId] = [dbo].[aspnet_Users].[UserId]
  ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Profiles]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Profiles]
  AS SELECT [dbo].[aspnet_Profile].[UserId], [dbo].[aspnet_Profile].[LastUpdatedDate],
      [DataSize]=  DATALENGTH([dbo].[aspnet_Profile].[PropertyNames])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesString])
                 + DATALENGTH([dbo].[aspnet_Profile].[PropertyValuesBinary])
  FROM [dbo].[aspnet_Profile]
  ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Roles]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Roles]
  AS SELECT [dbo].[aspnet_Roles].[ApplicationId], [dbo].[aspnet_Roles].[RoleId], [dbo].[aspnet_Roles].[RoleName], [dbo].[aspnet_Roles].[LoweredRoleName], [dbo].[aspnet_Roles].[Description]
  FROM [dbo].[aspnet_Roles]
  ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_Users]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_Users]
  AS SELECT [dbo].[aspnet_Users].[ApplicationId], [dbo].[aspnet_Users].[UserId], [dbo].[aspnet_Users].[UserName], [dbo].[aspnet_Users].[LoweredUserName], [dbo].[aspnet_Users].[MobileAlias], [dbo].[aspnet_Users].[IsAnonymous], [dbo].[aspnet_Users].[LastActivityDate]
  FROM [dbo].[aspnet_Users]
  ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_UsersInRoles]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_UsersInRoles]
  AS SELECT [dbo].[aspnet_UsersInRoles].[UserId], [dbo].[aspnet_UsersInRoles].[RoleId]
  FROM [dbo].[aspnet_UsersInRoles]
  ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_Paths]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Paths]
  AS SELECT [dbo].[aspnet_Paths].[ApplicationId], [dbo].[aspnet_Paths].[PathId], [dbo].[aspnet_Paths].[Path], [dbo].[aspnet_Paths].[LoweredPath]
  FROM [dbo].[aspnet_Paths]
  ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_Shared]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_Shared]
  AS SELECT [dbo].[aspnet_PersonalizationAllUsers].[PathId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationAllUsers].[PageSettings]), [dbo].[aspnet_PersonalizationAllUsers].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationAllUsers]
  ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_aspnet_WebPartState_User]'))
EXEC dbo.sp_executesql @statement = N'
  CREATE VIEW [dbo].[vw_aspnet_WebPartState_User]
  AS SELECT [dbo].[aspnet_PersonalizationPerUser].[PathId], [dbo].[aspnet_PersonalizationPerUser].[UserId], [DataSize]=DATALENGTH([dbo].[aspnet_PersonalizationPerUser].[PageSettings]), [dbo].[aspnet_PersonalizationPerUser].[LastUpdatedDate]
  FROM [dbo].[aspnet_PersonalizationPerUser]
  ' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[vw_Listar_Anticipos_Sin_Rendicion]'))
EXEC dbo.sp_executesql @statement = N'CREATE view vw_Listar_Anticipos_Sin_Rendicion
as
select 
A.RendicionTramitada,
(P.Apellido_Paterno + '' '' + P.Apellido_Materno + '', '' +P.Nombres ) as NombresCompletos,
A.idAnticipo,
A.Anio as Año,
A.Lugar,
A.FechaSalida,
A.FechaRegreso,
A.Monto,
A.FechaRegistroCP,
Substring(dbo.fDifFechas(getdate(),A.FechaRegistroCP),6,3) as Dias,
Substring(dbo.fDifFechas(getdate(),A.FechaRegistroCP),10,8) as Horas,
Estado=case 
when Substring(dbo.fDifFechas(getdate(),A.FechaRegistroCP),6,3)<=5 then ''1''
when Substring(dbo.fDifFechas(getdate(),A.FechaRegistroCP),6,3)>5 and Substring(dbo.fDifFechas(getdate(),A.FechaRegistroCP),6,3)<=15 then ''2'' when Substring(dbo.fDifFechas(getdate(),A.FechaRegistroCP),6,3)>15 then ''3''  End
from anticipo A
inner join Empleado E on A.idEmpleado=E.idEmpleado
inner join Persona P on P.idPersona=E.idPersona' 
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DE_230]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT DE_230
	AS 230'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_1100]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT DF_1100
	AS 1100'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_20]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT DF_20
	AS 20'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CERO]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT DF_CERO
	AS 0'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_EstructOrganiz_MontoAprobacion]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT DF_EstructOrganiz_MontoAprobacion
	AS (0)'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_OCHO]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT DF_OCHO
	AS 8'
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_UNO]') AND OBJECTPROPERTY(object_id, N'IsDefault') = 1)
EXEC dbo.sp_executesql N'CREATE DEFAULT DF_UNO
	AS 1'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Aba_Meta_ListarAnio]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Aba_Meta_ListarAnio] AS' 
END
GO
ALTER procedure [dbo].[Aba_Meta_ListarAnio]
@Anio char(4),@idcomponente char(100)
--WITH ENCRYPTION
as
select *
from vs_aba_listarmetas m
where m.anio=@anio and codigo like ltrim(rtrim(@idcomponente))
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aba_sp_ContratoDeta]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aba_sp_ContratoDeta] AS' 
END
GO

ALTER procedure [dbo].[aba_sp_ContratoDeta]
(
@idcontrato char(8),
@fecha char(4)
)
as
select ITEM,idbien,cantidadpro,preciopro,importepro,saldo,razonsocial,buenapro,descripcion,desunidad,tipo
from  Aba_vw_Adjudicacion_Consolidado_Contrato
where idcontrato=@idcontrato and year(fechacontrato)=@fecha

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aba_sp_ContratoMaster]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aba_sp_ContratoMaster] AS' 
END
GO
ALTER procedure [dbo].[aba_sp_ContratoMaster]
(
@idcontrato char(8),
@fecha char(4)
)
as
select idcontrato,fechacontrato,plazoentrega,monto,concepto,estadocontrato,idseleccion,desseleccion=tipoadjudicacion,razonsocial,buenapro
from  Aba_vw_Adjudicacion_Consolidado_Contrato
where idcontrato=@idcontrato and year(fechacontrato)=@fecha

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aba_sp_deta_consolidado_contrato]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aba_sp_deta_consolidado_contrato] AS' 
END
GO
ALTER procedure [dbo].[aba_sp_deta_consolidado_contrato]
(@idcontrato char(8),
 @saldo int)
as
select * 
from aba_vs_Deta_Consolidado_Contrato
where idcontrato=@idcontrato and cantidadsaldo>0
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aba_sp_Procedimiento_Req]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aba_sp_Procedimiento_Req] AS' 
END
GO
ALTER procedure [dbo].[aba_sp_Procedimiento_Req]
@codProc as char(6)
as 
--set @cod='090004'
select a.idprocedimiento,a.idrequisito,a.descripcion, case when b.idrequisito<>0 then 1 else 0 end as CheckReq
from
(select @codProc as idprocedimiento, idrequisito,descripcion 
from trarequisito ) a left join traprocedimiento_requisito b
on a.idrequisito=b.idrequisito and a.idprocedimiento=b.idprocedimiento
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[actualizarMateria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[actualizarMateria] AS' 
END
GO
ALTER procedure [dbo].[actualizarMateria]
@idmateria smallint ,
@descripcion varchar(80),
@estado bit
as 
UPDATE MATERIA SET descripcion = @descripcion,
estado=@estado WHERE idmateria = @idmateria

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_AnyDataInTables]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_AnyDataInTables] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_AnyDataInTables]
    @TablesToCheck int
AS
BEGIN
    -- Check Membership table if (@TablesToCheck & 1) is set
    IF ((@TablesToCheck & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Membership))
        BEGIN
            SELECT N'aspnet_Membership'
            RETURN
        END
    END

    -- Check aspnet_Roles table if (@TablesToCheck & 2) is set
    IF ((@TablesToCheck & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Roles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 RoleId FROM dbo.aspnet_Roles))
        BEGIN
            SELECT N'aspnet_Roles'
            RETURN
        END
    END

    -- Check aspnet_Profile table if (@TablesToCheck & 4) is set
    IF ((@TablesToCheck & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Profile))
        BEGIN
            SELECT N'aspnet_Profile'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 8) is set
    IF ((@TablesToCheck & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_PersonalizationPerUser))
        BEGIN
            SELECT N'aspnet_PersonalizationPerUser'
            RETURN
        END
    END

    -- Check aspnet_PersonalizationPerUser table if (@TablesToCheck & 16) is set
    IF ((@TablesToCheck & 16) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'aspnet_WebEvent_LogEvent') AND (type = 'P'))) )
    BEGIN
        IF (EXISTS(SELECT TOP 1 * FROM dbo.aspnet_WebEvent_Events))
        BEGIN
            SELECT N'aspnet_WebEvent_Events'
            RETURN
        END
    END

    -- Check aspnet_Users table if (@TablesToCheck & 1,2,4 & 8) are all set
    IF ((@TablesToCheck & 1) <> 0 AND
        (@TablesToCheck & 2) <> 0 AND
        (@TablesToCheck & 4) <> 0 AND
        (@TablesToCheck & 8) <> 0 AND
        (@TablesToCheck & 32) <> 0 AND
        (@TablesToCheck & 128) <> 0 AND
        (@TablesToCheck & 256) <> 0 AND
        (@TablesToCheck & 512) <> 0 AND
        (@TablesToCheck & 1024) <> 0)
    BEGIN
        IF (EXISTS(SELECT TOP 1 UserId FROM dbo.aspnet_Users))
        BEGIN
            SELECT N'aspnet_Users'
            RETURN
        END
        IF (EXISTS(SELECT TOP 1 ApplicationId FROM dbo.aspnet_Applications))
        BEGIN
            SELECT N'aspnet_Applications'
            RETURN
        END
    END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Applications_CreateApplication]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Applications_CreateApplication] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Applications_CreateApplication]
    @ApplicationName      nvarchar(256),
    @ApplicationId        uniqueidentifier OUTPUT
AS
BEGIN
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName

    IF(@ApplicationId IS NULL)
    BEGIN
        DECLARE @TranStarted   bit
        SET @TranStarted = 0

        IF( @@TRANCOUNT = 0 )
        BEGIN
	        BEGIN TRANSACTION
	        SET @TranStarted = 1
        END
        ELSE
    	    SET @TranStarted = 0

        SELECT  @ApplicationId = ApplicationId
        FROM dbo.aspnet_Applications WITH (UPDLOCK, HOLDLOCK)
        WHERE LOWER(@ApplicationName) = LoweredApplicationName

        IF(@ApplicationId IS NULL)
        BEGIN
            SELECT  @ApplicationId = NEWID()
            INSERT  dbo.aspnet_Applications (ApplicationId, ApplicationName, LoweredApplicationName)
            VALUES  (@ApplicationId, @ApplicationName, LOWER(@ApplicationName))
        END


        IF( @TranStarted = 1 )
        BEGIN
            IF(@@ERROR = 0)
            BEGIN
	        SET @TranStarted = 0
	        COMMIT TRANSACTION
            END
            ELSE
            BEGIN
                SET @TranStarted = 0
                ROLLBACK TRANSACTION
            END
        END
    END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_CheckSchemaVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_CheckSchemaVersion] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_CheckSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    IF (EXISTS( SELECT  *
                FROM    dbo.aspnet_SchemaVersions
                WHERE   Feature = LOWER( @Feature ) AND
                        CompatibleSchemaVersion = @CompatibleSchemaVersion ))
        RETURN 0

    RETURN 1
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_ChangePasswordQuestionAndAnswer]
    @ApplicationName       nvarchar(256),
    @UserName              nvarchar(256),
    @NewPasswordQuestion   nvarchar(256),
    @NewPasswordAnswer     nvarchar(128)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Membership m, dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId
    IF (@UserId IS NULL)
    BEGIN
        RETURN(1)
    END

    UPDATE dbo.aspnet_Membership
    SET    PasswordQuestion = @NewPasswordQuestion, PasswordAnswer = @NewPasswordAnswer
    WHERE  UserId=@UserId
    RETURN(0)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_CreateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_CreateUser] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_CreateUser]
    @ApplicationName                        nvarchar(256),
    @UserName                               nvarchar(256),
    @Password                               nvarchar(128),
    @PasswordSalt                           nvarchar(128),
    @Email                                  nvarchar(256),
    @PasswordQuestion                       nvarchar(256),
    @PasswordAnswer                         nvarchar(128),
    @IsApproved                             bit,
    @CurrentTimeUtc                         datetime,
    @CreateDate                             datetime = NULL,
    @UniqueEmail                            int      = 0,
    @PasswordFormat                         int      = 0,
    @UserId                                 uniqueidentifier OUTPUT
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @NewUserId uniqueidentifier
    SELECT @NewUserId = NULL

    DECLARE @IsLockedOut bit
    SET @IsLockedOut = 0

    DECLARE @LastLockoutDate  datetime
    SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAttemptCount int
    SET @FailedPasswordAttemptCount = 0

    DECLARE @FailedPasswordAttemptWindowStart  datetime
    SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @FailedPasswordAnswerAttemptCount int
    SET @FailedPasswordAnswerAttemptCount = 0

    DECLARE @FailedPasswordAnswerAttemptWindowStart  datetime
    SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )

    DECLARE @NewUserCreated bit
    DECLARE @ReturnValue   int
    SET @ReturnValue = 0

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    SET @CreateDate = @CurrentTimeUtc

    SELECT  @NewUserId = UserId FROM dbo.aspnet_Users WHERE LOWER(@UserName) = LoweredUserName AND @ApplicationId = ApplicationId
    IF ( @NewUserId IS NULL )
    BEGIN
        SET @NewUserId = @UserId
        EXEC @ReturnValue = dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CreateDate, @NewUserId OUTPUT
        SET @NewUserCreated = 1
    END
    ELSE
    BEGIN
        SET @NewUserCreated = 0
        IF( @NewUserId <> @UserId AND @UserId IS NOT NULL )
        BEGIN
            SET @ErrorCode = 6
            GOTO Cleanup
        END
    END

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @ReturnValue = -1 )
    BEGIN
        SET @ErrorCode = 10
        GOTO Cleanup
    END

    IF ( EXISTS ( SELECT UserId
                  FROM   dbo.aspnet_Membership
                  WHERE  @NewUserId = UserId ) )
    BEGIN
        SET @ErrorCode = 6
        GOTO Cleanup
    END

    SET @UserId = @NewUserId

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership m WITH ( UPDLOCK, HOLDLOCK )
                    WHERE ApplicationId = @ApplicationId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            SET @ErrorCode = 7
            GOTO Cleanup
        END
    END

    IF (@NewUserCreated = 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate = @CreateDate
        WHERE  @UserId = UserId
        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    INSERT INTO dbo.aspnet_Membership
                ( ApplicationId,
                  UserId,
                  Password,
                  PasswordSalt,
                  Email,
                  LoweredEmail,
                  PasswordQuestion,
                  PasswordAnswer,
                  PasswordFormat,
                  IsApproved,
                  IsLockedOut,
                  CreateDate,
                  LastLoginDate,
                  LastPasswordChangedDate,
                  LastLockoutDate,
                  FailedPasswordAttemptCount,
                  FailedPasswordAttemptWindowStart,
                  FailedPasswordAnswerAttemptCount,
                  FailedPasswordAnswerAttemptWindowStart )
         VALUES ( @ApplicationId,
                  @UserId,
                  @Password,
                  @PasswordSalt,
                  @Email,
                  LOWER(@Email),
                  @PasswordQuestion,
                  @PasswordAnswer,
                  @PasswordFormat,
                  @IsApproved,
                  @IsLockedOut,
                  @CreateDate,
                  @CreateDate,
                  @CreateDate,
                  @LastLockoutDate,
                  @FailedPasswordAttemptCount,
                  @FailedPasswordAttemptWindowStart,
                  @FailedPasswordAnswerAttemptCount,
                  @FailedPasswordAnswerAttemptWindowStart )

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_FindUsersByEmail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_FindUsersByEmail]
    @ApplicationName       nvarchar(256),
    @EmailToMatch          nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    IF( @EmailToMatch IS NULL )
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.Email IS NULL
            ORDER BY m.LoweredEmail
    ELSE
        INSERT INTO #PageIndexForUsers (UserId)
            SELECT u.UserId
            FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
            WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND m.LoweredEmail LIKE LOWER(@EmailToMatch)
            ORDER BY m.LoweredEmail

    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY m.LoweredEmail

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_FindUsersByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_FindUsersByName] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_FindUsersByName]
    @ApplicationName       nvarchar(256),
    @UserNameToMatch       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT u.UserId
        FROM   dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  u.ApplicationId = @ApplicationId AND m.UserId = u.UserId AND u.LoweredUserName LIKE LOWER(@UserNameToMatch)
        ORDER BY u.UserName


    SELECT  u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName

    SELECT  @TotalRecords = COUNT(*)
    FROM    #PageIndexForUsers
    RETURN @TotalRecords
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetAllUsers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetAllUsers] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_GetAllUsers]
    @ApplicationName       nvarchar(256),
    @PageIndex             int,
    @PageSize              int
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN 0


    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
    SELECT u.UserId
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u
    WHERE  u.ApplicationId = @ApplicationId AND u.UserId = m.UserId
    ORDER BY u.UserName

    SELECT @TotalRecords = @@ROWCOUNT

    SELECT u.UserName, m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate,
            m.LastLoginDate,
            u.LastActivityDate,
            m.LastPasswordChangedDate,
            u.UserId, m.IsLockedOut,
            m.LastLockoutDate
    FROM   dbo.aspnet_Membership m, dbo.aspnet_Users u, #PageIndexForUsers p
    WHERE  u.UserId = p.UserId AND u.UserId = m.UserId AND
           p.IndexId >= @PageLowerBound AND p.IndexId <= @PageUpperBound
    ORDER BY u.UserName
    RETURN @TotalRecords
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetNumberOfUsersOnline]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_GetNumberOfUsersOnline]
    @ApplicationName            nvarchar(256),
    @MinutesSinceLastInActive   int,
    @CurrentTimeUtc             datetime
AS
BEGIN
    DECLARE @DateActive datetime
    SELECT  @DateActive = DATEADD(minute,  -(@MinutesSinceLastInActive), @CurrentTimeUtc)

    DECLARE @NumOnline int
    SELECT  @NumOnline = COUNT(*)
    FROM    dbo.aspnet_Users u(NOLOCK),
            dbo.aspnet_Applications a(NOLOCK),
            dbo.aspnet_Membership m(NOLOCK)
    WHERE   u.ApplicationId = a.ApplicationId                  AND
            LastActivityDate > @DateActive                     AND
            a.LoweredApplicationName = LOWER(@ApplicationName) AND
            u.UserId = m.UserId
    RETURN(@NumOnline)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetPassword] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_GetPassword]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @PasswordAnswer                 nvarchar(128) = NULL
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @PasswordFormat                         int
    DECLARE @Password                               nvarchar(128)
    DECLARE @passAns                                nvarchar(128)
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @Password = m.Password,
            @passAns = m.PasswordAnswer,
            @PasswordFormat = m.PasswordFormat,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    IF ( NOT( @PasswordAnswer IS NULL ) )
    BEGIN
        IF( ( @passAns IS NULL ) OR ( LOWER( @passAns ) <> LOWER( @PasswordAnswer ) ) )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
        ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    IF( @ErrorCode = 0 )
        SELECT @Password, @PasswordFormat

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetPasswordWithFormat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_GetPasswordWithFormat]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @UpdateLastLoginActivityDate    bit,
    @CurrentTimeUtc                 datetime
AS
BEGIN
    DECLARE @IsLockedOut                        bit
    DECLARE @UserId                             uniqueidentifier
    DECLARE @Password                           nvarchar(128)
    DECLARE @PasswordSalt                       nvarchar(128)
    DECLARE @PasswordFormat                     int
    DECLARE @FailedPasswordAttemptCount         int
    DECLARE @FailedPasswordAnswerAttemptCount   int
    DECLARE @IsApproved                         bit
    DECLARE @LastActivityDate                   datetime
    DECLARE @LastLoginDate                      datetime

    SELECT  @UserId          = NULL

    SELECT  @UserId = u.UserId, @IsLockedOut = m.IsLockedOut, @Password=Password, @PasswordFormat=PasswordFormat,
            @PasswordSalt=PasswordSalt, @FailedPasswordAttemptCount=FailedPasswordAttemptCount,
		    @FailedPasswordAnswerAttemptCount=FailedPasswordAnswerAttemptCount, @IsApproved=IsApproved,
            @LastActivityDate = LastActivityDate, @LastLoginDate = LastLoginDate
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF (@UserId IS NULL)
        RETURN 1

    IF (@IsLockedOut = 1)
        RETURN 99

    SELECT   @Password, @PasswordFormat, @PasswordSalt, @FailedPasswordAttemptCount,
             @FailedPasswordAnswerAttemptCount, @IsApproved, @LastLoginDate, @LastActivityDate

    IF (@UpdateLastLoginActivityDate = 1 AND @IsApproved = 1)
    BEGIN
        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @CurrentTimeUtc
        WHERE   UserId = @UserId

        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @CurrentTimeUtc
        WHERE   @UserId = UserId
    END


    RETURN 0
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByEmail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_GetUserByEmail]
    @ApplicationName  nvarchar(256),
    @Email            nvarchar(256)
AS
BEGIN
    IF( @Email IS NULL )
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                m.LoweredEmail IS NULL
    ELSE
        SELECT  u.UserName
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                u.UserId = m.UserId AND
                LOWER(@Email) = m.LoweredEmail

    IF (@@rowcount = 0)
        RETURN(1)
    RETURN(0)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByName] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_GetUserByName]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier

    IF (@UpdateLastActivity = 1)
    BEGIN
        -- select user ID from aspnet_users table
        SELECT TOP 1 @UserId = u.UserId
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1

        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        WHERE    @UserId = UserId

        SELECT m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut, m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE  @UserId = u.UserId AND u.UserId = m.UserId 
    END
    ELSE
    BEGIN
        SELECT TOP 1 m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
                m.CreateDate, m.LastLoginDate, u.LastActivityDate, m.LastPasswordChangedDate,
                u.UserId, m.IsLockedOut,m.LastLockoutDate
        FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m
        WHERE    LOWER(@ApplicationName) = a.LoweredApplicationName AND
                u.ApplicationId = a.ApplicationId    AND
                LOWER(@UserName) = u.LoweredUserName AND u.UserId = m.UserId

        IF (@@ROWCOUNT = 0) -- Username not found
            RETURN -1
    END

    RETURN 0
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_GetUserByUserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_GetUserByUserId]
    @UserId               uniqueidentifier,
    @CurrentTimeUtc       datetime,
    @UpdateLastActivity   bit = 0
AS
BEGIN
    IF ( @UpdateLastActivity = 1 )
    BEGIN
        UPDATE   dbo.aspnet_Users
        SET      LastActivityDate = @CurrentTimeUtc
        FROM     dbo.aspnet_Users
        WHERE    @UserId = UserId

        IF ( @@ROWCOUNT = 0 ) -- User ID not found
            RETURN -1
    END

    SELECT  m.Email, m.PasswordQuestion, m.Comment, m.IsApproved,
            m.CreateDate, m.LastLoginDate, u.LastActivityDate,
            m.LastPasswordChangedDate, u.UserName, m.IsLockedOut,
            m.LastLockoutDate
    FROM    dbo.aspnet_Users u, dbo.aspnet_Membership m
    WHERE   @UserId = u.UserId AND u.UserId = m.UserId

    IF ( @@ROWCOUNT = 0 ) -- User ID not found
       RETURN -1

    RETURN 0
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_ResetPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_ResetPassword] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_ResetPassword]
    @ApplicationName             nvarchar(256),
    @UserName                    nvarchar(256),
    @NewPassword                 nvarchar(128),
    @MaxInvalidPasswordAttempts  int,
    @PasswordAttemptWindow       int,
    @PasswordSalt                nvarchar(128),
    @CurrentTimeUtc              datetime,
    @PasswordFormat              int = 0,
    @PasswordAnswer              nvarchar(128) = NULL
AS
BEGIN
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @UserId                                 uniqueidentifier
    SET     @UserId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    SELECT @IsLockedOut = IsLockedOut,
           @LastLockoutDate = LastLockoutDate,
           @FailedPasswordAttemptCount = FailedPasswordAttemptCount,
           @FailedPasswordAttemptWindowStart = FailedPasswordAttemptWindowStart,
           @FailedPasswordAnswerAttemptCount = FailedPasswordAnswerAttemptCount,
           @FailedPasswordAnswerAttemptWindowStart = FailedPasswordAnswerAttemptWindowStart
    FROM dbo.aspnet_Membership WITH ( UPDLOCK )
    WHERE @UserId = UserId

    IF( @IsLockedOut = 1 )
    BEGIN
        SET @ErrorCode = 99
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Membership
    SET    Password = @NewPassword,
           LastPasswordChangedDate = @CurrentTimeUtc,
           PasswordFormat = @PasswordFormat,
           PasswordSalt = @PasswordSalt
    WHERE  @UserId = UserId AND
           ( ( @PasswordAnswer IS NULL ) OR ( LOWER( PasswordAnswer ) = LOWER( @PasswordAnswer ) ) )

    IF ( @@ROWCOUNT = 0 )
        BEGIN
            IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAnswerAttemptWindowStart ) )
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = 1
            END
            ELSE
            BEGIN
                SET @FailedPasswordAnswerAttemptWindowStart = @CurrentTimeUtc
                SET @FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount + 1
            END

            BEGIN
                IF( @FailedPasswordAnswerAttemptCount >= @MaxInvalidPasswordAttempts )
                BEGIN
                    SET @IsLockedOut = 1
                    SET @LastLockoutDate = @CurrentTimeUtc
                END
            END

            SET @ErrorCode = 3
        END
    ELSE
        BEGIN
            IF( @FailedPasswordAnswerAttemptCount > 0 )
            BEGIN
                SET @FailedPasswordAnswerAttemptCount = 0
                SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            END
        END

    IF( NOT ( @PasswordAnswer IS NULL ) )
    BEGIN
        UPDATE dbo.aspnet_Membership
        SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
            FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
            FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
            FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
            FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
        WHERE @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_SetPassword]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_SetPassword] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_SetPassword]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @NewPassword      nvarchar(128),
    @PasswordSalt     nvarchar(128),
    @CurrentTimeUtc   datetime,
    @PasswordFormat   int = 0
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    UPDATE dbo.aspnet_Membership
    SET Password = @NewPassword, PasswordFormat = @PasswordFormat, PasswordSalt = @PasswordSalt,
        LastPasswordChangedDate = @CurrentTimeUtc
    WHERE @UserId = UserId
    RETURN(0)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UnlockUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UnlockUser] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_UnlockUser]
    @ApplicationName                         nvarchar(256),
    @UserName                                nvarchar(256)
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF ( @UserId IS NULL )
        RETURN 1

    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = 0,
        FailedPasswordAttemptCount = 0,
        FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        FailedPasswordAnswerAttemptCount = 0,
        FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 ),
        LastLockoutDate = CONVERT( datetime, '17540101', 112 )
    WHERE @UserId = UserId

    RETURN 0
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UpdateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUser] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_UpdateUser]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @Email                nvarchar(256),
    @Comment              ntext,
    @IsApproved           bit,
    @LastLoginDate        datetime,
    @LastActivityDate     datetime,
    @UniqueEmail          int,
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @UserId uniqueidentifier
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @UserId = NULL
    SELECT  @UserId = u.UserId, @ApplicationId = a.ApplicationId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a, dbo.aspnet_Membership m
    WHERE   LoweredUserName = LOWER(@UserName) AND
            u.ApplicationId = a.ApplicationId  AND
            LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.UserId = m.UserId

    IF (@UserId IS NULL)
        RETURN(1)

    IF (@UniqueEmail = 1)
    BEGIN
        IF (EXISTS (SELECT *
                    FROM  dbo.aspnet_Membership WITH (UPDLOCK, HOLDLOCK)
                    WHERE ApplicationId = @ApplicationId  AND @UserId <> UserId AND LoweredEmail = LOWER(@Email)))
        BEGIN
            RETURN(7)
        END
    END

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    UPDATE dbo.aspnet_Users WITH (ROWLOCK)
    SET
         LastActivityDate = @LastActivityDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    UPDATE dbo.aspnet_Membership WITH (ROWLOCK)
    SET
         Email            = @Email,
         LoweredEmail     = LOWER(@Email),
         Comment          = @Comment,
         IsApproved       = @IsApproved,
         LastLoginDate    = @LastLoginDate
    WHERE
       @UserId = UserId

    IF( @@ERROR <> 0 )
        GOTO Cleanup

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN -1
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Membership_UpdateUserInfo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Membership_UpdateUserInfo]
    @ApplicationName                nvarchar(256),
    @UserName                       nvarchar(256),
    @IsPasswordCorrect              bit,
    @UpdateLastLoginActivityDate    bit,
    @MaxInvalidPasswordAttempts     int,
    @PasswordAttemptWindow          int,
    @CurrentTimeUtc                 datetime,
    @LastLoginDate                  datetime,
    @LastActivityDate               datetime
AS
BEGIN
    DECLARE @UserId                                 uniqueidentifier
    DECLARE @IsApproved                             bit
    DECLARE @IsLockedOut                            bit
    DECLARE @LastLockoutDate                        datetime
    DECLARE @FailedPasswordAttemptCount             int
    DECLARE @FailedPasswordAttemptWindowStart       datetime
    DECLARE @FailedPasswordAnswerAttemptCount       int
    DECLARE @FailedPasswordAnswerAttemptWindowStart datetime

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    SELECT  @UserId = u.UserId,
            @IsApproved = m.IsApproved,
            @IsLockedOut = m.IsLockedOut,
            @LastLockoutDate = m.LastLockoutDate,
            @FailedPasswordAttemptCount = m.FailedPasswordAttemptCount,
            @FailedPasswordAttemptWindowStart = m.FailedPasswordAttemptWindowStart,
            @FailedPasswordAnswerAttemptCount = m.FailedPasswordAnswerAttemptCount,
            @FailedPasswordAnswerAttemptWindowStart = m.FailedPasswordAnswerAttemptWindowStart
    FROM    dbo.aspnet_Applications a, dbo.aspnet_Users u, dbo.aspnet_Membership m WITH ( UPDLOCK )
    WHERE   LOWER(@ApplicationName) = a.LoweredApplicationName AND
            u.ApplicationId = a.ApplicationId    AND
            u.UserId = m.UserId AND
            LOWER(@UserName) = u.LoweredUserName

    IF ( @@rowcount = 0 )
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    IF( @IsLockedOut = 1 )
    BEGIN
        GOTO Cleanup
    END

    IF( @IsPasswordCorrect = 0 )
    BEGIN
        IF( @CurrentTimeUtc > DATEADD( minute, @PasswordAttemptWindow, @FailedPasswordAttemptWindowStart ) )
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = 1
        END
        ELSE
        BEGIN
            SET @FailedPasswordAttemptWindowStart = @CurrentTimeUtc
            SET @FailedPasswordAttemptCount = @FailedPasswordAttemptCount + 1
        END

        BEGIN
            IF( @FailedPasswordAttemptCount >= @MaxInvalidPasswordAttempts )
            BEGIN
                SET @IsLockedOut = 1
                SET @LastLockoutDate = @CurrentTimeUtc
            END
        END
    END
    ELSE
    BEGIN
        IF( @FailedPasswordAttemptCount > 0 OR @FailedPasswordAnswerAttemptCount > 0 )
        BEGIN
            SET @FailedPasswordAttemptCount = 0
            SET @FailedPasswordAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @FailedPasswordAnswerAttemptCount = 0
            SET @FailedPasswordAnswerAttemptWindowStart = CONVERT( datetime, '17540101', 112 )
            SET @LastLockoutDate = CONVERT( datetime, '17540101', 112 )
        END
    END

    IF( @UpdateLastLoginActivityDate = 1 )
    BEGIN
        UPDATE  dbo.aspnet_Users
        SET     LastActivityDate = @LastActivityDate
        WHERE   @UserId = UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END

        UPDATE  dbo.aspnet_Membership
        SET     LastLoginDate = @LastLoginDate
        WHERE   UserId = @UserId

        IF( @@ERROR <> 0 )
        BEGIN
            SET @ErrorCode = -1
            GOTO Cleanup
        END
    END


    UPDATE dbo.aspnet_Membership
    SET IsLockedOut = @IsLockedOut, LastLockoutDate = @LastLockoutDate,
        FailedPasswordAttemptCount = @FailedPasswordAttemptCount,
        FailedPasswordAttemptWindowStart = @FailedPasswordAttemptWindowStart,
        FailedPasswordAnswerAttemptCount = @FailedPasswordAnswerAttemptCount,
        FailedPasswordAnswerAttemptWindowStart = @FailedPasswordAnswerAttemptWindowStart
    WHERE @UserId = UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
	SET @TranStarted = 0
	COMMIT TRANSACTION
    END

    RETURN @ErrorCode

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Paths_CreatePath]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Paths_CreatePath] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Paths_CreatePath]
    @ApplicationId UNIQUEIDENTIFIER,
    @Path           NVARCHAR(256),
    @PathId         UNIQUEIDENTIFIER OUTPUT
AS
BEGIN
    BEGIN TRANSACTION
    IF (NOT EXISTS(SELECT * FROM dbo.aspnet_Paths WHERE LoweredPath = LOWER(@Path) AND ApplicationId = @ApplicationId))
    BEGIN
        INSERT dbo.aspnet_Paths (ApplicationId, Path, LoweredPath) VALUES (@ApplicationId, @Path, LOWER(@Path))
    END
    COMMIT TRANSACTION
    SELECT @PathId = PathId FROM dbo.aspnet_Paths WHERE LOWER(@Path) = LoweredPath AND ApplicationId = @ApplicationId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Personalization_GetApplicationId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Personalization_GetApplicationId] (
    @ApplicationName NVARCHAR(256),
    @ApplicationId UNIQUEIDENTIFIER OUT)
AS
BEGIN
    SELECT @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_DeleteAllState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_PersonalizationAdministration_DeleteAllState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Count int OUT)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        IF (@AllUsersScope = 1)
            DELETE FROM aspnet_PersonalizationAllUsers
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)
        ELSE
            DELETE FROM aspnet_PersonalizationPerUser
            WHERE PathId IN
               (SELECT Paths.PathId
                FROM dbo.aspnet_Paths Paths
                WHERE Paths.ApplicationId = @ApplicationId)

        SELECT @Count = @@ROWCOUNT
    END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_FindState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_PersonalizationAdministration_FindState] (
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @PageIndex              INT,
    @PageSize               INT,
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound INT
    DECLARE @PageUpperBound INT
    DECLARE @TotalRecords   INT
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table to store the selected results
    CREATE TABLE #PageIndex (
        IndexId int IDENTITY (0, 1) NOT NULL,
        ItemId UNIQUEIDENTIFIER
    )

    IF (@AllUsersScope = 1)
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT Paths.PathId
        FROM dbo.aspnet_Paths Paths,
             ((SELECT Paths.PathId
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND AllUsers.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT DISTINCT Paths.PathId
               FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Paths Paths
               WHERE Paths.ApplicationId = @ApplicationId
                      AND PerUser.PathId = Paths.PathId
                      AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path,
               SharedDataPerPath.LastUpdatedDate,
               SharedDataPerPath.SharedDataLength,
               UserDataPerPath.UserDataLength,
               UserDataPerPath.UserCount
        FROM dbo.aspnet_Paths Paths,
             ((SELECT PageIndex.ItemId AS PathId,
                      AllUsers.LastUpdatedDate AS LastUpdatedDate,
                      DATALENGTH(AllUsers.PageSettings) AS SharedDataLength
               FROM dbo.aspnet_PersonalizationAllUsers AllUsers, #PageIndex PageIndex
               WHERE AllUsers.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
              ) AS SharedDataPerPath
              FULL OUTER JOIN
              (SELECT PageIndex.ItemId AS PathId,
                      SUM(DATALENGTH(PerUser.PageSettings)) AS UserDataLength,
                      COUNT(*) AS UserCount
               FROM aspnet_PersonalizationPerUser PerUser, #PageIndex PageIndex
               WHERE PerUser.PathId = PageIndex.ItemId
                     AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
               GROUP BY PageIndex.ItemId
              ) AS UserDataPerPath
              ON SharedDataPerPath.PathId = UserDataPerPath.PathId
             )
        WHERE Paths.PathId = SharedDataPerPath.PathId OR Paths.PathId = UserDataPerPath.PathId
        ORDER BY Paths.Path ASC
    END
    ELSE
    BEGIN
        -- Insert into our temp table
        INSERT INTO #PageIndex (ItemId)
        SELECT PerUser.Id
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
        WHERE Paths.ApplicationId = @ApplicationId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
              AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
              AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
        ORDER BY Paths.Path ASC, Users.UserName ASC

        SELECT @TotalRecords = @@ROWCOUNT

        SELECT Paths.Path, PerUser.LastUpdatedDate, DATALENGTH(PerUser.PageSettings), Users.UserName, Users.LastActivityDate
        FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths, #PageIndex PageIndex
        WHERE PerUser.Id = PageIndex.ItemId
              AND PerUser.UserId = Users.UserId
              AND PerUser.PathId = Paths.PathId
              AND PageIndex.IndexId >= @PageLowerBound AND PageIndex.IndexId <= @PageUpperBound
        ORDER BY Paths.Path ASC, Users.UserName ASC
    END

    RETURN @TotalRecords
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_GetCountOfState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_PersonalizationAdministration_GetCountOfState] (
    @Count int OUT,
    @AllUsersScope bit,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256) = NULL,
    @UserName NVARCHAR(256) = NULL,
    @InactiveSinceDate DATETIME = NULL)
AS
BEGIN

    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
        IF (@AllUsersScope = 1)
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND AllUsers.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
        ELSE
            SELECT @Count = COUNT(*)
            FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
            WHERE Paths.ApplicationId = @ApplicationId
                  AND PerUser.UserId = Users.UserId
                  AND PerUser.PathId = Paths.PathId
                  AND (@Path IS NULL OR Paths.LoweredPath LIKE LOWER(@Path))
                  AND (@UserName IS NULL OR Users.LoweredUserName LIKE LOWER(@UserName))
                  AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_ResetSharedState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetSharedState] (
    @Count int OUT,
    @ApplicationName NVARCHAR(256),
    @Path NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationAllUsers
        WHERE PathId IN
            (SELECT AllUsers.PathId
             FROM dbo.aspnet_PersonalizationAllUsers AllUsers, dbo.aspnet_Paths Paths
             WHERE Paths.ApplicationId = @ApplicationId
                   AND AllUsers.PathId = Paths.PathId
                   AND Paths.LoweredPath = LOWER(@Path))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAdministration_ResetUserState]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_PersonalizationAdministration_ResetUserState] (
    @Count                  int                 OUT,
    @ApplicationName        NVARCHAR(256),
    @InactiveSinceDate      DATETIME            = NULL,
    @UserName               NVARCHAR(256)       = NULL,
    @Path                   NVARCHAR(256)       = NULL)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
        SELECT @Count = 0
    ELSE
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser
        WHERE Id IN (SELECT PerUser.Id
                     FROM dbo.aspnet_PersonalizationPerUser PerUser, dbo.aspnet_Users Users, dbo.aspnet_Paths Paths
                     WHERE Paths.ApplicationId = @ApplicationId
                           AND PerUser.UserId = Users.UserId
                           AND PerUser.PathId = Paths.PathId
                           AND (@InactiveSinceDate IS NULL OR Users.LastActivityDate <= @InactiveSinceDate)
                           AND (@UserName IS NULL OR Users.LoweredUserName = LOWER(@UserName))
                           AND (@Path IS NULL OR Paths.LoweredPath = LOWER(@Path)))

        SELECT @Count = @@ROWCOUNT
    END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_GetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationAllUsers p WHERE p.PathId = @PathId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path              NVARCHAR(256))
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    DELETE FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId
    RETURN 0
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationAllUsers_SetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_PersonalizationAllUsers_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationAllUsers WHERE PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationAllUsers SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationAllUsers(PathId, PageSettings, LastUpdatedDate) VALUES (@PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_GetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_PersonalizationPerUser_GetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    SELECT p.PageSettings FROM dbo.aspnet_PersonalizationPerUser p WHERE p.PathId = @PathId AND p.UserId = @UserId
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_ResetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_PersonalizationPerUser_ResetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Personalization_GetApplicationId @ApplicationName, @ApplicationId OUTPUT
    IF (@ApplicationId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        RETURN
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        RETURN
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE PathId = @PathId AND UserId = @UserId
    RETURN 0
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_PersonalizationPerUser_SetPageSettings]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_PersonalizationPerUser_SetPageSettings] (
    @ApplicationName  NVARCHAR(256),
    @UserName         NVARCHAR(256),
    @Path             NVARCHAR(256),
    @PageSettings     IMAGE,
    @CurrentTimeUtc   DATETIME)
AS
BEGIN
    DECLARE @ApplicationId UNIQUEIDENTIFIER
    DECLARE @PathId UNIQUEIDENTIFIER
    DECLARE @UserId UNIQUEIDENTIFIER

    SELECT @ApplicationId = NULL
    SELECT @PathId = NULL
    SELECT @UserId = NULL

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    SELECT @PathId = u.PathId FROM dbo.aspnet_Paths u WHERE u.ApplicationId = @ApplicationId AND u.LoweredPath = LOWER(@Path)
    IF (@PathId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Paths_CreatePath @ApplicationId, @Path, @PathId OUTPUT
    END

    SELECT @UserId = u.UserId FROM dbo.aspnet_Users u WHERE u.ApplicationId = @ApplicationId AND u.LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
    BEGIN
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, 0, @CurrentTimeUtc, @UserId OUTPUT
    END

    UPDATE   dbo.aspnet_Users WITH (ROWLOCK)
    SET      LastActivityDate = @CurrentTimeUtc
    WHERE    UserId = @UserId
    IF (@@ROWCOUNT = 0) -- Username not found
        RETURN

    IF (EXISTS(SELECT PathId FROM dbo.aspnet_PersonalizationPerUser WHERE UserId = @UserId AND PathId = @PathId))
        UPDATE dbo.aspnet_PersonalizationPerUser SET PageSettings = @PageSettings, LastUpdatedDate = @CurrentTimeUtc WHERE UserId = @UserId AND PathId = @PathId
    ELSE
        INSERT INTO dbo.aspnet_PersonalizationPerUser(UserId, PathId, PageSettings, LastUpdatedDate) VALUES (@UserId, @PathId, @PageSettings, @CurrentTimeUtc)
    RETURN 0
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_DeleteInactiveProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Profile_DeleteInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT  0
        RETURN
    END

    DELETE
    FROM    dbo.aspnet_Profile
    WHERE   UserId IN
            (   SELECT  UserId
                FROM    dbo.aspnet_Users u
                WHERE   ApplicationId = @ApplicationId
                        AND (LastActivityDate <= @InactiveSinceDate)
                        AND (
                                (@ProfileAuthOptions = 2)
                             OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                             OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                            )
            )

    SELECT  @@ROWCOUNT
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_DeleteProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Profile_DeleteProfiles]
    @ApplicationName        nvarchar(256),
    @UserNames              nvarchar(4000)
AS
BEGIN
    DECLARE @UserName     nvarchar(256)
    DECLARE @CurrentPos   int
    DECLARE @NextPos      int
    DECLARE @NumDeleted   int
    DECLARE @DeletedUser  int
    DECLARE @TranStarted  bit
    DECLARE @ErrorCode    int

    SET @ErrorCode = 0
    SET @CurrentPos = 1
    SET @NumDeleted = 0
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    WHILE (@CurrentPos <= LEN(@UserNames))
    BEGIN
        SELECT @NextPos = CHARINDEX(N',', @UserNames,  @CurrentPos)
        IF (@NextPos = 0 OR @NextPos IS NULL)
            SELECT @NextPos = LEN(@UserNames) + 1

        SELECT @UserName = SUBSTRING(@UserNames, @CurrentPos, @NextPos - @CurrentPos)
        SELECT @CurrentPos = @NextPos+1

        IF (LEN(@UserName) > 0)
        BEGIN
            SELECT @DeletedUser = 0
            EXEC dbo.aspnet_Users_DeleteUser @ApplicationName, @UserName, 4, @DeletedUser OUTPUT
            IF( @@ERROR <> 0 )
            BEGIN
                SET @ErrorCode = -1
                GOTO Cleanup
            END
            IF (@DeletedUser <> 0)
                SELECT @NumDeleted = @NumDeleted + 1
        END
    END
    SELECT @NumDeleted
    IF (@TranStarted = 1)
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END
    SET @TranStarted = 0

    RETURN 0

Cleanup:
    IF (@TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END
    RETURN @ErrorCode
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Profile_GetNumberOfInactiveProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @InactiveSinceDate      datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
    BEGIN
        SELECT 0
        RETURN
    END

    SELECT  COUNT(*)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
    WHERE   ApplicationId = @ApplicationId
        AND u.UserId = p.UserId
        AND (LastActivityDate <= @InactiveSinceDate)
        AND (
                (@ProfileAuthOptions = 2)
                OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
            )
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetProfiles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Profile_GetProfiles] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Profile_GetProfiles]
    @ApplicationName        nvarchar(256),
    @ProfileAuthOptions     int,
    @PageIndex              int,
    @PageSize               int,
    @UserNameToMatch        nvarchar(256) = NULL,
    @InactiveSinceDate      datetime      = NULL
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    -- Set the page bounds
    DECLARE @PageLowerBound int
    DECLARE @PageUpperBound int
    DECLARE @TotalRecords   int
    SET @PageLowerBound = @PageSize * @PageIndex
    SET @PageUpperBound = @PageSize - 1 + @PageLowerBound

    -- Create a temp table TO store the select results
    CREATE TABLE #PageIndexForUsers
    (
        IndexId int IDENTITY (0, 1) NOT NULL,
        UserId uniqueidentifier
    )

    -- Insert into our temp table
    INSERT INTO #PageIndexForUsers (UserId)
        SELECT  u.UserId
        FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p
        WHERE   ApplicationId = @ApplicationId
            AND u.UserId = p.UserId
            AND (@InactiveSinceDate IS NULL OR LastActivityDate <= @InactiveSinceDate)
            AND (     (@ProfileAuthOptions = 2)
                   OR (@ProfileAuthOptions = 0 AND IsAnonymous = 1)
                   OR (@ProfileAuthOptions = 1 AND IsAnonymous = 0)
                 )
            AND (@UserNameToMatch IS NULL OR LoweredUserName LIKE LOWER(@UserNameToMatch))
        ORDER BY UserName

    SELECT  u.UserName, u.IsAnonymous, u.LastActivityDate, p.LastUpdatedDate,
            DATALENGTH(p.PropertyNames) + DATALENGTH(p.PropertyValuesString) + DATALENGTH(p.PropertyValuesBinary)
    FROM    dbo.aspnet_Users u, dbo.aspnet_Profile p, #PageIndexForUsers i
    WHERE   u.UserId = p.UserId AND p.UserId = i.UserId AND i.IndexId >= @PageLowerBound AND i.IndexId <= @PageUpperBound

    SELECT COUNT(*)
    FROM   #PageIndexForUsers

    DROP TABLE #PageIndexForUsers
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_GetProperties]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Profile_GetProperties] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Profile_GetProperties]
    @ApplicationName      nvarchar(256),
    @UserName             nvarchar(256),
    @CurrentTimeUtc       datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM dbo.aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN

    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)

    IF (@UserId IS NULL)
        RETURN
    SELECT TOP 1 PropertyNames, PropertyValuesString, PropertyValuesBinary
    FROM         dbo.aspnet_Profile
    WHERE        UserId = @UserId

    IF (@@ROWCOUNT > 0)
    BEGIN
        UPDATE dbo.aspnet_Users
        SET    LastActivityDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    END
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Profile_SetProperties]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Profile_SetProperties] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Profile_SetProperties]
    @ApplicationName        nvarchar(256),
    @PropertyNames          ntext,
    @PropertyValuesString   ntext,
    @PropertyValuesBinary   image,
    @UserName               nvarchar(256),
    @IsUserAnonymous        bit,
    @CurrentTimeUtc         datetime
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
       BEGIN TRANSACTION
       SET @TranStarted = 1
    END
    ELSE
    	SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DECLARE @UserId uniqueidentifier
    DECLARE @LastActivityDate datetime
    SELECT  @UserId = NULL
    SELECT  @LastActivityDate = @CurrentTimeUtc

    SELECT @UserId = UserId
    FROM   dbo.aspnet_Users
    WHERE  ApplicationId = @ApplicationId AND LoweredUserName = LOWER(@UserName)
    IF (@UserId IS NULL)
        EXEC dbo.aspnet_Users_CreateUser @ApplicationId, @UserName, @IsUserAnonymous, @LastActivityDate, @UserId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    UPDATE dbo.aspnet_Users
    SET    LastActivityDate=@CurrentTimeUtc
    WHERE  UserId = @UserId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS( SELECT *
               FROM   dbo.aspnet_Profile
               WHERE  UserId = @UserId))
        UPDATE dbo.aspnet_Profile
        SET    PropertyNames=@PropertyNames, PropertyValuesString = @PropertyValuesString,
               PropertyValuesBinary = @PropertyValuesBinary, LastUpdatedDate=@CurrentTimeUtc
        WHERE  UserId = @UserId
    ELSE
        INSERT INTO dbo.aspnet_Profile(UserId, PropertyNames, PropertyValuesString, PropertyValuesBinary, LastUpdatedDate)
             VALUES (@UserId, @PropertyNames, @PropertyValuesString, @PropertyValuesBinary, @CurrentTimeUtc)

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
    	SET @TranStarted = 0
    	COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
    	ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_RegisterSchemaVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_RegisterSchemaVersion] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_RegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128),
    @IsCurrentVersion          bit,
    @RemoveIncompatibleSchema  bit
AS
BEGIN
    IF( @RemoveIncompatibleSchema = 1 )
    BEGIN
        DELETE FROM dbo.aspnet_SchemaVersions WHERE Feature = LOWER( @Feature )
    END
    ELSE
    BEGIN
        IF( @IsCurrentVersion = 1 )
        BEGIN
            UPDATE dbo.aspnet_SchemaVersions
            SET IsCurrentVersion = 0
            WHERE Feature = LOWER( @Feature )
        END
    END

    INSERT  dbo.aspnet_SchemaVersions( Feature, CompatibleSchemaVersion, IsCurrentVersion )
    VALUES( LOWER( @Feature ), @CompatibleSchemaVersion, @IsCurrentVersion )
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_CreateRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Roles_CreateRole] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Roles_CreateRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    EXEC dbo.aspnet_Applications_CreateApplication @ApplicationName, @ApplicationId OUTPUT

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF (EXISTS(SELECT RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId))
    BEGIN
        SET @ErrorCode = 1
        GOTO Cleanup
    END

    INSERT INTO dbo.aspnet_Roles
                (ApplicationId, RoleName, LoweredRoleName)
         VALUES (@ApplicationId, @RoleName, LOWER(@RoleName))

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_DeleteRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Roles_DeleteRole] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Roles_DeleteRole]
    @ApplicationName            nvarchar(256),
    @RoleName                   nvarchar(256),
    @DeleteOnlyIfRoleIsEmpty    bit
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)

    DECLARE @ErrorCode     int
    SET @ErrorCode = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
        BEGIN TRANSACTION
        SET @TranStarted = 1
    END
    ELSE
        SET @TranStarted = 0

    DECLARE @RoleId   uniqueidentifier
    SELECT  @RoleId = NULL
    SELECT  @RoleId = RoleId FROM dbo.aspnet_Roles WHERE LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
    BEGIN
        SELECT @ErrorCode = 1
        GOTO Cleanup
    END
    IF (@DeleteOnlyIfRoleIsEmpty <> 0)
    BEGIN
        IF (EXISTS (SELECT RoleId FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId))
        BEGIN
            SELECT @ErrorCode = 2
            GOTO Cleanup
        END
    END


    DELETE FROM dbo.aspnet_UsersInRoles  WHERE @RoleId = RoleId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    DELETE FROM dbo.aspnet_Roles WHERE @RoleId = RoleId  AND ApplicationId = @ApplicationId

    IF( @@ERROR <> 0 )
    BEGIN
        SET @ErrorCode = -1
        GOTO Cleanup
    END

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        COMMIT TRANSACTION
    END

    RETURN(0)

Cleanup:

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
        ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_GetAllRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Roles_GetAllRoles] (
    @ApplicationName           nvarchar(256))
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN
    SELECT RoleName
    FROM   dbo.aspnet_Roles WHERE ApplicationId = @ApplicationId
    ORDER BY RoleName
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Roles_RoleExists]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Roles_RoleExists] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Roles_RoleExists]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(0)
    IF (EXISTS (SELECT RoleName FROM dbo.aspnet_Roles WHERE LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId ))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Setup_RemoveAllRoleMembers]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Setup_RemoveAllRoleMembers]
    @name   sysname
AS
BEGIN
    CREATE TABLE #aspnet_RoleMembers
    (
        Group_name      sysname,
        Group_id        smallint,
        Users_in_group  sysname,
        User_id         smallint
    )

    INSERT INTO #aspnet_RoleMembers
    EXEC sp_helpuser @name

    DECLARE @user_id smallint
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT User_id FROM #aspnet_RoleMembers

    OPEN c1

    FETCH c1 INTO @user_id
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = 'EXEC sp_droprolemember ' + '''' + @name + ''', ''' + USER_NAME(@user_id) + ''''
        EXEC (@cmd)
        FETCH c1 INTO @user_id
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Setup_RestorePermissions]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Setup_RestorePermissions] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Setup_RestorePermissions]
    @name   sysname
AS
BEGIN
    DECLARE @object sysname
    DECLARE @protectType char(10)
    DECLARE @action varchar(60)
    DECLARE @grantee sysname
    DECLARE @cmd nvarchar(500)
    DECLARE c1 cursor FORWARD_ONLY FOR
        SELECT Object, ProtectType, [Action], Grantee FROM #aspnet_Permissions where Object = @name

    OPEN c1

    FETCH c1 INTO @object, @protectType, @action, @grantee
    WHILE (@@fetch_status = 0)
    BEGIN
        SET @cmd = @protectType + ' ' + @action + ' on ' + @object + ' TO [' + @grantee + ']'
        EXEC (@cmd)
        FETCH c1 INTO @object, @protectType, @action, @grantee
    END

    CLOSE c1
    DEALLOCATE c1
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UnRegisterSchemaVersion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_UnRegisterSchemaVersion]
    @Feature                   nvarchar(128),
    @CompatibleSchemaVersion   nvarchar(128)
AS
BEGIN
    DELETE FROM dbo.aspnet_SchemaVersions
        WHERE   Feature = LOWER(@Feature) AND @CompatibleSchemaVersion = CompatibleSchemaVersion
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users_CreateUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Users_CreateUser] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_Users_CreateUser]
    @ApplicationId    uniqueidentifier,
    @UserName         nvarchar(256),
    @IsUserAnonymous  bit,
    @LastActivityDate DATETIME,
    @UserId           uniqueidentifier OUTPUT
AS
BEGIN
    IF( @UserId IS NULL )
        SELECT @UserId = NEWID()
    ELSE
    BEGIN
        IF( EXISTS( SELECT UserId FROM dbo.aspnet_Users
                    WHERE @UserId = UserId ) )
            RETURN -1
    END

    INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
    VALUES (@ApplicationId, @UserId, @UserName, LOWER(@UserName), @IsUserAnonymous, @LastActivityDate)

    RETURN 0
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_Users_DeleteUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_Users_DeleteUser] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_Users_DeleteUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @TablesToDeleteFrom int,
    @NumTablesDeletedFrom int OUTPUT
AS
BEGIN
    DECLARE @UserId               uniqueidentifier
    SELECT  @UserId               = NULL
    SELECT  @NumTablesDeletedFrom = 0

    DECLARE @TranStarted   bit
    SET @TranStarted = 0

    IF( @@TRANCOUNT = 0 )
    BEGIN
	    BEGIN TRANSACTION
	    SET @TranStarted = 1
    END
    ELSE
	SET @TranStarted = 0

    DECLARE @ErrorCode   int
    DECLARE @RowCount    int

    SET @ErrorCode = 0
    SET @RowCount  = 0

    SELECT  @UserId = u.UserId
    FROM    dbo.aspnet_Users u, dbo.aspnet_Applications a
    WHERE   u.LoweredUserName       = LOWER(@UserName)
        AND u.ApplicationId         = a.ApplicationId
        AND LOWER(@ApplicationName) = a.LoweredApplicationName

    IF (@UserId IS NULL)
    BEGIN
        GOTO Cleanup
    END

    -- Delete from Membership table if (@TablesToDeleteFrom & 1) is set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_MembershipUsers') AND (type = 'V'))))
    BEGIN
        DELETE FROM dbo.aspnet_Membership WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
               @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_UsersInRoles table if (@TablesToDeleteFrom & 2) is set
    IF ((@TablesToDeleteFrom & 2) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_UsersInRoles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_UsersInRoles WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Profile table if (@TablesToDeleteFrom & 4) is set
    IF ((@TablesToDeleteFrom & 4) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_Profiles') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_Profile WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_PersonalizationPerUser table if (@TablesToDeleteFrom & 8) is set
    IF ((@TablesToDeleteFrom & 8) <> 0  AND
        (EXISTS (SELECT name FROM sysobjects WHERE (name = N'vw_aspnet_WebPartState_User') AND (type = 'V'))) )
    BEGIN
        DELETE FROM dbo.aspnet_PersonalizationPerUser WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    -- Delete from aspnet_Users table if (@TablesToDeleteFrom & 1,2,4 & 8) are all set
    IF ((@TablesToDeleteFrom & 1) <> 0 AND
        (@TablesToDeleteFrom & 2) <> 0 AND
        (@TablesToDeleteFrom & 4) <> 0 AND
        (@TablesToDeleteFrom & 8) <> 0 AND
        (EXISTS (SELECT UserId FROM dbo.aspnet_Users WHERE @UserId = UserId)))
    BEGIN
        DELETE FROM dbo.aspnet_Users WHERE @UserId = UserId

        SELECT @ErrorCode = @@ERROR,
                @RowCount = @@ROWCOUNT

        IF( @ErrorCode <> 0 )
            GOTO Cleanup

        IF (@RowCount <> 0)
            SELECT  @NumTablesDeletedFrom = @NumTablesDeletedFrom + 1
    END

    IF( @TranStarted = 1 )
    BEGIN
	    SET @TranStarted = 0
	    COMMIT TRANSACTION
    END

    RETURN 0

Cleanup:
    SET @NumTablesDeletedFrom = 0

    IF( @TranStarted = 1 )
    BEGIN
        SET @TranStarted = 0
	    ROLLBACK TRANSACTION
    END

    RETURN @ErrorCode

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_AddUsersToRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_UsersInRoles_AddUsersToRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000),
	@CurrentTimeUtc   datetime
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)
	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames	table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles	table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers	table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num		int
	DECLARE @Pos		int
	DECLARE @NextPos	int
	DECLARE @Name		nvarchar(256)

	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		SELECT TOP 1 Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END

	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1

	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	IF (@@ROWCOUNT <> @Num)
	BEGIN
		DELETE FROM @tbNames
		WHERE LOWER(Name) IN (SELECT LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE au.UserId = u.UserId)

		INSERT dbo.aspnet_Users (ApplicationId, UserId, UserName, LoweredUserName, IsAnonymous, LastActivityDate)
		  SELECT @AppId, NEWID(), Name, LOWER(Name), 0, @CurrentTimeUtc
		  FROM   @tbNames

		INSERT INTO @tbUsers
		  SELECT  UserId
		  FROM	dbo.aspnet_Users au, @tbNames t
		  WHERE   LOWER(t.Name) = au.LoweredUserName AND au.ApplicationId = @AppId
	END

	IF (EXISTS (SELECT * FROM dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr WHERE tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId))
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 dbo.aspnet_UsersInRoles ur, @tbUsers tu, @tbRoles tr, aspnet_Users u, aspnet_Roles r
		WHERE		u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND tu.UserId = ur.UserId AND tr.RoleId = ur.RoleId

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	INSERT INTO dbo.aspnet_UsersInRoles (UserId, RoleId)
	SELECT UserId, RoleId
	FROM @tbUsers, @tbRoles

	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_FindUsersInRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_UsersInRoles_FindUsersInRole]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256),
    @UserNameToMatch  nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId AND LoweredUserName LIKE LOWER(@UserNameToMatch)
    ORDER BY u.UserName
    RETURN(0)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_GetRolesForUser]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_UsersInRoles_GetRolesForUser]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(1)

    SELECT r.RoleName
    FROM   dbo.aspnet_Roles r, dbo.aspnet_UsersInRoles ur
    WHERE  r.RoleId = ur.RoleId AND r.ApplicationId = @ApplicationId AND ur.UserId = @UserId
    ORDER BY r.RoleName
    RETURN (0)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_GetUsersInRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_UsersInRoles_GetUsersInRoles]
    @ApplicationName  nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(1)
     DECLARE @RoleId uniqueidentifier
     SELECT  @RoleId = NULL

     SELECT  @RoleId = RoleId
     FROM    dbo.aspnet_Roles
     WHERE   LOWER(@RoleName) = LoweredRoleName AND ApplicationId = @ApplicationId

     IF (@RoleId IS NULL)
         RETURN(1)

    SELECT u.UserName
    FROM   dbo.aspnet_Users u, dbo.aspnet_UsersInRoles ur
    WHERE  u.UserId = ur.UserId AND @RoleId = ur.RoleId AND u.ApplicationId = @ApplicationId
    ORDER BY u.UserName
    RETURN(0)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_IsUserInRole]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_UsersInRoles_IsUserInRole]
    @ApplicationName  nvarchar(256),
    @UserName         nvarchar(256),
    @RoleName         nvarchar(256)
AS
BEGIN
    DECLARE @ApplicationId uniqueidentifier
    SELECT  @ApplicationId = NULL
    SELECT  @ApplicationId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
    IF (@ApplicationId IS NULL)
        RETURN(2)
    DECLARE @UserId uniqueidentifier
    SELECT  @UserId = NULL
    DECLARE @RoleId uniqueidentifier
    SELECT  @RoleId = NULL

    SELECT  @UserId = UserId
    FROM    dbo.aspnet_Users
    WHERE   LoweredUserName = LOWER(@UserName) AND ApplicationId = @ApplicationId

    IF (@UserId IS NULL)
        RETURN(2)

    SELECT  @RoleId = RoleId
    FROM    dbo.aspnet_Roles
    WHERE   LoweredRoleName = LOWER(@RoleName) AND ApplicationId = @ApplicationId

    IF (@RoleId IS NULL)
        RETURN(3)

    IF (EXISTS( SELECT * FROM dbo.aspnet_UsersInRoles WHERE  UserId = @UserId AND RoleId = @RoleId))
        RETURN(1)
    ELSE
        RETURN(0)
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles] AS' 
END
GO

ALTER PROCEDURE [dbo].[aspnet_UsersInRoles_RemoveUsersFromRoles]
	@ApplicationName  nvarchar(256),
	@UserNames		  nvarchar(4000),
	@RoleNames		  nvarchar(4000)
AS
BEGIN
	DECLARE @AppId uniqueidentifier
	SELECT  @AppId = NULL
	SELECT  @AppId = ApplicationId FROM aspnet_Applications WHERE LOWER(@ApplicationName) = LoweredApplicationName
	IF (@AppId IS NULL)
		RETURN(2)


	DECLARE @TranStarted   bit
	SET @TranStarted = 0

	IF( @@TRANCOUNT = 0 )
	BEGIN
		BEGIN TRANSACTION
		SET @TranStarted = 1
	END

	DECLARE @tbNames  table(Name nvarchar(256) NOT NULL PRIMARY KEY)
	DECLARE @tbRoles  table(RoleId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @tbUsers  table(UserId uniqueidentifier NOT NULL PRIMARY KEY)
	DECLARE @Num	  int
	DECLARE @Pos	  int
	DECLARE @NextPos  int
	DECLARE @Name	  nvarchar(256)
	DECLARE @CountAll int
	DECLARE @CountU	  int
	DECLARE @CountR	  int


	SET @Num = 0
	SET @Pos = 1
	WHILE(@Pos <= LEN(@RoleNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @RoleNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@RoleNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@RoleNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbRoles
	  SELECT RoleId
	  FROM   dbo.aspnet_Roles ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredRoleName AND ar.ApplicationId = @AppId
	SELECT @CountR = @@ROWCOUNT

	IF (@CountR <> @Num)
	BEGIN
		SELECT TOP 1 N'', Name
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT ar.LoweredRoleName FROM dbo.aspnet_Roles ar,  @tbRoles r WHERE r.RoleId = ar.RoleId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(2)
	END


	DELETE FROM @tbNames WHERE 1=1
	SET @Num = 0
	SET @Pos = 1


	WHILE(@Pos <= LEN(@UserNames))
	BEGIN
		SELECT @NextPos = CHARINDEX(N',', @UserNames,  @Pos)
		IF (@NextPos = 0 OR @NextPos IS NULL)
			SELECT @NextPos = LEN(@UserNames) + 1
		SELECT @Name = RTRIM(LTRIM(SUBSTRING(@UserNames, @Pos, @NextPos - @Pos)))
		SELECT @Pos = @NextPos+1

		INSERT INTO @tbNames VALUES (@Name)
		SET @Num = @Num + 1
	END

	INSERT INTO @tbUsers
	  SELECT UserId
	  FROM   dbo.aspnet_Users ar, @tbNames t
	  WHERE  LOWER(t.Name) = ar.LoweredUserName AND ar.ApplicationId = @AppId

	SELECT @CountU = @@ROWCOUNT
	IF (@CountU <> @Num)
	BEGIN
		SELECT TOP 1 Name, N''
		FROM   @tbNames
		WHERE  LOWER(Name) NOT IN (SELECT au.LoweredUserName FROM dbo.aspnet_Users au,  @tbUsers u WHERE u.UserId = au.UserId)

		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(1)
	END

	SELECT  @CountAll = COUNT(*)
	FROM	dbo.aspnet_UsersInRoles ur, @tbUsers u, @tbRoles r
	WHERE   ur.UserId = u.UserId AND ur.RoleId = r.RoleId

	IF (@CountAll <> @CountU * @CountR)
	BEGIN
		SELECT TOP 1 UserName, RoleName
		FROM		 @tbUsers tu, @tbRoles tr, dbo.aspnet_Users u, dbo.aspnet_Roles r
		WHERE		 u.UserId = tu.UserId AND r.RoleId = tr.RoleId AND
					 tu.UserId NOT IN (SELECT ur.UserId FROM dbo.aspnet_UsersInRoles ur WHERE ur.RoleId = tr.RoleId) AND
					 tr.RoleId NOT IN (SELECT ur.RoleId FROM dbo.aspnet_UsersInRoles ur WHERE ur.UserId = tu.UserId)
		IF( @TranStarted = 1 )
			ROLLBACK TRANSACTION
		RETURN(3)
	END

	DELETE FROM dbo.aspnet_UsersInRoles
	WHERE UserId IN (SELECT UserId FROM @tbUsers)
	  AND RoleId IN (SELECT RoleId FROM @tbRoles)
	IF( @TranStarted = 1 )
		COMMIT TRANSACTION
	RETURN(0)
END
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[aspnet_WebEvent_LogEvent]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[aspnet_WebEvent_LogEvent] AS' 
END
GO
ALTER PROCEDURE [dbo].[aspnet_WebEvent_LogEvent]
        @EventId         char(32),
        @EventTimeUtc    datetime,
        @EventTime       datetime,
        @EventType       nvarchar(256),
        @EventSequence   decimal(19,0),
        @EventOccurrence decimal(19,0),
        @EventCode       int,
        @EventDetailCode int,
        @Message         nvarchar(1024),
        @ApplicationPath nvarchar(256),
        @ApplicationVirtualPath nvarchar(256),
        @MachineName    nvarchar(256),
        @RequestUrl      nvarchar(1024),
        @ExceptionType   nvarchar(256),
        @Details         ntext
AS
BEGIN
    INSERT
        dbo.aspnet_WebEvent_Events
        (
            EventId,
            EventTimeUtc,
            EventTime,
            EventType,
            EventSequence,
            EventOccurrence,
            EventCode,
            EventDetailCode,
            Message,
            ApplicationPath,
            ApplicationVirtualPath,
            MachineName,
            RequestUrl,
            ExceptionType,
            Details
        )
    VALUES
    (
        @EventId,
        @EventTimeUtc,
        @EventTime,
        @EventType,
        @EventSequence,
        @EventOccurrence,
        @EventCode,
        @EventDetailCode,
        @Message,
        @ApplicationPath,
        @ApplicationVirtualPath,
        @MachineName,
        @RequestUrl,
        @ExceptionType,
        @Details
    )
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[buscar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[buscar] AS' 
END
GO
ALTER procedure [dbo].[buscar]
@anio int,
@id int
as 
select * from estructorganiz where Year='anio' and idareaorganiz='id'
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[buscar_depende]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[buscar_depende] AS' 
END
GO
ALTER proc [dbo].[buscar_depende]
@depende int
as 
select * from estructorganiz where idareaorganiz=@depende
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[buscar_EstructOrganiz]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[buscar_EstructOrganiz] AS' 
END
GO
ALTER proc [dbo].[buscar_EstructOrganiz]
@anio int,
@id int
as 
select * from estructorganiz where Year=@anio and idareaorganiz=@id



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[buscar_JefesUnidadXAnio]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[buscar_JefesUnidadXAnio] AS' 
END
GO



ALTER proc [dbo].[buscar_JefesUnidadXAnio]
@anio int
as
 
select distinct (numdocid), nombres+' '+ apellido_paterno+' '+apellido_materno as Nombre  from persona inner join empleado 
					on persona.idpersona=empleado.idpersona inner join responsableXUO 
					on empleado.idempleado=responsableXUO.idempleado 
					where responsableXUO.year=@anio


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[buscar_JefeUnidad]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[buscar_JefeUnidad] AS' 
END
GO
ALTER proc [dbo].[buscar_JefeUnidad]
@anio int,
@id int
as

select nombres,apellido_paterno,apellido_materno from persona inner join empleado 
					on persona.idpersona=empleado.idpersona inner join responsableXUO 
					on empleado.idempleado=responsableXUO.idempleado 
					where responsableXUO.year=@anio and responsableXUO.idareaorganiz=@id
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[buscarDepartamento]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[buscarDepartamento] AS' 
END
GO
ALTER procedure [dbo].[buscarDepartamento]
@departamento char(2)
as
select DEPARTAMENTO as CODIGO,descripcion as REGION
from dbo.UBIGEO where provincia='0' and distrito='0' and departamento=@departamento

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[buscarDistrito]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[buscarDistrito] AS' 
END
GO
ALTER procedure [dbo].[buscarDistrito]
@departamento char(2),
@provincia char(2),
@distrito char(2)
as
select idubigeo as CODIGO,descripcion as DISTRITO
from UBIGEO where departamento=@departamento
and provincia=@provincia and distrito=@distrito

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[buscarMateria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[buscarMateria] AS' 
END
GO
ALTER procedure [dbo].[buscarMateria]
@descripcion varchar(80)
as
select * from MATERIA where descripcion=@descripcion

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[buscarMateriaId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[buscarMateriaId] AS' 
END
GO
ALTER procedure [dbo].[buscarMateriaId]
@idmateria varchar(80)
as
select * from MATERIA where idmateria=@idmateria

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[buscarPersonaPorCodigo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[buscarPersonaPorCodigo] AS' 
END
GO
ALTER procedure [dbo].[buscarPersonaPorCodigo]
@idpersona int
as
select * from PERSONA where idpersona=@idpersona

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[buscarProvincia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[buscarProvincia] AS' 
END
GO
ALTER procedure [dbo].[buscarProvincia]
@provincia char(2)
as
select PROVINCIA as CODIGO,
descripcion as PROVINCIA from UBIGEO where departamento=13
and provincia=@provincia and DISTRITO='0'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[grabarMateria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[grabarMateria] AS' 
END
GO
ALTER procedure [dbo].[grabarMateria]
@id int OUTPUT,
@descripcion varchar(80),
@estado bit
as
insert into MATERIA(descripcion,estado)
values(@descripcion,@estado)
set @id=@@IDENTITY

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsDetDist_nfilas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsDetDist_nfilas] AS' 
END
GO
ALTER procedure [dbo].[InsDetDist_nfilas]
@myXML XML
as 
declare @hDoc int

exec sp_xml_preparedocument @hDoc output, @myXML

select * into Deta_Distribucion
from openxml(@hDoc, N'/Customers/Customer')
with ( 
      Item tinyint '@Item',
	  TipoOrden char(1) '@TipoOrden',
	  IdOrden char(8) '@IdOrden',
	  IdBien char(13) '@IdBien',
	  IdMeta char(6) '@IdMeta',
	  IdGasto varchar(17) '@IdGasto',
	  Meta char(255) '@Meta',
	  MetaAnio char(4) '@MetaAnio'
	 )
exec sp_xml_removedocument @hDoc
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InsDetOrd_nfilas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[InsDetOrd_nfilas] AS' 
END
GO
ALTER procedure [dbo].[InsDetOrd_nfilas]
@myXML XML
as 
declare @hDoc int

exec sp_xml_preparedocument @hDoc output, @myXML

select * into Deta_Orden
from openxml(@hDoc, N'/Customers/Customer')
with ( 
      Item tinyint '@Item',
	  TipoOrden char(1) '@TipoOrden',
	  IdOrden char(8) '@IdOrden',
	  IdBien char(13) '@IdBien',
	  Cantidad decimal(9,4) '@Cantidad',
	  Precio decimal(9,4) '@Precio',
	  Igv decimal(9,4) '@Igv',	
	  Observaciones varchar(400) '@Observaciones',
	  IdUnidadMedida char(4) '@IdUnidadMedida',
      Importe decimal(9,4) '@Importe',
	  IdGasto varchar(17) '@IdGasto',
	  Meta char(6) '@Meta',
	  MetaAnio char(4) '@MetaAnio'
	 )
exec sp_xml_removedocument @hDoc
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[insertar_estructorganiz]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[insertar_estructorganiz] AS' 
END
GO
ALTER procedure [dbo].[insertar_estructorganiz]
@Year int,
@idAreaOrganiz int,
@AreaOrganizacional varchar(200),
@Abrev varchar(10),
@Sigla varchar(6),
@PresupAnual float,
@PromedMensSueld float,
@NroTrabajaUO int,
@Mision varchar(1000),
@Vision varchar(1000),
@IdPresupuesto int,
@YearDe int,
@idDependeDe int,
@IdEmpleado int,
@InversPublic float,
@ApruebaPedido char(1),
@MontoAprobacion float,
@PresupCompra float,
@PresupUtilizado float
as 

INSERT INTO [CMI].[dbo].[EstructOrganiz]
           ([Year]
           ,[idAreaOrganiz]
           ,[AreaOrganizacional]
           ,[Abrev]
           ,[Sigla]
           ,[PresupAnual]
           ,[PromedMensSueld]
           ,[NroTrabajaUO]
           ,[Mision]
           ,[Vision]
           ,[IdPresupuesto]
           ,[YearDe]
           ,[idDependeDe]
           ,[IdEmpleado]
           ,[InversPublic]
           ,[ApruebaPedido]
           ,[MontoAprobacion]
           ,[PresupCompra]
           ,[PresupUtilizado])
     VALUES
           (@Year
		   ,@idAreaOrganiz
           ,@AreaOrganizacional
           ,@Abrev
           ,@Sigla
           ,@PresupAnual
           ,@PromedMensSueld
           ,@NroTrabajaUO
           ,@Mision
           ,@Vision
           ,@IdPresupuesto
           ,@YearDe
           ,@idDependeDe
           ,@IdEmpleado
           ,@InversPublic
           ,@ApruebaPedido
           ,@MontoAprobacion
           ,@PresupCompra
           ,@PresupUtilizado)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mostrarDep]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mostrarDep] AS' 
END
GO
ALTER procedure [dbo].[mostrarDep]
as
select DEPARTAMENTO as CODIGO,descripcion as REGION
from dbo.UBIGEO where provincia='0' and distrito='0'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mostrarDist]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mostrarDist] AS' 
END
GO
ALTER procedure [dbo].[mostrarDist]
@departamento char(2),
@provincia char(2)
as
select idubigeo as CODIGO,descripcion as DISTRITO
from UBIGEO where departamento=@departamento
and provincia=@provincia and distrito!='0'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mostrarMaterias]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mostrarMaterias] AS' 
END
GO
ALTER procedure [dbo].[mostrarMaterias]
as
select idmateria as CODIGO,descripcion as MATERIA,
estado AS ESTADO from materia

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mostrarMateriasActivas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mostrarMateriasActivas] AS' 
END
GO
ALTER procedure [dbo].[mostrarMateriasActivas]
as
select idmateria as CODIGO,descripcion as MATERIA,
estado AS ESTADO from materia where estado=1

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mostrarMateriasActivasOrden]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mostrarMateriasActivasOrden] AS' 
END
GO
ALTER procedure [dbo].[mostrarMateriasActivasOrden]
as
select idmateria as CODIGO,descripcion as MATERIA,
estado AS ESTADO from materia where estado=1
order by MATERIA

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mostrarMateriasInactivas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mostrarMateriasInactivas] AS' 
END
GO
ALTER procedure [dbo].[mostrarMateriasInactivas]
as
select idmateria as CODIGO,descripcion as MATERIA,
estado AS ESTADO from materia where estado=0

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mostrarProv]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mostrarProv] AS' 
END
GO
ALTER procedure [dbo].[mostrarProv]
@departamento char(2)
as
select PROVINCIA as CODIGO,
descripcion as PROVINCIA from UBIGEO where departamento=@departamento
and provincia!='0' and DISTRITO='0'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[mostrarProvLb]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[mostrarProvLb] AS' 
END
GO
ALTER procedure [dbo].[mostrarProvLb]
as
select PROVINCIA as CODIGO,
descripcion as PROVINCIA from UBIGEO where departamento=13
and provincia!='0' and DISTRITO='0'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROC_LIST_MARCACIONES_X_USUARIO]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PROC_LIST_MARCACIONES_X_USUARIO] AS' 
END
GO
ALTER PROCEDURE [dbo].[PROC_LIST_MARCACIONES_X_USUARIO]
	--declare 
	@FechaIni AS SMALLDATETIME
	,@FechaFin AS SMALLDATETIME
	,@Dni AS VARCHAR(8) = ''
	,@Area AS INT = NULL
	,@TipoEmpleado AS INT = NULL
	,@idLocales AS VARCHAR(500) = ''
	,@opt AS INT
	--as
	--set @FechaIni = '20111202'
	--set @FechaFin = '20111202'
	----set @Dni = null
	--set @opt=0
	--set @TipoEmpleado=1
	--@TipoEmple AS Varchar(5) = 'CSP'    --Cas, SNP, Planilla
AS
BEGIN
	DECLARE @nReg AS SMALLINT
		,@dTmp AS SMALLDATETIME
		,@CodPer AS INT
	DECLARE @FecIni AS VARCHAR(17)
		,@FecFin AS VARCHAR(17)
	DECLARE @cHrIni AS VARCHAR(8)
		,@cHrFin AS VARCHAR(8)
		,@cFlagE AS CHAR(1)
		,@cFlagS AS CHAR(1)
		,@cMotivo AS VARCHAR(30)
		,@cDoc AS VARCHAR(30)
		,@cEstado AS CHAR(1)
		,@cHrAlmIni AS VARCHAR(8)
		,@cHrAlmFin AS VARCHAR(8)

	SET NOCOUNT ON

	--Ordenar las fechas
	IF @FechaFin < @FechaIni
	BEGIN
		SET @dTmp = @FechaIni
		SET @FechaIni = @FechaFin
		SET @FechaFin = @dTmp
	END

	--Corregir el Rango
	SET @FecIni = CONVERT(VARCHAR(8), @FechaIni, 112) + ' 00:00:00'
	SET @FecFin = CONVERT(VARCHAR(8), @FechaFin, 112) + ' 23:59:59'

	--   --Obtener el Codigo del Empleado
	--   SET @CodPer = (SELECT Pers_Cod FROM Ficha_Personal WHERE Pers_Dni = @Dni)
	--   SET @CodPer = ISNULL(@CodPer, 0)
	--   IF @CodPer <= 0
	--      RETURN
	--Obtener el Empleado o Todos los Empleados solicitados
	IF @opt = 1
	BEGIN
		DECLARE cPersonal CURSOR
		FOR
		SELECT DISTINCT E.idempleado
		FROM Persona P
		INNER JOIN Empleado E ON E.idPersona = P.idPersona
		INNER JOIN AuxRRHH_ReporteAsistencia Aux ON Aux.idempleado = e.idempleado
		WHERE E.Estado = 1 --and E.idempleado in (Select distinct idempleado from AuxRRHH_ReporteAsistencia)
	END
	ELSE IF @Dni = ''
	BEGIN
		DECLARE @t1 TABLE (t1 INT)
		DECLARE @cnt INT = 0

		WHILE charindex(',', @idLocales) > 0
		BEGIN
			IF @cnt < 9
			BEGIN
				INSERT INTO @t1
				SELECT substring(@idLocales, 1, 1)

				SET @idLocales = substring(@idLocales, 3, len(@idLocales))
			END
			ELSE
			BEGIN
				INSERT INTO @t1
				SELECT substring(@idLocales, 1, 2)

				SET @idLocales = substring(@idLocales, 4, len(@idLocales))
			END

			SET @cnt = @cnt + 1
		END

		IF LEN(@idLocales) = 1
		BEGIN
			INSERT INTO @t1
			SELECT substring(@idLocales, 1, 1)
		END

		IF LEN(@idLocales) = 2
		BEGIN
			INSERT INTO @t1
			SELECT substring(@idLocales, 1, 2)
		END

		DECLARE cPersonal CURSOR
		FOR
		SELECT DISTINCT E.idempleado
		FROM Persona P
		INNER JOIN Empleado E ON E.idPersona = P.idPersona
		INNER JOIN Empleado_Area Ea ON Ea.idempleado = E.idempleado
			AND Ea.year = year(getdate())
		WHERE E.Estado = 1 -- AND PATINDEX('%' + TipoEmpleado + '%', @TipoEmple) > 0
			AND (
				Ea.idAreaOrganiz = @Area
				OR @Area IS NULL
				)
			AND E.IdTipoTrabajador = @TipoEmpleado
			AND E.idLocal IN (
				SELECT *
				FROM @t1
				)
	END
	ELSE
		DECLARE cPersonal CURSOR
		FOR
		SELECT DISTINCT E.idempleado
		FROM Persona P
		INNER JOIN Empleado E ON E.idPersona = P.idPersona
		WHERE P.NumdocID = @Dni
			AND E.Estado = '1' --AND PATINDEX('%' + TipoEmpleado + '%', @TipoEmple) > 0

	--Crear la Tabla Temporal
	CREATE TABLE #Tmp (
		Fecha SMALLDATETIME
		,CodPer SMALLINT
		,HoraEnt CHAR(8)
		,HoraSal CHAR(8)
		,HoraAlmSal CHAR(8)
		,HoraAlmEnt CHAR(8)
		,Motivo VARCHAR(30)
		,DocJustif VARCHAR(30)
		,Flag_Ent CHAR(1)
		,Flag_Sal CHAR(1)
		)

	--Abrir el Cursor y Procesar para Cada Persona
	OPEN cPersonal

	FETCH NEXT
	FROM cPersonal
	INTO @CodPer

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @dTmp = @FechaIni

		WHILE @dTmp <= @FechaFin
		BEGIN
			SELECT @cMotivo = ''
				,@cDoc = ''
				,@nReg = 0
				,@cHrIni = ''
				,@cHrFin = ''
				,@cFlagE = ''
				,@cFlagS = ''

			--IF DATEPART(dw, @dTmp) <= 5      --Excluir los Sabados y Domingos
			BEGIN
				--Verificar si Existe en Asistencia
				SELECT @nReg = 1
					,@cHrIni = Hor_Ent
					,@cHrFin = Hor_Sal
					,@cHrAlmIni = Alm_Sal
					,@cHrAlmFin = Alm_Ent
					,@cFlagE = Flag_Ent
					,@cFlagS = Flag_Sal
					,@cEstado = Estado
				FROM Asistencia
				WHERE idEmpleado = @CodPer
					AND Fecha = @dTmp

				IF @nReg = 1
				BEGIN
					--Si se encuentra, Verificar si tiene Permisos
					IF @cFlagE = '1'
						OR @cFlagS = '1'
						OR @cHrIni = '00:00:00'
						OR @cHrFin = '00:00:00'
					BEGIN
						--Buscar el Permiso en Perm_Lice
						SET @nReg = 0

						SELECT TOP 1 @nReg = 1
							,@cMotivo = mp.Descrip_Motivo
							,@cDoc = p.Referencia
						FROM Permiso p
						INNER JOIN Motivo_Perm mp ON p.idMotivo = mp.idMotivo
						WHERE p.IdEmpleado = @CodPer
							AND p.FechaInicio <= @dTmp
							AND p.FechaFin >= @dTmp
						ORDER BY p.FechaInicio DESC

						IF @nReg = 1
						BEGIN
							--Si se encontro el Permiso. Agregarlo a la Tabla
							IF @cFlagE = '1'
								AND @cFlagS = '1'
								SELECT @cHrIni = 'Perm'
									,@cFlagE = 'P'
									,@cHrFin = 'Perm'
									,@cFlagS = 'P'

							--IF @cFlagE = '1' AND @cFlagS = '0'
							--   SELECT @cHrIni = 'Perm', @cFlagE = 'P'
							--IF @cFlagE = '0' AND @cFlagS = '1'
							--   SELECT @cHrFin = 'Perm', @cFlagS = 'P'
							IF @cEstado = '1'
								AND @cFlagS = '0'
								AND @cFlagE = '1'
								SELECT @cHrFin = 'Perm'
									,@cFlagS = 'P'

							IF @cEstado = '1'
								AND @cFlagS = '1'
								AND @cFlagE = '0'
								SELECT @cHrIni = 'Perm'
									,@cFlagE = 'P'

							INSERT #Tmp (
								Fecha
								,CodPer
								,HoraEnt
								,HoraSal
								,Motivo
								,DocJustif
								,Flag_Ent
								,a.Flag_Sal
								)
							VALUES (
								@dTmp
								,@CodPer
								,@cHrIni
								,@cHrFin
								,@cMotivo
								,@cDoc
								,@cFlagE
								,@cFlagS
								)
						END
						ELSE
						BEGIN
							--Tiene marcas de Permiso, o Asistencias CERO. Ingresar posible Falta
							--SELECT @cFlagE = '', @cFlagS = ''
							INSERT #Tmp (
								Fecha
								,CodPer
								,HoraEnt
								,HoraSal
								,HoraAlmSal
								,HoraAlmEnt
								,Motivo
								,DocJustif
								,Flag_Ent
								,a.Flag_Sal
								)
							VALUES (
								@dTmp
								,@CodPer
								,@cHrIni
								,@cHrFin
								,@cHrAlmIni
								,@cHrAlmFin
								,@cMotivo
								,@cDoc
								,@cFlagE
								,@cFlagS
								)
						END
					END
					ELSE
					BEGIN
						--Tiene Asistencia pero NO tiene Permiso. Agregar la Asistencia
						INSERT #Tmp (
							Fecha
							,CodPer
							,HoraEnt
							,HoraSal
							,Motivo
							,DocJustif
							,Flag_Ent
							,a.Flag_Sal
							)
						VALUES (
							@dTmp
							,@CodPer
							,@cHrIni
							,@cHrFin
							,@cMotivo
							,@cDoc
							,@cFlagE
							,@cFlagS
							)
					END
				END
				ELSE
				BEGIN
					--No tiene Asistencia, Buscar si este dia esta incluido en un Rango de Fecha de Permiso.
					SELECT @nReg = 0
						,@cHrIni = ''
						,@cHrFin = ''
						,@cFlagE = ''
						,@cFlagS = ''

					SELECT TOP 1 @nReg = 1
						,@cMotivo = mp.Descrip_Motivo
						,@cDoc = p.Referencia
					FROM Permiso p
					INNER JOIN Motivo_Perm mp ON p.idMotivo = mp.idMotivo
					WHERE p.IdEmpleado = @CodPer
						AND p.FechaInicio <= @dTmp
						AND p.FechaFin >= @dTmp
					ORDER BY p.FechaInicio DESC

					IF @nReg = 1
					BEGIN
						--Si existe el Permiso
						SELECT @cHrIni = 'Perm'
							,@cFlagE = 'P'
							,@cHrFin = 'Perm'
							,@cFlagS = 'P'

						INSERT #Tmp (
							Fecha
							,CodPer
							,HoraEnt
							,HoraSal
							,Motivo
							,DocJustif
							,Flag_Ent
							,a.Flag_Sal
							)
						VALUES (
							@dTmp
							,@CodPer
							,@cHrIni
							,@cHrFin
							,@cMotivo
							,@cDoc
							,@cFlagE
							,@cFlagS
							)
					END
					ELSE
					BEGIN
						--Si no Tiene Asistencia Ni perniso Ni Asistencia Irregular, Agregar la FALTA
						SELECT @cHrIni = '00:00:00'
							,@cFlagE = 'F'
							,@cHrFin = '00:00:00'
							,@cFlagS = 'F'

						INSERT #Tmp (
							Fecha
							,CodPer
							,HoraEnt
							,HoraSal
							,Motivo
							,DocJustif
							,Flag_Ent
							,Flag_Sal
							)
						VALUES (
							@dTmp
							,@CodPer
							,@cHrIni
							,@cHrFin
							,@cMotivo
							,@cDoc
							,@cFlagE
							,@cFlagS
							)
					END
				END
			END

			SET @dTmp = DATEADD(d, 1, @dTmp)
		END

		SET @CodPer = 0

		FETCH NEXT
		FROM cPersonal
		INTO @CodPer
	END

	CLOSE cPersonal

	DEALLOCATE cPersonal

	--Devolver las Asistencias y Eliminar la tabla temporal
	--SELECT * FROM #Tmp
	SELECT t.CodPer Codigo
		,(P.Apellido_Paterno + ' ' + P.Apellido_Materno + ', ' + P.Nombres) NombreCompletos
		,DATENAME(weekday, t.fecha) AS NombreDia
		,convert(VARCHAR(10), t.Fecha, 103) AS Fecha
		,t.HoraEnt Entrada
		,t.HoraSal Salida
		,t.Motivo
		,t.DocJustif Documento
		,
		--isnull(t.Flag_Ent,'--'), isnull(t.Flag_Sal,'--'), 
		TT.Descripcion
		,EO.AreaOrganizacional
	FROM #Tmp t
	INNER JOIN Empleado f ON t.CodPer = f.IdEmpleado
	INNER JOIN Persona P ON P.IdPersona = f.IdPersona
	INNER JOIN TipoTrabajador TT ON TT.IdTipoTrabajador = f.IdTipoTrabajador
	INNER JOIN Empleado_Area ea ON ea.idempleado = f.idempleado
		AND ea.Year = '2011' --Year(getdate())
	INNER JOIN dbo.EstructOrganiz EO ON EO.idAreaOrganiz = ea.idAreaOrganiz
		AND EO.Year = '2011'--Year(getdate())
	ORDER BY t.CodPer
		,t.Fecha

	DROP TABLE #Tmp
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PTI_SP_UpDate_Empleado_Area]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[PTI_SP_UpDate_Empleado_Area] AS' 
END
GO
ALTER procedure [dbo].[PTI_SP_UpDate_Empleado_Area]
@idareaorganiz int,
@idempleado int,
@year int
as
Begin
	declare @x int
	Select @x=COUNT(*) from empleado_area where
	idempleado=@idempleado and year=@year and idareaorganiz=@idareaOrganiz 
	if @x<1 
		begin
			update empleado_area 
			set idareaorganiz=@idareaOrganiz 
			where idempleado=@idempleado and year=@year
		end	
end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_aba_BuscarGasto]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_aba_BuscarGasto] AS' 
END
GO
ALTER procedure [dbo].[sp_aba_BuscarGasto]
(
@idgasto varchar(17)=null
)
as 

if @idgasto is null 
	set @idgasto=1

select distinct descripcion from vs_aba_gastopublico
where idgastopublico=@idgasto --and Anio=2010
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_aba_CorrNroTipoDoc]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_aba_CorrNroTipoDoc] AS' 
END
GO

ALTER procedure [dbo].[sp_aba_CorrNroTipoDoc]
(
@idTipoDoc char(2),
@Anio char(4)
)
as 

DECLARE @VAR INT
SET @VAR=(SELECT NUMERO FROM TIPODOC where idTipoDoc=@idTipoDoc and Anio=@Anio)

update TipoDoc set Numero=@VAR+1 
where idTipoDoc=@idTipoDoc and anio=@anio

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_aba_NroMaxPer]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_aba_NroMaxPer] AS' 
END
GO
ALTER procedure [dbo].[sp_aba_NroMaxPer]
(
@tipoPer char(1)
)
as

select max(idpersona) from persona where tipopersona=@tipoper
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_aba_OrdenDetalle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_aba_OrdenDetalle] AS' 
END
GO
ALTER procedure [dbo].[sp_aba_OrdenDetalle]
(
@TipoOrden char(1),
@IdOrden char(8)
)
as 

select

Item,
Codigo,
Descripcion, 
Cantidad,
Precio,
Detalle,
CodMeta,
Meta,
CodGasto,
GastoP,
Metaanio,
Monto,
[U Medida],	
IDMEDIDA
from vs_aba_Detalle
where  tipoorden=@TipoOrden and idorden=@IdOrden
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_aba_usuario_areaO]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_aba_usuario_areaO] AS' 
END
GO
ALTER procedure [dbo].[sp_aba_usuario_areaO]
(
@anio int,
@login char(20)
)
as 
select 
u.login,u.idempleado,e.idareaorganiz,a.areaorganizacional
from usuario u,empleado_area e, estructorganiz a 
where u.idempleado=e.idempleado and
      e.idareaorganiz=a.idareaorganiz and
	  e.year=a.year and	
	  e.year = @anio and u.login=@login

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_AbaNroMaxMovimiento]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_AbaNroMaxMovimiento] AS' 
END
GO
ALTER procedure [dbo].[sp_AbaNroMaxMovimiento]
(@anio char(2))
as 

SELECT Anio, MAX(Numero)+1 AS Numero 
FROM vs_aba_NroMaxMovimiento
GROUP BY Anio
HAVING Anio LIKE @anio
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Act_Areas_Empleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Act_Areas_Empleado] AS' 
END
GO
ALTER proc [dbo].[sp_Act_Areas_Empleado]
(
@Dni char(12),
@RUC varchar(12),
@direccion varchar(100),
@idArea int
)
as
declare @idpersona int
select @idpersona=P.idpersona from Persona P 
inner join empleado E on P.idpersona=E.idpersona
where E.estado=1 and P.numdocid=@Dni
if(@idpersona is null)
	Begin
		print 'el dni no se encontro: ' + @Dni
	End
else
	Begin
		update Persona
		set Direccion=RTRIM(LTRIM(@direccion))
		where idpersona=@idpersona
		
		declare @idEmpleado int
		select @idEmpleado=idEmpleado from Empleado E 
		where E.idpersona=@idpersona
		
		Update Empleado
		set NumRUC=@RUC		
		where idEmpleado=@idEmpleado
		
		declare @b int
		select 	@b=isnull(count(*),0) from Empleado_Area
		where idEmpleado=@idEmpleado and year=2010
		
		if(@b=0)
			Insert Empleado_Area(Year,idAreaOrganiz,IdEmpleado) 
			values(2010,@idArea,@idEmpleado)
		else
			Update Empleado_Area
			set idAreaOrganiz=@idArea
			where idempleado=@idEmpleado and Year=2010
		
	End
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Actualiza_Asistencia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Actualiza_Asistencia] AS' 
END
GO
ALTER proc [dbo].[sp_Actualiza_Asistencia]
(
@IdEmpleado int,
@Fecha datetime,
@Hor_Sal char(8),
@Flag_Sal bit
)
as
update dbo.Asistencia
set Hor_Sal=@Hor_Sal,
Flag_Sal=@Flag_Sal
where IdEmpleado=@IdEmpleado
and Fecha=@Fecha
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Actualiza_Empleado_Area]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Actualiza_Empleado_Area] AS' 
END
GO
ALTER proc [dbo].[sp_Actualiza_Empleado_Area]
@idAreaOrganiz int,
@Anio int, 
@IdEmpleado int
as
update Empleado_Area
set idAreaOrganiz=@idAreaOrganiz
Where Year=@Anio and IdEmpleado=@IdEmpleado
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_busca_empleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_busca_empleado] AS' 
END
GO
ALTER proc [dbo].[sp_busca_empleado]
@idempleado int = null,
@NumdocId varchar(12),
@Apellido_Paterno varchar(30),
@activo bit
as
select Codigo,DNI,[Nombres Completos],AreaOrganizacional,cargo from
vs_RRHH_buscarEmpleado
where (estado=@activo) 
and ([Nombres Completos] like @Apellido_Paterno+'%' or @Apellido_Paterno='')
and (DNI=@NumdocId or @NumDocID = '')
and (Codigo=@idempleado or @idempleado is null)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Cargo_Mantenedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_Cargo_Mantenedor] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_Cargo_Mantenedor]
@IdCargo Int = null
,@Cargo VarChar (50) = null
,@Abreviatura VarChar (5) = null
,@consulta tinyint
AS
  
IF(@consulta = 4)
BEGIN
	 SELECT  ISNULL(IdCargo, 0)IdCargo, ISNULL(Cargo, 0)Cargo, ISNULL(Abreviatura, '')Abreviatura FROM [dbo].[Cargo]
END
ELSE

IF(@consulta = 1)
BEGIN
	INSERT INTO [dbo].[Cargo]
	(
	 [IdCargo] 
	,[Cargo]
	,[Abreviatura]
	)VALUES(
	 @IdCargo 
	,@Cargo
	,@Abreviatura
	)
END
ELSE
 
IF(@consulta = 2)
BEGIN
	UPDATE [dbo].[Cargo]
	SET
	 [IdCargo] = @IdCargo 
	 ,[Cargo] = @Cargo 
	 ,[Abreviatura] = @Abreviatura 
	WHERE  IdCargo = @IdCargo
END
ELSE

IF(@consulta = 3)
BEGIN
	DELETE FROM [dbo].[Cargo]
		WHERE IdCargo = @IdCargo
END
ELSE

IF(@consulta = 5)
BEGIN
	 SELECT  ISNULL(IdCargo, 0)IdCargo, ISNULL(Cargo, 0)Cargo, ISNULL(Abreviatura, '')Abreviatura FROM [dbo].[Cargo]
	WHERE IdCargo = @IdCargo
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_consulta_Anticipo_sin_Rendicion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_consulta_Anticipo_sin_Rendicion] AS' 
END
GO
ALTER proc [dbo].[sp_consulta_Anticipo_sin_Rendicion]
@anio as int,
@solo as bit
as
if @solo=1
select * from vw_Listar_Anticipos_Sin_Rendicion A
where (A.fechaRegistroCP is not null) and (Estado=3)
and (A.RendicionTramitada =0 or A.RendicionTramitada is null)
and A.Año=@anio
else
select * from vw_Listar_Anticipos_Sin_Rendicion A
where (A.fechaRegistroCP is not null)
and (A.RendicionTramitada =0 or A.RendicionTramitada is null)
and A.Año=@anio


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_consutarUsuario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_consutarUsuario] AS' 
END
GO
ALTER procedure  [dbo].[sp_consutarUsuario] 
@Login char(20),
@Descripcion varchar(40)

AS
BEGIN
	SELECT COUNT(*) from Usuario where
	Login = @Login and Descripcion = @Descripcion
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_dissListar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_dissListar] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_dissListar]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * from Dispositivo;
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Elimnar_HorarioTemporal]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Elimnar_HorarioTemporal] AS' 
END
GO
ALTER proc [dbo].[sp_Elimnar_HorarioTemporal]
@IdEmpleado int,
@NPermiso int
as
Delete from dbo.HorarioTemporal
where IdEmpleado=@IdEmpleado and N=@NPermiso
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Elimnar_Permiso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Elimnar_Permiso] AS' 
END
GO
ALTER proc [dbo].[sp_Elimnar_Permiso]
@IdEmpleado int,
@NPermiso int
as
Delete from dbo.Permiso
where IdEmpleado=@IdEmpleado and NPermiso=@NPermiso
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ExistePermiso_Permiso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ExistePermiso_Permiso] AS' 
END
GO
ALTER proc [dbo].[sp_ExistePermiso_Permiso]
(
@idEmpleado int,
@FechaInicio char(8),
@FechaFin char(8)
)
as
select isnull(Count(Npermiso),0) from permiso 
where idEmpleado=@idEmpleado and ((@FechaInicio between Convert(Char(8),FechaInicio,112) and Convert(Char(8),FechaFin,112))
or (@FechaFin between Convert(Char(8),FechaInicio,112) and Convert(Char(8),FechaFin,112)))


--and (Convert(Char(8),FechaInicio,112)<=@FechaInicio and Convert(Char(8),FechaFin,112) >= @FechaInicio)
--or (Convert(Char(8),FechaInicio,112)<=@FechaFin and Convert(Char(8),FechaFin,112) >= @FechaFin)



GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Get_Empleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Get_Empleado] AS' 
END
GO
ALTER proc [dbo].[sp_Get_Empleado]
@IdEmpleado int
as
Select IdPersona,
ExpSocial,
FechaIngreso,
IdAFP,
Brevete,
IdEstadoCivil,
Sexo,
CtaCorriente,
NroAFP,
FechaAFP,
IdSeguro,
NroSeguro,
IdTipoSangre,
DecLey,
IdTipoTrabajador,
Estado,
IdCargo,
IdDiscapacidad,
Profesion,
JefeHogar,
CargaFam,
NumHijos,
IdViveCon,
ObsFam,
AspecSalud,
AspecEducacion,
AspecRecreacion,
AspecPsico,
AspecSocial,
DiagnosSocial,
IdNacionalidad,
NumLibretaMilitar,
GradoInstruccion,
IdRegimenPen,
NumRUC,
NumAutogenSalud,
NumResolCese,
FechaResolCese,
NumResol20530,
FechaResol20530,
NumResolPenMen,
FechaResolPenMen,
NumResoIngreEsta,
FechaIngreEstado,
FechaResolIngreEsta,
NumResoIngreInstitu,
FechaResoIngreInstitu,
FechaResoIngreInstitu,
idHorario
from Empleado 
where IdEmpleado=@IdEmpleado
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Get_Empleado_Area_By_idEmpleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Get_Empleado_Area_By_idEmpleado] AS' 
END
GO
ALTER proc [dbo].[sp_Get_Empleado_Area_By_idEmpleado]
(
@idEmpleado int
)
as
Select Year, idAreaOrganiz from Empleado_Area
where idEmpleado=@idEmpleado
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Get_EstructOrganiz]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Get_EstructOrganiz] AS' 
END
GO
ALTER proc [dbo].[sp_Get_EstructOrganiz] 
@idAreaOrganiz int=null,
@Year int=null,
@consulta tinyint=1
as
IF(@consulta = 1)
BEGIN
select
UPPER(AreaOrganizacional) as AreaOrganizacional,
Abrev,
Sigla,
PresupAnual,
PromedMensSueld,
NroTrabajaUO,
Mision,
Vision,
IdPresupuesto,
YearDe,
idDependeDe,
IdEmpleado,
InversPublic,
ApruebaPedido,
MontoAprobacion,
PresupCompra,
PresupUtilizado
from EstructOrganiz
where idAreaOrganiz=@idAreaOrganiz and Year=@Year
END

ELSE
IF(@consulta = 2)
BEGIN
SELECT  idAreaOrganiz, UPPER(AreaOrganizacional) AS AreaOrganizacional
	FROM EstructOrganiz 
	WHERE Year=@Year 
ORDER BY AreaOrganizacional
ASC
END

ELSE
IF (@consulta = 3)
BEGIN
SELECT DISTINCT year FROM EstructOrganiz ORDER BY Year DESC
END




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Get_Persona]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Get_Persona] AS' 
END
GO
ALTER proc [dbo].[sp_Get_Persona]
@IdPersona int
as
select 
Nombres,
Apellido_Paterno,
Apellido_Materno,
TipoDocID,
NumDocID,
Direccion,
Telefono,
Fax,
Email,
IdUbigeo,
UbigeoDireccion,
TipoPersona,
FechaNacimiento,
FechaRegistro,
NumCelular,
FonoCentroLab
from dbo.Persona
where IdPersona=@IdPersona
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Get_TipoTrabajador]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Get_TipoTrabajador] AS' 
END
GO
ALTER proc [dbo].[sp_Get_TipoTrabajador]
@IdTipoTrabajador int 
as
select
Descripcion,
Observaciones
from dbo.TipoTrabajador
where IdTipoTrabajador=@IdTipoTrabajador
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAll_Area_By_Anio]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAll_Area_By_Anio] AS' 
END
GO
ALTER proc [dbo].[sp_GetAll_Area_By_Anio]
@Anio int
as
select EO.Year, EO.idAreaOrganiz, EO.AreaOrganizacional
from dbo.EstructOrganiz EO where year=@Anio
order by AreaOrganizacional
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_GetAll_EmpleadoArea_by_idEmpleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_GetAll_EmpleadoArea_by_idEmpleado] AS' 
END
GO
ALTER proc [dbo].[sp_GetAll_EmpleadoArea_by_idEmpleado]
@idEmpleado int
as
--select * from Persona P
--inner join Empleado E on P.idpersona=E.idPersona
--inner join
Select EA.Year, EA.idAreaOrganiz, EO.AreaOrganizacional from  Empleado_Area EA 
inner join dbo.EstructOrganiz EO on EO.idAreaOrganiz=EA.idAreaOrganiz and EO.year=EA.year
where EA.idempleado=@idEmpleado
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_halla_area]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_halla_area] AS' 
END
GO
ALTER procedure [dbo].[sp_halla_area]
@idEmpleado int 
as 
select eo.AreaOrganizacional from Empleado e,EstructOrganiz eo
where e.Year = eo.Year and
e.idAreaOrganiz=eo.idAreaOrganiz and
e.IdEmpleado=@idEmpleado

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Import_Permiso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Import_Permiso] AS' 
END
GO
ALTER proc [dbo].[sp_Import_Permiso]
(
@DNI varchar(8),
@Referencia varchar(50)=null,
@Fechainicio char(10),
@FechaFin char(10),
@idMotivo int
)
as
declare @idempleado int
Select @idempleado=E.idempleado from Persona P
inner join Empleado E on P.idpersona=E.idpersona
where E.estado=1 and p.numdocid=@DNI

if @idempleado is null
	Begin
	Print 'Error: el empleado con DNI: ' + @DNI + 'no se encuentra en la BD'
	End
else
	Begin 
	declare @Npermiso int
	select @Npermiso=isnull(count(*),0)+1 from Permiso where idempleado=@idempleado
	insert permiso(idempleado, NPermiso, FechaInicio, FechaFin, idMotivo, Referencia, obs)
	values(@idempleado,@Npermiso,@Fechainicio,@FechaFin,@idMotivo,@Referencia,'Software Anterior')
	End





GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ImportarAsistenciadeExcel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ImportarAsistenciadeExcel] AS' 
END
GO


ALTER PROCEDURE [dbo].[sp_ImportarAsistenciadeExcel]
-- =============================================
-- Author:		Edgard William Vilchez Valdez.
-- eMail:       valdez107@hotmail.com
-- Create date: 25-oct-2010
-- Description:	Permite importar datos desde una hoja excel a sql
-- =============================================
	@SheetName varchar(20),
    @FilePath varchar(100),
	@HDR varchar(3)    
as
BEGIN
    DECLARE @SQL nvarchar(1000)
    set @SQL = 'SELECT *  FROM OPENROWSET'
    set @SQL = @SQL + '(''Microsoft.ACE.OLEDB.12.0'',''Excel 8.0;HDR='
    set @SQL = @SQL + @HDR + ';IMEX=1;Database='
    set @SQL = @SQL + @FilePath + ''',''SELECT * FROM ['
    set @SQL = @SQL + @SheetName + ']'');'    
    EXEC sp_executesql @SQL
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Insert_Empleado_Area]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Insert_Empleado_Area] AS' 
END
GO
ALTER proc [dbo].[sp_Insert_Empleado_Area]
@Year int, 
@idAreaOrganiz int,
@IdEmpleado int
as
Insert Empleado_Area(Year,idAreaOrganiz,IdEmpleado)
values(@Year,@idAreaOrganiz,@IdEmpleado)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_listaDispo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_listaDispo] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_listaDispo]
AS
BEGIN
	SET NOCOUNT ON;

    select d.idDispositivo as ID, d.Descripcion as DESCRIPCION,d.CodInterno  AS COD_INTERNO,D.StickerA AS STICKER_A, D.StickerB AS STICKER_B,D.idTipoDispositivo AS ID_TIPO
    from Dispositivo d;
    
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Listar_Empleado_Horario]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Listar_Empleado_Horario] AS' 
END
GO
ALTER proc [dbo].[sp_Listar_Empleado_Horario]
(
@IdTipoTrabajador as int = null,
@Apellido_Paterno as nvarchar(30)=null
)
as
select 
E.idEmpleado, 
P.NumDocID,
P.Nombres,
P.Apellido_Paterno,
P.Apellido_Materno,
e.idHorario 
from Persona P
inner join Empleado E on P.idpersona=E.idpersona
left join Horario H on E.idhorario=H.idhorario
where E.estado=1 and (E.IdTipoTrabajador=@IdTipoTrabajador or @IdTipoTrabajador is null )
and (P.Apellido_Paterno like '%'+@Apellido_Paterno+'%' or @Apellido_Paterno is null)
order by Apellido_Paterno
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Listar_Empleado_Local]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Listar_Empleado_Local] AS' 
END
GO
ALTER proc [dbo].[sp_Listar_Empleado_Local]
(
@IdTipoTrabajador as int = null,
@Apellido_Paterno as nvarchar(30)=null
)
as
select 
E.idEmpleado, 
P.NumDocID,
P.Nombres,
P.Apellido_Paterno,
P.Apellido_Materno,
e.idLocal 
from Persona P
inner join Empleado E on P.idpersona=E.idpersona
left join Local L on E.idhorario=L.idLocal
where E.estado=1 and (E.IdTipoTrabajador=@IdTipoTrabajador or @IdTipoTrabajador is null )
and (P.Apellido_Paterno like '%'+@Apellido_Paterno+'%' or @Apellido_Paterno is null)
order by Apellido_Paterno
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_listar_TI_Encargados]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_listar_TI_Encargados] AS' 
END
GO
ALTER  PROCEDURE [dbo].[sp_listar_TI_Encargados]
AS
BEGIN
	select em.IdEmpleado,(p.Apellido_Paterno +' '+p.Apellido_Materno+', '+p.Nombres )  as nombres
from Persona p 
INNER join Empleado  em on em.IdPersona=p.IdPersona
inner join Empleado_Area ea on ea.IdEmpleado=em.IdEmpleado
inner join EstructOrganiz eo on eo.idAreaOrganiz=ea.idAreaOrganiz and eo.Year=ea.Year
inner join Cargo c on em.IdCargo=c.IdCargo
where eo.idAreaOrganiz=48 and eo.Year=2011 and c.Cargo != 'Director de Sistema Administrativo II' and c.Cargo != 'Secretaria II' 
and c.Cargo != 'DESARROLLO' and c.Cargo != 'SOPORTE' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Listar_TipoTrabajador]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Listar_TipoTrabajador] AS' 
END
GO
ALTER proc [dbo].[sp_Listar_TipoTrabajador]
as
select T.idTipoTrabajador, 
T.Descripcion from tipotrabajador T
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ListarPersonasRechazo_TRATramite]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ListarPersonasRechazo_TRATramite] AS' 
END
GO
ALTER proc [dbo].[sp_ListarPersonasRechazo_TRATramite]
as
select 
distinct(PersonaRechazo) as idEmpleadoRechazo,
(P.Apellido_Paterno + ' ' +
P.Apellido_Materno + ', ' +
P.Nombres ) as NombresC
from dbo.TRATramite TT
inner join Empleado E on TT.PersonaRechazo=E.idempleado
inner join Persona P on P.idPersona=E.idPersona 
where PersonaRechazo is not null
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_ObterIdArea_Empleado_Area]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_ObterIdArea_Empleado_Area] AS' 
END
GO
ALTER proc [dbo].[sp_ObterIdArea_Empleado_Area]
(
@Year int,
@IdEmpleado int
)
as
Select idAreaOrganiz from dbo.Empleado_Area
where IdEmpleado=@IdEmpleado and Year=@Year
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_prueba]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_prueba] AS' 
END
GO
ALTER proc [dbo].[sp_prueba]
@fi char(8),
@ff char(8)
as

declare @Fecha datetime,@IdEmpleado int, @Estado char(2), @fecha2 varchar(10)

--CREATE TABLE #TablaTemporal (IdEmple int, FeCha char(1))

declare Get_Fecha cursor for 
select Fecha from dbo.Asistencia
where fecha >=@fi  and fecha <=@ff 

open Get_Fecha

FETCH NEXT FROM Get_Fecha INTO @Fecha
WHILE @@FETCH_STATUS=0

begin

declare Get_Asiste cursor for 
select Fecha, IdEmpleado, Estado='A' from dbo.Asistencia
where fecha =@Fecha
Union all
(
select Fecha=null,IdEmpleado, Estado='F' from vs_GetEmpleado where Estado=1
except
select Fecha=null,IdEmpleado, Estado='F' from vs_faltas where Estado=1 and fecha = @Fecha
)
order by IdEmpleado
OPEN Get_Asiste
FETCH NEXT FROM Get_Asiste INTO @fecha2,@IdEmpleado,@Estado
WHILE @@FETCH_STATUS = 0
begin

--ALTER TABLE #TablaTemporal
--Add @fecha char (1) null

--print convert(char(10),@fecha2,103) + ' ' + convert(char(1),@IdEmpleado) + ' ' + @Estado
select @fecha2,@IdEmpleado,@Estado
FETCH NEXT FROM Get_Asiste INTO @fecha2,@IdEmpleado,@Estado
end
CLOSE Get_Asiste
DEALLOCATE Get_Asiste


FETCH NEXT FROM Get_Fecha INTO @Fecha
end
close Get_Fecha
DEALLOCATE Get_Fecha

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Rep_Principal]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Rep_Principal] AS' 
END
GO
ALTER proc [dbo].[sp_Rep_Principal]
@autor nvarchar(200)= null,
@idOperador int= null,
@IIniciativa datetime = null,
@FIniciativa datetime= null,
@INorma nvarchar(10)= null,
@FNorma nvarchar(10)= null,
@idTipoProyec int= null,
@idTipoNorma int= null
as
select 
i.numoficioiniciativa as NOficioPresetIniciativa,
t.numtema,
(i.numoficioiniciativa +' del '+convert(char(10),o.fechaemision,103)) as Iniciativa,
--o.fechaemision as FechaOficioPresetIniciativa, 
t.temadescrip as tema,
i.nombreresponsable as autor,
(p.Apellido_Paterno + ' ' + p.Apellido_Materno + ' ' + Nombres) as Operador,
(DescripTipoProyec + ' N° ' +pn.Numproyecto) as ProyecNormativo,
(tn.DescripTipoNorma + ' N° '+nr.numordenanza) as NormaReg
from dbo.CJROficio o
inner join dbo.CJRIniciativa i on o.numoficio=i.numoficioiniciativa
inner join dbo.CJRTemaIniciativa t on t.numoficioiniciativa=i.numoficioiniciativa 
inner join dbo.CJROperador op on op.idoperador=i.idoperador
inner join dbo.Empleado e on e.idempleado=op.idempleado
inner join dbo.Persona p on p.idpersona=e.idpersona
left join dbo.CJRProyectoNormativo pn on pn.numoficioiniciativa=t.numoficioiniciativa and pn.numtema=t.numtema
left join dbo.CJRTipoProyecto tp on tp.idTipoProyec=pn.idTipoProyec
left join dbo.CJRNormaRegional nr on nr.numproyecto=pn.numproyecto and nr.idTipoProyec=pn.idTipoProyec
left join dbo.CJRTipoNorma tn on tn.idTipoNorma=nr.idTipoNorma
where 
(nombreresponsable like '%'+@autor+'%' or @autor is null) and
(op.idOperador=@idOperador or @idOperador is null) and
(o.fechaemision >= @IIniciativa or @IIniciativa is null) and
(o.fechaemision <= @FIniciativa or @FIniciativa  is null) and
(nr.fechaordenanza >= @INorma or @INorma is null) and
(nr.fechaordenanza <= @FNorma or @FNorma is null) and
(pn.idTipoProyec=@idTipoProyec or @idTipoProyec is null) and
(nr.idTipoNorma =@idTipoNorma or @idTipoNorma  is null)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RRHH_Busca_Empleado_tree]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_RRHH_Busca_Empleado_tree] AS' 
END
GO
ALTER proc [dbo].[sp_RRHH_Busca_Empleado_tree]
@idAreaOrganiz int,
@year int,
@estado bit,
@tipotrabajador int
--WITH ENCRYPTION
as
select idtipoTrabajador,Codigo, DNI, NombresCompletos, Cargo 
from dbo.vs_RRHH_buscarEmpleado V
inner join dbo.Empleado_Area EA on V.Codigo=EA.IdEmpleado
where 
EA.idAreaOrganiz=@idAreaOrganiz and 
EA.year=@year and 
Estado=@estado and 
(idTipoTrabajador=@tipotrabajador or @tipotrabajador =0)


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_RRHH_ListarProfesiones]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_RRHH_ListarProfesiones] AS' 
END
GO
ALTER proc [dbo].[sp_RRHH_ListarProfesiones]
as
select distinct profesion from Empleado
where Profesion is not null and Profesion <> ''
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Seguridad_DatosUsuario_By_UserId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_Seguridad_DatosUsuario_By_UserId] AS' 
END
GO
ALTER PROC [dbo].[SP_Seguridad_DatosUsuario_By_UserId]
@Userid uniqueidentifier
AS
SELECT E.IdEmpleado,isnull(E.FOTO, '') as FOTO,P.IdPersona, P.Nombres, P.Apellido_Paterno, P.Apellido_Materno 
FROM  Empleado E 	
INNER JOIN Persona P ON E.IdPersona=P.IdPersona 
WHERE Userid=@Userid 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SgtID_HorarioTemporal]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_SgtID_HorarioTemporal] AS' 
END
GO
ALTER proc [dbo].[sp_SgtID_HorarioTemporal]
@idempleado int
as
select isnull(max(N),0)+1 from HorarioTemporal where idempleado=@idempleado


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_SgtID_Permiso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_SgtID_Permiso] AS' 
END
GO

ALTER proc [dbo].[sp_SgtID_Permiso]
@idempleado int
as
select isnull(max(Npermiso),0)+1 from permiso where idempleado=@idempleado
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_TipoDoc_Mantenedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_TipoDoc_Mantenedor] AS' 
END
GO

--- Mantenedor TipoDoc ---
ALTER PROC [dbo].[SP_TipoDoc_Mantenedor]  
@IdTipodoc Char(2)=null,
@Descripcion VarChar (100) = null,
@Numero Int = null,
@Serie TinyInt = null,
@Anio  Char(4)=Null,
@consulta tinyint 
AS
---Utilizar para Funcion ObtenerUno()
IF(@consulta = 1)
BEGIN
	INSERT INTO [dbo].[TipoDoc]
	(
	 [IdTipodoc] 
	,[Descripcion]
	,[Numero]
	,[Serie]
	,[Anio]
	)VALUES(
	 @IdTipodoc 
	,@Descripcion
	,@Numero
	,@Serie
	,@Anio
	)
END
ELSE

IF(@consulta = 2)
BEGIN
	UPDATE [dbo].[TipoDoc]
	SET
	 [IdTipodoc] = @IdTipodoc 
	 ,[Descripcion] = @Descripcion 
	 ,[Numero] = @Numero 
	 ,[Serie] = @Serie 
	 ,[Anio] = @Anio 
	WHERE  IdTipodoc = @IdTipodoc AND Anio=@Anio
END
ELSE
 
IF(@consulta = 3)
BEGIN
	DELETE FROM [dbo].[TipoDoc]
		WHERE IdTipodoc = @IdTipodoc
END
ELSE
IF(@consulta = 4)
BEGIN
	 SELECT  ISNULL(IdTipodoc, 0)IdTipodoc, ISNULL(Descripcion, 0)Descripcion, ISNULL(Numero, 0)Numero, ISNULL(Serie, 0)Serie, ISNULL(Anio, 0)Anio FROM [dbo].[TipoDoc]
END
ELSE
IF(@consulta = 5)
BEGIN
	SELECT IdTipodoc, Descripcion, Numero, ISNULL(Serie,'')Serie, Anio 
	FROM [dbo].[TipoDoc] WITH(NOLOCK)
	WHERE IdTipodoc = @IdTipodoc And Anio = @Anio
END
ELSE
IF(@consulta = 6) ---ActualizarNumero
BEGIN
	UPDATE [dbo].[TipoDoc]
	SET Numero= @Numero	
	WHERE IdTipodoc = @IdTipodoc And Anio = @Anio
END

---------------------------------------------------
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_Tra_Art_Nro]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_Tra_Art_Nro] AS' 
END
GO
ALTER PROCEDURE [dbo].[SP_Tra_Art_Nro]
(@Nro_Acuerdo AS NCHAR(10))

AS 

SELECT CAST((ISNULL(MAX(NRO_ARTICULO),0) +1) AS CHAR(2)) AS Nro_Articulo
FROM TRA_ARTICULO_ACUERDO 
WHERE NRO_ACUERDO=@Nro_Acuerdo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_tra_ContarMov]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_tra_ContarMov] AS' 
END
GO

ALTER procedure [dbo].[sp_tra_ContarMov]
(
@login varchar(20),
@estadoReal varchar(10)
)
as
SELECT *
FROM vs_tra_ListarMovimientoTiempo
WHERE idetapaproc in (SELECT idetapaproc
FROM VS_TRA_PROC_ETAPA_AREA_CARGO a, 
	 VS_TRA_USUARIO_AREA_CARGO  b
WHERE A.IDareaorganiz=B.IDareaorganiz AND 
      a.IDCARGO=B.IDCARGo and 
      b.login=@login) and estadoreal =@estadoReal and estado IN ('TR', 'pe')
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_tra_MaxIdRequisito]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_tra_MaxIdRequisito] AS' 
END
GO
ALTER procedure [dbo].[sp_tra_MaxIdRequisito]
as 
select corre=isnull(max(idrequisito),0) from trarequisito

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Tra_TRA_ListarMovimiento]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Tra_TRA_ListarMovimiento] AS' 
END
GO
ALTER PROCEDURE [dbo].[sp_Tra_TRA_ListarMovimiento]
(
 @idtramite int
 )
AS
BEGIN
	select * from vs_TRA_ListarMovimiento
	where idtramite=@idtramite
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Tra_TraListarTramite]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Tra_TraListarTramite] AS' 
END
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_Tra_TraListarTramite]
AS
BEGIN
	select * from dbo.vs_tra_listarTramite 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Tra_Usuario_AreaCargo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Tra_Usuario_AreaCargo] AS' 
END
GO
ALTER procedure [dbo].[sp_Tra_Usuario_AreaCargo]
(
@Login char(20)
)
as
begin
select idareaorganiz,idcargo 
from vs_tra_usuario_area_cargo
where [login]=@Login
end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_TRAMovimiento_Mantenedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_TRAMovimiento_Mantenedor] AS' 
END
GO

ALTER PROCEDURE [dbo].[SP_TRAMovimiento_Mantenedor] 

	@IdMovimiento Char (10) = null
	,@IdEtapaProc Char (8) = null
	,@IdTramite Char (10) = null
	,@FechaIngreso SmallDateTime = null
	,@NumRecepcion Numeric = null
	,@AreaIngreso Int = null
	,@Anio Char (5) = null
	,@IdEmpleado Int = null
	,@Estado VarChar (1) = null
	,@FechaSalida SmallDateTime = null
	,@AreaDestino Int = null
	,@TiempoDias Int = null
	,@TiempoHrs Decimal = null
	,@TiempoMin Int = null
	,@MovimientoOrigen Char (10) = null
	,@MovimientoDestino Char (10) = null
	,@AvisoHrs Decimal = null
	,@sysFecha DateTime = null
	,@sysUsuario Char (20) = null
	,@sysPC Char (20) = null
	,@Doc_Fisico Bit = null
	,@Observacion VarChar (200) = null
	,@UnidadOr Int = null
,@consulta tinyint
AS

IF(@consulta = 4)
BEGIN
	 SELECT  ISNULL(IdMovimiento, 0)IdMovimiento, ISNULL(IdEtapaProc, 0)IdEtapaProc, 
			 ISNULL(IdTramite, 0)IdTramite, ISNULL(FechaIngreso, 0)FechaIngreso, 
			 ISNULL(NumRecepcion, 0)NumRecepcion, ISNULL(AreaIngreso, 0)AreaIngreso, 
			 ISNULL(Anio, 0)Anio, ISNULL(IdEmpleado, 0)IdEmpleado, ISNULL(Estado, 0)Estado, 
			 ISNULL(FechaSalida, 0)FechaSalida, ISNULL(AreaDestino, 0)AreaDestino, 
			 ISNULL(TiempoDias, 0)TiempoDias, ISNULL(TiempoHrs, 0)TiempoHrs, 
			 ISNULL(TiempoMin, 0)TiempoMin, ISNULL(MovimientoOrigen, 0)MovimientoOrigen, 
			 ISNULL(MovimientoDestino, 0)MovimientoDestino, ISNULL(AvisoHrs, 0)AvisoHrs, 
			 ISNULL(sysFecha, 0)sysFecha, ISNULL(sysUsuario, 0)sysUsuario, ISNULL(sysPC, 0)sysPC, 
			 ISNULL(Doc_Fisico, 0)Doc_Fisico, ISNULL(Observacion, 0)Observacion
	FROM [dbo].[TRAMovimiento]
END
ELSE

IF(@consulta = 1)
BEGIN
	DECLARE @Nrecep AS Numeric
	SET @Nrecep=(dbo.TRA_ObtenerNumeroRecepcion (@UnidadOr,@Anio))	
	INSERT INTO [dbo].[TRAMovimiento]
	(	
	 [IdMovimiento] 
	,[IdEtapaProc]
	,[IdTramite]
	,[FechaIngreso]
	,[NumRecepcion]
	,[AreaIngreso]
	,[Anio]
	,[IdEmpleado]
	,[Estado]
	,[FechaSalida]
	,[AreaDestino]
	,[TiempoDias]
	,[TiempoHrs]
	,[TiempoMin]
	,[MovimientoOrigen]
	,[MovimientoDestino]
	,[AvisoHrs]
	,[sysFecha]
	,[sysUsuario]
	,[sysPC]
	,[Doc_Fisico]
	,[Observacion]
	)VALUES(
	 @IdMovimiento 
	,@IdEtapaProc
	,@IdTramite
	,@FechaIngreso
	,@Nrecep
	,@AreaIngreso
	,@Anio
	,@IdEmpleado
	,@Estado
	,@FechaSalida
	,@AreaDestino
	,@TiempoDias
	,@TiempoHrs
	,@TiempoMin
	,@MovimientoOrigen
	,@MovimientoDestino
	,@AvisoHrs
	,@sysFecha
	,@sysUsuario
	,@sysPC
	,@Doc_Fisico
	,@Observacion
	)
END
ELSE

IF(@consulta = 2)
BEGIN
	UPDATE [dbo].[TRAMovimiento]
	SET
	 [IdMovimiento] = @IdMovimiento 
	 ,[IdEtapaProc] = @IdEtapaProc 
	 ,[IdTramite] = @IdTramite 
	 ,[FechaIngreso] = @FechaIngreso 
	 ,[NumRecepcion] = @NumRecepcion 
	 ,[AreaIngreso] = @AreaIngreso 
	 ,[Anio] = @Anio 
	 ,[IdEmpleado] = @IdEmpleado 
	 ,[Estado] = @Estado 
	 ,[FechaSalida] = @FechaSalida 
	 ,[AreaDestino] = @AreaDestino 
	 ,[TiempoDias] = @TiempoDias 
	 ,[TiempoHrs] = @TiempoHrs 
	 ,[TiempoMin] = @TiempoMin 
	 ,[MovimientoOrigen] = @MovimientoOrigen 
	 ,[MovimientoDestino] = @MovimientoDestino 
	 ,[AvisoHrs] = @AvisoHrs 
	 ,[sysFecha] = @sysFecha 
	 ,[sysUsuario] = @sysUsuario 
	 ,[sysPC] = @sysPC 
	 ,[Doc_Fisico] = @Doc_Fisico 
	 ,[Observacion] = @Observacion 
	WHERE  IdMovimiento = @IdMovimiento
END
ELSE

IF(@consulta = 3)
BEGIN
	DELETE FROM [dbo].[TRAMovimiento]
		WHERE IdMovimiento = @IdMovimiento
END
ELSE

IF(@consulta = 5)
BEGIN
	 SELECT  ISNULL(IdMovimiento, 0)IdMovimiento, ISNULL(IdEtapaProc, 0)IdEtapaProc, 
			 ISNULL(IdTramite, 0)IdTramite, ISNULL(FechaIngreso, 0)FechaIngreso, 
			 ISNULL(NumRecepcion, 0)NumRecepcion, ISNULL(AreaIngreso, 0)AreaIngreso, 
			 ISNULL(Anio, 0)Anio, ISNULL(IdEmpleado, 0)IdEmpleado, ISNULL(Estado, 0)Estado, 
			 ISNULL(FechaSalida, 0)FechaSalida, ISNULL(AreaDestino, 0)AreaDestino, 
			 ISNULL(TiempoDias, 0)TiempoDias, ISNULL(TiempoHrs, 0)TiempoHrs, 
			 ISNULL(TiempoMin, 0)TiempoMin, ISNULL(MovimientoOrigen, 0)MovimientoOrigen, 
			 ISNULL(MovimientoDestino, 0)MovimientoDestino, ISNULL(AvisoHrs, 0)AvisoHrs, 
			 ISNULL(sysFecha, 0)sysFecha, ISNULL(sysUsuario, 0)sysUsuario, ISNULL(sysPC, 0)sysPC, 
			 ISNULL(Doc_Fisico, 0)Doc_Fisico, ISNULL(Observacion, 0)Observacion
	FROM [dbo].[TRAMovimiento]
		WHERE IdMovimiento = @IdMovimiento
END
ELSE

IF(@consulta = 6)
BEGIN
	UPDATE [dbo].[TRAMovimiento]
	SET
	 [IdMovimiento] = @IdMovimiento 	 
	 ,[MovimientoDestino] = @MovimientoDestino 	  
	WHERE  IdMovimiento = @IdMovimiento
END
ELSE

IF(@consulta = 7)
BEGIN
	UPDATE [dbo].[TRAMovimiento]
	SET
	 [Doc_Fisico] = @Doc_Fisico
	WHERE  IdMovimiento = @IdMovimiento
END
ELSE

IF(@consulta = 8)
BEGIN
	DECLARE @NrecepA AS Numeric
	SET @NrecepA=(dbo.TRA_ObtenerNumeroRecepcion (@UnidadOr,@Anio))
	UPDATE [dbo].[TRAMovimiento]
	SET                
     [Estado] = @Estado,
     [FechaIngreso]=GetDate(),
     [NumRecepcion]=@NrecepA,
     [IdEmpleado]=@IdEmpleado	 
	WHERE  IdMovimiento = @IdMovimiento
END
ELSE

IF(@consulta = 9)
BEGIN	
	UPDATE [dbo].[TRAMovimiento]
	SET                
     [Estado] = @Estado,
     [FechaSalida]=GetDate(),   
     [IdEmpleado]=@IdEmpleado,	 
     [Observacion]=@Observacion
	WHERE  IdMovimiento = @IdMovimiento
END
ELSE

IF(@consulta = 10)
BEGIN	
	UPDATE [dbo].[TRAMovimiento]
	SET                
     [Estado] = @Estado,
     [FechaSalida]=GetDate(),   
     [IdEmpleado]=@IdEmpleado,
     [MovimientoDestino] = @MovimientoDestino,
     [AreaDestino] = @AreaDestino 	 
	WHERE  IdMovimiento = @IdMovimiento
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_TRANumeracion_Mantenedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_TRANumeracion_Mantenedor] AS' 
END
GO

ALTER PROCEDURE [dbo].[SP_TRANumeracion_Mantenedor]

	@IdTipoDoc Char (2) = null
	,@Year Int = null
	,@IdAreaOrganiz Int = null
	,@Numero Int = null
	,@consulta tinyint
AS
  
IF(@consulta = 4)
BEGIN
	 SELECT  ISNULL(IdTipoDoc, 0)IdTipoDoc, ISNULL(Year, 0)Year, ISNULL(IdAreaOrganiz, 0)IdAreaOrganiz, 
			 ISNULL(Numero, 0)Numero 
	 FROM [dbo].[TRANumeracion]
END
ELSE

IF(@consulta = 1)
BEGIN
	INSERT INTO [dbo].[TRANumeracion]
	(
	 [IdTipoDoc] 
	,[Year]
	,[IdAreaOrganiz]
	,[Numero]
	)VALUES(
	 @IdTipoDoc 
	,@Year
	,@IdAreaOrganiz
	,@Numero
	)
END
ELSE

IF(@consulta = 2)
BEGIN
	UPDATE [dbo].[TRANumeracion]
	SET
	 [IdTipoDoc] = @IdTipoDoc 
	 ,[Year] = @Year 
	 ,[IdAreaOrganiz] = @IdAreaOrganiz 
	 ,[Numero] = @Numero 
	WHERE  IdTipoDoc = @IdTipoDoc
END
ELSE

IF(@consulta = 3)
BEGIN
	DELETE FROM [dbo].[TRANumeracion]
		WHERE IdTipoDoc = @IdTipoDoc
END
ELSE

IF(@consulta = 5)
BEGIN
	SELECT  ISNULL(IdTipoDoc, 0)IdTipoDoc, ISNULL(Year, 0)Year, ISNULL(IdAreaOrganiz, 0)IdAreaOrganiz, 
			ISNULL(Numero, 0)Numero 
	FROM [dbo].[TRANumeracion]
	WHERE IdTipoDoc = @IdTipoDoc and Year=@Year and IdAreaOrganiz=@IdAreaOrganiz
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_TRAProcedimiento_Requisito_Mantenedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_TRAProcedimiento_Requisito_Mantenedor] AS' 
END
GO

ALTER PROCEDURE [dbo].[SP_TRAProcedimiento_Requisito_Mantenedor]
 
@IdProcedimiento Char (6) = null
,@IdRequisito Int = null
,@consulta tinyint
AS
 
IF(@consulta = 4)
BEGIN
	 SELECT  ISNULL(IdProcedimiento, 0)IdProcedimiento, ISNULL(IdRequisito, 0)IdRequisito FROM [dbo].[TRAProcedimiento_Requisito]
END
ELSE

IF(@consulta = 1)
BEGIN
	INSERT INTO [dbo].[TRAProcedimiento_Requisito]
	(
	 [IdProcedimiento] 
	,[IdRequisito]
	)VALUES(
	 @IdProcedimiento 
	,@IdRequisito
	)
END
ELSE
 
IF(@consulta = 2)
BEGIN
	UPDATE [dbo].[TRAProcedimiento_Requisito]
	SET
	 [IdProcedimiento] = @IdProcedimiento 
	 ,[IdRequisito] = @IdRequisito 
	WHERE  IdProcedimiento = @IdProcedimiento AND [IdRequisito] = @IdRequisito 
END
ELSE
  
IF(@consulta = 3)
BEGIN
	DELETE FROM [dbo].[TRAProcedimiento_Requisito]
		WHERE IdProcedimiento = @IdProcedimiento AND [IdRequisito] = @IdRequisito 
END
ELSE
  
IF(@consulta = 5)
BEGIN
	 SELECT  ISNULL(IdProcedimiento, 0)IdProcedimiento, ISNULL(IdRequisito, 0)IdRequisito FROM [dbo].[TRAProcedimiento_Requisito]
		WHERE IdProcedimiento = @IdProcedimiento AND [IdRequisito] = @IdRequisito 
END
 

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_TRARequisito_Mantenedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_TRARequisito_Mantenedor] AS' 
END
GO

ALTER PROCEDURE [dbo].[SP_TRARequisito_Mantenedor]
  
@IdRequisito Int = null
,@Descripcion VarChar (100) = null
,@consulta tinyint
AS
 
IF(@consulta = 4)
BEGIN
	 SELECT  ISNULL(IdRequisito, 0)IdRequisito, ISNULL(Descripcion, 0)Descripcion FROM [dbo].[TRARequisito]
END
ELSE


IF(@consulta = 6)
BEGIN
		SELECT  ISNULL(IdRequisito, 0)IdRequisito, ISNULL(Descripcion, 0)Descripcion FROM [dbo].[TRARequisito]
		WHERE Descripcion LIKE @Descripcion + '%'
END
ELSE

IF(@consulta = 1)
BEGIN
	INSERT INTO [dbo].[TRARequisito]
	(	
	[Descripcion]
	)VALUES(
	@Descripcion
	)
END
ELSE

IF(@consulta = 2)
BEGIN
	UPDATE [dbo].[TRARequisito]
	SET	
	[Descripcion] = @Descripcion 
	WHERE  IdRequisito = @IdRequisito
END
ELSE

IF(@consulta = 3)
BEGIN
	DELETE FROM [dbo].[TRARequisito]
		WHERE IdRequisito = @IdRequisito
END
ELSE

IF(@consulta = 5)
BEGIN
		SELECT  ISNULL(IdRequisito, 0)IdRequisito, ISNULL(Descripcion, 0)Descripcion FROM [dbo].[TRARequisito]
		WHERE IdRequisito = @IdRequisito
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_TRATipoDoc_Mantenedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_TRATipoDoc_Mantenedor] AS' 
END
GO

ALTER PROCEDURE [dbo].[SP_TRATipoDoc_Mantenedor]
@IdTipoDoc Char (2) = null
,@Descripcion VarChar (100) = null
,@consulta tinyint
AS

IF(@consulta = 4)
BEGIN
	 SELECT  ISNULL(IdTipoDoc, 0)IdTipoDoc, ISNULL(Descripcion, 0)Descripcion FROM [dbo].[TRATipoDoc]
END
ELSE

IF(@consulta = 1)
BEGIN
	DECLARE @IdTi AS INT
	SET @IdTi=(SELECT MAX(IdTipoDoc)+1 FROM TRATipoDoc)
	
	INSERT INTO [dbo].[TRATipoDoc]
	(
	 [IdTipoDoc] 
	,[Descripcion]
	)VALUES(
	 @IdTi
	,@Descripcion
	)
END
ELSE

IF(@consulta = 2)
BEGIN
	UPDATE [dbo].[TRATipoDoc]
	SET
	 [IdTipoDoc] = @IdTipoDoc 
	 ,[Descripcion] = @Descripcion 
	WHERE  IdTipoDoc = @IdTipoDoc
END
ELSE

IF(@consulta = 3)
BEGIN
	DELETE FROM [dbo].[TRATipoDoc]
		WHERE IdTipoDoc = @IdTipoDoc
END
ELSE
 
IF(@consulta = 5)
BEGIN
	 SELECT  ISNULL(IdTipoDoc, 0)IdTipoDoc, ISNULL(Descripcion, 0)Descripcion FROM [dbo].[TRATipoDoc]
	 WHERE IdTipoDoc = @IdTipoDoc
END
 

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_TRATramite_Mantenedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_TRATramite_Mantenedor] AS' 
END
GO

ALTER PROCEDURE [dbo].[SP_TRATramite_Mantenedor]

	@IdTramite Char (10) = null
	,@Anio Char (5) = null
	,@IdProcedimiento Char (6) = null
	,@Estado VarChar (2) = null
	,@IdDocumento Char (13) = null
	,@IdTipoDoc Char (2) = null
	,@IdAreaOrganiz Int = null
	,@TiempoDias Int = null
	,@TiempoHrs Decimal = null
	,@TiempoMin Int = null
	,@MotivoRechazo VarChar (120) = null
	,@PersonaRechazo Int = null
	,@FechaRechazo DateTime = null
	,@AreaRechazo Int = null
	,@FechaAprobacion DateTime = null
	,@FechaTramite DateTime = null
	,@consulta tinyint
AS

IF(@consulta = 4)
BEGIN
	 SELECT  ISNULL(IdTramite, 0)IdTramite, ISNULL(Anio, 0)Anio, ISNULL(IdProcedimiento, 0)IdProcedimiento, ISNULL(Estado, 0)Estado, ISNULL(IdDocumento, 0)IdDocumento, ISNULL(IdTipoDoc, 0)IdTipoDoc, ISNULL(IdAreaOrganiz, 0)IdAreaOrganiz, ISNULL(TiempoDias, 0)TiempoDias, ISNULL(TiempoHrs, 0)TiempoHrs, ISNULL(TiempoMin, 0)TiempoMin, ISNULL(MotivoRechazo, 0)MotivoRechazo, ISNULL(PersonaRechazo, 0)PersonaRechazo, ISNULL(FechaRechazo, 0)FechaRechazo, ISNULL(AreaRechazo, 0)AreaRechazo, ISNULL(FechaAprobacion, 0)FechaAprobacion, ISNULL(FechaTramite, 0)FechaTramite FROM [dbo].[TRATramite]
END
ELSE

IF(@consulta = 1)
BEGIN
	INSERT INTO [dbo].[TRATramite]
	(
	 [IdTramite] 
	,[Anio]
	,[IdProcedimiento]
	,[Estado]
	,[IdDocumento]
	,[IdTipoDoc]
	,[IdAreaOrganiz]
	,[TiempoDias]
	,[TiempoHrs]
	,[TiempoMin]
	,[MotivoRechazo]
	,[PersonaRechazo]
	,[FechaRechazo]
	,[AreaRechazo]
	,[FechaAprobacion]
	,[FechaTramite]
	)VALUES(
	 @IdTramite 
	,@Anio
	,@IdProcedimiento
	,@Estado
	,@IdDocumento
	,@IdTipoDoc
	,@IdAreaOrganiz
	,@TiempoDias
	,@TiempoHrs
	,@TiempoMin
	,@MotivoRechazo
	,@PersonaRechazo
	,@FechaRechazo
	,@AreaRechazo
	,@FechaAprobacion
	,@FechaTramite
	)
END
ELSE

IF(@consulta = 2)
BEGIN
	UPDATE [dbo].[TRATramite]
	SET
	 [IdTramite] = @IdTramite 
	 ,[Anio] = @Anio 
	 ,[IdProcedimiento] = @IdProcedimiento 
	 ,[Estado] = @Estado 
	 ,[IdDocumento] = @IdDocumento 
	 ,[IdTipoDoc] = @IdTipoDoc 
	 ,[IdAreaOrganiz] = @IdAreaOrganiz 
	 ,[TiempoDias] = @TiempoDias 
	 ,[TiempoHrs] = @TiempoHrs 
	 ,[TiempoMin] = @TiempoMin 
	 ,[MotivoRechazo] = @MotivoRechazo 
	 ,[PersonaRechazo] = @PersonaRechazo 
	 ,[FechaRechazo] = @FechaRechazo 
	 ,[AreaRechazo] = @AreaRechazo 
	 ,[FechaAprobacion] = @FechaAprobacion 
	 ,[FechaTramite] = @FechaTramite 
	WHERE  IdTramite = @IdTramite
END
ELSE

IF(@consulta = 3)
BEGIN
	DELETE FROM [dbo].[TRATramite]
		WHERE IdTramite = @IdTramite
END
ELSE

IF(@consulta = 5)
BEGIN
	 SELECT  ISNULL(IdTramite, 0)IdTramite, ISNULL(Anio, 0)Anio, ISNULL(IdProcedimiento, 0)IdProcedimiento, ISNULL(Estado, 0)Estado, ISNULL(IdDocumento, 0)IdDocumento, ISNULL(IdTipoDoc, 0)IdTipoDoc, ISNULL(IdAreaOrganiz, 0)IdAreaOrganiz, ISNULL(TiempoDias, 0)TiempoDias, ISNULL(TiempoHrs, 0)TiempoHrs, ISNULL(TiempoMin, 0)TiempoMin, ISNULL(MotivoRechazo, 0)MotivoRechazo, ISNULL(PersonaRechazo, 0)PersonaRechazo, ISNULL(FechaRechazo, 0)FechaRechazo, ISNULL(AreaRechazo, 0)AreaRechazo, ISNULL(FechaAprobacion, 0)FechaAprobacion, ISNULL(FechaTramite, 0)FechaTramite FROM [dbo].[TRATramite]
		WHERE IdTramite = @IdTramite
END
ELSE

IF(@consulta = 6)
BEGIN	
	UPDATE [dbo].[TRATramite]
	SET                
     [Estado] = @Estado 
     ,[MotivoRechazo] = @MotivoRechazo 
	 ,[PersonaRechazo] = @PersonaRechazo 
	 ,[FechaRechazo] = @FechaRechazo 
	 ,[AreaRechazo] = @AreaRechazo 
	WHERE  IdTramite = @IdTramite
END
ELSE

IF(@consulta = 7)
BEGIN
	 SELECT  ISNULL(IdTramite, 0)IdTramite, numtramite, ISNULL(Anio, 0)Anio, ISNULL(IdProcedimiento, 0)IdProcedimiento, 
			 ISNULL(desprocedimiento,'')desprocedimiento, ISNULL(Estado, '')Estado, ISNULL(desestado,'')desestado, 
			 ISNULL(IdDocumento, 0)IdDocumento, ISNULL(Doc_Codigo, '')Doc_Codigo, desc_TipoDoc, FechaEmision,
			 ISNULL(Asunto, '')Asunto, Referencia, Folio, suscritopor, ISNULL(IdAreaOrganiz, 0)IdAreaOrganiz, 
			 desareatramite, desareadoc, IdTipoSilencio, destiposilencio, FechaAprobacion, ISNULL(PersonaRechazo, '')PersonaRechazo,
			 FechaRechazo, ISNULL(AreaRechazo, '')AreaRechazo, ISNULL(MotivoRechazo, '')MotivoRechazo			  
	FROM [dbo].[vs_TRA_ListarTramite]
	WHERE IdTramite = @IdTramite
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_TRATramite_Requisito_Mantenedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_TRATramite_Requisito_Mantenedor] AS' 
END
GO

ALTER PROCEDURE [dbo].[SP_TRATramite_Requisito_Mantenedor]
	@IdTramite Char (10) = null
	,@IdRequisito Int = null
	,@Estado VarChar (1) = null
,@consulta tinyint
AS

IF(@consulta = 4)
BEGIN
	 SELECT  ISNULL(IdTramite, 0)IdTramite, ISNULL(IdRequisito, 0)IdRequisito, ISNULL(Estado, 0)Estado FROM [dbo].[TRATramite_Requisito]
END
ELSE
  
IF(@consulta = 1)
BEGIN
	INSERT INTO [dbo].[TRATramite_Requisito]
	(
	 [IdTramite] 
	,[IdRequisito]
	,[Estado]
	)VALUES(
	 @IdTramite 
	,@IdRequisito
	,@Estado
	)
END
ELSE

IF(@consulta = 2)
BEGIN
	UPDATE [dbo].[TRATramite_Requisito]
	SET
	 [IdTramite] = @IdTramite 
	 ,[IdRequisito] = @IdRequisito 
	 ,[Estado] = @Estado 
	WHERE  IdTramite = @IdTramite
END
ELSE

IF(@consulta = 3)
BEGIN
	DELETE FROM [dbo].[TRATramite_Requisito]
		WHERE IdTramite = @IdTramite
END
ELSE

IF(@consulta = 5)
BEGIN
	 SELECT  ISNULL(IdTramite, 0)IdTramite, ISNULL(IdRequisito, 0)IdRequisito, ISNULL(Estado, 0)Estado FROM [dbo].[TRATramite_Requisito]
		WHERE IdTramite = @IdTramite
END


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_uo_listar]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_uo_listar] AS' 
END
GO
ALTER  procedure [dbo].[sp_uo_listar]
as 
begin
 select idAreaOrganiz,AreaOrganizacional from  EstructOrganiz 
where EstructOrganiz.Year=year(GETDATE())
order by AreaOrganizacional;
end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Update_Empleado_idHorario_By_idEmpleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Update_Empleado_idHorario_By_idEmpleado] AS' 
END
GO
ALTER proc [dbo].[sp_Update_Empleado_idHorario_By_idEmpleado]
(
@idEmpleado as int,
@idHorario as int
)
as
if @idHorario is null return
if @idEmpleado is null return
update empleado
set idHorario=@idHorario 
where idEmpleado=@idEmpleado 

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Update_Empleado_idLocal_By_idEmpleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Update_Empleado_idLocal_By_idEmpleado] AS' 
END
GO
ALTER proc [dbo].[sp_Update_Empleado_idLocal_By_idEmpleado]
(
@idEmpleado as int,
@idLocal as int
)
as
if @idLocal is null return
if @idEmpleado is null return
update empleado
set idLocal=@idLocal 
where idEmpleado=@idEmpleado 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Verficar_Existe_Asistencia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Verficar_Existe_Asistencia] AS' 
END
GO
ALTER proc [dbo].[sp_Verficar_Existe_Asistencia]
@Fecha varchar(19),
@idEmpleado int
as
select isnull(Count(*),0) from Asistencia 
where fecha=@Fecha
and idEmpleado=@idEmpleado
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Verficar_Existe_Marcacion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_Verficar_Existe_Marcacion] AS' 
END
GO
ALTER proc [dbo].[sp_Verficar_Existe_Marcacion]
@Fecha varchar(19),
@idEmpleado int
as
select isnull(Count(*),0) from marcacion 
where fecha=@Fecha
and idEmpleado=@idEmpleado
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_vs_tra_listaretapaprocedimiento]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_vs_tra_listaretapaprocedimiento] AS' 
END
GO
ALTER PROC [dbo].[SP_vs_tra_listaretapaprocedimiento]  
@consulta int,
@AreaIngreso int,
@Estado_Etapa nvarchar(10)=null,
@FechaDes DateTime,
@FechaHas DateTime
AS 
IF(@consulta=1) /*Pendientes - En Trámite - Terminados*/
	BEGIN
		SELECT IdMovimiento, nummovimiento, IdTramite, numtramite, idempleado_emisor, desempleado_emisor, 
			   idcargo_emisor, descargo_emisor, idarea_emisor, desarea_emisor, f_emision_tramite, estado_tramite,
			   Asunto, ISNULL(NumRecepcion,0)NumRecepcion, ISNULL(IdAreaProc,'')IdAreaProc, 
			   ISNULL(DesAreaProc,'')DesAreaProc, IdProcedimiento, Descripcion, Ambito, ISNULL(f_ingreso_etapa,'')f_ingreso_etapa,
			   AreaIngreso, desareaingreso, ISNULL(f_salida_etapa,'')f_salida_etapa, ISNULL(AreaDestino,'')AreaDestino,
			   ISNULL(desareadestino,'')desareadestino, IdEtapaProc, desetapa, idcargo_responsable,
			   cargo_responsable, tiempodias_etapa, tiempohrs_etapa, TiempoMin_Etapa, estado_etapa, IdTipoSilencio,
			   destiposilencio, ISNULL(FechaAprobacion,'')FechaAprobacion, ISNULL(PersonaRechazo,'')PersonaRechazo, 
			   ISNULL(cargorechazo,'')cargorechazo, ISNULL(FechaRechazo,'')FechaRechazo, ISNULL(AreaRechazo,'')AreaRechazo, 
			   Doc_Fisico, ISNULL(MotivoRechazo,'')MotivoRechazo, ISNULL(MovimientoDestino,'')MovimientoDestino, 
			   ISNULL(T_Salida_O_Etapa,'')T_Salida_O_Etapa, ISNULL(Puntualidad_Etapa,'')Puntualidad_Etapa, 
			   ISNULL(T_Excedido_Restante_Etapa,'')T_Excedido_Restante_Etapa, T_Dias_Tramite, T_Hrs_Tramite, T_Min_tramite,
			   T_Salida_O_Tramite, Puntualidad_Tramite, ISNULL(T_Excedido_Restante_Tramite,'')T_Excedido_Restante_Tramite, 
			   IdDocumento, Doc_Codigo, desc_TipoDoc, Referencia, suscritopor			 
		FROM vs_tra_listar_movimiento_tramite
		WHERE (AreaIngreso=@AreaIngreso AND estado_etapa=@Estado_Etapa AND estado_tramite<>'XX'
			   AND (f_ingreso_etapa between @FechaDes AND @FechaHas))		
			  OR	  
			  (AreaIngreso=@AreaIngreso AND estado_etapa=@Estado_Etapa AND 
			   (f_ingreso_etapa between @FechaDes AND @FechaHas))			 
		ORDER BY f_emision_tramite	
	END
ELSE 
IF(@consulta=2) /*Rechazados*/
	BEGIN
		SELECT IdMovimiento, nummovimiento, IdTramite, numtramite, idempleado_emisor, desempleado_emisor, 
			   idcargo_emisor, descargo_emisor, idarea_emisor, desarea_emisor, f_emision_tramite, estado_tramite,
			   Asunto, ISNULL(NumRecepcion,0)NumRecepcion, ISNULL(IdAreaProc,'')IdAreaProc, 
			   ISNULL(DesAreaProc,'')DesAreaProc, IdProcedimiento, Descripcion, Ambito, ISNULL(f_ingreso_etapa,'')f_ingreso_etapa,
			   AreaIngreso, desareaingreso, ISNULL(f_salida_etapa,'')f_salida_etapa, ISNULL(AreaDestino,'')AreaDestino,
			   ISNULL(desareadestino,'')desareadestino, IdEtapaProc, desetapa, idcargo_responsable,
			   cargo_responsable, tiempodias_etapa, tiempohrs_etapa, TiempoMin_Etapa, estado_etapa, IdTipoSilencio,
			   destiposilencio, ISNULL(FechaAprobacion,'')FechaAprobacion, ISNULL(PersonaRechazo,'')PersonaRechazo, 
			   ISNULL(cargorechazo,'')cargorechazo, ISNULL(FechaRechazo,'')FechaRechazo, ISNULL(AreaRechazo,'')AreaRechazo, 
			   Doc_Fisico, ISNULL(MotivoRechazo,'')MotivoRechazo, ISNULL(MovimientoDestino,'')MovimientoDestino, 
			   ISNULL(T_Salida_O_Etapa,'')T_Salida_O_Etapa, ISNULL(Puntualidad_Etapa,'')Puntualidad_Etapa, 
			   ISNULL(T_Excedido_Restante_Etapa,'')T_Excedido_Restante_Etapa, T_Dias_Tramite, T_Hrs_Tramite, T_Min_tramite,
			   T_Salida_O_Tramite, Puntualidad_Tramite, ISNULL(T_Excedido_Restante_Tramite,'')T_Excedido_Restante_Tramite, 
			   IdDocumento, Doc_Codigo, desc_TipoDoc, Referencia, suscritopor		
	    FROM vs_tra_listar_movimiento_tramite
		WHERE AreaRechazo=@AreaIngreso AND estado_etapa='XX' AND estado_tramite='XX' AND 
			 (FechaRechazo between @FechaDes AND @FechaHas) 
		ORDER BY f_emision_tramite	
	END
ELSE 
IF(@consulta=3) /*Emitidos*/
	BEGIN
		SELECT IdMovimiento, nummovimiento, IdTramite, numtramite, idempleado_emisor, desempleado_emisor, 
			   idcargo_emisor, descargo_emisor, idarea_emisor, desarea_emisor, f_emision_tramite, estado_tramite,
			   Asunto, ISNULL(NumRecepcion,0)NumRecepcion, ISNULL(IdAreaProc,'')IdAreaProc, 
			   ISNULL(DesAreaProc,'')DesAreaProc, IdProcedimiento, Descripcion, Ambito, ISNULL(f_ingreso_etapa,'')f_ingreso_etapa,
			   AreaIngreso, desareaingreso, ISNULL(f_salida_etapa,'')f_salida_etapa, ISNULL(AreaDestino,'')AreaDestino,
			   ISNULL(desareadestino,'')desareadestino, IdEtapaProc, desetapa, idcargo_responsable,
			   cargo_responsable, tiempodias_etapa, tiempohrs_etapa, TiempoMin_Etapa, estado_etapa, IdTipoSilencio,
			   destiposilencio, ISNULL(FechaAprobacion,'')FechaAprobacion, ISNULL(PersonaRechazo,'')PersonaRechazo, 
			   ISNULL(cargorechazo,'')cargorechazo, ISNULL(FechaRechazo,'')FechaRechazo, ISNULL(AreaRechazo,'')AreaRechazo, 
			   ISNULL(MotivoRechazo,'')MotivoRechazo, ISNULL(MovimientoDestino,'')MovimientoDestino, 
			   ISNULL(T_Salida_O_Etapa,'')T_Salida_O_Etapa, ISNULL(Puntualidad_Etapa,'')Puntualidad_Etapa, 
			   ISNULL(T_Excedido_Restante_Etapa,'')T_Excedido_Restante_Etapa, T_Dias_Tramite, T_Hrs_Tramite, T_Min_tramite,
			   T_Salida_O_Tramite, Puntualidad_Tramite, ISNULL(T_Excedido_Restante_Tramite,'')T_Excedido_Restante_Tramite, 
			   IdDocumento, Doc_Codigo, Referencia, suscritopor		
		FROM vs_tra_listar_movimiento_tramite_G
		WHERE NumRecepcion IS NOT NULL AND idarea_emisor=@AreaIngreso AND
			  (f_emision_tramite between @FechaDes AND @FechaHas)
		ORDER BY f_emision_tramite
	END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_vs_TRA_ListarProcedimiento_Mantenedor]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_vs_TRA_ListarProcedimiento_Mantenedor] AS' 
END
GO
ALTER PROC [dbo].[SP_vs_TRA_ListarProcedimiento_Mantenedor] 
@idProcedimiento char(6) = null
,@Anio int
,@Estado varchar(1) = null
,@IdAreaOrganiz int = null
,@Ambito char(1) =null
,@consulta tinyint
AS
IF(@consulta = 1)
BEGIN
	SELECT idProcedimiento, codigoid, codigo, Descripcion, idtipoSilencio, Dias, Horas, Minutos, Tiempo,
			destiposilencio, Observaciones, Anio, Estado, IdAreaOrganiz, desarea, Tipo, Ambito
	FROM vs_TRA_ListarProcedimiento WHERE estado=@Estado and anio=@Anio
END
ELSE 
IF(@consulta = 2)
BEGIN
	SELECT idProcedimiento, codigo, Descripcion, destiposilencio, Ambito, Tiempo, Observaciones
	FROM vs_TRA_ListarProcedimiento
	WHERE Estado=@Estado AND Anio=@Anio AND 	
	(IdAreaOrganiz=@IdAreaOrganiz or @IdAreaOrganiz is null or @IdAreaOrganiz=0) AND 
	(Ambito=@Ambito or @Ambito is null ) AND
	(IdAreaOrganiz=@IdAreaOrganiz or @IdAreaOrganiz is null or @IdAreaOrganiz=0)
END
ELSE 
IF(@consulta = 3)
BEGIN
SELECT idProcedimiento, Descripcion, Ambito
	FROM vs_TRA_ListarProcedimiento
	WHERE Anio=@Anio AND IdAreaOrganiz=@IdAreaOrganiz
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_WhoIsActive]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[sp_WhoIsActive] AS' 
END
GO

/*********************************************************************************************
Who Is Active? v11.32 (2018-07-03)
(C) 2007-2018, Adam Machanic

Feedback: mailto:adam@dataeducation.com
Updates: http://whoisactive.com
Blog: http://dataeducation.com

License: 
	Who is Active? is free to download and use for personal, educational, and internal 
	corporate purposes, provided that this header is preserved. Redistribution or sale 
	of Who is Active?, in whole or in part, is prohibited without the author's express 
	written consent.
*********************************************************************************************/
ALTER PROC [dbo].[sp_WhoIsActive]
(
--~
	--Filters--Both inclusive and exclusive
	--Set either filter to '' to disable
	--Valid filter types are: session, program, database, login, and host
	--Session is a session ID, and either 0 or '' can be used to indicate "all" sessions
	--All other filter types support % or _ as wildcards
	@filter sysname = '',
	@filter_type VARCHAR(10) = 'session',
	@not_filter sysname = '',
	@not_filter_type VARCHAR(10) = 'session',

	--Retrieve data about the calling session?
	@show_own_spid BIT = 0,

	--Retrieve data about system sessions?
	@show_system_spids BIT = 0,

	--Controls how sleeping SPIDs are handled, based on the idea of levels of interest
	--0 does not pull any sleeping SPIDs
	--1 pulls only those sleeping SPIDs that also have an open transaction
	--2 pulls all sleeping SPIDs
	@show_sleeping_spids TINYINT = 1,

	--If 1, gets the full stored procedure or running batch, when available
	--If 0, gets only the actual statement that is currently running in the batch or procedure
	@get_full_inner_text BIT = 0,

	--Get associated query plans for running tasks, if available
	--If @get_plans = 1, gets the plan based on the request's statement offset
	--If @get_plans = 2, gets the entire plan based on the request's plan_handle
	@get_plans TINYINT = 0,

	--Get the associated outer ad hoc query or stored procedure call, if available
	@get_outer_command BIT = 0,

	--Enables pulling transaction log write info and transaction duration
	@get_transaction_info BIT = 0,

	--Get information on active tasks, based on three interest levels
	--Level 0 does not pull any task-related information
	--Level 1 is a lightweight mode that pulls the top non-CXPACKET wait, giving preference to blockers
	--Level 2 pulls all available task-based metrics, including: 
	--number of active tasks, current wait stats, physical I/O, context switches, and blocker information
	@get_task_info TINYINT = 1,

	--Gets associated locks for each request, aggregated in an XML format
	@get_locks BIT = 0,

	--Get average time for past runs of an active query
	--(based on the combination of plan handle, sql handle, and offset)
	@get_avg_time BIT = 0,

	--Get additional non-performance-related information about the session or request
	--text_size, language, date_format, date_first, quoted_identifier, arithabort, ansi_null_dflt_on, 
	--ansi_defaults, ansi_warnings, ansi_padding, ansi_nulls, concat_null_yields_null, 
	--transaction_isolation_level, lock_timeout, deadlock_priority, row_count, command_type
	--
	--If a SQL Agent job is running, an subnode called agent_info will be populated with some or all of
	--the following: job_id, job_name, step_id, step_name, msdb_query_error (in the event of an error)
	--
	--If @get_task_info is set to 2 and a lock wait is detected, a subnode called block_info will be
	--populated with some or all of the following: lock_type, database_name, object_id, file_id, hobt_id, 
	--applock_hash, metadata_resource, metadata_class_id, object_name, schema_name
	@get_additional_info BIT = 0,

	--Walk the blocking chain and count the number of 
	--total SPIDs blocked all the way down by a given session
	--Also enables task_info Level 1, if @get_task_info is set to 0
	@find_block_leaders BIT = 0,

	--Pull deltas on various metrics
	--Interval in seconds to wait before doing the second data pull
	@delta_interval TINYINT = 0,

	--List of desired output columns, in desired order
	--Note that the final output will be the intersection of all enabled features and all 
	--columns in the list. Therefore, only columns associated with enabled features will 
	--actually appear in the output. Likewise, removing columns from this list may effectively
	--disable features, even if they are turned on
	--
	--Each element in this list must be one of the valid output column names. Names must be
	--delimited by square brackets. White space, formatting, and additional characters are
	--allowed, as long as the list contains exact matches of delimited valid column names.
	@output_column_list VARCHAR(8000) = '[dd%][session_id][sql_text][sql_command][login_name][wait_info][tasks][tran_log%][cpu%][temp%][block%][reads%][writes%][context%][physical%][query_plan][locks][%]',

	--Column(s) by which to sort output, optionally with sort directions. 
		--Valid column choices:
		--session_id, physical_io, reads, physical_reads, writes, tempdb_allocations, 
		--tempdb_current, CPU, context_switches, used_memory, physical_io_delta, reads_delta, 
		--physical_reads_delta, writes_delta, tempdb_allocations_delta, tempdb_current_delta, 
		--CPU_delta, context_switches_delta, used_memory_delta, tasks, tran_start_time, 
		--open_tran_count, blocking_session_id, blocked_session_count, percent_complete, 
		--host_name, login_name, database_name, start_time, login_time, program_name
		--
		--Note that column names in the list must be bracket-delimited. Commas and/or white
		--space are not required. 
	@sort_order VARCHAR(500) = '[start_time] ASC',

	--Formats some of the output columns in a more "human readable" form
	--0 disables outfput format
	--1 formats the output for variable-width fonts
	--2 formats the output for fixed-width fonts
	@format_output TINYINT = 1,

	--If set to a non-blank value, the script will attempt to insert into the specified 
	--destination table. Please note that the script will not verify that the table exists, 
	--or that it has the correct schema, before doing the insert.
	--Table can be specified in one, two, or three-part format
	@destination_table VARCHAR(4000) = '',

	--If set to 1, no data collection will happen and no result set will be returned; instead,
	--a CREATE TABLE statement will be returned via the @schema parameter, which will match 
	--the schema of the result set that would be returned by using the same collection of the
	--rest of the parameters. The CREATE TABLE statement will have a placeholder token of 
	--<table_name> in place of an actual table name.
	@return_schema BIT = 0,
	@schema VARCHAR(MAX) = NULL OUTPUT,

	--Help! What do I do?
	@help BIT = 0
--~
)
/*
OUTPUT COLUMNS
--------------
Formatted/Non:	[session_id] [smallint] NOT NULL
	Session ID (a.k.a. SPID)

Formatted:		[dd hh:mm:ss.mss] [varchar](15) NULL
Non-Formatted:	<not returned>
	For an active request, time the query has been running
	For a sleeping session, time since the last batch completed

Formatted:		[dd hh:mm:ss.mss (avg)] [varchar](15) NULL
Non-Formatted:	[avg_elapsed_time] [int] NULL
	(Requires @get_avg_time option)
	How much time has the active portion of the query taken in the past, on average?

Formatted:		[physical_io] [varchar](30) NULL
Non-Formatted:	[physical_io] [bigint] NULL
	Shows the number of physical I/Os, for active requests

Formatted:		[reads] [varchar](30) NULL
Non-Formatted:	[reads] [bigint] NULL
	For an active request, number of reads done for the current query
	For a sleeping session, total number of reads done over the lifetime of the session

Formatted:		[physical_reads] [varchar](30) NULL
Non-Formatted:	[physical_reads] [bigint] NULL
	For an active request, number of physical reads done for the current query
	For a sleeping session, total number of physical reads done over the lifetime of the session

Formatted:		[writes] [varchar](30) NULL
Non-Formatted:	[writes] [bigint] NULL
	For an active request, number of writes done for the current query
	For a sleeping session, total number of writes done over the lifetime of the session

Formatted:		[tempdb_allocations] [varchar](30) NULL
Non-Formatted:	[tempdb_allocations] [bigint] NULL
	For an active request, number of TempDB writes done for the current query
	For a sleeping session, total number of TempDB writes done over the lifetime of the session

Formatted:		[tempdb_current] [varchar](30) NULL
Non-Formatted:	[tempdb_current] [bigint] NULL
	For an active request, number of TempDB pages currently allocated for the query
	For a sleeping session, number of TempDB pages currently allocated for the session

Formatted:		[CPU] [varchar](30) NULL
Non-Formatted:	[CPU] [int] NULL
	For an active request, total CPU time consumed by the current query
	For a sleeping session, total CPU time consumed over the lifetime of the session

Formatted:		[context_switches] [varchar](30) NULL
Non-Formatted:	[context_switches] [bigint] NULL
	Shows the number of context switches, for active requests

Formatted:		[used_memory] [varchar](30) NOT NULL
Non-Formatted:	[used_memory] [bigint] NOT NULL
	For an active request, total memory consumption for the current query
	For a sleeping session, total current memory consumption

Formatted:		[physical_io_delta] [varchar](30) NULL
Non-Formatted:	[physical_io_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of physical I/Os reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[reads_delta] [varchar](30) NULL
Non-Formatted:	[reads_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of reads reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[physical_reads_delta] [varchar](30) NULL
Non-Formatted:	[physical_reads_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of physical reads reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[writes_delta] [varchar](30) NULL
Non-Formatted:	[writes_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of writes reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[tempdb_allocations_delta] [varchar](30) NULL
Non-Formatted:	[tempdb_allocations_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of TempDB writes reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[tempdb_current_delta] [varchar](30) NULL
Non-Formatted:	[tempdb_current_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the number of allocated TempDB pages reported on the first and second 
	collections. If the request started after the first collection, the value will be NULL

Formatted:		[CPU_delta] [varchar](30) NULL
Non-Formatted:	[CPU_delta] [int] NULL
	(Requires @delta_interval option)
	Difference between the CPU time reported on the first and second collections. 
	If the request started after the first collection, the value will be NULL

Formatted:		[context_switches_delta] [varchar](30) NULL
Non-Formatted:	[context_switches_delta] [bigint] NULL
	(Requires @delta_interval option)
	Difference between the context switches count reported on the first and second collections
	If the request started after the first collection, the value will be NULL

Formatted:		[used_memory_delta] [varchar](30) NULL
Non-Formatted:	[used_memory_delta] [bigint] NULL
	Difference between the memory usage reported on the first and second collections
	If the request started after the first collection, the value will be NULL

Formatted:		[tasks] [varchar](30) NULL
Non-Formatted:	[tasks] [smallint] NULL
	Number of worker tasks currently allocated, for active requests

Formatted/Non:	[status] [varchar](30) NOT NULL
	Activity status for the session (running, sleeping, etc)

Formatted/Non:	[wait_info] [nvarchar](4000) NULL
	Aggregates wait information, in the following format:
		(Ax: Bms/Cms/Dms)E
	A is the number of waiting tasks currently waiting on resource type E. B/C/D are wait
	times, in milliseconds. If only one thread is waiting, its wait time will be shown as B.
	If two tasks are waiting, each of their wait times will be shown (B/C). If three or more 
	tasks are waiting, the minimum, average, and maximum wait times will be shown (B/C/D).
	If wait type E is a page latch wait and the page is of a "special" type (e.g. PFS, GAM, SGAM), 
	the page type will be identified.
	If wait type E is CXPACKET, the nodeId from the query plan will be identified

Formatted/Non:	[locks] [xml] NULL
	(Requires @get_locks option)
	Aggregates lock information, in XML format.
	The lock XML includes the lock mode, locked object, and aggregates the number of requests. 
	Attempts are made to identify locked objects by name

Formatted/Non:	[tran_start_time] [datetime] NULL
	(Requires @get_transaction_info option)
	Date and time that the first transaction opened by a session caused a transaction log 
	write to occur.

Formatted/Non:	[tran_log_writes] [nvarchar](4000) NULL
	(Requires @get_transaction_info option)
	Aggregates transaction log write information, in the following format:
	A:wB (C kB)
	A is a database that has been touched by an active transaction
	B is the number of log writes that have been made in the database as a result of the transaction
	C is the number of log kilobytes consumed by the log records

Formatted:		[open_tran_count] [varchar](30) NULL
Non-Formatted:	[open_tran_count] [smallint] NULL
	Shows the number of open transactions the session has open

Formatted:		[sql_command] [xml] NULL
Non-Formatted:	[sql_command] [nvarchar](max) NULL
	(Requires @get_outer_command option)
	Shows the "outer" SQL command, i.e. the text of the batch or RPC sent to the server, 
	if available

Formatted:		[sql_text] [xml] NULL
Non-Formatted:	[sql_text] [nvarchar](max) NULL
	Shows the SQL text for active requests or the last statement executed
	for sleeping sessions, if available in either case.
	If @get_full_inner_text option is set, shows the full text of the batch.
	Otherwise, shows only the active statement within the batch.
	If the query text is locked, a special timeout message will be sent, in the following format:
		<timeout_exceeded />
	If an error occurs, an error message will be sent, in the following format:
		<error message="message" />

Formatted/Non:	[query_plan] [xml] NULL
	(Requires @get_plans option)
	Shows the query plan for the request, if available.
	If the plan is locked, a special timeout message will be sent, in the following format:
		<timeout_exceeded />
	If an error occurs, an error message will be sent, in the following format:
		<error message="message" />

Formatted/Non:	[blocking_session_id] [smallint] NULL
	When applicable, shows the blocking SPID

Formatted:		[blocked_session_count] [varchar](30) NULL
Non-Formatted:	[blocked_session_count] [smallint] NULL
	(Requires @find_block_leaders option)
	The total number of SPIDs blocked by this session,
	all the way down the blocking chain.

Formatted:		[percent_complete] [varchar](30) NULL
Non-Formatted:	[percent_complete] [real] NULL
	When applicable, shows the percent complete (e.g. for backups, restores, and some rollbacks)

Formatted/Non:	[host_name] [sysname] NOT NULL
	Shows the host name for the connection

Formatted/Non:	[login_name] [sysname] NOT NULL
	Shows the login name for the connection

Formatted/Non:	[database_name] [sysname] NULL
	Shows the connected database

Formatted/Non:	[program_name] [sysname] NULL
	Shows the reported program/application name

Formatted/Non:	[additional_info] [xml] NULL
	(Requires @get_additional_info option)
	Returns additional non-performance-related session/request information
	If the script finds a SQL Agent job running, the name of the job and job step will be reported
	If @get_task_info = 2 and the script finds a lock wait, the locked object will be reported

Formatted/Non:	[start_time] [datetime] NOT NULL
	For active requests, shows the time the request started
	For sleeping sessions, shows the time the last batch completed

Formatted/Non:	[login_time] [datetime] NOT NULL
	Shows the time that the session connected

Formatted/Non:	[request_id] [int] NULL
	For active requests, shows the request_id
	Should be 0 unless MARS is being used

Formatted/Non:	[collection_time] [datetime] NOT NULL
	Time that this script's final SELECT ran
*/
AS
BEGIN;
	SET NOCOUNT ON; 
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	SET QUOTED_IDENTIFIER ON;
	SET ANSI_PADDING ON;
	SET CONCAT_NULL_YIELDS_NULL ON;
	SET ANSI_WARNINGS ON;
	SET NUMERIC_ROUNDABORT OFF;
	SET ARITHABORT ON;

	IF
		@filter IS NULL
		OR @filter_type IS NULL
		OR @not_filter IS NULL
		OR @not_filter_type IS NULL
		OR @show_own_spid IS NULL
		OR @show_system_spids IS NULL
		OR @show_sleeping_spids IS NULL
		OR @get_full_inner_text IS NULL
		OR @get_plans IS NULL
		OR @get_outer_command IS NULL
		OR @get_transaction_info IS NULL
		OR @get_task_info IS NULL
		OR @get_locks IS NULL
		OR @get_avg_time IS NULL
		OR @get_additional_info IS NULL
		OR @find_block_leaders IS NULL
		OR @delta_interval IS NULL
		OR @format_output IS NULL
		OR @output_column_list IS NULL
		OR @sort_order IS NULL
		OR @return_schema IS NULL
		OR @destination_table IS NULL
		OR @help IS NULL
	BEGIN;
		RAISERROR('Input parameters cannot be NULL', 16, 1);
		RETURN;
	END;
	
	IF @filter_type NOT IN ('session', 'program', 'database', 'login', 'host')
	BEGIN;
		RAISERROR('Valid filter types are: session, program, database, login, host', 16, 1);
		RETURN;
	END;
	
	IF @filter_type = 'session' AND @filter LIKE '%[^0123456789]%'
	BEGIN;
		RAISERROR('Session filters must be valid integers', 16, 1);
		RETURN;
	END;
	
	IF @not_filter_type NOT IN ('session', 'program', 'database', 'login', 'host')
	BEGIN;
		RAISERROR('Valid filter types are: session, program, database, login, host', 16, 1);
		RETURN;
	END;
	
	IF @not_filter_type = 'session' AND @not_filter LIKE '%[^0123456789]%'
	BEGIN;
		RAISERROR('Session filters must be valid integers', 16, 1);
		RETURN;
	END;
	
	IF @show_sleeping_spids NOT IN (0, 1, 2)
	BEGIN;
		RAISERROR('Valid values for @show_sleeping_spids are: 0, 1, or 2', 16, 1);
		RETURN;
	END;
	
	IF @get_plans NOT IN (0, 1, 2)
	BEGIN;
		RAISERROR('Valid values for @get_plans are: 0, 1, or 2', 16, 1);
		RETURN;
	END;

	IF @get_task_info NOT IN (0, 1, 2)
	BEGIN;
		RAISERROR('Valid values for @get_task_info are: 0, 1, or 2', 16, 1);
		RETURN;
	END;

	IF @format_output NOT IN (0, 1, 2)
	BEGIN;
		RAISERROR('Valid values for @format_output are: 0, 1, or 2', 16, 1);
		RETURN;
	END;
	
	IF @help = 1
	BEGIN;
		DECLARE 
			@header VARCHAR(MAX),
			@params VARCHAR(MAX),
			@outputs VARCHAR(MAX);

		SELECT 
			@header =
				REPLACE
				(
					REPLACE
					(
						CONVERT
						(
							VARCHAR(MAX),
							SUBSTRING
							(
								t.text, 
								CHARINDEX('/' + REPLICATE('*', 93), t.text) + 94,
								CHARINDEX(REPLICATE('*', 93) + '/', t.text) - (CHARINDEX('/' + REPLICATE('*', 93), t.text) + 94)
							)
						),
						CHAR(13)+CHAR(10),
						CHAR(13)
					),
					'	',
					''
				),
			@params =
				CHAR(13) +
					REPLACE
					(
						REPLACE
						(
							CONVERT
							(
								VARCHAR(MAX),
								SUBSTRING
								(
									t.text, 
									CHARINDEX('--~', t.text) + 5, 
									CHARINDEX('--~', t.text, CHARINDEX('--~', t.text) + 5) - (CHARINDEX('--~', t.text) + 5)
								)
							),
							CHAR(13)+CHAR(10),
							CHAR(13)
						),
						'	',
						''
					),
				@outputs = 
					CHAR(13) +
						REPLACE
						(
							REPLACE
							(
								REPLACE
								(
									CONVERT
									(
										VARCHAR(MAX),
										SUBSTRING
										(
											t.text, 
											CHARINDEX('OUTPUT COLUMNS'+CHAR(13)+CHAR(10)+'--------------', t.text) + 32,
											CHARINDEX('*/', t.text, CHARINDEX('OUTPUT COLUMNS'+CHAR(13)+CHAR(10)+'--------------', t.text) + 32) - (CHARINDEX('OUTPUT COLUMNS'+CHAR(13)+CHAR(10)+'--------------', t.text) + 32)
										)
									),
									CHAR(9),
									CHAR(255)
								),
								CHAR(13)+CHAR(10),
								CHAR(13)
							),
							'	',
							''
						) +
						CHAR(13)
		FROM sys.dm_exec_requests AS r
		CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) AS t
		WHERE
			r.session_id = @@SPID;

		WITH
		a0 AS
		(SELECT 1 AS n UNION ALL SELECT 1),
		a1 AS
		(SELECT 1 AS n FROM a0 AS a, a0 AS b),
		a2 AS
		(SELECT 1 AS n FROM a1 AS a, a1 AS b),
		a3 AS
		(SELECT 1 AS n FROM a2 AS a, a2 AS b),
		a4 AS
		(SELECT 1 AS n FROM a3 AS a, a3 AS b),
		numbers AS
		(
			SELECT TOP(LEN(@header) - 1)
				ROW_NUMBER() OVER
				(
					ORDER BY (SELECT NULL)
				) AS number
			FROM a4
			ORDER BY
				number
		)
		SELECT
			RTRIM(LTRIM(
				SUBSTRING
				(
					@header,
					number + 1,
					CHARINDEX(CHAR(13), @header, number + 1) - number - 1
				)
			)) AS [------header---------------------------------------------------------------------------------------------------------------]
		FROM numbers
		WHERE
			SUBSTRING(@header, number, 1) = CHAR(13);

		WITH
		a0 AS
		(SELECT 1 AS n UNION ALL SELECT 1),
		a1 AS
		(SELECT 1 AS n FROM a0 AS a, a0 AS b),
		a2 AS
		(SELECT 1 AS n FROM a1 AS a, a1 AS b),
		a3 AS
		(SELECT 1 AS n FROM a2 AS a, a2 AS b),
		a4 AS
		(SELECT 1 AS n FROM a3 AS a, a3 AS b),
		numbers AS
		(
			SELECT TOP(LEN(@params) - 1)
				ROW_NUMBER() OVER
				(
					ORDER BY (SELECT NULL)
				) AS number
			FROM a4
			ORDER BY
				number
		),
		tokens AS
		(
			SELECT 
				RTRIM(LTRIM(
					SUBSTRING
					(
						@params,
						number + 1,
						CHARINDEX(CHAR(13), @params, number + 1) - number - 1
					)
				)) AS token,
				number,
				CASE
					WHEN SUBSTRING(@params, number + 1, 1) = CHAR(13) THEN number
					ELSE COALESCE(NULLIF(CHARINDEX(',' + CHAR(13) + CHAR(13), @params, number), 0), LEN(@params)) 
				END AS param_group,
				ROW_NUMBER() OVER
				(
					PARTITION BY
						CHARINDEX(',' + CHAR(13) + CHAR(13), @params, number),
						SUBSTRING(@params, number+1, 1)
					ORDER BY 
						number
				) AS group_order
			FROM numbers
			WHERE
				SUBSTRING(@params, number, 1) = CHAR(13)
		),
		parsed_tokens AS
		(
			SELECT
				MIN
				(
					CASE
						WHEN token LIKE '@%' THEN token
						ELSE NULL
					END
				) AS parameter,
				MIN
				(
					CASE
						WHEN token LIKE '--%' THEN RIGHT(token, LEN(token) - 2)
						ELSE NULL
					END
				) AS description,
				param_group,
				group_order
			FROM tokens
			WHERE
				NOT 
				(
					token = '' 
					AND group_order > 1
				)
			GROUP BY
				param_group,
				group_order
		)
		SELECT
			CASE
				WHEN description IS NULL AND parameter IS NULL THEN '-------------------------------------------------------------------------'
				WHEN param_group = MAX(param_group) OVER() THEN parameter
				ELSE COALESCE(LEFT(parameter, LEN(parameter) - 1), '')
			END AS [------parameter----------------------------------------------------------],
			CASE
				WHEN description IS NULL AND parameter IS NULL THEN '----------------------------------------------------------------------------------------------------------------------'
				ELSE COALESCE(description, '')
			END AS [------description-----------------------------------------------------------------------------------------------------]
		FROM parsed_tokens
		ORDER BY
			param_group, 
			group_order;
		
		WITH
		a0 AS
		(SELECT 1 AS n UNION ALL SELECT 1),
		a1 AS
		(SELECT 1 AS n FROM a0 AS a, a0 AS b),
		a2 AS
		(SELECT 1 AS n FROM a1 AS a, a1 AS b),
		a3 AS
		(SELECT 1 AS n FROM a2 AS a, a2 AS b),
		a4 AS
		(SELECT 1 AS n FROM a3 AS a, a3 AS b),
		numbers AS
		(
			SELECT TOP(LEN(@outputs) - 1)
				ROW_NUMBER() OVER
				(
					ORDER BY (SELECT NULL)
				) AS number
			FROM a4
			ORDER BY
				number
		),
		tokens AS
		(
			SELECT 
				RTRIM(LTRIM(
					SUBSTRING
					(
						@outputs,
						number + 1,
						CASE
							WHEN 
								COALESCE(NULLIF(CHARINDEX(CHAR(13) + 'Formatted', @outputs, number + 1), 0), LEN(@outputs)) < 
								COALESCE(NULLIF(CHARINDEX(CHAR(13) + CHAR(255) COLLATE Latin1_General_Bin2, @outputs, number + 1), 0), LEN(@outputs))
								THEN COALESCE(NULLIF(CHARINDEX(CHAR(13) + 'Formatted', @outputs, number + 1), 0), LEN(@outputs)) - number - 1
							ELSE
								COALESCE(NULLIF(CHARINDEX(CHAR(13) + CHAR(255) COLLATE Latin1_General_Bin2, @outputs, number + 1), 0), LEN(@outputs)) - number - 1
						END
					)
				)) AS token,
				number,
				COALESCE(NULLIF(CHARINDEX(CHAR(13) + 'Formatted', @outputs, number + 1), 0), LEN(@outputs)) AS output_group,
				ROW_NUMBER() OVER
				(
					PARTITION BY 
						COALESCE(NULLIF(CHARINDEX(CHAR(13) + 'Formatted', @outputs, number + 1), 0), LEN(@outputs))
					ORDER BY
						number
				) AS output_group_order
			FROM numbers
			WHERE
				SUBSTRING(@outputs, number, 10) = CHAR(13) + 'Formatted'
				OR SUBSTRING(@outputs, number, 2) = CHAR(13) + CHAR(255) COLLATE Latin1_General_Bin2
		),
		output_tokens AS
		(
			SELECT 
				*,
				CASE output_group_order
					WHEN 2 THEN MAX(CASE output_group_order WHEN 1 THEN token ELSE NULL END) OVER (PARTITION BY output_group)
					ELSE ''
				END COLLATE Latin1_General_Bin2 AS column_info
			FROM tokens
		)
		SELECT
			CASE output_group_order
				WHEN 1 THEN '-----------------------------------'
				WHEN 2 THEN 
					CASE
						WHEN CHARINDEX('Formatted/Non:', column_info) = 1 THEN
							SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info)+1, CHARINDEX(']', column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info)+2) - CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info))
						ELSE
							SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info)+2, CHARINDEX(']', column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info)+2) - CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info)-1)
					END
				ELSE ''
			END AS formatted_column_name,
			CASE output_group_order
				WHEN 1 THEN '-----------------------------------'
				WHEN 2 THEN 
					CASE
						WHEN CHARINDEX('Formatted/Non:', column_info) = 1 THEN
							SUBSTRING(column_info, CHARINDEX(']', column_info)+2, LEN(column_info))
						ELSE
							SUBSTRING(column_info, CHARINDEX(']', column_info)+2, CHARINDEX('Non-Formatted:', column_info, CHARINDEX(']', column_info)+2) - CHARINDEX(']', column_info)-3)
					END
				ELSE ''
			END AS formatted_column_type,
			CASE output_group_order
				WHEN 1 THEN '---------------------------------------'
				WHEN 2 THEN 
					CASE
						WHEN CHARINDEX('Formatted/Non:', column_info) = 1 THEN ''
						ELSE
							CASE
								WHEN SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info))+1, 1) = '<' THEN
									SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info))+1, CHARINDEX('>', column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info))+1) - CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info)))
								ELSE
									SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info))+1, CHARINDEX(']', column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info))+1) - CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info)))
							END
					END
				ELSE ''
			END AS unformatted_column_name,
			CASE output_group_order
				WHEN 1 THEN '---------------------------------------'
				WHEN 2 THEN 
					CASE
						WHEN CHARINDEX('Formatted/Non:', column_info) = 1 THEN ''
						ELSE
							CASE
								WHEN SUBSTRING(column_info, CHARINDEX(CHAR(255) COLLATE Latin1_General_Bin2, column_info, CHARINDEX('Non-Formatted:', column_info))+1, 1) = '<' THEN ''
								ELSE
									SUBSTRING(column_info, CHARINDEX(']', column_info, CHARINDEX('Non-Formatted:', column_info))+2, CHARINDEX('Non-Formatted:', column_info, CHARINDEX(']', column_info)+2) - CHARINDEX(']', column_info)-3)
							END
					END
				ELSE ''
			END AS unformatted_column_type,
			CASE output_group_order
				WHEN 1 THEN '----------------------------------------------------------------------------------------------------------------------'
				ELSE REPLACE(token, CHAR(255) COLLATE Latin1_General_Bin2, '')
			END AS [------description-----------------------------------------------------------------------------------------------------]
		FROM output_tokens
		WHERE
			NOT 
			(
				output_group_order = 1 
				AND output_group = LEN(@outputs)
			)
		ORDER BY
			output_group,
			CASE output_group_order
				WHEN 1 THEN 99
				ELSE output_group_order
			END;

		RETURN;
	END;

	WITH
	a0 AS
	(SELECT 1 AS n UNION ALL SELECT 1),
	a1 AS
	(SELECT 1 AS n FROM a0 AS a, a0 AS b),
	a2 AS
	(SELECT 1 AS n FROM a1 AS a, a1 AS b),
	a3 AS
	(SELECT 1 AS n FROM a2 AS a, a2 AS b),
	a4 AS
	(SELECT 1 AS n FROM a3 AS a, a3 AS b),
	numbers AS
	(
		SELECT TOP(LEN(@output_column_list))
			ROW_NUMBER() OVER
			(
				ORDER BY (SELECT NULL)
			) AS number
		FROM a4
		ORDER BY
			number
	),
	tokens AS
	(
		SELECT 
			'|[' +
				SUBSTRING
				(
					@output_column_list,
					number + 1,
					CHARINDEX(']', @output_column_list, number) - number - 1
				) + '|]' AS token,
			number
		FROM numbers
		WHERE
			SUBSTRING(@output_column_list, number, 1) = '['
	),
	ordered_columns AS
	(
		SELECT
			x.column_name,
			ROW_NUMBER() OVER
			(
				PARTITION BY
					x.column_name
				ORDER BY
					tokens.number,
					x.default_order
			) AS r,
			ROW_NUMBER() OVER
			(
				ORDER BY
					tokens.number,
					x.default_order
			) AS s
		FROM tokens
		JOIN
		(
			SELECT '[session_id]' AS column_name, 1 AS default_order
			UNION ALL
			SELECT '[dd hh:mm:ss.mss]', 2
			WHERE
				@format_output IN (1, 2)
			UNION ALL
			SELECT '[dd hh:mm:ss.mss (avg)]', 3
			WHERE
				@format_output IN (1, 2)
				AND @get_avg_time = 1
			UNION ALL
			SELECT '[avg_elapsed_time]', 4
			WHERE
				@format_output = 0
				AND @get_avg_time = 1
			UNION ALL
			SELECT '[physical_io]', 5
			WHERE
				@get_task_info = 2
			UNION ALL
			SELECT '[reads]', 6
			UNION ALL
			SELECT '[physical_reads]', 7
			UNION ALL
			SELECT '[writes]', 8
			UNION ALL
			SELECT '[tempdb_allocations]', 9
			UNION ALL
			SELECT '[tempdb_current]', 10
			UNION ALL
			SELECT '[CPU]', 11
			UNION ALL
			SELECT '[context_switches]', 12
			WHERE
				@get_task_info = 2
			UNION ALL
			SELECT '[used_memory]', 13
			UNION ALL
			SELECT '[physical_io_delta]', 14
			WHERE
				@delta_interval > 0	
				AND @get_task_info = 2
			UNION ALL
			SELECT '[reads_delta]', 15
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[physical_reads_delta]', 16
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[writes_delta]', 17
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[tempdb_allocations_delta]', 18
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[tempdb_current_delta]', 19
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[CPU_delta]', 20
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[context_switches_delta]', 21
			WHERE
				@delta_interval > 0
				AND @get_task_info = 2
			UNION ALL
			SELECT '[used_memory_delta]', 22
			WHERE
				@delta_interval > 0
			UNION ALL
			SELECT '[tasks]', 23
			WHERE
				@get_task_info = 2
			UNION ALL
			SELECT '[status]', 24
			UNION ALL
			SELECT '[wait_info]', 25
			WHERE
				@get_task_info > 0
				OR @find_block_leaders = 1
			UNION ALL
			SELECT '[locks]', 26
			WHERE
				@get_locks = 1
			UNION ALL
			SELECT '[tran_start_time]', 27
			WHERE
				@get_transaction_info = 1
			UNION ALL
			SELECT '[tran_log_writes]', 28
			WHERE
				@get_transaction_info = 1
			UNION ALL
			SELECT '[open_tran_count]', 29
			UNION ALL
			SELECT '[sql_command]', 30
			WHERE
				@get_outer_command = 1
			UNION ALL
			SELECT '[sql_text]', 31
			UNION ALL
			SELECT '[query_plan]', 32
			WHERE
				@get_plans >= 1
			UNION ALL
			SELECT '[blocking_session_id]', 33
			WHERE
				@get_task_info > 0
				OR @find_block_leaders = 1
			UNION ALL
			SELECT '[blocked_session_count]', 34
			WHERE
				@find_block_leaders = 1
			UNION ALL
			SELECT '[percent_complete]', 35
			UNION ALL
			SELECT '[host_name]', 36
			UNION ALL
			SELECT '[login_name]', 37
			UNION ALL
			SELECT '[database_name]', 38
			UNION ALL
			SELECT '[program_name]', 39
			UNION ALL
			SELECT '[additional_info]', 40
			WHERE
				@get_additional_info = 1
			UNION ALL
			SELECT '[start_time]', 41
			UNION ALL
			SELECT '[login_time]', 42
			UNION ALL
			SELECT '[request_id]', 43
			UNION ALL
			SELECT '[collection_time]', 44
		) AS x ON 
			x.column_name LIKE token ESCAPE '|'
	)
	SELECT
		@output_column_list =
			STUFF
			(
				(
					SELECT
						',' + column_name as [text()]
					FROM ordered_columns
					WHERE
						r = 1
					ORDER BY
						s
					FOR XML
						PATH('')
				),
				1,
				1,
				''
			);
	
	IF COALESCE(RTRIM(@output_column_list), '') = ''
	BEGIN;
		RAISERROR('No valid column matches found in @output_column_list or no columns remain due to selected options.', 16, 1);
		RETURN;
	END;
	
	IF @destination_table <> ''
	BEGIN;
		SET @destination_table = 
			--database
			COALESCE(QUOTENAME(PARSENAME(@destination_table, 3)) + '.', '') +
			--schema
			COALESCE(QUOTENAME(PARSENAME(@destination_table, 2)) + '.', '') +
			--table
			COALESCE(QUOTENAME(PARSENAME(@destination_table, 1)), '');
			
		IF COALESCE(RTRIM(@destination_table), '') = ''
		BEGIN;
			RAISERROR('Destination table not properly formatted.', 16, 1);
			RETURN;
		END;
	END;

	WITH
	a0 AS
	(SELECT 1 AS n UNION ALL SELECT 1),
	a1 AS
	(SELECT 1 AS n FROM a0 AS a, a0 AS b),
	a2 AS
	(SELECT 1 AS n FROM a1 AS a, a1 AS b),
	a3 AS
	(SELECT 1 AS n FROM a2 AS a, a2 AS b),
	a4 AS
	(SELECT 1 AS n FROM a3 AS a, a3 AS b),
	numbers AS
	(
		SELECT TOP(LEN(@sort_order))
			ROW_NUMBER() OVER
			(
				ORDER BY (SELECT NULL)
			) AS number
		FROM a4
		ORDER BY
			number
	),
	tokens AS
	(
		SELECT 
			'|[' +
				SUBSTRING
				(
					@sort_order,
					number + 1,
					CHARINDEX(']', @sort_order, number) - number - 1
				) + '|]' AS token,
			SUBSTRING
			(
				@sort_order,
				CHARINDEX(']', @sort_order, number) + 1,
				COALESCE(NULLIF(CHARINDEX('[', @sort_order, CHARINDEX(']', @sort_order, number)), 0), LEN(@sort_order)) - CHARINDEX(']', @sort_order, number)
			) AS next_chunk,
			number
		FROM numbers
		WHERE
			SUBSTRING(@sort_order, number, 1) = '['
	),
	ordered_columns AS
	(
		SELECT
			x.column_name +
				CASE
					WHEN tokens.next_chunk LIKE '%asc%' THEN ' ASC'
					WHEN tokens.next_chunk LIKE '%desc%' THEN ' DESC'
					ELSE ''
				END AS column_name,
			ROW_NUMBER() OVER
			(
				PARTITION BY
					x.column_name
				ORDER BY
					tokens.number
			) AS r,
			tokens.number
		FROM tokens
		JOIN
		(
			SELECT '[session_id]' AS column_name
			UNION ALL
			SELECT '[physical_io]'
			UNION ALL
			SELECT '[reads]'
			UNION ALL
			SELECT '[physical_reads]'
			UNION ALL
			SELECT '[writes]'
			UNION ALL
			SELECT '[tempdb_allocations]'
			UNION ALL
			SELECT '[tempdb_current]'
			UNION ALL
			SELECT '[CPU]'
			UNION ALL
			SELECT '[context_switches]'
			UNION ALL
			SELECT '[used_memory]'
			UNION ALL
			SELECT '[physical_io_delta]'
			UNION ALL
			SELECT '[reads_delta]'
			UNION ALL
			SELECT '[physical_reads_delta]'
			UNION ALL
			SELECT '[writes_delta]'
			UNION ALL
			SELECT '[tempdb_allocations_delta]'
			UNION ALL
			SELECT '[tempdb_current_delta]'
			UNION ALL
			SELECT '[CPU_delta]'
			UNION ALL
			SELECT '[context_switches_delta]'
			UNION ALL
			SELECT '[used_memory_delta]'
			UNION ALL
			SELECT '[tasks]'
			UNION ALL
			SELECT '[tran_start_time]'
			UNION ALL
			SELECT '[open_tran_count]'
			UNION ALL
			SELECT '[blocking_session_id]'
			UNION ALL
			SELECT '[blocked_session_count]'
			UNION ALL
			SELECT '[percent_complete]'
			UNION ALL
			SELECT '[host_name]'
			UNION ALL
			SELECT '[login_name]'
			UNION ALL
			SELECT '[database_name]'
			UNION ALL
			SELECT '[start_time]'
			UNION ALL
			SELECT '[login_time]'
			UNION ALL
			SELECT '[program_name]'
		) AS x ON 
			x.column_name LIKE token ESCAPE '|'
	)
	SELECT
		@sort_order = COALESCE(z.sort_order, '')
	FROM
	(
		SELECT
			STUFF
			(
				(
					SELECT
						',' + column_name as [text()]
					FROM ordered_columns
					WHERE
						r = 1
					ORDER BY
						number
					FOR XML
						PATH('')
				),
				1,
				1,
				''
			) AS sort_order
	) AS z;

	CREATE TABLE #sessions
	(
		recursion SMALLINT NOT NULL,
		session_id SMALLINT NOT NULL,
		request_id INT NOT NULL,
		session_number INT NOT NULL,
		elapsed_time INT NOT NULL,
		avg_elapsed_time INT NULL,
		physical_io BIGINT NULL,
		reads BIGINT NULL,
		physical_reads BIGINT NULL,
		writes BIGINT NULL,
		tempdb_allocations BIGINT NULL,
		tempdb_current BIGINT NULL,
		CPU INT NULL,
		thread_CPU_snapshot BIGINT NULL,
		context_switches BIGINT NULL,
		used_memory BIGINT NOT NULL, 
		tasks SMALLINT NULL,
		status VARCHAR(30) NOT NULL,
		wait_info NVARCHAR(4000) NULL,
		locks XML NULL,
		transaction_id BIGINT NULL,
		tran_start_time DATETIME NULL,
		tran_log_writes NVARCHAR(4000) NULL,
		open_tran_count SMALLINT NULL,
		sql_command XML NULL,
		sql_handle VARBINARY(64) NULL,
		statement_start_offset INT NULL,
		statement_end_offset INT NULL,
		sql_text XML NULL,
		plan_handle VARBINARY(64) NULL,
		query_plan XML NULL,
		blocking_session_id SMALLINT NULL,
		blocked_session_count SMALLINT NULL,
		percent_complete REAL NULL,
		host_name sysname NULL,
		login_name sysname NOT NULL,
		database_name sysname NULL,
		program_name sysname NULL,
		additional_info XML NULL,
		start_time DATETIME NOT NULL,
		login_time DATETIME NULL,
		last_request_start_time DATETIME NULL,
		PRIMARY KEY CLUSTERED (session_id, request_id, recursion) WITH (IGNORE_DUP_KEY = ON),
		UNIQUE NONCLUSTERED (transaction_id, session_id, request_id, recursion) WITH (IGNORE_DUP_KEY = ON)
	);

	IF @return_schema = 0
	BEGIN;
		--Disable unnecessary autostats on the table
		CREATE STATISTICS s_session_id ON #sessions (session_id)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_request_id ON #sessions (request_id)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_transaction_id ON #sessions (transaction_id)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_session_number ON #sessions (session_number)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_status ON #sessions (status)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_start_time ON #sessions (start_time)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_last_request_start_time ON #sessions (last_request_start_time)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;
		CREATE STATISTICS s_recursion ON #sessions (recursion)
		WITH SAMPLE 0 ROWS, NORECOMPUTE;

		DECLARE @recursion SMALLINT;
		SET @recursion = 
			CASE @delta_interval
				WHEN 0 THEN 1
				ELSE -1
			END;

		DECLARE @first_collection_ms_ticks BIGINT;
		DECLARE @last_collection_start DATETIME;
		DECLARE @sys_info BIT;
		SET @sys_info = ISNULL(CONVERT(BIT, SIGN(OBJECT_ID('sys.dm_os_sys_info'))), 0);

		--Used for the delta pull
		REDO:;
		
		IF 
			@get_locks = 1 
			AND @recursion = 1
			AND @output_column_list LIKE '%|[locks|]%' ESCAPE '|'
		BEGIN;
			SELECT
				y.resource_type,
				y.database_name,
				y.object_id,
				y.file_id,
				y.page_type,
				y.hobt_id,
				y.allocation_unit_id,
				y.index_id,
				y.schema_id,
				y.principal_id,
				y.request_mode,
				y.request_status,
				y.session_id,
				y.resource_description,
				y.request_count,
				s.request_id,
				s.start_time,
				CONVERT(sysname, NULL) AS object_name,
				CONVERT(sysname, NULL) AS index_name,
				CONVERT(sysname, NULL) AS schema_name,
				CONVERT(sysname, NULL) AS principal_name,
				CONVERT(NVARCHAR(2048), NULL) AS query_error
			INTO #locks
			FROM
			(
				SELECT
					sp.spid AS session_id,
					CASE sp.status
						WHEN 'sleeping' THEN CONVERT(INT, 0)
						ELSE sp.request_id
					END AS request_id,
					CASE sp.status
						WHEN 'sleeping' THEN sp.last_batch
						ELSE COALESCE(req.start_time, sp.last_batch)
					END AS start_time,
					sp.dbid
				FROM sys.sysprocesses AS sp
				OUTER APPLY
				(
					SELECT TOP(1)
						CASE
							WHEN 
							(
								sp.hostprocess > ''
								OR r.total_elapsed_time < 0
							) THEN
								r.start_time
							ELSE
								DATEADD
								(
									ms, 
									1000 * (DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())) / 500) - DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())), 
									DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())
								)
						END AS start_time
					FROM sys.dm_exec_requests AS r
					WHERE
						r.session_id = sp.spid
						AND r.request_id = sp.request_id
				) AS req
				WHERE
					--Process inclusive filter
					1 =
						CASE
							WHEN @filter <> '' THEN
								CASE @filter_type
									WHEN 'session' THEN
										CASE
											WHEN
												CONVERT(SMALLINT, @filter) = 0
												OR sp.spid = CONVERT(SMALLINT, @filter)
													THEN 1
											ELSE 0
										END
									WHEN 'program' THEN
										CASE
											WHEN sp.program_name LIKE @filter THEN 1
											ELSE 0
										END
									WHEN 'login' THEN
										CASE
											WHEN sp.loginame LIKE @filter THEN 1
											ELSE 0
										END
									WHEN 'host' THEN
										CASE
											WHEN sp.hostname LIKE @filter THEN 1
											ELSE 0
										END
									WHEN 'database' THEN
										CASE
											WHEN DB_NAME(sp.dbid) LIKE @filter THEN 1
											ELSE 0
										END
									ELSE 0
								END
							ELSE 1
						END
					--Process exclusive filter
					AND 0 =
						CASE
							WHEN @not_filter <> '' THEN
								CASE @not_filter_type
									WHEN 'session' THEN
										CASE
											WHEN sp.spid = CONVERT(SMALLINT, @not_filter) THEN 1
											ELSE 0
										END
									WHEN 'program' THEN
										CASE
											WHEN sp.program_name LIKE @not_filter THEN 1
											ELSE 0
										END
									WHEN 'login' THEN
										CASE
											WHEN sp.loginame LIKE @not_filter THEN 1
											ELSE 0
										END
									WHEN 'host' THEN
										CASE
											WHEN sp.hostname LIKE @not_filter THEN 1
											ELSE 0
										END
									WHEN 'database' THEN
										CASE
											WHEN DB_NAME(sp.dbid) LIKE @not_filter THEN 1
											ELSE 0
										END
									ELSE 0
								END
							ELSE 0
						END
					AND 
					(
						@show_own_spid = 1
						OR sp.spid <> @@SPID
					)
					AND 
					(
						@show_system_spids = 1
						OR sp.hostprocess > ''
					)
					AND sp.ecid = 0
			) AS s
			INNER HASH JOIN
			(
				SELECT
					x.resource_type,
					x.database_name,
					x.object_id,
					x.file_id,
					CASE
						WHEN x.page_no = 1 OR x.page_no % 8088 = 0 THEN 'PFS'
						WHEN x.page_no = 2 OR x.page_no % 511232 = 0 THEN 'GAM'
						WHEN x.page_no = 3 OR (x.page_no - 1) % 511232 = 0 THEN 'SGAM'
						WHEN x.page_no = 6 OR (x.page_no - 6) % 511232 = 0 THEN 'DCM'
						WHEN x.page_no = 7 OR (x.page_no - 7) % 511232 = 0 THEN 'BCM'
						WHEN x.page_no IS NOT NULL THEN '*'
						ELSE NULL
					END AS page_type,
					x.hobt_id,
					x.allocation_unit_id,
					x.index_id,
					x.schema_id,
					x.principal_id,
					x.request_mode,
					x.request_status,
					x.session_id,
					x.request_id,
					CASE
						WHEN COALESCE(x.object_id, x.file_id, x.hobt_id, x.allocation_unit_id, x.index_id, x.schema_id, x.principal_id) IS NULL THEN NULLIF(resource_description, '')
						ELSE NULL
					END AS resource_description,
					COUNT(*) AS request_count
				FROM
				(
					SELECT
						tl.resource_type +
							CASE
								WHEN tl.resource_subtype = '' THEN ''
								ELSE '.' + tl.resource_subtype
							END AS resource_type,
						COALESCE(DB_NAME(tl.resource_database_id), N'(null)') AS database_name,
						CONVERT
						(
							INT,
							CASE
								WHEN tl.resource_type = 'OBJECT' THEN tl.resource_associated_entity_id
								WHEN tl.resource_description LIKE '%object_id = %' THEN
									(
										SUBSTRING
										(
											tl.resource_description, 
											(CHARINDEX('object_id = ', tl.resource_description) + 12), 
											COALESCE
											(
												NULLIF
												(
													CHARINDEX(',', tl.resource_description, CHARINDEX('object_id = ', tl.resource_description) + 12),
													0
												), 
												DATALENGTH(tl.resource_description)+1
											) - (CHARINDEX('object_id = ', tl.resource_description) + 12)
										)
									)
								ELSE NULL
							END
						) AS object_id,
						CONVERT
						(
							INT,
							CASE 
								WHEN tl.resource_type = 'FILE' THEN CONVERT(INT, tl.resource_description)
								WHEN tl.resource_type IN ('PAGE', 'EXTENT', 'RID') THEN LEFT(tl.resource_description, CHARINDEX(':', tl.resource_description)-1)
								ELSE NULL
							END
						) AS file_id,
						CONVERT
						(
							INT,
							CASE
								WHEN tl.resource_type IN ('PAGE', 'EXTENT', 'RID') THEN 
									SUBSTRING
									(
										tl.resource_description, 
										CHARINDEX(':', tl.resource_description) + 1, 
										COALESCE
										(
											NULLIF
											(
												CHARINDEX(':', tl.resource_description, CHARINDEX(':', tl.resource_description) + 1), 
												0
											), 
											DATALENGTH(tl.resource_description)+1
										) - (CHARINDEX(':', tl.resource_description) + 1)
									)
								ELSE NULL
							END
						) AS page_no,
						CASE
							WHEN tl.resource_type IN ('PAGE', 'KEY', 'RID', 'HOBT') THEN tl.resource_associated_entity_id
							ELSE NULL
						END AS hobt_id,
						CASE
							WHEN tl.resource_type = 'ALLOCATION_UNIT' THEN tl.resource_associated_entity_id
							ELSE NULL
						END AS allocation_unit_id,
						CONVERT
						(
							INT,
							CASE
								WHEN
									/*TODO: Deal with server principals*/ 
									tl.resource_subtype <> 'SERVER_PRINCIPAL' 
									AND tl.resource_description LIKE '%index_id or stats_id = %' THEN
									(
										SUBSTRING
										(
											tl.resource_description, 
											(CHARINDEX('index_id or stats_id = ', tl.resource_description) + 23), 
											COALESCE
											(
												NULLIF
												(
													CHARINDEX(',', tl.resource_description, CHARINDEX('index_id or stats_id = ', tl.resource_description) + 23), 
													0
												), 
												DATALENGTH(tl.resource_description)+1
											) - (CHARINDEX('index_id or stats_id = ', tl.resource_description) + 23)
										)
									)
								ELSE NULL
							END 
						) AS index_id,
						CONVERT
						(
							INT,
							CASE
								WHEN tl.resource_description LIKE '%schema_id = %' THEN
									(
										SUBSTRING
										(
											tl.resource_description, 
											(CHARINDEX('schema_id = ', tl.resource_description) + 12), 
											COALESCE
											(
												NULLIF
												(
													CHARINDEX(',', tl.resource_description, CHARINDEX('schema_id = ', tl.resource_description) + 12), 
													0
												), 
												DATALENGTH(tl.resource_description)+1
											) - (CHARINDEX('schema_id = ', tl.resource_description) + 12)
										)
									)
								ELSE NULL
							END 
						) AS schema_id,
						CONVERT
						(
							INT,
							CASE
								WHEN tl.resource_description LIKE '%principal_id = %' THEN
									(
										SUBSTRING
										(
											tl.resource_description, 
											(CHARINDEX('principal_id = ', tl.resource_description) + 15), 
											COALESCE
											(
												NULLIF
												(
													CHARINDEX(',', tl.resource_description, CHARINDEX('principal_id = ', tl.resource_description) + 15), 
													0
												), 
												DATALENGTH(tl.resource_description)+1
											) - (CHARINDEX('principal_id = ', tl.resource_description) + 15)
										)
									)
								ELSE NULL
							END
						) AS principal_id,
						tl.request_mode,
						tl.request_status,
						tl.request_session_id AS session_id,
						tl.request_request_id AS request_id,

						/*TODO: Applocks, other resource_descriptions*/
						RTRIM(tl.resource_description) AS resource_description,
						tl.resource_associated_entity_id
						/*********************************************/
					FROM 
					(
						SELECT 
							request_session_id,
							CONVERT(VARCHAR(120), resource_type) COLLATE Latin1_General_Bin2 AS resource_type,
							CONVERT(VARCHAR(120), resource_subtype) COLLATE Latin1_General_Bin2 AS resource_subtype,
							resource_database_id,
							CONVERT(VARCHAR(512), resource_description) COLLATE Latin1_General_Bin2 AS resource_description,
							resource_associated_entity_id,
							CONVERT(VARCHAR(120), request_mode) COLLATE Latin1_General_Bin2 AS request_mode,
							CONVERT(VARCHAR(120), request_status) COLLATE Latin1_General_Bin2 AS request_status,
							request_request_id
						FROM sys.dm_tran_locks
					) AS tl
				) AS x
				GROUP BY
					x.resource_type,
					x.database_name,
					x.object_id,
					x.file_id,
					CASE
						WHEN x.page_no = 1 OR x.page_no % 8088 = 0 THEN 'PFS'
						WHEN x.page_no = 2 OR x.page_no % 511232 = 0 THEN 'GAM'
						WHEN x.page_no = 3 OR (x.page_no - 1) % 511232 = 0 THEN 'SGAM'
						WHEN x.page_no = 6 OR (x.page_no - 6) % 511232 = 0 THEN 'DCM'
						WHEN x.page_no = 7 OR (x.page_no - 7) % 511232 = 0 THEN 'BCM'
						WHEN x.page_no IS NOT NULL THEN '*'
						ELSE NULL
					END,
					x.hobt_id,
					x.allocation_unit_id,
					x.index_id,
					x.schema_id,
					x.principal_id,
					x.request_mode,
					x.request_status,
					x.session_id,
					x.request_id,
					CASE
						WHEN COALESCE(x.object_id, x.file_id, x.hobt_id, x.allocation_unit_id, x.index_id, x.schema_id, x.principal_id) IS NULL THEN NULLIF(resource_description, '')
						ELSE NULL
					END
			) AS y ON
				y.session_id = s.session_id
				AND y.request_id = s.request_id
			OPTION (HASH GROUP);

			--Disable unnecessary autostats on the table
			CREATE STATISTICS s_database_name ON #locks (database_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_object_id ON #locks (object_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_hobt_id ON #locks (hobt_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_allocation_unit_id ON #locks (allocation_unit_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_index_id ON #locks (index_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_schema_id ON #locks (schema_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_principal_id ON #locks (principal_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_request_id ON #locks (request_id)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_start_time ON #locks (start_time)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_resource_type ON #locks (resource_type)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_object_name ON #locks (object_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_schema_name ON #locks (schema_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_page_type ON #locks (page_type)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_request_mode ON #locks (request_mode)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_request_status ON #locks (request_status)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_resource_description ON #locks (resource_description)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_index_name ON #locks (index_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_principal_name ON #locks (principal_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
		END;
		
		DECLARE 
			@sql VARCHAR(MAX), 
			@sql_n NVARCHAR(MAX);

		SET @sql = 
			CONVERT(VARCHAR(MAX), '') +
			'DECLARE @blocker BIT;
			SET @blocker = 0;
			DECLARE @i INT;
			SET @i = 2147483647;

			DECLARE @sessions TABLE
			(
				session_id SMALLINT NOT NULL,
				request_id INT NOT NULL,
				login_time DATETIME,
				last_request_end_time DATETIME,
				status VARCHAR(30),
				statement_start_offset INT,
				statement_end_offset INT,
				sql_handle BINARY(20),
				host_name NVARCHAR(128),
				login_name NVARCHAR(128),
				program_name NVARCHAR(128),
				database_id SMALLINT,
				memory_usage INT,
				open_tran_count SMALLINT, 
				' +
				CASE
					WHEN 
					(
						@get_task_info <> 0 
						OR @find_block_leaders = 1 
					) THEN
						'wait_type NVARCHAR(32),
						wait_resource NVARCHAR(256),
						wait_time BIGINT, 
						'
					ELSE 
						''
				END +
				'blocked SMALLINT,
				is_user_process BIT,
				cmd VARCHAR(32),
				PRIMARY KEY CLUSTERED (session_id, request_id) WITH (IGNORE_DUP_KEY = ON)
			);

			DECLARE @blockers TABLE
			(
				session_id INT NOT NULL PRIMARY KEY WITH (IGNORE_DUP_KEY = ON)
			);

			BLOCKERS:;

			INSERT @sessions
			(
				session_id,
				request_id,
				login_time,
				last_request_end_time,
				status,
				statement_start_offset,
				statement_end_offset,
				sql_handle,
				host_name,
				login_name,
				program_name,
				database_id,
				memory_usage,
				open_tran_count, 
				' +
				CASE
					WHEN 
					(
						@get_task_info <> 0
						OR @find_block_leaders = 1 
					) THEN
						'wait_type,
						wait_resource,
						wait_time, 
						'
					ELSE
						''
				END +
				'blocked,
				is_user_process,
				cmd 
			)
			SELECT TOP(@i)
				spy.session_id,
				spy.request_id,
				spy.login_time,
				spy.last_request_end_time,
				spy.status,
				spy.statement_start_offset,
				spy.statement_end_offset,
				spy.sql_handle,
				spy.host_name,
				spy.login_name,
				spy.program_name,
				spy.database_id,
				spy.memory_usage,
				spy.open_tran_count,
				' +
				CASE
					WHEN 
					(
						@get_task_info <> 0  
						OR @find_block_leaders = 1 
					) THEN
						'spy.wait_type,
						CASE
							WHEN
								spy.wait_type LIKE N''PAGE%LATCH_%''
								OR spy.wait_type = N''CXPACKET''
								OR spy.wait_type LIKE N''LATCH[_]%''
								OR spy.wait_type = N''OLEDB'' THEN
									spy.wait_resource
							ELSE
								NULL
						END AS wait_resource,
						spy.wait_time, 
						'
					ELSE
						''
				END +
				'spy.blocked,
				spy.is_user_process,
				spy.cmd
			FROM
			(
				SELECT TOP(@i)
					spx.*, 
					' +
					CASE
						WHEN 
						(
							@get_task_info <> 0 
							OR @find_block_leaders = 1 
						) THEN
							'ROW_NUMBER() OVER
							(
								PARTITION BY
									spx.session_id,
									spx.request_id
								ORDER BY
									CASE
										WHEN spx.wait_type LIKE N''LCK[_]%'' THEN 
											1
										ELSE
											99
									END,
									spx.wait_time DESC,
									spx.blocked DESC
							) AS r 
							'
						ELSE 
							'1 AS r 
							'
					END +
				'FROM
				(
					SELECT TOP(@i)
						sp0.session_id,
						sp0.request_id,
						sp0.login_time,
						sp0.last_request_end_time,
						LOWER(sp0.status) AS status,
						CASE
							WHEN sp0.cmd = ''CREATE INDEX'' THEN
								0
							ELSE
								sp0.stmt_start
						END AS statement_start_offset,
						CASE
							WHEN sp0.cmd = N''CREATE INDEX'' THEN
								-1
							ELSE
								COALESCE(NULLIF(sp0.stmt_end, 0), -1)
						END AS statement_end_offset,
						sp0.sql_handle,
						sp0.host_name,
						sp0.login_name,
						sp0.program_name,
						sp0.database_id,
						sp0.memory_usage,
						sp0.open_tran_count, 
						' +
						CASE
							WHEN 
							(
								@get_task_info <> 0 
								OR @find_block_leaders = 1 
							) THEN
								'CASE
									WHEN sp0.wait_time > 0 AND sp0.wait_type <> N''CXPACKET'' THEN
										sp0.wait_type
									ELSE
										NULL
								END AS wait_type,
								CASE
									WHEN sp0.wait_time > 0 AND sp0.wait_type <> N''CXPACKET'' THEN 
										sp0.wait_resource
									ELSE
										NULL
								END AS wait_resource,
								CASE
									WHEN sp0.wait_type <> N''CXPACKET'' THEN
										sp0.wait_time
									ELSE
										0
								END AS wait_time, 
								'
							ELSE
								''
						END +
						'sp0.blocked,
						sp0.is_user_process,
						sp0.cmd
					FROM
					(
						SELECT TOP(@i)
							sp1.session_id,
							sp1.request_id,
							sp1.login_time,
							sp1.last_request_end_time,
							sp1.status,
							sp1.cmd,
							sp1.stmt_start,
							sp1.stmt_end,
							MAX(NULLIF(sp1.sql_handle, 0x00)) OVER (PARTITION BY sp1.session_id, sp1.request_id) AS sql_handle,
							sp1.host_name,
							MAX(sp1.login_name) OVER (PARTITION BY sp1.session_id, sp1.request_id) AS login_name,
							sp1.program_name,
							sp1.database_id,
							MAX(sp1.memory_usage)  OVER (PARTITION BY sp1.session_id, sp1.request_id) AS memory_usage,
							MAX(sp1.open_tran_count)  OVER (PARTITION BY sp1.session_id, sp1.request_id) AS open_tran_count,
							sp1.wait_type,
							sp1.wait_resource,
							sp1.wait_time,
							sp1.blocked,
							sp1.hostprocess,
							sp1.is_user_process
						FROM
						(
							SELECT TOP(@i)
								sp2.spid AS session_id,
								CASE sp2.status
									WHEN ''sleeping'' THEN
										CONVERT(INT, 0)
									ELSE
										sp2.request_id
								END AS request_id,
								MAX(sp2.login_time) AS login_time,
								MAX(sp2.last_batch) AS last_request_end_time,
								MAX(CONVERT(VARCHAR(30), RTRIM(sp2.status)) COLLATE Latin1_General_Bin2) AS status,
								MAX(CONVERT(VARCHAR(32), RTRIM(sp2.cmd)) COLLATE Latin1_General_Bin2) AS cmd,
								MAX(sp2.stmt_start) AS stmt_start,
								MAX(sp2.stmt_end) AS stmt_end,
								MAX(sp2.sql_handle) AS sql_handle,
								MAX(CONVERT(sysname, RTRIM(sp2.hostname)) COLLATE SQL_Latin1_General_CP1_CI_AS) AS host_name,
								MAX(CONVERT(sysname, RTRIM(sp2.loginame)) COLLATE SQL_Latin1_General_CP1_CI_AS) AS login_name,
								MAX
								(
									CASE
										WHEN blk.queue_id IS NOT NULL THEN
											N''Service Broker
												database_id: '' + CONVERT(NVARCHAR, blk.database_id) +
												N'' queue_id: '' + CONVERT(NVARCHAR, blk.queue_id)
										ELSE
											CONVERT
											(
												sysname,
												RTRIM(sp2.program_name)
											)
									END COLLATE SQL_Latin1_General_CP1_CI_AS
								) AS program_name,
								MAX(sp2.dbid) AS database_id,
								MAX(sp2.memusage) AS memory_usage,
								MAX(sp2.open_tran) AS open_tran_count,
								RTRIM(sp2.lastwaittype) AS wait_type,
								RTRIM(sp2.waitresource) AS wait_resource,
								MAX(sp2.waittime) AS wait_time,
								COALESCE(NULLIF(sp2.blocked, sp2.spid), 0) AS blocked,
								MAX
								(
									CASE
										WHEN blk.session_id = sp2.spid THEN
											''blocker''
										ELSE
											RTRIM(sp2.hostprocess)
									END
								) AS hostprocess,
								CONVERT
								(
									BIT,
									MAX
									(
										CASE
											WHEN sp2.hostprocess > '''' THEN
												1
											ELSE
												0
										END
									)
								) AS is_user_process
							FROM
							(
								SELECT TOP(@i)
									session_id,
									CONVERT(INT, NULL) AS queue_id,
									CONVERT(INT, NULL) AS database_id
								FROM @blockers

								UNION ALL

								SELECT TOP(@i)
									CONVERT(SMALLINT, 0),
									CONVERT(INT, NULL) AS queue_id,
									CONVERT(INT, NULL) AS database_id
								WHERE
									@blocker = 0

								UNION ALL

								SELECT TOP(@i)
									CONVERT(SMALLINT, spid),
									queue_id,
									database_id
								FROM sys.dm_broker_activated_tasks
								WHERE
									@blocker = 0
							) AS blk
							INNER JOIN sys.sysprocesses AS sp2 ON
								sp2.spid = blk.session_id
								OR
								(
									blk.session_id = 0
									AND @blocker = 0
								)
							' +
							CASE 
								WHEN 
								(
									@get_task_info = 0 
									AND @find_block_leaders = 0
								) THEN
									'WHERE
										sp2.ecid = 0 
									' 
								ELSE
									''
							END +
							'GROUP BY
								sp2.spid,
								CASE sp2.status
									WHEN ''sleeping'' THEN
										CONVERT(INT, 0)
									ELSE
										sp2.request_id
								END,
								RTRIM(sp2.lastwaittype),
								RTRIM(sp2.waitresource),
								COALESCE(NULLIF(sp2.blocked, sp2.spid), 0)
						) AS sp1
					) AS sp0
					WHERE
						@blocker = 1
						OR
						(1=1 
						' +
							--inclusive filter
							CASE
								WHEN @filter <> '' THEN
									CASE @filter_type
										WHEN 'session' THEN
											CASE
												WHEN CONVERT(SMALLINT, @filter) <> 0 THEN
													'AND sp0.session_id = CONVERT(SMALLINT, @filter) 
													'
												ELSE
													''
											END
										WHEN 'program' THEN
											'AND sp0.program_name LIKE @filter 
											'
										WHEN 'login' THEN
											'AND sp0.login_name LIKE @filter 
											'
										WHEN 'host' THEN
											'AND sp0.host_name LIKE @filter 
											'
										WHEN 'database' THEN
											'AND DB_NAME(sp0.database_id) LIKE @filter 
											'
										ELSE
											''
									END
								ELSE
									''
							END +
							--exclusive filter
							CASE
								WHEN @not_filter <> '' THEN
									CASE @not_filter_type
										WHEN 'session' THEN
											CASE
												WHEN CONVERT(SMALLINT, @not_filter) <> 0 THEN
													'AND sp0.session_id <> CONVERT(SMALLINT, @not_filter) 
													'
												ELSE
													''
											END
										WHEN 'program' THEN
											'AND sp0.program_name NOT LIKE @not_filter 
											'
										WHEN 'login' THEN
											'AND sp0.login_name NOT LIKE @not_filter 
											'
										WHEN 'host' THEN
											'AND sp0.host_name NOT LIKE @not_filter 
											'
										WHEN 'database' THEN
											'AND DB_NAME(sp0.database_id) NOT LIKE @not_filter 
											'
										ELSE
											''
									END
								ELSE
									''
							END +
							CASE @show_own_spid
								WHEN 1 THEN
									''
								ELSE
									'AND sp0.session_id <> @@spid 
									'
							END +
							CASE 
								WHEN @show_system_spids = 0 THEN
									'AND sp0.hostprocess > '''' 
									' 
								ELSE
									''
							END +
							CASE @show_sleeping_spids
								WHEN 0 THEN
									'AND sp0.status <> ''sleeping'' 
									'
								WHEN 1 THEN
									'AND
									(
										sp0.status <> ''sleeping''
										OR sp0.open_tran_count > 0
									)
									'
								ELSE
									''
							END +
						')
				) AS spx
			) AS spy
			WHERE
				spy.r = 1; 
			' + 
			CASE @recursion
				WHEN 1 THEN 
					'IF @@ROWCOUNT > 0
					BEGIN;
						INSERT @blockers
						(
							session_id
						)
						SELECT TOP(@i)
							blocked
						FROM @sessions
						WHERE
							NULLIF(blocked, 0) IS NOT NULL

						EXCEPT

						SELECT TOP(@i)
							session_id
						FROM @sessions; 
						' +

						CASE
							WHEN
							(
								@get_task_info > 0
								OR @find_block_leaders = 1
							) THEN
								'IF @@ROWCOUNT > 0
								BEGIN;
									SET @blocker = 1;
									GOTO BLOCKERS;
								END; 
								'
							ELSE 
								''
						END +
					'END; 
					'
				ELSE 
					''
			END +
			'SELECT TOP(@i)
				@recursion AS recursion,
				x.session_id,
				x.request_id,
				DENSE_RANK() OVER
				(
					ORDER BY
						x.session_id
				) AS session_number,
				' +
				CASE
					WHEN @output_column_list LIKE '%|[dd hh:mm:ss.mss|]%' ESCAPE '|' THEN 
						'x.elapsed_time '
					ELSE 
						'0 '
				END + 
					'AS elapsed_time, 
					' +
				CASE
					WHEN
						(
							@output_column_list LIKE '%|[dd hh:mm:ss.mss (avg)|]%' ESCAPE '|' OR 
							@output_column_list LIKE '%|[avg_elapsed_time|]%' ESCAPE '|'
						)
						AND @recursion = 1
							THEN 
								'x.avg_elapsed_time / 1000 '
					ELSE 
						'NULL '
				END + 
					'AS avg_elapsed_time, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[physical_io|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[physical_io_delta|]%' ESCAPE '|'
							THEN 
								'x.physical_io '
					ELSE 
						'NULL '
				END + 
					'AS physical_io, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[reads|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[reads_delta|]%' ESCAPE '|'
							THEN 
								'x.reads '
					ELSE 
						'0 '
				END + 
					'AS reads, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[physical_reads|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[physical_reads_delta|]%' ESCAPE '|'
							THEN 
								'x.physical_reads '
					ELSE 
						'0 '
				END + 
					'AS physical_reads, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[writes|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[writes_delta|]%' ESCAPE '|'
							THEN 
								'x.writes '
					ELSE 
						'0 '
				END + 
					'AS writes, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[tempdb_allocations|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[tempdb_allocations_delta|]%' ESCAPE '|'
							THEN 
								'x.tempdb_allocations '
					ELSE 
						'0 '
				END + 
					'AS tempdb_allocations, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[tempdb_current|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[tempdb_current_delta|]%' ESCAPE '|'
							THEN 
								'x.tempdb_current '
					ELSE 
						'0 '
				END + 
					'AS tempdb_current, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[CPU|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[CPU_delta|]%' ESCAPE '|'
							THEN
								'x.CPU '
					ELSE
						'0 '
				END + 
					'AS CPU, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[CPU_delta|]%' ESCAPE '|'
						AND @get_task_info = 2
						AND @sys_info = 1
							THEN 
								'x.thread_CPU_snapshot '
					ELSE 
						'0 '
				END + 
					'AS thread_CPU_snapshot, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[context_switches|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[context_switches_delta|]%' ESCAPE '|'
							THEN 
								'x.context_switches '
					ELSE 
						'NULL '
				END + 
					'AS context_switches, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[used_memory|]%' ESCAPE '|'
						OR @output_column_list LIKE '%|[used_memory_delta|]%' ESCAPE '|'
							THEN 
								'x.used_memory '
					ELSE 
						'0 '
				END + 
					'AS used_memory, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[tasks|]%' ESCAPE '|'
						AND @recursion = 1
							THEN 
								'x.tasks '
					ELSE 
						'NULL '
				END + 
					'AS tasks, 
					' +
				CASE
					WHEN 
						(
							@output_column_list LIKE '%|[status|]%' ESCAPE '|' 
							OR @output_column_list LIKE '%|[sql_command|]%' ESCAPE '|'
						)
						AND @recursion = 1
							THEN 
								'x.status '
					ELSE 
						''''' '
				END + 
					'AS status, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[wait_info|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								CASE @get_task_info
									WHEN 2 THEN
										'COALESCE(x.task_wait_info, x.sys_wait_info) '
									ELSE
										'x.sys_wait_info '
								END
					ELSE 
						'NULL '
				END + 
					'AS wait_info, 
					' +
				CASE
					WHEN 
						(
							@output_column_list LIKE '%|[tran_start_time|]%' ESCAPE '|' 
							OR @output_column_list LIKE '%|[tran_log_writes|]%' ESCAPE '|' 
						)
						AND @recursion = 1
							THEN 
								'x.transaction_id '
					ELSE 
						'NULL '
				END + 
					'AS transaction_id, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[open_tran_count|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.open_tran_count '
					ELSE 
						'NULL '
				END + 
					'AS open_tran_count, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[sql_text|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.sql_handle '
					ELSE 
						'NULL '
				END + 
					'AS sql_handle, 
					' +
				CASE
					WHEN 
						(
							@output_column_list LIKE '%|[sql_text|]%' ESCAPE '|' 
							OR @output_column_list LIKE '%|[query_plan|]%' ESCAPE '|' 
						)
						AND @recursion = 1
							THEN 
								'x.statement_start_offset '
					ELSE 
						'NULL '
				END + 
					'AS statement_start_offset, 
					' +
				CASE
					WHEN 
						(
							@output_column_list LIKE '%|[sql_text|]%' ESCAPE '|' 
							OR @output_column_list LIKE '%|[query_plan|]%' ESCAPE '|' 
						)
						AND @recursion = 1
							THEN 
								'x.statement_end_offset '
					ELSE 
						'NULL '
				END + 
					'AS statement_end_offset, 
					' +
				'NULL AS sql_text, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[query_plan|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.plan_handle '
					ELSE 
						'NULL '
				END + 
					'AS plan_handle, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[blocking_session_id|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'NULLIF(x.blocking_session_id, 0) '
					ELSE 
						'NULL '
				END + 
					'AS blocking_session_id, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[percent_complete|]%' ESCAPE '|'
						AND @recursion = 1
							THEN 
								'x.percent_complete '
					ELSE 
						'NULL '
				END + 
					'AS percent_complete, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[host_name|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.host_name '
					ELSE 
						''''' '
				END + 
					'AS host_name, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[login_name|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.login_name '
					ELSE 
						''''' '
				END + 
					'AS login_name, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[database_name|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'DB_NAME(x.database_id) '
					ELSE 
						'NULL '
				END + 
					'AS database_name, 
					' +
				CASE
					WHEN 
						@output_column_list LIKE '%|[program_name|]%' ESCAPE '|' 
						AND @recursion = 1
							THEN 
								'x.program_name '
					ELSE 
						''''' '
				END + 
					'AS program_name, 
					' +
				CASE
					WHEN
						@output_column_list LIKE '%|[additional_info|]%' ESCAPE '|'
						AND @recursion = 1
							THEN
								'(
									SELECT TOP(@i)
										x.text_size,
										x.language,
										x.date_format,
										x.date_first,
										CASE x.quoted_identifier
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS quoted_identifier,
										CASE x.arithabort
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS arithabort,
										CASE x.ansi_null_dflt_on
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS ansi_null_dflt_on,
										CASE x.ansi_defaults
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS ansi_defaults,
										CASE x.ansi_warnings
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS ansi_warnings,
										CASE x.ansi_padding
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS ansi_padding,
										CASE ansi_nulls
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS ansi_nulls,
										CASE x.concat_null_yields_null
											WHEN 0 THEN ''OFF''
											WHEN 1 THEN ''ON''
										END AS concat_null_yields_null,
										CASE x.transaction_isolation_level
											WHEN 0 THEN ''Unspecified''
											WHEN 1 THEN ''ReadUncomitted''
											WHEN 2 THEN ''ReadCommitted''
											WHEN 3 THEN ''Repeatable''
											WHEN 4 THEN ''Serializable''
											WHEN 5 THEN ''Snapshot''
										END AS transaction_isolation_level,
										x.lock_timeout,
										x.deadlock_priority,
										x.row_count,
										x.command_type, 
										' +
										CASE
											WHEN OBJECT_ID('master.dbo.fn_varbintohexstr') IS NOT NULL THEN
												'master.dbo.fn_varbintohexstr(x.sql_handle) AS sql_handle,
												master.dbo.fn_varbintohexstr(x.plan_handle) AS plan_handle,'
											ELSE
												'CONVERT(VARCHAR(256), x.sql_handle, 1) AS sql_handle,
												CONVERT(VARCHAR(256), x.plan_handle, 1) AS plan_handle,'
										END +
										'
										x.statement_start_offset,
										x.statement_end_offset,
										' +
										CASE
											WHEN @output_column_list LIKE '%|[program_name|]%' ESCAPE '|' THEN
												'(
													SELECT TOP(1)
														CONVERT(uniqueidentifier, CONVERT(XML, '''').value(''xs:hexBinary( substring(sql:column("agent_info.job_id_string"), 0) )'', ''binary(16)'')) AS job_id,
														agent_info.step_id,
														(
															SELECT TOP(1)
																NULL
															FOR XML
																PATH(''job_name''),
																TYPE
														),
														(
															SELECT TOP(1)
																NULL
															FOR XML
																PATH(''step_name''),
																TYPE
														)
													FROM
													(
														SELECT TOP(1)
															SUBSTRING(x.program_name, CHARINDEX(''0x'', x.program_name) + 2, 32) AS job_id_string,
															SUBSTRING(x.program_name, CHARINDEX('': Step '', x.program_name) + 7, CHARINDEX('')'', x.program_name, CHARINDEX('': Step '', x.program_name)) - (CHARINDEX('': Step '', x.program_name) + 7)) AS step_id
														WHERE
															x.program_name LIKE N''SQLAgent - TSQL JobStep (Job 0x%''
													) AS agent_info
													FOR XML
														PATH(''agent_job_info''),
														TYPE
												),
												'
											ELSE ''
										END +
										CASE
											WHEN @get_task_info = 2 THEN
												'CONVERT(XML, x.block_info) AS block_info, 
												'
											ELSE
												''
										END + '
										x.host_process_id,
										x.group_id
									FOR XML
										PATH(''additional_info''),
										TYPE
								) '
					ELSE
						'NULL '
				END + 
					'AS additional_info, 
				x.start_time, 
					' +
				CASE
					WHEN
						@output_column_list LIKE '%|[login_time|]%' ESCAPE '|'
						AND @recursion = 1
							THEN
								'x.login_time '
					ELSE 
						'NULL '
				END + 
					'AS login_time, 
				x.last_request_start_time
			FROM
			(
				SELECT TOP(@i)
					y.*,
					CASE
						WHEN DATEDIFF(hour, y.start_time, GETDATE()) > 576 THEN
							DATEDIFF(second, GETDATE(), y.start_time)
						ELSE DATEDIFF(ms, y.start_time, GETDATE())
					END AS elapsed_time,
					COALESCE(tempdb_info.tempdb_allocations, 0) AS tempdb_allocations,
					COALESCE
					(
						CASE
							WHEN tempdb_info.tempdb_current < 0 THEN 0
							ELSE tempdb_info.tempdb_current
						END,
						0
					) AS tempdb_current, 
					' +
					CASE
						WHEN 
							(
								@get_task_info <> 0
								OR @find_block_leaders = 1
							) THEN
								'N''('' + CONVERT(NVARCHAR, y.wait_duration_ms) + N''ms)'' +
									y.wait_type +
										CASE
											WHEN y.wait_type LIKE N''PAGE%LATCH_%'' THEN
												N'':'' +
												COALESCE(DB_NAME(CONVERT(INT, LEFT(y.resource_description, CHARINDEX(N'':'', y.resource_description) - 1))), N''(null)'') +
												N'':'' +
												SUBSTRING(y.resource_description, CHARINDEX(N'':'', y.resource_description) + 1, LEN(y.resource_description) - CHARINDEX(N'':'', REVERSE(y.resource_description)) - CHARINDEX(N'':'', y.resource_description)) +
												N''('' +
													CASE
														WHEN
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) = 1 OR
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) % 8088 = 0
																THEN 
																	N''PFS''
														WHEN
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) = 2 OR
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) % 511232 = 0
																THEN 
																	N''GAM''
														WHEN
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) = 3 OR
															(CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) - 1) % 511232 = 0
																THEN
																	N''SGAM''
														WHEN
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) = 6 OR
															(CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) - 6) % 511232 = 0 
																THEN 
																	N''DCM''
														WHEN
															CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) = 7 OR
															(CONVERT(INT, RIGHT(y.resource_description, CHARINDEX(N'':'', REVERSE(y.resource_description)) - 1)) - 7) % 511232 = 0 
																THEN 
																	N''BCM''
														ELSE 
															N''*''
													END +
												N'')''
											WHEN y.wait_type = N''CXPACKET'' THEN
												N'':'' + SUBSTRING(y.resource_description, CHARINDEX(N''nodeId'', y.resource_description) + 7, 4)
											WHEN y.wait_type LIKE N''LATCH[_]%'' THEN
												N'' ['' + LEFT(y.resource_description, COALESCE(NULLIF(CHARINDEX(N'' '', y.resource_description), 0), LEN(y.resource_description) + 1) - 1) + N'']''
											WHEN
												y.wait_type = N''OLEDB''
												AND y.resource_description LIKE N''%(SPID=%)'' THEN
													N''['' + LEFT(y.resource_description, CHARINDEX(N''(SPID='', y.resource_description) - 2) +
														N'':'' + SUBSTRING(y.resource_description, CHARINDEX(N''(SPID='', y.resource_description) + 6, CHARINDEX(N'')'', y.resource_description, (CHARINDEX(N''(SPID='', y.resource_description) + 6)) - (CHARINDEX(N''(SPID='', y.resource_description) + 6)) + '']''
											ELSE
												N''''
										END COLLATE Latin1_General_Bin2 AS sys_wait_info, 
										'
							ELSE
								''
						END +
						CASE
							WHEN @get_task_info = 2 THEN
								'tasks.physical_io,
								tasks.context_switches,
								tasks.tasks,
								tasks.block_info,
								tasks.wait_info AS task_wait_info,
								tasks.thread_CPU_snapshot,
								'
							ELSE
								'' 
					END +
					CASE 
						WHEN NOT (@get_avg_time = 1 AND @recursion = 1) THEN
							'CONVERT(INT, NULL) '
						ELSE 
							'qs.total_elapsed_time / qs.execution_count '
					END + 
						'AS avg_elapsed_time 
				FROM
				(
					SELECT TOP(@i)
						sp.session_id,
						sp.request_id,
						COALESCE(r.logical_reads, s.logical_reads) AS reads,
						COALESCE(r.reads, s.reads) AS physical_reads,
						COALESCE(r.writes, s.writes) AS writes,
						COALESCE(r.CPU_time, s.CPU_time) AS CPU,
						sp.memory_usage + COALESCE(r.granted_query_memory, 0) AS used_memory,
						LOWER(sp.status) AS status,
						COALESCE(r.sql_handle, sp.sql_handle) AS sql_handle,
						COALESCE(r.statement_start_offset, sp.statement_start_offset) AS statement_start_offset,
						COALESCE(r.statement_end_offset, sp.statement_end_offset) AS statement_end_offset,
						' +
						CASE
							WHEN 
							(
								@get_task_info <> 0
								OR @find_block_leaders = 1 
							) THEN
								'sp.wait_type COLLATE Latin1_General_Bin2 AS wait_type,
								sp.wait_resource COLLATE Latin1_General_Bin2 AS resource_description,
								sp.wait_time AS wait_duration_ms, 
								'
							ELSE
								''
						END +
						'NULLIF(sp.blocked, 0) AS blocking_session_id,
						r.plan_handle,
						NULLIF(r.percent_complete, 0) AS percent_complete,
						sp.host_name,
						sp.login_name,
						sp.program_name,
						s.host_process_id,
						COALESCE(r.text_size, s.text_size) AS text_size,
						COALESCE(r.language, s.language) AS language,
						COALESCE(r.date_format, s.date_format) AS date_format,
						COALESCE(r.date_first, s.date_first) AS date_first,
						COALESCE(r.quoted_identifier, s.quoted_identifier) AS quoted_identifier,
						COALESCE(r.arithabort, s.arithabort) AS arithabort,
						COALESCE(r.ansi_null_dflt_on, s.ansi_null_dflt_on) AS ansi_null_dflt_on,
						COALESCE(r.ansi_defaults, s.ansi_defaults) AS ansi_defaults,
						COALESCE(r.ansi_warnings, s.ansi_warnings) AS ansi_warnings,
						COALESCE(r.ansi_padding, s.ansi_padding) AS ansi_padding,
						COALESCE(r.ansi_nulls, s.ansi_nulls) AS ansi_nulls,
						COALESCE(r.concat_null_yields_null, s.concat_null_yields_null) AS concat_null_yields_null,
						COALESCE(r.transaction_isolation_level, s.transaction_isolation_level) AS transaction_isolation_level,
						COALESCE(r.lock_timeout, s.lock_timeout) AS lock_timeout,
						COALESCE(r.deadlock_priority, s.deadlock_priority) AS deadlock_priority,
						COALESCE(r.row_count, s.row_count) AS row_count,
						COALESCE(r.command, sp.cmd) AS command_type,
						COALESCE
						(
							CASE
								WHEN
								(
									s.is_user_process = 0
									AND r.total_elapsed_time >= 0
								) THEN
									DATEADD
									(
										ms,
										1000 * (DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())) / 500) - DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())),
										DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())
									)
							END,
							NULLIF(COALESCE(r.start_time, sp.last_request_end_time), CONVERT(DATETIME, ''19000101'', 112)),
							sp.login_time
						) AS start_time,
						sp.login_time,
						CASE
							WHEN s.is_user_process = 1 THEN
								s.last_request_start_time
							ELSE
								COALESCE
								(
									DATEADD
									(
										ms,
										1000 * (DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())) / 500) - DATEPART(ms, DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())),
										DATEADD(second, -(r.total_elapsed_time / 1000), GETDATE())
									),
									s.last_request_start_time
								)
						END AS last_request_start_time,
						r.transaction_id,
						sp.database_id,
						sp.open_tran_count,
						' +
							CASE
								WHEN EXISTS
								(
									SELECT
										*
									FROM sys.all_columns AS ac
									WHERE
										ac.object_id = OBJECT_ID('sys.dm_exec_sessions')
										AND ac.name = 'group_id'
								)
									THEN 's.group_id'
								ELSE 'CONVERT(INT, NULL) AS group_id'
							END + '
					FROM @sessions AS sp
					LEFT OUTER LOOP JOIN sys.dm_exec_sessions AS s ON
						s.session_id = sp.session_id
						AND s.login_time = sp.login_time
					LEFT OUTER LOOP JOIN sys.dm_exec_requests AS r ON
						sp.status <> ''sleeping''
						AND r.session_id = sp.session_id
						AND r.request_id = sp.request_id
						AND
						(
							(
								s.is_user_process = 0
								AND sp.is_user_process = 0
							)
							OR
							(
								r.start_time = s.last_request_start_time
								AND s.last_request_end_time <= sp.last_request_end_time
							)
						)
				) AS y
				' + 
				CASE 
					WHEN @get_task_info = 2 THEN
						CONVERT(VARCHAR(MAX), '') +
						'LEFT OUTER HASH JOIN
						(
							SELECT TOP(@i)
								task_nodes.task_node.value(''(session_id/text())[1]'', ''SMALLINT'') AS session_id,
								task_nodes.task_node.value(''(request_id/text())[1]'', ''INT'') AS request_id,
								task_nodes.task_node.value(''(physical_io/text())[1]'', ''BIGINT'') AS physical_io,
								task_nodes.task_node.value(''(context_switches/text())[1]'', ''BIGINT'') AS context_switches,
								task_nodes.task_node.value(''(tasks/text())[1]'', ''INT'') AS tasks,
								task_nodes.task_node.value(''(block_info/text())[1]'', ''NVARCHAR(4000)'') AS block_info,
								task_nodes.task_node.value(''(waits/text())[1]'', ''NVARCHAR(4000)'') AS wait_info,
								task_nodes.task_node.value(''(thread_CPU_snapshot/text())[1]'', ''BIGINT'') AS thread_CPU_snapshot
							FROM
							(
								SELECT TOP(@i)
									CONVERT
									(
										XML,
										REPLACE
										(
											CONVERT(NVARCHAR(MAX), tasks_raw.task_xml_raw) COLLATE Latin1_General_Bin2,
											N''</waits></tasks><tasks><waits>'',
											N'', ''
										)
									) AS task_xml
								FROM
								(
									SELECT TOP(@i)
										CASE waits.r
											WHEN 1 THEN
												waits.session_id
											ELSE
												NULL
										END AS [session_id],
										CASE waits.r
											WHEN 1 THEN
												waits.request_id
											ELSE
												NULL
										END AS [request_id],											
										CASE waits.r
											WHEN 1 THEN
												waits.physical_io
											ELSE
												NULL
										END AS [physical_io],
										CASE waits.r
											WHEN 1 THEN
												waits.context_switches
											ELSE
												NULL
										END AS [context_switches],
										CASE waits.r
											WHEN 1 THEN
												waits.thread_CPU_snapshot
											ELSE
												NULL
										END AS [thread_CPU_snapshot],
										CASE waits.r
											WHEN 1 THEN
												waits.tasks
											ELSE
												NULL
										END AS [tasks],
										CASE waits.r
											WHEN 1 THEN
												waits.block_info
											ELSE
												NULL
										END AS [block_info],
										REPLACE
										(
											REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
											REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
											REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
												CONVERT
												(
													NVARCHAR(MAX),
													N''('' +
														CONVERT(NVARCHAR, num_waits) + N''x: '' +
														CASE num_waits
															WHEN 1 THEN
																CONVERT(NVARCHAR, min_wait_time) + N''ms''
															WHEN 2 THEN
																CASE
																	WHEN min_wait_time <> max_wait_time THEN
																		CONVERT(NVARCHAR, min_wait_time) + N''/'' + CONVERT(NVARCHAR, max_wait_time) + N''ms''
																	ELSE
																		CONVERT(NVARCHAR, max_wait_time) + N''ms''
																END
															ELSE
																CASE
																	WHEN min_wait_time <> max_wait_time THEN
																		CONVERT(NVARCHAR, min_wait_time) + N''/'' + CONVERT(NVARCHAR, avg_wait_time) + N''/'' + CONVERT(NVARCHAR, max_wait_time) + N''ms''
																	ELSE 
																		CONVERT(NVARCHAR, max_wait_time) + N''ms''
																END
														END +
													N'')'' + wait_type COLLATE Latin1_General_Bin2
												),
												NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''),
												NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''),
												NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''),
											NCHAR(0),
											N''''
										) AS [waits]
									FROM
									(
										SELECT TOP(@i)
											w1.*,
											ROW_NUMBER() OVER
											(
												PARTITION BY
													w1.session_id,
													w1.request_id
												ORDER BY
													w1.block_info DESC,
													w1.num_waits DESC,
													w1.wait_type
											) AS r
										FROM
										(
											SELECT TOP(@i)
												task_info.session_id,
												task_info.request_id,
												task_info.physical_io,
												task_info.context_switches,
												task_info.thread_CPU_snapshot,
												task_info.num_tasks AS tasks,
												CASE
													WHEN task_info.runnable_time IS NOT NULL THEN
														''RUNNABLE''
													ELSE
														wt2.wait_type
												END AS wait_type,
												NULLIF(COUNT(COALESCE(task_info.runnable_time, wt2.waiting_task_address)), 0) AS num_waits,
												MIN(COALESCE(task_info.runnable_time, wt2.wait_duration_ms)) AS min_wait_time,
												AVG(COALESCE(task_info.runnable_time, wt2.wait_duration_ms)) AS avg_wait_time,
												MAX(COALESCE(task_info.runnable_time, wt2.wait_duration_ms)) AS max_wait_time,
												MAX(wt2.block_info) AS block_info
											FROM
											(
												SELECT TOP(@i)
													t.session_id,
													t.request_id,
													SUM(CONVERT(BIGINT, t.pending_io_count)) OVER (PARTITION BY t.session_id, t.request_id) AS physical_io,
													SUM(CONVERT(BIGINT, t.context_switches_count)) OVER (PARTITION BY t.session_id, t.request_id) AS context_switches, 
													' +
													CASE
														WHEN 
															@output_column_list LIKE '%|[CPU_delta|]%' ESCAPE '|'
															AND @sys_info = 1
															THEN
																'SUM(tr.usermode_time + tr.kernel_time) OVER (PARTITION BY t.session_id, t.request_id) '
														ELSE
															'CONVERT(BIGINT, NULL) '
													END + 
														' AS thread_CPU_snapshot, 
													COUNT(*) OVER (PARTITION BY t.session_id, t.request_id) AS num_tasks,
													t.task_address,
													t.task_state,
													CASE
														WHEN
															t.task_state = ''RUNNABLE''
															AND w.runnable_time > 0 THEN
																w.runnable_time
														ELSE
															NULL
													END AS runnable_time
												FROM sys.dm_os_tasks AS t
												CROSS APPLY
												(
													SELECT TOP(1)
														sp2.session_id
													FROM @sessions AS sp2
													WHERE
														sp2.session_id = t.session_id
														AND sp2.request_id = t.request_id
														AND sp2.status <> ''sleeping''
												) AS sp20
												LEFT OUTER HASH JOIN
												( 
												' +
													CASE
														WHEN @sys_info = 1 THEN
															'SELECT TOP(@i)
																(
																	SELECT TOP(@i)
																		ms_ticks
																	FROM sys.dm_os_sys_info
																) -
																	w0.wait_resumed_ms_ticks AS runnable_time,
																w0.worker_address,
																w0.thread_address,
																w0.task_bound_ms_ticks
															FROM sys.dm_os_workers AS w0
															WHERE
																w0.state = ''RUNNABLE''
																OR @first_collection_ms_ticks >= w0.task_bound_ms_ticks'
														ELSE
															'SELECT
																CONVERT(BIGINT, NULL) AS runnable_time,
																CONVERT(VARBINARY(8), NULL) AS worker_address,
																CONVERT(VARBINARY(8), NULL) AS thread_address,
																CONVERT(BIGINT, NULL) AS task_bound_ms_ticks
															WHERE
																1 = 0'
														END +
												'
												) AS w ON
													w.worker_address = t.worker_address 
												' +
												CASE
													WHEN
														@output_column_list LIKE '%|[CPU_delta|]%' ESCAPE '|'
														AND @sys_info = 1
														THEN
															'LEFT OUTER HASH JOIN sys.dm_os_threads AS tr ON
																tr.thread_address = w.thread_address
																AND @first_collection_ms_ticks >= w.task_bound_ms_ticks
															'
													ELSE
														''
												END +
											') AS task_info
											LEFT OUTER HASH JOIN
											(
												SELECT TOP(@i)
													wt1.wait_type,
													wt1.waiting_task_address,
													MAX(wt1.wait_duration_ms) AS wait_duration_ms,
													MAX(wt1.block_info) AS block_info
												FROM
												(
													SELECT DISTINCT TOP(@i)
														wt.wait_type +
															CASE
																WHEN wt.wait_type LIKE N''PAGE%LATCH_%'' THEN
																	'':'' +
																	COALESCE(DB_NAME(CONVERT(INT, LEFT(wt.resource_description, CHARINDEX(N'':'', wt.resource_description) - 1))), N''(null)'') +
																	N'':'' +
																	SUBSTRING(wt.resource_description, CHARINDEX(N'':'', wt.resource_description) + 1, LEN(wt.resource_description) - CHARINDEX(N'':'', REVERSE(wt.resource_description)) - CHARINDEX(N'':'', wt.resource_description)) +
																	N''('' +
																		CASE
																			WHEN
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) = 1 OR
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) % 8088 = 0
																					THEN 
																						N''PFS''
																			WHEN
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) = 2 OR
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) % 511232 = 0 
																					THEN 
																						N''GAM''
																			WHEN
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) = 3 OR
																				(CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) - 1) % 511232 = 0 
																					THEN 
																						N''SGAM''
																			WHEN
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) = 6 OR
																				(CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) - 6) % 511232 = 0 
																					THEN 
																						N''DCM''
																			WHEN
																				CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) = 7 OR
																				(CONVERT(INT, RIGHT(wt.resource_description, CHARINDEX(N'':'', REVERSE(wt.resource_description)) - 1)) - 7) % 511232 = 0
																					THEN 
																						N''BCM''
																			ELSE
																				N''*''
																		END +
																	N'')''
																WHEN wt.wait_type = N''CXPACKET'' THEN
																	N'':'' + SUBSTRING(wt.resource_description, CHARINDEX(N''nodeId'', wt.resource_description) + 7, 4)
																WHEN wt.wait_type LIKE N''LATCH[_]%'' THEN
																	N'' ['' + LEFT(wt.resource_description, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description), 0), LEN(wt.resource_description) + 1) - 1) + N'']''
																ELSE 
																	N''''
															END COLLATE Latin1_General_Bin2 AS wait_type,
														CASE
															WHEN
															(
																wt.blocking_session_id IS NOT NULL
																AND wt.wait_type LIKE N''LCK[_]%''
															) THEN
																(
																	SELECT TOP(@i)
																		x.lock_type,
																		REPLACE
																		(
																			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
																			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
																			REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
																				DB_NAME
																				(
																					CONVERT
																					(
																						INT,
																						SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''dbid='', wt.resource_description), 0) + 5, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''dbid='', wt.resource_description) + 5), 0), LEN(wt.resource_description) + 1) - CHARINDEX(N''dbid='', wt.resource_description) - 5)
																					)
																				),
																				NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''),
																				NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''),
																				NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''),
																			NCHAR(0),
																			N''''
																		) AS database_name,
																		CASE x.lock_type
																			WHEN N''objectlock'' THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''objid='', wt.resource_description), 0) + 6, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''objid='', wt.resource_description) + 6), 0), LEN(wt.resource_description) + 1) - CHARINDEX(N''objid='', wt.resource_description) - 6)
																			ELSE
																				NULL
																		END AS object_id,
																		CASE x.lock_type
																			WHEN N''filelock'' THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''fileid='', wt.resource_description), 0) + 7, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''fileid='', wt.resource_description) + 7), 0), LEN(wt.resource_description) + 1) - CHARINDEX(N''fileid='', wt.resource_description) - 7)
																			ELSE
																				NULL
																		END AS file_id,
																		CASE
																			WHEN x.lock_type in (N''pagelock'', N''extentlock'', N''ridlock'') THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''associatedObjectId='', wt.resource_description), 0) + 19, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''associatedObjectId='', wt.resource_description) + 19), 0), LEN(wt.resource_description) + 1) - CHARINDEX(N''associatedObjectId='', wt.resource_description) - 19)
																			WHEN x.lock_type in (N''keylock'', N''hobtlock'', N''allocunitlock'') THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''hobtid='', wt.resource_description), 0) + 7, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''hobtid='', wt.resource_description) + 7), 0), LEN(wt.resource_description) + 1) - CHARINDEX(N''hobtid='', wt.resource_description) - 7)
																			ELSE
																				NULL
																		END AS hobt_id,
																		CASE x.lock_type
																			WHEN N''applicationlock'' THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''hash='', wt.resource_description), 0) + 5, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''hash='', wt.resource_description) + 5), 0), LEN(wt.resource_description) + 1) - CHARINDEX(N''hash='', wt.resource_description) - 5)
																			ELSE
																				NULL
																		END AS applock_hash,
																		CASE x.lock_type
																			WHEN N''metadatalock'' THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''subresource='', wt.resource_description), 0) + 12, COALESCE(NULLIF(CHARINDEX(N'' '', wt.resource_description, CHARINDEX(N''subresource='', wt.resource_description) + 12), 0), LEN(wt.resource_description) + 1) - CHARINDEX(N''subresource='', wt.resource_description) - 12)
																			ELSE
																				NULL
																		END AS metadata_resource,
																		CASE x.lock_type
																			WHEN N''metadatalock'' THEN
																				SUBSTRING(wt.resource_description, NULLIF(CHARINDEX(N''classid='', wt.resource_description), 0) + 8, COALESCE(NULLIF(CHARINDEX(N'' dbid='', wt.resource_description) - CHARINDEX(N''classid='', wt.resource_description), 0), LEN(wt.resource_description) + 1) - 8)
																			ELSE
																				NULL
																		END AS metadata_class_id
																	FROM
																	(
																		SELECT TOP(1)
																			LEFT(wt.resource_description, CHARINDEX(N'' '', wt.resource_description) - 1) COLLATE Latin1_General_Bin2 AS lock_type
																	) AS x
																	FOR XML
																		PATH('''')
																)
															ELSE NULL
														END AS block_info,
														wt.wait_duration_ms,
														wt.waiting_task_address
													FROM
													(
														SELECT TOP(@i)
															wt0.wait_type COLLATE Latin1_General_Bin2 AS wait_type,
															wt0.resource_description COLLATE Latin1_General_Bin2 AS resource_description,
															wt0.wait_duration_ms,
															wt0.waiting_task_address,
															CASE
																WHEN wt0.blocking_session_id = p.blocked THEN
																	wt0.blocking_session_id
																ELSE
																	NULL
															END AS blocking_session_id
														FROM sys.dm_os_waiting_tasks AS wt0
														CROSS APPLY
														(
															SELECT TOP(1)
																s0.blocked
															FROM @sessions AS s0
															WHERE
																s0.session_id = wt0.session_id
																AND COALESCE(s0.wait_type, N'''') <> N''OLEDB''
																AND wt0.wait_type <> N''OLEDB''
														) AS p
													) AS wt
												) AS wt1
												GROUP BY
													wt1.wait_type,
													wt1.waiting_task_address
											) AS wt2 ON
												wt2.waiting_task_address = task_info.task_address
												AND wt2.wait_duration_ms > 0
												AND task_info.runnable_time IS NULL
											GROUP BY
												task_info.session_id,
												task_info.request_id,
												task_info.physical_io,
												task_info.context_switches,
												task_info.thread_CPU_snapshot,
												task_info.num_tasks,
												CASE
													WHEN task_info.runnable_time IS NOT NULL THEN
														''RUNNABLE''
													ELSE
														wt2.wait_type
												END
										) AS w1
									) AS waits
									ORDER BY
										waits.session_id,
										waits.request_id,
										waits.r
									FOR XML
										PATH(N''tasks''),
										TYPE
								) AS tasks_raw (task_xml_raw)
							) AS tasks_final
							CROSS APPLY tasks_final.task_xml.nodes(N''/tasks'') AS task_nodes (task_node)
							WHERE
								task_nodes.task_node.exist(N''session_id'') = 1
						) AS tasks ON
							tasks.session_id = y.session_id
							AND tasks.request_id = y.request_id 
						'
					ELSE
						''
				END +
				'LEFT OUTER HASH JOIN
				(
					SELECT TOP(@i)
						t_info.session_id,
						COALESCE(t_info.request_id, -1) AS request_id,
						SUM(t_info.tempdb_allocations) AS tempdb_allocations,
						SUM(t_info.tempdb_current) AS tempdb_current
					FROM
					(
						SELECT TOP(@i)
							tsu.session_id,
							tsu.request_id,
							tsu.user_objects_alloc_page_count +
								tsu.internal_objects_alloc_page_count AS tempdb_allocations,
							tsu.user_objects_alloc_page_count +
								tsu.internal_objects_alloc_page_count -
								tsu.user_objects_dealloc_page_count -
								tsu.internal_objects_dealloc_page_count AS tempdb_current
						FROM sys.dm_db_task_space_usage AS tsu
						CROSS APPLY
						(
							SELECT TOP(1)
								s0.session_id
							FROM @sessions AS s0
							WHERE
								s0.session_id = tsu.session_id
						) AS p

						UNION ALL

						SELECT TOP(@i)
							ssu.session_id,
							NULL AS request_id,
							ssu.user_objects_alloc_page_count +
								ssu.internal_objects_alloc_page_count AS tempdb_allocations,
							ssu.user_objects_alloc_page_count +
								ssu.internal_objects_alloc_page_count -
								ssu.user_objects_dealloc_page_count -
								ssu.internal_objects_dealloc_page_count AS tempdb_current
						FROM sys.dm_db_session_space_usage AS ssu
						CROSS APPLY
						(
							SELECT TOP(1)
								s0.session_id
							FROM @sessions AS s0
							WHERE
								s0.session_id = ssu.session_id
						) AS p
					) AS t_info
					GROUP BY
						t_info.session_id,
						COALESCE(t_info.request_id, -1)
				) AS tempdb_info ON
					tempdb_info.session_id = y.session_id
					AND tempdb_info.request_id =
						CASE
							WHEN y.status = N''sleeping'' THEN
								-1
							ELSE
								y.request_id
						END
				' +
				CASE 
					WHEN 
						NOT 
						(
							@get_avg_time = 1 
							AND @recursion = 1
						) THEN 
							''
					ELSE
						'LEFT OUTER HASH JOIN
						(
							SELECT TOP(@i)
								*
							FROM sys.dm_exec_query_stats
						) AS qs ON
							qs.sql_handle = y.sql_handle
							AND qs.plan_handle = y.plan_handle
							AND qs.statement_start_offset = y.statement_start_offset
							AND qs.statement_end_offset = y.statement_end_offset
						'
				END + 
			') AS x
			OPTION (KEEPFIXED PLAN, OPTIMIZE FOR (@i = 1)); ';

		SET @sql_n = CONVERT(NVARCHAR(MAX), @sql);

		SET @last_collection_start = GETDATE();

		IF 
			@recursion = -1
			AND @sys_info = 1
		BEGIN;
			SELECT
				@first_collection_ms_ticks = ms_ticks
			FROM sys.dm_os_sys_info;
		END;

		INSERT #sessions
		(
			recursion,
			session_id,
			request_id,
			session_number,
			elapsed_time,
			avg_elapsed_time,
			physical_io,
			reads,
			physical_reads,
			writes,
			tempdb_allocations,
			tempdb_current,
			CPU,
			thread_CPU_snapshot,
			context_switches,
			used_memory,
			tasks,
			status,
			wait_info,
			transaction_id,
			open_tran_count,
			sql_handle,
			statement_start_offset,
			statement_end_offset,		
			sql_text,
			plan_handle,
			blocking_session_id,
			percent_complete,
			host_name,
			login_name,
			database_name,
			program_name,
			additional_info,
			start_time,
			login_time,
			last_request_start_time
		)
		EXEC sp_executesql 
			@sql_n,
			N'@recursion SMALLINT, @filter sysname, @not_filter sysname, @first_collection_ms_ticks BIGINT',
			@recursion, @filter, @not_filter, @first_collection_ms_ticks;

		--Collect transaction information?
		IF
			@recursion = 1
			AND
			(
				@output_column_list LIKE '%|[tran_start_time|]%' ESCAPE '|'
				OR @output_column_list LIKE '%|[tran_log_writes|]%' ESCAPE '|' 
			)
		BEGIN;	
			DECLARE @i INT;
			SET @i = 2147483647;

			UPDATE s
			SET
				tran_start_time =
					CONVERT
					(
						DATETIME,
						LEFT
						(
							x.trans_info,
							NULLIF(CHARINDEX(NCHAR(254) COLLATE Latin1_General_Bin2, x.trans_info) - 1, -1)
						),
						121
					),
				tran_log_writes =
					RIGHT
					(
						x.trans_info,
						LEN(x.trans_info) - CHARINDEX(NCHAR(254) COLLATE Latin1_General_Bin2, x.trans_info)
					)
			FROM
			(
				SELECT TOP(@i)
					trans_nodes.trans_node.value('(session_id/text())[1]', 'SMALLINT') AS session_id,
					COALESCE(trans_nodes.trans_node.value('(request_id/text())[1]', 'INT'), 0) AS request_id,
					trans_nodes.trans_node.value('(trans_info/text())[1]', 'NVARCHAR(4000)') AS trans_info				
				FROM
				(
					SELECT TOP(@i)
						CONVERT
						(
							XML,
							REPLACE
							(
								CONVERT(NVARCHAR(MAX), trans_raw.trans_xml_raw) COLLATE Latin1_General_Bin2, 
								N'</trans_info></trans><trans><trans_info>', N''
							)
						)
					FROM
					(
						SELECT TOP(@i)
							CASE u_trans.r
								WHEN 1 THEN u_trans.session_id
								ELSE NULL
							END AS [session_id],
							CASE u_trans.r
								WHEN 1 THEN u_trans.request_id
								ELSE NULL
							END AS [request_id],
							CONVERT
							(
								NVARCHAR(MAX),
								CASE
									WHEN u_trans.database_id IS NOT NULL THEN
										CASE u_trans.r
											WHEN 1 THEN COALESCE(CONVERT(NVARCHAR, u_trans.transaction_start_time, 121) + NCHAR(254), N'')
											ELSE N''
										END + 
											REPLACE
											(
												REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
												REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
												REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
													CONVERT(VARCHAR(128), COALESCE(DB_NAME(u_trans.database_id), N'(null)')),
													NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
													NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
													NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
												NCHAR(0),
												N'?'
											) +
											N': ' +
										CONVERT(NVARCHAR, u_trans.log_record_count) + N' (' + CONVERT(NVARCHAR, u_trans.log_kb_used) + N' kB)' +
										N','
									ELSE
										N'N/A,'
								END COLLATE Latin1_General_Bin2
							) AS [trans_info]
						FROM
						(
							SELECT TOP(@i)
								trans.*,
								ROW_NUMBER() OVER
								(
									PARTITION BY
										trans.session_id,
										trans.request_id
									ORDER BY
										trans.transaction_start_time DESC
								) AS r
							FROM
							(
								SELECT TOP(@i)
									session_tran_map.session_id,
									session_tran_map.request_id,
									s_tran.database_id,
									COALESCE(SUM(s_tran.database_transaction_log_record_count), 0) AS log_record_count,
									COALESCE(SUM(s_tran.database_transaction_log_bytes_used), 0) / 1024 AS log_kb_used,
									MIN(s_tran.database_transaction_begin_time) AS transaction_start_time
								FROM
								(
									SELECT TOP(@i)
										*
									FROM sys.dm_tran_active_transactions
									WHERE
										transaction_begin_time <= @last_collection_start
								) AS a_tran
								INNER HASH JOIN
								(
									SELECT TOP(@i)
										*
									FROM sys.dm_tran_database_transactions
									WHERE
										database_id < 32767
								) AS s_tran ON
									s_tran.transaction_id = a_tran.transaction_id
								LEFT OUTER HASH JOIN
								(
									SELECT TOP(@i)
										*
									FROM sys.dm_tran_session_transactions
								) AS tst ON
									s_tran.transaction_id = tst.transaction_id
								CROSS APPLY
								(
									SELECT TOP(1)
										s3.session_id,
										s3.request_id
									FROM
									(
										SELECT TOP(1)
											s1.session_id,
											s1.request_id
										FROM #sessions AS s1
										WHERE
											s1.transaction_id = s_tran.transaction_id
											AND s1.recursion = 1
											
										UNION ALL
									
										SELECT TOP(1)
											s2.session_id,
											s2.request_id
										FROM #sessions AS s2
										WHERE
											s2.session_id = tst.session_id
											AND s2.recursion = 1
									) AS s3
									ORDER BY
										s3.request_id
								) AS session_tran_map
								GROUP BY
									session_tran_map.session_id,
									session_tran_map.request_id,
									s_tran.database_id
							) AS trans
						) AS u_trans
						FOR XML
							PATH('trans'),
							TYPE
					) AS trans_raw (trans_xml_raw)
				) AS trans_final (trans_xml)
				CROSS APPLY trans_final.trans_xml.nodes('/trans') AS trans_nodes (trans_node)
			) AS x
			INNER HASH JOIN #sessions AS s ON
				s.session_id = x.session_id
				AND s.request_id = x.request_id
			OPTION (OPTIMIZE FOR (@i = 1));
		END;

		--Variables for text and plan collection
		DECLARE	
			@session_id SMALLINT,
			@request_id INT,
			@sql_handle VARBINARY(64),
			@plan_handle VARBINARY(64),
			@statement_start_offset INT,
			@statement_end_offset INT,
			@start_time DATETIME,
			@database_name sysname;

		IF 
			@recursion = 1
			AND @output_column_list LIKE '%|[sql_text|]%' ESCAPE '|'
		BEGIN;
			DECLARE sql_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR 
				SELECT 
					session_id,
					request_id,
					sql_handle,
					statement_start_offset,
					statement_end_offset
				FROM #sessions
				WHERE
					recursion = 1
					AND sql_handle IS NOT NULL
			OPTION (KEEPFIXED PLAN);

			OPEN sql_cursor;

			FETCH NEXT FROM sql_cursor
			INTO 
				@session_id,
				@request_id,
				@sql_handle,
				@statement_start_offset,
				@statement_end_offset;

			--Wait up to 5 ms for the SQL text, then give up
			SET LOCK_TIMEOUT 5;

			WHILE @@FETCH_STATUS = 0
			BEGIN;
				BEGIN TRY;
					UPDATE s
					SET
						s.sql_text =
						(
							SELECT
								REPLACE
								(
									REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
										N'--' + NCHAR(13) + NCHAR(10) +
										CASE 
											WHEN @get_full_inner_text = 1 THEN est.text
											WHEN LEN(est.text) < (@statement_end_offset / 2) + 1 THEN est.text
											WHEN SUBSTRING(est.text, (@statement_start_offset/2), 2) LIKE N'[a-zA-Z0-9][a-zA-Z0-9]' THEN est.text
											ELSE
												CASE
													WHEN @statement_start_offset > 0 THEN
														SUBSTRING
														(
															est.text,
															((@statement_start_offset/2) + 1),
															(
																CASE
																	WHEN @statement_end_offset = -1 THEN 2147483647
																	ELSE ((@statement_end_offset - @statement_start_offset)/2) + 1
																END
															)
														)
													ELSE RTRIM(LTRIM(est.text))
												END
										END +
										NCHAR(13) + NCHAR(10) + N'--' COLLATE Latin1_General_Bin2,
										NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
										NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
										NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
									NCHAR(0),
									N''
								) AS [processing-instruction(query)]
							FOR XML
								PATH(''),
								TYPE
						),
						s.statement_start_offset = 
							CASE 
								WHEN LEN(est.text) < (@statement_end_offset / 2) + 1 THEN 0
								WHEN SUBSTRING(CONVERT(VARCHAR(MAX), est.text), (@statement_start_offset/2), 2) LIKE '[a-zA-Z0-9][a-zA-Z0-9]' THEN 0
								ELSE @statement_start_offset
							END,
						s.statement_end_offset = 
							CASE 
								WHEN LEN(est.text) < (@statement_end_offset / 2) + 1 THEN -1
								WHEN SUBSTRING(CONVERT(VARCHAR(MAX), est.text), (@statement_start_offset/2), 2) LIKE '[a-zA-Z0-9][a-zA-Z0-9]' THEN -1
								ELSE @statement_end_offset
							END
					FROM 
						#sessions AS s,
						(
							SELECT TOP(1)
								text
							FROM
							(
								SELECT 
									text, 
									0 AS row_num
								FROM sys.dm_exec_sql_text(@sql_handle)
								
								UNION ALL
								
								SELECT 
									NULL,
									1 AS row_num
							) AS est0
							ORDER BY
								row_num
						) AS est
					WHERE 
						s.session_id = @session_id
						AND s.request_id = @request_id
						AND s.recursion = 1
					OPTION (KEEPFIXED PLAN);
				END TRY
				BEGIN CATCH;
					UPDATE s
					SET
						s.sql_text = 
							CASE ERROR_NUMBER() 
								WHEN 1222 THEN '<timeout_exceeded />'
								ELSE '<error message="' + ERROR_MESSAGE() + '" />'
							END
					FROM #sessions AS s
					WHERE 
						s.session_id = @session_id
						AND s.request_id = @request_id
						AND s.recursion = 1
					OPTION (KEEPFIXED PLAN);
				END CATCH;

				FETCH NEXT FROM sql_cursor
				INTO
					@session_id,
					@request_id,
					@sql_handle,
					@statement_start_offset,
					@statement_end_offset;
			END;

			--Return this to the default
			SET LOCK_TIMEOUT -1;

			CLOSE sql_cursor;
			DEALLOCATE sql_cursor;
		END;

		IF 
			@get_outer_command = 1 
			AND @recursion = 1
			AND @output_column_list LIKE '%|[sql_command|]%' ESCAPE '|'
		BEGIN;
			DECLARE @buffer_results TABLE
			(
				EventType VARCHAR(30),
				Parameters INT,
				EventInfo NVARCHAR(4000),
				start_time DATETIME,
				session_number INT IDENTITY(1,1) NOT NULL PRIMARY KEY
			);

			DECLARE buffer_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR 
				SELECT 
					session_id,
					MAX(start_time) AS start_time
				FROM #sessions
				WHERE
					recursion = 1
				GROUP BY
					session_id
				ORDER BY
					session_id
				OPTION (KEEPFIXED PLAN);

			OPEN buffer_cursor;

			FETCH NEXT FROM buffer_cursor
			INTO 
				@session_id,
				@start_time;

			WHILE @@FETCH_STATUS = 0
			BEGIN;
				BEGIN TRY;
					--In SQL Server 2008, DBCC INPUTBUFFER will throw 
					--an exception if the session no longer exists
					INSERT @buffer_results
					(
						EventType,
						Parameters,
						EventInfo
					)
					EXEC sp_executesql
						N'DBCC INPUTBUFFER(@session_id) WITH NO_INFOMSGS;',
						N'@session_id SMALLINT',
						@session_id;

					UPDATE br
					SET
						br.start_time = @start_time
					FROM @buffer_results AS br
					WHERE
						br.session_number = 
						(
							SELECT MAX(br2.session_number)
							FROM @buffer_results br2
						);
				END TRY
				BEGIN CATCH
				END CATCH;

				FETCH NEXT FROM buffer_cursor
				INTO 
					@session_id,
					@start_time;
			END;

			UPDATE s
			SET
				sql_command = 
				(
					SELECT 
						REPLACE
						(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								CONVERT
								(
									NVARCHAR(MAX),
									N'--' + NCHAR(13) + NCHAR(10) + br.EventInfo + NCHAR(13) + NCHAR(10) + N'--' COLLATE Latin1_General_Bin2
								),
								NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
								NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
								NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
							NCHAR(0),
							N''
						) AS [processing-instruction(query)]
					FROM @buffer_results AS br
					WHERE 
						br.session_number = s.session_number
						AND br.start_time = s.start_time
						AND 
						(
							(
								s.start_time = s.last_request_start_time
								AND EXISTS
								(
									SELECT *
									FROM sys.dm_exec_requests r2
									WHERE
										r2.session_id = s.session_id
										AND r2.request_id = s.request_id
										AND r2.start_time = s.start_time
								)
							)
							OR 
							(
								s.request_id = 0
								AND EXISTS
								(
									SELECT *
									FROM sys.dm_exec_sessions s2
									WHERE
										s2.session_id = s.session_id
										AND s2.last_request_start_time = s.last_request_start_time
								)
							)
						)
					FOR XML
						PATH(''),
						TYPE
				)
			FROM #sessions AS s
			WHERE
				recursion = 1
			OPTION (KEEPFIXED PLAN);

			CLOSE buffer_cursor;
			DEALLOCATE buffer_cursor;
		END;

		IF 
			@get_plans >= 1 
			AND @recursion = 1
			AND @output_column_list LIKE '%|[query_plan|]%' ESCAPE '|'
		BEGIN;
			DECLARE @live_plan BIT;
			SET @live_plan = ISNULL(CONVERT(BIT, SIGN(OBJECT_ID('sys.dm_exec_query_statistics_xml'))), 0)

			DECLARE plan_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR 
				SELECT
					session_id,
					request_id,
					plan_handle,
					statement_start_offset,
					statement_end_offset
				FROM #sessions
				WHERE
					recursion = 1
					AND plan_handle IS NOT NULL
			OPTION (KEEPFIXED PLAN);

			OPEN plan_cursor;

			FETCH NEXT FROM plan_cursor
			INTO 
				@session_id,
				@request_id,
				@plan_handle,
				@statement_start_offset,
				@statement_end_offset;

			--Wait up to 5 ms for a query plan, then give up
			SET LOCK_TIMEOUT 5;

			WHILE @@FETCH_STATUS = 0
			BEGIN;
				DECLARE @query_plan XML;
				SET @query_plan = NULL;

				IF @live_plan = 1
				BEGIN;
					BEGIN TRY;
						SELECT
							@query_plan = x.query_plan
						FROM sys.dm_exec_query_statistics_xml(@session_id) AS x;

						IF 
							@query_plan IS NOT NULL
							AND EXISTS
							(
								SELECT
									*
								FROM sys.dm_exec_requests AS r
								WHERE
									r.session_id = @session_id
									AND r.request_id = @request_id
									AND r.plan_handle = @plan_handle
									AND r.statement_start_offset = @statement_start_offset
									AND r.statement_end_offset = @statement_end_offset
							)
						BEGIN;
							UPDATE s
							SET
								s.query_plan = @query_plan
							FROM #sessions AS s
							WHERE 
								s.session_id = @session_id
								AND s.request_id = @request_id
								AND s.recursion = 1
							OPTION (KEEPFIXED PLAN);
						END;
					END TRY
					BEGIN CATCH;
						SET @query_plan = NULL;
					END CATCH;
				END;

				IF @query_plan IS NULL
				BEGIN;
					BEGIN TRY;
						UPDATE s
						SET
							s.query_plan =
							(
								SELECT
									CONVERT(xml, query_plan)
								FROM sys.dm_exec_text_query_plan
								(
									@plan_handle, 
									CASE @get_plans
										WHEN 1 THEN
											@statement_start_offset
										ELSE
											0
									END, 
									CASE @get_plans
										WHEN 1 THEN
											@statement_end_offset
										ELSE
											-1
									END
								)
							)
						FROM #sessions AS s
						WHERE 
							s.session_id = @session_id
							AND s.request_id = @request_id
							AND s.recursion = 1
						OPTION (KEEPFIXED PLAN);
					END TRY
					BEGIN CATCH;
						IF ERROR_NUMBER() = 6335
						BEGIN;
							UPDATE s
							SET
								s.query_plan =
								(
									SELECT
										N'--' + NCHAR(13) + NCHAR(10) + 
										N'-- Could not render showplan due to XML data type limitations. ' + NCHAR(13) + NCHAR(10) + 
										N'-- To see the graphical plan save the XML below as a .SQLPLAN file and re-open in SSMS.' + NCHAR(13) + NCHAR(10) +
										N'--' + NCHAR(13) + NCHAR(10) +
											REPLACE(qp.query_plan, N'<RelOp', NCHAR(13)+NCHAR(10)+N'<RelOp') + 
											NCHAR(13) + NCHAR(10) + N'--' COLLATE Latin1_General_Bin2 AS [processing-instruction(query_plan)]
									FROM sys.dm_exec_text_query_plan
									(
										@plan_handle, 
										CASE @get_plans
											WHEN 1 THEN
												@statement_start_offset
											ELSE
												0
										END, 
										CASE @get_plans
											WHEN 1 THEN
												@statement_end_offset
											ELSE
												-1
										END
									) AS qp
									FOR XML
										PATH(''),
										TYPE
								)
							FROM #sessions AS s
							WHERE 
								s.session_id = @session_id
								AND s.request_id = @request_id
								AND s.recursion = 1
							OPTION (KEEPFIXED PLAN);
						END;
						ELSE
						BEGIN;
							UPDATE s
							SET
								s.query_plan = 
									CASE ERROR_NUMBER() 
										WHEN 1222 THEN '<timeout_exceeded />'
										ELSE '<error message="' + ERROR_MESSAGE() + '" />'
									END
							FROM #sessions AS s
							WHERE 
								s.session_id = @session_id
								AND s.request_id = @request_id
								AND s.recursion = 1
							OPTION (KEEPFIXED PLAN);
						END;
					END CATCH;
				END;

				FETCH NEXT FROM plan_cursor
				INTO
					@session_id,
					@request_id,
					@plan_handle,
					@statement_start_offset,
					@statement_end_offset;
			END;

			--Return this to the default
			SET LOCK_TIMEOUT -1;

			CLOSE plan_cursor;
			DEALLOCATE plan_cursor;
		END;

		IF 
			@get_locks = 1 
			AND @recursion = 1
			AND @output_column_list LIKE '%|[locks|]%' ESCAPE '|'
		BEGIN;
			DECLARE locks_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR 
				SELECT DISTINCT
					database_name
				FROM #locks
				WHERE
					EXISTS
					(
						SELECT *
						FROM #sessions AS s
						WHERE
							s.session_id = #locks.session_id
							AND recursion = 1
					)
					AND database_name <> '(null)'
				OPTION (KEEPFIXED PLAN);

			OPEN locks_cursor;

			FETCH NEXT FROM locks_cursor
			INTO 
				@database_name;

			WHILE @@FETCH_STATUS = 0
			BEGIN;
				BEGIN TRY;
					SET @sql_n = CONVERT(NVARCHAR(MAX), '') +
						'UPDATE l ' +
						'SET ' +
							'object_name = ' +
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										'o.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								'), ' +
							'index_name = ' +
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										'i.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								'), ' +
							'schema_name = ' +
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										's.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								'), ' +
							'principal_name = ' + 
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										'dp.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								') ' +
						'FROM #locks AS l ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.allocation_units AS au ON ' +
							'au.allocation_unit_id = l.allocation_unit_id ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.partitions AS p ON ' +
							'p.hobt_id = ' +
								'COALESCE ' +
								'( ' +
									'l.hobt_id, ' +
									'CASE ' +
										'WHEN au.type IN (1, 3) THEN au.container_id ' +
										'ELSE NULL ' +
									'END ' +
								') ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.partitions AS p1 ON ' +
							'l.hobt_id IS NULL ' +
							'AND au.type = 2 ' +
							'AND p1.partition_id = au.container_id ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.objects AS o ON ' +
							'o.object_id = COALESCE(l.object_id, p.object_id, p1.object_id) ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.indexes AS i ON ' +
							'i.object_id = COALESCE(l.object_id, p.object_id, p1.object_id) ' +
							'AND i.index_id = COALESCE(l.index_id, p.index_id, p1.index_id) ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.schemas AS s ON ' +
							's.schema_id = COALESCE(l.schema_id, o.schema_id) ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.database_principals AS dp ON ' +
							'dp.principal_id = l.principal_id ' +
						'WHERE ' +
							'l.database_name = @database_name ' +
						'OPTION (KEEPFIXED PLAN); ';
					
					EXEC sp_executesql
						@sql_n,
						N'@database_name sysname',
						@database_name;
				END TRY
				BEGIN CATCH;
					UPDATE #locks
					SET
						query_error = 
							REPLACE
							(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									CONVERT
									(
										NVARCHAR(MAX), 
										ERROR_MESSAGE() COLLATE Latin1_General_Bin2
									),
									NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
									NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
									NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
								NCHAR(0),
								N''
							)
					WHERE 
						database_name = @database_name
					OPTION (KEEPFIXED PLAN);
				END CATCH;

				FETCH NEXT FROM locks_cursor
				INTO
					@database_name;
			END;

			CLOSE locks_cursor;
			DEALLOCATE locks_cursor;

			CREATE CLUSTERED INDEX IX_SRD ON #locks (session_id, request_id, database_name);

			UPDATE s
			SET 
				s.locks =
				(
					SELECT 
						REPLACE
						(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
							REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								CONVERT
								(
									NVARCHAR(MAX), 
									l1.database_name COLLATE Latin1_General_Bin2
								),
								NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
								NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
								NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
							NCHAR(0),
							N''
						) AS [Database/@name],
						MIN(l1.query_error) AS [Database/@query_error],
						(
							SELECT 
								l2.request_mode AS [Lock/@request_mode],
								l2.request_status AS [Lock/@request_status],
								COUNT(*) AS [Lock/@request_count]
							FROM #locks AS l2
							WHERE 
								l1.session_id = l2.session_id
								AND l1.request_id = l2.request_id
								AND l2.database_name = l1.database_name
								AND l2.resource_type = 'DATABASE'
							GROUP BY
								l2.request_mode,
								l2.request_status
							FOR XML
								PATH(''),
								TYPE
						) AS [Database/Locks],
						(
							SELECT
								COALESCE(l3.object_name, '(null)') AS [Object/@name],
								l3.schema_name AS [Object/@schema_name],
								(
									SELECT
										l4.resource_type AS [Lock/@resource_type],
										l4.page_type AS [Lock/@page_type],
										l4.index_name AS [Lock/@index_name],
										CASE 
											WHEN l4.object_name IS NULL THEN l4.schema_name
											ELSE NULL
										END AS [Lock/@schema_name],
										l4.principal_name AS [Lock/@principal_name],
										l4.resource_description AS [Lock/@resource_description],
										l4.request_mode AS [Lock/@request_mode],
										l4.request_status AS [Lock/@request_status],
										SUM(l4.request_count) AS [Lock/@request_count]
									FROM #locks AS l4
									WHERE 
										l4.session_id = l3.session_id
										AND l4.request_id = l3.request_id
										AND l3.database_name = l4.database_name
										AND COALESCE(l3.object_name, '(null)') = COALESCE(l4.object_name, '(null)')
										AND COALESCE(l3.schema_name, '') = COALESCE(l4.schema_name, '')
										AND l4.resource_type <> 'DATABASE'
									GROUP BY
										l4.resource_type,
										l4.page_type,
										l4.index_name,
										CASE 
											WHEN l4.object_name IS NULL THEN l4.schema_name
											ELSE NULL
										END,
										l4.principal_name,
										l4.resource_description,
										l4.request_mode,
										l4.request_status
									FOR XML
										PATH(''),
										TYPE
								) AS [Object/Locks]
							FROM #locks AS l3
							WHERE 
								l3.session_id = l1.session_id
								AND l3.request_id = l1.request_id
								AND l3.database_name = l1.database_name
								AND l3.resource_type <> 'DATABASE'
							GROUP BY 
								l3.session_id,
								l3.request_id,
								l3.database_name,
								COALESCE(l3.object_name, '(null)'),
								l3.schema_name
							FOR XML
								PATH(''),
								TYPE
						) AS [Database/Objects]
					FROM #locks AS l1
					WHERE
						l1.session_id = s.session_id
						AND l1.request_id = s.request_id
						AND l1.start_time IN (s.start_time, s.last_request_start_time)
						AND s.recursion = 1
					GROUP BY 
						l1.session_id,
						l1.request_id,
						l1.database_name
					FOR XML
						PATH(''),
						TYPE
				)
			FROM #sessions s
			OPTION (KEEPFIXED PLAN);
		END;

		IF 
			@find_block_leaders = 1
			AND @recursion = 1
			AND @output_column_list LIKE '%|[blocked_session_count|]%' ESCAPE '|'
		BEGIN;
			WITH
			blockers AS
			(
				SELECT
					session_id,
					session_id AS top_level_session_id,
					CONVERT(VARCHAR(8000), '.' + CONVERT(VARCHAR(8000), session_id) + '.') AS the_path
				FROM #sessions
				WHERE
					recursion = 1

				UNION ALL

				SELECT
					s.session_id,
					b.top_level_session_id,
					CONVERT(VARCHAR(8000), b.the_path + CONVERT(VARCHAR(8000), s.session_id) + '.') AS the_path
				FROM blockers AS b
				JOIN #sessions AS s ON
					s.blocking_session_id = b.session_id
					AND s.recursion = 1
					AND b.the_path NOT LIKE '%.' + CONVERT(VARCHAR(8000), s.session_id) + '.%' COLLATE Latin1_General_Bin2
			)
			UPDATE s
			SET
				s.blocked_session_count = x.blocked_session_count
			FROM #sessions AS s
			JOIN
			(
				SELECT
					b.top_level_session_id AS session_id,
					COUNT(*) - 1 AS blocked_session_count
				FROM blockers AS b
				GROUP BY
					b.top_level_session_id
			) x ON
				s.session_id = x.session_id
			WHERE
				s.recursion = 1;
		END;

		IF
			@get_task_info = 2
			AND @output_column_list LIKE '%|[additional_info|]%' ESCAPE '|'
			AND @recursion = 1
		BEGIN;
			CREATE TABLE #blocked_requests
			(
				session_id SMALLINT NOT NULL,
				request_id INT NOT NULL,
				database_name sysname NOT NULL,
				object_id INT,
				hobt_id BIGINT,
				schema_id INT,
				schema_name sysname NULL,
				object_name sysname NULL,
				query_error NVARCHAR(2048),
				PRIMARY KEY (database_name, session_id, request_id)
			);

			CREATE STATISTICS s_database_name ON #blocked_requests (database_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_schema_name ON #blocked_requests (schema_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_object_name ON #blocked_requests (object_name)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
			CREATE STATISTICS s_query_error ON #blocked_requests (query_error)
			WITH SAMPLE 0 ROWS, NORECOMPUTE;
		
			INSERT #blocked_requests
			(
				session_id,
				request_id,
				database_name,
				object_id,
				hobt_id,
				schema_id
			)
			SELECT
				session_id,
				request_id,
				database_name,
				object_id,
				hobt_id,
				CONVERT(INT, SUBSTRING(schema_node, CHARINDEX(' = ', schema_node) + 3, LEN(schema_node))) AS schema_id
			FROM
			(
				SELECT
					session_id,
					request_id,
					agent_nodes.agent_node.value('(database_name/text())[1]', 'sysname') AS database_name,
					agent_nodes.agent_node.value('(object_id/text())[1]', 'int') AS object_id,
					agent_nodes.agent_node.value('(hobt_id/text())[1]', 'bigint') AS hobt_id,
					agent_nodes.agent_node.value('(metadata_resource/text()[.="SCHEMA"]/../../metadata_class_id/text())[1]', 'varchar(100)') AS schema_node
				FROM #sessions AS s
				CROSS APPLY s.additional_info.nodes('//block_info') AS agent_nodes (agent_node)
				WHERE
					s.recursion = 1
			) AS t
			WHERE
				t.database_name IS NOT NULL
				AND
				(
					t.object_id IS NOT NULL
					OR t.hobt_id IS NOT NULL
					OR t.schema_node IS NOT NULL
				);
			
			DECLARE blocks_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR
				SELECT DISTINCT
					database_name
				FROM #blocked_requests;
				
			OPEN blocks_cursor;
			
			FETCH NEXT FROM blocks_cursor
			INTO 
				@database_name;
			
			WHILE @@FETCH_STATUS = 0
			BEGIN;
				BEGIN TRY;
					SET @sql_n = 
						CONVERT(NVARCHAR(MAX), '') +
						'UPDATE b ' +
						'SET ' +
							'b.schema_name = ' +
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										's.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								'), ' +
							'b.object_name = ' +
								'REPLACE ' +
								'( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
									'REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE( ' +
										'o.name COLLATE Latin1_General_Bin2, ' +
										'NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''), ' +
										'NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''), ' +
										'NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''), ' +
									'NCHAR(0), ' +
									N''''' ' +
								') ' +
						'FROM #blocked_requests AS b ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.partitions AS p ON ' +
							'p.hobt_id = b.hobt_id ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.objects AS o ON ' +
							'o.object_id = COALESCE(p.object_id, b.object_id) ' +
						'LEFT OUTER JOIN ' + QUOTENAME(@database_name) + '.sys.schemas AS s ON ' +
							's.schema_id = COALESCE(o.schema_id, b.schema_id) ' +
						'WHERE ' +
							'b.database_name = @database_name; ';
					
					EXEC sp_executesql
						@sql_n,
						N'@database_name sysname',
						@database_name;
				END TRY
				BEGIN CATCH;
					UPDATE #blocked_requests
					SET
						query_error = 
							REPLACE
							(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									CONVERT
									(
										NVARCHAR(MAX), 
										ERROR_MESSAGE() COLLATE Latin1_General_Bin2
									),
									NCHAR(31),N'?'),NCHAR(30),N'?'),NCHAR(29),N'?'),NCHAR(28),N'?'),NCHAR(27),N'?'),NCHAR(26),N'?'),NCHAR(25),N'?'),NCHAR(24),N'?'),NCHAR(23),N'?'),NCHAR(22),N'?'),
									NCHAR(21),N'?'),NCHAR(20),N'?'),NCHAR(19),N'?'),NCHAR(18),N'?'),NCHAR(17),N'?'),NCHAR(16),N'?'),NCHAR(15),N'?'),NCHAR(14),N'?'),NCHAR(12),N'?'),
									NCHAR(11),N'?'),NCHAR(8),N'?'),NCHAR(7),N'?'),NCHAR(6),N'?'),NCHAR(5),N'?'),NCHAR(4),N'?'),NCHAR(3),N'?'),NCHAR(2),N'?'),NCHAR(1),N'?'),
								NCHAR(0),
								N''
							)
					WHERE
						database_name = @database_name;
				END CATCH;

				FETCH NEXT FROM blocks_cursor
				INTO
					@database_name;
			END;
			
			CLOSE blocks_cursor;
			DEALLOCATE blocks_cursor;
			
			UPDATE s
			SET
				additional_info.modify
				('
					insert <schema_name>{sql:column("b.schema_name")}</schema_name>
					as last
					into (/additional_info/block_info)[1]
				')
			FROM #sessions AS s
			INNER JOIN #blocked_requests AS b ON
				b.session_id = s.session_id
				AND b.request_id = s.request_id
				AND s.recursion = 1
			WHERE
				b.schema_name IS NOT NULL;

			UPDATE s
			SET
				additional_info.modify
				('
					insert <object_name>{sql:column("b.object_name")}</object_name>
					as last
					into (/additional_info/block_info)[1]
				')
			FROM #sessions AS s
			INNER JOIN #blocked_requests AS b ON
				b.session_id = s.session_id
				AND b.request_id = s.request_id
				AND s.recursion = 1
			WHERE
				b.object_name IS NOT NULL;

			UPDATE s
			SET
				additional_info.modify
				('
					insert <query_error>{sql:column("b.query_error")}</query_error>
					as last
					into (/additional_info/block_info)[1]
				')
			FROM #sessions AS s
			INNER JOIN #blocked_requests AS b ON
				b.session_id = s.session_id
				AND b.request_id = s.request_id
				AND s.recursion = 1
			WHERE
				b.query_error IS NOT NULL;
		END;

		IF
			@output_column_list LIKE '%|[program_name|]%' ESCAPE '|'
			AND @output_column_list LIKE '%|[additional_info|]%' ESCAPE '|'
			AND @recursion = 1
			AND DB_ID('msdb') IS NOT NULL
		BEGIN;
			SET @sql_n =
				N'BEGIN TRY;
					DECLARE @job_name sysname;
					SET @job_name = NULL;
					DECLARE @step_name sysname;
					SET @step_name = NULL;

					SELECT
						@job_name = 
							REPLACE
							(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									j.name,
									NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''),
									NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''),
									NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''),
								NCHAR(0),
								N''?''
							),
						@step_name = 
							REPLACE
							(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
								REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
									s.step_name,
									NCHAR(31),N''?''),NCHAR(30),N''?''),NCHAR(29),N''?''),NCHAR(28),N''?''),NCHAR(27),N''?''),NCHAR(26),N''?''),NCHAR(25),N''?''),NCHAR(24),N''?''),NCHAR(23),N''?''),NCHAR(22),N''?''),
									NCHAR(21),N''?''),NCHAR(20),N''?''),NCHAR(19),N''?''),NCHAR(18),N''?''),NCHAR(17),N''?''),NCHAR(16),N''?''),NCHAR(15),N''?''),NCHAR(14),N''?''),NCHAR(12),N''?''),
									NCHAR(11),N''?''),NCHAR(8),N''?''),NCHAR(7),N''?''),NCHAR(6),N''?''),NCHAR(5),N''?''),NCHAR(4),N''?''),NCHAR(3),N''?''),NCHAR(2),N''?''),NCHAR(1),N''?''),
								NCHAR(0),
								N''?''
							)
					FROM msdb.dbo.sysjobs AS j
					INNER JOIN msdb.dbo.sysjobsteps AS s ON
						j.job_id = s.job_id
					WHERE
						j.job_id = @job_id
						AND s.step_id = @step_id;

					IF @job_name IS NOT NULL
					BEGIN;
						UPDATE s
						SET
							additional_info.modify
							(''
								insert text{sql:variable("@job_name")}
								into (/additional_info/agent_job_info/job_name)[1]
							'')
						FROM #sessions AS s
						WHERE 
							s.session_id = @session_id
							AND s.recursion = 1
						OPTION (KEEPFIXED PLAN);
						
						UPDATE s
						SET
							additional_info.modify
							(''
								insert text{sql:variable("@step_name")}
								into (/additional_info/agent_job_info/step_name)[1]
							'')
						FROM #sessions AS s
						WHERE 
							s.session_id = @session_id
							AND s.recursion = 1
						OPTION (KEEPFIXED PLAN);
					END;
				END TRY
				BEGIN CATCH;
					DECLARE @msdb_error_message NVARCHAR(256);
					SET @msdb_error_message = ERROR_MESSAGE();
				
					UPDATE s
					SET
						additional_info.modify
						(''
							insert <msdb_query_error>{sql:variable("@msdb_error_message")}</msdb_query_error>
							as last
							into (/additional_info/agent_job_info)[1]
						'')
					FROM #sessions AS s
					WHERE 
						s.session_id = @session_id
						AND s.recursion = 1
					OPTION (KEEPFIXED PLAN);
				END CATCH;'

			DECLARE @job_id UNIQUEIDENTIFIER;
			DECLARE @step_id INT;

			DECLARE agent_cursor
			CURSOR LOCAL FAST_FORWARD
			FOR 
				SELECT
					s.session_id,
					agent_nodes.agent_node.value('(job_id/text())[1]', 'uniqueidentifier') AS job_id,
					agent_nodes.agent_node.value('(step_id/text())[1]', 'int') AS step_id
				FROM #sessions AS s
				CROSS APPLY s.additional_info.nodes('//agent_job_info') AS agent_nodes (agent_node)
				WHERE
					s.recursion = 1
			OPTION (KEEPFIXED PLAN);
			
			OPEN agent_cursor;

			FETCH NEXT FROM agent_cursor
			INTO 
				@session_id,
				@job_id,
				@step_id;

			WHILE @@FETCH_STATUS = 0
			BEGIN;
				EXEC sp_executesql
					@sql_n,
					N'@job_id UNIQUEIDENTIFIER, @step_id INT, @session_id SMALLINT',
					@job_id, @step_id, @session_id

				FETCH NEXT FROM agent_cursor
				INTO 
					@session_id,
					@job_id,
					@step_id;
			END;

			CLOSE agent_cursor;
			DEALLOCATE agent_cursor;
		END; 
		
		IF 
			@delta_interval > 0 
			AND @recursion <> 1
		BEGIN;
			SET @recursion = 1;

			DECLARE @delay_time CHAR(12);
			SET @delay_time = CONVERT(VARCHAR, DATEADD(second, @delta_interval, 0), 114);
			WAITFOR DELAY @delay_time;

			GOTO REDO;
		END;
	END;

	SET @sql = 
		--Outer column list
		CONVERT
		(
			VARCHAR(MAX),
			CASE
				WHEN 
					@destination_table <> '' 
					AND @return_schema = 0 
						THEN 'INSERT ' + @destination_table + ' '
				ELSE ''
			END +
			'SELECT ' +
				@output_column_list + ' ' +
			CASE @return_schema
				WHEN 1 THEN 'INTO #session_schema '
				ELSE ''
			END
		--End outer column list
		) + 
		--Inner column list
		CONVERT
		(
			VARCHAR(MAX),
			'FROM ' +
			'( ' +
				'SELECT ' +
					'session_id, ' +
					--[dd hh:mm:ss.mss]
					CASE
						WHEN @format_output IN (1, 2) THEN
							'CASE ' +
								'WHEN elapsed_time < 0 THEN ' +
									'RIGHT ' +
									'( ' +
										'REPLICATE(''0'', max_elapsed_length) + CONVERT(VARCHAR, (-1 * elapsed_time) / 86400), ' +
										'max_elapsed_length ' +
									') + ' +
										'RIGHT ' +
										'( ' +
											'CONVERT(VARCHAR, DATEADD(second, (-1 * elapsed_time), 0), 120), ' +
											'9 ' +
										') + ' +
										'''.000'' ' +
								'ELSE ' +
									'RIGHT ' +
									'( ' +
										'REPLICATE(''0'', max_elapsed_length) + CONVERT(VARCHAR, elapsed_time / 86400000), ' +
										'max_elapsed_length ' +
									') + ' +
										'RIGHT ' +
										'( ' +
											'CONVERT(VARCHAR, DATEADD(second, elapsed_time / 1000, 0), 120), ' +
											'9 ' +
										') + ' +
										'''.'' + ' + 
										'RIGHT(''000'' + CONVERT(VARCHAR, elapsed_time % 1000), 3) ' +
							'END AS [dd hh:mm:ss.mss], '
						ELSE
							''
					END +
					--[dd hh:mm:ss.mss (avg)] / avg_elapsed_time
					CASE 
						WHEN  @format_output IN (1, 2) THEN 
							'RIGHT ' +
							'( ' +
								'''00'' + CONVERT(VARCHAR, avg_elapsed_time / 86400000), ' +
								'2 ' +
							') + ' +
								'RIGHT ' +
								'( ' +
									'CONVERT(VARCHAR, DATEADD(second, avg_elapsed_time / 1000, 0), 120), ' +
									'9 ' +
								') + ' +
								'''.'' + ' +
								'RIGHT(''000'' + CONVERT(VARCHAR, avg_elapsed_time % 1000), 3) AS [dd hh:mm:ss.mss (avg)], '
						ELSE
							'avg_elapsed_time, '
					END +
					--physical_io
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, physical_io))) OVER() - LEN(CONVERT(VARCHAR, physical_io))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_io), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_io), 1), 19)) AS '
						ELSE ''
					END + 'physical_io, ' +
					--reads
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, reads))) OVER() - LEN(CONVERT(VARCHAR, reads))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, reads), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, reads), 1), 19)) AS '
						ELSE ''
					END + 'reads, ' +
					--physical_reads
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, physical_reads))) OVER() - LEN(CONVERT(VARCHAR, physical_reads))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_reads), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_reads), 1), 19)) AS '
						ELSE ''
					END + 'physical_reads, ' +
					--writes
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, writes))) OVER() - LEN(CONVERT(VARCHAR, writes))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, writes), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, writes), 1), 19)) AS '
						ELSE ''
					END + 'writes, ' +
					--tempdb_allocations
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, tempdb_allocations))) OVER() - LEN(CONVERT(VARCHAR, tempdb_allocations))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_allocations), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_allocations), 1), 19)) AS '
						ELSE ''
					END + 'tempdb_allocations, ' +
					--tempdb_current
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, tempdb_current))) OVER() - LEN(CONVERT(VARCHAR, tempdb_current))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_current), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_current), 1), 19)) AS '
						ELSE ''
					END + 'tempdb_current, ' +
					--CPU
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, CPU))) OVER() - LEN(CONVERT(VARCHAR, CPU))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, CPU), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, CPU), 1), 19)) AS '
						ELSE ''
					END + 'CPU, ' +
					--context_switches
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, context_switches))) OVER() - LEN(CONVERT(VARCHAR, context_switches))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, context_switches), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, context_switches), 1), 19)) AS '
						ELSE ''
					END + 'context_switches, ' +
					--used_memory
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, used_memory))) OVER() - LEN(CONVERT(VARCHAR, used_memory))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, used_memory), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, used_memory), 1), 19)) AS '
						ELSE ''
					END + 'used_memory, ' +
					CASE
						WHEN @output_column_list LIKE '%|_delta|]%' ESCAPE '|' THEN
							--physical_io_delta			
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND physical_io_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, physical_io_delta))) OVER() - LEN(CONVERT(VARCHAR, physical_io_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_io_delta), 1), 19)) ' 
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_io_delta), 1), 19)) '
											ELSE 'physical_io_delta '
										END +
								'ELSE NULL ' +
							'END AS physical_io_delta, ' +
							--reads_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND reads_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, reads_delta))) OVER() - LEN(CONVERT(VARCHAR, reads_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, reads_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, reads_delta), 1), 19)) '
											ELSE 'reads_delta '
										END +
								'ELSE NULL ' +
							'END AS reads_delta, ' +
							--physical_reads_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND physical_reads_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, physical_reads_delta))) OVER() - LEN(CONVERT(VARCHAR, physical_reads_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_reads_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, physical_reads_delta), 1), 19)) '
											ELSE 'physical_reads_delta '
										END + 
								'ELSE NULL ' +
							'END AS physical_reads_delta, ' +
							--writes_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND writes_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, writes_delta))) OVER() - LEN(CONVERT(VARCHAR, writes_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, writes_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, writes_delta), 1), 19)) '
											ELSE 'writes_delta '
										END + 
								'ELSE NULL ' +
							'END AS writes_delta, ' +
							--tempdb_allocations_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND tempdb_allocations_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, tempdb_allocations_delta))) OVER() - LEN(CONVERT(VARCHAR, tempdb_allocations_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_allocations_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_allocations_delta), 1), 19)) '
											ELSE 'tempdb_allocations_delta '
										END + 
								'ELSE NULL ' +
							'END AS tempdb_allocations_delta, ' +
							--tempdb_current_delta
							--this is the only one that can (legitimately) go negative 
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, tempdb_current_delta))) OVER() - LEN(CONVERT(VARCHAR, tempdb_current_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_current_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tempdb_current_delta), 1), 19)) '
											ELSE 'tempdb_current_delta '
										END + 
								'ELSE NULL ' +
							'END AS tempdb_current_delta, ' +
							--CPU_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
										'THEN ' +
											'CASE ' +
												'WHEN ' +
													'thread_CPU_delta > CPU_delta ' +
													'AND thread_CPU_delta > 0 ' +
														'THEN ' +
															CASE @format_output
																WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, thread_CPU_delta + CPU_delta))) OVER() - LEN(CONVERT(VARCHAR, thread_CPU_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, thread_CPU_delta), 1), 19)) '
																WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, thread_CPU_delta), 1), 19)) '
																ELSE 'thread_CPU_delta '
															END + 
												'WHEN CPU_delta >= 0 THEN ' +
													CASE @format_output
														WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, thread_CPU_delta + CPU_delta))) OVER() - LEN(CONVERT(VARCHAR, CPU_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, CPU_delta), 1), 19)) '
														WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, CPU_delta), 1), 19)) '
														ELSE 'CPU_delta '
													END + 
												'ELSE NULL ' +
											'END ' +
								'ELSE ' +
									'NULL ' +
							'END AS CPU_delta, ' +
							--context_switches_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND context_switches_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, context_switches_delta))) OVER() - LEN(CONVERT(VARCHAR, context_switches_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, context_switches_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, context_switches_delta), 1), 19)) '
											ELSE 'context_switches_delta '
										END + 
								'ELSE NULL ' +
							'END AS context_switches_delta, ' +
							--used_memory_delta
							'CASE ' +
								'WHEN ' +
									'first_request_start_time = last_request_start_time ' + 
									'AND num_events = 2 ' +
									'AND used_memory_delta >= 0 ' +
										'THEN ' +
										CASE @format_output
											WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, used_memory_delta))) OVER() - LEN(CONVERT(VARCHAR, used_memory_delta))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, used_memory_delta), 1), 19)) '
											WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, used_memory_delta), 1), 19)) '
											ELSE 'used_memory_delta '
										END + 
								'ELSE NULL ' +
							'END AS used_memory_delta, '
						ELSE ''
					END +
					--tasks
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, tasks))) OVER() - LEN(CONVERT(VARCHAR, tasks))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tasks), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, tasks), 1), 19)) '
						ELSE ''
					END + 'tasks, ' +
					'status, ' +
					'wait_info, ' +
					'locks, ' +
					'tran_start_time, ' +
					'LEFT(tran_log_writes, LEN(tran_log_writes) - 1) AS tran_log_writes, ' +
					--open_tran_count
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, open_tran_count))) OVER() - LEN(CONVERT(VARCHAR, open_tran_count))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, open_tran_count), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, open_tran_count), 1), 19)) AS '
						ELSE ''
					END + 'open_tran_count, ' +
					--sql_command
					CASE @format_output 
						WHEN 0 THEN 'REPLACE(REPLACE(CONVERT(NVARCHAR(MAX), sql_command), ''<?query --''+CHAR(13)+CHAR(10), ''''), CHAR(13)+CHAR(10)+''--?>'', '''') AS '
						ELSE ''
					END + 'sql_command, ' +
					--sql_text
					CASE @format_output 
						WHEN 0 THEN 'REPLACE(REPLACE(CONVERT(NVARCHAR(MAX), sql_text), ''<?query --''+CHAR(13)+CHAR(10), ''''), CHAR(13)+CHAR(10)+''--?>'', '''') AS '
						ELSE ''
					END + 'sql_text, ' +
					'query_plan, ' +
					'blocking_session_id, ' +
					--blocked_session_count
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, blocked_session_count))) OVER() - LEN(CONVERT(VARCHAR, blocked_session_count))) + LEFT(CONVERT(CHAR(22), CONVERT(MONEY, blocked_session_count), 1), 19)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, LEFT(CONVERT(CHAR(22), CONVERT(MONEY, blocked_session_count), 1), 19)) AS '
						ELSE ''
					END + 'blocked_session_count, ' +
					--percent_complete
					CASE @format_output
						WHEN 1 THEN 'CONVERT(VARCHAR, SPACE(MAX(LEN(CONVERT(VARCHAR, CONVERT(MONEY, percent_complete), 2))) OVER() - LEN(CONVERT(VARCHAR, CONVERT(MONEY, percent_complete), 2))) + CONVERT(CHAR(22), CONVERT(MONEY, percent_complete), 2)) AS '
						WHEN 2 THEN 'CONVERT(VARCHAR, CONVERT(CHAR(22), CONVERT(MONEY, blocked_session_count), 1)) AS '
						ELSE ''
					END + 'percent_complete, ' +
					'host_name, ' +
					'login_name, ' +
					'database_name, ' +
					'program_name, ' +
					'additional_info, ' +
					'start_time, ' +
					'login_time, ' +
					'CASE ' +
						'WHEN status = N''sleeping'' THEN NULL ' +
						'ELSE request_id ' +
					'END AS request_id, ' +
					'GETDATE() AS collection_time '
		--End inner column list
		) +
		--Derived table and INSERT specification
		CONVERT
		(
			VARCHAR(MAX),
				'FROM ' +
				'( ' +
					'SELECT TOP(2147483647) ' +
						'*, ' +
						'CASE ' +
							'MAX ' +
							'( ' +
								'LEN ' +
								'( ' +
									'CONVERT ' +
									'( ' +
										'VARCHAR, ' +
										'CASE ' +
											'WHEN elapsed_time < 0 THEN ' +
												'(-1 * elapsed_time) / 86400 ' +
											'ELSE ' +
												'elapsed_time / 86400000 ' +
										'END ' +
									') ' +
								') ' +
							') OVER () ' +
								'WHEN 1 THEN 2 ' +
								'ELSE ' +
									'MAX ' +
									'( ' +
										'LEN ' +
										'( ' +
											'CONVERT ' +
											'( ' +
												'VARCHAR, ' +
												'CASE ' +
													'WHEN elapsed_time < 0 THEN ' +
														'(-1 * elapsed_time) / 86400 ' +
													'ELSE ' +
														'elapsed_time / 86400000 ' +
												'END ' +
											') ' +
										') ' +
									') OVER () ' +
						'END AS max_elapsed_length, ' +
						CASE
							WHEN @output_column_list LIKE '%|_delta|]%' ESCAPE '|' THEN
								'MAX(physical_io * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(physical_io * recursion) OVER (PARTITION BY session_id, request_id) AS physical_io_delta, ' +
								'MAX(reads * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(reads * recursion) OVER (PARTITION BY session_id, request_id) AS reads_delta, ' +
								'MAX(physical_reads * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(physical_reads * recursion) OVER (PARTITION BY session_id, request_id) AS physical_reads_delta, ' +
								'MAX(writes * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(writes * recursion) OVER (PARTITION BY session_id, request_id) AS writes_delta, ' +
								'MAX(tempdb_allocations * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(tempdb_allocations * recursion) OVER (PARTITION BY session_id, request_id) AS tempdb_allocations_delta, ' +
								'MAX(tempdb_current * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(tempdb_current * recursion) OVER (PARTITION BY session_id, request_id) AS tempdb_current_delta, ' +
								'MAX(CPU * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(CPU * recursion) OVER (PARTITION BY session_id, request_id) AS CPU_delta, ' +
								'MAX(thread_CPU_snapshot * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(thread_CPU_snapshot * recursion) OVER (PARTITION BY session_id, request_id) AS thread_CPU_delta, ' +
								'MAX(context_switches * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(context_switches * recursion) OVER (PARTITION BY session_id, request_id) AS context_switches_delta, ' +
								'MAX(used_memory * recursion) OVER (PARTITION BY session_id, request_id) + ' +
									'MIN(used_memory * recursion) OVER (PARTITION BY session_id, request_id) AS used_memory_delta, ' +
								'MIN(last_request_start_time) OVER (PARTITION BY session_id, request_id) AS first_request_start_time, '
							ELSE ''
						END +
						'COUNT(*) OVER (PARTITION BY session_id, request_id) AS num_events ' +
					'FROM #sessions AS s1 ' +
					CASE 
						WHEN @sort_order = '' THEN ''
						ELSE
							'ORDER BY ' +
								@sort_order
					END +
				') AS s ' +
				'WHERE ' +
					's.recursion = 1 ' +
			') x ' +
			'OPTION (KEEPFIXED PLAN); ' +
			'' +
			CASE @return_schema
				WHEN 1 THEN
					'SET @schema = ' +
						'''CREATE TABLE <table_name> ( '' + ' +
							'STUFF ' +
							'( ' +
								'( ' +
									'SELECT ' +
										''','' + ' +
										'QUOTENAME(COLUMN_NAME) + '' '' + ' +
										'DATA_TYPE + ' + 
										'CASE ' +
											'WHEN DATA_TYPE LIKE ''%char'' THEN ''('' + COALESCE(NULLIF(CONVERT(VARCHAR, CHARACTER_MAXIMUM_LENGTH), ''-1''), ''max'') + '') '' ' +
											'ELSE '' '' ' +
										'END + ' +
										'CASE IS_NULLABLE ' +
											'WHEN ''NO'' THEN ''NOT '' ' +
											'ELSE '''' ' +
										'END + ''NULL'' AS [text()] ' +
									'FROM tempdb.INFORMATION_SCHEMA.COLUMNS ' +
									'WHERE ' +
										'TABLE_NAME = (SELECT name FROM tempdb.sys.objects WHERE object_id = OBJECT_ID(''tempdb..#session_schema'')) ' +
										'ORDER BY ' +
											'ORDINAL_POSITION ' +
									'FOR XML ' +
										'PATH('''') ' +
								'), + ' +
								'1, ' +
								'1, ' +
								''''' ' +
							') + ' +
						''')''; ' 
				ELSE ''
			END
		--End derived table and INSERT specification
		);

	SET @sql_n = CONVERT(NVARCHAR(MAX), @sql);

	EXEC sp_executesql
		@sql_n,
		N'@schema VARCHAR(MAX) OUTPUT',
		@schema OUTPUT;
END;

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCJR_llenarEmpleados]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spCJR_llenarEmpleados] AS' 
END
GO
ALTER proc [dbo].[spCJR_llenarEmpleados]
as
select 
e.IdEmpleado, 
(ltrim(p.nombres) + ' ' + ltrim(p.apellido_paterno) + ' ' + ltrim(p.apellido_materno)) as nombres 
from persona p
inner join empleado e 
on p.idpersona=e.idpersona
where e.estado=1
order by p.apellido_paterno
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCJR_llenarOperadoresActivos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spCJR_llenarOperadoresActivos] AS' 
END
GO
ALTER proc [dbo].[spCJR_llenarOperadoresActivos]
as
select 
o.idOperador, 
e.IdEmpleado, 
(p.nombres + ' ' + p.apellido_paterno + ' ' + p.apellido_materno) as nombres
from cjroperador o
inner join empleado e on o.idempleado=e.idempleado
inner join persona p on e.idpersona=p.idpersona
where e.estado=1
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCJR_Rep_Acuerdos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spCJR_Rep_Acuerdos] AS' 
END
GO
ALTER proc [dbo].[spCJR_Rep_Acuerdos]
@idTipoNorma int= null,
@IFechaOrdenanza datetime=null,
@FFechaOrdenanza datetime=null
as
--sssss
select distinct
DescriptipoNorma as Tiponorma, 
(Numordenanza +' del '+
convert(char(10),FechaOrdenanza,103)) as Norma,
(p.SesionDescrip + ' de '+
convert(char(10),p.FechaSesion,103)) as [Aprobado_en_Sesion],
(TipoMedioDescrip +' '+
nombremedio+' de '+
convert(char(10),FechaPublicacion,103)+ ' Pag. '+paginas) as Publicacion
--OfcioNotificacion, 
--FechaOfcioNotificacion
from vs_CJr_Norma n
left join vs_CJr_ProyectoNor p on p.numproyecto=n.numproyecto and p.idTipoProyec=n.idTipoProyec
where 
(idTipoNorma=@idTipoNorma or @idTipoNorma is null) and
(FechaOrdenanza >= @IFechaOrdenanza or @IFechaOrdenanza is null) and
(FechaOrdenanza <= @FFechaOrdenanza  or @FFechaOrdenanza is null)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spCJR_RepIniciativa]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spCJR_RepIniciativa] AS' 
END
GO
ALTER proc [dbo].[spCJR_RepIniciativa] 
as
select distinct * from vs_CJr_Iniciativa i
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEmpleado_Exp]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEmpleado_Exp] AS' 
END
GO
ALTER procedure [dbo].[spEmpleado_Exp]

@Year Int = 0,
@idAreaOrganiz Int = 0,
@IdEmpleado Int = 0,
@Estado Char(1) = '1'

--WITH ENCRYPTION

AS

BEGIN

IF @Year = 0
	SET @Year = YEAR( GETDATE())

	IF @IdEmpleado > 0

--	     SELECT IdEmpleado, Year, idAreaOrganiz, pers_cod, Descripcion, TipoEmpleado, FechaIngreso,
--           Remuneracion, Sueldo, Descuento, HorasExtras, Meritos, Demeritos, IdCargo, Activo, IdSNP
--	     FROM Empleado
--	     WHERE Year = @Year AND idAreaOrganiz = @idAreaOrganiz AND IdEmpleado = @IdEmpleado AND
--           Activo = @Activo
--
--	ELSE
--		SELECT IdEmpleado, Year, idAreaOrganiz, pers_cod, Descripcion, TipoEmpleado, FechaIngreso,
--              Remuneracion, Sueldo, Descuento, HorasExtras, Meritos, Demeritos, IdCargo, Activo, IdSNP
--		FROM Empleado
--		WHERE Year = @Year AND idAreaOrganiz = @idAreaOrganiz AND Activo = @Activo

--		SELECT IdEmpleado, Year, idAreaOrganiz, pers_cod, TipoEmpleado, FechaIngreso, Activo, IdSNP
		SELECT e.IdEmpleado, ea.Year, e.idAreaOrganiz, e.IdPersona, e.FechaIngreso, e.IdAFP, e.Brevete, e.IdEstadoCivil, e.Sexo,
               e.CtaCorriente, e.NroAFP, e.FechaAFP, e.IdSeguro, e.NroSeguro, e.IdTipoSangre, e.DecLey, e.Foto, e.IdTipoTrabajador,
               e.Estado, e.IdCargo
		FROM Empleado e, empleado_area ea
		WHERE e.idempleado=ea.idempleado and ea.Year=@year AND e.idAreaOrganiz=@idAreaOrganiz AND e.Estado=@estado and ea.IdEmpleado=@IdEmpleado --AND
               -- Estado = @Estado --Activo = @Activo

	ELSE
--		SELECT IdEmpleado, Year, idAreaOrganiz, pers_cod, TipoEmpleado, FechaIngreso, Activo, IdSNP
		SELECT e.IdEmpleado, ea.Year, e.idAreaOrganiz, e.IdPersona, e.FechaIngreso, e.IdAFP, e.Brevete, e.IdEstadoCivil, e.Sexo,
               e.CtaCorriente, e.NroAFP, e.FechaAFP, e.IdSeguro, e.NroSeguro, e.IdTipoSangre, e.DecLey, e.Foto, e.IdTipoTrabajador,
               e.Estado, e.IdCargo--,p.nombres, p.apellido_paterno, p.apellido_materno
		FROM Empleado e, empleado_area ea--, persona p
		WHERE e.idempleado=ea.idempleado and ea.Year=@year AND e.idAreaOrganiz=@idAreaOrganiz AND e.Estado=@estado --and e.idpersona=p.idpersona   --Activo = @Activo

end
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEmpleado_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEmpleado_Select] AS' 
END
GO
ALTER procedure [dbo].[spEmpleado_Select]

@Year Int = 0,
@idAreaOrganiz Int = 0,
@IdEmpleado Int = 0,
@Estado Char(1) = '1'

AS

	IF @Year = 0
		SET @Year = YEAR( GETDATE())

	IF @IdEmpleado > 0

		SELECT ea.IdEmpleado, ea.Year, ea.idAreaOrganiz, ISNULL( E.IdPersona, 0) IdPersona,
			   ISNULL( Nombres, '') Nombres, ISNULL( Apellido_Paterno, '') Apellido_Paterno,
			   ISNULL( Apellido_Materno, '') Apellido_Materno,
			   CASE WHEN ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' +
			   ISNULL( Nombres, '') ) = ' , ' THEN 'SIN NOMBRE'
			   ELSE ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' +
			   ISNULL( Nombres, '') ) END AS Persona,
			   CASE WHEN ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' +
			   ISNULL( Nombres, '') ) = ' , ' THEN
			   SubString((ISNULL( J.Descripcion, '') + '   '), 1, 3) + ' SIN NOMBRE'
			   ELSE ( SubString((ISNULL( J.Descripcion, '') + '   '), 1, 3) + ' : ' +
			   ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' +
			   ISNULL( Nombres, '') ) END AS Personal_Tipo,
			   ISNULL( P.TipoDocID, 0) TipoDocID, T.Descripcion TipoDocID,
			   ISNULL( NumDocID, '') NumDocID,
			   ISNULL( E.IdTipoTrabajador, 0) IdTipoTrabajador, J.Descripcion TipoTrabajador,
			   CONVERT( VARCHAR(10), FechaIngreso, 112)  FechaIngreso,
			   ISNULL( IdCargo, 0) IdCargo, Estado
		FROM empleado_area Ea,Empleado E
		LEFT JOIN Persona P ON E.IdPersona = P.IdPersona
		LEFT JOIN TipoTrabajador J ON E.IdTipoTrabajador = J.IdTipoTrabajador
		LEFT JOIN TipoDocID T ON P.TipoDocID = T.TipoDocID
		where e.idempleado=ea.idempleado and ea.idempleado=@idempleado and ea.year=@year AND ea.idAreaOrganiz=@idareaorganiz and e.Estado=@estado
		oRDER BY Apellido_Paterno

	ELSE
		SELECT ea.IdEmpleado, ea.Year, ea.idAreaOrganiz, ISNULL( E.IdPersona, 0) IdPersona,
           ISNULL( Nombres, '') Nombres, ISNULL( Apellido_Paterno, '') Apellido_Paterno,
           ISNULL( Apellido_Materno, '') Apellido_Materno,
           CASE WHEN ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' +
           ISNULL( Nombres, '') ) = ' , ' THEN 'SIN NOMBRE'
           ELSE ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' +
           ISNULL( Nombres, '') ) END AS Personal,
           CASE WHEN ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' +
           ISNULL( Nombres, '') ) = ' , '
           THEN SubString((ISNULL( J.Descripcion, '') + '   '), 1, 3) + ' SIN NOMBRE'
           ELSE ( SubString((ISNULL( J.Descripcion, '') + '   '), 1, 3) + ' : ' + ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' +
           ISNULL( Nombres, '') ) END AS Personal_Tipo,
           ISNULL( NumDocID, '') NumDocID, ISNULL( T.Descripcion, '') Descripcion,
           ISNULL( E.IdTipoTrabajador, '') IdTipoTrabajador,
           CONVERT( VARCHAR(10), FechaIngreso, 112)  FechaIngreso,
           ISNULL( IdCargo, 0) IdCargo, Estado, 'EMPLEADO' TIPO
		FROM empleado_area Ea,Empleado E
		LEFT JOIN Persona P ON E.IdPersona = P.IdPersona
		LEFT JOIN TipoTrabajador J ON E.IdTipoTrabajador = J.IdTipoTrabajador
		LEFT JOIN TipoDocID T ON P.TipoDocID = T.TipoDocID
		where e.idempleado=ea.idempleado and ea.year=@year AND ea.idAreaOrganiz=@idareaorganiz and e.Estado=@estado
		oRDER BY Apellido_Paterno
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spEmpleado_Select_Solo_Pla]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spEmpleado_Select_Solo_Pla] AS' 
END
GO
ALTER procedure [dbo].[spEmpleado_Select_Solo_Pla]  @Year Int = 0, @idAreaOrganiz Int = 0, @IdEmpleado Int = 0, @Estado Char(1) = '1' AS BEGIN IF @Year = 0 SET @Year = YEAR( GETDATE()) IF @IdEmpleado > 0 SELECT IdEmpleado, Year, idAreaOrganiz, ISNULL( E.IdPersona, 0) IdPersona, ISNULL( Nombres, '') Nombres, ISNULL( Apellido_Paterno, '') Apellido_Paterno, ISNULL( Apellido_Materno, '') Apellido_Materno, CASE WHEN ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' + ISNULL( Nombres, '') ) = ' , ' THEN 'SIN NOMBRE' ELSE ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' + ISNULL( Nombres, '') ) END AS Personal, CASE WHEN ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' + ISNULL( Nombres, '') ) = ' , ' THEN  SubString((ISNULL( J.Descripcion, '') + '   '), 1, 3) + ' SIN NOMBRE' ELSE ( SubString((ISNULL( J.Descripcion, '') + '   '), 1, 3) + ' : ' + ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' + ISNULL( Nombres, '') ) END AS Personal_Tipo, ISNULL( P.TipoDocID, 0) TipoDocID, T.Descripcion TipoDocID, ISNULL( NumDocID, '') NumDocID,  ISNULL( E.IdTipoTrabajador, 0) IdTipoTrabajador, J.Descripcion TipoTrabajador, CONVERT( VARCHAR(10), FechaIngreso, 112)  FechaIngreso, ISNULL( IdCargo, 0) IdCargo, Estado FROM Empleado E LEFT JOIN Personal P ON E.IdPersona = P.IdPersona  LEFT JOIN TipoTrabajador J ON E.IdTipoTrabajador = J.IdTipoTrabajador LEFT JOIN TipoDocID T ON P.TipoDocID = T.TipoDocID WHERE Year = @Year AND idAreaOrganiz = @idAreaOrganiz AND IdEmpleado = @IdEmpleado AND Estado = @Estado  ORDER BY Apellido_Paterno	ELSE SELECT ea.IdEmpleado, ea.Year, ea.idAreaOrganiz, ISNULL( E.IdPersona, 0) IdPersona, ISNULL( Nombres, '') Nombres, ISNULL( Apellido_Paterno, '') Apellido_Paterno, ISNULL( Apellido_Materno, '') Apellido_Materno, CASE WHEN ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' + ISNULL( Nombres, '') ) = ' , ' THEN 'SIN NOMBRE' ELSE ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' + ISNULL( Nombres, '') ) END AS Personal, CASE WHEN ( ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' + ISNULL( Nombres, '') ) = ' , ' THEN SubString((ISNULL( J.Descripcion, '') + '   '), 1, 3) + ' SIN NOMBRE' ELSE ( SubString((ISNULL( J.Descripcion, '') + '   '), 1, 3) + ' : ' + ISNULL( Apellido_Paterno, '') + ' ' + ISNULL( Apellido_Materno, '')  + ', ' + ISNULL( Nombres, '') ) END AS Personal_Tipo, ISNULL( P.TipoDocID, 0) TipoDocID, T.Descripcion TipoDocID, ISNULL( NumDocID, '') NumDocID, ISNULL( E.IdTipoTrabajador, 0) IdTipoTrabajador, J.Descripcion TipoTrabajador, CONVERT( VARCHAR(10), FechaIngreso, 112)  FechaIngreso, ISNULL( IdCargo, 0) IdCargo, Estado From Empleado E inner join Empleado_Area ea on ea.idEmpleado=e.idEmpleado LEFT JOIN Persona P ON E.IdPersona = P.IdPersona LEFT JOIN TipoTrabajador J ON E.IdTipoTrabajador = J.IdTipoTrabajador LEFT JOIN TipoDocID T ON P.TipoDocID = T.TipoDocID WHERE ea.Year = @Year AND ea.idAreaOrganiz = @idAreaOrganiz AND e.Estado = @Estado ORDER BY Apellido_Paterno End
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetAsistenciasDetalle]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spGetAsistenciasDetalle] AS' 
END
GO

ALTER PROCEDURE [dbo].[spGetAsistenciasDetalle]
	--declare 
	@FechaIni AS SMALLDATETIME
	,@FechaFin AS SMALLDATETIME
	,@Dni AS VARCHAR(8) = ''
	,@Area AS INT = NULL
	,@TipoEmpleado AS INT = NULL
	,@idLocales AS VARCHAR(500) = ''
	,@opt AS INT
	--as
	--set @FechaIni = '20111202'
	--set @FechaFin = '20111202'
	----set @Dni = null
	--set @opt=0
	--set @TipoEmpleado=1
	--@TipoEmple AS Varchar(5) = 'CSP'    --Cas, SNP, Planilla
AS
BEGIN
	DECLARE @nReg AS SMALLINT
		,@dTmp AS SMALLDATETIME
		,@CodPer AS INT
	DECLARE @FecIni AS VARCHAR(17)
		,@FecFin AS VARCHAR(17)
	DECLARE @cHrIni AS VARCHAR(8)
		,@cHrFin AS VARCHAR(8)
		,@cFlagE AS CHAR(1)
		,@cFlagS AS CHAR(1)
		,@cMotivo AS VARCHAR(30)
		,@cDoc AS VARCHAR(30)
		,@cEstado AS CHAR(1)
		,@cHrAlmIni AS VARCHAR(8)
		,@cHrAlmFin AS VARCHAR(8)

	SET NOCOUNT ON

	--Ordenar las fechas
	IF @FechaFin < @FechaIni
	BEGIN
		SET @dTmp = @FechaIni
		SET @FechaIni = @FechaFin
		SET @FechaFin = @dTmp
	END

	--Corregir el Rango
	SET @FecIni = CONVERT(VARCHAR(8), @FechaIni, 112) + ' 00:00:00'
	SET @FecFin = CONVERT(VARCHAR(8), @FechaFin, 112) + ' 23:59:59'

	--   --Obtener el Codigo del Empleado
	--   SET @CodPer = (SELECT Pers_Cod FROM Ficha_Personal WHERE Pers_Dni = @Dni)
	--   SET @CodPer = ISNULL(@CodPer, 0)
	--   IF @CodPer <= 0
	--      RETURN
	--Obtener el Empleado o Todos los Empleados solicitados
	IF @opt = 1
	BEGIN
		DECLARE cPersonal CURSOR
		FOR
		SELECT DISTINCT E.idempleado
		FROM Persona P
		INNER JOIN Empleado E ON E.idPersona = P.idPersona
		INNER JOIN AuxRRHH_ReporteAsistencia Aux ON Aux.idempleado = e.idempleado
		WHERE E.Estado = 1 --and E.idempleado in (Select distinct idempleado from AuxRRHH_ReporteAsistencia)
	END
	ELSE IF @Dni = ''
	BEGIN
		DECLARE @t1 TABLE (t1 INT)
		DECLARE @cnt INT = 0

		WHILE charindex(',', @idLocales) > 0
		BEGIN
			IF @cnt < 9
			BEGIN
				INSERT INTO @t1
				SELECT substring(@idLocales, 1, 1)

				SET @idLocales = substring(@idLocales, 3, len(@idLocales))
			END
			ELSE
			BEGIN
				INSERT INTO @t1
				SELECT substring(@idLocales, 1, 2)

				SET @idLocales = substring(@idLocales, 4, len(@idLocales))
			END

			SET @cnt = @cnt + 1
		END

		IF LEN(@idLocales) = 1
		BEGIN
			INSERT INTO @t1
			SELECT substring(@idLocales, 1, 1)
		END

		IF LEN(@idLocales) = 2
		BEGIN
			INSERT INTO @t1
			SELECT substring(@idLocales, 1, 2)
		END

		DECLARE cPersonal CURSOR
		FOR
		SELECT DISTINCT E.idempleado
		FROM Persona P
		INNER JOIN Empleado E ON E.idPersona = P.idPersona
		INNER JOIN Empleado_Area Ea ON Ea.idempleado = E.idempleado
			--AND Ea.year = year(getdate())
			AND Ea.year = 2011
		WHERE E.Estado = 1 -- AND PATINDEX('%' + TipoEmpleado + '%', @TipoEmple) > 0
			AND (
				Ea.idAreaOrganiz = @Area
				OR @Area IS NULL
				)
			AND E.IdTipoTrabajador = @TipoEmpleado
			AND E.idLocal IN (
				SELECT *
				FROM @t1
				)
	END
	ELSE
		DECLARE cPersonal CURSOR
		FOR
		SELECT DISTINCT E.idempleado
		FROM Persona P
		INNER JOIN Empleado E ON E.idPersona = P.idPersona
		WHERE P.NumdocID = @Dni
			AND E.Estado = '1' --AND PATINDEX('%' + TipoEmpleado + '%', @TipoEmple) > 0

	--Crear la Tabla Temporal
	PRINT 'AQUI'

	CREATE TABLE #Tmp (
		Fecha SMALLDATETIME
		,CodPer SMALLINT
		,HoraEnt CHAR(8)
		,HoraSal CHAR(8)
		,HoraAlmSal CHAR(8)
		,HoraAlmEnt CHAR(8)
		,Motivo VARCHAR(30)
		,DocJustif VARCHAR(30)
		,Flag_Ent CHAR(1)
		,Flag_Sal CHAR(1)
		)

	--Abrir el Cursor y Procesar para Cada Persona
	OPEN cPersonal

	FETCH NEXT
	FROM cPersonal
	INTO @CodPer

	WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @dTmp = @FechaIni

		WHILE @dTmp <= @FechaFin
		BEGIN
			SELECT @cMotivo = ''
				,@cDoc = ''
				,@nReg = 0
				,@cHrIni = ''
				,@cHrFin = ''
				,@cFlagE = ''
				,@cFlagS = ''

			--IF DATEPART(dw, @dTmp) <= 5      --Excluir los Sabados y Domingos
			BEGIN
				--Verificar si Existe en Asistencia
				SELECT @nReg = 1
					,@cHrIni = Hor_Ent
					,@cHrFin = Hor_Sal
					,@cHrAlmIni = Alm_Sal
					,@cHrAlmFin = Alm_Ent
					,@cFlagE = Flag_Ent
					,@cFlagS = Flag_Sal
					,@cEstado = Estado
				FROM Asistencia
				WHERE idEmpleado = @CodPer
					AND Fecha = @dTmp

				IF @nReg = 1
				BEGIN
					--Si se encuentra, Verificar si tiene Permisos
					IF @cFlagE = '1'
						OR @cFlagS = '1'
						OR @cHrIni = '00:00:00'
						OR @cHrFin = '00:00:00'
					BEGIN
						--Buscar el Permiso en Perm_Lice
						SET @nReg = 0

						SELECT TOP 1 @nReg = 1
							,@cMotivo = mp.Descrip_Motivo
							,@cDoc = p.Referencia
						FROM Permiso p
						INNER JOIN Motivo_Perm mp ON p.idMotivo = mp.idMotivo
						WHERE p.IdEmpleado = @CodPer
							AND p.FechaInicio <= @dTmp
							AND p.FechaFin >= @dTmp
						ORDER BY p.FechaInicio DESC

						IF @nReg = 1
						BEGIN
							--Si se encontro el Permiso. Agregarlo a la Tabla
							IF @cFlagE = '1'
								AND @cFlagS = '1'
								SELECT @cHrIni = 'Perm'
									,@cFlagE = 'P'
									,@cHrFin = 'Perm'
									,@cFlagS = 'P'

							--IF @cFlagE = '1' AND @cFlagS = '0'
							--   SELECT @cHrIni = 'Perm', @cFlagE = 'P'
							--IF @cFlagE = '0' AND @cFlagS = '1'
							--   SELECT @cHrFin = 'Perm', @cFlagS = 'P'
							IF @cEstado = '1'
								AND @cFlagS = '0'
								AND @cFlagE = '1'
								SELECT @cHrFin = 'Perm'
									,@cFlagS = 'P'

							IF @cEstado = '1'
								AND @cFlagS = '1'
								AND @cFlagE = '0'
								SELECT @cHrIni = 'Perm'
									,@cFlagE = 'P'

							INSERT #Tmp (
								Fecha
								,CodPer
								,HoraEnt
								,HoraSal
								,Motivo
								,DocJustif
								,Flag_Ent
								,a.Flag_Sal
								)
							VALUES (
								@dTmp
								,@CodPer
								,@cHrIni
								,@cHrFin
								,@cMotivo
								,@cDoc
								,@cFlagE
								,@cFlagS
								)
						END
						ELSE
						BEGIN
							--Tiene marcas de Permiso, o Asistencias CERO. Ingresar posible Falta
							--SELECT @cFlagE = '', @cFlagS = ''
							INSERT #Tmp (
								Fecha
								,CodPer
								,HoraEnt
								,HoraSal
								,HoraAlmSal
								,HoraAlmEnt
								,Motivo
								,DocJustif
								,Flag_Ent
								,a.Flag_Sal
								)
							VALUES (
								@dTmp
								,@CodPer
								,@cHrIni
								,@cHrFin
								,@cHrAlmIni
								,@cHrAlmFin
								,@cMotivo
								,@cDoc
								,@cFlagE
								,@cFlagS
								)
						END
					END
					ELSE
					BEGIN
						--Tiene Asistencia pero NO tiene Permiso. Agregar la Asistencia
						INSERT #Tmp (
							Fecha
							,CodPer
							,HoraEnt
							,HoraSal
							,Motivo
							,DocJustif
							,Flag_Ent
							,a.Flag_Sal
							)
						VALUES (
							@dTmp
							,@CodPer
							,@cHrIni
							,@cHrFin
							,@cMotivo
							,@cDoc
							,@cFlagE
							,@cFlagS
							)
					END
				END
				ELSE
				BEGIN
					--No tiene Asistencia, Buscar si este dia esta incluido en un Rango de Fecha de Permiso.
					SELECT @nReg = 0
						,@cHrIni = ''
						,@cHrFin = ''
						,@cFlagE = ''
						,@cFlagS = ''

					SELECT TOP 1 @nReg = 1
						,@cMotivo = mp.Descrip_Motivo
						,@cDoc = p.Referencia
					FROM Permiso p
					INNER JOIN Motivo_Perm mp ON p.idMotivo = mp.idMotivo
					WHERE p.IdEmpleado = @CodPer
						AND p.FechaInicio <= @dTmp
						AND p.FechaFin >= @dTmp
					ORDER BY p.FechaInicio DESC

					IF @nReg = 1
					BEGIN
						--Si existe el Permiso
						SELECT @cHrIni = 'Perm'
							,@cFlagE = 'P'
							,@cHrFin = 'Perm'
							,@cFlagS = 'P'

						INSERT #Tmp (
							Fecha
							,CodPer
							,HoraEnt
							,HoraSal
							,Motivo
							,DocJustif
							,Flag_Ent
							,a.Flag_Sal
							)
						VALUES (
							@dTmp
							,@CodPer
							,@cHrIni
							,@cHrFin
							,@cMotivo
							,@cDoc
							,@cFlagE
							,@cFlagS
							)
					END
					ELSE
					BEGIN
						--Si no Tiene Asistencia Ni perniso Ni Asistencia Irregular, Agregar la FALTA
						SELECT @cHrIni = '00:00:00'
							,@cFlagE = 'F'
							,@cHrFin = '00:00:00'
							,@cFlagS = 'F'

						INSERT #Tmp (
							Fecha
							,CodPer
							,HoraEnt
							,HoraSal
							,Motivo
							,DocJustif
							,Flag_Ent
							,Flag_Sal
							)
						VALUES (
							@dTmp
							,@CodPer
							,@cHrIni
							,@cHrFin
							,@cMotivo
							,@cDoc
							,@cFlagE
							,@cFlagS
							)
					END
				END
			END

			SET @dTmp = DATEADD(d, 1, @dTmp)
		END

		SET @CodPer = 0

		FETCH NEXT
		FROM cPersonal
		INTO @CodPer
	END

	CLOSE cPersonal

	DEALLOCATE cPersonal

	--Devolver las Asistencias y Eliminar la tabla temporal
	--SELECT * FROM #Tmp
	SELECT t.CodPer Codigo
		,(P.Apellido_Paterno + ' ' + P.Apellido_Materno + ', ' + P.Nombres) NombreCompletos
		,DATENAME(weekday, t.fecha) AS NombreDia
		,convert(VARCHAR(10), t.Fecha, 103) AS Fecha
		,t.HoraEnt Entrada
		,t.HoraSal Salida
		,t.Motivo
		,t.DocJustif Documento
		,
		--isnull(t.Flag_Ent,'--'), isnull(t.Flag_Sal,'--'), 
		TT.Descripcion
		,EO.AreaOrganizacional
	FROM #Tmp t
	INNER JOIN Empleado f ON t.CodPer = f.IdEmpleado
	INNER JOIN Persona P ON P.IdPersona = f.IdPersona
	INNER JOIN TipoTrabajador TT ON TT.IdTipoTrabajador = f.IdTipoTrabajador
	INNER JOIN Empleado_Area ea ON ea.idempleado = f.idempleado
		--AND ea.Year = Year(getdate())
		AND ea.Year = 2011
	INNER JOIN dbo.EstructOrganiz EO ON EO.idAreaOrganiz = ea.idAreaOrganiz
		AND EO.Year = Year(getdate())
	ORDER BY t.CodPer
		,t.Fecha

	DROP TABLE #Tmp
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetOC]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spGetOC] AS' 
END
GO
ALTER PROCEDURE [dbo].[spGetOC]
@cWhere AS Varchar(512)
AS
BEGIN
   DECLARE @cSql AS Varchar(1200)
   SET @cSql = 'SELECT Distinct o.IDORDEN,o.FECHA,o.IDFINANCIAMIENTO,f.DESCRIPCION as FINANCIAMIENTO,
   o.CODIGOSIAF,o.IDPROVEEDOR,p.RAZONSOCIAL As PROVEEDOR,o.ASUNTO,o.USO,o.OBSERVACIONES,o.REFERENCIA 
   FROM Ordencompra o INNER JOIN Deta_orden d ON o.idorden = d.idorden AND o.tipoorden = d.tipoorden
   INNER JOIN Proveedor p ON o.idProveedor = p.idProveedor
   INNER JOIN Financiamiento f ON o.idFinanciamiento = f.idFinanciamiento
   WHERE ' + @cWhere
   EXEC(@cSql)
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spParametrosTrab]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spParametrosTrab] AS' 
END
GO

ALTER procedure [dbo].[spParametrosTrab]
@IdParametros Int,
@Year Int,
@HorasTrabajo Int,
@SemasTrabajo Int,
@DiasTrabajo Int,
@ProgramaP Int,
@M1 Int,
@M2 Int,
@M3 Int,
@M4 Int,
@M5 Int,
@M6 Int,
@M7 Int,
@M8 Int,
@M9 Int,
@M10 Int,
@M11 Int,
@M12 Int,
@activo bit


--WITH ENCRYPTION


AS



BEGIN

  IF @Year < 2001
    RETURN -1


	IF @IdParametros = 0

		BEGIN

			SET @IdParametros = ( SELECT MAX( IdParametros ) FROM ParametrosTrab WHERE Year = @Year)
			SET @IdParametros = ISNULL( @IdParametros, 0)

      IF @IdParametros = 0
        BEGIN
			    SET @IdParametros = ( SELECT MAX( IdParametros ) FROM ParametrosTrab)
			    SET @IdParametros = ISNULL( @IdParametros, 0)
			    SET @IdParametros = @IdParametros + 1
        END


			INSERT INTO ParametrosTrab ( IdParametros, Year, HorasTrabajo, SemasTrabajo, DiasTrabajo, ProgramaP,
                                   M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12)
						 VALUES ( @IdParametros, @Year, @HorasTrabajo, @SemasTrabajo, @DiasTrabajo, @ProgramaP,
                      @M1, @M2, @M3, @M4, @M5, @M6, @M7, @M8, @M9, @M10, @M11, @M12)


		END

	ELSE

		BEGIN

	    UPDATE ParametrosTrab SET HorasTrabajo = @HorasTrabajo, SemasTrabajo = @SemasTrabajo,
             DiasTrabajo = @DiasTrabajo, ProgramaP = @ProgramaP, M1 = @M1, M2 = @M2, M3 = @M3, M4 = @M4,
             M5 = @M5, M6 = @M6, M7 = @M7, M8 = @M8, M9 = @M9, M10 = @M10, M11 = @M11, M12 = @M12, Activo=@activo
	    WHERE IdParametros = @IdParametros AND Year = @Year

		END

	SELECT @IdParametros IdParametros, @Year Year

END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_ActualizaEmpleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_ActualizaEmpleado] AS' 
END
GO
ALTER proc [dbo].[spRRHH_ActualizaEmpleado]
@CodPer int, 
@codEmple int,
@year int,
@idorganiz int,
@TipoDocIdent int,
@NumDoc char(12),
@Apellido_Paterno varchar(30),
@Apellido_Materno varchar(30),
@Nombres varchar(100),
@ubigeoNac char(6),
@fechaNac datetime,
@Direccion varchar(100),
@Fono varchar(15),
@FonoLab varchar(15),
@FonoCel varchar(15),
@FonoOtro varchar(15),
@Mail varchar(50),
@UbigeoDireccion char(6),
@idNacionalidad int,
@sexo char(1),
@idEstCivil int,
@idDiscapacidad int,
@expSocial varchar(20),
@FechaIngreso smalldatetime,
@idtiposangre int,
@brevete  varchar(12),
@libmilitar varchar(10),
@gradoinstrucc varchar(80),
@numruc varchar(12),
@idtipoTrabajador int,
@Foto image = null
as
begin
if @idNacionalidad=0
set @idNacionalidad=null
if @idtipoTrabajador=0
set @idtipoTrabajador=null
Update persona 
set Nombres=@Nombres,Apellido_Paterno=@Apellido_Paterno,Apellido_Materno=@Apellido_Materno,
TipoDocID=@TipoDocIdent,NumDocID=@NumDoc,Direccion=@Direccion,Telefono=@Fono,
Fax=@FonoOtro,Email=@Mail,IdUbigeo=@ubigeoNac,UbigeoDireccion=@UbigeoDireccion,
TipoPersona='N',FechaNacimiento=@fechaNac,FechaRegistro=@FechaIngreso,NumCelular=@FonoCel,
FonoCentroLab=@FonoLab 
where Idpersona=@CodPer
Update empleado
Set year=@year,idAreaOrganiz=@idorganiz,ExpSocial=@expSocial,
IdEstadoCivil=@idEstCivil,Sexo=@sexo,Foto=@Foto,IdDiscapacidad=@idDiscapacidad,
IdNacionalidad=@idNacionalidad,Estado=1,idtiposangre=@idtiposangre, brevete=@brevete,
numlibretamilitar=@libmilitar, gradoinstruccion=@gradoinstrucc, NumRUC=@numruc,
idtipoTrabajador= @idtipoTrabajador
where IdEmpleado=@codEmple
end


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_AgregarReporte]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_AgregarReporte] AS' 
END
GO
ALTER proc [dbo].[spRRHH_AgregarReporte]
@idEmpleado int,
@opt int
as
if @opt=1
insert AuxRRHH_ReporteAsistencia values (@idEmpleado)
if @opt=2
delete from AuxRRHH_ReporteAsistencia where idempleado=@idEmpleado
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpRRHH_Asistencia_Import]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SpRRHH_Asistencia_Import] AS' 
END
GO
ALTER proc [dbo].[SpRRHH_Asistencia_Import] --'17968976','20100205','07:21:00','16:00:00','',null,'0'
	@DNI char(12)
	,@Fecha datetime --YYYY/MM/DD
	,@Hor_Ent char(8)
	,@Hor_Sal char(8)
	,@Alm_Sal char(8)
	,@Alm_Ent char(8)
	,@idHorario int
	,@Estado bit
	,@Forzar bit
As
	declare @IdEmpleado int
	declare @idHorarioEmpleado int
	select @IdEmpleado=e.idEmpleado, @idHorarioEmpleado=e.idHorario
	from Persona p inner join Empleado e on e.idPersona = p.idPersona
	where NumDocID=@DNI and e.Estado=1
	if(@idEmpleado is null)
		begin
			--raiserror('Empleado No existe',16,1)
			return
		end
	else
		begin	
			declare @num int
			select @num=count(*)from Asistencia where IdEmpleado=@IdEmpleado and Fecha=@Fecha
			
			if (@Alm_Sal is null or @Alm_Sal = '' )set @Alm_Sal = '00:00:00'
			if (@Alm_Ent is null or @Alm_Ent = '' )set @Alm_Ent = '00:00:00'
			
			if @num=1 
					--raiserror('Ya fue Ingresado',16,1)
					--print 'Ya fue Ingresado'
				begin
					if @Forzar = 0
						begin					
							return 
						end
					Else
						Begin
							declare @FlagE bit
							declare @FlagS bit
							
							Select @FlagE = isnull(A.Flag_Ent,0) from Asistencia A where A.Fecha=@Fecha and A.IdEmpleado=@IdEmpleado
							Select @FlagS = isnull(A.Flag_Sal,0) from Asistencia A where A.Fecha=@Fecha and A.IdEmpleado=@IdEmpleado
							
							if (@FlagE=1 and @FlagS=1)
								Begin
									return
								End
							else if (@FlagE=1)
								Begin
									Update Asistencia
									set 
									Hor_Sal=@Hor_Sal,
									Alm_Sal=@Alm_Sal,
									Alm_Ent=@Alm_Ent,
									idHorario=@idHorario,
									Estado=@Estado
									Where Fecha=@Fecha and IdEmpleado=@IdEmpleado
									return
								End
							else if (@FlagS=1)
								Begin
									Update Asistencia
									set 
									Hor_Ent=@Hor_Ent,
									Alm_Sal=@Alm_Sal,
									Alm_Ent=@Alm_Ent,
									idHorario=@idHorario,
									Estado=@Estado
									Where Fecha=@Fecha and IdEmpleado=@IdEmpleado
									return
								End
							else
								Begin
									Update Asistencia
									set Hor_Ent=@Hor_Ent,
									Hor_Sal=@Hor_Sal,
									Alm_Sal=@Alm_Sal,
									Alm_Ent=@Alm_Ent,
									idHorario=@idHorario,
									Estado=@Estado
									Where Fecha=@Fecha and IdEmpleado=@IdEmpleado
								End							
						End			
				end
			else
				Begin
					INSERT [Asistencia]
					([Fecha]
				   ,[IdEmpleado]
				   ,[Hor_Ent]
				   ,[Hor_Sal]
				   ,[Alm_Sal]
				   ,[Alm_Ent]
				   ,[idHorario]
				   ,[Estado])
					VALUES
				   (@Fecha
				   ,@IdEmpleado
				   ,@Hor_Ent
				   ,@Hor_Sal
				   ,@Alm_Sal
				   ,@Alm_Ent
				   ,@idHorario
				   ,@Estado)
				End			
		end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpRRHH_Asistencia_Import_Personal1]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SpRRHH_Asistencia_Import_Personal1] AS' 
END
GO
ALTER proc [dbo].[SpRRHH_Asistencia_Import_Personal1] --'17968976','20100205','07:21:00','16:00:00','',null,'0'
	@DNI char(12)
	,@Fecha datetime --YYYY/MM/DD
	,@Hor_Ent char(8)
	,@Hor_Sal char(8)
	,@Alm_Sal char(8)
	,@Alm_Ent char(8)
	,@Flag_Ent bit
	,@Flag_Sal bit
	,@Estado bit	
	,@Forzar bit
As
	declare @IdEmpleado int
	declare @idHorarioEmpleado int
	select @IdEmpleado=e.idEmpleado, @idHorarioEmpleado=e.idHorario
	from Persona p inner join Empleado e on e.idPersona = p.idPersona
	where NumDocID=@DNI and e.Estado=1
	if(@idEmpleado is null)
		begin
			--raiserror('Empleado No existe',16,1)
			return
		end
	else
		begin	
			declare @num int
			select @num=count(*)from Asistencia where IdEmpleado=@IdEmpleado and Fecha=@Fecha
			
			if (@Alm_Sal is null or @Alm_Sal = '' )set @Alm_Sal = '00:00:00'
			if (@Alm_Ent is null or @Alm_Ent = '' )set @Alm_Ent = '00:00:00'
			declare @idHorario int
			if (@idHorario is null or @idHorario='') set @idHorario=@idHorarioEmpleado
			
			if @num=1 
					--raiserror('Ya fue Ingresado',16,1)
					--print 'Ya fue Ingresado'
				begin
					if @Forzar = 0
						begin					
							return 
						end
					Else
						Begin
							declare @FlagE bit
							declare @FlagS bit
							
							Select @FlagE = isnull(A.Flag_Ent,0) from Asistencia A where A.Fecha=@Fecha and A.IdEmpleado=@IdEmpleado
							Select @FlagS = isnull(A.Flag_Sal,0) from Asistencia A where A.Fecha=@Fecha and A.IdEmpleado=@IdEmpleado
							
							if (@FlagE=1 or @FlagS=1)
								Begin
									return
								End
							else
								Begin
									Update Asistencia
									set Hor_Ent=@Hor_Ent,
									Hor_Sal=@Hor_Sal,
									Alm_Sal=@Alm_Sal,
									Alm_Ent=@Alm_Ent,
									Estado=@Estado,
									idHorario=@idHorario
									Where Fecha=@Fecha and IdEmpleado=@IdEmpleado
								End							
						End			
				end
			else
				Begin
					INSERT [Asistencia]
					([Fecha]
				   ,[IdEmpleado]
				   ,[Hor_Ent]
				   ,[Hor_Sal]
				   ,[Alm_Sal]
				   ,[Alm_Ent]
				   ,Flag_Ent
				   ,Flag_Sal
				   ,[Estado]
				   ,idHorario)
					VALUES
				   (@Fecha
				   ,@IdEmpleado
				   ,@Hor_Ent
				   ,@Hor_Sal
				   ,@Alm_Sal
				   ,@Alm_Ent
				   ,@Flag_Ent
				   ,@Flag_Sal
				   ,@Estado
				   ,@idHorario) 
				End			
		end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_busca_empleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_busca_empleado] AS' 
END
GO
ALTER proc [dbo].[spRRHH_busca_empleado]
@idempleado int = null,
@NumdocId varchar(12),
@Apellido_Paterno varchar(30),
@IdTipoTrabajador int = null,
@Anio char(4) = null,
@idRol int = null,
@activo bit
as
if @idRol =0
Begin
	select IdTipoTrabajador,Codigo,DNI,NombresCompletos,E.AreaOrganizacional,cargo from
	vs_RRHH_buscarEmpleado V
	inner join dbo.Empleado_Area EA on V.Codigo=EA.IdEmpleado
	inner join dbo.EstructOrganiz E on E.idAreaOrganiz=EA.idAreaOrganiz and E.Year=EA.Year
	where (estado=@activo) 
	and (NombresCompletos like @Apellido_Paterno+'%' or @Apellido_Paterno='')
	and (DNI=@NumdocId or @NumDocID = '')
	and (Codigo=@idempleado or @idempleado is null)
	and (IdTipoTrabajador=@IdTipoTrabajador or @IdTipoTrabajador is null)
	and (EA.Year = @Anio or @Anio is null)
	order by NombresCompletos
End
if @idRol=3
begin
	select IdTipoTrabajador,Codigo,DNI,NombresCompletos,E.AreaOrganizacional,cargo from
	vs_RRHH_buscarEmpleado V
	inner join dbo.Empleado_Area EA on V.Codigo=EA.IdEmpleado
	inner join dbo.EstructOrganiz E on E.idAreaOrganiz=EA.idAreaOrganiz and E.Year=EA.Year
	where (estado=@activo) 
	and (NombresCompletos like @Apellido_Paterno+'%' or @Apellido_Paterno='')
	and (DNI=@NumdocId or @NumDocID = '')
	and (Codigo=@idempleado or @idempleado is null)
	and (IdTipoTrabajador in (2))
	and (EA.Year = @Anio or @Anio is null)
	order by NombresCompletos
End
if @idRol=4
Begin
	select IdTipoTrabajador,Codigo,DNI,NombresCompletos,E.AreaOrganizacional,cargo from
	vs_RRHH_buscarEmpleado V
	inner join dbo.Empleado_Area EA on V.Codigo=EA.IdEmpleado
	inner join dbo.EstructOrganiz E on E.idAreaOrganiz=EA.idAreaOrganiz and E.Year=EA.Year
	where (estado=@activo) 
	and (NombresCompletos like @Apellido_Paterno+'%' or @Apellido_Paterno='')
	and (DNI=@NumdocId or @NumDocID = '')
	and (Codigo=@idempleado or @idempleado is null)
	and (IdTipoTrabajador in (1,3,4,5))
	and (EA.Year = @Anio or @Anio is null)
	order by NombresCompletos
End
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_BuscarEmpleado_Codigo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_BuscarEmpleado_Codigo] AS' 
END
GO
ALTER proc [dbo].[spRRHH_BuscarEmpleado_Codigo]
@codigo int
--WITH ENCRYPTION
as
select Nombres, Apellido_paterno, Apellido_Materno, Sexo,
TipoDocID,NumDocID,idNacionalidad, FechaNacimiento, Telefono, Numcelular, FonoCentrolab,Fax,
IdEstadoCivil, IdDiscapacidad, IdUbigeo, Direccion, UbigeoDireccion, ExpSocial, foto,
empleado.idpersona,empleado.year,empleado.idAreaOrganiz,FechaRegistro, email,idtiposangre,gradoinstruccion,
numlibretamilitar,brevete, NumRUC, idhorario, idtipotrabajador
from persona 
inner join empleado on persona.idpersona=empleado.idpersona
where idempleado=@codigo

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_EstadisticaPermiso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_EstadisticaPermiso] AS' 
END
GO
ALTER proc [dbo].[spRRHH_EstadisticaPermiso]
@IdTipoTrabajador char(1),
@FechaInicio char(8),
@FechaFin char(8),
@idMotivos varchar(150),
@Motivos varchar(450),
@MotivosNull varchar(2050),
@idAreas varchar(450)
--@IdTipoTrabajador char(1) = '1',
--@FechaInicio char(8)='20120701',
--@FechaFin char(8)='20120730',
--@idMotivos varchar(150) = '1,2,3,4,6,12,15,16,18,20,47,48',
--@Motivos varchar(450) = '[PV],[PE],[PP],[O],[V],[CS],[LO],[LN],[PN],[PRN],[FI],[LSG]',
--@MotivosNull varchar(2050) = '[PV],[PE],[PP],[O],[V],[CS],[LO],[LN],[PN],[PRN],[FI],[LSG]'
as
declare @TipoModalidad char(1)
if @IdTipoTrabajador=1
	set @TipoModalidad='P'
else
	set @TipoModalidad='C'


--Fin Declaracion de Variables
DECLARE @query VARCHAR(7800)
set @query='
Select * from (
Select P.Apellido_Paterno + '' '' + P.Apellido_Materno + '', ''+ Nombres NombresCompletos, EO.AreaOrganizacional 
, E.IdEmpleado, isnull(MT.Tarde, ''00:00'') Tarde, isnull(MT.DiasTarde, 0) DiasTarde
from Persona P
inner join Empleado E on P.IdPersona=E.IdPersona
inner join Empleado_Area EA on EA.IdEmpleado=E.IdEmpleado and EA.Year=Year(getdate())
inner join EstructOrganiz EO on EO.idAreaOrganiz=EA.idAreaOrganiz and EO.Year=EA.Year
left outer join  
(
select 
r.IdEmpleado,
(RIGHT(''00'' + CONVERT (VARCHAR(2), 
SUM (DATEPART(MINUTE, Mintarde )) / 60 + 
SUM (DATEPART(HOUR, Mintarde ) )), 2) 
+ '':'' + 
CONVERT (CHAR (2), SUM (DATEPART(MINUTE, Mintarde )) % 60)) as Tarde, 
COUNT(*) as DiasTarde
From RegAsisDiario r
inner join empleado e on r.IdEmpleado=e.IdEmpleado
where (fecha >='''+@FechaInicio+''' and fecha <= '''+@FechaFin+''')
and IdTipoTrabajador='+@IdTipoTrabajador+' and Mintarde is not null
and e.estado=1
group by r.IdEmpleado
) MT on MT.IdEmpleado=E.IdEmpleado
where E.Estado=1 and E.IdTipoTrabajador='+@IdTipoTrabajador+' and EO.idAreaOrganiz in ('+@idAreas +')
) A left outer join (
SELECT idempleado, ' + @Motivos + '
FROM 
(
select P.idempleado, MP.Abrev,  sum(cast(substring(dbo.fDifFechas(P.FechaFin,FechaInicio),7,2) as int)+1) CantPermiso from Permiso P
inner join Motivo_Perm MP on P.idMotivo=MP.idMotivo
where 
MP.Activo=1 and MP.TipoModalidad='''+@TipoModalidad+''' and P.idMotivo in ('+@idMotivos+') and
fechainicio between '''+@FechaInicio+''' and '''+@FechaFin+'''
group by P.IdEmpleado, MP.Abrev
) as T
PIVOT(SUM(CantPermiso) FOR Abrev IN ('+ @Motivos + ')) AS Resultado
) B on A.IdEmpleado=B.IdEmpleado

order by A.AreaOrganizacional'
--print @query
exec (@query)

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_Faltas]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_Faltas] AS' 
END
GO
ALTER proc [dbo].[spRRHH_Faltas]
@fecha char(10),
@idTipoTrabajador int=null,
@idAreaOrganiz int=null,
@Anio int = null
as
select NombresC, NumDocID, Idpersona, IdEmpleado, year, idAreaOrganiz ,
idTipoTrabajador, Estado, AreaOrganizacional, Descripcion, Fecha=null
from vs_GetEmpleado 
where Estado=1
and (idTipoTrabajador=@idTipoTrabajador or @idTipoTrabajador is null)
and (idAreaOrganiz=@idAreaOrganiz or @idAreaOrganiz is null)
and (year=@Anio or @Anio is null)
except 
select NombresC, NumDocID, Idpersona, IdEmpleado, year, idAreaOrganiz ,
idTipoTrabajador, Estado, AreaOrganizacional, Descripcion, Fecha=null
from vs_faltas 
where Estado=1 
and (convert(char(10),Fecha,103)=@fecha)
and (idTipoTrabajador=@idTipoTrabajador or @idTipoTrabajador is null)
and (idAreaOrganiz=@idAreaOrganiz or @idAreaOrganiz is null)
and (year=@Anio or @Anio is null)
order by NombresC
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_GetAsistenciaDia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_GetAsistenciaDia] AS' 
END
GO
ALTER proc [dbo].[spRRHH_GetAsistenciaDia]
@IdEmpleado int,
@Fecha char(8)
as
select * from Asistencia
where IdEmpleado=@IdEmpleado 
and Fecha=@Fecha 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_GetAsistencias]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_GetAsistencias] AS' 
END
GO
ALTER proc [dbo].[spRRHH_GetAsistencias]
@dia char(8)
as
select Fecha, IdEmpleado, Estado='A' from dbo.Asistencia
where fecha=@dia 
Union all
(
select Fecha=null,IdEmpleado, Estado='F' from vs_GetEmpleado where Estado=1
except
select Fecha=null,IdEmpleado, Estado='F' from vs_faltas where Estado=1 and fecha = @dia  
)
order by IdEmpleado
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_GetDiasAsistidos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_GetDiasAsistidos] AS' 
END
GO
ALTER proc [dbo].[spRRHH_GetDiasAsistidos]
@FI varchar(8),
@FF varchar(8),
@IdTipoTrabajador char(1)
as
Begin
	declare @tipomodalidad char(1)
	if(@IdTipoTrabajador='1')
		set @tipomodalidad = 'P'
	else if (@IdTipoTrabajador='2')
		set @tipomodalidad = 'C'	

	SET DATEFIRST 1

	select 
	r.IdEmpleado,
	Count(*) as Dias_Asistidos
	From RegAsisDiario R
	inner join empleado e on r.IdEmpleado=e.IdEmpleado
	where (fecha >=@FI and fecha <= @FF)
	and IdTipoTrabajador=@IdTipoTrabajador 
	--and R.Estado <> 'F' and R.Estado <> 'PP' and R.Estado <> 'AS' and R.Estado <> 'SSC'
	and R.Estado <> 'F' and R.Estado <> 'AS' 
	and R.Estado not in (select Abrev from Motivo_Perm where Activo=1 and Salario=0 and tipomodalidad =@tipomodalidad)
	and (datepart(weekday,fecha)=1 or datepart(weekday,fecha)=2 or datepart(weekday,fecha)=3
	or datepart(weekday,fecha)=4 or datepart(weekday,fecha)=5)
	group by r.IdEmpleado
End
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_GetMinTarde]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_GetMinTarde] AS' 
END
GO

ALTER PROC [dbo].[spRRHH_GetMinTarde] @FI VARCHAR(8)
	,@FF VARCHAR(8)
	,@IdTipoTrabajador CHAR(1)
AS
SELECT r.IdEmpleado
	,(RIGHT('00' + CONVERT(VARCHAR(2), SUM(DATEPART(MINUTE, Mintarde)) / 60 + SUM(DATEPART(HOUR, Mintarde))), 2) + ':' + CONVERT(CHAR(2), SUM(DATEPART(MINUTE, Mintarde)) % 60)) AS Tarde
	,COUNT(*) AS DiasTarde
FROM RegAsisDiario r
INNER JOIN empleado e ON r.IdEmpleado = e.IdEmpleado
WHERE (
		fecha >= @FI
		AND fecha <= @FF
		)
	AND IdTipoTrabajador = @IdTipoTrabajador
	AND Mintarde IS NOT NULL
	AND e.estado = 1
GROUP BY r.IdEmpleado

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_getMotivo_perm]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_getMotivo_perm] AS' 
END
GO
ALTER proc [dbo].[spRRHH_getMotivo_perm]
@idTipoPermiso int,
@TipoModalidad Char(1)=null
as
select 
m.idMotivo,
m.Descrip_Motivo,
m.Salario,
m.Abrev,
m.idTipoPermiso,
t.DescripTipoPermiso
from Motivo_perm m
inner join TipoPermiso t on m.idTipoPermiso=t.idTipoPermiso
where m.idTipoPermiso=@idTipoPermiso
and (m.TipoModalidad=@TipoModalidad or @TipoModalidad is null)
order by m.Descrip_Motivo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_GetPeriodoLaboralByEmpleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_GetPeriodoLaboralByEmpleado] AS' 
END
GO
ALTER proc [dbo].[spRRHH_GetPeriodoLaboralByEmpleado]
@idEmpleado int
as
select * from PeriodoLaboral
where idEmpleado=@idEmpleado 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_GetRecordAsistenciasSemanales]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_GetRecordAsistenciasSemanales] AS' 
END
GO
ALTER proc [dbo].[spRRHH_GetRecordAsistenciasSemanales]
--declare
@FI Nvarchar(8),
@ff Nvarchar(8),
@IdTipoTrabajador int = null
--set @FI='20110926'
--set @ff='20110929'
--set @IdTipoTrabajador=2
as
Begin
SET DATEFIRST 1
select 
E.IdEmpleado,
(P.Apellido_Paterno + ' ' + 
P.Apellido_Materno + ' , ' +
P.Nombres) AS NombresCompletos,
DATEPART ( WW , A.Fecha ) as Semana,

(RIGHT('00' + CONVERT (VARCHAR(2), 
SUM (DATEPART(MINUTE, (CASE when Hor_Sal='00:00:00' THEN '00:00:00' else
Substring(dbo.cDifTpos(Hor_Ent,Substring(dbo.cDifTpos(Hor_Sal,'00:30:00'),11,8)),11,8) end)  )) / 60 + 
SUM (DATEPART(HOUR, CASE when Hor_Sal='00:00:00' THEN '00:00:00' else
Substring(dbo.cDifTpos(Hor_Ent,Substring(dbo.cDifTpos(Hor_Sal,'00:30:00'),11,8)),11,8) end   ) )), 2) 
+ ':' + 
CONVERT (CHAR (2), SUM (DATEPART(MINUTE, CASE when Hor_Sal='00:00:00' THEN '00:00:00' else
Substring(dbo.cDifTpos(Hor_Ent,Substring(dbo.cDifTpos(Hor_Sal,'00:30:00'),11,8)),11,8) end )) % 60)) as HorasTrabajadas,

CONVERT(Char(10), (A.Fecha - (DATEPART ( W , A.Fecha )-1)), 103) as InicioSemana,
CONVERT(Char(10),((A.Fecha - (DATEPART ( W , A.Fecha )-1))+4),103) as FinSemana
from Asistencia A
inner join Empleado E on A.IdEmpleado=E.IdEmpleado
inner join Persona P on P.IdPersona=E.IdPersona
where E.Estado=1
--and DATEPART ( WW , A.Fecha ) = DATEPART ( WW , @fi ) and DATEPART ( WW , A.Fecha ) = DATEPART ( WW , @ff )
and CONVERT(char(8),A.fecha,112) between @fi and @ff
--and E.IdEmpleado=515
and E.IdTipoTrabajador = @IdTipoTrabajador
group by 
E.IdEmpleado,
P.Apellido_Paterno, 
P.Apellido_Materno,
P.Nombres,
DATEPART (WW, A.Fecha ),
CONVERT(Char(10), (A.Fecha - (DATEPART ( W , A.Fecha )-1)), 103),
CONVERT(Char(10),((A.Fecha - (DATEPART ( W , A.Fecha )-1))+4),103)
order by P.Apellido_Paterno
End

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_GetReporteAsistencia]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_GetReporteAsistencia] AS' 
END
GO
--USE [CMI]
--GO
--/****** Object:  StoredProcedure [dbo].[spRRHH_GetReporteAsistencia]    Script Date: 21/09/2023 02:08:11 p. m. ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO

ALTER proc [dbo].[spRRHH_GetReporteAsistencia]

--Declare
@FI Nvarchar(8),
@ff Nvarchar(8),
@Anio int,
@idTipoTrabajador int

--set @FI = '20230824'
--set @ff = '20230831'
--set @Anio =2023
--set @idTipoTrabajador =1

AS
delete from [dbo].[RegAsisDiario]
where Fecha between @FI and @ff

DECLARE @Fecha DATETIME
	,@IdEmpleado INT
	,@ban VARCHAR(3)
	,@c INT
	,@k INT
	,@d INT
	,@idhorario INT
DECLARE @IngresoHorario CHAR(8)
	,@Mintarde VARCHAR(18)
	,@IngresoSalida CHAR(8)

SET DATEFIRST 1

DECLARE Fecha CURSOR
FOR
(
		SELECT DISTINCT Fecha
		FROM RRHH_TempFecha
		WHERE Fecha >= @FI
			AND Fecha <= @ff
			
		) order by Fecha asc
OPEN Fecha

FETCH NEXT
FROM FEcha
INTO @fecha

WHILE @@FETCH_STATUS = 0
BEGIN
	DECLARE a CURSOR
	FOR
	--Obtener los Codigos de los Empleados	
	SELECT E.idEmpleado
	FROM Empleado E
	WHERE Estado = 1
		AND (
			idTipoTrabajador = @idTipoTrabajador
			OR @idTipoTrabajador IS NULL
			)
		--AND E.idempleado = 2627
	
	OPEN a

	FETCH NEXT
	FROM a
	INTO @IdEmpleado --, @idhorario

	WHILE @@FETCH_STATUS = 0
	BEGIN		
		DECLARE @Hor_ent CHAR(8)
			,@Hor_sal CHAR(8)
			,@sal2 char(8)

		SET @Hor_ent = NULL
		SET @Hor_sal = NULL

		SELECT @d = datepart(weekday, @fecha)

		DECLARE @Feriado INT
		SET @Feriado = 0

		DECLARE @HT INT
		SET @HT = 0

		SELECT @Feriado = isnull(COUNT(*), 0)
		FROM RRHH_Feriado RF
		WHERE CONVERT(CHAR(10), RF.Fecha, 112) = CONVERT(CHAR(10), @Fecha, 112)

		--Si es un dia laborable
		IF (@d >= 1 AND @d <= 5) AND @Feriado = 0
		BEGIN				
			SELECT @Hor_ent = Hor_ent
				,@Hor_sal = Hor_sal
				,@idhorario = idHorario
			FROM Asistencia
			WHERE Fecha = @fecha
				AND idEmpleado = @IdEmpleado
			--print @fecha
			select @HT = COUNT(*) from HorarioTemporal where (CONVERT(char(8),@fecha,112) between FechaInicio and FechaFin) and idEmpleado=@idEmpleado
				
			if(@HT=1)
			Begin
			--print 'Temporal'		
			--TIENE HORARIO TEMPORAL
				Select @idHorario=H.idHorario
					from Horario H 
					where H.Estado=1 and H.idHorario=(select HorarioAsignado from HorarioTemporal where (CONVERT(char(8),@fecha,112) between FechaInicio and FechaFin) and idEmpleado=@idEmpleado)
			END
			--print @idhorario
			IF ( @idhorario IS NULL OR @idhorario = '')
			BEGIN
				SELECT @idhorario = E.idHorario
				FROM Empleado E
				WHERE e.idEmpleado = @IdEmpleado
			END
			--print @Hor_ent
			--print @Hor_sal
			
			Select @sal2=Salida2 from Horario where idHorario=@idhorario
			if(@Hor_sal < @sal2)
			SET @Hor_sal='00:00:00'

			print @IdEmpleado		
			IF @Hor_ent IS NULL OR @Hor_ent = '00:00:00' --Si es FALTA
			BEGIN --Agregamos su falta
				SELECT @k = Count(*)
				FROM permiso p
				INNER JOIN motivo_perm m ON p.idMotivo = m.idMotivo
				WHERE idEmpleado = @IdEmpleado
					AND @Fecha >= FEchaInicio
					AND @Fecha <= FechaFin
					AND m.idTipoPermiso = 1

				IF @k = 1
				BEGIN
					--				Print @k
					SELECT @ban = (m.Abrev)
					FROM permiso p
					INNER JOIN motivo_perm m ON p.idMotivo = m.idMotivo
					WHERE idEmpleado = @IdEmpleado
						AND @Fecha >= FEchaInicio
						AND @Fecha <= FechaFin

					--print @ban
					DECLARE @x INT

					SELECT @x = count(*)
					FROM RegAsisDiario
					WHERE Fecha = @Fecha
						AND IdEmpleado = @IdEmpleado

					IF @x = 1
					BEGIN
						UPDATE dbo.RegAsisDiario
						SET Estado = @ban --Asistio, pero no registro SAlida
						WHERE Fecha = @Fecha
							AND idEmpleado = @IdEmpleado

						SET @Hor_ent = NULL
						SET @Hor_sal = NULL
					END
					ELSE
					BEGIN
						INSERT dbo.RegAsisDiario (
							Fecha
							,IdEmpleado
							,Estado
							)
						VALUES (
							@Fecha
							,@IdEmpleado
							,@ban
							)

						SET @Hor_ent = NULL
						SET @Hor_sal = NULL
					END
				END
				ELSE
				BEGIN
					DECLARE @z INT

					SELECT @z = count(*)
					FROM RegAsisDiario
					WHERE Fecha = @Fecha
						AND IdEmpleado = @IdEmpleado

					IF @z = 1
					BEGIN
						UPDATE dbo.RegAsisDiario
						SET Estado = 'F' --Asistio, pero no registro SAlida
						WHERE Fecha = @Fecha
							AND idEmpleado = @IdEmpleado

						SET @Hor_ent = NULL
						SET @Hor_sal = NULL
					END
					ELSE
					BEGIN
						INSERT dbo.RegAsisDiario (
							Fecha
							,IdEmpleado
							,Estado
							)
						VALUES (
							@Fecha
							,@IdEmpleado
							,'F'
							)

						SET @Hor_ent = NULL
						SET @Hor_sal = NULL
					END
				END
			END
			ELSE
			BEGIN
				IF @Hor_sal = '00:00:00' OR @Hor_sal IS NULL
				BEGIN
					SELECT @k = Count(*)
					FROM permiso p
					INNER JOIN motivo_perm m ON p.idMotivo = m.idMotivo
					WHERE idEmpleado = @IdEmpleado
						AND @Fecha >= FEchaInicio
						AND @Fecha <= FechaFin
						AND m.idTipoPermiso = 1

					IF @k = 1
					BEGIN
						SELECT @ban = (m.Abrev)
						FROM permiso p
						INNER JOIN motivo_perm m ON p.idMotivo = m.idMotivo
						WHERE idEmpleado = @IdEmpleado
							AND @Fecha >= FEchaInicio
							AND @Fecha <= FechaFin

						--print @ban
						DECLARE @a INT

						SELECT @a = count(*)
						FROM RegAsisDiario
						WHERE Fecha = @Fecha
							AND IdEmpleado = @IdEmpleado

						IF @a = 1
						BEGIN
							UPDATE dbo.RegAsisDiario
							SET Estado = @ban --Asistio, pero no registro SAlida
							WHERE Fecha = @Fecha
								AND idEmpleado = @IdEmpleado

							SET @Hor_ent = NULL
							SET @Hor_sal = NULL
						END
						ELSE
						BEGIN
							INSERT dbo.RegAsisDiario (
								Fecha
								,IdEmpleado
								,Estado
								)
							VALUES (
								@Fecha
								,@IdEmpleado
								,@ban
								)

							SET @Hor_ent = NULL
							SET @Hor_sal = NULL
						END
					END
					ELSE
					BEGIN
						SELECT @IngresoHorario = H.Ingreso1
						FROM Horario H
						WHERE H.idHorario = @idhorario

						IF @Hor_ent > @IngresoHorario
						BEGIN
							SET @Mintarde = Substring(dbo.cDifTpos(@IngresoHorario, @Hor_ent), 11, 8)
								--set @Mintarde = cDifTpos(@Hor_ent, @IngresoHorario)						
						END
						ELSE
						BEGIN
							SET @Mintarde = NULL
						END

						DECLARE @AS INT

						SELECT @AS = Count(*)
						FROM RegAsisDiario
						WHERE Fecha = @Fecha
							AND IdEmpleado = @IdEmpleado

						IF @AS = 0
						BEGIN
							INSERT dbo.RegAsisDiario (
								Fecha
								,IdEmpleado
								,Estado
								,MinTarde
								)
							VALUES (
								@Fecha
								,@IdEmpleado
								,'AS'
								,@Mintarde
								)
						END
						ELSE
						BEGIN
							UPDATE dbo.RegAsisDiario
							SET Estado = 'AS' --Asistio, pero no registro SAlida
							WHERE Fecha = @Fecha
								AND idEmpleado = @IdEmpleado
						END

						SET @Mintarde = NULL
						SET @Hor_ent = NULL
						SET @Hor_sal = NULL
					END
				END
				ELSE
				BEGIN
					--Modificado AQUI 05-04-2017 // Obtener Horario Adicional					
					select @HT = COUNT(*) from HorarioTemporal where (CONVERT(char(8),@fecha,112) between FechaInicio and FechaFin) 
					and idEmpleado=@idEmpleado
					IF(@HT>=1)
					Begin
						Select @IngresoHorario=H.Ingreso1,	@IngresoSalida=H.Salida2
						from Horario H 
						where H.Estado=1 and H.idHorario=(
							select HorarioAsignado from HorarioTemporal where (CONVERT(char(8),@fecha,112) between FechaInicio and FechaFin) and idEmpleado=@idEmpleado
							)
					END
					ELSE
					BEGIN
						Select @IngresoHorario=H.Ingreso1,@IngresoSalida=H.Salida2
						from Horario H where H.idHorario=@idhorario
					END
					--SELECT @IngresoHorario = H.Ingreso1
					--FROM Horario H
					--WHERE H.idHorario = @idhorario

					IF @Hor_ent > @IngresoHorario
					BEGIN
						SET @Mintarde = Substring(dbo.cDifTpos(@IngresoHorario, @Hor_ent), 11, 8)
					END
					ELSE
					BEGIN
						SET @Mintarde = NULL
					END
					--PRINT @Mintarde
					DECLARE @Y INT

					SELECT @Y = Count(*)
					FROM RegAsisDiario
					WHERE Fecha = @Fecha
						AND IdEmpleado = @IdEmpleado

					IF @Y = 0
					BEGIN
						INSERT dbo.RegAsisDiario (
							Fecha
							,IdEmpleado
							,Estado
							,MinTarde
							)
						VALUES (
							@Fecha
							,@IdEmpleado
							,'1'
							,@Mintarde
							)
					END
					ELSE
					BEGIN
						UPDATE dbo.RegAsisDiario
						SET Estado = '1'
							,MinTarde = @Mintarde --Asistio, pero ya existe su salida en el reporte
						WHERE Fecha = @Fecha
							AND idEmpleado = @IdEmpleado
					END

					SET @Mintarde = NULL
					SET @Hor_ent = NULL
					SET @Hor_sal = NULL
				END
			END
		END
		ELSE
		BEGIN
			SELECT @Hor_ent = Hor_ent
				,@Hor_sal = Hor_sal
				,@idhorario = idHorario
			FROM Asistencia
			WHERE Fecha = @fecha
				AND idEmpleado = @IdEmpleado

			IF (
					@idhorario IS NULL
					OR @idhorario = ''
					)
			BEGIN
				SELECT @idhorario = E.idHorario
				FROM Empleado E
				WHERE e.idEmpleado = @IdEmpleado
			END

			IF @Hor_ent IS NOT NULL
				AND @Hor_ent <> '00:00:00'
			BEGIN
				--Modificado AQUI 05-04-2017
				

				SELECT @HT = COUNT(*)
				FROM HorarioTemporal
				WHERE (
						CONVERT(CHAR(8), @fecha, 112) BETWEEN FechaInicio
							AND FechaFin
						)
					AND idEmpleado = @idEmpleado

				IF (@HT >= 1)
				BEGIN
					SELECT @IngresoHorario = H.Ingreso1
						,@IngresoSalida = H.Salida2
					FROM Horario H
					WHERE H.Estado = 1
						AND H.idHorario = (
							SELECT HorarioAsignado
							FROM HorarioTemporal
							WHERE (
									CONVERT(CHAR(8), @fecha, 112) BETWEEN FechaInicio
										AND FechaFin
									)
								AND idEmpleado = @idEmpleado
							)
				END
				ELSE
				BEGIN
					SELECT @IngresoHorario = H.Ingreso1
						,@IngresoSalida = H.Salida2
					FROM Horario H
					WHERE H.idHorario = @idhorario
				END

				--declare @dif nvarchar(18)
				--set @dif = dbo.cDifTpos(@IngresoHorario,@Hor_ent)
				IF (
						(
							dbo.cDifTpos(@IngresoHorario, @Hor_ent) <= ' 00000000 00:15:00'
							OR Substring(dbo.cDifTpos(@IngresoHorario, @Hor_ent), 1, 1) = '-'
							)
						AND Substring(dbo.cDifTpos(@IngresoSalida, @Hor_sal), 1, 1) <> '-'
						)
				BEGIN
					DECLARE @b INT

					SELECT @b = Count(*)
					FROM RegAsisDiario
					WHERE Fecha = @Fecha
						AND IdEmpleado = @IdEmpleado

					IF @b = 0
					BEGIN
						INSERT dbo.RegAsisDiario (
							Fecha
							,IdEmpleado
							,Estado
							,MinTarde
							)
						VALUES (
							@Fecha
							,@IdEmpleado
							,'1'
							,@Mintarde
							)
					END
					ELSE
					BEGIN
						UPDATE dbo.RegAsisDiario
						SET Estado = '1'
							,MinTarde = @Mintarde --Asistio, pero ya existe su salida en el reporte
						WHERE Fecha = @Fecha
							AND idEmpleado = @IdEmpleado
					END

					SET @Mintarde = NULL
					SET @Hor_ent = NULL
					SET @Hor_sal = NULL
				END
				ELSE
				BEGIN
					IF @Feriado >= 1
						AND @Hor_ent IS NOT NULL
						AND @Hor_sal IS NOT NULL
					BEGIN
						DECLARE @bb INT

						SELECT @bb = Count(*)
						FROM RegAsisDiario
						WHERE Fecha = @Fecha
							AND IdEmpleado = @IdEmpleado

						IF @bb = 0
						BEGIN
							INSERT dbo.RegAsisDiario (
								Fecha
								,IdEmpleado
								,Estado
								,MinTarde
								)
							VALUES (
								@Fecha
								,@IdEmpleado
								,'1'
								,@Mintarde
								)
						END
						ELSE
						BEGIN
							UPDATE dbo.RegAsisDiario
							SET Estado = '1'
								,MinTarde = @Mintarde --Asistio, pero ya existe su salida en el reporte
							WHERE Fecha = @Fecha
								AND idEmpleado = @IdEmpleado
						END

						SET @Mintarde = NULL
						SET @Hor_ent = NULL
						SET @Hor_sal = NULL
					END
				END
			END
			ELSE
			BEGIN
				IF @Feriado >= 1
				BEGIN
					DECLARE @f INT

					SELECT @f = isnull(Count(*), 0)
					FROM RegAsisDiario
					WHERE Fecha = @Fecha
						AND IdEmpleado = @IdEmpleado

					IF @f = 0
					BEGIN
						INSERT dbo.RegAsisDiario (
							Fecha
							,IdEmpleado
							,Estado
							,MinTarde
							)
						VALUES (
							@Fecha
							,@IdEmpleado
							,'FR'
							,@Mintarde
							)
					END
					ELSE
					BEGIN
						UPDATE dbo.RegAsisDiario
						SET Estado = 'FR' --Asistio, pero ya existe su salida en el reporte
						WHERE Fecha = @Fecha
							AND idEmpleado = @IdEmpleado
					END

					SET @Mintarde = NULL
					SET @Hor_ent = NULL
					SET @Hor_sal = NULL
				END

				DECLARE @kf INT

				SELECT @kf = Count(*)
				FROM permiso p
				INNER JOIN motivo_perm m ON p.idMotivo = m.idMotivo
				WHERE idEmpleado = @IdEmpleado
					AND @Fecha >= FEchaInicio
					AND @Fecha <= FechaFin
					AND m.idTipoPermiso = 1

				IF @kf = 1
				BEGIN
					SELECT @ban = (m.Abrev)
					FROM permiso p
					INNER JOIN motivo_perm m ON p.idMotivo = m.idMotivo
					WHERE idEmpleado = @IdEmpleado
						AND @Fecha >= FEchaInicio
						AND @Fecha <= FechaFin

					DECLARE @xf INT

					SELECT @xf = count(*)
					FROM RegAsisDiario
					WHERE Fecha = @Fecha
						AND IdEmpleado = @IdEmpleado

					IF @xf = 1
					BEGIN
						UPDATE dbo.RegAsisDiario
						SET Estado = @ban --Asistio, pero no registro SAlida
						WHERE Fecha = @Fecha
							AND idEmpleado = @IdEmpleado

						SET @Hor_ent = NULL
						SET @Hor_sal = NULL
					END
					ELSE
					BEGIN
						INSERT dbo.RegAsisDiario (
							Fecha
							,IdEmpleado
							,Estado
							)
						VALUES (
							@Fecha
							,@IdEmpleado
							,@ban
							)

						SET @Hor_ent = NULL
						SET @Hor_sal = NULL
					END
				END
			END
		END

		--End		
		FETCH NEXT
		FROM a
		INTO @IdEmpleado --, @idhorario
	END

	CLOSE a

	DEALLOCATE a

	FETCH NEXT
	FROM FEcha
	INTO @fecha
END

CLOSE fecha

DEALLOCATE fecha

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_ImportarAsistenciaBio]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_ImportarAsistenciaBio] AS' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRRHH_ImportarAsistenciaBio]    Script Date: 14/09/2023 09:47:20 a. m. ******/

ALTER proc [dbo].[spRRHH_ImportarAsistenciaBio]

--Declare
@FechaInicio nvarchar(8),
@FechaFin nvarchar(8)

--set @FechaInicio='20230801'
--set @FechaFin='20230831'

as

SET NOCOUNT ON;

--Declaracion de Variables Globales
Declare @HOY datetime, @Fecha datetime, @DNI char(8), @Hora char(8), @Tolerancia char(8), @Local char(5),@ToleranciaV char(8)
Set @Tolerancia='00:15:00'
Set @ToleranciaV='02:00:00'

SET @HOY=GETDATE();

declare Registros cursor for 
select 
CONVERT(nVarchar(32), DATEADD(s, nDateTime, '1970-01-01'), 20) as Fecha,
EL.nUserID --, U.sUserName
,CONVERT(nvarchar(500), EL.nReaderIdn) AS Terminal
from  Biometrico.dbo.TB_EVENT_LOG EL
inner join  Biometrico.dbo.TB_USER U on EL.nUserID=U.sUserID
inner join  Biometrico.dbo.TB_EVENT_DATA ED on ED.nEventIdn=EL.nEventIdn
where (EL.nEventIdn=55 or EL.nEventIdn=39 or EL.nEventIdn=47 or EL.nEventIdn=43) and
(CONVERT(char(8),DATEADD(s, nDateTime, '1970-01-01'),112) between @FechaInicio and @FechaFin)
UNION
SELECT  
[iclock_transaction].[punch_time],
[iclock_transaction].[emp_code],   
[iclock_transaction].[terminal_sn]
FROM [10.10.51.119].[zkbiotime].[dbo].[iclock_transaction] 
WHERE 
convert(char(8),[iclock_transaction].[punch_time],112) between @FechaInicio and @FechaFin
--and [iclock_transaction].[emp_code] ='41019488'
ORDER BY 1 asc;
---------------------------------------------------------------
--select 
--CONVERT(nVarchar(32), DATEADD(s, nDateTime, '1970-01-01'), 20) as Fecha,
--EL.nUserID --, U.sUserName
--,CONVERT(nvarchar(500), EL.nReaderIdn) AS Terminal
--from  [10.10.51.19].Biometrico.dbo.TB_EVENT_LOG EL
--inner join  [10.10.51.19].Biometrico.dbo.TB_USER U on EL.nUserID=U.sUserID
----inner join  Biostar.dbo.TB_EVENT_DATA ED on ED.nEventIdn=EL.nEventIdn
--where (EL.nEventIdn=55 or EL.nEventIdn=39 or EL.nEventIdn=47 or EL.nEventIdn=43) and
--(CONVERT(char(8),DATEADD(s, nDateTime, '1970-01-01'),112) between @FechaInicio and @FechaFin)
----and EL.nUserID='72789864'
--UNION
--SELECT  
--[iclock_transaction].[punch_time],
--[iclock_transaction].[emp_code],   
--[iclock_transaction].[terminal_sn]
--FROM [10.10.51.119].[zkbiotime].[dbo].[iclock_transaction] 
--WHERE 
--convert(char(8),[iclock_transaction].[punch_time],112) between @FechaInicio and @FechaFin
----and [iclock_transaction].[emp_code] ='41019488'
--ORDER BY 1 asc;


open Registros
FETCH NEXT FROM Registros INTO @fecha,@DNI, @Local
WHILE @@FETCH_STATUS=0
Begin
	
	/*Declaracion de Variables*/
	Declare @idEmpleado int=null, @idHorario int=null, @idHorarioPrincipal int=null
	Declare @HoraIngreso datetime=null, @HoraSalida datetime=null
	Declare @HoraSalidaAlmuerzo datetime=null, @HoraIngresoAlmuerzo datetime = null
	Declare @DiaSgt bit =  null
	Declare @HoraMarcado char(8)=null
	Declare @Verificar char(8)=null, @VerificarM char(8)=null
	Declare @Estado char(2)=null
	Declare @ECheck int=0
	 
	/*Fin de Variables*/
	if(len(@DNI)<8)
	Begin
		set @DNI='0'+@DNI
	End
		
	Select @idEmpleado=E.IdEmpleado,@idHorario=E.idHorario,@idHorarioPrincipal=E.idHorario from Empleado E
	inner join Persona P on E.IdPersona=P.IdPersona 
	where E.Estado=1 and P.NumDocID=@DNI
	print '------------'
	print @fecha
	print '------------'
	print @idEmpleado	
	Declare @HT int
	select @HT = COUNT(*) from HorarioTemporal where (CONVERT(char(8),@fecha,112) between FechaInicio and FechaFin) and idEmpleado=@idEmpleado
	print 'Tiene HT:' + CAST(@HT AS VARCHAR) 
	if(@HT>=1)
	Begin
		Select @HoraIngreso=H.Ingreso1,	@HoraSalida=H.Salida2, 
		@HoraSalidaAlmuerzo=H.Salida1, 	@HoraIngresoAlmuerzo=H.Ingreso2 ,
		@DiaSgt = H.SgtDia,
		@idHorario=H.idHorario
		from Horario H 
		where H.Estado=1 and H.idHorario=(
		select HorarioAsignado from HorarioTemporal where (CONVERT(char(8),@fecha,112) between FechaInicio and FechaFin) and idEmpleado=@idEmpleado
		)
	End
	else
	Begin
		Select @HoraIngreso=H.Ingreso1,	@HoraSalida=H.Salida2, 
		@HoraSalidaAlmuerzo=H.Salida1, 	@HoraIngresoAlmuerzo=H.Ingreso2,
		@DiaSgt = H.SgtDia,
		@idHorario=H.idHorario
		from Horario H 
		where H.Estado=1 and H.idHorario=@idHorarioPrincipal
	End
	print 'Horario:' + CAST(@idHorario AS VARCHAR) 
	SELECT @HoraMarcado=convert(varchar, @fecha, 108)	
	if(@idEmpleado is not null)
	Begin
	
	if(@DiaSgt=1)
		Begin		
			--Select @Verificar= A.Hor_Sal from Asistencia A 
			--where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha-1,112)
			--if(@Verificar is null)
			--Begin
				if (CAST(@HoraIngreso AS datetime)- @HoraMarcado <=  @ToleranciaV )
				Begin
					--Ingresar Entrada										
					if(@HoraMarcado <= @HoraIngreso)--Ingreso Antes de la Tolerancia
					Begin
						Select @Verificar= A.Hor_Ent from Asistencia A 
						where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
						if (@Verificar is  null)
						Begin
							Insert Asistencia(Fecha, IdEmpleado, Hor_Ent, Hor_Sal, Alm_Sal, Alm_Ent, idHorario)
							values (CONVERT(char(8),@fecha,112),@idEmpleado, @HoraMarcado, '00:00:00','00:00:00','00:00:00',@idHorario)
							
							set @Estado = '1N'
							Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
							values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 	

							set @Verificar=null
							Goto Fin
						End			
					End		
				
					if(@HoraMarcado > @HoraIngreso)-- and @HoraMarcado < @HoraSalidaAlmuerzo)
					Begin
						if (CAST(@HoraMarcado AS datetime)- @HoraIngreso <=  @Tolerancia )
						Begin
							Select @Verificar= A.Hor_Ent from Asistencia A 
							where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
							if (@Verificar is  null)
							Begin
								Insert Asistencia(Fecha, IdEmpleado, Hor_Ent, Hor_Sal, Alm_Sal, Alm_Ent, idHorario)
								values (CONVERT(char(8),@fecha,112),@idEmpleado, @HoraMarcado, '00:00:00','00:00:00','00:00:00',@idHorario)
								
								set @Estado = '1T'
								Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
								values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 				

								set @Verificar=null
								Goto Fin
							End				
						End	
						Else
						Begin
							if( NOT EXISTS(Select * from Marcacion where Fecha=@Fecha and IdEmpleado=@idEmpleado))
							Begin				
							set @Estado = '1X'
							Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
							values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 	
							End
						End	
					End					
					-- Fin Ingresar Entrada
				End				
				
				Salida:
				
				--Ingresar Salida
				declare @prueba datetime=CAST(@HoraSalida AS datetime)- @HoraMarcado				
				if (CAST(@HoraSalida AS datetime)- @HoraMarcado <=  @ToleranciaV )
				Begin	
					if(@HoraMarcado >=@HoraSalida)
						Begin
							Select @Verificar= A.Hor_Ent, @VerificarM=A.Hor_Sal from Asistencia A 
							where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha-1,112)
							if (@Verificar is not null and @VerificarM = '00:00:00')
							Begin								
								Update Asistencia
								set Hor_Sal=@HoraMarcado
								where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha-1,112)						  
												
								set @Estado = '4N'
								Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
								values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 
					
								set @Verificar=null
							End		
						End
				--Fin Ingresar Salida
				End	
		
		End	
	else
	Begin	
		if(@HoraMarcado <= @HoraIngreso)--Ingreso Antes de la Tolerancia
		Begin 						
			Select @Verificar= A.Hor_Ent from Asistencia A 
			where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
			
			if (@Verificar is  null)
			Begin
				PRINT 'INSERT ENTRADA'
				Insert Asistencia(Fecha, IdEmpleado, Hor_Ent, Hor_Sal, Alm_Sal, Alm_Ent, idHorario)
						  values (CONVERT(char(8),@fecha,112),@idEmpleado, @HoraMarcado, '00:00:00','00:00:00','00:00:00',@idHorario)
				
				set @Estado = '1N'
				Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
				values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 	

				set @Verificar=null
			End	
			ELSE
			BEGIN
			--SE AGREGO PARA MODIFICAR LOS ESPECIALES
				if(@HT>=1)
				Begin
					if(@ECheck=0)
					Begin
						print 'UPDATE ENTRADA X ESPECIAL'
						UPDATE Asistencia
						SET
						Hor_Ent=@HoraMarcado,
						idHorario=@idHorario
						WHERE IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)
						SET @ECheck=1
						set @Verificar=null
					END
				END
			END
		End		
		
		if(@HoraMarcado > @HoraIngreso and @HoraMarcado < @HoraSalidaAlmuerzo)
		Begin
			if (CAST(@HoraMarcado AS datetime)- @HoraIngreso <=  @Tolerancia )
			Begin
				Select @Verificar= A.Hor_Ent from Asistencia A 
				where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
				if (@Verificar is  null)
				Begin
					Insert Asistencia(Fecha, IdEmpleado, Hor_Ent, Hor_Sal, Alm_Sal, Alm_Ent, idHorario)
							  values (CONVERT(char(8),@fecha,112),@idEmpleado, @HoraMarcado, '00:00:00','00:00:00','00:00:00',@idHorario)
					
					set @Estado = '1T'
					Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
					values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 				

					set @Verificar=null
				End				
			End	
			Else
			Begin
				if( NOT EXISTS(Select * from Marcacion where Fecha=@Fecha and IdEmpleado=@idEmpleado))
				Begin				
				set @Estado = '1X'
				Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
				values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 	
				End
			End	
		End
		
		if(@HoraMarcado >= @HoraSalidaAlmuerzo and @HoraMarcado < @HoraIngresoAlmuerzo)
		Begin			
			Select @Verificar= A.Hor_Ent, @VerificarM=A.Alm_Sal from Asistencia A 
			where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
			if (@Verificar is not null and @Verificar <> '00:00:00' and @VerificarM = '00:00:00' )
			Begin
				IF(CAST(@HoraMarcado AS datetime)- @HoraSalidaAlmuerzo <=  @Tolerancia )
				Begin
					Update Asistencia
					set Alm_Sal=@HoraMarcado
					where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)						  
									
					set @Estado = '2N'
					Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
					values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 
									
					set @Verificar=null
				End
				ELSE
				BEGIN
					Update Asistencia
					set Alm_Sal=@HoraMarcado
					where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)						  
									
					set @Estado = '2T'
					Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
					values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 
									
					set @Verificar=null
				END				
			End
			Else if(@Verificar is not null and @Verificar <> '00:00:00' and @VerificarM <> '00:00:00')
			Begin
				IF(@HoraIngresoAlmuerzo - CAST(@HoraMarcado AS datetime) <=  @Tolerancia )
				Begin
					Update Asistencia
					set Alm_Ent=@HoraMarcado
					where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)						  
									
					set @Estado = '3N'
					Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
					values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 

					set @Verificar=null
				End
			END			
		End		 
		 
		if(@HoraMarcado >= @HoraIngresoAlmuerzo and @HoraMarcado < @HoraSalida)
		Begin
			if (CAST(@HoraMarcado AS datetime)- @HoraIngresoAlmuerzo <=  @Tolerancia )
			Begin				
				Select @Verificar= A.Hor_Ent, @VerificarM= A.Alm_Ent from Asistencia A 
				where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
				if (@Verificar is not null and @Verificar <> '00:00:00' and @VerificarM='00:00:00' )
				Begin
					Update Asistencia
					set Alm_Ent=@HoraMarcado
					where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)						  
									
					set @Estado = '3T'
					Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
					values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 
								
					set @Verificar=null
				End		
			End		
		End		
		
		if(@HoraMarcado >=@HoraSalida)
		Begin
			Select @Verificar= A.Hor_Ent, @VerificarM=A.Hor_Sal from Asistencia A 
			where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
			if (@Verificar is not null and @Verificar<>'00:00:00' and @VerificarM='00:00:00')
			Begin
				--Insert Asistencia(Fecha, IdEmpleado, Hor_Ent, Hor_Sal, Alm_Sal, Alm_Ent, idHorario)
				--		  values (@fecha,@idEmpleado, @HoraMarcado, '00:00:00','00:00:00','00:00:00',@idHorario)
				
				Update Asistencia
				set Hor_Sal=@HoraMarcado
				where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)						  
								
				set @Estado = '4N'
				Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
				values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 
	
				set @Verificar=null
			End	
		End
	End
		
	End	
	Fin:
	FETCH NEXT FROM Registros INTO @fecha,@DNI,@Local
End
close Registros
deallocate Registros

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_ImportarAsistenciaBioFacial]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_ImportarAsistenciaBioFacial] AS' 
END
GO
/****** Object:  StoredProcedure [dbo].[spRRHH_ImportarAsistenciaBio]    Script Date: 14/09/2023 09:47:20 a. m. ******/

ALTER proc [dbo].[spRRHH_ImportarAsistenciaBioFacial]

--Declare
@FechaInicio nvarchar(8),
@FechaFin nvarchar(8)

--set @FechaInicio='20230801'
--set @FechaFin='20230831'

as

SET NOCOUNT ON;

--Declaracion de Variables Globales
Declare @HOY datetime, @Fecha datetime, @DNI char(8), @Hora char(8), @Tolerancia char(8), @Local char(5),@ToleranciaV char(8)
Set @Tolerancia='00:15:00'
Set @ToleranciaV='02:00:00'

SET @HOY=GETDATE();

declare Registros cursor for 


SELECT  
[iclock_transaction].[punch_time],
[iclock_transaction].[emp_code],   
[iclock_transaction].[terminal_sn]
FROM [10.10.51.119].[zkbiotime].[dbo].[iclock_transaction] 
WHERE 
convert(char(8),[iclock_transaction].[punch_time],112) between @FechaInicio and @FechaFin
ORDER BY [iclock_transaction].[punch_time] asc


open Registros
FETCH NEXT FROM Registros INTO @fecha,@DNI, @Local
WHILE @@FETCH_STATUS=0
Begin
	
	/*Declaracion de Variables*/
	Declare @idEmpleado int=null, @idHorario int=null, @idHorarioPrincipal int=null
	Declare @HoraIngreso datetime=null, @HoraSalida datetime=null
	Declare @HoraSalidaAlmuerzo datetime=null, @HoraIngresoAlmuerzo datetime = null
	Declare @DiaSgt bit =  null
	Declare @HoraMarcado char(8)=null
	Declare @Verificar char(8)=null, @VerificarM char(8)=null
	Declare @Estado char(2)=null
	Declare @ECheck int=0
	 
	/*Fin de Variables*/
	if(len(@DNI)<8)
	Begin
		set @DNI='0'+@DNI
	End
		
	Select @idEmpleado=E.IdEmpleado,@idHorario=E.idHorario,@idHorarioPrincipal=E.idHorario from Empleado E
	inner join Persona P on E.IdPersona=P.IdPersona 
	where E.Estado=1 and P.NumDocID=@DNI
	print '------------'
	print @fecha
	print '------------'
	print @idEmpleado	
	Declare @HT int
	select @HT = COUNT(*) from HorarioTemporal where (CONVERT(char(8),@fecha,112) between FechaInicio and FechaFin) and idEmpleado=@idEmpleado
	print 'Tiene HT:' + CAST(@HT AS VARCHAR) 
	if(@HT>=1)
	Begin
		Select @HoraIngreso=H.Ingreso1,	@HoraSalida=H.Salida2, 
		@HoraSalidaAlmuerzo=H.Salida1, 	@HoraIngresoAlmuerzo=H.Ingreso2 ,
		@DiaSgt = H.SgtDia,
		@idHorario=H.idHorario
		from Horario H 
		where H.Estado=1 and H.idHorario=(
		select HorarioAsignado from HorarioTemporal where (CONVERT(char(8),@fecha,112) between FechaInicio and FechaFin) and idEmpleado=@idEmpleado
		)
	End
	else
	Begin
		Select @HoraIngreso=H.Ingreso1,	@HoraSalida=H.Salida2, 
		@HoraSalidaAlmuerzo=H.Salida1, 	@HoraIngresoAlmuerzo=H.Ingreso2,
		@DiaSgt = H.SgtDia,
		@idHorario=H.idHorario
		from Horario H 
		where H.Estado=1 and H.idHorario=@idHorarioPrincipal
	End
	print 'Horario:' + CAST(@idHorario AS VARCHAR) 
	SELECT @HoraMarcado=convert(varchar, @fecha, 108)	
	if(@idEmpleado is not null)
	Begin
	
	if(@DiaSgt=1)
		Begin		
			--Select @Verificar= A.Hor_Sal from Asistencia A 
			--where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha-1,112)
			--if(@Verificar is null)
			--Begin
				if (CAST(@HoraIngreso AS datetime)- @HoraMarcado <=  @ToleranciaV )
				Begin
					--Ingresar Entrada										
					if(@HoraMarcado <= @HoraIngreso)--Ingreso Antes de la Tolerancia
					Begin
						Select @Verificar= A.Hor_Ent from Asistencia A 
						where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
						if (@Verificar is  null)
						Begin
							Insert Asistencia(Fecha, IdEmpleado, Hor_Ent, Hor_Sal, Alm_Sal, Alm_Ent, idHorario)
							values (CONVERT(char(8),@fecha,112),@idEmpleado, @HoraMarcado, '00:00:00','00:00:00','00:00:00',@idHorario)
							
							set @Estado = '1N'
							Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
							values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 	

							set @Verificar=null
							Goto Fin
						End			
					End		
				
					if(@HoraMarcado > @HoraIngreso)-- and @HoraMarcado < @HoraSalidaAlmuerzo)
					Begin
						if (CAST(@HoraMarcado AS datetime)- @HoraIngreso <=  @Tolerancia )
						Begin
							Select @Verificar= A.Hor_Ent from Asistencia A 
							where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
							if (@Verificar is  null)
							Begin
								Insert Asistencia(Fecha, IdEmpleado, Hor_Ent, Hor_Sal, Alm_Sal, Alm_Ent, idHorario)
								values (CONVERT(char(8),@fecha,112),@idEmpleado, @HoraMarcado, '00:00:00','00:00:00','00:00:00',@idHorario)
								
								set @Estado = '1T'
								Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
								values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 				

								set @Verificar=null
								Goto Fin
							End				
						End	
						Else
						Begin
							if( NOT EXISTS(Select * from Marcacion where Fecha=@Fecha and IdEmpleado=@idEmpleado))
							Begin				
							set @Estado = '1X'
							Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
							values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 	
							End
						End	
					End					
					-- Fin Ingresar Entrada
				End				
				
				Salida:
				
				--Ingresar Salida
				declare @prueba datetime=CAST(@HoraSalida AS datetime)- @HoraMarcado				
				if (CAST(@HoraSalida AS datetime)- @HoraMarcado <=  @ToleranciaV )
				Begin	
					if(@HoraMarcado >=@HoraSalida)
						Begin
							Select @Verificar= A.Hor_Ent, @VerificarM=A.Hor_Sal from Asistencia A 
							where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha-1,112)
							if (@Verificar is not null and @VerificarM = '00:00:00')
							Begin								
								Update Asistencia
								set Hor_Sal=@HoraMarcado
								where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha-1,112)						  
												
								set @Estado = '4N'
								Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
								values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 
					
								set @Verificar=null
							End		
						End
				--Fin Ingresar Salida
				End	
		
		End	
	else
	Begin	
		if(@HoraMarcado <= @HoraIngreso)--Ingreso Antes de la Tolerancia
		Begin 						
			Select @Verificar= A.Hor_Ent from Asistencia A 
			where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
			
			if (@Verificar is  null)
			Begin
				PRINT 'INSERT ENTRADA'
				Insert Asistencia(Fecha, IdEmpleado, Hor_Ent, Hor_Sal, Alm_Sal, Alm_Ent, idHorario)
						  values (CONVERT(char(8),@fecha,112),@idEmpleado, @HoraMarcado, '00:00:00','00:00:00','00:00:00',@idHorario)
				
				set @Estado = '1N'
				Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
				values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 	

				set @Verificar=null
			End	
			ELSE
			BEGIN
			--SE AGREGO PARA MODIFICAR LOS ESPECIALES
				if(@HT>=1)
				Begin
					if(@ECheck=0)
					Begin
						print 'UPDATE ENTRADA X ESPECIAL'
						UPDATE Asistencia
						SET
						Hor_Ent=@HoraMarcado,
						idHorario=@idHorario
						WHERE IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)
						SET @ECheck=1
						set @Verificar=null
					END
				END
			END
		End		
		
		if(@HoraMarcado > @HoraIngreso and @HoraMarcado < @HoraSalidaAlmuerzo)
		Begin
			if (CAST(@HoraMarcado AS datetime)- @HoraIngreso <=  @Tolerancia )
			Begin
				Select @Verificar= A.Hor_Ent from Asistencia A 
				where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
				if (@Verificar is  null)
				Begin
					Insert Asistencia(Fecha, IdEmpleado, Hor_Ent, Hor_Sal, Alm_Sal, Alm_Ent, idHorario)
							  values (CONVERT(char(8),@fecha,112),@idEmpleado, @HoraMarcado, '00:00:00','00:00:00','00:00:00',@idHorario)
					
					set @Estado = '1T'
					Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
					values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 				

					set @Verificar=null
				End				
			End	
			Else
			Begin
				if( NOT EXISTS(Select * from Marcacion where Fecha=@Fecha and IdEmpleado=@idEmpleado))
				Begin				
				set @Estado = '1X'
				Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
				values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 	
				End
			End	
		End
		
		if(@HoraMarcado >= @HoraSalidaAlmuerzo and @HoraMarcado < @HoraIngresoAlmuerzo)
		Begin			
			Select @Verificar= A.Hor_Ent, @VerificarM=A.Alm_Sal from Asistencia A 
			where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
			if (@Verificar is not null and @Verificar <> '00:00:00' and @VerificarM = '00:00:00' )
			Begin
				IF(CAST(@HoraMarcado AS datetime)- @HoraSalidaAlmuerzo <=  @Tolerancia )
				Begin
					Update Asistencia
					set Alm_Sal=@HoraMarcado
					where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)						  
									
					set @Estado = '2N'
					Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
					values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 
									
					set @Verificar=null
				End
				ELSE
				BEGIN
					Update Asistencia
					set Alm_Sal=@HoraMarcado
					where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)						  
									
					set @Estado = '2T'
					Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
					values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 
									
					set @Verificar=null
				END				
			End
			Else if(@Verificar is not null and @Verificar <> '00:00:00' and @VerificarM <> '00:00:00')
			Begin
				IF(@HoraIngresoAlmuerzo - CAST(@HoraMarcado AS datetime) <=  @Tolerancia )
				Begin
					Update Asistencia
					set Alm_Ent=@HoraMarcado
					where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)						  
									
					set @Estado = '3N'
					Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
					values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 

					set @Verificar=null
				End
			END			
		End		 
		 
		if(@HoraMarcado >= @HoraIngresoAlmuerzo and @HoraMarcado < @HoraSalida)
		Begin
			if (CAST(@HoraMarcado AS datetime)- @HoraIngresoAlmuerzo <=  @Tolerancia )
			Begin				
				Select @Verificar= A.Hor_Ent, @VerificarM= A.Alm_Ent from Asistencia A 
				where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
				if (@Verificar is not null and @Verificar <> '00:00:00' and @VerificarM='00:00:00' )
				Begin
					Update Asistencia
					set Alm_Ent=@HoraMarcado
					where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)						  
									
					set @Estado = '3T'
					Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
					values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 
								
					set @Verificar=null
				End		
			End		
		End		
		
		if(@HoraMarcado >=@HoraSalida)
		Begin
			Select @Verificar= A.Hor_Ent, @VerificarM=A.Hor_Sal from Asistencia A 
			where A.IdEmpleado=@idEmpleado and CONVERT(char(8),A.Fecha,112)=CONVERT(char(8),@fecha,112)
			if (@Verificar is not null and @Verificar<>'00:00:00' and @VerificarM='00:00:00')
			Begin
				--Insert Asistencia(Fecha, IdEmpleado, Hor_Ent, Hor_Sal, Alm_Sal, Alm_Ent, idHorario)
				--		  values (@fecha,@idEmpleado, @HoraMarcado, '00:00:00','00:00:00','00:00:00',@idHorario)
				
				Update Asistencia
				set Hor_Sal=@HoraMarcado
				where IdEmpleado=@idEmpleado and CONVERT(char(8),Fecha,112)=CONVERT(char(8),@fecha,112)						  
								
				set @Estado = '4N'
				Insert Marcacion (Fecha,Estado,IdEmpleado,Lugar,idHorario)
				values(@fecha,@Estado,@idEmpleado,@Local,@idHorario) 
	
				set @Verificar=null
			End	
		End
	End
		
	End	
	Fin:
	FETCH NEXT FROM Registros INTO @fecha,@DNI,@Local
End
close Registros
deallocate Registros

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_ListarMotivos_byTipo]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_ListarMotivos_byTipo] AS' 
END
GO
ALTER proc [dbo].[spRRHH_ListarMotivos_byTipo]
@TipoModalidad char(1)
as
select Abrev, Descrip_Motivo from dbo.Motivo_Perm M
where M.Activo=1 and TipoModalidad=@TipoModalidad
and Abrev <> '1'
order by 1
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_ListarResolucion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_ListarResolucion] AS' 
END
GO
ALTER proc [dbo].[spRRHH_ListarResolucion]
@idEmpleado int
as
select T.DescripTipoResolucion, FechaResolucion, NumeroResolucion, idResolucion from Resolucion R
inner join TipoResolucion T on R.idTipoResolucion=T.idTipoResolucion
where R.idEmpleado=@idEmpleado
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_ListarRotaciones]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_ListarRotaciones] AS' 
END
GO
ALTER proc [dbo].[spRRHH_ListarRotaciones]
@idEmpleado int
as
select r.idRotacion, R.FechaMemo, R.NroMemo, EO.AreaOrganizacional from Rotacion R
inner join EstructOrganiz EO on R.idAreaOrganiz=EO.idAreaOrganiz and R.Year=EO.Year
where R.idEmpleado=@idEmpleado 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_ListarTrabajadores]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_ListarTrabajadores] AS' 
END
GO
ALTER proc [dbo].[spRRHH_ListarTrabajadores]
@IdTipoTrabajador int
as
Select E.IdEmpleado, (P.Apellido_Paterno + ' ' + P.Apellido_Materno + ', ' + P.Nombres) NombresCompletos from Persona P 
inner join Empleado E on P.IdPersona=E.IdPersona
inner join Empleado_Area Ea on Ea.IdEmpleado=E.IdEmpleado and Ea.Year=Year(getdate())
where E.IdEmpleado not in (select distinct IdEmpleado from AuxRRHH_ReporteAsistencia) and E.Estado=1 and E.IdTipoTrabajador=@IdTipoTrabajador
order by P.Apellido_Paterno


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_ListarTrabajadoresRep]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_ListarTrabajadoresRep] AS' 
END
GO
ALTER proc [dbo].[spRRHH_ListarTrabajadoresRep]
@IdTipoTrabajador int
as
Select E.IdEmpleado, (P.Apellido_Paterno + ' ' + P.Apellido_Materno + ', ' + P.Nombres) NombresCompletos from Persona P 
inner join Empleado E on P.IdPersona=E.IdPersona
inner join Empleado_Area Ea on Ea.IdEmpleado=E.IdEmpleado and Ea.Year=Year(getdate())
where E.IdEmpleado in (select distinct IdEmpleado from AuxRRHH_ReporteAsistencia) and E.Estado=1 and E.IdTipoTrabajador=@IdTipoTrabajador
order by P.Apellido_Paterno
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_llenarHorarioTemporal]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_llenarHorarioTemporal] AS' 
END
GO
ALTER proc [dbo].[spRRHH_llenarHorarioTemporal]
@IdEmpleado int
as
SELECT 
HT.N,HT.FechaInicio,HT.FechaFin,H.Descrip_Horario, H.Ingreso1,H.Salida2,HT.NroDocumento, HT.Sisgedo
FROM HorarioTemporal HT
inner join Horario H on H.idHorario=HT.HorarioAsignado 
where IdEmpleado=@IdEmpleado
order by convert(char(8),FechaInicio, 112) desc




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_llenarPermiso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_llenarPermiso] AS' 
END
GO
ALTER proc [dbo].[spRRHH_llenarPermiso]
@IdEmpleado int,
@idTipoPermiso int=null,
@idmotivo int=null
as
SELECT 
tp.DescripTipoPermiso, 
m.Descrip_Motivo,
NPermiso,FechaInicio,FechaFin,Hora_Sal,Hora_Ret,dia,Retorno,Lugar,Referencia,Autorizacion
,IdEmpleado
FROM PERMISO p
inner join motivo_perm m on p.idmotivo=m.idmotivo
inner join TipoPermiso tp on tp.idTipoPermiso=m.idTipoPermiso
where IdEmpleado=@IdEmpleado
and (tp.idTipoPermiso=@idTipoPermiso or @idTipoPermiso is null)
and (m.idmotivo=@idmotivo or @idmotivo is null)
order by convert(char(8),FechaInicio, 112) desc




GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SpRRHH_Marcacion_Import]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SpRRHH_Marcacion_Import] AS' 
END
GO
ALTER proc [dbo].[SpRRHH_Marcacion_Import] --'17968976','2010/01/02 07:30:00','1N','SEDE'
	@DNI char(12)
	,@Fecha datetime --YYYY/MM/DD
	,@Estado char(2)
	,@Lugar varchar(10)
	,@Forzar bit
as
declare @IdEmpleado int
declare @idHorarioEmpleado int
select @IdEmpleado=e.idEmpleado, @idHorarioEmpleado=e.idHorario
from Persona p inner join Empleado e on e.idPersona = p.idPersona 
where NumDocID=@DNI and e.Estado=1
if(@idEmpleado is null)
	begin
		--raiserror('Empleado No existe',16,1)
		return
	end
else	  
	begin

		declare @num int
		select @num=count(*)from Marcacion where IdEmpleado=@IdEmpleado and Fecha=@Fecha
		if @num=1 
			--raiserror('Ya fue Ingresado',16,1)
			begin
			if @Forzar = 0
				begin					
					return 
				end
			Else
				Begin
					declare @Flag char(1)														
					Select @Flag = Right(M.Estado,1) from Marcacion M where M.Fecha=@Fecha and M.IdEmpleado=@IdEmpleado
					if (@Flag='M')
						Begin
							return
						End
					else
						Begin
							Update Marcacion
							set Estado=@Estado,
							Lugar=@Lugar
							Where Fecha=@Fecha and IdEmpleado=@IdEmpleado
						End	
				end
			End
		else
			Begin
			if (@Lugar is null or @Lugar = '') set @Lugar = 'SEDE'
			INSERT [Marcacion]
			   ([Fecha]
			   ,[IdEmpleado]
			   ,[Estado]
			   ,[Lugar]
			   )
		 VALUES
			   (@Fecha
			   ,@IdEmpleado
			   ,@Estado
			   ,@Lugar
			   )
			End	
		
	end

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_ObtenerHorasExtras]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_ObtenerHorasExtras] AS' 
END
GO
ALTER proc [dbo].[spRRHH_ObtenerHorasExtras]
--declare
@FechaI varchar(8),
@FechaF varchar(8),
@tipo int
--set @FechaI='20121224'
--set @FechaF='20121231'
--set @tipo=2
as
SET DATEFIRST 1
--SELECT
--A.idempleado, (P.Apellido_Paterno + ' ' + P.Apellido_Materno + ', ' + P.Nombres) as NombreCompleto,
--RIGHT('00' + CONVERT (VARCHAR(2),SUM (DATEPART(MINUTE, convert(datetime,substring(dbo.fDifFechas(Hor_sal, '16:00:00'),10,17)) )) / 60 + SUM (DATEPART(HOUR, convert(datetime,substring(dbo.fDifFechas(Hor_sal, '16:00:00'),10,17)) ) )), 2) + ':' + CONVERT (CHAR (2), SUM (DATEPART(MINUTE, convert(datetime,substring(dbo.fDifFechas(Hor_sal, '16:00:00'),10,17)) )) % 60) 
--as Sobretiempo
--from asistencia A
--inner join Empleado E on A.idEmpleado=E.idEmpleado
--inner join Persona P on P.idPersona=E.idPersona
--where fecha between @FechaI and @FechaF and Hor_sal<>'00:00:00' and E.estado=1 and E.idtipotrabajador=@tipo
--group by A.idempleado,P.Apellido_Paterno , P.Apellido_Materno ,P.Nombres
--order by Apellido_Paterno
SELECT
A.idempleado, (P.Apellido_Paterno + ' ' + P.Apellido_Materno + ', ' + P.Nombres) as NombreCompleto,
RIGHT('00' + CONVERT (VARCHAR(2),SUM (DATEPART(MINUTE, convert(datetime,substring(dbo.fDifFechas(Hor_sal, case when DATEPART(WEEKDAY, A.Fecha) = 6 or DATEPART(WEEKDAY, A.Fecha) = 7 or isnull(F.idFeriado,0) > 0  then Hor_Ent else '16:15:00' end),10,17)) )) / 60 + SUM (DATEPART(HOUR, convert(datetime,substring(dbo.fDifFechas(Hor_sal, case when DATEPART(WEEKDAY, A.Fecha) = 6 or DATEPART(WEEKDAY, A.Fecha) = 7 or isnull(F.idFeriado,0) > 0  then Hor_Ent else '16:15:00' end),10,17)) ) )), 2) + ':' + CONVERT (CHAR (2), SUM (DATEPART(MINUTE, convert(datetime,substring(dbo.fDifFechas(Hor_sal, case when DATEPART(WEEKDAY, A.Fecha) = 6 or DATEPART(WEEKDAY, A.Fecha) = 7 or isnull(F.idFeriado,0) > 0  then Hor_Ent else '16:15:00' end),10,17)) )) % 60) 
as Sobretiempo
from asistencia A
left outer join RRHH_Feriado F on convert(char(8),F.Fecha,112)=convert(char(8),A.Fecha,112)
inner join Empleado E on A.idEmpleado=E.idEmpleado
inner join Persona P on P.idPersona=E.idPersona
where A.fecha between @FechaI and @FechaF and Hor_sal<>'00:00:00' and E.estado=1 and E.idtipotrabajador=@tipo
group by A.idempleado,P.Apellido_Paterno , P.Apellido_Materno ,P.Nombres
order by Apellido_Paterno
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_Rep_cargos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_Rep_cargos] AS' 
END
GO
ALTER proc [dbo].[spRRHH_Rep_cargos]
@idCargo int
--WITH ENCRYPTION
as
select p.Apellido_Paterno, p.Apellido_Materno, p.nombres,
eo.AreaOrganizacional, c.cargo
from empleado e
inner join persona p on e.idpersona=p.idpersona
inner join dbo.EstructOrganiz eo on e.idAreaOrganiz=eo.idAreaOrganiz and e.year=eo.year
inner join cargo c on c.idcargo=e.idcargo
where e.idcargo=@idcargo and e.estado=1
and e.IdTipoTrabajador=1

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_Rep_profesion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_Rep_profesion] AS' 
END
GO
ALTER proc [dbo].[spRRHH_Rep_profesion] --'ABOGADA'
@profesion nvarchar(max)
as
select p.Apellido_Paterno, p.Apellido_Materno, p.nombres,
eo.AreaOrganizacional, e.Profesion
from empleado e
inner join persona p on e.idpersona=p.idpersona
inner join Empleado_Area ea on ea.IdEmpleado=e.IdEmpleado 
inner join dbo.EstructOrganiz eo on ea.idAreaOrganiz=eo.idAreaOrganiz and eo.Year=Year(getdate())
inner join cargo c on c.idcargo=e.idcargo
where e.Profesion=@profesion and e.estado=1 and ea.Year=Year(getdate())
and e.IdTipoTrabajador=1
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_RepAsisdiaria_byIdEmpleado]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_RepAsisdiaria_byIdEmpleado] AS' 
END
GO
ALTER proc [dbo].[spRRHH_RepAsisdiaria_byIdEmpleado]

--declare
@idEmpleado int,
@FechaI datetime,
@FechaF datetime,
@anio char(4) = null
as
SET LANGUAGE Spanish
SET DATEFIRST 1

select
(apellido_paterno + ' ' + apellido_materno + ' ' +nombres) as NombresC,
DATENAME(weekday,A.fecha) as NombreDia,
convert(nvarchar(10),A.fecha,103) as FechaAsistencia,
A.Hor_Ent as Hora_Entrada,
A.Hor_Sal as Hora_Salida, 
A.Alm_Sal as Hora_Almuerzo_S,
A.Alm_Ent as Hora_Almuerzo_e
from Asistencia A
inner join empleado e on a.idempleado=e.idempleado
inner join persona p on e.idpersona=p.idpersona
inner join empleado_area ea on e.idempleado=ea.idempleado and ea.year=@anio
where e.idEmpleado=@idEmpleado
and (convert(varchar(8),A.fecha,112) >= convert(varchar(8),@FechaI,112)) 
and(convert(varchar(8),A.fecha,112) <= convert(varchar(8),@FechaF,112)) 
order by convert(nvarchar(10),A.fecha,112) desc
		
		--select distinct
		--(apellido_paterno + ' ' + apellido_materno + ' ' +nombres) as nombres,
		--isnull(HoraE,'No Marcó') HoraE,
		--isnull(HoraS, 'No Marcó') HoraS,
		--DATENAME(weekday,m.fecha) as NombreDia,
		--convert(nvarchar(10),m.fecha,103) as FechaAsistencia,
		--convert(nvarchar(10),m.fecha,112) as Fecha1
		--from marcacion m 
		--inner join empleado e on m.idempleado=e.idempleado
		--inner join persona p on e.idpersona=p.idpersona
		--inner join empleado_area ea on e.idempleado=ea.idempleado and ea.year=@anio
		--left join
		--(
		--select 
		--convert(nvarchar(8),fecha,108) as HoraE, m.idEmpleado, m.fecha
		--from marcacion m 
		--where substring(m.estado,1,1)='1' and (substring(m.estado,2,1)='N' or substring(m.estado,2,1)='T')
		--) A on a.idEmpleado=m.idempleado and convert(nvarchar(10),m.fecha,103)=convert(nvarchar(10),a.fecha,103)
		--left join
		--(
		--select 
		--convert(nvarchar(8),fecha,108) as HoraS, m.idEmpleado, m.fecha
		--from marcacion m 
		--where substring(m.estado,1,1)='4'
		--) B on B.idEmpleado=m.idempleado and convert(nvarchar(10),m.fecha,103)=convert(nvarchar(10),b.fecha,103)
		--where (convert(varchar(8),m.fecha,112) >= @FechaI) 
		--and(convert(varchar(8),m.fecha,112) <= @FechaF) 
		--and B.idEmpleado=@idEmpleado
		--order by convert(nvarchar(10),m.fecha,112) desc
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_RepAsisdiarria]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_RepAsisdiarria] AS' 
END
GO
ALTER proc [dbo].[spRRHH_RepAsisdiarria]

--declare
@FechaI nvarchar(8),
@FechaF nvarchar(8),
@DNI nvarchar(8) = null,
@area int=null,
@tipo int = null,
@anio char(4) = null,
@x int 
as
--set @FechaI='20090113'
--set @FechaF = '20100101'
--set @DNI ='44623511'
--set @area =48
--set @tipo = 2
--set @anio = 2010
--set @x=0
if(@x=0)
	Begin
		SET LANGUAGE Spanish
		SET DATEFIRST 1
		select distinct
		(apellido_paterno + ' ' + apellido_materno + ' ' +nombres) as nombres,
		isnull(HoraE,'No Marcó') HoraE,
		isnull(HoraS, 'No Marcó') HoraS,
		DATENAME(weekday,m.fecha) as NombreDia,
		convert(nvarchar(10),m.fecha,103) as FechaAsistencia,
		convert(nvarchar(10),m.fecha,112) as Fecha1
		from marcacion m 
		inner join empleado e on m.idempleado=e.idempleado
		inner join persona p on e.idpersona=p.idpersona
		inner join empleado_area ea on e.idempleado=ea.idempleado and ea.year=@anio
		left join
		(
		select 
		convert(nvarchar(8),fecha,108) as HoraE, m.idEmpleado, m.fecha
		from marcacion m 
		where substring(m.estado,1,1)='1' and (substring(m.estado,2,1)='N' or substring(m.estado,2,1)='T')
		) A on a.idEmpleado=m.idempleado and convert(nvarchar(10),m.fecha,103)=convert(nvarchar(10),a.fecha,103)
		left join
		(
		select 
		convert(nvarchar(8),fecha,108) as HoraS, m.idEmpleado, m.fecha
		from marcacion m 
		where substring(m.estado,1,1)='4'
		) B on B.idEmpleado=m.idempleado and convert(nvarchar(10),m.fecha,103)=convert(nvarchar(10),b.fecha,103)
		where (convert(varchar(8),m.fecha,112) >= @FechaI) 
		and(convert(varchar(8),m.fecha,112) <= @FechaF) 
		and (ea.idAreaOrganiz=@area or @area is null)
		and (idTipoTrabajador=@tipo or @tipo is null)
		order by convert(nvarchar(10),m.fecha,112) desc
	End
else
	Begin
		SET LANGUAGE Spanish
		SET DATEFIRST 1
		select distinct
		(apellido_paterno + ' ' + apellido_materno + ' ' +nombres) as nombres,
		isnull(HoraE,'No Marcó') HoraE,
		isnull(HoraS, 'No Marcó') HoraS,
		DATENAME(weekday,m.fecha) as NombreDia,
		convert(nvarchar(10),m.fecha,103) as FechaAsistencia,
		convert(nvarchar(10),m.fecha,112) as Fecha1
		from marcacion m 
		inner join empleado e on m.idempleado=e.idempleado
		inner join persona p on e.idpersona=p.idpersona
		inner join empleado_area ea on e.idempleado=ea.idempleado and ea.year=@anio
		left join
		(
		select 
		convert(nvarchar(8),fecha,108) as HoraE, m.idEmpleado, m.fecha
		from marcacion m 
		where substring(m.estado,1,1)='1' and (substring(m.estado,2,1)='N' or substring(m.estado,2,1)='T')
		) A on a.idEmpleado=m.idempleado and convert(nvarchar(10),m.fecha,103)=convert(nvarchar(10),a.fecha,103)
		left join
		(
		select 
		convert(nvarchar(8),fecha,108) as HoraS, m.idEmpleado, m.fecha
		from marcacion m 
		where substring(m.estado,1,1)='4'
		) B on B.idEmpleado=m.idempleado and convert(nvarchar(10),m.fecha,103)=convert(nvarchar(10),b.fecha,103)
		where (convert(varchar(8),m.fecha,112) >= @FechaI) 
		and(convert(varchar(8),m.fecha,112) <= @FechaF) 
		and (p.NumDocID=@DNI or @DNI is null)
		order by convert(nvarchar(10),m.fecha,112) desc
	End


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_Report_Cumple]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_Report_Cumple] AS' 
END
GO
ALTER proc [dbo].[spRRHH_Report_Cumple]
@mes int
--WITH ENCRYPTION
as
SELECT CASE WHEN MONTH(FechaNacimiento) > MONTH(GETDATE()) THEN (YEAR(GETDATE()) - YEAR(FechaNacimiento) - 1) WHEN MONTH(GETDATE()) 
= MONTH(FechaNacimiento) AND DAY(FechaNacimiento) > DAY(GETDATE()) THEN YEAR(GETDATE()) - YEAR(FechaNacimiento) 
- 1 ELSE YEAR(GETDATE()) - YEAR(FechaNacimiento) END AS edadEmpleado,(dbo.Persona.Apellido_Paterno + ' ' + dbo.Persona.Apellido_Materno + ' ' + dbo.Persona.Nombres) AS NombresCompletos, 
dbo.EstructOrganiz.AreaOrganizacional, dbo.Empleado.Estado,DAY(FechaNacimiento) as Dia, MONTH(FechaNacimiento) as mes,
MESletras = CASE DATEPART(MM,FechaNacimiento) when 1 THEN 'ENERO' 
when 2 THEN 'FEBRERO' when 3 THEN 'MARZO' when 4 THEN 'ABRIL' when 5 THEN 'MAYO' 
when 6 THEN 'JUNIO' when 7 THEN 'JULIO' when 8 THEN 'AGOSTO' when 9 THEN 'SEPTIEMBRE' 
when 10 THEN 'OCTUBRE' when 11 THEN 'NOVIEMBRE' when 12 THEN 'DICIEMBRE' END
FROM dbo.Persona 
INNER JOIN dbo.Empleado ON dbo.Persona.IdPersona = dbo.Empleado.IdPersona 
INNER JOIN dbo.EstructOrganiz ON dbo.EstructOrganiz.idAreaOrganiz = dbo.Empleado.idAreaOrganiz AND dbo.EstructOrganiz.Year = dbo.Empleado.Year
INNER JOIN TipoTrabajador on TipoTrabajador.idtipotrabajador=empleado.idtipotrabajador
where Estado=1 and MONTH(FechaNacimiento)=@mes 
and Empleado.IdTipoTrabajador=1
order by AreaOrganizacional , dia


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_Report_FechaIngreso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_Report_FechaIngreso] AS' 
END
GO
ALTER procedure [dbo].[spRRHH_Report_FechaIngreso]
@FechaIni char(8)=null,
@FechaFin char(8)=null,
@tipo int= null
as
if @tipo=0
set @tipo=null
select (dbo.Persona.Apellido_Paterno + ' ' + dbo.Persona.Apellido_Materno + ' ' + dbo.Persona.Nombres) AS NombresCompletos,
isnull(Convert(char(10),P.FechaIngreso,103),0) as FechadeIngreso, isnull((year( getdate()-P.FechaIngreso) -1900),0) as años,
isnull((Month(getdate()-P.FechaIngreso)-1),0) as meses,
isnull((day(getdate()-P.FechaIngreso)-1),0) as dias,
AreaOrganizacional 
from empleado
inner join persona on empleado.idpersona=persona.idpersona
inner join Empleado_area ea on ea.idempleado=empleado.idempleado and ea.year=year(getdate())
inner join EstructOrganiz on dbo.EstructOrganiz.idAreaOrganiz = ea.idAreaOrganiz AND dbo.EstructOrganiz.Year = year(getdate())
left join PeriodoLaboral P on P.idEmpleado = empleado.idEmpleado 
where estado=1 --and P.FechaIngreso is not null
and P.FechaIngreso between @FechaIni and @FechaFin
and (IdTipoTrabajador=@tipo or @tipo is null)
order by AreaOrganizacional


GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_RepPermisos]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_RepPermisos] AS' 
END
GO
ALTER proc [dbo].[spRRHH_RepPermisos]
@FechaInicio nvarchar(8)=null,
@FechaFin nvarchar(8)=null,
@idTipoPermiso int=null,
@idmotivo int = null,
@idtipoEmpleado int = null
as
select 
(ltrim(Apellido_paterno)+' ' +ltrim(Apellido_materno) +' ' +ltrim(nombres)) as Nombres,
C.Cargo,
EO.AreaOrganizacional,
Descrip_Motivo,
FechaInicio,
FEchaFin,
isnull(Hora_sal,'--') as Hora_Sal,
isnull(Hora_ret,'--') as Hora_ret,
isnull(Lugar,'No Especifica') as Lugar,
isnull(Obs,'--') as Observaciones
from permiso p
inner join empleado e on p.idempleado=e.idempleado
inner join persona pe on pe.idpersona=e.idpersona
inner join motivo_perm m on m.idmotivo=p.idmotivo
inner join tipopermiso tp on tp.idTipoPermiso=m.idTipoPermiso
inner join Cargo C on C.IdCargo=e.IdCargo
inner join Empleado_Area Ea on Ea.IdEmpleado=e.IdEmpleado and Ea.Year=Year(getdate())
inner join EstructOrganiz EO on EO.idAreaOrganiz=Ea.idAreaOrganiz and EO.Year=Year(getdate())
where fechaInicio >=@FechaInicio and fechaInicio <= @FechaFin  
and (m.idTipoPermiso=@idTipoPermiso or @idTipoPermiso is null)
and (p.idmotivo=@idmotivo or @idmotivo is null)
and (e.IdTipoTrabajador=@idtipoEmpleado or @idtipoEmpleado  is null)
order by p.FechaInicio
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_RepPlanillaAsistencias]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_RepPlanillaAsistencias] AS' 
END
GO
ALTER proc [dbo].[spRRHH_RepPlanillaAsistencias]
@Fechas nvarchar(4000),
@idTipoTrabajador char(1),
@idAreaOrganiz char(2) = '00',
@idLocales varchar(50) = '0'
as
DECLARE @query VARCHAR(7800)
--print @idLocales
--if @idLocales='0'
--	Begin
--		set @idLocales = null
--	End
	
if @idAreaOrganiz='00'
	--Begin
	--	set @query=
	--	'select * 
	--	from
	--	(
	--	select convert(varchar(10),Fecha,103) as Fecha,
	--	MinTardeT =''0'',
	--	DiasTardeT =''0'',
	--	DiasAsistidos =''0'',
	--	e.IdEmpleado,
	--	(p.apellido_Paterno + '' '' +p.Apellido_Materno + '' ''+ p.nombres) as NombresC,
	--	EO.AreaOrganizacional,
	--	a.Estado as h
	--	from RegAsisDiario a
	--	inner join empleado e on a.idempleado=e.idempleado
	--	inner join persona p on p.idpersona=e.idpersona
	--	inner join Empleado_Area EA on e.IdEmpleado = EA.IdEmpleado
	--	inner join EstructOrganiz EO on EA.idAreaOrganiz=EO.idAreaOrganiz
	--	where e.estado=1 and EA.Year=2012
	--	and e.idLocal in ('+@idLocales+') 		
	--	and e.IdTipoTrabajador='+@idTipoTrabajador+' 		
	--	) as x
	--	pivot 
	--	(MAX(h) for Fecha in ('+@Fechas+')) as pvt
	--	ORDER BY NombresC'		
	--end
	Begin
		set @query=
		'select * 
		from
		(
		select convert(varchar(10),Fecha,103) as Fecha,
		MinTardeT =''0'',
		DiasTardeT =''0'',
		DiasAsistidos =''0'',
		e.IdEmpleado,
		(p.apellido_Paterno + '' '' +p.Apellido_Materno + '' ''+ p.nombres) as NombresC,
		a.Estado as h
		from RegAsisDiario a
		inner join empleado e on a.idempleado=e.idempleado
		inner join persona p on p.idpersona=e.idpersona		
		where e.estado=1
		and e.idLocal in ('+@idLocales+') 		
		and e.IdTipoTrabajador='+@idTipoTrabajador+' 		
		) as x
		pivot 
		(MAX(h) for Fecha in ('+@Fechas+')) as pvt
		ORDER BY NombresC'		
	end
else
	Begin
		set @query=
		'select * 
		from
		(
		select convert(varchar(10),Fecha,103) as Fecha,
		MinTardeT =''0'',
		DiasTardeT =''0'',
		DiasAsistidos =''0'',
		e.IdEmpleado,
		(p.apellido_Paterno + '' '' +p.Apellido_Materno + '' ''+ p.nombres) as NombresC,
		a.Estado as h
		from RegAsisDiario a
		inner join empleado e on a.idempleado=e.idempleado
		inner join persona p on p.idpersona=e.idpersona
		inner join Empleado_Area EA on e.IdEmpleado = EA.IdEmpleado
		where e.estado=1 and EA.Year=2014
		and (EA.idAreaOrganiz = '+@idAreaOrganiz+') 
		and e.IdTipoTrabajador='+@idTipoTrabajador+'
		) as x
		pivot 
		(MAX(h) for Fecha in ('+@Fechas+')) as pvt
		ORDER BY NombresC'
	End
exec (@query)
--print @query
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_ResumenEstadisticaPermiso]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_ResumenEstadisticaPermiso] AS' 
END
GO
ALTER proc [dbo].[spRRHH_ResumenEstadisticaPermiso]
@idAreaOrganiz int,
@idMotivo int, 
@FechaInicio char(8),
@FechaFin char(8),
@IdTipoTrabajador int
as

Select A.idAreaOrganiz, B.Descrip_Motivo, B.Total, (B.Total*100)/A.Total as Porcentaje from (

select EA.idAreaOrganiz, COUNT(EA.idempleado) Total from Empleado_Area EA
inner join EstructOrganiz EO on EO.idAreaOrganiz=EA.idAreaOrganiz and EO.Year=EA.Year
inner join Empleado E on E.IdEmpleado=EA.IdEmpleado and  E.IdTipoTrabajador=@IdTipoTrabajador and E.Estado=1
where EA.Year=Year(getdate()) and EA.idAreaOrganiz=@idAreaOrganiz 
group by EA.idAreaOrganiz) A
inner join (
select EA.idAreaOrganiz, 'TOTAL DE PERMISOS POR ' + M.Descrip_Motivo Descrip_Motivo,P.idMotivo,COUNT(EA.idempleado) Total from Permiso P
inner join Empleado_Area EA on P.IdEmpleado=EA.IdEmpleado
inner join Motivo_Perm M on M.idMotivo=P.idMotivo
where FechaInicio between @FechaInicio and @FechaFin 
and EA.Year=Year(getdate()) and EA.idAreaOrganiz=@idAreaOrganiz 
and P.idMotivo=@idMotivo 
group by all EA.idAreaOrganiz,M.Descrip_Motivo,P.idMotivo) B on A.idAreaOrganiz=B.idAreaOrganiz
where B.idMotivo=@idMotivo
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spRRHH_TempFecha_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spRRHH_TempFecha_Insert] AS' 
END
GO
ALTER proc [dbo].[spRRHH_TempFecha_Insert]
(
@Fecha datetime
)
as
Insert RRHH_TempFecha
values(@Fecha)
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Aba_Func_Costo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
create function Aba_Func_Costo
(@fecha datetime,@tipoMov int, @Idbien char(13))
returns decimal(9,2)
as 
begin

	declare @Costo decimal(9,2)

					
	set @Costo=(select sum(precio_costo)
				 from movimiento m inner join deta_movimiento dm on m.idmovimiento=dm.idmovimiento
						           inner join bien b on dm.idbien=b.idbien
						           inner join unidadmedida um on b.idunidadmedida=um.idunidadmedida
				 group by m.idtipomovimiento, m.Fecha, dm.idbien
				 having m.idtipomovimiento=@tipoMov and m.fecha=@fecha and dm.idbien=@Idbien)
	
	return @Costo
end
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Aba_Func_CostoIni]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

create function Aba_Func_CostoIni
(@fecha datetime,@tipoMov char(1), @Idbien char(13))
returns decimal(9,2)
as 
begin

	declare @fechaM datetime, @fechaB datetime, @CostoIni decimal(9,2)

	Set @fechaM=(select min(fecha) 
				 from movimiento m inner join deta_movimiento dm on m.idmovimiento=dm.idmovimiento
								   inner join bien b on dm.idbien=b.idbien
								   inner join unidadmedida um on b.idunidadmedida=um.idunidadmedida)
					
	set @fechaB=(select max(fecha)
				 from movimiento m inner join deta_movimiento dm on m.idmovimiento=dm.idmovimiento
						           inner join bien b on dm.idbien=b.idbien
						           inner join unidadmedida um on b.idunidadmedida=um.idunidadmedida
				 where  m.idtipomovimiento=@tipoMov  and fecha >@fechaM and  fecha <@fecha and dm.idbien=@Idbien)
	
	set @CostoIni=dbo.Aba_Func_Costo(@fechaB,@tipoMov,@Idbien)

	return @CostoIni
end' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Aba_Func_StockIni]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function Aba_Func_StockIni
(@fecha datetime, @Idbien char(13))
returns decimal(9,2)
as
begin
	
	declare @stkini as decimal(9,2)

	set @StkIni=(select min(isnull(dm.stockini,0))  as stockini
	from movimiento m inner join deta_movimiento dm on m.idmovimiento=dm.idmovimiento
					  inner join bien b on dm.idbien=b.idbien
					  inner join unidadmedida um on b.idunidadmedida=um.idunidadmedida
	group by m.Fecha, dm.idbien
	having m.fecha=@fecha and dm.idbien=@Idbien)

	return @Stkini
end
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ComponePathDato]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE Function ComponePathDato
( @Código As Int )
Returns nVarChar(Max)
As Begin
	Declare @CódigoPadre Int
	Declare @Path nVarChar(Max)
	Set @Path = ''<'' + Convert(nVarChar(Max),@Código) + ''=''

	Select @CódigoPadre = idDependeDe
	From estructorganiz Where idDependeDe = @Código
	If Not (@CódigoPadre) Is Null
		Set @Path = dbo.estructorganiz(@CódigoPadre) + @Path

	Return @Path
End
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Date]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function Date(@Year int, @Month int, @Day int)
-- returns a datetime value for the specified year, month and day
-- Thank you to Michael Valentine Jones for this formula (see comments).
returns datetime
as
    begin
    return dateadd(month,((@Year-1900)*12)+@Month-1,@Day-1)
    end
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DateTime]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[DateTime](@Year int, @Month int, @Day int, @Hour int, @Minute int, @Second int)
returns datetime
as
begin
return dbo.Date(@Year,@Month,@Day) + dbo.Time(@Hour, @Minute,@Second)
end
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[F_tra_F_salida_tramite]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[F_tra_F_salida_tramite]
(@IdTramite char(10))
RETURNS datetime
AS
BEGIN
	
	declare @rpt datetime

	select @rpt=isnull(FechaSAlida,getdate()) 
	from tramovimiento 
    where areadestino is null and idtramite=@IdTramite
	return @rpt

end ' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fecha]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION fecha() RETURNS varchar(20)
AS
BEGIN
	RETURN ''luis''

END
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FormatDateLaboral]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function [dbo].[FormatDateLaboral](@dat datetime)
returns datetime
as 
begin
	declare @H as int
	set @H=datepart(hour,@dat)		
	if @H > 15  
		begin
			
			set @dat=DATEADD(hh, 24-@H, @dat)
			set @dat=DATEADD(hh, 8+@H-16, @dat) 
					
		end
	else if @H < 8 
		begin

			---set @dat=dbo.Get_DateTime(year(@dat),month(@dat),day(@dat),8,datepart(mm,@dat),datepart(ss,@dat))

			set @dat=DATEADD(hh, 8, @dat)

		end

	return @dat
		
end' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Get_Date]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE FUNCTION [dbo].[Get_Date](@Year int, @Month int, @Day int)
returns datetime
as
begin
return dateadd(day, @Day-1, dateadd(month, @Month-1, dateadd(year, (@Year-1900),0)))
end
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Get_DateFinishTra]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[Get_DateFinishTra](@dat datetime, @intD int, @intH int, @intM int)
returns datetime
as
begin
declare @dat2 datetime
--	if @dat is null
--		set @dat=getdate()
	IF @dat is not null
		begin
			if @intD is null
				set @intD=0
			if @intH is null
				set @intH=0	
			if @intM is null
				set @intM=0
				
			set @dat2= DATEADD(mi, @intM, @dat)
			set @dat2= DATEADD(hh, @intH, @dat2)
			set @dat2= DATEADD(dd, @intD, @dat2)
			
			--set @dat2= dbo.FormatDateLaboral(@dat2)

		end
	else
		set @dat2=null

return @dat2

--	declare @hh int

--	declare @addday int
--
--	set @hh=datepart(hour,@dat2)
--
--	if @hh>=8 
--	   begin
--			set @addDay=@hh/8
--			set @hh=CAST((@hh) - (8 * ROUND(@hh/8, 0) ) AS INT)  --Funcion MOD
--			set @dat2=DATEADD(dd, @addday, @dat2)
--	   end
--
--	return dbo.Get_DateTime(datepart(year,@dat2),datepart(month,@dat2),datepart(day,@dat2),@hh,datepart(minute,@dat2),datepart(second,@dat2))

end
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Get_DateTime]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE FUNCTION [dbo].[Get_DateTime](@Year int, @Month int, @Day int, @Hour int, @Minute int, @Second int)
returns datetime
as
begin
return dbo.Get_Date(@Year,@Month,@Day) + dbo.Get_Time(@Hour, @Minute,@Second)
end
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Get_Time]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[Get_Time](@Hour int, @Minute int, @Second int)
returns datetime
as
begin
return dateadd(hour, @Hour, 0) + dateadd(minute, @Minute,0) + dateAdd(second, @Second,0)
end
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sp_Num2Let]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE function sp_Num2Let (@Numero as NUMERIC(20,2)) returns varchar(500)
as
BEGIN
DECLARE @lnEntero INT, 
  @lcRetorno VARCHAR(512), 
  @lnTerna INT, 
  @lcMiles VARCHAR(512),
  @lcCadena VARCHAR(512),
  @lnUnidades INT, 
  @lnDecenas INT,
  @lnCentenas INT,
  @lnFraccion INT

  SELECT @lnEntero = CAST(@Numero AS INT),
    @lnFraccion = (@Numero - @lnEntero) * 100,
    @lcRetorno = '''', 
    @lnTerna = 1

  WHILE @lnEntero > 0
  BEGIN /* WHILE */
    -- Recorro terna por terna
    SELECT @lcCadena = ''''
    SELECT @lnUnidades = @lnEntero % 10
    SELECT @lnEntero = CAST(@lnEntero/10 AS INT)
    SELECT @lnDecenas = @lnEntero % 10
    SELECT @lnEntero = CAST(@lnEntero/10 AS INT)
    SELECT @lnCentenas = @lnEntero % 10
    SELECT @lnEntero = CAST(@lnEntero/10 AS INT)

    -- Analizo las unidades
    SELECT @lcCadena =
    CASE /* UNIDADES */
      WHEN @lnUnidades = 1 AND @lnTerna = 1 THEN ''UNO '' + @lcCadena
      WHEN @lnUnidades = 1 AND @lnTerna <> 1 THEN ''UN '' + @lcCadena
      WHEN @lnUnidades = 2 THEN ''DOS '' + @lcCadena
      WHEN @lnUnidades = 3 THEN ''TRES '' + @lcCadena
      WHEN @lnUnidades = 4 THEN ''CUATRO '' + @lcCadena
      WHEN @lnUnidades = 5 THEN ''CINCO '' + @lcCadena
      WHEN @lnUnidades = 6 THEN ''SEIS '' + @lcCadena
      WHEN @lnUnidades = 7 THEN ''SIETE '' + @lcCadena
      WHEN @lnUnidades = 8 THEN ''OCHO '' + @lcCadena
      WHEN @lnUnidades = 9 THEN ''NUEVE '' + @lcCadena
      ELSE @lcCadena
    END /* UNIDADES */

    -- Analizo las decenas
    SELECT @lcCadena =
    CASE /* DECENAS */
      WHEN @lnDecenas = 1 THEN
        CASE @lnUnidades
          WHEN 0 THEN ''DIEZ ''
          WHEN 1 THEN ''ONCE ''
          WHEN 2 THEN ''DOCE ''
          WHEN 3 THEN ''TRECE ''
          WHEN 4 THEN ''CATORCE ''
          WHEN 5 THEN ''QUINCE ''
          ELSE ''DIECI'' + @lcCadena
        END
      WHEN @lnDecenas = 2 AND @lnUnidades = 0 THEN ''VEINTE '' + @lcCadena
      WHEN @lnDecenas = 2 AND @lnUnidades <> 0 THEN ''VEINTI'' + @lcCadena
      WHEN @lnDecenas = 3 AND @lnUnidades = 0 THEN ''TREINTA '' + @lcCadena
      WHEN @lnDecenas = 3 AND @lnUnidades <> 0 THEN ''TREINTA Y '' + @lcCadena
      WHEN @lnDecenas = 4 AND @lnUnidades = 0 THEN ''CUARENTA '' + @lcCadena
      WHEN @lnDecenas = 4 AND @lnUnidades <> 0 THEN ''CUARENTA Y '' + @lcCadena
      WHEN @lnDecenas = 5 AND @lnUnidades = 0 THEN ''CINCUENTA '' + @lcCadena
      WHEN @lnDecenas = 5 AND @lnUnidades <> 0 THEN ''CINCUENTA Y '' + @lcCadena
      WHEN @lnDecenas = 6 AND @lnUnidades = 0 THEN ''SESENTA '' + @lcCadena
      WHEN @lnDecenas = 6 AND @lnUnidades <> 0 THEN ''SESENTA Y '' + @lcCadena
      WHEN @lnDecenas = 7 AND @lnUnidades = 0 THEN ''SETENTA '' + @lcCadena
      WHEN @lnDecenas = 7 AND @lnUnidades <> 0 THEN ''SETENTA Y '' + @lcCadena
      WHEN @lnDecenas = 8 AND @lnUnidades = 0 THEN ''OCHENTA '' + @lcCadena
      WHEN @lnDecenas = 8 AND @lnUnidades <> 0 THEN ''OCHENTA Y '' + @lcCadena
      WHEN @lnDecenas = 9 AND @lnUnidades = 0 THEN ''NOVENTA '' + @lcCadena
      WHEN @lnDecenas = 9 AND @lnUnidades <> 0 THEN ''NOVENTA Y '' + @lcCadena
      ELSE @lcCadena
    END /* DECENAS */


    -- Analizo las centenas
    SELECT @lcCadena =
    CASE /* CENTENAS */
      WHEN @lnCentenas = 1 AND @lnUnidades = 0 AND @lnDecenas = 0 THEN ''CIEN '' + @lcCadena
      WHEN @lnCentenas = 1 AND NOT(@lnUnidades = 0 AND @lnDecenas = 0) THEN ''CIENTO '' + @lcCadena
      WHEN @lnCentenas = 2 THEN ''DOSCIENTOS '' + @lcCadena
      WHEN @lnCentenas = 3 THEN ''TRESCIENTOS '' + @lcCadena
      WHEN @lnCentenas = 4 THEN ''CUATROCIENTOS '' + @lcCadena
      WHEN @lnCentenas = 5 THEN ''QUINIENTOS '' + @lcCadena
      WHEN @lnCentenas = 6 THEN ''SEISCIENTOS '' + @lcCadena
      WHEN @lnCentenas = 7 THEN ''SETECIENTOS '' + @lcCadena
      WHEN @lnCentenas = 8 THEN ''OCHOCIENTOS '' + @lcCadena
      WHEN @lnCentenas = 9 THEN ''NOVECIENTOS '' + @lcCadena
      ELSE @lcCadena
    END /* CENTENAS */

    -- Analizo la terna
    SELECT @lcCadena = 
    CASE /* TERNA */
      WHEN @lnTerna = 1 THEN @lcCadena
      WHEN @lnTerna = 2 AND (@lnUnidades + @lnDecenas + @lnCentenas <> 0) THEN @lcCadena + '' MIL ''
      WHEN @lnTerna = 3 AND (@lnUnidades + @lnDecenas + @lnCentenas <> 0) AND 
        @lnUnidades = 1 AND @lnDecenas = 0 AND @lnCentenas = 0 THEN @lcCadena + '' MILLON ''
      WHEN @lnTerna = 3 AND (@lnUnidades + @lnDecenas + @lnCentenas <> 0) AND
        NOT (@lnUnidades = 1 AND @lnDecenas = 0 AND @lnCentenas = 0) THEN @lcCadena + '' MILLONES ''
      WHEN @lnTerna = 4 AND (@lnUnidades + @lnDecenas + @lnCentenas <> 0) THEN @lcCadena + '' MIL MILLONES ''
      ELSE ''''
    END /* TERNA */

    -- Armo el retorno terna a terna
    SELECT @lcRetorno = @lcCadena  + @lcRetorno
    SELECT @lnTerna = @lnTerna + 1

  END /* WHILE */

  IF @lnTerna = 1  
    SELECT @lcRetorno = ''CERO''

  return (SELECT RTRIM(@lcRetorno) + '' CON '' + LTRIM(STR(@lnFraccion,2)) + ''/100'')

END
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Time]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[Time](@Hour int, @Minute int, @Second int)
returns datetime
as
begin
return dateadd(hour, @Hour, 0) + dateadd(minute, @Minute,0) + dateAdd(second, @Second,0)
end
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TRA_CargoRechazo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[TRA_CargoRechazo]
(@IdEmpRechazo int)
RETURNS int
AS
BEGIN
	declare  @rsp int
	
	select @rsp=idcargo from vs_tra_usuario_area_cargo where idempleado=@idemprechazo
	
	RETURN @rsp
END' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tra_Existe_Acuerdo]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
create function [dbo].[Tra_Existe_Acuerdo]
(@Nro_Acuerdo varchar(10))

RETURNS bit

as 

begin 

declare @resp bit
 
if (select count(nro_acuerdo) from Tra_Acuerdo where Nro_Acuerdo=@Nro_Acuerdo) >0
   set @resp=1
else
   set @resp=0

return @resp

end' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TRA_F_Salida_Oficial]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create FUNCTION [dbo].[TRA_F_Salida_Oficial]
(@tiempodias int,
 @tiempohrs float,
 @fechaingreso datetime)
RETURNS datetime
AS
BEGIN
	declare  @rsp datetime
	
	set @rsp=@fechaingreso + @tiempodias + dbo.tra_nrodiaadd(@tiempohrs) + (@tiempohrs/24) 

	RETURN @rsp
END
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tra_Fun_Item_SecSTD]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'

CREATE function [dbo].[Tra_Fun_Item_SecSTD]
(
@idprocedimiento char(6),
@idetapaproc char(8)
)
	RETURNS Int
	AS
	BEGIN
	
	DECLARE @rsp AS INT
	
    set @rsp=(select codigo 
	from
	(SELECT (rank() OVER (ORDER BY ITEM)) as cODIGO,
	v.idprocedimiento,
	v.IdEtapaProc,
	v.SecStandard, 
	v.SecAlterna
	FROM dbo.vs_tra_listaretapaprocedimiento AS v INNER JOIN
		 dbo.EstructOrganiz AS e ON v.idAreaOrganiz = e.idAreaOrganiz AND v.anio = e.Year INNER JOIN
		 dbo.Cargo AS c ON v.IdCargo=c.IdCargo  
    WHERE v.idprocedimiento=@idprocedimiento And v.estado=1) X where x.idetapaproc=@idetapaproc)

    RETURN @rsp
    end
' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tra_HoraTOMin]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[Tra_HoraTOMin]
(@nHoras FLOAT)
RETURNS int
AS
BEGIN
DECLARE @Min int
if @nhoras>=1
	SET @nhoras=(@nhoras - cast(@nhoras as int))*60 
else 
	SET @nhoras=@nhoras*60 

DECLARE @Dec FLOAT
SET @dec=(@nhoras - cast(@nhoras as int))
SET @dec=@dec*10
SET @dec=cast(@dec as int)

IF @dec>4
   set @min=round(@nhoras,0)
ELSE
   set @min=(@nhoras - cast(@nhoras as int))

RETURN @min
END' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TRA_NroMinReal]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'	CREATE FUNCTION [dbo].[TRA_NroMinReal](@NroHora float)
	RETURNS Int
	AS
	BEGIN
	DECLARE @i float
	DECLARE @rsp AS INT
	
	IF @NroHora > 24
	
	   BEGIN
	   
		   SET @i = (@NroHora/24 - CAST(@NroHora/24 AS Int))*24
			    
	   END
	   
	 ELSE
		
		BEGIN
			
			SET @i=@NroHora
			
		END
	  	   
    SET @i=@i - CAST(@i AS int)
    SET @i=@i*60
    SET @rsp=ROUND(@i,0)
    
  RETURN @rsp
  end' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tra_T_Restante_Excedido]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[Tra_T_Restante_Excedido]
(@fsalida datetime, @ftranscurrido datetime)

RETURNS nvarchar(50)
as 
begin 

	declare @wd4 nvarchar(50);
	declare @dat datetime;
	declare @year nvarchar(4);
	--declare @dat2 datetime

	if @fSalida < @fTranscurrido
		begin 
			set @dat=@fTranscurrido - @fSalida
			set @dat=dbo.Verificar_DiaLaboral(@dat)
			--select @dat2 as Ingreso , @fsalida as Salida, @dat as TiempoTranscurrido, 
			if year(@dat)<=1900
				set @year=0
			else 
				set @year=year(@dat)-1900	

			set @wd4=(convert(varchar(4),(@year)) + ''  A(s)  '' + convert(varchar(2),month(@dat)-1) + ''  M(s)  '' + convert(varchar(2),day(@dat)) + ''  D(s)  '' + convert(varchar(2),DATEPART(hour,@dat)) + ''  h(s)  '' + convert(varchar(2), datepart(minute,@dat)) + ''  m(s)'' )
		end
	else if @fTranscurrido < @fSalida
		begin
			set @dat=@fSalida - @fTranscurrido
			set @dat=dbo.Verificar_DiaLaboral(@dat)
			--select  @dat2 as Ingreso, @fsalida as Salida, @dat as TiempoTranscurrido, 
			if year(@dat)<=1900
				set @year=0
			else 
				set @year=year(@dat)-1900

			set @wd4=(convert(varchar(4),(@year)) + ''  A(s)  '' + convert(varchar(2),month(@dat)-1) + ''  M(s)  '' + convert(varchar(2),day(@dat)) + ''  D(s)  '' + convert(varchar(2),DATEPART(hour,@dat)) + ''  h(s)  '' + convert(varchar(2), datepart(minute,@dat)) + ''  m(s)'' )--as descripcion
		end	

	return @wd4

end' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tra_TiempoTotal]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[Tra_TiempoTotal]
(@nDias int,@nHoras FLOAT)
RETURNS nvarchar(50)
AS
BEGIN
DECLARE @wd nvarchar(12)
declare @wd2 nvarchar(12)
declare @wd3 nvarchar(12)
declare @wd4 nvarchar(55)

sET @wd=cast(@ndias + dbo.tra_nrodiaadd(@nhoras)as nvarchar(12)) 
set @wd2=cast(dbo.tra_nroHoraReal(@nhoras)as nvarchar(12))
set @wd3=cast(dbo.tra_nroMinReal(@nhoras) as nvarchar(12))

SET @wd=@wd + '' '' + '' Dia(s)   '' 
set @wd2=@wd2 + '' '' + '' Hora(s)   ''
set @wd3=@wd3 + '' '' + '' Min(s)   ''
set @wd4=@wd + @wd2 + @wd3

RETURN @wd4
END' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TRA_Verificaratraso]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION dbo.TRA_Verificaratraso
(@tiempodias int,
 @tiempohrs float,
 @fechaingreso datetime)
RETURNS int
AS
BEGIN
	declare  @rsp int
	
	if getdate()>(@fechaingreso + @tiempodias + dbo.tra_nrodiaadd(@tiempohrs) + (@tiempohrs/24)) 
		set @rsp=0 --vencido
	else 
		set @rsp=1 --a tiempo
	
	RETURN @rsp
END' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TRUNC]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
CREATE function TRUNC(@nDec as smallint, @nValor as decimal(16, 4))
returns decimal(16, 4)
as 
begin
	--set nocount on
	declare  @nMask As Smallint
	
	if @nDec <= 0
		begin
			SET @nValor = cast(@nValor as int)
		end
	else
		begin
			set @nMask = power(10, @nDec)
			set @nValor = cast(@nValor * @nMask as int)
			SET @nValor = @nValor/@nMask
		end
	return @nvalor
	--return cast(@nValor as decimal(10,2))
end' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Verificar_DiaLaboral]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
create function dbo.Verificar_DiaLaboral(@dat2 datetime)
returns datetime
as 
begin
	
	declare @hh int
	declare @addday int
	declare @dat3 datetime

	set @hh=datepart(hour,@dat2)

	if @hh>=8 
	   begin
			set @addDay=@hh/8
			set @hh=CAST((@hh) - (8 * ROUND(@hh/8, 0) ) AS INT)  --Funcion MOD
			set @dat3=DATEADD(dd, @addday, @dat2)
	   end

	return dbo.Get_DateTime(datepart(year,@dat3),datepart(month,@dat3),datepart(day,@dat3),@hh,datepart(minute,@dat3),datepart(second,@dat3))

end


' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VerificarTiempoLaboral]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
create function [dbo].[VerificarTiempoLaboral](@dat datetime)
returns datetime
as 
begin
	declare @H as int
	set @H=datepart(hour,@dat)		
	if @H > 8  
		begin
			
			set @dat=DATEADD(dd, @H/8, @dat)
			set @dat=DATEADD(hh, 24-@h, @dat) 
			set @dat=DATEADD(dd, -1, @dat)
			set @dat=dateadd(hh,CAST((@h) - (8 * ROUND(@h/8, 0) ) AS INT),@dat)
		end

	return @dat
end	' 
END

GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Membership_BasicAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Membership_FullAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Membership_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Membership_ReportingAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Personalization_BasicAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Personalization_FullAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Personalization_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Personalization_ReportingAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Profile_BasicAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Profile_FullAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Profile_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Profile_ReportingAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_BasicAccess' AND type = 'R')
CREATE ROLE [aspnet_Roles_BasicAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_Roles_FullAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_Roles_ReportingAccess' AND type = 'R')
CREATE ROLE [aspnet_Roles_ReportingAccess]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'aspnet_WebEvent_FullAccess' AND type = 'R')
CREATE ROLE [aspnet_WebEvent_FullAccess]
GO

GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'UsuarioAvanzado' AND type = 'R')
CREATE ROLE [UsuarioAvanzado]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'adiaz')
CREATE USER [adiaz] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'agastelo')
CREATE USER [agastelo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ARMANDO')
CREATE USER [ARMANDO] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'asotero')
CREATE USER [asotero] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'atorres')
CREATE USER [atorres] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'azavaleta')
CREATE USER [azavaleta] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'CAS')
CREATE USER [CAS] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'CCALDERON')
CREATE USER [CCALDERON] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ccerin')
CREATE USER [ccerin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'cespejo')
CREATE USER [cespejo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'cfrontado')
CREATE USER [cfrontado] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'cjara')
CREATE USER [cjara] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'CMARTINEZ')
CREATE USER [CMARTINEZ] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'dalvarado')
CREATE USER [dalvarado] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'dtejada')
CREATE USER [dtejada] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'echusho')
CREATE USER [echusho] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'eramos')
CREATE USER [eramos] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'evilchez')
CREATE USER [evilchez] FOR LOGIN [EVILCHEZ] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'facosta')
CREATE USER [facosta] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'FGOMEZ')
CREATE USER [FGOMEZ] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'FMOYA')
CREATE USER [FMOYA] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'fmoyai')
CREATE USER [fmoyai] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'FMOYAZ')
CREATE USER [FMOYAZ] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'fvalera')
CREATE USER [fvalera] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'gcabanillas')
CREATE USER [gcabanillas] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GLAZO')
CREATE USER [GLAZO] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'gmoralesm')
CREATE USER [gmoralesm] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GORELL\agastelo')
CREATE USER [GORELL\agastelo] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GORELL\azavaleta')
CREATE USER [GORELL\azavaleta] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GORELL\ilujan')
CREATE USER [GORELL\ilujan] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'gortiz')
CREATE USER [gortiz] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\agastelo')
CREATE USER [GRLL\agastelo] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\azavaleta')
CREATE USER [GRLL\azavaleta] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\cfrontado')
CREATE USER [GRLL\cfrontado] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\cjara')
CREATE USER [GRLL\cjara] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\dalvarado')
CREATE USER [GRLL\dalvarado] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\dtejada')
CREATE USER [GRLL\dtejada] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\eramos')
CREATE USER [GRLL\eramos] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\evilchez')
CREATE USER [GRLL\evilchez] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\facosta')
CREATE USER [GRLL\facosta] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\fmoya')
CREATE USER [GRLL\fmoya] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\fmoyaz')
CREATE USER [GRLL\fmoyaz] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\gbazan')
CREATE USER [GRLL\gbazan] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\gmoralesm')
CREATE USER [GRLL\gmoralesm] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\ilujan')
CREATE USER [GRLL\ilujan] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\jdavalos')
CREATE USER [GRLL\jdavalos] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\jfernandezv')
CREATE USER [GRLL\jfernandezv] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\jgutierrez')
CREATE USER [GRLL\jgutierrez] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\jherrera')
CREATE USER [GRLL\jherrera] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\jjaeger')
CREATE USER [GRLL\jjaeger] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\jreyes')
CREATE USER [GRLL\jreyes] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\jruiz')
CREATE USER [GRLL\jruiz] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\jvalera')
CREATE USER [GRLL\jvalera] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\jvera')
CREATE USER [GRLL\jvera] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\jzamudio')
CREATE USER [GRLL\jzamudio] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\lcruz')
CREATE USER [GRLL\lcruz] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\mbecerra')
CREATE USER [GRLL\mbecerra] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\myepez')
CREATE USER [GRLL\myepez] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\pcardoza')
CREATE USER [GRLL\pcardoza] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\pvillanueva')
CREATE USER [GRLL\pvillanueva] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\scastillo')
CREATE USER [GRLL\scastillo] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\serviciosauxiliares')
CREATE USER [GRLL\serviciosauxiliares] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\sparedes')
CREATE USER [GRLL\sparedes] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\sruiz')
CREATE USER [GRLL\sruiz] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\vnarvaez')
CREATE USER [GRLL\vnarvaez] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'GRLL\ysheen')
CREATE USER [GRLL\ysheen] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'gruiz')
CREATE USER [gruiz] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ilujan')
CREATE USER [ilujan] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ImportarAsistencia')
CREATE USER [ImportarAsistencia] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'INVITADO')
CREATE USER [INVITADO] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jctoribioc')
CREATE USER [jctoribioc] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jdavalos')
CREATE USER [jdavalos] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'JDIAZ')
CREATE USER [JDIAZ] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jfernandezv')
CREATE USER [jfernandezv] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jgutierrez')
CREATE USER [jgutierrez] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jherrera')
CREATE USER [jherrera] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'JJAEGER')
CREATE USER [JJAEGER] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jrodrigueze')
CREATE USER [jrodrigueze] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jruiz')
CREATE USER [jruiz] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jruizc')
CREATE USER [jruizc] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jruizp')
CREATE USER [jruizp] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'JSEGURO')
CREATE USER [JSEGURO] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'JVERA')
CREATE USER [JVERA] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'KVERA')
CREATE USER [KVERA] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kzimicc')
CREATE USER [kzimicc] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'kzimicp')
CREATE USER [kzimicp] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'lavila')
CREATE USER [lavila] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'lcruz')
CREATE USER [lcruz] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ldileo')
CREATE USER [ldileo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'lnunez')
CREATE USER [lnunez] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'lvalderrama')
CREATE USER [lvalderrama] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'malva')
CREATE USER [malva] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mmedina')
CREATE USER [mmedina] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mpolo')
CREATE USER [mpolo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mrios')
CREATE USER [mrios] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'mzavaleta')
CREATE USER [mzavaleta] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'oficina')
CREATE USER [oficina] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'olecca')
CREATE USER [olecca] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PACEVEDO')
CREATE USER [PACEVEDO] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'palcantara')
CREATE USER [palcantara] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PCARDOZA')
CREATE USER [PCARDOZA] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'PERSONAL')
CREATE USER [PERSONAL] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'pvillanueva')
CREATE USER [pvillanueva] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'qweb')
CREATE USER [qweb] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RALVARADO')
CREATE USER [RALVARADO] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'RALZA')
CREATE USER [RALZA] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'rcampos')
CREATE USER [rcampos] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'reportes')
CREATE USER [reportes] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'sburgos')
CREATE USER [sburgos] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'sburgosc')
CREATE USER [sburgosc] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'scastillo')
CREATE USER [scastillo] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'servaux')
CREATE USER [servaux] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'sflores')
CREATE USER [sflores] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'SGTI')
CREATE USER [SGTI] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'SMINCHON')
CREATE USER [SMINCHON] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'sparedes')
CREATE USER [sparedes] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'sruiz')
CREATE USER [sruiz] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'userGRLL')
CREATE USER [userGRLL] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'userRRHH')
CREATE USER [userRRHH] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'vnarvaez')
CREATE USER [vnarvaez] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'ysheen')
CREATE USER [ysheen] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'yvera')
CREATE USER [yvera] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE parent_class_desc = 'DATABASE' AND name = N'AuditarBD')
EXECUTE dbo.sp_executesql N'
CREATE TRIGGER [AuditarBD]
ON DATABASE
FOR DDL_DATABASE_LEVEL_EVENTS
AS
SET NOCOUNT ON
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON

DECLARE @data XML
DECLARE @MESSAGE varchar(255)
DECLARE @DBNAME NVARCHAR(128)
DECLARE @Usuario NVARCHAR(100)
DECLARE @comando NVARCHAR(128)
SET @DBNAME = DB_NAME()
SET @data = EVENTDATA()
SET @Usuario = SYSTEM_USER
SET @comando = @data.value(''(/EVENT_INSTANCE/TSQLCommand)[1]'', ''nvarchar(2000)'')
INSERT sysLogEvent
(Fecha,Aplicacion, PC,[Login], Usuario, Evento, Sentencia)
VALUES
(GETDATE(),app_name(),host_name(),
CONVERT(nvarchar(100), SYSTEM_USER),
CONVERT(nvarchar(100), CURRENT_USER ),
@data.value(''(/EVENT_INSTANCE/EventType)[1]'', ''nvarchar(100)''),
@data.value(''(/EVENT_INSTANCE/TSQLCommand)[1]'', ''nvarchar(2000)'') )
SELECT @MESSAGE = ''DDL en base de datos: '' + @DBNAME + '';'' + @Usuario + '';'' + @comando
EXEC master.dbo.xp_logevent 50001, @MESSAGE, informational
'
GO
ENABLE TRIGGER [AuditarBD] ON DATABASE
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_aud_asis_norm]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[tr_aud_asis_norm] ON [dbo].[Asistencia]
FOR  UPDATE
AS
SET NOCOUNT ON;

DECLARE @insertado int, @borrado int
SELECT @insertado=count(*) FROM inserted
SELECT @borrado =count(*) FROM deleted

DECLARE @usuario varchar(50), @fecha datetime, @pc varchar(50), @operacion char(1)
SELECT @usuario=suser_sname(), @fecha=getdate(), @pc=host_name()


declare @IdEmpleado int, @FechaAsistencia  datetime, @Hor_Ent char(8), @Hor_Sal char(8), @Hor_Ent_act char(8), @Hor_Sal_act char(8)


IF @insertado>0
BEGIN
	IF @borrado>0 -- Actualización
		BEGIN
			SELECT @operacion=''A''
			SELECT @IdEmpleado = IdEmpleado, @FechaAsistencia = Fecha ,  @Hor_Ent = Hor_Ent, @Hor_Sal= Hor_Sal  from  deleted
			SELECT  @Hor_Ent_act = Hor_Ent, @Hor_Sal_act= Hor_Sal  from  inserted
		
			INSERT Asistencia_aud (Fecha_aud,Usuario,Pc,Operacion,idEmpleado,Fecha_Ant,Hora_Sal_Ant,Hora_Ent_Ant,Hora_Ent_Act,Hora_Sal_Act)  
			values( @fecha  ,  @usuario  ,@pc  , @operacion , @IdEmpleado , @FechaAsistencia,    @Hor_Sal,@Hor_Ent,@Hor_Ent_act,@Hor_Sal_act ) 
		END
	else
		Begin
			SELECT @operacion=''I''
			SELECT @IdEmpleado = IdEmpleado, @FechaAsistencia = Fecha  from  inserted
			
			INSERT Asistencia_aud (Fecha_aud,Usuario,Pc,Operacion,idEmpleado,Fecha_Ant)  
			values( @fecha  ,  @usuario  ,@pc  , @operacion , @IdEmpleado , @FechaAsistencia) 
		End		
END' 
GO
ALTER TABLE [dbo].[Asistencia] ENABLE TRIGGER [tr_aud_asis_norm]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_aud_asis_norm_Insert]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER tr_aud_asis_norm_Insert ON Asistencia
FOR  INSERT
AS
SET NOCOUNT ON;

DECLARE @insertado int
SELECT @insertado=count(*) FROM inserted

DECLARE @usuario varchar(50), @fecha datetime, @pc varchar(50), @operacion char(1)
SELECT @usuario=suser_sname(), @fecha=getdate(), @pc=host_name()


declare @IdEmpleado int, @FechaAsistencia  datetime, @Hor_Ent char(8), @Hor_Sal char(8)

IF @insertado>0
BEGIN
	
			SELECT @operacion=''I''
			SELECT @IdEmpleado = IdEmpleado, @FechaAsistencia = Fecha,  @Hor_Ent = Hor_Ent, @Hor_Sal= Hor_Sal  from  inserted
			
			INSERT Asistencia_aud (Fecha_aud,Usuario,Pc,Operacion,idEmpleado,Fecha_Ant,Hora_Sal_Ant,Hora_Ent_Ant )  
			values( @fecha  ,  @usuario  ,@pc  , @operacion , @IdEmpleado , @FechaAsistencia, @Hor_Sal, @Hor_Ent) 
END' 
GO
ALTER TABLE [dbo].[Asistencia] ENABLE TRIGGER [tr_aud_asis_norm_Insert]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[trg_update_HorarioTemporal]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER trg_update_HorarioTemporal
   ON [dbo].[HorarioTemporal]
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	UPDATE [dbo].[HorarioTemporal]
	SET [FechaRegistro] = GETDATE()
	 WHERE EXISTS
  (SELECT '''' FROM inserted
  WHERE [dbo].[HorarioTemporal].idEmpleado = inserted.idEmpleado
    AND [dbo].[HorarioTemporal].N = inserted.N)
END
' 
GO
ALTER TABLE [dbo].[HorarioTemporal] ENABLE TRIGGER [trg_update_HorarioTemporal]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tD_Limitacion]'))
EXEC dbo.sp_executesql @statement = N'create trigger tD_Limitacion on Limitacion for DELETE as
/* ERwin Builtin Thu Apr 10 13:25:35 2008 */
/* DELETE trigger on Limitacion */
begin
  declare  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin Thu Apr 10 13:25:35 2008 */
    /* Limitacion R/206 Recomendacion ON PARENT DELETE SET NULL */
    update Recomendacion
      set
        /* Recomendacion.IdLimitacion = NULL */
        Recomendacion.IdLimitacion = NULL
      from Recomendacion,deleted
      where
        /* Recomendacion.IdLimitacion = deleted.IdLimitacion */
        Recomendacion.IdLimitacion = deleted.IdLimitacion


    /* ERwin Builtin Thu Apr 10 13:25:35 2008 */
    return
error:
    raiserror @errno @errmsg
    rollback transaction
end' 
GO
ALTER TABLE [dbo].[Limitacion] ENABLE TRIGGER [tD_Limitacion]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tU_Limitacion]'))
EXEC dbo.sp_executesql @statement = N'create trigger tU_Limitacion on Limitacion for UPDATE as
/* ERwin Builtin Thu Apr 10 13:25:35 2008 */
/* UPDATE trigger on Limitacion */
begin
  declare  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insIdLimitacion int,
           @errno   int,
           @errmsg  varchar(255)

  select @numrows = @@rowcount
  /* ERwin Builtin Thu Apr 10 13:25:35 2008 */
  /* Limitacion R/206 Recomendacion ON PARENT UPDATE SET NULL */
  if
    /* update(IdLimitacion) */
    update(IdLimitacion)
  begin
    update Recomendacion
      set
        /* Recomendacion.IdLimitacion = NULL */
        Recomendacion.IdLimitacion = NULL
      from Recomendacion,deleted
      where
        /* Recomendacion.IdLimitacion = deleted.IdLimitacion */
        Recomendacion.IdLimitacion = deleted.IdLimitacion
  end


  /* ERwin Builtin Thu Apr 10 13:25:35 2008 */
  return
error:
    raiserror @errno @errmsg
    rollback transaction
end' 
GO
ALTER TABLE [dbo].[Limitacion] ENABLE TRIGGER [tU_Limitacion]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_aud_permiso]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER tr_aud_permiso ON Permiso
FOR  UPDATE
AS
SET NOCOUNT ON;

DECLARE @insertado int, @borrado int
SELECT @insertado=count(*) FROM inserted
SELECT @borrado =count(*) FROM deleted

DECLARE @usuario varchar(50), @fecha datetime, @pc varchar(50), @operacion char(1)
SELECT @usuario=suser_sname(), @fecha=getdate(), @pc=host_name()


declare @IdEmpleado int, @FechaAsistencia  datetime, @Hor_Ent char(8), @Hor_Sal char(8), @Hor_Ent_act char(8), @Hor_Sal_act char(8)

declare 
@NPermiso int,
@FechaInicio datetime, 
@FechaFin datetime,
@idMotivo int,
@Referencia varchar(150),
@Autorizacion varchar(150),
@Obs varchar(150),
@FechaInicio_Act datetime, 
@FechaFin_Act datetime,
@idMotivo_Act int,
@Referencia_Act varchar(150),
@Autorizacion_Act varchar(150),
@Obs_Act varchar(150)

IF @insertado>0
BEGIN
	IF @borrado>0 -- Actualización
		BEGIN
			SELECT @operacion=''A''
			SELECT @IdEmpleado=IdEmpleado, @NPermiso=NPermiso, @FechaInicio=FechaInicio, @FechaFin=FechaFin,@idMotivo=idMotivo ,@Referencia=Referencia,
@Autorizacion=Autorizacion ,@Obs=Obs from deleted

			SELECT  @FechaInicio_Act=FechaInicio, @FechaFin_Act=FechaFin,@idMotivo_Act=idMotivo ,@Referencia_Act=Referencia,
@Autorizacion_Act=Autorizacion ,@Obs_Act=Obs  from  inserted
		
			INSERT Permiso_Aud(fecha_aud, Usuario, Pc, operacion,idEmpleado,NPermiso,FechaInicio_Ant,FechaFin_Ant, idMotivo_Ant, Referencia_Ant,Autorizacion_Ant, Obs_Ant, FechaInicio_Act,FechaFin_Act,idMotivo_Act,Referencia_Act,Autorizacion_Act, Obs_Act)  
			values( @fecha, @usuario,@pc,@operacion,@IdEmpleado,@NPermiso,@FechaInicio,@FechaFin,@idMotivo,@Referencia,@Autorizacion, @Obs, @FechaInicio_Act,@FechaFin_Act, @idMotivo_Act, @Referencia_Act, @Autorizacion_Act, @Obs_Act ) 
		END
	
END' 
GO
ALTER TABLE [dbo].[Permiso] ENABLE TRIGGER [tr_aud_permiso]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tr_aud_permiso_Insert]'))
EXEC dbo.sp_executesql @statement = N'create TRIGGER tr_aud_permiso_Insert ON Permiso
FOR  INSERT
AS
SET NOCOUNT ON;

DECLARE @insertado int
SELECT @insertado=count(*) FROM inserted

DECLARE @usuario varchar(50), @fecha datetime, @pc varchar(50), @operacion char(1)
SELECT @usuario=suser_sname(), @fecha=getdate(), @pc=host_name()


declare @IdEmpleado int, 
@NPermiso int,
@FechaInicio datetime, 
@FechaFin datetime,
@idMotivo int,
@Referencia varchar(150),
@Autorizacion varchar(150),
@Obs varchar(150)

IF @insertado>0
BEGIN
	
			SELECT @operacion=''I''
			
			SELECT @IdEmpleado=IdEmpleado, @NPermiso=NPermiso, @FechaInicio=FechaInicio, @FechaFin=FechaFin,@idMotivo=idMotivo ,@Referencia=Referencia,
@Autorizacion=Autorizacion ,@Obs=Obs from inserted
			
			INSERT Permiso_Aud(fecha_aud, Usuario, Pc, operacion,idEmpleado,NPermiso,FechaInicio_Act,FechaFin_Act,idMotivo_Act,Referencia_Act,Autorizacion_Act, Obs_Act)  
			values( @fecha, @usuario,@pc,@operacion,@IdEmpleado,@NPermiso,@FechaInicio,@FechaFin,@idMotivo,@Referencia,@Autorizacion, @Obs) 
END' 
GO
ALTER TABLE [dbo].[Permiso] ENABLE TRIGGER [tr_aud_permiso_Insert]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tD_TipoDocID]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER tD_TipoDocID ON TipoDocID FOR DELETE AS
/* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
/* DELETE trigger on TipoDocID */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
    /* TipoDocID FK_Persona_TipoDocID Persona on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000107b0", PARENT_OWNER="dbo", PARENT_TABLE="TipoDocID"
    CHILD_OWNER="dbo", CHILD_TABLE="Persona"
    P2C_VERB_PHRASE="FK_Persona_TipoDocID", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Persona_TipoDocID", FK_COLUMNS="TipoDocID" */
    IF EXISTS (
      SELECT * FROM deleted,Persona
      WHERE
        /*  %JoinFKPK(Persona,deleted," = "," AND") */
        Persona.TipoDocID = deleted.TipoDocID
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = ''Cannot delete TipoDocID because Persona exists.''
      GOTO ERROR
    END


    /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END' 
GO
ALTER TABLE [dbo].[TipoDocID] ENABLE TRIGGER [tD_TipoDocID]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tU_TipoDocID]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER tU_TipoDocID ON TipoDocID FOR UPDATE AS
/* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
/* UPDATE trigger on TipoDocID */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insTipoDocID int,
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
  /* TipoDocID FK_Persona_TipoDocID Persona on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00012ad4", PARENT_OWNER="dbo", PARENT_TABLE="TipoDocID"
    CHILD_OWNER="dbo", CHILD_TABLE="Persona"
    P2C_VERB_PHRASE="FK_Persona_TipoDocID", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Persona_TipoDocID", FK_COLUMNS="TipoDocID" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(TipoDocID)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Persona
      WHERE
        /*  %JoinFKPK(Persona,deleted," = "," AND") */
        Persona.TipoDocID = deleted.TipoDocID
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = ''Cannot update TipoDocID because Persona exists.''
      GOTO ERROR
    END
  END


  /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END' 
GO
ALTER TABLE [dbo].[TipoDocID] ENABLE TRIGGER [tU_TipoDocID]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tD_Ubigeo]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER tD_Ubigeo ON Ubigeo FOR DELETE AS
/* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
/* DELETE trigger on Ubigeo */
BEGIN
  DECLARE  @errno   int,
           @errmsg  varchar(255)
    /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
    /* Ubigeo FK_Meta_Ubigeo Meta on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001fa22", PARENT_OWNER="dbo", PARENT_TABLE="Ubigeo"
    CHILD_OWNER="dbo", CHILD_TABLE="Meta"
    P2C_VERB_PHRASE="FK_Meta_Ubigeo", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Meta_Ubigeo", FK_COLUMNS="IdUbigeo" */
    IF EXISTS (
      SELECT * FROM deleted,Meta
      WHERE
        /*  %JoinFKPK(Meta,deleted," = "," AND") */
        Meta.IdUbigeo = deleted.IdUbigeo
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = ''Cannot delete Ubigeo because Meta exists.''
      GOTO ERROR
    END

    /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
    /* Ubigeo FK_Persona_Ubigeo Persona on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Ubigeo"
    CHILD_OWNER="dbo", CHILD_TABLE="Persona"
    P2C_VERB_PHRASE="FK_Persona_Ubigeo", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Persona_Ubigeo", FK_COLUMNS="IdUbigeo" */
    IF EXISTS (
      SELECT * FROM deleted,Persona
      WHERE
        /*  %JoinFKPK(Persona,deleted," = "," AND") */
        Persona.IdUbigeo = deleted.IdUbigeo
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = ''Cannot delete Ubigeo because Persona exists.''
      GOTO ERROR
    END


    /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
    RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END' 
GO
ALTER TABLE [dbo].[Ubigeo] ENABLE TRIGGER [tD_Ubigeo]
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[tU_Ubigeo]'))
EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER tU_Ubigeo ON Ubigeo FOR UPDATE AS
/* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
/* UPDATE trigger on Ubigeo */
BEGIN
  DECLARE  @NUMROWS int,
           @nullcnt int,
           @validcnt int,
           @insIdUbigeo char(6),
           @errno   int,
           @errmsg  varchar(255)

  SELECT @NUMROWS = @@rowcount
  /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
  /* Ubigeo FK_Meta_Ubigeo Meta on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000241ba", PARENT_OWNER="dbo", PARENT_TABLE="Ubigeo"
    CHILD_OWNER="dbo", CHILD_TABLE="Meta"
    P2C_VERB_PHRASE="FK_Meta_Ubigeo", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Meta_Ubigeo", FK_COLUMNS="IdUbigeo" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdUbigeo)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Meta
      WHERE
        /*  %JoinFKPK(Meta,deleted," = "," AND") */
        Meta.IdUbigeo = deleted.IdUbigeo
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = ''Cannot update Ubigeo because Meta exists.''
      GOTO ERROR
    END
  END

  /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
  /* Ubigeo FK_Persona_Ubigeo Persona on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Ubigeo"
    CHILD_OWNER="dbo", CHILD_TABLE="Persona"
    P2C_VERB_PHRASE="FK_Persona_Ubigeo", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK_Persona_Ubigeo", FK_COLUMNS="IdUbigeo" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(IdUbigeo)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,Persona
      WHERE
        /*  %JoinFKPK(Persona,deleted," = "," AND") */
        Persona.IdUbigeo = deleted.IdUbigeo
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = ''Cannot update Ubigeo because Persona exists.''
      GOTO ERROR
    END
  END


  /* ERwin Builtin viernes, 13 de junio de 2008 10:12:32 */
  RETURN
ERROR:
    raiserror @errno @errmsg
    rollback transaction
END' 
GO
ALTER TABLE [dbo].[Ubigeo] ENABLE TRIGGER [tU_Ubigeo]
GO
