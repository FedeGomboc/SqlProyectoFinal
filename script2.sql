USE [EasyEating]
GO
/****** Object:  Table [dbo].[Limitacion]    Script Date: 19/5/2023 10:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Limitacion](
	[idLimitacion] [int] NOT NULL,
	[limitacion] [varchar](max) NULL,
 CONSTRAINT [PK_Limitacion] PRIMARY KEY CLUSTERED 
(
	[idLimitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LimitacionXRestaurante]    Script Date: 19/5/2023 10:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LimitacionXRestaurante](
	[idRestaurante] [int] NOT NULL,
	[idLimitacion] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurante]    Script Date: 19/5/2023 10:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurante](
	[idRestaurante] [int] NOT NULL,
	[nombre] [varchar](max) NULL,
	[direccion] [varchar](max) NULL,
	[latitud] [varchar](max) NULL,
	[longitud] [varchar](max) NULL,
	[horario] [varchar](max) NULL,
	[telefono] [int] NULL,
	[aptoPara] [varchar](max) NULL,
 CONSTRAINT [PK_Restaurante] PRIMARY KEY CLUSTERED 
(
	[idRestaurante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 19/5/2023 10:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[contrasena] [varchar](50) NULL,
	[fechaNacimiento] [datetime] NULL,
	[idLimitacion] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Limitacion] ([idLimitacion], [limitacion]) VALUES (1, N'Celiaquia')
INSERT [dbo].[Limitacion] ([idLimitacion], [limitacion]) VALUES (2, N'Diabetes')
INSERT [dbo].[Limitacion] ([idLimitacion], [limitacion]) VALUES (3, N'Intolerancia a la lactosa')
GO
ALTER TABLE [dbo].[LimitacionXRestaurante]  WITH CHECK ADD  CONSTRAINT [FK_LimitacionXRestaurante_Limitacion] FOREIGN KEY([idLimitacion])
REFERENCES [dbo].[Limitacion] ([idLimitacion])
GO
ALTER TABLE [dbo].[LimitacionXRestaurante] CHECK CONSTRAINT [FK_LimitacionXRestaurante_Limitacion]
GO
ALTER TABLE [dbo].[LimitacionXRestaurante]  WITH CHECK ADD  CONSTRAINT [FK_LimitacionXRestaurante_Restaurante] FOREIGN KEY([idRestaurante])
REFERENCES [dbo].[Restaurante] ([idRestaurante])
GO
ALTER TABLE [dbo].[LimitacionXRestaurante] CHECK CONSTRAINT [FK_LimitacionXRestaurante_Restaurante]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Limitacion] FOREIGN KEY([idLimitacion])
REFERENCES [dbo].[Limitacion] ([idLimitacion])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Limitacion]
GO
