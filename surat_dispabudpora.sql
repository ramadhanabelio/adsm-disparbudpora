-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Nov 2024 pada 21.46
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `surat_dispabudpora`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `signature`
--

CREATE TABLE `signature` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(125) NOT NULL,
  `img` varchar(125) NOT NULL,
  `rowno` varchar(125) NOT NULL,
  `append` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `signature`
--

INSERT INTO `signature` (`id`, `id_user`, `name`, `img`, `rowno`, `append`) VALUES
(1, 34, '', 'assets/signature-image/6735581bea528.png', '1474398966', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_disposisi`
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

--
-- Dumping data untuk tabel `tb_disposisi`
--

INSERT INTO `tb_disposisi` (`id_disposisi`, `id_suratmasuk`, `pengirim`, `id_tujuan`, `keterangan`, `dikembalikan`, `status_disposisi`) VALUES
(1, 1, 'Umum', 17, '', '', 1),
(2, 1, 'Operator Bagian Kepemudaan', 1, 'Laksanakan', '', 0),
(3, 2, 'Umum', 17, '', '', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jabatan`
--

CREATE TABLE `tb_jabatan` (
  `id_jabatan` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `nama_jabatan` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jabatan`
--

INSERT INTO `tb_jabatan` (`id_jabatan`, `id_unit`, `nama_jabatan`) VALUES
(1, 1, 'Kepala Dinas'),
(5, 8, 'Operator Bagian Kebudayaan'),
(10, 12, 'Umum'),
(13, 10, 'Operator Bagian Olahraga'),
(17, 9, 'Operator Bagian Kepemudaan'),
(18, 6, 'Operator Bagian Keuangan'),
(19, 7, 'Operator Bagian Pariwisata');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_surat_masuk`
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

--
-- Dumping data untuk tabel `tb_surat_masuk`
--

INSERT INTO `tb_surat_masuk` (`id_suratmasuk`, `no_surat`, `tgl_surat`, `lampiran`, `tgl_terima`, `no_agenda`, `status_surat`, `prioritas_surat`, `sifat_surat`, `dari`, `kepada`, `perihal`, `petunjuk`, `pengarsip`, `tgl_arsip`, `statuskirim`, `status`, `file`) VALUES
(2, '098', '2024-11-21', '2', '2024-11-22', '0098', 'Asli', 'Segera', 'Sangat Rahasia', 'samsat', 'Operator Bagian Kepemudaan', 'diskusi ', '', '', '0000-00-00 00:00:00', 1, 0, 'use_case_diagram_drawio2.pdf'),
(3, '123', '2024-11-21', '2', '2024-11-19', '111222', 'Asli', 'Biasa', 'Biasa', 'bapeda', 'Umum', 'diskusi ', '', '', '0000-00-00 00:00:00', 0, 0, 'use_case_diagram_drawio3.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_unit`
--

CREATE TABLE `tb_unit` (
  `id_unit` int(11) NOT NULL,
  `nama_unit` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_unit`
--

INSERT INTO `tb_unit` (`id_unit`, `nama_unit`) VALUES
(1, 'Kepala Dinas'),
(7, 'Bidang Pariwisata'),
(8, 'Bidang Kebudayaan'),
(9, 'Bidang Kepemudaan'),
(10, 'Bidang Olahraga'),
(12, 'Umum');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
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
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `nama`, `nip`, `id_unit`, `id_jabatan`, `status`, `level`) VALUES
(1, 'kepaladinas', '$2y$10$r2Mf8J7fSScAx2yIyMvH1.bJBRyKIaUhSLgBhoFuu/k5HBTmU3cgK', 'Edi Sakura, S.Pd, M.Pd', '196605141988111001', 1, 1, 1, 2),
(2, 'operatorbudaya', '$2y$10$PxYPwypaaGcjEjLmSOyLkOkjjF3GU9ZzEkbtILJ0leFVFv4QyI2jO', '', '', 8, 5, 1, 2),
(3, 'operatorpariwisata', '$2y$10$mJeGCIPo3plaOaFCBKyzcOikPegaYOkB0Pdj5zDAFks4AIhEigeTi', '', '', 7, 19, 1, 2),
(4, 'operatorkepemudaan', '$2y$10$Y89Yy7lWsxYXrLPVDAasXeUimekeCzRqRvLlN9j9jEsvmZCubQNtO', 'Sugeng', '12312312', 9, 17, 1, 2),
(5, 'operatorolahraga', '$2y$10$kUeMD9WbT3Ja8AWNY7o10O3tDDbtKt1bdO8wC3rTSNf9pbI98fJBO', '', '', 10, 13, 1, 2),
(6, 'umum', '$2y$10$Ts6sLbSdD7CdD0DKZtyNOOMT3keaVwBYj0E8FqBTwElX/Iw54m93S', 'Bambang Wicaksono', '1950401013', 12, 10, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `signature`
--
ALTER TABLE `signature`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_disposisi`
--
ALTER TABLE `tb_disposisi`
  ADD PRIMARY KEY (`id_disposisi`);

--
-- Indeks untuk tabel `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  ADD PRIMARY KEY (`id_jabatan`);

--
-- Indeks untuk tabel `tb_surat_masuk`
--
ALTER TABLE `tb_surat_masuk`
  ADD PRIMARY KEY (`id_suratmasuk`);

--
-- Indeks untuk tabel `tb_unit`
--
ALTER TABLE `tb_unit`
  ADD PRIMARY KEY (`id_unit`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `signature`
--
ALTER TABLE `signature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_disposisi`
--
ALTER TABLE `tb_disposisi`
  MODIFY `id_disposisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_jabatan`
--
ALTER TABLE `tb_jabatan`
  MODIFY `id_jabatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `tb_surat_masuk`
--
ALTER TABLE `tb_surat_masuk`
  MODIFY `id_suratmasuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_unit`
--
ALTER TABLE `tb_unit`
  MODIFY `id_unit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
