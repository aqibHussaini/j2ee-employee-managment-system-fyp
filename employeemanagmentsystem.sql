-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2021 at 10:23 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employeemanagmentsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(255) NOT NULL,
  `Name` varchar(300) NOT NULL,
  `Description` varchar(60000) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `Name`, `Description`, `timestamp`) VALUES
(1, 'Web Design and Development', 'this department is for web development', '2021-03-14 16:43:26'),
(2, 'Accounts and Finance', 'This is for managing accounts details', '2021-03-13 16:19:56'),
(3, 'Graphic Design', 'This department is for graphic design', '2021-03-13 16:38:57'),
(4, 'Front Office and Clerical.', 'This department is for Front Office and Clerical.', '2021-03-22 16:12:16'),
(5, 'Web Design and Development	', 'as', '2021-03-27 15:16:40'),
(6, 'ali khan', 'description', '2021-03-27 15:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `department_id` int(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `CNIC` varchar(20) NOT NULL,
  `facebook_link` varchar(255) NOT NULL,
  `instagram_link` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `joining_date` date NOT NULL,
  `display_order` int(255) NOT NULL,
  `status` int(255) NOT NULL,
  `display` int(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `Name`, `department_id`, `Email`, `Password`, `contact`, `CNIC`, `facebook_link`, `instagram_link`, `address`, `picture`, `joining_date`, `display_order`, `status`, `display`, `timestamp`) VALUES
(16, 'ali', 2, 'alihassanusman12@gmail.com', 'qkl', '03089001524', '222', 'ali@12/facebook.com', 'aklw', 'instagram.com/aqib', 'pexels-photo-129208.jpeg', '2021-03-21', 2, 1, 1, '2021-03-31 15:13:10'),
(17, 'waqas', 2, 'aqibbhatty555@gmail.com', '222', '03089001524', '222', 'ali@12/facebook.com', 'aklw', 'instagram.com/aqib', 'pexels-photo-461077.jpeg', '2021-03-21', 2, 1, 1, '2021-03-22 16:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tittle` varchar(255) NOT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` int(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `starting_date` date NOT NULL,
  `ending_date` date NOT NULL,
  `demo_link` varchar(255) NOT NULL,
  `deployed_link` varchar(255) NOT NULL,
  `display_order` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `display` tinyint(1) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`id`, `tittle`, `client_id`, `price`, `status`, `starting_date`, `ending_date`, `demo_link`, `deployed_link`, `display_order`, `picture`, `description`, `display`, `time`) VALUES
(2, 'online library system', 1, 10, 2, '2021-03-23', '2021-03-24', 'google.com', '', 2, 'pexels-photo-428338.jpeg', 'kk', 1, '2021-03-23 12:31:11');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `status` int(255) NOT NULL,
  `starting_date` datetime NOT NULL,
  `deadline` datetime NOT NULL,
  `submitted_date` datetime NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `employee_ibfk_1` (`department_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `project_id` (`project_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `task_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
