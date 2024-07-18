CREATE DATABASE topsmarket;

USE topsmarket;

-- Tạo bảng nhân viên
CREATE TABLE nhanvien (
    manv INT PRIMARY KEY AUTO_INCREMENT,
    hoten NVARCHAR(100),
    ngaysinh DATE,
    gioitinh NVARCHAR(10),
    diachi NVARCHAR(200),
    sdt NVARCHAR(15),
    email NVARCHAR(100),
    chucvu NVARCHAR(50),
    ngaybatdau DATE,
    taikhoan NVARCHAR(50) UNIQUE,
    matkhau NVARCHAR(100)
);

-- Tạo bảng admin
CREATE TABLE admin (
    maadmin INT PRIMARY KEY AUTO_INCREMENT,
    tenadmin NVARCHAR(100),
    taikhoan NVARCHAR(50) UNIQUE,
    matkhau NVARCHAR(100),
    email NVARCHAR(100)
);

-- Tạo bảng chấm công
CREATE TABLE chamcong (
    id INT PRIMARY KEY AUTO_INCREMENT,
    manv INT,
    ngay DATE,
    giovao NVARCHAR(200),
    giora NVARCHAR(200),
    sogiolam INT,
    FOREIGN KEY (manv) REFERENCES nhanvien(manv)
);

-- Tạo bảng nghỉ phép
CREATE TABLE nghiphep (
    id INT PRIMARY KEY AUTO_INCREMENT,
    manv INT,
    ngaynghi DATE,
    lydo NVARCHAR(200),
    trangthai NVARCHAR(50), -- Ví dụ: 'Chấp nhận', 'Từ chối', 'Chờ duyệt'
    FOREIGN KEY (manv) REFERENCES nhanvien(manv)
);

-- Tạo bảng lương
CREATE TABLE luong (
	id_luong INT PRIMARY KEY AUTO_INCREMENT,
    manv INT,
    ngayLuong DATE,
    luongcoban INT,
    luongtheogio INT,
    sogiolam INT,
    songaynghi INT,
    luongthuong INT,
    tongluong INT,
    FOREIGN KEY (manv) REFERENCES nhanvien(manv)
);


SELECT COUNT(*) AS Total FROM nhanvien;
SELECT chucvu, COUNT(*) AS SoLuong FROM nhanvien GROUP BY chucvu;
SELECT COUNT(*) AS total FROM nghiphep;
SELECT trangthai, COUNT(*) AS count FROM nghiphep GROUP BY trangthai