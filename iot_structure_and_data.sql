-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2020 at 06:46 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

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
-- Table structure for table `accident_records`
--

CREATE TABLE `accident_records` (
  `id` int(11) NOT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `situation_mines` varchar(255) DEFAULT NULL,
  `name_address` varchar(255) DEFAULT NULL,
  `vil_pin` varchar(255) DEFAULT NULL,
  `date_hour_accident` datetime(6) DEFAULT NULL,
  `accident_location` varchar(255) DEFAULT NULL,
  `killed_num` int(11) DEFAULT NULL,
  `injured_num` int(11) DEFAULT NULL,
  `accident_cause_description` varchar(255) DEFAULT NULL,
  `person_names` varchar(255) DEFAULT NULL,
  `emp_nat` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `injury_death_cause` varchar(255) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `alternateprodmodel`
--

CREATE TABLE `alternateprodmodel` (
  `id` int(11) NOT NULL,
  `prod_id` varchar(100) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL,
  `batch_number` varchar(100) DEFAULT NULL,
  `alter_product` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_emp`
--

CREATE TABLE `attendance_emp` (
  `id` int(11) NOT NULL,
  `mine_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `ab_pr_date` date DEFAULT NULL,
  `ab_pr` varchar(255) DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `leave_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance_emp`
--

INSERT INTO `attendance_emp` (`id`, `mine_id`, `shift_id`, `emp_id`, `ab_pr_date`, `ab_pr`, `leave_type`, `leave_no`) VALUES
(16, 1, 1, 1, '2020-01-22', 'Present', 'None', 0),
(17, 1, 1, 1, '2020-01-24', 'Absent', 'None', 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(54, 'pbkdf2_sha256$150000$VvTBCvotj97r$0msL1fuiyUkfwg1KJPO9Xu+sg7v/x5i+tagjS4j2N8k=', '2020-03-24 15:21:12.963942', 1, 'admin', 'ADmin', 'ADmin', 'admin@gmail.com', 1, 1, '2020-01-22 11:01:15.005492'),
(55, 'pbkdf2_sha256$150000$qKYs7sNHnrCx$yF0EcnsE2s2sdCHfjLm5nVjc/EBUzpi2WzX8NLiksns=', '2020-03-23 14:20:28.208920', 0, 'cimfr', 'CSIRR', 'CIMFR', 'cimfr@gmail.com', 0, 1, '2020-01-22 12:11:46.893992'),
(57, 'pbkdf2_sha256$150000$yRSNPX5mgpp2$IVwmkNxSE28Ye9xU/VOf4ID62RI/eS6XyYThkwro0rs=', NULL, 0, 'cvbvcx', 'zxcvzv', 'xcvxc', 'xcbvxc@dsfg.com', 0, 0, '2020-01-22 12:15:37.452526'),
(58, 'pbkdf2_sha256$150000$KMGvZyefLB1g$LJM5nL0zVJVOQDTtyxiQsd83GxFnIQCp/crrRqiw6+I=', NULL, 0, 'cimfrxcvbxcvb', 'cvbvcx', 'cxvbvxc', 'xcbc@xfg.com', 0, 0, '2020-01-22 12:20:54.185246'),
(71, 'pbkdf2_sha256$150000$LNNpE9qOtdAB$g1VJPSCMBdTnd9PpVttKJCW7+RN8yuEhlVjnGUBDBzY=', '2020-03-02 12:02:40.441674', 0, 'vkisku', '', '', 'vikashkisku1@gmail.com', 0, 1, '2020-03-02 11:59:15.063476'),
(72, 'pbkdf2_sha256$150000$CHtL2lkijmjk$okBkXCmYjTu+7D6HBHW+KumalEoi42ZfEjuswi9a05M=', NULL, 0, 'devwangshu', '', '', 'devwangshu@gmail.com', 0, 0, '2020-03-02 14:25:26.085136'),
(92, 'pbkdf2_sha256$150000$ljDrTuCjAYFB$WjWDh8So+/1T/KQ9drO6CwisnBzRaMWpe574Tzsm7gw=', NULL, 0, 'dewangshu', '', '', 'dewangshu@yahoo.in', 0, 0, '2020-03-02 14:40:34.257477');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `background_task`
--

CREATE TABLE `background_task` (
  `id` int(11) NOT NULL,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint(20) NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int(11) NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int(10) UNSIGNED DEFAULT NULL,
  `creator_content_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `background_task`
--

INSERT INTO `background_task` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(1885, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:14:19.020324', 5, NULL, NULL, 0, NULL, '', '11040', '2020-03-12 12:14:24.012697', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `background_task_completedtask`
--

CREATE TABLE `background_task_completedtask` (
  `id` int(11) NOT NULL,
  `task_name` varchar(190) NOT NULL,
  `task_params` longtext NOT NULL,
  `task_hash` varchar(40) NOT NULL,
  `verbose_name` varchar(255) DEFAULT NULL,
  `priority` int(11) NOT NULL,
  `run_at` datetime(6) NOT NULL,
  `repeat` bigint(20) NOT NULL,
  `repeat_until` datetime(6) DEFAULT NULL,
  `queue` varchar(190) DEFAULT NULL,
  `attempts` int(11) NOT NULL,
  `failed_at` datetime(6) DEFAULT NULL,
  `last_error` longtext NOT NULL,
  `locked_by` varchar(64) DEFAULT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `creator_object_id` int(10) UNSIGNED DEFAULT NULL,
  `creator_content_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `background_task_completedtask`
--

INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(1, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:14:26.627230', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:14:22.745207', NULL, NULL),
(2, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:14:30.654327', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:14:27.581321', NULL, NULL),
(3, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:14:36.754904', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:14:35.922500', NULL, NULL),
(4, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:14:38.726898', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:14:36.916884', NULL, NULL),
(5, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:14:40.745983', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:14:39.012047', NULL, NULL),
(6, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:14:46.787567', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:14:45.947711', NULL, NULL),
(7, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:14:48.760839', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:14:47.046258', NULL, NULL),
(8, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:14:58.838322', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:14:53.964222', NULL, NULL),
(9, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:15:12.937721', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:15:04.051178', NULL, NULL),
(10, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:15:21.029437', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:15:13.134901', NULL, NULL),
(11, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:15:29.091973', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:15:21.211901', NULL, NULL),
(12, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:15:35.652820', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:15:29.300325', NULL, NULL),
(13, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:15:41.163670', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:15:35.948739', NULL, NULL),
(14, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:15:50.195091', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:15:41.357154', NULL, NULL),
(15, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:15:52.314422', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:15:50.363640', NULL, NULL),
(16, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:16:01.311956', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:15:57.610844', NULL, NULL),
(17, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:16:09.370185', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:16:01.680968', NULL, NULL),
(18, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:16:21.394606', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:16:09.519784', NULL, NULL),
(19, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:16:35.611348', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:16:21.667075', NULL, NULL),
(20, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:16:48.744087', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:16:35.912748', NULL, NULL),
(21, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:16:59.751993', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:16:49.011091', NULL, NULL),
(22, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:17:13.710650', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:16:59.856190', NULL, NULL),
(23, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:17:23.802502', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:17:13.943166', NULL, NULL),
(24, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:17:27.820119', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:17:23.987193', NULL, NULL),
(25, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:17:31.859628', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:17:28.026576', NULL, NULL),
(26, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:17:35.885177', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:17:31.983296', NULL, NULL),
(27, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:17:41.968144', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:17:41.136072', NULL, NULL),
(28, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:17:43.959913', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:17:42.193344', NULL, NULL),
(29, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:17:52.959240', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:17:49.155405', NULL, NULL),
(30, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:17:55.017729', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:17:53.177547', NULL, NULL),
(31, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:17:59.009159', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:17:55.212393', NULL, NULL),
(32, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:18:05.460375', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:17:59.156691', NULL, NULL),
(33, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:18:08.069006', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:05.601995', NULL, NULL),
(34, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:18:12.111034', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:08.274302', NULL, NULL),
(35, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:18:16.117563', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:12.287534', NULL, NULL),
(36, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:18:22.161143', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:21.218148', NULL, NULL),
(37, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:18:24.668543', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:22.443696', NULL, NULL),
(38, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:18:31.327244', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:29.790356', NULL, NULL),
(39, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:18:33.307948', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:31.430967', NULL, NULL),
(40, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:18:35.277607', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:33.457546', NULL, NULL),
(41, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:18:37.233378', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:35.390307', NULL, NULL),
(42, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:18:39.300086', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:37.444811', NULL, NULL),
(43, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:18:43.252871', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:39.509526', NULL, NULL),
(44, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:18:58.374814', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:18:48.473007', NULL, NULL),
(45, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:19:20.718189', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:19:03.687430', NULL, NULL),
(46, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:19:40.715580', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:19:21.042673', NULL, NULL),
(47, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:20:06.865316', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:19:40.988507', NULL, NULL),
(48, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:20:29.050889', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:20:07.182005', NULL, NULL),
(49, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:20:46.697848', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:20:29.284896', NULL, NULL),
(50, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:20:58.205972', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:20:46.957781', NULL, NULL),
(51, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:01.193515', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:20:58.360999', NULL, NULL),
(52, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:05.230335', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:01.335098', NULL, NULL),
(53, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:21:09.255739', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:05.392685', NULL, NULL),
(54, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:13.217952', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:09.455280', NULL, NULL),
(55, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:14.734320', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:13.425956', NULL, NULL),
(56, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:21:16.288311', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:14.923244', NULL, NULL),
(57, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:18.372106', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:16.556086', NULL, NULL),
(58, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:21:24.546710', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:23.541652', NULL, NULL),
(59, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:26.338613', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:24.738497', NULL, NULL),
(60, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:28.555581', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:26.637172', NULL, NULL),
(61, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:21:37.401314', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:33.773892', NULL, NULL),
(62, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:41.454739', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:37.602626', NULL, NULL),
(63, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:44.654390', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:41.573053', NULL, NULL),
(64, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:21:46.476238', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:44.889233', NULL, NULL),
(65, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:48.471996', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:46.722564', NULL, NULL),
(66, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:21:54.637880', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:53.660710', NULL, NULL),
(67, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:56.562454', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:54.845909', NULL, NULL),
(68, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:21:58.617882', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:21:56.772023', NULL, NULL),
(69, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:22:04.580582', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:03.751911', NULL, NULL),
(70, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:08.625602', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:04.771895', NULL, NULL),
(71, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:12.646394', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:08.812040', NULL, NULL),
(72, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:22:14.663348', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:12.802831', NULL, NULL),
(73, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:16.667167', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:14.806992', NULL, NULL),
(74, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:18.712222', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:16.829163', NULL, NULL),
(75, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:22:20.687621', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:18.961761', NULL, NULL),
(76, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:22.720726', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:20.811263', NULL, NULL),
(77, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:24.733024', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:22.854038', NULL, NULL),
(78, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:22:26.733769', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:24.983190', NULL, NULL),
(79, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:28.787246', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:26.970437', NULL, NULL),
(80, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:22:30.779826', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:29.016824', NULL, NULL),
(81, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:32.854371', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:30.909745', NULL, NULL),
(82, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:36.792146', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:32.975331', NULL, NULL),
(83, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:22:40.845723', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:37.001211', NULL, NULL),
(84, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:44.866945', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:41.129989', NULL, NULL),
(85, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:48.928650', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:45.048550', NULL, NULL),
(86, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:22:51.270803', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:49.141602', NULL, NULL),
(87, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:52.987181', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:51.479928', NULL, NULL),
(88, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:54.992844', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:53.143560', NULL, NULL),
(89, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:22:57.011874', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:55.177563', NULL, NULL),
(90, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:22:59.153796', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:57.202794', NULL, NULL),
(91, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:23:00.986524', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:22:59.344258', NULL, NULL),
(92, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:23:03.019877', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:23:01.147313', NULL, NULL),
(93, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:23:10.220479', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:23:08.190909', NULL, NULL),
(94, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:23:12.083496', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:23:10.483775', NULL, NULL),
(95, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:23:14.586323', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:23:12.364776', NULL, NULL),
(96, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:23:17.275134', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:23:14.738916', NULL, NULL),
(97, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:23:18.246533', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:23:17.544412', NULL, NULL),
(98, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:23:27.192295', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:23:23.618898', NULL, NULL),
(99, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:23:33.228204', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:23:27.364049', NULL, NULL),
(100, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:23:57.394491', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:23:43.427544', NULL, NULL),
(101, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:24:11.501561', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:24:02.598947', NULL, NULL),
(102, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:24:19.690167', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:24:16.940607', NULL, NULL),
(103, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:24:29.585718', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:24:24.911722', NULL, NULL),
(104, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:24:51.759094', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:24:44.913557', NULL, NULL),
(105, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:25:01.867911', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:24:56.987404', NULL, NULL),
(106, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:25:12.966962', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:25:07.165066', NULL, NULL),
(107, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:25:21.965902', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:25:18.135223', NULL, NULL),
(108, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:25:28.053155', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:25:27.097067', NULL, NULL),
(109, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:25:33.990927', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:25:33.282770', NULL, NULL),
(110, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:25:40.059115', 5, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:25:39.151338', NULL, NULL),
(111, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:26:06.216780', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:26:05.380947', NULL, NULL),
(112, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:26:48.400634', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:26:46.422087', NULL, NULL),
(113, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:26:50.467237', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:26:48.587737', NULL, NULL),
(114, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:27:04.584174', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:27:00.635445', NULL, NULL),
(115, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:27:15.592460', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:27:14.888755', NULL, NULL),
(116, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:27:31.724847', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:27:30.680611', NULL, NULL),
(117, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:27:47.799973', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:27:46.916790', NULL, NULL),
(118, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:27:49.791262', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:27:48.006421', NULL, NULL),
(119, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:28:00.814561', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:27:59.921791', NULL, NULL),
(120, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:28:02.916440', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:28:01.000210', NULL, NULL),
(121, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:28:14.913828', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:28:13.072992', NULL, NULL),
(122, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:28:16.966298', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:28:15.089976', NULL, NULL),
(123, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:28:32.972090', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:28:32.090257', NULL, NULL),
(124, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:28:47.074390', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:28:43.178845', NULL, NULL),
(125, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:28:58.088171', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:28:57.327920', NULL, NULL),
(126, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:29:17.182345', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:29:13.265383', NULL, NULL),
(127, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:29:30.446124', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:29:27.315739', NULL, NULL),
(128, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:29:39.379373', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:29:35.880075', NULL, NULL),
(129, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:29:53.414773', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:29:49.546824', NULL, NULL),
(130, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-05 15:30:20.670294', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:30:08.692143', NULL, NULL),
(131, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:30:41.752780', 15, NULL, NULL, 1, NULL, '', '2920', '2020-03-05 15:30:20.976475', NULL, NULL),
(132, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:39:08.135245', 15, NULL, NULL, 1, NULL, '', '11968', '2020-03-05 15:39:05.270623', NULL, NULL),
(133, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:39:19.126532', 15, NULL, NULL, 1, NULL, '', '11968', '2020-03-05 15:39:18.310509', NULL, NULL),
(134, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:39:41.276309', 15, NULL, NULL, 1, NULL, '', '11048', '2020-03-05 15:39:40.945409', NULL, NULL),
(135, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:39:52.725673', 15, NULL, NULL, 1, NULL, '', '11048', '2020-03-05 15:39:51.476102', NULL, NULL),
(136, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:40:06.371951', 15, NULL, NULL, 1, NULL, '', '11048', '2020-03-05 15:40:02.924579', NULL, NULL),
(137, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:40:20.446655', 15, NULL, NULL, 1, NULL, '', '14280', '2020-03-05 15:40:19.423039', NULL, NULL),
(138, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-05 15:40:38.492748', 15, NULL, NULL, 1, NULL, '', '14280', '2020-03-05 15:40:35.566143', NULL, NULL),
(139, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 09:29:26.737882', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 09:29:21.145476', NULL, NULL),
(140, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-06 09:29:40.879244', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 09:29:36.896327', NULL, NULL),
(141, 'sensor.views.run_back_save', '[[3], {}]', '84d34df7f519ab09a8ca04cc437d9fd624868973', NULL, 0, '2020-03-06 09:29:58.420972', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 09:29:56.137247', NULL, NULL),
(142, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 09:30:18.120894', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 09:30:13.618223', NULL, NULL),
(143, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:16:53.966233', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:16:46.364391', NULL, NULL),
(144, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:17:10.106699', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:17:04.141543', NULL, NULL),
(145, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:17:18.140926', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:17:15.361475', NULL, NULL),
(146, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:17:39.281276', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:17:33.288724', NULL, NULL),
(147, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:17:49.282269', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:17:44.597608', NULL, NULL),
(148, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:18:02.340179', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:17:59.427565', NULL, NULL),
(149, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:18:24.522204', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:18:17.542721', NULL, NULL),
(150, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:18:30.497127', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:18:29.671029', NULL, NULL),
(151, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:18:47.938875', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:18:45.698941', NULL, NULL),
(152, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:19:03.713513', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:19:03.194991', NULL, NULL),
(153, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:19:22.762975', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:19:18.949011', NULL, NULL),
(154, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:19:34.829033', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:19:32.980158', NULL, NULL),
(155, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:19:46.929291', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:19:44.997579', NULL, NULL),
(156, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:20:06.020956', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:20:02.181984', NULL, NULL),
(157, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:20:17.045651', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:20:16.224654', NULL, NULL),
(158, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:20:33.178443', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:20:32.240588', NULL, NULL),
(159, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:20:49.320399', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:20:48.453426', NULL, NULL),
(160, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:21:03.369670', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:20:59.552233', NULL, NULL),
(161, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:21:22.560940', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:21:18.543881', NULL, NULL),
(162, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:21:33.518875', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:21:32.767195', NULL, NULL),
(163, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:21:50.827175', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:21:48.663562', NULL, NULL),
(164, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:22:03.760296', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:22:01.082094', NULL, NULL),
(165, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:22:21.809891', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:22:19.093303', NULL, NULL),
(166, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:22:37.917624', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:22:31.934297', NULL, NULL),
(167, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:22:49.000556', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:22:48.105183', NULL, NULL),
(168, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:23:09.175923', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:23:04.187504', NULL, NULL),
(169, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:23:15.261129', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:23:14.389264', NULL, NULL),
(170, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:23:31.251441', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:23:30.390239', NULL, NULL),
(171, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:23:47.283339', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:23:46.452839', NULL, NULL),
(172, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:24:05.382625', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:24:02.488091', NULL, NULL),
(173, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:24:17.523804', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:24:15.573724', NULL, NULL),
(174, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:24:35.549454', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:24:32.709078', NULL, NULL),
(175, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:24:47.607302', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:24:45.739316', NULL, NULL),
(176, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:25:04.698939', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:25:02.886971', NULL, NULL),
(177, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:25:15.759113', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:25:14.913551', NULL, NULL),
(178, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:25:31.964748', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:25:30.982323', NULL, NULL),
(179, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:25:51.005461', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:25:47.133846', NULL, NULL),
(180, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:26:06.983733', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:26:01.289643', NULL, NULL),
(181, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:26:20.108445', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:26:17.154669', NULL, NULL),
(182, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:26:36.713754', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:26:30.331257', NULL, NULL),
(183, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:26:49.338277', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:26:46.892328', NULL, NULL),
(184, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:27:02.358193', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:26:59.480625', NULL, NULL),
(185, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:27:18.524913', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:27:17.549472', NULL, NULL),
(186, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:27:35.529005', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:27:33.775678', NULL, NULL),
(187, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:27:46.607866', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:27:45.733765', NULL, NULL),
(188, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:28:02.795857', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:28:01.775312', NULL, NULL),
(189, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:28:18.753632', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:28:18.079236', NULL, NULL),
(190, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:28:34.852791', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:28:33.900843', NULL, NULL),
(191, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:28:47.968643', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:28:45.108634', NULL, NULL),
(192, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:29:04.069347', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:29:03.208608', NULL, NULL),
(193, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:29:22.244294', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:29:19.274408', NULL, NULL),
(194, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:29:34.185517', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:29:32.507593', NULL, NULL),
(195, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:29:51.290019', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:29:49.325990', NULL, NULL),
(196, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:30:13.130971', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:30:01.431456', NULL, NULL),
(197, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:30:20.759481', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:30:18.383487', NULL, NULL),
(198, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:30:33.114184', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:30:30.915873', NULL, NULL),
(199, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:30:53.959069', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:30:48.369383', NULL, NULL),
(200, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:31:07.724986', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:31:04.140256', NULL, NULL),
(201, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:31:20.746765', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:31:17.959353', NULL, NULL),
(202, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:31:35.913998', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:31:30.877395', NULL, NULL),
(203, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:31:51.149421', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:31:46.046344', NULL, NULL),
(204, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:32:05.148604', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:32:01.319206', NULL, NULL),
(205, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:32:18.174278', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:32:15.374198', NULL, NULL),
(206, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:32:35.173955', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:32:33.500411', NULL, NULL),
(207, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:32:50.964948', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:32:45.321104', NULL, NULL),
(208, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:33:05.864554', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:33:01.142190', NULL, NULL),
(209, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:33:21.497521', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:33:16.108937', NULL, NULL),
(210, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:33:36.470507', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:33:31.722974', NULL, NULL),
(211, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:33:50.521932', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:33:46.686371', NULL, NULL),
(212, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:34:02.622370', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:34:00.674448', NULL, NULL),
(213, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:34:20.862181', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:34:17.847426', NULL, NULL),
(214, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:34:33.788215', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:34:31.025769', NULL, NULL),
(215, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:34:50.871102', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:34:49.029771', NULL, NULL),
(216, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:35:05.129688', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:35:01.032085', NULL, NULL),
(217, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:35:18.028247', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:35:15.320906', NULL, NULL),
(218, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:35:34.137444', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:35:33.274876', NULL, NULL),
(219, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:35:47.045074', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:35:44.408194', NULL, NULL),
(220, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:36:03.411119', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:36:02.262213', NULL, NULL),
(221, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:36:21.419613', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:36:18.567153', NULL, NULL),
(222, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:36:36.493703', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:36:31.596001', NULL, NULL),
(223, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:36:51.568620', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:36:46.701634', NULL, NULL),
(224, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:37:04.635413', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:37:01.714879', NULL, NULL),
(225, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:37:15.685275', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:37:14.763210', NULL, NULL),
(226, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:37:31.776753', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:37:30.810375', NULL, NULL),
(227, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:37:50.126915', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:37:46.942853', NULL, NULL),
(228, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:38:01.101604', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:38:00.346998', NULL, NULL),
(229, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:38:17.142946', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:38:16.236443', NULL, NULL),
(230, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:38:37.252414', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:38:32.319313', NULL, NULL),
(231, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:38:51.242041', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:38:47.424430', NULL, NULL),
(232, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:39:04.301496', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:39:01.421874', NULL, NULL),
(233, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:39:17.373935', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:39:14.547932', NULL, NULL),
(234, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:39:40.457033', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:39:32.496699', NULL, NULL),
(235, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 12:39:48.650059', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 12:39:45.693935', NULL, NULL),
(236, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 16:11:37.317136', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 16:11:34.142216', NULL, NULL),
(237, 'sensor.views.run_back_save', '[[2], {}]', 'c73ebfa0be13d378ca394381b3c4067d8032b239', NULL, 0, '2020-03-06 16:11:56.532663', 15, NULL, NULL, 1, NULL, '', '4120', '2020-03-06 16:11:52.639624', NULL, NULL);
INSERT INTO `background_task_completedtask` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(238, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:05:54.352350', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:05:39.167992', NULL, NULL),
(239, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:06:10.685734', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:05:59.715554', NULL, NULL),
(240, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:06:25.310374', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:06:15.797399', NULL, NULL),
(241, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:06:41.018626', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:06:30.421796', NULL, NULL),
(242, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:06:54.668138', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:06:46.380636', NULL, NULL),
(243, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:07:10.493103', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:06:59.871781', NULL, NULL),
(244, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:07:20.742759', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:07:10.756212', NULL, NULL),
(245, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:07:39.034342', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:07:25.922410', NULL, NULL),
(246, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:07:54.251198', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:07:44.190513', NULL, NULL),
(247, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:08:06.533275', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:07:59.404117', NULL, NULL),
(248, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:08:19.357958', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:08:11.651166', NULL, NULL),
(249, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:08:31.326173', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:08:24.449130', NULL, NULL),
(250, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:08:43.408536', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:08:36.488166', NULL, NULL),
(251, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:08:54.590888', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:08:48.611047', NULL, NULL),
(252, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:09:02.774738', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:08:59.708163', NULL, NULL),
(253, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:09:12.934605', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:09:07.991444', NULL, NULL),
(254, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:09:27.483865', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:09:18.139521', NULL, NULL),
(255, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:09:38.382660', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:09:32.667929', NULL, NULL),
(256, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:09:48.506934', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:09:43.519339', NULL, NULL),
(257, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:10:04.749856', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:09:53.741082', NULL, NULL),
(258, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:10:15.825166', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:10:04.872561', NULL, NULL),
(259, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:10:36.308439', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:10:21.060806', NULL, NULL),
(260, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:10:56.549027', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:10:41.518756', NULL, NULL),
(261, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:11:20.484686', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:11:02.256457', NULL, NULL),
(262, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:11:32.065645', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:11:25.705765', NULL, NULL),
(263, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:11:46.403765', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:11:37.231393', NULL, NULL),
(264, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:11:59.637595', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:11:51.675966', NULL, NULL),
(265, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:12:14.749193', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:12:04.839253', NULL, NULL),
(266, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:12:33.061491', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:12:22.810065', NULL, NULL),
(267, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:12:53.789334', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:12:38.219555', NULL, NULL),
(268, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:13:16.280676', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:12:59.028114', NULL, NULL),
(269, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:13:37.060319', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:13:21.584855', NULL, NULL),
(270, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:14:00.405655', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:13:42.306178', NULL, NULL),
(271, 'Strata.views.run_back_save', '[[1], {}]', '6f33da07dc1e7e02d73b3776fc369d71225bce64', NULL, 0, '2020-03-12 12:14:18.817791', 5, NULL, NULL, 1, NULL, '', '11040', '2020-03-12 12:14:05.601339', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branch_details`
--

CREATE TABLE `branch_details` (
  `id` int(11) NOT NULL,
  `branch_nm` varchar(100) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `carousal`
--

CREATE TABLE `carousal` (
  `id` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  `active` varchar(1) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `category_details`
--

CREATE TABLE `category_details` (
  `id` int(11) NOT NULL,
  `prod_category` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `container_details`
--

CREATE TABLE `container_details` (
  `id` int(11) NOT NULL,
  `name_of_the_tub` varchar(100) NOT NULL,
  `initial_weight` int(11) DEFAULT NULL,
  `laden_weight` int(11) DEFAULT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deduct_details`
--

CREATE TABLE `deduct_details` (
  `id` int(11) NOT NULL,
  `deduct_date` date DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `productDetails_id` int(11) DEFAULT NULL,
  `mine_id` varchar(100) DEFAULT NULL,
  `branch_id` varchar(100) DEFAULT NULL,
  `prod_category` varchar(100) DEFAULT NULL,
  `prod_name` varchar(100) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `batch_number` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `outstock` int(11) DEFAULT NULL,
  `updated_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `development_permission`
--

CREATE TABLE `development_permission` (
  `id` int(11) NOT NULL,
  `name_of_mine` varchar(500) DEFAULT NULL,
  `name_of_owner` varchar(500) DEFAULT NULL,
  `name_of_seam_proposed` varchar(500) DEFAULT NULL,
  `total_thickness_seam` varchar(500) DEFAULT NULL,
  `thickness_of_seam_taken_under_devlopment` varchar(500) DEFAULT NULL,
  `max_min_cover_working_faces` varchar(500) DEFAULT NULL,
  `are_geo_disturbances` varchar(500) DEFAULT NULL,
  `rate_of_dip` varchar(500) DEFAULT NULL,
  `degree_of_gassiness_of_seam` varchar(500) DEFAULT NULL,
  `degree_of_gassiness_overlying_and_underlying` varchar(500) DEFAULT NULL,
  `history_fire_same_seam` varchar(500) DEFAULT NULL,
  `seam_free_from_water` varchar(500) DEFAULT NULL,
  `seam_extracted_stand_on_pillars` varchar(500) DEFAULT NULL,
  `railway` varchar(500) DEFAULT NULL,
  `public_private_road` varchar(500) DEFAULT NULL,
  `river_tank` varchar(500) DEFAULT NULL,
  `building_belong_to_owner` varchar(500) DEFAULT NULL,
  `building_not_belong_to_owner` varchar(500) DEFAULT NULL,
  `h_t_transmission_line` varchar(500) DEFAULT NULL,
  `arial_ropeway` varchar(500) DEFAULT NULL,
  `hfl` varchar(500) DEFAULT NULL,
  `damage_to_surface_structure` varchar(500) DEFAULT NULL,
  `subsided_report` varchar(500) DEFAULT NULL,
  `acquistion` varchar(500) DEFAULT NULL,
  `surface_water` varchar(500) DEFAULT NULL,
  `any_stream_lying_above_or_below` varchar(500) DEFAULT NULL,
  `from_the_adjoining_mine` varchar(500) DEFAULT NULL,
  `from_the_same_seam` varchar(500) DEFAULT NULL,
  `what_precautionary` varchar(500) DEFAULT NULL,
  `danger_from_fire` varchar(500) DEFAULT NULL,
  `danger_from_premature_collapsed` varchar(500) DEFAULT NULL,
  `ssr` varchar(500) DEFAULT NULL,
  `does_the_area_proposed` varchar(500) DEFAULT NULL,
  `whether_application` varchar(500) DEFAULT NULL,
  `are_the_plan_up_to_date` varchar(500) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_annual_annexure_i`
--

CREATE TABLE `dgms_coalmine_annual_annexure_i` (
  `id` int(11) NOT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `aecm_year` int(11) DEFAULT NULL,
  `mine_vill` varchar(100) DEFAULT NULL,
  `mine_tehsil` varchar(100) DEFAULT NULL,
  `mine_dist` varchar(50) DEFAULT NULL,
  `mine_pin` varchar(10) DEFAULT NULL,
  `mine_state` varchar(50) DEFAULT NULL,
  `mine_dop` date DEFAULT NULL,
  `labour_id_no` varchar(100) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `owner_telephone` varchar(20) DEFAULT NULL,
  `owner_mobile` varchar(20) DEFAULT NULL,
  `owner_email` varchar(50) DEFAULT NULL,
  `owner_vill` varchar(100) DEFAULT NULL,
  `owner_tehsil` varchar(100) DEFAULT NULL,
  `owner_dist` varchar(50) DEFAULT NULL,
  `owner_pin` varchar(10) DEFAULT NULL,
  `owner_state` varchar(50) DEFAULT NULL,
  `agent_name` varchar(100) DEFAULT NULL,
  `agent_telephone` varchar(20) DEFAULT NULL,
  `agent_mobile` varchar(20) DEFAULT NULL,
  `agent_email` varchar(50) DEFAULT NULL,
  `agent_vill` varchar(100) DEFAULT NULL,
  `agent_tehsil` varchar(100) DEFAULT NULL,
  `agent_dist` varchar(50) DEFAULT NULL,
  `agent_pin` varchar(10) DEFAULT NULL,
  `agent_state` varchar(50) DEFAULT NULL,
  `manager_name` varchar(100) DEFAULT NULL,
  `manager_telephone` varchar(20) DEFAULT NULL,
  `manager_mobile` varchar(20) DEFAULT NULL,
  `manager_email` varchar(50) DEFAULT NULL,
  `manager_vill` varchar(100) DEFAULT NULL,
  `manager_tehsil` varchar(100) DEFAULT NULL,
  `manager_dist` varchar(100) DEFAULT NULL,
  `manager_pin` varchar(10) DEFAULT NULL,
  `manager_state` varchar(100) DEFAULT NULL,
  `no_of_contractors` varchar(100) DEFAULT NULL,
  `dept_background_male` varchar(100) DEFAULT NULL,
  `dept_background_female` varchar(100) DEFAULT NULL,
  `dept_total_background_male_female` varchar(100) DEFAULT NULL,
  `cont_background_male` varchar(100) DEFAULT NULL,
  `cont_background_female` varchar(100) DEFAULT NULL,
  `cont_background_total_male_female` varchar(100) DEFAULT NULL,
  `dept_opencast_male` varchar(100) DEFAULT NULL,
  `dept_opencast_female` varchar(100) DEFAULT NULL,
  `dept_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `cont_opencast_male` varchar(100) DEFAULT NULL,
  `cont_opencast_female` varchar(100) DEFAULT NULL,
  `cont_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `dept_aboveground_male` varchar(100) DEFAULT NULL,
  `dept_aboveground_female` varchar(100) DEFAULT NULL,
  `dept_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `cont_aboveground_male` varchar(100) DEFAULT NULL,
  `cont_aboveground_female` varchar(100) DEFAULT NULL,
  `cont_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `wbg_number` varchar(100) DEFAULT NULL,
  `wbg_day` date NOT NULL,
  `am_number` varchar(100) DEFAULT NULL,
  `am_day` date NOT NULL,
  `dept_tmw_background_male` varchar(100) DEFAULT NULL,
  `dept_tmw_background_female` varchar(100) DEFAULT NULL,
  `dept_tmw_background_total_male_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_background_male` varchar(100) DEFAULT NULL,
  `dept_adnpe_background_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_background_total_male_female` varchar(100) DEFAULT NULL,
  `cont_tmw_background_male` varchar(100) DEFAULT NULL,
  `cont_tmw_background_female` varchar(100) DEFAULT NULL,
  `cont_tmw_background_total_male_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_background_male` varchar(100) DEFAULT NULL,
  `cont_adnpe_background_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_background_total_male_female` varchar(100) DEFAULT NULL,
  `dept_tmw_opencast_male` varchar(100) DEFAULT NULL,
  `dept_tmw_opencast_female` varchar(100) DEFAULT NULL,
  `dept_tmw_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_opencast_male` varchar(100) DEFAULT NULL,
  `dept_adnpe_opencast_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `cont_tmw_opencast_male` varchar(100) DEFAULT NULL,
  `cont_tmw_opencast_female` varchar(100) DEFAULT NULL,
  `cont_tmw_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_opencast_male` varchar(100) DEFAULT NULL,
  `cont_adnpe_opencast_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `dept_tmw_aboveground_male` varchar(100) DEFAULT NULL,
  `dept_tmw_aboveground_female` varchar(100) DEFAULT NULL,
  `dept_tmw_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_aboveground_male` varchar(100) DEFAULT NULL,
  `dept_adnpe_aboveground_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `cont_tmw_aboveground_male` varchar(100) DEFAULT NULL,
  `cont_tmw_aboveground_female` varchar(100) DEFAULT NULL,
  `cont_tmw_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_aboveground_male` varchar(100) DEFAULT NULL,
  `cont_adnpe_aboveground_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `no_of_contractors_engaged` varchar(100) DEFAULT NULL,
  `no_of_shift_worked` varchar(100) DEFAULT NULL,
  `mh_1` varchar(100) DEFAULT NULL,
  `mh_2` varchar(100) DEFAULT NULL,
  `mh_3` varchar(100) DEFAULT NULL,
  `electrical_background` varchar(100) DEFAULT NULL,
  `ongs_background` varchar(100) DEFAULT NULL,
  `comp_air` varchar(100) DEFAULT NULL,
  `electrical_opencast` varchar(100) DEFAULT NULL,
  `ongs_opencast` varchar(100) DEFAULT NULL,
  `comp_air_opencast` varchar(100) DEFAULT NULL,
  `electrical_aboveground` varchar(100) DEFAULT NULL,
  `ongs_aboveground` varchar(100) DEFAULT NULL,
  `comp_air_aboveground` varchar(100) DEFAULT NULL,
  `total_electrical` varchar(100) DEFAULT NULL,
  `total_ongs` varchar(100) DEFAULT NULL,
  `total_comp_air` varchar(100) DEFAULT NULL,
  `lighting` varchar(100) DEFAULT NULL,
  `power` varchar(100) DEFAULT NULL,
  `ime_npe_dept` varchar(100) DEFAULT NULL,
  `ime_npe_cont` varchar(100) DEFAULT NULL,
  `ime_npru_dept` varchar(100) DEFAULT NULL,
  `ime_npru_cont` varchar(100) DEFAULT NULL,
  `ime_npau_dept` varchar(100) DEFAULT NULL,
  `ime_npau_cont` varchar(100) DEFAULT NULL,
  `ime_no_of_p_d_m_unfit` varchar(100) DEFAULT NULL,
  `pme_npe_dept` varchar(100) DEFAULT NULL,
  `pme_npe_cont` varchar(100) DEFAULT NULL,
  `pme_npru_dept` varchar(100) DEFAULT NULL,
  `pme_npru_cont` varchar(100) DEFAULT NULL,
  `pme_npau_dept` varchar(100) DEFAULT NULL,
  `pme_npau_cont` varchar(100) DEFAULT NULL,
  `pme_no_of_p_d_m_unfit` varchar(100) DEFAULT NULL,
  `no_of_workmen_req` varchar(100) DEFAULT NULL,
  `no_of_workmen_provide` varchar(100) DEFAULT NULL,
  `no_of_satfy_c_meeting_conduct` varchar(100) DEFAULT NULL,
  `npe_bvt_dept` varchar(100) DEFAULT NULL,
  `npe_bvt_cont` varchar(100) DEFAULT NULL,
  `npruvt_bvt_dept` varchar(100) DEFAULT NULL,
  `npruvt_bvt_cont` varchar(100) DEFAULT NULL,
  `npauvt_bvt_dept` varchar(100) DEFAULT NULL,
  `npauvt_bvt_cont` varchar(100) DEFAULT NULL,
  `npe_rt_dept` varchar(100) DEFAULT NULL,
  `npe_rt_cont` varchar(100) DEFAULT NULL,
  `npruvt_rt_dept` varchar(100) DEFAULT NULL,
  `npruvt_rt_cont` varchar(100) DEFAULT NULL,
  `npauvt_rt_dept` varchar(100) DEFAULT NULL,
  `npauvt_rt_cont` varchar(100) DEFAULT NULL,
  `mine_name_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_annual_annexure_i_subtable_1`
--

CREATE TABLE `dgms_coalmine_annual_annexure_i_subtable_1` (
  `id` int(11) NOT NULL,
  `base_column_id` int(11) DEFAULT NULL,
  `spem_designation` varchar(100) DEFAULT NULL,
  `spem_no_requried` varchar(100) DEFAULT NULL,
  `spem_no_available` varchar(100) DEFAULT NULL,
  `spem_short_surplus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_annual_annexure_i_subtable_2`
--

CREATE TABLE `dgms_coalmine_annual_annexure_i_subtable_2` (
  `id` int(11) NOT NULL,
  `base_column_id` int(11) DEFAULT NULL,
  `accident_statistics_year` varchar(100) DEFAULT NULL,
  `accident_statistics_fatal_number` varchar(100) DEFAULT NULL,
  `accident_statistics_fatal_no_of_persion_killed` varchar(100) DEFAULT NULL,
  `accident_statistics_fatal_no_of_persion_injured` varchar(100) DEFAULT NULL,
  `accident_statistics_serious` varchar(100) DEFAULT NULL,
  `accident_statistics_serious_injured` varchar(100) DEFAULT NULL,
  `accident_statistics_reportable_number` varchar(100) DEFAULT NULL,
  `accident_statistics_reportable_injured` varchar(100) DEFAULT NULL,
  `accident_statistics_minor_number` varchar(100) DEFAULT NULL,
  `accident_statistics_minor_injured` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_annual_annexure_i_subtable_3`
--

CREATE TABLE `dgms_coalmine_annual_annexure_i_subtable_3` (
  `id` int(11) NOT NULL,
  `base_column_id` int(11) DEFAULT NULL,
  `cre_grade` varchar(100) DEFAULT NULL,
  `cre_2` varchar(100) DEFAULT NULL,
  `cre_3` varchar(100) DEFAULT NULL,
  `cre_4` varchar(100) DEFAULT NULL,
  `cre_5` varchar(100) DEFAULT NULL,
  `cre_6` varchar(100) DEFAULT NULL,
  `cre_7` varchar(100) DEFAULT NULL,
  `cre_8` varchar(100) DEFAULT NULL,
  `cre_9` varchar(100) DEFAULT NULL,
  `cre_10` varchar(100) DEFAULT NULL,
  `cre_11` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_table_a`
--

CREATE TABLE `dgms_coalmine_table_a` (
  `id` int(11) NOT NULL,
  `year` varchar(100) DEFAULT NULL,
  `working_below_ground` varchar(100) DEFAULT NULL,
  `working_below_ground_a` varchar(100) DEFAULT NULL,
  `all_mine_on` varchar(100) DEFAULT NULL,
  `all_mine_on_a` varchar(100) DEFAULT NULL,
  `below_ground_overman_sirdars_2a` varchar(100) DEFAULT NULL,
  `below_ground_overman_sirdars_2b` varchar(100) DEFAULT NULL,
  `below_ground_overman_sirdars_2c` varchar(100) DEFAULT NULL,
  `below_ground_overman_sirdars_3` varchar(100) DEFAULT NULL,
  `below_ground_overman_sirdars_4a` varchar(100) DEFAULT NULL,
  `below_ground_overman_sirdars_4b` varchar(100) DEFAULT NULL,
  `below_ground_overman_sirdars_4c` varchar(100) DEFAULT NULL,
  `below_ground_overman_sirdars_4d` varchar(100) DEFAULT NULL,
  `below_ground_overman_sirdars_5` varchar(100) DEFAULT NULL,
  `below_ground_miners_loader_2a` varchar(100) DEFAULT NULL,
  `below_ground_miners_loader_2b` varchar(100) DEFAULT NULL,
  `below_ground_miners_loader_2c` varchar(100) DEFAULT NULL,
  `below_ground_miners_loader_3` varchar(100) DEFAULT NULL,
  `below_ground_miners_loader_4a` varchar(100) DEFAULT NULL,
  `below_ground_miners_loader_4b` varchar(100) DEFAULT NULL,
  `below_ground_miners_loader_4c` varchar(100) DEFAULT NULL,
  `below_ground_miners_loader_4d` varchar(100) DEFAULT NULL,
  `below_ground_miners_loader_5` varchar(100) DEFAULT NULL,
  `below_ground_others_2a` varchar(100) DEFAULT NULL,
  `below_ground_others_2b` varchar(100) DEFAULT NULL,
  `below_ground_others_2c` varchar(100) DEFAULT NULL,
  `below_ground_others_3` varchar(100) DEFAULT NULL,
  `below_ground_others_4a` varchar(100) DEFAULT NULL,
  `below_ground_others_4b` varchar(100) DEFAULT NULL,
  `below_ground_others_4c` varchar(100) DEFAULT NULL,
  `below_ground_others_4d` varchar(100) DEFAULT NULL,
  `below_ground_others_5` varchar(100) DEFAULT NULL,
  `opencast_overman_sirdars_2a` varchar(100) DEFAULT NULL,
  `opencast_overman_sirdars_2b` varchar(100) DEFAULT NULL,
  `opencast_overman_sirdars_2c` varchar(100) DEFAULT NULL,
  `opencast_overman_sirdars_3` varchar(100) DEFAULT NULL,
  `opencast_overman_sirdars_4a` varchar(100) DEFAULT NULL,
  `opencast_overman_sirdars_4b` varchar(100) DEFAULT NULL,
  `opencast_overman_sirdars_4c` varchar(100) DEFAULT NULL,
  `opencast_overman_sirdars_4d` varchar(100) DEFAULT NULL,
  `opencast_overman_sirdars_5` varchar(100) DEFAULT NULL,
  `opencast_miners_loader_2a` varchar(100) DEFAULT NULL,
  `opencast_miners_loader_2b` varchar(100) DEFAULT NULL,
  `opencast_miners_loader_2c` varchar(100) DEFAULT NULL,
  `opencast_miners_loader_3` varchar(100) DEFAULT NULL,
  `opencast_miners_loader_4a` varchar(100) DEFAULT NULL,
  `opencast_miners_loader_4b` varchar(100) DEFAULT NULL,
  `opencast_miners_loader_4c` varchar(100) DEFAULT NULL,
  `opencast_miners_loader_4d` varchar(100) DEFAULT NULL,
  `opencast_miners_loader_5` varchar(100) DEFAULT NULL,
  `opencast_others_2a` varchar(100) DEFAULT NULL,
  `opencast_others_2b` varchar(100) DEFAULT NULL,
  `opencast_others_2c` varchar(100) DEFAULT NULL,
  `opencast_others_3` varchar(100) DEFAULT NULL,
  `opencast_others_4a` varchar(100) DEFAULT NULL,
  `opencast_others_4b` varchar(100) DEFAULT NULL,
  `opencast_others_4c` varchar(100) DEFAULT NULL,
  `opencast_others_4d` varchar(100) DEFAULT NULL,
  `opencast_others_5` varchar(100) DEFAULT NULL,
  `aboveground_clerical_supervisory_staff_2a` varchar(100) DEFAULT NULL,
  `aboveground_clerical_supervisory_staff_2b` varchar(100) DEFAULT NULL,
  `aboveground_clerical_supervisory_staff_2c` varchar(100) DEFAULT NULL,
  `aboveground_clerical_supervisory_staff_3` varchar(100) DEFAULT NULL,
  `aboveground_clerical_supervisory_staff_4a` varchar(100) DEFAULT NULL,
  `aboveground_clerical_supervisory_staff_4b` varchar(100) DEFAULT NULL,
  `aboveground_clerical_supervisory_staff_4c` varchar(100) DEFAULT NULL,
  `aboveground_clerical_supervisory_staff_4d` varchar(100) DEFAULT NULL,
  `aboveground_clerical_supervisory_staff_5` varchar(100) DEFAULT NULL,
  `aboveground_workers_2a` varchar(100) DEFAULT NULL,
  `aboveground_workers_2b` varchar(100) DEFAULT NULL,
  `aboveground_workers_2c` varchar(100) DEFAULT NULL,
  `aboveground_workers_3` varchar(100) DEFAULT NULL,
  `aboveground_workers_4a` varchar(100) DEFAULT NULL,
  `aboveground_workers_4b` varchar(100) DEFAULT NULL,
  `aboveground_workers_4c` varchar(100) DEFAULT NULL,
  `aboveground_workers_4d` varchar(100) DEFAULT NULL,
  `aboveground_workers_5` varchar(100) DEFAULT NULL,
  `aboveground_others_2a` varchar(100) DEFAULT NULL,
  `aboveground_others_2b` varchar(100) DEFAULT NULL,
  `aboveground_others_2c` varchar(100) DEFAULT NULL,
  `aboveground_others_3` varchar(100) DEFAULT NULL,
  `aboveground_others_4a` varchar(100) DEFAULT NULL,
  `aboveground_others_4b` varchar(100) DEFAULT NULL,
  `aboveground_others_4c` varchar(100) DEFAULT NULL,
  `aboveground_others_4d` varchar(100) DEFAULT NULL,
  `aboveground_others_5` varchar(100) DEFAULT NULL,
  `total_value` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_table_b`
--

CREATE TABLE `dgms_coalmine_table_b` (
  `id` int(11) NOT NULL,
  `for_own_use_generated` varchar(100) DEFAULT NULL,
  `for_own_use_purchased` varchar(100) DEFAULT NULL,
  `for_sale_generated` varchar(100) DEFAULT NULL,
  `for_sale_purchased` varchar(100) DEFAULT NULL,
  `system_of_supply_voltage` varchar(100) DEFAULT NULL,
  `system_of_supply_periodicity` varchar(100) DEFAULT NULL,
  `system_of_supply_source` varchar(100) DEFAULT NULL,
  `above_ground_lighting` varchar(100) DEFAULT NULL,
  `below_ground_lighting` varchar(100) DEFAULT NULL,
  `above_ground_power` varchar(100) DEFAULT NULL,
  `below_ground_power` varchar(100) DEFAULT NULL,
  `high_pressure` varchar(100) DEFAULT NULL,
  `medium_pressure` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_Winding` varchar(100) DEFAULT NULL,
  `in_use_total_hp_Winding` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_Winding` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_Winding` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_Ventilation` varchar(100) DEFAULT NULL,
  `in_use_total_hp_Ventilation` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_Ventilation` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_Ventilation` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_Haulage` varchar(100) DEFAULT NULL,
  `in_use_total_hp_Haulage` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_Haulage` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_Haulage` varchar(100) DEFAULT NULL,
  `in_use_number_of_Pumping` varchar(100) DEFAULT NULL,
  `in_use_total_hp_Pumping` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_Pumping` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_Pumping` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_coal_washing` varchar(100) DEFAULT NULL,
  `in_use_total_hp_coal_washing` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_coal_washing` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_coal_washing` varchar(100) DEFAULT NULL,
  `in_use_number_of_unit_workshop` varchar(100) DEFAULT NULL,
  `in_use_total_hp_workshop` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_workshop` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_workshop` varchar(100) DEFAULT NULL,
  `specify1` varchar(100) DEFAULT NULL,
  `specify1_in_use_no_of_unit` varchar(100) DEFAULT NULL,
  `specify1_in_use_total_hp` varchar(100) DEFAULT NULL,
  `specify1_in_reverse_number_of_unit` varchar(100) DEFAULT NULL,
  `specify1_in_reverse_total_hp` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_Winding1` varchar(100) DEFAULT NULL,
  `in_use_total_hp_Winding1` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_Winding1` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_Winding1` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_Haulage1` varchar(100) DEFAULT NULL,
  `in_use_total_hp_Haulage1` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_Haulage1` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_Haulage1` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_Ventilation1` varchar(100) DEFAULT NULL,
  `in_use_total_hp_Ventilation1` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_Ventilation1` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_Ventilation1` varchar(100) DEFAULT NULL,
  `in_use_number_of_Pumping1` varchar(100) DEFAULT NULL,
  `in_use_total_hp_Pumping1` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_Pumping1` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_Pumping1` varchar(100) DEFAULT NULL,
  `in_use_number_of_Other_portable_machines` varchar(100) DEFAULT NULL,
  `in_use_total_hp_Other_portable_machines` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_Other_portable_machines` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_Other_portable_machines` varchar(100) DEFAULT NULL,
  `in_use_number_of_Conveyors` varchar(100) DEFAULT NULL,
  `in_use_total_hp_Conveyors` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_Conveyors` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_Conveyors` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_Electric_traction` varchar(100) DEFAULT NULL,
  `in_use_total_hp_Electric_traction` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_Electric_traction` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_Electric_traction` varchar(100) DEFAULT NULL,
  `specify2` varchar(100) DEFAULT NULL,
  `specify2_in_use_no_of_unit` varchar(100) DEFAULT NULL,
  `specify2_in_use_total_hp` varchar(100) DEFAULT NULL,
  `specify2_in_reverse_number_of_unit` varchar(100) DEFAULT NULL,
  `specify2_in_reverse_total_hp` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_b_haulage` varchar(100) DEFAULT NULL,
  `in_use_total_hp_b_haulage` varchar(100) DEFAULT NULL,
  `in_reverse_number_of_units_b_haulage` varchar(100) DEFAULT NULL,
  `in_reverse_total_hp_b_haulage` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_b_ventilation` varchar(100) DEFAULT NULL,
  `in_use_total_hp_b_ventilation` varchar(100) DEFAULT NULL,
  `in_reverse_number_of_units_b_ventilation` varchar(100) DEFAULT NULL,
  `in_reverse_total_hp_b_ventilation` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_b_pumping` varchar(100) DEFAULT NULL,
  `in_use_total_hp_b_pumping` varchar(100) DEFAULT NULL,
  `in_reverse_number_of_units_b_pumping` varchar(100) DEFAULT NULL,
  `in_reverse_total_hp_b_pumping` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_b_coal_cutting_machine` varchar(100) DEFAULT NULL,
  `in_use_total_hp_b_coal_cutting_machine` varchar(100) DEFAULT NULL,
  `in_reverse_number_of_units_b_coal_cutting_machine` varchar(100) DEFAULT NULL,
  `in_reverse_total_hp_b_coal_cutting_machine` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_b_portable_machine` varchar(100) DEFAULT NULL,
  `in_use_total_hp_b_portable_machine` varchar(100) DEFAULT NULL,
  `in_reverse_number_of_units_b_portable_machine` varchar(100) DEFAULT NULL,
  `in_reverse_total_hp_b_portable_machine` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_b_conveyors` varchar(100) DEFAULT NULL,
  `in_use_total_hp_b_conveyors` varchar(100) DEFAULT NULL,
  `in_reverse_number_of_units_b_conveyors` varchar(100) DEFAULT NULL,
  `in_reverse_total_hp_b_conveyors` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_b_electric_traction` varchar(100) DEFAULT NULL,
  `in_use_total_hp_b_electric_traction` varchar(100) DEFAULT NULL,
  `in_reverse_number_of_units_b_electric_traction` varchar(100) DEFAULT NULL,
  `in_reverse_total_hp_b_electric_traction` varchar(100) DEFAULT NULL,
  `specify3` varchar(100) DEFAULT NULL,
  `specify3_in_use_no_of_unit` varchar(100) DEFAULT NULL,
  `specify3_in_use_total_hp` varchar(100) DEFAULT NULL,
  `specify3_in_reverse_number_of_unit` varchar(100) DEFAULT NULL,
  `specify3_in_reverse_total_hp` varchar(100) DEFAULT NULL,
  `total_1` varchar(100) DEFAULT NULL,
  `total_2` varchar(100) DEFAULT NULL,
  `total_3` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_table_c`
--

CREATE TABLE `dgms_coalmine_table_c` (
  `id` int(11) NOT NULL,
  `in_use_number_of_units_boilers` varchar(100) DEFAULT NULL,
  `in_use_total_hp_boilers` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_boilers` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_boilers` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_steam_turbines` varchar(100) DEFAULT NULL,
  `in_use_total_hp_steam_turbines` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_steam_turbines` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_steam_turbines` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_diesel_engines` varchar(100) DEFAULT NULL,
  `in_use_total_hp_diesel_engines` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_diesel_engines` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_diesel_engines` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_gasoline` varchar(100) DEFAULT NULL,
  `in_use_total_hp_gasoline` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_gasoline` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_gasoline` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_hydraulic_turbines` varchar(100) DEFAULT NULL,
  `in_use_total_hp_hydraulic_turbines` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_hydraulic_turbines` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_hydraulic_turbines` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_air_compressors` varchar(100) DEFAULT NULL,
  `in_use_total_hp_air_compressors` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_air_compressors` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_air_compressors` varchar(100) DEFAULT NULL,
  `total1` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_winding` varchar(100) DEFAULT NULL,
  `in_use_total_hp_winding` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_winding` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_winding` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_ventilation` varchar(100) DEFAULT NULL,
  `in_use_total_hp_ventilation` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_ventilation` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_ventilation` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_haulage` varchar(100) DEFAULT NULL,
  `in_use_total_hp_haulage` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_haulage` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_haulage` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_pumping` varchar(100) DEFAULT NULL,
  `in_use_total_hp_pumping` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_pumping` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_pumping` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_mineral_dressing_plants` varchar(100) DEFAULT NULL,
  `in_use_total_hp_mineral_dressing_plants` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_mineral_dressing_plants` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_mineral_dressing_plants` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_workshops` varchar(100) DEFAULT NULL,
  `in_use_total_hp_workshops` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_workshops` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_workshops` varchar(100) DEFAULT NULL,
  `specify1` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_specify1` varchar(100) DEFAULT NULL,
  `in_use_total_hp_specify1` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_specify1` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_specify1` varchar(100) DEFAULT NULL,
  `total2` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_iii_haulage` varchar(100) DEFAULT NULL,
  `in_use_total_hp_iii_haulage` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_iii_haulage` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_iii_haulage` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_iii_ventilation` varchar(100) DEFAULT NULL,
  `in_use_total_hp_iii_ventilation` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_iii_ventilation` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_iii_ventilation` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_iii_pumping` varchar(100) DEFAULT NULL,
  `in_use_total_hp_iii_pumping` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_iii_pumping` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_iii_pumping` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_iii_locomotives` varchar(100) DEFAULT NULL,
  `in_use_total_hp_iii_locomotives` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_iii_locomotives` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_iii_locomotives` varchar(100) DEFAULT NULL,
  `specify2` varchar(100) DEFAULT NULL,
  `in_use_number_of_units_specify2` varchar(100) DEFAULT NULL,
  `in_use_total_hp_specify2` varchar(100) DEFAULT NULL,
  `in_reserve_number_of_units_specify2` varchar(100) DEFAULT NULL,
  `in_reserve_total_hp_specify2` varchar(100) DEFAULT NULL,
  `total3` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_table_d`
--

CREATE TABLE `dgms_coalmine_table_d` (
  `id` int(11) NOT NULL,
  `name_of_explosive` varchar(100) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `electric` varchar(100) DEFAULT NULL,
  `ordinary` varchar(100) DEFAULT NULL,
  `name_and_type_of_safty_lamps` varchar(100) DEFAULT NULL,
  `lead_rivet` varchar(100) DEFAULT NULL,
  `magnetic` varchar(100) DEFAULT NULL,
  `other` varchar(100) DEFAULT NULL,
  `name_and_size_of_mech_ventilator` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `avarage_total_quantity` varchar(100) DEFAULT NULL,
  `water_gauge_obtaied` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_table_e`
--

CREATE TABLE `dgms_coalmine_table_e` (
  `id` int(11) NOT NULL,
  `coal_openstock_year` int(11) DEFAULT NULL,
  `coal_endstock_year` int(11) DEFAULT NULL,
  `coke_openstock_year` int(11) DEFAULT NULL,
  `coke_endstock_year` int(11) DEFAULT NULL,
  `selected_a_openstock` varchar(100) DEFAULT NULL,
  `selected_a_coal_raised` varchar(100) DEFAULT NULL,
  `selected_a_total_value_of_rasing` varchar(100) DEFAULT NULL,
  `selected_a_total_of_col_2_3` varchar(100) DEFAULT NULL,
  `selected_a_coal_despatched` varchar(100) DEFAULT NULL,
  `selected_a_collery_consumption` varchar(100) DEFAULT NULL,
  `selected_a_coal_used_for_cooking` varchar(100) DEFAULT NULL,
  `selected_a_shortage_due_to_cause` varchar(100) DEFAULT NULL,
  `selected_a_closing_stocks` varchar(100) DEFAULT NULL,
  `selected_a_total_columns` varchar(100) DEFAULT NULL,
  `selected_b_openstock` varchar(100) DEFAULT NULL,
  `selected_b_coal_raised` varchar(100) DEFAULT NULL,
  `selected_b_total_value_of_rasing` varchar(100) DEFAULT NULL,
  `selected_b_total_of_col_2_3` varchar(100) DEFAULT NULL,
  `selected_b_coal_despatched` varchar(100) DEFAULT NULL,
  `selected_b_collery_consumption` varchar(100) DEFAULT NULL,
  `selected_b_coal_used_for_cooking` varchar(100) DEFAULT NULL,
  `selected_b_shortage_due_to_cause` varchar(100) DEFAULT NULL,
  `selected_b_closing_stocks` varchar(100) DEFAULT NULL,
  `selected_b_total_columns` varchar(100) DEFAULT NULL,
  `grade_1_openstock` varchar(100) DEFAULT NULL,
  `grade_1_coal_raised` varchar(100) DEFAULT NULL,
  `grade_1_total_value_of_rasing` varchar(100) DEFAULT NULL,
  `grade_1_total_of_col_2_3` varchar(100) DEFAULT NULL,
  `grade_1_coal_despatched` varchar(100) DEFAULT NULL,
  `grade_1_collery_consumption` varchar(100) DEFAULT NULL,
  `grade_1_coal_used_for_cooking` varchar(100) DEFAULT NULL,
  `grade_1_shortage_due_to_cause` varchar(100) DEFAULT NULL,
  `grade_1_closing_stocks` varchar(100) DEFAULT NULL,
  `grade_1_total_columns` varchar(100) DEFAULT NULL,
  `grade_2_openstock` varchar(100) DEFAULT NULL,
  `grade_2_coal_raised` varchar(100) DEFAULT NULL,
  `grade_2_total_value_of_rasing` varchar(100) DEFAULT NULL,
  `grade_2_total_of_col_2_3` varchar(100) DEFAULT NULL,
  `grade_2_coal_despatched` varchar(100) DEFAULT NULL,
  `grade_2_collery_consumption` varchar(100) DEFAULT NULL,
  `grade_2_coal_used_for_cooking` varchar(100) DEFAULT NULL,
  `grade_2_shortage_due_to_cause` varchar(100) DEFAULT NULL,
  `grade_2_closing_stocks` varchar(100) DEFAULT NULL,
  `grade_2_total_columns` varchar(100) DEFAULT NULL,
  `grade_3_openstock` varchar(100) DEFAULT NULL,
  `grade_3_coal_raised` varchar(100) DEFAULT NULL,
  `grade_3_total_value_of_rasing` varchar(100) DEFAULT NULL,
  `grade_3_total_of_col_2_3` varchar(100) DEFAULT NULL,
  `grade_3_coal_despatched` varchar(100) DEFAULT NULL,
  `grade_3_collery_consumption` varchar(100) DEFAULT NULL,
  `grade_3_coal_used_for_cooking` varchar(100) DEFAULT NULL,
  `grade_3_shortage_due_to_cause` varchar(100) DEFAULT NULL,
  `grade_3_closing_stocks` varchar(100) DEFAULT NULL,
  `grade_3_total_columns` varchar(100) DEFAULT NULL,
  `openstock_total` varchar(100) DEFAULT NULL,
  `coal_raised_total` varchar(100) DEFAULT NULL,
  `total_value_of_rasing_total` varchar(100) DEFAULT NULL,
  `total_of_col_2_3_total` varchar(100) DEFAULT NULL,
  `coal_despatched_total` varchar(100) DEFAULT NULL,
  `collery_consumption_total` varchar(100) DEFAULT NULL,
  `coal_used_for_cooking_total` varchar(100) DEFAULT NULL,
  `shortage_due_to_cause_total` varchar(100) DEFAULT NULL,
  `closing_stocks_total` varchar(100) DEFAULT NULL,
  `total_columns_total` varchar(100) DEFAULT NULL,
  `coke_hard_opening_stock` varchar(100) DEFAULT NULL,
  `coke_hard_coke_manufactured` varchar(100) DEFAULT NULL,
  `coke_hard_total_value_of_coke` varchar(100) DEFAULT NULL,
  `coke_hard_total_col_2_3` varchar(100) DEFAULT NULL,
  `coke_hard_coke_despatched` varchar(100) DEFAULT NULL,
  `coke_hard_colliery_consumption` varchar(100) DEFAULT NULL,
  `coke_hard_coke_shortage` varchar(100) DEFAULT NULL,
  `coke_hard_closing_stock` varchar(100) DEFAULT NULL,
  `coke_hard_total_column_total` varchar(100) DEFAULT NULL,
  `coke_soft_opening_stock` varchar(100) DEFAULT NULL,
  `coke_soft_coke_manufactured` varchar(100) DEFAULT NULL,
  `coke_soft_total_value_of_coke` varchar(100) DEFAULT NULL,
  `coke_soft_total_col_2_3` varchar(100) DEFAULT NULL,
  `coke_soft_coke_despatched` varchar(100) DEFAULT NULL,
  `coke_soft_colliery_consumption` varchar(100) DEFAULT NULL,
  `coke_soft_coke_shortage` varchar(100) DEFAULT NULL,
  `coke_soft_closing_stock` varchar(100) DEFAULT NULL,
  `coke_soft_total_column_total` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_first_schedule_form_iii`
--

CREATE TABLE `dgms_first_schedule_form_iii` (
  `id` int(11) NOT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `mine_address` varchar(500) DEFAULT NULL,
  `mine_dop` date DEFAULT NULL,
  `mine_doc` date DEFAULT NULL,
  `mine_district` varchar(100) DEFAULT NULL,
  `mine_state` varchar(100) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `owner_address` varchar(500) DEFAULT NULL,
  `managing_agent` varchar(100) DEFAULT NULL,
  `managing_agent_address` varchar(500) DEFAULT NULL,
  `agent_name` varchar(100) DEFAULT NULL,
  `agent_address` varchar(500) DEFAULT NULL,
  `manager_name` varchar(100) DEFAULT NULL,
  `manager_address` varchar(500) DEFAULT NULL,
  `superior_supervisory_staff` varchar(100) DEFAULT NULL,
  `whether_machinery_is_used` varchar(100) DEFAULT NULL,
  `nature_of_power_used` varchar(100) DEFAULT NULL,
  `a_to_f_fillerd_and_attached` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `mine_name_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_metelliferousmine_annual_annexure_ii`
--

CREATE TABLE `dgms_metelliferousmine_annual_annexure_ii` (
  `id` int(11) NOT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `aecm_year` int(11) DEFAULT NULL,
  `mine_vill` varchar(100) DEFAULT NULL,
  `mine_tehsil` varchar(100) DEFAULT NULL,
  `mine_dist` varchar(50) DEFAULT NULL,
  `mine_pin` varchar(10) DEFAULT NULL,
  `mine_state` varchar(50) DEFAULT NULL,
  `mine_dop` date DEFAULT NULL,
  `labour_id_no` varchar(100) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `owner_telephone` varchar(20) DEFAULT NULL,
  `owner_mobile` varchar(20) DEFAULT NULL,
  `owner_email` varchar(50) DEFAULT NULL,
  `owner_vill` varchar(100) DEFAULT NULL,
  `owner_tehsil` varchar(100) DEFAULT NULL,
  `owner_dist` varchar(50) DEFAULT NULL,
  `owner_pin` varchar(10) DEFAULT NULL,
  `owner_state` varchar(50) DEFAULT NULL,
  `agent_name` varchar(100) DEFAULT NULL,
  `agent_telephone` varchar(20) DEFAULT NULL,
  `agent_mobile` varchar(20) DEFAULT NULL,
  `agent_email` varchar(50) DEFAULT NULL,
  `agent_vill` varchar(100) DEFAULT NULL,
  `agent_tehsil` varchar(100) DEFAULT NULL,
  `agent_dist` varchar(50) DEFAULT NULL,
  `agent_pin` varchar(10) DEFAULT NULL,
  `agent_state` varchar(50) DEFAULT NULL,
  `manager_name` varchar(100) DEFAULT NULL,
  `manager_telephone` varchar(20) DEFAULT NULL,
  `manager_mobile` varchar(20) DEFAULT NULL,
  `manager_email` varchar(50) DEFAULT NULL,
  `manager_vill` varchar(100) DEFAULT NULL,
  `manager_tehsil` varchar(100) DEFAULT NULL,
  `manager_dist` varchar(100) DEFAULT NULL,
  `manager_pin` varchar(10) DEFAULT NULL,
  `manager_state` varchar(100) DEFAULT NULL,
  `no_of_contractors` varchar(100) DEFAULT NULL,
  `dept_background_male` varchar(100) DEFAULT NULL,
  `dept_background_female` varchar(100) DEFAULT NULL,
  `dept_total_background_male_female` varchar(100) DEFAULT NULL,
  `cont_background_male` varchar(100) DEFAULT NULL,
  `cont_background_female` varchar(100) DEFAULT NULL,
  `cont_background_total_male_female` varchar(100) DEFAULT NULL,
  `dept_opencast_male` varchar(100) DEFAULT NULL,
  `dept_opencast_female` varchar(100) DEFAULT NULL,
  `dept_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `cont_opencast_male` varchar(100) DEFAULT NULL,
  `cont_opencast_female` varchar(100) DEFAULT NULL,
  `cont_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `dept_aboveground_male` varchar(100) DEFAULT NULL,
  `dept_aboveground_female` varchar(100) DEFAULT NULL,
  `dept_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `cont_aboveground_male` varchar(100) DEFAULT NULL,
  `cont_aboveground_female` varchar(100) DEFAULT NULL,
  `cont_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `wbg_number` varchar(100) DEFAULT NULL,
  `wbg_day` date NOT NULL,
  `am_number` varchar(100) DEFAULT NULL,
  `am_day` date NOT NULL,
  `dept_tmw_background_male` varchar(100) DEFAULT NULL,
  `dept_tmw_background_female` varchar(100) DEFAULT NULL,
  `dept_tmw_background_total_male_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_background_male` varchar(100) DEFAULT NULL,
  `dept_adnpe_background_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_background_total_male_female` varchar(100) DEFAULT NULL,
  `cont_tmw_background_male` varchar(100) DEFAULT NULL,
  `cont_tmw_background_female` varchar(100) DEFAULT NULL,
  `cont_tmw_background_total_male_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_background_male` varchar(100) DEFAULT NULL,
  `cont_adnpe_background_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_background_total_male_female` varchar(100) DEFAULT NULL,
  `dept_tmw_opencast_male` varchar(100) DEFAULT NULL,
  `dept_tmw_opencast_female` varchar(100) DEFAULT NULL,
  `dept_tmw_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_opencast_male` varchar(100) DEFAULT NULL,
  `dept_adnpe_opencast_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `cont_tmw_opencast_male` varchar(100) DEFAULT NULL,
  `cont_tmw_opencast_female` varchar(100) DEFAULT NULL,
  `cont_tmw_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_opencast_male` varchar(100) DEFAULT NULL,
  `cont_adnpe_opencast_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_opencast_total_male_female` varchar(100) DEFAULT NULL,
  `dept_tmw_aboveground_male` varchar(100) DEFAULT NULL,
  `dept_tmw_aboveground_female` varchar(100) DEFAULT NULL,
  `dept_tmw_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_aboveground_male` varchar(100) DEFAULT NULL,
  `dept_adnpe_aboveground_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `cont_tmw_aboveground_male` varchar(100) DEFAULT NULL,
  `cont_tmw_aboveground_female` varchar(100) DEFAULT NULL,
  `cont_tmw_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_aboveground_male` varchar(100) DEFAULT NULL,
  `cont_adnpe_aboveground_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_aboveground_total_male_female` varchar(100) DEFAULT NULL,
  `no_of_contractors_engaged` varchar(100) DEFAULT NULL,
  `no_of_shift_worked` varchar(100) DEFAULT NULL,
  `mh_1` varchar(100) DEFAULT NULL,
  `mh_2` varchar(100) DEFAULT NULL,
  `mh_3` varchar(100) DEFAULT NULL,
  `explosive_used_in_the_mine` varchar(100) DEFAULT NULL,
  `electrical_background` varchar(100) DEFAULT NULL,
  `ongs_background` varchar(100) DEFAULT NULL,
  `comp_air` varchar(100) DEFAULT NULL,
  `electrical_opencast` varchar(100) DEFAULT NULL,
  `ongs_opencast` varchar(100) DEFAULT NULL,
  `comp_air_opencast` varchar(100) DEFAULT NULL,
  `electrical_aboveground` varchar(100) DEFAULT NULL,
  `ongs_aboveground` varchar(100) DEFAULT NULL,
  `comp_air_aboveground` varchar(100) DEFAULT NULL,
  `total_electrical` varchar(100) DEFAULT NULL,
  `total_ongs` varchar(100) DEFAULT NULL,
  `total_comp_air` varchar(100) DEFAULT NULL,
  `lighting` varchar(100) DEFAULT NULL,
  `power` varchar(100) DEFAULT NULL,
  `ime_npe_dept` varchar(100) DEFAULT NULL,
  `ime_npe_cont` varchar(100) DEFAULT NULL,
  `ime_npru_dept` varchar(100) DEFAULT NULL,
  `ime_npru_cont` varchar(100) DEFAULT NULL,
  `ime_npau_dept` varchar(100) DEFAULT NULL,
  `ime_npau_cont` varchar(100) DEFAULT NULL,
  `ime_no_of_p_d_m_unfit` varchar(100) DEFAULT NULL,
  `pme_npe_dept` varchar(100) DEFAULT NULL,
  `pme_npe_cont` varchar(100) DEFAULT NULL,
  `pme_npru_dept` varchar(100) DEFAULT NULL,
  `pme_npru_cont` varchar(100) DEFAULT NULL,
  `pme_npau_dept` varchar(100) DEFAULT NULL,
  `pme_npau_cont` varchar(100) DEFAULT NULL,
  `pme_no_of_p_d_m_unfit` varchar(100) DEFAULT NULL,
  `no_of_workmen_req` varchar(100) DEFAULT NULL,
  `no_of_workmen_provide` varchar(100) DEFAULT NULL,
  `no_of_satfy_c_meeting_conduct` varchar(100) DEFAULT NULL,
  `npe_bvt_dept` varchar(100) DEFAULT NULL,
  `npe_bvt_cont` varchar(100) DEFAULT NULL,
  `npruvt_bvt_dept` varchar(100) DEFAULT NULL,
  `npruvt_bvt_cont` varchar(100) DEFAULT NULL,
  `npauvt_bvt_dept` varchar(100) DEFAULT NULL,
  `npauvt_bvt_cont` varchar(100) DEFAULT NULL,
  `npe_rt_dept` varchar(100) DEFAULT NULL,
  `npe_rt_cont` varchar(100) DEFAULT NULL,
  `npruvt_rt_dept` varchar(100) DEFAULT NULL,
  `npruvt_rt_cont` varchar(100) DEFAULT NULL,
  `npauvt_rt_dept` varchar(100) DEFAULT NULL,
  `npauvt_rt_cont` varchar(100) DEFAULT NULL,
  `mine_name_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_metelliferousmine_annual_annexure_ii_subtable_1`
--

CREATE TABLE `dgms_metelliferousmine_annual_annexure_ii_subtable_1` (
  `id` int(11) NOT NULL,
  `base_column_id` int(11) DEFAULT NULL,
  `spem_designation` varchar(100) DEFAULT NULL,
  `spem_no_requried` varchar(100) DEFAULT NULL,
  `spem_no_available` varchar(100) DEFAULT NULL,
  `spem_short_surplus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_metelliferousmine_annual_annexure_ii_subtable_2`
--

CREATE TABLE `dgms_metelliferousmine_annual_annexure_ii_subtable_2` (
  `id` int(11) NOT NULL,
  `base_column_id` int(11) DEFAULT NULL,
  `accident_statistics_year` varchar(100) DEFAULT NULL,
  `accident_statistics_fatal_number` varchar(100) DEFAULT NULL,
  `accident_statistics_fatal_no_of_persion_killed` varchar(100) DEFAULT NULL,
  `accident_statistics_fatal_no_of_persion_injured` varchar(100) DEFAULT NULL,
  `accident_statistics_serious` varchar(100) DEFAULT NULL,
  `accident_statistics_serious_injured` varchar(100) DEFAULT NULL,
  `accident_statistics_reportable_number` varchar(100) DEFAULT NULL,
  `accident_statistics_reportable_injured` varchar(100) DEFAULT NULL,
  `accident_statistics_minor_number` varchar(100) DEFAULT NULL,
  `accident_statistics_minor_injured` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_metelliferousmine_annual_annexure_ii_subtable_3`
--

CREATE TABLE `dgms_metelliferousmine_annual_annexure_ii_subtable_3` (
  `id` int(11) NOT NULL,
  `base_column_id` int(11) DEFAULT NULL,
  `cre_1` varchar(100) DEFAULT NULL,
  `cre_2` varchar(100) DEFAULT NULL,
  `cre_3` varchar(100) DEFAULT NULL,
  `cre_4` varchar(100) DEFAULT NULL,
  `cre_5` varchar(100) DEFAULT NULL,
  `cre_6` varchar(100) DEFAULT NULL,
  `cre_7` varchar(100) DEFAULT NULL,
  `cre_8` varchar(100) DEFAULT NULL,
  `cre_9` varchar(100) DEFAULT NULL,
  `cre_10` varchar(100) DEFAULT NULL,
  `cre_11` varchar(100) DEFAULT NULL,
  `cre_12` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_oilmines_annual_annexure_iii`
--

CREATE TABLE `dgms_oilmines_annual_annexure_iii` (
  `id` int(11) NOT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `aecm_year` int(11) DEFAULT NULL,
  `mine_vill` varchar(100) DEFAULT NULL,
  `mine_tehsil` varchar(100) DEFAULT NULL,
  `mine_dist` varchar(50) DEFAULT NULL,
  `mine_pin` varchar(10) DEFAULT NULL,
  `mine_state` varchar(50) DEFAULT NULL,
  `mine_dop` date DEFAULT NULL,
  `labour_id_no` varchar(100) DEFAULT NULL,
  `owner_name` varchar(100) DEFAULT NULL,
  `owner_telephone` varchar(20) DEFAULT NULL,
  `owner_mobile` varchar(20) DEFAULT NULL,
  `owner_email` varchar(50) DEFAULT NULL,
  `owner_vill` varchar(100) DEFAULT NULL,
  `owner_tehsil` varchar(100) DEFAULT NULL,
  `owner_dist` varchar(50) DEFAULT NULL,
  `owner_pin` varchar(10) DEFAULT NULL,
  `owner_state` varchar(50) DEFAULT NULL,
  `agent_name` varchar(100) DEFAULT NULL,
  `agent_telephone` varchar(20) DEFAULT NULL,
  `agent_mobile` varchar(20) DEFAULT NULL,
  `agent_email` varchar(50) DEFAULT NULL,
  `agent_vill` varchar(100) DEFAULT NULL,
  `agent_tehsil` varchar(100) DEFAULT NULL,
  `agent_dist` varchar(50) DEFAULT NULL,
  `agent_pin` varchar(10) DEFAULT NULL,
  `agent_state` varchar(50) DEFAULT NULL,
  `manager_name` varchar(100) DEFAULT NULL,
  `manager_telephone` varchar(20) DEFAULT NULL,
  `manager_mobile` varchar(20) DEFAULT NULL,
  `manager_email` varchar(50) DEFAULT NULL,
  `manager_vill` varchar(100) DEFAULT NULL,
  `manager_tehsil` varchar(100) DEFAULT NULL,
  `manager_dist` varchar(100) DEFAULT NULL,
  `manager_pin` varchar(10) DEFAULT NULL,
  `manager_state` varchar(100) DEFAULT NULL,
  `no_of_contractors` varchar(100) DEFAULT NULL,
  `classification` varchar(100) DEFAULT NULL,
  `dept_male` varchar(100) DEFAULT NULL,
  `dept_female` varchar(100) DEFAULT NULL,
  `dept_total_male_female` varchar(100) DEFAULT NULL,
  `cont_male` varchar(100) DEFAULT NULL,
  `cont_female` varchar(100) DEFAULT NULL,
  `cont_total_male_female` varchar(100) DEFAULT NULL,
  `wbg_number` varchar(100) DEFAULT NULL,
  `wbg_day` date NOT NULL,
  `dmw_classification` varchar(100) DEFAULT NULL,
  `dept_tmw_male` varchar(100) DEFAULT NULL,
  `dept_tmw_female` varchar(100) DEFAULT NULL,
  `dept_tmw_total_male_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_male` varchar(100) DEFAULT NULL,
  `dept_adnpe_female` varchar(100) DEFAULT NULL,
  `dept_adnpe_total_male_female` varchar(100) DEFAULT NULL,
  `cont_tmw_male` varchar(100) DEFAULT NULL,
  `cont_tmw_female` varchar(100) DEFAULT NULL,
  `cont_tmw_total_male_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_male` varchar(100) DEFAULT NULL,
  `cont_adnpe_female` varchar(100) DEFAULT NULL,
  `cont_adnpe_total_male_female` varchar(100) DEFAULT NULL,
  `no_of_days_worked` varchar(100) DEFAULT NULL,
  `no_of_shift_worked` varchar(100) DEFAULT NULL,
  `place_name1` varchar(100) DEFAULT NULL,
  `place_name1_electrical` varchar(100) DEFAULT NULL,
  `place_name1_ongs` varchar(100) DEFAULT NULL,
  `place_name1_comp_air` varchar(100) DEFAULT NULL,
  `place_name2` varchar(100) DEFAULT NULL,
  `place_name2_electrical` varchar(100) DEFAULT NULL,
  `place_name2_ongs` varchar(100) DEFAULT NULL,
  `place_name2_comp_air` varchar(100) DEFAULT NULL,
  `total_electrical` varchar(100) DEFAULT NULL,
  `total_ongs` varchar(100) DEFAULT NULL,
  `total_comp_air` varchar(100) DEFAULT NULL,
  `lighting` varchar(100) DEFAULT NULL,
  `power` varchar(100) DEFAULT NULL,
  `drillig_type_of_rig` varchar(100) DEFAULT NULL,
  `drillig_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `workover_type_of_rig` varchar(100) DEFAULT NULL,
  `workover_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `other_rigs_type_of_rig` varchar(100) DEFAULT NULL,
  `other_rigs_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `wells_drilled_type_of_rig` varchar(100) DEFAULT NULL,
  `wells_drilled_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `wells_abandoned_type_of_rig` varchar(100) DEFAULT NULL,
  `wells_abandoned_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `gas_wells_completed_type_of_rig` varchar(100) DEFAULT NULL,
  `gas_wells_completed_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `oil_wells_completed_type_of_rig` varchar(100) DEFAULT NULL,
  `oil_wells_completed_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `gas_wells_production_type_of_rig` varchar(100) DEFAULT NULL,
  `gas_wells_production_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `oil_wells_production_type_of_rig` varchar(100) DEFAULT NULL,
  `oil_wells_production_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `oil_wells_production_discontinued_type_of_rig` varchar(100) DEFAULT NULL,
  `oil_wells_production_discontinued_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `f_l_l_well_gathering_station_type_of_rig` varchar(100) DEFAULT NULL,
  `f_l_l_well_gathering_station_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `p_l_well_gathering_station_central_type_of_rig` varchar(100) DEFAULT NULL,
  `p_l_well_gathering_station_central_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `other_type_of_rig` varchar(100) DEFAULT NULL,
  `other_total_no_of_units_in_use` varchar(100) DEFAULT NULL,
  `dp_oil_mt_opening` varchar(100) DEFAULT NULL,
  `dp_oil_mt_prod` varchar(100) DEFAULT NULL,
  `dp_oil_mt_value` varchar(100) DEFAULT NULL,
  `dp_oil_mt_to_refinery` varchar(100) DEFAULT NULL,
  `dp_oil_mt_to_marketing` varchar(100) DEFAULT NULL,
  `dp_oil_mt_for_house_consumption` varchar(100) DEFAULT NULL,
  `dp_oil_mt_closing` varchar(100) DEFAULT NULL,
  `dp_gas_opening` varchar(100) DEFAULT NULL,
  `dp_gas_prod` varchar(100) DEFAULT NULL,
  `dp_gas_value` varchar(100) DEFAULT NULL,
  `dp_gas_to_refinery` varchar(100) DEFAULT NULL,
  `dp_gas_to_marketing` varchar(100) DEFAULT NULL,
  `dp_gas_for_house_consumption` varchar(100) DEFAULT NULL,
  `dp_gas_closing` varchar(100) DEFAULT NULL,
  `ime_npe_dept` varchar(100) DEFAULT NULL,
  `ime_npe_cont` varchar(100) DEFAULT NULL,
  `ime_npru_dept` varchar(100) DEFAULT NULL,
  `ime_npru_cont` varchar(100) DEFAULT NULL,
  `ime_npau_dept` varchar(100) DEFAULT NULL,
  `ime_npau_cont` varchar(100) DEFAULT NULL,
  `ime_no_of_p_d_m_unfit` varchar(100) DEFAULT NULL,
  `pme_npe_dept` varchar(100) DEFAULT NULL,
  `pme_npe_cont` varchar(100) DEFAULT NULL,
  `pme_npru_dept` varchar(100) DEFAULT NULL,
  `pme_npru_cont` varchar(100) DEFAULT NULL,
  `pme_npau_dept` varchar(100) DEFAULT NULL,
  `pme_npau_cont` varchar(100) DEFAULT NULL,
  `pme_no_of_p_d_m_unfit` varchar(100) DEFAULT NULL,
  `no_of_workmen_req` varchar(100) DEFAULT NULL,
  `no_of_workmen_provide` varchar(100) DEFAULT NULL,
  `no_of_satfy_c_meeting_conduct` varchar(100) DEFAULT NULL,
  `npe_bvt_dept` varchar(100) DEFAULT NULL,
  `npe_bvt_cont` varchar(100) DEFAULT NULL,
  `npruvt_bvt_dept` varchar(100) DEFAULT NULL,
  `npruvt_bvt_cont` varchar(100) DEFAULT NULL,
  `npauvt_bvt_dept` varchar(100) DEFAULT NULL,
  `npauvt_bvt_cont` varchar(100) DEFAULT NULL,
  `npe_rt_dept` varchar(100) DEFAULT NULL,
  `npe_rt_cont` varchar(100) DEFAULT NULL,
  `npruvt_rt_dept` varchar(100) DEFAULT NULL,
  `npruvt_rt_cont` varchar(100) DEFAULT NULL,
  `npauvt_rt_dept` varchar(100) DEFAULT NULL,
  `npauvt_rt_cont` varchar(100) DEFAULT NULL,
  `mine_name_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_oilmines_annual_annexure_iii_subtable_1`
--

CREATE TABLE `dgms_oilmines_annual_annexure_iii_subtable_1` (
  `id` int(11) NOT NULL,
  `base_column_id` int(11) DEFAULT NULL,
  `spem_designation` varchar(100) DEFAULT NULL,
  `spem_no_requried` varchar(100) DEFAULT NULL,
  `spem_no_available` varchar(100) DEFAULT NULL,
  `spem_short_surplus` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_oilmines_annual_annexure_iii_subtable_2`
--

CREATE TABLE `dgms_oilmines_annual_annexure_iii_subtable_2` (
  `id` int(11) NOT NULL,
  `base_column_id` int(11) DEFAULT NULL,
  `accident_statistics_year` varchar(100) DEFAULT NULL,
  `accident_statistics_fatal_number` varchar(100) DEFAULT NULL,
  `accident_statistics_fatal_no_of_persion_killed` varchar(100) DEFAULT NULL,
  `accident_statistics_fatal_no_of_persion_injured` varchar(100) DEFAULT NULL,
  `accident_statistics_serious` varchar(100) DEFAULT NULL,
  `accident_statistics_serious_injured` varchar(100) DEFAULT NULL,
  `accident_statistics_reportable_number` varchar(100) DEFAULT NULL,
  `accident_statistics_reportable_injured` varchar(100) DEFAULT NULL,
  `accident_statistics_minor_number` varchar(100) DEFAULT NULL,
  `accident_statistics_minor_injured` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_ventilation`
--

CREATE TABLE `dgms_ventilation` (
  `id` int(11) NOT NULL,
  `location` varchar(500) DEFAULT NULL,
  `quantity` varchar(500) DEFAULT NULL,
  `velocity` varchar(500) DEFAULT NULL,
  `t_wet` varchar(500) DEFAULT NULL,
  `t_dry` varchar(500) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `mine_name_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `distribution_details`
--

CREATE TABLE `distribution_details` (
  `id` int(11) NOT NULL,
  `distribution_date` date DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL,
  `mine_name` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `prod_category` varchar(100) DEFAULT NULL,
  `prod_name` varchar(100) DEFAULT NULL,
  `batch_number` varchar(100) DEFAULT NULL,
  `assign_quantity` int(11) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `prod_unique_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(54, 'employee', '0001_initial', '2020-01-22 12:09:26.519712'),
(55, 'setting', '0001_initial', '2020-01-24 11:12:56.346273'),
(56, 'DGMS_Forms', '0001_initial', '2020-02-11 10:35:38.822649'),
(57, 'sensor', '0001_initial', '2020-03-23 14:44:26.477033'),
(58, 'sensor', '0002_node_isgoaf', '2020-03-23 14:52:43.507568');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1llk7ubninwj7o5uourx60gsjjsrjfys', 'OTRiNTY5NzkxMDJjMWY3MmY5NDJjZjA2OTk5MjIzOGZhMGE3ZjE3NTp7Il9hdXRoX3VzZXJfaWQiOiI1NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWI0MDY3NjI4NDM1NzJmZDJjY2Y4MGViZTA3MzZmNDcwZjRkOWY0NSJ9', '2020-03-26 14:59:46.153627'),
('3qi2rt9oquyr428fcute6mqmfphwoqy6', 'OTRiNTY5NzkxMDJjMWY3MmY5NDJjZjA2OTk5MjIzOGZhMGE3ZjE3NTp7Il9hdXRoX3VzZXJfaWQiOiI1NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWI0MDY3NjI4NDM1NzJmZDJjY2Y4MGViZTA3MzZmNDcwZjRkOWY0NSJ9', '2020-02-18 11:33:42.262900'),
('6iuphv9oljwwa19npwp324rgpebymuv1', 'OTRiNTY5NzkxMDJjMWY3MmY5NDJjZjA2OTk5MjIzOGZhMGE3ZjE3NTp7Il9hdXRoX3VzZXJfaWQiOiI1NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWI0MDY3NjI4NDM1NzJmZDJjY2Y4MGViZTA3MzZmNDcwZjRkOWY0NSJ9', '2020-04-07 15:21:13.006800'),
('bkq9cjabia7eprg1it1m621vefg0lt22', 'YWU5ZjIyMmMyNjFkMjliMTJjNThjOGNiZTY0ODc4MGI5NjE5NmQ5Nzp7Il9hdXRoX3VzZXJfaWQiOiI1NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjk3MDY0MjMxZjA2ZTEzMmVlNDk3MDRlMTFiOGRmMjdhMjI4MjFiZiJ9', '2020-02-12 11:15:45.925936'),
('dxgsk2u29t5q6cdje0vqljsgroee7vhk', 'OTRiNTY5NzkxMDJjMWY3MmY5NDJjZjA2OTk5MjIzOGZhMGE3ZjE3NTp7Il9hdXRoX3VzZXJfaWQiOiI1NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWI0MDY3NjI4NDM1NzJmZDJjY2Y4MGViZTA3MzZmNDcwZjRkOWY0NSJ9', '2020-03-04 17:53:43.283859'),
('g3uykq3k1irzbrhhnl1emf1zraeymt6v', 'OTRiNTY5NzkxMDJjMWY3MmY5NDJjZjA2OTk5MjIzOGZhMGE3ZjE3NTp7Il9hdXRoX3VzZXJfaWQiOiI1NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWI0MDY3NjI4NDM1NzJmZDJjY2Y4MGViZTA3MzZmNDcwZjRkOWY0NSJ9', '2020-03-13 10:52:51.124070'),
('t2dy8hp3fgdcxvnn57swkqsiw977m7ih', 'MGI1MTAyMjFlYTRlNmRjZTEzYzc3MmFlMDE3YzYzYWYxY2UzNWY3Yjp7Il9hdXRoX3VzZXJfaWQiOiI1NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWI0MDY3NjI4NDM1NzJmZDJjY2Y4MGViZTA3MzZmNDcwZjRkOWY0NSIsImxhbmciOiJlbiJ9', '2020-03-02 09:48:44.468764'),
('xfei02nji2tth7zf9apaxkkru9fh7ltk', 'YWU5ZjIyMmMyNjFkMjliMTJjNThjOGNiZTY0ODc4MGI5NjE5NmQ5Nzp7Il9hdXRoX3VzZXJfaWQiOiI1NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjk3MDY0MjMxZjA2ZTEzMmVlNDk3MDRlMTFiOGRmMjdhMjI4MjFiZiJ9', '2020-04-06 14:20:28.295659'),
('xh6pjjdunwwhdr8jrdewaooxy7hrru5w', 'YTA2MmJkNDMyNTIwNjUwYWU5MjkwMmEyMDkyM2U2NGU3MTcyZmNiMzp7Il9hdXRoX3VzZXJfaWQiOiI1NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWI0MDY3NjI4NDM1NzJmZDJjY2Y4MGViZTA3MzZmNDcwZjRkOWY0NSIsImxhbmciOiJpbiJ9', '2020-04-03 10:21:15.066821'),
('xqbr2a1xoj64l7z1n3uw3um4bh47w189', 'YWU5ZjIyMmMyNjFkMjliMTJjNThjOGNiZTY0ODc4MGI5NjE5NmQ5Nzp7Il9hdXRoX3VzZXJfaWQiOiI1NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjk3MDY0MjMxZjA2ZTEzMmVlNDk3MDRlMTFiOGRmMjdhMjI4MjFiZiJ9', '2020-03-26 10:35:57.900886'),
('zicqrehzwchmidr87y8hc4zb6rg5omcs', 'OTRiNTY5NzkxMDJjMWY3MmY5NDJjZjA2OTk5MjIzOGZhMGE3ZjE3NTp7Il9hdXRoX3VzZXJfaWQiOiI1NCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOWI0MDY3NjI4NDM1NzJmZDJjY2Y4MGViZTA3MzZmNDcwZjRkOWY0NSJ9', '2020-03-23 14:30:28.268212');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `type` varchar(1000) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `email_to` varchar(1000) DEFAULT NULL,
  `email_from` varchar(1000) DEFAULT NULL,
  `sent_on` datetime(6) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `subject` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `empid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `mob` varchar(100) DEFAULT NULL,
  `state` varchar(100) NOT NULL,
  `city` longtext NOT NULL,
  `pin` longtext DEFAULT NULL,
  `gender` varchar(128) DEFAULT NULL,
  `marital_status` varchar(128) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `rfid` longtext DEFAULT NULL,
  `designation` longtext DEFAULT NULL,
  `token_no` longtext DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `retirement_date` date DEFAULT NULL,
  `job_type` varchar(128) DEFAULT NULL,
  `cat_type` longtext DEFAULT NULL,
  `is_rescue` varchar(10) NOT NULL,
  `blood_group` varchar(200) DEFAULT NULL,
  `medical_status` longtext NOT NULL,
  `aadhaar_no` varchar(20) DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `voter_id_no` varchar(20) DEFAULT NULL,
  `medical_ins_no` varchar(30) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_ac_no` varchar(30) DEFAULT NULL,
  `bank_ifsc` varchar(20) DEFAULT NULL,
  `bank_pf_no` varchar(20) DEFAULT NULL,
  `edu_course_name` varchar(50) DEFAULT NULL,
  `edu_board_name` varchar(50) DEFAULT NULL,
  `edu_year` varchar(20) DEFAULT NULL,
  `edu_percent` varchar(20) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `immediate_staff_id` int(11) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL,
  `mining_role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `empid`, `name`, `father_name`, `dob`, `address`, `email`, `mob`, `state`, `city`, `pin`, `gender`, `marital_status`, `photo`, `rfid`, `designation`, `token_no`, `date_of_joining`, `retirement_date`, `job_type`, `cat_type`, `is_rescue`, `blood_group`, `medical_status`, `aadhaar_no`, `pan_no`, `voter_id_no`, `medical_ins_no`, `bank_name`, `bank_ac_no`, `bank_ifsc`, `bank_pf_no`, `edu_course_name`, `edu_board_name`, `edu_year`, `edu_percent`, `created_date`, `modified_date`, `immediate_staff_id`, `mine_id`, `mining_role_id`) VALUES
(1, 'Example_new', 'Dew Kumar_new', 'Anand Kumar Kumar', '1991-02-15', 'Dhanbad', 'devwangshu@gmail.com', '7870249601', 'Jharkhand', 'Dhanbad', '826001', 'M', 'M', '', 'M007', 'des', 'T894654', '2018-06-20', '2018-07-09', 'Regular', 'opencast', 'No', 'A+', 'ok', '999999999999', 'QPK123456', '987654321', '987654321', 'State Bank of India', '12345678945', 'SBIN0001670', '999999999', 'Lorem Ipsum', 'CBSE', '2019', '99.99', '2018-07-04 12:42:18.017876', '2020-01-29 15:58:55.100107', NULL, 1, 1),
(2, 'M002', 'mohit', 'aanand', '2018-07-04', 'wb', 'dewangshu@yahoo.in', '0000000000', 'Andra Pradesh', 'jj', '', 'M', 'M', 'employee_image/csir_logo_NRj_icon.ico', 'R687689', '3e2', 'T798795', '2018-06-21', '2018-07-09', 'Regular', 'underground', 'No', 'O+', 'OK', '', '', '', '', '', '', '', '', '', '', '', '0.00', '2018-07-04 12:42:18.017876', '2020-03-02 14:39:29.757765', 1, 1, 2),
(3, 'M003', 'Amit Kumar', 'abc', '2018-07-04', 'dhanbad', 'amit@example.com', '0000000000', 'Andra Pradesh', 'dhanbad', '', 'M', 'M', 'employee_image/miner4_hbtNZna.jpg', 'R673657843659', 'RE', 't65869438', '2018-06-27', '2018-07-09', 'Regular', 'underground', 'No', 'B-', 'ok', '', '', '', '', '', '', '', '', '', '', '', '0.00', '2018-07-04 12:42:18.017876', '2018-08-31 06:05:31.663656', 2, 1, NULL),
(4, 'E001', 'Dr SK Chaulya', 'KK', '2019-01-10', 'CSIR CIMFR DHANBAD', 'drsk.90@example.com', '9336969369', 'Jharkhand', 'DHANBAD', '123456', 'M', 'M', '', 'M001', 'GM', 'T001', '2019-01-10', '2019-01-10', 'Regular', 'surface', 'No', 'A+', 'NO ANY DESC..', '', '', '', '', '', '', '', '', 'Mtech', 'IITKGP', '2012', '87.9', '2019-01-10 12:25:51.496436', '2019-01-10 12:25:51.521349', NULL, 8, 1),
(5, 'E002', 'Bimal Kumar Mandal', 'ss', '2019-01-10', 'Dhanbad', 'bimal@example.com', '1234569870', 'Jharkhand', 'dhn', '826001', 'M', 'M', '', 'M002', '', 'T002', '2019-01-10', '2019-01-10', 'Regular', 'underground', 'No', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '2019-01-10 12:28:45.005709', '2019-01-10 14:18:09.698658', 4, 8, 2),
(6, 'E003', 'Chandan Kumar', 'ff', '2019-01-10', 'dhnabd', 'chandan@example.com', '2345678909', 'Jharkhand', 'dhnbad', '826001', 'M', 'M', '', 'M003', '', '', '2019-01-10', '2019-01-10', 'Regular', 'underground', 'No', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '2019-01-10 12:32:36.254732', '2019-01-10 14:31:52.004525', 5, 8, 9),
(7, 'E005', 'Dharmendra Kumar', 'jai kishore saw', '2070-10-09', 'chas', 'dheeru3091@gmail.com', '7531957500', 'Jharkhand', 'dhanbad', '827013', 'M', 'U', '', 'M005', '', '', '2019-01-10', '2019-01-10', 'Regular', 'underground', 'No', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '2019-01-10 12:49:03.536442', '2019-01-10 14:32:19.590801', 5, 8, 3),
(8, 'E004', 'Naresh Kumar', 'dd', '2019-01-10', 'dhnabd', 'NARESH@example.com', '2345678909', 'Jharkhand', 'dhnbad', '826001', 'M', 'M', '', 'M004', '', '', '2019-01-10', '2019-01-10', 'Regular', 'underground', 'No', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '2019-01-10 14:08:17.708159', '2019-01-10 14:33:13.921604', 7, 8, 5),
(9, 'E006', 'Dewangshu Pandit', 'kk', '2019-01-10', 'dhnabd', 'devwangshu@gmail.com', '2345678909', 'Jharkhand', 'dhnbad', '826001', 'M', 'M', 'employee_image/csir_logo_NRj_icon_kvwa7BS.ico', 'M006', '', '', '2019-01-10', '2019-01-10', 'Regular', 'underground', 'No', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '2019-01-10 15:19:45.685773', '2019-09-20 10:10:45.029313', 8, 8, 6),
(10, 'E011', 'Vikash', 'Anand', '1993-10-03', 'Dhanbad', 'vikashkisku@gmail.com', '9876543210', 'Jharkhand', 'Dhanbad', '826001', 'M', 'U', 'employee_image/ORoadMachineryIMG84380_iyPA05I.jpg', 'R86359345', 'des', 'T894654', '2019-10-14', '2019-10-14', 'Regular', 'underground', 'No', 'A+', 'ok', '999999999999', 'QPK123456', '987654321', '987654321', 'State Bank of India', '12345678945', 'SBIN0001670', '999999999', 'Lorem Ipsum', 'CBSE', '2019', '99.99', '2019-10-14 14:04:00.575779', '2020-01-29 16:28:28.839210', 4, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `employeeshiftassign`
--

CREATE TABLE `employeeshiftassign` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `mine_shift_id` int(11) NOT NULL,
  `shift_time` varchar(200) NOT NULL,
  `assign_date` date NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employeeshiftassign`
--

INSERT INTO `employeeshiftassign` (`id`, `employee_id`, `mine_shift_id`, `shift_time`, `assign_date`, `created_date`, `modified_date`) VALUES
(4, 1, 1, '', '2020-01-22', '2020-01-22 00:00:00.000000', '2020-01-22 11:16:23.397336'),
(5, 1, 2, '', '2020-01-22', '2020-01-22 00:00:00.000000', '2020-01-22 11:16:30.165649');

-- --------------------------------------------------------

--
-- Table structure for table `employee_employee`
--

CREATE TABLE `employee_employee` (
  `id` int(11) NOT NULL,
  `fname` varchar(200) NOT NULL,
  `lname` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `doj` date NOT NULL,
  `rfid` varchar(200) NOT NULL,
  `address` longtext NOT NULL,
  `state` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `pin` int(11) NOT NULL,
  `mob` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fireexp_area`
--

CREATE TABLE `fireexp_area` (
  `id` int(11) NOT NULL,
  `areaName` varchar(400) DEFAULT NULL,
  `desc` varchar(400) DEFAULT NULL,
  `IpAddress` varchar(200) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fireexp_area`
--

INSERT INTO `fireexp_area` (`id`, `areaName`, `desc`, `IpAddress`, `mine_id_id`) VALUES
(2, 'Goaf Area', 'Goaf Description', '192.168.1.166', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fire_exp_gases`
--

CREATE TABLE `fire_exp_gases` (
  `id` int(11) NOT NULL,
  `o2` double NOT NULL,
  `co` double NOT NULL,
  `ch4` double NOT NULL,
  `co2` double NOT NULL,
  `h2` double NOT NULL,
  `n2` double NOT NULL,
  `c2h4` double NOT NULL,
  `graham_ratio` double NOT NULL,
  `graham_msg` longtext NOT NULL,
  `young_ratio` double NOT NULL,
  `young_msg` longtext NOT NULL,
  `coco2_ratio` double NOT NULL,
  `coco2_msg` longtext NOT NULL,
  `jtr_ratio` double NOT NULL,
  `jtr_msg` longtext NOT NULL,
  `chra_ratio` double NOT NULL,
  `chra_msg` longtext NOT NULL,
  `explosm_result` longtext NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fire_exp_gaseswifi`
--

CREATE TABLE `fire_exp_gaseswifi` (
  `id` int(11) NOT NULL,
  `Area_id` int(11) DEFAULT NULL,
  `o2` double NOT NULL,
  `co` double NOT NULL,
  `ch4` double NOT NULL,
  `co2` double NOT NULL,
  `h2` double NOT NULL,
  `n2` double NOT NULL,
  `c2h4` double NOT NULL,
  `graham_ratio` double NOT NULL,
  `graham_msg` longtext NOT NULL,
  `young_ratio` double NOT NULL,
  `young_msg` longtext NOT NULL,
  `coco2_ratio` double NOT NULL,
  `coco2_msg` longtext NOT NULL,
  `jtr_ratio` double NOT NULL,
  `jtr_msg` longtext NOT NULL,
  `chra_ratio` double NOT NULL,
  `chra_msg` longtext NOT NULL,
  `explosm_result` longtext NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fire_exp_gaseswifi`
--

INSERT INTO `fire_exp_gaseswifi` (`id`, `Area_id`, `o2`, `co`, `ch4`, `co2`, `h2`, `n2`, `c2h4`, `graham_ratio`, `graham_msg`, `young_ratio`, `young_msg`, `coco2_ratio`, `coco2_msg`, `jtr_ratio`, `jtr_msg`, `chra_ratio`, `chra_msg`, `explosm_result`, `date`) VALUES
(3, 2, 1, 1, 1, 1, 1, 1, 1, -441.1764705882355, 'Normal', -6985.294117647062, 'Superficial heating', 6.315789473684211, 'ACTIVE FIRE', -63.235294117647086, 'Indicative of no fire', 10.76596823482658, 'ACTIVE FIRE', 'Impossible mixture', '2020-02-19'),
(4, 2, 43, 25, 124, 174, 215, 239, 167, 122.94074256208506, 'BLAZING FIRE', 855.6675682321121, 'BLAZING FIRE', 14.367816091954023, 'BLAZING FIRE', 6.83550528645193, 'Indicative of timber fire', 9.146799873030725, 'ACTIVE FIRE', 'Impossible mixture', '2020-02-19'),
(5, 2, 16, 94, 80, 58, 141, 228, 154, 211.61638901395767, 'BLAZING FIRE', 130.5718144979739, 'BLAZING FIRE', 162.06896551724137, 'BLAZING FIRE', 2.09927960378208, 'Indicative of timber fire', 8.403779833418408, 'ACTIVE FIRE', 'Impossible mixture', '2020-02-19'),
(6, 2, 86, 0, 92, 63, 227, 110, 258, -0, 'Normal', -110.8179419525066, 'Superficial heating', 0, 'Normal', -0.10993843447669306, 'Indicative of no fire', 5.892029223059991, 'ACTIVE FIRE', 'Impossible mixture', '2020-02-19'),
(7, 2, 43, 41, 67, 12, 191, 24, 286, -111.8995633187773, 'Normal', -32.751091703056765, 'Superficial heating', 341.6666666666667, 'BLAZING FIRE', 0.13646288209606985, 'Indicative of no fire', 5.7920357833979494, 'ACTIVE FIRE', 'Impossible mixture', '2020-03-06'),
(8, 2, 84, 87, 98, 4, 87, 274, 267, -763.8279192273924, 'Normal', -35.118525021949075, 'Superficial heating', 2175, 'BLAZING FIRE', -4.170324846356452, 'Indicative of no fire', 7.203031848758249, 'ACTIVE FIRE', 'Impossible mixture', '2020-03-07'),
(9, 2, 2, 59, 68, 194, 7, 84, 334, 291.2142152023692, 'BLAZING FIRE', 957.5518262586377, 'BLAZING FIRE', 30.412371134020617, 'BLAZING FIRE', 11.673247778874629, 'Indicative of timber fire', 17.32744967038717, 'ACTIVE FIRE', 'Impossible mixture', '2020-03-08'),
(10, 2, 13, 31, 46, 167, 0, 225, 50, 66.48793565683646, 'BLAZING FIRE', 358.1769436997319, 'BLAZING FIRE', 18.562874251497007, 'BLAZING FIRE', 4.080428954423592, 'Indicative of timber fire', -17.35328737178409, 'Superficial heating', 'Impossible mixture', '2020-03-06');

-- --------------------------------------------------------

--
-- Table structure for table `fire_exp_manual`
--

CREATE TABLE `fire_exp_manual` (
  `id` int(11) NOT NULL,
  `o2` double NOT NULL,
  `co` double NOT NULL,
  `ch4` double NOT NULL,
  `co2` double NOT NULL,
  `h2` double NOT NULL,
  `n2` double NOT NULL,
  `c2h4` double NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fire_exp_manual`
--

INSERT INTO `fire_exp_manual` (`id`, `o2`, `co`, `ch4`, `co2`, `h2`, `n2`, `c2h4`, `date`) VALUES
(3, 4.7, 1.25, 3.5, 14.2, 0, 76.35, 1, '2020-02-16'),
(4, 5.6, 1.16, 2.4, 13.7, 0, 77.1, 1, '2020-02-17'),
(5, 6.3, 1.19, 3, 12.9, 0, 76.61, 5, '2020-02-18'),
(6, 5.2, 1.56, 4.4, 16.4, 7.2, 65.24, 1, '2020-02-19');

-- --------------------------------------------------------

--
-- Table structure for table `gasmodel_auto`
--

CREATE TABLE `gasmodel_auto` (
  `id` int(11) NOT NULL,
  `mine_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `gas_name` varchar(10) NOT NULL,
  `gas_value` varchar(50) NOT NULL,
  `date_time` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gasmodel_auto`
--

INSERT INTO `gasmodel_auto` (`id`, `mine_id`, `node_id`, `gas_name`, `gas_value`, `date_time`) VALUES
(1, 1, 1, 'CO', '208.0', '2020-03-06 16:11:34.201548'),
(2, 1, 1, 'CO', '3.0', '2020-03-06 16:11:52.684501');

-- --------------------------------------------------------

--
-- Table structure for table `gasmonitoring_auto`
--

CREATE TABLE `gasmonitoring_auto` (
  `id` int(11) NOT NULL,
  `CH4` double NOT NULL,
  `CH4_ALERT` varchar(10) NOT NULL,
  `CO` double NOT NULL,
  `CO_ALERT` varchar(10) NOT NULL,
  `CO2` double NOT NULL,
  `CO2_ALERT` varchar(10) NOT NULL,
  `O2` double NOT NULL,
  `O2_ALERT` varchar(10) NOT NULL,
  `H2S` double NOT NULL,
  `H2S_ALERT` varchar(10) NOT NULL,
  `NO2` double NOT NULL,
  `NO2_ALERT` varchar(10) NOT NULL,
  `SO2` double NOT NULL,
  `SO2_ALERT` varchar(10) NOT NULL,
  `H2` double NOT NULL,
  `H2_ALERT` varchar(10) NOT NULL,
  `He` double NOT NULL,
  `He_ALERT` varchar(10) NOT NULL,
  `dt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gasmonitoring_manual`
--

CREATE TABLE `gasmonitoring_manual` (
  `id` int(11) NOT NULL,
  `CH4` double NOT NULL,
  `CH4_ALERT` varchar(10) NOT NULL,
  `CO` double NOT NULL,
  `CO_ALERT` varchar(10) NOT NULL,
  `CO2` double NOT NULL,
  `CO2_ALERT` varchar(10) NOT NULL,
  `O2` double NOT NULL,
  `O2_ALERT` varchar(10) NOT NULL,
  `H2S` double NOT NULL,
  `H2S_ALERT` varchar(10) NOT NULL,
  `NO2` double NOT NULL,
  `NO2_ALERT` varchar(10) NOT NULL,
  `SO2` double NOT NULL,
  `SO2_ALERT` varchar(10) NOT NULL,
  `H2` double NOT NULL,
  `H2_ALERT` varchar(10) NOT NULL,
  `He` double NOT NULL,
  `He_ALERT` varchar(10) NOT NULL,
  `dt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hitcount_blacklist_ip`
--

CREATE TABLE `hitcount_blacklist_ip` (
  `id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hitcount_blacklist_user_agent`
--

CREATE TABLE `hitcount_blacklist_user_agent` (
  `id` int(11) NOT NULL,
  `user_agent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hitcount_hit`
--

CREATE TABLE `hitcount_hit` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `session` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `hitcount_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hitcount_hit_count`
--

CREATE TABLE `hitcount_hit_count` (
  `id` int(11) NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL,
  `modified` datetime(6) NOT NULL,
  `object_pk` int(10) UNSIGNED NOT NULL,
  `content_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `minedetails`
--

CREATE TABLE `minedetails` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `area` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `mine_map_image` varchar(100) DEFAULT NULL,
  `mine_map_unit` float DEFAULT NULL,
  `village_area_road` varchar(200) DEFAULT NULL,
  `tehsil_taluka_subdivision` varchar(200) DEFAULT NULL,
  `district` varchar(200) DEFAULT NULL,
  `pin` varchar(200) DEFAULT NULL,
  `date_of_opening` date DEFAULT NULL,
  `lin_no` varchar(200) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `minedetails`
--

INSERT INTO `minedetails` (`id`, `name`, `area`, `state`, `latitude`, `longitude`, `mine_map_image`, `mine_map_unit`, `village_area_road`, `tehsil_taluka_subdivision`, `district`, `pin`, `date_of_opening`, `lin_no`, `created_at`) VALUES
(1, 'Jharia Coal Mine', 'Jhariya Jharkhand', 'Jharkhand', 23.7413, 86.4067, 'mine_map_image/cimfr_img.JPG', 8, 'Dhanbad Village/Road/Area', 'Dhanbad Tehsil', 'Dhanbad Dist.', '826001', '1978-02-23', 'LN78834784', '2018-06-27 07:28:36.806195'),
(2, 'Chinakuri', 'West Bangal', 'West Bangal', 23.6853, 86.8574, 'mine_map_image/Map.JPG', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-27 07:28:36.806195'),
(3, 'Lakhi Mata Coliary', 'Mugma', 'Jharkhand', 23.7409, 86.4135, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-28 06:42:25.208716'),
(4, 'Lalmatiya Coal Mines', 'Jharkhand', 'Bihar', 25.0552, 87.3597, 'mine_map_image/mine.gif', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-28 09:16:58.461585'),
(5, 'Mandal Mine', 'Dhabad', 'Jharkhand', 23.8172, 86.4277, 'mine_map_image/10_main.jpg', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-07-17 11:35:18.730493'),
(6, 'bokaro mine', 'bokaro', 'Jharkhand', 23.6693, 86.1511, 'mine_map_image/imagesFigure4.jpg', 40, NULL, NULL, NULL, NULL, NULL, NULL, '2018-07-24 09:25:10.247157'),
(7, 'CSIR-CIMFR', 'DHANBAD', 'Jharkhand', 23.817, 86.4276, 'mine_map_image/cimfr_img.JPG', 8, 'Dhanbad', 'Dhanbad', 'Dhanbad', '826001', '2019-01-10', 'LOO9', '2019-01-10 11:06:42.454839'),
(8, 'Vikash Mines', 'Dhaiaya', 'Jharkhand', 25, 25, 'mine_map_image/mining_background_image.jpg', 8.9, 'Dhanbad', 'Dhanbad', 'Dhanbad', '826001', '2019-09-18', '12345678', '2019-09-18 17:11:59.985943'),
(12, 'jh', '', 'Jharkhand', NULL, NULL, '', NULL, '', '', '', '', '2020-02-11', '', '2020-02-11 10:49:41.423242');

-- --------------------------------------------------------

--
-- Table structure for table `miner_tracking`
--

CREATE TABLE `miner_tracking` (
  `id` int(11) NOT NULL,
  `mine_id` int(11) NOT NULL,
  `router_id` varchar(200) NOT NULL,
  `transmitter_id` varchar(200) NOT NULL,
  `emergency` int(11) NOT NULL,
  `ip_add` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `miner_tracking`
--

INSERT INTO `miner_tracking` (`id`, `mine_id`, `router_id`, `transmitter_id`, `emergency`, `ip_add`, `created_date`) VALUES
(1, 8, 'R002', 'M001', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000'),
(2, 8, 'R006', 'M001', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000'),
(3, 8, 'R002', 'M002', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000'),
(4, 8, 'R006', 'M003', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000'),
(5, 8, 'R005', 'M003', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000'),
(6, 8, 'R001', 'M003', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000'),
(7, 8, 'R002', 'M004', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000'),
(8, 8, 'R005', 'M004', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000'),
(9, 8, 'R005', 'M001', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000'),
(10, 8, 'Test', 'M001', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `mineshift`
--

CREATE TABLE `mineshift` (
  `id` int(11) NOT NULL,
  `shift_name` varchar(200) NOT NULL,
  `mine_id` int(11) NOT NULL,
  `time_from` varchar(20) NOT NULL,
  `time_to` varchar(20) NOT NULL,
  `description` longtext DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mineshift`
--

INSERT INTO `mineshift` (`id`, `shift_name`, `mine_id`, `time_from`, `time_to`, `description`, `created_date`, `modified_date`) VALUES
(1, 'First Shift', 1, '6:00 AM', '2:00 PM', 'This is a First Shift', '2019-10-17 10:55:07.025329', '2019-10-17 10:55:07.025329'),
(2, 'Second Shift', 1, '2:00 PM', '10:00 PM', 'This is The Second Shift', '2019-10-17 10:55:38.222869', '2019-10-17 10:55:38.222869'),
(3, 'Third Shift', 1, '10:00 PM', '6:00 AM', 'This is the Third Shift', '2019-10-17 10:56:28.213057', '2019-10-17 10:56:28.214054'),
(4, 'First Shift', 8, '6:00 AM', '2:00 PM', 'This is the First Shift', '2019-10-17 10:58:14.232768', '2019-10-17 10:58:14.233764'),
(5, 'Second Shift', 8, '2:00 PM', '10:00 PM', 'This is the Second Shift', '2019-10-17 10:58:35.428447', '2019-10-17 10:58:35.429445'),
(6, 'Third Shift', 8, '10:00 PM', '6:00 AM', 'This is the Third and Last Shift', '2019-10-17 10:58:57.183253', '2019-10-17 10:58:57.183253');

-- --------------------------------------------------------

--
-- Table structure for table `miningrole`
--

CREATE TABLE `miningrole` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `parent_role_id` int(11) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `miningrole`
--

INSERT INTO `miningrole` (`id`, `name`, `type`, `description`, `created_date`, `modified_date`, `parent_role_id`, `mine_id`) VALUES
(1, 'General Manager(GM)', 'officer', '', '2018-06-28 18:02:04.284629', '2018-07-02 10:03:04.747635', NULL, 1),
(2, 'Manager', 'officer', '', '2018-07-02 15:51:24.150715', '2018-07-02 10:21:24.219095', 1, 1),
(3, 'Asst Manager', 'officer', '', '2018-07-02 15:52:30.554842', '2018-07-02 10:23:27.247378', 2, 1),
(4, 'Engineer / Level Incharge', 'officer', '', '2018-07-02 15:55:52.614552', '2018-07-02 10:25:52.621534', 3, 1),
(5, 'Foreman', 'officer', '', '2018-07-02 15:56:12.414211', '2018-07-02 10:26:12.421213', 4, 1),
(6, 'Mining Mate', 'worker', 'Mining Mate', '2018-07-02 15:57:05.082090', '2018-07-02 10:27:05.088042', 5, 1),
(7, 'Drilling Man', 'worker', '', '2018-07-02 15:57:25.222681', '2018-07-02 10:29:29.595154', 5, 1),
(8, 'Timber Man', 'worker', '', '2018-07-02 15:59:57.922994', '2018-07-02 10:29:57.930010', 5, 1),
(9, 'Drilling Helper', 'worker', '', '2018-07-02 16:01:10.423882', '2018-07-02 10:31:10.430887', 5, 1),
(10, 'Other Worker...', 'worker', '', '2018-07-02 16:01:42.015177', '2018-07-02 10:31:42.022186', 5, 1),
(11, 'General Manager(GM)', 'officer', 'Tester Description', '2019-10-16 09:50:27.221639', '2019-10-16 10:47:02.737251', NULL, 8),
(12, 'Manager', 'officer', 'Tester Description', '2019-10-16 10:21:40.256180', '2019-10-16 10:52:23.168682', 11, 8),
(13, 'Asst Manager', 'officer', 'Assistant Manager Description', '2019-10-16 10:52:12.756191', '2019-10-16 10:52:12.761178', 12, 8),
(14, 'Engineer / Level Incharge', 'officer', 'Engineer Description', '2019-10-16 10:54:20.356101', '2019-10-16 10:54:20.360121', 13, 8),
(15, 'My Test Role', 'worker', '', '2019-10-31 15:59:21.015653', '2019-10-31 15:59:21.022606', 14, 8),
(16, 'TestTest', 'worker', 'xfgfx', '2020-03-12 11:07:24.459311', '2020-03-12 11:07:24.569019', 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `news_bulletin`
--

CREATE TABLE `news_bulletin` (
  `id` int(11) NOT NULL,
  `news` varchar(1000) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL,
  `valid_till` date DEFAULT NULL,
  `download_link` varchar(100) DEFAULT NULL,
  `download_number` int(11) DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `color` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `news_bulletin`
--

INSERT INTO `news_bulletin` (`id`, `news`, `created_on`, `updated_on`, `valid_till`, `download_link`, `download_number`, `user_id_id`, `color`) VALUES
(2, 'RC meeting at CSIR-CIMFR on 16.11.2019 for R&D project on \"Development of Digital Mine using IoT\" | CSIR - Central Institute of Mining & Fuel Research | सीएसआईआर - केंद्रीय खनन एवं ईंधन अनुसंधान', '2020-01-22', '2020-02-04', '2020-02-05', 'news_bulletin/Digital_Mine_IoT___CSIR-CIMFR_NDfZoKT.pdf', 0, 54, 'FFFFFF');

-- --------------------------------------------------------

--
-- Table structure for table `production_dailydispatch`
--

CREATE TABLE `production_dailydispatch` (
  `id` int(11) NOT NULL,
  `shift_name` varchar(100) DEFAULT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `dates` date NOT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_dailyentry`
--

CREATE TABLE `production_dailyentry` (
  `id` int(11) NOT NULL,
  `shift_name` varchar(100) DEFAULT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `dates` date NOT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_manualentry`
--

CREATE TABLE `production_manualentry` (
  `id` int(11) NOT NULL,
  `weighbridge_id` varchar(100) NOT NULL,
  `vehicle_id` varchar(100) NOT NULL,
  `datetime_in` datetime(6) NOT NULL,
  `datetime_out` datetime(6) NOT NULL,
  `trip_time` varchar(200) DEFAULT NULL,
  `tm_name` varchar(200) DEFAULT NULL,
  `wb_code` varchar(100) DEFAULT NULL,
  `first_wt` int(11) NOT NULL,
  `second_wt` int(11) NOT NULL,
  `net_wt` int(11) NOT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `entry_date` date NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_material_waste`
--

CREATE TABLE `production_material_waste` (
  `id` int(11) NOT NULL,
  `vehicle_id` varchar(100) NOT NULL,
  `weighbridge_id` varchar(100) NOT NULL,
  `net_weight` int(11) DEFAULT NULL,
  `unit` varchar(100) NOT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `datetime_in` datetime(6) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_monthly`
--

CREATE TABLE `production_monthly` (
  `id` int(11) NOT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `years` varchar(100) DEFAULT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_monthlydispatch`
--

CREATE TABLE `production_monthlydispatch` (
  `id` int(11) NOT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `years` varchar(100) DEFAULT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_tub`
--

CREATE TABLE `production_tub` (
  `id` int(11) NOT NULL,
  `laden_weight` varchar(100) NOT NULL,
  `no_of_trip` int(11) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `destination` varchar(200) NOT NULL,
  `datetime_in` datetime(6) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  `name_of_the_tub_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_vehicle`
--

CREATE TABLE `production_vehicle` (
  `id` int(11) NOT NULL,
  `rfid` longtext DEFAULT NULL,
  `vehicle_reg_no` varchar(200) DEFAULT NULL,
  `type_of_vehicle` varchar(200) DEFAULT NULL,
  `reg_laden_weight_of_the_vehicle` double DEFAULT NULL,
  `reg_laden_weight_of_the_vehicles` varchar(200) DEFAULT NULL,
  `o_name` varchar(100) NOT NULL,
  `o_address` varchar(100) DEFAULT NULL,
  `o_email` varchar(254) DEFAULT NULL,
  `o_mob` varchar(100) DEFAULT NULL,
  `d_name` varchar(100) NOT NULL,
  `d_address` varchar(100) DEFAULT NULL,
  `d_email` varchar(254) DEFAULT NULL,
  `d_mob` varchar(100) DEFAULT NULL,
  `d_photo` varchar(100) DEFAULT NULL,
  `t_name` varchar(100) NOT NULL,
  `t_address` varchar(100) DEFAULT NULL,
  `t_email` varchar(254) DEFAULT NULL,
  `w_no` varchar(200) DEFAULT NULL,
  `dates` date NOT NULL,
  `party_details` varchar(200) DEFAULT NULL,
  `sale` varchar(200) DEFAULT NULL,
  `grade` varchar(200) DEFAULT NULL,
  `source` varchar(200) DEFAULT NULL,
  `destination` varchar(200) DEFAULT NULL,
  `validity` date NOT NULL,
  `start_date_of_order` date NOT NULL,
  `end_date_of_order` date NOT NULL,
  `value_of_order` varchar(200) DEFAULT NULL,
  `validity_of_tag` date NOT NULL,
  `trip_cycle` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_weighbridge`
--

CREATE TABLE `production_weighbridge` (
  `id` int(11) NOT NULL,
  `w_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `wb_code` varchar(100) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_yearlydispatch`
--

CREATE TABLE `production_yearlydispatch` (
  `id` int(11) NOT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `years` varchar(100) DEFAULT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_yearlyentry`
--

CREATE TABLE `production_yearlyentry` (
  `id` int(11) NOT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `years` varchar(100) DEFAULT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `id` int(11) NOT NULL,
  `business_name` int(11) DEFAULT NULL,
  `prod_name` varchar(100) DEFAULT NULL,
  `alternate_prod` varchar(100) DEFAULT NULL,
  `unit` varchar(100) DEFAULT NULL,
  `invoice_no` varchar(100) DEFAULT NULL,
  `prod_expiry` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `batch_number` varchar(100) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `tax` varchar(100) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `total_tax` double DEFAULT NULL,
  `net_amount` double DEFAULT NULL,
  `info_any` varchar(200) DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `initial_quantity` int(11) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  `prod_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `profile_extension`
--

CREATE TABLE `profile_extension` (
  `id` int(11) NOT NULL,
  `profile_avatar` varchar(100) DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile_extension`
--

INSERT INTO `profile_extension` (`id`, `profile_avatar`, `user_id_id`, `mine_id_id`) VALUES
(10, '', 54, 1),
(11, 'employee_image/newplot_4.png', 55, 1),
(16, '', 71, 1),
(32, '', 92, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reorder_details`
--

CREATE TABLE `reorder_details` (
  `id` int(11) NOT NULL,
  `Reorder_date` datetime(6) NOT NULL,
  `creationdate` datetime(6) NOT NULL,
  `mine_id` varchar(100) DEFAULT NULL,
  `prod_category` varchar(100) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `prod_name` varchar(100) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `batch_number` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `addedstock` int(11) DEFAULT NULL,
  `updated_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rescue_records`
--

CREATE TABLE `rescue_records` (
  `id` int(11) NOT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `date_fr` datetime(6) DEFAULT NULL,
  `date_to` datetime(6) DEFAULT NULL,
  `rescue_dep_num` int(11) DEFAULT NULL,
  `rescue_person_name` varchar(255) DEFAULT NULL,
  `incident_type` varchar(255) DEFAULT NULL,
  `employee_rescued_num` int(11) DEFAULT NULL,
  `rescued_employees_name` varchar(255) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sensordata`
--

CREATE TABLE `sensordata` (
  `id` int(11) NOT NULL,
  `data1` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_arduino`
--

CREATE TABLE `sensor_arduino` (
  `id` int(11) NOT NULL,
  `node_id` int(11) DEFAULT NULL,
  `arduino_id` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `noofsensors` int(11) NOT NULL,
  `port_no` varchar(200) NOT NULL,
  `baudrate` int(11) NOT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_connection`
--

CREATE TABLE `sensor_connection` (
  `id` int(11) NOT NULL,
  `mine_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `arduino_id` int(11) DEFAULT NULL,
  `wireless_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_node`
--

CREATE TABLE `sensor_node` (
  `id` int(11) NOT NULL,
  `nodeid` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `x_axis` double NOT NULL,
  `y_axis` double NOT NULL,
  `photo1` varchar(100) DEFAULT NULL,
  `photo2` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `mine_id_id` int(11) NOT NULL,
  `isgoaf` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sensor_node`
--

INSERT INTO `sensor_node` (`id`, `nodeid`, `name`, `location`, `x_axis`, `y_axis`, `photo1`, `photo2`, `description`, `mine_id_id`, `isgoaf`) VALUES
(1, 'N001', 'Node 1', 'Left Side', 85.65, 42.78, 'emp_img/newplot_3.png', 'emp_img/newplot_3_uL41NaZ.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 1, 0),
(2, 'N002', 'Node 2', 'New Pillar 1', 62.38, 43.98, 'emp_img/node_logo_q5YCuoz.png', 'emp_img/node_red.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 8, 0),
(3, 'N003', 'Node 3', 'pillar 3 ke pass', 65.97, 27.22, 'emp_img/node_logo_q5YCuoz.png', 'emp_img/node_red.png', 'second node for vikash mine', 8, 0),
(4, 'N002', 'Node 2', 'Centre', 45.37, 52.31, 'emp_img/newplot_4_v5gpsZg.png', 'emp_img/newplot_4_xDThW6q.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 1, 0),
(5, 'N003', 'Node 3', 'Right Side', 36.52, 53.33, 'emp_img/newplot_4.png', 'emp_img/newplot_4_XjQIgQN.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 1, 1),
(6, 'fgh', 'fgh', 'gfdhgfd', 38.37, 50.28, 'emp_img/newplot_1.png', 'emp_img/newplot.png', 'dfg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sensor_nodesensor`
--

CREATE TABLE `sensor_nodesensor` (
  `id` int(11) NOT NULL,
  `nodesensorname` varchar(200) NOT NULL,
  `thresholdvalue` varchar(200) NOT NULL,
  `alertcolourpriority` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  `name_id` int(11) DEFAULT NULL,
  `sensorid_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_sensor`
--

CREATE TABLE `sensor_sensor` (
  `id` int(11) NOT NULL,
  `arduino_id` int(11) DEFAULT NULL,
  `wireless_id` int(11) DEFAULT NULL,
  `sensorid` varchar(200) NOT NULL,
  `sensorname` varchar(200) NOT NULL,
  `minrange` int(11) NOT NULL,
  `maxrange` int(11) NOT NULL,
  `sensorunit` varchar(200) NOT NULL,
  `thresholdlimit` varchar(200) NOT NULL,
  `greenlevel` varchar(200) NOT NULL,
  `yellowlevel` varchar(200) NOT NULL,
  `redlevel` varchar(200) NOT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_sensordata`
--

CREATE TABLE `sensor_sensordata` (
  `id` int(11) NOT NULL,
  `temp` varchar(200) NOT NULL,
  `pressure` varchar(200) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_sensor_node`
--

CREATE TABLE `sensor_sensor_node` (
  `id` int(11) NOT NULL,
  `ip_add` varchar(200) NOT NULL,
  `sensorid` varchar(200) NOT NULL,
  `sensorname` varchar(200) NOT NULL,
  `sensorunit` varchar(200) NOT NULL,
  `thresholdlimit` varchar(200) NOT NULL,
  `sensorunit1` varchar(200) NOT NULL,
  `sensorunit2` varchar(200) NOT NULL,
  `sensorunit3` varchar(200) NOT NULL,
  `sensormsg1` varchar(200) NOT NULL,
  `sensormsg2` varchar(200) NOT NULL,
  `sensormsg3` varchar(200) NOT NULL,
  `greenlevel` varchar(200) NOT NULL,
  `yellowlevel` varchar(200) NOT NULL,
  `redlevel` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `mine_id_id` int(11) NOT NULL,
  `node_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sensor_sensor_node`
--

INSERT INTO `sensor_sensor_node` (`id`, `ip_add`, `sensorid`, `sensorname`, `sensorunit`, `thresholdlimit`, `sensorunit1`, `sensorunit2`, `sensorunit3`, `sensormsg1`, `sensormsg2`, `sensormsg3`, `greenlevel`, `yellowlevel`, `redlevel`, `description`, `mine_id_id`, `node_id_id`) VALUES
(1, 'hgvhgvhg', 'S002', 'S002', 'hjgvhgvghvh', 'vhvhvhv', 'jhgvhgvhg', 'hgvhgv', 'jkhgvjgh', 'vhgvhgv', 'hgvhgvhg', 'vhgvhgvhgvgh', '#adff2f', '#ffa500', '#ff0000', 'vvhgvhgv', 5, 2),
(2, '192.168.1.181', 'S001', 'CO', 'ppm', '100', '30', '40', '50', 'Ist warning', '2nd warning', '3rd warning', '#adff2f', '#ffa500', '#ff0000', 'No any description', 1, 1),
(3, '192.168.1.181', 'S002', 'CH4', 'ppm', '100', '10', '30', '30', 'Fisrt', 'Sescon', 'Third', '#adff2f', '#ffa500', '#ff0000', 'DEscription', 1, 1),
(4, '192.168.1.199', 'O2-001', 'O2', 'ppm', '100', '100', '200', '300', 'oxigen first level wanring on vikash mine node2', 'oxigen second level wanring on vikash mine node2', 'oxigen third level wanring on vikash mine node2', '#88ff51', '#ffd723', '#d95224', 'this is oxizen sensor on vikash mine on node 2', 8, 2),
(5, '192.168.1.181', 'CH4-001', 'mETHANE SENSOR', 'ppm', '100', '100', '150', '200', 'ist level of ch4 on vikash mine node3', '2nd level of ch4 on vikash mine node3', '3rd level of ch4 on vikash mine node3', '#97ff28', '#ffcb0f', '#ff430f', 'ds', 8, 3),
(10, '192.168.1.130', 'S005', 'CO', 'ppm', '100', '10', '20', '30', 'First Level Warning', 'Second Level Warning', 'Third Level Warning', '#bcff2b', '#ffa10a', '#ff2e12', 'Description', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `sensor_wireless`
--

CREATE TABLE `sensor_wireless` (
  `node_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL,
  `ipaddress` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'is_strata_audio', '1', '1 for alert 0 for none', '2020-02-03 10:30:18.535390', '2020-02-03 10:30:18.535390'),
(2, 'is_strata_light', '1', '1 for alert 0 for none', '2020-02-03 10:30:38.862332', '2020-02-03 10:30:38.862332'),
(3, 'is_strata_sms', '1', '1 for alert 0 for none', '2020-02-03 10:35:29.213864', '2020-02-03 10:35:29.213864'),
(4, 'is_strata_email', '1', '1 for alert 0 for none', '2020-02-03 10:36:03.728165', '2020-02-03 10:36:03.728165'),
(5, 'is_water_display_warning', '1', '1 for alert 0 for none', '2020-02-03 10:36:44.651490', '2020-02-03 10:36:44.651490'),
(6, 'is_water_audio', '1', '1 for alert 0 for none', '2020-02-03 10:41:07.513964', '2020-02-03 10:41:07.513964'),
(7, 'is_water_light', '1', '1 for alert 0 for none', '2020-02-03 10:41:27.656294', '2020-02-03 10:41:27.656294'),
(8, 'is_water_sms', '1', '1 for alert 0 for none', '2020-02-03 10:41:52.686255', '2020-02-03 10:41:52.686255'),
(9, 'is_water_email', '1', '1 for alert 0 for none', '2020-02-03 15:23:21.021830', '2020-02-03 15:23:21.021830'),
(10, 'is_strata_display_warning', '1', '1 for alert 0 for none', '2020-02-03 15:23:48.326947', '2020-02-03 15:38:04.160671');

-- --------------------------------------------------------

--
-- Table structure for table `sms_configuration`
--

CREATE TABLE `sms_configuration` (
  `id` int(11) NOT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) DEFAULT NULL,
  `valid_till` date DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `snippets_comment`
--

CREATE TABLE `snippets_comment` (
  `id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `commented_at` datetime(6) NOT NULL,
  `commented_by_id` int(11) NOT NULL,
  `commented_to_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `snippets_snippet`
--

CREATE TABLE `snippets_snippet` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `code` longtext NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `strata_location`
--

CREATE TABLE `strata_location` (
  `id` int(11) NOT NULL,
  `location_name` varchar(200) NOT NULL,
  `tag_no` varchar(200) DEFAULT NULL,
  `x_axis` double DEFAULT NULL,
  `y_axis` double DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` date NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_name_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `strata_location`
--

INSERT INTO `strata_location` (`id`, `location_name`, `tag_no`, `x_axis`, `y_axis`, `description`, `created_date`, `modified_date`, `mine_name_id`) VALUES
(1, 'Location 1', 't69', 60.3, 19.81, 'Tester Description', '2019-10-09', '2019-11-15 10:44:21.294366', 1),
(2, 'Location 2', 'T1', 58.33, 17.31, 'sss', '2019-10-31', '2019-11-15 10:44:37.477785', 1),
(3, '7D/500L', 'T67', 11.57, 48.43, 'nad', '2019-12-31', '2019-12-31 11:13:30.174282', 8);

-- --------------------------------------------------------

--
-- Table structure for table `strata_sensor`
--

CREATE TABLE `strata_sensor` (
  `id` int(11) NOT NULL,
  `sensor_name` varchar(200) NOT NULL,
  `sensor_unit` varchar(50) NOT NULL,
  `tag_no` varchar(200) DEFAULT NULL,
  `level_1_warning_unit` int(11) NOT NULL,
  `level_2_warning_unit` int(11) NOT NULL,
  `level_3_warning_unit` int(11) NOT NULL,
  `level_1_color` varchar(50) DEFAULT NULL,
  `level_2_color` varchar(50) DEFAULT NULL,
  `level_3_color` varchar(50) DEFAULT NULL,
  `level_1_msg` varchar(200) DEFAULT NULL,
  `level_2_msg` varchar(200) DEFAULT NULL,
  `level_3_msg` varchar(200) DEFAULT NULL,
  `level_1_audio` varchar(100) DEFAULT NULL,
  `level_2_audio` varchar(100) DEFAULT NULL,
  `level_3_audio` varchar(100) DEFAULT NULL,
  `ip_address` varchar(100) NOT NULL,
  `interval_time` int(11) DEFAULT NULL,
  `audio_play_type` varchar(10) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `location_id_id` int(11) DEFAULT NULL,
  `mine_name_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `strata_sensor`
--

INSERT INTO `strata_sensor` (`id`, `sensor_name`, `sensor_unit`, `tag_no`, `level_1_warning_unit`, `level_2_warning_unit`, `level_3_warning_unit`, `level_1_color`, `level_2_color`, `level_3_color`, `level_1_msg`, `level_2_msg`, `level_3_msg`, `level_1_audio`, `level_2_audio`, `level_3_audio`, `ip_address`, `interval_time`, `audio_play_type`, `description`, `created_date`, `modified_date`, `location_id_id`, `mine_name_id`) VALUES
(1, 'convergence', 'mm', 'c67', 5, 10, 15, '#ADFF2F', '#FFA500', '#FF0000', 'Strata Condition:First Stage Warning Message , Please be Careful.', 'Strata Condition:Second Stage Warning Message , Please be alert situation is not good.', 'Strata Condition:Third Stage Warning Message , Please  leave the underground', 'strata_warning_audio/strata-first-level-warning.mp3', 'strata_warning_audio/strata-first-level-warning.mp3', 'strata_warning_audio/strata-first-level-warning.mp3', '192.168.1.181', 30, 'mp3only', 'n', '2019-10-21 12:10:11.972045', '2020-02-26 15:33:21.398510', 1, 1),
(2, 'Load Cell', 'mm', '', 100, 200, 300, '#ADFF2F', '#FFA500', '#FF0000', 'Strata Condition:First Stage Warning Message , Please be Careful.', 'Strata Condition:Second Stage Warning Message , Please be alert situation is not good.', 'Strata Condition:Third Stage Warning Message , Please  leave the underground', 'strata_warning_audio/strata-first-level-warning.mp3', 'strata_warning_audio/strata-first-level-warning.mp3', 'strata_warning_audio/strata-first-level-warning.mp3', '192.168.1.181', 30, 'mp3only', 'vv', '2019-11-21 12:25:53.689867', '2019-12-26 10:41:02.199285', 2, 1),
(3, 'convergence', 'mm', 'c89', 5, 8, 10, '#ADFF2F', '#FFA500', '#FF0000', 'Strata Condition:First Stage Warning Message , Please be Careful.', 'Strata Condition:Second Stage Warning Message , Please be alert situation is not good.', 'Strata Condition:Third Stage Warning Message , Please  leave the underground', 'strata_warning_audio/strata-first-level-warning.mp3', 'strata_warning_audio/strata-first-level-warning.mp3', 'strata_warning_audio/strata-first-level-warning.mp3', '192.168.1.201', 30, 'mp3only', '', '2019-12-31 11:15:30.360694', '2019-12-31 11:15:30.369653', 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `strata_sensor_data`
--

CREATE TABLE `strata_sensor_data` (
  `id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `sensor_value` varchar(50) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `strata_sensor_data`
--

INSERT INTO `strata_sensor_data` (`id`, `sensor_id`, `sensor_value`, `created_date`) VALUES
(1, 1, '209.0', '2020-03-12 12:05:59.742513'),
(2, 1, '208.0', '2020-03-12 12:06:15.836363'),
(3, 1, '6.0', '2020-03-12 12:06:30.507852'),
(4, 1, '208.0', '2020-03-12 12:06:46.453645'),
(5, 1, '208.0', '2020-03-12 12:06:59.971132'),
(6, 1, '208.0', '2020-03-12 12:07:10.804369'),
(7, 1, '208.0', '2020-03-12 12:07:25.960336'),
(8, 1, '208.0', '2020-03-12 12:07:44.226417'),
(9, 1, '209.0', '2020-03-12 12:07:59.496359'),
(10, 1, '4.0', '2020-03-12 12:08:11.738191'),
(11, 1, '208.0', '2020-03-12 12:08:24.493010'),
(12, 1, '208.0', '2020-03-12 12:08:36.516621'),
(13, 1, '208.0', '2020-03-12 12:08:48.658871'),
(14, 1, '208.0', '2020-03-12 12:08:59.742947'),
(15, 1, '208.0', '2020-03-12 12:09:08.025353'),
(16, 1, '208.0', '2020-03-12 12:09:18.176327'),
(17, 1, '208.0', '2020-03-12 12:09:32.754695'),
(18, 1, '208.0', '2020-03-12 12:09:43.557771'),
(19, 1, '208.0', '2020-03-12 12:09:53.785292'),
(20, 1, '208.0', '2020-03-12 12:10:04.926413'),
(21, 1, '207.0', '2020-03-12 12:10:21.095217'),
(22, 1, '207.0', '2020-03-12 12:10:41.557376'),
(23, 1, '206.0', '2020-03-12 12:11:02.462905'),
(24, 1, '205.0', '2020-03-12 12:11:25.739187'),
(25, 1, '205.0', '2020-03-12 12:11:37.272283'),
(26, 1, '206.0', '2020-03-12 12:11:51.721847'),
(27, 1, '206.0', '2020-03-12 12:12:04.880171'),
(28, 1, '205.0', '2020-03-12 12:12:22.854945'),
(29, 1, '205.0', '2020-03-12 12:12:38.250501'),
(30, 1, '205.0', '2020-03-12 12:12:59.082871'),
(31, 1, '206.0', '2020-03-12 12:13:21.653669'),
(32, 1, '206.0', '2020-03-12 12:13:42.353052'),
(33, 1, '205.0', '2020-03-12 12:14:05.644223');

-- --------------------------------------------------------

--
-- Table structure for table `strata_sensor_flag`
--

CREATE TABLE `strata_sensor_flag` (
  `id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `pause_waring_duration_end_datetime` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `strata_sensor_flag`
--

INSERT INTO `strata_sensor_flag` (`id`, `sensor_id`, `limit`, `type`, `created_date`, `modified_date`, `pause_waring_duration_end_datetime`) VALUES
(1, 1, 29, 'High', '2020-02-20 17:23:09.241390', '2020-03-12 12:14:18.733311', '2020-02-20 17:23:09.241390');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_details`
--

CREATE TABLE `supplier_details` (
  `id` int(11) NOT NULL,
  `business_name` varchar(100) DEFAULT NULL,
  `business_website` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `address` varchar(400) DEFAULT NULL,
  `landmark` varchar(400) DEFAULT NULL,
  `area` varchar(200) DEFAULT NULL,
  `city` longtext NOT NULL,
  `state` varchar(100) NOT NULL,
  `map_loc` varchar(400) DEFAULT NULL,
  `pan` varchar(200) DEFAULT NULL,
  `gstin` varchar(200) DEFAULT NULL,
  `notes` varchar(200) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temp_monitoring_manual`
--

CREATE TABLE `temp_monitoring_manual` (
  `id` int(11) NOT NULL,
  `wbt` double NOT NULL,
  `dbt` double NOT NULL,
  `relativeHumidity` double NOT NULL,
  `dewPointTemp` double NOT NULL,
  `moistureContent` double NOT NULL,
  `enthalpy` double NOT NULL,
  `sigmaHeat` double NOT NULL,
  `rel_hum_status` varchar(100) NOT NULL,
  `dew_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id` int(11) NOT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `mode` varchar(100) DEFAULT NULL,
  `row_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tracking_router`
--

CREATE TABLE `tracking_router` (
  `id` int(11) NOT NULL,
  `router_id` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `location` varchar(200) DEFAULT NULL,
  `is_block` varchar(100) NOT NULL,
  `x_axis` double DEFAULT NULL,
  `y_axis` double DEFAULT NULL,
  `ip_add` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tracking_router`
--

INSERT INTO `tracking_router` (`id`, `router_id`, `address`, `location`, `is_block`, `x_axis`, `y_axis`, `ip_add`, `created_date`, `modified_date`, `mine_id_id`) VALUES
(1, 'R001', 'R1', 'Main Building Right', 'No', 58.04, 52.13, '192.168.1.1', '2019-08-07 16:45:04.334554', '2019-11-15 11:19:48.643265', 8),
(2, 'R002', 'R2', 'Main Building Right 1', 'No', 60.13, 43.33, '192.168.1.2', '2019-08-07 16:52:09.813057', '2019-11-15 11:20:08.137643', 8),
(3, 'R003', 'R3', 'Main Building Left', 'No', 66.67, 56.76, '192.168.1.1', '2019-09-13 10:42:06.889634', '2019-10-21 11:10:06.329887', 1),
(4, 'R004', 'A', 'Stairs Left', 'No', 28.07, 56.76, '192.168.1.1', '2019-09-30 11:29:48.098325', '2019-10-14 17:46:29.417573', 1),
(5, 'R005', 'Dhanbad', 'Near Pillar 17', 'No', 68.87, 50.56, '192.168.1.1', '2019-10-14 17:32:55.436017', '2019-11-15 11:20:22.234940', 8),
(6, 'R006', 'Dhanbad', 'Near Pillar 17', 'No', 61.28, 28.43, '192.168.1.1', '2019-10-14 17:44:12.687149', '2019-11-15 11:20:36.670445', 8),
(7, 'R007', 'g', 'ggg', 'No', 92.59, 34.44, '192.168.1.211', '2019-10-31 16:12:11.033573', '2019-10-31 16:12:11.034571', 1),
(9, 'Test', 'Test', 'Test', 'No', 55.21, 25, '192.168.1.1161', '2020-01-22 11:29:08.816731', '2020-01-22 11:29:08.816731', 8),
(14, 'cfbfcx', 'xbxc', 'xcbxc', 'No', 49.83, 56.3, 'cvbb', '2020-02-21 11:55:28.564948', '2020-02-21 11:55:28.564948', 1),
(15, 'xcvcx', 'cxvc', 'cxv', 'No', 39.41, 72, 'cvb', '2020-02-21 11:58:05.998995', '2020-02-21 11:58:05.999950', 1),
(18, 'xzcvz', 'zxv', 'zxv', 'No', 42.07, 87.52, 'xcv', '2020-02-21 12:00:48.175536', '2020-02-21 12:00:48.175536', 1);

-- --------------------------------------------------------

--
-- Table structure for table `training_rescue_accident`
--

CREATE TABLE `training_rescue_accident` (
  `id` int(11) NOT NULL,
  `mine_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `training_type` varchar(255) DEFAULT NULL,
  `training_date` varchar(255) DEFAULT NULL,
  `is_ab_pr` varchar(255) DEFAULT NULL,
  `training_ab_pr_from` varchar(255) DEFAULT NULL,
  `training_ab_pr_to` varchar(255) DEFAULT NULL,
  `training_remarks` varchar(255) DEFAULT NULL,
  `training_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `water_level_acquisition_data`
--

CREATE TABLE `water_level_acquisition_data` (
  `id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `sensor_value` varchar(50) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `water_level_monitoring_sensor`
--

CREATE TABLE `water_level_monitoring_sensor` (
  `id` int(11) NOT NULL,
  `area_name` varchar(200) DEFAULT NULL,
  `distance_bet_roof_and_water` varchar(50) DEFAULT NULL,
  `alarm_water_level_1` varchar(200) DEFAULT NULL,
  `alarm_water_level_2` varchar(200) DEFAULT NULL,
  `alarm_water_level_3` varchar(200) DEFAULT NULL,
  `level_1_msg` varchar(200) DEFAULT NULL,
  `level_2_msg` varchar(200) DEFAULT NULL,
  `level_3_msg` varchar(200) DEFAULT NULL,
  `level_1_audio` varchar(100) DEFAULT NULL,
  `level_2_audio` varchar(100) DEFAULT NULL,
  `level_3_audio` varchar(100) DEFAULT NULL,
  `ip_address` varchar(200) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `audio_play_type` varchar(10) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `moter_start_level` varchar(200) DEFAULT NULL,
  `moter_stop_level` varchar(200) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `water_level_monitoring_sensor`
--

INSERT INTO `water_level_monitoring_sensor` (`id`, `area_name`, `distance_bet_roof_and_water`, `alarm_water_level_1`, `alarm_water_level_2`, `alarm_water_level_3`, `level_1_msg`, `level_2_msg`, `level_3_msg`, `level_1_audio`, `level_2_audio`, `level_3_audio`, `ip_address`, `desc`, `audio_play_type`, `created_date`, `modified_date`, `moter_start_level`, `moter_stop_level`, `mine_id_id`) VALUES
(1, 'Location 501', '250', '100', '150', '200', 'First Stage Warning Message , Please be Careful.', 'Second Stage Warning Message , Please be alert situation is not good.', 'Third Stage Warning Message , Please  leave the underground', 'water_warning_audio/water_first_level_warn.mp3', 'water_warning_audio/water_second_level_warn.mp3', 'water_warning_audio/water_third_level_warn.mp3', '192.168.1.181', 'nnn', 'mp3only', '2019-11-15 11:23:13.201735', '2019-12-26 10:33:11.693449', '200', '230', 1),
(2, 'WD/89K', '100', '10', '20', '30', 'First Stage Warning Message , Please be Careful.', 'Second Stage Warning Message , Please be alert situation is not good.', 'Third Stage Warning Message , Please  leave the underground', '', '', '', '192.168.1.181', 'nai', 'mp3only', '2019-12-31 11:17:45.932947', '2020-03-11 10:36:32.699682', '50', '20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `windroseaddsensor`
--

CREATE TABLE `windroseaddsensor` (
  `id` int(11) NOT NULL,
  `sensor_id` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `sensor_name` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `sensor_unit` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `min_range` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `max_range` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `desc` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_croatian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `windrosedata`
--

CREATE TABLE `windrosedata` (
  `id` int(11) NOT NULL,
  `setting_id` int(11) DEFAULT NULL,
  `rain_gauge` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `pm2_5` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `pm10` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `humidity` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `temperature` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `ws_value` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `wd_value` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `no2` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `so2` varchar(200) COLLATE utf16_croatian_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time(6) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_croatian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `windrosesetting`
--

CREATE TABLE `windrosesetting` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(40) COLLATE utf16_croatian_ci DEFAULT NULL,
  `wd_sensor_name` varchar(100) COLLATE utf16_croatian_ci DEFAULT NULL,
  `wd_unit` varchar(10) COLLATE utf16_croatian_ci DEFAULT NULL,
  `ws_sensor_name` varchar(15) COLLATE utf16_croatian_ci DEFAULT NULL,
  `ws_unit` varchar(10) COLLATE utf16_croatian_ci DEFAULT NULL,
  `rg_sensor_name` varchar(100) COLLATE utf16_croatian_ci DEFAULT NULL,
  `rg_unit` varchar(10) COLLATE utf16_croatian_ci DEFAULT NULL,
  `pm2_5_sensor_name` varchar(100) COLLATE utf16_croatian_ci DEFAULT NULL,
  `pm2_5_unit` varchar(10) COLLATE utf16_croatian_ci DEFAULT NULL,
  `pm10_sensor_name` varchar(100) COLLATE utf16_croatian_ci DEFAULT NULL,
  `pm10_unit` varchar(10) COLLATE utf16_croatian_ci DEFAULT NULL,
  `humidity_sensor_name` varchar(100) COLLATE utf16_croatian_ci DEFAULT NULL,
  `humidity_unit` varchar(10) COLLATE utf16_croatian_ci DEFAULT NULL,
  `temperature_sensor_name` varchar(100) COLLATE utf16_croatian_ci DEFAULT NULL,
  `temperature_unit` varchar(10) COLLATE utf16_croatian_ci DEFAULT NULL,
  `so2_sensor_name` varchar(100) COLLATE utf16_croatian_ci DEFAULT NULL,
  `so2_unit` varchar(10) COLLATE utf16_croatian_ci DEFAULT NULL,
  `no2_sensor_name` varchar(100) COLLATE utf16_croatian_ci DEFAULT NULL,
  `no2_unit` varchar(10) COLLATE utf16_croatian_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_croatian_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident_records`
--
ALTER TABLE `accident_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accident_records_mine_id_92cb3e77_fk_MineDetails_id` (`mine_id`);

--
-- Indexes for table `alternateprodmodel`
--
ALTER TABLE `alternateprodmodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_emp`
--
ALTER TABLE `attendance_emp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `background_task`
--
ALTER TABLE `background_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `background_task_creator_content_type_61cc9af3_fk_django_co` (`creator_content_type_id`),
  ADD KEY `background_task_task_name_4562d56a` (`task_name`),
  ADD KEY `background_task_task_hash_d8f233bd` (`task_hash`),
  ADD KEY `background_task_priority_88bdbce9` (`priority`),
  ADD KEY `background_task_run_at_7baca3aa` (`run_at`),
  ADD KEY `background_task_queue_1d5f3a40` (`queue`),
  ADD KEY `background_task_attempts_a9ade23d` (`attempts`),
  ADD KEY `background_task_failed_at_b81bba14` (`failed_at`),
  ADD KEY `background_task_locked_by_db7779e3` (`locked_by`),
  ADD KEY `background_task_locked_at_0fb0f225` (`locked_at`);

--
-- Indexes for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  ADD PRIMARY KEY (`id`),
  ADD KEY `background_task_comp_creator_content_type_21d6a741_fk_django_co` (`creator_content_type_id`),
  ADD KEY `background_task_completedtask_task_name_388dabc2` (`task_name`),
  ADD KEY `background_task_completedtask_task_hash_91187576` (`task_hash`),
  ADD KEY `background_task_completedtask_priority_9080692e` (`priority`),
  ADD KEY `background_task_completedtask_run_at_77c80f34` (`run_at`),
  ADD KEY `background_task_completedtask_queue_61fb0415` (`queue`),
  ADD KEY `background_task_completedtask_attempts_772a6783` (`attempts`),
  ADD KEY `background_task_completedtask_failed_at_3de56618` (`failed_at`),
  ADD KEY `background_task_completedtask_locked_by_edc8a213` (`locked_by`),
  ADD KEY `background_task_completedtask_locked_at_29c62708` (`locked_at`);

--
-- Indexes for table `branch_details`
--
ALTER TABLE `branch_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_details_mine_id_id_bfeccba4_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `carousal`
--
ALTER TABLE `carousal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carousal_mine_id_f8d357b7_fk_MineDetails_id` (`mine_id`),
  ADD KEY `carousal_user_id_id_21cbfd8f_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `category_details`
--
ALTER TABLE `category_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `container_details`
--
ALTER TABLE `container_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deduct_details`
--
ALTER TABLE `deduct_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `development_permission`
--
ALTER TABLE `development_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_coalmine_annual_annexure_i`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dgms_coalmine_annual_mine_name_id_956dd721_fk_MineDetai` (`mine_name_id`);

--
-- Indexes for table `dgms_coalmine_annual_annexure_i_subtable_1`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i_subtable_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_coalmine_annual_annexure_i_subtable_2`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i_subtable_2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_coalmine_annual_annexure_i_subtable_3`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i_subtable_3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_coalmine_table_a`
--
ALTER TABLE `dgms_coalmine_table_a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_coalmine_table_b`
--
ALTER TABLE `dgms_coalmine_table_b`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_coalmine_table_c`
--
ALTER TABLE `dgms_coalmine_table_c`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_coalmine_table_d`
--
ALTER TABLE `dgms_coalmine_table_d`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_coalmine_table_e`
--
ALTER TABLE `dgms_coalmine_table_e`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_first_schedule_form_iii`
--
ALTER TABLE `dgms_first_schedule_form_iii`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dgms_first_schedule__mine_name_id_bfccbac7_fk_MineDetai` (`mine_name_id`);

--
-- Indexes for table `dgms_metelliferousmine_annual_annexure_ii`
--
ALTER TABLE `dgms_metelliferousmine_annual_annexure_ii`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dgms_metelliferousmi_mine_name_id_ec88d617_fk_MineDetai` (`mine_name_id`);

--
-- Indexes for table `dgms_metelliferousmine_annual_annexure_ii_subtable_1`
--
ALTER TABLE `dgms_metelliferousmine_annual_annexure_ii_subtable_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_metelliferousmine_annual_annexure_ii_subtable_2`
--
ALTER TABLE `dgms_metelliferousmine_annual_annexure_ii_subtable_2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_metelliferousmine_annual_annexure_ii_subtable_3`
--
ALTER TABLE `dgms_metelliferousmine_annual_annexure_ii_subtable_3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_oilmines_annual_annexure_iii`
--
ALTER TABLE `dgms_oilmines_annual_annexure_iii`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dgms_oilmines_annual_mine_name_id_907dd7ba_fk_MineDetai` (`mine_name_id`);

--
-- Indexes for table `dgms_oilmines_annual_annexure_iii_subtable_1`
--
ALTER TABLE `dgms_oilmines_annual_annexure_iii_subtable_1`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_oilmines_annual_annexure_iii_subtable_2`
--
ALTER TABLE `dgms_oilmines_annual_annexure_iii_subtable_2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dgms_ventilation`
--
ALTER TABLE `dgms_ventilation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dgms_ventilation_mine_name_id_0a5776ca_fk_MineDetails_id` (`mine_name_id`);

--
-- Indexes for table `distribution_details`
--
ALTER TABLE `distribution_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `emails_user_id_id_5497a9d4_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee1_immediate_staff_id_7751309c_fk_employee1_id` (`immediate_staff_id`),
  ADD KEY `employee1_mine_id_62f5d8a7_fk_MineDetails_id` (`mine_id`),
  ADD KEY `employee1_mining_role_id_0904bb33_fk_MiningRole_id` (`mining_role_id`);

--
-- Indexes for table `employeeshiftassign`
--
ALTER TABLE `employeeshiftassign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_employee`
--
ALTER TABLE `employee_employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fireexp_area`
--
ALTER TABLE `fireexp_area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FireExp_area_mine_id_id_64af3241_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `fire_exp_gases`
--
ALTER TABLE `fire_exp_gases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fire_exp_gaseswifi`
--
ALTER TABLE `fire_exp_gaseswifi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fire_exp_manual`
--
ALTER TABLE `fire_exp_manual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gasmodel_auto`
--
ALTER TABLE `gasmodel_auto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gasmonitoring_auto`
--
ALTER TABLE `gasmonitoring_auto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gasmonitoring_manual`
--
ALTER TABLE `gasmonitoring_manual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hitcount_blacklist_ip`
--
ALTER TABLE `hitcount_blacklist_ip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip` (`ip`);

--
-- Indexes for table `hitcount_blacklist_user_agent`
--
ALTER TABLE `hitcount_blacklist_user_agent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_agent` (`user_agent`);

--
-- Indexes for table `hitcount_hit`
--
ALTER TABLE `hitcount_hit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hitcount_hit_created_79adf7bc` (`created`),
  ADD KEY `hitcount_hit_hitcount_id_b7971910_fk_hitcount_hit_count_id` (`hitcount_id`),
  ADD KEY `hitcount_hit_user_id_f7067f66_fk_auth_user_id` (`user_id`),
  ADD KEY `hitcount_hit_ip_a52a62aa` (`ip`),
  ADD KEY `hitcount_hit_session_5be83758` (`session`);

--
-- Indexes for table `hitcount_hit_count`
--
ALTER TABLE `hitcount_hit_count`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `hitcount_hit_count_content_type_id_object_pk_4dacb610_uniq` (`content_type_id`,`object_pk`);

--
-- Indexes for table `minedetails`
--
ALTER TABLE `minedetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `miner_tracking`
--
ALTER TABLE `miner_tracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mineshift`
--
ALTER TABLE `mineshift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `miningrole`
--
ALTER TABLE `miningrole`
  ADD PRIMARY KEY (`id`),
  ADD KEY `MiningRole_parent_role_id_59fe44ec_fk_MiningRole_id` (`parent_role_id`),
  ADD KEY `MiningRole_mine_id_20ddfa3f_fk_MineDetails_id` (`mine_id`);

--
-- Indexes for table `news_bulletin`
--
ALTER TABLE `news_bulletin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_bulletin_user_id_id_04cc1349_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `production_dailydispatch`
--
ALTER TABLE `production_dailydispatch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_dailydispatch_mine_id_id_fefb8e38_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `production_dailyentry`
--
ALTER TABLE `production_dailyentry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_dailyentry_mine_id_id_a0e6da9f_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `production_manualentry`
--
ALTER TABLE `production_manualentry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_manualentry_mine_id_id_3544eaf4_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `production_material_waste`
--
ALTER TABLE `production_material_waste`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_material_waste_mine_id_id_b90da2e4_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `production_monthly`
--
ALTER TABLE `production_monthly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_monthly_mine_id_id_bb403079_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `production_monthlydispatch`
--
ALTER TABLE `production_monthlydispatch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_monthlydispatch_mine_id_id_e4383d0d_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `production_tub`
--
ALTER TABLE `production_tub`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_tub_mine_id_id_01c8545f_fk_MineDetails_id` (`mine_id_id`),
  ADD KEY `production_tub_name_of_the_tub_id_a65cac29_fk_container` (`name_of_the_tub_id`);

--
-- Indexes for table `production_vehicle`
--
ALTER TABLE `production_vehicle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_vehicle_mine_id_id_8652104f_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `production_weighbridge`
--
ALTER TABLE `production_weighbridge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_weighbridge_mine_id_id_b11f77d8_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `production_yearlydispatch`
--
ALTER TABLE `production_yearlydispatch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_yearlydispatch_mine_id_id_512dbb02_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `production_yearlyentry`
--
ALTER TABLE `production_yearlyentry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_yearlyentry_mine_id_id_8244d987_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_mine_id_id_bb06785f_fk_MineDetails_id` (`mine_id_id`),
  ADD KEY `product_details_prod_category_id_42d4a8fc_fk_category_details_id` (`prod_category_id`);

--
-- Indexes for table `profile_extension`
--
ALTER TABLE `profile_extension`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_extension_user_id_id_20e360b3_fk_auth_user_id` (`user_id_id`),
  ADD KEY `profile_extension_mine_id_id_70967400_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `reorder_details`
--
ALTER TABLE `reorder_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rescue_records`
--
ALTER TABLE `rescue_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rescue_records_mine_id_7c3ac060_fk_MineDetails_id` (`mine_id`);

--
-- Indexes for table `sensordata`
--
ALTER TABLE `sensordata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor_arduino`
--
ALTER TABLE `sensor_arduino`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor_connection`
--
ALTER TABLE `sensor_connection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor_node`
--
ALTER TABLE `sensor_node`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nodeid` (`nodeid`,`mine_id_id`),
  ADD KEY `sensor_node_mine_id_id_22542281_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `sensor_nodesensor`
--
ALTER TABLE `sensor_nodesensor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sensor_nodesensor_name_id_fa6e5958_fk_sensor_node_id` (`name_id`),
  ADD KEY `sensor_nodesensor_sensorid_id_59b85181_fk_sensor_sensor_id` (`sensorid_id`);

--
-- Indexes for table `sensor_sensor`
--
ALTER TABLE `sensor_sensor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor_sensordata`
--
ALTER TABLE `sensor_sensordata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor_sensor_node`
--
ALTER TABLE `sensor_sensor_node`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sensor_sensor_node_mine_id_id_node_id_id_sensorid_b48c8b00_uniq` (`mine_id_id`,`node_id_id`,`sensorid`),
  ADD KEY `sensor_sensor_node_node_id_id_f6b7a19e_fk_sensor_node_id` (`node_id_id`);

--
-- Indexes for table `sensor_wireless`
--
ALTER TABLE `sensor_wireless`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_configuration`
--
ALTER TABLE `sms_configuration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sms_configuration_user_id_id_5d739909_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `snippets_comment`
--
ALTER TABLE `snippets_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `snippets_comment_commented_by_id_645c6f6d_fk_auth_user_id` (`commented_by_id`),
  ADD KEY `snippets_comment_commented_to_id_8d71ee14_fk_snippets_snippet_id` (`commented_to_id`);

--
-- Indexes for table `snippets_snippet`
--
ALTER TABLE `snippets_snippet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `snippets_snippet_created_by_id_a14886ce_fk_auth_user_id` (`created_by_id`);

--
-- Indexes for table `strata_location`
--
ALTER TABLE `strata_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strata_location_mine_name_id_44071eb4_fk_MineDetails_id` (`mine_name_id`);

--
-- Indexes for table `strata_sensor`
--
ALTER TABLE `strata_sensor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `strata_sensor_location_id_id_4f56d64d_fk_strata_location_id` (`location_id_id`),
  ADD KEY `strata_sensor_mine_name_id_8564d45d_fk_MineDetails_id` (`mine_name_id`);

--
-- Indexes for table `strata_sensor_data`
--
ALTER TABLE `strata_sensor_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `strata_sensor_flag`
--
ALTER TABLE `strata_sensor_flag`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_details`
--
ALTER TABLE `supplier_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Supplier_Details_mine_id_id_6edb13d0_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `temp_monitoring_manual`
--
ALTER TABLE `temp_monitoring_manual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tracking_router`
--
ALTER TABLE `tracking_router`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tracking_router_mine_id_id_router_id_1ac31439_uniq` (`mine_id_id`,`router_id`);

--
-- Indexes for table `training_rescue_accident`
--
ALTER TABLE `training_rescue_accident`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `water_level_acquisition_data`
--
ALTER TABLE `water_level_acquisition_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `water_level_monitoring_sensor`
--
ALTER TABLE `water_level_monitoring_sensor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `water_level_monitori_mine_id_id_e72fd679_fk_MineDetai` (`mine_id_id`);

--
-- Indexes for table `windroseaddsensor`
--
ALTER TABLE `windroseaddsensor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `windrosedata`
--
ALTER TABLE `windrosedata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `windrosesetting`
--
ALTER TABLE `windrosesetting`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accident_records`
--
ALTER TABLE `accident_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alternateprodmodel`
--
ALTER TABLE `alternateprodmodel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attendance_emp`
--
ALTER TABLE `attendance_emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=381;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `background_task`
--
ALTER TABLE `background_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1886;

--
-- AUTO_INCREMENT for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `branch_details`
--
ALTER TABLE `branch_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `carousal`
--
ALTER TABLE `carousal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `category_details`
--
ALTER TABLE `category_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `container_details`
--
ALTER TABLE `container_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deduct_details`
--
ALTER TABLE `deduct_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `development_permission`
--
ALTER TABLE `development_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_coalmine_annual_annexure_i`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dgms_coalmine_annual_annexure_i_subtable_1`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i_subtable_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dgms_coalmine_annual_annexure_i_subtable_2`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i_subtable_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dgms_coalmine_annual_annexure_i_subtable_3`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i_subtable_3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dgms_coalmine_table_a`
--
ALTER TABLE `dgms_coalmine_table_a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_coalmine_table_b`
--
ALTER TABLE `dgms_coalmine_table_b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_coalmine_table_c`
--
ALTER TABLE `dgms_coalmine_table_c`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_coalmine_table_d`
--
ALTER TABLE `dgms_coalmine_table_d`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_coalmine_table_e`
--
ALTER TABLE `dgms_coalmine_table_e`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_first_schedule_form_iii`
--
ALTER TABLE `dgms_first_schedule_form_iii`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_metelliferousmine_annual_annexure_ii`
--
ALTER TABLE `dgms_metelliferousmine_annual_annexure_ii`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_metelliferousmine_annual_annexure_ii_subtable_1`
--
ALTER TABLE `dgms_metelliferousmine_annual_annexure_ii_subtable_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_metelliferousmine_annual_annexure_ii_subtable_2`
--
ALTER TABLE `dgms_metelliferousmine_annual_annexure_ii_subtable_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_metelliferousmine_annual_annexure_ii_subtable_3`
--
ALTER TABLE `dgms_metelliferousmine_annual_annexure_ii_subtable_3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_oilmines_annual_annexure_iii`
--
ALTER TABLE `dgms_oilmines_annual_annexure_iii`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_oilmines_annual_annexure_iii_subtable_1`
--
ALTER TABLE `dgms_oilmines_annual_annexure_iii_subtable_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_oilmines_annual_annexure_iii_subtable_2`
--
ALTER TABLE `dgms_oilmines_annual_annexure_iii_subtable_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_ventilation`
--
ALTER TABLE `dgms_ventilation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distribution_details`
--
ALTER TABLE `distribution_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employeeshiftassign`
--
ALTER TABLE `employeeshiftassign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_employee`
--
ALTER TABLE `employee_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fireexp_area`
--
ALTER TABLE `fireexp_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fire_exp_gases`
--
ALTER TABLE `fire_exp_gases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fire_exp_gaseswifi`
--
ALTER TABLE `fire_exp_gaseswifi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `fire_exp_manual`
--
ALTER TABLE `fire_exp_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `gasmodel_auto`
--
ALTER TABLE `gasmodel_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gasmonitoring_auto`
--
ALTER TABLE `gasmonitoring_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gasmonitoring_manual`
--
ALTER TABLE `gasmonitoring_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hitcount_blacklist_ip`
--
ALTER TABLE `hitcount_blacklist_ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hitcount_blacklist_user_agent`
--
ALTER TABLE `hitcount_blacklist_user_agent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hitcount_hit`
--
ALTER TABLE `hitcount_hit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hitcount_hit_count`
--
ALTER TABLE `hitcount_hit_count`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `minedetails`
--
ALTER TABLE `minedetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `miner_tracking`
--
ALTER TABLE `miner_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `mineshift`
--
ALTER TABLE `mineshift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `miningrole`
--
ALTER TABLE `miningrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `news_bulletin`
--
ALTER TABLE `news_bulletin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `production_dailydispatch`
--
ALTER TABLE `production_dailydispatch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_dailyentry`
--
ALTER TABLE `production_dailyentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_manualentry`
--
ALTER TABLE `production_manualentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `production_material_waste`
--
ALTER TABLE `production_material_waste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_monthly`
--
ALTER TABLE `production_monthly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_monthlydispatch`
--
ALTER TABLE `production_monthlydispatch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_tub`
--
ALTER TABLE `production_tub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_vehicle`
--
ALTER TABLE `production_vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `production_weighbridge`
--
ALTER TABLE `production_weighbridge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `production_yearlydispatch`
--
ALTER TABLE `production_yearlydispatch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_yearlyentry`
--
ALTER TABLE `production_yearlyentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `profile_extension`
--
ALTER TABLE `profile_extension`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `reorder_details`
--
ALTER TABLE `reorder_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rescue_records`
--
ALTER TABLE `rescue_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensordata`
--
ALTER TABLE `sensordata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor_arduino`
--
ALTER TABLE `sensor_arduino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor_connection`
--
ALTER TABLE `sensor_connection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor_node`
--
ALTER TABLE `sensor_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sensor_nodesensor`
--
ALTER TABLE `sensor_nodesensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor_sensor`
--
ALTER TABLE `sensor_sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor_sensordata`
--
ALTER TABLE `sensor_sensordata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor_sensor_node`
--
ALTER TABLE `sensor_sensor_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sensor_wireless`
--
ALTER TABLE `sensor_wireless`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sms_configuration`
--
ALTER TABLE `sms_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `snippets_comment`
--
ALTER TABLE `snippets_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `snippets_snippet`
--
ALTER TABLE `snippets_snippet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strata_location`
--
ALTER TABLE `strata_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `strata_sensor`
--
ALTER TABLE `strata_sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `strata_sensor_data`
--
ALTER TABLE `strata_sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `strata_sensor_flag`
--
ALTER TABLE `strata_sensor_flag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier_details`
--
ALTER TABLE `supplier_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `temp_monitoring_manual`
--
ALTER TABLE `temp_monitoring_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracking_router`
--
ALTER TABLE `tracking_router`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `training_rescue_accident`
--
ALTER TABLE `training_rescue_accident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `water_level_acquisition_data`
--
ALTER TABLE `water_level_acquisition_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `water_level_monitoring_sensor`
--
ALTER TABLE `water_level_monitoring_sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `windroseaddsensor`
--
ALTER TABLE `windroseaddsensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `windrosedata`
--
ALTER TABLE `windrosedata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `windrosesetting`
--
ALTER TABLE `windrosesetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accident_records`
--
ALTER TABLE `accident_records`
  ADD CONSTRAINT `accident_records_mine_id_92cb3e77_fk_MineDetails_id` FOREIGN KEY (`mine_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `background_task`
--
ALTER TABLE `background_task`
  ADD CONSTRAINT `background_task_creator_content_type_61cc9af3_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  ADD CONSTRAINT `background_task_comp_creator_content_type_21d6a741_fk_django_co` FOREIGN KEY (`creator_content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `branch_details`
--
ALTER TABLE `branch_details`
  ADD CONSTRAINT `branch_details_mine_id_id_bfeccba4_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `carousal`
--
ALTER TABLE `carousal`
  ADD CONSTRAINT `carousal_mine_id_f8d357b7_fk_MineDetails_id` FOREIGN KEY (`mine_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `carousal_user_id_id_21cbfd8f_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `dgms_coalmine_annual_annexure_i`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i`
  ADD CONSTRAINT `dgms_coalmine_annual_mine_name_id_956dd721_fk_MineDetai` FOREIGN KEY (`mine_name_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `dgms_first_schedule_form_iii`
--
ALTER TABLE `dgms_first_schedule_form_iii`
  ADD CONSTRAINT `dgms_first_schedule__mine_name_id_bfccbac7_fk_MineDetai` FOREIGN KEY (`mine_name_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `dgms_metelliferousmine_annual_annexure_ii`
--
ALTER TABLE `dgms_metelliferousmine_annual_annexure_ii`
  ADD CONSTRAINT `dgms_metelliferousmi_mine_name_id_ec88d617_fk_MineDetai` FOREIGN KEY (`mine_name_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `dgms_oilmines_annual_annexure_iii`
--
ALTER TABLE `dgms_oilmines_annual_annexure_iii`
  ADD CONSTRAINT `dgms_oilmines_annual_mine_name_id_907dd7ba_fk_MineDetai` FOREIGN KEY (`mine_name_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `dgms_ventilation`
--
ALTER TABLE `dgms_ventilation`
  ADD CONSTRAINT `dgms_ventilation_mine_name_id_0a5776ca_fk_MineDetails_id` FOREIGN KEY (`mine_name_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_user_id_id_5497a9d4_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee1_immediate_staff_id_7751309c_fk_employee1_id` FOREIGN KEY (`immediate_staff_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `employee1_mine_id_62f5d8a7_fk_MineDetails_id` FOREIGN KEY (`mine_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `employee1_mining_role_id_0904bb33_fk_MiningRole_id` FOREIGN KEY (`mining_role_id`) REFERENCES `miningrole` (`id`);

--
-- Constraints for table `fireexp_area`
--
ALTER TABLE `fireexp_area`
  ADD CONSTRAINT `FireExp_area_mine_id_id_64af3241_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `hitcount_hit`
--
ALTER TABLE `hitcount_hit`
  ADD CONSTRAINT `hitcount_hit_hitcount_id_b7971910_fk_hitcount_hit_count_id` FOREIGN KEY (`hitcount_id`) REFERENCES `hitcount_hit_count` (`id`),
  ADD CONSTRAINT `hitcount_hit_user_id_f7067f66_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hitcount_hit_count`
--
ALTER TABLE `hitcount_hit_count`
  ADD CONSTRAINT `hitcount_hit_count_content_type_id_4a734fe1_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `miningrole`
--
ALTER TABLE `miningrole`
  ADD CONSTRAINT `MiningRole_mine_id_20ddfa3f_fk_MineDetails_id` FOREIGN KEY (`mine_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `MiningRole_parent_role_id_59fe44ec_fk_MiningRole_id` FOREIGN KEY (`parent_role_id`) REFERENCES `miningrole` (`id`);

--
-- Constraints for table `news_bulletin`
--
ALTER TABLE `news_bulletin`
  ADD CONSTRAINT `news_bulletin_user_id_id_04cc1349_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `production_dailydispatch`
--
ALTER TABLE `production_dailydispatch`
  ADD CONSTRAINT `production_dailydispatch_mine_id_id_fefb8e38_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `production_dailyentry`
--
ALTER TABLE `production_dailyentry`
  ADD CONSTRAINT `production_dailyentry_mine_id_id_a0e6da9f_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `production_manualentry`
--
ALTER TABLE `production_manualentry`
  ADD CONSTRAINT `production_manualentry_mine_id_id_3544eaf4_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `production_material_waste`
--
ALTER TABLE `production_material_waste`
  ADD CONSTRAINT `production_material_waste_mine_id_id_b90da2e4_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `production_monthly`
--
ALTER TABLE `production_monthly`
  ADD CONSTRAINT `production_monthly_mine_id_id_bb403079_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `production_monthlydispatch`
--
ALTER TABLE `production_monthlydispatch`
  ADD CONSTRAINT `production_monthlydispatch_mine_id_id_e4383d0d_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `production_tub`
--
ALTER TABLE `production_tub`
  ADD CONSTRAINT `production_tub_mine_id_id_01c8545f_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `production_tub_name_of_the_tub_id_a65cac29_fk_container` FOREIGN KEY (`name_of_the_tub_id`) REFERENCES `container_details` (`id`);

--
-- Constraints for table `production_vehicle`
--
ALTER TABLE `production_vehicle`
  ADD CONSTRAINT `production_vehicle_mine_id_id_8652104f_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `production_weighbridge`
--
ALTER TABLE `production_weighbridge`
  ADD CONSTRAINT `production_weighbridge_mine_id_id_b11f77d8_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `production_yearlydispatch`
--
ALTER TABLE `production_yearlydispatch`
  ADD CONSTRAINT `production_yearlydispatch_mine_id_id_512dbb02_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `production_yearlyentry`
--
ALTER TABLE `production_yearlyentry`
  ADD CONSTRAINT `production_yearlyentry_mine_id_id_8244d987_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_mine_id_id_bb06785f_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `product_details_prod_category_id_42d4a8fc_fk_category_details_id` FOREIGN KEY (`prod_category_id`) REFERENCES `category_details` (`id`);

--
-- Constraints for table `profile_extension`
--
ALTER TABLE `profile_extension`
  ADD CONSTRAINT `profile_extension_mine_id_id_70967400_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `profile_extension_user_id_id_20e360b3_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `rescue_records`
--
ALTER TABLE `rescue_records`
  ADD CONSTRAINT `rescue_records_mine_id_7c3ac060_fk_MineDetails_id` FOREIGN KEY (`mine_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `sensor_node`
--
ALTER TABLE `sensor_node`
  ADD CONSTRAINT `sensor_node_mine_id_id_22542281_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `sensor_nodesensor`
--
ALTER TABLE `sensor_nodesensor`
  ADD CONSTRAINT `sensor_nodesensor_name_id_fa6e5958_fk_sensor_node_id` FOREIGN KEY (`name_id`) REFERENCES `sensor_node` (`id`),
  ADD CONSTRAINT `sensor_nodesensor_sensorid_id_59b85181_fk_sensor_sensor_id` FOREIGN KEY (`sensorid_id`) REFERENCES `sensor_sensor` (`id`);

--
-- Constraints for table `sensor_sensor_node`
--
ALTER TABLE `sensor_sensor_node`
  ADD CONSTRAINT `sensor_sensor_node_mine_id_id_7de6491d_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `sensor_sensor_node_node_id_id_f6b7a19e_fk_sensor_node_id` FOREIGN KEY (`node_id_id`) REFERENCES `sensor_node` (`id`);

--
-- Constraints for table `sms_configuration`
--
ALTER TABLE `sms_configuration`
  ADD CONSTRAINT `sms_configuration_user_id_id_5d739909_fk_auth_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `snippets_comment`
--
ALTER TABLE `snippets_comment`
  ADD CONSTRAINT `snippets_comment_commented_by_id_645c6f6d_fk_auth_user_id` FOREIGN KEY (`commented_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `snippets_comment_commented_to_id_8d71ee14_fk_snippets_snippet_id` FOREIGN KEY (`commented_to_id`) REFERENCES `snippets_snippet` (`id`);

--
-- Constraints for table `snippets_snippet`
--
ALTER TABLE `snippets_snippet`
  ADD CONSTRAINT `snippets_snippet_created_by_id_a14886ce_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `strata_location`
--
ALTER TABLE `strata_location`
  ADD CONSTRAINT `strata_location_mine_name_id_44071eb4_fk_MineDetails_id` FOREIGN KEY (`mine_name_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `strata_sensor`
--
ALTER TABLE `strata_sensor`
  ADD CONSTRAINT `strata_sensor_location_id_id_4f56d64d_fk_strata_location_id` FOREIGN KEY (`location_id_id`) REFERENCES `strata_location` (`id`),
  ADD CONSTRAINT `strata_sensor_mine_name_id_8564d45d_fk_MineDetails_id` FOREIGN KEY (`mine_name_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `supplier_details`
--
ALTER TABLE `supplier_details`
  ADD CONSTRAINT `Supplier_Details_mine_id_id_6edb13d0_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `tracking_router`
--
ALTER TABLE `tracking_router`
  ADD CONSTRAINT `tracking_router_mine_id_id_e254a631_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `water_level_monitoring_sensor`
--
ALTER TABLE `water_level_monitoring_sensor`
  ADD CONSTRAINT `water_level_monitori_mine_id_id_e72fd679_fk_MineDetai` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
