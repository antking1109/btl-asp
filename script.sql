USE [master]
GO
/****** Object:  Database [QLRP]    Script Date: 12/18/2018 12:36:20 AM ******/
CREATE DATABASE [QLRP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLRP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLRP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLRP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\QLRP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLRP] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLRP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLRP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLRP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLRP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLRP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLRP] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLRP] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLRP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLRP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLRP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLRP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLRP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLRP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLRP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLRP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLRP] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLRP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLRP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLRP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLRP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLRP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLRP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLRP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLRP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLRP] SET  MULTI_USER 
GO
ALTER DATABASE [QLRP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLRP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLRP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLRP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLRP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLRP] SET QUERY_STORE = OFF
GO
USE [QLRP]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 12/18/2018 12:36:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [ntext] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[stop_time] [datetime] NOT NULL,
	[genre] [ntext] NOT NULL,
	[actor] [ntext] NOT NULL,
	[director] [nvarchar](200) NOT NULL,
	[duration] [nvarchar](50) NOT NULL,
	[version] [ntext] NOT NULL,
	[production] [ntext] NOT NULL,
	[price] [float] NOT NULL,
	[movie_detail] [ntext] NOT NULL,
	[image_thumb] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Showtimes]    Script Date: 12/18/2018 12:36:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Showtimes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[movie_id] [int] NOT NULL,
	[time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[getAllShowtime]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[getAllShowtime] as
select Showtimes.id As 'Showtimeid',Showtimes.movie_id as 'Movieid',
Showtimes.time as 'Showtime',Movies.title as 'Movietitle' from Showtimes,
Movies where Showtimes.movie_id= Movies.id
GO
/****** Object:  View [dbo].[phimdangchieu]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[phimdangchieu] AS
SELECT * FROM Movies
WHERE GETDATE() >= start_time AND GETDATE() <=stop_time
GO
/****** Object:  View [dbo].[phimsapchieu]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---
CREATE VIEW [dbo].[phimsapchieu] AS
SELECT * FROM Movies
WHERE GETDATE() < start_time
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[full_name] [nvarchar](255) NOT NULL,
	[pass_word] [char](255) NOT NULL,
	[phone] [char](12) NOT NULL,
	[gender] [nvarchar](10) NOT NULL,
	[level] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[showtime_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[getAllBooking]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[getAllBooking] AS
SELECT BookingDetails.id AS 'BookingID',BookingDetails.user_id AS 'UserID',BookingDetails.showtime_id AS 'ShowtimeID',Showtimes.time AS 'ShowTime',Users.full_name AS 'UserFullName',Movies.title AS 'MovieTitle'
FROM BookingDetails,Users,Showtimes,Movies 
WHERE BookingDetails.user_id=Users.id AND BookingDetails.showtime_id=Showtimes.id AND Showtimes.movie_id=Movies.id
GO
/****** Object:  Table [dbo].[Events]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [ntext] NOT NULL,
	[start_time] [datetime] NOT NULL,
	[stop_time] [datetime] NOT NULL,
	[content] [ntext] NOT NULL,
	[image_thumb] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatDetails]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatDetails](
	[booking_id] [int] NOT NULL,
	[seat_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seats]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seats](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [char](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[key] [varchar](150) NOT NULL,
	[value] [ntext] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BookingDetails] ON 

INSERT [dbo].[BookingDetails] ([id], [user_id], [showtime_id]) VALUES (79, 9, 30)
SET IDENTITY_INSERT [dbo].[BookingDetails] OFF
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([id], [title], [start_time], [stop_time], [content], [image_thumb]) VALUES (3, N'TẶNG VÉ XEM PHIM MIỄN PHÍ', CAST(N'2018-05-05T00:00:00.000' AS DateTime), CAST(N'2019-10-05T00:00:00.000' AS DateTime), N'<p>Tặng ngay 01 v&eacute; xem phim 2D miễn ph&iacute; v&agrave;o t&agrave;i khoản tr&ecirc;n ứng dụng Lotte Cinema của qu&yacute; kh&aacute;ch</p>

<p>&Aacute;p dụng khi qu&yacute; kh&aacute;ch mua 01 v&eacute; xem phim bất kỳ v&agrave; 01 combo bắp nước bất kỳ (solo combo / couple combo / party combo/ festy combo / Ralph combo / Aquaman combo / Hồn Papa combo / combo lịch b&agrave;n 2019)</p>

<p>Ngo&agrave;i ra tặng th&ecirc;m 01 voucher giảm gi&aacute; 20% solo combo (01 bắp lớn, 01 nước lớn) từ 70,000 VNĐ chỉ c&ograve;n 56,000 VNĐ</p>
', N'images/17122018_112625_AM_f6e97b9f9fe14048a5901b0438706bdc.jpg')
INSERT [dbo].[Events] ([id], [title], [start_time], [stop_time], [content], [image_thumb]) VALUES (4, N'VUI CÙNG GAME NÚT BẤM QUYỀN NĂNG', CAST(N'2019-01-01T00:00:00.000' AS DateTime), CAST(N'2019-02-12T00:00:00.000' AS DateTime), N'<p>- Với mỗi lượt tham gia, kh&aacute;ch h&agrave;ng th&agrave;nh vi&ecirc;n của LOTTE Cinema c&oacute; cơ hội nhận ngay qu&agrave; tặng l&agrave; 1 code giảm gi&aacute; 20,000VNĐ.&nbsp;</p>

<p>- Chỉ cần &quot;NHẤN&quot; n&uacute;t&nbsp;b&ecirc;n dưới, qu&agrave; tặng sẽ trả v&agrave;o V&iacute; LOTTE Cinema của bạn.</p>
', N'images/17122018_112740_AM_cac9c0aaf6a34cf1a1c274c674a2c64d.jpg')
INSERT [dbo].[Events] ([id], [title], [start_time], [stop_time], [content], [image_thumb]) VALUES (5, N'COMBO PARK HANG SEO', CAST(N'2018-12-17T00:00:00.000' AS DateTime), CAST(N'2019-01-12T00:00:00.000' AS DateTime), N'<p><strong>Nội Dung:</strong>&nbsp;Kh&aacute;ch h&agrave;ng mua v&eacute; xem phim Park Hang Seo, sẽ được mua combo 1 bắp lớn + 1 nước lớn gi&aacute; 70.000VNĐ giảm c&ograve;n 50.000VNĐ</p>
', N'images/17122018_112925_AM_60dbd8c63e1a4bf08c27e409e9740283.jpg')
SET IDENTITY_INSERT [dbo].[Events] OFF
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([id], [title], [start_time], [stop_time], [genre], [actor], [director], [duration], [version], [production], [price], [movie_detail], [image_thumb]) VALUES (28, N'SINH VẬT HUYỀN BÍ 2: TỘI ÁC CỦA GRINDELWALD', CAST(N'2018-05-05T00:00:00.000' AS DateTime), CAST(N'2019-06-06T00:00:00.000' AS DateTime), N'Phim viễn tưởng, Phim phiêu lưu, Phim gia đình, Phim chiếu rạp, Phim lẻ', N' Eddie Redmayne, Newt Scamander ,Katherine Waterston ,Tina Goldstein ,Dan Fogler ', N'David Yates', N'134 phút', N'HDRip', N'Heyday Films, Warner Bros.', 50000, N'<p>Sau th&agrave;nh c&ocirc;ng của phần đầu, &quot;<strong>Sinh Vật Huyền B&iacute;: Tội &Aacute;c Của Grindelwald</strong>&quot; tiếp tục mang đến cho người xem c&aacute;i nh&igrave;n s&acirc;u sắc về một thế giới ph&ugrave; thủy đen tối v&agrave; dữ dội hơn c&ugrave;ng cuộc chiến nảy lửa giữa vị ph&aacute;p sư đ&aacute;ng k&iacute;nh&nbsp;<strong>Albus Dumbledore</strong>&nbsp;(Jude Law) v&agrave; ph&ugrave; thủy b&oacute;ng tối xấu xa&nbsp;<strong>Gellert Grindelwald</strong>&nbsp;(Johnny Depp). Phần 2 xoay quanh cuộc chiến giữa hai phe để truy t&igrave;m v&agrave; tranh gi&agrave;nh c&aacute;c Bảo bối Tử thần. C&aacute;c ph&ugrave; thủy sẽ phải l&agrave;m g&igrave; khi đứng giữa 2 sự lựa chọn: h&ograve;a b&igrave;nh hay chiến tranh với thế giới người ph&agrave;m?&rdquo;<br />
&nbsp;</p>

<p><img src="http://image.phimmoi.net/post/2018/11/15/cd017d37-e30c-4894-8882-3b86f4840dd5.jpg" /></p>
', N'images/17122018_110655_AM_poster.medium (1).jpg')
INSERT [dbo].[Movies] ([id], [title], [start_time], [stop_time], [genre], [actor], [director], [duration], [version], [production], [price], [movie_detail], [image_thumb]) VALUES (29, N'CÁO GIÀ GIAN ÁC VÀ NHỮNG CHUYỆN KHÁC...', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2019-05-05T00:00:00.000' AS DateTime), N'Phim hài hước, Phim hoạt hình, Phim lẻ', N' Guillaume Darnault, Fox, Damien Witecka, Pork Kamel, Abdessadok Bunny ', N'Patrick Imbert, Benjamin Renner', N'83 phút', N'Full HD', N'Folivari, Panique, StudioCanal', 100000, N'<p>N&ocirc;ng trại của&nbsp;<strong>Thung lũng ng&agrave;n hoa</strong>&nbsp;vốn l&agrave; một nơi y&ecirc;n b&igrave;nh với những lo&agrave;i động vật chung sống h&ograve;a thuận quanh năm. Thế nhưng sự xuất hiện của một v&agrave;i nh&acirc;n vật kh&ocirc;ng ngờ tới c&ugrave;ng bản t&iacute;nh khờ dại của bộ đ&ocirc;i Thỏ v&agrave; Vịt đ&atilde; cuốn c&aacute;c cư d&acirc;n ở đ&acirc;y v&agrave;o những cuộc h&agrave;nh tr&igrave;nh dở kh&oacute;c dở cười, khi Thỏ tinh nghịch phải thay lo&agrave;i c&ograve; mang em b&eacute; đến cho bố mẹ, C&aacute;o &ldquo;gian &aacute;c&rdquo; phải giả l&agrave;m g&agrave; m&aacute;i nu&ocirc;i nấng ba ch&uacute; g&agrave; con ngộ nghĩnh v&agrave; bảo vệ ch&uacute;ng trước S&oacute;i ranh m&atilde;nh, Vịt x&iacute; xớn phải sắm vai &Ocirc;ng gi&agrave; N&ocirc;-en mang qu&agrave; cho trẻ em khắp thế giới để cứu lấy Gi&aacute;ng sinh.<br />
<br />
Ba c&acirc;u chuyện nhỏ như ba sắc m&agrave;u đổi thay của m&ugrave;a m&agrave;ng, của d&ograve;ng chảy thời gian. H&egrave; về, thu tới, rồi đ&ocirc;ng sang, Gi&aacute;ng sinh đến cũng l&agrave; l&uacute;c c&aacute;c nh&acirc;n vật dần học được c&aacute;ch chấp nhận v&agrave; tr&acirc;n trọng nhau, để hiểu rằng sự nghịch ngợm kh&ocirc;ng hẳn l&agrave; đ&aacute;ng tr&aacute;ch, sự ng&acirc;y thơ kh&ocirc;ng hẳn l&agrave; dại dột, v&agrave; t&igrave;nh bạn ch&acirc;n ch&iacute;nh cũng như ph&eacute;p m&agrave;u lu&ocirc;n tồn tại trong cuộc sống quanh ta, chỉ cần ta biết tin tưởng v&agrave; y&ecirc;u thương.<br />
&nbsp;</p>

<p><img src="http://image.phimmoi.net/post/2018/12/16/image-renard-980x0.jpg" /></p>
', N'images/17122018_111017_AM_poster.medium (2).jpg')
INSERT [dbo].[Movies] ([id], [title], [start_time], [stop_time], [genre], [actor], [director], [duration], [version], [production], [price], [movie_detail], [image_thumb]) VALUES (30, N'TÀ KHÔNG THẮNG CHÍNH', CAST(N'2019-05-05T00:00:00.000' AS DateTime), CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'Phim hành động, Phim chiến tranh, Phim hình sự, Phim chính kịch - Drama, Phim lẻ', N' Wen Jiang Lan, Qingfeng, Bành Vu Yến Li, Tianran Fan, Liao Zhu Qianlong, Qing Xu Tang', N'Wen Jiang, ', N'137 phút', N'Full HD', N'Gravity Pictures', 60000, N'<p><strong>T&agrave; Kh&ocirc;ng Thắng Ch&iacute;nh</strong>&nbsp;l&agrave; phim điện ảnh lấy bối cảnh những năm 30 thời kỳ qu&acirc;n phiệt hỗn chiến ở Trung Quốc. Chứng kiến sư huynh&nbsp;<strong>Tiềm Long</strong>&nbsp;(<strong>Li&ecirc;u Ph&agrave;m</strong>) cấu kết với Nhật Bản giết hại cả nh&agrave; sư phụ,<strong>&nbsp;L&yacute; Thi&ecirc;n Nhi&ecirc;n</strong>&nbsp;(<strong>B&agrave;nh Vu Yến</strong>) may mắn tho&aacute;t th&acirc;n v&agrave; được một vị b&aacute;c sĩ người Mỹ cứu gi&uacute;p. Sang Mỹ,&nbsp;<strong>Thi&ecirc;n Nhi&ecirc;n&nbsp;</strong>vốn c&oacute; thi&ecirc;n ph&uacute; về v&otilde; thuật, anh ch&agrave;ng được tham gia huấn luyện đặc c&ocirc;ng v&agrave; sau đ&oacute; anh trở về Trung Quốc để b&aacute;o th&ugrave;.<br />
&nbsp;</p>

<p><img src="http://image.phimmoi.net/post/2018/12/15/15lgz8kyarbak14b.jpg" /></p>
', N'images/17122018_111223_AM_poster.medium (3).jpg')
INSERT [dbo].[Movies] ([id], [title], [start_time], [stop_time], [genre], [actor], [director], [duration], [version], [production], [price], [movie_detail], [image_thumb]) VALUES (31, N'Chân Nhỏ, Bạn Ở Đâu?', CAST(N'2019-05-05T00:00:00.000' AS DateTime), CAST(N'2019-10-10T00:00:00.000' AS DateTime), N'Phiêu lưu - Hành động, Hài Hước, Phim Hoạt Hình, Chiếu Rạp', N'Channing Tatum, Zendaya, LeBron James', N'Karey Kirkpatrick', N'90 phút', N'2D | Normal | Normal sound | Phụ đề', N'KBS Media, SaryeoNi Film', 70000, N'<p>Sau lần chạm tr&aacute;n với Percy, một sinh vật với đ&ocirc;i ch&acirc;n b&eacute; nhỏ, người tuyết Migo quyết t&acirc;m thực hiện chuyến phi&ecirc;u lưu của m&igrave;nh đến v&ugrave;ng đất xa x&ocirc;i để chứng minh với cộng đồng của m&igrave;nh rằng Ch&acirc;n Nhỏ l&agrave; c&oacute; thật. Liệu Ch&acirc;n Nhỏ c&oacute; thật sự đ&aacute;ng sợ như họ đ&atilde; nghĩ? H&atilde;y c&ugrave;ng Migo đi t&igrave;m sinh vật huyền b&iacute; n&agrave;y v&agrave;o th&aacute;ng 9 nh&eacute;!<br />
&nbsp;</p>

<p><img src="http://image.phimmoi.net/post/2018/10/26/the-predator-15381201031486.jpg" /></p>
', N'images/17122018_111731_AM_poster.medium (4).jpg')
INSERT [dbo].[Movies] ([id], [title], [start_time], [stop_time], [genre], [actor], [director], [duration], [version], [production], [price], [movie_detail], [image_thumb]) VALUES (32, N'Bạn ma phiền toái-The Soul-Mate ', CAST(N'2018-01-01T00:00:00.000' AS DateTime), CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'Phim viễn tưởng, Phim hài hước, Phim chiếu rạp, Phim thuyết minh, Phim lẻ', N'MA DONG-SEOK,KIM YOUNG-KWANG,LEE YOO-YOUNG', N'Jo Won-Hee, ', N'97 phút', N'Full HD ,Phụ đề việt + Thuyết minh', N'Daydream Entertainment', 70000, N'<h2>DIỄN VI&Ecirc;N</h2>

<ul>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/ma-dong-seok-17388/" title="Ma Dong-Seok trong vai Jang-Soo">Ma Dong-SeokJang-Soo</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/kim-young-kwang-15554/" title="Kim Young-Kwang trong vai Tae-Jin">Kim Young-KwangTae-Jin</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/lee-yoo-young-21961/" title="Lee Yoo-Young trong vai Hyun-Ji">Lee Yoo-YoungHyun-Ji</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/choi-yoo-ri-37663/" title="Choi Yoo-Ri trong vai Do-Kyung">Choi Yoo-RiDo-Kyung</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/joo-jin-mo-20374/" title="Joo Jin-Mo trong vai Police Inspector Yang">Joo Jin-MoPolice Inspector Yang</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/choi-gwi-hwa-16657/" title="Choi Gwi-Hwa trong vai Jong-Sik">Choi Gwi-HwaJong-Sik</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/heo-jae-ho-28362/" title="Heo Jae-Ho trong vai Poong-Ki">Heo Jae-HoPoong-Ki</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/ko-kyu-pil-25150/" title="Ko Kyu-Pil trong vai Bong-Gu">Ko Kyu-PilBong-Gu</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/cha-rae-hyoung-33772/" title="Cha Rae-Hyoung trong vai Salsali">Cha Rae-HyoungSalsali</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/yoon-hee-won-21353/" title="Yoon Hee-Won trong vai Section Chief Lee">Yoon Hee-WonSection Chief Lee</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/ye-jung-hwa-45736/" title="Ye Jung-Hwa trong vai beautiful female passerby">Ye Jung-Hwabeautiful female passerby</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/kwak-jin-seok-20634/" title="Kwak Jin-Seok trong vai Poong-Ki''s subordinate 1">Kwak Jin-SeokPoong-Ki&#39;s subordinate 1</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/jung-jae-hun-39527/" title="Jung Jae-Hun trong vai Poong-Ki''s subordinate 2">Jung Jae-HunPoong-Ki&#39;s subordinate 2</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/lee-young-suk-22586/" title="Lee Young-Suk trong vai house owner">Lee Young-Sukhouse owner</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/bae-jung-hwa-42888/" title="Bae Jung-Hwa trong vai Do-Kyung''s mother">Bae Jung-HwaDo-Kyung&#39;s mother</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/park-bom-45737/" title="Park Bom trong vai Do-Kyung (young)">Park BomDo-Kyung (young)</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/kang-seung-wan-41828/" title="Kang Seung-Wan trong vai Kyung-Ho">Kang Seung-WanKyung-Ho</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/han-sung-chun-19129/" title="Han Sung-Chun trong vai detective 1">Han Sung-Chundetective 1</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/han-chang-hyun-44361/" title="Han Chang-Hyun trong vai intensive care unit doctor">Han Chang-Hyunintensive care unit doctor</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/cha-soon-hyoung-30760/" title="Cha Soon-Hyoung trong vai emergency room doctor 1">Cha Soon-Hyoungemergency room doctor 1</a></p>
	</li>
	<li>
	<p><a href="http://www.phimmoi.net/ho-so/kim-jung-soo-41311/" title="Kim Jung-Soo trong vai fish market seller">Kim Jung-Soofish market seller</a></p>
	</li>
</ul>

<p>&nbsp;</p>

<h2>NỘI DUNG PHIM</h2>

<p><iframe frameborder="0" id="fbplugin-like-1" scrolling="no"></iframe></p>

<p>Jang-su (Ma Dong-seok) v&agrave; Tae-jin (Kim Young-kwang) sở hữu c&aacute; t&iacute;nh ho&agrave;n to&agrave;n đối lập. L&agrave; một v&otilde; sư nổi tiếng, nhưng Jang-soo lại tỏ ra &iacute;ch kỷ v&agrave; chẳng bao giờ chịu gi&uacute;p đỡ người hoạn nạn. Tất cả những g&igrave; anh quan t&acirc;m chỉ l&agrave; lo lắng chữa trị căn bệnh tim bẩm sinh cho c&ocirc; con g&aacute;i nhỏ Do-kyung (Choi Yoo-ri).<br />
<br />
Trong khi đ&oacute;, Tae-jin lại l&agrave; một vi&ecirc;n cảnh s&aacute;t đầy nhiệt huyết, lu&ocirc;n đấu tranh cho ch&iacute;nh nghĩa. V&igrave; theo d&otilde;i một đường d&acirc;y bu&ocirc;n b&aacute;n phụ nữ tr&aacute;i ph&eacute;p, anh bị nh&oacute;m x&atilde; hội đen h&atilde;m hại.<br />
L&agrave; người duy nhất nh&igrave;n thấy linh hồn của Tae-jin, Jang-su đ&agrave;nh bất đắc dĩ gi&uacute;p đỡ vi&ecirc;n cảnh s&aacute;t đ&ograve;i lại c&ocirc;ng bằng.</p>

<h3>TỪ KH&Oacute;A:</h3>

<ul>
	<li><a href="http://www.phimmoi.net/tags/b%E1%BA%A1n+ma+phi%E1%BB%81n+to%C3%A1i/" title="bạn ma phiền toái">bạn ma phiền to&aacute;i</a></li>
	<li><a href="http://www.phimmoi.net/tags/the+soul+mate/" title="the soul mate">the soul mate</a></li>
	<li><a href="http://www.phimmoi.net/tags/wonderful+ghost/" title="wonderful ghost">wonderful ghost</a></li>
	<li><a href="http://www.phimmoi.net/tags/b%E1%BA%A1n+t%C3%A2m+giao/" title="bạn tâm giao">bạn t&acirc;m giao</a></li>
</ul>

<p><iframe frameborder="no" height="100%" scrolling="no" src="https://www.youtube.com/embed/vvjmifDXeCU?modestbranding=1&amp;iv_load_policy=3&amp;showinfo=1&amp;rel=0" width="100%"></iframe></p>

<p>&nbsp;</p>
', N'images/17122018_105349_PM_17122018_105008_PM_17122018_111957_AM_poster.medium (5).jpg')
INSERT [dbo].[Movies] ([id], [title], [start_time], [stop_time], [genre], [actor], [director], [duration], [version], [production], [price], [movie_detail], [image_thumb]) VALUES (33, N'TRUY TÌM TUNG TÍCH ẢO', CAST(N'2019-02-02T00:00:00.000' AS DateTime), CAST(N'2019-12-02T00:00:00.000' AS DateTime), N'Phim hồi hộp-Gây cấn, Phim Bí ẩn-Siêu nhiên, Phim chính kịch - Drama, Phim chiếu rạp, Phim lẻ', N' John Cho, Joseph Lee, Colin Woodell...', N'Aneesh Chaganty, ', N'102 phút', N'Độ phân giải:Full HD Ngôn ngữ:Phụ đề Việt', N'Screen Gems, Stage 6 Films, Bazelevs ', 80000, N'<p>37 tiếng sau khi con g&aacute;i mất t&iacute;ch, &ocirc;ng bố David Kim quyết định tự m&igrave;nh điều tra sự thật. Đến l&uacute;c n&agrave;y, &ocirc;ng b&agrave;ng ho&agrave;ng nhận ra một điều rằng: H&oacute;a ra từ trước đến nay &ocirc;ng kh&ocirc;ng hề hiểu g&igrave; về cuộc sống của c&ocirc; con g&aacute;i 16 tuổi cả.</p>

<p><iframe frameborder="no" height="100%" scrolling="no" src="https://www.youtube.com/embed/BnKtYS9KW-g?modestbranding=1&amp;iv_load_policy=3&amp;showinfo=1&amp;rel=0" width="100%"></iframe></p>
', N'images/17122018_112358_AM_poster.medium (6).jpg')
SET IDENTITY_INSERT [dbo].[Movies] OFF
INSERT [dbo].[SeatDetails] ([booking_id], [seat_id]) VALUES (79, 2)
INSERT [dbo].[SeatDetails] ([booking_id], [seat_id]) VALUES (79, 7)
INSERT [dbo].[SeatDetails] ([booking_id], [seat_id]) VALUES (79, 14)
INSERT [dbo].[SeatDetails] ([booking_id], [seat_id]) VALUES (79, 22)
INSERT [dbo].[SeatDetails] ([booking_id], [seat_id]) VALUES (79, 3)
SET IDENTITY_INSERT [dbo].[Seats] ON 

INSERT [dbo].[Seats] ([id], [name]) VALUES (2, N'A1        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (3, N'A3        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (4, N'A4        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (5, N'A5        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (6, N'B1        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (7, N'B2        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (8, N'B3        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (9, N'B4        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (10, N'B5        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (11, N'C1        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (12, N'C2        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (13, N'C3        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (14, N'C4        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (15, N'C5        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (16, N'D1        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (17, N'D2        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (18, N'D3        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (19, N'D4        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (20, N'D5        ')
INSERT [dbo].[Seats] ([id], [name]) VALUES (22, N'A2        ')
SET IDENTITY_INSERT [dbo].[Seats] OFF
INSERT [dbo].[Settings] ([key], [value]) VALUES (N'code_footer', N'<img class="logo-footer" src="/App_Themes/lotte/img/logo_lotte_fff.svg" width="197" height="15" alt="Lotte Cinema" />
                        <ul>
                            
                                    <li class="dn_textup">
                                        Lotte Cinema Việt Nam</li>
                                    <li>
                                        T?ng 3, TTTM Lotte, Sgrguy?n H?u Th?, P.Tân Hung, Q.7, Tp.H? Chí Minh, Vi?t Nam.</li>
                                    <li>
                                        (028) 3775 2521 - (028) 3775 2520</li>
                                    <li>
                                        COPYRIGHT &copy; LOTTECINEMAVN.COM - ALL RIGHTS RESERVED. </li>
                                    <li>
                                        <div class="dn_license">
                                            <span><a target="_blank" title="thi?t k? web" href="http://matbaomedia.com/Dich-vu/thiet-ke-Website.aspx">
                                                
                                                Thi?t k? web
                                            
                                                  </a> M?t Bão Media</span>
                                            <div style="clear: both"></div>
                                        </div>
                                    </li>
                                
                        </ul>
')
INSERT [dbo].[Settings] ([key], [value]) VALUES (N'describe', N'Trang đặt phim online ')
INSERT [dbo].[Settings] ([key], [value]) VALUES (N'facebook', N'https://www.facebook.com/lotte')
INSERT [dbo].[Settings] ([key], [value]) VALUES (N'image_logo', N'~/images/17122018_102141_PM_logo.png')
INSERT [dbo].[Settings] ([key], [value]) VALUES (N'instagram', N'https://www.instagram.com/lotte')
INSERT [dbo].[Settings] ([key], [value]) VALUES (N'title', N'Web đặt phim')
INSERT [dbo].[Settings] ([key], [value]) VALUES (N'youtube', N'https://www.youtube.com/lotte')
INSERT [dbo].[Settings] ([key], [value]) VALUES (N'zalo', N'https://zalo.me/lottecinema')
SET IDENTITY_INSERT [dbo].[Showtimes] ON 

INSERT [dbo].[Showtimes] ([id], [movie_id], [time]) VALUES (23, 28, CAST(N'2018-12-21T09:30:00.000' AS DateTime))
INSERT [dbo].[Showtimes] ([id], [movie_id], [time]) VALUES (24, 28, CAST(N'2018-12-29T21:00:00.000' AS DateTime))
INSERT [dbo].[Showtimes] ([id], [movie_id], [time]) VALUES (25, 28, CAST(N'2018-12-21T07:30:00.000' AS DateTime))
INSERT [dbo].[Showtimes] ([id], [movie_id], [time]) VALUES (26, 28, CAST(N'2018-12-24T19:00:00.000' AS DateTime))
INSERT [dbo].[Showtimes] ([id], [movie_id], [time]) VALUES (27, 29, CAST(N'2018-12-29T07:30:00.000' AS DateTime))
INSERT [dbo].[Showtimes] ([id], [movie_id], [time]) VALUES (28, 29, CAST(N'2018-12-28T21:00:00.000' AS DateTime))
INSERT [dbo].[Showtimes] ([id], [movie_id], [time]) VALUES (29, 29, CAST(N'2018-12-28T19:00:00.000' AS DateTime))
INSERT [dbo].[Showtimes] ([id], [movie_id], [time]) VALUES (30, 30, CAST(N'2018-12-22T21:00:00.000' AS DateTime))
INSERT [dbo].[Showtimes] ([id], [movie_id], [time]) VALUES (31, 30, CAST(N'2018-12-25T09:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Showtimes] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [email], [full_name], [pass_word], [phone], [gender], [level]) VALUES (1, N'truongtc1109@gmail.com', N'Trần Công Trường', N'45891997                                                                                                                                                                                                                                                       ', N'0981334233  ', N'Nam', 1)
INSERT [dbo].[Users] ([id], [email], [full_name], [pass_word], [phone], [gender], [level]) VALUES (2, N'ancoi23@gmail.com', N'Trần Văn Toàn', N'1234                                                                                                                                                                                                                                                           ', N'0936408751  ', N'Nam', 0)
INSERT [dbo].[Users] ([id], [email], [full_name], [pass_word], [phone], [gender], [level]) VALUES (3, N'zxoiuq2@gmail.com', N'Nguyễn Thị Linh', N'1234                                                                                                                                                                                                                                                           ', N'01626665028 ', N'Nữ', 0)
INSERT [dbo].[Users] ([id], [email], [full_name], [pass_word], [phone], [gender], [level]) VALUES (6, N'testsignup@gmail.com', N'Trần Công Trường', N'12312312                                                                                                                                                                                                                                                       ', N'0498798789  ', N'Nam', 0)
INSERT [dbo].[Users] ([id], [email], [full_name], [pass_word], [phone], [gender], [level]) VALUES (8, N'dd2@s.s', N'Trần Công Trường', N'ádas                                                                                                                                                                                                                                                           ', N'981334233   ', N'Nữ', 0)
INSERT [dbo].[Users] ([id], [email], [full_name], [pass_word], [phone], [gender], [level]) VALUES (9, N'admin@gmail.com', N'Nhóm 10', N'123456                                                                                                                                                                                                                                                         ', N'0981334233  ', N'Nam', 1)
INSERT [dbo].[Users] ([id], [email], [full_name], [pass_word], [phone], [gender], [level]) VALUES (10, N'tranbinhhaui97@gmail.com', N'Trần Thị Thu Bình', N'123456                                                                                                                                                                                                                                                         ', N'0376556953  ', N'Nữ', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_Show_Time] FOREIGN KEY([showtime_id])
REFERENCES [dbo].[Showtimes] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_Show_Time]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_User_Booking] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_User_Booking]
GO
ALTER TABLE [dbo].[SeatDetails]  WITH CHECK ADD  CONSTRAINT [FK_Booking] FOREIGN KEY([booking_id])
REFERENCES [dbo].[BookingDetails] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SeatDetails] CHECK CONSTRAINT [FK_Booking]
GO
ALTER TABLE [dbo].[SeatDetails]  WITH CHECK ADD  CONSTRAINT [FK_Seat] FOREIGN KEY([seat_id])
REFERENCES [dbo].[Seats] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SeatDetails] CHECK CONSTRAINT [FK_Seat]
GO
ALTER TABLE [dbo].[Showtimes]  WITH CHECK ADD  CONSTRAINT [FK_Movie_ShowTime] FOREIGN KEY([movie_id])
REFERENCES [dbo].[Movies] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Showtimes] CHECK CONSTRAINT [FK_Movie_ShowTime]
GO
/****** Object:  StoredProcedure [dbo].[getAllBookingByMovie]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllBookingByMovie] @movie_id int
AS
SELECT BookingDetails.id AS 'BookingID',BookingDetails.user_id AS 'UserID',BookingDetails.showtime_id AS 'ShowtimeID',Showtimes.time AS 'ShowTime',Users.full_name AS 'UserFullName',Movies.title AS 'MovieTitle'
FROM BookingDetails,Users,Showtimes,Movies 
WHERE BookingDetails.user_id=Users.id AND BookingDetails.showtime_id=Showtimes.id AND Showtimes.movie_id=Movies.id AND Movies.id = @movie_id
GO
/****** Object:  StoredProcedure [dbo].[getAllInfoShowtime]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[getAllInfoShowtime] @showtime_id int
as
SELECT Showtimes.id AS 'ID', Showtimes.movie_id AS 'MOVIE_ID',Showtimes.time AS 'SHOWTIME',Movies.title AS 'MOVIE_TITLE',
	Movies.id AS 'MOVIE_ID',Movies.price AS 'MOVIE_PRICE' FROM Movies, Showtimes 
WHERE Movies.id = Showtimes.movie_id AND Showtimes.id=@showtime_id
GO
/****** Object:  StoredProcedure [dbo].[getAllSeatBookedByShowtime]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllSeatBookedByShowtime] @showtime_id int, @name char(10)
AS
SELECT Seats.id as 'ID',Seats.name as 'NAME' FROM Showtimes ,BookingDetails , SeatDetails, Seats
WHERE Showtimes.id=BookingDetails.showtime_id
		AND BookingDetails.id=SeatDetails.booking_id
		AND SeatDetails.seat_id = Seats.id
		AND Showtimes.id = @showtime_id
		AND NAME LIKE @name ORDER BY name ASC
GO
/****** Object:  StoredProcedure [dbo].[getAllSeatBookedByShowtimeID]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	-------------
	CREATE PROCEDURE [dbo].[getAllSeatBookedByShowtimeID] @showtime_id int
AS
SELECT Seats.id as 'ID',Seats.name as 'NAME' FROM Showtimes ,BookingDetails , SeatDetails, Seats
WHERE Showtimes.id=BookingDetails.showtime_id
		AND BookingDetails.id=SeatDetails.booking_id
		AND SeatDetails.seat_id = Seats.id
		AND Showtimes.id = @showtime_id
GO
/****** Object:  StoredProcedure [dbo].[getAllShowtimByMovie]    Script Date: 12/18/2018 12:36:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--PROC
CREATE PROCEDURE [dbo].[getAllShowtimByMovie] @movie_id int
AS
select Showtimes.id As 'Showtimeid',Showtimes.movie_id as 'Movieid',
Showtimes.time as 'Showtime',Movies.title as 'Movietitle' from Showtimes,
Movies where Showtimes.movie_id= Movies.id AND Showtimes.movie_id=@movie_id
GO
USE [master]
GO
ALTER DATABASE [QLRP] SET  READ_WRITE 
GO
