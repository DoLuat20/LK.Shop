USE [master]
GO
/****** Object:  Database [doan]    Script Date: 11/14/2022 8:49:23 PM ******/
CREATE DATABASE [doan]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'doan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\doan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'doan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\doan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [doan] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [doan].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [doan] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [doan] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [doan] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [doan] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [doan] SET ARITHABORT OFF 
GO
ALTER DATABASE [doan] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [doan] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [doan] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [doan] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [doan] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [doan] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [doan] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [doan] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [doan] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [doan] SET  ENABLE_BROKER 
GO
ALTER DATABASE [doan] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [doan] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [doan] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [doan] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [doan] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [doan] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [doan] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [doan] SET RECOVERY FULL 
GO
ALTER DATABASE [doan] SET  MULTI_USER 
GO
ALTER DATABASE [doan] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [doan] SET DB_CHAINING OFF 
GO
ALTER DATABASE [doan] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [doan] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [doan] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [doan] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'doan', N'ON'
GO
ALTER DATABASE [doan] SET QUERY_STORE = OFF
GO
USE [doan]
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 11/14/2022 8:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accounts](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[photo] [nvarchar](50) NULL,
	[sex] [bit] NULL,
	[datecreate] [date] NULL,
	[status] [bit] NULL,
	[datebirth] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authorities]    Script Date: 11/14/2022 8:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authorities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[roleid] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 11/14/2022 8:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 11/14/2022 8:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [char](4) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[forms]    Script Date: 11/14/2022 8:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[forms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](10) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[productId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Odersdetails]    Script Date: 11/14/2022 8:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odersdetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 11/14/2022 8:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Available] [bit] NOT NULL,
	[Categoryid] [char](4) NOT NULL,
	[description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/14/2022 8:49:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [nvarchar](10) NOT NULL,
	[name] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [sex], [datecreate], [status], [datebirth]) VALUES (N'1', N'123456', N'ADMIN', N'ADMIN@gmail.com', N'user.png', 1, CAST(N'2022-10-21' AS Date), 1, CAST(N'1996-06-18' AS Date))
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [sex], [datecreate], [status], [datebirth]) VALUES (N'admin', N'123456', N'ADMIN', N'ADMIN@gmail.com', N'user.png', 1, CAST(N'2022-10-21' AS Date), 1, CAST(N'1996-06-18' AS Date))
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [sex], [datecreate], [status], [datebirth]) VALUES (N'ádsad', NULL, NULL, NULL, N'user.png', NULL, CAST(N'2022-10-27' AS Date), NULL, CAST(N'2022-10-27' AS Date))
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [sex], [datecreate], [status], [datebirth]) VALUES (N'hieu', N'123', N'Lê Quang Hiếu', N'hieu@gmail.com', N'user.png', 1, CAST(N'2022-10-21' AS Date), 1, CAST(N'2001-05-05' AS Date))
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [sex], [datecreate], [status], [datebirth]) VALUES (N'sdasdasd', NULL, NULL, NULL, N'user.png', NULL, CAST(N'2022-10-27' AS Date), NULL, CAST(N'2022-10-27' AS Date))
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [sex], [datecreate], [status], [datebirth]) VALUES (N'sdsad', N'sdsd', N'sdsd', NULL, N'47c31424.JPG', NULL, CAST(N'2022-10-25' AS Date), NULL, CAST(N'2022-10-06' AS Date))
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [sex], [datecreate], [status], [datebirth]) VALUES (N'sss', N'123123', N'sss', N'dsad', N'user.png', 1, CAST(N'2022-10-25' AS Date), 1, CAST(N'2022-10-25' AS Date))
GO
SET IDENTITY_INSERT [dbo].[authorities] ON 

INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (1, N'hieu', N'CUST')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (3, N'hieu', N'CUST')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (11, N'sss', N'DIRE')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (12, N'sss', N'CUST')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (13, N'1', N'DIRE')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (14, N'1', N'DIRE')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (17, N'admin', N'STAF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (18, N'admin', N'DIRE')
SET IDENTITY_INSERT [dbo].[authorities] OFF
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP1', N'Lốp Xe')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP2', N'Giảm Sõc')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP3', N'Phanh')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP4', N'Đèn')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP5', N'Phụ Kiện Công Nghệ')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP6', N'Nội Thất')
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (6, N'Lốp xe Michelin', N'1.jpg', 10000, CAST(N'2002-12-02' AS Date), 1, N'LSP1', N'aaa')
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (7, N'Lốp xe Bridgestone', N'bd29485a.JPG', 20000, CAST(N'2002-02-02' AS Date), 0, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (8, N'Lốp xe Maxxis', N'3b331707.JPG', 30000, CAST(N'2002-03-02' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (9, N'Lốp xe Dunlop', N'1ee464bc.JPG', 40000, CAST(N'2002-04-02' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (10, N'Lốp xe Goodyear', N'2c9835ff.JPG', 10000, CAST(N'2002-05-02' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (11, N'Lốp xe Continental', N'6.jpg', 10000, CAST(N'2002-06-02' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (12, N'Lốp xe Yokohama', N'7.jpg', 10000, CAST(N'2002-07-02' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (13, N'Lốp xe Pirelli', N'8.jpg', 10000, CAST(N'2002-08-02' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (17, N'Lốp xe Kumho', N'9.jpg', 10000, CAST(N'2002-08-02' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (18, N'Lốp xe Kumho', N'10.jpg', 10000, CAST(N'2002-08-02' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (19, N'Giảm xóc BMW X6
Giảm xóc BMW X6', N'11.jpg', 20000, CAST(N'2002-09-02' AS Date), 1, N'LSP2', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (20, N'Giảm xóc trước Daewoo Espero', N'12.jpg', 20000, CAST(N'2002-09-02' AS Date), 1, N'LSP2', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (25, N'Giảm xóc trước phải Toyota Corolla Altis', N'13.jpg', 20000, CAST(N'2002-02-02' AS Date), 1, N'LSP2', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (26, N'Giảm xóc trước Mercedes-Benz GL450', N'14.jpg', 20000, CAST(N'2002-02-02' AS Date), 1, N'LSP2', NULL)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (N'CUST', N'Customers')
INSERT [dbo].[roles] ([id], [name]) VALUES (N'DIRE', N'Directors')
INSERT [dbo].[roles] ([id], [name]) VALUES (N'STAF', N'Staffs')
GO
USE [master]
GO
ALTER DATABASE [doan] SET  READ_WRITE 
GO
