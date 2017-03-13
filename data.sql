-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 12, 2017 at 11:18 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `kuis_alpha`
--

-- --------------------------------------------------------

--
-- Table structure for table `anak`
--

CREATE TABLE `anak` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggalLahir` date NOT NULL,
  `fk_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `anak`
--

INSERT INTO `anak` (`id`, `nama`, `tanggalLahir`, `fk_pegawai`) VALUES
(1, 'Umar Khairullah Al Fatih', '2017-10-10', 1),
(2, 'Usman Khairullah Al Fatih', '2019-10-10', 1),
(3, 'Bujang Kelana', '2017-11-11', 2),
(4, 'Tere Liyane', '2018-11-11', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jabatan_pegawai`
--

CREATE TABLE `jabatan_pegawai` (
  `id` int(11) NOT NULL,
  `namaJabatan` varchar(255) NOT NULL,
  `tanggalMulai` date NOT NULL,
  `tanggalSelesai` date NOT NULL,
  `fk_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jabatan_pegawai`
--

INSERT INTO `jabatan_pegawai` (`id`, `namaJabatan`, `tanggalMulai`, `tanggalSelesai`, `fk_pegawai`) VALUES
(1, 'The Conquerror', '1945-01-01', '1954-01-01', 1),
(2, 'The Wise Leader', '1954-01-02', '1964-01-01', 1),
(3, 'The Novelist', '2000-10-10', '2010-10-10', 2),
(4, 'The Epic Novelist', '2010-10-10', '2015-10-10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `tanggalLahir` date NOT NULL,
  `alamat` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `nip`, `tanggalLahir`, `alamat`) VALUES
(1, 'Muhammad Al Fatih', '198611032014041001', '1986-03-11', 'Jalan Konstantinopel no 1945'),
(2, 'Tere Liye', '196811032014041001', '1968-03-11', 'Jalan Negeri di ujung tanduk no 99');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anak`
--
ALTER TABLE `anak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pegawai_anak` (`fk_pegawai`);

--
-- Indexes for table `jabatan_pegawai`
--
ALTER TABLE `jabatan_pegawai`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pegawai` (`fk_pegawai`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anak`
--
ALTER TABLE `anak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `jabatan_pegawai`
--
ALTER TABLE `jabatan_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `anak`
--
ALTER TABLE `anak`
  ADD CONSTRAINT `fk_pegawai_anak` FOREIGN KEY (`fk_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `jabatan_pegawai`
--
ALTER TABLE `jabatan_pegawai`
  ADD CONSTRAINT `fk_pegawai` FOREIGN KEY (`fk_pegawai`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
