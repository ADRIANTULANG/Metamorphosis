-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2022 at 12:20 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `metamorphosis`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_daily_progress`
--

CREATE TABLE `tbl_daily_progress` (
  `daily_progress_id` int(50) NOT NULL,
  `progress_daily` varchar(100) NOT NULL,
  `full_progress` varchar(50) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `date_taken` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_daily_progress`
--

INSERT INTO `tbl_daily_progress` (`daily_progress_id`, `progress_daily`, `full_progress`, `userid`, `date_taken`) VALUES
(10, '2', '3', '8', '2022-04-09 17:56:47.687858');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_diagnosis`
--

CREATE TABLE `tbl_diagnosis` (
  `diagnosis_ID` int(50) NOT NULL,
  `diagnosis` varchar(700) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `score` varchar(200) NOT NULL,
  `isActiveDiagnosis` varchar(100) NOT NULL,
  `assestment_type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_diagnosis`
--

INSERT INTO `tbl_diagnosis` (`diagnosis_ID`, `diagnosis`, `userid`, `score`, `isActiveDiagnosis`, `assestment_type`) VALUES
(46, 'Eating Disorder', '8', '1.0', 'true', 'Physical Assestment'),
(47, 'Inability to make time for oneself', '8', '1.0', 'false', 'Psychological Assestment'),
(48, 'Need to unwind', '8', '1.0', 'false', 'Spiritual Assestment');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_overall_health_selfcare`
--

CREATE TABLE `tbl_overall_health_selfcare` (
  `self_care_ID` int(50) NOT NULL,
  `self_care_type` varchar(100) NOT NULL,
  `overall_health` varchar(100) NOT NULL,
  `userid` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_overall_health_selfcare`
--

INSERT INTO `tbl_overall_health_selfcare` (`self_care_ID`, `self_care_type`, `overall_health`, `userid`) VALUES
(34, 'Physical Assestment', '82.22222222222221', '8'),
(35, 'Psychological Assestment', '84.00000000000001', '8'),
(36, 'Spiritual Assestment', '73.33333333333333', '8');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_plan`
--

CREATE TABLE `tbl_plan` (
  `plan_id` int(50) NOT NULL,
  `diagnosis_ID` varchar(50) NOT NULL,
  `diagnosis` varchar(200) NOT NULL,
  `plan` varchar(200) NOT NULL,
  `isDone` varchar(50) NOT NULL,
  `isTimer` varchar(50) NOT NULL,
  `isActive` varchar(100) NOT NULL,
  `startDate` varchar(100) NOT NULL,
  `endDate` varchar(100) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `isScheduled` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_plan`
--

INSERT INTO `tbl_plan` (`plan_id`, `diagnosis_ID`, `diagnosis`, `plan`, `isDone`, `isTimer`, `isActive`, `startDate`, `endDate`, `userid`, `isScheduled`) VALUES
(147, '46', 'Eating Disorder', 'Scheduled Eating Time', 'true', 'false', 'true', '2022-04-09 17:09:19.966770', '2022-04-09 18:09:19.966770', '8', 'true'),
(148, '46', 'Eating Disorder', 'Eat healthy foods like Vegetables, Egg, Meat & more.', 'true', 'false', 'true', '2022-04-09 17:09:19.966770', '2022-04-09 18:09:19.966770', '8', 'false'),
(149, '46', 'Eating Disorder', 'De-Stress (Breathing Exercises)', 'false', 'false', 'true', '2022-04-09 17:09:19.966770', '2022-04-09 18:09:19.966770', '8', 'false'),
(150, '47', 'Inability to make time for oneself', 'Schedule Time Off', 'false', 'false', 'false', '2022-04-09 17:09:19.987313', '2022-04-09 18:09:19.987313', '8', 'true'),
(151, '47', 'Inability to make time for oneself', 'Break Timer', 'false', 'true', 'false', '2022-04-09 17:09:19.987313', '2022-04-09 18:09:19.987313', '8', 'false'),
(152, '47', 'Inability to make time for oneself', 'Venting Out eJournal', 'false', 'false', 'false', '2022-04-09 17:09:19.987313', '2022-04-09 18:09:19.987313', '8', 'false'),
(153, '47', 'Inability to make time for oneself', 'De-Stress (Breathing Exercises)', 'false', 'false', 'false', '2022-04-09 17:09:19.987313', '2022-04-09 18:09:19.987313', '8', 'false'),
(154, '48', 'Need to unwind', 'Schedule Nature Time Mode', 'false', 'false', 'false', '2022-04-09 17:09:19.992320', '2022-04-09 18:09:19.992320', '8', 'true'),
(155, '48', 'Need to unwind', 'Write Literature/Podcast', 'false', 'false', 'false', '2022-04-09 17:09:19.992320', '2022-04-09 18:09:19.992320', '8', 'false'),
(156, '48', 'Need to unwind', 'Venting Out eJournal', 'false', 'false', 'false', '2022-04-09 17:09:19.992320', '2022-04-09 18:09:19.992320', '8', 'false'),
(157, '48', 'Need to unwind', 'De-Stress (Breathing Exercises)', 'false', 'false', 'false', '2022-04-09 17:09:19.992320', '2022-04-09 18:09:19.992320', '8', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stress_level`
--

CREATE TABLE `tbl_stress_level` (
  `stress_lvl_id` int(50) NOT NULL,
  `stress_level` varchar(100) NOT NULL,
  `stress_percent` varchar(100) NOT NULL,
  `userid` varchar(100) NOT NULL,
  `date_taken` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_stress_level`
--

INSERT INTO `tbl_stress_level` (`stress_lvl_id`, `stress_level`, `stress_percent`, `userid`, `date_taken`) VALUES
(8, 'Moderate', '0.47', '8', '2022-04-09 17:37:32.057868');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `userid` int(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `birthday` varchar(100) NOT NULL,
  `age` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `height` varchar(100) NOT NULL,
  `weight` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `career` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`userid`, `username`, `password`, `email`, `phone`, `firstname`, `lastname`, `birthday`, `age`, `gender`, `height`, `weight`, `address`, `career`) VALUES
(8, 'user', '123', 'adrian@gmail.com ', '09886762033', 'Adrian', 'Tulang', '1998-5-10', '23', 'Male', '123', '75', 'CDO', 'IT');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_weekly_progress`
--

CREATE TABLE `tbl_weekly_progress` (
  `progress_id` int(50) NOT NULL,
  `week` varchar(50) NOT NULL,
  `progress_percent` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `dateStarted` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_weekly_progress`
--

INSERT INTO `tbl_weekly_progress` (`progress_id`, `week`, `progress_percent`, `userid`, `dateStarted`) VALUES
(19, '1', '0.6666666666666666', '8', '2022-04-09 17:09:20.468844');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_daily_progress`
--
ALTER TABLE `tbl_daily_progress`
  ADD PRIMARY KEY (`daily_progress_id`);

--
-- Indexes for table `tbl_diagnosis`
--
ALTER TABLE `tbl_diagnosis`
  ADD PRIMARY KEY (`diagnosis_ID`);

--
-- Indexes for table `tbl_overall_health_selfcare`
--
ALTER TABLE `tbl_overall_health_selfcare`
  ADD PRIMARY KEY (`self_care_ID`);

--
-- Indexes for table `tbl_plan`
--
ALTER TABLE `tbl_plan`
  ADD PRIMARY KEY (`plan_id`);

--
-- Indexes for table `tbl_stress_level`
--
ALTER TABLE `tbl_stress_level`
  ADD PRIMARY KEY (`stress_lvl_id`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `tbl_weekly_progress`
--
ALTER TABLE `tbl_weekly_progress`
  ADD PRIMARY KEY (`progress_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_daily_progress`
--
ALTER TABLE `tbl_daily_progress`
  MODIFY `daily_progress_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_diagnosis`
--
ALTER TABLE `tbl_diagnosis`
  MODIFY `diagnosis_ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tbl_overall_health_selfcare`
--
ALTER TABLE `tbl_overall_health_selfcare`
  MODIFY `self_care_ID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `tbl_plan`
--
ALTER TABLE `tbl_plan`
  MODIFY `plan_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `tbl_stress_level`
--
ALTER TABLE `tbl_stress_level`
  MODIFY `stress_lvl_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `userid` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_weekly_progress`
--
ALTER TABLE `tbl_weekly_progress`
  MODIFY `progress_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
