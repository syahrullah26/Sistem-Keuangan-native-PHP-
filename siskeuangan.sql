-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2023 at 09:48 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siskeuangan`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `bank_nama` varchar(255) NOT NULL,
  `bank_nomor` varchar(255) NOT NULL,
  `bank_pemilik` varchar(255) NOT NULL,
  `bank_saldo` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bank_id`, `bank_nama`, `bank_nomor`, `bank_pemilik`, `bank_saldo`) VALUES
(1, 'BNI', 'ALIEF ATHALLARIQ', '1352914857', 248971313);

-- --------------------------------------------------------

--
-- Table structure for table `hutang`
--

CREATE TABLE `hutang` (
  `hutang_id` int(11) NOT NULL,
  `hutang_tanggal` date NOT NULL,
  `hutang_nominal` int(11) NOT NULL,
  `hutang_keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori`) VALUES
(1, '01. LAINNYA'),
(10, 'UMUM1'),
(11, 'KEUANGAN'),
(12, 'REKOTORAT'),
(13, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `piutang`
--

CREATE TABLE `piutang` (
  `piutang_id` int(11) NOT NULL,
  `piutang_tanggal` date NOT NULL,
  `piutang_nominal` int(11) NOT NULL,
  `piutang_keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `piutang`
--

INSERT INTO `piutang` (`piutang_id`, `piutang_tanggal`, `piutang_nominal`, `piutang_keterangan`) VALUES
(1, '2019-06-22', 1000000, 'Hutang oleh rahman'),
(3, '2019-06-23', 70000, 'Hutang oleh jony untuk belu pulsa');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `transaksi_tanggal` date NOT NULL,
  `transaksi_jenis` enum('Pengeluaran','Pemasukan') NOT NULL,
  `transaksi_kategori` int(11) NOT NULL,
  `transaksi_nominal` int(11) NOT NULL,
  `transaksi_keterangan` text NOT NULL,
  `transaksi_foto` varchar(255) NOT NULL,
  `transaksi_bank` int(11) NOT NULL,
  `status` varchar(240) NOT NULL,
  `keterangan_status` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `transaksi_tanggal`, `transaksi_jenis`, `transaksi_kategori`, `transaksi_nominal`, `transaksi_keterangan`, `transaksi_foto`, `transaksi_bank`, `status`, `keterangan_status`) VALUES
(3, '2023-02-17', 'Pengeluaran', 1, 12000000, 'Beli Clip', '712636665_penggunaaset.jpg', 1, 'tolak', 'Di Tolak Oleh Rektor'),
(8, '2023-03-01', 'Pemasukan', 13, 500000, 'apbae', '1334165151_4285981_penggunaaset.jpg', 1, 'tolak', ''),
(9, '2023-03-01', 'Pengeluaran', 13, 555555, 'asdasd', '681047498_353176356_Penguins.jpg', 1, 'tolak', ''),
(10, '2023-03-01', 'Pengeluaran', 1, 12312321, 'asdasd', '953179391_409499481_penggunaaset.jpg', 1, 'terima', 'Di Terima Oleh Manajemen'),
(13, '2023-03-01', 'Pengeluaran', 1, 1231213, 'asdasd', '2074326688_243363506_penggunaaset.jpg', 1, 'tertunda', ''),
(14, '2023-03-01', 'Pengeluaran', 11, 102030, 'hh5h55h', '1920926723_425086861_4285981_penggunaaset.jpg', 1, 'tolak', 'Di Tolak Oleh Manajemen');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_nama` varchar(100) NOT NULL,
  `user_username` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_foto` varchar(100) DEFAULT NULL,
  `user_level` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_nama`, `user_username`, `user_password`, `user_foto`, `user_level`) VALUES
(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1408067268_asetadmin.png', 'administrator'),
(2, 'manajemen', 'manajemen', '19b51f1cbb6146adcacbce46d5bdc3f2', '848493708_user.png', 'manajemen'),
(3, 'direktur', 'direktur', '4fbfd324f5ffcdff5dbf6f019b02eca8', NULL, 'direktur'),
(5, 'achmad ', 'munsharif', '21232f297a57a5a743894a0e4a801fc3', '1846905608_neracalogin.png', 'direktur'),
(6, 'akbar', 'akbar', '4f033a0a2bf2fe0b68800a3079545cd1', '130164727_penggunaaset.jpg', 'direktur'),
(7, 'intan', 'intancu', 'b1098cab9c2db3eb9f576eb66c33449c', '754324188_penggunaaset.jpg', 'direktur');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `hutang`
--
ALTER TABLE `hutang`
  ADD PRIMARY KEY (`hutang_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `piutang`
--
ALTER TABLE `piutang`
  ADD PRIMARY KEY (`piutang_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hutang`
--
ALTER TABLE `hutang`
  MODIFY `hutang_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `piutang`
--
ALTER TABLE `piutang`
  MODIFY `piutang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
