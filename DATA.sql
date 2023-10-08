
USE master
GO

DROP DATABASE QLBANDT
GO



create database QLBANDT
GO

use QLBANDT
go

CREATE TABLE KhachHang
(
  MaKH INT NOT NULL,
  TenKH NVARCHAR(20) NOT NULL,
  sdt INT NOT NULL,
  email VARCHAR(100)  NULL,
  DiaChi NVARCHAR(100)  NULL,
  NgaySinh DATE  NULL,
  TK VARCHAR(20) NOT NULL,
  Pass VARCHAR(20) NOT NULL,
  Roleuser NVARCHAR(10) NULL,
  Hinh VARCHAR(MAX)  NULL,
  PRIMARY KEY (MaKH)
);


CREATE TABLE DonHang
(
  MaDH INT NOT NULL,
  NgayDH DATE NOT NULL,
  NguoiNhan INT NOT NULL,
  DiaChiNhan NVARCHAR(50) NOT NULL,
  HTthanhtoan NVARCHAR(50) NOT NULL,
  NgayGH DATE NOT NULL,
  Trigia INT NOT NULL,
  Sodienthoainhan INT NOT NULL,
  MaKH INT NOT NULL,
  PRIMARY KEY (MaDH),
  FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
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
  MaKH INT NOT NULL,
  PRIMARY KEY (MaYT),
  FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP),
  FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)
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
('SamSung', 2);

INSERT INTO Mau (Tenmau, Mamau)
VALUES
('Đen', 1)


INSERT INTO SanPham (MaSP, TenSP, GiaSp, GiaGiam, SoLuong, Hinh1, Hinh2, Hinh3, Hinh4, Mota, Thongso, MaLoai)
VALUES
(1, N'Iphone 14 promax', 22000000,'',30,'iphone-14-pro-max-den.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg', N'Mô tả sản phẩm 1', N'Thông số sản phẩm 1', 1),
(2, N'SamSung Galaxy S23+ 5G', 19000000,'',30,'sumsungs23.png', 'hinh2.jpg', 'hinh3.jpg', 'hinh4.jpg', N'Mô tả sản phẩm 2', N'Thông số sản phẩm 1', 2)


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
	
 

