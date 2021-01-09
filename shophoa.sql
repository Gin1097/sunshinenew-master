-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2021 at 11:31 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop_dong_ho`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdonhang`
--

CREATE TABLE `chitietdonhang` (
  `dh_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Đơn hàng # dh_ma # dh_ma # Mã đơn hàng',
  `sp_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Sản phẩm # sp_ma # sp_ten # Mã sản phẩm',
  `m_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Màu sắc # m_ma # m_ten # Mã màu sản phẩm, 1-Phối màu (đỏ, vàng, ...)',
  `ctdh_soLuong` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Số lượng # Số lượng sản phẩm đặt mua',
  `ctdh_donGia` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Đơn giá # Giá bán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chi tiết đơn hàng # Chi tiết đơn hàng: sản phẩm, màu, số lượng, đơn giá, đơn hàng';

--
-- Dumping data for table `chitietdonhang`
--

INSERT INTO `chitietdonhang` (`dh_ma`, `sp_ma`, `m_ma`, `ctdh_soLuong`, `ctdh_donGia`) VALUES
(27, 18, 1, 1, 19000),
(28, 17, 1, 2, 299000),
(28, 26, 1, 1, 399000),
(29, 26, 1, 1, 399000),
(29, 29, 1, 1, 399000),
(30, 23, 1, 1, 19000),
(31, 23, 1, 1, 19000),
(32, 23, 1, 1, 19000),
(33, 23, 1, 1, 19000),
(34, 18, 1, 1, 19000),
(35, 33, 1, 1, 11000);

-- --------------------------------------------------------

--
-- Table structure for table `chitietnhap`
--

CREATE TABLE `chitietnhap` (
  `pn_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Phiếu nhập # pn_ma # pn_ma # Mã phiếu nhập',
  `sp_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Sản phẩm # sp_ma # sp_ten # Mã sản phẩm',
  `m_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Màu sắc # m_ma # m_ten # Mã màu sản phẩm, 1-Phối màu (đỏ, vàng, ...)',
  `ctn_soLuong` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Số lượng # Số lượng sản phẩm nhập kho',
  `ctn_donGia` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Đơng giá nhập # Giá nhập kho của sản phẩm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chi tiết nhập # Chi tiết phiếu nhập: sản phẩm, màu, số lượng, đơn giá, phiếu nhập';

--
-- Dumping data for table `chitietnhap`
--

INSERT INTO `chitietnhap` (`pn_ma`, `sp_ma`, `m_ma`, `ctn_soLuong`, `ctn_donGia`) VALUES
(20, 1, 7, 100, 100000),
(21, 2, 4, 10, 2000000),
(22, 3, 1, 3, 900000),
(23, 4, 10, 2, 800000),
(24, 5, 19, 8, 4000000),
(25, 6, 17, 6, 3600000),
(26, 7, 1, 1, 700000),
(27, 8, 6, 9, 720000),
(28, 9, 10, 4, 360000),
(29, 10, 15, 5, 500000),
(30, 11, 1, 3, 1800000),
(31, 12, 1, 7, 840000),
(32, 13, 1, 2, 260000),
(33, 14, 1, 3, 420000),
(34, 15, 5, 11, 1650000),
(35, 16, 1, 3, 480000),
(36, 17, 1, 7, 1190000),
(37, 18, 7, 4, 72000),
(38, 19, 19, 6, 1800000),
(39, 20, 1, 3, 600000),
(40, 21, 1, 1, 210000),
(41, 22, 3, 30, 660000),
(42, 23, 3, 22, 286000),
(43, 24, 1, 1, 240000),
(44, 25, 1, 3, 750000),
(45, 26, 1, 4, 1040000),
(46, 27, 1, 11, 2970000),
(48, 28, 1, 5, 1400000),
(49, 29, 1, 21, 6090000),
(50, 30, 1, 4, 1200000),
(51, 33, 1, 1, 10000),
(52, 34, 18, 59, 590000),
(53, 35, 11, 95, 855000),
(54, 36, 1, 1, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `chitiet_chuyenkho`
--

CREATE TABLE `chitiet_chuyenkho` (
  `ck_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'chuyển kho mã',
  `sp_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Sản phẩm # sp_ma # sp_ten # Mã sản phẩm',
  `ctck_soLuong` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Số lượng # Số lượng cần chuyến đến kho mới',
  `ctck_thanhtien` decimal(10,2) NOT NULL COMMENT 'Thành tiền # Tổng tiền',
  `khocu_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Kho cũ # Kho # kho_ma',
  `khomoi_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Kho mới # Kho # kh_ma'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chi tiết chuyển kho # Chi tiết chuyển kho';

--
-- Dumping data for table `chitiet_chuyenkho`
--

INSERT INTO `chitiet_chuyenkho` (`ck_ma`, `sp_ma`, `ctck_soLuong`, `ctck_thanhtien`, `khocu_ma`, `khomoi_ma`) VALUES
(26, 2, 7, '1400000.00', 31, 15);

-- --------------------------------------------------------

--
-- Table structure for table `chitiet_xuatkho`
--

CREATE TABLE `chitiet_xuatkho` (
  `sp_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'mã sản phẩm # sp_ma # m_ten # Mã sản phẩm',
  `xk_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'xuất kho # xk_ma # xk_ten # Mã xuất kho',
  `ctxk_soluong` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Số lượng # Số lượng sản phẩm tương ứng với màu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chi tiết xuất kho # Chi tiết xuất kho';

--
-- Dumping data for table `chitiet_xuatkho`
--

INSERT INTO `chitiet_xuatkho` (`sp_ma`, `xk_ma`, `ctxk_soluong`) VALUES
(2, 28, 1),
(2, 29, 1),
(2, 30, 1);

-- --------------------------------------------------------

--
-- Table structure for table `chude`
--

CREATE TABLE `chude` (
  `cd_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Mã chủ đề',
  `cd_ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên chủ đề # Tên chủ đề',
  `cd_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo chủ đề',
  `cd_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật chủ đề gần nhất',
  `cd_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái chủ đề: 1-khóa, 2-khả dụng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chủ đề # Chủ đề: cưới, sinh nhật, chúc mừng, chia buồn, ...';

--
-- Dumping data for table `chude`
--

INSERT INTO `chude` (`cd_ma`, `cd_ten`, `cd_taoMoi`, `cd_capNhat`, `cd_trangThai`) VALUES
(1, 'Hoa 14/2', '2010-01-01 01:00:00', '2020-12-16 15:51:58', 2),
(2, 'Hoa 20/10', '2010-01-01 01:00:00', '2020-12-16 15:51:58', 2),
(3, 'Hoa 20/11', '2010-01-01 01:00:00', '2020-12-16 15:51:57', 2),
(4, 'Hoa 8/3', '2010-01-01 01:00:00', '2020-12-16 15:51:57', 2),
(5, 'Hoa Tết', '2010-01-01 01:00:00', '2020-12-16 15:51:56', 2),
(6, 'Hoa chia buồn', '2010-01-01 01:00:00', '2020-12-16 15:51:59', 2),
(7, 'Hoa chúc sức khỏe', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(8, 'Hoa cưới', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(9, 'Hoa mừng giáng sinh', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(10, 'Hoa mừng khai trương', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(11, 'Hoa mừng sinh nhật', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(12, 'Hoa mừng sinh nhật OX, BX, người yêu', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(13, 'Hoa mừng sinh nhật cha', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(14, 'Hoa mừng sinh nhật mẹ', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(15, 'Hoa mừng thọ', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(16, 'Hoa mừng tân gia', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(17, 'Hoa mừng tốt nghiệp', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(18, '1234', '2020-12-18 11:42:39', '2020-12-18 11:42:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `chude_sanpham`
--

CREATE TABLE `chude_sanpham` (
  `sp_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Sản phẩm # sp_ma # sp_ten # Mã sản phẩm',
  `cd_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Chủ để # cd_ma # cd_ten # Mã chủ đề'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chủ đề sản phẩm # Sản phầm thuộc các chủ đề';

--
-- Dumping data for table `chude_sanpham`
--

INSERT INTO `chude_sanpham` (`sp_ma`, `cd_ma`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 3),
(3, 1),
(3, 2),
(38, 16);

-- --------------------------------------------------------

--
-- Table structure for table `chuyenkho`
--

CREATE TABLE `chuyenkho` (
  `ck_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Mã chuyển kho',
  `ck_ngay` datetime NOT NULL COMMENT 'Ngày chuyển kho # Ngày chuyển kho',
  `ck_lydo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Lý do chuyển kho',
  `nv_ma` smallint(5) UNSIGNED NOT NULL COMMENT 'Mã nhân viên chuyển kho',
  `ck_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái phiếu chuyển sản phẩm: 1-khóa, 2-khả dụng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chuyển kho # Chuyển kho';

--
-- Dumping data for table `chuyenkho`
--

INSERT INTO `chuyenkho` (`ck_ma`, `ck_ngay`, `ck_lydo`, `nv_ma`, `ck_trangThai`) VALUES
(26, '2021-01-09 20:03:00', 'test dữ liệu', 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `doanhthu_sanpham`
--

CREATE TABLE `doanhthu_sanpham` (
  `id` int(10) UNSIGNED NOT NULL,
  `sp_ma` bigint(20) UNSIGNED NOT NULL,
  `giatri` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `dh_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Mã đơn hàng, 1-Không xuất hóa đơn',
  `kh_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Khách hàng # kh_ma # kh_hoTen # Mã khách hàng',
  `dh_thoiGianDatHang` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm đặt hàng # Thời điểm đặt hàng',
  `dh_thoiGianNhanHang` datetime NOT NULL COMMENT 'Thời điểm giao hàng # Thời điểm giao hàng theo yêu cầu của khách hàng',
  `dh_nguoiNhan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Người nhận quà # Họ tên người nhận (tên hiển thị)',
  `dh_diaChi` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Địa chỉ người nhận # Địa chỉ người nhận',
  `dh_dienThoai` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Điện thoại người nhận # Điện thoại người nhận',
  `dh_nguoiGui` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Người tặng quà # Người tặng (tên hiển thị)',
  `dh_loiChuc` text COLLATE utf8mb4_unicode_ci COMMENT 'Lời chúc # Lời chúc ghi trên thiệp',
  `dh_daThanhToan` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Đã thanh toán # Đã thanh toán tiền (trường hợp tặng quà)',
  `nv_xuLy` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Xử lý đơn hàng # nv_ma # nv_hoTen # Mã nhân viên (người xử lý đơn hàng), 1-chưa phân công',
  `dh_ngayXuLy` datetime DEFAULT NULL COMMENT 'Thời điểm xử lý # Thời điểm xử lý đơn hàng',
  `nv_giaoHang` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Giao hàng # nv_ma # nv_hoTen # Mã nhân viên (người lập phiếu giao hàng và giao hàng), 1-chưa phân công',
  `dh_ngayLapPhieuGiao` datetime DEFAULT NULL COMMENT 'Thời điểm lập phiếu giao # Thời điểm lập phiếu giao',
  `dh_ngayGiaoHang` datetime DEFAULT NULL COMMENT 'Thời điểm khách nhận được hàng # Thời điểm khách nhận được hàng',
  `dh_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo đơn hàng',
  `dh_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật đơn hàng gần nhất',
  `dh_trangThai` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Trạng thái # Trạng thái đơn hàng: 1-nhận đơn, 2-xử lý đơn, 3-giao hàng, 4-hoàn tất, 5-đổi, 6-hủy, 7-trả',
  `vc_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Dịch vụ giao hàng # vc_ma # vc_ten # Mã dịch vụ giao hàng',
  `tt_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Phương thức thanh toán # tt_ma # tt_ten # Mã phương thức thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Đơn hàng # Đơn hàng';

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`dh_ma`, `kh_ma`, `dh_thoiGianDatHang`, `dh_thoiGianNhanHang`, `dh_nguoiNhan`, `dh_diaChi`, `dh_dienThoai`, `dh_nguoiGui`, `dh_loiChuc`, `dh_daThanhToan`, `nv_xuLy`, `dh_ngayXuLy`, `nv_giaoHang`, `dh_ngayLapPhieuGiao`, `dh_ngayGiaoHang`, `dh_taoMoi`, `dh_capNhat`, `dh_trangThai`, `vc_ma`, `tt_ma`) VALUES
(27, 1, '2021-01-09 01:06:43', '2021-01-10 00:00:00', 'Nguyễn Thị Thúy Hiền\n', '114 QL1, P. Lê Bình, Q. Cái Răng, TP. Cần Thơ', '0969930917', 'Lê Minh Quân', 'Vui vẻ', 0, 1, NULL, 1, NULL, NULL, '2021-01-08 11:06:43', '2021-01-08 11:06:43', 1, 1, 1),
(28, 1, '2021-01-09 01:09:17', '2021-01-10 00:00:00', 'Nguyễn Thị Cầm\n', '170/126 Lý Tự Trọng, P. An Phú, Q. Ninh Kiều, TP. Cần Thơ', '0969930917', 'Lê Minh Quân', 'Chúc mừng khai trương', 0, 1, NULL, 1, NULL, NULL, '2021-01-08 11:09:17', '2021-01-08 11:09:17', 1, 1, 1),
(29, 1, '2021-01-09 01:12:57', '2021-01-10 00:00:00', 'Nguyễn Thị Thu Thuận\n', '155/315 QL91, P. Thới Hòa, Q. Ô Môn, TP. Cần Thơ', '0969930917', 'Lê Minh Quân', 'Sinh nhật vui vẻ', 0, 1, NULL, 1, NULL, NULL, '2021-01-08 11:12:57', '2021-01-08 11:12:57', 1, 1, 1),
(30, 1, '2021-01-09 01:22:12', '2021-01-10 00:00:00', 'Trần Nguyễn Thị Thiếu Mai\n', '74A/156 Phan Văn Trị, P. An Phú, Q. Ninh Kiều, TP. Cần Thơ', '0969930917', 'Lê Minh Quân', 'Chia buồn', 0, 1, NULL, 1, NULL, NULL, '2021-01-08 11:22:12', '2021-01-08 11:22:12', 1, 1, 1),
(31, 1, '2021-01-09 01:22:35', '2021-01-10 00:00:00', 'Huỳnh Thị Minh Hương\n', '181 Nguyễn Văn Cừ, P. Cái Khế, Q. Ninh Kiều, TP. Cần Thơ', '0969930917', 'Lê Minh Quân', 'Khai trương hồng phát', 0, 1, NULL, 1, NULL, NULL, '2021-01-08 11:22:35', '2021-01-08 11:22:35', 1, 1, 1),
(32, 1, '2021-01-09 01:23:47', '2021-01-10 00:00:00', 'Lê Thị Phương Linh\n', '156 Phan Đình Phùng, P. An Lạc, Q. Ninh Kiều, TP. Cần Thơ', '0969930917', 'Lê Minh Quân', 'Happy birthday', 0, 1, NULL, 1, NULL, NULL, '2021-01-08 11:23:47', '2021-01-08 11:23:47', 1, 1, 1),
(33, 1, '2021-01-09 01:24:13', '2021-01-10 00:00:00', 'Trần Duy Uyên\n', '317 Trần Kiết Tường, P. Thới An, Q. Ô Môn, TP. Cần Thơ', '0969930917', 'Lê Minh Quân', 'Happy new year', 0, 1, NULL, 1, NULL, NULL, '2021-01-08 11:24:13', '2021-01-08 11:24:13', 1, 1, 1),
(34, 1, '2021-01-09 01:27:16', '2021-01-10 00:00:00', 'Trần Quách Băng Tâm\n', '180A/254 Hòa Bình, P. An Cư, Q. Ninh Kiều, TP. Cần Thơ', '0969930917', 'Lê Minh Quân', 'Khai trương hồng phát', 0, 1, NULL, 1, NULL, NULL, '2021-01-08 11:27:16', '2021-01-08 11:27:16', 1, 1, 1),
(35, 1, '2021-01-09 01:29:16', '2021-01-10 00:00:00', 'Nguyễn Thị Lam Ngọc\n', '399 Phan Đình Phùng, P. An Lạc, Q. Ninh Kiều, TP. Cần Thơ', '0969930917', 'Lê Minh Quân', 'Vui vẻ', 0, 1, NULL, 1, NULL, NULL, '2021-01-08 11:29:16', '2021-01-08 11:29:16', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `donvitinh`
--

CREATE TABLE `donvitinh` (
  `dvt_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Mã đơn vị tính sản phẩm',
  `dvt_ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên đơn vị tính # Tên đơn vị tính sản phẩm',
  `dvt_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo đơn vị tính',
  `dvt_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật đơn vị tính gần nhất',
  `dvt_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái đơn vị tính sản phẩm: 1-khóa, 2-khả dụng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Đơn vị tính # Đơn vị tính sản phẩm';

--
-- Dumping data for table `donvitinh`
--

INSERT INTO `donvitinh` (`dvt_ma`, `dvt_ten`, `dvt_taoMoi`, `dvt_capNhat`, `dvt_trangThai`) VALUES
(1, 'Giỏ hoa', '2020-04-21 21:34:13', '2021-01-09 12:15:22', 2),
(2, 'Bông hoa', '2020-04-21 21:34:13', '2021-01-09 12:15:30', 2),
(3, 'Hộp hoa', '2020-04-21 21:34:13', '2021-01-09 12:16:00', 2),
(4, 'Kệ hoa', '2021-01-09 12:15:35', '2021-01-09 12:15:35', 2),
(5, 'Vòng', '2021-01-09 12:15:41', '2021-01-09 12:15:41', 2),
(6, 'Bó hoa', '2021-01-09 12:15:50', '2021-01-09 12:15:50', 2);

-- --------------------------------------------------------

--
-- Table structure for table `gopy`
--

CREATE TABLE `gopy` (
  `gy_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Mã góp ý',
  `gy_thoiGian` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm góp ý # Thời điểm góp ý',
  `gy_noiDung` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Góp ý # Nội dung góp ý',
  `kh_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Khách hàng # kh_ma # kh_hoTen # Mã khách hàng',
  `sp_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Sản phẩm # sp_ma # sp_ten # Mã sản phẩm',
  `gy_trangThai` tinyint(3) UNSIGNED NOT NULL DEFAULT '3' COMMENT 'Trạng thái # Trạng thái góp ý: 1-khóa, 2-hiển thị, 3-chờ duyệt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Góp ý # Góp ý';

--
-- Dumping data for table `gopy`
--

INSERT INTO `gopy` (`gy_ma`, `gy_thoiGian`, `gy_noiDung`, `kh_ma`, `sp_ma`, `gy_trangThai`) VALUES
(1, '2020-04-22 04:34:13', 'gy_noiD 1', 1, 1, 1),
(2, '2020-04-22 04:34:13', 'Giỏ hoa rất đẹp', 2, 2, 2),
(3, '2020-04-22 04:34:13', 'gy_noiD 3', 3, 3, 3),
(4, '2020-04-22 04:34:13', 'gy_noiD 4', 4, 4, 4),
(5, '2020-04-22 04:34:13', 'gy_noiD 5', 5, 5, 5),
(6, '2020-04-22 04:34:13', 'gy_noiD 6', 6, 6, 6),
(7, '2020-04-22 04:34:13', 'gy_noiD 7', 7, 7, 7),
(8, '2020-04-22 04:34:13', 'gy_noiD 8', 8, 8, 8),
(9, '2020-04-22 04:34:13', 'gy_noiD 9', 9, 9, 9),
(10, '2020-04-22 04:34:13', 'gy_noiD 10', 10, 10, 10),
(11, '2020-04-22 04:34:13', 'gy_noiD 11', 11, 11, 11),
(12, '2020-04-22 04:34:13', 'gy_noiD 12', 12, 12, 12),
(13, '2020-04-22 04:34:13', 'gy_noiD 13', 13, 13, 13),
(14, '2020-04-22 04:34:13', 'gy_noiD 14', 14, 14, 14),
(15, '2020-04-22 04:34:13', 'gy_noiD 15', 15, 15, 15),
(16, '2020-04-22 04:34:13', 'gy_noiD 16', 16, 16, 16),
(17, '2020-04-22 04:34:13', 'gy_noiD 17', 17, 17, 17),
(18, '2020-04-22 04:34:13', 'gy_noiD 18', 18, 18, 18),
(19, '2020-04-22 04:34:13', 'gy_noiD 19', 19, 19, 19),
(20, '2020-04-22 04:34:13', 'gy_noiD 20', 20, 20, 20),
(21, '2020-04-22 04:34:13', 'gy_noiD 21', 21, 21, 21),
(22, '2020-04-22 04:34:13', 'gy_noiD 22', 22, 22, 22),
(23, '2020-04-22 04:34:13', 'gy_noiD 23', 23, 23, 23),
(24, '2020-04-22 04:34:13', 'gy_noiD 24', 24, 24, 24),
(25, '2020-04-22 04:34:13', 'gy_noiD 25', 25, 25, 25),
(26, '2020-04-22 04:34:13', 'gy_noiD 26', 26, 26, 26),
(27, '2020-04-22 04:34:13', 'gy_noiD 27', 27, 27, 27),
(28, '2020-04-22 04:34:13', 'gy_noiD 28', 28, 28, 28),
(29, '2020-04-22 04:34:13', 'gy_noiD 29', 29, 29, 29),
(30, '2020-04-22 04:34:13', 'gy_noiD 30', 30, 30, 30);

-- --------------------------------------------------------

--
-- Table structure for table `hinhanh`
--

CREATE TABLE `hinhanh` (
  `sp_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Sản phẩm # sp_ma # sp_ten # Mã sản phẩm',
  `ha_stt` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Số thứ tự # Số thứ tự hình ảnh của mỗi sản phẩm',
  `ha_ten` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên hình ảnh # Tên hình ảnh (không bao gồm đường dẫn)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Hình ảnh sản phẩm # Các hình ảnh chi tiết của sản phẩm';

--
-- Dumping data for table `hinhanh`
--

INSERT INTO `hinhanh` (`sp_ma`, `ha_stt`, `ha_ten`) VALUES
(1, 1, 'cucdai.jpg'),
(2, 1, 'giohoachucmung 1.jpg'),
(3, 1, 'kehoakhaitruong.jpg'),
(4, 1, 'vonghoakhaitruong1.jpg'),
(5, 1, 'binhhoatrangtri.jpg'),
(6, 1, 'hopgiaykhoakhaitruong1.jpg'),
(7, 1, 'hoahopgiaychiabuon1.jpg'),
(8, 1, 'hoahopgiaychucmung1.jpg'),
(9, 1, 'bohoatangnguoiyeu1.jpg'),
(10, 1, 'bohoacuoi1.jpg'),
(11, 1, 'vonghoachiabuon2.jpg'),
(12, 1, 'giohoachiabuon1.jpg'),
(13, 1, 'giohoadamcuoi.jpg'),
(14, 1, 'bohoathambenh1.jpg'),
(15, 1, 'binhhoaphongthuy1.jpg'),
(16, 1, 'binhhoadeban1.jpg'),
(17, 1, 'binhhoataiche.jpg'),
(18, 1, 'hoa_noel1.jpg'),
(19, 1, 'kehoachucmung1.jpg'),
(20, 1, 'hoahopgochucmung1.jpg'),
(21, 1, 'kehoachiabuon1.jpg'),
(22, 1, 'maudon.jpg'),
(23, 1, 'hoasen1.jpg'),
(24, 1, 'giohoakhaitruong1.jpg'),
(25, 1, 'bohoachucmung1.jpg'),
(26, 1, 'binhhoadebannho.jpg'),
(27, 1, 'hoahopgiaydamcuoi1.jpg'),
(28, 1, 'bohoachucmungsinhnhat1.jpg'),
(29, 1, 'binhhoacodien.jpg'),
(30, 1, 'hopgohoakhaitruong.jpg'),
(33, 1, 'hoadamcuoi1.jpg'),
(34, 1, 'hoahong2.jpg'),
(35, 1, 'huongduong2.jpg'),
(36, 1, 'hoadoidau1.jpg'),
(37, 1, '6.png'),
(38, 1, 'HaGi_LoGo.png');

-- --------------------------------------------------------

--
-- Table structure for table `hoadonle`
--

CREATE TABLE `hoadonle` (
  `hdl_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Mã hóa đơn bán lẻ',
  `hdl_nguoiMuaHang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Người mua hàng # Họ tên người mua hàng',
  `hdl_dienThoai` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Điện thoại # Điện thoại',
  `hdl_diaChi` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Địa chỉ # Địa chỉ',
  `nv_lapHoaDon` smallint(5) UNSIGNED NOT NULL COMMENT 'Lập hóa đơn # nv_ma # nv_hoTen # Mã nhân viên (người lập hóa đơn)',
  `hdl_ngayXuatHoaDon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm xuất # Thời điểm xuất hóa đơn',
  `dh_ma` bigint(20) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Đơn hàng # dh_ma # dh_ma # Mã đơn hàng, 1-Không xuất hóa đơn'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Hóa đơn bán lẻ # Hóa đơn bán lẻ: sản phẩm, màu, số lượng, đơn giá, đơn hàng';

-- --------------------------------------------------------

--
-- Table structure for table `hoadonsi`
--

CREATE TABLE `hoadonsi` (
  `hds_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Mã hóa đơn bán sỉ',
  `hds_nguoiMuaHang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Người mua hàng # Họ tên người mua hàng',
  `hds_tenDonVi` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Đơn vị # Tên đơn vị',
  `hds_diaChi` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Địa chỉ # Địa chỉ đơn vị',
  `hds_maSoThue` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mã số thuế # Mã số thuế đơn vị',
  `hds_soTaiKhoan` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL' COMMENT 'Số tài khoản # Số tài khoản',
  `nv_lapHoaDon` smallint(5) UNSIGNED NOT NULL COMMENT 'Lập hóa đơn # nv_ma # nv_hoTen # Mã nhân viên (người lập hóa đơn)',
  `hds_ngayXuatHoaDon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm xuất # Thời điểm xuất hóa đơn',
  `nv_thuTruong` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Thủ trưởng # nv_ma # nv_hoTen # Mã nhân viên (thủ trưởng), 1-chưa phân công',
  `hds_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo hóa đơn',
  `hds_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật hóa đơn gần nhất',
  `hds_trangThai` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Trạng thái # Trạng thái hóa đơn: 1-lập hóa đơn, 2-xuất hóa đơn, 3-hủy',
  `dh_ma` bigint(20) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Đơn hàng # dh_ma # dh_ma # Mã đơn hàng, 1-Không xuất hóa đơn',
  `tt_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Phương thức thanh toán # tt_ma # tt_ten # Mã phương thức thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Hóa đơn bán sỉ # Hóa đơn bán sỉ: sản phẩm, màu, số lượng, đơn giá, đơn hàng';

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `kh_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Mã khách hàng',
  `kh_taiKhoan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tài khoản # Tài khoản',
  `kh_matKhau` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mật khẩu # Mật khẩu',
  `kh_hoTen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Họ tên # Họ tên',
  `kh_gioiTinh` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Giới tính # Giới tính: 0-Nữ, 1-Nam, 2-Khác',
  `kh_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email # Email',
  `kh_ngaySinh` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày sinh # Ngày sinh',
  `kh_diaChi` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL' COMMENT 'Địa chỉ # Địa chỉ',
  `kh_dienThoai` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT 'NULL' COMMENT 'Điện thoại # Điện thoại',
  `kh_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo khách hàng',
  `kh_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật khách hàng gần nhất',
  `kh_trangThai` tinyint(3) UNSIGNED NOT NULL DEFAULT '3' COMMENT 'Trạng thái # Trạng thái khách hàng: 1-khóa, 2-khả dụng, 3-chưa kích hoạt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Khách hàng # Khách hàng';

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`kh_ma`, `kh_taiKhoan`, `kh_matKhau`, `kh_hoTen`, `kh_gioiTinh`, `kh_email`, `kh_ngaySinh`, `kh_diaChi`, `kh_dienThoai`, `kh_taoMoi`, `kh_capNhat`, `kh_trangThai`) VALUES
(1, 'nguyen-son_tung-08_12_31', '$2y$10$zpFXbKrUNiBMWaRdYClMluuQqfVW4w3niV/tv5gf/2BmFoV2hH.P6', 'Nguyễn Sơn Tùng\n', 1, 'tung.311208@yahoo.com.vn', '2008-12-31 00:00:00', '194/127 Ngô Gia Tự, P. Tân An, Q. Ninh Kiều, TP. Cần Thơ', '01633417148', '2010-01-01 10:51:10', '2010-01-01 10:51:10', 2),
(2, 'n-v.h.hiep10-04-97', '$2y$10$FINpRSrzZ9KtfpdledCc..1pHKYelV8tPTWAz8PVlXExhF1B94Vqi', 'Nguyễn Võ Hòa Hiệp\n', 1, 'HIEP_970410@yahoo.com', '1997-04-10 00:00:00', '203 Bùi Minh Trực, P. Long Tuyền, Q. Bình Thủy, TP. Cần Thơ', '01670451151', '2010-01-01 13:35:55', '2010-01-01 13:35:55', 2),
(3, 'CONGUYEN-AN-95', '$2y$10$QIi1DGjVZTQcgU0Z0LNbouebpuZOhIvw3DrtlbtLYfl14eniW4fyu', 'Nguyễn An Cơ\n', 1, 'coannguyen951026@outlook.com', '1995-10-26 00:00:00', '341 Nguyễn Trãi, P. Cái Khế, Q. Ninh Kiều, TP. Cần Thơ', '01885285838', '2010-01-01 19:32:42', '2010-01-01 19:32:42', 2),
(4, 'nt.chau.05', '$2y$10$hyAWBGDPX9x1H2dH/QFpVu6z0tVfP9PQAsaRRDhOmodUDs3cKz8p6', 'Nguyễn Tùng Châu\n', 1, 'ChauNguyenTung1810@yahoo.com', '2005-10-18 00:00:00', '209 Nguyễn Thị Minh Khai, P. Xuân Khánh, Q. Ninh Kiều, TP. Cần Thơ', '01671589808', '2010-01-01 22:43:38', '2010-01-01 22:43:38', 2),
(5, 'xuan.han96', '$2y$10$1iZ/wVF3E3YGMdXjHxiGquxArLoAM0k5OXmR8iQvIb8wjtcoHEuEC', 'Phạm Xuân Hãn\n', 1, 'hanpham.xuan96@ymail.com', '1996-07-21 00:00:00', '129E/317 QL1, P. Hưng Thạnh, Q. Cái Răng, TP. Cần Thơ', '0971171752', '2010-01-13 22:43:38', '2010-01-13 22:43:38', 2),
(6, 'buigiang_731107', '$2y$10$KKw4aGby3IudL0rAvAE58.KQ5rSztWa/NuDusawqtHPJzDI.as.Hu', 'Bùi Giang', 1, 'GiangBui73-11-07@hotmail.com', '1973-11-07 00:00:00', '141/315 Trần Kiết Tường, P. Thới An, Q. Ô Môn, TP. Cần Thơ', '01233670788', '2010-01-16 22:43:38', '2010-01-16 22:43:38', 2),
(7, 'tp-vtien1993-07-17', '$2y$10$b9c/i5ftSxM8LyRNWUxLhOSnzbRVG.4HUwTLGuNmk40r8Cw1coaVm', 'Trần Phan Văn Tiển\n', 1, 't.p.v-tien1707@yahoo.com.vn', '1993-07-17 00:00:00', '313 Bùi Hữu Nghĩa, P. Long Tuyền, Q. Bình Thủy, TP. Cần Thơ', '0938783806', '2010-01-16 22:43:38', '2010-01-16 22:43:38', 2),
(8, 'TRUONG-CHAU_1970', '$2y$10$Q7lsP6PYc1aL4NloWKs6WOnSFSdVkYfCeutdROdgzb95Qi1KfZYR2', 'Trương Châu', 1, 'TruongChau-1970@yahoo.com.vn', '1970-10-07 00:00:00', '5 Trương Văn Diễn, P. Phước Thới, Q. Ô Môn, TP. Cần Thơ', '01213686216', '2010-01-19 22:43:38', '2010-01-19 22:43:38', 2),
(9, 'DAI13_03', '$2y$10$M2JhVJnrwgH.ch/.LysASeNQNweVqiUjBhJOSinOepx52UXm9Ue/u', 'Mai Quảng Ðại\n', 1, 'QUANG_DAI\n_13.03@ymail.com', '1998-03-13 00:00:00', '114 QL1, P. Lê Bình, Q. Cái Răng, TP. Cần Thơ', '01885481733', '2010-01-20 00:25:01', '2010-01-20 00:25:01', 2),
(10, 'tan-phung-viet-02_03_27', '$2y$10$oZA2z4mK3zUoqDRKiUoUW.0JhvMaR/IJ5sMgdP.LqXhSi7BcPjLCi', 'Phùng Viết Tân\n', 1, 'PhungVietTan2703@outlook.com', '2002-03-27 00:00:00', '170/126 Lý Tự Trọng, P. An Phú, Q. Ninh Kiều, TP. Cần Thơ', '0940924678', '2010-01-23 00:25:01', '2010-01-23 00:25:01', 2),
(11, 'Huehuong\n.28-01', '$2y$10$xU2udwf1ci2Nunf1kYCGr.bdadYSXaai6gQDOVCpzTJjKU8JD.7zy', 'Ngô Thị Huệ Hương\n', 0, 'Huong89-01-28@yahoo.com.vn', '1989-01-28 00:00:00', '155/315 QL91, P. Thới Hòa, Q. Ô Môn, TP. Cần Thơ', '01681679722', '2010-01-25 00:25:01', '2010-01-25 00:25:01', 2),
(12, 'NGUYEN-LAI1995-11-28', '$2y$10$Xfk8wLlrTMLxCZT63EW7jOWwMlOR6hovKlXOYWBeJt5Zqm/GepAcu', 'Đường Nguyễn Lai', 1, 'LAI1995@gmail.com', '1995-11-28 00:00:00', '395 Huỳnh Phan Hộ, P. Bình Thủy , Q. Bình Thủy, TP. Cần Thơ', '018693969', '2010-01-25 03:55:41', '2010-01-25 03:55:41', 2),
(13, 'DUNGHIEU-NGUYEN-HUYNH.23.09.92', '$2y$10$w7h5jMA6gxuJL82heKNNIOy06.26tbGwqTHIRi3BJU73jTXZbXKSC', 'Huỳnh Nguyễn Hiếu Dụng\n', 1, 'hnhdung23_09_1992@yahoo.com.vn', '1992-09-23 00:00:00', '351 Mậu Thân, P. Xuân Khánh, Q. Ninh Kiều, TP. Cần Thơ', '01209177928', '2010-01-25 03:55:41', '2010-01-25 03:55:41', 2),
(14, 'dan_khanh\n_20020810', '$2y$10$OIHONGkPHQ5pMXPFaLRMKuii6.6asymkB6mNoZMc9LyE7psWeX8Be', 'Đinh Dân Khánh\n', 1, 'dinhdan-khanh-10_08@yahoo.com', '2002-08-10 00:00:00', '195C/367 QL91, P. Thới Hòa, Q. Ô Môn, TP. Cần Thơ', '09828469', '2010-02-02 03:55:41', '2010-02-02 03:55:41', 2),
(15, 'SanSanThi-Nguyen-1950', '$2y$10$xKL9VVcnQnitB2ui1w6wNOVnI8HYl7iYyMesCXtRHQtApAjJR4wYC', 'Nguyễn Thị San San\n', 0, 'san500515@gmail.com', '1950-05-15 00:00:00', '159/161 Lê Hồng Phong, P. Trà Nóc, Q. Bình Thủy, TP. Cần Thơ', '01235532849', '2010-02-02 06:06:11', '2010-02-02 06:06:11', 2),
(16, 'NHT-Son-1985-07-14', '$2y$10$tx7Sc5KR786kFyhEa9557uzjSdQlHdXkLO/KuocQd1dgLCpVBfsc2', 'Nguyễn Huỳnh Thạch Sơn\n', 1, 'SonNguyen.HuynhThach.1985@gmail.com.vn', '1985-07-14 00:00:00', '194 Bùi Hữu Nghĩa, P. Long Tuyền, Q. Bình Thủy, TP. Cần Thơ', '01293702067', '2010-02-12 06:06:11', '2010-02-12 06:06:11', 2),
(17, 'Thuy.hien220587', '$2y$10$eNJN4xDe9c4iJICoarMVxOyyp34rE47pzugfMsYRVQkOYyAEUcVWK', 'Nguyễn Thị Thúy Hiền\n', 0, 'NT_T-HIEN22_05@gmail.com.vn', '1987-05-22 00:00:00', '96 QL91B, P. Phước Thới, Q. Ô Môn, TP. Cần Thơ', '01209109049', '2010-02-12 07:43:17', '2010-02-12 07:43:17', 2),
(18, 'NGUYENMIEN27011980', '$2y$10$AOgOIbSEKlfBnfbyDrzqde3ZBnNBVrH7YBgy8SvhiK32NvJC.12Mm', 'Nguyễn Miên', 1, 'NMIEN80@outlook.com', '1980-01-27 00:00:00', '360 Nguyễn An Ninh, P. Tân An, Q. Ninh Kiều, TP. Cần Thơ', '01266964563', '2010-02-16 07:43:17', '2010-02-16 07:43:17', 2),
(19, 'nguyenthi_cam_1986_08_26', '$2y$10$3mJ/y1u6xtxqIcxCzQMBKuKfOu0yJxNq9BYO6JJm20ATm8LDXl9qe', 'Nguyễn Thị Cầm\n', 0, 'thi.cam\n_86@yahoo.com', '1986-08-26 00:00:00', '74A/156 Phan Văn Trị, P. An Phú, Q. Ninh Kiều, TP. Cần Thơ', '0974245456', '2010-02-16 08:48:55', '2010-02-16 08:48:55', 2),
(20, 'Thuthuan24_06_81', '$2y$10$fOdOeSQgxTnG2xWtfUCsqukHPnXMKhsGWHEHJoQfT5S9V43zdt7Om', 'Nguyễn Thị Thu Thuận\n', 0, 'ThuanThuThiNguyen2406@yahoo.com', '1981-06-24 00:00:00', '181 Nguyễn Văn Cừ, P. Cái Khế, Q. Ninh Kiều, TP. Cần Thơ', '01655650322', '2010-02-21 08:48:55', '2010-02-21 08:48:55', 2),
(21, 'mai-1984', '$2y$10$794YGhPlxGF0GW1poMmYvOK4i0xdPyqmC42n.J0mYh2yp/KMPVgOy', 'Trần Nguyễn Thị Thiếu Mai\n', 0, 'tran_nguyen_thi_thieu-mai84@yahoo.com.vn', '1984-04-10 00:00:00', '156 Phan Đình Phùng, P. An Lạc, Q. Ninh Kiều, TP. Cần Thơ', '0899727523', '2010-02-21 10:58:50', '2010-02-21 10:58:50', 2),
(22, 'HUONG19810921', '$2y$10$OALSb2BhQrLvZ/ezRPKl3eQsMj15mjIE4L2vrMxJKIjaL/F4N8t0G', 'Huỳnh Thị Minh Hương\n', 0, 'huynh-thiminh.huong-21_09_1981@outlook.com', '1981-09-21 00:00:00', '317 Trần Kiết Tường, P. Thới An, Q. Ô Môn, TP. Cần Thơ', '01661279830', '2010-02-21 11:15:36', '2010-02-21 11:15:36', 2),
(23, 'linh22.05.1969', '$2y$10$yJDvMoh6W2PkGF9T0PHjGODt4eHlSi6UsBOxeNF2DK..XANMcAM56', 'Lê Thị Phương Linh\n', 0, 'LINH1969@ymail.com', '1969-05-22 00:00:00', '180A/254 Hòa Bình, P. An Cư, Q. Ninh Kiều, TP. Cần Thơ', '09920324772', '2010-02-21 14:44:45', '2010-02-21 14:44:45', 2),
(24, 'uyen.duy.tran84', '$2y$10$7yhr7EJpZL7ep4eRB3wzBO.i59EgnFTd9rAcOHtrYiEW.lRsnS93a', 'Trần Duy Uyên\n', 0, 'duy.uyen\n-1984@yahoo.com.vn', '1984-05-28 00:00:00', '399 Phan Đình Phùng, P. An Lạc, Q. Ninh Kiều, TP. Cần Thơ', '09984932323', '2010-02-22 02:24:28', '2010-02-22 02:24:28', 2),
(25, 'LamPhuongThuy171107', '$2y$10$95bkrVPTpwaKkrzS1ez8pObhqDuatcK8B/aT4aeQq99jBB8ZD4/ea', 'Trần Duy Uyên\n', 0, 'thuy07-11-17@outlook.com', '2007-11-17 00:00:00', '275 Hòa Bình, P. Tân An, Q. Ninh Kiều, TP. Cần Thơ', '01212972790', '2010-03-07 02:24:28', '2010-03-07 02:24:28', 2),
(26, 'TranQuach.Bang.Tam01_03', '$2y$10$39kmDiY64r6.5IY07q4Kf.3U///A22Lt9Z/LTzEHvGIr8gxs9hnQ2', 'Trần Quách Băng Tâm\n', 0, 'T.QBTam.0103@gmail.com', '2005-03-01 00:00:00', '200 Hoàng Văn Thụ, P. An Hội, Q. Ninh Kiều, TP. Cần Thơ', '01269396136', '2010-03-07 06:42:15', '2010-03-07 06:42:15', 2),
(27, 'linhchi1940_11_25', '$2y$10$bbZXm8bFvcHzzgdmcp2F1.i30B4QHW3X8UucsHVVbfFGEmddxn1Ti', 'Huỳnh Thị Linh Chi\n', 0, 'Linh.chi25-11@gmail.com', '1940-11-25 00:00:00', '65 QL1, P. Ba Láng, Q. Cái Răng, TP. Cần Thơ', '0918564987', '2010-03-12 06:42:15', '2010-03-12 06:42:15', 2),
(28, 'thi_cam\n-26_04', '$2y$10$TMF8L9CwBGcefxTO0nS50OypIj6Kt1p5VxSYGZNrZ7NbfCwdfgpBW', 'Võ Thi Cầm\n', 0, 'camthivo-90@hotmail.com', '1990-04-26 00:00:00', '266 Quang Trung, P.  Hưng Phú, Q. Cái Răng, TP. Cần Thơ', '09972355176', '2010-03-12 15:40:53', '2020-12-19 00:06:09', 1),
(29, 'n_t-l-ngoc_04_11_04', '$2y$10$PeJUl69mpWksx.PQNyZrDevSMpFDsI8YL6JtdEJyrDc/VYll/FOPW', 'Nguyễn Thị Lam Ngọc\n', 0, 'LAMNGOC041104@hotmail.com', '2004-11-04 00:00:00', '323 Phan Đình Phùng, P. An Lạc, Q. Ninh Kiều, TP. Cần Thơ', '01223966092', '2010-03-12 15:40:53', '2010-03-12 15:40:53', 3),
(30, 'N-T-B-Cuc-96', '$2y$10$iXknOJpdtTl7H/Tz5uWV8ek29M/yJ5x/PCyXk1tUkhVIDErzuA5FS', 'Nguyễn Thị Bạch Cúc\n', 0, 'N.T-BCUC-1996@gmail.com', '1996-02-12 00:00:00', '95/189 QL91, P. Long Hưng, Q. Ô Môn, TP. Cần Thơ', '09945363125', '2010-03-20 15:40:53', '2010-03-20 15:40:53', 3);

-- --------------------------------------------------------

--
-- Table structure for table `kho`
--

CREATE TABLE `kho` (
  `kho_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Mã kho',
  `kho_ten` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên quyền # Tên quyền',
  `kho_diachi` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'địa chỉ # địa chỉ',
  `kho_sdt` char(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'sdt # số điện thoại kho',
  `kho_quanly` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'quản lý # người quản lý kho',
  `kho_dienGiai` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Diễn giải # Diễn giải về kho',
  `kho_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo kho',
  `kho_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật kho gần nhất',
  `kho_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái kho: 1-khóa, 2-khả dụng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Kho # Các quyền quản lý';

--
-- Dumping data for table `kho`
--

INSERT INTO `kho` (`kho_ma`, `kho_ten`, `kho_diachi`, `kho_sdt`, `kho_quanly`, `kho_dienGiai`, `kho_taoMoi`, `kho_capNhat`, `kho_trangThai`) VALUES
(1, 'TPHCM', 'kho_diachi 1', '18001901', '1', 'TPHCM', '2020-01-01 01:00:00', '2020-04-21 22:02:05', 2),
(2, 'An Giang', 'kho_diachi 2', '18001902', '2', 'An Giang', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(3, 'Bà Rịa - Vũng Tàu', 'kho_diachi 3', '18001903', '3', 'Bà Rịa - Vũng Tàu', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(4, 'Bình Dương', 'kho_diachi 4', '18001904', '4', 'Bình Dương', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(5, 'Bình Phước', 'kho_diachi 5', '18001905', '5', 'Bình Phước', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(6, 'Bình Thuận', 'kho_diachi 6', '18001906', '6', 'Bình Thuận', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(7, 'Bình Định', 'kho_diachi 7', '18001907', '7', 'Bình Định', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(8, 'Bạc Liêu', 'kho_diachi 8', '18001908', '8', 'Bạc Liêu', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(9, 'Bắc Giang', 'kho_diachi 9', '18001909', '9', 'Bắc Giang', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(10, 'Bắc Kạn', 'kho_diachi 10', '180019010', '10', 'Bắc Kạn', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(11, 'Bắc Ninh', 'kho_diachi 11', '180019011', '11', 'Bắc Ninh', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(12, 'Bến Tre', 'kho_diachi 12', '180019012', '12', 'Bến Tre', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(13, 'Cao Bằng', 'kho_diachi 13', '180019013', '13', 'Cao Bằng', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(14, 'Cà Mau', 'kho_diachi 14', '180019014', '14', 'Cà Mau', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(15, 'Cần Thơ', 'kho_diachi 15', '180019015', '15', 'Cần Thơ', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(16, 'Gia Lai', 'kho_diachi 16', '180019016', '16', 'Gia Lai', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(17, 'Hà Giang', 'kho_diachi 17', '180019017', '17', 'Hà Giang', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(18, 'Hà Nam', 'kho_diachi 18', '180019018', '18', 'Hà Nam', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(19, 'Hà Nội', 'kho_diachi 19', '180019019', '19', 'Hà Nội', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(20, 'Hà Tĩnh', 'kho_diachi 20', '180019020', '20', 'Hà Tĩnh', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(21, 'Hòa Bình', 'kho_diachi 21', '180019021', '21', 'Hòa Bình', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(22, 'Hưng Yên', 'kho_diachi 22', '180019022', '22', 'Hưng Yên', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(23, 'Hải Dương', 'kho_diachi 23', '180019023', '23', 'Hải Dương', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(24, 'Hải Phòng', 'kho_diachi 24', '180019024', '24', 'Hải Phòng', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(25, 'Hậu Giang', 'kho_diachi 25', '180019025', '25', 'Hậu Giang', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(26, 'Khánh Hòa', 'kho_diachi 26', '180019026', '26', 'Khánh Hòa', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(27, 'Kiên Giang', 'kho_diachi 27', '180019027', '27', 'Kiên Giang', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(28, 'Kon Tum', 'kho_diachi 28', '180019028', '28', 'Kon Tum', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(29, 'Lai Châu', 'kho_diachi 29', '180019029', '29', 'Lai Châu', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(30, 'Long An', 'kho_diachi 30', '180019030', '30', 'Long An', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(31, 'Lào Cai', 'kho_diachi 31', '180019031', '31', 'Lào Cai', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(32, 'Lâm Đồng', 'kho_diachi 32', '180019032', '32', 'Lâm Đồng', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(33, 'Lạng Sơn', 'kho_diachi 33', '180019033', '33', 'Lạng Sơn', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(34, 'Nam Định', 'kho_diachi 34', '180019034', '34', 'Nam Định', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(35, 'Nghệ An', 'kho_diachi 35', '180019035', '35', 'Nghệ An', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(36, 'Ninh Bình', 'kho_diachi 36', '180019036', '36', 'Ninh Bình', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(37, 'Ninh Thuận', 'kho_diachi 37', '180019037', '37', 'Ninh Thuận', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(38, 'Phú Thọ', 'kho_diachi 38', '180019038', '38', 'Phú Thọ', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(39, 'Phú Yên', 'kho_diachi 39', '180019039', '39', 'Phú Yên', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(40, 'Quảng Bình', 'kho_diachi 40', '180019040', '40', 'Quảng Bình', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(41, 'Quảng Nam', 'kho_diachi 41', '180019041', '41', 'Quảng Nam', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(42, 'Quảng Ngãi', 'kho_diachi 42', '180019042', '42', 'Quảng Ngãi', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(43, 'Quảng Ninh', 'kho_diachi 43', '180019043', '43', 'Quảng Ninh', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(44, 'Quảng Trị', 'kho_diachi 44', '180019044', '44', 'Quảng Trị', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(45, 'Sóc Trăng', 'kho_diachi 45', '180019045', '45', 'Sóc Trăng', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(46, 'Sơn La', 'kho_diachi 46', '180019046', '46', 'Sơn La', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(47, 'TP HCM', 'kho_diachi 47', '180019047', '47', 'TP HCM', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(48, 'Thanh Hóa', 'kho_diachi 48', '180019048', '48', 'Thanh Hóa', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(49, 'Thái Bình', 'kho_diachi 49', '180019049', '49', 'Thái Bình', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(50, 'Thái Nguyên', 'kho_diachi 50', '180019050', '50', 'Thái Nguyên', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(51, 'Thừa Thiên Huế', 'kho_diachi 51', '180019051', '51', 'Thừa Thiên Huế', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(52, 'Tiền Giang', 'kho_diachi 52', '180019052', '52', 'Tiền Giang', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(53, 'Trà Vinh', 'kho_diachi 53', '180019053', '53', 'Trà Vinh', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(54, 'Tuyên Quang', 'kho_diachi 54', '180019054', '54', 'Tuyên Quang', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(55, 'Tây Ninh', 'kho_diachi 55', '180019055', '55', 'Tây Ninh', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(56, 'Vĩnh Long', 'kho_diachi 56', '180019056', '56', 'Vĩnh Long', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(57, 'Vĩnh Phúc', 'kho_diachi 57', '180019057', '57', 'Vĩnh Phúc', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(58, 'Yên Bái', 'kho_diachi 58', '180019058', '58', 'Yên Bái', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(59, 'Điện Biên', 'kho_diachi 59', '180019059', '59', 'Điện Biên', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(60, 'Đà Nẵng', 'kho_diachi 60', '180019060', '60', 'Đà Nẵng', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(61, 'Đắk Lắk', 'kho_diachi 61', '180019061', '61', 'Đắk Lắk', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(62, 'Đắk Nông', 'kho_diachi 62', '180019062', '62', 'Đắk Nông', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(63, 'Đồng Nai', 'kho_diachi 63', '180019063', '63', 'Đồng Nai', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2),
(64, 'Đồng Tháp', 'kho_diachi 64', '180019064', '64', 'Đồng Tháp', '2020-01-01 01:00:00', '2020-12-19 00:56:13', 2);

-- --------------------------------------------------------

--
-- Table structure for table `khuyenmai`
--

CREATE TABLE `khuyenmai` (
  `km_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Mã chương trình khuyến mãi',
  `km_ten` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên chương trình # Tên chương trình khuyến mãi',
  `km_noiDung` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Thông tin chi tiết # Nội dung chi tiết chương trình khuyến mãi',
  `km_batDau` datetime NOT NULL COMMENT 'Thời điểm bắt đầu # Thời điểm bắt đầu khuyến mãi',
  `km_ketThuc` datetime DEFAULT NULL COMMENT 'Thời điểm kết thúc # Thời điểm kết thúc khuyến mãi',
  `km_giaTri` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '100;100' COMMENT 'Giá trị khuyến mãi # Giá trị khuyến mãi trên tổng hóa đơn (giảm tiền/giảm % tiền, giảm % vận chuyển), định dạng: tien;VanChuyen',
  `nv_nguoiLap` smallint(5) UNSIGNED NOT NULL COMMENT 'Lập kế hoạch # nv_ma # nv_hoTen # Mã nhân viên (người lập chương trình khuyến mãi)',
  `km_ngayLap` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm lập # Thời điểm lập kế hoạch khuyến mãi',
  `nv_kyNhay` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Kế toán # nv_ma # nv_hoTen # Mã nhân viên (kế toán ký nháy), 1-chưa phân công',
  `km_ngayKyNhay` datetime DEFAULT NULL COMMENT 'Thời điểm ký nháy # Thời điểm ký nháy kế hoạch khuyến mãi',
  `nv_kyDuyet` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Duyệt kế hoạch # nv_ma # nv_hoTen # Mã nhân viên (thủ kho/giám đốc), 1-chưa phân công',
  `km_ngayDuyet` datetime DEFAULT NULL COMMENT 'Thời điểm duyệt # Ngày duyệt chương trình khuyến mãi',
  `km_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo chương trình khuyến mãi',
  `km_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật chương trình khuyến mãi gần nhất',
  `km_trangThai` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái chương trình khuyến mãi: 1-ngưng khuyến mãi, 2-lập kế hoạch, 3-ký nháy, 4-duyệt kế hoạch'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Chương trình khuyến mãi # Chương trình khuyến mãi';

--
-- Dumping data for table `khuyenmai`
--

INSERT INTO `khuyenmai` (`km_ma`, `km_ten`, `km_noiDung`, `km_batDau`, `km_ketThuc`, `km_giaTri`, `nv_nguoiLap`, `km_ngayLap`, `nv_kyNhay`, `km_ngayKyNhay`, `nv_kyDuyet`, `km_ngayDuyet`, `km_taoMoi`, `km_capNhat`, `km_trangThai`) VALUES
(1, 'km_ten 1', 'km_noiD 1', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 1', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-12-17 02:27:34', 1),
(2, 'km_ten 2', 'km_noiD 2', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 2', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(3, 'km_ten 3', 'km_noiD 3', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 3', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(4, 'km_ten 4', 'km_noiD 4', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 4', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(5, 'km_ten 5', 'km_noiD 5', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 5', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(6, 'km_ten 6', 'km_noiD 6', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 6', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(7, 'km_ten 7', 'km_noiD 7', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 7', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(8, 'km_ten 8', 'km_noiD 8', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 8', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(9, 'km_ten 9', 'km_noiD 9', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 9', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(10, 'km_ten 10', 'km_noiD 10', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 10', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(11, 'km_ten 11', 'km_noiD 11', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 11', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(12, 'km_ten 12', 'km_noiD 12', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 12', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(13, 'km_ten 13', 'km_noiD 13', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(14, 'km_ten 14', 'km_noiD 14', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 14', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(15, 'km_ten 15', 'km_noiD 15', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 15', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(16, 'km_ten 16', 'km_noiD 16', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 16', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(17, 'km_ten 17', 'km_noiD 17', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 17', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(18, 'km_ten 18', 'km_noiD 18', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 18', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(19, 'km_ten 19', 'km_noiD 19', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 19', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(20, 'km_ten 20', 'km_noiD 20', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 20', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(21, 'km_ten 21', 'km_noiD 21', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 21', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(22, 'km_ten 22', 'km_noiD 22', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 22', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(23, 'km_ten 23', 'km_noiD 23', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 23', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(24, 'km_ten 24', 'km_noiD 24', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 24', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(25, 'km_ten 25', 'km_noiD 25', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 25', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(26, 'km_ten 26', 'km_noiD 26', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 26', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(27, 'km_ten 27', 'km_noiD 27', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 27', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(28, 'km_ten 28', 'km_noiD 28', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 28', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(29, 'km_ten 29', 'km_noiD 29', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 29', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1),
(30, 'km_ten 30', 'km_noiD 30', '2020-04-22 04:34:13', '2020-04-22 04:34:13', 'km_giaTri 30', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', 1, '2020-04-22 04:34:13', '2020-04-21 21:34:13', '2020-04-21 21:34:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `khuyenmai_sanpham`
--

CREATE TABLE `khuyenmai_sanpham` (
  `km_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Chương trình # km_ma # km_ten # Mã chương trình khuyến mãi',
  `sp_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Sản phẩm # sp_ma # sp_ten # Mã sản phẩm',
  `m_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Màu sắc # m_ma # m_ten # Mã màu sản phẩm, 1-Phối màu (đỏ, vàng, ...)',
  `kmsp_giaTri` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '100;0' COMMENT 'Giá trị khuyến mãi # Giá trị khuyến mãi (giảm tiền/giảm % tiền, số lượng), định dạng: tien;soLuong (soLuong = 0, không giới hạn số lượng)',
  `kmsp_trangThai` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái khuyến mãi: 1-ngưng khuyến mãi, 2-có hiệu lực'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Thông tin khuyến mãi sản phẩm # Chi tiết về chương trình khuyến mãi';

--
-- Dumping data for table `khuyenmai_sanpham`
--

INSERT INTO `khuyenmai_sanpham` (`km_ma`, `sp_ma`, `m_ma`, `kmsp_giaTri`, `kmsp_trangThai`) VALUES
(1, 1, 1, 'kmsp_giaTri 1', 1),
(2, 2, 2, 'kmsp_giaTri 2', 2),
(3, 3, 3, 'kmsp_giaTri 3', 3);

-- --------------------------------------------------------

--
-- Table structure for table `loai`
--

CREATE TABLE `loai` (
  `l_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Mã loại sản phẩm',
  `l_ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên loại # Tên loại sản phẩm',
  `l_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo loại sản phẩm',
  `l_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật loại sản phẩm gần nhất',
  `l_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái loại sản phẩm: 1-khóa, 2-khả dụng',
  `l_moTa` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Loại sản phẩm # Loại sản phẩm';

--
-- Dumping data for table `loai`
--

INSERT INTO `loai` (`l_ma`, `l_ten`, `l_taoMoi`, `l_capNhat`, `l_trangThai`, `l_moTa`) VALUES
(1, 'Bình hoa', '2010-01-01 01:00:00', '2020-12-16 15:56:55', 2, 'Bình hoa cắm sẳn'),
(2, 'Bó hoa', '2010-01-01 01:00:00', '2021-01-08 00:45:04', 2, 'Bó hoa'),
(3, 'Giỏ hoa', '2010-01-01 01:00:00', '2021-01-08 00:45:11', 2, 'Giỏ hoa'),
(4, 'Hoa hộp giấy', '2010-01-01 01:00:00', '2021-01-08 00:44:25', 2, 'Hộp hoa giấy trưng bài'),
(5, 'Hoa hộp gỗ', '2010-01-01 01:00:00', '2021-01-08 00:45:26', 2, 'Hộp hoa gỗ trưng bài'),
(6, 'Hoa lẻ', '2010-01-01 01:00:00', '2021-01-08 00:45:34', 2, 'Hoa bán lẻ'),
(7, 'Kệ hoa', '2010-01-01 01:00:00', '2021-01-08 00:45:41', 2, 'Kệ hoa'),
(8, 'Phụ liệu', '2010-01-01 01:00:00', '2021-01-04 02:13:24', 2, 'Phụ kiện dùng đề cắm hoa'),
(9, 'Vòng hoa', '2010-01-01 01:00:00', '2021-01-08 00:45:52', 2, 'Vòng hoa'),
(10, 'aaaa', '2021-01-08 00:47:06', '2021-01-08 00:47:21', 1, 'aaaaa');

-- --------------------------------------------------------

--
-- Table structure for table `mau`
--

CREATE TABLE `mau` (
  `m_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Mã màu sản phẩm, 1-Phối màu (đỏ, vàng, ...)',
  `m_ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên màu # Tên màu sản phẩm',
  `m_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo màu',
  `m_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật màu gần nhất',
  `m_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái màu sản phẩm: 1-khóa, 2-khả dụng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Màu sắc # Màu sản phẩm';

--
-- Dumping data for table `mau`
--

INSERT INTO `mau` (`m_ma`, `m_ten`, `m_taoMoi`, `m_capNhat`, `m_trangThai`) VALUES
(1, 'Phối màu', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(2, 'Cam (Orange)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(3, 'Hồng (Pink)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(4, 'Ngọc bích (SeaGreen)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(5, 'Nâu (SaddleBrown)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(6, 'Trà (Teal)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(7, 'Trắng (White)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(8, 'Tím (Purple)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(9, 'Tím cà (Orchid)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(10, 'Tím sen (Magenta)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(11, 'Vàng (Yellow)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(12, 'Xanh da trời (SkyBlue)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(13, 'Xanh dương (Blue)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(14, 'Xanh lá (Green)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(15, 'Xanh lơ (Cyan)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(16, 'Xanh đọt chuối (Chartreuse)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(17, 'Đen (Black)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(18, 'Đỏ (Red)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(19, 'Đỏ sậm (Maroon)', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(20, 'Đỏ thắm (Crimson)', '2010-01-01 01:00:00', '2020-12-17 13:54:14', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mau_sanpham`
--

CREATE TABLE `mau_sanpham` (
  `sp_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Màu sắc # m_ma # m_ten # Mã sản phẩm',
  `m_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Sản phẩm # sp_ma # sp_ten # Mã màu sản phẩm',
  `msp_soluong` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Số lượng # Số lượng sản phẩm tương ứng với màu'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Số lượng sản phẩm theo màu # Số lượng sản phẩm tương ứng với các màu';

--
-- Dumping data for table `mau_sanpham`
--

INSERT INTO `mau_sanpham` (`sp_ma`, `m_ma`, `msp_soluong`) VALUES
(1, 1, 1),
(2, 2, 2),
(23, 3, 100),
(38, 16, 10);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2020_04_22_033419_create_chude_table', 1),
(4, '2020_04_22_033619_create_khachhang_table', 1),
(5, '2020_04_22_033644_create_loai_table', 1),
(6, '2020_04_22_033658_create_mau_table', 1),
(7, '2020_04_22_033715_create_quyen_table', 1),
(8, '2020_04_22_033754_create_thanhtoan_table', 1),
(9, '2020_04_22_033812_create_vanchuyen_table', 1),
(10, '2020_04_22_033951_create_xuatxu_table', 1),
(11, '2020_04_22_034011_create_donvitinh_table', 1),
(12, '2020_04_22_034029_create_kho_table', 1),
(13, '2020_04_22_034047_create_nhacungcap_table', 1),
(14, '2020_04_22_034130_create_sanpham_table', 1),
(15, '2020_04_22_034149_create_hinhanh_table', 1),
(16, '2020_04_22_034209_create_nhanvien_table', 1),
(17, '2020_04_22_034425_create_khuyenmai_table', 1),
(18, '2020_04_22_034443_create_gopy_table', 1),
(19, '2020_04_22_034513_create_mau_sanpham_table', 1),
(20, '2020_04_22_034528_create_chude_sanpham_table', 1),
(21, '2020_04_22_034544_create_donhang_table', 1),
(22, '2020_04_22_034601_create_phieunhap_table', 1),
(23, '2020_04_22_034622_create_khuyenmai_sanpham_table', 1),
(24, '2020_04_22_034642_create_hoadonsi_table', 1),
(25, '2020_04_22_034733_create_chitietnhap_table', 1),
(26, '2020_04_22_034750_create_chitietdonhang_table', 1),
(27, '2020_04_22_034802_create_hoadonle_table', 1),
(28, '2020_04_22_034844_create_doanhthu_sanpham_table', 1),
(29, '2020_04_22_034955_create_xuatkho_table', 1),
(30, '2020_04_22_035018_create_chitiet_xuatkho_table', 1),
(31, '2020_04_22_035035_create_chuyenkho_table', 1),
(32, '2020_04_22_035113_create_sanphamkho_table', 1),
(33, '2020_04_22_040016_alter_add_column_v1_to_nhanvien_table', 1),
(34, '2020_04_22_041553_create_chitiet_chuyenkho_table', 1),
(35, '2020_12_17_183954_alter_add_column_v1_to_loai_table', 2),
(36, '2020_12_19_195155_alter_add_column_v1_to_xuatkho_table', 3),
(37, '2020_12_19_195250_alter_add_column_v1_to_chuyenkho_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `nhacungcap`
--

CREATE TABLE `nhacungcap` (
  `ncc_ma` smallint(5) UNSIGNED NOT NULL COMMENT 'Mã nhà cung cấp, 1-Tự tạo',
  `ncc_ten` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên nhà cung cấp # Tên nhà cung cấp',
  `ncc_daiDien` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Đại diện # Người đại diện',
  `ncc_diaChi` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Địa chỉ # Địa chỉ',
  `ncc_dienThoai` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Điện thoại # Điện thoại',
  `ncc_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email # Email',
  `ncc_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo nhà cung cấp',
  `ncc_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật nhà cung cấp gần nhất',
  `ncc_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái nhà cung cấp: 1-khóa, 2-khả dụng',
  `xx_ma` smallint(5) UNSIGNED NOT NULL COMMENT 'Xuất xứ # xx_ma # xx_ten # Mã xuất xứ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Nhà cung cấp # Nhà cung cấp hoa';

--
-- Dumping data for table `nhacungcap`
--

INSERT INTO `nhacungcap` (`ncc_ma`, `ncc_ten`, `ncc_daiDien`, `ncc_diaChi`, `ncc_dienThoai`, `ncc_email`, `ncc_taoMoi`, `ncc_capNhat`, `ncc_trangThai`, `xx_ma`) VALUES
(1, 'F-Shop.com', 'Lương Thị Thục Uyên\n', 'Khu 2 _DHCT', '0969930917', 'lmquan17005@gmail.com', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2, 1),
(2, 'Cty TNHH TMDV Hoa Cao Cấp Nga\n Tâm', 'Phan Tâm', '191, Khóm Tân Mỹ, P. Tân Quy Đông, TP. Sa Đéc, Đồng Tháp', '01633690651', 'phantam-19710214@ymail.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 2),
(3, 'DNTN Hoa Tươi Lê Hạnh\n', 'Lê Duy Hạnh\n', '74, Khóm Sa Nhiên, P. Tân Quy Đông, TP. Sa Đéc, Đồng Tháp', '0914750233', 'leduy-hanh19860531@hotmail.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 2),
(4, 'Cty TNHH TMDV Hoa Cao Cấp Nguyễn Sa\n', 'Nguyễn Văn Sa\n', '6 Lê Lợi, Khóm Tân Mỹ, P. Tân Quy Đông, TP. Sa Đéc, Đồng Tháp', '01206603600', 'nguyen_van.sa_19830222@ymail.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 2),
(5, 'Cty TNHH MTV Hoa Lợi\n Ðôn\n', 'Dương Thành Lợi\n', '36 huyện lộ 90B, Ấp Mỹ Hòa, X. Mỹ Phong, TP. Mỹ Tho, Tiền Giang', '01680452467', 'duong.thanh.loi19701028@gmail.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 3),
(6, 'Cty TNHH TMDV Châu Châu\n', 'Đặng Châu', '176, X. Vị Thanh, H. Vị Thủy, Hậu Giang', '0974872415', 'dang.chau-20090126@yahoo.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 4),
(7, 'Cty TNHH MTV Hoa Cẩn\n Phúc\n', 'Nguyễn Duy Cẩn\n', '126, Ấp 6, X. Vị Đông, H. Vị Thủy, Hậu Giang', '0914087796', 'nguyenduycan19901207@yahoo.com.vn', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 4),
(8, 'Cty TNHH Hoa Vinh\n Bảo\n', 'Lê Công Vinh\n', '53 Ấp Lân Tây, X. Phú Sơn, H. Chợ Lách, Bến Tre', '09999471037', 'lecongvinh@ymail.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 5),
(9, 'Cty TNHH MTV Hoa Tươi Ngọc Hiền\n', 'Nguyễn Ngọc Hiền\n', '62 Ấp Phước Định, X. Bình Hòa Phước, H. Long Hồ, Vĩnh Long', '01265070517', 'nguyenngochien20061225@yahoo.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 6),
(10, 'Cty TNHH TMDV Hoa Tươi Lâm\n Lạc\n', 'Trần Nguyễn Thiên Lạc\n', '128 Ấp Phước Định, X. Bình Hòa Phước, H. Long Hồ, Vĩnh Long', '01263159599', 'tran.nguyenthien_lac@hotmail.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 6),
(11, 'Cty TNHH Hoa Tươi Ngân\n Hà\n', 'Nguyễn Thị Thanh Ngân\n', '176 Ấp Phước Định, X. Bình Hòa Phước, H. Long Hồ, Vĩnh Long', '0933956888', 'nguyenthithanhngan19880714@hotmail.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 6),
(12, 'Cty TNHH TMDV Nam\n', 'Ngô An Nam\n', '153 Thánh Mẫu, P. 7, TP. Đà Lạt, Lâm Đồng', '01290998018', 'ngo.an.nam@outlook.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 7),
(13, 'Cty TNHH MTV Hoa Cao Cấp Trần Diệu', 'Đặng Trần Diệu', '189 Mai Anh Đào, P. 8, TP. Đà Lạt, Lâm Đồng', '08686036514', 'dang-tran_dieu-20070816@yahoo.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 7),
(14, 'Cty TNHH Hoa Tươi Loan\n Trung\n', 'Vũ Thị Mai Loan\n', '84 Trương Văn Hoàn, P. 9, Tp. Đà Lạt, Lâm Đồng', '0973073343', 'vuthi.mai-loan19940104@outlook.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 7),
(15, 'DNTN Hoa Cao Cấp Hiền Mạc', 'Mạc Hiền', '45 Phù Đổng Thiên Vương, P. 8, TP. Đà Lạt, Lâm Đồng', '0960498179', 'machien20110807@ymail.com', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2, 7),
(16, 'Cty TNHH TMDV Ðông Tuyền\n', 'Nguyễn Thị Ðông Tuyền\n', '56 Nguyễn Đình Chiểu, P. 9, TP. Đà Lạt, Lâm Đồng', '0939602628', 'nguyenthidongtuyen19710329@ymail.com', '2010-01-01 01:00:00', '2020-12-17 02:35:57', 2, 7);

-- --------------------------------------------------------

--
-- Table structure for table `nhanvien`
--

CREATE TABLE `nhanvien` (
  `nv_ma` smallint(5) UNSIGNED NOT NULL COMMENT 'Mã nhân viên, 1-chưa phân công',
  `nv_taiKhoan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tài khoản # Tài khoản',
  `nv_matKhau` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Mật khẩu # Mật khẩu',
  `nv_hoTen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Họ tên # Họ tên',
  `nv_gioiTinh` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Giới tính # Giới tính: 0-Nữ, 1-Nam, 2-Khác',
  `nv_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email # Email',
  `nv_ngaySinh` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày sinh # Ngày sinh',
  `nv_diaChi` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Địa chỉ # Địa chỉ',
  `nv_dienThoai` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Điện thoại # Điện thoại',
  `nv_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo nhân viên',
  `nv_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật nhân viên gần nhất',
  `nv_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái nhân viên: 1-khóa, 2-khả dụng',
  `q_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Quyền # Mã quyền: 1-Giám đốc, 2-Quản trị, 3-Quản lý kho, 4-Kế toán, 5-Nhân viên bán hàng, 6-Nhân viên giao hàng',
  `nv_ghinhodangnhap` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Nhân viên # Nhân viên';

--
-- Dumping data for table `nhanvien`
--

INSERT INTO `nhanvien` (`nv_ma`, `nv_taiKhoan`, `nv_matKhau`, `nv_hoTen`, `nv_gioiTinh`, `nv_email`, `nv_ngaySinh`, `nv_diaChi`, `nv_dienThoai`, `nv_taoMoi`, `nv_capNhat`, `nv_trangThai`, `q_ma`, `nv_ghinhodangnhap`) VALUES
(1, 'unknown', '$2y$10$eIbXQjcCfYZIv7ih8NN9.OJwulnZmnstp20n6Cx46YtwPW9BKepI.', 'Chưa phân công', 1, 'unknown@sunshine.com', '2020-01-01 08:00:00', 'unknown', '01234567890', '2020-01-01 01:00:00', '2020-12-18 12:19:23', 2, 6, NULL),
(2, 'lttuyen', '$2y$10$LTozihGhfI5iUHlw6qlLleCEImcPvYbYD89UhNIJyh253rvwqf1T.', 'Lương Thị Thục Uyên\n', 0, 'lttuyen@sunshine.com', '1989-02-23 00:00:00', '73A/315 QL91B, P. Phước Thới, Q. Ô Môn, TP. Cần Thơ', '0891558536', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2, 1, NULL),
(3, 'vthiep', '$2y$10$YnXIXSJdjaNH2466lIdiF.vtlpSyEWutkw8PrlebopOHgzGmyV/nG', 'Võ Tiến Hiệp\n', 1, 'vthiep@sunshine.com', '1971-12-11 00:00:00', '177/195 Quang Trung, P. An Lạc, Q. Ninh Kiều, TP. Cần Thơ', '09977048360', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2, 2, NULL),
(4, 'tomtuan', '$2y$10$bYSbkUZVwHOKmNYj6QONd.IKjl9rpQcP.akvDNgjh/ZKDD6G4rm8O', 'Trần Ông Minh Tuấn\n', 1, 'tomtuan@sunshine.com', '1983-09-22 00:00:00', '247 Phan Đình Phùng, P. An Lạc, Q. Ninh Kiều, TP. Cần Thơ', '01266890462', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2, 3, NULL),
(5, 'ldthue', '$2y$10$zlUz6qV5vz2u3/g/uWZyvexbZB8f.Dgx1X/PVJP1FX1vGRPYMLS9m', 'Lâm Đặng Thu Huệ\n', 0, 'ldthue@sunshine.com', '1995-05-29 00:00:00', '177/332 Trần Kiết Tường, P. Thới Hòa, Q. Ô Môn, TP. Cần Thơ', '0966184166', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2, 4, NULL),
(6, 'tttphuong', '$2y$10$UaHM9XYFbY7vHgEouM0jNORekT8kT8Oqoy1otAjYk16PwmQTnFu02', 'Trần Thị Thiên Phương\n', 0, 'tttphuong@sunshine.com', '1996-07-05 00:00:00', '125E/68 Trần Văn Hoài, P. Xuân Khánh, Q. Ninh Kiều, TP. Cần Thơ', '01262829813', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2, 5, NULL),
(7, 'nhcuc', '$2y$10$y.Zv41T/ddb5aKf1NGEuNeZbNMZIETxssgo352sww3dOvgnZU3kOG', 'Nguyễn Hạc Cúc\n', 0, 'nhcuc@sunshine.com', '1995-07-29 00:00:00', '69 Nguyễn Truyền Thanh, P. Bình Thủy, Q. Bình Thủy, TP. Cần Thơ', '0929364053', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2, 5, NULL),
(8, 'htttrang', '$2y$10$y8BYZJBnu4D/0QK/6CrC3uvB8DQRcORjNfjVCdsaTjMIR2XFjDxcC', 'Hồ Thị Thu Trang', 0, 'htttrang@sunshine.com', '1997-06-13 00:00:00', '234 Trần Hưng Đạo, P. An Phú, Q. Ninh Kiều, TP. Cần Thơ', '0928978558', '2020-01-01 01:00:00', '2020-06-12 09:34:22', 2, 6, 'DCUaRgWdTRsH37qdia4J3QHk7nCeQv2fb0F16ZyQDqo01fV9Wakx4UnHJMX6'),
(9, 'dtctu', '$2y$10$6lW3YqHZ7X8GtOOm.NqoxOQylTCEgL7MGV2MIOpSPWksLm4Zu7NBm', 'Dương Thị Cẩm Tú', 0, 'dtctu@sunshine.com', '1997-05-09 00:00:00', '213 Lý Tự Trọng, P. An Cư, Q. Ninh Kiều, TP. Cần Thơ', '01683575942', '2020-01-01 01:00:00', '2020-06-12 09:08:18', 2, 3, 'pt8ivkwXBWVAXgZwNcuOVOJ9UzFGCqsuM6BAAd31QOIRmoZ4iNbCwN4xT8CX'),
(100, 'admin', '$2y$10$/X97D.JAzxkYaZsdZAOev.kWAPbyBbkjQ.88uPfWs4OMO5QWztZSG', 'Quản trị hệ thống', 1, 'quanb1510856@gmail.com', '2020-01-01 08:00:00', '05 Vị Thắng - Vị Thủy - Hậu Giang', '0969930917', '2020-01-01 01:00:00', '2020-01-01 01:00:00', 2, 2, 'Rzg5iOlbZuxsHE0b79OL87VCl1EtgeT3YLcVuK0FZDk0KziK3oJJ2WJ0T01G'),
(101, 'lmquan17005', '$2y$10$98MT.EvVLxHWJ9/Ern3VueOj1maBmrnhNJnaVXDUm2ZMwdhBMsrky', 'Lê Minh Quân', 1, 'quanb1510856@gmail.com', '1997-10-10 00:00:00', 'Hưng lợi Ninh kiều Cần Thơ', '0969930917', '2020-12-18 11:18:25', '2020-12-18 11:18:25', 1, 2, 'CMlhQnSciz8ELyjU3nlt2FOrNugsQ2uOLYarxX6xSO1Gh0mwuiqboO08Trf4'),
(102, 'lmquan', '$2y$10$PBKIQTLkSZQPDcxEWl0sZOmwFhlfZAFcL47rRtA8TccuVpA2RMGBi', 'Lê minh Quân', 1, 'quanb1510856@gmail.com', '1997-10-10 00:00:00', 'Hưng lợi Ninh kiều Cần Thơ', '0969930917', '2021-01-06 15:11:35', '2021-01-06 15:11:35', 1, 1, 'QT4UBcoyV3eRfSbxT3Gt1Rld6dIGAWsM13J7YvTO3sWCCwcpXKYDq17Jxe45');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phieunhap`
--

CREATE TABLE `phieunhap` (
  `pn_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Mã phiếu nhập',
  `pn_nguoiGiao` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Người giao hàng # Người giao hàng',
  `pn_soHoaDon` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Số hóa đơn # Số hóa đơn',
  `pn_ngayXuatHoaDon` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày xuất hóa đơn # Ngày xuất hóa đơn',
  `pn_ghiChu` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Ghi chú # Ghi chú phiếu nhập',
  `nv_nguoiLapPhieu` smallint(5) UNSIGNED NOT NULL COMMENT 'Lập phiếu # Mã nhân viên (người lập phiếu nhập)',
  `pn_ngayLapPhieu` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm lập phiếu # Thời điểm lập phiếu nhập kho',
  `nv_keToan` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Xác nhận # Mã nhân viên (kế toán trưởng), 1-chưa phân công',
  `pn_ngayXacNhan` datetime DEFAULT NULL COMMENT 'Thời điểm xác nhận # Thời điểm xác nhận thanh toán phiếu nhập kho',
  `nv_thuKho` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Thủ kho # Mã nhân viên (thủ kho/giám đốc), 1-chưa phân công',
  `pn_ngayNhapKho` datetime DEFAULT NULL COMMENT 'Ngày nhập kho # Ngày nhập kho',
  `pn_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo phiếu nhập',
  `pn_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật phiếu nhập gần nhất',
  `pn_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái phiếu nhập sản phẩm: 1-khóa, 2-lập phiếu, 3-thanh toán, 4-nhập kho',
  `ncc_ma` smallint(5) UNSIGNED NOT NULL COMMENT 'Nhà cung cấp # ncc_ma # ncc_ten # Mã nhà cung cấp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Phiếu nhập # Phiếu nhập';

--
-- Dumping data for table `phieunhap`
--

INSERT INTO `phieunhap` (`pn_ma`, `pn_nguoiGiao`, `pn_soHoaDon`, `pn_ngayXuatHoaDon`, `pn_ghiChu`, `nv_nguoiLapPhieu`, `pn_ngayLapPhieu`, `nv_keToan`, `pn_ngayXacNhan`, `nv_thuKho`, `pn_ngayNhapKho`, `pn_taoMoi`, `pn_capNhat`, `pn_trangThai`, `ncc_ma`) VALUES
(20, 'Lê Minh Quân', 'SPL0001', '2021-01-10 02:19:28', 'Nhập hoa cúc dại', 1, '2021-01-09 19:19:28', 9, NULL, 1, NULL, '2021-01-09 12:19:28', '2021-01-09 12:19:28', 2, 1),
(21, 'Lê Minh Quân', 'SPL0002', '2021-01-10 02:20:07', 'Nhập giỏ hoa chúc mừng', 1, '2021-01-09 19:20:07', 9, NULL, 1, NULL, '2021-01-09 12:20:07', '2021-01-09 12:20:42', 2, 1),
(22, 'Lê Minh Quân', 'SPL0003', '2021-01-10 02:20:39', 'Nhập kệ hoa khai trương', 1, '2021-01-09 19:20:39', 9, NULL, 1, NULL, '2021-01-09 12:20:39', '2021-01-09 12:20:42', 2, 1),
(23, 'Lê Minh Quân', 'SPL0004', '2021-01-10 02:21:13', 'Nhập vòng hoa khai trương', 1, '2021-01-09 19:21:13', 9, NULL, 1, NULL, '2021-01-09 12:21:13', '2021-01-09 12:21:13', 2, 4),
(24, 'Lê Minh Quân', 'SPL005', '2021-01-10 02:21:45', 'Nhập bình hoa trang trí', 1, '2021-01-09 19:21:45', 9, NULL, 1, NULL, '2021-01-09 12:21:45', '2021-01-09 12:21:45', 2, 8),
(25, 'Lê Minh Quân', 'SPL0006', '2021-01-10 02:22:35', 'Nhập hộp hoa khai trương', 1, '2021-01-09 19:22:35', 9, NULL, 1, NULL, '2021-01-09 12:22:35', '2021-01-09 12:22:35', 2, 6),
(26, 'Lê Minh Quân', 'SPL0007', '2021-01-10 02:23:12', 'Nhập hộp hoa chiaa buồn', 1, '2021-01-09 19:23:12', 9, NULL, 1, NULL, '2021-01-09 12:23:12', '2021-01-09 12:23:12', 2, 12),
(27, 'Lê Minh Quân', 'SPL0008', '2021-01-10 02:23:49', 'Nhập hộp hoa giấy chúc mừng', 1, '2021-01-09 19:23:49', 9, NULL, 1, NULL, '2021-01-09 12:23:49', '2021-01-09 12:23:49', 2, 15),
(28, 'Lê Minh Quân', 'SPL0010', '2021-01-10 02:24:33', 'Nhập bó hoa tặng người yêu', 1, '2021-01-09 19:24:33', 9, NULL, 1, NULL, '2021-01-09 12:24:33', '2021-01-09 12:24:33', 2, 3),
(29, 'Lê Minh Quân', 'SPL0011', '2021-01-10 02:25:03', 'Nhập bó hoa cưới', 1, '2021-01-09 19:25:03', 9, NULL, 1, NULL, '2021-01-09 12:25:03', '2021-01-09 12:25:03', 2, 10),
(30, 'Lê Minh Quân', 'SPL0012', '2021-01-10 02:25:36', 'Nhập vòng hoa chia buồn', 1, '2021-01-09 19:25:36', 9, NULL, 1, NULL, '2021-01-09 12:25:36', '2021-01-09 12:25:36', 2, 12),
(31, 'Lê Minh Quân', 'SPL0013', '2021-01-10 02:26:08', 'Nhập giỏ hoa chia buồn', 1, '2021-01-09 19:26:08', 9, NULL, 1, NULL, '2021-01-09 12:26:08', '2021-01-09 12:26:08', 2, 14),
(32, 'Lê Minh Quân', 'SPL0014', '2021-01-10 02:27:24', 'Nhập giỏ hoa đám cưới', 1, '2021-01-09 19:27:24', 9, NULL, 1, NULL, '2021-01-09 12:27:24', '2021-01-09 12:27:24', 2, 1),
(33, 'Lê Minh Quân', 'SPL0015', '2021-01-10 02:27:57', 'Nhập bó hoa thăm bệnh', 1, '2021-01-09 19:27:57', 9, NULL, 1, NULL, '2021-01-09 12:27:57', '2021-01-09 12:27:57', 2, 16),
(34, 'Lê Minh Quân', 'SPL0016', '2021-01-10 02:28:31', 'Nhập bình hoa phong thủy', 1, '2021-01-09 19:28:31', 9, NULL, 1, NULL, '2021-01-09 12:28:31', '2021-01-09 12:28:31', 2, 8),
(35, 'Lê Minh Quân', 'SPL0017', '2021-01-10 02:29:01', 'Nhập bình hoa để bản', 1, '2021-01-09 19:29:01', 9, NULL, 1, NULL, '2021-01-09 12:29:01', '2021-01-09 12:29:01', 2, 2),
(36, 'Lê Minh Quân', 'SPL0018', '2021-01-10 02:30:07', 'Nhập bình hoa tái chế', 1, '2021-01-09 19:30:07', 9, NULL, 1, NULL, '2021-01-09 12:30:07', '2021-01-09 12:30:07', 2, 3),
(37, 'Lê Minh Quân', 'SPL0019', '2021-01-10 02:30:47', 'Nhập hoa giáng sinh', 1, '2021-01-09 19:30:47', 9, NULL, 1, NULL, '2021-01-09 12:30:47', '2021-01-09 12:30:47', 2, 9),
(38, 'Lê Minh Quân', 'SPL0020', '2021-01-10 02:31:20', 'Nhập kệ hoa chúc mừng', 1, '2021-01-09 19:31:20', 9, NULL, 1, NULL, '2021-01-09 12:31:20', '2021-01-09 12:31:20', 2, 14),
(39, 'Lê Minh Quân', 'SPL0021', '2021-01-10 02:31:55', 'Nhập hộp hoa chúc mừng', 1, '2021-01-09 19:31:55', 9, NULL, 1, NULL, '2021-01-09 12:31:55', '2021-01-09 12:31:55', 2, 2),
(40, 'Lê Minh Quân', 'SPL0022', '2021-01-10 02:32:34', 'Nhập kệ hoa chia buồn', 1, '2021-01-09 19:32:34', 9, NULL, 1, NULL, '2021-01-09 12:32:34', '2021-01-09 12:32:34', 2, 16),
(41, 'Lê Minh Quân', 'SPL0023', '2021-01-10 02:33:16', 'Nhập hoa mẫu đơn', 1, '2021-01-09 19:33:16', 9, NULL, 1, NULL, '2021-01-09 12:33:16', '2021-01-09 12:33:16', 2, 13),
(42, 'Lê Minh Quân', 'SPL0024', '2021-01-10 02:34:06', 'Nhập hoa sen', 1, '2021-01-09 19:34:06', 9, NULL, 1, NULL, '2021-01-09 12:34:06', '2021-01-09 12:34:06', 2, 7),
(43, 'Lê Minh Quân', 'SPL0025', '2021-01-10 02:34:50', 'Nhập giỏ hoa khai trương', 1, '2021-01-09 19:34:50', 9, NULL, 1, NULL, '2021-01-09 12:34:50', '2021-01-09 12:34:50', 2, 12),
(44, 'Lê Minh Quân', 'SPL0026', '2021-01-10 02:35:27', 'Nhập bó hoa chúc mừng', 1, '2021-01-09 19:35:27', 9, NULL, 1, NULL, '2021-01-09 12:35:27', '2021-01-09 12:35:27', 2, 12),
(45, 'Lê Minh Quân', 'SPL0027', '2021-01-10 02:35:59', 'Nhập bình hoa nhỏ để bàn', 1, '2021-01-09 19:35:59', 9, NULL, 1, NULL, '2021-01-09 12:35:59', '2021-01-09 12:35:59', 2, 1),
(46, 'Lê Minh Quân', 'SPL0028', '2021-01-10 02:36:30', 'Nhập hộp hoa giấy đám cưới', 1, '2021-01-09 19:36:30', 9, NULL, 1, NULL, '2021-01-09 12:36:30', '2021-01-09 12:43:36', 2, 1),
(48, 'Lê Minh Quân', 'SPL0029', '2021-01-10 02:39:55', 'Nhập bó hoa sinh nhật', 1, '2021-01-09 19:39:55', 9, NULL, 1, NULL, '2021-01-09 12:39:55', '2021-01-09 12:39:55', 2, 13),
(49, 'Lê Minh Quân', 'SPL0030', '2021-01-10 02:40:31', 'Nhập bình hoa cổ điển', 1, '2021-01-09 19:40:31', 9, NULL, 1, NULL, '2021-01-09 12:40:31', '2021-01-09 12:40:31', 2, 13),
(50, 'Lê Minh Quân', 'SPL0031', '2021-01-10 02:41:11', 'Nhập hoa hộp gỗ khai trương', 1, '2021-01-09 19:41:11', 9, NULL, 1, NULL, '2021-01-09 12:41:11', '2021-01-09 12:41:11', 2, 14),
(51, 'Lê Minh Quân', 'SPL0032', '2021-01-10 02:41:47', 'Nhập vòng hoa đám cưới', 1, '2021-01-09 19:41:47', 9, NULL, 1, NULL, '2021-01-09 12:41:47', '2021-01-09 12:41:47', 2, 5),
(52, 'Lê Minh Quân', 'SPL0033', '2021-01-10 02:42:20', 'Nhập hoa hồng', 1, '2021-01-09 19:42:20', 9, NULL, 1, NULL, '2021-01-09 12:42:20', '2021-01-09 12:43:39', 2, 1),
(53, 'Lê Minh Quân', 'SPL0034', '2021-01-10 02:42:57', 'Nhập hoa hướng dương', 1, '2021-01-09 19:42:57', 9, NULL, 1, NULL, '2021-01-09 12:42:57', '2021-01-09 12:42:57', 2, 12),
(54, 'Lê Minh Quân', 'SPL0035', '2021-01-10 02:43:28', 'Nhập hoa đội đầu', 1, '2021-01-09 19:43:28', 9, NULL, 1, NULL, '2021-01-09 12:43:28', '2021-01-09 12:43:28', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quyen`
--

CREATE TABLE `quyen` (
  `q_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Mã quyền: 1-Giám đốc, 2-Quản trị, 3-Quản lý kho, 4-Kế toán, 5-Nhân viên bán hàng, 6-Nhân viên giao hàng',
  `q_ten` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên quyền # Tên quyền',
  `q_dienGiai` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Diễn giải # Diễn giải về quyền',
  `q_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo quyền',
  `q_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật quyền gần nhất',
  `q_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái quyền: 1-khóa, 2-khả dụng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Quyền # Các quyền quản lý';

--
-- Dumping data for table `quyen`
--

INSERT INTO `quyen` (`q_ma`, `q_ten`, `q_dienGiai`, `q_taoMoi`, `q_capNhat`, `q_trangThai`) VALUES
(1, 'Giám đốc', 'Duyệt chương trình khuyến mãi, ký tên phiếu nhập, ký tên hóa đơn, ...', '2010-01-01 01:00:00', '2020-12-17 00:19:58', 2),
(2, 'Quản trị', 'Quản lý người dùng, khách hàng, sản phẩm, ...', '2010-01-01 01:00:00', '2020-12-17 00:20:13', 2),
(3, 'Quản lý kho', 'Quản lý sản phẩm, đối tác, nhập kho, ...', '2010-01-01 01:00:00', '2020-12-17 00:20:14', 2),
(4, 'Kế toán', 'Xuất phiếu thu, ký tên hóa đơn, ...', '2010-01-01 01:00:00', '2020-12-17 00:20:15', 2),
(5, 'Nhân viên kinh doanh', 'Lập kế hoạch khuyến mãi, lập hóa đơn, xử lý đơn hàng, ...', '2010-01-01 01:00:00', '2020-12-17 00:20:15', 1),
(6, 'Nhân viên giao hàng', 'Lập phiếu giao hàng, giao sản phẩm, ...', '2010-01-01 01:00:00', '2020-12-17 00:20:16', 2),
(7, 'Admin', 'admin', '2021-01-06 15:36:34', '2021-01-06 15:36:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `sp_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Mã sản phẩm',
  `sp_ten` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên sản phẩm # Tên sản phẩm',
  `sp_giaGoc` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Giá gốc # Giá gốc của sản phẩm',
  `sp_giaBan` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Giá bán # Giá bán hiện tại của sản phẩm',
  `sp_hinh` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hình đại diện # Hình đại diện của sản phẩm',
  `sp_thongTin` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Thông tin # Thông tin về sản phẩm',
  `sp_danhGia` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0;0;0;0;0' COMMENT 'Chất lượng # Chất lượng của sản phẩm (1-5 sao), định dạng: 1;2;3;4;5',
  `sp_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo sản phẩm',
  `sp_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật sản phẩm gần nhất',
  `sp_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái sản phẩm: 1-khóa, 2-khả dụng',
  `l_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Loại sản phẩm # l_ma # l_ten # Mã loại sản phẩm',
  `dvt_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Đơn vị tính # dvt_ma # dvt_ten # Mã đơn vị tính sản phẩm',
  `kho_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Kho sản phẩm # kho_ma # kho_ten # Mã kho sản phẩm'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Sản phẩm # Sản phẩm: hoa, giỏ hoa, vòng hoa, ...';

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`sp_ma`, `sp_ten`, `sp_giaGoc`, `sp_giaBan`, `sp_hinh`, `sp_thongTin`, `sp_danhGia`, `sp_taoMoi`, `sp_capNhat`, `sp_trangThai`, `l_ma`, `dvt_ma`, `kho_ma`) VALUES
(1, 'Hoa cúc dại', 1000, 1900, 'cucdai1.jpg', 'Hoa cúc dại', '1;2;3;4', '2020-12-19 06:12:31', '2020-12-18 23:12:31', 2, 6, 2, 30),
(2, 'Giỏ hoa chúc mừng', 200000, 299000, 'giohoachucmung.jpg', 'Giỏ hoa chúc mừng', 'Giỏ hoa cắm sẳn chúc mừng', '2020-04-21 21:34:13', '2021-01-09 13:03:00', 2, 3, 2, 15),
(3, 'Kệ hoa khai trương', 300000, 390000, 'kehoakhaitruong2.jpg', 'Kệ hoa khai trương', 'Kệ hoa mừng khai trương', '2020-04-21 21:34:13', '2020-12-14 07:09:38', 2, 7, 3, 49),
(4, 'Vòng hoa mừng khai trương', 400000, 499000, 'vonghoakhaitruong.jpg', 'Vòng hoa mừng khai trương', 'Vòng hoa cắm sẳn mừng khai trương', '2020-04-21 21:34:13', '2020-12-16 00:51:33', 2, 9, 2, 25),
(5, 'Bình hoa trang trí', 500000, 599000, 'binhhoatrangtri1.jpg', 'Bình hoa trang trí trong nhà', 'Bình hoa cắm sẳn trang trí trong nhà', '2020-04-21 21:34:13', '2020-12-16 01:16:43', 2, 1, 3, 33),
(6, 'Hộp hoa khai trương', 600000, 699000, 'hopgiayhoakhaitruong.jpg', 'hộp giấy hoa khai trương', 'Hộp giấy hoa cắm sẳn khai trương', '2020-04-21 21:34:13', '2020-12-27 15:13:15', 2, 4, 1, 15),
(7, 'Hộp hoa chia buồn', 700000, 799000, 'hoahopgiaychiabuon.jpg', 'Hộp giấy hoa chia buồn', 'hộp giấy hoa cắm sẳn chia buồn', '2020-04-21 21:34:13', '2020-12-16 00:25:49', 2, 4, 2, 42),
(8, 'Hộp giấy hoa chúc mừng', 80000, 100000, 'hoahopgiaychucmung.jpg', 'Hoa hộp giấy cắm sản chúc mừng', 'Hộp giấy hoa cắm sẳn chúc mừng', '2020-04-21 21:34:13', '2020-12-16 00:52:01', 2, 4, 2, 32),
(9, 'Bó hoa tặng người yêu', 90000, 199000, 'bohoatangnguoiyeu.jpg', 'Bó hoa tặng người yêu', 'Bó hoa cắm sẳn tặng người yêu', '2020-04-21 21:34:13', '2020-12-16 01:00:04', 2, 2, 3, 64),
(10, 'Bó hoa cưới', 100000, 199000, 'bohoacuoi.jpg', 'Bó hoa cầm tay cô dâu', 'Bó hoa cưới cầm tay', '2020-04-21 21:34:13', '2020-12-16 01:03:00', 2, 2, 1, 2),
(11, 'Vòng hoa chia buồn', 600000, 699000, 'vonghoachiabuon1.jpg', 'Vòng hoa chia buồn', 'Vòng hoa chia buồn', '2020-04-21 21:34:13', '2020-12-16 01:32:56', 2, 9, 2, 64),
(12, 'Giỏ hoa chia buồn', 120000, 199000, 'giohoachiabuon.jpg', 'Giỏ hoa chia buồn', 'Giỏ hoa cắm sẳn chia buồn', '2020-04-21 21:34:13', '2020-12-16 00:46:33', 2, 3, 2, 3),
(13, 'Giỏ hoa đám cưới', 130000, 199000, 'giohoadamcuoi1.jpg', 'Giỏ hoa đám cưới', 'Giỏi hoa cắm sản đám cưới', '2020-04-21 21:34:13', '2020-12-16 00:53:39', 2, 3, 3, 5),
(14, 'Bó hoa thăm bệnh', 140000, 199000, 'bohoathambenh.jpg', 'Bó hoa thăm người bệnh', 'Bó hoa cắm sẳn thăm bệnh', '2020-04-21 21:34:13', '2020-12-16 01:05:48', 2, 2, 2, 41),
(15, 'Bình hoa phong thủy', 150000, 299000, 'binhhoaphongthuy.jpg', 'Bình hoa phong thủy', 'Bình hoa phong thủy', '2020-04-21 21:34:13', '2020-12-16 01:18:56', 2, 1, 3, 31),
(16, 'Bình hoa để bàn', 160000, 299000, 'binhhoadeban.jpg', 'Bình hoa để bàn', 'Bình hoa để bàn', '2020-04-21 21:34:13', '2020-12-16 01:20:40', 2, 1, 3, 18),
(17, 'Bình hoa tái chế', 170000, 299000, 'binhhoataiche1.jpg', 'Bình hoa tái chế', 'Bình hoa tái chế', '2020-04-21 21:34:13', '2020-12-16 01:24:27', 2, 1, 3, 42),
(18, 'Hoa giáng sinh', 18000, 19000, 'hoa_noel.jpg', 'Hoa mừng ngày giáng sinh', 'Vòng hoa treo cửa mừng ngày giáng sinh', '2020-04-21 21:34:13', '2020-12-14 06:47:18', 2, 9, 1, 7),
(19, 'Kệ hoa chúc mừng', 300000, 399000, 'kehoachucmung.jpg', 'Kệ hoa chúc mừng', 'Kệ hoa chúc mừng', '2020-04-21 21:34:13', '2020-12-14 07:19:20', 2, 7, 2, 4),
(20, 'Hộp hoa chúc mừng', 200000, 299000, 'hoahopgochucmung.jpg', 'Hoa hộp gỗ', 'Hoa hộp gỗ chúc mừng', '2020-04-21 21:34:13', '2020-12-14 07:40:59', 2, 5, 3, 53),
(21, 'Kệ hoa chia buồn', 210000, 299000, 'kehoachiabuon.jpg', 'Kệ hoa chia buồn', 'Kệ hoa đám tang', '2020-04-21 21:34:13', '2020-12-14 07:36:02', 2, 7, 3, 16),
(22, 'Hoa mẫu đơn', 22000, 29000, 'maudon2.jpg', 'Hoa mẫu đơn', 'Loài hoa biểu tượng cho sắc đẹp', '2020-04-21 21:34:13', '2020-12-16 01:33:20', 2, 6, 2, 51),
(23, 'Hoa sen', 13000, 19000, 'hoasen.jpg', 'Hoa sen Việt Nam', 'Loài hoa gần gủi với người Việt Nam', '2020-04-21 21:34:13', '2020-12-16 01:33:40', 2, 6, 2, 14),
(24, 'Giỏi hoa khai trương', 240000, 299000, 'giohoakhaitruong.jpg', 'Giỏ hoa khai trương', 'Giỏ hoa cắm sẳn mừng khai trương', '2020-04-21 21:34:13', '2020-12-16 00:56:36', 2, 3, 2, 33),
(25, 'Bó hoa chúc mừng', 250000, 299000, 'bohoachucmung.jpg', 'Bó hoa chúc mừng', 'Bó hoa cắm sẳn chúc mừng', '2020-04-21 21:34:13', '2020-12-16 01:07:55', 2, 2, 3, 9),
(26, 'Bình hoa để bàn nhỏ', 260000, 399000, 'binhhoadebannho1.jpg', 'Bình hoa để bàn nhỏ', 'Bình hoa để bàn nhỏ', '2020-04-21 21:34:13', '2020-12-16 01:27:15', 2, 1, 2, 14),
(27, 'Hộp giấy hoa đám cưới', 270000, 299000, 'hoahopgiaydamcuoi.jpg', 'Hoa hộp giấy đám cưới', 'Hoa hộp giấy cắm sản đám cưới', '2020-04-21 21:34:13', '2020-12-16 00:35:35', 2, 4, 1, 34),
(28, 'Bó hoa sinh nhật', 280000, 399000, 'bohoachucmungsinhnhat.jpg', 'Bó hoa chúc mừng sinh nhật', 'Bó hoa cắm sẳn chúc mừng sinh nhật', '2020-04-21 21:34:13', '2020-12-16 01:13:54', 2, 2, 1, 57),
(29, 'Bình hoa cổ điển', 290000, 399000, 'binhhoacodien1.jpg', 'Bình hoa phong cách cổ điển', 'Bình hoa cổ điển', '2020-04-21 21:34:13', '2020-12-16 01:31:47', 2, 1, 3, 1),
(30, 'Hoa hộp gỗ khai trương', 300000, 399000, 'hopgohoakhaitruong1.jpg', 'Hộp gỗ hoa mừng khai trương', 'Hộp gỗ cắm sẳn hoa mừng khai trương', '2020-04-21 21:34:13', '2020-12-16 00:14:44', 2, 5, 3, 24),
(33, 'Vòng hoa đám cưới', 10000, 11000, 'hoadamcuoi.jpg', 'Hoa trang trí đám cưới', 'Hoa trang trí đám cưới phong cách châu âu', '2020-04-22 05:03:00', '2020-12-14 06:53:49', 2, 9, 3, 64),
(34, 'Hoa hồng', 10000, 13000, 'hoahong.jpg', 'Hoa hồng pháp', 'Hàng cao cấp', '2020-12-09 17:00:00', '2020-12-09 17:00:00', 2, 6, 2, 15),
(35, 'Hoa hướng dương', 9000, 12000, 'huongduong1.jpg', 'Hoa hướng dương canada', 'Hàng cao cấp', '2020-12-09 17:00:00', '2020-12-09 17:00:00', 2, 6, 3, 15),
(36, 'Hoa đội đầu', 100000, 120000, 'hoadoidau.jpg', 'Vòng hoa đội đầu', 'Vòng hoa đội đầu giành cho nữ', '2020-12-13 17:00:00', '2020-12-13 17:00:00', 2, 9, 2, 15),
(37, 'Phụ liệu', 100000, 199000, '7.png', 'phụ liệu', 'phụ liệu', '2020-12-09 17:00:00', '2021-01-06 14:04:44', 1, 8, 3, 16),
(38, 'Bình gốm cắm hoa', 100000, 199000, 'firefox-logo-300x310.png', 'Bình gốm cắm hoa để bàn', '1;2;3;4;5', '2020-12-18 20:57:19', '2021-01-06 14:04:47', 1, 8, 2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `sanphamkho`
--

CREATE TABLE `sanphamkho` (
  `kho_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Mã kho',
  `sp_ma` bigint(20) UNSIGNED NOT NULL COMMENT 'Sản phẩm # sp_ma # sp_ten # Mã sản phẩm',
  `spk_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo sản phẩm kho',
  `spk_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật sản phẩm kho gần nhất',
  `sl_nhap` int(11) NOT NULL,
  `sl_xuat` int(11) NOT NULL,
  `sl_ton` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Sản phẩm kho # Sản phẩm kho';

--
-- Dumping data for table `sanphamkho`
--

INSERT INTO `sanphamkho` (`kho_ma`, `sp_ma`, `spk_taoMoi`, `spk_capNhat`, `sl_nhap`, `sl_xuat`, `sl_ton`) VALUES
(1, 29, '2021-01-09 12:40:31', '2021-01-09 12:40:31', 21, 0, 21),
(2, 10, '2021-01-09 12:25:03', '2021-01-09 12:25:03', 5, 0, 5),
(3, 12, '2021-01-09 12:26:08', '2021-01-09 12:26:08', 7, 0, 7),
(4, 19, '2021-01-09 12:31:20', '2021-01-09 12:31:20', 6, 0, 6),
(5, 13, '2021-01-09 12:27:24', '2021-01-09 12:27:24', 2, 0, 2),
(7, 18, '2021-01-09 12:30:47', '2021-01-09 12:30:47', 4, 0, 4),
(9, 25, '2021-01-09 12:35:27', '2021-01-09 12:35:27', 3, 0, 3),
(14, 23, '2021-01-09 12:34:06', '2021-01-09 12:34:06', 22, 0, 22),
(14, 26, '2021-01-09 12:35:59', '2021-01-09 12:35:59', 4, 0, 4),
(15, 2, '2021-01-09 13:03:00', '2021-01-09 13:03:00', 7, 0, 7),
(15, 6, '2021-01-09 12:22:35', '2021-01-09 12:22:35', 6, 0, 6),
(15, 34, '2021-01-09 12:42:20', '2021-01-09 12:42:20', 59, 0, 59),
(15, 35, '2021-01-09 12:42:57', '2021-01-09 12:42:57', 95, 0, 95),
(15, 36, '2021-01-09 12:43:28', '2021-01-09 12:43:28', 1, 0, 1),
(16, 21, '2021-01-09 12:32:34', '2021-01-09 12:32:34', 1, 0, 1),
(18, 16, '2021-01-09 12:29:01', '2021-01-09 12:29:01', 3, 0, 3),
(24, 30, '2021-01-09 12:41:11', '2021-01-09 12:41:11', 4, 0, 4),
(25, 4, '2021-01-09 12:21:13', '2021-01-09 12:21:13', 2, 0, 2),
(30, 1, '2021-01-09 12:19:29', '2021-01-09 12:19:29', 100, 0, 100),
(31, 2, '2021-01-09 12:20:07', '2021-01-09 12:20:07', 10, 10, 0),
(31, 15, '2021-01-09 12:28:31', '2021-01-09 12:28:31', 11, 0, 11),
(32, 8, '2021-01-09 12:23:49', '2021-01-09 12:23:49', 9, 0, 9),
(33, 5, '2021-01-09 12:21:45', '2021-01-09 12:21:45', 8, 0, 8),
(33, 24, '2021-01-09 12:34:50', '2021-01-09 12:34:50', 1, 0, 1),
(34, 27, '2021-01-09 12:36:30', '2021-01-09 12:36:30', 11, 0, 11),
(41, 14, '2021-01-09 12:27:57', '2021-01-09 12:27:57', 3, 0, 3),
(42, 7, '2021-01-09 12:23:12', '2021-01-09 12:23:12', 1, 0, 1),
(42, 17, '2021-01-09 12:30:07', '2021-01-09 12:30:07', 7, 0, 7),
(49, 3, '2021-01-09 12:20:39', '2021-01-09 12:20:39', 3, 0, 3),
(51, 22, '2021-01-09 12:33:16', '2021-01-09 12:33:16', 30, 0, 30),
(53, 20, '2021-01-09 12:31:55', '2021-01-09 12:31:55', 3, 0, 3),
(57, 28, '2021-01-09 12:39:55', '2021-01-09 12:39:55', 5, 0, 5),
(64, 9, '2021-01-09 12:24:33', '2021-01-09 12:24:33', 4, 0, 4),
(64, 11, '2021-01-09 12:25:36', '2021-01-09 12:25:36', 3, 0, 3),
(64, 33, '2021-01-09 12:41:47', '2021-01-09 12:41:47', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `thanhtoan`
--

CREATE TABLE `thanhtoan` (
  `tt_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Mã phương thức thanh toán',
  `tt_ten` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên phương thức # Tên phương thức thanh toán',
  `tt_dienGiai` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Thông tin # Thông tin về phương thức thanh toán',
  `tt_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo phương thức thanh toán',
  `tt_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật phương thức thanh toán gần nhất',
  `tt_trangThai` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái phương thức thanh toán: 1-khóa, 2-hiển thị'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Phương thức thanh toán # Phương thức thanh toán';

--
-- Dumping data for table `thanhtoan`
--

INSERT INTO `thanhtoan` (`tt_ma`, `tt_ten`, `tt_dienGiai`, `tt_taoMoi`, `tt_capNhat`, `tt_trangThai`) VALUES
(1, 'Tiền mặt', 'Quý khách thanh toán trực tiếp tại cửa hàng', '2010-01-01 01:00:00', '2020-12-17 00:11:42', 2),
(2, 'Thanh toán khi nhận hàng', 'Nhân viên của chúng tôi sẽ liên lạc với Quý khách để nhận thông tin về địa chỉ và thời gian giao hàng. Nhân viên của chúng tôi sẽ đến giao hàng và nhận tiền sau khi Quý khách đã nhận và kiểm tra hàng.', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(3, 'Chuyển khoản', 'Quý khách có thể đến bất kì Phòng giao dịch ngân hàng, ATM hoặc sử dụng tính năng Internet Banking để chuyển tiền vào một trong các tài khoản sau:Lưu ý: Sau khi thanh toán, Quý khách cần thông báo lại cho chúng tôi thông tin chuyển khoản của Quý khách bao gồm: Tên người chuyển và số điện thoại hoặc nội dung chuyển khoản để chúng tôi kiểm tra thông tin.HOTLINE HỖ TRỢ THANH TOÁN: 0939.123.456', '2010-01-01 01:00:00', '2020-12-17 00:13:06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vanchuyen`
--

CREATE TABLE `vanchuyen` (
  `vc_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Mã dịch vụ giao hàng',
  `vc_ten` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên dịch vụ # Tên dịch vụ giao hàng',
  `vc_chiPhi` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Phí giao hàng # Phí giao hàng',
  `vc_dienGiai` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Thông tin # Thông tin về dịch vụ giao hàng',
  `vc_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo dịch vụ giao hàng',
  `vc_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật dịch vụ giao hàng gần nhất',
  `vc_trangThai` tinyint(3) UNSIGNED NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái dịch vụ giao hàng: 1-khóa, 2-hiển thị'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Dịch vụ giao hàng # Dịch vụ giao hàng';

--
-- Dumping data for table `vanchuyen`
--

INSERT INTO `vanchuyen` (`vc_ma`, `vc_ten`, `vc_chiPhi`, `vc_dienGiai`, `vc_taoMoi`, `vc_capNhat`, `vc_trangThai`) VALUES
(1, 'Miễn phí', 0, 'Nhận hàng trực tiếp tại cửa hàng.', '2010-01-01 01:00:00', '2020-12-17 00:05:17', 2),
(2, 'Miễn phí (trong vòng 24h)', 0, 'Chỉ áp dụng tại nội ô Tp. Cần Thơ và đơn hàng được nhận trước ngày gửi ít nhất là 2 ngày.', '2010-01-01 01:00:00', '2020-12-16 16:01:15', 2),
(3, 'Ưu tiên (trong vòng 8h)', 30000, 'Chỉ áp dụng tại nội ô Tp. Cần Thơ', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 1),
(4, 'Miễn phí (vận chuyển thường)', 0, 'Áp dụng cho các tỉnh thành. Quý khách sẽ thanh toán phí vận chuyển của bưu điện.', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(5, 'Miễn phí (vận chuyển nhanh)', 0, 'Áp dụng cho các tỉnh thành. Quý khách sẽ thanh toán phí vận chuyển của bưu điện.', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `xuatkho`
--

CREATE TABLE `xuatkho` (
  `xk_ma` tinyint(3) UNSIGNED NOT NULL COMMENT 'Mã xuất kho',
  `xk_ngaylap` date NOT NULL,
  `xk_diachi` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `xk_lydo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Lý do # Lý do xuất kho',
  `xk_tongtien` decimal(10,2) NOT NULL,
  `xk_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên xuất kho',
  `xk_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật xuất kho gần nhất',
  `nv_ma` smallint(5) UNSIGNED NOT NULL COMMENT 'Chương trình # nv_ma # Mã nhân viên',
  `xk_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái phiếu xuất sản phẩm: 1-khóa, 2-khả dụng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Xuất kho # Xuất kho';

--
-- Dumping data for table `xuatkho`
--

INSERT INTO `xuatkho` (`xk_ma`, `xk_ngaylap`, `xk_diachi`, `xk_lydo`, `xk_tongtien`, `xk_taoMoi`, `xk_capNhat`, `nv_ma`, `xk_trangThai`) VALUES
(28, '2021-01-09', '95/189 QL91, P. Long Hưng, Q. Ô Môn, TP. Cần Thơ', 'Xuất', '299000.00', '2021-01-09 12:44:35', '2021-01-09 12:44:35', 100, 2),
(29, '2021-01-09', 'P. An Lạc, Q. Ninh Kiều, TP. Cần Thơ', 'Thử', '299000.00', '2021-01-09 12:50:19', '2021-01-09 12:50:19', 9, 2),
(30, '2021-01-09', 'Cần thơ', 'Thử', '299000.00', '2021-01-09 13:02:35', '2021-01-09 13:02:35', 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `xuatxu`
--

CREATE TABLE `xuatxu` (
  `xx_ma` smallint(5) UNSIGNED NOT NULL COMMENT 'Mã xuất xứ',
  `xx_ten` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Xuất xứ # Xuất xứ của sản phẩm',
  `xx_taoMoi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm tạo # Thời điểm đầu tiên tạo xuất xứ',
  `xx_capNhat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Thời điểm cập nhật # Thời điểm cập nhật xuất xứ gần nhất',
  `xx_trangThai` tinyint(4) NOT NULL DEFAULT '2' COMMENT 'Trạng thái # Trạng thái xuất xứ: 1-khóa, 2-khả dụng'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Xuất xứ # Xuất xứ của sản phẩm';

--
-- Dumping data for table `xuatxu`
--

INSERT INTO `xuatxu` (`xx_ma`, `xx_ten`, `xx_taoMoi`, `xx_capNhat`, `xx_trangThai`) VALUES
(1, 'Kết hợp', '2010-01-01 01:00:00', '2020-12-17 01:40:43', 2),
(2, 'Tân Quy Đông, Sa Đéc', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(3, 'Mỹ Phong, Mỹ Tho', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(4, 'Vị Thanh, Hậu Giang', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(5, 'Cái Mơn, Bến Tre', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(6, 'Phước Định, Vĩnh Long', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2),
(7, 'Đà Lạt', '2010-01-01 01:00:00', '2010-01-01 01:00:00', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD PRIMARY KEY (`dh_ma`,`sp_ma`,`m_ma`),
  ADD KEY `chitietdonhang_m_ma_foreign` (`m_ma`),
  ADD KEY `chitietdonhang_sp_ma_foreign` (`sp_ma`);

--
-- Indexes for table `chitietnhap`
--
ALTER TABLE `chitietnhap`
  ADD PRIMARY KEY (`pn_ma`,`sp_ma`,`m_ma`),
  ADD KEY `chitietnhap_m_ma_foreign` (`m_ma`),
  ADD KEY `chitietnhap_sp_ma_foreign` (`sp_ma`);

--
-- Indexes for table `chitiet_chuyenkho`
--
ALTER TABLE `chitiet_chuyenkho`
  ADD PRIMARY KEY (`ck_ma`,`sp_ma`),
  ADD KEY `chitiet_chuyenkho_sp_ma_foreign` (`sp_ma`),
  ADD KEY `chitiet_chuyenkho_khocu_ma_foreign` (`khocu_ma`),
  ADD KEY `chitiet_chuyenkho_khomoi_ma_foreign` (`khomoi_ma`);

--
-- Indexes for table `chitiet_xuatkho`
--
ALTER TABLE `chitiet_xuatkho`
  ADD PRIMARY KEY (`sp_ma`,`xk_ma`),
  ADD KEY `chitiet_xuatkho_xk_ma_foreign` (`xk_ma`);

--
-- Indexes for table `chude`
--
ALTER TABLE `chude`
  ADD PRIMARY KEY (`cd_ma`),
  ADD UNIQUE KEY `chude_cd_ma_cd_ten_unique` (`cd_ma`,`cd_ten`);

--
-- Indexes for table `chude_sanpham`
--
ALTER TABLE `chude_sanpham`
  ADD PRIMARY KEY (`sp_ma`,`cd_ma`),
  ADD KEY `chude_sanpham_cd_ma_foreign` (`cd_ma`);

--
-- Indexes for table `chuyenkho`
--
ALTER TABLE `chuyenkho`
  ADD PRIMARY KEY (`ck_ma`),
  ADD KEY `chuyenkho_nv_ma_foreign` (`nv_ma`);

--
-- Indexes for table `doanhthu_sanpham`
--
ALTER TABLE `doanhthu_sanpham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doanhthu_sanpham_sp_ma_foreign` (`sp_ma`);

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`dh_ma`),
  ADD KEY `donhang_kh_ma_foreign` (`kh_ma`),
  ADD KEY `donhang_nv_giaohang_foreign` (`nv_giaoHang`),
  ADD KEY `donhang_nv_xuly_foreign` (`nv_xuLy`),
  ADD KEY `donhang_tt_ma_foreign` (`tt_ma`),
  ADD KEY `donhang_vc_ma_foreign` (`vc_ma`);

--
-- Indexes for table `donvitinh`
--
ALTER TABLE `donvitinh`
  ADD PRIMARY KEY (`dvt_ma`),
  ADD UNIQUE KEY `donvitinh_dvt_ten_unique` (`dvt_ten`);

--
-- Indexes for table `gopy`
--
ALTER TABLE `gopy`
  ADD PRIMARY KEY (`gy_ma`),
  ADD KEY `gopy_kh_ma_foreign` (`kh_ma`),
  ADD KEY `gopy_sp_ma_foreign` (`sp_ma`);

--
-- Indexes for table `hinhanh`
--
ALTER TABLE `hinhanh`
  ADD PRIMARY KEY (`sp_ma`,`ha_stt`);

--
-- Indexes for table `hoadonle`
--
ALTER TABLE `hoadonle`
  ADD PRIMARY KEY (`hdl_ma`),
  ADD KEY `hoadonle_dh_ma_foreign` (`dh_ma`),
  ADD KEY `hoadonle_nv_laphoadon_foreign` (`nv_lapHoaDon`);

--
-- Indexes for table `hoadonsi`
--
ALTER TABLE `hoadonsi`
  ADD PRIMARY KEY (`hds_ma`),
  ADD KEY `hoadonsi_dh_ma_foreign` (`dh_ma`),
  ADD KEY `hoadonsi_nv_laphoadon_foreign` (`nv_lapHoaDon`),
  ADD KEY `hoadonsi_nv_thutruong_foreign` (`nv_thuTruong`),
  ADD KEY `hoadonsi_tt_ma_foreign` (`tt_ma`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`kh_ma`),
  ADD UNIQUE KEY `khachhang_kh_taikhoan_kh_email_kh_dienthoai_unique` (`kh_taiKhoan`,`kh_email`,`kh_dienThoai`);

--
-- Indexes for table `kho`
--
ALTER TABLE `kho`
  ADD PRIMARY KEY (`kho_ma`),
  ADD UNIQUE KEY `kho_kho_ten_unique` (`kho_ten`);

--
-- Indexes for table `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD PRIMARY KEY (`km_ma`),
  ADD UNIQUE KEY `khuyenmai_km_ten_unique` (`km_ten`),
  ADD KEY `khuyenmai_nv_kyduyet_foreign` (`nv_kyDuyet`),
  ADD KEY `khuyenmai_nv_kynhay_foreign` (`nv_kyNhay`),
  ADD KEY `khuyenmai_nv_nguoilap_foreign` (`nv_nguoiLap`);

--
-- Indexes for table `khuyenmai_sanpham`
--
ALTER TABLE `khuyenmai_sanpham`
  ADD PRIMARY KEY (`km_ma`,`sp_ma`,`m_ma`),
  ADD KEY `khuyenmai_sanpham_m_ma_foreign` (`m_ma`),
  ADD KEY `khuyenmai_sanpham_sp_ma_foreign` (`sp_ma`);

--
-- Indexes for table `loai`
--
ALTER TABLE `loai`
  ADD PRIMARY KEY (`l_ma`),
  ADD UNIQUE KEY `loai_l_ten_unique` (`l_ten`);

--
-- Indexes for table `mau`
--
ALTER TABLE `mau`
  ADD PRIMARY KEY (`m_ma`),
  ADD UNIQUE KEY `mau_m_ten_unique` (`m_ten`);

--
-- Indexes for table `mau_sanpham`
--
ALTER TABLE `mau_sanpham`
  ADD PRIMARY KEY (`sp_ma`,`m_ma`),
  ADD KEY `mau_sanpham_m_ma_foreign` (`m_ma`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD PRIMARY KEY (`ncc_ma`),
  ADD UNIQUE KEY `nhacungcap_ncc_ten_ncc_dienthoai_ncc_email_unique` (`ncc_ten`,`ncc_dienThoai`,`ncc_email`),
  ADD KEY `nhacungcap_xx_ma_foreign` (`xx_ma`);

--
-- Indexes for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`nv_ma`),
  ADD UNIQUE KEY `nhanvien_nv_taikhoan_nv_email_nv_dienthoai_unique` (`nv_taiKhoan`,`nv_email`,`nv_dienThoai`),
  ADD KEY `nhanvien_q_ma_foreign` (`q_ma`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD PRIMARY KEY (`pn_ma`),
  ADD UNIQUE KEY `phieunhap_pn_sohoadon_unique` (`pn_soHoaDon`),
  ADD KEY `phieunhap_ncc_ma_foreign` (`ncc_ma`),
  ADD KEY `phieunhap_nv_ketoan_foreign` (`nv_keToan`),
  ADD KEY `phieunhap_nv_nguoilapphieu_foreign` (`nv_nguoiLapPhieu`),
  ADD KEY `phieunhap_nv_thukho_foreign` (`nv_thuKho`);

--
-- Indexes for table `quyen`
--
ALTER TABLE `quyen`
  ADD PRIMARY KEY (`q_ma`),
  ADD UNIQUE KEY `quyen_q_ten_unique` (`q_ten`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`sp_ma`),
  ADD UNIQUE KEY `sanpham_sp_ten_unique` (`sp_ten`),
  ADD KEY `sanpham_l_ma_foreign` (`l_ma`),
  ADD KEY `sanpham_dvt_ma_foreign` (`dvt_ma`),
  ADD KEY `sanpham_kho_ma_foreign` (`kho_ma`);

--
-- Indexes for table `sanphamkho`
--
ALTER TABLE `sanphamkho`
  ADD PRIMARY KEY (`kho_ma`,`sp_ma`),
  ADD KEY `sanphamkho_sp_ma_foreign` (`sp_ma`);

--
-- Indexes for table `thanhtoan`
--
ALTER TABLE `thanhtoan`
  ADD PRIMARY KEY (`tt_ma`),
  ADD UNIQUE KEY `thanhtoan_tt_ten_unique` (`tt_ten`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vanchuyen`
--
ALTER TABLE `vanchuyen`
  ADD PRIMARY KEY (`vc_ma`),
  ADD UNIQUE KEY `vanchuyen_vc_ten_unique` (`vc_ten`);

--
-- Indexes for table `xuatkho`
--
ALTER TABLE `xuatkho`
  ADD PRIMARY KEY (`xk_ma`),
  ADD KEY `xuatkho_nv_ma_foreign` (`nv_ma`);

--
-- Indexes for table `xuatxu`
--
ALTER TABLE `xuatxu`
  ADD PRIMARY KEY (`xx_ma`),
  ADD UNIQUE KEY `xuatxu_xx_ten_unique` (`xx_ten`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chude`
--
ALTER TABLE `chude`
  MODIFY `cd_ma` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã chủ đề', AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `chuyenkho`
--
ALTER TABLE `chuyenkho`
  MODIFY `ck_ma` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã chuyển kho', AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `doanhthu_sanpham`
--
ALTER TABLE `doanhthu_sanpham`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `dh_ma` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã đơn hàng, 1-Không xuất hóa đơn', AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `donvitinh`
--
ALTER TABLE `donvitinh`
  MODIFY `dvt_ma` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã đơn vị tính sản phẩm', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gopy`
--
ALTER TABLE `gopy`
  MODIFY `gy_ma` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã góp ý', AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `hoadonle`
--
ALTER TABLE `hoadonle`
  MODIFY `hdl_ma` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã hóa đơn bán lẻ', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hoadonsi`
--
ALTER TABLE `hoadonsi`
  MODIFY `hds_ma` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã hóa đơn bán sỉ', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `kh_ma` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã khách hàng', AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `kho`
--
ALTER TABLE `kho`
  MODIFY `kho_ma` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã kho', AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `khuyenmai`
--
ALTER TABLE `khuyenmai`
  MODIFY `km_ma` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã chương trình khuyến mãi', AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `loai`
--
ALTER TABLE `loai`
  MODIFY `l_ma` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã loại sản phẩm', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mau`
--
ALTER TABLE `mau`
  MODIFY `m_ma` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã màu sản phẩm, 1-Phối màu (đỏ, vàng, ...)', AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  MODIFY `ncc_ma` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã nhà cung cấp, 1-Tự tạo', AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `nhanvien`
--
ALTER TABLE `nhanvien`
  MODIFY `nv_ma` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã nhân viên, 1-chưa phân công', AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `phieunhap`
--
ALTER TABLE `phieunhap`
  MODIFY `pn_ma` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã phiếu nhập', AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `quyen`
--
ALTER TABLE `quyen`
  MODIFY `q_ma` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã quyền: 1-Giám đốc, 2-Quản trị, 3-Quản lý kho, 4-Kế toán, 5-Nhân viên bán hàng, 6-Nhân viên giao hàng', AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `sp_ma` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã sản phẩm', AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `thanhtoan`
--
ALTER TABLE `thanhtoan`
  MODIFY `tt_ma` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã phương thức thanh toán', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vanchuyen`
--
ALTER TABLE `vanchuyen`
  MODIFY `vc_ma` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã dịch vụ giao hàng', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `xuatkho`
--
ALTER TABLE `xuatkho`
  MODIFY `xk_ma` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã xuất kho', AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `xuatxu`
--
ALTER TABLE `xuatxu`
  MODIFY `xx_ma` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Mã xuất xứ', AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdonhang`
--
ALTER TABLE `chitietdonhang`
  ADD CONSTRAINT `chitietdonhang_dh_ma_foreign` FOREIGN KEY (`dh_ma`) REFERENCES `donhang` (`dh_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietdonhang_m_ma_foreign` FOREIGN KEY (`m_ma`) REFERENCES `mau` (`m_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietdonhang_sp_ma_foreign` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitietnhap`
--
ALTER TABLE `chitietnhap`
  ADD CONSTRAINT `chitietnhap_m_ma_foreign` FOREIGN KEY (`m_ma`) REFERENCES `mau` (`m_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietnhap_pn_ma_foreign` FOREIGN KEY (`pn_ma`) REFERENCES `phieunhap` (`pn_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitietnhap_sp_ma_foreign` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitiet_chuyenkho`
--
ALTER TABLE `chitiet_chuyenkho`
  ADD CONSTRAINT `chitiet_chuyenkho_ck_ma_foreign` FOREIGN KEY (`ck_ma`) REFERENCES `chuyenkho` (`ck_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitiet_chuyenkho_khocu_ma_foreign` FOREIGN KEY (`khocu_ma`) REFERENCES `kho` (`kho_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitiet_chuyenkho_khomoi_ma_foreign` FOREIGN KEY (`khomoi_ma`) REFERENCES `kho` (`kho_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitiet_chuyenkho_sp_ma_foreign` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chitiet_xuatkho`
--
ALTER TABLE `chitiet_xuatkho`
  ADD CONSTRAINT `chitiet_xuatkho_sp_ma_foreign` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitiet_xuatkho_xk_ma_foreign` FOREIGN KEY (`xk_ma`) REFERENCES `xuatkho` (`xk_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chude_sanpham`
--
ALTER TABLE `chude_sanpham`
  ADD CONSTRAINT `chude_sanpham_cd_ma_foreign` FOREIGN KEY (`cd_ma`) REFERENCES `chude` (`cd_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chude_sanpham_sp_ma_foreign` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chuyenkho`
--
ALTER TABLE `chuyenkho`
  ADD CONSTRAINT `chuyenkho_nv_ma_foreign` FOREIGN KEY (`nv_ma`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doanhthu_sanpham`
--
ALTER TABLE `doanhthu_sanpham`
  ADD CONSTRAINT `doanhthu_sanpham_sp_ma_foreign` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `donhang`
--
ALTER TABLE `donhang`
  ADD CONSTRAINT `donhang_kh_ma_foreign` FOREIGN KEY (`kh_ma`) REFERENCES `khachhang` (`kh_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `donhang_nv_giaohang_foreign` FOREIGN KEY (`nv_giaoHang`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `donhang_nv_xuly_foreign` FOREIGN KEY (`nv_xuLy`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `donhang_tt_ma_foreign` FOREIGN KEY (`tt_ma`) REFERENCES `thanhtoan` (`tt_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `donhang_vc_ma_foreign` FOREIGN KEY (`vc_ma`) REFERENCES `vanchuyen` (`vc_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gopy`
--
ALTER TABLE `gopy`
  ADD CONSTRAINT `gopy_kh_ma_foreign` FOREIGN KEY (`kh_ma`) REFERENCES `khachhang` (`kh_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gopy_sp_ma_foreign` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hinhanh`
--
ALTER TABLE `hinhanh`
  ADD CONSTRAINT `hinhanh_sp_ma_foreign` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hoadonle`
--
ALTER TABLE `hoadonle`
  ADD CONSTRAINT `hoadonle_dh_ma_foreign` FOREIGN KEY (`dh_ma`) REFERENCES `donhang` (`dh_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hoadonle_nv_laphoadon_foreign` FOREIGN KEY (`nv_lapHoaDon`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hoadonsi`
--
ALTER TABLE `hoadonsi`
  ADD CONSTRAINT `hoadonsi_dh_ma_foreign` FOREIGN KEY (`dh_ma`) REFERENCES `donhang` (`dh_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hoadonsi_nv_laphoadon_foreign` FOREIGN KEY (`nv_lapHoaDon`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hoadonsi_nv_thutruong_foreign` FOREIGN KEY (`nv_thuTruong`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hoadonsi_tt_ma_foreign` FOREIGN KEY (`tt_ma`) REFERENCES `thanhtoan` (`tt_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `khuyenmai`
--
ALTER TABLE `khuyenmai`
  ADD CONSTRAINT `khuyenmai_nv_kyduyet_foreign` FOREIGN KEY (`nv_kyDuyet`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `khuyenmai_nv_kynhay_foreign` FOREIGN KEY (`nv_kyNhay`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `khuyenmai_nv_nguoilap_foreign` FOREIGN KEY (`nv_nguoiLap`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `khuyenmai_sanpham`
--
ALTER TABLE `khuyenmai_sanpham`
  ADD CONSTRAINT `khuyenmai_sanpham_km_ma_foreign` FOREIGN KEY (`km_ma`) REFERENCES `khuyenmai` (`km_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `khuyenmai_sanpham_m_ma_foreign` FOREIGN KEY (`m_ma`) REFERENCES `mau` (`m_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `khuyenmai_sanpham_sp_ma_foreign` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mau_sanpham`
--
ALTER TABLE `mau_sanpham`
  ADD CONSTRAINT `mau_sanpham_m_ma_foreign` FOREIGN KEY (`m_ma`) REFERENCES `mau` (`m_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mau_sanpham_sp_ma_foreign` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nhacungcap`
--
ALTER TABLE `nhacungcap`
  ADD CONSTRAINT `nhacungcap_xx_ma_foreign` FOREIGN KEY (`xx_ma`) REFERENCES `xuatxu` (`xx_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD CONSTRAINT `nhanvien_q_ma_foreign` FOREIGN KEY (`q_ma`) REFERENCES `quyen` (`q_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `phieunhap`
--
ALTER TABLE `phieunhap`
  ADD CONSTRAINT `phieunhap_ncc_ma_foreign` FOREIGN KEY (`ncc_ma`) REFERENCES `nhacungcap` (`ncc_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phieunhap_nv_ketoan_foreign` FOREIGN KEY (`nv_keToan`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phieunhap_nv_nguoilapphieu_foreign` FOREIGN KEY (`nv_nguoiLapPhieu`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phieunhap_nv_thukho_foreign` FOREIGN KEY (`nv_thuKho`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `sanpham_dvt_ma_foreign` FOREIGN KEY (`dvt_ma`) REFERENCES `donvitinh` (`dvt_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sanpham_kho_ma_foreign` FOREIGN KEY (`kho_ma`) REFERENCES `kho` (`kho_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sanpham_l_ma_foreign` FOREIGN KEY (`l_ma`) REFERENCES `loai` (`l_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sanphamkho`
--
ALTER TABLE `sanphamkho`
  ADD CONSTRAINT `sanphamkho_kho_ma_foreign` FOREIGN KEY (`kho_ma`) REFERENCES `kho` (`kho_ma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sanphamkho_sp_ma_foreign` FOREIGN KEY (`sp_ma`) REFERENCES `sanpham` (`sp_ma`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `xuatkho`
--
ALTER TABLE `xuatkho`
  ADD CONSTRAINT `xuatkho_nv_ma_foreign` FOREIGN KEY (`nv_ma`) REFERENCES `nhanvien` (`nv_ma`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
