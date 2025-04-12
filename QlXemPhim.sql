
GO
/****** Object:  Database [QLXemPhim]    Script Date: 4/12/2025 9:53:03 PM ******/
CREATE DATABASE [QLXemPhim]
 
GO
ALTER DATABASE [QLXemPhim] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLXemPhim].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLXemPhim] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLXemPhim] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLXemPhim] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLXemPhim] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLXemPhim] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLXemPhim] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLXemPhim] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLXemPhim] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLXemPhim] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLXemPhim] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLXemPhim] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLXemPhim] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLXemPhim] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLXemPhim] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLXemPhim] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLXemPhim] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLXemPhim] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLXemPhim] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLXemPhim] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLXemPhim] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLXemPhim] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [QLXemPhim] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLXemPhim] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLXemPhim] SET  MULTI_USER 
GO
ALTER DATABASE [QLXemPhim] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLXemPhim] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLXemPhim] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLXemPhim] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLXemPhim] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLXemPhim] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QLXemPhim] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLXemPhim] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLXemPhim]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/12/2025 9:53:03 PM ******/
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
/****** Object:  Table [dbo].[Actor_Medias]    Script Date: 4/12/2025 9:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actor_Medias](
	[MediaId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
	[IsMain] [bit] NOT NULL,
 CONSTRAINT [PK_Actor_Medias] PRIMARY KEY CLUSTERED 
(
	[MediaId] ASC,
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 4/12/2025 9:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[ActorID] [int] IDENTITY(1,1) NOT NULL,
	[ActorName] [nvarchar](max) NULL,
	[AcctorDate] [datetime2](7) NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 4/12/2025 9:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[LoginPassword] [nvarchar](max) NOT NULL,
	[UserEmail] [nvarchar](max) NOT NULL,
	[UserCreateDate] [datetime2](7) NULL,
	[UserImagePath] [nvarchar](max) NULL,
	[UserState] [bit] NULL,
	[UserDuration] [time](7) NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/12/2025 9:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[HistoryListId] [int] NULL,
	[FavoriteListId] [int] NULL,
	[WatchListId] [int] NULL,
	[UserName] [nvarchar](max) NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[LoginPassword] [nvarchar](max) NOT NULL,
	[UserEmail] [nvarchar](max) NOT NULL,
	[UserCreateDate] [datetime2](7) NULL,
	[UserImagePath] [nvarchar](max) NULL,
	[UserState] [bit] NULL,
	[UserDuration] [time](7) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 4/12/2025 9:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ListMedia]    Script Date: 4/12/2025 9:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListMedia](
	[WatchListId] [int] NOT NULL,
	[MediaId] [int] NOT NULL,
	[IsWatched] [bit] NULL,
	[Favorite] [bit] NULL,
	[AddDate] [datetime2](7) NULL,
 CONSTRAINT [PK_ListMedia] PRIMARY KEY CLUSTERED 
(
	[WatchListId] ASC,
	[MediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Media_Genre]    Script Date: 4/12/2025 9:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Media_Genre](
	[GenreId] [int] NOT NULL,
	[MediaId] [int] NOT NULL,
 CONSTRAINT [PK_Media_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC,
	[MediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medias]    Script Date: 4/12/2025 9:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medias](
	[MediaId] [int] IDENTITY(1,1) NOT NULL,
	[MediaUrl] [nvarchar](max) NULL,
	[MediaName] [nvarchar](max) NULL,
	[MediaDescription] [nvarchar](max) NULL,
	[MediaQuality] [nvarchar](max) NULL,
	[ReleaseDate] [datetime2](7) NULL,
	[MediaAgeRating] [int] NULL,
	[MediaImagePath] [nvarchar](max) NULL,
	[MediaBannerPath] [nvarchar](max) NULL,
	[MediaDuration] [time](7) NULL,
 CONSTRAINT [PK_Medias] PRIMARY KEY CLUSTERED 
(
	[MediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 4/12/2025 9:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewId] [int] IDENTITY(1,1) NOT NULL,
	[ReviewContent] [nvarchar](max) NULL,
	[ReviewRating] [float] NULL,
	[ReviewCreateDate] [datetime2](7) NULL,
	[CustomerId] [int] NOT NULL,
	[MediaId] [int] NOT NULL,
 CONSTRAINT [PK_Reviews] PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchLists]    Script Date: 4/12/2025 9:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchLists](
	[WatchListId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_WatchLists] PRIMARY KEY CLUSTERED 
(
	[WatchListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241101092452_them', N'6.0.33')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250410151640_First', N'6.0.33')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250410195203_second', N'6.0.33')
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 
GO
INSERT [dbo].[Actors] ([ActorID], [ActorName], [AcctorDate]) VALUES (1, N'Megan Fox', CAST(N'1986-05-16T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Actors] ([ActorID], [ActorName], [AcctorDate]) VALUES (2, N'Shia LaBeouf', CAST(N'1986-06-11T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Actors] ([ActorID], [ActorName], [AcctorDate]) VALUES (3, N'Rachael Taylor', CAST(N'1984-07-11T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 
GO
INSERT [dbo].[Admins] ([AdminId], [Role], [UserName], [UserLogin], [LoginPassword], [UserEmail], [UserCreateDate], [UserImagePath], [UserState], [UserDuration]) VALUES (1, N'SuperAdmin', N'Bui Le Quang Hai', N'haibui,', N'12345678@Aa', N'haibui.com', CAST(N'2024-08-12T00:00:00.0000000' AS DateTime2), N'default.jpg', 1, CAST(N'00:00:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([CustomerId], [HistoryListId], [FavoriteListId], [WatchListId], [UserName], [UserLogin], [LoginPassword], [UserEmail], [UserCreateDate], [UserImagePath], [UserState], [UserDuration]) VALUES (1, NULL, NULL, 1, N'Bui Le Quang Hai', N'utcno1', N'12345678@Aa', N'utc28@gmail.com', CAST(N'2024-08-12T00:00:00.0000000' AS DateTime2), N'default.jpg', 1, CAST(N'00:00:00' AS Time))
GO
INSERT [dbo].[Customers] ([CustomerId], [HistoryListId], [FavoriteListId], [WatchListId], [UserName], [UserLogin], [LoginPassword], [UserEmail], [UserCreateDate], [UserImagePath], [UserState], [UserDuration]) VALUES (2, NULL, NULL, 2, N'Bui Le Quang Hai', N'utcno2', N'12345678@Aa', N'utc2004@gmail.com', CAST(N'2024-08-12T00:00:00.0000000' AS DateTime2), N'default.jpg', 1, CAST(N'00:00:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 
GO
INSERT [dbo].[Genres] ([GenreId], [Type]) VALUES (1, N'Movie')
GO
INSERT [dbo].[Genres] ([GenreId], [Type]) VALUES (2, N'Cartoon')
GO
INSERT [dbo].[Genres] ([GenreId], [Type]) VALUES (3, N'Series')
GO
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
INSERT [dbo].[Media_Genre] ([GenreId], [MediaId]) VALUES (1, 4)
GO
INSERT [dbo].[Media_Genre] ([GenreId], [MediaId]) VALUES (1, 5)
GO
INSERT [dbo].[Media_Genre] ([GenreId], [MediaId]) VALUES (1, 6)
GO
INSERT [dbo].[Media_Genre] ([GenreId], [MediaId]) VALUES (1, 7)
GO
INSERT [dbo].[Media_Genre] ([GenreId], [MediaId]) VALUES (1, 8)
GO
INSERT [dbo].[Media_Genre] ([GenreId], [MediaId]) VALUES (1, 9)
GO
INSERT [dbo].[Media_Genre] ([GenreId], [MediaId]) VALUES (1, 10)
GO
SET IDENTITY_INSERT [dbo].[Medias] ON 
GO
INSERT [dbo].[Medias] ([MediaId], [MediaUrl], [MediaName], [MediaDescription], [MediaQuality], [ReleaseDate], [MediaAgeRating], [MediaImagePath], [MediaBannerPath], [MediaDuration]) VALUES (4, N'Sat Thu Vo CucHD.mp4', N'Sat Thu Vo Cuc', N'Phim xoay quanh Jun (Kwon Sang Woo), cựu điệp viên hiện đang là hoạ sĩ truyện tranh – trở thành mục tiêu kép của cả Cơ quan Tình báo Quốc gia (NIS) và bọn khủng bố trên toàn cầu sau khi đăng tải webtoon (truyện tranh mạng) lấy cảm hứng từ chính quá khứ điệp viên của mình. Sở dĩ, hành động này của Jun không chỉ làm lộ bí mật quốc gia mà còn khiến bọn khủng bố tìm cách “trả thù”.', N'HD', CAST(N'2025-04-02T21:38:00.0000000' AS DateTime2), 16, N'Sat Thu Vo Cuc.webp', N'Sat Thu Vo Cucbanner.webp', NULL)
GO
INSERT [dbo].[Medias] ([MediaId], [MediaUrl], [MediaName], [MediaDescription], [MediaQuality], [ReleaseDate], [MediaAgeRating], [MediaImagePath], [MediaBannerPath], [MediaDuration]) VALUES (5, N'Hanh trinh cua moana 2HD.mp4', N'Hanh trinh cua moana 2', N'“Hành Trình của Moana 2” là màn tái hợp của Moana và Maui sau 3 năm, trở lại trong chuyến phiêu lưu cùng với những thành viên mới. Theo tiếng gọi của tổ tiên, Moana sẽ tham gia cuộc hành trình đến những vùng biển xa xôi của Châu Đại Dương và sẽ đi tới vùng biển nguy hiểm, đã mất tích từ lâu. Cùng chờ đón cuộc phiêu lưu của Moana đầy chông gai sắp tới nhé.', N'HD', CAST(N'2025-04-09T21:40:00.0000000' AS DateTime2), 16, N'Hanh trinh cua moana 2.webp', N'Hanh trinh cua moana 2banner.webp', NULL)
GO
INSERT [dbo].[Medias] ([MediaId], [MediaUrl], [MediaName], [MediaDescription], [MediaQuality], [ReleaseDate], [MediaAgeRating], [MediaImagePath], [MediaBannerPath], [MediaDuration]) VALUES (6, N'Mat vu phu hoHD.mp4', N'Mat vu phu ho', N'Levon Cade – cựu biệt kích tinh nhuệ thuộc lực lượng Thủy quân Lục chiến Hoàng gia Anh. Sau khi nghỉ hưu, anh sống cuộc đời yên bình là một công nhân xây dựng tại Chicago (Mỹ). Levon có mối quan hệ rất tốt với gia đình ông chủ Joe Garcia (Michael Peña). Một ngày nọ, cô con gái tuổi teen Jenny (Arianna Rivas) của Joe bị bắt cóc khiến chàng cựu quân nhân phải sử dụng lại các kỹ năng giết chóc của mình để giúp đỡ.', N'HD', CAST(N'2025-04-15T21:42:00.0000000' AS DateTime2), 16, N'Mat vu phu ho.webp', N'Mat vu phu hobanner.webp', NULL)
GO
INSERT [dbo].[Medias] ([MediaId], [MediaUrl], [MediaName], [MediaDescription], [MediaQuality], [ReleaseDate], [MediaAgeRating], [MediaImagePath], [MediaBannerPath], [MediaDuration]) VALUES (7, N'Captain AmericaHD.mp4', N'Captain America', N'Sau khi gặp Tổng thống Hoa Kỳ mới đắc cử Thaddeus Ross, Sam Wilson thấy mình bị cuốn vào một sự cố . Anh phải khám phá lý do đằng sau một âm mưu cực kì xấu xa trước khi kẻ chủ mưu thật sự khiến cả thế giới phải hoảng sợ', N'HD', CAST(N'2025-04-02T21:44:00.0000000' AS DateTime2), 16, N'Captain America.webp', N'Captain Americabanner.webp', NULL)
GO
INSERT [dbo].[Medias] ([MediaId], [MediaUrl], [MediaName], [MediaDescription], [MediaQuality], [ReleaseDate], [MediaAgeRating], [MediaImagePath], [MediaBannerPath], [MediaDuration]) VALUES (8, N'Black AdamHD.mp4', N'Black Adam', N'Dwayne Johnson sẽ góp mặt trong tác phẩm hành động – phiêu lưu mới của New Line Cinema, mang tên BLACK ADAM. Đây là bộ phim đầu tiên trên màn ảnh rộng khai thác câu chuyện của siêu anh hùng DC này, dưới sự sáng tạo của đạo diễn Jaume Collet-Serra (đạo diễn của Jungle Cruise). Gần 5.000 năm sau khi bị cầm tù với quyền năng tối thượng từ những vị thần cổ đại, Black Adam (Dwayne Johnson) sẽ được giải phóng khỏi nấm mồ chết chóc của mình, mang tới thế giới hiện đại một kiểu nhận thức về công lý hoàn toàn mới.', N'HD', CAST(N'2025-03-06T21:45:00.0000000' AS DateTime2), 16, N'Black Adam.webp', N'Black Adambanner.webp', NULL)
GO
INSERT [dbo].[Medias] ([MediaId], [MediaUrl], [MediaName], [MediaDescription], [MediaQuality], [ReleaseDate], [MediaAgeRating], [MediaImagePath], [MediaBannerPath], [MediaDuration]) VALUES (9, N'Đèn Âm HồnHD.mp4', N'Đèn Âm Hồn', N'Lấy cảm hứng từ Chuyện Người Con Gái Nam Xương. Tại một ngôi làng miền Bắc thời phong kiến, Thương 1 mình nuôi con trai chờ chồng đi lính về. Con của cô vô tình nhặt được một cây đèn, từ đó cậu gọi chiếc bóng hiện trên tường là cha mà không biết sự thật.', N'HD', CAST(N'2025-02-19T21:46:00.0000000' AS DateTime2), 16, N'Đèn Âm Hồn.webp', N'Đèn Âm Hồnbanner.webp', NULL)
GO
INSERT [dbo].[Medias] ([MediaId], [MediaUrl], [MediaName], [MediaDescription], [MediaQuality], [ReleaseDate], [MediaAgeRating], [MediaImagePath], [MediaBannerPath], [MediaDuration]) VALUES (10, N'The GodfatherHD.mp4', N'The Godfather', N'riweukfjhsdifurhwefjksdfsd', N'HD', CAST(N'2025-01-12T21:49:00.0000000' AS DateTime2), 16, N'The Godfather.jpg', N'The Godfatherbanner.jpg', NULL)
GO
SET IDENTITY_INSERT [dbo].[Medias] OFF
GO
SET IDENTITY_INSERT [dbo].[WatchLists] ON 
GO
INSERT [dbo].[WatchLists] ([WatchListId], [CustomerId]) VALUES (1, 1)
GO
INSERT [dbo].[WatchLists] ([WatchListId], [CustomerId]) VALUES (2, 2)
GO
INSERT [dbo].[WatchLists] ([WatchListId], [CustomerId]) VALUES (3, 3)
GO
SET IDENTITY_INSERT [dbo].[WatchLists] OFF
GO
/****** Object:  Index [IX_Actor_Medias_ActorId]    Script Date: 4/12/2025 9:53:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Actor_Medias_ActorId] ON [dbo].[Actor_Medias]
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Customers_WatchListId]    Script Date: 4/12/2025 9:53:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Customers_WatchListId] ON [dbo].[Customers]
(
	[WatchListId] ASC
)
WHERE ([WatchListId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ListMedia_MediaId]    Script Date: 4/12/2025 9:53:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ListMedia_MediaId] ON [dbo].[ListMedia]
(
	[MediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Media_Genre_MediaId]    Script Date: 4/12/2025 9:53:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Media_Genre_MediaId] ON [dbo].[Media_Genre]
(
	[MediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_CustomerId]    Script Date: 4/12/2025 9:53:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_CustomerId] ON [dbo].[Reviews]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reviews_MediaId]    Script Date: 4/12/2025 9:53:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Reviews_MediaId] ON [dbo].[Reviews]
(
	[MediaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ListMedia] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsWatched]
GO
ALTER TABLE [dbo].[ListMedia] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Favorite]
GO
ALTER TABLE [dbo].[Actor_Medias]  WITH CHECK ADD  CONSTRAINT [FK_Actor_Medias_Actors_ActorId] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([ActorID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Actor_Medias] CHECK CONSTRAINT [FK_Actor_Medias_Actors_ActorId]
GO
ALTER TABLE [dbo].[Actor_Medias]  WITH CHECK ADD  CONSTRAINT [FK_Actor_Medias_Medias_MediaId] FOREIGN KEY([MediaId])
REFERENCES [dbo].[Medias] ([MediaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Actor_Medias] CHECK CONSTRAINT [FK_Actor_Medias_Medias_MediaId]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_WatchLists_WatchListId] FOREIGN KEY([WatchListId])
REFERENCES [dbo].[WatchLists] ([WatchListId])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_WatchLists_WatchListId]
GO
ALTER TABLE [dbo].[ListMedia]  WITH CHECK ADD  CONSTRAINT [FK_ListMedia_Medias_MediaId] FOREIGN KEY([MediaId])
REFERENCES [dbo].[Medias] ([MediaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ListMedia] CHECK CONSTRAINT [FK_ListMedia_Medias_MediaId]
GO
ALTER TABLE [dbo].[ListMedia]  WITH CHECK ADD  CONSTRAINT [FK_ListMedia_WatchLists_WatchListId] FOREIGN KEY([WatchListId])
REFERENCES [dbo].[WatchLists] ([WatchListId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ListMedia] CHECK CONSTRAINT [FK_ListMedia_WatchLists_WatchListId]
GO
ALTER TABLE [dbo].[Media_Genre]  WITH CHECK ADD  CONSTRAINT [FK_Media_Genre_Genres_GenreId] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genres] ([GenreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Media_Genre] CHECK CONSTRAINT [FK_Media_Genre_Genres_GenreId]
GO
ALTER TABLE [dbo].[Media_Genre]  WITH CHECK ADD  CONSTRAINT [FK_Media_Genre_Medias_MediaId] FOREIGN KEY([MediaId])
REFERENCES [dbo].[Medias] ([MediaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Media_Genre] CHECK CONSTRAINT [FK_Media_Genre_Medias_MediaId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Customers_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Customers_CustomerId]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Medias_MediaId] FOREIGN KEY([MediaId])
REFERENCES [dbo].[Medias] ([MediaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Medias_MediaId]
GO
USE [master]
GO
ALTER DATABASE [QLXemPhim] SET  READ_WRITE 
GO
