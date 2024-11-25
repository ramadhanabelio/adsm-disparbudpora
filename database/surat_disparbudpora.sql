-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2024 at 04:10 AM
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
-- Database: `surat_disparbudpora`
--

-- --------------------------------------------------------

--
-- Table structure for table `signature`
--

CREATE TABLE `signature` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `img` varchar(125) NOT NULL,
  `rowno` varchar(125) NOT NULL,
  `append` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_disposisi`
--

CREATE TABLE `tb_disposisi` (
  `id_disposisi` int(11) NOT NULL,
  `id_suratmasuk` int(11) NOT NULL,
  `pengirim` varchar(125) NOT NULL,
  `id_tujuan` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `dikembalikan` text NOT NULL,
  `status_disposisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jabatan`
--

CREATE TABLE `tb_jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `nama_jabatan` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jabatan`
--

INSERT INTO `tb_jabatan` (`id_jabatan`, `id_unit`, `nama_jabatan`) VALUES
(1, 1, 'Kepala Dinas'),
(2, 2, 'Operator Bagian Pariwisata'),
(3, 3, 'Operator Bagian Kebudayaan'),
(4, 4, 'Operator Bagian Olahraga'),
(5, 5, 'Operator Bagian Kepemudaan'),
(6, 6, 'Umum');

-- --------------------------------------------------------

--
-- Table structure for table `tb_surat_masuk`
--

CREATE TABLE `tb_surat_masuk` (
  `id_suratmasuk` int(11) NOT NULL,
  `no_surat` varchar(125) NOT NULL,
  `tgl_surat` date NOT NULL,
  `lampiran` varchar(125) NOT NULL,
  `tgl_terima` date NOT NULL,
  `no_agenda` varchar(125) NOT NULL,
  `status_surat` varchar(125) NOT NULL,
  `prioritas_surat` varchar(125) NOT NULL,
  `sifat_surat` varchar(125) NOT NULL,
  `dari` text NOT NULL,
  `kepada` text NOT NULL,
  `perihal` text NOT NULL,
  `petunjuk` varchar(125) NOT NULL,
  `pengarsip` varchar(125) NOT NULL,
  `tgl_arsip` datetime NOT NULL,
  `statuskirim` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `file` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_unit`
--

CREATE TABLE `tb_unit` (
  `id_unit` int(11) NOT NULL,
  `nama_unit` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_unit`
--

INSERT INTO `tb_unit` (`id_unit`, `nama_unit`) VALUES
(1, 'Kepala Dinas'),
(2, 'Bidang Pariwisata'),
(3, 'Bidang Kebudayaan'),
(4, 'Bidang Kepemudaan'),
(5, 'Bidang Olahraga'),
(6, 'Umum');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(125) NOT NULL,
  `password` varchar(125) NOT NULL,
  `nama` text NOT NULL,
  `nip` text NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_jabatan` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `nama`, `nip`, `id_unit`, `id_jabatan`, `status`, `level`) VALUES
(1, 'kepaladinas', '$2y$10$r2Mf8J7fSScAx2yIyMvH1.bJBRyKIaUhSLgBhoFuu/k5HBTmU3cgK', 'Edi Sakura, S.Pd, M.Pd', '196605141988111001', 1, 1, 1, 2),
(2, 'operatorpariwisata', '$2y$10$mJeGCIPo3plaOaFCBKyzcOikPegaYOkB0Pdj5zDAFks4AIhEigeTi', '', '', 2, 2, 1, 2),
(3, 'operatorkebudayaan', '$2y$10$PxYPwypaaGcjEjLmSOyLkOkjjF3GU9ZzEkbtILJ0leFVFv4QyI2jO', '', '', 3, 3, 1, 2),
(4, 'operatorkepemudaan', '$2y$10$Y89Yy7lWsxYXrLPVDAasXeUimekeCzRqRvLlN9j9jEsvmZCubQNtO', '', '', 4, 4, 1, 2),
(5, 'operatorolahraga', '$2y$10$kUeMD9WbT3Ja8AWNY7o10O3tDDbtKt1bdO8wC3rTSNf9pbI98fJBO', '', '', 5, 5, 1, 2),
(6, 'umum', '$2y$10$Ts6sLbSdD7CdD0DKZtyNOOMT3keaVwBYj0E8FqBTwElX/Iw54m93S', 'Bambang Wicaksono', '1950401013', 6, 6, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `signature`
--
ALTER TABLE `signature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_disposisi`
--
ALTER TABLE `tb_disposisi`
  ADD PRIMARY KEY (`id_disposisi`);

--
-- Indexes for table `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indexes for table `tb_surat_masuk`
--
ALTER TABLE `tb_surat_masuk`
  ADD PRIMARY KEY (`id_suratmasuk`);

--
-- Indexes for table `tb_unit`
--
ALTER TABLE `tb_unit`
  ADD PRIMARY KEY (`id_unit`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `signature`
--
ALTER TABLE `signature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_disposisi`
--
ALTER TABLE `tb_disposisi`
  MODIFY `id_disposisi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `tb_surat_masuk`
--
ALTER TABLE `tb_surat_masuk`
  MODIFY `id_suratmasuk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_unit`
--
ALTER TABLE `tb_unit`
  MODIFY `id_unit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
