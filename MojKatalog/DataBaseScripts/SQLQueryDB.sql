USE [dbKatalog]
GO
/****** Object:  Table [dbo].[Katalozi]    Script Date: 6/9/2015 10:50:23 PM ******/
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
/****** Object:  Table [dbo].[Kategorii]    Script Date: 6/9/2015 10:50:23 PM ******/
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
/****** Object:  Table [dbo].[Klienti]    Script Date: 6/9/2015 10:50:23 PM ******/
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
/****** Object:  Table [dbo].[Kompanii]    Script Date: 6/9/2015 10:50:23 PM ******/
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
/****** Object:  Table [dbo].[KompaniiKlienti]    Script Date: 6/9/2015 10:50:23 PM ******/
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
/****** Object:  Table [dbo].[PoedinciKlienti]    Script Date: 6/9/2015 10:50:23 PM ******/
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
/****** Object:  Table [dbo].[Poedineci]    Script Date: 6/9/2015 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poedineci](
	[IdPoedineci] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](100) NULL,
	[Prezime] [nvarchar](100) NULL,
	[KorisnickoIme] [nvarchar](50) NULL,
	[Lozinka] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Telefon] [nvarchar](50) NULL,
 CONSTRAINT [PK_Poedinec] PRIMARY KEY CLUSTERED 
(
	[IdPoedineci] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Poraki]    Script Date: 6/9/2015 10:50:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poraki](
	[IdPoraki] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](100) NULL,
	[Body] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Poraki] PRIMARY KEY CLUSTERED 
(
	[IdPoraki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PorakiKlienti]    Script Date: 6/9/2015 10:50:23 PM ******/
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
/****** Object:  Table [dbo].[Proizvodi]    Script Date: 6/9/2015 10:50:23 PM ******/
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
ALTER TABLE [dbo].[Katalozi]  WITH CHECK ADD  CONSTRAINT [FK_Katalozi_Kompanii] FOREIGN KEY([IdKompanii])
REFERENCES [dbo].[Kompanii] ([IdKompanii])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Katalozi] CHECK CONSTRAINT [FK_Katalozi_Kompanii]
GO
ALTER TABLE [dbo].[Katalozi]  WITH CHECK ADD  CONSTRAINT [FK_Katalozi_Poedineci] FOREIGN KEY([IdPoedinci])
REFERENCES [dbo].[Poedineci] ([IdPoedineci])
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
REFERENCES [dbo].[Poedineci] ([IdPoedineci])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PoedinciKlienti] CHECK CONSTRAINT [FK_PoedinciKlienti_Poedineci]
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
