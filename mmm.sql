-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2024 at 09:49 AM
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
-- Database: `mmm`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `Name` varchar(255) DEFAULT NULL,
  `Customer_ID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`Name`, `Customer_ID`) VALUES
('Sarosh', '03116185711'),
('tyt', '6456456'),
('gfdg', '76575467567');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Contact_Info` varchar(255) NOT NULL,
  `Age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_ID`, `Name`, `Contact_Info`, `Age`) VALUES
('EMPL', 'Haneef', '03116185711', 20),
('EMPB', 'Haroon', '03116185734', 25),
('EMPC', 'Hamza', '03450486711', 35);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Cost` int(11) DEFAULT NULL,
  `Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Name`, `Cost`, `Stock`) VALUES
('B1', 'Biscuits', 50, 1),
('C1', 'Choclate', 100, 467),
('L1', 'Lays', 50, 400);

-- --------------------------------------------------------

--
-- Table structure for table `request_supplier`
--

CREATE TABLE `request_supplier` (
  `Product_ID` varchar(50) NOT NULL,
  `Product_Name` varchar(50) NOT NULL,
  `QuantityRequired` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `Sales_ID` varchar(255) NOT NULL,
  `Product_ID` varchar(255) DEFAULT NULL,
  `Customer_ID` varchar(255) DEFAULT NULL,
  `Payment_Option` varchar(255) DEFAULT NULL,
  `Date` varchar(255) DEFAULT NULL,
  `Amount` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`Sales_ID`, `Product_ID`, `Customer_ID`, `Payment_Option`, `Date`, `Amount`) VALUES
('65aa4ea9e049c', 'B1', '03116185711', 'cash', '2024-01-19 15:27:53', 150),
('65d46609ec12e', 'C1', '76575467567', 'cash', '2024-02-20 13:42:49', 100),
('65d46621996ca', 'B1', '6456456', 'cash', '2024-02-20 13:43:13', 50);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_ID` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Contact_Info` varchar(255) NOT NULL,
  `Supplier_Of` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_ID`, `Name`, `Contact_Info`, `Supplier_Of`) VALUES
('SUPL', 'Rafay', '03116185711', 'Lays'),
('SUPC', 'Rauf', '031161876533', 'Chocolate'),
('SUPB', 'Haris', '03450485766', 'Biscuits');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Contact_Info`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `request_supplier`
--
ALTER TABLE `request_supplier`
  ADD UNIQUE KEY `ProductName` (`Product_Name`),
  ADD KEY `pidd` (`Product_ID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`Sales_ID`),
  ADD KEY `fk_sales_product` (`Product_ID`),
  ADD KEY `jefk` (`Customer_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Contact_Info`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `request_supplier`
--
ALTER TABLE `request_supplier`
  ADD CONSTRAINT `pid` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pidd` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk_sales_product` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jefk` FOREIGN KEY (`Customer_ID`) REFERENCES `client` (`Customer_ID`) ON UPDATE NO ACTION,
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
