USE [master]
GO
/****** Object:  Database [NegozioDischi]    Script Date: 16/07/2021 14:59:29 ******/
CREATE DATABASE [NegozioDischi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NegozioDischi', FILENAME = N'C:\Users\giapu\NegozioDischi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NegozioDischi_log', FILENAME = N'C:\Users\giapu\NegozioDischi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [NegozioDischi] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NegozioDischi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ARITHABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NegozioDischi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NegozioDischi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NegozioDischi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NegozioDischi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NegozioDischi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NegozioDischi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET  MULTI_USER 
GO
ALTER DATABASE [NegozioDischi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NegozioDischi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NegozioDischi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NegozioDischi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NegozioDischi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NegozioDischi] SET QUERY_STORE = OFF
GO
USE [NegozioDischi]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [NegozioDischi]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 16/07/2021 14:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[NComponenti] [int] NOT NULL,
 CONSTRAINT [PK_Band] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 16/07/2021 14:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](100) NOT NULL,
	[AnnoUscita] [int] NOT NULL,
	[CasaDiscografica] [nvarchar](100) NOT NULL,
	[Genere] [nvarchar](50) NOT NULL,
	[Distribuzione] [nvarchar](50) NOT NULL,
	[BandID] [int] NOT NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Titolo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranoAlbum]    Script Date: 16/07/2021 14:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranoAlbum](
	[IDBrano] [int] NOT NULL,
	[IDAlbum] [int] NOT NULL,
 CONSTRAINT [PK_AlbumBrano] PRIMARY KEY CLUSTERED 
(
	[IDBrano] ASC,
	[IDAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 16/07/2021 14:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](100) NOT NULL,
	[Durata] [time](7) NOT NULL,
 CONSTRAINT [PK_Brano] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AlbumDati]    Script Date: 16/07/2021 14:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AlbumDati] AS
SELECT
	B.Nome AS [Band]
	, a.Titolo AS [Titolo Album]
	, a.AnnoUscita AS [Anno di uscita]
	, a.CasaDiscografica AS [Casa discografica]
	,a.Genere AS [Genere]
	, a.Distribuzione AS [Distribuzione]
	,br.Titolo AS [Titolo Brano]
	,br.Durata AS [Durata]
	FROM Band b
	inner join Album a
	on b.ID=a.BandID
	inner join BranoAlbum ba
	on a.ID=ba.IDAlbum
	inner join Brano br
	on ba.IDBrano=br.ID
GO
/****** Object:  UserDefinedFunction [dbo].[ufnGenereMusicale]    Script Date: 16/07/2021 14:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnGenereMusicale] 
(	
		@Genere nvarchar(50)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT
		Genere AS [Genere]
		,count(Genere) as [Totale album]
	FROM Album a
	where a.Genere=@Genere
	group by a.Genere

);
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_Album_Band] FOREIGN KEY([BandID])
REFERENCES [dbo].[Band] ([ID])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_Album_Band]
GO
ALTER TABLE [dbo].[BranoAlbum]  WITH CHECK ADD  CONSTRAINT [FK_IDAlbum_Album] FOREIGN KEY([IDAlbum])
REFERENCES [dbo].[Album] ([ID])
GO
ALTER TABLE [dbo].[BranoAlbum] CHECK CONSTRAINT [FK_IDAlbum_Album]
GO
ALTER TABLE [dbo].[BranoAlbum]  WITH CHECK ADD  CONSTRAINT [FK_IDBrano_Brano] FOREIGN KEY([IDBrano])
REFERENCES [dbo].[Brano] ([ID])
GO
ALTER TABLE [dbo].[BranoAlbum] CHECK CONSTRAINT [FK_IDBrano_Brano]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [CK_Distribuzione] CHECK  (([Distribuzione]='Streaming' OR [Distribuzione]='Vinile' OR [Distribuzione]='CD'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [CK_Distribuzione]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [CK_Genere] CHECK  (([Genere]='Metal' OR [Genere]='Rock' OR [Genere]='Pop' OR [Genere]='Jazz' OR [Genere]='Classico'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [CK_Genere]
GO
/****** Object:  StoredProcedure [dbo].[sp_CercaCanzone]    Script Date: 16/07/2021 14:59:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_CercaCanzone] 
	@Titolo nvarchar(50)-- Add the parameters for the stored procedure here
AS
	(SELECT 
	b.Titolo AS [Brano]
	,b.Durata AS [Durata]
	,a.Titolo AS [Album]
	,a.AnnoUscita AS [Anno Uscita]

	FROM Brano b
	inner join BranoAlbum ba
	on b.ID=ba.IDBrano
	inner join Album a
	on ba.IDAlbum=a.ID
	where b.Titolo=@Titolo);

	return 0;

GO
USE [master]
GO
ALTER DATABASE [NegozioDischi] SET  READ_WRITE 
GO
