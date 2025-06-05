USE [vulneramecum]
GO
/****** Object:  Table [dbo].[Examples]    Script Date: 05/06/2025 14:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examples](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VulnerabilityId] [int] NOT NULL,
	[ProjectName] [nvarchar](100) NOT NULL,
	[ClassName] [nvarchar](100) NOT NULL,
	[CommitHash] [nvarchar](100) NOT NULL,
	[CommitDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vulnerabilities]    Script Date: 05/06/2025 14:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vulnerabilities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Language] [nvarchar](50) NOT NULL,
	[Severity] [nvarchar](15) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Solution] [nvarchar](max) NOT NULL,
	[ImagePath] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VulnerabilityImages]    Script Date: 05/06/2025 14:25:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VulnerabilityImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VulnerabilityId] [int] NOT NULL,
	[ImagePath] [nvarchar](300) NOT NULL,
	[Caption] [nvarchar](200) NULL,
	[OrderIndex] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Examples]  WITH CHECK ADD  CONSTRAINT [FK_Examples_Vulnarabilities] FOREIGN KEY([VulnerabilityId])
REFERENCES [dbo].[Vulnerabilities] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Examples] CHECK CONSTRAINT [FK_Examples_Vulnarabilities]
GO
ALTER TABLE [dbo].[VulnerabilityImages]  WITH CHECK ADD  CONSTRAINT [FK_VulnerabilityImages_Vulnerabilities] FOREIGN KEY([VulnerabilityId])
REFERENCES [dbo].[Vulnerabilities] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[VulnerabilityImages] CHECK CONSTRAINT [FK_VulnerabilityImages_Vulnerabilities]
GO
ALTER TABLE [dbo].[Vulnerabilities]  WITH CHECK ADD CHECK  (([severity]='baja' OR [severity]='media' OR [severity]='alta' OR [severity]='crítica'))
GO