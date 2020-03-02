-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2020 at 11:14 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `iot`
--

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `name`, `value`, `desc`, `created_at`, `updated_at`) VALUES
(3, 'is_strata_audio', '1', '1 for alert 0 for none', '2020-02-03 10:30:18.535390', '2020-02-03 10:30:18.535390'),
(4, 'is_strata_light', '1', '1 for alert 0 for none', '2020-02-03 10:30:38.862332', '2020-02-03 10:30:38.862332'),
(5, 'is_strata_sms', '1', '1 for alert 0 for none', '2020-02-03 10:35:29.213864', '2020-02-03 10:35:29.213864'),
(6, 'is_strata_email', '1', '1 for alert 0 for none', '2020-02-03 10:36:03.728165', '2020-02-03 10:36:03.728165'),
(7, 'is_water_display_warning', '1', '1 for alert 0 for none', '2020-02-03 10:36:44.651490', '2020-02-03 10:36:44.651490'),
(8, 'is_water_audio', '1', '1 for alert 0 for none', '2020-02-03 10:41:07.513964', '2020-02-03 10:41:07.513964'),
(9, 'is_water_light', '1', '1 for alert 0 for none', '2020-02-03 10:41:27.656294', '2020-02-03 10:41:27.656294'),
(10, 'is_water_sms', '1', '1 for alert 0 for none', '2020-02-03 10:41:52.686255', '2020-02-03 10:41:52.686255'),
(12, 'is_water_email', '1', '1 for alert 0 for none', '2020-02-03 15:23:21.021830', '2020-02-03 15:23:21.021830'),
(13, 'is_strata_display_warning', '1', '1 for alert 0 for none', '2020-02-03 15:23:48.326947', '2020-02-03 15:38:04.160671');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
