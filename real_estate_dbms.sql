-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2025 at 12:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real estate dbms`
--

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `Agent ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Contact Number` varchar(15) NOT NULL,
  `Commission Rate` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `ClientID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Contact Number` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Preferences(Locatio,Type)` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `Property ID` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `CIty` varchar(100) NOT NULL,
  `Type` varchar(50) NOT NULL DEFAULT '(''Residential'',''Commercial'',''Industrial'')',
  `Size` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Status` varchar(100) NOT NULL DEFAULT '(status IN (''Available'',''Sold'',''Rented'')'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`Property ID`, `Address`, `CIty`, `Type`, `Size`, `Price`, `Status`) VALUES
(103, '123 Main St', 'Kampala', 'Residential', 2000, 5000000.00, 'Available'),
(244, '432 Ministers Village', 'Entebbe', 'Commercial', 3000, 70000000.00, 'Sold'),
(309, 'Bishops Street', 'Mukono', 'Commercial', 1000, 80000000.00, 'Sold'),
(321, 'Kisalu Rd', 'Masaka', 'Industrial', 5000, 60000000.00, 'Sold'),
(330, 'Lumumba Avenue', 'Kampala', 'Commercial', 1500, 40000000.00, 'Sold'),
(654, 'Temple Rd', 'Entebbe', 'Residential', 1000, 20000000.00, 'Sold'),
(670, 'Luwum Street', 'Namanve', 'Sold', 2000, 40000000.00, 'Sold'),
(705, 'Omondi Street', 'Soroti', 'Industrial', 5000, 99999999.99, 'Sold'),
(807, 'Madivan Road', 'Jinja', 'Residential', 500, 80000000.00, 'Sold'),
(986, 'Macknon Street', 'Kampala', 'Commercial', 5000, 30000000.00, 'Sold');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TransactionID` int(11) NOT NULL,
  `PropertyID` int(11) NOT NULL,
  `AgentID` int(11) NOT NULL,
  `ClientID` int(11) NOT NULL,
  `TransactionType` varchar(100) NOT NULL DEFAULT '(TransactionType IN(''buy'',''Sell'',''Rent''))',
  `Date` date NOT NULL,
  `Amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`Agent ID`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`ClientID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `Contact Number` (`Contact Number`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`Property ID`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `AgentID` (`AgentID`),
  ADD KEY `ClientID` (`ClientID`),
  ADD KEY `PropertyID` (`PropertyID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `ClientID` FOREIGN KEY (`ClientID`) REFERENCES `transactions` (`TransactionID`),
  ADD CONSTRAINT `PropertyID` FOREIGN KEY (`PropertyID`) REFERENCES `properties` (`Property ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
