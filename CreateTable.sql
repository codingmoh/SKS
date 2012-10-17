USE [SKS]
GO
/****** Object:  Table [dbo].[MesswertTyp]    Script Date: 10/17/2012 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MesswertTyp](
	[MesswertTypID] [int] IDENTITY(1,1) NOT NULL,
	[Minimum] [bigint] NOT NULL,
	[Maximum] [bigint] NOT NULL,
	[Einheit] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MesswertTyp] PRIMARY KEY CLUSTERED 
(
	[MesswertTypID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterData]    Script Date: 10/17/2012 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterData](
	[MasterDataID] [bigint] IDENTITY(1,1) NOT NULL,
	[Vorname] [nvarchar](max) NOT NULL,
	[Nachname] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](15) NOT NULL,
	[Passwort] [nvarchar](15) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_MasterData] PRIMARY KEY CLUSTERED 
(
	[MasterDataID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messwert]    Script Date: 10/17/2012 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messwert](
	[MesswertID] [bigint] IDENTITY(1,1) NOT NULL,
	[Wert] [float] NOT NULL,
	[Zeitpunkt] [datetime] NOT NULL,
	[AnlageSeriennummer] [bigint] NOT NULL,
	[MesswertTypID] [int] NOT NULL,
 CONSTRAINT [PK_Messwert] PRIMARY KEY CLUSTERED 
(
	[MesswertID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kunde]    Script Date: 10/17/2012 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kunde](
	[KundeID] [bigint] IDENTITY(1,1) NOT NULL,
	[TechnikerID] [bigint] NOT NULL,
	[MasterDataID] [bigint] NOT NULL,
 CONSTRAINT [PK_Kunde] PRIMARY KEY CLUSTERED 
(
	[KundeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Techniker]    Script Date: 10/17/2012 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Techniker](
	[TechnikerID] [bigint] IDENTITY(1,1) NOT NULL,
	[MasterDataID] [bigint] NOT NULL,
 CONSTRAINT [PK_Techniker] PRIMARY KEY CLUSTERED 
(
	[TechnikerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Anlage]    Script Date: 10/17/2012 15:05:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anlage](
	[AnlageSeriennummer] [bigint] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Latitude] [float] NOT NULL,
	[Beschreibung] [nvarchar](max) NOT NULL,
	[KundeID] [bigint] NOT NULL,
 CONSTRAINT [PK_Anlage] PRIMARY KEY CLUSTERED 
(
	[AnlageSeriennummer] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Anlage_Kunde]    Script Date: 10/17/2012 15:05:01 ******/
ALTER TABLE [dbo].[Anlage]  WITH CHECK ADD  CONSTRAINT [FK_Anlage_Kunde] FOREIGN KEY([KundeID])
REFERENCES [dbo].[Kunde] ([KundeID])
GO
ALTER TABLE [dbo].[Anlage] CHECK CONSTRAINT [FK_Anlage_Kunde]
GO
/****** Object:  ForeignKey [FK_Kunde_MasterData]    Script Date: 10/17/2012 15:05:01 ******/
ALTER TABLE [dbo].[Kunde]  WITH CHECK ADD  CONSTRAINT [FK_Kunde_MasterData] FOREIGN KEY([MasterDataID])
REFERENCES [dbo].[MasterData] ([MasterDataID])
GO
ALTER TABLE [dbo].[Kunde] CHECK CONSTRAINT [FK_Kunde_MasterData]
GO
/****** Object:  ForeignKey [FK_Kunde_Techniker]    Script Date: 10/17/2012 15:05:01 ******/
ALTER TABLE [dbo].[Kunde]  WITH CHECK ADD  CONSTRAINT [FK_Kunde_Techniker] FOREIGN KEY([TechnikerID])
REFERENCES [dbo].[Techniker] ([TechnikerID])
GO
ALTER TABLE [dbo].[Kunde] CHECK CONSTRAINT [FK_Kunde_Techniker]
GO
/****** Object:  ForeignKey [FK_Messwert_Anlage]    Script Date: 10/17/2012 15:05:01 ******/
ALTER TABLE [dbo].[Messwert]  WITH CHECK ADD  CONSTRAINT [FK_Messwert_Anlage] FOREIGN KEY([AnlageSeriennummer])
REFERENCES [dbo].[Anlage] ([AnlageSeriennummer])
GO
ALTER TABLE [dbo].[Messwert] CHECK CONSTRAINT [FK_Messwert_Anlage]
GO
/****** Object:  ForeignKey [FK_Messwert_MesswertTyp]    Script Date: 10/17/2012 15:05:01 ******/
ALTER TABLE [dbo].[Messwert]  WITH CHECK ADD  CONSTRAINT [FK_Messwert_MesswertTyp] FOREIGN KEY([MesswertTypID])
REFERENCES [dbo].[MesswertTyp] ([MesswertTypID])
GO
ALTER TABLE [dbo].[Messwert] CHECK CONSTRAINT [FK_Messwert_MesswertTyp]
GO
/****** Object:  ForeignKey [FK_Techniker_MasterData]    Script Date: 10/17/2012 15:05:01 ******/
ALTER TABLE [dbo].[Techniker]  WITH CHECK ADD  CONSTRAINT [FK_Techniker_MasterData] FOREIGN KEY([MasterDataID])
REFERENCES [dbo].[MasterData] ([MasterDataID])
GO
ALTER TABLE [dbo].[Techniker] CHECK CONSTRAINT [FK_Techniker_MasterData]
GO
