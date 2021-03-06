USE [dbKatalog]
GO
/****** Object:  Table [dbo].[Katalozi]    Script Date: 31-Aug-15 22:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Katalozi](
	[IdKatalozi] [int] IDENTITY(1,1) NOT NULL,
	[NazivNaKatalog] [nvarchar](50) NULL,
	[OpisNaKatalog] [nvarchar](max) NULL,
	[DataNaKreiranje] [datetime] NULL,
	[IdPoedinci] [int] NULL,
	[IdKompanii] [int] NULL,
 CONSTRAINT [PK_Katalog] PRIMARY KEY CLUSTERED 
(
	[IdKatalozi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kategorii]    Script Date: 31-Aug-15 22:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorii](
	[IdKategorii] [int] IDENTITY(1,1) NOT NULL,
	[NazivNaKategorija] [nvarchar](50) NULL,
	[RoditelId] [int] NULL,
	[IdKatalozi] [int] NULL,
 CONSTRAINT [PK_Kategorija] PRIMARY KEY CLUSTERED 
(
	[IdKategorii] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Klienti]    Script Date: 31-Aug-15 22:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Klienti](
	[IdKlienti] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](100) NULL,
	[Prezime] [nvarchar](100) NULL,
	[NazivNaFirma] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
 CONSTRAINT [PK_Klient] PRIMARY KEY CLUSTERED 
(
	[IdKlienti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kompanii]    Script Date: 31-Aug-15 22:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kompanii](
	[IdKompanii] [int] IDENTITY(1,1) NOT NULL,
	[NazivNaKompanija] [nvarchar](100) NULL,
	[KorisnickoIme] [nvarchar](50) NULL,
	[Lozinka] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[LogoNaKompanija] [nvarchar](max) NULL,
	[OpisNaKompanija] [nvarchar](max) NULL,
	[Telefon] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kompanija] PRIMARY KEY CLUSTERED 
(
	[IdKompanii] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KompaniiKlienti]    Script Date: 31-Aug-15 22:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KompaniiKlienti](
	[IdKlienti] [int] NOT NULL,
	[IdKompanii] [int] NOT NULL,
 CONSTRAINT [PK_KompaniiKlienti] PRIMARY KEY CLUSTERED 
(
	[IdKlienti] ASC,
	[IdKompanii] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Poedinci]    Script Date: 31-Aug-15 22:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poedinci](
	[IdPoedinci] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](100) NULL,
	[Prezime] [nvarchar](100) NULL,
	[KorisnickoIme] [nvarchar](50) NULL,
	[Lozinka] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
 CONSTRAINT [PK_Poedinec] PRIMARY KEY CLUSTERED 
(
	[IdPoedinci] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PoedinciKlienti]    Script Date: 31-Aug-15 22:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PoedinciKlienti](
	[IdKlienti] [int] NOT NULL,
	[IdPoedinci] [int] NOT NULL,
 CONSTRAINT [PK_PoedinciKlienti] PRIMARY KEY CLUSTERED 
(
	[IdKlienti] ASC,
	[IdPoedinci] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Poraki]    Script Date: 31-Aug-15 22:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poraki](
	[IdPoraki] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](100) NULL,
	[Body] [nvarchar](max) NULL,
	[IsSent] [bit] NULL CONSTRAINT [DF_Poraki_IsSent]  DEFAULT ((0)),
	[IsDeleted] [bit] NULL CONSTRAINT [DF_Poraki_IsDeleted]  DEFAULT ((0)),
	[Date] [datetime] NULL,
	[IdKompanii] [int] NULL,
	[IdPoedinci] [int] NULL,
 CONSTRAINT [PK_Poraki] PRIMARY KEY CLUSTERED 
(
	[IdPoraki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PorakiKlienti]    Script Date: 31-Aug-15 22:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PorakiKlienti](
	[IdPoraki] [int] NOT NULL,
	[IdKlienti] [int] NOT NULL,
 CONSTRAINT [PK_PorakiKlienti] PRIMARY KEY CLUSTERED 
(
	[IdPoraki] ASC,
	[IdKlienti] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proizvodi]    Script Date: 31-Aug-15 22:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvodi](
	[IdProizvodi] [int] IDENTITY(1,1) NOT NULL,
	[NazivNaProizvod] [nvarchar](50) NULL,
	[Specifikacija] [nvarchar](max) NULL,
	[Cena] [decimal](18, 2) NULL,
	[Popust] [int] NULL,
	[SlikaNaProizvod] [nvarchar](max) NULL,
	[Dostapnost] [bit] NULL,
	[IdKategorii] [int] NULL,
 CONSTRAINT [PK_Proizvod] PRIMARY KEY CLUSTERED 
(
	[IdProizvodi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebSiteSettings]    Script Date: 31-Aug-15 22:09:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebSiteSettings](
	[IdKatalozi] [int] NOT NULL,
	[FontFamily] [nvarchar](50) NULL,
	[FontColor1] [nvarchar](50) NULL,
	[FontColor2] [nvarchar](50) NULL,
	[BGPocetna] [nvarchar](max) NULL,
	[BGZaNas] [nvarchar](max) NULL,
	[BGFZaNas] [nvarchar](max) NULL,
	[BGPortfolio] [nvarchar](max) NULL,
	[BGFPortfolio] [nvarchar](max) NULL,
	[BGContact] [nvarchar](max) NULL,
	[BGMenu] [nvarchar](max) NULL,
	[BGFooter] [nvarchar](max) NULL,
	[Naziv] [nvarchar](max) NULL,
 CONSTRAINT [PK_WebSiteSettings] PRIMARY KEY CLUSTERED 
(
	[IdKatalozi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Katalozi] ON 

GO
INSERT [dbo].[Katalozi] ([IdKatalozi], [NazivNaKatalog], [OpisNaKatalog], [DataNaKreiranje], [IdPoedinci], [IdKompanii]) VALUES (1, N'Katalog1', N'opis1', NULL, 1, NULL)
GO
INSERT [dbo].[Katalozi] ([IdKatalozi], [NazivNaKatalog], [OpisNaKatalog], [DataNaKreiranje], [IdPoedinci], [IdKompanii]) VALUES (2, N'Katalog2', N'opis2', NULL, 1, NULL)
GO
INSERT [dbo].[Katalozi] ([IdKatalozi], [NazivNaKatalog], [OpisNaKatalog], [DataNaKreiranje], [IdPoedinci], [IdKompanii]) VALUES (3, N'Katalog3', N'opis3', NULL, NULL, 2)
GO
INSERT [dbo].[Katalozi] ([IdKatalozi], [NazivNaKatalog], [OpisNaKatalog], [DataNaKreiranje], [IdPoedinci], [IdKompanii]) VALUES (4, N'Каталог1', N'Опис Каталог1', NULL, NULL, 1)
GO
INSERT [dbo].[Katalozi] ([IdKatalozi], [NazivNaKatalog], [OpisNaKatalog], [DataNaKreiranje], [IdPoedinci], [IdKompanii]) VALUES (5, N'Каталог2', N'Опис Каталог2', NULL, NULL, 1)
GO
INSERT [dbo].[Katalozi] ([IdKatalozi], [NazivNaKatalog], [OpisNaKatalog], [DataNaKreiranje], [IdPoedinci], [IdKompanii]) VALUES (6, N'Каталог3', N'Опис Каталог3', NULL, NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Katalozi] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategorii] ON 

GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (6, N'Kategorija1', NULL, 1)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (7, N'Kategorija2', 6, 1)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (8, N'Kategorija3', 7, 1)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (9, N'Kategorija4', NULL, 2)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (10, N'Kategorija5', NULL, 3)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (11, N'Категорија1', NULL, 4)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (12, N'Категорија2', NULL, 4)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (15, N'Категорија1-1', 11, 4)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (16, N'Категорија1-2', 11, 4)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (17, N'Категорија1-3', 11, 4)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (23, N'К2Категорија1', NULL, 5)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (24, N'К2Категорија2', NULL, 5)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (25, N'К2Категорија3', NULL, 5)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (26, N'К3Категорија1', NULL, 6)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (27, N'К3Категорија2', NULL, 6)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (28, N'К3Категорија1-1', 26, 6)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (29, N'Dragan', 11, 4)
GO
SET IDENTITY_INSERT [dbo].[Kategorii] OFF
GO
SET IDENTITY_INSERT [dbo].[Klienti] ON 

GO
INSERT [dbo].[Klienti] ([IdKlienti], [Ime], [Prezime], [NazivNaFirma], [Mail], [Telefon]) VALUES (1, N'Ime1', N'Prezime1', N'Naziv1', N'mail@yahoo.com', N'34234543')
GO
INSERT [dbo].[Klienti] ([IdKlienti], [Ime], [Prezime], [NazivNaFirma], [Mail], [Telefon]) VALUES (2, N'Dragan', N'Nakevski', N'Naziv2', N'Archaic.dragan@gmail.com', N'42345346')
GO
INSERT [dbo].[Klienti] ([IdKlienti], [Ime], [Prezime], [NazivNaFirma], [Mail], [Telefon]) VALUES (3, N'Ime3', N'Prezime3', N'Naziv3', N'mail@yahoo.com', N'31243432')
GO
SET IDENTITY_INSERT [dbo].[Klienti] OFF
GO
SET IDENTITY_INSERT [dbo].[Kompanii] ON 

GO
INSERT [dbo].[Kompanii] ([IdKompanii], [NazivNaKompanija], [KorisnickoIme], [Lozinka], [Mail], [LogoNaKompanija], [OpisNaKompanija], [Telefon]) VALUES (1, N'Kompanija1', N'kompanija1', N'kompanija1', N'mail@yahoo.com', NULL, N'opis1', N'1243432')
GO
INSERT [dbo].[Kompanii] ([IdKompanii], [NazivNaKompanija], [KorisnickoIme], [Lozinka], [Mail], [LogoNaKompanija], [OpisNaKompanija], [Telefon]) VALUES (2, N'Kompanija2', N'kompanija2', N'kompanija2', N'mail@yahoo.com', NULL, N'opis2', N'344543')
GO
SET IDENTITY_INSERT [dbo].[Kompanii] OFF
GO
INSERT [dbo].[KompaniiKlienti] ([IdKlienti], [IdKompanii]) VALUES (1, 1)
GO
INSERT [dbo].[KompaniiKlienti] ([IdKlienti], [IdKompanii]) VALUES (1, 2)
GO
INSERT [dbo].[KompaniiKlienti] ([IdKlienti], [IdKompanii]) VALUES (2, 1)
GO
INSERT [dbo].[KompaniiKlienti] ([IdKlienti], [IdKompanii]) VALUES (2, 2)
GO
INSERT [dbo].[KompaniiKlienti] ([IdKlienti], [IdKompanii]) VALUES (3, 1)
GO
SET IDENTITY_INSERT [dbo].[Poedinci] ON 

GO
INSERT [dbo].[Poedinci] ([IdPoedinci], [Ime], [Prezime], [KorisnickoIme], [Lozinka], [Mail], [Telefon]) VALUES (1, N'Ime1', N'Prezime1', N'ime1', N'lozinka1', N'mail@yahoo.com', N'4354654')
GO
INSERT [dbo].[Poedinci] ([IdPoedinci], [Ime], [Prezime], [KorisnickoIme], [Lozinka], [Mail], [Telefon]) VALUES (2, N'Ime2', N'Prezime2', N'ime2', N'lozinka2', N'mail@yahoo.com', N'23452435')
GO
SET IDENTITY_INSERT [dbo].[Poedinci] OFF
GO
INSERT [dbo].[PoedinciKlienti] ([IdKlienti], [IdPoedinci]) VALUES (1, 1)
GO
INSERT [dbo].[PoedinciKlienti] ([IdKlienti], [IdPoedinci]) VALUES (1, 2)
GO
INSERT [dbo].[PoedinciKlienti] ([IdKlienti], [IdPoedinci]) VALUES (2, 1)
GO
INSERT [dbo].[PoedinciKlienti] ([IdKlienti], [IdPoedinci]) VALUES (2, 2)
GO
INSERT [dbo].[PoedinciKlienti] ([IdKlienti], [IdPoedinci]) VALUES (3, 2)
GO
SET IDENTITY_INSERT [dbo].[Poraki] ON 

GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci]) VALUES (1, N'subject1', N'body1', 1, 1, CAST(N'2015-08-30 13:37:17.403' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci]) VALUES (2, N'subject2', N'body2', 1, 0, CAST(N'2015-08-30 13:37:17.403' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci]) VALUES (4, N'Testing Mail', N'This is testing mail', 1, 0, CAST(N'2015-08-30 13:36:42.577' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci]) VALUES (5, N'This is another test', N'Ram daga dam ', 1, 0, CAST(N'2015-08-30 14:06:53.920' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci]) VALUES (6, N'Jadan Dace', N'Andi ne mi dava da kupu coper', 1, 0, CAST(N'2015-08-30 22:25:49.330' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci]) VALUES (7, N'Jadan Dace', N'Andi ne mi dava da kupu coper', 0, 1, CAST(N'2015-08-30 22:26:17.053' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci]) VALUES (8, N'Hulala', N'Hulala la la al ', 0, 0, CAST(N'2015-08-31 22:04:40.953' AS DateTime), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Poraki] OFF
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (1, 1)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (1, 2)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (2, 1)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (2, 3)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (5, 1)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (5, 2)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (6, 2)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (6, 3)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (7, 2)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (7, 3)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (8, 2)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (8, 3)
GO
SET IDENTITY_INSERT [dbo].[Proizvodi] ON 

GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (1, N'proizvod1', N'spec1', CAST(30.00 AS Decimal(18, 2)), 20, N'/Images/UserImages/Cover_1_1433887055.jpg', 1, 6)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (2, N'proizvod2', N'spec2', CAST(68.00 AS Decimal(18, 2)), 12, NULL, 1, 7)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (3, N'proizvod3', N'spec3', CAST(987.00 AS Decimal(18, 2)), 3, NULL, 0, 9)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (4, N'Производ 1', N'Спецификација за производ1', CAST(20.00 AS Decimal(18, 2)), 10, N'/Images/UserImages/Cover_4.jpg', 1, 11)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (5, N'Производ 2', N'Спецификација за  Производ 2', CAST(30.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_5.jpg', 0, 11)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (6, N'Производ 3', N'Спецификација за Производ 3', CAST(40.00 AS Decimal(18, 2)), 30, N'/Images/UserImages/Cover_6.jpg', 1, 11)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (7, N'Производ 4', N'Спецификација за Производ 4', CAST(200.00 AS Decimal(18, 2)), 90, N'/Images/UserImages/Cover_7.jpg', 1, 11)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (8, N'Производ 5', N'Спецификација за Производ 5', CAST(3000.00 AS Decimal(18, 2)), 40, N'/Images/UserImages/Cover_8.jpg', 1, 11)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (9, N'Производ 6', N'Спецификација за Производ 6', CAST(4000.00 AS Decimal(18, 2)), 43, N'/Images/UserImages/Cover_9.jpg', 1, 11)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (10, N'Производ  7', N'Спецификација за  Производ 7 ', CAST(3000.00 AS Decimal(18, 2)), 42, N'/Images/UserImages/Cover_10.jpg', 1, 11)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (11, N'Производ  8', N'Спецификација за производ 8', CAST(1000.00 AS Decimal(18, 2)), 12, N'/Images/UserImages/Cover_11.jpg', 1, 11)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (12, N'Производ  9', N'Спецификација на Производ 9', CAST(13444.00 AS Decimal(18, 2)), 32, N'/Images/UserImages/Cover_12.jpg', 0, 11)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (13, N'Производ 1', N'Спецификација за Производ 1', CAST(43.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_13.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (14, N'Производ 2', N'Спецификација за Производ 2', CAST(2100.00 AS Decimal(18, 2)), 85, N'/Images/UserImages/Cover_14.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (15, N'Производ 3', N'Спецификација за Производ 3', CAST(21898.00 AS Decimal(18, 2)), 28, N'/Images/UserImages/Cover_15.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (16, N'Производ 4', N'Спецификација за Производ 4', CAST(23000.00 AS Decimal(18, 2)), 35, N'/Images/UserImages/Cover_16.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (17, N'Производ 5', N'Спецификација за Производ 5', CAST(450.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_17.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (18, N'Производ 6', N'Спецификација за производ 6', CAST(451.00 AS Decimal(18, 2)), 21, N'/Images/UserImages/Cover_18.jpg', 0, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (19, N'Производ 7', N'Спецификација за Производ 7', CAST(350.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_19.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (20, N'Производ 8', N'Спецификација за Производ 8', CAST(400.00 AS Decimal(18, 2)), 90, N'/Images/UserImages/Cover_20.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (21, N'Производ 9', N'Спецификација за Производ 9', CAST(800.00 AS Decimal(18, 2)), 89, N'/Images/UserImages/Cover_21.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (22, N'Производ 10', N'Спецификација за Производ 10', CAST(67.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_22.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (23, N'Производ 11', N'Спецификација за Производ 11', CAST(23.00 AS Decimal(18, 2)), 45, N'/Images/UserImages/Cover_23.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (24, N'Производ 12', N'Спецификација за Производ 12', CAST(300.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_24.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (25, N'Производ 13', N'Спецификација за Производ 13', CAST(450.00 AS Decimal(18, 2)), 40, N'/Images/UserImages/Cover_25.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (26, N'Произод 14', N'Спецификација за Производ 14', CAST(5622.00 AS Decimal(18, 2)), 34, N'/Images/UserImages/Cover_26.jpg', 1, 15)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (27, N'Производ 1', N'Спецификација за Производ 1', CAST(300.00 AS Decimal(18, 2)), 34, N'/Images/UserImages/Cover_27.jpg', 0, 16)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (28, N'Производ 2', N'Спецификација за Производ 2', CAST(400.00 AS Decimal(18, 2)), 89, N'/Images/UserImages/Cover_28.jpg', 1, 16)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (29, N'Производ 3', N'Спецификација за Производ 3', CAST(1000.00 AS Decimal(18, 2)), 30, N'/Images/UserImages/Cover_29.jpg', 1, 16)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (30, N'Производ 4', N'Спецификација за Производ 4', CAST(2000.00 AS Decimal(18, 2)), 56, N'/Images/UserImages/Cover_30.jpg', 0, 16)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (31, N'Производ 5', N'Спецификација за Производ 5', CAST(340.00 AS Decimal(18, 2)), 23, N'/Images/UserImages/Cover_31.jpg', 1, 16)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (32, N'Производ 5', N'Спецификација за Производ 5', CAST(788.00 AS Decimal(18, 2)), 2, N'/Images/UserImages/Cover_32.jpg', 1, 16)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (33, N'Производ 7', N'Спецификација за Производ 7', CAST(566.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_33.jpg', 1, 16)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (34, N'Производ 1', N'Спецификација за Производ 1', CAST(1000.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_34.jpg', 1, 17)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (35, N'Производ 2', N'Спецификација за Производ 2', CAST(100.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_35.jpg', 1, 17)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (36, N'Производ 3', N'Спецификација за Производ 3', CAST(200.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_36.jpg', 1, 17)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (37, N'Производ 4', N'Спецификација за Производ 4', CAST(230.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_37.jpg', 1, 17)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (38, N'Производ 5', N'Спецификација за Производ 5', CAST(400.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_38_1437069552.jpg', 1, 17)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (39, N'Производ 1', N'Спецификација за Производ 1', CAST(300.00 AS Decimal(18, 2)), 30, N'/Images/UserImages/Cover_39.jpg', 1, 12)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (40, N'Производ 2', N'Спецификација за Производ 2', CAST(500.00 AS Decimal(18, 2)), 10, N'/Images/UserImages/Cover_40.jpg', 1, 12)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (41, N'Производ 1', N'Спецификација за Производ 1', CAST(21.00 AS Decimal(18, 2)), 12, N'/Images/UserImages/Cover_41.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (42, N'Производ 2', N'Спецификација за Производ 2', CAST(400.00 AS Decimal(18, 2)), 90, N'/Images/UserImages/Cover_42.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (43, N'Производ 3', N'Спецификација за Производ 3', CAST(5000.00 AS Decimal(18, 2)), 50, N'/Images/UserImages/Cover_43.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (44, N'Производ 4', N'Спецификација на Производ 4', CAST(67.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_44.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (45, N'Производ 5', N'Спецификација за Производ 5', CAST(45.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_45.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (46, N'Произвд 6', N'Спецификација за Производ 6', CAST(700.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_46.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (47, N'Производ 7', N'Спецификација за Производ 7', CAST(900.00 AS Decimal(18, 2)), 9, N'/Images/UserImages/Cover_47.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (48, N'Производ 8', N'Спецификација за Производ 8', CAST(760.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_48.jpg', 0, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (49, N'Производ 9', N'Спецификација за Производ 9', CAST(345.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_49.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (50, N'Производ 10', N'Спецификација за Производ 10', CAST(900.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_50.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (51, N'Производ 11', N'Спецификација за Производ 11', CAST(0.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_51.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (52, N'Производ 12', N'Спецификација за Производ 12', CAST(0.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_52.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (53, N'Производ 13', N'Спецификација за Производ 13', CAST(0.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_53.jpg', 1, 23)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (54, N'Производ 1', N'Спецификација за Производ 1', CAST(500.00 AS Decimal(18, 2)), 90, N'/Images/UserImages/Cover_54.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (55, N'Производ 2', N'Спецификација за Производ 2', CAST(300.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_55.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (56, N'Производ 3', N'Спецификација за Производ 3', CAST(90.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_56.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (57, N'Производ 4', N'Спецификација за Производ 4', CAST(1800.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_57.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (58, N'Производ 5', N'Спецификација за Производ 5', CAST(900.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_58.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (59, N'Производ 6', N'Спецификација за Производ 6', CAST(890.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_59.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (60, N'Производ 7', N'Спецификација за Производ 7', CAST(300.00 AS Decimal(18, 2)), 90, N'/Images/UserImages/Cover_60.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (61, N'Производ 8', N'Спецификација за Производ 8', CAST(500.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_61.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (62, N'Производ 9', N'Спецификација за Производ 9', CAST(234.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_62.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (63, N'Производ 10', N'Спецификација за Производ 10', CAST(124.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_63.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (64, N'Производ 11', N'Спецификација за Производ 11', CAST(10.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_64.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (65, N'Производ 12', N'Спецификација за Производ 12', CAST(31.00 AS Decimal(18, 2)), 2, N'/Images/UserImages/Cover_65.jpg', 1, 24)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (66, N'Производ 1', N'Спецификација за Производ 1', CAST(434.00 AS Decimal(18, 2)), 32, N'/Images/UserImages/Cover_66.jpg', 1, 25)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (67, N'Производ 2', N'Спецификација за Производ 2', CAST(500.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_67.jpg', 1, 25)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (68, N'Производ 3', N'Спецификација за Производ 3', CAST(671.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_68.jpg', 1, 25)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (69, N'Производ 4', N'Спецификација за Производ 4', CAST(632.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_69.jpg', 1, 25)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (70, N'Производ 5', N'Спецификација за Производ 5', CAST(89.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_70.jpg', 1, 25)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (71, N'Производ 6', N'Спецификација за Производ 6', CAST(90.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_71.jpg', 1, 25)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (72, N'Производ 7', N'Спецификација за Производ 7', CAST(3872.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_72.jpg', 1, 25)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (73, N'Производ 8', N'Спецификација за Производ 8', CAST(90.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_73.jpg', 1, 25)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (74, N'Производ 1', N'Спецификација 1', CAST(0.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_74.jpg', 1, 28)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (75, N'Производ 2', N'Спецификација 2', CAST(76.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_75.jpg', 1, 28)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (76, N'Производ 3', N'Спецификација 3', CAST(9.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_76.jpg', 1, 28)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (77, N'Производ 4', N'Спецификација за Производ 4', CAST(0.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_77.jpg', 1, 28)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (78, N'Производ 5', N'Спецификација за Производ 5', CAST(60.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_78.jpg', 1, 28)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (79, N'Производ 6', N'Спецификација за Производ 6', CAST(90.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_79.jpg', 1, 28)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (80, N'Производ 7', N'Спецификација за Производ 7', CAST(9.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_80.jpg', 1, 28)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (81, N'Производ 8', N'Спецификација за Производ 8', CAST(0.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_81.jpg', 1, 28)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (82, N'Производ 1', N'Спецификација за Производ 1', CAST(900.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_82.jpg', 1, 27)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (83, N'Производ 2', N'Спецификација за Производ 2', CAST(432.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_83.jpg', 1, 27)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (84, N'Производ 3', N'Спецификација за Производ 3', CAST(3.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_84.jpg', 1, 27)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (85, N'Производ 4', N'Спецификација за Производ 4', CAST(90.00 AS Decimal(18, 2)), 9, N'/Images/UserImages/Cover_85.jpg', 1, 27)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (86, N'Производ 5', N'Спецификација за Производ 5', CAST(0.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_86.jpg', 1, 27)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (87, N'Производ 6', N'Спецификација за Производ 6', CAST(90.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_87.jpg', 1, 27)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (88, N'Производ 7', N'Спецификација за Производ 7', CAST(0.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_88.jpg', 1, 27)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (89, N'Производ 8', N'Спецификација за Производ 8', CAST(0.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_89.jpg', 1, 27)
GO
SET IDENTITY_INSERT [dbo].[Proizvodi] OFF
GO
INSERT [dbo].[WebSiteSettings] ([IdKatalozi], [FontFamily], [FontColor1], [FontColor2], [BGPocetna], [BGZaNas], [BGFZaNas], [BGPortfolio], [BGFPortfolio], [BGContact], [BGMenu], [BGFooter], [Naziv]) VALUES (4, N'OpenSans-Regular', N'darkBlueDarker', N'greenLighter', N'/Areas/Portfolio/Images/HomeBackgroundImage.jpg', N'#FFFFFF', N'/Areas/Portfolio/Images/AboutFooter.jpg', N'#FFFFFF', N'/Areas/Portfolio/Images/AboutFooter.jpg', N'#ECF0F1', N'#f7f9f7', N'#ECF0F1', N'Назив на Веб Сајтот')
GO
/****** Object:  Index [IdKatalozi]    Script Date: 31-Aug-15 22:09:57 ******/
ALTER TABLE [dbo].[WebSiteSettings] ADD  CONSTRAINT [IdKatalozi] UNIQUE NONCLUSTERED 
(
	[IdKatalozi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Katalozi]  WITH CHECK ADD  CONSTRAINT [FK_Katalozi_Kompanii] FOREIGN KEY([IdKompanii])
REFERENCES [dbo].[Kompanii] ([IdKompanii])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Katalozi] CHECK CONSTRAINT [FK_Katalozi_Kompanii]
GO
ALTER TABLE [dbo].[Katalozi]  WITH CHECK ADD  CONSTRAINT [FK_Katalozi_Poedineci] FOREIGN KEY([IdPoedinci])
REFERENCES [dbo].[Poedinci] ([IdPoedinci])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Katalozi] CHECK CONSTRAINT [FK_Katalozi_Poedineci]
GO
ALTER TABLE [dbo].[Kategorii]  WITH CHECK ADD  CONSTRAINT [FK_Kategorii_Katalozi] FOREIGN KEY([IdKatalozi])
REFERENCES [dbo].[Katalozi] ([IdKatalozi])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Kategorii] CHECK CONSTRAINT [FK_Kategorii_Katalozi]
GO
ALTER TABLE [dbo].[Kategorii]  WITH CHECK ADD  CONSTRAINT [FK_Kategorii_Kategorii] FOREIGN KEY([RoditelId])
REFERENCES [dbo].[Kategorii] ([IdKategorii])
GO
ALTER TABLE [dbo].[Kategorii] CHECK CONSTRAINT [FK_Kategorii_Kategorii]
GO
ALTER TABLE [dbo].[KompaniiKlienti]  WITH CHECK ADD  CONSTRAINT [FK_KompaniiKlienti_Klienti] FOREIGN KEY([IdKlienti])
REFERENCES [dbo].[Klienti] ([IdKlienti])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KompaniiKlienti] CHECK CONSTRAINT [FK_KompaniiKlienti_Klienti]
GO
ALTER TABLE [dbo].[KompaniiKlienti]  WITH CHECK ADD  CONSTRAINT [FK_KompaniiKlienti_Kompanii] FOREIGN KEY([IdKompanii])
REFERENCES [dbo].[Kompanii] ([IdKompanii])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KompaniiKlienti] CHECK CONSTRAINT [FK_KompaniiKlienti_Kompanii]
GO
ALTER TABLE [dbo].[PoedinciKlienti]  WITH CHECK ADD  CONSTRAINT [FK_PoedinciKlienti_Klienti] FOREIGN KEY([IdKlienti])
REFERENCES [dbo].[Klienti] ([IdKlienti])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PoedinciKlienti] CHECK CONSTRAINT [FK_PoedinciKlienti_Klienti]
GO
ALTER TABLE [dbo].[PoedinciKlienti]  WITH CHECK ADD  CONSTRAINT [FK_PoedinciKlienti_Poedineci] FOREIGN KEY([IdPoedinci])
REFERENCES [dbo].[Poedinci] ([IdPoedinci])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PoedinciKlienti] CHECK CONSTRAINT [FK_PoedinciKlienti_Poedineci]
GO
ALTER TABLE [dbo].[Poraki]  WITH CHECK ADD  CONSTRAINT [FK_Poraki_Kompanii] FOREIGN KEY([IdKompanii])
REFERENCES [dbo].[Kompanii] ([IdKompanii])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Poraki] CHECK CONSTRAINT [FK_Poraki_Kompanii]
GO
ALTER TABLE [dbo].[Poraki]  WITH CHECK ADD  CONSTRAINT [FK_Poraki_Poedinci] FOREIGN KEY([IdPoedinci])
REFERENCES [dbo].[Poedinci] ([IdPoedinci])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Poraki] CHECK CONSTRAINT [FK_Poraki_Poedinci]
GO
ALTER TABLE [dbo].[PorakiKlienti]  WITH CHECK ADD  CONSTRAINT [FK_PorakiKlienti_Klienti] FOREIGN KEY([IdKlienti])
REFERENCES [dbo].[Klienti] ([IdKlienti])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PorakiKlienti] CHECK CONSTRAINT [FK_PorakiKlienti_Klienti]
GO
ALTER TABLE [dbo].[PorakiKlienti]  WITH CHECK ADD  CONSTRAINT [FK_PorakiKlienti_Poraki] FOREIGN KEY([IdPoraki])
REFERENCES [dbo].[Poraki] ([IdPoraki])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PorakiKlienti] CHECK CONSTRAINT [FK_PorakiKlienti_Poraki]
GO
ALTER TABLE [dbo].[Proizvodi]  WITH CHECK ADD  CONSTRAINT [FK_Proizvodi_Kategorii] FOREIGN KEY([IdKategorii])
REFERENCES [dbo].[Kategorii] ([IdKategorii])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Proizvodi] CHECK CONSTRAINT [FK_Proizvodi_Kategorii]
GO
ALTER TABLE [dbo].[WebSiteSettings]  WITH CHECK ADD  CONSTRAINT [FK_WebSiteSettings_Katalozi] FOREIGN KEY([IdKatalozi])
REFERENCES [dbo].[Katalozi] ([IdKatalozi])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WebSiteSettings] CHECK CONSTRAINT [FK_WebSiteSettings_Katalozi]
GO
