
USE master
GO

DROP DATABASE QLBANDT
GO



create database QLBANDT
GO

use QLBANDT
go

CREATE TABLE Users
(
  MaUser INT IDENTITY (1,1)NOT NULL,
  TenUser NVARCHAR(20) NOT NULL,
  sdt nvarchar(11) NOT NULL,
  email VARCHAR(100)  NULL,
  DiaChi NVARCHAR(100)  NULL,
  NgaySinh DATE  NULL,
  TK VARCHAR(20) NOT NULL,
  Pass VARCHAR(20) NOT NULL,
  Roleuser NVARCHAR(10) NULL,
  Hinh VARCHAR(MAX)  NULL,
  PRIMARY KEY (MaUser)
);


CREATE TABLE DonHang
(
  MaDH INT IDENTITY (1,1) NOT NULL,
  NgayDH DATE NOT NULL,
  NguoiNhan NVARCHAR(50) NOT NULL,
  DiaChiNhan NVARCHAR(50) NOT NULL,
  HTthanhtoan NVARCHAR(50)  NULL,
  NgayGH DATE  NULL,
  Trigia INT  NULL,
  Sodienthoainhan nvarchar(11) NOT NULL,
  MaUser INT  NULL,
  PRIMARY KEY (MaDH),
  FOREIGN KEY (MaUser) REFERENCES Users(MaUser)
);


CREATE TABLE PhanLoai
(
  Tenloai NVARCHAR(20) NOT NULL,
  MaLoai INT NOT NULL,
  PRIMARY KEY (MaLoai)
);

CREATE TABLE Mau
(
  Tenmau NVARCHAR(20) NOT NULL,
  Mamau INT NOT NULL,
  PRIMARY KEY (Mamau)
);

CREATE TABLE SanPham
(
  MaSP INT NOT NULL,
  TenSP NVARCHAR(MAX)  NULL,
  GiaSp int,
  GiaGiam int NULL,
  SoLuong int Not Null,
  Hinh1 NVARCHAR(MAX)  NULL,
  Hinh2 NVARCHAR(MAX)  NULL,
  Hinh3 NVARCHAR(MAX)  NULL,
  Hinh4 NVARCHAR(MAX)  NULL,
  Hinh5 Nvarchar(Max) NULL,
  Mota  NVARCHAR(MAX) NULL,
  Thongso NVARCHAR(MAX)  NULL,
  MaLoai INT NOT NULL,
  PRIMARY KEY (MaSP),
  FOREIGN KEY (MaLoai) REFERENCES PhanLoai(MaLoai)
);
 CREATE TABLE ChiTietDH
(
  Soluong INT NOT NULL,
  Dongia INT NOT NULL,
  ThanhTien INT NOT NULL,
  MaDH INT NOT NULL,
  MaSP INT NOT NULL,
  FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH),
  FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

CREATE TABLE YeuThich
(
  MaYT INT NOT NULL,
  MaSP INT NOT NULL,
  MaUser INT NOT NULL,
  PRIMARY KEY (MaYT),
  FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
  FOREIGN KEY (MaUser) REFERENCES Users(MaUser)
);

CREATE TABLE Vourcher
(
  MaKM INT NOT NULL,
  Uudai INT  NULL,
  ThongTinUuDai NVARCHAR(MAX) NULL,
  MaSP INT NOT NULL,
  PRIMARY KEY (MaKM),
  FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

CREATE TABLE Mau_sp
(
  Mamau INT NOT NULL,
  MaSP INT NOT NULL,
  PRIMARY KEY (Mamau, MaSP),
  FOREIGN KEY (Mamau) REFERENCES Mau(Mamau),
  FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

Create table Orders
(
	MaOr int Identity(1,1) Not Null,
	DateOr date,
	SDT nvarchar(11),
	TenNgNhan Nvarchar(30),
	DiaChiNhan nvarchar(30),
	Primary key (MaOr)
)
Create table OrdersDetail
(
	MaOrD int identity (1,1) Not Null,
	SoLuong int null,
	ThanhTien int null,
	MaSP int null,
	MaOr int null,
	Primary key (MaOrD),
	Foreign key (MaSP) References SanPham(MaSP),
	Foreign key (MaOr) References Orders(MaOr),
)



INSERT INTO KhachHang (MaKH, TenKH, sdt, email, DiaChi, NgaySinh, TK, Pass,Roleuser, Hinh)
VALUES
(1, 'Nguyen Van A', 123456789, 'nguyenvana@email.com', '123 Street, City', '2000-01-01', 'username1', 'password1','NhanVien', 'hinh1.jpg'),
(2, 'Tran Thi B', 987654321, 'tranthib@email.com', '456 Street, Town', '1995-05-05', 'username2', 'password2',null, 'hinh2.jpg');

INSERT INTO DonHang (MaDH, NgayDH, NguoiNhan, DiaChiNhan, HTthanhtoan, NgayGH, Trigia, Sodienthoainhan, MaKH)
VALUES
(1, '2023-09-24', 1, '789 Avenue, Village', N'Thanh toán khi nhận hàng', '2023-09-25', 500000, 987654321, 1),
(2, '2023-09-25', 2, '1010 Road, Suburb', N'Thanh toán qua ví điện tử', '2023-09-26', 700000, 123456789, 2);
 
INSERT INTO PhanLoai (Tenloai, MaLoai)
VALUES
('Iphone', 1),
('SamSung', 2),
('OPPO', 3);

INSERT INTO Mau (Tenmau, Mamau)
VALUES
('Đen', 1);


INSERT INTO SanPham (MaSP, TenSP, GiaSp, GiaGiam, SoLuong, Hinh1, Hinh2, Hinh3, Hinh4, Hinh5, Mota, Thongso, MaLoai)
VALUES
--(1, N'Iphone 14 promax', 22000000,'',30,'iphone-14-pro-max-den.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','', N'Mô tả sản phẩm 1', N'Thông số sản phẩm 1', 1),
--(2, N'SamSung Galaxy S23+ 5G', 19000000,'',30,'sumsungs23.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Mô tả sản phẩm 2', N'Thông số sản phẩm 1', 2),
--(3, N'OPPO Reno10 Pro 5G', 14000000,'',30,'oppo-renon10-pro.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Mô tả sản phẩm 3', N'Thông số sản phẩm 1', 3);

(11, N'Iphone 11 ', 9000000,'',30,'ip11_9_do.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','hinh5.jpg', N'IPhone 11 là mẫu iPhone tầm trung nổi bật của Apple năm 2019. Màn hình 6,1 inch độ phân giải 1792x828 pixel, cho hình ảnh sắc nét. Hệ điều hành iOS 13, giao diện ổn định, bảo mật. Chip A13 Bionic mạnh mẽ, hiệu năng làm việc mượt mà. Hệ thống 2 camera kép 12MP hỗ trợ chụp rộng và chân dung chất lượng. Camera selfie 12MP TrueDepth. Pin 3110mAh cho thời lượng cả ngày sử dụng. Thiết kế chắc chắn, chống nước bụi tốt. Dung lượng 64GB, giá cả phải chăng.', N'64GB', 1),
(12, N'Iphone 11', 9000000,'',30,'ip11_9_vang.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','', N'IPhone 11 là mẫu iPhone tầm trung nổi bật của Apple năm 2019. Màn hình 6,1 inch độ phân giải 1792x828 pixel, cho hình ảnh sắc nét. Hệ điều hành iOS 13, giao diện ổn định, bảo mật. Chip A13 Bionic mạnh mẽ, hiệu năng làm việc mượt mà. Hệ thống 2 camera kép 12MP hỗ trợ chụp rộng và chân dung chất lượng. Camera selfie 12MP TrueDepth. Pin 3110mAh cho thời lượng cả ngày sử dụng. Thiết kế chắc chắn, chống nước bụi tốt. Dung lượng 64GB, giá cả phải chăng.', N'64GB', 1),
(13, N'Iphone 11', 12000000,'',30,'ip11_12_timnhat.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','', N'IPhone 11 là mẫu iPhone tầm trung nổi bật của Apple năm 2019. Màn hình 6,1 inch độ phân giải 1792x828 pixel, cho hình ảnh sắc nét. Hệ điều hành iOS 13, giao diện ổn định, bảo mật. Chip A13 Bionic mạnh mẽ, hiệu năng làm việc mượt mà. Hệ thống 2 camera kép 12MP hỗ trợ chụp rộng và chân dung chất lượng. Camera selfie 12MP TrueDepth. Pin 3110mAh cho thời lượng cả ngày sử dụng. Thiết kế chắc chắn, chống nước bụi tốt. Dung lượng 64GB, giá cả phải chăng.', N'64GB', 1),
(14, N'Iphone 12', 22000000,'',30,' ip12_12_xanhdam.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','', N'Màn hình: OLED 6,1 inch, 2532 x 1170 pixel, HDR10. Hệ điều hành: iOS 14.Chip xử lý: Apple A14 Bionic. RAM: 4GB. Bộ nhớ trong: 64GB. Camera sau: 2 camera, chính 12MP & góc siêu rộng 12MP. Camera trước: 12MP. Kết nối: 5G, LTE, Wi-Fi 6, Bluetooth 5.0, NFC, Ultra Wideband. Pin: 2815 mAh, sạc nhanh 20W. Nút Home: Cảm ứng. Kích thước: 146,7 x 71,5 x 7,4 mm. Trọng lượng: 164g.', N'64GB', 1),
(15, N'Iphone 12', 20000000,'',30,' ip12_10390_xanh.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','', N'Màn hình: OLED 6,1 inch, 2532 x 1170 pixel, HDR10. Hệ điều hành: iOS 14.Chip xử lý: Apple A14 Bionic. RAM: 4GB. Bộ nhớ trong: 64GB. Camera sau: 2 camera, chính 12MP & góc siêu rộng 12MP. Camera trước: 12MP. Kết nối: 5G, LTE, Wi-Fi 6, Bluetooth 5.0, NFC, Ultra Wideband. Pin: 2815 mAh, sạc nhanh 20W. Nút Home: Cảm ứng. Kích thước: 146,7 x 71,5 x 7,4 mm. Trọng lượng: 164g.', N'64GB', 1),
(16, N'Iphone 12', 17000000,'',30,' ip12_16890_tim.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','', N'Màn hình: OLED 6,1 inch, 2532 x 1170 pixel, HDR10. Hệ điều hành: iOS 14.Chip xử lý: Apple A14 Bionic. RAM: 4GB. Bộ nhớ trong: 64GB. Camera sau: 2 camera, chính 12MP & góc siêu rộng 12MP. Camera trước: 12MP. Kết nối: 5G, LTE, Wi-Fi 6, Bluetooth 5.0, NFC, Ultra Wideband. Pin: 2815 mAh, sạc nhanh 20W. Nút Home: Cảm ứng. Kích thước: 146,7 x 71,5 x 7,4 mm. Trọng lượng: 164g.', N'64GB', 1),
(17, N'Iphone 14 Plus', 25000000,'',30,'ip14plus_25_"xanhden.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','', N'Hệ điều hành: iOS 16. Chip xử lý: Apple A15 Bionic 5nm. RAM: 6GB. Bộ nhớ trong: 128GB, 256GB, 512GB. Camera sau: Chính 12MP, góc siêu rộng 12MP. Camera trước: 12MP TrueDepth. SIM: 1 eSIM và 1 nano SIM. Kết nối: 5G, LTE, Wi-Fi 6, Bluetooth 5.3, NFC, Ultra Wideband. Pin: 4323 mAh, sạc 20W. Face ID. Kích thước: 160,8 x 78,1 x 7,8 mm. Trọng lượng: 203g.', N'128GB', 1),
(18, N'Iphone 14 Pro', 24190000,'',30,'ip14pro_2419_vang.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','', N'Hệ điều hành: iOS 16. Chip: Apple A16 Bionic 6 nhân. RAM: 6GB. Bộ nhớ trong: 128GB. Camera sau: Chính 48MP, góc siêu rộng 12MP, tele 12MP. Camera trước: 12MP TrueDepth. SIM: 1 eSIM và 1 nano SIM. Kết nối: 5G, Wi-Fi 6, Bluetooth 5.3, NFC, UWB. Pin: 3200 mAh, sạc nhanh 20W. Face ID. Kích thước: 147,5 x 71,5 x 7,85 mm. Trọng lượng: 206g.', N'128GB', 1),
(19, N'Iphone 15', 28000000,'',30,'ip15_23_den.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','', N'Màn hình: OLED 6,1 inch hay 6,7 inch tùy phiên bản, tần số quét 120Hz. Chip xử lý: Apple A17 Bionic (tai thế hệ tiếp theo của Apple A16 hiện tại). RAM: 6GB hoặc 8GB. Bộ nhớ trong: 128GB. Hệ điều hành: iOS 17. Camera sau: Chính 48MP, góc siêu rộng 12MP và zoom optical 3x. Camera selfie: 12MP TrueDepth. Pin: Dung lượng lớn hơn iPhone 14, có thể hỗ trợ sạc nhanh hơn. Kết nối: 5G, Wi-Fi 7, Bluetooth 5.3, Ultra Wideband.', N'128GB', 1),
(10, N'Iphone 15', 28000000,'',30,'ip15promax_33_Xam.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','', N'Màn hình: OLED 6,1 inch hay 6,7 inch tùy phiên bản, tần số quét 120Hz. Chip xử lý: Apple A17 Bionic (tai thế hệ tiếp theo của Apple A16 hiện tại). RAM: 6GB hoặc 8GB. Bộ nhớ trong: 128GB. Hệ điều hành: iOS 17. Camera sau: Chính 48MP, góc siêu rộng 12MP và zoom optical 3x. Camera selfie: 12MP TrueDepth. Pin: Dung lượng lớn hơn iPhone 14, có thể hỗ trợ sạc nhanh hơn. Kết nối: 5G, Wi-Fi 7, Bluetooth 5.3, Ultra Wideband.', N'128GB', 1),

(21, N'SamSung Galaxy S22', 16000000,'',30,' ssgalaxy_17_den.png ', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED 2X, 6,1 inch, 1080 x 2340 pixels. Hệ điều hành: Android 12, One UI 4.1. CPU: Exynos 2200 8 nhân hoặc Snapdragon 8 Gen 1. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 50MP, góc rộng 12MP, tele 3x 10MP. Camera trước: 10MP. Pin: 3700mAh, hỗ trợ sạc nhanh 25W. Kết nối: 5G, LTE, Wi-Fi 6E, Bluetooth 5.2, GPS, NFC. Thân máy: Nhôm, kính cường lực, chống bụi, nước chuẩn IP68. Kích thước: 146 x 70,6 x 7,6 mm. Trọng lượng: 167 gam.', N'128GB', 2),
(22, N'SamSung Galaxy Note10', 24000000,'',30,'ssgalaxynote10_5_den.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED, 6.3 inch, FHD+ 2280 x 1080 pixels. Hệ điều hành: Android 9, giao diện One UI. CPU: Exynos 9825 8 nhân. RAM: 8GB. Bộ nhớ trong: 256GB. Ổ cứng: Không hỗ trợ thẻ nhớ. Camera sau: Chính 12MP, góc rộng 16MP, tele 12MP. Camera trước: 10MP. Pin: 3500mAh, sạc nhanh 25W. Các tính năng: Stylus S Pen, định vị 3D, sạc không dây. Kích thước: 151 x 71.8 x 7.9 mm. Trọng lượng: 168 gam', N'256GB', 2),
(23, N'SamSung Galaxy Note10', 24000000,'',30,'ssgalaxynote10_5_xanh.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED, 6.3 inch, FHD+ 2280 x 1080 pixels. Hệ điều hành: Android 9, giao diện One UI. CPU: Exynos 9825 8 nhân. RAM: 8GB. Bộ nhớ trong: 256GB. Ổ cứng: Không hỗ trợ thẻ nhớ. Camera sau: Chính 12MP, góc rộng 16MP, tele 12MP. Camera trước: 10MP. Pin: 3500mAh, sạc nhanh 25W. Các tính năng: Stylus S Pen, định vị 3D, sạc không dây. Kích thước: 151 x 71.8 x 7.9 mm. Trọng lượng: 168 gam', N'256GB', 2),
(24, N'SamSung Galaxy S20 4G', 20000000,'',30,'sss20_5tr5_hong.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED 2X, 6.2 inch, Quad HD+ 3200 x 1440 pixel. Hệ điều hành: Android 10. Chip xử lý: Exynos 990 8 nhân hoặc Snapdragon 865. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 12MP, góc siêu rộng 12MP, tele 64MP. Camera selfie: 10MP. Pin: 4000 mAh, hỗ trợ sạc nhanh 25W, sạc không dây 10W. Kết nối: 5G, LTE, Wi-Fi, Bluetooth 5, GPS, USB Type-C. Kích thước: 151.7 x 69.1 x 7.9mm. Trọng lượng: 163g', N'128GB', 2),
(25, N'SamSung Galaxy S20 4G', 20000000,'',30,'sss20_5tr5_trang.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED 2X, 6.2 inch, Quad HD+ 3200 x 1440 pixel. Hệ điều hành: Android 10. Chip xử lý: Exynos 990 8 nhân hoặc Snapdragon 865. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 12MP, góc siêu rộng 12MP, tele 64MP. Camera selfie: 10MP. Pin: 4000 mAh, hỗ trợ sạc nhanh 25W, sạc không dây 10W. Kết nối: 5G, LTE, Wi-Fi, Bluetooth 5, GPS, USB Type-C. Kích thước: 151.7 x 69.1 x 7.9mm. Trọng lượng: 163g', N'128GB', 2),
(26, N'SamSung Galaxy S20 4G', 20000000,'',30,'sss20_5tr5_xanhduong.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED 2X, 6.2 inch, Quad HD+ 3200 x 1440 pixel. Hệ điều hành: Android 10. Chip xử lý: Exynos 990 8 nhân hoặc Snapdragon 865. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 12MP, góc siêu rộng 12MP, tele 64MP. Camera selfie: 10MP. Pin: 4000 mAh, hỗ trợ sạc nhanh 25W, sạc không dây 10W. Kết nối: 5G, LTE, Wi-Fi, Bluetooth 5, GPS, USB Type-C. Kích thước: 151.7 x 69.1 x 7.9mm. Trọng lượng: 163g', N'128GB', 2),
(27, N'SamSung Galaxy S23 Ultra', 32000000,'',30,'sss22ultra_15_den.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED 2X, 6.8 inch, QHD+, tần số quét 120Hz. Hệ điều hành: Android 13, giao diện One UI 5. CPU: Snapdragon 8 Gen. RAM:12GB. Bộ nhớ trong: 128GB. Camera sau: Chính 200MP, góc rộng 12MP, tele 10MP và 10MP. Camera trước: 40MP. Pin: 5.000 mAh, sạc fast charging. Kích thước: 163 x 78 x 8,9 mm.', N'Thông số sản phẩm 1', 2),
(28, N'SamSung Galaxy S23 Ultra', 32000000,'',30,'sss22ultra_15_hongtim.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED 2X, 6.8 inch, QHD+, tần số quét 120Hz. Hệ điều hành: Android 13, giao diện One UI 5. CPU: Snapdragon 8 Gen. RAM:12GB. Bộ nhớ trong: 128GB. Camera sau: Chính 200MP, góc rộng 12MP, tele 10MP và 10MP. Camera trước: 40MP. Pin: 5.000 mAh, sạc fast charging. Kích thước: 163 x 78 x 8,9 mm.', N'Thông số sản phẩm 1', 2),
(29, N'SamSung Galaxy S23 Ultra', 32000000,'',30,'sss22ultra_15_trang.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED 2X, 6.8 inch, QHD+, tần số quét 120Hz. Hệ điều hành: Android 13, giao diện One UI 5. CPU: Snapdragon 8 Gen. RAM:12GB. Bộ nhớ trong: 128GB. Camera sau: Chính 200MP, góc rộng 12MP, tele 10MP và 10MP. Camera trước: 40MP. Pin: 5.000 mAh, sạc fast charging. Kích thước: 163 x 78 x 8,9 mm.', N'Thông số sản phẩm 1', 2),
(20, N'SamSung Galaxy Z-Flip4', 30000000,'',30,'sszflip5_22_den.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED 2X, 6.7 inch, Full HD+, 120Hz. Màn hình bên ngoài: Super AMOLED, 1.9 inch. Hệ điều hành: Android 12, One UI 4.1.2. CPU: Snapdragon 8+ Gen 1. RAM: 8GB. Bộ nhớ trong: 512GB. Camera sau: Chính 12MP + ultrawide 12MP. Camera selfie: 10MP. Pin: 3,700 mAh, sạc nhanh 25W. Kích thước gập: 84.9 x 71.9 x 17.1 mm, mở: 165.2 x 71.9 x 6.9 mm. Trọng lượng: 187g', N'512GB', 2),
(211, N'SamSung Galaxy Z-Flip4', 30000000,'',30,'sszflip5_22_tim.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED 2X, 6.7 inch, Full HD+, 120Hz. Màn hình bên ngoài: Super AMOLED, 1.9 inch. Hệ điều hành: Android 12, One UI 4.1.2. CPU: Snapdragon 8+ Gen 1. RAM: 8GB. Bộ nhớ trong: 512GB. Camera sau: Chính 12MP + ultrawide 12MP. Camera selfie: 10MP. Pin: 3,700 mAh, sạc nhanh 25W. Kích thước gập: 84.9 x 71.9 x 17.1 mm, mở: 165.2 x 71.9 x 6.9 mm. Trọng lượng: 187g', N'512GB', 2),
(212, N'SamSung Galaxy Z-Flip4', 30000000,'',30,'sszflip5_22_vangnhat.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED 2X, 6.7 inch, Full HD+, 120Hz. Màn hình bên ngoài: Super AMOLED, 1.9 inch. Hệ điều hành: Android 12, One UI 4.1.2. CPU: Snapdragon 8+ Gen 1. RAM: 8GB. Bộ nhớ trong: 512GB. Camera sau: Chính 12MP + ultrawide 12MP. Camera selfie: 10MP. Pin: 3,700 mAh, sạc nhanh 25W. Kích thước gập: 84.9 x 71.9 x 17.1 mm, mở: 165.2 x 71.9 x 6.9 mm. Trọng lượng: 187g', N'512GB', 2),
(213, N'SamSung Galaxy Z-Flip4', 30000000,'',30,'sszflip5_22_xanh.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: Dynamic AMOLED 2X, 6.7 inch, Full HD+, 120Hz. Màn hình bên ngoài: Super AMOLED, 1.9 inch. Hệ điều hành: Android 12, One UI 4.1.2. CPU: Snapdragon 8+ Gen 1. RAM: 8GB. Bộ nhớ trong: 512GB. Camera sau: Chính 12MP + ultrawide 12MP. Camera selfie: 10MP. Pin: 3,700 mAh, sạc nhanh 25W. Kích thước gập: 84.9 x 71.9 x 17.1 mm, mở: 165.2 x 71.9 x 6.9 mm. Trọng lượng: 187g', N'512GB', 2),


(31, N'OPPO A16', 6000000,'',30,'opa16_3tr2_bac.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: LCD 6.52 inch, độ phân giải HD+. Hệ điều hành: ColorOS 11 dựa trên Android 11. Chipset: MediaTek Helio G35. RAM: 4GB. Bộ nhớ trong: 64GB, hỗ trợ microSD đến 256GB. Camera sau: Chính 13MP, f/2.2 + 2MP f/2.4 (chụp macro). Camera trước: 5MP, f/2.2. Cổng kết nối: Micro USB, 3.5mm headphone jack. Pin: 5000mAh, sạc 10W. Kích thước: 164 x 75 x 8 mm. Trọng lượng: 190g', N'64GB', 3),
(32, N'OPPO A16', 6000000,'',30,'opa16_3tr2_den.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: LCD 6.52 inch, độ phân giải HD+. Hệ điều hành: ColorOS 11 dựa trên Android 11. Chipset: MediaTek Helio G35. RAM: 4GB. Bộ nhớ trong: 64GB, hỗ trợ microSD đến 256GB. Camera sau: Chính 13MP, f/2.2 + 2MP f/2.4 (chụp macro). Camera trước: 5MP, f/2.2. Cổng kết nối: Micro USB, 3.5mm headphone jack. Pin: 5000mAh, sạc 10W. Kích thước: 164 x 75 x 8 mm. Trọng lượng: 190g', N'64GB', 3),
(33, N'OPPO A17K', 2800000,'',30,'opa17k_2tr8_vang.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: 6.43 inch, Full HD+, Super AMOLED. Hệ điều hành: ColorOS 11.1 dựa trên Android 11. Chipset: Qualcomm Snapdragon 662. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 48MP, f/1.7 + 8MP góc rộng + 2MP chụp đen trắng. Camera selfie: 16MP. Cổng kết nối: USB Type-C, 3.5mm headphonejack. Pin: 5,000mAh, sạc 18W. NFC, định vị GPS. Kích thước: 160.1 x 73.7 x 7.8 mm. Trọng lượng: 175g.', N'64GB', 3),
(34, N'OPPO A74', 5000000,'',30,'opa74_7_den.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: 6.43 inch, Full HD+, Super AMOLED. Hệ điều hành: ColorOS 11.1 dựa trên Android 11. Chipset: Qualcomm Snapdragon 662. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 48MP, f/1.7 + 8MP góc rộng + 2MP chụp đen trắng. Camera selfie: 16MP. Cổng kết nối: USB Type-C, 3.5mm headphonejack. Pin: 5,000mAh, sạc 18W. NFC, định vị GPS. Kích thước: 160.1 x 73.7 x 7.8 mm. Trọng lượng: 175g.', N'128GB', 3),
(35, N'OPPO A74', 5000000,'',30,'opa74_7_xanh.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: 6.43 inch, Full HD+, Super AMOLED. Hệ điều hành: ColorOS 11.1 dựa trên Android 11. Chipset: Qualcomm Snapdragon 662. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 48MP, f/1.7 + 8MP góc rộng + 2MP chụp đen trắng. Camera selfie: 16MP. Cổng kết nối: USB Type-C, 3.5mm headphonejack. Pin: 5,000mAh, sạc 18W. NFC, định vị GPS. Kích thước: 160.1 x 73.7 x 7.8 mm. Trọng lượng: 175g.', N'128GB', 3),
(36, N'OPPO A78', 6000000,'',30,'opa78_6_xanh.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: 6.43 inch, Full HD+, Super AMOLED. Hệ điều hành: ColorOS 11.1 dựa trên Android 11. Chipset: Qualcomm Snapdragon 662. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 48MP, f/1.7 + 8MP góc rộng + 2MP chụp đen trắng. Camera selfie: 16MP. Cổng kết nối: USB Type-C, 3.5mm headphonejack. Pin: 5,000mAh, sạc 18W. NFC, định vị GPS. Kích thước: 160.1 x 73.7 x 7.8 mm. Trọng lượng: 175g.', N'128GB', 3),
(37, N'OPPO A95', 7000000,'',30,'opa95_5tr_bac.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: 6.43 inch, Full HD+, Super AMOLED. Hệ điều hành: ColorOS 11.1 dựa trên Android 11. Chipset: Qualcomm Snapdragon 662. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 48MP, f/1.7 + 8MP góc rộng + 2MP chụp đen trắng. Camera selfie: 16MP. Cổng kết nối: USB Type-C, 3.5mm headphonejack. Pin: 5,000mAh, sạc 18W. NFC, định vị GPS. Kích thước: 160.1 x 73.7 x 7.8 mm. Trọng lượng: 175g.', N'128GB', 3),
(38, N'OPPO A95', 7000000,'',30,'opa95_5tr_den.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: 6.43 inch, Full HD+, Super AMOLED. Hệ điều hành: ColorOS 11.1 dựa trên Android 11. Chipset: Qualcomm Snapdragon 662. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 48MP, f/1.7 + 8MP góc rộng + 2MP chụp đen trắng. Camera selfie: 16MP. Cổng kết nối: USB Type-C, 3.5mm headphonejack. Pin: 5,000mAh, sạc 18W. NFC, định vị GPS. Kích thước: 160.1 x 73.7 x 7.8 mm. Trọng lượng: 175g.', N'128GB', 3),
(39, N'OPPO Find N2 Flip', 25000000,'',30,'opfindn2flip_20_tim.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: 6.43 inch, Full HD+, Super AMOLED. Hệ điều hành: ColorOS 11.1 dựa trên Android 11. Chipset: Qualcomm Snapdragon 662. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 48MP, f/1.7 + 8MP góc rộng + 2MP chụp đen trắng. Camera selfie: 16MP. Cổng kết nối: USB Type-C, 3.5mm headphonejack. Pin: 5,000mAh, sạc 18W. NFC, định vị GPS. Kích thước: 160.1 x 73.7 x 7.8 mm. Trọng lượng: 175g.', N'184GB', 3),
(30, N'OPPO Reno 8', 8500000,'',30,'opreno8_8tr5_den.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: 6.43 inch, Full HD+, Super AMOLED. Hệ điều hành: ColorOS 11.1 dựa trên Android 11. Chipset: Qualcomm Snapdragon 662. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 48MP, f/1.7 + 8MP góc rộng + 2MP chụp đen trắng. Camera selfie: 16MP. Cổng kết nối: USB Type-C, 3.5mm headphonejack. Pin: 5,000mAh, sạc 18W. NFC, định vị GPS. Kích thước: 160.1 x 73.7 x 7.8 mm. Trọng lượng: 175g.', N'184GB', 3),
(311, N'OPPO Reno 8', 8500000,'',30,'opreno8_8tr5_vangdong.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: 6.43 inch, Full HD+, Super AMOLED. Hệ điều hành: ColorOS 11.1 dựa trên Android 11. Chipset: Qualcomm Snapdragon 662. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 48MP, f/1.7 + 8MP góc rộng + 2MP chụp đen trắng. Camera selfie: 16MP. Cổng kết nối: USB Type-C, 3.5mm headphonejack. Pin: 5,000mAh, sạc 18W. NFC, định vị GPS. Kích thước: 160.1 x 73.7 x 7.8 mm. Trọng lượng: 175g.', N'184GB', 3),
(312, N'OPPO Reno 8', 8500000,'',30,'opreno8_8tr5_xanh.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg','' ,N'Màn hình: 6.43 inch, Full HD+, Super AMOLED. Hệ điều hành: ColorOS 11.1 dựa trên Android 11. Chipset: Qualcomm Snapdragon 662. RAM: 8GB. Bộ nhớ trong: 128GB. Camera sau: Chính 48MP, f/1.7 + 8MP góc rộng + 2MP chụp đen trắng. Camera selfie: 16MP. Cổng kết nối: USB Type-C, 3.5mm headphonejack. Pin: 5,000mAh, sạc 18W. NFC, định vị GPS. Kích thước: 160.1 x 73.7 x 7.8 mm. Trọng lượng: 175g.', N'184GB', 3);




INSERT INTO ChiTietDH (Soluong, Dongia, ThanhTien, MaDH, MaSP)
VALUES
(3, 100000, 300000, 1, 1),
(2, 150000, 300000, 1, 2),
(4, 200000, 800000, 2, 1),
(1, 250000, 250000, 2, 2);

INSERT INTO YeuThich (MaYT, MaSP, MaKH)
VALUES
(1, 1, 1),
(2, 2, 2);

INSERT INTO Vourcher (MaKM, Uudai, ThongTinUuDai, MaSP)
VALUES
(1, 10, N'Giảm 10% cho sản phẩm 1', 1),
(2, 15, N'Giảm 15% cho sản phẩm 2', 2);

INSERT INTO Mau_sp (Mamau, MaSP)
VALUES
(1, 1),
(2, 1),
(1, 2),
(2, 2);
	
 

