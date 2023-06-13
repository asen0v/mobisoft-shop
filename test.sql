-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2023 at 11:56 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessories`
--

CREATE TABLE `accessories` (
  `accID` int(11) NOT NULL,
  `accMake` varchar(250) NOT NULL,
  `accTitle` varchar(250) NOT NULL,
  `accPrice` int(10) NOT NULL,
  `accQty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `accessories`
--

INSERT INTO `accessories` (`accID`, `accMake`, `accTitle`, `accPrice`, `accQty`) VALUES
(1, 'Apple', 'Air Buds Pro 3', 249, 100),
(2, 'Samsung', 'Buds', 159, 99);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `make` varchar(250) NOT NULL,
  `model` varchar(250) NOT NULL,
  `price` int(10) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `type`, `make`, `model`, `price`, `qty`) VALUES
(1, 'phone', 'Apple', 'iPhone 14 Pro Max', 1149, 87),
(2, 'phone', 'Samsung', 'Galaxy S22+', 1099, 100),
(5, 'accessory', 'Apple', 'AirPods Pro 3', 149, 0),
(6, 'accessory', 'Apple', 'iPhone 14 Pro Max Silicone Case', 12, 14);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `itemtype` varchar(255) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userid`, `itemid`, `itemtype`, `itemname`, `qty`, `price`) VALUES
(1, 13, 1, 'phone', 'Apple iPhone 14 Pro Max', 1, 1149.00),
(2, 13, 1, 'phone', 'Apple iPhone 14 Pro Max', 2, 2298.00),
(3, 13, 1, 'phone', 'Apple iPhone 14 Pro Max', 2, 2298.00),
(4, 15, 5, 'accessory', 'Apple AirPods Pro 3', 10, 1490.00),
(5, 15, 6, 'accessory', 'Apple iPhone 14 Pro Max Silicone Case', 1, 12.00),
(6, 16, 1, 'phone', 'Apple iPhone 14 Pro Max', 2, 2298.00),
(7, 17, 5, 'accessory', 'Apple AirPods Pro 3', 3, 447.00);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uId` int(11) NOT NULL,
  `uName` varchar(255) NOT NULL,
  `uPass` varchar(255) NOT NULL,
  `uTitle` varchar(255) NOT NULL,
  `uBank` int(10) NOT NULL,
  `uType` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uId`, `uName`, `uPass`, `uTitle`, `uBank`, `uType`) VALUES
(3, 'ves', 'ves', 'Veselin Asenov', 1851, 'admin'),
(8, 'newaccount', 'new', 'This is my name', 2351, 'admin'),
(10, '123456', '123456', '123456', 3000, 'user'),
(12, 'asen0v', '123456a', 'Ves Asenov', 1851, 'user'),
(13, 'kondio', 'kondio', 'Kondiopas', 3000, 'user'),
(14, 'asd', 'asd', 'asd', 1851, 'user'),
(15, 'gosho', 'gosho', 'Georgi Pehlivanov', 1498, 'user'),
(16, 'test', 'test', 'Test Us', 702, 'user'),
(17, 'vesko', 'vesko', 'Veselin Asenov', 3702, 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`accID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessories`
--
ALTER TABLE `accessories`
  MODIFY `accID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
