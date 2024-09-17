USE [Viajes365]
GO
/****** Object:  User [ProyectoViajes365]    Script Date: 01/05/2021 9:53:15 ******/
CREATE USER [ProyectoViajes365] FOR LOGIN [ProyectoViajes365] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ProyectoViajes365]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [ProyectoViajes365]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [ProyectoViajes365]
GO
/****** Object:  Table [dbo].[AtractivoTuristico]    Script Date: 01/05/2021 9:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AtractivoTuristico](
	[idAtractivo] [int] IDENTITY(1,1) NOT NULL,
	[tipoAtractivo] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](max) NOT NULL,
	[idLocalidad] [int] NOT NULL,
 CONSTRAINT [PK_Atractivo turistico] PRIMARY KEY CLUSTERED 
(
	[idAtractivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat]    Script Date: 01/05/2021 9:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[idChat] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[Consulta] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED 
(
	[idChat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clima]    Script Date: 01/05/2021 9:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clima](
	[idClima] [int] IDENTITY(1,1) NOT NULL,
	[idLocalidad] [int] NOT NULL,
	[PronosticoExtendido] [nvarchar](50) NOT NULL,
	[HistorialClimas] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clima] PRIMARY KEY CLUSTERED 
(
	[idClima] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 01/05/2021 9:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[idDpto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[cant_Itinerarios] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[idDpto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foro]    Script Date: 01/05/2021 9:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foro](
	[idForo] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[Procedencia] [nvarchar](100) NOT NULL,
	[MotivoVisita] [nvarchar](100) NOT NULL,
	[Conformidad] [nvarchar](100) NOT NULL,
	[Post] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Foro] PRIMARY KEY CLUSTERED 
(
	[idForo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Itinerario]    Script Date: 01/05/2021 9:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itinerario](
	[idItinerarios] [int] IDENTITY(1,1) NOT NULL,
	[idLocalidad] [int] NOT NULL,
	[Rutas] [nvarchar](50) NOT NULL,
	[Transporte] [nvarchar](50) NOT NULL,
	[cantDpto] [nvarchar](50) NOT NULL,
	[tipoItinerario] [nvarchar](50) NOT NULL,
	[kmsRecorridos] [nchar](10) NOT NULL,
	[hsViaje] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Itinerario] PRIMARY KEY CLUSTERED 
(
	[idItinerarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 01/05/2021 9:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[idLocalidad] [int] IDENTITY(1,1) NOT NULL,
	[idDpto] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Alojamiento] [nvarchar](50) NOT NULL,
	[Gastronomia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Localidades] PRIMARY KEY CLUSTERED 
(
	[idLocalidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 01/05/2021 9:53:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nchar](10) NOT NULL,
	[NombreUsuario] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[IdItinerario] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AtractivoTuristico]  WITH CHECK ADD  CONSTRAINT [FK_AtractivoTuristico_Localidades] FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidades] ([idLocalidad])
GO
ALTER TABLE [dbo].[AtractivoTuristico] CHECK CONSTRAINT [FK_AtractivoTuristico_Localidades]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Usuario1] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_Usuario1]
GO
ALTER TABLE [dbo].[Clima]  WITH CHECK ADD  CONSTRAINT [FK_Clima_Localidades] FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidades] ([idLocalidad])
GO
ALTER TABLE [dbo].[Clima] CHECK CONSTRAINT [FK_Clima_Localidades]
GO
ALTER TABLE [dbo].[Foro]  WITH CHECK ADD  CONSTRAINT [FK_Foro_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Foro] CHECK CONSTRAINT [FK_Foro_Usuario]
GO
ALTER TABLE [dbo].[Itinerario]  WITH CHECK ADD  CONSTRAINT [FK_Itinerario_Localidades] FOREIGN KEY([idLocalidad])
REFERENCES [dbo].[Localidades] ([idLocalidad])
GO
ALTER TABLE [dbo].[Itinerario] CHECK CONSTRAINT [FK_Itinerario_Localidades]
GO
ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD  CONSTRAINT [FK_Localidades_Departamentos] FOREIGN KEY([idDpto])
REFERENCES [dbo].[Departamentos] ([idDpto])
GO
ALTER TABLE [dbo].[Localidades] CHECK CONSTRAINT [FK_Localidades_Departamentos]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Itinerario] FOREIGN KEY([IdItinerario])
REFERENCES [dbo].[Itinerario] ([idItinerarios])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Itinerario]
GO
