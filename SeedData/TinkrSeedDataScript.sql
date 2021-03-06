USE [master]
GO
/****** Object:  Database [Tinkr]    Script Date: 6/3/2020 6:34:29 PM ******/
CREATE DATABASE [Tinkr]
GO
USE [Tinkr]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/3/2020 6:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LineItem]    Script Date: 6/3/2020 6:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LineItem](
	[LineItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[RubbishId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LineItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/3/2020 6:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PaymentId] [int] NOT NULL,
	[IsComplete] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 6/3/2020 6:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[PmtType] [varchar](100) NOT NULL,
	[AccountNo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rubbish]    Script Date: 6/3/2020 6:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rubbish](
	[RubbishId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RubbishId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/3/2020 6:34:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NOT NULL,
	[LastName] [varchar](100) NOT NULL,
	[Type] [varchar](100) NOT NULL,
	[DateCreated] [date] NOT NULL,
	[StreetAddress] [varchar](100) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[State] [varchar](100) NOT NULL,
	[Zip] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (1, N'Furniture')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (2, N'Clothing')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (3, N'Electronics')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (4, N'Appliances')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (5, N'Cars')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (6, N'Pallets')
INSERT [dbo].[Category] ([CategoryId], [Name]) VALUES (7, N'Sporting Goods')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[LineItem] ON 

INSERT [dbo].[LineItem] ([LineItemId], [OrderId], [RubbishId]) VALUES (1, 2, 1)
INSERT [dbo].[LineItem] ([LineItemId], [OrderId], [RubbishId]) VALUES (2, 1, 4)
INSERT [dbo].[LineItem] ([LineItemId], [OrderId], [RubbishId]) VALUES (3, 3, 3)
SET IDENTITY_INSERT [dbo].[LineItem] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [UserId], [PaymentId], [IsComplete]) VALUES (1, 3, 1, 0)
INSERT [dbo].[Order] ([OrderId], [UserId], [PaymentId], [IsComplete]) VALUES (2, 4, 2, 1)
INSERT [dbo].[Order] ([OrderId], [UserId], [PaymentId], [IsComplete]) VALUES (3, 5, 3, 0)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

INSERT [dbo].[PaymentType] ([PaymentTypeId], [UserId], [PmtType], [AccountNo]) VALUES (1, 3, N'Paypal', 65934006)
INSERT [dbo].[PaymentType] ([PaymentTypeId], [UserId], [PmtType], [AccountNo]) VALUES (2, 4, N'Visa', 429588498)
INSERT [dbo].[PaymentType] ([PaymentTypeId], [UserId], [PmtType], [AccountNo]) VALUES (3, 5, N'Mastercard', 30294583)
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
SET IDENTITY_INSERT [dbo].[Rubbish] ON 

INSERT [dbo].[Rubbish] ([RubbishId], [Name], [Description], [CategoryId], [IsAvailable], [UserId], [Price]) VALUES (1, N'Flamed-Out Hawaiian Shirt', N'This hot shirt screams flavortown; it even has a stain or 2 on it.', 2, 1, 1, CAST(46 AS Decimal(18, 0)))
INSERT [dbo].[Rubbish] ([RubbishId], [Name], [Description], [CategoryId], [IsAvailable], [UserId], [Price]) VALUES (2, N'Basketball Hoop', N'This hoop was broken after being dunked on by the GOAT. What more could you want?', 7, 1, 2, CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[Rubbish] ([RubbishId], [Name], [Description], [CategoryId], [IsAvailable], [UserId], [Price]) VALUES (3, N'67 El Camino', N'This pretty lady has plenty of miles on her and could use a new radiator.', 5, 1, 3, CAST(24567 AS Decimal(18, 0)))
INSERT [dbo].[Rubbish] ([RubbishId], [Name], [Description], [CategoryId], [IsAvailable], [UserId], [Price]) VALUES (4, N'94 Mac', N'This Computer is integral to the history of Mac as a prototype. Needs a new graphics card.', 3, 1, 4, CAST(130 AS Decimal(18, 0)))
INSERT [dbo].[Rubbish] ([RubbishId], [Name], [Description], [CategoryId], [IsAvailable], [UserId], [Price]) VALUES (5, N'Vintage Weight Bench', N'MJ trained on this bench before winning 6 NBA championships. Has a tear or 2 in the leather.', 1, 1, 2, CAST(85 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Rubbish] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Type], [DateCreated], [StreetAddress], [City], [State], [Zip]) VALUES (1, N'Guy', N'Fieri', N'Seller', CAST(N'2020-05-19' AS Date), N'1234 Tasty Way', N'Flavortown', N'TN', 34567)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Type], [DateCreated], [StreetAddress], [City], [State], [Zip]) VALUES (2, N'Michael', N'Jordan', N'Seller', CAST(N'2020-04-02' AS Date), N'2323 Ballers Court', N'Chicago', N'IL', 23623)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Type], [DateCreated], [StreetAddress], [City], [State], [Zip]) VALUES (3, N'Dale', N'Earnhard', N'BuyerAndSeller', CAST(N'2020-05-01' AS Date), N'1649 Racers Lane', N'Daytona', N'FL', 34585)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Type], [DateCreated], [StreetAddress], [City], [State], [Zip]) VALUES (4, N'Steve', N'Wozniak', N'BuyerAndSeller', CAST(N'2020-04-15' AS Date), N'6576 Innovation Court', N'San Francisco', N'CA', 23859)
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [Type], [DateCreated], [StreetAddress], [City], [State], [Zip]) VALUES (5, N'Arnold', N'Schwarzenegger', N'Buyer', CAST(N'2020-03-03' AS Date), N'1234 Terminator Circle', N'Los Angeles', N'CA', 65987)
SET IDENTITY_INSERT [dbo].[User] OFF
USE [master]
GO
ALTER DATABASE [Tinkr] SET  READ_WRITE 
GO
