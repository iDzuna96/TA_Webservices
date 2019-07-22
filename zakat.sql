-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 22, 2019 at 04:34 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zakat`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbBobot`
--

CREATE TABLE `tbBobot` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `poin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbCalon`
--

CREATE TABLE `tbCalon` (
  `id` int(11) NOT NULL,
  `noKK` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbKategori`
--

CREATE TABLE `tbKategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `idBobot` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbPengelompokan`
--

CREATE TABLE `tbPengelompokan` (
  `id` int(11) NOT NULL,
  `noKK` int(11) NOT NULL,
  `idKategori` int(11) NOT NULL,
  `umur` int(11) NOT NULL,
  `tanggungan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbBobot`
--
ALTER TABLE `tbBobot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbCalon`
--
ALTER TABLE `tbCalon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `noKK` (`noKK`);

--
-- Indexes for table `tbKategori`
--
ALTER TABLE `tbKategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idBobot` (`idBobot`);

--
-- Indexes for table `tbPengelompokan`
--
ALTER TABLE `tbPengelompokan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `noKK` (`noKK`),
  ADD KEY `idKategori` (`idKategori`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbBobot`
--
ALTER TABLE `tbBobot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbCalon`
--
ALTER TABLE `tbCalon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbKategori`
--
ALTER TABLE `tbKategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbKategori`
--
ALTER TABLE `tbKategori`
  ADD CONSTRAINT `tbkategori_ibfk_1` FOREIGN KEY (`idBobot`) REFERENCES `tbBobot` (`id`);

--
-- Constraints for table `tbPengelompokan`
--
ALTER TABLE `tbPengelompokan`
  ADD CONSTRAINT `tbpengelompokan_ibfk_1` FOREIGN KEY (`noKK`) REFERENCES `tbCalon` (`noKK`),
  ADD CONSTRAINT `tbpengelompokan_ibfk_2` FOREIGN KEY (`idKategori`) REFERENCES `tbKategori` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
