USE [dbKatalog]
GO
/****** Object:  Table [dbo].[Katalozi]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
/****** Object:  Table [dbo].[Kategorii]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
/****** Object:  Table [dbo].[Klienti]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
/****** Object:  Table [dbo].[Kompanii]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
/****** Object:  Table [dbo].[KompaniiKlienti]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
/****** Object:  Table [dbo].[Poedinci]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
	[OpisNaPoedinec] [nvarchar](max) NULL,
 CONSTRAINT [PK_Poedinec] PRIMARY KEY CLUSTERED 
(
	[IdPoedinci] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PoedinciKlienti]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
/****** Object:  Table [dbo].[Poraki]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
	[IsReceived] [bit] NULL,
	[SenderMail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Poraki] PRIMARY KEY CLUSTERED 
(
	[IdPoraki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PorakiKlienti]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
/****** Object:  Table [dbo].[Proizvodi]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
/****** Object:  Table [dbo].[WebSiteSettings]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
	[SodrzinaZaNasF] [nvarchar](max) NULL,
	[SodrzinaPortfolioF] [nvarchar](max) NULL,
 CONSTRAINT [PK_WebSiteSettings] PRIMARY KEY CLUSTERED 
(
	[IdKatalozi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Katalozi] ON 

GO
INSERT [dbo].[Katalozi] ([IdKatalozi], [NazivNaKatalog], [OpisNaKatalog], [DataNaKreiranje], [IdPoedinci], [IdKompanii]) VALUES (7, N'Каталог1', N'ОписЗаКаталог1', NULL, 1, NULL)
GO
INSERT [dbo].[Katalozi] ([IdKatalozi], [NazivNaKatalog], [OpisNaKatalog], [DataNaKreiranje], [IdPoedinci], [IdKompanii]) VALUES (8, N'Каталог2', N'ОписЗаКаталог2', NULL, 1, NULL)
GO
INSERT [dbo].[Katalozi] ([IdKatalozi], [NazivNaKatalog], [OpisNaKatalog], [DataNaKreiranje], [IdPoedinci], [IdKompanii]) VALUES (9, N'Каталог3', N'ОписЗаКаталог3', NULL, 1, NULL)
GO
INSERT [dbo].[Katalozi] ([IdKatalozi], [NazivNaKatalog], [OpisNaKatalog], [DataNaKreiranje], [IdPoedinci], [IdKompanii]) VALUES (10, N'Каталог1', N'Опис на Каталог 1', NULL, NULL, 1)
GO
INSERT [dbo].[Katalozi] ([IdKatalozi], [NazivNaKatalog], [OpisNaKatalog], [DataNaKreiranje], [IdPoedinci], [IdKompanii]) VALUES (11, N'Каталог 2', N'Опис на Каталог 2', CAST(N'2015-10-02 23:12:29.310' AS DateTime), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Katalozi] OFF
GO
SET IDENTITY_INSERT [dbo].[Kategorii] ON 

GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (33, N'Категорија1.1', NULL, 7)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (34, N'Категорија1.2', NULL, 7)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (35, N'Категорија1.1-1', 33, 7)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (36, N'Категорија1.1-1-1', 35, 7)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (37, N'Категорија1.2-1', 34, 7)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (38, N'Категорија1.1-2', 33, 7)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (39, N'Категорија2.1', NULL, 8)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (41, N'Категорија3.1', NULL, 9)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (42, N'Категорија3.2', NULL, 9)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (43, N'К1Категорија1', NULL, 10)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (44, N'К1Категорија2', NULL, 10)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (45, N'К1-1', 43, 10)
GO
INSERT [dbo].[Kategorii] ([IdKategorii], [NazivNaKategorija], [RoditelId], [IdKatalozi]) VALUES (46, N'Категорија2.1-1', 39, 8)
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
INSERT [dbo].[Klienti] ([IdKlienti], [Ime], [Prezime], [NazivNaFirma], [Mail], [Telefon]) VALUES (4, N'КлиентИме1', N'КлиентПрезиме1', NULL, N'andrijana.andi@gmail.com', N'003892134')
GO
INSERT [dbo].[Klienti] ([IdKlienti], [Ime], [Prezime], [NazivNaFirma], [Mail], [Telefon]) VALUES (5, N'Андријана', N'Тренчевска', N'Компанија1', N'andrijana_andi@yahoo.com', N'8987498734')
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
INSERT [dbo].[KompaniiKlienti] ([IdKlienti], [IdKompanii]) VALUES (5, 1)
GO
SET IDENTITY_INSERT [dbo].[Poedinci] ON 

GO
INSERT [dbo].[Poedinci] ([IdPoedinci], [Ime], [Prezime], [KorisnickoIme], [Lozinka], [Mail], [Telefon], [OpisNaPoedinec]) VALUES (1, N'Ime1', N'Prezime1', N'ime1', N'lozinka1', N'mail@yahoo.com', N'4354654', N'Име Презиме родена на 10.10.1989 год. Куманово. Студент на Факултет за Информатички науки и Компјутерско инженерство. Област на интерес: Програмирање. Хоби: Ликовна уметност.')
GO
INSERT [dbo].[Poedinci] ([IdPoedinci], [Ime], [Prezime], [KorisnickoIme], [Lozinka], [Mail], [Telefon], [OpisNaPoedinec]) VALUES (2, N'Ime2', N'Prezime2', N'ime2', N'lozinka2', N'mail@yahoo.com', N'23452435', NULL)
GO
SET IDENTITY_INSERT [dbo].[Poedinci] OFF
GO
INSERT [dbo].[PoedinciKlienti] ([IdKlienti], [IdPoedinci]) VALUES (4, 1)
GO
SET IDENTITY_INSERT [dbo].[Poraki] ON 

GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci], [IsReceived], [SenderMail]) VALUES (1, N'Порака тест', N'клјцсд', 1, 1, CAST(N'2015-09-20 22:21:10.390' AS DateTime), NULL, 1, 0, NULL)
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci], [IsReceived], [SenderMail]) VALUES (2, N'Naslov1', N'Poraka111', 0, 0, CAST(N'2015-09-21 14:42:26.837' AS DateTime), NULL, 1, 1, N'andi@yahoo.com')
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci], [IsReceived], [SenderMail]) VALUES (3, N'Naslov2', N'Poraka2', 0, 0, CAST(N'2015-09-21 14:51:39.207' AS DateTime), NULL, 1, 1, N'andi@yahoo.com')
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci], [IsReceived], [SenderMail]) VALUES (4, N'Naslov3', N'Poraka3', 0, 1, CAST(N'2015-09-21 15:00:23.483' AS DateTime), NULL, 1, 1, N'andi@yahoo.com')
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci], [IsReceived], [SenderMail]) VALUES (6, N'Poraka1', N'Proba1', 1, 0, CAST(N'2015-10-05 14:50:21.260' AS DateTime), NULL, 1, 0, NULL)
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci], [IsReceived], [SenderMail]) VALUES (7, N'Socuvaj ', N'Socuvaj Poraka', 0, 0, CAST(N'2015-10-05 15:23:47.600' AS DateTime), NULL, 1, 0, NULL)
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci], [IsReceived], [SenderMail]) VALUES (8, N'naslov1', N'sodrzina1', 1, 0, CAST(N'2015-12-01 16:46:28.767' AS DateTime), 1, NULL, 0, NULL)
GO
INSERT [dbo].[Poraki] ([IdPoraki], [Subject], [Body], [IsSent], [IsDeleted], [Date], [IdKompanii], [IdPoedinci], [IsReceived], [SenderMail]) VALUES (9, N'Poraka Kompanija1', N'Poraka Tekst', 0, 0, CAST(N'2015-12-17 14:53:30.687' AS DateTime), 1, NULL, 1, N'andrijana_andi@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Poraki] OFF
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (1, 4)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (6, 4)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (7, 4)
GO
INSERT [dbo].[PorakiKlienti] ([IdPoraki], [IdKlienti]) VALUES (8, 5)
GO
SET IDENTITY_INSERT [dbo].[Proizvodi] ON 

GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (93, N'К1.1 Производ1', N'Спецификација за  К1.1 Производ1', CAST(233.00 AS Decimal(18, 2)), 2, N'/Images/UserImages/Cover_93.jpg', 1, 33)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (94, N'К1.1 Производ2', N'Спецификација за  К1.1 Производ2', NULL, NULL, N'/Images/UserImages/Cover_94.jpg', 1, 33)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (95, N'К1.1 Производ3', N'Спецификација за  К1.1 Производ3', CAST(321.00 AS Decimal(18, 2)), 32, N'/Images/UserImages/Cover_95.jpg', 1, 33)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (96, N'К1.1 Производ4', N'Спецификација за  К1.1 Производ4', CAST(232.00 AS Decimal(18, 2)), 2, N'/Images/UserImages/Cover_96.jpg', 1, 33)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (97, N'К1.1 Производ5', N'Спецификација за  К1.1 Производ5', CAST(23.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_97.jpg', 1, 33)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (98, N'К1.1 Производ6', N'Спецификација за К1.1 Производ6', CAST(43.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_98.jpg', 1, 33)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (99, N'К1.1 Производ7', N'Спецификација за  К1.1 Производ7', CAST(34.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_99.jpg', 0, 33)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (100, N'К1.1-1 Производ1', N'Спецификација за  К1.1-1 Производ1', CAST(312.00 AS Decimal(18, 2)), 32, N'/Images/UserImages/Cover_100.jpg', 1, 35)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (101, N'К1.1-1 Производ2', N'Спецификација за  К1.1-1 Производ2в', CAST(236.00 AS Decimal(18, 2)), NULL, N'/Images/UserImages/Cover_101.jpg', 1, 35)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (102, N'К1.1-1 Производ3', N'Спецификација за К1.1-1 Производ3', CAST(456.00 AS Decimal(18, 2)), 0, N'/Images/UserImages/Cover_102.jpg', 1, 35)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (103, N'К1.1-1 Производ4', N'Спецификација за К1.1-1 Производ4', NULL, NULL, N'/Images/UserImages/Cover_103_1442769243.jpg', 1, 35)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (104, N'К1.1-1 Производ5', N'Спецификација за К1.1-1 Производ5', NULL, NULL, N'/Images/UserImages/Cover_104.jpg', 1, 35)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (105, N'К1.1-1 Производ6', N'Спецификација за К1.1-1 Производ6', CAST(243.00 AS Decimal(18, 2)), 4, N'/Images/UserImages/Cover_105.jpg', 1, 35)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (106, N'К1.1 Производ7', N'Спецификација за К1.1 Производ7', CAST(424.00 AS Decimal(18, 2)), 5, N'/Images/UserImages/Cover_106.jpg', 0, 35)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (107, N'К1.1-1-1 Производ1', N'Спецификација за К1.1-1-1 Производ1', CAST(432.00 AS Decimal(18, 2)), 54, N'/Images/UserImages/Cover_107.jpg', 0, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (108, N'К1.1-1-1 Производ2', N'Спецификација за К1.1-1-1 Производ2', CAST(4346.00 AS Decimal(18, 2)), 76, N'/Images/UserImages/Cover_108.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (109, N'К1.1-1-1 Производ3', N'Спецификација за  К1.1-1-1 Производ3', CAST(54.00 AS Decimal(18, 2)), 6, N'/Images/UserImages/Cover_109.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (110, N'К1.1-1-1 Производ4', N'Спецификација за К1.1-1-1 Производ4', NULL, NULL, N'/Images/UserImages/Cover_110.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (111, N'К1.1-1-1 Производ5', N'Спецификација за К1.1-1-1 Производ5', CAST(75.00 AS Decimal(18, 2)), 7, N'/Images/UserImages/Cover_111.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (112, N'К1.1-1-1 Производ6', N'Спецификација за К1.1-1-1 Производ6', CAST(32.00 AS Decimal(18, 2)), 4, N'/Images/UserImages/Cover_112.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (113, N'К1.1-1-1 Производ7', N'Спецификација за К1.1-1-1 Производ7', CAST(43.00 AS Decimal(18, 2)), 4, N'/Images/UserImages/Cover_113.jpg', 0, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (114, N'К1.1-1-1 Производ8', N'Спецификација за К1.1-1-1 Производ8', CAST(35.00 AS Decimal(18, 2)), 4, N'/Images/UserImages/Cover_114.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (115, N'К1.1-1-1 Производ9', N'Спецификација за К1.1-1-1 Производ9', NULL, NULL, N'/Images/UserImages/Cover_115.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (116, N'К1.1-1-1 Производ10', N'Спецификација за К1.1-1-1 Производ10', NULL, NULL, N'/Images/UserImages/Cover_116.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (117, N'К1.1-1-1 Производ11', N'Спецификација за К1.1-1-1 Производ11', CAST(64.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_117.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (118, N'К1.1-1-1 Производ12', N'Спецификација за К1.1-1-1 Производ12', NULL, NULL, N'/Images/UserImages/Cover_118.jpg', 0, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (119, N'К1.1-1-1 Производ13', N'Спецификација за К1.1-1-1 Производ13', CAST(46.00 AS Decimal(18, 2)), 5, N'/Images/UserImages/Cover_119.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (120, N'К1.1-1-1 Производ14', N'Спецификација за К1.1-1-1 Производ14', CAST(4.00 AS Decimal(18, 2)), 6, N'/Images/UserImages/Cover_120.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (121, N'К1.1-1-1 Производ15', N'Спецификација за К1.1-1-1 Производ15', CAST(54.00 AS Decimal(18, 2)), 4, N'/Images/UserImages/Cover_121.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (122, N'К1.1-1-1 Производ16', N'Спецификација за К1.1-1-1 Производ16', CAST(54.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_122.jpg', 1, 36)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (123, N'К1.1-2 Производ1', N'Спецификација за К1.1-2 Производ1', CAST(54.00 AS Decimal(18, 2)), 6, N'/Images/UserImages/Cover_123.jpg', 1, 38)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (124, N'К1.1-2 Производ2', N'Спецификација за К1.1-2 Производ2', NULL, NULL, N'/Images/UserImages/Cover_124.jpg', 1, 38)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (125, N'К1.1-2 Производ3', N'Спецификација за К1.1-2 Производ3', CAST(54.00 AS Decimal(18, 2)), 45, N'/Images/UserImages/Cover_125.jpg', 0, 38)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (126, N'К1.1-2 Производ4', N'Спецификација за К1.1-2 Производ4', CAST(234.00 AS Decimal(18, 2)), 54, N'/Images/UserImages/Cover_126.jpg', 1, 38)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (127, N'К1.1-2 Производ5', N'Спецификација за К1.1-2 Производ5', CAST(75.00 AS Decimal(18, 2)), 7, N'/Images/UserImages/Cover_127.jpg', 1, 38)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (128, N'К1.1-2 Производ6', N'Спецификација за К1.1-2 Производ6', CAST(54.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_128.jpg', 1, 38)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (129, N'К1.1-2 Производ7', N'Спецификација за К1.1-2 Производ7', CAST(43.00 AS Decimal(18, 2)), 5, N'/Images/UserImages/Cover_129.jpg', 1, 38)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (130, N'К1.1-2 Производ8', N'Спецификација за К1.1-2 Производ8', CAST(64.00 AS Decimal(18, 2)), 6, N'/Images/UserImages/Cover_130.jpg', 1, 38)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (131, N'К1.2 Производ1', N'Спецификација за К1.2 Производ1', CAST(345.00 AS Decimal(18, 2)), 4, N'/Images/UserImages/Cover_131.jpg', 1, 34)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (132, N'К1.2 Производ2', N'Спецификација за К1.2 Производ2', CAST(534636.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_132.jpg', 1, 34)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (133, N'К1.2 Производ3', N'Спецификација за К1.2 Производ3', CAST(4657.00 AS Decimal(18, 2)), 5, N'/Images/UserImages/Cover_133.jpg', 1, 34)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (134, N'К1.2 Производ4', N'Спецификација за К1.2 Производ4', CAST(575.00 AS Decimal(18, 2)), 2, N'/Images/UserImages/Cover_134.jpg', 0, 34)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (135, N'К1.2 Производ5', N'Спецификација за К1.2 Производ5', NULL, NULL, N'/Images/UserImages/Cover_135.jpg', 1, 34)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (136, N'К1.2 Производ6', N'Спецификација за К1.2 Производ6', CAST(345.00 AS Decimal(18, 2)), 54, N'/Images/UserImages/Cover_136.jpg', 1, 34)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (137, N'К1.2 Производ7', N'Спецификација за К1.2 Производ7', NULL, NULL, N'/Images/UserImages/Cover_137.jpg', 1, 34)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (138, N'К1.2 Производ8', N'Спецификација за  К1.2 Производ8', NULL, NULL, N'/Images/UserImages/Cover_138.jpg', 1, 34)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (139, N'К1.2-1 Производ1', N'Спецификација за К1.2-1 Производ1', CAST(12.00 AS Decimal(18, 2)), 4, N'/Images/UserImages/Cover_139.jpg', 0, 37)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (140, N'К1.2-1 Производ2', N'Спецификација за К1.2-1 Производ2', CAST(32.00 AS Decimal(18, 2)), 5, N'/Images/UserImages/Cover_140.jpg', 1, 37)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (141, N'К1.2-1 Производ3', N'Спецификација за К1.2-1 Производ3', CAST(423.00 AS Decimal(18, 2)), 5, N'/Images/UserImages/Cover_141.jpg', 1, 37)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (142, N'К1.2-1 Производ4', N'Спецификација за К1.2-1 Производ4', CAST(5454.00 AS Decimal(18, 2)), NULL, N'/Images/UserImages/Cover_142.jpg', 1, 37)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (143, N'К1.2-1 Производ5', N'Спецификација за К1.2-1 Производ5', NULL, NULL, N'/Images/UserImages/Cover_143.jpg', 1, 37)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (144, N'К1.2-1 Производ6', N'Спецификација за К1.2-1 Производ6', NULL, NULL, N'/Images/UserImages/Cover_144.jpg', 1, 37)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (145, N'К1.2-1 Производ7', N'Спецификација за К1.2-1 Производ7', NULL, NULL, N'/Images/UserImages/Cover_145.jpg', 1, 37)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (146, N'К1.2-1 Производ8', N'Спецификација за К1.2-1 Производ8', CAST(523.00 AS Decimal(18, 2)), 4, N'/Images/UserImages/Cover_146.jpg', 1, 37)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (147, N'К2.1 Производ1', N'Спецификација за К2.1 Производ1', CAST(253.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_147.JPG', 1, 39)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (148, N'К2.1 Производ2', N'Спецификација за К2.1 Производ2', CAST(86.00 AS Decimal(18, 2)), 5, N'/Images/UserImages/Cover_148.JPG', 1, 39)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (149, N'К2.1 Производ3', N'Спецификација за  К2.1 Производ3', NULL, NULL, N'/Images/UserImages/Cover_149.JPG', 1, 39)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (150, N'К2.1 Производ4', N'Спецификација за К2.1 Производ4', CAST(686.00 AS Decimal(18, 2)), 6, N'/Images/UserImages/Cover_150.JPG', 0, 39)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (151, N'К2.1 Производ5', N'Спецификација за К2.1 Производ5', CAST(87.00 AS Decimal(18, 2)), 34, N'/Images/UserImages/Cover_151.JPG', 1, 39)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (152, N'К2.1 Производ6', N'Спецификација за К2.1 Производ6', NULL, NULL, N'/Images/UserImages/Cover_152.JPG', 1, 39)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (153, N'К2.1-1 Производ1', N'Спецификација за К2.1-1 Производ1', NULL, NULL, N'/Images/UserImages/Cover_153.jpg', 1, 46)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (154, N'К2.1-1 Производ2', N'Спецификација за К2.1-1 Производ2', CAST(65.00 AS Decimal(18, 2)), 3, N'/Images/UserImages/Cover_154.jpg', 1, 46)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (155, N'К2.1-1 Производ3', N'Спецификација за К2.1-1 Производ3', NULL, NULL, N'/Images/UserImages/Cover_155.jpg', 1, 46)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (156, N'К2.1-1 Производ4', N'Спецификација за К2.1-1 Производ4', NULL, NULL, N'/Images/UserImages/Cover_156.jpg', 1, 46)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (157, N'К2.1-1 Производ5', N'Спецификација за К2.1-1 Производ5', CAST(76.00 AS Decimal(18, 2)), 5, N'/Images/UserImages/Cover_157.jpg', 1, 46)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (158, N'К2.1-1 Производ6', N'Спецификација за К2.1-1 Производ6', NULL, NULL, N'/Images/UserImages/Cover_158.jpg', 1, 46)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (159, N'К3.1 Производ1', N'Спецификација за К3.1 Производ1', CAST(65.00 AS Decimal(18, 2)), 5, N'/Images/UserImages/Cover_159.jpg', 1, 41)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (160, N'К3.1 Производ2', N'Спецификација за К3.1 Производ2', NULL, NULL, N'/Images/UserImages/Cover_160.jpg', 1, 41)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (161, N'К3.1 Производ3', N'Спецификација за К3.1 Производ3', NULL, NULL, N'/Images/UserImages/Cover_161.jpg', 1, 41)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (162, N'К3.1 Производ4', N'Спецификација за К3.1 Производ4', CAST(4643.00 AS Decimal(18, 2)), 4, N'/Images/UserImages/Cover_162.jpg', 1, 41)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (163, N'К3.1 Производ5', N'Спецификација за К3.1 Производ5', CAST(45.00 AS Decimal(18, 2)), 5, N'/Images/UserImages/Cover_163.jpg', 1, 41)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (164, N'К3.1 Производ6', N'Спецификација за К3.1 Производ6', NULL, NULL, N'/Images/UserImages/Cover_164.jpg', 1, 41)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (165, N'К3.1 Производ7', N'Спецификација за К3.1 Производ7', CAST(745.00 AS Decimal(18, 2)), 5, N'/Images/UserImages/Cover_165.jpg', 1, 41)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (166, N'К3.1 Производ8', N'Спецификација за К3.1 Производ8', NULL, NULL, N'/Images/UserImages/Cover_166.jpg', 1, 41)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (167, N'К3.1 Производ9', N'Спецификација за К3.1 Производ9', NULL, NULL, N'/Images/UserImages/Cover_167.jpg', 1, 41)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (168, N'К3.2 Производ1', N'Спецификација за К3.2 Производ1', NULL, NULL, N'/Images/UserImages/Cover_168.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (169, N'К3.2 Производ2', N'Спецификација за К3.2 Производ2', NULL, NULL, N'/Images/UserImages/Cover_169.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (170, N'К3.2 Производ3', N'Спецификација за К3.2 Производ3', NULL, NULL, N'/Images/UserImages/Cover_170.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (171, N'К3.2 Производ4', N'Спецификација за К3.2 Производ4', NULL, NULL, N'/Images/UserImages/Cover_171.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (172, N'К3.2 Производ5', N'Спецификација за К3.2 Производ5', NULL, NULL, N'/Images/UserImages/Cover_172.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (173, N'К3.2 Производ6', N'Спецификација за К3.2 Производ6', NULL, NULL, N'/Images/UserImages/Cover_173.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (174, N'К3.2 Производ7', N'Спецификација за К3.2 Производ7', NULL, NULL, N'/Images/UserImages/Cover_174.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (175, N'К3.2 Производ8', N'Спецификација за К3.2 Производ8', NULL, NULL, N'/Images/UserImages/Cover_175_1442773271.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (176, N'К3.2 Производ9', N'Спецификација за К3.2 Производ7', NULL, NULL, N'/Images/UserImages/Cover_176.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (177, N'К3.2 Производ10', N'Спецификација за К3.2 Производ10', NULL, NULL, N'/Images/UserImages/Cover_177.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (178, N'К3.2 Производ11', N'Спецификација за К3.2 Производ11', NULL, NULL, N'/Images/UserImages/Cover_178.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (179, N'К3.2 Производ12', N'Спецификација за К3.2 Производ12', NULL, NULL, N'/Images/UserImages/Cover_179.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (180, N'К3.2 Производ13', N'Спецификација за К3.2 Производ13', NULL, NULL, N'/Images/UserImages/Cover_180.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (181, N'К3.2 Производ14', N'Спецификација за К3.2 Производ14', NULL, NULL, N'/Images/UserImages/Cover_181.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (182, N'К3.2 Производ15', N'Спецификација за К3.2 Производ15', NULL, NULL, N'/Images/UserImages/Cover_182.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (183, N'К3.2 Производ16', N'Спецификација за К3.2 Производ16', NULL, NULL, N'/Images/UserImages/Cover_183.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (184, N'К3.2 Производ17', N'Спецификација за К3.2 Производ17', NULL, NULL, N'/Images/UserImages/Cover_184.jpg', 1, 42)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (185, N'К1Категорија1', N'Спецификација за К1Категорија1', NULL, NULL, N'/Images/UserImages/Cover_185.jpg', 1, 43)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (186, N'К1 Производ2', N'Спецификација за Производ 2', NULL, NULL, N'/Images/UserImages/Cover_186.jpg', 1, 43)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (187, N'К1 Производ3 ', N'Спецификација за Производ 3', NULL, NULL, N'/Images/UserImages/Cover_187.jpg', 1, 43)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (188, N'Производ1', N'Спецификација за Производ 1', NULL, NULL, N'/Images/UserImages/Cover_188.jpg', 1, 45)
GO
INSERT [dbo].[Proizvodi] ([IdProizvodi], [NazivNaProizvod], [Specifikacija], [Cena], [Popust], [SlikaNaProizvod], [Dostapnost], [IdKategorii]) VALUES (189, N'Производ1', N'Спецификација за производ 1', NULL, NULL, N'/Images/UserImages/Cover_189.jpg', 1, 44)
GO
SET IDENTITY_INSERT [dbo].[Proizvodi] OFF
GO
INSERT [dbo].[WebSiteSettings] ([IdKatalozi], [FontFamily], [FontColor1], [FontColor2], [BGPocetna], [BGZaNas], [BGFZaNas], [BGPortfolio], [BGFPortfolio], [BGContact], [BGMenu], [BGFooter], [Naziv], [SodrzinaZaNasF], [SodrzinaPortfolioF]) VALUES (7, N'OpenSans-Regular', N'darkBlueDarker', N'greenLighter', N'/Areas/Portfolio/Images/HomeBackgroundImage.jpg', N'white', N'/Areas/Portfolio/Images/AboutFooter.jpg', N'white', N'/Areas/Portfolio/Images/AboutFooter.jpg', N'lightGreyLighter', N'lightGreyLighter', N'lightGreyLighter', N'Андријана Тренчевска', N'The details are not details , they make the design', N'The details are not details , they make the design')
GO
INSERT [dbo].[WebSiteSettings] ([IdKatalozi], [FontFamily], [FontColor1], [FontColor2], [BGPocetna], [BGZaNas], [BGFZaNas], [BGPortfolio], [BGFPortfolio], [BGContact], [BGMenu], [BGFooter], [Naziv], [SodrzinaZaNasF], [SodrzinaPortfolioF]) VALUES (8, N'OpenSans-Regular', N'darkBlueDarker', N'greenLighter', N'/Areas/Portfolio/UploadedFiles/Pocetna_8_1450376613.jpeg', N'white', N'/Areas/Portfolio/Images/AboutFooter.jpg', N'white', N'/Areas/Portfolio/Images/AboutFooter.jpg', N'lightGreyLighter', N'lightGreyLighter', N'lightGreyLighter', N'Ime1 Prezime1', N'The details are not details , they make the design', N'The details are not details , they make the design')
GO
INSERT [dbo].[WebSiteSettings] ([IdKatalozi], [FontFamily], [FontColor1], [FontColor2], [BGPocetna], [BGZaNas], [BGFZaNas], [BGPortfolio], [BGFPortfolio], [BGContact], [BGMenu], [BGFooter], [Naziv], [SodrzinaZaNasF], [SodrzinaPortfolioF]) VALUES (9, N'OpenSans-Regular', N'darkBlueDarker', N'greenLighter', N'/Areas/Portfolio/UploadedFiles/Pocetna_9_1450387947.jpeg', N'white', N'/Areas/Portfolio/UploadedFiles/FooterZaNas_9_1450388014.jpeg', N'white', N'/Areas/Portfolio/Images/AboutFooter.jpg', N'lightGreyLighter', N'lightGreyLighter', N'lightGreyLighter', N'Ime1 Prezime1', N'The details are not details , they make the design', N'The details are not details , they make the design')
GO
INSERT [dbo].[WebSiteSettings] ([IdKatalozi], [FontFamily], [FontColor1], [FontColor2], [BGPocetna], [BGZaNas], [BGFZaNas], [BGPortfolio], [BGFPortfolio], [BGContact], [BGMenu], [BGFooter], [Naziv], [SodrzinaZaNasF], [SodrzinaPortfolioF]) VALUES (10, N'OpenSans-Regular', N'darkBlueDarker', N'greenLighter', N'/Areas/Portfolio/Images/HomeBackgroundImage.jpg', N'white', N'/Areas/Portfolio/Images/AboutFooter.jpg', N'white', N'/Areas/Portfolio/Images/AboutFooter.jpg', N'lightGreyLighter', N'lightGreyLighter', N'lightGreyLighter', NULL, NULL, N'Содржина 1 2 3 4 Содрќина дојоеф кфјсхдфкс кферхфк ењркфг')
GO
INSERT [dbo].[WebSiteSettings] ([IdKatalozi], [FontFamily], [FontColor1], [FontColor2], [BGPocetna], [BGZaNas], [BGFZaNas], [BGPortfolio], [BGFPortfolio], [BGContact], [BGMenu], [BGFooter], [Naziv], [SodrzinaZaNasF], [SodrzinaPortfolioF]) VALUES (11, N'OpenSans-Regular', N'darkBlueDarker', N'greenLighter', N'/Areas/Portfolio/Images/HomeBackgroundImage.jpg', N'white', N'/Areas/Portfolio/Images/AboutFooter.jpg', N'white', N'/Areas/Portfolio/Images/AboutFooter.jpg', N'lightGreyLighter', N'lightGreyLighter', N'lightGreyLighter', NULL, NULL, NULL)
GO
/****** Object:  Index [IdKatalozi]    Script Date: 17-Feb-16 7:54:12 PM ******/
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
