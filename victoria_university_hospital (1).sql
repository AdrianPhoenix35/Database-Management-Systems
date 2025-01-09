-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2025 at 03:33 PM
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
-- Database: `victoria university hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `epidemiological_data`
--

CREATE TABLE `epidemiological_data` (
  `Data_ID` int(11) NOT NULL,
  `Location_ID` int(11) NOT NULL,
  `Record_Date` date NOT NULL,
  `Cases_Per_Thousand_People` int(11) NOT NULL,
  `Rainfall` int(11) NOT NULL,
  `Averae_Temperature` decimal(5,2) NOT NULL,
  `Update_Date` date NOT NULL,
  `Added_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility_type`
--

CREATE TABLE `facility_type` (
  `Facility_Type_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `Date_Added` date NOT NULL,
  `Date_Updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geographical_location`
--

CREATE TABLE `geographical_location` (
  `Location_ID` int(11) NOT NULL,
  `Village` varchar(100) NOT NULL,
  `Parish` varchar(100) NOT NULL,
  `Sub_County` varchar(100) NOT NULL,
  `County` varchar(100) NOT NULL,
  `Region` varchar(50) NOT NULL,
  `Population` int(11) NOT NULL,
  `Cordinates` varchar(100) NOT NULL,
  `Malaria_Risk_Level` varchar(50) NOT NULL,
  `Health_Facilities_Count` int(11) NOT NULL,
  `ITN_Coverage` decimal(5,2) NOT NULL,
  `Reported_Cases` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `healty_facility`
--

CREATE TABLE `healty_facility` (
  `Facility_ID` int(11) NOT NULL,
  `Facility_Name` varchar(100) NOT NULL,
  `Location_ID` int(11) NOT NULL,
  `Facility_Type` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL,
  `Contact_Details` varchar(100) NOT NULL,
  `Date_Added` date NOT NULL,
  `Facility_Head` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interventions`
--

CREATE TABLE `interventions` (
  `Intervention_ID` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Location_ID` int(11) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Outcome` varchar(50) NOT NULL,
  `Date_Added` date NOT NULL,
  `Update_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laboratory_test`
--

CREATE TABLE `laboratory_test` (
  `Test_ID` int(11) NOT NULL,
  `Case_ID` int(11) NOT NULL,
  `Test_Type` varchar(50) NOT NULL,
  `Test_Result` varchar(50) NOT NULL,
  `Test_Date` date NOT NULL,
  `Technician_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_cases`
--

CREATE TABLE `malaria_cases` (
  `Case_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Facility_ID` int(11) NOT NULL,
  `Date_of_Diagnosis` date NOT NULL,
  `Type_of_malaria` varchar(50) NOT NULL,
  `Treatment_ID` int(11) NOT NULL,
  `Outcome_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_type`
--

CREATE TABLE `malaria_type` (
  `Type_ID` int(11) NOT NULL,
  `Type_Name` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `Date_Added` date NOT NULL,
  `Added_By` int(11) NOT NULL,
  `Update_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_data`
--

CREATE TABLE `patient_data` (
  `Patient_ID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Date_of_Birth` date NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Phone_Number` varchar(50) NOT NULL,
  `Next_of_Kin` varchar(100) NOT NULL,
  `Location_ID` int(11) NOT NULL,
  `Date_Added` date NOT NULL,
  `Update_Date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `Referral_ID` int(11) NOT NULL,
  `Case_ID` int(11) NOT NULL,
  `Referred_from` int(11) NOT NULL,
  `Referred_To` int(11) NOT NULL,
  `Referred_Date` date NOT NULL,
  `Reason` text NOT NULL,
  `Outcome_ID` int(11) NOT NULL,
  `Update_Date` date NOT NULL,
  `Referred_By` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `Resource_ID` int(11) NOT NULL,
  `Facility_ID` int(11) NOT NULL,
  `Resource_Type` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Last_Updated` date NOT NULL,
  `Description` text NOT NULL,
  `Date_Added` date NOT NULL,
  `Update_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supply_chain`
--

CREATE TABLE `supply_chain` (
  `Supply_ID` int(11) NOT NULL,
  `Resource_ID` int(11) NOT NULL,
  `Facility_ID` int(11) NOT NULL,
  `Quantity_Shipped` int(11) NOT NULL,
  `Shipment_Date` date NOT NULL,
  `Expected_Arrival_Date` date NOT NULL,
  `Shipped_By` int(11) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Update_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE `system_log` (
  `Log_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Activity` text NOT NULL,
  `Timestamp` datetime NOT NULL,
  `IP_Address` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `Training_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Training_Type` varchar(100) NOT NULL,
  `Training_Date` date NOT NULL,
  `Completion_Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `training`
--

INSERT INTO `training` (`Training_ID`, `User_ID`, `Training_Type`, `Training_Date`, `Completion_Status`) VALUES
(0, 0, '[value-3]', '0000-00-00', '[value-5]');

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `Treatment_ID` int(11) NOT NULL,
  `Treatment_Name` varchar(50) NOT NULL,
  `Treatment_Description` text NOT NULL,
  `Dosage` varchar(50) NOT NULL,
  `Side_Effects` text NOT NULL,
  `Date_Added` date NOT NULL,
  `Update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment_outcome`
--

CREATE TABLE `treatment_outcome` (
  `Outcome_ID` int(11) NOT NULL,
  `Outcome_Name` varchar(50) NOT NULL,
  `Outcome_Description` text NOT NULL,
  `Date_Added` date NOT NULL,
  `Added_By` int(11) NOT NULL,
  `Update_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `Fiirst_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Preferred_Name` varchar(50) NOT NULL,
  `Role_ID` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Faciliity_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `Role_ID` int(11) NOT NULL,
  `Role_Name` varchar(50) NOT NULL,
  `Role_Description` text NOT NULL,
  `Date_Added` date NOT NULL,
  `update_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_record`
--

CREATE TABLE `visit_record` (
  `Visit_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Visit_Number` int(11) NOT NULL,
  `Visit_Date` date NOT NULL,
  `Date_Added` date NOT NULL,
  `Update_Date` date NOT NULL,
  `Facility_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `epidemiological_data`
--
ALTER TABLE `epidemiological_data`
  ADD PRIMARY KEY (`Data_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `facility_type`
--
ALTER TABLE `facility_type`
  ADD PRIMARY KEY (`Facility_Type_ID`);

--
-- Indexes for table `geographical_location`
--
ALTER TABLE `geographical_location`
  ADD PRIMARY KEY (`Location_ID`);

--
-- Indexes for table `healty_facility`
--
ALTER TABLE `healty_facility`
  ADD PRIMARY KEY (`Facility_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `interventions`
--
ALTER TABLE `interventions`
  ADD PRIMARY KEY (`Intervention_ID`);

--
-- Indexes for table `laboratory_test`
--
ALTER TABLE `laboratory_test`
  ADD PRIMARY KEY (`Test_ID`);

--
-- Indexes for table `malaria_cases`
--
ALTER TABLE `malaria_cases`
  ADD PRIMARY KEY (`Case_ID`);

--
-- Indexes for table `malaria_type`
--
ALTER TABLE `malaria_type`
  ADD PRIMARY KEY (`Type_ID`);

--
-- Indexes for table `patient_data`
--
ALTER TABLE `patient_data`
  ADD PRIMARY KEY (`Patient_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`Referral_ID`),
  ADD KEY `Case_ID` (`Case_ID`,`Outcome_ID`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`Resource_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);

--
-- Indexes for table `supply_chain`
--
ALTER TABLE `supply_chain`
  ADD PRIMARY KEY (`Supply_ID`),
  ADD KEY `Resource_ID` (`Resource_ID`,`Facility_ID`,`Shipped_By`);

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`Log_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`Training_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`Treatment_ID`);

--
-- Indexes for table `treatment_outcome`
--
ALTER TABLE `treatment_outcome`
  ADD PRIMARY KEY (`Outcome_ID`),
  ADD KEY `Added_By` (`Added_By`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`),
  ADD KEY `Role_ID` (`Role_ID`,`Faciliity_ID`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`Role_ID`);

--
-- Indexes for table `visit_record`
--
ALTER TABLE `visit_record`
  ADD PRIMARY KEY (`Visit_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `epidemiological_data`
--
ALTER TABLE `epidemiological_data`
  ADD CONSTRAINT `Location_ID` FOREIGN KEY (`Location_ID`) REFERENCES `epidemiological_data` (`Data_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
