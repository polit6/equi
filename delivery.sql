-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 20, 2018 at 05:04 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delivery`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_login`
--

CREATE TABLE `customer_login` (
  `id_customer` smallint(5) UNSIGNED NOT NULL,
  `email_customer` varchar(30) DEFAULT NULL,
  `password_customer` varchar(10) DEFAULT NULL,
  `phone` int(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

CREATE TABLE `managers` (
  `username` varchar(8) NOT NULL,
  `first_name` varchar(13) DEFAULT NULL,
  `last_name` varchar(13) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `afm` int(10) UNSIGNED DEFAULT NULL,
  `amka` int(11) UNSIGNED DEFAULT NULL,
  `iban` varchar(27) DEFAULT NULL,
  `id_warehouse` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stores`
--

CREATE TABLE `stores` (
  `name` varchar(25) DEFAULT NULL,
  `id_store` int(3) UNSIGNED NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `phone` int(10) UNSIGNED DEFAULT NULL,
  `latitude` float(7,3) UNSIGNED DEFAULT NULL,
  `longitude` float(7,3) UNSIGNED DEFAULT NULL,
  `username_manager` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `manager_username` varchar(8) NOT NULL,
  `id_warehouse` int(3) UNSIGNED NOT NULL,
  `turopita` int(3) UNSIGNED DEFAULT NULL,
  `xortopita` int(3) UNSIGNED DEFAULT NULL,
  `koulouri` int(3) UNSIGNED DEFAULT NULL,
  `tost` int(3) UNSIGNED DEFAULT NULL,
  `cake` int(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_login`
--
ALTER TABLE `customer_login`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`username`),
  ADD KEY `MNGWH` (`id_warehouse`);

--
-- Indexes for table `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id_store`),
  ADD KEY `USRS` (`username_manager`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`id_warehouse`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer_login`
--
ALTER TABLE `customer_login`
  MODIFY `id_customer` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stores`
--
ALTER TABLE `stores`
  MODIFY `id_store` int(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `id_warehouse` int(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `managers`
--
ALTER TABLE `managers`
  ADD CONSTRAINT `MNGWH` FOREIGN KEY (`id_warehouse`) REFERENCES `warehouse` (`id_warehouse`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stores`
--
ALTER TABLE `stores`
  ADD CONSTRAINT `USRS` FOREIGN KEY (`username_manager`) REFERENCES `managers` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `STRWR` FOREIGN KEY (`id_warehouse`) REFERENCES `stores` (`id_store`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
