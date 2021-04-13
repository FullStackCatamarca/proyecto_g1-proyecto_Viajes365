USE [master]
GO
/****** Object:  Database [Viajes365]    Script Date: 13/04/2021 18:23:10 ******/
CREATE DATABASE [Viajes365]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Localidades', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Localidades.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Localidades_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Localidades_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Viajes365] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Viajes365].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Viajes365] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Viajes365] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Viajes365] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Viajes365] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Viajes365] SET ARITHABORT OFF 
GO
ALTER DATABASE [Viajes365] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Viajes365] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Viajes365] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Viajes365] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Viajes365] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Viajes365] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Viajes365] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Viajes365] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Viajes365] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Viajes365] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Viajes365] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Viajes365] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Viajes365] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Viajes365] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Viajes365] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Viajes365] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Viajes365] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Viajes365] SET RECOVERY FULL 
GO
ALTER DATABASE [Viajes365] SET  MULTI_USER 
GO
ALTER DATABASE [Viajes365] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Viajes365] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Viajes365] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Viajes365] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Viajes365] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Viajes365] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Viajes365', N'ON'
GO
ALTER DATABASE [Viajes365] SET QUERY_STORE = OFF
GO
USE [Viajes365]
GO
/****** Object:  Table [dbo].[AtractivoTuristico]    Script Date: 13/04/2021 18:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AtractivoTuristico](
	[idAtractivo] [int] NOT NULL,
	[idLocalidad] [int] NOT NULL,
	[tipoAtractivo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Atractivo turistico] PRIMARY KEY CLUSTERED 
(
	[idAtractivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat]    Script Date: 13/04/2021 18:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[idChat] [nchar](10) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[Consulta] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED 
(
	[idChat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clima]    Script Date: 13/04/2021 18:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clima](
	[idClima] [nchar](10) NOT NULL,
	[idLocalidad] [int] NOT NULL,
	[PronosticoExtendido] [nvarchar](50) NOT NULL,
	[HistorialClimas] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Clima] PRIMARY KEY CLUSTERED 
(
	[idClima] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 13/04/2021 18:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamentos](
	[idDpto] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[cant_Itinerarios] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[idDpto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Foro]    Script Date: 13/04/2021 18:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Foro](
	[idForo] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Itinerario]    Script Date: 13/04/2021 18:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Itinerario](
	[idItinerarios] [int] NOT NULL,
	[idLocalidad] [int] NOT NULL,
	[Rutas] [nvarchar](50) NOT NULL,
	[Transporte] [nvarchar](50) NOT NULL,
	[cantDpto] [nvarchar](50) NOT NULL,
	[tipoItinerario] [nvarchar](50) NOT NULL,
	[kmsRecorridos] [nvarchar](50) NOT NULL,
	[hsViaje] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Itinerario] PRIMARY KEY CLUSTERED 
(
	[idItinerarios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 13/04/2021 18:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidades](
	[idLocalidad] [int] NOT NULL,
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 13/04/2021 18:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nchar](10) NOT NULL,
	[NombreUsuario] [nvarchar](50) NOT NULL,
	[Email] [nchar](10) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
	[FechaRegistro] [nchar](10) NOT NULL,
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
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_Usuario]
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
USE [master]
GO
ALTER DATABASE [Viajes365] SET  READ_WRITE 
GO
