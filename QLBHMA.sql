USE [master]
GO
/****** Object:  Database [QLBHMA]    Script Date: 7/10/2020 6:10:25 PM ******/
CREATE DATABASE [QLBHMA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBHMA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLBHMA.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBHMA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLBHMA_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLBHMA] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBHMA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBHMA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBHMA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBHMA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBHMA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBHMA] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBHMA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBHMA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBHMA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBHMA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBHMA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBHMA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBHMA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBHMA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBHMA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBHMA] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLBHMA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBHMA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBHMA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBHMA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBHMA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBHMA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBHMA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBHMA] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBHMA] SET  MULTI_USER 
GO
ALTER DATABASE [QLBHMA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBHMA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBHMA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBHMA] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLBHMA] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBHMA', N'ON'
GO
USE [QLBHMA]
GO
/****** Object:  Table [dbo].[ChungLoai]    Script Date: 7/10/2020 6:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChungLoai](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChungLoai] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangHoa]    Script Date: 7/10/2020 6:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHoa](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaSo] [nvarchar](50) NULL,
	[Ten] [nvarchar](200) NOT NULL,
	[DonViTinh] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
	[ThongSoKyThuat] [nvarchar](max) NULL,
	[ThuongHieuID] [int] NULL,
	[TenHinh] [nvarchar](max) NULL,
	[GiaBan] [int] NOT NULL,
	[LoaiID] [int] NULL,
	[NgayTao] [datetime] NOT NULL,
	[NgayCapNhat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 7/10/2020 6:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HoaDon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NgayDatHang] [datetime] NOT NULL,
	[HoTenKhach] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](150) NULL,
	[DienThoai] [varchar](30) NULL,
	[Email] [varchar](50) NULL,
	[TongTien] [int] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoaDonChiTiet]    Script Date: 7/10/2020 6:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDonChiTiet](
	[HoaDonID] [int] NOT NULL,
	[HangHoaID] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [int] NOT NULL,
	[ThanhTien] [int] NOT NULL,
 CONSTRAINT [PK_HoaDonChiTiet] PRIMARY KEY CLUSTERED 
(
	[HoaDonID] ASC,
	[HangHoaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Loai]    Script Date: 7/10/2020 6:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loai](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaSo] [varchar](10) NOT NULL,
	[Ten] [nvarchar](100) NOT NULL,
	[ChungLoaiID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 7/10/2020 6:10:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[TenHinh] [nvarchar](max) NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ChungLoai] ON 

INSERT [dbo].[ChungLoai] ([Id], [Ten]) VALUES (1, N'Body')
INSERT [dbo].[ChungLoai] ([Id], [Ten]) VALUES (2, N'Lens')
SET IDENTITY_INSERT [dbo].[ChungLoai] OFF
SET IDENTITY_INSERT [dbo].[HangHoa] ON 

INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (1, N'BC001', N'Canon EOS 5D MARK III', NULL, N'Khả năng chụp liên tục 950 tấm ảnh chỉ với 1 lần sạc pin, máy ảnh Canon EOS 5D Mark III là sự lựa chọn hoàn hảo trong tầm giá cho bất cứ ai. Bên cạnh đó, bộ xử lý hình ảnh được nần cấp mạnh hơn 17 lần so với đàn anh 5D Mark II là một điểm đáng chú ý của sản phẩm này.
 
Chiếc máy ảnh Canon 5D Mark III này có kiểu dáng mềm mại hơn so với máy ảnh 5D Mark II, tuy nhiên thiết kế máy lại có phần tròn trịa giống với dòng 7D. Cũng như phần cạnh trái, toàn bộ diện tích phần tay cầm bên phải của Canon 5D Mark III được bọc một lớp cao su mềm, nhằm mang lại cảm giác chắc chắn cho chiếc body nặng đến 860g này. 
', N'- Cảm biến CMOS fullframe 22.3 megapixel.
- Bộ xử lý hình ảnh DIGIC 5+
- ISO 100-25600, mở rộng tới 102400
- Hệ thống đo nét tiên tiến với 61 điểm
- Màn hình LCD 3.2inch
- Tốc độ màn trập 1/8000 giây đến 60 giây
- Tốc độ chụp liên tục tối đa 6 hình/giây
- Thẻ nhớ tương thích: CF/ SD/ SDHC/SDXC
- Trọng lượng: 860g
- Phụ kiện đi kèm: Eyecup, pin LP-E6, sạc LC-E6, dây đeo cổ EOS 5D Mark III, dây AV, dây USB, sách hướng dẫn sử dụng và thẻ bảo hành
', 1, N'Body_canon_EOS 5D_1.jpg,Body_canon_EOS 5D_2.jpg,Body_canon_EOS 5D_3.jpg,Body_canon_EOS 5D_4.jpg,Body_canon_EOS 5D_5.jpg', 41900000, 1, CAST(N'2017-07-06 00:00:00.000' AS DateTime), CAST(N'2017-07-06 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (2, N'BC002', N'Canon EOS 90D', NULL, N'Phiên bản mới được nâng cấp cảm biến ảnh full-frame với độ phân giải 26.2 MP tích hợp công nghệ lấy nét Dual Pixel cùng chip xử lý hình ảnh DIGIC 7. Canon cũng nâng cấp khả năng quay phim với chuẩn 1080p/60fps và tích hợp đầy đủ các kết nối Wi-Fi, Bluetooth, NFC và GPS vào trong một chiếc máy thuộc dòng cao cấp.', N'- Cảm biến: APS-C CMOS 32.5MP
- Bộ xử lý hình ảnh: Digic 8
- Chụp liên tiếp: 10fps 
- Dải ISO máy ảnh: 100-25600
- Quay video: UHD 4K30p & Full HD 120p
- Tốc độ màn trập 90D: 1/16000
- Hệ thống lấy nét tự động 45 điểm
- Tích hợp Wifi và Bluetooth
- Kích thước: 139.7 x 104.14 x 76.2 mm
- Trọng lượng: 701g
- Phụ kiện đi kèm : Eyecub, Pin, Sạc pin, Dây đeo, Nắp body, Cáp USB, Thẻ bảo hành, Hướng dẫn sử dụng

', 1, N'Body_canon_EOS 90D_1.jpg,Body_canon_EOS 90D_2.jpg,Body_canon_EOS 90D_3.jpg,Body_canon_EOS 90D_4.jpg,Body_canon_EOS 90D_5.jpg', 27600000, 1, CAST(N'2018-06-06 00:00:00.000' AS DateTime), CAST(N'2018-06-06 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (3, N'BC003', N'Canon EOS 80D ', NULL, N'Dòng máy ảnh hai số của Canon sau nhiều nghiên cứu và cải tiến đã xuất hiện một sản phẩm mới. Đó là máy ảnh Canon EOS 80D với hệ thống lấy nét tới 45 điểm. Đây cũng là sản phẩm mà hãng muốn hướng tới người dùng nghiệp dư và bán chuyên nghiệp nhằm cạnh tranh trực tiếp với đối thủ D7200 của Nikon.
Canon 80D không có quá nhiều sự thay đổi đáng kể so với phiên bản tiền nhiệm Canon 70D nếu xét về thiết kế. Thân máy được làm từ vật liệu Poly Carbon, vị trí phím được giữ nguyên và màn hình LCD 3 inch hỗ trợ góc xoay rộng. Khả năng chống bụi và ẩm cũng được cải thiện đáng kể.
', N'- Cảm biến CMOS 24.2 megapixel.
- Bộ xử lý hình ảnh DIGIC 6
- ISO 100-16000 ( mở rộng 25600)
- Hệ thống đo nét tiên tiến với 45 điểm
- Màn hình LCD 3.0inch cảm ứng
- Tốc độ màn trập 1/8000 đến 30 giây
- Tốc độ chụp liên tục tối đa 7.0 hình/giây
- Thẻ nhớ tương thích : SD/ SDHC/SDXC
- Quay phim Full HD 60p
- Tích hợp Wifi và NFC
- Trọng lượng  650g
- Sử dụng Pin LP-E6
', 1, N'Body_canon_EOS 80D_1.jpg,Body_canon_EOS 80D_2.jpg,Body_canon_EOS 80D_3.jpg,Body_canon_EOS 80D_4.jpg,Body_canon_EOS 80D_5.jpg', 21500000, 1, CAST(N'2018-04-08 00:00:00.000' AS DateTime), CAST(N'2018-04-08 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (4, N'BC004', N'Canon EOS 800D ', NULL, N'Canon EOS 800D hay còn gọi với cái tên khác là Rebel T7i một DSLR entry-level nhằm mục đích tiếp cận nhiếp ảnh gia muốn một bước lên từ các mô hình cơ bản nhất được công bố vào 02/2017.
Cảm biến : EOS 800D độ phân giải 24.2MP giống như EOS 750D, các cảm biến đã được đại tu, và sử dụng công nghệ tương tự đã thấy trong  EOS 80D. Tính năng cảm biến 24 Megapixel với Dual Pixel CMOS AF cho phép 80% diện tích cảm biến để tăng gấp đôi lên như là các điểm AF phát hiện giai đoạn, hỗ trợ mịn và AF liên tục cho ảnh tĩnh và phim ảnh.
', N'- Cảm biến: CMOS APS-C 24MP
- Chip xử lý: DIGIC 7
- Lấy nét AF: 45 điểm cross-type
- Công nghệ lấy nét Dual Pixel
- Tốc độ chụp liên tục: 6 ảnh/giây
- Tốc độ màn trập: 30s-1/4000s
- Ống ngắm quan học OVF bao phủ 95%, phóng đại 0.82X
- Màn hình LCD cảm ứng xoay lật đa chiều 3 inch
- Thẻ nhớ: SD/SDHC/SDXC (chuẩn UHS-I)
- Pin: LP-E17 (600 tấm)
- Kết nối: Wi-fi, NFC, mini HDMI, USB
', 1, N'Body_canon_EOS 800D_1.jpg,Body_canon_EOS 800D_2.jpg,Body_canon_EOS 800D_3.jpg,Body_canon_EOS 800D_4.jpg,Body_canon_EOS 800D_5.jpg', 12490000, 1, CAST(N'2019-07-17 00:00:00.000' AS DateTime), CAST(N'2019-07-17 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (5, N'BC005', N'Canon POWERSHOT G9 X MARK II ', NULL, N'Thiết kế mạnh mẽ, chắc chắn, đó là những gì mà máy ảnh canon G9 X đem lại ngay cái nhìn đầu tiên. Và cả trong cấu hình thì sự mạnh mẽ cũng được thể hiện qua khả năng chống rung quang học cùng khẩu độ lớn để lấy những hình ảnh ở xa.
Điểm đầu tiên dễ nhận thấy nhất là thân hình mảnh mai, thanh lịch so với các máy cùng loại kích thước 98 x 57,9 x 30,8mm. Điều này để giúp các máy ảnh compact lấy lại vị thế vốn dĩ được nhiều người thay thế bằng việc lựa chọn một chiếc smartphone vì độ mỏng.
', N'- Bộ cảm biến CMOS 20.2 megapixels
- Bộ xử lý hình ảnh Digic 6
- Màn hình 3.0 inch 
- Độ dài tiêu cự 28-84 f/2.0-4.9
- Độ nhạy sáng ISO 125-6400 (mở rộng 12800)
- Tốc độ màn chập 1-30 / 2000 giây
- Tốc độ chụp 6.0 ảnh/giây 
- Quay phim Full HD 24p/25p/30p/50p/60p
- Kết nối Wi-Fi, NFC
- Pin tương thích NB-13L
- Phụ kiện máy ảnh đi kèm: Pin, Sạc pin, Dây đeo, Cataloge, Phiếu bảo hành

', 1, N'Body_canon_POWERSHOT G9 X MARK II_1.jpg,Body_canon_POWERSHOT G9 X MARK II_2.jpg,Body_canon_POWERSHOT G9 X MARK II_3.jpg,Body_canon_POWERSHOT G9 X MARK II_4.jpg,Body_canon_POWERSHOT G9 X MARK II_5.jpg', 10200000, 1, CAST(N'2020-10-02 00:00:00.000' AS DateTime), CAST(N'2020-10-02 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (6, N'BN001', N'Nikon D7200 ', NULL, N'Máy ảnh Nikon D7200 là dòng máy ảnh DSLR tiên tiến nhất trong loạt máy ảnh định dạng DX của Nikon. Nhờ bộ cảm biến CMOS định dạng DX 24.2 MP kết hợp với bộ vi xử lý hình ảnh EXPEED 4 đã giúp cho D7200 tiên phong trong việc đặt ra một chuẩn mực mới về chất lượng hình ảnh. Quay phim Full HD 1080/60p cho chất lượng vượt trội cho định dạng 1.3x và khả năng thu được đối tượng ở xa với kích thước lớn. Cảm biến lấy nét tự động Multi-Cam 3500 II với 51 điểm lấy nét chính xác giúp chụp được hình ảnh sắc nét ngay cả trong điều kiện ánh sáng thấp', N'Bộ cảm biến CMOS  24.2 megapixelBộ xử lý hình ảnh EXPEED 4 
Cảm biến lấy nét tự động Multi-CAM 3500 II
Màn hình 3.2inch (1229K điểm ảnh)
51 điểm lấy nét tự động
ISO100 - 25600
Tốc độ màn chập 30-1 / 8000giây
Tốc độ chụp 7 ảnh/ giây
Quay phim Full HD 1080/60p 
Kết nối  Wi-Fi + NFC
Sử dụng Pin EN-EL15
', 4, N'Body_nikon_D7200_1.jpg,Body_nikon_D7200_2.jpg,Body_nikon_D7200_3.jpg,Body_nikon_D7200_4.jpg,Body_nikon_D7200_5.jpg', 14990000, 2, CAST(N'2017-06-12 00:00:00.000' AS DateTime), CAST(N'2017-06-12 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (7, N'BN002', N'Nikon Z6', NULL, N'Máy ảnh Nikon Z6 + Ngàm chuyển Nikon FTZ
Với model Nikon Z6, Nikon hướng tới đây là một sản phẩm toàn diện với khả năng chụp ảnh tốc độ cao và khả năng xử lý hình ảnh trong môi trường thiếu sáng ấn tượng.
Khung máy được xây dựng bằng hợp kim magiê bền bỉ vừa chống bụi và chịu thời tiết để làm việc trong điều kiện khí hậu khắc nghiệt và điều kiện khắc nghiệt.
Trên cùng của máy ảnh là nút quay chế độ đơn giản, có các chế độ chụp khác nhau. Mặt đồng hồ thậm chí còn có chế độ chụp hoàn toàn tự động sẽ giúp người dùng máy ảnh full-frame đầu tiên bắt đầu. Z6 cũng có thiết lập quay số kép để điều chỉnh khẩu độ và tốc độ cửa trập.


', N'Cảm biến full-frame 25MP 
Trang bị bộ xử lý ảnh EXPEED 6 siêu nhanh
Tốc độ chụp liên tiếp ấn tượng 12 hình/giây
Hệ thống lấy nét tự động AF 273 điểm, ISO 50-204800
Kính ngắm điện tử 0.80x 3.6m-Dot với thấu kính NIKKOR
Màn OLED ma trận điểm 3.2” độ phân giải 2100K điểm ảnh
Khe thẻ nhớ XQD và cổng xuất video HDMI 10 Bit
Quay phim 4K 30fp cùng tích hợp kết nối Wi-Fi, Bluetooth- Ống kính NIKKOR Z 24-70mm f/4 S
Ngàm chuyển Nikon FTZ
', 4, N'Body_nikon_Z6_1.jpg,Body_nikon_Z6_2.jpg,Body_nikon_Z6_3.jpg,Body_nikon_Z6_4.jpg,Body_nikon_Z6_5.jpg', 38490000, 2, CAST(N'2018-06-20 00:00:00.000' AS DateTime), CAST(N'2018-06-20 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (8, N'BN003', N'Nikon D780', NULL, N'Nikon D780 Body
Kết hợp giữa phương thức tiếp cận hình ảnh đương đại với ngoại hình và chức năng truyền thống, Nikon D780 là máy ảnh DSLR linh động vượt trội cả về chụp ảnh và quay phim. Trang bị cảm biến FF CMOS 24.5MP, máy cho phép chụp ảnh và quay phim có độ phân giải cao, với cảm biến trang bị thiết kế BSI nhằm tăng độ trong trẻo và giảm nhiễu hạt, phù hợp chụp trong đa dạng điều kiện ánh sáng. Cảm biến này đồng thời tạo điều kiện cho phạm vi nhạy sáng đạt ISO 100-51200, mở rộng được đến ISO 50-204800, cùng với tốc độ chụp nhanh 7 fps với kính ngắm hoặc 12 fps với live view. Cảm biến này cũng cho phép quay video 4K UHD đến 30 fps sử dụng toàn bộ khung hình hoặc có crop, hoặc quay Full HD đến 120 fps, có hỗ trợ các thiết lập N-Log Gamma và HLG để kiểm soát màu sắc chi tiết.
Làm việc với kính ngắm là hệ thống AF theo pha 51 điểm, gồm 15 điểm chữ thập cho độ chính xác cao trong điều kiện thiếu sáng. Làm việc với live view hoặc quay video là hệ thống Hybrid AF 273 điểm, là sự kết hợp giữa các điểm the pha trên cảm biến và hệ thống theo tương phản, cho hiệu suất nhanh chóng và bám nét xuất sắc, bao gồm hỗ trợ Eye-Detection AF. D780 vẫn thể hiện rõ những điểm tương đồng và truyền thống của một chiếc máy ảnh DSLR, gồm có kính ngắm quang học pentaprism phóng đại 0.7x và màn hình cảm ứng lật 3.2" 2.36 triệu điểm. Máy trang bị 2 khay thẻ nhớ SD UHS-II để lưu trữ linh động và tích hợp Wi-Fi, Bluetooth để kết nối truyền tải file gần hoặc điều khiển máy ảnh từ xa từ thiết bị di động được liên kết.

', N'Cảm biến: CMOS 24.2MP
Bộ xử lý hình ảnh: DIGIC 6
ISO: ISO 100 - ISO 6400
Hệ thống lấy nét: 19 điểm
Chụp ảnh liên tục: tối đa khoảng 5,0 ảnh/giây
Truyền hình ảnh nhanh với kết nối Wifi

', 4, N'Body_nikon_D780_1.jpg,Body_nikon_D780_2.jpg,Body_nikon_D780_3.jpg,Body_nikon_D780_4.jpg,Body_nikon_D780_5.jpg', 56990000, 2, CAST(N'2018-05-10 00:00:00.000' AS DateTime), CAST(N'2018-05-10 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (9, N'BN004', N'Nikon D5600', NULL, N'Giới thiệu Nikon D5600 + AF-P DX 18-55mm VR
 Nikon D5600 + AF-P DX 18-55mm VR thuộc máy ảnh DSLR dòng phổ thông, nó là sản phẩm tiếp nối mẫu Nikon D5500 và được nâng cấp thêm một số tính năng nổi bật như cải tiến dãy nhạy sáng... Máy sở hữu thân hình gọn nhẹ, trang bị bộ cảm biến APS-C CMOS có độ phân giải 24MP và bộ xử lý hình ảnh EXPEED 4. Màn hình máy ảnh Nikon D5600 là màn hình cảm ứng 3.2 inch, đạt 1.037.000 điểm ảnh, màn hình này có thể xoay lật nhiều hướng khác nhau...
Đi kèm thân máy là ống kính AF-P DX 18-55mm F/3.5-5.6G VR. Đây là ống kính đa năng, giảm rung (VR), cho góc chụp rộng đến chụp tele trung bình và được trang bị động cơ lấy nét tự động.
Máy ảnh Nikon D5600 + AF-P DX 18-55mm VR là một trong những lựa chọn khá tuyệt với cho người dùng muốn lưu lại những khoảnh khắc, những hình ảnh đẹp trong cuộc sống đời thường.
 

', N'Cảm biến: CMOS APS-C 25MP
Bộ xử lý hình ảnh: Nikon EXPEED 4
ISO: Auto, 100 - 25.600
Hệ thống lấy nét: 39. Có thể chọn 39 hoặc 11 điểm
Chụp ảnh liên tục: Tối đa khoảng 5 ảnh/giây
', 4, N'Body_nikon_D5600_1.jpg,Body_nikon_D5600_2.jpg,Body_nikon_D5600_3.jpg,Body_nikon_D5600_4.jpg,Body_nikon_D5600_5.jpg', 15390000, 2, CAST(N'2019-07-15 00:00:00.000' AS DateTime), CAST(N'2019-07-15 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (10, N'BN005', N'Nikon D5', NULL, N'Máy ảnh chuyên nghiệp DSLR Nikon D5 Dual XQD Slots/ CF Slots là sản phẩm nối tiếp chiếc Nikon D4 với tốc độ chụp và lấy nét nhanh chóng, chính xác dành cho các nhiếp ảnh gia chuyên nghiệp. Máy được trang bị cảm biến Full Frame CMOS độ phân giải 20.8MP và bộ xử lý hình ảnh EXPEED 5, khả năng ghi hình 4K, mức ISO lớn nhất đạt 102400 (cao hơn nhiều so với mức ISO tối đa của Nikon D4), mở rộng lên tới 3280000. Hơn nữa, hệ thống lấy nét tự động của Nikon D5 được thiết kế lại hoàn toàn mới vối 153 điểm lấy nét, trong đó có 99 điểm lấy nét cross-type với độ chính xác hoàn hảo khi theo dõi các đối tượng di chuyển hay hoạt động trong điều kiện ánh sáng khó khăn. Nikon D5 còn có khe cắm thẻ nhớ XQD đôi cung cấp tính linh hoạt trong việc lưu trữ dư liệu trong quá trình hụp và nhiều lựa chọn kích thước file raw tùy theo nhu cầu của bạn. Chiếc máy ảnh này được thiết kế để chụp hình các đối tượng di chuyển nhanh và xử lý hiệu quả trong điều kiện chụp khó khăn nhất.', N'Cảm biến: BSI-CMOS 1/2.3" độ phân giải 16 MP
Ống kính: Nikkor zoom quang học 5X, 4.3-21.5mm (quy đổi 24-120mm), khẩu độ f/2.8-4.9
Màn hình: 3" độ phân giải 921.000 điểm ảnh
Tốc độ màn trập: 1/4.000 giây
Chụp liên tiếp: tối đa 7 fps
ISO: 125-6.400
Quay phim: 4K/30p, 4K/25p, Full HD 120p/60p/50p/30p/25p, 720p@30p/25p
Đèn trợ sáng: flash xenon + LED
Chống nước độ sâu 30 mét, chống sốc 2,4 mét, hoạt động ở nhiệt độ -10oC
Kết nối: Wi-Fi, Bluetooth, GPS
Giao tiếp: USB 2.0, HDMI
Lưu trữ: 473 MB + thẻ nhớ SD
Pin: EN-EL12 (chụp 280 tấm tiêu chuẩn CIPA)

', 4, N'Body_nikon_D5_1.jpg,Body_nikon_D5_2.jpg,Body_nikon_D5_3.jpg,Body_nikon_D5_4.jpg,Body_nikon_D5_5.jpg', 117000000, 2, CAST(N'2020-01-10 00:00:00.000' AS DateTime), CAST(N'2020-01-10 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (11, N'BS001', N'Sony Cybershot DSC WX350', NULL, N'Máy Ảnh Sony CyberShot DSC WX350 là chiếc máy ảnh nhỏ gọn được trang bị với một khả năng đáng kinh ngạc, chiếc máy ảnh đáp ứng được những yêu cầu cho một chuyến đi du lịch hay đơn giản là những khoảnh khắc hàng ngày.
Với thiết kế nhỏ gọn của một chiếc máy ảnh du lịch, nhưng không kém phần tinh tế, sắc cạnh. Các nút chức năng được sắp xếp một cách khoa học và dể dàng thao tác cho người sử dụng.
', N'- Cảm biến Exmor R CMOS loại 1/2,3
- Độ phân giải 18 Megapixel
- Zoom quang học 20x
- Tốc độ chụp liên tiếp 10 ảnh/giây
- Tính năng 360 Sweep Panorama
- ISO 100-12800
- Tốc độ màn trập 4- 1/1600 giây
- Quay phim Full HD
- Kết nối Wi-Fi, NFC
- Pin tương thích NP-BX1
- Phụ kiện máy ảnh đi kèm: Pin, Adapter, Dây đeo, cáp USB, Cataloge
', 2, N'Body_sony_Cybershot DSC WX350_1.jpg,Body_sony_Cybershot DSC WX350_2.jpg,Body_sony_Cybershot DSC WX350_3.jpg,Body_sony_Cybershot DSC WX350_4.jpg,Body_sony_Cybershot DSC WX350_5.jpg', 5900000, 3, CAST(N'2017-08-07 00:00:00.000' AS DateTime), CAST(N'2017-08-07 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (12, N'BS002', N'Sony Alpha A7R Mark II', NULL, N'Chắc chắn bạn sẽ hài lòng với những gì mà máy ảnh Sony Alpha A7R Mark II mang lại. Độ phân giải rất cao 42.4 MP thích hợp cho những ai thích in ảnh khổ lớn. Còn lại, tính năng Navi Pro sẽ giúp bạn tinh chỉnh các thông số ngay trên màn hình mà không cần tới menu.
Bên trong máy được tích hợp bộ cảm biến CMOS Exmor full-frame với độ phân giải rất cao tới 42,4 MP. Với những ai ham mê thiết kế thì việc tạo ra những bức ảnh khổ lớn mà không lo bị bể nét là quá ư dễ dàng. Bên cạnh đó, hình ảnh được xử lý tốt nhất với bộ vi xử lý hình ảnh mới BIONX X cung cấp xử lý nhanh và tốc độ hoạt động.
', N'- Bộ cảm biến FullFrame Back-illuminated CMOS 42.4 MP
- Chống rung 5 trục trong thân máy
- Màn hình lật 3.0” Clear Photo LCD
- Độ nhạy sáng cao ISO 100 - 102,400
- Chụp liên tục (Burst) 5 tấm/giây 
- Hệ thống đo sáng thông minh DRO
- Quay phim chuẩn 4K không cần thiết bị ngoại vi
- Đa dạng màu sắc với chức năng Picture Effect
- Sử dụng thẻ MS và SD
', 2, N'Body_sony_Alpha A7R Mark II_1.jpg,Body_sony_Alpha A7R Mark II_2.jpg,Body_sony_Alpha A7R Mark II_3.jpg,Body_sony_Alpha A7R Mark II_4.jpg,Body_sony_Alpha A7R Mark II_5.jpg', 40490000, 3, CAST(N'2018-02-12 00:00:00.000' AS DateTime), CAST(N'2018-02-12 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (13, N'BS003', N'Sony Alpha A7M2', NULL, N'Mặt trước đã được làm hoàn toàn từ kim loại và ngàm máy ảnh cũng chắc hơn. Phần báng tay cầm cũng làm lớn hơn để dễ cầm nắm. Khung máy của A7 M2 vẫn dựa trên kiểu dáng của A7 tuy nhiên lớp vỏ ngoài đã được làm bằng chất liệu tốt hơn so với người tiền nhiệm. Khả năng chống bám vân tay và chịu mưa được cải thiện, bổ sung thêm một số bộ phận làm từ hợp kim magnesium hơn.

Việc thao tác sẽ nhanh hơn với sự cải tiến hệ thống điều khiển của máy. A7 M2 có thêm được 1 nút Custom Function (C2) nâng tổng số nút tuỳ chỉnh lên thành 4 nút nhờ đưa nút chụp hình về phần báng tay cầm. Điều này khác hoàn toàn so với các phiên bản trước như A7/A7R/A7S thì nút chụp lại ở cạnh trên. Và nhờ tăng hơn 1 cm bề dày nên máy có tay cầm sâu hơn, giúp người chụp dễ cầm nắm, tự tin hơn khi gắn các ống kính lớn.
', N'- Bộ cảm biến Exmor CMOS 24.3-megapixel full-frame
- Khung ngắm điện tử 
- Màn hình 3.0inch 
- Ổn định hình ảnh 5 trục
- Full frame 35mm: 117 điểm
- ISO 50-25600  (mở rộng 51200)
- Tốc độ màn chập 1/8000 đến 30 giây
- Tốc độ chụp 5.0 ảnh/ giây
- Quay phim Full HD 1920 x 1080/60p 50Mbps
- Tích hợp Wifi, NFC
- Sử dụng Pin NP-FW50

', 2, N'Body_sony_Alpha A7M2_1.jpg,Body_sony_Alpha A7M2_2.jpg,Body_sony_Alpha A7M2_3.jpg,Body_sony_Alpha A7M2_4.jpg,Body_sony_Alpha A7M2_5.jpg', 22900000, 3, CAST(N'2018-11-08 00:00:00.000' AS DateTime), CAST(N'2018-11-08 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (14, N'BS004', N'Sony Alpha A7M2FE', NULL, N'Máy ảnh Sony Alpha A7M2 hỗ trợ chống rung 5 trục
Chúng ta sẽ không còn phải quá bận tâm vấn đề rung lắc với máy ảnh Sony Alpha A7M2. Được trang bị hệ thống chống rung 5 trục tiên tiến nhất, những bức ảnh sẽ sắc nét ngay cả khi bị tác động. Khả năng bắt nét nhanh cũng được ưu tiên cho những ai chuyên trị thể loại ảnh hành động.
 Mặt trước đã được làm hoàn toàn từ kim loại và ngàm máy ảnh cũng chắc hơn. Phần báng tay cầm cũng làm lớn hơn để dễ cầm nắm. Khung máy của A7M2 vẫn dựa trên kiểu dáng của A7 tuy nhiên lớp vỏ ngoài đã được làm bằng chất liệu tốt hơn so với người tiền nhiệm. Khả năng chống bám vân tay và chịu mưa được cải thiện, bổ sung thêm một số bộ phận làm từ hợp kim magnesium hơn.
', N'- Bộ cảm biến Exmor CMOS 24.3-megapixel full-frame
- Khung ngắm điện tử 
- Màn hình 3.0inch 
- Ổn định hình ảnh 5 trục
- Full frame 35mm: 117 điểm
- ISO 50-25600  (mở rộng 51200)
- Tốc độ màn chập 1/8000 đến 30 giây
- Tốc độ chụp 5.0 ảnh/ giây
- Quay phim Full HD 1920 x 1080/60p 50Mbps
- Tích hợp Wifi, NFC
- Sử dụng Pin NP-FW50

', 2, N'Body_sony_Alpha A7M2FE_1.jpg,Body_sony_Alpha A7M2FE_2.jpg,Body_sony_Alpha A7M2FE_3.jpg,Body_sony_Alpha A7M2FE_4.jpg,Body_sony_Alpha A7M2FE_5.jpg', 28690000, 3, CAST(N'2019-07-21 00:00:00.000' AS DateTime), CAST(N'2019-07-21 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (15, N'BS005', N'Sony Alpha A6000', NULL, N'Máy Ảnh Sony Alpha A6000 lấy nét cực nhanh 0.06s
Máy ảnh Sony Alpha A6000 là sự cải tiến vượt bậc của Sony với khoảng thời gian lấy nét chỉ trong 0.06s. Ngoài ra, những hình ảnh với dải màu sâu và độ tương phản mềm mại sẽ được tạo ra liên tục với hơn 600 tấm ảnh chỉ trong một lần sạc pin.
Máy được trang bị bộ cảm biến Exmor APS HD CMOS 24.3MP APS-C và bộ xử lý hình ảnh BIONZ X có độ phân giải cao rất có lợi để chụp những ảnh khổ lớn chuyên dụng cho thiết kế hay những chi tiết dù nhỏ nhất cũng sẽ được ghi lại qua từng điểm ảnh một các rõ nét nhất. Các chip trên ống kính lấp đầy những khoảng trống giữa các điểm ảnh lân cận nhằm phù hợp với khả năng tập trung ánh sáng và độ sắc nét.
', N'- Cảm biến Exmor™ APS HD CMOS 24.3MP có bộ xử lý BIONZ X™
- Độ phân giải 24.3 MP
- Lấy nét tự động Fast Hybrid
- Khung ngắm điện tử 1,0 cm
- Màn hình 3 inch
- ISO 100-25600
- Tốc độ chụp 11 ảnh / giây
- Chia sẻ và kiểm soát đơn giản cùng Wi-Fi® và NFC một chạm
- Phụ kiện đi kèm: Pin NP-FW50, sạc BC-VW1, dây đeo máy, sách HDSD, Cáp USB, đĩa, giấy bảo hành

', 2, N'Body_sony_Alpha A6000_1.jpg,Body_sony_Alpha A6000_2.jpg,Body_sony_Alpha A6000_3.jpg,Body_sony_Alpha A6000_4.jpg,Body_sony_Alpha A6000_5.jpg', 10290000, 3, CAST(N'2020-03-10 00:00:00.000' AS DateTime), CAST(N'2020-03-10 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (16, N'BF001', N'Fujifilm X100F', NULL, N'Máy ảnh Fujifilm X100F vẫn thừa hưởng ngoại hình của đàn anh X100T, đó là sự hồi tưởng về những chiếc máy Rangerfinder nổi tiếng một thời với trọng lượng khá gọn nhẹ mà hiệu quả. Đã có những thay đổi ở phiên bản mới về hệ thống nút tùy chỉnh, đó là việc toàn bộ nút bấm ở mặt sau được chuyển hết sang bên phải màn hình và thêm một nút joystick đễ hỗ trợ thao tác nhanh hơn. Ngoài ra, xòng xoay EV ngoài khoảng -3+3 còn có chế độ C cho phép mở rộng lên mức +/-5 EV.', N'- Cảm biến X-Trans CMOS III 24,3 MP 
- Bộ xử lý hình ảnh: X-Processor Pro
- Ống kính Fujinon 23mm f/2 
- Màn hình LCD 3.0" với 1,040,000 điểm ảnh
- Kính ngắm điện tử và kính ngắm lai quang học
- 91 điểm lấy nét tự động (49 điểm lấy nét theo pha)
- Iso mở rộng 51,200 và chụp liên tiếp 8 hình/giây
- Quay phim Full HD 1080p (24p/25p/30p/50p/60p
', 3, N'Body_fujifilm_X100F_1.jpg,Body_fujifilm_X100F_2.jpg,Body_fujifilm_X100F_3.jpg,Body_fujifilm_X100F_4.jpg,Body_fujifilm_X100F_5.jpg', 26870000, 4, CAST(N'2017-08-07 00:00:00.000' AS DateTime), CAST(N'2017-08-07 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (17, N'BF002', N'Fujifilm XT20', NULL, N'Máy ảnh Fujifilm X-T20 vẫn được trau chuốt theo kiểu thiết kế hoài cổ thường thấy. Xét về ngoại hình thì sản phẩm giống hệt với X-T10 trước đây. Tuy nhiên, lớp vỏ được chế tạo bằng hợp kim magie bền bỉ và chắc chắn hơn. Hệ thống nút bấm bố trí khá hợp lý với các núm xoay điều chỉnh tốc độ, cộng trừ EV và các chế độ ở mặt trên. Mặt sau của máy vẫn là các nút tùy chỉnh thường thấy.', N'- Cảm biến APS-C X-Trans CMOS III 24.3MP
- Bộ xử lý hình ảnh X-Processor Pro
- Ống ngắm điện tử OLED với kích thước 0.39" 2,36MP
- Quay video 4K UHD với thời lượng quay lên đến 10 phút
- Chế độ chụp nhanh liên tục lên đến 5 fps
- Chế độ tùy chỉnh chức năng AF-C với 5 preset AF-C có sẵn
- Chế độ giả lập Film cho cả ảnh chụp và Video
- Chế độ giả lập Film ACROS được thêm mới vào
- Thẻ nhớ SD, SHHC, SDXC, hỗ trợ chuẩn thẻ UHS-II
- Pin NP-W126s như trên X-T2, chụp được 350 tấm
- Kích thước: 118 x 83 x 41 mm
- Khối lượng (bao gồm pin): 383 g
', 3, N'Body_fujifilm_XT20_1.jpg,Body_fujifilm_XT20_2.jpg,Body_fujifilm_XT20_3.jpg,Body_fujifilm_XT20_4.jpg,Body_fujifilm_XT20_5.jpg', 21000000, 4, CAST(N'2018-02-12 00:00:00.000' AS DateTime), CAST(N'2018-02-12 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (18, N'BF003', N'Fujifilm Instax mini', NULL, N'Instax là dòng máy ảnh chụp và in ra ảnh ngay lập tức, mỗi bức ảnh của Instax Mini 70 có kích cỡ tương đương với một cái thẻ ATM, chi phí của mỗi tấm ảnh vào khoảng 1 USD/bức (tiền mua giấy in). Instax Mini 70 sẽ được bán ra vào ngày 23/10 năm nay, máy có các chức năng hẹn giờ chụp tự động, phía trước có gương soi để tự canh khung hình chụp selfie và chức năng tự động điều chỉnh độ sáng để hậu cảnh không bị tối khi chụp ảnh tự sướng.', N'- Loại phim: Color Film "Instax Mini"
- Kích thước file ảnh: 62 x 46 mm
- Kích thước film: 86 x 54 mm
- Tiêu cự: f=60 mm
- Có đèn Flash
', 3, N'Body_fujifilm_Instax mini_1.jpg,Body_fujifilm_Instax mini_2.jpg,Body_fujifilm_Instax mini_3.jpg,Body_fujifilm_Instax mini_4.jpg,Body_fujifilm_Instax mini_5.jpg', 2850000, 4, CAST(N'2018-11-08 00:00:00.000' AS DateTime), CAST(N'2018-11-08 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (19, N'BF004', N'Fujifilm Instax mini 90 neo', NULL, N'Là chiếc máy ảnh dành riêng cho những bạn yêu thích thể loại chụp ảnh lấy liền trong những chuyến du lịch dài ngày đang rất thịnh hành. Máy Ảnh Fujifilm này với thiết kế hoài cổ sẽ giúp bạn có những trải nghiệm thú vị trong những chuyến di của mình, cho phép ảnh chụp được in ra lập tức chỉ sau một vài phút và khô ngay trên tay bạn khi tiếp xúc với không khí.', N'- Kích thước máy: 11.3 x 9.2 x 5.7 cm (W x H x D)
- Trọng lượng: 296g
- Tốc độ chụp: 1/8 - 1/400sec
- Phơi sáng 10sec
- Ống kính Fujinon
- Chế độ flash tự động
- Phạm vi hiệu quả hiệu quả 0.6-3m/ 3m- ∞
- Màn hình LCD: hiển thị chi tiết của chế độ chụp ảnh.
- Pin NP-45
- Bộ sạc BC-45C
', 3, N'Body_fujifilm_Instax mini 90 neo_1.jpg,Body_fujifilm_Instax mini 90 neo_2.jpg,Body_fujifilm_Instax mini 90 neo_3.jpg,Body_fujifilm_Instax mini 90 neo_4.jpg,Body_fujifilm_Instax mini 90 neo_5.jpg', 4300000, 4, CAST(N'2019-07-21 00:00:00.000' AS DateTime), CAST(N'2019-07-21 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (20, N'BF005', N'Fujifilm XE3', NULL, N'Mang lại vẻ thanh lịch với màu bạc và đen cổ điển của máy ảnh fujifilm X-E3 với các thiết kế nút xoay số để điều khiển khẩu độ, tốc độ màn trập và bù phơi sáng và được trang bị cùng một khung ngắm cho phép lựa chọn cảnh chụp. Được thiết kế một cách khoa học cho khả năng dể dàng thao tác khi điều chỉnh thống số.
 
Các nút chức năng ở mặt sau cũng đã được bố trí lại nhằm hỗ trợ thao tác nhanh hơn và thuận tiện hơn. Việc bỏ đi nút điều hướng 4 cạnh như ở X-E2s để thay bằng một nút joystick nhỏ gọn giúp ta cảm thấy màn hình to hơn đôi chút và mặt sau gọn hơn. Điểm đáng chú ý là nút joystick có thể được sử dụng để điều chỉnh điểm lấy nét ngay cả khi đang theo dõi đối tượng qua ống ngắm EVF. Đó là nhờ tính năng Focus Lever đã từng xuất hiện trên X-Pro2
', N'- Cảm biến 24.3MP APS-C X-Trans CMOS III
- Bộ xử lý hình ảnh X-Processor Pro
- Màn hình cảm ứng TFT LCD 3" 1.04 triệu điểm ảnh
- Ống ngắm điện tử OLED kích thước 0.77" 2,36MP
- ISO 51200, tốc độ chụp 8fps
- Khả năng quay video 4K UHD
- Khả năng kết nối wifi
- Hệ thống lấy nét AF 325 điểm
- Body kháng nước, bụi bẩn
- Tương thích thẻ nhớ SD, SHHC, SDXC, UHS-II

', 3, N'Body_fujifilm_XE3_1.jpg,Body_fujifilm_XE3_2.jpg,Body_fujifilm_XE3_3.jpg,Body_fujifilm_XE3_4.jpg,Body_fujifilm_XE3_5.jpg', 20990000, 4, CAST(N'2020-03-10 00:00:00.000' AS DateTime), CAST(N'2020-03-10 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (21, N'LC001', N'Lens canon 50mm f/1.8 STM', NULL, NULL, NULL, 1, N'Lens_canon_50mm f18 STM_1.jpg,Lens_canon_50mm f18 STM_2.jpg,Lens_canon_50mm f18 STM_3.jpg,Lens_canon_50mm f18 STM_4.jpg,Lens_canon_50mm f18 STM_5.jpg', 2390000, 5, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (22, N'LC002', N'Lens canon RF 70-200mm f/2.8L IS USM', NULL, NULL, NULL, 1, N'Lens_canon_RF 70 200mm f28L IS USM_1.jpg,Lens_canon_RF 70 200mm f28L IS USM_2.jpg,Lens_canon_RF 70 200mm f28L IS USM_3.jpg,Lens_canon_RF 70 200mm f28L IS USM_4.jpg,Lens_canon_RF 70 200mm f28L IS USM_5.jpg', 52790000, 5, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (23, N'LC003', N'Lens canon RF 24-240mm F4-6.3 IS USM', NULL, NULL, NULL, 1, N'Lens_canon_RF 24 240mm F4 63 IS USM_1.jpg,Lens_canon_RF 24 240mm F4 63 IS USM_2.jpg,Lens_canon_RF 24 240mm F4 63 IS USM_3.jpg,Lens_canon_RF 24 240mm F4 63 IS USM_4.jpg,Lens_canon_RF 24 240mm F4 63 IS USM_5.jpg', 15490000, 5, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (24, N'LC004', N'Lens canon EF 70-200mm f/2.8L IS III USM', NULL, NULL, NULL, 1, N'Lens_canon_EF 70 200mm f28L IS III USM_1.jpg,Lens_canon_EF 70 200mm f28L IS III USM_2.jpg,Lens_canon_EF 70 200mm f28L IS III USM_3.jpg,Lens_canon_EF 70 200mm f28L IS III USM_4.jpg,Lens_canon_EF 70 200mm f28L IS III USM_5.jpg', 3649000, 5, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (25, N'LC005', N'Lens canon EF 85mm f/1.4L IS USM', NULL, NULL, NULL, 1, N'Lens_canon_EF 85mm f14L IS USM_1.jpg,Lens_canon_EF 85mm f14L IS USM_2.jpg,Lens_canon_EF 85mm f14L IS USM_3.jpg,Lens_canon_EF 85mm f14L IS USM_4.jpg,Lens_canon_EF 85mm f14L IS USM_5.jpg', 26990000, 5, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (26, N'LN001', N'Lens nikon AF-S 24-120mm F/4G ED VR Nano', NULL, NULL, NULL, 4, N'Lens_nikon_AF S 24 120mm F4G ED VR Nano_1.jpg,Lens_nikon_AF S 24 120mm F4G ED VR Nano_2.jpg,Lens_nikon_AF S 24 120mm F4G ED VR Nano_3.jpg,Lens_nikon_AF S 24 120mm F4G ED VR Nano_4.jpg,Lens_nikon_AF S 24 120mm F4G ED VR Nano_5.jpg', 11990000, 7, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (27, N'LN002', N'Lens nikon 70-300mm VR AFP f/4.5-6.3 DX ED', NULL, NULL, NULL, 4, N'Lens_nikon_70 300mm VR AFP f45 63 DX ED_1.jpg,Lens_nikon_70 300mm VR AFP f45 63 DX ED_2.jpg,Lens_nikon_70 300mm VR AFP f45 63 DX ED_3.jpg,Lens_nikon_70 300mm VR AFP f45 63 DX ED_4.jpg,Lens_nikon_70 300mm VR AFP f45 63 DX ED_5.jpg', 4690000, 7, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (28, N'LN003', N'Lens nikon 50mm F1.8 D', NULL, NULL, NULL, 4, N'Lens_nikon_50mm F18 D_1.jpg,Lens_nikon_50mm F18 D_2.jpg,Lens_nikon_50mm F18 D_3.jpg,Lens_nikon_50mm F18 D_4.jpg,Lens_nikon_50mm F18 D_5.jpg', 2390000, 7, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (29, N'LN004', N'Lens nikon 50mm F1.8G', NULL, NULL, NULL, 4, N'Lens_nikon_50mm F18G_1.jpg,Lens_nikon_50mm F18G_2.jpg,Lens_nikon_50mm F18G_3.jpg,Lens_nikon_50mm F18G_4.jpg,Lens_nikon_50mm F18G_5.jpg', 4190000, 7, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (30, N'LN005', N'Lens nikon AF-S Nikkor 85mm f/1.8 G', NULL, NULL, NULL, 4, N'Lens_nikon_AF S Nikkor 85mm f18 G_1.jpg,Lens_nikon_AF S Nikkor 85mm f18 G_2.jpg,Lens_nikon_AF S Nikkor 85mm f18 G_3.jpg,Lens_nikon_AF S Nikkor 85mm f18 G_4.jpg,Lens_nikon_AF S Nikkor 85mm f18 G_5.jpg', 8990000, 7, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (31, N'LF001', N'Lens fujiflilm XF 18mm F/2', NULL, NULL, NULL, 3, N'Lens_fujifilm_XF 18mm F2_1.jpg,Lens_fujifilm_XF 18mm F2_2.jpg,Lens_fujifilm_XF 18mm F2_3.jpg,Lens_fujifilm_XF 18mm F2_4.jpg,Lens_fujifilm_XF 18mm F2_5.jpg', 5490000, 8, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (32, N'LF002', N'Lens fujiflilm XF 8-16mm f/2.8 R LM WR', NULL, NULL, NULL, 3, N'Lens_fujifilm_XF 8 16mm f28 R LM WR_1.jpg,Lens_fujifilm_XF 8 16mm f28 R LM WR_2.jpg,Lens_fujifilm_XF 8 16mm f28 R LM WR_3.jpg,Lens_fujifilm_XF 8 16mm f28 R LM WR_4.jpg,Lens_fujifilm_XF 8 16mm f28 R LM WR_5.jpg', 35030400, 8, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (33, N'LF003', N'Lens fujiflilm XF 100-400mm f/4.5-5.6 R LM OIS WR', NULL, NULL, NULL, 3, N'Lens_fujifilm_XF 100 400mm f45 56 R LM OIS WR_1.jpg,Lens_fujifilm_XF 100 400mm f45 56 R LM OIS WR_2.jpg,Lens_fujifilm_XF 100 400mm f45 56 R LM OIS WR_3.jpg,Lens_fujifilm_XF 100 400mm f45 56 R LM OIS WR_4.jpg,Lens_fujifilm_XF 100 400mm f45 56 R LM OIS WR_5.jpg', 30998400, 8, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (34, N'LF004', N'Lens fujiflilm GF 50mm f/3.5 R LM WR', NULL, NULL, NULL, 3, N'Lens_fujifilm_GF 50mm f35 R LM WR_1.jpg,Lens_fujifilm_GF 50mm f35 R LM WR_2.jpg,Lens_fujifilm_GF 50mm f35 R LM WR_3.jpg,Lens_fujifilm_GF 50mm f35 R LM WR_4.jpg,Lens_fujifilm_GF 50mm f35 R LM WR_5.jpg', 14990000, 8, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (35, N'LF005', N'Lens fujiflilm XF 16-55mm f/2.8 R LM WR', NULL, NULL, NULL, 3, N'Lens_fujifilm_XF 16 55mm f28 R LM WR_1.jpg,Lens_fujifilm_XF 16 55mm f28 R LM WR_2.jpg,Lens_fujifilm_XF 16 55mm f28 R LM WR_3.jpg,Lens_fujifilm_XF 16 55mm f28 R LM WR_4.jpg,Lens_fujifilm_XF 16 55mm f28 R LM WR_5.jpg', 18480000, 8, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (36, N'LS001', N'Lens sony FE 100-400mm f/4.5-5.6 GM OSS', NULL, NULL, NULL, 2, N'Lens_sony_FE 100 400mm f45 56 GM OSS_1.jpg,Lens_sony_FE 100 400mm f45 56 GM OSS_2.jpg,Lens_sony_FE 100 400mm f45 56 GM OSS_3.jpg,Lens_sony_FE 100 400mm f45 56 GM OSS_4.jpg,Lens_sony_FE 100 400mm f45 56 GM OSS_5.jpg', 57100000, 6, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (37, N'LS002', N'Lens sony FE 24-70mm f/2.8 GM', NULL, NULL, NULL, 2, N'Lens_sony_FE 24 70mm f28 GM_1.jpg,Lens_sony_FE 24 70mm f28 GM_2.jpg,Lens_sony_FE 24 70mm f28 GM_3.jpg,Lens_sony_FE 24 70mm f28 GM_4.jpg,Lens_sony_FE 24 70mm f28 GM_5.jpg', 43990000, 6, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (38, N'LS003', N'Lens sony FE 70-200mm F4 G', NULL, NULL, NULL, 2, N'Lens_sony_FE 70 200mm F4 G_1.jpg,Lens_sony_FE 70 200mm F4 G_2.jpg,Lens_sony_FE 70 200mm F4 G_3.jpg,Lens_sony_FE 70 200mm F4 G_4.jpg,Lens_sony_FE 70 200mm F4 G_5.jpg', 29490000, 6, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (39, N'LS004', N'Lens sony FE 16-35mm f/2.8 GM', NULL, NULL, NULL, 2, N'Lens_sony_FE 16 35mm f28 GM_1.jpg,Lens_sony_FE 16 35mm f28 GM_2.jpg,Lens_sony_FE 16 35mm f28 GM_3.jpg,Lens_sony_FE 16 35mm f28 GM_4.jpg,Lens_sony_FE 16 35mm f28 GM_5.jpg', 52490000, 6, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[HangHoa] ([ID], [MaSo], [Ten], [DonViTinh], [MoTa], [ThongSoKyThuat], [ThuongHieuID], [TenHinh], [GiaBan], [LoaiID], [NgayTao], [NgayCapNhat]) VALUES (40, N'LS005', N'Lens sony FE 85mm f/1.4 GM', NULL, NULL, NULL, 2, N'Lens_sony_FE 85mm f14 GM_1.jpg,Lens_sony_FE 85mm f14 GM_2.jpg,Lens_sony_FE 85mm f14 GM_3.jpg,Lens_sony_FE 85mm f14 GM_4.jpg,Lens_sony_FE 85mm f14 GM_5.jpg', 34900000, 6, CAST(N'2019-06-19 00:00:00.000' AS DateTime), CAST(N'2019-06-19 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[HangHoa] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([ID], [NgayDatHang], [HoTenKhach], [DiaChi], [DienThoai], [Email], [TongTien]) VALUES (5, CAST(N'2020-07-02 08:32:31.047' AS DateTime), N'Lê Duy Long', N'Số 8 Phan Sào Nam,P.11,Q.Tân Bình,TP Hồ Chí Minh', N'0901373240', N'longduy09102@gmail.com', 20580000)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
INSERT [dbo].[HoaDonChiTiet] ([HoaDonID], [HangHoaID], [SoLuong], [DonGia], [ThanhTien]) VALUES (5, 15, 2, 10290000, 20580000)
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([ID], [MaSo], [Ten], [ChungLoaiID]) VALUES (1, N'BCanon', N'Body Canon', 1)
INSERT [dbo].[Loai] ([ID], [MaSo], [Ten], [ChungLoaiID]) VALUES (2, N'BNikon', N'Body Nikon', 1)
INSERT [dbo].[Loai] ([ID], [MaSo], [Ten], [ChungLoaiID]) VALUES (3, N'BSony', N'Body Sony', 1)
INSERT [dbo].[Loai] ([ID], [MaSo], [Ten], [ChungLoaiID]) VALUES (4, N'BFujifilm', N'Body Fujifilm', 1)
INSERT [dbo].[Loai] ([ID], [MaSo], [Ten], [ChungLoaiID]) VALUES (5, N'LCanon', N'Lens Canon', 2)
INSERT [dbo].[Loai] ([ID], [MaSo], [Ten], [ChungLoaiID]) VALUES (6, N'LSony', N'Lens Sony', 2)
INSERT [dbo].[Loai] ([ID], [MaSo], [Ten], [ChungLoaiID]) VALUES (7, N'LNikon', N'Lens Nikon', 2)
INSERT [dbo].[Loai] ([ID], [MaSo], [Ten], [ChungLoaiID]) VALUES (8, N'LFujifilm', N'Lens Fujifilm', 2)
SET IDENTITY_INSERT [dbo].[Loai] OFF
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([ID], [Ten], [MoTa], [TenHinh]) VALUES (1, N'Canon', NULL, N'canon_1.jpg')
INSERT [dbo].[ThuongHieu] ([ID], [Ten], [MoTa], [TenHinh]) VALUES (2, N'Sony', NULL, N'sony_1.jpg')
INSERT [dbo].[ThuongHieu] ([ID], [Ten], [MoTa], [TenHinh]) VALUES (3, N'Fujifilm', NULL, N'fujifilm_1.jpg')
INSERT [dbo].[ThuongHieu] ([ID], [Ten], [MoTa], [TenHinh]) VALUES (4, N'Nikon', NULL, N'nikon_1.jpg')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_Loai] FOREIGN KEY([LoaiID])
REFERENCES [dbo].[Loai] ([ID])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_Loai]
GO
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_ThuongHieu] FOREIGN KEY([ThuongHieuID])
REFERENCES [dbo].[ThuongHieu] ([ID])
GO
ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_ThuongHieu]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_HangHoa] FOREIGN KEY([HangHoaID])
REFERENCES [dbo].[HangHoa] ([ID])
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_HangHoa]
GO
ALTER TABLE [dbo].[HoaDonChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_HoaDonChiTiet_HoaDon1] FOREIGN KEY([HoaDonID])
REFERENCES [dbo].[HoaDon] ([ID])
GO
ALTER TABLE [dbo].[HoaDonChiTiet] CHECK CONSTRAINT [FK_HoaDonChiTiet_HoaDon1]
GO
ALTER TABLE [dbo].[Loai]  WITH CHECK ADD  CONSTRAINT [FK_Loai_ChungLoai] FOREIGN KEY([ChungLoaiID])
REFERENCES [dbo].[ChungLoai] ([Id])
GO
ALTER TABLE [dbo].[Loai] CHECK CONSTRAINT [FK_Loai_ChungLoai]
GO
USE [master]
GO
ALTER DATABASE [QLBHMA] SET  READ_WRITE 
GO
