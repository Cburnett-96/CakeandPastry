USE [master]
GO
/****** Object:  Database [CakeandPastry]    Script Date: 7/31/2021 8:29:09 PM ******/
CREATE DATABASE [CakeandPastry]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CakeandPastry', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CakeandPastry.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CakeandPastry_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CakeandPastry_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CakeandPastry] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CakeandPastry].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CakeandPastry] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CakeandPastry] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CakeandPastry] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CakeandPastry] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CakeandPastry] SET ARITHABORT OFF 
GO
ALTER DATABASE [CakeandPastry] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CakeandPastry] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CakeandPastry] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CakeandPastry] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CakeandPastry] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CakeandPastry] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CakeandPastry] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CakeandPastry] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CakeandPastry] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CakeandPastry] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CakeandPastry] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CakeandPastry] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CakeandPastry] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CakeandPastry] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CakeandPastry] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CakeandPastry] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CakeandPastry] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CakeandPastry] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CakeandPastry] SET  MULTI_USER 
GO
ALTER DATABASE [CakeandPastry] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CakeandPastry] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CakeandPastry] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CakeandPastry] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CakeandPastry] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CakeandPastry] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CakeandPastry] SET QUERY_STORE = OFF
GO
USE [CakeandPastry]
GO
/****** Object:  Table [dbo].[AdminAccount]    Script Date: 7/31/2021 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminAccount](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NULL,
 CONSTRAINT [PK_AdminAccount] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAccount]    Script Date: 7/31/2021 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAccount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerAccount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerFeedbacks]    Script Date: 7/31/2021 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerFeedbacks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prdid] [int] NULL,
	[customername] [nvarchar](max) NULL,
	[shopname] [nvarchar](max) NULL,
	[prdname] [nvarchar](max) NULL,
	[prdimage] [nvarchar](50) NULL,
	[pickupdate] [nvarchar](max) NULL,
	[orderdate] [nvarchar](max) NULL,
	[feedbacks] [nvarchar](max) NULL,
	[rating] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerFeedbacks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderReceipt]    Script Date: 7/31/2021 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderReceipt](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customername] [nvarchar](max) NULL,
	[customeremail] [nvarchar](max) NULL,
	[customernumber] [nvarchar](max) NULL,
	[customeraddress] [nvarchar](max) NULL,
	[shopname] [nvarchar](max) NULL,
	[shopcontact] [nvarchar](max) NULL,
	[shopaddress] [nvarchar](max) NULL,
	[prdname] [nvarchar](max) NULL,
	[prddesc] [nvarchar](max) NULL,
	[prdprice] [nvarchar](50) NULL,
	[prdimage] [nvarchar](50) NULL,
	[pickupdate] [nvarchar](max) NULL,
	[pickuptime] [nvarchar](max) NULL,
	[orderdate] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[quantity] [int] NULL,
	[total] [int] NULL,
	[prdid] [int] NULL,
 CONSTRAINT [PK_OrderReceipt] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopAccount]    Script Date: 7/31/2021 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopAccount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[shopname] [nvarchar](max) NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[shoplocation] [nvarchar](max) NULL,
	[shopaddress] [nvarchar](max) NULL,
	[contact] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShopAccount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShopProducts]    Script Date: 7/31/2021 8:29:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopProducts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prdname] [nvarchar](50) NOT NULL,
	[prddesc] [nvarchar](max) NULL,
	[prdprice] [nvarchar](50) NULL,
	[prdimage] [nvarchar](50) NULL,
	[shopname] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShopProducts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [CakeandPastry] SET  READ_WRITE 
GO
