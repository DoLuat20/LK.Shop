USE [master]
GO
/****** Object:  Database [doan]    Script Date: 12/25/2022 5:38:25 PM ******/
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
/****** Object:  ColumnMasterKey [CMK_Auto1]    Script Date: 12/25/2022 5:38:25 PM ******/
CREATE COLUMN MASTER KEY [CMK_Auto1]
WITH
(
	KEY_STORE_PROVIDER_NAME = N'MSSQL_CERTIFICATE_STORE',
	KEY_PATH = N'CurrentUser/my/6000DDC833E4870F53F0EC658B4039FB6B165E60'
)
GO
/****** Object:  ColumnEncryptionKey [CEK_Auto1]    Script Date: 12/25/2022 5:38:25 PM ******/
CREATE COLUMN ENCRYPTION KEY [CEK_Auto1]
WITH VALUES
(
	COLUMN_MASTER_KEY = [CMK_Auto1],
	ALGORITHM = 'RSA_OAEP',
	ENCRYPTED_VALUE = 0x016E000001630075007200720065006E00740075007300650072002F006D0079002F0036003000300030006400640063003800330033006500340038003700300066003500330066003000650063003600350038006200340030003300390066006200360062003100360035006500360030006F99E36BF4E6844DA6C9120897AF28CF9073289522E511CDD039CA77BA9F5CAB22935A79012EADB9A7009F6FC9CC735992025E1B80474FEABBFE2306B0ADA0A5894002E684FDB0FC1266CEDACD5B6AB8C9CE1858175DB8947709D5AFA5CF8B288C5C77763A525FA585C89A7495E81113E9099A74C389467B29B26E445415F5C3953D5389C07CBB3C18892FCF4826828E81B2E048731CAAD4A880A23775C38E08C58725D48F94FBBC0A36A4F07FDA066164C4BC332398009CA04B55F5601003AC866E0C089986BFDFD3900C33AF52E4C17F83B3EF769DD95775D9923F47EEB2C9ACAF48B11C64B74E538268477028407A08A232CC47FC96F792CBEE0EC98A3E45096BEAC4887063228E391044F610B9CEDCD2D6E0980C2B23FFF9147C9611A33574EAFE962B1E1F0FD71EB7E9E741E72AF97DAE20D476BCAADE151973FFF71D8100518090CED17B2F0A35390008DC64A1EF881FD94CF8BB86E9139E7E67C3CBCAA64FF95F156E29E15CF24D9147CC1DFCA061E9025E40969556E6535FE7DB020DFD5BF4ADA0CD534DC1175653DF589A9F1F473E3E9561976E82DBA31634F81C1EEB1BD6F65F032E49552D8331034A0644BC096E3DBEED31B98474D7AE440D620146E98FBA3D132C49FA29EEE6E52B9350E05223D0C18BC56B08EECD27ABBF8E0E276C27BC3217300950100E48CD27D0E62A256F32C9235E4D81EB81B1F36A9225
)
GO
/****** Object:  Table [dbo].[accounts]    Script Date: 12/25/2022 5:38:25 PM ******/
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
/****** Object:  Table [dbo].[authorities]    Script Date: 12/25/2022 5:38:25 PM ******/
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
/****** Object:  Table [dbo].[cart]    Script Date: 12/25/2022 5:38:25 PM ******/
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
	[phone] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 12/25/2022 5:38:25 PM ******/
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
/****** Object:  Table [dbo].[forms]    Script Date: 12/25/2022 5:38:25 PM ******/
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
/****** Object:  Table [dbo].[Odersdetails]    Script Date: 12/25/2022 5:38:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Odersdetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 12/25/2022 5:38:25 PM ******/
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
/****** Object:  Table [dbo].[roles]    Script Date: 12/25/2022 5:38:25 PM ******/
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
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [sex], [datecreate], [status], [datebirth]) VALUES (N'hieu', N'123', N'Lê Quang Hiếu', N'hieu@gmail.com', N'user.png', 1, CAST(N'2022-10-21' AS Date), 1, CAST(N'2001-05-05' AS Date))
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [sex], [datecreate], [status], [datebirth]) VALUES (N'LeMinh', N'123456', N'Lê Minh', N'minhhlps18682@fpt.edu.vn', N'a4b34a0c.png', 1, CAST(N'2022-12-22' AS Date), 1, CAST(N'2022-12-25' AS Date))
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [sex], [datecreate], [status], [datebirth]) VALUES (N'taibui123', N'123456', N'Bùi Tấn Tài', N'luatdo2002@gmail.com', N'33e040bb.JPG', 1, CAST(N'2022-12-09' AS Date), 1, CAST(N'2002-03-15' AS Date))
INSERT [dbo].[accounts] ([username], [password], [fullname], [email], [photo], [sex], [datecreate], [status], [datebirth]) VALUES (N'user', N'11112001', N'Đỗ Minh Luật', N'luat@gmail.com', N'c09339be.jpg', 0, CAST(N'2022-12-06' AS Date), 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[authorities] ON 

INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (1, N'hieu', N'CUST')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (3, N'hieu', N'CUST')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (13, N'1', N'DIRE')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (14, N'1', N'DIRE')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (17, N'admin', N'STAF')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (18, N'admin', N'DIRE')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (22, N'taibui123', N'CUST')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (27, N'LeMinh', N'CUST')
INSERT [dbo].[authorities] ([id], [username], [roleid]) VALUES (30, N'user', N'DIRE')
SET IDENTITY_INSERT [dbo].[authorities] OFF
GO
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (1, N'admin', CAST(N'2022-12-07T00:00:00.000' AS DateTime), N'abc', N'Đang giao hàng', N'123')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (2, N'admin', CAST(N'2022-12-07T00:00:00.000' AS DateTime), N'abc', N'Huỷ', N'01232131231231')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (3, N'1', CAST(N'2022-12-07T00:00:00.000' AS DateTime), N'abc', N'Huỷ', N'0846121052')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (4, N'hieu', CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'Tân Thế Hiệp, Q.12, Tp.HCM', N'Đang giao hàng', N'')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (5, N'admin', CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'', N'Đang giao hàng', NULL)
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (8, N'hieu', CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'', N'Đang giao hàng', N'')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (9, N'hieu', CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'123', N'Đang giao hàng', NULL)
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (10, N'hieu', CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'123', N'Đang giao hàng', NULL)
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (11, N'hieu', CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'abc', N'Đang giao hàng', NULL)
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (12, N'hieu', CAST(N'2022-12-17T00:00:00.000' AS DateTime), N'abc', N'Đang giao hàng', N'0846121052')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (13, N'hieu', CAST(N'2022-12-22T00:00:00.000' AS DateTime), N'HCM', N'Đang giao hàng', N'123456789')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (14, N'admin', CAST(N'2022-12-24T00:00:00.000' AS DateTime), N'hcm', N'Đang giao hàng', N'123456')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (15, N'hieu', CAST(N'2022-12-24T00:00:00.000' AS DateTime), N'abc', N'Đang giao hàng', N'08213')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (17, N'admin', CAST(N'2022-12-25T00:00:00.000' AS DateTime), N'hcm', N'Đang giao hàng', N'0123456789')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (18, N'admin', CAST(N'2022-12-25T00:00:00.000' AS DateTime), N'', N'Đang giao hàng', N'')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (19, N'admin', CAST(N'2022-12-25T00:00:00.000' AS DateTime), N'', N'Đang giao hàng', N'')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (20, N'hieu', CAST(N'2022-12-25T00:00:00.000' AS DateTime), N'', N'Đang giao hàng', N'')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (21, N'hieu', CAST(N'2022-12-25T00:00:00.000' AS DateTime), N'', N'Đang giao hàng', N'')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (22, N'hieu', CAST(N'2022-12-25T00:00:00.000' AS DateTime), N'abc', N'Đang giao hàng', N'123')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (23, N'hieu', CAST(N'2022-12-25T00:00:00.000' AS DateTime), N'abc', N'Đang giao hàng', N'abc')
INSERT [dbo].[cart] ([Id], [Username], [CreateDate], [Address], [status], [phone]) VALUES (24, N'hieu', CAST(N'2022-12-25T00:00:00.000' AS DateTime), N'abc', N'Đang giao hàng', NULL)
SET IDENTITY_INSERT [dbo].[cart] OFF
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP1', N'Điện Trở')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP2', N'Tụ Điện')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP3', N'Cuộn Cảm')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP4', N'Module')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP5', N'IC')
INSERT [dbo].[categories] ([id], [name]) VALUES (N'LSP6', N'Pin')
GO
SET IDENTITY_INSERT [dbo].[Odersdetails] ON 

INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (1, 1, 13, 10000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (2, 2, 20, 20000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (3, 2, 26, 20000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (4, 3, 17, 10000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (5, 3, 18, 10000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (6, 3, 12, 10000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (7, 3, 11, 10000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (8, 3, 26, 20000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (9, 3, 20, 20000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (10, 3, 19, 20000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (11, 4, 1, 3000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (12, 4, 3, 5000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (13, 4, 4, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (14, 4, 5, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (15, 4, 10, 6000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (16, 4, 9, 8000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (17, 4, 8, 5000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (18, 4, 7, 8000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (19, 4, 6, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (20, 5, 4, 110000, 2)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (21, 8, 9, 8000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (22, 8, 8, 5000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (23, 8, 7, 8000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (24, 8, 6, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (25, 9, 5, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (26, 10, 3, 5000, 3)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (27, 11, 3, 5000, 2)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (28, 12, 4, 110000, 5)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (29, 13, 3, 5000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (30, 13, 4, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (31, 13, 5, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (32, 13, 10, 6000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (33, 13, 9, 8000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (34, 13, 8, 5000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (35, 13, 7, 8000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (36, 13, 6, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (37, 14, 5, 110000, 3)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (38, 16, 4, 110000, 44)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (39, 16, 5, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (40, 16, 6, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (41, 16, 7, 8000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (42, 17, 4, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (43, 17, 5, 110000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (44, 18, 8, 5000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (45, 20, 7, 8000, 1)
INSERT [dbo].[Odersdetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (46, 21, 4, 110000, 1)
SET IDENTITY_INSERT [dbo].[Odersdetails] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (1, N'Điện trở dán 0805 2.4K 1% (50c)', N'1.jpg', 3000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (2, N'Điện trở dán 0805 33R 1% (dây 50c)', N'2.jpg', 3000, CAST(N'2022-12-09' AS Date), 0, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (3, N'Điện trở vạch 1/4W 10R 1% chân đồng (50c)', N'3.jpg', 5000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (4, N'Nguyên cuộn điện trở dán 0603 27K 5% (5000 chiếc)', N'4.jpg', 110000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (5, N'Nguyên cuộn điện trở dán 0603 220K 5% (5000 chiếc)', N'5.jpg', 110000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (6, N'Nguyên cuộn điện trở dán 0603 240K 5% (5000 chiếc)', N'6.jpg', 110000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (7, N'Điện trở dán 2512 0.05R 1W-R050 5% (10c)', N'7.jpg', 8000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (8, N'Điện trở dán 2512 390R 1W-391 5% (10c)', N'8.jpg', 5000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (9, N'Điện trở dán 2512 0.025R 1W-R025 5%', N'9.jpg', 8000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (10, N'Điện trở dán 2512 0.68R 1W-R680 5% (10c)', N'10.jpg', 6000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (11, N'Tụ hóa 35V 680uF 10x20mm tần số cao', N'11.jpg', 1500, CAST(N'2022-12-09' AS Date), 1, N'LSP2', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (12, N'Tụ gốm 222 2.2nF 50V', N'12.jpg', 1000, CAST(N'2022-12-09' AS Date), 1, N'LSP2', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (13, N'Tụ tantalum 7343 107C 16V 100uF 7.3x4.3mm', N'13.jpg', 3500, CAST(N'2022-12-09' AS Date), 1, N'LSP2', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (14, N'Tụ hóa 450V 680uF 30x50mm chân cứng chính hãng', N'14.jpg', 85000, CAST(N'2022-12-09' AS Date), 1, N'LSP2', N'Tụ hoá 450V siêu bền')
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (15, N'Tụ tantalum 35V', N'97aee139.jpg', 4200, CAST(N'2022-12-22' AS Date), 1, N'LSP2', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (17, N'Điện trở dán 0805 2.4K 1% (50c)', N'1.jpg', 3000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (19, N'Điện trở dán 0805 2.4K 1% (50c)', N'1.jpg', 3000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (20, N'Tụ hóa 100V', N'b33c5f47.jpg', 4500, CAST(N'2022-12-22' AS Date), 1, N'LSP2', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (21, N'Tụ hóa 35V 10000uF', N'f77e62e8.jpg', 11500, CAST(N'2022-12-22' AS Date), 1, N'LSP2', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (22, N'Tụ hóa 450V 180uF', N'be6be89.jpg', 13000, CAST(N'2022-12-22' AS Date), 1, N'LSP2', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (26, N'Điện trở dán 0805 2.4K 1% (50c)', N'1.jpg', 3000, CAST(N'2022-12-09' AS Date), 1, N'LSP1', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (29, N'Cuộn cảm xuyến 47uH 3A', N'bd536781.jpg', 3200, CAST(N'2022-12-23' AS Date), 1, N'LSP3', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (30, N'Mạch sạc bảo vệ Pin', N'1e72bfa4.jpg', 115000, CAST(N'2022-12-23' AS Date), 1, N'LSP4', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (31, N'MR1722 TO-220F5 chính hãng SHINDENGEN', N'4480f917.jpg', 30000, CAST(N'2022-12-23' AS Date), 1, N'LSP5', NULL)
INSERT [dbo].[products] ([Id], [Name], [Image], [Price], [CreateDate], [Available], [Categoryid], [description]) VALUES (32, N'Nguồn vỏ nhựa 12V 3A loại tốt', N'df42e029.jpg', 97000, CAST(N'2022-12-23' AS Date), 1, N'LSP6', NULL)
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
