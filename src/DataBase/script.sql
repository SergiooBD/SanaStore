USE [master]
GO
/****** Object:  Database [SanaStore]    Script Date: 15/04/2024 03:41:27 a. m. ******/
CREATE DATABASE [SanaStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SanaStore', FILENAME = N'D:\SQLData\Data\SanaStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SanaStore_log', FILENAME = N'D:\SQLData\Data\SanaStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SanaStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SanaStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SanaStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SanaStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SanaStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SanaStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SanaStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [SanaStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SanaStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SanaStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SanaStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SanaStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SanaStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SanaStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SanaStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SanaStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SanaStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SanaStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SanaStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SanaStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SanaStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SanaStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SanaStore] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SanaStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SanaStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SanaStore] SET  MULTI_USER 
GO
ALTER DATABASE [SanaStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SanaStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SanaStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SanaStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SanaStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SanaStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SanaStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [SanaStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SanaStore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15/04/2024 03:41:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 15/04/2024 03:41:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 15/04/2024 03:41:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[Id] [uniqueidentifier] NOT NULL,
	[FirsName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Document] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 15/04/2024 03:41:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[CustomerId] [uniqueidentifier] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[OrderStateId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordersDetails]    Script Date: 15/04/2024 03:41:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordersDetails](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_ordersDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderStates]    Script Date: 15/04/2024 03:41:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderStates](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_orderStates] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 15/04/2024 03:41:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ProductCode] [nvarchar](max) NOT NULL,
	[Stock] [real] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productsXcategories]    Script Date: 15/04/2024 03:41:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productsXcategories](
	[Id] [uniqueidentifier] NOT NULL,
	[ProductsId] [uniqueidentifier] NOT NULL,
	[CategoriesId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_productsXcategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_orders_CustomerId]    Script Date: 15/04/2024 03:41:28 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_orders_CustomerId] ON [dbo].[orders]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_orders_OrderStateId]    Script Date: 15/04/2024 03:41:28 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_orders_OrderStateId] ON [dbo].[orders]
(
	[OrderStateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ordersDetails_OrderId]    Script Date: 15/04/2024 03:41:28 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_ordersDetails_OrderId] ON [dbo].[ordersDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ordersDetails_ProductId]    Script Date: 15/04/2024 03:41:28 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_ordersDetails_ProductId] ON [dbo].[ordersDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_productsXcategories_CategoriesId]    Script Date: 15/04/2024 03:41:28 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_productsXcategories_CategoriesId] ON [dbo].[productsXcategories]
(
	[CategoriesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_productsXcategories_ProductsId]    Script Date: 15/04/2024 03:41:28 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_productsXcategories_ProductsId] ON [dbo].[productsXcategories]
(
	[ProductsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[customers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_customers_CustomerId]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_orderStates_OrderStateId] FOREIGN KEY([OrderStateId])
REFERENCES [dbo].[orderStates] ([Id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_orderStates_OrderStateId]
GO
ALTER TABLE [dbo].[ordersDetails]  WITH CHECK ADD  CONSTRAINT [FK_ordersDetails_orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordersDetails] CHECK CONSTRAINT [FK_ordersDetails_orders_OrderId]
GO
ALTER TABLE [dbo].[ordersDetails]  WITH CHECK ADD  CONSTRAINT [FK_ordersDetails_products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordersDetails] CHECK CONSTRAINT [FK_ordersDetails_products_ProductId]
GO
ALTER TABLE [dbo].[productsXcategories]  WITH CHECK ADD  CONSTRAINT [FK_productsXcategories_categories_CategoriesId] FOREIGN KEY([CategoriesId])
REFERENCES [dbo].[categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productsXcategories] CHECK CONSTRAINT [FK_productsXcategories_categories_CategoriesId]
GO
ALTER TABLE [dbo].[productsXcategories]  WITH CHECK ADD  CONSTRAINT [FK_productsXcategories_products_ProductsId] FOREIGN KEY([ProductsId])
REFERENCES [dbo].[products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[productsXcategories] CHECK CONSTRAINT [FK_productsXcategories_products_ProductsId]
GO
USE [master]
GO
ALTER DATABASE [SanaStore] SET  READ_WRITE 
GO
