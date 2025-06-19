-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2024 at 11:05 AM
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
-- Database: `final3`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`) VALUES
(1, 'Admin', '', 'admin@mail.com', 'D00F5D5217896FB7FD601412CB890830');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `Id` int(10) NOT NULL,
  `admissionNo` varchar(255) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classDivId` varchar(10) NOT NULL,
  `sessionTermId` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `dateTimeTaken` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`Id`, `admissionNo`, `classId`, `classDivId`, `sessionTermId`, `status`, `dateTimeTaken`) VALUES
(285, 'AMS003', '9', '11', '6', '0', '2024-10-20'),
(284, 'AMS002', '9', '11', '6', '1', '2024-10-20'),
(283, 'AMS001', '9', '11', '6', '1', '2024-10-20'),
(286, 'AMS004', '9', '11', '6', '0', '2024-10-20'),
(287, 'AMS005', '9', '12', '6', '1', '2024-10-20'),
(288, 'AMS006', '9', '12', '6', '1', '2024-10-20'),
(289, 'AMS007', '9', '12', '6', '0', '2024-10-20'),
(290, 'AMS008', '9', '12', '6', '0', '2024-10-20'),
(291, 'AMS018', '10', '15', '6', '1', '2024-10-20'),
(292, 'AMS019', '10', '15', '6', '1', '2024-10-20'),
(293, 'AMS020', '10', '15', '6', '0', '2024-10-20'),
(294, 'AMS021', '10', '15', '6', '0', '2024-10-20'),
(295, 'AMS018', '10', '15', '6', '1', '2024-10-01'),
(296, 'AMS019', '10', '15', '6', '1', '2024-10-01'),
(297, 'AMS020', '10', '15', '6', '0', '2024-10-01'),
(298, 'AMS021', '10', '15', '6', '0', '2024-10-01'),
(303, 'AMS018', '10', '15', '6', '1', '2024-10-02'),
(304, 'AMS019', '10', '15', '6', '1', '2024-10-02'),
(305, 'AMS020', '10', '15', '6', '0', '2024-10-02'),
(306, 'AMS021', '10', '15', '6', '0', '2024-10-02'),
(307, 'AMS018', '10', '15', '6', '1', '2024-10-08'),
(308, 'AMS019', '10', '15', '6', '1', '2024-10-08'),
(309, 'AMS020', '10', '15', '6', '0', '2024-10-08'),
(315, 'AMS001', '9', '11', '6', '1', '2024-10-21'),
(316, 'AMS002', '9', '11', '6', '1', '2024-10-21'),
(317, 'AMS003', '9', '11', '6', '0', '2024-10-21'),
(318, 'AMS004', '9', '11', '6', '0', '2024-10-21'),
(323, 'AMS018', '10', '15', '6', '1', '2024-10-14'),
(324, 'AMS019', '10', '15', '6', '1', '2024-10-14'),
(325, 'AMS020', '10', '15', '6', '0', '2024-10-14'),
(326, 'AMS021', '10', '15', '6', '0', '2024-10-14'),
(327, 'AMS001', '9', '11', '6', '1', '2024-10-27'),
(328, 'AMS002', '9', '11', '6', '1', '2024-10-27'),
(329, 'AMS003', '9', '11', '6', '0', '2024-10-27'),
(330, 'AMS004', '9', '11', '6', '0', '2024-10-27'),
(331, 'AMS022', '10', '16', '6', '1', '2024-10-21'),
(332, 'AMS018', '10', '15', '6', '1', '2024-10-28'),
(333, 'AMS019', '10', '15', '6', '1', '2024-10-28'),
(334, 'AMS020', '10', '15', '6', '0', '2024-10-28'),
(335, 'AMS021', '10', '15', '6', '0', '2024-10-28'),
(336, 'AMS403', '12', '18', '6', '1', '2024-10-01'),
(337, 'AMS408', '13', '19', '6', '1', '2024-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `Id` int(10) NOT NULL,
  `className` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`Id`, `className`) VALUES
(9, 'COMP'),
(10, 'MECH'),
(11, 'ETC'),
(12, 'Bio'),
(13, 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `classdiv`
--

CREATE TABLE `classdiv` (
  `Id` int(10) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classDivName` varchar(255) NOT NULL,
  `isAssigned` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `classdiv`
--

INSERT INTO `classdiv` (`Id`, `classId`, `classDivName`, `isAssigned`) VALUES
(11, '9', 'FY', '1'),
(12, '9', 'SY', '1'),
(13, '9', 'TY', '1'),
(14, '10', 'FY', '1'),
(15, '10', 'SY', '1'),
(16, '10', 'TY', '0'),
(17, '11', 'FY', '1'),
(18, '12', 'SY', '1'),
(19, '13', 'FY', '1');

-- --------------------------------------------------------

--
-- Table structure for table `classteacher`
--

CREATE TABLE `classteacher` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNo` varchar(50) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classDivId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `classteacher`
--

INSERT INTO `classteacher` (`Id`, `firstName`, `lastName`, `emailAddress`, `password`, `phoneNo`, `classId`, `classDivId`, `dateCreated`) VALUES
(10, 'Anuj ', 'Gaude', 'teacher1@mail.com', '32250170a0dca92d53ec9624f336ca24', '1234567890', '9', '11', '2024-10-20'),
(11, 'Teacher2', 'two', 'teacher2@mail.com', '32250170a0dca92d53ec9624f336ca24', '2345678901', '9', '12', '2024-10-20'),
(12, 'Teacher3', 'Three', 'teacher3@mail.com', '32250170a0dca92d53ec9624f336ca24', '3456789012', '9', '13', '2024-10-20'),
(13, 'Teacher4', 'Four', 'teacher4@mail.com', '32250170a0dca92d53ec9624f336ca24', '4567890123', '10', '14', '2024-10-20'),
(14, 'Teacher5', 'Five', 'teacher5@mail.com', '32250170a0dca92d53ec9624f336ca24', '5678901234', '10', '15', '2024-10-20'),
(15, 'Teacher6', 'Six', 'teacher6@mail.com', '32250170a0dca92d53ec9624f336ca24', '6789012345', '10', '16', '2024-10-20'),
(17, 'Saroj', 'naidu', 'teacher8@mail.com', '32250170a0dca92d53ec9624f336ca24', '1234554321', '11', '17', '2024-10-28'),
(18, 'iorlen', 'kapoor', 'teacher10@mail.com', '32250170a0dca92d53ec9624f336ca24', '5347453253', '12', '18', '2024-10-28'),
(19, 'aarth', 'vajandar', 'teacher11@mail.com', '32250170a0dca92d53ec9624f336ca24', '8765487654', '13', '19', '2024-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Id` int(10) NOT NULL,
  `admin_id` varchar(50) NOT NULL,
  `classteacher_Id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Id`, `admin_id`, `classteacher_Id`) VALUES
(2, '1', '10'),
(3, '1', '11'),
(4, '1', '12'),
(5, '1', '13'),
(6, '1', '14'),
(7, '1', '15'),
(8, '1', '17'),
(9, '1', '18'),
(10, '1', '19');

-- --------------------------------------------------------

--
-- Table structure for table `sessionterm`
--

CREATE TABLE `sessionterm` (
  `Id` int(10) NOT NULL,
  `sessionName` varchar(50) NOT NULL,
  `termId` varchar(50) NOT NULL,
  `isActive` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sessionterm`
--

INSERT INTO `sessionterm` (`Id`, `sessionName`, `termId`, `isActive`, `dateCreated`) VALUES
(6, '2023/2024', '1', '1', '2024-10-20');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `Id` int(10) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `admissionNumber` varchar(255) NOT NULL,
  `classId` varchar(10) NOT NULL,
  `classDivId` varchar(10) NOT NULL,
  `dateCreated` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`Id`, `firstName`, `lastName`, `admissionNumber`, `classId`, `classDivId`, `dateCreated`) VALUES
(1, 'Ansh', 'Naik', 'AMS001', '9', '11', '2022-10-06'),
(2, 'Aryan', 'Patil', 'AMS002', '9', '11', '2024-10-06'),
(3, 'Samuel', 'Fernandes', 'AMS003', '9', '11', '2024-10-06'),
(4, 'Rohidas', 'Gaonkar', 'AMS004', '9', '11', '2024-10-06'),
(5, 'Pranav', 'Kerkar', 'AMS005', '9', '12', '2024-10-06'),
(6, 'Ashden', 'Mascarenhas', 'AMS006', '9', '12', '2024-10-06'),
(7, 'Sumukh', 'Prabhu', 'AMS007', '9', '12', '2024-10-06'),
(8, 'Om', 'Parab', 'AMS008', '9', '12', '2024-10-06'),
(9, 'Jay', 'Rane', 'AMS009', '9', '13', '2024-10-06'),
(10, 'Jethalal', 'Gada', 'AMS010', '9', '13', '2022-10-07'),
(11, 'Tarak', 'Mehta', 'AMS012', '9', '13', '2022-10-07'),
(12, 'Atamaram', 'Bidhe', 'AMS013', '9', '13', '2022-10-07'),
(13, 'Shavan', 'Arolkar', 'AMS014', '10', '14', '2022-10-07'),
(14, 'Yash', 'Raikar', 'AMS015', '10', '14', '2022-10-07'),
(15, 'James', 'Bond', 'AMS016', '10', '14', '2022-10-07'),
(16, 'Virat', 'Kohli', 'AMS017', '10', '14', '2022-10-07'),
(17, 'Ms', 'Dhoni', 'AMS018', '10', '15', '2022-10-07'),
(18, 'Rohit', 'Sharma', 'AMS019', '10', '15', '2024-10-14'),
(19, 'Deeptesh ', 'Phadte', 'AMS020', '10', '15', '2024-10-14'),
(20, 'vittal', 'naik', 'AMS021', '10', '15', '2022-10-14'),
(23, 'Sachin', 'Dias', 'AMS022', '10', '16', '2024-10-21'),
(24, 'Student1', 'one', 'AMS400', '11', '17', '2024-10-28'),
(25, 'student2', 'two', 'AMS403', '12', '18', '2024-10-28'),
(26, 'punvesh', 'velip', 'AMS408', '13', '19', '2024-10-28');

-- --------------------------------------------------------

--
-- Table structure for table `term`
--

CREATE TABLE `term` (
  `Id` int(10) NOT NULL,
  `termName` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `term`
--

INSERT INTO `term` (`Id`, `termName`) VALUES
(1, 'First'),
(2, 'Second');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `admissionNo` (`admissionNo`),
  ADD KEY `classId` (`classId`),
  ADD KEY `classDivId` (`classDivId`),
  ADD KEY `sessionTermId` (`sessionTermId`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `classdiv`
--
ALTER TABLE `classdiv`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `classId` (`classId`);

--
-- Indexes for table `classteacher`
--
ALTER TABLE `classteacher`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `classId` (`classId`),
  ADD KEY `classDivId` (`classDivId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `sessionterm`
--
ALTER TABLE `sessionterm`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `termId` (`termId`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `classId` (`classId`),
  ADD KEY `classDivId` (`classDivId`);

--
-- Indexes for table `term`
--
ALTER TABLE `term`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `classdiv`
--
ALTER TABLE `classdiv`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `classteacher`
--
ALTER TABLE `classteacher`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sessionterm`
--
ALTER TABLE `sessionterm`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `term`
--
ALTER TABLE `term`
  MODIFY `Id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
