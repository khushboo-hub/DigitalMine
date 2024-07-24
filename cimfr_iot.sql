-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 16, 2020 at 10:06 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cimfr_iot`
--
CREATE DATABASE IF NOT EXISTS `cimfr_iot` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cimfr_iot`;

-- --------------------------------------------------------

--
-- Table structure for table `accident_records`
--

CREATE TABLE IF NOT EXISTS `accident_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_id_id` int(11) DEFAULT NULL,
  `situation_mines` varchar(255) DEFAULT NULL,
  `name_address` varchar(255) DEFAULT NULL,
  `vil_pin` varchar(255) DEFAULT NULL,
  `date_hour_accident` datetime(6) DEFAULT NULL,
  `accident_location` varchar(255) DEFAULT NULL,
  `killed_num` int(11) DEFAULT NULL,
  `injured_num` int(11) DEFAULT NULL,
  `accident_cause_description` varchar(255) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accident_records_mine_id_92cb3e77_fk_MineDetails_id` (`mine_id`),
  KEY `accident_records_shift_id_id_85df117c` (`shift_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `accident_records`
--

INSERT INTO `accident_records` (`id`, `shift_id_id`, `situation_mines`, `name_address`, `vil_pin`, `date_hour_accident`, `accident_location`, `killed_num`, `injured_num`, `accident_cause_description`, `mine_id`) VALUES
(1, 4, 'Normal', 'Dhanbad', 'd', '2020-07-16 12:14:01.000000', 'R26', 1, 5, 'covid19', 8);

-- --------------------------------------------------------

--
-- Table structure for table `accident_records_others`
--

CREATE TABLE IF NOT EXISTS `accident_records_others` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `killed_or_injured` varchar(15) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `nature_of_employment` varchar(50) DEFAULT NULL,
  `cause` varchar(255) DEFAULT NULL,
  `accident_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accident_records_oth_accident_id_id_fecd9bdd_fk_accident_` (`accident_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `accident_record_employee`
--

CREATE TABLE IF NOT EXISTS `accident_record_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_name` varchar(50) DEFAULT NULL,
  `killed_or_injured` varchar(15) DEFAULT NULL,
  `cause` varchar(100) DEFAULT NULL,
  `accident_record_id` int(11) DEFAULT NULL,
  `employee_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `accident_record_empl_accident_record_id_978186b1_fk_accident_` (`accident_record_id`),
  KEY `accident_record_employee_employee_id_id_a7d8af8f_fk_employee_id` (`employee_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `alternateprodmodel`
--

CREATE TABLE IF NOT EXISTS `alternateprodmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` varchar(100) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL,
  `batch_number` varchar(100) DEFAULT NULL,
  `alter_product` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `alternateprodmodel`
--

INSERT INTO `alternateprodmodel` (`id`, `prod_id`, `mine_id`, `batch_number`, `alter_product`) VALUES
(1, '2', 1, 'Batch100', 'HP Pavilion Computer'),
(2, '3', 1, 'Batch123', 'Dell Computer'),
(3, '3', 1, 'Batch123', 'HP Pavilion Computer'),
(4, '5', 2, 'Batch009', 'Printing Material'),
(5, '7', 2, 'Batch009', 'Fevicol'),
(6, '7', 2, 'Batch009', 'Feviquick');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_emp`
--

CREATE TABLE IF NOT EXISTS `attendance_emp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mine_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `ab_pr_date` date DEFAULT NULL,
  `ab_pr` varchar(255) DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `leave_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `attendance_emp`
--

INSERT INTO `attendance_emp` (`id`, `mine_id`, `shift_id`, `emp_id`, `ab_pr_date`, `ab_pr`, `leave_type`, `leave_no`) VALUES
(1, 2, 1, 1, '2019-10-22', 'Absent', 'None', 0),
(2, 1, 1, 1, '2019-10-22', 'Present', 'None', 0),
(3, 1, 1, 2, '2019-10-15', 'Absent', 'None', 0),
(4, 1, 1, 2, '2019-10-15', 'Absent', 'None', 0),
(5, 1, 1, 2, '2019-10-15', 'Absent', 'None', 0),
(6, 1, 1, 2, '2019-10-15', 'Absent', 'None', 0),
(7, 1, 1, 2, '2019-10-15', 'Present', 'None', 0),
(8, 1, 1, 2, '2019-10-15', 'Absent', 'None', 0),
(9, 1, 1, 2, '2019-10-15', 'Absent', 'None', 0),
(10, 1, 1, 2, '2019-10-15', 'Absent', 'None', 0),
(11, 1, 1, 2, '2019-10-15', 'Absent', 'None', 0),
(12, 1, 1, 2, '2019-10-15', 'Present', 'None', 0),
(13, 1, 1, 2, '2019-10-15', 'Absent', 'None', 0),
(14, 1, 1, 2, '2019-10-15', 'Present', 'None', 0),
(15, 1, 1, 2, '2019-10-15', 'Absent', 'None', 0);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=529 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(33, 'Can add permission', 2, 'add_permission'),
(34, 'Can change permission', 2, 'change_permission'),
(35, 'Can delete permission', 2, 'delete_permission'),
(36, 'Can view permission', 2, 'view_permission'),
(37, 'Can add group', 3, 'add_group'),
(38, 'Can change group', 3, 'change_group'),
(39, 'Can delete group', 3, 'delete_group'),
(40, 'Can view group', 3, 'view_group'),
(41, 'Can add user', 4, 'add_user'),
(42, 'Can change user', 4, 'change_user'),
(43, 'Can delete user', 4, 'delete_user'),
(44, 'Can view user', 4, 'view_user'),
(45, 'Can add content type', 5, 'add_contenttype'),
(46, 'Can change content type', 5, 'change_contenttype'),
(47, 'Can delete content type', 5, 'delete_contenttype'),
(48, 'Can view content type', 5, 'view_contenttype'),
(49, 'Can add session', 6, 'add_session'),
(50, 'Can change session', 6, 'change_session'),
(51, 'Can delete session', 6, 'delete_session'),
(52, 'Can view session', 6, 'view_session'),
(53, 'Can add employee', 7, 'add_employee'),
(54, 'Can change employee', 7, 'change_employee'),
(55, 'Can delete employee', 7, 'delete_employee'),
(56, 'Can view employee', 7, 'view_employee'),
(57, 'Can add employee shift assign', 8, 'add_employeeshiftassign'),
(58, 'Can change employee shift assign', 8, 'change_employeeshiftassign'),
(59, 'Can delete employee shift assign', 8, 'delete_employeeshiftassign'),
(60, 'Can view employee shift assign', 8, 'view_employeeshiftassign'),
(61, 'Can add mine details', 9, 'add_minedetails'),
(62, 'Can change mine details', 9, 'change_minedetails'),
(63, 'Can delete mine details', 9, 'delete_minedetails'),
(64, 'Can view mine details', 9, 'view_minedetails'),
(65, 'Can add mine shift', 10, 'add_mineshift'),
(66, 'Can change mine shift', 10, 'change_mineshift'),
(67, 'Can delete mine shift', 10, 'delete_mineshift'),
(68, 'Can view mine shift', 10, 'view_mineshift'),
(69, 'Can add sensor data', 11, 'add_sensordata'),
(70, 'Can change sensor data', 11, 'change_sensordata'),
(71, 'Can delete sensor data', 11, 'delete_sensordata'),
(72, 'Can view sensor data', 11, 'view_sensordata'),
(73, 'Can add mining role', 12, 'add_miningrole'),
(74, 'Can change mining role', 12, 'change_miningrole'),
(75, 'Can delete mining role', 12, 'delete_miningrole'),
(76, 'Can view mining role', 12, 'view_miningrole'),
(77, 'Can add employee1', 13, 'add_employee1'),
(78, 'Can change employee1', 13, 'change_employee1'),
(79, 'Can delete employee1', 13, 'delete_employee1'),
(80, 'Can view employee1', 13, 'view_employee1'),
(81, 'Can add miner tracking', 14, 'add_minertracking'),
(82, 'Can change miner tracking', 14, 'change_minertracking'),
(83, 'Can delete miner tracking', 14, 'delete_minertracking'),
(84, 'Can view miner tracking', 14, 'view_minertracking'),
(85, 'Can add tracking router', 15, 'add_trackingrouter'),
(86, 'Can change tracking router', 15, 'change_trackingrouter'),
(87, 'Can delete tracking router', 15, 'delete_trackingrouter'),
(88, 'Can view tracking router', 15, 'view_trackingrouter'),
(89, 'Can add fire_exp_gases', 16, 'add_fire_exp_gases'),
(90, 'Can change fire_exp_gases', 16, 'change_fire_exp_gases'),
(91, 'Can delete fire_exp_gases', 16, 'delete_fire_exp_gases'),
(92, 'Can view fire_exp_gases', 16, 'view_fire_exp_gases'),
(93, 'Can add gasdb', 17, 'add_gasdb'),
(94, 'Can change gasdb', 17, 'change_gasdb'),
(95, 'Can delete gasdb', 17, 'delete_gasdb'),
(96, 'Can view gasdb', 17, 'view_gasdb'),
(97, 'Can add dgm s_ coal mine_ annual_ annexure_ i_ subtable_1', 18, 'add_dgms_coalmine_annual_annexure_i_subtable_1'),
(98, 'Can change dgm s_ coal mine_ annual_ annexure_ i_ subtable_1', 18, 'change_dgms_coalmine_annual_annexure_i_subtable_1'),
(99, 'Can delete dgm s_ coal mine_ annual_ annexure_ i_ subtable_1', 18, 'delete_dgms_coalmine_annual_annexure_i_subtable_1'),
(100, 'Can view dgm s_ coal mine_ annual_ annexure_ i_ subtable_1', 18, 'view_dgms_coalmine_annual_annexure_i_subtable_1'),
(101, 'Can add dgm s_ coal mine_ annual_ annexure_ i_ subtable_2', 19, 'add_dgms_coalmine_annual_annexure_i_subtable_2'),
(102, 'Can change dgm s_ coal mine_ annual_ annexure_ i_ subtable_2', 19, 'change_dgms_coalmine_annual_annexure_i_subtable_2'),
(103, 'Can delete dgm s_ coal mine_ annual_ annexure_ i_ subtable_2', 19, 'delete_dgms_coalmine_annual_annexure_i_subtable_2'),
(104, 'Can view dgm s_ coal mine_ annual_ annexure_ i_ subtable_2', 19, 'view_dgms_coalmine_annual_annexure_i_subtable_2'),
(105, 'Can add dgm s_ coal mine_ annual_ annexure_ i_ subtable_3', 20, 'add_dgms_coalmine_annual_annexure_i_subtable_3'),
(106, 'Can change dgm s_ coal mine_ annual_ annexure_ i_ subtable_3', 20, 'change_dgms_coalmine_annual_annexure_i_subtable_3'),
(107, 'Can delete dgm s_ coal mine_ annual_ annexure_ i_ subtable_3', 20, 'delete_dgms_coalmine_annual_annexure_i_subtable_3'),
(108, 'Can view dgm s_ coal mine_ annual_ annexure_ i_ subtable_3', 20, 'view_dgms_coalmine_annual_annexure_i_subtable_3'),
(109, 'Can add dgm s_ coal mine_ table_ a_ model', 21, 'add_dgms_coalmine_table_a_model'),
(110, 'Can change dgm s_ coal mine_ table_ a_ model', 21, 'change_dgms_coalmine_table_a_model'),
(111, 'Can delete dgm s_ coal mine_ table_ a_ model', 21, 'delete_dgms_coalmine_table_a_model'),
(112, 'Can view dgm s_ coal mine_ table_ a_ model', 21, 'view_dgms_coalmine_table_a_model'),
(113, 'Can add dgm s_ coal mine_ table_ b_ model', 22, 'add_dgms_coalmine_table_b_model'),
(114, 'Can change dgm s_ coal mine_ table_ b_ model', 22, 'change_dgms_coalmine_table_b_model'),
(115, 'Can delete dgm s_ coal mine_ table_ b_ model', 22, 'delete_dgms_coalmine_table_b_model'),
(116, 'Can view dgm s_ coal mine_ table_ b_ model', 22, 'view_dgms_coalmine_table_b_model'),
(117, 'Can add dgm s_ coal mine_ table_ c_ model', 23, 'add_dgms_coalmine_table_c_model'),
(118, 'Can change dgm s_ coal mine_ table_ c_ model', 23, 'change_dgms_coalmine_table_c_model'),
(119, 'Can delete dgm s_ coal mine_ table_ c_ model', 23, 'delete_dgms_coalmine_table_c_model'),
(120, 'Can view dgm s_ coal mine_ table_ c_ model', 23, 'view_dgms_coalmine_table_c_model'),
(121, 'Can add dgm s_ coal mine_ table_ d_ model', 24, 'add_dgms_coalmine_table_d_model'),
(122, 'Can change dgm s_ coal mine_ table_ d_ model', 24, 'change_dgms_coalmine_table_d_model'),
(123, 'Can delete dgm s_ coal mine_ table_ d_ model', 24, 'delete_dgms_coalmine_table_d_model'),
(124, 'Can view dgm s_ coal mine_ table_ d_ model', 24, 'view_dgms_coalmine_table_d_model'),
(125, 'Can add dgm s_ coal mine_ table_ e_ model', 25, 'add_dgms_coalmine_table_e_model'),
(126, 'Can change dgm s_ coal mine_ table_ e_ model', 25, 'change_dgms_coalmine_table_e_model'),
(127, 'Can delete dgm s_ coal mine_ table_ e_ model', 25, 'delete_dgms_coalmine_table_e_model'),
(128, 'Can view dgm s_ coal mine_ table_ e_ model', 25, 'view_dgms_coalmine_table_e_model'),
(129, 'Can add dgm s_ metalliferous mine_ annual_ annexure_i i_ subtable_1', 26, 'add_dgms_metalliferousmine_annual_annexure_ii_subtable_1'),
(130, 'Can change dgm s_ metalliferous mine_ annual_ annexure_i i_ subtable_1', 26, 'change_dgms_metalliferousmine_annual_annexure_ii_subtable_1'),
(131, 'Can delete dgm s_ metalliferous mine_ annual_ annexure_i i_ subtable_1', 26, 'delete_dgms_metalliferousmine_annual_annexure_ii_subtable_1'),
(132, 'Can view dgm s_ metalliferous mine_ annual_ annexure_i i_ subtable_1', 26, 'view_dgms_metalliferousmine_annual_annexure_ii_subtable_1'),
(133, 'Can add dgm s_ metalliferous mines_ annual_ annexure_i i_ subtable_2', 27, 'add_dgms_metalliferousmines_annual_annexure_ii_subtable_2'),
(134, 'Can change dgm s_ metalliferous mines_ annual_ annexure_i i_ subtable_2', 27, 'change_dgms_metalliferousmines_annual_annexure_ii_subtable_2'),
(135, 'Can delete dgm s_ metalliferous mines_ annual_ annexure_i i_ subtable_2', 27, 'delete_dgms_metalliferousmines_annual_annexure_ii_subtable_2'),
(136, 'Can view dgm s_ metalliferous mines_ annual_ annexure_i i_ subtable_2', 27, 'view_dgms_metalliferousmines_annual_annexure_ii_subtable_2'),
(137, 'Can add dgm s_ metalliferous mines_annua l_ annexure_i i_ subtable_3', 28, 'add_dgms_metalliferousmines_annual_annexure_ii_subtable_3'),
(138, 'Can change dgm s_ metalliferous mines_annua l_ annexure_i i_ subtable_3', 28, 'change_dgms_metalliferousmines_annual_annexure_ii_subtable_3'),
(139, 'Can delete dgm s_ metalliferous mines_annua l_ annexure_i i_ subtable_3', 28, 'delete_dgms_metalliferousmines_annual_annexure_ii_subtable_3'),
(140, 'Can view dgm s_ metalliferous mines_annua l_ annexure_i i_ subtable_3', 28, 'view_dgms_metalliferousmines_annual_annexure_ii_subtable_3'),
(141, 'Can add dgm s_ oil mines_ annual_ annexure_ii i_ subtable_1', 29, 'add_dgms_oilmines_annual_annexure_iii_subtable_1'),
(142, 'Can change dgm s_ oil mines_ annual_ annexure_ii i_ subtable_1', 29, 'change_dgms_oilmines_annual_annexure_iii_subtable_1'),
(143, 'Can delete dgm s_ oil mines_ annual_ annexure_ii i_ subtable_1', 29, 'delete_dgms_oilmines_annual_annexure_iii_subtable_1'),
(144, 'Can view dgm s_ oil mines_ annual_ annexure_ii i_ subtable_1', 29, 'view_dgms_oilmines_annual_annexure_iii_subtable_1'),
(145, 'Can add dgm s_ oil mines_ annual_ annexure_ii i_ subtable_2', 30, 'add_dgms_oilmines_annual_annexure_iii_subtable_2'),
(146, 'Can change dgm s_ oil mines_ annual_ annexure_ii i_ subtable_2', 30, 'change_dgms_oilmines_annual_annexure_iii_subtable_2'),
(147, 'Can delete dgm s_ oil mines_ annual_ annexure_ii i_ subtable_2', 30, 'delete_dgms_oilmines_annual_annexure_iii_subtable_2'),
(148, 'Can view dgm s_ oil mines_ annual_ annexure_ii i_ subtable_2', 30, 'view_dgms_oilmines_annual_annexure_iii_subtable_2'),
(149, 'Can add first_ schedule_ form_iii_ model', 31, 'add_first_schedule_form_iii_model'),
(150, 'Can change first_ schedule_ form_iii_ model', 31, 'change_first_schedule_form_iii_model'),
(151, 'Can delete first_ schedule_ form_iii_ model', 31, 'delete_first_schedule_form_iii_model'),
(152, 'Can view first_ schedule_ form_iii_ model', 31, 'view_first_schedule_form_iii_model'),
(153, 'Can add dgm s_ oil mines_ annual_ annexure_iii', 32, 'add_dgms_oilmines_annual_annexure_iii'),
(154, 'Can change dgm s_ oil mines_ annual_ annexure_iii', 32, 'change_dgms_oilmines_annual_annexure_iii'),
(155, 'Can delete dgm s_ oil mines_ annual_ annexure_iii', 32, 'delete_dgms_oilmines_annual_annexure_iii'),
(156, 'Can view dgm s_ oil mines_ annual_ annexure_iii', 32, 'view_dgms_oilmines_annual_annexure_iii'),
(157, 'Can add dgm s_ metelliferous mine_ annual_ annexure_ii', 33, 'add_dgms_metelliferousmine_annual_annexure_ii'),
(158, 'Can change dgm s_ metelliferous mine_ annual_ annexure_ii', 33, 'change_dgms_metelliferousmine_annual_annexure_ii'),
(159, 'Can delete dgm s_ metelliferous mine_ annual_ annexure_ii', 33, 'delete_dgms_metelliferousmine_annual_annexure_ii'),
(160, 'Can view dgm s_ metelliferous mine_ annual_ annexure_ii', 33, 'view_dgms_metelliferousmine_annual_annexure_ii'),
(161, 'Can add dgm s_ coal mine_ annual_ annexure_i', 34, 'add_dgms_coalmine_annual_annexure_i'),
(162, 'Can change dgm s_ coal mine_ annual_ annexure_i', 34, 'change_dgms_coalmine_annual_annexure_i'),
(163, 'Can delete dgm s_ coal mine_ annual_ annexure_i', 34, 'delete_dgms_coalmine_annual_annexure_i'),
(164, 'Can view dgm s_ coal mine_ annual_ annexure_i', 34, 'view_dgms_coalmine_annual_annexure_i'),
(165, 'Can add strata_location', 35, 'add_strata_location'),
(166, 'Can change strata_location', 35, 'change_strata_location'),
(167, 'Can delete strata_location', 35, 'delete_strata_location'),
(168, 'Can view strata_location', 35, 'view_strata_location'),
(169, 'Can add strata_sensor_data', 36, 'add_strata_sensor_data'),
(170, 'Can change strata_sensor_data', 36, 'change_strata_sensor_data'),
(171, 'Can delete strata_sensor_data', 36, 'delete_strata_sensor_data'),
(172, 'Can view strata_sensor_data', 36, 'view_strata_sensor_data'),
(173, 'Can add strata_sensor_flag', 37, 'add_strata_sensor_flag'),
(174, 'Can change strata_sensor_flag', 37, 'change_strata_sensor_flag'),
(175, 'Can delete strata_sensor_flag', 37, 'delete_strata_sensor_flag'),
(176, 'Can view strata_sensor_flag', 37, 'view_strata_sensor_flag'),
(177, 'Can add strata_sensor', 38, 'add_strata_sensor'),
(178, 'Can change strata_sensor', 38, 'change_strata_sensor'),
(179, 'Can delete strata_sensor', 38, 'delete_strata_sensor'),
(180, 'Can view strata_sensor', 38, 'view_strata_sensor'),
(181, 'Can add profile_extension', 39, 'add_profile_extension'),
(182, 'Can change profile_extension', 39, 'change_profile_extension'),
(183, 'Can delete profile_extension', 39, 'delete_profile_extension'),
(184, 'Can view profile_extension', 39, 'view_profile_extension'),
(185, 'Can add snippet', 40, 'add_snippet'),
(186, 'Can change snippet', 40, 'change_snippet'),
(187, 'Can delete snippet', 40, 'delete_snippet'),
(188, 'Can view snippet', 40, 'view_snippet'),
(189, 'Can add comment', 41, 'add_comment'),
(190, 'Can change comment', 41, 'change_comment'),
(191, 'Can delete comment', 41, 'delete_comment'),
(192, 'Can view comment', 41, 'view_comment'),
(193, 'Can add gas model', 42, 'add_gasmodel'),
(194, 'Can change gas model', 42, 'change_gasmodel'),
(195, 'Can delete gas model', 42, 'delete_gasmodel'),
(196, 'Can view gas model', 42, 'view_gasmodel'),
(197, 'Can add gas model_auto', 43, 'add_gasmodel_auto'),
(198, 'Can change gas model_auto', 43, 'change_gasmodel_auto'),
(199, 'Can delete gas model_auto', 43, 'delete_gasmodel_auto'),
(200, 'Can view gas model_auto', 43, 'view_gasmodel_auto'),
(201, 'Can add home model', 44, 'add_homemodel'),
(202, 'Can change home model', 44, 'change_homemodel'),
(203, 'Can delete home model', 44, 'delete_homemodel'),
(204, 'Can view home model', 44, 'view_homemodel'),
(205, 'Can add completed task', 45, 'add_completedtask'),
(206, 'Can change completed task', 45, 'change_completedtask'),
(207, 'Can delete completed task', 45, 'delete_completedtask'),
(208, 'Can view completed task', 45, 'view_completedtask'),
(209, 'Can add task', 46, 'add_task'),
(210, 'Can change task', 46, 'change_task'),
(211, 'Can delete task', 46, 'delete_task'),
(212, 'Can view task', 46, 'view_task'),
(213, 'Can add fire_exp_gases wifi', 47, 'add_fire_exp_gaseswifi'),
(214, 'Can change fire_exp_gases wifi', 47, 'change_fire_exp_gaseswifi'),
(215, 'Can delete fire_exp_gases wifi', 47, 'delete_fire_exp_gaseswifi'),
(216, 'Can view fire_exp_gases wifi', 47, 'view_fire_exp_gaseswifi'),
(217, 'Can add area model', 48, 'add_areamodel'),
(218, 'Can change area model', 48, 'change_areamodel'),
(219, 'Can delete area model', 48, 'delete_areamodel'),
(220, 'Can view area model', 48, 'view_areamodel'),
(221, 'Can add alternate prod model', 49, 'add_alternateprodmodel'),
(222, 'Can change alternate prod model', 49, 'change_alternateprodmodel'),
(223, 'Can delete alternate prod model', 49, 'delete_alternateprodmodel'),
(224, 'Can view alternate prod model', 49, 'view_alternateprodmodel'),
(225, 'Can add category model', 50, 'add_categorymodel'),
(226, 'Can change category model', 50, 'change_categorymodel'),
(227, 'Can delete category model', 50, 'delete_categorymodel'),
(228, 'Can view category model', 50, 'view_categorymodel'),
(229, 'Can add deduct model', 51, 'add_deductmodel'),
(230, 'Can change deduct model', 51, 'change_deductmodel'),
(231, 'Can delete deduct model', 51, 'delete_deductmodel'),
(232, 'Can view deduct model', 51, 'view_deductmodel'),
(233, 'Can add distribute model', 52, 'add_distributemodel'),
(234, 'Can change distribute model', 52, 'change_distributemodel'),
(235, 'Can delete distribute model', 52, 'delete_distributemodel'),
(236, 'Can view distribute model', 52, 'view_distributemodel'),
(237, 'Can add reorder model', 53, 'add_reordermodel'),
(238, 'Can change reorder model', 53, 'change_reordermodel'),
(239, 'Can delete reorder model', 53, 'delete_reordermodel'),
(240, 'Can view reorder model', 53, 'view_reordermodel'),
(241, 'Can add supplier model', 54, 'add_suppliermodel'),
(242, 'Can change supplier model', 54, 'change_suppliermodel'),
(243, 'Can delete supplier model', 54, 'delete_suppliermodel'),
(244, 'Can view supplier model', 54, 'view_suppliermodel'),
(245, 'Can add product model', 55, 'add_productmodel'),
(246, 'Can change product model', 55, 'change_productmodel'),
(247, 'Can delete product model', 55, 'delete_productmodel'),
(248, 'Can view product model', 55, 'view_productmodel'),
(249, 'Can add branch model', 56, 'add_branchmodel'),
(250, 'Can change branch model', 56, 'change_branchmodel'),
(251, 'Can delete branch model', 56, 'delete_branchmodel'),
(252, 'Can view branch model', 56, 'view_branchmodel'),
(253, 'Can add employee attendance', 57, 'add_employeeattendance'),
(254, 'Can change employee attendance', 57, 'change_employeeattendance'),
(255, 'Can delete employee attendance', 57, 'delete_employeeattendance'),
(256, 'Can view employee attendance', 57, 'view_employeeattendance'),
(257, 'Can add training_ rescue_ accident', 58, 'add_training_rescue_accident'),
(258, 'Can change training_ rescue_ accident', 58, 'change_training_rescue_accident'),
(259, 'Can delete training_ rescue_ accident', 58, 'delete_training_rescue_accident'),
(260, 'Can view training_ rescue_ accident', 58, 'view_training_rescue_accident'),
(261, 'Can add rescue_ records', 59, 'add_rescue_records'),
(262, 'Can change rescue_ records', 59, 'change_rescue_records'),
(263, 'Can delete rescue_ records', 59, 'delete_rescue_records'),
(264, 'Can view rescue_ records', 59, 'view_rescue_records'),
(265, 'Can add accident_ records', 60, 'add_accident_records'),
(266, 'Can change accident_ records', 60, 'change_accident_records'),
(267, 'Can delete accident_ records', 60, 'delete_accident_records'),
(268, 'Can view accident_ records', 60, 'view_accident_records'),
(269, 'Can add container_ details', 61, 'add_container_details'),
(270, 'Can change container_ details', 61, 'change_container_details'),
(271, 'Can delete container_ details', 61, 'delete_container_details'),
(272, 'Can view container_ details', 61, 'view_container_details'),
(273, 'Can add production_ yearly entry', 62, 'add_production_yearlyentry'),
(274, 'Can change production_ yearly entry', 62, 'change_production_yearlyentry'),
(275, 'Can delete production_ yearly entry', 62, 'delete_production_yearlyentry'),
(276, 'Can view production_ yearly entry', 62, 'view_production_yearlyentry'),
(277, 'Can add production_ yearly dispatch', 63, 'add_production_yearlydispatch'),
(278, 'Can change production_ yearly dispatch', 63, 'change_production_yearlydispatch'),
(279, 'Can delete production_ yearly dispatch', 63, 'delete_production_yearlydispatch'),
(280, 'Can view production_ yearly dispatch', 63, 'view_production_yearlydispatch'),
(281, 'Can add production_ weighbridge', 64, 'add_production_weighbridge'),
(282, 'Can change production_ weighbridge', 64, 'change_production_weighbridge'),
(283, 'Can delete production_ weighbridge', 64, 'delete_production_weighbridge'),
(284, 'Can view production_ weighbridge', 64, 'view_production_weighbridge'),
(285, 'Can add production_ vehicle', 65, 'add_production_vehicle'),
(286, 'Can change production_ vehicle', 65, 'change_production_vehicle'),
(287, 'Can delete production_ vehicle', 65, 'delete_production_vehicle'),
(288, 'Can view production_ vehicle', 65, 'view_production_vehicle'),
(289, 'Can add production_ tub', 66, 'add_production_tub'),
(290, 'Can change production_ tub', 66, 'change_production_tub'),
(291, 'Can delete production_ tub', 66, 'delete_production_tub'),
(292, 'Can view production_ tub', 66, 'view_production_tub'),
(293, 'Can add production_ monthly dispatch', 67, 'add_production_monthlydispatch'),
(294, 'Can change production_ monthly dispatch', 67, 'change_production_monthlydispatch'),
(295, 'Can delete production_ monthly dispatch', 67, 'delete_production_monthlydispatch'),
(296, 'Can view production_ monthly dispatch', 67, 'view_production_monthlydispatch'),
(297, 'Can add production_ monthly', 68, 'add_production_monthly'),
(298, 'Can change production_ monthly', 68, 'change_production_monthly'),
(299, 'Can delete production_ monthly', 68, 'delete_production_monthly'),
(300, 'Can view production_ monthly', 68, 'view_production_monthly'),
(301, 'Can add production_ material_ waste', 69, 'add_production_material_waste'),
(302, 'Can change production_ material_ waste', 69, 'change_production_material_waste'),
(303, 'Can delete production_ material_ waste', 69, 'delete_production_material_waste'),
(304, 'Can view production_ material_ waste', 69, 'view_production_material_waste'),
(305, 'Can add production_ manualentry', 70, 'add_production_manualentry'),
(306, 'Can change production_ manualentry', 70, 'change_production_manualentry'),
(307, 'Can delete production_ manualentry', 70, 'delete_production_manualentry'),
(308, 'Can view production_ manualentry', 70, 'view_production_manualentry'),
(309, 'Can add production_ daily entry', 71, 'add_production_dailyentry'),
(310, 'Can change production_ daily entry', 71, 'change_production_dailyentry'),
(311, 'Can delete production_ daily entry', 71, 'delete_production_dailyentry'),
(312, 'Can view production_ daily entry', 71, 'view_production_dailyentry'),
(313, 'Can add production_ daily dispatch', 72, 'add_production_dailydispatch'),
(314, 'Can change production_ daily dispatch', 72, 'change_production_dailydispatch'),
(315, 'Can delete production_ daily dispatch', 72, 'delete_production_dailydispatch'),
(316, 'Can view production_ daily dispatch', 72, 'view_production_dailydispatch'),
(317, 'Can add arduino', 73, 'add_arduino'),
(318, 'Can change arduino', 73, 'change_arduino'),
(319, 'Can delete arduino', 73, 'delete_arduino'),
(320, 'Can view arduino', 73, 'view_arduino'),
(321, 'Can add connection', 74, 'add_connection'),
(322, 'Can change connection', 74, 'change_connection'),
(323, 'Can delete connection', 74, 'delete_connection'),
(324, 'Can view connection', 74, 'view_connection'),
(325, 'Can add gas model_auto', 75, 'add_gasmodel_auto'),
(326, 'Can change gas model_auto', 75, 'change_gasmodel_auto'),
(327, 'Can delete gas model_auto', 75, 'delete_gasmodel_auto'),
(328, 'Can view gas model_auto', 75, 'view_gasmodel_auto'),
(329, 'Can add node', 76, 'add_node'),
(330, 'Can change node', 76, 'change_node'),
(331, 'Can delete node', 76, 'delete_node'),
(332, 'Can view node', 76, 'view_node'),
(333, 'Can add sensor', 77, 'add_sensor'),
(334, 'Can change sensor', 77, 'change_sensor'),
(335, 'Can delete sensor', 77, 'delete_sensor'),
(336, 'Can view sensor', 77, 'view_sensor'),
(337, 'Can add sensor_ node', 78, 'add_sensor_node'),
(338, 'Can change sensor_ node', 78, 'change_sensor_node'),
(339, 'Can delete sensor_ node', 78, 'delete_sensor_node'),
(340, 'Can view sensor_ node', 78, 'view_sensor_node'),
(341, 'Can add sensordata', 79, 'add_sensordata'),
(342, 'Can change sensordata', 79, 'change_sensordata'),
(343, 'Can delete sensordata', 79, 'delete_sensordata'),
(344, 'Can view sensordata', 79, 'view_sensordata'),
(345, 'Can add wireless', 80, 'add_wireless'),
(346, 'Can change wireless', 80, 'change_wireless'),
(347, 'Can delete wireless', 80, 'delete_wireless'),
(348, 'Can view wireless', 80, 'view_wireless'),
(349, 'Can add nodesensor', 81, 'add_nodesensor'),
(350, 'Can change nodesensor', 81, 'change_nodesensor'),
(351, 'Can delete nodesensor', 81, 'delete_nodesensor'),
(352, 'Can view nodesensor', 81, 'view_nodesensor'),
(353, 'Can add water_level_monitoring_data_acquisition_model', 82, 'add_water_level_monitoring_data_acquisition_model'),
(354, 'Can change water_level_monitoring_data_acquisition_model', 82, 'change_water_level_monitoring_data_acquisition_model'),
(355, 'Can delete water_level_monitoring_data_acquisition_model', 82, 'delete_water_level_monitoring_data_acquisition_model'),
(356, 'Can view water_level_monitoring_data_acquisition_model', 82, 'view_water_level_monitoring_data_acquisition_model'),
(357, 'Can add water_level_monitoring_model', 83, 'add_water_level_monitoring_model'),
(358, 'Can change water_level_monitoring_model', 83, 'change_water_level_monitoring_model'),
(359, 'Can delete water_level_monitoring_model', 83, 'delete_water_level_monitoring_model'),
(360, 'Can view water_level_monitoring_model', 83, 'view_water_level_monitoring_model'),
(361, 'Can add todo', 84, 'add_todo'),
(362, 'Can change todo', 84, 'change_todo'),
(363, 'Can delete todo', 84, 'delete_todo'),
(364, 'Can view todo', 84, 'view_todo'),
(365, 'Can add sms_configuration', 85, 'add_sms_configuration'),
(366, 'Can change sms_configuration', 85, 'change_sms_configuration'),
(367, 'Can delete sms_configuration', 85, 'delete_sms_configuration'),
(368, 'Can view sms_configuration', 85, 'view_sms_configuration'),
(369, 'Can add news_bulletin', 86, 'add_news_bulletin'),
(370, 'Can change news_bulletin', 86, 'change_news_bulletin'),
(371, 'Can delete news_bulletin', 86, 'delete_news_bulletin'),
(372, 'Can view news_bulletin', 86, 'view_news_bulletin'),
(373, 'Can add carousal', 87, 'add_carousal'),
(374, 'Can change carousal', 87, 'change_carousal'),
(375, 'Can delete carousal', 87, 'delete_carousal'),
(376, 'Can view carousal', 87, 'view_carousal'),
(377, 'Can add emails', 88, 'add_emails'),
(378, 'Can change emails', 88, 'change_emails'),
(379, 'Can delete emails', 88, 'delete_emails'),
(380, 'Can view emails', 88, 'view_emails'),
(381, 'Can add mine details', 89, 'add_minedetails'),
(382, 'Can change mine details', 89, 'change_minedetails'),
(383, 'Can delete mine details', 89, 'delete_minedetails'),
(384, 'Can view mine details', 89, 'view_minedetails'),
(385, 'Can add mining role', 90, 'add_miningrole'),
(386, 'Can change mining role', 90, 'change_miningrole'),
(387, 'Can delete mining role', 90, 'delete_miningrole'),
(388, 'Can view mining role', 90, 'view_miningrole'),
(389, 'Can add sensor data', 91, 'add_sensordata'),
(390, 'Can change sensor data', 91, 'change_sensordata'),
(391, 'Can delete sensor data', 91, 'delete_sensordata'),
(392, 'Can view sensor data', 91, 'view_sensordata'),
(393, 'Can add mine shift', 92, 'add_mineshift'),
(394, 'Can change mine shift', 92, 'change_mineshift'),
(395, 'Can delete mine shift', 92, 'delete_mineshift'),
(396, 'Can view mine shift', 92, 'view_mineshift'),
(397, 'Can add employee shift assign', 93, 'add_employeeshiftassign'),
(398, 'Can change employee shift assign', 93, 'change_employeeshiftassign'),
(399, 'Can delete employee shift assign', 93, 'delete_employeeshiftassign'),
(400, 'Can view employee shift assign', 93, 'view_employeeshiftassign'),
(401, 'Can add development_permission_model', 94, 'add_development_permission_model'),
(402, 'Can change development_permission_model', 94, 'change_development_permission_model'),
(403, 'Can delete development_permission_model', 94, 'delete_development_permission_model'),
(404, 'Can view development_permission_model', 94, 'view_development_permission_model'),
(405, 'Can add extract_or_reduce_pillars_models', 95, 'add_extract_or_reduce_pillars_models'),
(406, 'Can change extract_or_reduce_pillars_models', 95, 'change_extract_or_reduce_pillars_models'),
(407, 'Can delete extract_or_reduce_pillars_models', 95, 'delete_extract_or_reduce_pillars_models'),
(408, 'Can view extract_or_reduce_pillars_models', 95, 'view_extract_or_reduce_pillars_models'),
(409, 'Can add first_schedule_form_v_ model', 96, 'add_first_schedule_form_v_model'),
(410, 'Can change first_schedule_form_v_ model', 96, 'change_first_schedule_form_v_model'),
(411, 'Can delete first_schedule_form_v_ model', 96, 'delete_first_schedule_form_v_model'),
(412, 'Can view first_schedule_form_v_ model', 96, 'view_first_schedule_form_v_model'),
(413, 'Can add identification_report_of_the_problem_model', 97, 'add_identification_report_of_the_problem_model'),
(414, 'Can change identification_report_of_the_problem_model', 97, 'change_identification_report_of_the_problem_model'),
(415, 'Can delete identification_report_of_the_problem_model', 97, 'delete_identification_report_of_the_problem_model'),
(416, 'Can view identification_report_of_the_problem_model', 97, 'view_identification_report_of_the_problem_model'),
(417, 'Can add metal_mine_extract_permission_model', 98, 'add_metal_mine_extract_permission_model'),
(418, 'Can change metal_mine_extract_permission_model', 98, 'change_metal_mine_extract_permission_model'),
(419, 'Can delete metal_mine_extract_permission_model', 98, 'delete_metal_mine_extract_permission_model'),
(420, 'Can view metal_mine_extract_permission_model', 98, 'view_metal_mine_extract_permission_model'),
(421, 'Can add ventilation_ model', 99, 'add_ventilation_model'),
(422, 'Can change ventilation_ model', 99, 'change_ventilation_model'),
(423, 'Can delete ventilation_ model', 99, 'delete_ventilation_model'),
(424, 'Can view ventilation_ model', 99, 'view_ventilation_model'),
(425, 'Can add setting', 100, 'add_setting'),
(426, 'Can change setting', 100, 'change_setting'),
(427, 'Can delete setting', 100, 'delete_setting'),
(428, 'Can view setting', 100, 'view_setting'),
(429, 'Can add wind rose setting', 101, 'add_windrosesetting'),
(430, 'Can change wind rose setting', 101, 'change_windrosesetting'),
(431, 'Can delete wind rose setting', 101, 'delete_windrosesetting'),
(432, 'Can view wind rose setting', 101, 'view_windrosesetting'),
(433, 'Can add wind rose add sensor', 102, 'add_windroseaddsensor'),
(434, 'Can change wind rose add sensor', 102, 'change_windroseaddsensor'),
(435, 'Can delete wind rose add sensor', 102, 'delete_windroseaddsensor'),
(436, 'Can view wind rose add sensor', 102, 'view_windroseaddsensor'),
(437, 'Can add wind rose data', 103, 'add_windrosedata'),
(438, 'Can change wind rose data', 103, 'change_windrosedata'),
(439, 'Can delete wind rose data', 103, 'delete_windrosedata'),
(440, 'Can view wind rose data', 103, 'view_windrosedata'),
(441, 'Can add slop_sensor_data', 104, 'add_slop_sensor_data'),
(442, 'Can change slop_sensor_data', 104, 'change_slop_sensor_data'),
(443, 'Can delete slop_sensor_data', 104, 'delete_slop_sensor_data'),
(444, 'Can view slop_sensor_data', 104, 'view_slop_sensor_data'),
(445, 'Can add slop_sensor_flag', 105, 'add_slop_sensor_flag'),
(446, 'Can change slop_sensor_flag', 105, 'change_slop_sensor_flag'),
(447, 'Can delete slop_sensor_flag', 105, 'delete_slop_sensor_flag'),
(448, 'Can view slop_sensor_flag', 105, 'view_slop_sensor_flag'),
(449, 'Can add slop_sensor', 106, 'add_slop_sensor'),
(450, 'Can change slop_sensor', 106, 'change_slop_sensor'),
(451, 'Can delete slop_sensor', 106, 'delete_slop_sensor'),
(452, 'Can view slop_sensor', 106, 'view_slop_sensor'),
(453, 'Can add slop_location', 107, 'add_slop_location'),
(454, 'Can change slop_location', 107, 'change_slop_location'),
(455, 'Can delete slop_location', 107, 'delete_slop_location'),
(456, 'Can view slop_location', 107, 'view_slop_location'),
(457, 'Can add slope_sensor_data', 108, 'add_slope_sensor_data'),
(458, 'Can change slope_sensor_data', 108, 'change_slope_sensor_data'),
(459, 'Can delete slope_sensor_data', 108, 'delete_slope_sensor_data'),
(460, 'Can view slope_sensor_data', 108, 'view_slope_sensor_data'),
(461, 'Can add slope_sensor_flag', 109, 'add_slope_sensor_flag'),
(462, 'Can change slope_sensor_flag', 109, 'change_slope_sensor_flag'),
(463, 'Can delete slope_sensor_flag', 109, 'delete_slope_sensor_flag'),
(464, 'Can view slope_sensor_flag', 109, 'view_slope_sensor_flag'),
(465, 'Can add slope_location', 110, 'add_slope_location'),
(466, 'Can change slope_location', 110, 'change_slope_location'),
(467, 'Can delete slope_location', 110, 'delete_slope_location'),
(468, 'Can view slope_location', 110, 'view_slope_location'),
(469, 'Can add slope_sensor', 111, 'add_slope_sensor'),
(470, 'Can change slope_sensor', 111, 'change_slope_sensor'),
(471, 'Can delete slope_sensor', 111, 'delete_slope_sensor'),
(472, 'Can view slope_sensor', 111, 'view_slope_sensor'),
(473, 'Can add temp_monitoring_automatic', 112, 'add_temp_monitoring_automatic'),
(474, 'Can change temp_monitoring_automatic', 112, 'change_temp_monitoring_automatic'),
(475, 'Can delete temp_monitoring_automatic', 112, 'delete_temp_monitoring_automatic'),
(476, 'Can view temp_monitoring_automatic', 112, 'view_temp_monitoring_automatic'),
(477, 'Can add rate of minimum wages', 113, 'add_rateofminimumwages'),
(478, 'Can change rate of minimum wages', 113, 'change_rateofminimumwages'),
(479, 'Can delete rate of minimum wages', 113, 'delete_rateofminimumwages'),
(480, 'Can view rate of minimum wages', 113, 'view_rateofminimumwages'),
(481, 'Can add notification', 114, 'add_notification'),
(482, 'Can change notification', 114, 'change_notification'),
(483, 'Can delete notification', 114, 'delete_notification'),
(484, 'Can view notification', 114, 'view_notification'),
(485, 'Can add user session', 115, 'add_usersession'),
(486, 'Can change user session', 115, 'change_usersession'),
(487, 'Can delete user session', 115, 'delete_usersession'),
(488, 'Can view user session', 115, 'view_usersession'),
(489, 'Can add medical report', 116, 'add_medicalreport'),
(490, 'Can change medical report', 116, 'change_medicalreport'),
(491, 'Can delete medical report', 116, 'delete_medicalreport'),
(492, 'Can view medical report', 116, 'view_medicalreport'),
(493, 'Can add temperature', 117, 'add_temperature'),
(494, 'Can change temperature', 117, 'change_temperature'),
(495, 'Can delete temperature', 117, 'delete_temperature'),
(496, 'Can view temperature', 117, 'view_temperature'),
(497, 'Can add set attendance from api model', 118, 'add_setattendancefromapimodel'),
(498, 'Can change set attendance from api model', 118, 'change_setattendancefromapimodel'),
(499, 'Can delete set attendance from api model', 118, 'delete_setattendancefromapimodel'),
(500, 'Can view set attendance from api model', 118, 'view_setattendancefromapimodel'),
(501, 'Can add accident_ records_employees', 119, 'add_accident_records_employees'),
(502, 'Can change accident_ records_employees', 119, 'change_accident_records_employees'),
(503, 'Can delete accident_ records_employees', 119, 'delete_accident_records_employees'),
(504, 'Can view accident_ records_employees', 119, 'view_accident_records_employees'),
(505, 'Can add accident_ records_others', 120, 'add_accident_records_others'),
(506, 'Can change accident_ records_others', 120, 'change_accident_records_others'),
(507, 'Can delete accident_ records_others', 120, 'delete_accident_records_others'),
(508, 'Can view accident_ records_others', 120, 'view_accident_records_others'),
(509, 'Can add rescu e_ others', 121, 'add_rescue_others'),
(510, 'Can change rescu e_ others', 121, 'change_rescue_others'),
(511, 'Can delete rescu e_ others', 121, 'delete_rescue_others'),
(512, 'Can view rescu e_ others', 121, 'view_rescue_others'),
(513, 'Can add training_attendance', 122, 'add_training_attendance'),
(514, 'Can change training_attendance', 122, 'change_training_attendance'),
(515, 'Can delete training_attendance', 122, 'delete_training_attendance'),
(516, 'Can view training_attendance', 122, 'view_training_attendance'),
(517, 'Can add training_attendance_details', 123, 'add_training_attendance_details'),
(518, 'Can change training_attendance_details', 123, 'change_training_attendance_details'),
(519, 'Can delete training_attendance_details', 123, 'delete_training_attendance_details'),
(520, 'Can view training_attendance_details', 123, 'view_training_attendance_details'),
(521, 'Can add safety', 124, 'add_safety'),
(522, 'Can change safety', 124, 'change_safety'),
(523, 'Can delete safety', 124, 'delete_safety'),
(524, 'Can view safety', 124, 'view_safety'),
(525, 'Can add safety table', 125, 'add_safetytable'),
(526, 'Can change safety table', 125, 'change_safetytable'),
(527, 'Can delete safety table', 125, 'delete_safetytable'),
(528, 'Can view safety table', 125, 'view_safetytable');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$Fvwbi5eeICsP$V0PvK8tkS8i6mIoyWKkcymHO1NPJj5LBaNW9cWc73qs=', '2020-05-08 11:08:20.924311', 1, 'admin1', 'ADMIN', 'ADMIN', 'admin@gmail.com', 1, 1, '2019-10-14 11:04:03.745052'),
(49, 'pbkdf2_sha256$150000$nv8WmbWTvIAO$e3PDkONixM/TGITupKD+1r737gVdm7cBoaWryqWKFTI=', '2019-10-21 15:24:07.884493', 0, 'vikashkisku', 'Vikash', 'Kisku', 'vikashkisku@gmail.com', 0, 1, '2019-10-14 15:54:24.942120'),
(50, 'pbkdf2_sha256$150000$aruyU7jc0G5s$cxYfzo3zDVc3kHdWhrG25OQwBDifSibQG9+AvOCUCNo=', '2019-10-15 09:45:09.548834', 0, 'Dewangshu', '', '', 'Dewangshu@example.com', 0, 1, '2019-10-15 09:44:02.000000'),
(52, 'pbkdf2_sha256$150000$7e9kxPzd3RCu$0zd/phV+ne5kG2vDRvsau22xhPRRdzvPgQyIt0WcULE=', '2019-10-15 09:46:28.381189', 0, 'amit', '', '', 'amit@example.com', 0, 1, '2019-10-15 09:45:51.489156'),
(53, 'pbkdf2_sha256$150000$Ybz9umbRKeoW$501Xr5K7LGXM2zP7NfdhqEQDVf4Td/oQJ6ayDR7d0Z8=', '2019-11-22 10:17:54.735857', 0, 'devwangshu', 'Dew', 'Kumar', 'devwangshu@gmail.com', 0, 1, '2019-10-21 12:24:43.299405'),
(62, 'pbkdf2_sha256$150000$S9lnUqGoo21b$ki1FCGSUN2mhTKQNvulUbPfuvbB/tOUZUy+5CWIuAZ4=', '2020-07-16 15:33:22.205852', 0, 'chaulya', 'Dr S K', 'Chaulya', 'razkumar.dhn@gmail.com', 0, 1, '2020-03-02 12:07:07.528249');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `background_task`
--

CREATE TABLE IF NOT EXISTS `background_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `creator_object_id` int(10) unsigned DEFAULT NULL,
  `creator_content_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `background_task_creator_content_type_61cc9af3_fk_django_co` (`creator_content_type_id`),
  KEY `background_task_task_name_4562d56a` (`task_name`),
  KEY `background_task_task_hash_d8f233bd` (`task_hash`),
  KEY `background_task_priority_88bdbce9` (`priority`),
  KEY `background_task_run_at_7baca3aa` (`run_at`),
  KEY `background_task_queue_1d5f3a40` (`queue`),
  KEY `background_task_attempts_a9ade23d` (`attempts`),
  KEY `background_task_failed_at_b81bba14` (`failed_at`),
  KEY `background_task_locked_by_db7779e3` (`locked_by`),
  KEY `background_task_locked_at_0fb0f225` (`locked_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `background_task`
--

INSERT INTO `background_task` (`id`, `task_name`, `task_params`, `task_hash`, `verbose_name`, `priority`, `run_at`, `repeat`, `repeat_until`, `queue`, `attempts`, `failed_at`, `last_error`, `locked_by`, `locked_at`, `creator_object_id`, `creator_content_type_id`) VALUES
(3, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-16 15:05:46.044818', 0, NULL, NULL, 3, NULL, 'Traceback (most recent call last):\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\background_task\\tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\n  File "D:\\CIMFR\\Git DigitalMine\\digitalmine\\employee\\views.py", line 784, in notify_user\n    medical = MedicalReport.objects.filter(employee_id_id=emp.pk).order_by(''-id'')[0]\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\django\\db\\models\\query.py", line 309, in __getitem__\n    return qs._result_cache[0]\nIndexError: list index out of range\n', NULL, NULL, NULL, NULL),
(4, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-16 15:05:46.149113', 0, NULL, NULL, 3, NULL, 'Traceback (most recent call last):\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\background_task\\tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\n  File "D:\\CIMFR\\Git DigitalMine\\digitalmine\\employee\\views.py", line 784, in notify_user\n    medical = MedicalReport.objects.filter(employee_id_id=emp.pk).order_by(''-id'')[0]\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\django\\db\\models\\query.py", line 309, in __getitem__\n    return qs._result_cache[0]\nIndexError: list index out of range\n', NULL, NULL, NULL, NULL),
(5, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-16 15:05:46.286801', 0, NULL, NULL, 3, NULL, 'Traceback (most recent call last):\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\background_task\\tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\n  File "D:\\CIMFR\\Git DigitalMine\\digitalmine\\employee\\views.py", line 784, in notify_user\n    medical = MedicalReport.objects.filter(employee_id_id=emp.pk).order_by(''-id'')[0]\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\django\\db\\models\\query.py", line 309, in __getitem__\n    return qs._result_cache[0]\nIndexError: list index out of range\n', NULL, NULL, NULL, NULL),
(6, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-16 15:05:46.461814', 0, NULL, NULL, 3, NULL, 'Traceback (most recent call last):\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\background_task\\tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\n  File "D:\\CIMFR\\Git DigitalMine\\digitalmine\\employee\\views.py", line 784, in notify_user\n    medical = MedicalReport.objects.filter(employee_id_id=emp.pk).order_by(''-id'')[0]\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\django\\db\\models\\query.py", line 309, in __getitem__\n    return qs._result_cache[0]\nIndexError: list index out of range\n', NULL, NULL, NULL, NULL),
(7, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-16 15:05:46.599933', 0, NULL, NULL, 3, NULL, 'Traceback (most recent call last):\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\background_task\\tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\n  File "D:\\CIMFR\\Git DigitalMine\\digitalmine\\employee\\views.py", line 784, in notify_user\n    medical = MedicalReport.objects.filter(employee_id_id=emp.pk).order_by(''-id'')[0]\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\django\\db\\models\\query.py", line 309, in __getitem__\n    return qs._result_cache[0]\nIndexError: list index out of range\n', NULL, NULL, NULL, NULL),
(8, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-16 15:05:46.786643', 0, NULL, NULL, 3, NULL, 'Traceback (most recent call last):\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\background_task\\tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\n  File "D:\\CIMFR\\Git DigitalMine\\digitalmine\\employee\\views.py", line 784, in notify_user\n    medical = MedicalReport.objects.filter(employee_id_id=emp.pk).order_by(''-id'')[0]\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\django\\db\\models\\query.py", line 309, in __getitem__\n    return qs._result_cache[0]\nIndexError: list index out of range\n', NULL, NULL, NULL, NULL),
(9, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-16 15:05:46.924342', 0, NULL, NULL, 3, NULL, 'Traceback (most recent call last):\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\background_task\\tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\n  File "D:\\CIMFR\\Git DigitalMine\\digitalmine\\employee\\views.py", line 784, in notify_user\n    medical = MedicalReport.objects.filter(employee_id_id=emp.pk).order_by(''-id'')[0]\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\django\\db\\models\\query.py", line 309, in __getitem__\n    return qs._result_cache[0]\nIndexError: list index out of range\n', NULL, NULL, NULL, NULL),
(10, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-16 15:05:47.112108', 0, NULL, NULL, 3, NULL, 'Traceback (most recent call last):\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\background_task\\tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\n  File "D:\\CIMFR\\Git DigitalMine\\digitalmine\\employee\\views.py", line 784, in notify_user\n    medical = MedicalReport.objects.filter(employee_id_id=emp.pk).order_by(''-id'')[0]\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\django\\db\\models\\query.py", line 309, in __getitem__\n    return qs._result_cache[0]\nIndexError: list index out of range\n', NULL, NULL, NULL, NULL),
(11, 'temp_monitoring.views.run_back_save', '[["192.168.1.11"], {}]', 'fd2f60ebe8170e0ec75daf435e2a50a1439c8ae4', NULL, 0, '2020-07-16 15:04:42.887261', 15, NULL, NULL, 2, NULL, 'Traceback (most recent call last):\n  File "C:\\Users\\DELL\\Envs\\dew_vir_env\\lib\\site-packages\\background_task\\tasks.py", line 43, in bg_runner\n    func(*args, **kwargs)\n  File "D:\\CIMFR\\Git DigitalMine\\digitalmine\\temp_monitoring\\views.py", line 177, in run_back_save\n    print(inst.sensor_value)\nAttributeError: ''temp_monitoring_automatic'' object has no attribute ''sensor_value''\n', '10052', '2020-07-16 15:04:47.028082', NULL, NULL),
(12, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-16 15:12:17.229778', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(13, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-16 15:18:23.732503', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(14, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-16 15:34:22.362463', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `background_task_completedtask`
--

CREATE TABLE IF NOT EXISTS `background_task_completedtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `creator_object_id` int(10) unsigned DEFAULT NULL,
  `creator_content_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `background_task_comp_creator_content_type_21d6a741_fk_django_co` (`creator_content_type_id`),
  KEY `background_task_completedtask_task_name_388dabc2` (`task_name`),
  KEY `background_task_completedtask_task_hash_91187576` (`task_hash`),
  KEY `background_task_completedtask_priority_9080692e` (`priority`),
  KEY `background_task_completedtask_run_at_77c80f34` (`run_at`),
  KEY `background_task_completedtask_queue_61fb0415` (`queue`),
  KEY `background_task_completedtask_attempts_772a6783` (`attempts`),
  KEY `background_task_completedtask_failed_at_3de56618` (`failed_at`),
  KEY `background_task_completedtask_locked_by_edc8a213` (`locked_by`),
  KEY `background_task_completedtask_locked_at_29c62708` (`locked_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `branch_details`
--

CREATE TABLE IF NOT EXISTS `branch_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `branch_nm` varchar(100) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_details_mine_id_id_bfeccba4_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `branch_details`
--

INSERT INTO `branch_details` (`id`, `branch_nm`, `mine_id_id`) VALUES
(1, 'Govindpur Mines', 1),
(2, 'DGMS Mines', 1),
(3, 'Chinakuri Branch1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `category_details`
--

CREATE TABLE IF NOT EXISTS `category_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_category` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `category_details`
--

INSERT INTO `category_details` (`id`, `prod_category`) VALUES
(1, 'IT Products'),
(2, 'Stationery'),
(3, 'Tools'),
(4, 'Apparatus and Equipments');

-- --------------------------------------------------------

--
-- Table structure for table `container_details`
--

CREATE TABLE IF NOT EXISTS `container_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_the_tub` varchar(100) NOT NULL,
  `initial_weight` int(11) DEFAULT NULL,
  `laden_weight` int(11) DEFAULT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `container_details`
--

INSERT INTO `container_details` (`id`, `name_of_the_tub`, `initial_weight`, `laden_weight`, `weight_unit`, `created_date`, `modified_date`) VALUES
(1, 'Tub1', 20, 50, 'Kg', '2019-12-04 14:33:56.045614', '2019-12-04 14:33:56.045614');

-- --------------------------------------------------------

--
-- Table structure for table `deduct_details`
--

CREATE TABLE IF NOT EXISTS `deduct_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `deduct_details`
--

INSERT INTO `deduct_details` (`id`, `deduct_date`, `created_on`, `productDetails_id`, `mine_id`, `branch_id`, `prod_category`, `prod_name`, `barcode`, `batch_number`, `quantity`, `outstock`, `updated_quantity`) VALUES
(1, '2019-11-15', '2019-11-15 00:00:00.000000', 3, '1 (Jharia Coal Mine)', NULL, 'IT Products', 'Acer Computer', 'None', 'Batch123', 3, 2, 1),
(2, '2019-11-15', '2019-11-15 00:00:00.000000', 3, '1 (Jharia Coal Mine)', NULL, 'IT Products', 'Acer Computer', 'None', 'Batch123', 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_annual_annexure_i`
--

CREATE TABLE IF NOT EXISTS `dgms_coalmine_annual_annexure_i` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `mine_name_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dgms_coalmine_annual_mine_name_id_956dd721_fk_MineDetai` (`mine_name_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `dgms_coalmine_annual_annexure_i`
--

INSERT INTO `dgms_coalmine_annual_annexure_i` (`id`, `signature`, `aecm_year`, `mine_vill`, `mine_tehsil`, `mine_dist`, `mine_pin`, `mine_state`, `mine_dop`, `labour_id_no`, `owner_name`, `owner_telephone`, `owner_mobile`, `owner_email`, `owner_vill`, `owner_tehsil`, `owner_dist`, `owner_pin`, `owner_state`, `agent_name`, `agent_telephone`, `agent_mobile`, `agent_email`, `agent_vill`, `agent_tehsil`, `agent_dist`, `agent_pin`, `agent_state`, `manager_name`, `manager_telephone`, `manager_mobile`, `manager_email`, `manager_vill`, `manager_tehsil`, `manager_dist`, `manager_pin`, `manager_state`, `no_of_contractors`, `dept_background_male`, `dept_background_female`, `dept_total_background_male_female`, `cont_background_male`, `cont_background_female`, `cont_background_total_male_female`, `dept_opencast_male`, `dept_opencast_female`, `dept_opencast_total_male_female`, `cont_opencast_male`, `cont_opencast_female`, `cont_opencast_total_male_female`, `dept_aboveground_male`, `dept_aboveground_female`, `dept_aboveground_total_male_female`, `cont_aboveground_male`, `cont_aboveground_female`, `cont_aboveground_total_male_female`, `wbg_number`, `wbg_day`, `am_number`, `am_day`, `dept_tmw_background_male`, `dept_tmw_background_female`, `dept_tmw_background_total_male_female`, `dept_adnpe_background_male`, `dept_adnpe_background_female`, `dept_adnpe_background_total_male_female`, `cont_tmw_background_male`, `cont_tmw_background_female`, `cont_tmw_background_total_male_female`, `cont_adnpe_background_male`, `cont_adnpe_background_female`, `cont_adnpe_background_total_male_female`, `dept_tmw_opencast_male`, `dept_tmw_opencast_female`, `dept_tmw_opencast_total_male_female`, `dept_adnpe_opencast_male`, `dept_adnpe_opencast_female`, `dept_adnpe_opencast_total_male_female`, `cont_tmw_opencast_male`, `cont_tmw_opencast_female`, `cont_tmw_opencast_total_male_female`, `cont_adnpe_opencast_male`, `cont_adnpe_opencast_female`, `cont_adnpe_opencast_total_male_female`, `dept_tmw_aboveground_male`, `dept_tmw_aboveground_female`, `dept_tmw_aboveground_total_male_female`, `dept_adnpe_aboveground_male`, `dept_adnpe_aboveground_female`, `dept_adnpe_aboveground_total_male_female`, `cont_tmw_aboveground_male`, `cont_tmw_aboveground_female`, `cont_tmw_aboveground_total_male_female`, `cont_adnpe_aboveground_male`, `cont_adnpe_aboveground_female`, `cont_adnpe_aboveground_total_male_female`, `no_of_contractors_engaged`, `no_of_shift_worked`, `mh_1`, `mh_2`, `mh_3`, `electrical_background`, `ongs_background`, `comp_air`, `electrical_opencast`, `ongs_opencast`, `comp_air_opencast`, `electrical_aboveground`, `ongs_aboveground`, `comp_air_aboveground`, `total_electrical`, `total_ongs`, `total_comp_air`, `lighting`, `power`, `ime_npe_dept`, `ime_npe_cont`, `ime_npru_dept`, `ime_npru_cont`, `ime_npau_dept`, `ime_npau_cont`, `ime_no_of_p_d_m_unfit`, `pme_npe_dept`, `pme_npe_cont`, `pme_npru_dept`, `pme_npru_cont`, `pme_npau_dept`, `pme_npau_cont`, `pme_no_of_p_d_m_unfit`, `no_of_workmen_req`, `no_of_workmen_provide`, `no_of_satfy_c_meeting_conduct`, `npe_bvt_dept`, `npe_bvt_cont`, `npruvt_bvt_dept`, `npruvt_bvt_cont`, `npauvt_bvt_dept`, `npauvt_bvt_cont`, `npe_rt_dept`, `npe_rt_cont`, `npruvt_rt_dept`, `npruvt_rt_cont`, `npauvt_rt_dept`, `npauvt_rt_cont`, `mine_name_id`) VALUES
(1, 'dgms_annual_report_signature_image/coalmine/Captu1re.jpg', 2018, 'Dhanbad Village/Road/Area', 'Dhanbad Tehsil', 'Dhanbad Dist.', '826001', 'Jharkhand', '1978-02-23', 'LN78834784', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'mohit', '', '0000000000', 'mohit@example.com', 'wb', '', 'jj', '', 'Andra Pradesh', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '2019-10-15', '', '2019-10-15', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_annual_annexure_i_subtable_1`
--

CREATE TABLE IF NOT EXISTS `dgms_coalmine_annual_annexure_i_subtable_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_column_id` int(11) DEFAULT NULL,
  `spem_designation` varchar(100) DEFAULT NULL,
  `spem_no_requried` varchar(100) DEFAULT NULL,
  `spem_no_available` varchar(100) DEFAULT NULL,
  `spem_short_surplus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `dgms_coalmine_annual_annexure_i_subtable_1`
--

INSERT INTO `dgms_coalmine_annual_annexure_i_subtable_1` (`id`, `base_column_id`, `spem_designation`, `spem_no_requried`, `spem_no_available`, `spem_short_surplus`) VALUES
(1, 1, '', '', '', ''),
(2, 1, '', '', '', ''),
(3, 1, '', '', '', ''),
(4, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_annual_annexure_i_subtable_2`
--

CREATE TABLE IF NOT EXISTS `dgms_coalmine_annual_annexure_i_subtable_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `accident_statistics_minor_injured` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dgms_coalmine_annual_annexure_i_subtable_2`
--

INSERT INTO `dgms_coalmine_annual_annexure_i_subtable_2` (`id`, `base_column_id`, `accident_statistics_year`, `accident_statistics_fatal_number`, `accident_statistics_fatal_no_of_persion_killed`, `accident_statistics_fatal_no_of_persion_injured`, `accident_statistics_serious`, `accident_statistics_serious_injured`, `accident_statistics_reportable_number`, `accident_statistics_reportable_injured`, `accident_statistics_minor_number`, `accident_statistics_minor_injured`) VALUES
(1, 1, '', '', '', '', '', '', '', '', '', ''),
(2, 1, '', '', '', '', '', '', '', '', '', ''),
(3, 1, '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_annual_annexure_i_subtable_3`
--

CREATE TABLE IF NOT EXISTS `dgms_coalmine_annual_annexure_i_subtable_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `cre_11` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `dgms_coalmine_annual_annexure_i_subtable_3`
--

INSERT INTO `dgms_coalmine_annual_annexure_i_subtable_3` (`id`, `base_column_id`, `cre_grade`, `cre_2`, `cre_3`, `cre_4`, `cre_5`, `cre_6`, `cre_7`, `cre_8`, `cre_9`, `cre_10`, `cre_11`) VALUES
(1, 1, '', '', '', '', '', '', '', '', '', '', ''),
(2, 1, '', '', '', '', '', '', '', '', '', '', ''),
(3, 1, '', '', '', '', '', '', '', '', '', '', ''),
(4, 1, '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_table_a`
--

CREATE TABLE IF NOT EXISTS `dgms_coalmine_table_a` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `total_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_table_b`
--

CREATE TABLE IF NOT EXISTS `dgms_coalmine_table_b` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_table_c`
--

CREATE TABLE IF NOT EXISTS `dgms_coalmine_table_c` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_table_d`
--

CREATE TABLE IF NOT EXISTS `dgms_coalmine_table_d` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_coalmine_table_e`
--

CREATE TABLE IF NOT EXISTS `dgms_coalmine_table_e` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_first_schedule_form_iii`
--

CREATE TABLE IF NOT EXISTS `dgms_first_schedule_form_iii` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `mine_name_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dgms_first_schedule__mine_name_id_bfccbac7_fk_MineDetai` (`mine_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_metelliferousmine_annual_annexure_ii`
--

CREATE TABLE IF NOT EXISTS `dgms_metelliferousmine_annual_annexure_ii` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `mine_name_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dgms_metelliferousmi_mine_name_id_ec88d617_fk_MineDetai` (`mine_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_metelliferousmine_annual_annexure_ii_subtable_1`
--

CREATE TABLE IF NOT EXISTS `dgms_metelliferousmine_annual_annexure_ii_subtable_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_column_id` int(11) DEFAULT NULL,
  `spem_designation` varchar(100) DEFAULT NULL,
  `spem_no_requried` varchar(100) DEFAULT NULL,
  `spem_no_available` varchar(100) DEFAULT NULL,
  `spem_short_surplus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_metelliferousmine_annual_annexure_ii_subtable_2`
--

CREATE TABLE IF NOT EXISTS `dgms_metelliferousmine_annual_annexure_ii_subtable_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `accident_statistics_minor_injured` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_metelliferousmine_annual_annexure_ii_subtable_3`
--

CREATE TABLE IF NOT EXISTS `dgms_metelliferousmine_annual_annexure_ii_subtable_3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `cre_12` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_oilmines_annual_annexure_iii`
--

CREATE TABLE IF NOT EXISTS `dgms_oilmines_annual_annexure_iii` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `mine_name_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dgms_oilmines_annual_mine_name_id_907dd7ba_fk_MineDetai` (`mine_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_oilmines_annual_annexure_iii_subtable_1`
--

CREATE TABLE IF NOT EXISTS `dgms_oilmines_annual_annexure_iii_subtable_1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_column_id` int(11) DEFAULT NULL,
  `spem_designation` varchar(100) DEFAULT NULL,
  `spem_no_requried` varchar(100) DEFAULT NULL,
  `spem_no_available` varchar(100) DEFAULT NULL,
  `spem_short_surplus` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dgms_oilmines_annual_annexure_iii_subtable_2`
--

CREATE TABLE IF NOT EXISTS `dgms_oilmines_annual_annexure_iii_subtable_2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `accident_statistics_minor_injured` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `distribution_details`
--

CREATE TABLE IF NOT EXISTS `distribution_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `distribution_date` date DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL,
  `mine_name` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `prod_category` varchar(100) DEFAULT NULL,
  `prod_name` varchar(100) DEFAULT NULL,
  `batch_number` varchar(100) DEFAULT NULL,
  `assign_quantity` int(11) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `prod_unique_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `distribution_details`
--

INSERT INTO `distribution_details` (`id`, `distribution_date`, `mine_id`, `mine_name`, `branch_name`, `prod_category`, `prod_name`, `batch_number`, `assign_quantity`, `quantity`, `prod_unique_id`) VALUES
(1, '2019-11-15', 1, '1 (Jharia Coal Mine)', 'DGMS Mines', 'IT Products', 'HP Pavilion Computer', 'Batch001', 1, '3 Piece(pc)', 1),
(2, '2019-11-15', 1, '1 (Jharia Coal Mine)', 'Govindpur Mines', 'IT Products', 'Dell Computer', 'Batch100', 4, '8 Piece(pc)', 2),
(3, '2019-11-15', 1, '1 (Jharia Coal Mine)', 'DGMS Mines', 'IT Products', 'Acer Computer', 'Batch123', 1, '1 Piece(pc)', 3),
(4, '2020-03-17', 1, '1 (Jharia Coal Mine)', 'Govindpur Mines', 'IT Products', 'Dell Computer', 'Batch100', 1, '4 Piece(pc)', 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-10-15 09:44:44.180315', '50', 'Dewangshu', 2, '[{"changed": {"fields": ["is_active"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=126 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(39, 'accounts', 'profile_extension'),
(115, 'accounts', 'usersession'),
(1, 'admin', 'logentry'),
(57, 'attendance', 'employeeattendance'),
(118, 'attendance', 'setattendancefromapimodel'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(45, 'background_task', 'completedtask'),
(46, 'background_task', 'task'),
(5, 'contenttypes', 'contenttype'),
(94, 'DGMS_Forms', 'development_permission_model'),
(34, 'DGMS_Forms', 'dgms_coalmine_annual_annexure_i'),
(18, 'DGMS_Forms', 'dgms_coalmine_annual_annexure_i_subtable_1'),
(19, 'DGMS_Forms', 'dgms_coalmine_annual_annexure_i_subtable_2'),
(20, 'DGMS_Forms', 'dgms_coalmine_annual_annexure_i_subtable_3'),
(21, 'DGMS_Forms', 'dgms_coalmine_table_a_model'),
(22, 'DGMS_Forms', 'dgms_coalmine_table_b_model'),
(23, 'DGMS_Forms', 'dgms_coalmine_table_c_model'),
(24, 'DGMS_Forms', 'dgms_coalmine_table_d_model'),
(25, 'DGMS_Forms', 'dgms_coalmine_table_e_model'),
(27, 'DGMS_Forms', 'dgms_metalliferousmines_annual_annexure_ii_subtable_2'),
(28, 'DGMS_Forms', 'dgms_metalliferousmines_annual_annexure_ii_subtable_3'),
(26, 'DGMS_Forms', 'dgms_metalliferousmine_annual_annexure_ii_subtable_1'),
(33, 'DGMS_Forms', 'dgms_metelliferousmine_annual_annexure_ii'),
(32, 'DGMS_Forms', 'dgms_oilmines_annual_annexure_iii'),
(29, 'DGMS_Forms', 'dgms_oilmines_annual_annexure_iii_subtable_1'),
(30, 'DGMS_Forms', 'dgms_oilmines_annual_annexure_iii_subtable_2'),
(95, 'DGMS_Forms', 'extract_or_reduce_pillars_models'),
(31, 'DGMS_Forms', 'first_schedule_form_iii_model'),
(96, 'DGMS_Forms', 'first_schedule_form_v_model'),
(97, 'DGMS_Forms', 'identification_report_of_the_problem_model'),
(98, 'DGMS_Forms', 'metal_mine_extract_permission_model'),
(99, 'DGMS_Forms', 'ventilation_model'),
(88, 'emails', 'emails'),
(7, 'employee', 'employee'),
(93, 'employee', 'employeeshiftassign'),
(116, 'employee', 'medicalreport'),
(89, 'employee', 'minedetails'),
(92, 'employee', 'mineshift'),
(90, 'employee', 'miningrole'),
(113, 'employee', 'rateofminimumwages'),
(91, 'employee', 'sensordata'),
(13, 'employee1', 'employee1'),
(8, 'employee1', 'employeeshiftassign'),
(9, 'employee1', 'minedetails'),
(10, 'employee1', 'mineshift'),
(12, 'employee1', 'miningrole'),
(11, 'employee1', 'sensordata'),
(16, 'FireExp', 'fire_exp_gases'),
(17, 'FireExp', 'gasdb'),
(42, 'gasmonitoring', 'gasmodel'),
(43, 'gasmonitoring_auto', 'gasmodel_auto'),
(48, 'gasmonitoring_wifi', 'areamodel'),
(47, 'gasmonitoring_wifi', 'fire_exp_gaseswifi'),
(49, 'inventory_management', 'alternateprodmodel'),
(56, 'inventory_management', 'branchmodel'),
(50, 'inventory_management', 'categorymodel'),
(51, 'inventory_management', 'deductmodel'),
(52, 'inventory_management', 'distributemodel'),
(55, 'inventory_management', 'productmodel'),
(53, 'inventory_management', 'reordermodel'),
(54, 'inventory_management', 'suppliermodel'),
(14, 'MinersTracking', 'minertracking'),
(15, 'MinersTracking', 'trackingrouter'),
(86, 'news', 'news_bulletin'),
(61, 'ProductionMonitoring', 'container_details'),
(72, 'ProductionMonitoring', 'production_dailydispatch'),
(71, 'ProductionMonitoring', 'production_dailyentry'),
(70, 'ProductionMonitoring', 'production_manualentry'),
(69, 'ProductionMonitoring', 'production_material_waste'),
(68, 'ProductionMonitoring', 'production_monthly'),
(67, 'ProductionMonitoring', 'production_monthlydispatch'),
(66, 'ProductionMonitoring', 'production_tub'),
(65, 'ProductionMonitoring', 'production_vehicle'),
(64, 'ProductionMonitoring', 'production_weighbridge'),
(63, 'ProductionMonitoring', 'production_yearlydispatch'),
(62, 'ProductionMonitoring', 'production_yearlyentry'),
(84, 'project_management', 'todo'),
(124, 'safety', 'safety'),
(125, 'safety', 'safetytable'),
(73, 'sensor', 'arduino'),
(74, 'sensor', 'connection'),
(75, 'sensor', 'gasmodel_auto'),
(76, 'sensor', 'node'),
(81, 'sensor', 'nodesensor'),
(77, 'sensor', 'sensor'),
(79, 'sensor', 'sensordata'),
(78, 'sensor', 'sensor_node'),
(80, 'sensor', 'wireless'),
(6, 'sessions', 'session'),
(114, 'setting', 'notification'),
(100, 'setting', 'setting'),
(110, 'Slope', 'slope_location'),
(111, 'Slope', 'slope_sensor'),
(108, 'Slope', 'slope_sensor_data'),
(109, 'Slope', 'slope_sensor_flag'),
(107, 'SlopMonitoring', 'slop_location'),
(106, 'SlopMonitoring', 'slop_sensor'),
(104, 'SlopMonitoring', 'slop_sensor_data'),
(105, 'SlopMonitoring', 'slop_sensor_flag'),
(85, 'SMS', 'sms_configuration'),
(41, 'snippets', 'comment'),
(40, 'snippets', 'snippet'),
(35, 'Strata', 'strata_location'),
(38, 'Strata', 'strata_sensor'),
(36, 'Strata', 'strata_sensor_data'),
(37, 'Strata', 'strata_sensor_flag'),
(44, 'temp_monitoring', 'homemodel'),
(117, 'temp_monitoring', 'temperature'),
(112, 'temp_monitoring', 'temp_monitoring_automatic'),
(87, 'theme', 'carousal'),
(60, 'Training_Rescue_Accident', 'accident_records'),
(119, 'Training_Rescue_Accident', 'accident_records_employees'),
(120, 'Training_Rescue_Accident', 'accident_records_others'),
(121, 'Training_Rescue_Accident', 'rescue_others'),
(59, 'Training_Rescue_Accident', 'rescue_records'),
(122, 'Training_Rescue_Accident', 'training_attendance'),
(123, 'Training_Rescue_Accident', 'training_attendance_details'),
(58, 'Training_Rescue_Accident', 'training_rescue_accident'),
(82, 'water_level_monitoring', 'water_level_monitoring_data_acquisition_model'),
(83, 'water_level_monitoring', 'water_level_monitoring_model'),
(102, 'wm_test', 'windroseaddsensor'),
(103, 'wm_test', 'windrosedata'),
(101, 'wm_test', 'windrosesetting');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=70 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'employee1', '0001_initial', '2019-10-14 10:59:28.374616'),
(2, 'DGMS_Forms', '0001_initial', '2019-10-14 10:59:37.330862'),
(3, 'FireExp', '0001_initial', '2019-10-14 10:59:41.198100'),
(4, 'MinersTracking', '0001_initial', '2019-10-14 10:59:42.213486'),
(5, 'ProductionMonitoring', '0001_initial', '2019-10-14 10:59:46.931918'),
(6, 'contenttypes', '0001_initial', '2019-10-14 10:59:59.317149'),
(7, 'auth', '0001_initial', '2019-10-14 11:00:00.865056'),
(8, 'SMS', '0001_initial', '2019-10-14 11:00:09.161522'),
(9, 'Strata', '0001_initial', '2019-10-14 11:00:11.258374'),
(10, 'Training_Rescue_Accident', '0001_initial', '2019-10-14 11:00:15.551653'),
(11, 'accounts', '0001_initial', '2019-10-14 11:00:18.195650'),
(12, 'admin', '0001_initial', '2019-10-14 11:00:19.360049'),
(13, 'admin', '0002_logentry_remove_auto_add', '2019-10-14 11:00:20.874580'),
(14, 'admin', '0003_logentry_add_action_flag_choices', '2019-10-14 11:00:20.915360'),
(15, 'attendance', '0001_initial', '2019-10-14 11:00:21.370165'),
(16, 'contenttypes', '0002_remove_content_type_name', '2019-10-14 11:00:22.122803'),
(17, 'auth', '0002_alter_permission_name_max_length', '2019-10-14 11:00:23.433191'),
(18, 'auth', '0003_alter_user_email_max_length', '2019-10-14 11:00:24.349793'),
(19, 'auth', '0004_alter_user_username_opts', '2019-10-14 11:00:24.388387'),
(20, 'auth', '0005_alter_user_last_login_null', '2019-10-14 11:00:25.057653'),
(21, 'auth', '0006_require_contenttypes_0002', '2019-10-14 11:00:25.089131'),
(22, 'auth', '0007_alter_validators_add_error_messages', '2019-10-14 11:00:25.139528'),
(23, 'auth', '0008_alter_user_username_max_length', '2019-10-14 11:00:25.255411'),
(24, 'auth', '0009_alter_user_last_name_max_length', '2019-10-14 11:00:25.409148'),
(25, 'auth', '0010_alter_group_name_max_length', '2019-10-14 11:00:26.412173'),
(26, 'auth', '0011_update_proxy_permissions', '2019-10-14 11:00:26.512473'),
(27, 'background_task', '0001_initial', '2019-10-14 11:00:27.215991'),
(28, 'background_task', '0002_auto_20170927_1109', '2019-10-14 11:00:39.374762'),
(29, 'employee', '0001_initial', '2019-10-14 11:00:39.812174'),
(30, 'gasmonitoring', '0001_initial', '2019-10-14 11:00:40.077726'),
(31, 'gasmonitoring_auto', '0001_initial', '2019-10-14 11:00:40.479880'),
(32, 'gasmonitoring_wifi', '0001_initial', '2019-10-14 11:00:41.106643'),
(33, 'inventory_management', '0001_initial', '2019-10-14 11:00:45.131054'),
(34, 'news', '0001_initial', '2019-10-14 11:00:48.925989'),
(35, 'project_management', '0001_initial', '2019-10-14 11:00:50.466291'),
(36, 'sensor', '0001_initial', '2019-10-14 11:00:53.276347'),
(37, 'sessions', '0001_initial', '2019-10-14 11:00:55.730241'),
(38, 'snippets', '0001_initial', '2019-10-14 11:00:56.599632'),
(39, 'temp_monitoring', '0001_initial', '2019-10-14 11:01:00.461130'),
(40, 'water_level_monitoring', '0001_initial', '2019-10-14 11:01:01.019571'),
(41, 'accounts', '0002_profile_extension_mine_id', '2019-10-14 15:35:30.208832'),
(42, 'hitcount', '0001_initial', '2019-10-14 18:08:30.350273'),
(43, 'hitcount', '0002_index_ip_and_session', '2019-10-14 18:08:33.148261'),
(44, 'employee1', '0002_miningrole_mine', '2019-10-16 09:35:26.538553'),
(45, 'emails', '0001_initial', '2019-10-16 11:50:55.232521'),
(46, 'emails', '0002_emails_subject', '2019-10-16 12:45:08.891129'),
(47, 'emails', '0003_auto_20191016_1454', '2019-10-16 14:54:59.914222'),
(48, 'attendance', '0002_auto_20191022_1115', '2019-10-22 11:16:01.605498'),
(49, 'attendance', '0003_auto_20191022_1116', '2019-10-22 11:16:49.158797'),
(50, 'attendance', '0004_auto_20191022_1118', '2019-10-22 11:18:24.217449'),
(51, 'attendance', '0005_auto_20191022_1120', '2019-10-22 11:20:49.926768'),
(52, 'attendance', '0006_auto_20191022_1123', '2019-10-22 11:23:39.539186'),
(53, 'theme', '0001_initial', '2019-10-29 11:20:53.137432'),
(54, 'setting', '0001_initial', '2020-03-02 10:53:07.189143'),
(55, 'SlopMonitoring', '0001_initial', '2020-03-18 16:20:35.246118'),
(56, 'Slope', '0001_initial', '2020-03-23 15:07:51.883365'),
(57, 'accounts', '0002_usersession', '2020-06-08 15:32:54.323673'),
(58, 'FireExp', '0002_auto_20200714_1138', '2020-07-14 11:42:13.702189'),
(59, 'employee', '0002_auto_20200714_1138', '2020-07-14 11:42:20.094210'),
(60, 'Training_Rescue_Accident', '0002_auto_20200714_1138', '2020-07-14 11:42:37.764389'),
(61, 'attendance', '0002_setattendancefromapimodel', '2020-07-14 11:42:47.762443'),
(62, 'sensor', '0002_auto_20200714_1138', '2020-07-14 11:42:49.325056'),
(63, 'setting', '0002_auto_20200714_1138', '2020-07-14 11:42:49.389549'),
(64, 'temp_monitoring', '0002_auto_20200714_1138', '2020-07-14 11:44:01.765447'),
(65, 'theme', '0002_delete_carousal', '2020-07-14 11:44:01.921434'),
(66, 'wm_test', '0001_initial', '2020-07-14 11:44:38.061818'),
(67, 'safety', '0001_initial', '2020-07-14 12:14:45.590000'),
(68, 'temp_monitoring', '0002_auto_20200716_1256', '2020-07-16 12:57:34.622856'),
(69, 'temp_monitoring', '0002_auto_20200716_1259', '2020-07-16 13:00:58.899244');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('04qp2iq5zqopw78gvbcgofaqabg7zn53', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-27 17:58:10.204800'),
('0dt0d6de3x3nhc54tdhigl4ibni2qxsw', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-14 10:38:11.072262'),
('0e1za7cwrpzcwdbn0xy7a7j3525192fr', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-30 12:03:46.129840'),
('0ef2h2vb8earb61y832kavmxpmjf7s2q', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-03-16 12:10:20.110407'),
('0fyc8kszh1nzzbuyqbirgado3upya5zy', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-18 15:38:39.569651'),
('1pmerwx39kx6ghjpw49ssqsj1h31ihay', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-05 09:38:43.649806'),
('1zb743q8xhxnikfayjevaixuxawflr99', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-19 09:44:39.706817'),
('2giel7z9j69e4uad84phht7k75ximipt', 'YjI4Yzk3ZTg0NGM4Y2ZiZjY2YmI4OTYwMGEyOGRmNDYxOGRjNjE4Mjp7Il9hdXRoX3VzZXJfaWQiOiI1MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjc2Mzk3ZGEwYjIxM2RhZGNmZjc5YjQ5OGI2OWQ2MDJlMzVjZTkwYyJ9', '2019-12-04 10:00:35.096479'),
('2khcrkw4rlbp05o6o7pg3vezuw99yjjw', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-12-19 10:45:35.283445'),
('2npw5oebbk2zh9c9j4953ooet4mkoatv', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-03-27 12:38:08.376195'),
('3894ljmyu1zc4tgwmsm808ggjf7ftwh4', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-14 09:42:47.991762'),
('3ku15usfocdqsm8cax31ej11zxg3hx93', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-06 09:56:45.922763'),
('3okcrs8nx8yb8mos85uguc4hdo63cz0l', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-22 15:55:18.940028'),
('3wi9tt8u4wesenc8ryzdcco5dyht0z18', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-12-09 14:11:27.772928'),
('4maxtlwouhlv96c5s1y5sqs8hvujuzel', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-04 12:26:46.770167'),
('569klxls1iaq88n5xmsr5kpbiltb8ka3', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-29 10:20:48.921726'),
('5bj5ulx33ke4k5k7w0xk9qjtacndfvzy', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-03-31 11:21:36.840816'),
('5cxk5onpdp7anzbifnxujiidn3z2hag9', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-12-25 10:07:59.888502'),
('5yaijacejdizv50fa9pce0xjsul7m43q', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-22 16:13:37.451094'),
('64eg9m0y1xhtsz83khzp12ocl277ymo2', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-26 10:27:36.399583'),
('66v7bdfggj1ffsle8jx7fuscg46cet7z', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-06 17:00:53.745742'),
('6d9ow01y6mvqo2wjga6n4pk37qbcazk0', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-03-27 10:29:26.229091'),
('6hz8n7rcipc7am38akzhxc8h0afxocou', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-03 11:21:40.378221'),
('6q6s3915pqd3v20x5bn8gyzmwg20o15p', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-14 11:08:36.681665'),
('789mj8x9gg5hq4vu2p6gz3nbdu8371ex', 'YjI4Yzk3ZTg0NGM4Y2ZiZjY2YmI4OTYwMGEyOGRmNDYxOGRjNjE4Mjp7Il9hdXRoX3VzZXJfaWQiOiI1MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjc2Mzk3ZGEwYjIxM2RhZGNmZjc5YjQ5OGI2OWQ2MDJlMzVjZTkwYyJ9', '2019-12-05 10:10:04.044452'),
('7emph61v6qa0i0e32vhv66b523898j9j', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-21 10:07:33.571786'),
('7fi4xy2qugb3a10ih7j52nt76n8oz283', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-02 11:39:28.149896'),
('7mxtxpz1a1jw606eo04674n38gtydfdi', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-12-17 10:17:28.202458'),
('9gyha0fnvdp7w354lajfaqf21mtbmlpp', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-10-29 15:35:29.312202'),
('9k2o3al7lvsv1otwoddswsf2usahsmc4', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-29 11:43:05.320548'),
('9k7rw169jv0c19nh0ryuk0cccll0jtyb', 'YzE1ZGEwMjJiMzdhOWM0NTdhODdkZWFkNTdlYTIzNWVkODY5ZTVhODp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyIsImxhbmciOiJlbiIsImlwIjoxMjd9', '2020-05-29 12:24:12.740868'),
('9mw6vmbsookmo0xlfu8c9gzeukwe3uui', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-11 14:04:18.816914'),
('9npthqy1pviobuox7223meacvc28v969', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-10-29 11:18:14.047303'),
('9ui7x1os5obrvw33g7lnt1k11cvpyz8a', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-10 10:15:09.548650'),
('apmtz8kknz65933r89b7t7ducfi2rdbf', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-05-26 12:33:27.698353'),
('aryz0z70yg9w4w47x9k0cxsw9gl1fuev', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-04-07 12:38:53.028901'),
('aw0r09m0accxby582e7hbugdfqbs4vzh', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-07 10:39:46.092358'),
('b5c7wri6rxor4ymislsdpeiikibb1rsn', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-20 10:52:05.582718'),
('bdfxk88v4zncqcw9or5m3iihnoc4i3iw', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-29 10:33:59.177406'),
('bpl5mi0skmjviwpxus42we5eu0nwu996', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-04 10:53:30.892715'),
('csdijq3t6gl4kgul01jbs5fz3mvh6m1y', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-06 15:30:50.382069'),
('csjx0u7zvkdaln5na19v7lff67hmopak', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-03-26 17:03:32.039915'),
('ctet5gutsn535fc7lhkgmvbror634yor', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-28 14:40:29.934419'),
('d74u1xug961lzukqzsdwxlya9dqpnw3t', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-30 15:33:22.265691'),
('dmjmfj0tx2cxs06rzxqrlrzov85v9eya', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-04 12:10:33.745200'),
('dpfnhxrxhyi4dvedvq7u9hpjqw81ytsx', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-13 11:53:59.653554'),
('dr4lif3iljghxf17lfcl5cv3o15ute2q', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-26 12:45:03.772965'),
('dtbbr9swytfn3ie5hdrtef44u6riyxzg', 'YTk4NjlmMTc5ZmExMzM4Zjc0OWYzYzJjODIwYjgyMmY0NWQ0OTliZjp7Il9hdXRoX3VzZXJfaWQiOiI1MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMGRiMjViMWI4Yzk1OTFhNzAwYTJiMjIzMzVhNDgzNDBiZjZhYmQ4MiJ9', '2019-11-14 16:06:08.553426'),
('dwbqh4zzdyhruqw09mqngdwu87bx62sk', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-12 17:55:58.792733'),
('dyqxra0yrht8kl18cgr7gf5g79desyzc', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-29 18:46:52.180872'),
('e2ubfsjhxst086twcia97hn9nyhl4m2m', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-27 10:33:38.582702'),
('eeknlva7bm16exkowue7pth22fn596cb', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-12-16 15:11:36.787707'),
('f4mhqjmx4u6o42m71ljl0mivowco49wk', 'N2VhM2I0NjdjYTliNWNjMzBjNGE3NzIyZWZkNzVjZTFjZGY3YWIzNzp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyIsImlwIjoxMjd9', '2020-07-17 09:50:54.636939'),
('f82lmnok373vdhp781rau3l08zq54ypz', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-28 15:04:38.972236'),
('ff8fijzguvm8b77zjftsbg5viux2uo67', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-27 10:33:10.351369'),
('fktxcc2ml0svglyl8ts13s8snownlcnr', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-06 11:45:26.060350'),
('fp11lz9uzyg2jwjnxmnxlaqxv1l4r2ma', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-14 17:25:32.334513'),
('fr5xn8h9mq6mssnzieu9dn7leiggc9n5', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-03-31 11:21:19.582071'),
('ftxgl20j52z8wmkzeye92tbwg4p4ffqr', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-12 16:24:42.394827'),
('fwz1pzje5ifc25j8e44no2tjbtgi6bp7', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-16 16:12:13.896769'),
('gvrd0bwx949lgr8vkey6u1yayaned03i', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-26 12:17:04.353037'),
('hdjf6855lkhv2az83uedma4r4738segj', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-27 10:34:20.654920'),
('hp29gnua9in6a37vh0l3xwm861kgumrw', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-10-29 11:18:56.658944'),
('i1kj36k0j95b1654wzri9e859edu45t7', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-02 09:57:54.574589'),
('i83wkt41hflxb0tz7xxiwtom08elz5da', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-12-05 11:40:21.669484'),
('is986qv8wmmxayfr5abx83hmeu4dod0q', 'N2VhM2I0NjdjYTliNWNjMzBjNGE3NzIyZWZkNzVjZTFjZGY3YWIzNzp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyIsImlwIjoxMjd9', '2020-07-30 15:01:58.345786'),
('iv8s3yww7f6ziw7bid4bf7urpuva2nd2', 'YTk4NjlmMTc5ZmExMzM4Zjc0OWYzYzJjODIwYjgyMmY0NWQ0OTliZjp7Il9hdXRoX3VzZXJfaWQiOiI1MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMGRiMjViMWI4Yzk1OTFhNzAwYTJiMjIzMzVhNDgzNDBiZjZhYmQ4MiJ9', '2019-11-14 16:42:14.815771'),
('iyrxa4lcbf2aegppgzokh5gcw52eodzh', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-21 10:43:39.630306'),
('j2mgwmxcjuk1qmtvdhegf31j55o1d810', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-28 15:46:20.796295'),
('jj0cpc57bwmxp91fej56hbri9gtbc8cw', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-09 10:51:38.764272'),
('jmjlo3cyu3ztwd7n76ydoqyvizh86pmp', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-29 09:54:11.963823'),
('jztg20whxay50i6cgybwvjmlvjzhx0ev', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-03-27 09:43:15.699891'),
('k8nqv6wcweglrpjwh70jt1sdf1g8eu0l', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-05-11 09:46:49.247126'),
('kfnnio1cho2d32dwbmu461w6lz6zsdiw', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-10-29 15:02:28.589745'),
('klaf89sjszbxa9h6j8gr49bdfn7r5t3h', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-28 11:50:57.017958'),
('ko83v9cvu6rouuqr92l34bvs0igcmoox', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-07 10:22:12.468387'),
('kpbolbf3gn3jf7jgpxquo7zsqzg1fad5', 'MDQyMGZkNzc4YzhkNGRlNGEwZDZhMGJiMGIzMTViMDhhZTRhNGMyYTp7Il9hdXRoX3VzZXJfaWQiOiI0OSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDZhN2Y4ZDEzNDllYzIwMzU5ZWVlNmE0ODRiYTRiMWVjNDRiMzM2MyJ9', '2019-10-29 09:52:59.063204'),
('m93dyc972iplxariregskx6dwr5w5r35', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-12-03 09:52:07.241132'),
('mfobqnvowx3ffszc254fvbw4u863xdym', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-03-04 10:08:34.719003'),
('miqusfczlavh1hz639y6nnws6j1niyjn', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-28 12:32:02.588350'),
('n5gwny0nt4tirbgd0s40cxoac1itspvf', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-03-31 11:37:38.909363'),
('n7z14s6opap80hgrfjx2yish1zwtu2n8', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-31 10:35:15.539934'),
('nc8in3m9wk8r5n6r02xn1dh0qdns4raa', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-03-26 11:41:57.386482'),
('ne8fgvalcm88uq1bj232jsnfye4m81v4', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-01 11:41:59.884944'),
('ntszu1ahxraen81v18lp8ggt364aqkkf', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-04-06 15:23:02.388080'),
('nwrzh5kufpk0rvj3gksugzzqr8arayui', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-04 15:29:19.012735'),
('nxcx7rufr80tt17bgr8snkrn5d50d0l1', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-05-27 10:10:49.210157'),
('o9wg04zj7pqj8ozipw6rdlxpes92rbdo', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-03-26 16:23:54.383754'),
('oc5fmnemsb4y4wypdbjjb560ofwkbcfr', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-12-18 14:32:27.818477'),
('pzj6op5q19kub7xwu8naym0ry0v88ues', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-18 14:57:42.779442'),
('q9vxtau81ej7onnpy4swsh0hrhsgdefd', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-12 12:23:01.702868'),
('qbqagw6zkojbvmk7y8538el6jytd34x5', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-14 10:38:04.287356'),
('qgpcjp76nbsd9rprmxwx1oo1x9tbkovl', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-28 16:54:33.197138'),
('qntoopd29wv5d5tzxxrxsip9pfpoignu', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-12-10 10:45:40.289943'),
('qv2bdua2xfapesdamee9dou54iagtz00', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-10-29 15:05:43.185554'),
('r9wdzh57308v1432p8sthi4yy39a96pn', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-17 09:46:09.310422'),
('rjy1cqj8zzdl8ds498aqccthl7u0llt5', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-28 12:20:21.867505'),
('rv4er07sbfg94688kqsvvdjrwtu9wodm', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-12-24 10:55:43.416135'),
('rvlrieezhobqmuvv7m4gn2s20pnqpmsx', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-02-24 15:53:30.631583'),
('s1bus648hunio49ktfongjaplkod2prc', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-10 12:16:26.226597'),
('scr19tjs0gkqq5f7kj98ck1u3m9ocgxi', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-15 15:46:08.764500'),
('se0ur8ah1iimz0vvgxo7i7p0hheo7c4w', 'YjI4Yzk3ZTg0NGM4Y2ZiZjY2YmI4OTYwMGEyOGRmNDYxOGRjNjE4Mjp7Il9hdXRoX3VzZXJfaWQiOiI1MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjc2Mzk3ZGEwYjIxM2RhZGNmZjc5YjQ5OGI2OWQ2MDJlMzVjZTkwYyJ9', '2019-12-06 10:17:54.817473'),
('sxfdp083szi4j11kcdjnf2jephxmorvc', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-29 10:35:58.425109'),
('tjxtksfpgmg2re3ezah2rnviy7bcin9j', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-01 14:16:42.165199'),
('tnmn1x92irknb54kjcp6cmw3ywbtjiba', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-28 12:36:11.585969'),
('tqod1eq050dh0oa4kr1aw3biji9su2dx', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-03-26 14:07:18.087666'),
('u1xh5qmqd3thytzm6fz9mk10hucqeamk', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-20 10:35:25.906316'),
('ule6wo2e0ngqumsm50fi2kz2v7ejlwc8', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-03-02 14:41:43.290223'),
('vc5p1p6w6uc3g058npo6fknrip79maq9', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-22 10:03:05.418136'),
('vsm23mgwzo1yriq3eve0r4jzz6h2ltvv', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-26 12:05:30.055749'),
('wb6kxe7ftc3gtbopm4r0l4gzsqkp4yl9', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-12-23 14:11:22.520848'),
('wq9ncrq44wt5ryyddixoxmuhjw9pyejr', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-03-31 11:15:11.941173'),
('x9ajcyegqj5g1xpdgc7wed01tojbc7a5', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-03-12 16:33:56.250283'),
('xosuwedoiucv35k0qepyqcwe5o964hi5', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-28 18:02:22.593262'),
('y8hly4x3prby8ov86u2dc2aayypq6jko', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-07-01 12:15:01.981017'),
('y9ktx7u9bp8b5b1s8bjhcmls2x3v6450', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-03-27 09:56:49.415239'),
('ylkt38t0eyw5a2s0bru5bu6hcdkxyvnn', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-06-22 15:33:47.929884'),
('ytvyeb7tcpmhva3ybqyductny8zhcp94', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-09 10:06:19.553461'),
('yz646ghz1qavabe2o9wfkgsos1r2av21', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-05-22 11:08:20.962210'),
('z2vhmfpd9s5ghhdjao9z0hq36qqxnr5w', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-22 15:17:31.008820'),
('z3l8f7i118ug0cf2oxxlm8c6t47id0wi', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2019-11-18 09:34:17.745426'),
('ziger5mdmbgzyw6jdgkp0stvr53bj4sb', 'NjVmNjQzNTMwNDhjZjU1ODc4MDM5YzRmYWM2MGEwMjk3ZjQzMWY5ZDp7Il9hdXRoX3VzZXJfaWQiOiI2MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjJhYzhjZjI3NmIxZTY2Yjk2ZWM2MWVhZGZmMjk5ZDU5Y2YwMjUyNyJ9', '2020-05-25 12:20:26.246011'),
('zjeyxd8wni5w6rmg148pbuuaunqq7ogj', 'ZTM3YjE5MWQyOThmZWJiNjgxMjQwOTI3NWQxNDViMGE3ZTYxNGJlZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmYzRhZDgxMzJlNGY5MTMxYTYyZWZjNTU2NWNiYzgyMmM3YzY5MDU2In0=', '2020-01-24 15:28:12.473917');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE IF NOT EXISTS `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(1000) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `email_to` varchar(1000) DEFAULT NULL,
  `email_from` varchar(1000) DEFAULT NULL,
  `sent_on` datetime(6) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `subject` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emails_user_id_id_5497a9d4_fk_auth_user_id` (`user_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `type`, `email`, `email_to`, `email_from`, `sent_on`, `attachment`, `user_id_id`, `subject`) VALUES
(1, 'primary', 'This is a demo email', 'vikashkisku@gmail.com', 'kiskuvikash@gmail.com', '2019-10-16 00:00:00.000000', NULL, 1, 'Demo Email'),
(2, 'social', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'vikashkisku@gmail.com', 'kiskuvikash@gmail.com', '2019-10-16 13:16:12.109000', NULL, 49, 'Demo Email'),
(3, 'social', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'vikashkisku@gmail.com', 'kiskuvikash@gmail.com', '2019-10-16 13:16:12.109000', NULL, 49, 'Demo Email'),
(4, 'social', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'vikashkisku@gmail.com', 'kiskuvikash@gmail.com', '2019-10-16 13:16:12.109000', NULL, 49, 'Demo Email'),
(5, 'social', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'vikashkisku@gmail.com', 'kiskuvikash@gmail.com', '2019-10-16 13:30:30.109000', NULL, 49, 'Demo Email'),
(6, 'promotion', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'vikashkisku@gmail.com', 'kiskuvikash@gmail.com', '2019-10-16 13:16:12.109000', NULL, 49, 'Demo Email'),
(7, 'promotion', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'vikashkisku@gmail.com', 'kiskuvikash@gmail.com', '2019-10-16 15:25:42.109000', NULL, 49, 'Demo Email'),
(8, 'promotion', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'vikashkisku@gmail.com', 'kiskuvikash@gmail.com', '2019-10-16 13:30:12.109000', NULL, 49, 'Demo Email');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `present_address` varchar(200) DEFAULT NULL,
  `permanent_address` varchar(200) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `mob` varchar(100) DEFAULT NULL,
  `state` varchar(100) NOT NULL,
  `city` longtext NOT NULL,
  `pin` longtext,
  `gender` varchar(128) DEFAULT NULL,
  `marital_status` varchar(128) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `rfid` longtext,
  `designation` longtext,
  `identification_mark` varchar(200) NOT NULL,
  `token_no` longtext,
  `date_of_joining` date DEFAULT NULL,
  `retirement_date` date DEFAULT NULL,
  `job_type` varchar(128) DEFAULT NULL,
  `cat_type` longtext,
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
  `mining_role_id` int(11) DEFAULT NULL,
  `nationality` varchar(100) DEFAULT NULL,
  `signature` varchar(200) DEFAULT NULL,
  `spouse_name` varchar(100) DEFAULT NULL,
  `esic_ip` varchar(20) DEFAULT NULL,
  `lwf` varchar(50) DEFAULT NULL,
  `category_address` varchar(200) DEFAULT NULL,
  `service_book_no` varchar(50) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `date_of_exit` date DEFAULT NULL,
  `reason_of_exit` varchar(50) DEFAULT NULL,
  `uan` varchar(100) DEFAULT NULL,
  `shift_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee1_immediate_staff_id_7751309c_fk_employee1_id` (`immediate_staff_id`),
  KEY `employee1_mine_id_62f5d8a7_fk_MineDetails_id` (`mine_id`),
  KEY `employee1_mining_role_id_0904bb33_fk_MiningRole_id` (`mining_role_id`),
  KEY `employee_shift_id_id_4914bbfb_fk_MineShift_id` (`shift_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `empid`, `name`, `father_name`, `dob`, `present_address`, `permanent_address`, `email`, `mob`, `state`, `city`, `pin`, `gender`, `marital_status`, `photo`, `rfid`, `designation`, `identification_mark`, `token_no`, `date_of_joining`, `retirement_date`, `job_type`, `cat_type`, `is_rescue`, `blood_group`, `medical_status`, `aadhaar_no`, `pan_no`, `voter_id_no`, `medical_ins_no`, `bank_name`, `bank_ac_no`, `bank_ifsc`, `bank_pf_no`, `edu_course_name`, `edu_board_name`, `edu_year`, `edu_percent`, `created_date`, `modified_date`, `immediate_staff_id`, `mine_id`, `mining_role_id`, `nationality`, `signature`, `spouse_name`, `esic_ip`, `lwf`, `category_address`, `service_book_no`, `remarks`, `date_of_exit`, `reason_of_exit`, `uan`, `shift_id_id`) VALUES
(1, 'Example_new', 'Dew Kumar_new', 'Anand Kumar Kumar', '1991-02-15', 'Dhanbad', NULL, 'devwangshu@gmail.com', '7870249601', 'Jharkhand', 'Dhanbad', '826001', 'M', 'M', 'employee_image/img_new_26kb.jpg', 'M007', 'des', '', 'T894654', '2018-06-20', '2018-07-09', 'Regular', 'opencast', 'No', 'A+', 'ok', '999999999999', 'QPK123456', '987654321', '987654321', 'State Bank of India', '12345678945', 'SBIN0001670', '999999999', 'Lorem Ipsum', 'CBSE', '2019', '99.99', '2018-07-04 12:42:18.017876', '2019-10-31 15:46:35.558401', NULL, 1, 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'M002', 'mohit', 'aanand', '2018-07-04', 'wb', NULL, 'mohit@example.com', '0000000000', 'Andra Pradesh', 'jj', '', 'M', 'M', 'employee_image/csir_logo_NRj_icon.ico', 'R687689', '3e2', '', 'T798795', '2018-06-21', '2018-07-09', 'Regular', 'underground', 'No', 'O+', 'OK', '', '', '', '', '', '', '', '', '', '', '', '0.00', '2018-07-04 12:42:18.017876', '2019-10-03 10:48:23.839205', 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'M003', 'Amit Kumar', 'abc', '2018-07-04', 'dhanbad', NULL, 'amit@example.com', '0000000000', 'Andra Pradesh', 'dhanbad', '', 'M', 'M', 'employee_image/miner4_hbtNZna.jpg', 'R673657843659', 'RE', '', 't65869438', '2018-06-27', '2018-07-09', 'Regular', 'underground', 'No', 'B-', 'ok', '', '', '', '', '', '', '', '', '', '', '', '0.00', '2018-07-04 12:42:18.017876', '2018-08-31 06:05:31.663656', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'E001', 'Dr SK Chaulya', 'KK', '1981-07-16', 'CSIR CIMFR DHANBAD', 'CSIR CIMFR DHANBAD', 'razkumar.dhn@gmail.com', '9336969369', 'Jharkhand', 'DHANBAD', '123456', 'M', 'M', 'employee_image/dr_sk_img.jpg', 'M001', 'GM', 'mole on head', 'T001', '2019-01-10', '2033-07-14', 'Regular', 'surface', 'No', 'A+', 'NO ANY DESC..', '1234-5678-9123', '856956895', '7885645235', '89654123658', 'SBI', '89654857856', 'SBIN8473842', '8569578456', 'Mtech', 'IITKGP', '2012', '87.9', '2019-01-10 12:25:51.496436', '2020-07-16 11:28:19.108952', NULL, 8, 11, 'INDIAN', 'employee_image/tt_wSR5ufH.jpg', '', 'ES9463', 'LHF73838', 'HS', '786549258', 'NA', '2027-07-15', 'NA', '7863254856215', 4),
(5, 'E002', 'Bimal Kumar Mandal', 'ss', '2019-01-10', 'Dhanbad', 'Dhanbad', 'bimal@example.com', '1234569870', 'Jharkhand', 'dhn', '826001', 'M', 'M', 'employee_image/bimal_mandal.jpg', 'M002', '', 'MOLE ON FACE', 'T002', '2019-01-10', '2029-07-19', 'Regular', 'underground', 'No', 'A+', '', '', '', '', '', '', '', '', '', 'JHJH', 'JH', '2000', '78', '2019-01-10 12:28:45.005709', '2020-07-16 11:40:29.923720', 4, 8, 12, 'INDIAN', 'employee_image/dew_signature.jpg', '', '45453212545', '498751216546', 'S', '65468465165465', '', NULL, '', '', 4),
(6, 'E003', 'Chandan Kumar', 'ff', '2019-01-10', 'dhnabd', NULL, 'chandan@example.com', '2345678909', 'Jharkhand', 'dhnbad', '826001', 'M', 'M', '', 'M003', '', '', '', '2019-01-10', '2019-01-10', 'Regular', 'underground', 'No', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '2019-01-10 12:32:36.254732', '2020-07-16 11:33:43.160335', 5, 8, 9, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(7, 'E005', 'Dharmendra Kumar', 'jai kishore saw', '2070-10-09', 'chas', NULL, 'dheeru3091@gmail.com', '7531957500', 'Jharkhand', 'dhanbad', '827013', 'M', 'U', '', 'M005', '', '', '', '2019-01-10', '2019-01-10', 'Regular', 'underground', 'No', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '2019-01-10 12:49:03.536442', '2019-01-10 14:32:19.590801', 5, 8, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'E004', 'Naresh Kumar', 'dd', '2019-01-10', 'dhnabd', NULL, 'NARESH@example.com', '2345678909', 'Jharkhand', 'dhnbad', '826001', 'M', 'M', '', 'M004', '', '', '', '2019-01-10', '2019-01-10', 'Regular', 'underground', 'No', 'A+', '', '', '', '', '', '', '', '', '', '', '', '', '', '2019-01-10 14:08:17.708159', '2019-01-10 14:33:13.921604', 7, 8, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'E006', 'Dewangshu Pandit', 'kk', '2019-01-10', 'dhnabd', 'dhnabd', 'devwangshu@gmail.com', '2345678909', 'Jharkhand', 'dhnbad', '826001', 'M', 'M', 'employee_image/img_new_26kb_qmS3b0c.jpg', 'M006', 'na', 'mole mark', '35435435', '2019-01-10', '2022-07-07', 'Regular', 'surface', 'No', 'A+', '24234sf', '3534-5435-3442', '2342352352342', '', '', '', '', '', '', 'mca', 'rac', '5555', '78', '2019-01-10 15:19:45.685773', '2020-07-16 12:53:24.389852', 5, 8, 14, 'INDIAN', 'employee_image/dew_signature_Wo7g7jB.jpg', '', '32523523', '32423423', 'S', '4234235235', '', NULL, '', '', 4),
(10, 'E011', 'Vikash', 'Anand', '1993-10-03', 'Dhanbad', NULL, 'vikashkisku@gmail.com', '9876543210', 'Jharkhand', 'Dhanbad', '826001', 'M', 'U', 'employee_image/Capture_BluN6Cq.JPG', 'R86359345', 'des', '', 'T894654', '2019-10-14', '2019-10-14', 'Regular', 'underground', 'No', 'A+', 'ok', '999999999999', 'QPK123456', '987654321', '987654321', 'State Bank of India', '12345678945', 'SBIN0001670', '999999999', 'Lorem Ipsum', 'CBSE', '2019', '99.99', '2019-10-14 14:04:00.575779', '2019-10-14 14:04:00.662548', 4, 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employeeshiftassign`
--

CREATE TABLE IF NOT EXISTS `employeeshiftassign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id_id` int(11) DEFAULT NULL,
  `assign_date` date NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `shift_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `EmployeeShiftAssign_employee_id_id_93107e43` (`employee_id_id`),
  KEY `EmployeeShiftAssign_shift_id_id_84e1204f_fk_MineShift_id` (`shift_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `employeeshiftassign`
--

INSERT INTO `employeeshiftassign` (`id`, `employee_id_id`, `assign_date`, `created_date`, `modified_date`, `shift_id_id`) VALUES
(1, 1, '2019-10-21', '2019-10-21 00:00:00.000000', '2019-10-21 17:59:03.851807', NULL),
(2, 2, '2019-10-21', '2019-10-21 00:00:00.000000', '2019-10-21 17:59:09.250867', NULL),
(3, 1, '2019-10-22', '2019-10-22 00:00:00.000000', '2019-10-22 14:10:18.089827', NULL),
(4, 4, '2020-03-02', '2020-03-02 00:00:00.000000', '2020-03-02 11:08:14.435321', NULL),
(5, 5, '2020-03-02', '2020-03-02 00:00:00.000000', '2020-03-02 12:08:52.947040', NULL),
(6, 6, '2020-03-02', '2020-03-02 00:00:00.000000', '2020-03-02 12:08:57.633159', NULL),
(7, 7, '2020-03-02', '2020-03-02 00:00:00.000000', '2020-03-02 12:09:02.239703', NULL),
(8, 8, '2020-03-02', '2020-03-02 00:00:00.000000', '2020-03-02 12:09:06.944955', NULL),
(9, 9, '2020-03-02', '2020-03-02 00:00:00.000000', '2020-03-02 12:09:12.760404', NULL),
(10, 4, '2020-07-16', '2020-07-16 00:00:00.000000', '2020-07-16 11:20:35.759599', 4),
(11, 5, '2020-07-16', '2020-07-16 00:00:00.000000', '2020-07-16 11:33:36.396939', 4),
(12, 6, '2020-07-16', '2020-07-16 00:00:00.000000', '2020-07-16 11:33:43.125139', 4),
(13, 9, '2020-07-16', '2020-07-16 00:00:00.000000', '2020-07-16 11:33:55.652544', 4);

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendance`
--

CREATE TABLE IF NOT EXISTS `employee_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `emp_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_attendance_emp_id_id_166c3f10_fk_employee_id` (`emp_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fireexp_area`
--

CREATE TABLE IF NOT EXISTS `fireexp_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(400) DEFAULT NULL,
  `desc` varchar(400) DEFAULT NULL,
  `IpAddress` varchar(200) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FireExp_area_mine_id_id_64af3241_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `fireexp_area`
--

INSERT INTO `fireexp_area` (`id`, `areaName`, `desc`, `IpAddress`, `mine_id_id`) VALUES
(1, 'a1', 'no', '192.168.1.166', 8);

-- --------------------------------------------------------

--
-- Table structure for table `fire_exp_gases`
--

CREATE TABLE IF NOT EXISTS `fire_exp_gases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `fire_exp_gaseswifi`
--

CREATE TABLE IF NOT EXISTS `fire_exp_gaseswifi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `fire_exp_gaseswifi`
--

INSERT INTO `fire_exp_gaseswifi` (`id`, `Area_id`, `o2`, `co`, `ch4`, `co2`, `h2`, `n2`, `c2h4`, `graham_ratio`, `graham_msg`, `young_ratio`, `young_msg`, `coco2_ratio`, `coco2_msg`, `jtr_ratio`, `jtr_msg`, `chra_ratio`, `chra_msg`, `explosm_result`, `date`) VALUES
(1, 1, 55, 89, 8, 8, 51, 67, 280, -238.95824942945364, 'Normal', -21.4793932071419, 'Superficial heating', 1112.5, 'BLAZING FIRE', -1.6646529735534972, 'Indicative of no fire', 11.20562404373058, 'ACTIVE FIRE', 'Impossible mixture', '2019-10-21'),
(2, 1, 23, 60, 98, 101, 204, 216, 94, 175.23364485981307, 'BLAZING FIRE', 294.97663551401865, 'BLAZING FIRE', 59.40594059405941, 'BLAZING FIRE', 2.774532710280374, 'Indicative of timber fire', 8.211437473057178, 'ACTIVE FIRE', 'Impossible mixture', '2019-11-14'),
(3, 1, 2, 68, 37, 26, 211, 3, 184, -5643.153526970954, 'Normal', -2157.6763485477177, 'Superficial heating', 261.53846153846155, 'BLAZING FIRE', -20.12448132780083, 'Indicative of no fire', 6.47378226296097, 'ACTIVE FIRE', 'Impossible mixture', '2020-02-13'),
(4, 1, 91, 60, 103, 27, 136, 229, 15, -197.9218208807521, 'Normal', -89.06481939633845, 'Superficial heating', 222.22222222222223, 'BLAZING FIRE', -1.2535048655780967, 'Indicative of no fire', 10.229830184818931, 'ACTIVE FIRE', 'Impossible mixture', '2020-02-13'),
(5, 1, 67, 54, 99, 138, 175, 124, 308, -158.17223198594024, 'Normal', -404.2179261862917, 'Superficial heating', 39.130434782608695, 'BLAZING FIRE', -3.9469830111306385, 'Indicative of no fire', 10.225356177603276, 'ACTIVE FIRE', 'Impossible mixture', '2020-03-02'),
(6, 1, 3, 99, 18, 117, 53, 27, 280, 2382.671480144404, 'BLAZING FIRE', 2815.884476534296, 'BLAZING FIRE', 84.61538461538461, 'BLAZING FIRE', 42.83995186522262, 'Indicative of timber fire', 21.236836192846877, 'BLAZING FIRE', 'Impossible mixture', '2020-03-02'),
(7, 1, 20, 42, 90, 98, 20, 237, 82, 98.11937857726902, 'BLAZING FIRE', 228.94521668029435, 'BLAZING FIRE', 42.857142857142854, 'BLAZING FIRE', 2.908538722111903, 'Indicative of timber fire', 14.68476213667016, 'ACTIVE FIRE', 'Impossible mixture', '2020-03-02'),
(8, 1, 35, 23, 48, 143, 212, 279, 2, 59.072813663798634, 'BLAZING FIRE', 367.27879799666107, 'BLAZING FIRE', 16.083916083916083, 'BLAZING FIRE', 2.754590984974958, 'Indicative of timber fire', 27.413107992555734, 'BLAZING FIRE', 'Impossible mixture', '2020-03-12'),
(9, 1, 78, 70, 121, 40, 225, 222, 104, -365.15388628064693, 'Normal', -208.65936358894112, 'Superficial heating', 175, 'BLAZING FIRE', -1.8909754825247789, 'Indicative of no fire', 6.446730523727101, 'ACTIVE FIRE', 'Impossible mixture', '2020-03-12');

-- --------------------------------------------------------

--
-- Table structure for table `fire_exp_manual`
--

CREATE TABLE IF NOT EXISTS `fire_exp_manual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o2` double NOT NULL,
  `co` double NOT NULL,
  `ch4` double NOT NULL,
  `co2` double NOT NULL,
  `h2` double NOT NULL,
  `n2` double NOT NULL,
  `c2h4` double NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Fire_Exp_Manual_date_d704d9f4_uniq` (`date`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=157 ;

--
-- Dumping data for table `fire_exp_manual`
--

INSERT INTO `fire_exp_manual` (`id`, `o2`, `co`, `ch4`, `co2`, `h2`, `n2`, `c2h4`, `date`) VALUES
(1, 1, 1, 1, 1, 1, 1, 1, '2020-07-14'),
(2, 2, 2, 2, 2, 2, 2, 2, '2020-07-16'),
(3, 5.16, 1.2, 3.02, 13.91, 0, 0, 0, '2019-09-12'),
(4, 6.01, 1.17, 2.68, 13.21, 0, 0, 0, '2019-09-13'),
(5, 6.25, 1.18, 2.59, 15.4, 0, 0, 0, '2019-09-14'),
(6, 3.5, 1.16, 3.31, 16.65, 0, 0, 0, '2019-09-15'),
(7, 1.78, 1.34, 3.03, 16.65, 0, 0, 0, '2019-09-16'),
(8, 1.86, 1.45, 2.8, 17.05, 0, 0, 0, '2019-09-17'),
(9, 2.07, 1.48, 3.29, 17.17, 0, 0, 0, '2019-09-18'),
(10, 1.99, 1.49, 3.39, 17.37, 0, 0, 0, '2019-09-19'),
(11, 1.79, 1.53, 3.34, 17.56, 0, 0, 0, '2019-09-20'),
(12, 1.6, 1.56, 3.41, 17.76, 0, 0, 0, '2019-09-21'),
(13, 1.76, 1.57, 3.5, 17.87, 0, 0, 0, '2019-09-22'),
(14, 5.08, 1.13, 3.22, 13.12, 3.8, 0, 0, '2019-09-23'),
(15, 5.33, 1.67, 3.73, 15.45, 4.98, 0, 0, '2019-09-24'),
(16, 3.58, 1.26, 4.07, 16.75, 6.32, 0, 0, '2019-09-25'),
(17, 2.85, 1.31, 4.29, 16.7, 5.89, 0, 0, '2019-09-26'),
(18, 2.98, 1.37, 4.36, 16.89, 6.07, 0, 0, '2019-09-27'),
(19, 3.86, 1.44, 4.39, 16.68, 6.64, 0, 0, '2019-09-28'),
(20, 4.68, 1.5, 4.38, 16.45, 6.94, 0, 0, '2019-09-29'),
(21, 5.17, 1.55, 4.38, 16.43, 7.16, 0, 0, '2019-09-30'),
(22, 5.16, 1.54, 4.38, 16.44, 7.1, 0, 0, '2019-10-01'),
(23, 5.11, 1.51, 4.35, 16.54, 6.96, 0, 0, '2019-10-02'),
(24, 4.77, 1.48, 4.4, 16.51, 6.78, 0, 0, '2019-10-03'),
(25, 4.5, 1.4, 4.36, 16.59, 6.43, 0, 0, '2019-10-04'),
(26, 4.29, 1.3, 4.29, 16.66, 6.21, 0, 0, '2019-10-05'),
(27, 4.2, 1.25, 4.26, 16.62, 6.18, 0, 0, '2019-10-06'),
(28, 4.13, 1.2, 4.2, 16.82, 6.06, 0, 0, '2019-10-07'),
(29, 4.04, 1.16, 4.1, 16.9, 5.91, 0, 0, '2019-10-08'),
(30, 3.86, 1.15, 4.11, 17.07, 5.73, 0, 0, '2019-10-09'),
(31, 3.74, 1.17, 4.19, 17.25, 5.7, 0, 0, '2019-10-10'),
(32, 3.5, 1.2, 4.18, 17.28, 5.61, 0, 0, '2019-10-11'),
(33, 3.29, 1.23, 4.2, 17.16, 5.64, 0, 0, '2019-10-12'),
(34, 3.12, 1.25, 4.2, 17.28, 5.6, 0, 0, '2019-10-13'),
(35, 3.03, 1.26, 4.23, 17.37, 5.54, 0, 0, '2019-10-14'),
(36, 2.89, 1.3, 4.3, 17.46, 5.58, 0, 0, '2019-10-15'),
(37, 2.8, 1.3, 4.38, 17.52, 5.68, 0, 0, '2019-10-16'),
(38, 2.53, 1.28, 4.4, 17.33, 5.65, 0, 0, '2019-10-17'),
(39, 2.67, 1.28, 4.3, 17.4, 5.69, 0, 0, '2019-10-18'),
(40, 2.41, 1.29, 4.3, 17.54, 5.64, 0, 0, '2019-10-19'),
(41, 2.3, 1.32, 4.4, 17.74, 5.53, 0, 0, '2019-10-20'),
(42, 2.2, 1.32, 4.4, 17.63, 5.5, 0, 0, '2019-10-21'),
(43, 2.25, 1.32, 4.18, 17.65, 5.57, 0, 0, '2019-10-22'),
(44, 2.59, 1.3, 4.1, 17.34, 5.44, 0, 0, '2019-10-23'),
(45, 2.86, 1.26, 4.1, 16.96, 5.33, 0, 0, '2019-10-24'),
(46, 3.04, 1.22, 4.05, 16.47, 5.25, 0, 0, '2019-10-25'),
(47, 3.04, 1.18, 4, 16.16, 5.09, 0, 0, '2019-10-26'),
(48, 3.15, 1.17, 3.9, 16.05, 5.05, 0, 0, '2019-10-27'),
(49, 3.25, 1.14, 3.9, 15.96, 5.1, 0, 0, '2019-10-28'),
(50, 3.04, 1.12, 3.9, 15.73, 5, 0, 0, '2019-10-29'),
(51, 3.23, 1.08, 3.8, 15.76, 4.83, 0, 0, '2019-10-30'),
(52, 3.35, 1.07, 3.7, 15.65, 4.88, 0, 0, '2019-10-31'),
(53, 4.03, 1.07, 3.6, 15.05, 4.68, 0, 0, '2019-11-01'),
(54, 4.71, 1.05, 3.6, 14.77, 4.47, 0, 0, '2019-11-02'),
(55, 4.99, 1.02, 3.32, 14.37, 4.1, 0, 0, '2019-11-03'),
(56, 5.47, 1.01, 3.3, 14.21, 4.24, 0, 0, '2019-11-04'),
(57, 5.73, 0.99, 3.38, 13.89, 4, 0, 0, '2019-11-05'),
(58, 5.75, 0.99, 3.39, 13.74, 3.95, 0, 0, '2019-11-06'),
(59, 6, 1, 3.27, 13.47, 3.93, 0, 0, '2019-11-07'),
(60, 6.13, 0.98, 3.15, 13.2, 3.8, 0, 0, '2019-11-08'),
(61, 5.95, 0.96, 3.33, 13.31, 3.69, 0, 0, '2019-11-09'),
(62, 5.38, 0.92, 3.4, 13.42, 3.55, 0, 0, '2019-11-10'),
(63, 5.03, 0.89, 3.49, 13.73, 3.7, 0, 0, '2019-11-11'),
(64, 4.78, 0.81, 3.45, 13.83, 3.75, 0, 0, '2019-11-12'),
(65, 4.65, 0.71, 3.5, 13.95, 3.75, 0, 0, '2019-11-13'),
(66, 4.5, 0.68, 3.6, 14.14, 3.88, 0, 0, '2019-11-14'),
(67, 4.36, 0.69, 3.6, 14.47, 3.86, 0, 0, '2019-11-15'),
(68, 4.15, 0.71, 3.55, 14.84, 4.04, 0, 0, '2019-11-16'),
(69, 3.84, 0.72, 3.8, 15.26, 4.05, 0, 0, '2019-11-17'),
(70, 3.56, 0.75, 3.7, 15.73, 4.2, 0, 0, '2019-11-18'),
(71, 3.23, 0.78, 3.6, 15.92, 4.1, 0, 0, '2019-11-19'),
(72, 2.86, 0.81, 3.6, 16.06, 4.25, 0, 0, '2019-11-20'),
(73, 2.75, 0.87, 3.7, 16.24, 4.3, 0, 0, '2019-11-21'),
(74, 2.53, 0.92, 3.7, 15.94, 4.46, 0, 0, '2019-11-22'),
(75, 2.32, 0.92, 3.8, 16.18, 4.63, 0, 0, '2019-11-23'),
(76, 2.06, 1.04, 3.8, 16.36, 4.77, 0, 0, '2019-11-24'),
(77, 2.03, 1.21, 3.71, 16.45, 4.85, 0, 0, '2019-11-25'),
(78, 1.95, 1.27, 3.8, 16.56, 4.77, 0, 0, '2019-11-26'),
(79, 1.9, 1.28, 3.7, 16.85, 4.6, 0, 0, '2019-11-27'),
(80, 1.85, 1.27, 3.56, 17.4, 4.07, 0, 0, '2019-11-28'),
(81, 2.09, 1.27, 3.43, 18.37, 3.45, 0, 0, '2019-11-29'),
(82, 2.23, 1.28, 3.24, 19.22, 3.05, 0, 0, '2019-11-30'),
(83, 2.25, 1.3, 3.18, 20, 2.86, 0, 0, '2019-12-01'),
(84, 2.13, 1.31, 3.1, 21.53, 2.56, 0, 0, '2019-12-02'),
(85, 2.44, 1.3, 3.27, 23.1, 2.03, 0, 0, '2019-12-03'),
(86, 2.25, 1.32, 3.16, 25.05, 1.73, 0, 0, '2019-12-04'),
(87, 2.06, 1.31, 3, 25.51, 1.44, 0, 0, '2019-12-05'),
(88, 2.04, 1.3, 2.97, 25.68, 1.35, 0, 0, '2019-12-06'),
(89, 2.58, 1.29, 2.87, 25.61, 1.33, 0, 0, '2019-12-07'),
(90, 3.69, 1.27, 2.66, 23.6, 1.64, 0, 0, '2019-12-08'),
(91, 4.45, 1.23, 2.44, 20.02, 2.04, 0, 0, '2019-12-09'),
(92, 5.3, 1.18, 2.27, 16.35, 2.18, 0, 0, '2019-12-10'),
(93, 6.88, 1.15, 2.55, 13.84, 2.48, 0, 0, '2019-12-11'),
(94, 7.91, 1.07, 2.3, 12.48, 2.71, 0, 0, '2019-12-12'),
(95, 8.58, 0.98, 2.05, 11.57, 2.82, 0, 0, '2019-12-13'),
(96, 7.82, 0.98, 2.15, 12.01, 2.98, 0, 0, '2019-12-14'),
(97, 6.44, 1.01, 2.46, 13.33, 3.35, 0, 0, '2019-12-15'),
(98, 5.35, 1.03, 2.94, 14.07, 3.55, 0, 0, '2019-12-16'),
(99, 3.84, 1.02, 3.05, 14.65, 3.52, 0, 0, '2019-12-17'),
(100, 2.88, 1.03, 3.58, 14.84, 3.64, 0, 0, '2019-12-18'),
(101, 2.77, 1.07, 3.45, 14.7, 3.85, 0, 0, '2019-12-19'),
(102, 3.31, 1.17, 3.4, 14.71, 4.14, 0, 0, '2019-12-20'),
(103, 3.67, 1.27, 3.18, 13.8, 4.51, 0, 0, '2019-12-21'),
(104, 4.14, 1.31, 2.84, 13.12, 4.79, 0, 0, '2019-12-22'),
(105, 5.14, 1.31, 2.79, 12.25, 5.06, 0, 0, '2019-12-23'),
(106, 5.26, 1.4, 2.93, 12.65, 5.59, 0, 0, '2019-12-24'),
(107, 4.88, 1.49, 3.15, 14.33, 6.09, 0, 0, '2019-12-25'),
(108, 4.55, 1.6, 3.34, 15.79, 6.38, 0, 0, '2019-12-26'),
(109, 4.93, 1.61, 3.25, 15.61, 6.26, 0, 0, '2019-12-27'),
(110, 5.58, 1.6, 2.86, 15.05, 5.87, 0, 0, '2019-12-28'),
(111, 6.24, 1.54, 2.42, 14.35, 5.24, 0, 0, '2019-12-29'),
(112, 6.75, 1.47, 2.15, 13.85, 4.93, 0, 0, '2019-12-30'),
(113, 7.06, 1.34, 1.95, 13.35, 4.35, 0, 0, '2019-12-31'),
(114, 7.38, 1.28, 1.96, 12.87, 3.86, 0, 0, '2020-01-01'),
(115, 7.91, 1.19, 1.77, 12.35, 3.55, 0, 0, '2020-01-02'),
(116, 8.44, 1.04, 1.8, 11.75, 3.35, 0, 0, '2020-01-03'),
(117, 8.35, 0.96, 1.8, 11.33, 3.36, 0, 0, '2020-01-04'),
(118, 7.99, 0.97, 1.9, 11.54, 3.5, 0, 0, '2020-01-05'),
(119, 7.45, 0.99, 1.9, 11.66, 3.6, 0, 0, '2020-01-06'),
(120, 7, 0.98, 1.96, 11.8, 3.7, 0, 0, '2020-01-07'),
(121, 6.49, 1.02, 2.15, 12.15, 3.86, 0, 0, '2020-01-08'),
(122, 6.15, 1.03, 2.26, 12.43, 3.9, 0, 0, '2020-01-09'),
(123, 5.88, 1.06, 2.1, 12.65, 4.06, 0, 0, '2020-01-10'),
(124, 5.63, 1.09, 2.34, 12.84, 4.2, 0, 0, '2020-01-11'),
(125, 5.46, 1.11, 2.55, 12.66, 4.1, 0, 0, '2020-01-12'),
(126, 4.97, 1.16, 2.66, 12.79, 4.25, 0, 0, '2020-01-13'),
(127, 4.4, 1.2, 2.8, 13.04, 4.55, 0, 0, '2020-01-14'),
(128, 4.06, 1.22, 2.9, 13.39, 4.7, 0, 0, '2020-01-15'),
(129, 3.82, 1.25, 2.77, 13.65, 4.83, 0, 0, '2020-01-16'),
(130, 3.56, 1.26, 2.65, 13.8, 5.04, 0, 0, '2020-01-17'),
(131, 3.35, 1.3, 2.77, 13.84, 5.04, 0, 0, '2020-01-18'),
(132, 3.25, 1.33, 2.85, 14.05, 5.23, 0, 0, '2020-01-19'),
(133, 3.06, 1.36, 3, 14.21, 5.3, 0, 0, '2020-01-20'),
(134, 2.85, 1.38, 3, 14.34, 5.37, 0, 0, '2020-01-21'),
(135, 2.65, 1.38, 3.13, 14.5, 5.44, 0, 0, '2020-01-22'),
(136, 2.45, 1.4, 3.1, 14.6, 5.53, 0, 0, '2020-01-23'),
(137, 2.43, 1.38, 3.14, 14.73, 5.65, 0, 0, '2020-01-24'),
(138, 2.14, 1.38, 3.25, 14.94, 5.6, 0, 0, '2020-01-25'),
(139, 2.09, 1.4, 3.1, 15.06, 5.67, 0, 0, '2020-01-26'),
(140, 2, 1.42, 3.26, 15.23, 5.54, 0, 0, '2020-01-27'),
(141, 1.9, 1.42, 3.18, 15.38, 5.5, 0, 0, '2020-01-28'),
(142, 1.83, 1.42, 3.2, 15.4, 5.43, 0, 0, '2020-01-29'),
(143, 1.83, 1.42, 3.28, 15.38, 5.4, 0, 0, '2020-01-30'),
(144, 1.85, 1.43, 3.13, 15.64, 5.5, 0, 0, '2020-01-31'),
(145, 2, 1.41, 3.3, 16.5, 5.6, 0, 0, '2020-02-01'),
(146, 2.1, 1.41, 3.5, 16.44, 5.25, 0, 0, '2020-02-02'),
(147, 2.25, 1.37, 3.73, 16.13, 5.78, 0, 0, '2020-02-03'),
(148, 2.3, 1.35, 3.57, 15.57, 6, 0, 0, '2020-02-04'),
(149, 2.25, 1.31, 3.36, 14.96, 6.14, 0, 0, '2020-02-05'),
(150, 2.33, 1.34, 3.07, 14.33, 6, 0, 0, '2020-02-06'),
(151, 2.35, 1.36, 2.94, 13.96, 5.87, 0, 0, '2020-02-07'),
(152, 2.3, 1.38, 2.77, 13.3, 5.66, 0, 0, '2020-02-08'),
(153, 2.2, 1.37, 2.57, 12.95, 6.14, 0, 0, '2020-02-09'),
(154, 2.34, 1.37, 2.64, 14.25, 5.93, 0, 0, '2020-02-10'),
(155, 2.4, 1.39, 2.88, 15.05, 5.65, 0, 0, '2020-02-11'),
(156, 2.4, 1.41, 3.11, 15.55, 5.51, 0, 0, '2020-02-12');

-- --------------------------------------------------------

--
-- Table structure for table `gasmodel_auto`
--

CREATE TABLE IF NOT EXISTS `gasmodel_auto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mine_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `sensor_name` varchar(10) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `sensor_value` double DEFAULT NULL,
  `date_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=187 ;

--
-- Dumping data for table `gasmodel_auto`
--

INSERT INTO `gasmodel_auto` (`id`, `mine_id`, `node_id`, `sensor_name`, `sensor_id`, `sensor_value`, `date_time`) VALUES
(1, 8, 16, 'CH4', 16, 208, '2020-06-08 16:10:45.641858'),
(2, 8, 2, 'CH4', 4, 208, '2020-06-08 16:11:08.833267'),
(3, 8, 2, 'CO', 17, 208, '2020-06-08 16:11:10.355930'),
(4, 8, 16, 'CH4', 16, 208, '2020-06-08 16:11:12.075388'),
(5, 8, 2, 'CH4', 4, 208, '2020-06-08 16:11:13.902528'),
(6, 8, 2, 'CO', 17, 209, '2020-06-08 16:11:15.718212'),
(7, 8, 16, 'CH4', 16, 208, '2020-06-08 16:11:17.769186'),
(8, 8, 16, 'CH4', 16, 208, '2020-06-08 16:11:24.852072'),
(9, 8, 16, 'CH4', 16, 208, '2020-06-08 16:11:30.899506'),
(10, 8, 16, 'CH4', 16, 208, '2020-06-08 16:11:37.157617'),
(11, 8, 16, 'CH4', 16, 208, '2020-06-08 16:11:43.137555'),
(12, 8, 16, 'CH4', 16, 209, '2020-06-08 16:11:49.222446'),
(13, 8, 16, 'CH4', 16, 209, '2020-06-08 16:11:50.262982'),
(14, 8, 16, 'CH4', 16, 208, '2020-06-08 16:11:57.336691'),
(15, 8, 16, 'CH4', 16, 208, '2020-06-08 16:12:03.381556'),
(16, 8, 16, 'CH4', 16, 208, '2020-06-08 16:12:09.539859'),
(17, 8, 16, 'CH4', 16, 209, '2020-06-08 16:12:16.673624'),
(18, 8, 16, 'CH4', 16, 208, '2020-06-08 16:12:22.590129'),
(19, 8, 16, 'CH4', 16, 208, '2020-06-08 16:12:28.691899'),
(20, 8, 16, 'CH4', 16, 208, '2020-06-08 16:12:34.832407'),
(21, 8, 16, 'CH4', 16, 208, '2020-06-08 16:12:40.886432'),
(22, 8, 16, 'CH4', 16, 208, '2020-06-08 16:12:46.942161'),
(23, 8, 16, 'CH4', 16, 209, '2020-06-08 16:12:54.319714'),
(24, 8, 16, 'CH4', 16, 208, '2020-06-08 16:12:55.153552'),
(25, 8, 16, 'CH4', 16, 209, '2020-06-08 16:13:02.292745'),
(26, 8, 16, 'CH4', 16, 208, '2020-06-08 16:13:08.272070'),
(27, 8, 16, 'CH4', 16, 208, '2020-06-08 16:13:17.648436'),
(28, 8, 16, 'CH4', 16, 209, '2020-06-08 16:13:23.482190'),
(29, 8, 16, 'CH4', 16, 209, '2020-06-08 16:13:29.569036'),
(30, 8, 16, 'CH4', 16, 208, '2020-06-08 16:13:35.691043'),
(31, 8, 16, 'CH4', 16, 208, '2020-06-08 16:13:41.740297'),
(32, 8, 16, 'CH4', 16, 209, '2020-06-08 16:13:47.849573'),
(33, 8, 16, 'CH4', 16, 208, '2020-06-08 16:13:53.864163'),
(34, 8, 16, 'CH4', 16, 208, '2020-06-08 16:14:00.039208'),
(35, 8, 16, 'CH4', 16, 208, '2020-06-08 16:14:06.143200'),
(36, 8, 16, 'CH4', 16, 208, '2020-06-08 16:14:12.166479'),
(37, 8, 16, 'CH4', 16, 208, '2020-06-08 16:14:18.287851'),
(38, 8, 16, 'CH4', 16, 209, '2020-06-08 16:14:24.446345'),
(39, 8, 16, 'CH4', 16, 208, '2020-06-08 16:14:30.501394'),
(40, 8, 16, 'CH4', 16, 209, '2020-06-08 16:14:36.488582'),
(41, 8, 16, 'CH4', 16, 208, '2020-06-08 16:14:42.609485'),
(42, 8, 16, 'CH4', 16, 208, '2020-06-08 16:14:48.703911'),
(43, 8, 16, 'CH4', 16, 208, '2020-06-08 16:14:54.802082'),
(44, 8, 16, 'CH4', 16, 209, '2020-06-08 16:15:02.145867'),
(45, 8, 16, 'CH4', 16, 208, '2020-06-08 16:15:07.988209'),
(46, 8, 16, 'CH4', 16, 209, '2020-06-08 16:15:14.038117'),
(47, 8, 16, 'CH4', 16, 208, '2020-06-08 16:15:20.099626'),
(48, 8, 16, 'CH4', 16, 209, '2020-06-08 16:15:26.207240'),
(49, 8, 16, 'CH4', 16, 208, '2020-06-08 16:15:32.302909'),
(50, 8, 16, 'CH4', 16, 209, '2020-06-08 16:15:38.535530'),
(51, 8, 16, 'CH4', 16, 208, '2020-06-08 16:15:44.500148'),
(52, 8, 16, 'CH4', 16, 208, '2020-06-08 16:15:50.603223'),
(53, 8, 16, 'CH4', 16, 209, '2020-06-08 16:15:56.657016'),
(54, 8, 16, 'CH4', 16, 209, '2020-06-08 16:16:02.775404'),
(55, 8, 16, 'CH4', 16, 209, '2020-06-08 16:16:08.876841'),
(56, 8, 16, 'CH4', 16, 208, '2020-06-08 16:16:14.886151'),
(57, 8, 16, 'CH4', 16, 209, '2020-06-08 16:16:20.915338'),
(58, 8, 16, 'CH4', 16, 207, '2020-06-08 16:16:27.065781'),
(59, 8, 16, 'CH4', 16, 208, '2020-06-08 16:16:33.173493'),
(60, 8, 16, 'CH4', 16, 208, '2020-06-08 16:16:39.378885'),
(61, 8, 16, 'CH4', 16, 208, '2020-06-08 16:16:45.299010'),
(62, 8, 16, 'CH4', 16, 207, '2020-06-08 16:16:51.369429'),
(63, 8, 16, 'CH4', 16, 208, '2020-06-08 16:16:57.507435'),
(64, 8, 16, 'CH4', 16, 207, '2020-06-08 16:17:03.564075'),
(65, 8, 16, 'CH4', 16, 208, '2020-06-08 16:17:09.627173'),
(66, 8, 16, 'CH4', 16, 209, '2020-06-08 16:17:15.702196'),
(67, 8, 16, 'CH4', 16, 209, '2020-06-08 16:17:21.915419'),
(68, 8, 16, 'CH4', 16, 208, '2020-06-08 16:17:27.854440'),
(69, 8, 16, 'CH4', 16, 208, '2020-06-08 16:17:33.993310'),
(70, 8, 16, 'CH4', 16, 208, '2020-06-08 16:17:40.054811'),
(71, 8, 16, 'CH4', 16, 208, '2020-06-08 16:17:46.129087'),
(72, 8, 16, 'CH4', 16, 208, '2020-06-08 16:17:52.241437'),
(73, 8, 2, 'CH4', 4, 172, '2020-07-14 12:04:04.356804'),
(74, 8, 2, 'CO', 17, 172, '2020-07-14 12:04:05.201051'),
(75, 8, 3, 'CO2', 5, 114, '2020-07-16 14:22:00.248348'),
(76, 8, 16, 'CH4', 16, 110, '2020-07-16 14:22:12.764935'),
(77, 8, 2, 'CH4', 4, 117, '2020-07-16 14:22:41.190687'),
(78, 8, 2, 'CO', 17, 112, '2020-07-16 14:24:22.099981'),
(79, 8, 3, 'CO2', 5, 112, '2020-07-16 14:25:06.742102'),
(80, 8, 16, 'CH4', 16, 111, '2020-07-16 14:25:18.599222'),
(81, 8, 2, 'CH4', 4, 110, '2020-07-16 14:25:49.011098'),
(82, 8, 2, 'CO', 17, 104, '2020-07-16 14:26:04.426610'),
(83, 8, 3, 'CO2', 5, 110, '2020-07-16 14:27:13.262551'),
(84, 8, 16, 'CH4', 16, 110, '2020-07-16 14:27:50.307385'),
(85, 8, 2, 'CH4', 4, 112, '2020-07-16 14:28:00.044861'),
(86, 8, 2, 'CO', 17, 111, '2020-07-16 14:28:02.407923'),
(87, 8, 3, 'CO2', 5, 111, '2020-07-16 14:28:55.898168'),
(88, 8, 16, 'CH4', 16, 111, '2020-07-16 14:29:11.076211'),
(89, 8, 2, 'CH4', 4, 117, '2020-07-16 14:29:15.050767'),
(90, 8, 2, 'CO', 17, 104, '2020-07-16 14:29:19.098569'),
(91, 8, 3, 'CO2', 5, 112, '2020-07-16 14:30:17.688439'),
(92, 8, 16, 'CH4', 16, 110, '2020-07-16 14:30:25.833230'),
(93, 8, 2, 'CH4', 4, 118, '2020-07-16 14:30:29.838728'),
(94, 8, 2, 'CO', 17, 112, '2020-07-16 14:30:38.183488'),
(95, 8, 3, 'CO2', 5, 112, '2020-07-16 14:31:13.406363'),
(96, 8, 16, 'CH4', 16, 111, '2020-07-16 14:31:21.456270'),
(97, 8, 2, 'CH4', 4, 111, '2020-07-16 14:31:25.431183'),
(98, 8, 2, 'CO', 17, 111, '2020-07-16 14:31:29.538859'),
(99, 8, 3, 'CO2', 5, 112, '2020-07-16 14:32:05.913637'),
(100, 8, 2, 'CH4', 4, 111, '2020-07-16 14:32:09.928781'),
(101, 8, 16, 'CH4', 16, 111, '2020-07-16 14:32:13.971131'),
(102, 8, 2, 'CO', 17, 104, '2020-07-16 14:32:18.155384'),
(103, 8, 3, 'CO2', 5, 110, '2020-07-16 14:32:54.466715'),
(104, 8, 2, 'CH4', 4, 102, '2020-07-16 14:32:58.537267'),
(105, 8, 2, 'CO', 17, 111, '2020-07-16 14:33:02.470187'),
(106, 8, 16, 'CH4', 16, 105, '2020-07-16 14:33:06.564636'),
(107, 8, 3, 'CO2', 5, 110, '2020-07-16 14:33:42.903340'),
(108, 8, 2, 'CH4', 4, 104, '2020-07-16 14:33:46.961190'),
(109, 8, 2, 'CO', 17, 104, '2020-07-16 14:33:51.098059'),
(110, 8, 16, 'CH4', 16, 110, '2020-07-16 14:33:55.044308'),
(111, 8, 2, 'CH4', 4, 110, '2020-07-16 14:34:31.426368'),
(112, 8, 2, 'CO', 17, 112, '2020-07-16 14:34:35.423079'),
(113, 8, 3, 'CO2', 5, 112, '2020-07-16 14:34:39.476777'),
(114, 8, 16, 'CH4', 16, 104, '2020-07-16 14:34:43.651575'),
(115, 8, 2, 'CH4', 4, 104, '2020-07-16 14:35:19.941926'),
(116, 8, 2, 'CO', 17, 106, '2020-07-16 14:35:23.975399'),
(117, 8, 3, 'CO2', 5, 104, '2020-07-16 14:35:27.999624'),
(118, 8, 16, 'CH4', 16, 110, '2020-07-16 14:35:33.491518'),
(119, 8, 2, 'CH4', 4, 109, '2020-07-16 14:36:10.425987'),
(120, 8, 2, 'CO', 17, 116, '2020-07-16 14:36:14.626523'),
(121, 8, 3, 'CO2', 5, 111, '2020-07-16 14:36:18.492607'),
(122, 8, 16, 'CH4', 16, 104, '2020-07-16 14:36:22.615911'),
(123, 8, 2, 'CH4', 4, 111, '2020-07-16 14:37:03.103003'),
(124, 8, 2, 'CO', 17, 112, '2020-07-16 14:37:07.033828'),
(125, 8, 3, 'CO2', 5, 112, '2020-07-16 14:37:11.169149'),
(126, 8, 16, 'CH4', 16, 112, '2020-07-16 14:37:15.166254'),
(127, 8, 2, 'CH4', 4, 112, '2020-07-16 14:37:51.487780'),
(128, 8, 2, 'CO', 17, 114, '2020-07-16 14:37:55.562860'),
(129, 8, 3, 'CO2', 5, 104, '2020-07-16 14:37:59.629808'),
(130, 8, 16, 'CH4', 16, 104, '2020-07-16 14:38:03.683031'),
(131, 8, 2, 'CH4', 4, 103, '2020-07-16 14:38:40.036360'),
(132, 8, 2, 'CO', 17, 109, '2020-07-16 14:38:44.103714'),
(133, 8, 3, 'CO2', 5, 112, '2020-07-16 14:38:48.111397'),
(134, 8, 16, 'CH4', 16, 111, '2020-07-16 14:38:52.140850'),
(135, 8, 2, 'CH4', 4, 111, '2020-07-16 14:39:28.544495'),
(136, 8, 2, 'CO', 17, 110, '2020-07-16 14:39:32.527049'),
(137, 8, 3, 'CO2', 5, 112, '2020-07-16 14:39:36.590791'),
(138, 8, 16, 'CH4', 16, 104, '2020-07-16 14:39:40.793579'),
(139, 8, 2, 'CH4', 4, 110, '2020-07-16 14:40:17.306408'),
(140, 8, 2, 'CO', 17, 110, '2020-07-16 14:40:21.104866'),
(141, 8, 3, 'CO2', 5, 110, '2020-07-16 14:40:25.110480'),
(142, 8, 16, 'CH4', 16, 118, '2020-07-16 14:40:29.179744'),
(143, 8, 2, 'CH4', 4, 110, '2020-07-16 14:41:04.579334'),
(144, 8, 2, 'CO', 17, 111, '2020-07-16 14:41:11.971073'),
(145, 8, 3, 'CO2', 5, 115, '2020-07-16 14:41:15.633465'),
(146, 8, 16, 'CH4', 16, 110, '2020-07-16 14:41:19.680469'),
(147, 8, 2, 'CH4', 4, 120, '2020-07-16 14:41:57.224284'),
(148, 8, 2, 'CO', 17, 109, '2020-07-16 14:42:00.087115'),
(149, 8, 3, 'CO2', 5, 111, '2020-07-16 14:42:04.197893'),
(150, 8, 16, 'CH4', 16, 109, '2020-07-16 14:42:08.273837'),
(151, 8, 2, 'CH4', 4, 112, '2020-07-16 14:42:43.578439'),
(152, 8, 2, 'CO', 17, 110, '2020-07-16 14:42:47.888428'),
(153, 8, 3, 'CO2', 5, 111, '2020-07-16 14:42:51.647212'),
(154, 8, 16, 'CH4', 16, 103, '2020-07-16 14:42:56.253550'),
(155, 8, 2, 'CH4', 4, 105, '2020-07-16 14:43:34.077398'),
(156, 8, 2, 'CO', 17, 115, '2020-07-16 14:43:38.118557'),
(157, 8, 3, 'CO2', 5, 111, '2020-07-16 14:43:42.127310'),
(158, 8, 16, 'CH4', 16, 111, '2020-07-16 14:43:47.260836'),
(159, 8, 2, 'CH4', 4, 111, '2020-07-16 14:44:24.628693'),
(160, 8, 2, 'CO', 17, 103, '2020-07-16 14:44:28.659484'),
(161, 8, 3, 'CO2', 5, 110, '2020-07-16 14:44:32.701096'),
(162, 8, 16, 'CH4', 16, 111, '2020-07-16 14:44:36.734960'),
(163, 8, 2, 'CH4', 4, 104, '2020-07-16 14:45:13.093570'),
(164, 8, 2, 'CO', 17, 105, '2020-07-16 14:45:17.109538'),
(165, 8, 3, 'CO2', 5, 111, '2020-07-16 14:45:21.218631'),
(166, 8, 16, 'CH4', 16, 103, '2020-07-16 14:45:26.447712'),
(167, 8, 2, 'CH4', 4, 111, '2020-07-16 14:46:02.751106'),
(168, 8, 2, 'CO', 17, 110, '2020-07-16 14:46:06.674757'),
(169, 8, 3, 'CO2', 5, 110, '2020-07-16 14:46:10.733361'),
(170, 8, 16, 'CH4', 16, 106, '2020-07-16 14:46:14.866345'),
(171, 8, 2, 'CH4', 4, 110, '2020-07-16 14:46:51.500126'),
(172, 8, 2, 'CO', 17, 116, '2020-07-16 14:46:54.132374'),
(173, 8, 3, 'CO2', 5, 111, '2020-07-16 14:46:58.216080'),
(174, 8, 16, 'CH4', 16, 111, '2020-07-16 14:47:02.340551'),
(175, 8, 2, 'CH4', 4, 103, '2020-07-16 14:47:38.657033'),
(176, 8, 2, 'CO', 17, 111, '2020-07-16 14:47:42.756901'),
(177, 8, 3, 'CO2', 5, 116, '2020-07-16 14:47:46.889485'),
(178, 8, 16, 'CH4', 16, 110, '2020-07-16 14:47:51.823463'),
(179, 8, 2, 'CH4', 4, 110, '2020-07-16 14:48:27.206665'),
(180, 8, 2, 'CO', 17, 114, '2020-07-16 14:48:31.206322'),
(181, 8, 3, 'CO2', 5, 103, '2020-07-16 14:48:35.472779'),
(182, 8, 16, 'CH4', 16, 110, '2020-07-16 14:48:39.346216'),
(183, 8, 2, 'CH4', 4, 102, '2020-07-16 14:49:15.728331'),
(184, 8, 2, 'CO', 17, 111, '2020-07-16 14:49:19.943305'),
(185, 8, 3, 'CO2', 5, 106, '2020-07-16 14:49:23.805524'),
(186, 8, 16, 'CH4', 16, 112, '2020-07-16 14:49:27.888495');

-- --------------------------------------------------------

--
-- Table structure for table `gasmonitoring_auto`
--

CREATE TABLE IF NOT EXISTS `gasmonitoring_auto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `dt` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `gasmonitoring_manual`
--

CREATE TABLE IF NOT EXISTS `gasmonitoring_manual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `dt` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `gasmonitoring_manual`
--

INSERT INTO `gasmonitoring_manual` (`id`, `CH4`, `CH4_ALERT`, `CO`, `CO_ALERT`, `CO2`, `CO2_ALERT`, `O2`, `O2_ALERT`, `H2S`, `H2S_ALERT`, `NO2`, `NO2_ALERT`, `SO2`, `SO2_ALERT`, `H2`, `H2_ALERT`, `He`, `He_ALERT`, `dt`) VALUES
(1, 1, 'Critical', 1, 'Normal', 1, 'Normal', 1, 'Critical', 1, 'Normal', 1, 'Normal', 1, 'Normal', 1, 'Alarming', 1, 'Alarming', '2019-11-21 12:22:39.696042'),
(2, 1, 'Critical', 1, 'Normal', 1, 'Normal', 1, 'Critical', 1, 'Normal', 1, 'Normal', 1, 'Normal', 1, 'Alarming', 1, 'Alarming', '2020-02-27 16:50:42.460153'),
(3, 0.74, 'Normal', 200, 'Alarming', 30.5, 'Normal', 21, 'Normal', 10, 'Alarming', 10, 'Alarming', 5, 'Alarming', 0.55, 'Alarming', 0.52, 'Alarming', '2020-03-02 12:16:03.663769'),
(4, 12, 'Evacuate', 10, 'Normal', 10, 'Normal', 21, 'Normal', 20, 'Alarming', 20, 'Alarming', 1, 'Normal', 2, 'Alarming', 2, 'Alarming', '2020-04-27 11:40:04.543066'),
(5, 1, 'Critical', 1, 'Normal', 1, 'Normal', 1, 'Critical', 1, 'Normal', 1, 'Normal', 1, 'Normal', 1, 'Alarming', 1, 'Alarming', '2020-06-22 15:38:26.498390'),
(6, 1, 'Critical', 1, 'Normal', 1, 'Normal', 1, 'Critical', 1, 'Normal', 1, 'Normal', 1, 'Normal', 1, 'Alarming', 1, 'Alarming', '2020-07-07 10:32:30.671898');

-- --------------------------------------------------------

--
-- Table structure for table `hitcount_blacklist_ip`
--

CREATE TABLE IF NOT EXISTS `hitcount_blacklist_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hitcount_blacklist_user_agent`
--

CREATE TABLE IF NOT EXISTS `hitcount_blacklist_user_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_agent` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_agent` (`user_agent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hitcount_hit`
--

CREATE TABLE IF NOT EXISTS `hitcount_hit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `session` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `hitcount_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hitcount_hit_created_79adf7bc` (`created`),
  KEY `hitcount_hit_hitcount_id_b7971910_fk_hitcount_hit_count_id` (`hitcount_id`),
  KEY `hitcount_hit_user_id_f7067f66_fk_auth_user_id` (`user_id`),
  KEY `hitcount_hit_ip_a52a62aa` (`ip`),
  KEY `hitcount_hit_session_5be83758` (`session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hitcount_hit_count`
--

CREATE TABLE IF NOT EXISTS `hitcount_hit_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hits` int(10) unsigned NOT NULL,
  `modified` datetime(6) NOT NULL,
  `object_pk` int(10) unsigned NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hitcount_hit_count_content_type_id_object_pk_4dacb610_uniq` (`content_type_id`,`object_pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `medical_report`
--

CREATE TABLE IF NOT EXISTS `medical_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `report` varchar(200) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  `employee_id_id` int(11) NOT NULL,
  `mine_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `medical_report_employee_id_id_dbf45bba_fk_employee_id` (`employee_id_id`),
  KEY `medical_report_mine_id_id_80b83d54_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `medical_report`
--

INSERT INTO `medical_report` (`id`, `date`, `report`, `file`, `employee_id_id`, `mine_id_id`) VALUES
(1, '2020-07-16', 'First time report on 19/04/2020', 'medical/BitBucket.txt', 4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `minedetails`
--

CREATE TABLE IF NOT EXISTS `minedetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `area` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `mine_map_image` varchar(100) DEFAULT NULL,
  `mine_map_unit` double DEFAULT NULL,
  `village_area_road` varchar(200) DEFAULT NULL,
  `tehsil_taluka_subdivision` varchar(200) DEFAULT NULL,
  `district` varchar(200) DEFAULT NULL,
  `pin` varchar(200) DEFAULT NULL,
  `date_of_opening` date DEFAULT NULL,
  `lin_no` varchar(200) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `minedetails`
--

INSERT INTO `minedetails` (`id`, `name`, `area`, `state`, `latitude`, `longitude`, `mine_map_image`, `mine_map_unit`, `village_area_road`, `tehsil_taluka_subdivision`, `district`, `pin`, `date_of_opening`, `lin_no`, `created_at`) VALUES
(1, 'Jharia Coal Mine', 'Jhariya Jharkhand', 'Jharkhand', 23.7413105, 86.4067042, 'mine_map_image/Map_bHDyxKP.JPG', 8, 'Dhanbad Village/Road/Area', 'Dhanbad Tehsil', 'Dhanbad Dist.', '826001', '1978-02-23', 'LN78834784', '2018-06-27 07:28:36.806195'),
(2, 'Chinakuri', 'West Bangal', 'West Bangal', 23.6852802, 86.8574166, 'mine_map_image/Map.JPG', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-27 07:28:36.806195'),
(3, 'Lakhi Mata Coliary', 'Mugma', 'Jharkhand', 23.7409112, 86.4134906, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-28 06:42:25.208716'),
(4, 'Lalmatiya Coal Mines', 'Jharkhand', 'Bihar', 25.0552347, 87.3597246, 'mine_map_image/mine.gif', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-28 09:16:58.461585'),
(5, 'Mandal Mine', 'Dhabad', 'Jharkhand', 23.8172421, 86.4277111, 'mine_map_image/10_main.jpg', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-07-17 11:35:18.730493'),
(6, 'bokaro mine', 'bokaro', 'Jharkhand', 23.6692956, 86.151112, 'mine_map_image/imagesFigure4.jpg', 40, NULL, NULL, NULL, NULL, NULL, NULL, '2018-07-24 09:25:10.247157'),
(7, 'CSIR-CIMFR', 'DHANBAD', 'Jharkhand', 23.8170376, 86.4276411, 'mine_map_image/cimfr_img.JPG', 8, 'Dhanbad', 'Dhanbad', 'Dhanbad', '826001', '2019-01-10', 'LOO9', '2019-01-10 11:06:42.454839'),
(8, 'CIMFR LAB (Test)', 'Dhaiaya', 'Jharkhand', 23.7413, 86.4067, 'mine_map_image/cimfr_img_GOFSXSa.JPG', 8.9, 'Dhanbad', 'Dhanbad', 'Dhanbad', '826001', '2019-09-18', '12345678', '2019-09-18 17:11:59.985943');

-- --------------------------------------------------------

--
-- Table structure for table `miner_tracking`
--

CREATE TABLE IF NOT EXISTS `miner_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mine_id` int(11) NOT NULL,
  `router_id` varchar(200) NOT NULL,
  `transmitter_id` varchar(200) NOT NULL,
  `emergency` int(11) NOT NULL,
  `ip_add` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=208 ;

--
-- Dumping data for table `miner_tracking`
--

INSERT INTO `miner_tracking` (`id`, `mine_id`, `router_id`, `transmitter_id`, `emergency`, `ip_add`, `created_date`) VALUES
(1, 8, 'R002', 'M001', 0, '', '2019-11-14 00:00:00.000000'),
(2, 8, 'R006', 'M001', 0, '', '2019-11-14 00:00:00.000000'),
(3, 8, 'R002', 'M002', 0, '', '2019-11-14 00:00:00.000000'),
(4, 8, 'R006', 'M003', 0, '', '2019-11-14 00:00:00.000000'),
(5, 8, 'R005', 'M003', 0, '', '2019-11-14 00:00:00.000000'),
(6, 8, 'R001', 'M003', 0, '', '2019-11-14 00:00:00.000000'),
(10, 8, 'R002', 'M004', 0, '', '2019-11-14 00:00:00.000000'),
(11, 8, 'R005', 'M004', 0, '', '2019-11-14 00:00:00.000000'),
(12, 8, 'R005', 'M001', 0, '', '2019-11-14 00:00:00.000000'),
(13, 8, 'R002', 'M001', 0, '', '2019-11-14 00:00:00.000000'),
(53, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:12.087947'),
(54, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:13.292480'),
(55, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:14.491009'),
(56, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:16.893826'),
(57, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:19.296123'),
(58, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:21.699292'),
(59, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:22.901039'),
(60, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:24.098772'),
(61, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:25.298991'),
(62, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:26.504436'),
(63, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:27.706677'),
(64, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:30.100658'),
(65, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:31.332316'),
(66, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 14:19:32.507087'),
(67, 8, '', '', 0, '192.168.1.215', '2020-03-12 15:19:14.101751'),
(68, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 15:24:19.101069'),
(69, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 15:24:21.504278'),
(70, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 15:24:22.709855'),
(71, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 15:24:25.115552'),
(72, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 15:24:27.521486'),
(73, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 15:24:28.724083'),
(74, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 15:24:31.129836'),
(75, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 15:24:33.536765'),
(76, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 15:24:35.928396'),
(77, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 15:24:37.132480'),
(78, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 15:24:38.350311'),
(79, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:53:56.495039'),
(80, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:53:57.605269'),
(81, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:53:58.604542'),
(82, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:53:59.620214'),
(83, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:00.619937'),
(84, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:02.911200'),
(85, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:04.202104'),
(86, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:05.281438'),
(87, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:06.354051'),
(88, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:07.568432'),
(89, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:08.576154'),
(90, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:09.691832'),
(91, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:10.700933'),
(92, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:11.713800'),
(93, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:12.818803'),
(94, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:13.823719'),
(95, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:54:14.847452'),
(96, 8, '', '', 0, '192.168.1.211', '2020-03-12 15:55:08.354234'),
(97, 8, '', '', 0, '192.168.1.211', '2020-03-12 15:55:29.443240'),
(98, 8, '', '', 0, '192.168.1.211', '2020-03-12 15:58:13.946036'),
(99, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:58:15.057460'),
(100, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:58:17.287655'),
(101, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:58:18.490920'),
(102, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:20.662928'),
(103, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:21.661985'),
(104, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:24.256827'),
(105, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:25.273126'),
(106, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:26.271146'),
(107, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:27.380102'),
(108, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:28.395275'),
(109, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:29.412129'),
(110, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:30.508117'),
(111, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:31.621299'),
(112, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:33.868108'),
(113, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 15:59:34.866745'),
(114, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 16:24:38.898477'),
(115, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 16:24:40.098330'),
(116, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 16:24:41.300518'),
(117, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 16:24:58.107800'),
(118, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 16:24:59.303833'),
(119, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 16:25:00.504507'),
(120, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 16:25:01.705015'),
(121, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 16:25:02.905458'),
(122, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:11.326681'),
(123, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:12.513403'),
(124, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:14.938926'),
(125, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:16.105322'),
(126, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:17.362562'),
(127, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:19.705631'),
(128, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:20.707616'),
(129, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:21.737400'),
(130, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:23.296978'),
(131, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:24.497789'),
(132, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:25.698766'),
(133, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:28.097908'),
(134, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:30.502343'),
(135, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:31.700649'),
(136, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:32.919071'),
(137, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:35.294653'),
(138, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:36.302283'),
(139, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:37.319054'),
(140, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:38.894769'),
(141, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:40.097579'),
(142, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:41.298017'),
(143, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:44.891812'),
(144, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-12 16:26:46.003079'),
(145, 8, '', '', 0, '192.168.1.212', '2020-03-12 16:49:45.859113'),
(146, 8, 'R002', 'M004', 0, '192.168.1.212', '2020-03-12 16:49:48.375905'),
(147, 8, 'R002', 'M004', 0, '192.168.1.212', '2020-03-12 16:49:49.578522'),
(148, 8, 'R002', 'M004', 0, '192.168.1.212', '2020-03-12 16:49:50.782454'),
(149, 8, 'R002', 'M004', 0, '192.168.1.212', '2020-03-12 16:49:53.186377'),
(150, 8, 'R002', 'M004', 0, '192.168.1.212', '2020-03-12 16:49:54.387958'),
(151, 8, 'R002', 'M004', 0, '192.168.1.212', '2020-03-12 16:49:55.588765'),
(152, 8, 'R002', 'M004', 0, '192.168.1.212', '2020-03-12 16:49:59.193204'),
(153, 8, 'R002', 'M004', 0, '192.168.1.212', '2020-03-12 16:50:00.400712'),
(154, 8, 'R002', 'M004', 0, '192.168.1.212', '2020-03-12 16:50:01.403356'),
(155, 8, 'R002', 'M004', 0, '192.168.1.212', '2020-03-12 16:50:02.413904'),
(156, 8, 'R002', 'M004', 0, '192.168.1.212', '2020-03-12 16:50:03.421882'),
(157, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:21.187695'),
(158, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:22.390519'),
(159, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:26.134725'),
(160, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:30.809147'),
(161, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:31.993780'),
(162, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:35.598507'),
(163, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:37.994271'),
(164, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:41.595437'),
(165, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:43.999538'),
(166, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:47.597538'),
(167, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:48.802226'),
(168, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:50.006847'),
(169, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:52.398689'),
(170, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:53.604216'),
(171, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:57.202770'),
(172, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:55:59.598657'),
(173, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-12 17:56:00.808292'),
(174, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-13 12:01:10.222489'),
(175, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-13 12:01:11.426293'),
(176, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-13 12:01:19.834309'),
(177, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-13 12:01:21.030916'),
(178, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-13 12:01:23.429042'),
(179, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-13 12:01:30.633768'),
(180, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-13 12:01:34.238247'),
(181, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-13 12:01:58.238409'),
(182, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-13 12:02:00.638536'),
(183, 8, '', '', 0, '192.168.1.211', '2020-03-13 12:02:11.972325'),
(184, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:13.072465'),
(185, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:14.080959'),
(186, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:15.094109'),
(187, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:16.207282'),
(188, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:17.213904'),
(189, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:18.220539'),
(190, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:19.225356'),
(191, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:20.249087'),
(192, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:21.344916'),
(193, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:22.356540'),
(194, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:23.375854'),
(195, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:24.373624'),
(196, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:25.382987'),
(197, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:26.392490'),
(198, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:27.396544'),
(199, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:28.610875'),
(200, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:29.619525'),
(201, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:30.625882'),
(202, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:02:31.635927'),
(203, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:05:22.037752'),
(204, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:05:23.242841'),
(205, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-13 12:05:24.441173'),
(206, 8, 'R001', 'M004', 0, '192.168.1.211', '2020-03-13 12:05:24.441852'),
(207, 8, 'R005', 'M004', 0, '192.168.1.215', '2020-03-13 12:05:26.842826');

-- --------------------------------------------------------

--
-- Table structure for table `mineshift`
--

CREATE TABLE IF NOT EXISTS `mineshift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(200) NOT NULL,
  `mine_id` int(11) NOT NULL,
  `time_from` varchar(20) NOT NULL,
  `time_to` varchar(20) NOT NULL,
  `description` longtext,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

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

CREATE TABLE IF NOT EXISTS `miningrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `type` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `parent_role_id` int(11) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MiningRole_mine_id_name_c0702997_uniq` (`mine_id`,`name`),
  KEY `MiningRole_parent_role_id_59fe44ec_fk_MiningRole_id` (`parent_role_id`),
  KEY `MiningRole_mine_id_20ddfa3f_fk_MineDetails_id` (`mine_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

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
(15, 'My Test Role', 'worker', '', '2019-10-31 15:59:21.015653', '2019-10-31 15:59:21.022606', 14, 8);

-- --------------------------------------------------------

--
-- Table structure for table `news_bulletin`
--

CREATE TABLE IF NOT EXISTS `news_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news` varchar(1000) DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `updated_on` date DEFAULT NULL,
  `valid_till` date DEFAULT NULL,
  `download_link` varchar(100) DEFAULT NULL,
  `download_number` int(11) DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `color` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `news_bulletin_user_id_id_04cc1349_fk_auth_user_id` (`user_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `news_bulletin`
--

INSERT INTO `news_bulletin` (`id`, `news`, `created_on`, `updated_on`, `valid_till`, `download_link`, `download_number`, `user_id_id`, `color`) VALUES
(1, '3rd PRSG meeting at CSIR-CIMFR on 22.07.2020 for R&D project on "Development of Digital Mine using IoT" | CSIR - Central Institute of Mining & Fuel Rwqdweqesearch | सीएसआईआर - केंद्रीय खनन एवं ईंधन अनुसंधान', '2019-10-14', '2020-07-16', '2022-05-27', 'news_bulletin/Digital_Mine_IoT___CSIR-CIMFR_NDfZoKT.pdf', 8, 1, 'FDFEFF');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `isread` int(11) NOT NULL,
  `employee_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notification_type_message_470de7ab_uniq` (`type`,`message`),
  KEY `notification_employee_id_id_440ac6f5_fk_employee_id` (`employee_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `production_dailydispatch`
--

CREATE TABLE IF NOT EXISTS `production_dailydispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(100) DEFAULT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `dates` date NOT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_dailydispatch_mine_id_id_fefb8e38_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `production_dailyentry`
--

CREATE TABLE IF NOT EXISTS `production_dailyentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_name` varchar(100) DEFAULT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `dates` date NOT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_dailyentry_mine_id_id_a0e6da9f_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `production_manualentry`
--

CREATE TABLE IF NOT EXISTS `production_manualentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_manualentry_mine_id_id_3544eaf4_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `production_manualentry`
--

INSERT INTO `production_manualentry` (`id`, `weighbridge_id`, `vehicle_id`, `datetime_in`, `datetime_out`, `trip_time`, `tm_name`, `wb_code`, `first_wt`, `second_wt`, `net_wt`, `weight_unit`, `type`, `production_type`, `entry_date`, `created_date`, `modified_date`, `mine_id_id`) VALUES
(1, '1', '1', '2019-12-04 14:41:15.000000', '2019-12-04 14:42:23.000000', '0 days 0 hrs 1 min', 'TM0098', 'W001-Jh', 3, 5, 2, 'Tonne', 'P', 'Coal', '2019-12-04', '2019-12-04 14:42:25.829924', '2019-12-04 14:42:25.829924', 1);

-- --------------------------------------------------------

--
-- Table structure for table `production_material_waste`
--

CREATE TABLE IF NOT EXISTS `production_material_waste` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` varchar(100) NOT NULL,
  `weighbridge_id` varchar(100) NOT NULL,
  `net_weight` int(11) DEFAULT NULL,
  `unit` varchar(100) NOT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `datetime_in` datetime(6) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_material_waste_mine_id_id_b90da2e4_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `production_monthly`
--

CREATE TABLE IF NOT EXISTS `production_monthly` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `years` varchar(100) DEFAULT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_monthly_mine_id_id_bb403079_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `production_monthlydispatch`
--

CREATE TABLE IF NOT EXISTS `production_monthlydispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `month` varchar(100) DEFAULT NULL,
  `years` varchar(100) DEFAULT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_monthlydispatch_mine_id_id_e4383d0d_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `production_tub`
--

CREATE TABLE IF NOT EXISTS `production_tub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `laden_weight` varchar(100) NOT NULL,
  `no_of_trip` int(11) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `destination` varchar(200) NOT NULL,
  `datetime_in` datetime(6) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  `name_of_the_tub_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_tub_mine_id_id_01c8545f_fk_MineDetails_id` (`mine_id_id`),
  KEY `production_tub_name_of_the_tub_id_a65cac29_fk_container` (`name_of_the_tub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `production_vehicle`
--

CREATE TABLE IF NOT EXISTS `production_vehicle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rfid` longtext,
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
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_vehicle_mine_id_id_8652104f_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `production_vehicle`
--

INSERT INTO `production_vehicle` (`id`, `rfid`, `vehicle_reg_no`, `type_of_vehicle`, `reg_laden_weight_of_the_vehicle`, `reg_laden_weight_of_the_vehicles`, `o_name`, `o_address`, `o_email`, `o_mob`, `d_name`, `d_address`, `d_email`, `d_mob`, `d_photo`, `t_name`, `t_address`, `t_email`, `w_no`, `dates`, `party_details`, `sale`, `grade`, `source`, `destination`, `validity`, `start_date_of_order`, `end_date_of_order`, `value_of_order`, `validity_of_tag`, `trip_cycle`, `created_date`, `modified_date`, `mine_id_id`) VALUES
(1, 'JH10FFFF', 'Jh10FD8978', 'Truck', 3, 'Tonne', 's.k. GUPTA', 'Dhanbad', 'sk@example.com', '7865326598', 'Suraj Driver', 'Dhanbad', 'suraj@example.com', '5968457856', 'driver_image/new_logo.jpg', 'R S Transpoter', 'Kolkata', 'rs@example.com', '786593', '2019-12-04', 'No Party', '00', '00', 'Dhanbad', 'Dhanbad', '2020-02-20', '2019-12-04', '2020-02-20', '0', '2019-12-04', '00', '2019-12-04 14:39:16.018961', '2019-12-04 14:39:16.018961', 1);

-- --------------------------------------------------------

--
-- Table structure for table `production_weighbridge`
--

CREATE TABLE IF NOT EXISTS `production_weighbridge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `w_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `wb_code` varchar(100) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_weighbridge_mine_id_id_b11f77d8_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `production_weighbridge`
--

INSERT INTO `production_weighbridge` (`id`, `w_name`, `location`, `desc`, `wb_code`, `created_date`, `modified_date`, `mine_id_id`) VALUES
(1, 'Weighbridge001', 'Jhariya First WB', '', 'W001-Jh', '2019-12-04 14:40:53.888509', '2019-12-04 14:40:53.888509', 1);

-- --------------------------------------------------------

--
-- Table structure for table `production_yearlydispatch`
--

CREATE TABLE IF NOT EXISTS `production_yearlydispatch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `years` varchar(100) DEFAULT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_yearlydispatch_mine_id_id_512dbb02_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `production_yearlyentry`
--

CREATE TABLE IF NOT EXISTS `production_yearlyentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `years` varchar(100) DEFAULT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `production_yearlyentry_mine_id_id_8244d987_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE IF NOT EXISTS `product_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `prod_category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_details_mine_id_id_bb06785f_fk_MineDetails_id` (`mine_id_id`),
  KEY `product_details_prod_category_id_42d4a8fc_fk_category_details_id` (`prod_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`id`, `business_name`, `prod_name`, `alternate_prod`, `unit`, `invoice_no`, `prod_expiry`, `quantity`, `price`, `batch_number`, `barcode`, `tax`, `rate`, `total_tax`, `net_amount`, `info_any`, `entry_date`, `initial_quantity`, `mine_id_id`, `prod_category_id`) VALUES
(1, 1, 'HP Pavilion Computer', '[]', 'Piece(pc)', 'Inv001', '2022-11-15', 2, 53000, 'Batch001', NULL, 'SGST', 18.5, 29415, 188415, '8th Generation Intel® Core™ i5 processor\r\nWindows 10 Pro 64\r\n8 GB DDR4-2400 SDRAM (1 x 8 GB)\r\n512 GB SSD\r\nAMD Radeon™ Pro WX 3100 Graphics (2 GB GDDR5 dedicated)', '2019-11-15', 3, 1, 1),
(2, 1, 'Dell Computer', '[''HP Pavilion Computer'']', 'Piece(pc)', 'Inv0033', '2023-11-15', 3, 43000, 'Batch100', NULL, 'IGST', 23, 79120, 423120, 'Dell 24 inch (60.96 cm) Ultra Thin Bezel LED Backl.', '2019-11-15', 8, 1, 1),
(3, 2, 'Acer Computer', '[''Dell Computer'', ''HP Pavilion Computer'']', 'Piece(pc)', 'Inv0033', '2024-11-15', 0, 23000, 'Batch123', NULL, 'IGST', 23, 15870, 84870, 'CHIST PC CH-M41 (Intel Core i5-650 3.2 Ghz, 4GB RAM', '2019-11-15', 3, 1, 1),
(4, 4, 'Printing Material', '[]', 'Packet(pkt)', 'Inv009', '2019-12-15', 14, 1200, 'Batch009', NULL, 'SGST', 18.5, 2664, 17064, '', '2019-11-15', 12, 2, 2),
(5, 4, 'Fevicol', '[''Printing Material'']', 'Pair(pr)', 'Inv445', '2019-12-30', 10, 50, 'Batch009', NULL, 'SGST', 18.5, 92.5, 592.5, '', '2019-11-15', 10, 2, 2),
(6, 4, 'Feviquick', '', 'Piece(pc)', 'Inv499', '2019-10-30', 1, 5, 'Batch009', NULL, 'SGST', 18.5, 0.925, 5.925, '', '2019-11-15', NULL, 2, 2),
(7, 4, 'Feviquick-0.5 GM', '[''Fevicol'', ''Feviquick'']', 'Piece(pc)', 'Inv009', '2022-12-30', 100, 10, 'Batch009', NULL, 'SGST', 18.5, 185, 1185, '', '2019-11-15', 100, 2, 2),
(8, 5, 'Measuring Tools', '[]', 'Piece(pc)', 'M009', '2022-12-30', 10, 10, 'Batch009', NULL, 'SGST', 18.5, 18.5, 118.5, '', '2019-11-15', 10, 3, 4),
(9, 5, 'Beaker', '[]', 'Piece(pc)', 'B0098', '2022-12-30', 10, 150, 'Batch009', NULL, 'SGST', 18.5, 277.5, 1777.5, '', '2019-11-15', 10, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `profile_extension`
--

CREATE TABLE IF NOT EXISTS `profile_extension` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_avatar` varchar(100) DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_extension_user_id_id_20e360b3_fk_auth_user_id` (`user_id_id`),
  KEY `profile_extension_mine_id_id_70967400_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `profile_extension`
--

INSERT INTO `profile_extension` (`id`, `profile_avatar`, `user_id_id`, `mine_id_id`) VALUES
(1, 'employee_image/Capture_zzCnlQT.JPG', 49, 2),
(4, 'employee_image/emp_1DmIuJ9_kc4nsjG.png', 1, 1),
(7, '', 50, 8),
(8, '', 52, 1),
(9, 'employee_image/img_new_26kb.jpg', 53, 1),
(13, 'employee_image/dr_sk_img_JC3bKpI.jpg', 62, 8);

-- --------------------------------------------------------

--
-- Table structure for table `reorder_details`
--

CREATE TABLE IF NOT EXISTS `reorder_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `updated_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `reorder_details`
--

INSERT INTO `reorder_details` (`id`, `Reorder_date`, `creationdate`, `mine_id`, `prod_category`, `product_id`, `prod_name`, `barcode`, `batch_number`, `quantity`, `addedstock`, `updated_quantity`) VALUES
(1, '2019-11-15 00:00:00.000000', '2019-11-15 00:00:00.000000', '2 (Chinakuri)', 'Stationery', 4, 'Printing Material', '0.0', 'Batch009', 12, 2, 14),
(2, '2019-11-15 00:00:00.000000', '2019-11-15 00:00:00.000000', '2 (Chinakuri)', 'Stationery', 4, 'Printing Material', '0.0', 'Batch009', 12, 2, 14),
(3, '2019-11-15 00:00:00.000000', '2019-11-15 00:00:00.000000', '2 (Chinakuri)', 'Stationery', 4, 'Printing Material', '0.0', 'Batch009', 12, 2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `rescue_records`
--

CREATE TABLE IF NOT EXISTS `rescue_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_id_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `date_fr` datetime(6) DEFAULT NULL,
  `date_to` datetime(6) DEFAULT NULL,
  `incident_type` varchar(255) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rescue_records_mine_id_7c3ac060_fk_MineDetails_id` (`mine_id`),
  KEY `rescue_records_shift_id_id_3fb6da7b` (`shift_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rescue_records`
--

INSERT INTO `rescue_records` (`id`, `shift_id_id`, `area`, `date_fr`, `date_to`, `incident_type`, `mine_id`) VALUES
(1, 4, 'r26', '2020-07-15 12:17:11.000000', '2020-07-16 12:18:11.000000', 'strata roof fall', 8);

-- --------------------------------------------------------

--
-- Table structure for table `rescue_records_others`
--

CREATE TABLE IF NOT EXISTS `rescue_records_others` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rescue_or_rescued` varchar(1) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `rescue_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rescue_records_others_rescue_id_id_9d8892cd_fk_rescue_records_id` (`rescue_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rescue_records_rescued_employees_name`
--

CREATE TABLE IF NOT EXISTS `rescue_records_rescued_employees_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rescue_records_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rescue_records_rescued_e_rescue_records_id_employ_50876a5a_uniq` (`rescue_records_id`,`employee_id`),
  KEY `rescue_records_rescu_employee_id_5e0c8726_fk_employee_` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rescue_records_rescued_employees_name`
--

INSERT INTO `rescue_records_rescued_employees_name` (`id`, `rescue_records_id`, `employee_id`) VALUES
(1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `rescue_records_rescue_person_name`
--

CREATE TABLE IF NOT EXISTS `rescue_records_rescue_person_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rescue_records_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rescue_records_rescue_pe_rescue_records_id_employ_0d7619be_uniq` (`rescue_records_id`,`employee_id`),
  KEY `rescue_records_rescu_employee_id_e46e0d83_fk_employee_` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rescue_records_rescue_person_name`
--

INSERT INTO `rescue_records_rescue_person_name` (`id`, `rescue_records_id`, `employee_id`) VALUES
(1, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `safety`
--

CREATE TABLE IF NOT EXISTS `safety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(200) NOT NULL,
  `agent` varchar(200) NOT NULL,
  `manager` varchar(200) NOT NULL,
  `status_report` date NOT NULL,
  `mine_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `safety_mine_id_73f6a4e6_fk_MineDetails_id` (`mine_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `safety`
--

INSERT INTO `safety` (`id`, `owner`, `agent`, `manager`, `status_report`, `mine_id`) VALUES
(1, 'Rajesh Kumar', 'A K Sinha', 'Rajesh Kumar', '2020-07-14', 8);

-- --------------------------------------------------------

--
-- Table structure for table `safetytable`
--

CREATE TABLE IF NOT EXISTS `safetytable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `print_hazard` varchar(200) NOT NULL,
  `mit_date` date DEFAULT NULL,
  `auditable_work` varchar(200) NOT NULL,
  `comp_date` date DEFAULT NULL,
  `remarks` varchar(200) NOT NULL,
  `safety_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `safetytable_safety_id_id_ef70be42_fk_safety_id` (`safety_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `safetytable`
--

INSERT INTO `safetytable` (`id`, `print_hazard`, `mit_date`, `auditable_work`, `comp_date`, `remarks`, `safety_id_id`) VALUES
(1, 'Earth Quake 1', '2020-07-14', 'aaaaaa', '2020-07-14', 'na', 1),
(2, 'another hazards', '2020-07-13', 'bbbbb', '2020-07-13', 'na', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sensordata`
--

CREATE TABLE IF NOT EXISTS `sensordata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data1` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_arduino`
--

CREATE TABLE IF NOT EXISTS `sensor_arduino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) DEFAULT NULL,
  `arduino_id` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `noofsensors` int(11) NOT NULL,
  `port_no` varchar(200) NOT NULL,
  `baudrate` int(11) NOT NULL,
  `photo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_connection`
--

CREATE TABLE IF NOT EXISTS `sensor_connection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mine_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `type` varchar(200) DEFAULT NULL,
  `arduino_id` int(11) DEFAULT NULL,
  `wireless_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_node`
--

CREATE TABLE IF NOT EXISTS `sensor_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `x_axis` double NOT NULL,
  `y_axis` double NOT NULL,
  `photo1` varchar(100) DEFAULT NULL,
  `photo2` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `mine_id_id` int(11) NOT NULL,
  `isgoaf` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nodeid` (`node_id`,`mine_id_id`),
  KEY `sensor_node_mine_id_id_22542281_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `sensor_node`
--

INSERT INTO `sensor_node` (`id`, `node_id`, `name`, `location`, `x_axis`, `y_axis`, `photo1`, `photo2`, `description`, `mine_id_id`, `isgoaf`) VALUES
(2, 'N002', 'Node 2', 'New Pillar 1', 42.19, 76.76, 'emp_img/newplot_2.png', 'emp_img/newplot_2_3mzLJ3A.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s', 8, 1),
(3, 'N003', 'Node 3', 'pillar 3 ke pass', 65.97, 27.22, 'emp_img/newplot_2_vNFPeME.png', 'emp_img/newplot_2_eDYyfHL.png', 'second node for vikash mine', 8, 0),
(4, 'N002', 'Node 2', 'Centre', 45.37, 52.31, 'emp_img/newplot_4_v5gpsZg.png', 'emp_img/newplot_4_xDThW6q.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 1, 0),
(5, 'N003', 'Node 3', 'Right Side(G)', 36.52, 53.33, 'emp_img/newplot_4.png', 'emp_img/newplot_4_XjQIgQN.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 1, 1),
(6, 'N004', 'Node 4', 'gfdhgfd', 38.37, 50.28, 'emp_img/newplot_1.png', 'emp_img/newplot.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 1, 0),
(15, 'N001', 'Node 1', 'Centre', 45.37, 52.31, 'emp_img/newplot_4_v5gpsZg.png', 'emp_img/newplot_4_xDThW6q.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type a', 1, 0),
(16, 'N001', 'Node1', 'CSIR-CIMFR Main Building', 25.23, 58.15, 'emp_img/node_logo_oLDKcnV_1sksOUB.png', 'emp_img/node_red_gGwTEXl_V5r9Wvv.png', 'This is for testing on cimfr building', 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sensor_sensor_node`
--

CREATE TABLE IF NOT EXISTS `sensor_sensor_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_add` varchar(200) NOT NULL,
  `sensor_id` varchar(200) NOT NULL,
  `sensor_name` varchar(200) NOT NULL,
  `sensor_unit` varchar(200) NOT NULL,
  `sensor_threshold_limit` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `mine_id_id` int(11) NOT NULL,
  `node_id_id` int(11) NOT NULL,
  `audio_play_type` varchar(10) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `interval_time` int(11) DEFAULT NULL,
  `level_1_audio` varchar(100) DEFAULT NULL,
  `level_1_color` varchar(50) DEFAULT NULL,
  `level_1_msg` varchar(200) DEFAULT NULL,
  `level_1_warning_unit` int(11) NOT NULL,
  `level_2_audio` varchar(100) DEFAULT NULL,
  `level_2_color` varchar(50) DEFAULT NULL,
  `level_2_msg` varchar(200) DEFAULT NULL,
  `level_2_warning_unit` int(11) NOT NULL,
  `level_3_audio` varchar(100) DEFAULT NULL,
  `level_3_color` varchar(50) DEFAULT NULL,
  `level_3_msg` varchar(200) DEFAULT NULL,
  `level_3_warning_unit` int(11) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sensor_sensor_node_mine_id_id_node_id_id_sensorid_b48c8b00_uniq` (`mine_id_id`,`node_id_id`,`sensor_id`),
  KEY `sensor_sensor_node_node_id_id_f6b7a19e_fk_sensor_node_id` (`node_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `sensor_sensor_node`
--

INSERT INTO `sensor_sensor_node` (`id`, `ip_add`, `sensor_id`, `sensor_name`, `sensor_unit`, `sensor_threshold_limit`, `description`, `mine_id_id`, `node_id_id`, `audio_play_type`, `created_date`, `interval_time`, `level_1_audio`, `level_1_color`, `level_1_msg`, `level_1_warning_unit`, `level_2_audio`, `level_2_color`, `level_2_msg`, `level_2_warning_unit`, `level_3_audio`, `level_3_color`, `level_3_msg`, `level_3_warning_unit`, `modified_date`) VALUES
(1, '192.168.1.181', 'S002', 'O2', 'ppm', '100', 'vvhgvhgv', 1, 4, 'mp3only', '2020-05-04 10:31:15.986392', 30, '', '#ADFF2F', 'Environment Sensor Condition:First Stage Warning Message , Please be Careful.', 0, '', '#FFA500', 'Environment Sensor Condition:Second Stage Warning Message , Please be alert situation is not good.', 0, '', '#FF0000', 'Environment Sensor Condition:Third Stage Warning Message , Please  leave the underground', 0, '2020-05-05 10:37:46.690976'),
(4, '192.168.1.181', 'CH4-001', 'CH4', 'ppm', '100', 'this is Ch4 sensor on vikash mine on node 2', 8, 2, 'mp3only', '2020-05-04 10:31:15.986392', 30, '', 'ADFF2F', 'Environment Sensor Condition:First Stage Warning Message , Please be Careful.', 10, '', 'FFA500', 'Environment Sensor Condition:Second Stage Warning Message , Please be alert situation is not good.', 20, '', 'FF0000', 'Environment Sensor Condition:Third Stage Warning Message , Please  leave the underground', 30, '2020-06-08 16:08:57.434732'),
(5, '192.168.1.181', 'CH4-001', 'CO2', 'ppm', '100', 'ds', 8, 3, 'mp3only', '2020-05-04 10:31:15.986392', 30, '', '#ADFF2F', 'Environment Sensor Condition:First Stage Warning Message , Please be Careful.', 0, '', '#FFA500', 'Environment Sensor Condition:Second Stage Warning Message , Please be alert situation is not good.', 0, '', '#FF0000', 'Environment Sensor Condition:Third Stage Warning Message , Please  leave the underground', 0, '2020-05-05 10:32:03.354795'),
(10, '192.168.1.181', 'S005', 'CO', 'ppm', '100', 'Description', 1, 4, 'mp3only', '2020-05-04 10:31:15.986392', 30, NULL, '#ADFF2F', 'Environment Sensor Condition:First Stage Warning Message , Please be Careful.', 10, NULL, '#FFA500', 'Environment Sensor Condition:Second Stage Warning Message , Please be alert situation is not good.', 20, NULL, '#FF0000', 'Environment Sensor Condition:Third Stage Warning Message , Please  leave the underground', 30, '2020-05-04 10:31:17.654242'),
(11, '192.168.1.181', 'S00010', 'CO', 'ppm', '100', 'Description', 1, 5, 'mp3only', '2020-05-04 10:31:15.986392', 30, '', '#ADFF2F', 'Environment Sensor Condition:First Stage Warning Message , Please be Careful.', 10, '', '#FFA500', 'Environment Sensor Condition:Second Stage Warning Message , Please be alert situation is not good.', 20, '', '#FF0000', 'Environment Sensor Condition:Third Stage Warning Message , Please  leave the underground', 30, '2020-05-05 10:31:20.116915'),
(12, '192.168.1.181', 'S00011', 'C2H4', 'ppm', '100', 'Description', 1, 5, 'mp3only', '2020-05-04 10:31:15.986392', 30, '', '#ADFF2F', 'Environment Sensor Condition:First Stage Warning Message , Please be Careful.', 0, '', '#FFA500', 'Environment Sensor Condition:Second Stage Warning Message , Please be alert situation is not good.', 0, '', '#FF0000', 'Environment Sensor Condition:Third Stage Warning Message , Please  leave the underground', 0, '2020-05-05 10:31:28.299461'),
(16, '192.168.1.181', 'S1-Ch4', 'CH4', 'ppm', '10', 'This is the first sensor of Node 1 (ie ch4) under vikash mine', 8, 16, 'text2voice', '2020-05-15 10:52:02.617201', 10, '', 'ADFF2F', 'Environment Condition:First Stage Warning of ch4 under Node1 Message , Please be Careful.', 5, '', 'FFA500', 'Environment Condition:Second Stage Warning Message of ch4 under Node1 , Please be alert situation is not good.', 10, '', 'FF0000', 'Environment Condition:Third Stage Warning Message of ch4 under Node1 , Please  leave the underground', 20, '2020-05-15 10:52:02.617201'),
(17, '192.168.1.181', 'CO-001', 'CO', 'ppm', '100', 'description for CO', 8, 2, 'text2voice', '2020-06-08 16:10:00.934614', 30, '', 'ADFF2F', 'Environment Condition:First Stage Warning Message , Please be Careful.', 20, '', 'FFA500', 'Environment Condition:Second Stage Warning Message , Please be alert situation is not good.', 50, '', 'FF0000', 'Environment Condition:Third Stage Warning Message , Please  leave the underground', 80, '2020-06-08 16:10:00.935601');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `name`, `value`, `desc`, `created_at`, `updated_at`) VALUES
(1, 'is_strata_display_warning', '0', 'this is for popup window display warning (Y/N)', '2020-03-02 12:30:05.947912', '2020-03-02 12:34:16.068812');

-- --------------------------------------------------------

--
-- Table structure for table `slope_location`
--

CREATE TABLE IF NOT EXISTS `slope_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(200) NOT NULL,
  `tag_no` varchar(200) DEFAULT NULL,
  `x_axis` double DEFAULT NULL,
  `y_axis` double DEFAULT NULL,
  `json_url` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` date NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_name_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slope_location_mine_name_id_dba9c1e0_fk_MineDetails_id` (`mine_name_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `slope_location`
--

INSERT INTO `slope_location` (`id`, `location_name`, `tag_no`, `x_axis`, `y_axis`, `json_url`, `description`, `created_date`, `modified_date`, `mine_name_id`) VALUES
(1, 'Slope Zone1', 'SL001', 95.02, 36.85, 'https://api.thingspeak.com/channels/695213/feeds.json?api_key=14VVLYUE1SWLQ76J&results=2', 'This is the first slope....', '2020-03-23', '2020-05-13 12:30:53.362266', 8),
(2, 'Zone 2 test in CIMFR', 'tAA09', 63.6, 16.48, 'https://api.thingspeak.com/channels/1072767/feeds.json?api_key=YLNSQA98G9WX9RT0&results=2', 'this zone is for testing and used Thingspeak URL created by dew', '2020-06-02', '2020-06-02 12:08:46.071394', 8);

-- --------------------------------------------------------

--
-- Table structure for table `slope_sensor`
--

CREATE TABLE IF NOT EXISTS `slope_sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `mine_name_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slope_sensor_location_id_id_66a2595b_fk_slope_location_id` (`location_id_id`),
  KEY `slope_sensor_mine_name_id_e612d8b4_fk_MineDetails_id` (`mine_name_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `slope_sensor`
--

INSERT INTO `slope_sensor` (`id`, `sensor_name`, `sensor_unit`, `tag_no`, `level_1_warning_unit`, `level_2_warning_unit`, `level_3_warning_unit`, `level_1_color`, `level_2_color`, `level_3_color`, `level_1_msg`, `level_2_msg`, `level_3_msg`, `level_1_audio`, `level_2_audio`, `level_3_audio`, `ip_address`, `interval_time`, `audio_play_type`, `description`, `created_date`, `modified_date`, `location_id_id`, `mine_name_id`) VALUES
(2, 'tiltmeter', 'Degree', 'Tilt001', 3, 5, 10, '#ADFF2F', '#FFA500', '#FF0000', 'Slope Condition:First Stage Warning Message tiltmeter , Please be Careful.', 'Slope Condition:Second Stage Warning Message tiltmeter , Please be alert situation is not good.', 'Slope Condition:Third Stage Warning Message tiltmeter , Please  leave the underground', '', '', '', '192.168.1.181', 30, 'text2voice', 'This is MQTT url based sensor so IP is not mendatory. It is only for show.', '2020-05-18 12:45:29.024462', '2020-05-18 12:45:29.030478', 1, 8),
(3, 'inclinometer', 'degree', 'INC001', 3, 5, 10, '#ADFF2F', '#FFA500', '#FF0000', 'Slope Condition:First Stage Warning Message  inclinometer, Please be Careful.', 'Slope Condition:Second Stage Warning Message inclinometer , Please be alert situation is not good.', 'Slope Condition:Third Stage Warning Message inclinometer , Please  leave the underground', '', '', '', '192.168.1.181', 30, 'text2voice', 'inclinometer for MQQTT url', '2020-05-18 12:46:58.717222', '2020-05-18 12:46:58.717222', 1, 8),
(4, 'tiltmeter', 'degree', 't009', 2, 3, 5, '#ADFF2F', '#FFA500', '#FF0000', 'Slope Condition:First Stage Warning Message , Please be Careful.', 'Slope Condition:Second Stage Warning Message , Please be alert situation is not good.', 'Slope Condition:Third Stage Warning Message , Please  leave the underground', '', '', '', '192.168.1.123', 30, 'text2voice', '', '2020-06-02 12:10:14.107252', '2020-06-02 12:10:14.122873', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `slope_sensor_data`
--

CREATE TABLE IF NOT EXISTS `slope_sensor_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `sensor_value` varchar(50) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=119 ;

--
-- Dumping data for table `slope_sensor_data`
--

INSERT INTO `slope_sensor_data` (`id`, `sensor_id`, `sensor_value`, `created_date`) VALUES
(1, 1, '75.0', '2020-04-27 11:11:41.381849'),
(2, 1, '75.0', '2020-04-27 11:12:34.686053'),
(3, 1, '75.0', '2020-04-27 11:13:25.452725'),
(4, 1, '75.0', '2020-04-27 11:14:26.470352'),
(5, 1, '75.0', '2020-04-27 11:15:31.050883'),
(6, 1, '75.0', '2020-04-27 11:17:35.739810'),
(7, 1, '75.0', '2020-04-27 11:22:32.094464'),
(8, 1, '6.0', '2020-04-27 11:34:35.371328'),
(9, 1, '6.0', '2020-04-27 11:36:04.495277'),
(10, 1, '6.0', '2020-04-27 11:37:53.899226'),
(11, 1, '6.0', '2020-04-27 11:39:55.399928'),
(12, 1, '7.0', '2020-04-27 11:42:07.989628'),
(13, 1, '7.0', '2020-04-27 11:45:18.779433'),
(14, 1, '7.0', '2020-04-27 11:51:30.555950'),
(15, 1, '82.0', '2020-04-27 12:03:45.879536'),
(16, 1, '72.0', '2020-04-27 12:05:51.925989'),
(17, 1, '72.0', '2020-04-27 12:07:53.848687'),
(18, 1, '70.0', '2020-04-27 12:09:25.613479'),
(19, 1, '70.0', '2020-04-27 12:11:22.513079'),
(20, 1, '76.0', '2020-04-27 12:14:23.085434'),
(21, 1, '70.0', '2020-04-27 12:20:34.684103'),
(22, 1, '6.0', '2020-04-27 12:32:44.913854'),
(23, 1, '207.0', '2020-05-05 16:28:39.520342'),
(24, 1, '207.0', '2020-05-05 16:29:29.946553'),
(25, 1, '207.0', '2020-05-05 16:34:52.829934'),
(26, 1, '208.0', '2020-05-05 16:35:37.917044'),
(27, 1, 'Network Error', '2020-05-06 12:03:44.273429'),
(28, 1, '209.0', '2020-05-06 12:04:31.947038'),
(29, 1, '212.0', '2020-05-06 12:05:52.406236'),
(30, 1, '209.0', '2020-05-06 12:06:35.162689'),
(31, 1, '210.0', '2020-05-06 12:07:03.478678'),
(32, 1, '3221.0', '2020-05-06 12:08:07.506487'),
(33, 1, '210.0', '2020-05-06 12:11:53.075737'),
(34, 1, '208.0', '2020-05-06 12:39:12.919361'),
(35, 1, '209.0', '2020-05-06 12:40:44.874524'),
(36, 1, '209.0', '2020-05-06 12:41:03.673273'),
(37, 1, '208.0', '2020-05-06 12:41:32.081880'),
(38, 1, '208.0', '2020-05-06 12:42:12.845561'),
(39, 1, '208.0', '2020-05-06 12:42:33.124426'),
(40, 1, '208.0', '2020-05-06 12:43:05.778210'),
(41, 1, '207.0', '2020-05-06 12:43:45.440487'),
(42, 1, '208.0', '2020-05-06 12:44:16.689424'),
(43, 1, '210.0', '2020-05-06 12:44:59.621511'),
(44, 1, '5.0', '2020-05-06 12:46:12.697934'),
(45, 1, '4.0', '2020-05-06 12:51:22.766081'),
(46, 1, '4.0', '2020-05-06 12:52:20.831613'),
(47, 1, '4.0', '2020-05-06 12:52:57.997863'),
(48, 1, '4.0', '2020-05-06 12:53:17.771049'),
(49, 1, '5.0', '2020-05-06 12:53:49.086945'),
(50, 1, '4.0', '2020-05-06 12:54:23.258597'),
(51, 1, '4.0', '2020-05-06 12:55:06.194120'),
(52, 1, '4.0', '2020-05-06 12:55:50.436173'),
(53, 1, '5.0', '2020-05-06 12:56:26.658868'),
(54, 1, '4.0', '2020-05-06 12:56:57.566640'),
(55, 1, '4.0', '2020-05-06 12:57:26.298898'),
(56, 1, '4.0', '2020-05-06 12:57:50.582205'),
(57, 1, '4.0', '2020-05-06 12:58:14.634721'),
(58, 1, '5.0', '2020-05-06 12:58:48.751575'),
(59, 1, '4.0', '2020-05-06 12:59:13.500873'),
(60, 1, '5.0', '2020-05-06 12:59:46.508253'),
(61, 1, '4.0', '2020-05-06 13:00:20.702968'),
(62, 1, '4.0', '2020-05-06 13:00:49.652780'),
(63, 1, '4.0', '2020-05-06 13:01:19.143772'),
(64, 1, '5.0', '2020-05-06 13:01:47.257119'),
(65, 1, '4.0', '2020-05-06 13:02:21.372800'),
(66, 1, '208.0', '2020-05-06 13:03:25.988823'),
(67, 1, '208.0', '2020-05-06 13:04:27.563158'),
(68, 1, '208.0', '2020-05-06 13:05:00.114004'),
(69, 1, '209.0', '2020-05-06 13:05:22.479318'),
(70, 1, '208.0', '2020-05-06 13:05:52.986973'),
(71, 1, '208.0', '2020-05-06 13:06:19.319503'),
(72, 1, '208.0', '2020-05-06 13:06:47.878340'),
(73, 1, '207.0', '2020-05-06 13:07:14.193784'),
(74, 1, '207.0', '2020-05-06 13:07:44.367536'),
(75, 1, '207.0', '2020-05-06 13:08:10.217864'),
(76, 1, '207.0', '2020-05-06 13:08:41.901466'),
(77, 1, '208.0', '2020-05-06 13:09:05.041723'),
(78, 1, '209.0', '2020-05-06 13:09:36.558109'),
(79, 1, '208.0', '2020-05-06 13:10:05.540385'),
(80, 1, '208.0', '2020-05-06 13:10:35.491102'),
(81, 1, '208.0', '2020-05-06 13:10:57.882752'),
(82, 1, '207.0', '2020-05-06 13:11:29.579046'),
(83, 1, '208.0', '2020-05-06 13:11:58.191429'),
(84, 1, '208.0', '2020-05-06 13:12:47.157114'),
(85, 1, '207.0', '2020-05-06 13:13:11.448230'),
(86, 1, '209.0', '2020-05-06 13:13:53.692866'),
(87, 1, '208.0', '2020-05-06 13:14:38.838135'),
(88, 1, '208.0', '2020-05-06 13:15:49.623359'),
(89, 1, '208.0', '2020-05-06 13:16:33.355526'),
(90, 1, '207.0', '2020-05-06 13:17:17.011040'),
(91, 1, '209.0', '2020-05-06 13:18:00.753465'),
(92, 1, '209.0', '2020-05-06 13:18:42.361146'),
(93, 1, '207.0', '2020-05-06 13:19:27.985281'),
(94, 1, '208.0', '2020-05-06 13:20:10.881549'),
(95, 1, '208.0', '2020-05-06 13:21:00.016429'),
(96, 1, '103.0', '2020-05-06 13:21:47.431789'),
(97, 1, '208.0', '2020-05-06 13:22:12.697938'),
(98, 1, '208.0', '2020-05-06 13:22:50.147151'),
(99, 1, '209.0', '2020-05-06 13:23:37.928950'),
(100, 1, '208.0', '2020-05-06 13:24:24.744348'),
(101, 1, '208.0', '2020-05-06 13:25:11.493397'),
(102, 1, '208.0', '2020-05-06 13:26:02.444339'),
(103, 1, '4.0', '2020-05-06 14:57:59.364716'),
(104, 1, '4.0', '2020-05-06 15:00:03.522249'),
(105, 1, '4.0', '2020-05-06 15:01:30.996526'),
(106, 1, '4.0', '2020-05-06 15:02:13.828411'),
(107, 1, '4.0', '2020-05-06 15:03:11.220008'),
(108, 1, '4.0', '2020-05-06 15:03:57.461849'),
(109, 1, '206.0', '2020-05-06 15:05:03.735071'),
(110, 1, '207.0', '2020-05-06 15:06:43.673856'),
(111, 1, '206.0', '2020-05-06 15:07:32.648529'),
(112, 1, '207.0', '2020-05-06 15:08:01.031559'),
(113, 1, '207.0', '2020-05-06 15:08:44.546919'),
(114, 1, '199.0', '2020-05-06 15:09:36.669959'),
(115, 1, '207.0', '2020-05-06 15:10:38.228476'),
(116, 1, '206.0', '2020-05-06 15:11:42.178678'),
(117, 1, '207.0', '2020-05-06 15:12:42.740834'),
(118, 1, '207.0', '2020-05-06 15:13:41.072072');

-- --------------------------------------------------------

--
-- Table structure for table `slope_sensor_flag`
--

CREATE TABLE IF NOT EXISTS `slope_sensor_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `pause_waring_duration_end_datetime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `slope_sensor_flag`
--

INSERT INTO `slope_sensor_flag` (`id`, `sensor_id`, `limit`, `type`, `created_date`, `modified_date`, `pause_waring_duration_end_datetime`) VALUES
(1, 1, 1, 'Medium', '2020-04-27 11:11:43.235899', '2020-04-27 12:33:00.742306', '2020-04-27 11:11:43.235899');

-- --------------------------------------------------------

--
-- Table structure for table `sms_configuration`
--

CREATE TABLE IF NOT EXISTS `sms_configuration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) DEFAULT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `sender_id` varchar(255) DEFAULT NULL,
  `valid_till` date DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `limit` int(11) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sms_configuration_user_id_id_5d739909_fk_auth_user_id` (`user_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sms_configuration`
--

INSERT INTO `sms_configuration` (`id`, `url`, `auth_key`, `sender_id`, `valid_till`, `counter`, `limit`, `created_date`, `user_id_id`) VALUES
(1, 'http://Loginsms.ewyde.com/rest/services/sendSMS/sendGroupSms', 'bd30c9a721ce84d36993912e07eb65c', 'Vikash', '2019-11-30', 0, 10000, '2019-10-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `snippets_comment`
--

CREATE TABLE IF NOT EXISTS `snippets_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `commented_at` datetime(6) NOT NULL,
  `commented_by_id` int(11) NOT NULL,
  `commented_to_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `snippets_comment_commented_by_id_645c6f6d_fk_auth_user_id` (`commented_by_id`),
  KEY `snippets_comment_commented_to_id_8d71ee14_fk_snippets_snippet_id` (`commented_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `snippets_snippet`
--

CREATE TABLE IF NOT EXISTS `snippets_snippet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `code` longtext NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `snippets_snippet_created_by_id_a14886ce_fk_auth_user_id` (`created_by_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `strata_location`
--

CREATE TABLE IF NOT EXISTS `strata_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(200) NOT NULL,
  `tag_no` varchar(200) DEFAULT NULL,
  `x_axis` double DEFAULT NULL,
  `y_axis` double DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` date NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_name_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strata_location_mine_name_id_44071eb4_fk_MineDetails_id` (`mine_name_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

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

CREATE TABLE IF NOT EXISTS `strata_sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `mine_name_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `strata_sensor_location_id_id_4f56d64d_fk_strata_location_id` (`location_id_id`),
  KEY `strata_sensor_mine_name_id_8564d45d_fk_MineDetails_id` (`mine_name_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `strata_sensor`
--

INSERT INTO `strata_sensor` (`id`, `sensor_name`, `sensor_unit`, `tag_no`, `level_1_warning_unit`, `level_2_warning_unit`, `level_3_warning_unit`, `level_1_color`, `level_2_color`, `level_3_color`, `level_1_msg`, `level_2_msg`, `level_3_msg`, `level_1_audio`, `level_2_audio`, `level_3_audio`, `ip_address`, `interval_time`, `audio_play_type`, `description`, `created_date`, `modified_date`, `location_id_id`, `mine_name_id`) VALUES
(1, 'convergence', 'mm', 'c67', 2, 3, 5, '#ADFF2F', '#FFA500', '#FF0000', 'Strata Condition:First Stage Warning Message , Please be Careful.', 'Strata Condition:Second Stage Warning Message , Please be alert situation is not good.', 'Strata Condition:Third Stage Warning Message , Please  leave the underground', 'strata_warning_audio/strata-first-level-warning_richa_Orlrnwt.mp3', 'strata_warning_audio/strata_second_level_warning_richa_PKShIBB.mp3', 'strata_warning_audio/strata_third_level_warning_richa_0F00vvU.mp3', '192.168.1.201', 30, 'mp3only', 'n', '2019-10-21 12:10:11.972045', '2019-12-26 10:41:59.299494', 1, 1),
(2, 'Load Cell', 'mm', '', 100, 200, 300, '#ADFF2F', '#FFA500', '#FF0000', 'Strata Condition:First Stage Warning Message , Please be Careful.', 'Strata Condition:Second Stage Warning Message , Please be alert situation is not good.', 'Strata Condition:Third Stage Warning Message , Please  leave the underground', 'strata_warning_audio/strata-first-level-warning_richa_6ethUA3.mp3', 'strata_warning_audio/strata_second_level_warning_richa_Vx3SLyC.mp3', 'strata_warning_audio/strata_third_level_warning_richa_aSpaoRk.mp3', '192.168.1.181', 30, 'mp3only', 'vv', '2019-11-21 12:25:53.689867', '2019-12-26 10:41:02.199285', 2, 1),
(3, 'convergence (water test)', 'mm', 'c89', 5, 8, 10, '#ADFF2F', '#FFA500', '#FF0000', 'Strata Condition:First Stage Warning Message , Please be Careful.', 'Strata Condition:Second Stage Warning Message , Please be alert situation is not good.', 'Strata Condition:Third Stage Warning Message , Please  leave the underground', 'strata_warning_audio/strata-first-level-warning_richa_6ethUA3_zEDaTQn.mp3', 'strata_warning_audio/strata_second_level_warning_richa_Vx3SLyC_knkMJRk.mp3', 'strata_warning_audio/strata_third_level_warning_richa_aSpaoRk_iPUlnac.mp3', '192.168.1.181', 30, 'mp3only', '', '2019-12-31 11:15:30.360694', '2020-03-02 12:18:35.011663', 3, 8),
(4, 'Convergence (original)', 'mm', 'tag0019', 5, 10, 20, '#ADFF2F', '#FFA500', '#FF0000', 'Strata Condition:First Stage Warning Message , Please be Careful.', 'Strata Condition:Second Stage Warning Message , Please be alert situation is not good.', 'Strata Condition:Third Stage Warning Message , Please  leave the underground', 'strata_warning_audio/strata-first-level-warning_5RO3dVq_3Mm4I4t.mp3', 'strata_warning_audio/strata_second_level_warning_richa_Vx3SLyC_8YC00HU.mp3', 'strata_warning_audio/strata_third_level_warning_richa_0F00vvU_pdz14mS.mp3', '192.168.1.201', 20, 'mp3only', '', '2020-03-02 11:00:12.806988', '2020-03-12 18:01:14.592239', 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `strata_sensor_data`
--

CREATE TABLE IF NOT EXISTS `strata_sensor_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `sensor_value` varchar(50) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=395 ;

--
-- Dumping data for table `strata_sensor_data`
--

INSERT INTO `strata_sensor_data` (`id`, `sensor_id`, `sensor_value`, `created_date`) VALUES
(1, 1, 'Network Error', '2019-10-21 12:15:52.324515'),
(2, 1, 'Network Error', '2019-10-21 12:16:13.710658'),
(3, 1, 'Network Error', '2019-10-21 12:16:38.475547'),
(4, 1, 'Network Error', '2019-10-21 12:16:59.868661'),
(5, 1, 'Network Error', '2019-10-21 12:17:24.417928'),
(6, 1, 'Network Error', '2019-10-21 12:17:49.041650'),
(7, 1, 'Network Error', '2019-10-21 12:18:13.254220'),
(8, 1, 'Network Error', '2019-10-21 12:18:34.518618'),
(9, 1, 'Network Error', '2019-10-21 12:18:58.587631'),
(10, 1, 'Network Error', '2019-10-21 12:19:22.760896'),
(11, 1, 'Network Error', '2019-10-21 12:19:44.179061'),
(12, 1, 'Network Error', '2019-10-21 12:20:09.169995'),
(13, 1, 'Network Error', '2019-10-21 12:20:34.319873'),
(14, 1, 'Network Error', '2019-10-21 12:20:55.595652'),
(15, 1, 'Network Error', '2019-10-21 12:21:19.726941'),
(16, 1, 'Network Error', '2019-10-21 12:21:45.015728'),
(17, 1, 'Network Error', '2019-10-21 12:22:07.218678'),
(18, 1, 'Network Error', '2019-10-21 12:22:34.081029'),
(19, 1, 'Network Error', '2019-10-21 12:22:55.413789'),
(20, 1, 'Network Error', '2019-10-21 12:23:19.731781'),
(21, 1, 'Network Error', '2019-10-21 12:23:41.922049'),
(22, 1, 'Network Error', '2019-10-21 12:24:08.165498'),
(23, 1, 'Network Error', '2019-10-21 12:24:29.542785'),
(24, 1, 'Network Error', '2019-10-21 12:24:53.590379'),
(25, 1, 'Network Error', '2019-10-21 12:25:19.872115'),
(26, 1, 'Network Error', '2019-10-21 12:25:41.284083'),
(27, 1, 'Network Error', '2019-10-21 12:26:08.182811'),
(28, 1, 'Network Error', '2019-10-21 12:26:31.468579'),
(29, 1, 'Network Error', '2019-10-21 12:26:53.716322'),
(30, 1, 'Network Error', '2019-10-21 12:27:17.814950'),
(31, 1, 'Network Error', '2019-10-21 12:27:43.026105'),
(32, 1, 'Network Error', '2019-10-21 12:28:04.267516'),
(33, 1, 'Network Error', '2019-10-21 12:28:29.401124'),
(34, 1, 'Network Error', '2019-10-21 12:28:50.748497'),
(35, 1, 'Network Error', '2019-10-21 12:29:14.756714'),
(36, 1, 'Network Error', '2019-10-21 12:29:38.947653'),
(37, 1, 'Network Error', '2019-10-21 12:30:03.197766'),
(38, 1, 'Network Error', '2019-10-21 12:30:24.592073'),
(39, 1, 'Network Error', '2019-10-21 12:30:49.097277'),
(40, 1, 'Network Error', '2019-10-21 12:31:13.832278'),
(41, 1, 'Network Error', '2019-10-21 12:31:38.007333'),
(42, 1, 'Network Error', '2019-10-21 12:31:59.322621'),
(43, 1, 'Network Error', '2019-10-21 12:32:23.455157'),
(44, 1, 'Network Error', '2019-10-21 12:32:44.753401'),
(45, 1, 'Network Error', '2019-10-21 12:33:08.639030'),
(46, 1, 'Network Error', '2019-10-21 12:33:32.952268'),
(47, 1, 'Network Error', '2019-10-21 12:33:58.110015'),
(48, 1, 'Network Error', '2019-10-21 12:34:19.546044'),
(49, 1, 'Network Error', '2019-10-21 12:34:43.470686'),
(50, 1, 'Network Error', '2019-10-21 12:35:07.670543'),
(51, 1, 'Network Error', '2019-12-04 15:58:38.365586'),
(52, 1, 'Network Error', '2019-12-04 15:59:45.292853'),
(53, 1, 'Network Error', '2019-12-04 16:00:37.525377'),
(54, 1, 'Network Error', '2019-12-04 16:01:06.945512'),
(55, 1, 'Network Error', '2019-12-04 16:01:33.461879'),
(56, 1, 'Network Error', '2019-12-04 16:02:02.856682'),
(57, 1, 'Network Error', '2019-12-04 16:02:34.631093'),
(58, 1, 'Network Error', '2019-12-04 16:02:58.694398'),
(59, 1, 'Network Error', '2019-12-04 16:03:36.352524'),
(60, 1, 'Network Error', '2019-12-04 16:03:57.646040'),
(61, 1, 'Network Error', '2019-12-04 16:04:36.977261'),
(62, 1, 'Network Error', '2019-12-04 16:04:58.219117'),
(63, 1, 'Network Error', '2019-12-04 16:05:34.351613'),
(64, 1, 'Network Error', '2019-12-04 16:05:55.834169'),
(65, 1, 'Network Error', '2019-12-04 16:06:31.284848'),
(66, 1, 'Network Error', '2019-12-04 16:06:52.660682'),
(67, 1, 'Network Error', '2019-12-04 16:07:30.073703'),
(68, 1, 'Network Error', '2020-03-12 12:04:58.849712'),
(69, 1, 'Network Error', '2020-03-12 12:06:44.535589'),
(70, 1, 'Network Error', '2020-03-12 12:07:08.305698'),
(71, 1, 'Network Error', '2020-03-12 17:23:44.628698'),
(72, 1, 'Network Error', '2020-03-12 17:24:05.931196'),
(73, 1, 'Network Error', '2020-03-12 17:24:53.926827'),
(74, 1, 'Network Error', '2020-03-12 17:25:15.931501'),
(75, 1, 'Network Error', '2020-03-12 17:26:04.135836'),
(76, 1, 'Network Error', '2020-03-12 17:26:25.439432'),
(77, 1, 'Network Error', '2020-03-12 17:27:21.911218'),
(78, 1, 'Network Error', '2020-03-12 17:27:43.205841'),
(79, 1, 'Network Error', '2020-03-12 17:28:38.657733'),
(80, 1, 'Network Error', '2020-03-12 17:29:00.118733'),
(81, 1, 'Network Error', '2020-03-12 17:29:59.857796'),
(82, 1, 'Network Error', '2020-03-12 17:30:21.181439'),
(83, 1, 'Network Error', '2020-03-12 17:31:12.831384'),
(84, 1, 'Network Error', '2020-03-12 17:31:34.106637'),
(85, 1, 'Network Error', '2020-03-12 17:32:24.986489'),
(86, 1, 'Network Error', '2020-03-12 17:32:46.314209'),
(87, 1, 'Network Error', '2020-03-12 17:33:35.537411'),
(88, 1, 'Network Error', '2020-03-12 17:34:05.356127'),
(89, 1, 'Network Error', '2020-03-12 17:34:56.679527'),
(90, 1, 'Network Error', '2020-03-12 17:35:18.781589'),
(91, 1, 'Network Error', '2020-03-12 17:36:09.953447'),
(92, 1, 'Network Error', '2020-03-12 17:36:31.215273'),
(93, 1, 'Network Error', '2020-03-12 17:37:26.471128'),
(94, 1, 'Network Error', '2020-03-12 17:37:47.729887'),
(95, 1, 'Network Error', '2020-03-12 17:38:39.043353'),
(96, 1, 'Network Error', '2020-03-12 17:39:00.421856'),
(97, 1, 'Network Error', '2020-03-12 17:39:52.153010'),
(98, 1, 'Network Error', '2020-03-12 17:40:13.977210'),
(99, 1, 'Network Error', '2020-03-12 17:41:31.544347'),
(100, 1, 'Network Error', '2020-03-12 17:41:52.930577'),
(101, 1, 'Network Error', '2020-03-12 17:43:08.066971'),
(102, 1, 'Network Error', '2020-03-12 17:43:29.456257'),
(103, 1, 'Network Error', '2020-03-12 17:44:20.560689'),
(104, 1, 'Network Error', '2020-03-12 17:44:42.551859'),
(105, 1, 'Network Error', '2020-03-12 17:45:31.643133'),
(106, 1, 'Network Error', '2020-03-12 17:45:52.985502'),
(107, 1, 'Network Error', '2020-03-12 17:46:45.073257'),
(108, 1, 'Network Error', '2020-03-12 17:47:06.578375'),
(109, 1, 'Network Error', '2020-03-12 17:47:57.507649'),
(110, 1, 'Network Error', '2020-03-12 17:48:18.843367'),
(111, 1, 'Network Error', '2020-03-12 17:49:11.823213'),
(112, 1, 'Network Error', '2020-03-12 17:49:33.159653'),
(113, 1, 'Network Error', '2020-03-12 17:50:24.948325'),
(114, 1, 'Network Error', '2020-03-12 17:50:46.242611'),
(115, 1, 'Network Error', '2020-03-12 17:51:38.304890'),
(116, 1, 'Network Error', '2020-03-12 17:51:59.744718'),
(117, 1, 'Network Error', '2020-03-12 17:52:51.623114'),
(118, 1, 'Network Error', '2020-03-12 17:53:13.381384'),
(119, 1, 'Network Error', '2020-03-12 17:54:04.711679'),
(120, 1, 'Network Error', '2020-03-12 17:54:26.041240'),
(121, 1, '0.23', '2020-03-12 17:55:19.281779'),
(122, 1, '0.23', '2020-03-12 17:55:23.006370'),
(123, 1, '0.23', '2020-03-12 17:55:53.169184'),
(124, 1, '0.23', '2020-03-12 17:56:16.684398'),
(125, 1, '0.23', '2020-03-12 17:56:36.410835'),
(126, 1, '0.23', '2020-03-12 17:56:37.578148'),
(127, 1, '0.68', '2020-03-12 17:57:16.744142'),
(128, 1, '0.23', '2020-03-12 17:57:18.206570'),
(129, 1, '0.23', '2020-03-12 17:57:56.894513'),
(130, 1, '0.23', '2020-03-12 17:58:00.428286'),
(131, 1, '98.1', '2020-03-12 17:58:42.397583'),
(132, 1, '1.59', '2020-03-12 17:58:51.141031'),
(133, 1, '0.0', '2020-03-12 17:59:36.687811'),
(134, 1, '0.23', '2020-03-12 17:59:41.771347'),
(135, 1, '1.59', '2020-03-12 18:00:08.732136'),
(136, 1, '0.23', '2020-03-12 18:00:34.392401'),
(137, 1, '0.23', '2020-03-12 18:00:59.112203'),
(138, 1, '0.23', '2020-03-12 18:01:27.448159'),
(139, 1, '10.88', '2020-03-12 18:01:50.373970'),
(140, 1, '47.8', '2020-03-12 18:02:21.179003'),
(141, 1, '47.58', '2020-03-12 18:02:35.571780'),
(142, 1, '47.35', '2020-03-12 18:02:39.055055'),
(143, 1, '0.23', '2020-03-12 18:03:21.917944'),
(144, 1, '0.0', '2020-03-12 18:03:26.853307'),
(145, 1, '0.23', '2020-03-12 18:04:13.231507'),
(146, 1, '0.23', '2020-03-12 18:04:23.242693'),
(147, 1, '1.59', '2020-03-12 18:05:24.849623'),
(148, 1, '0.23', '2020-03-12 18:05:31.750291'),
(149, 1, '1.13', '2020-03-12 18:06:03.947418'),
(150, 1, '0.23', '2020-03-12 18:06:36.191656'),
(151, 1, '0.0', '2020-03-13 10:04:39.320542'),
(152, 1, '0.23', '2020-03-13 10:05:06.411551'),
(153, 1, '1.59', '2020-03-13 10:05:42.526343'),
(154, 1, '0.0', '2020-03-13 10:06:37.413220'),
(155, 1, '0.23', '2020-03-13 10:07:37.996949'),
(156, 3, '34.0', '2020-03-13 10:08:23.643409'),
(157, 1, '0.23', '2020-03-13 10:08:32.491923'),
(158, 1, '0.23', '2020-03-13 10:09:12.605145'),
(159, 3, '34.0', '2020-03-13 10:09:39.551464'),
(160, 1, '0.23', '2020-03-13 10:09:49.867891'),
(161, 3, '34.0', '2020-03-13 10:10:21.463630'),
(162, 1, '0.23', '2020-03-13 10:10:31.039948'),
(163, 3, '34.0', '2020-03-13 10:11:00.242273'),
(164, 1, '0.23', '2020-03-13 10:11:08.309381'),
(165, 3, '34.0', '2020-03-13 10:11:52.563793'),
(166, 1, '0.23', '2020-03-13 10:12:07.599653'),
(167, 3, '34.0', '2020-03-13 10:12:46.770027'),
(168, 1, '0.23', '2020-03-13 10:12:56.836954'),
(169, 3, '34.0', '2020-03-13 10:13:40.034666'),
(170, 1, '0.23', '2020-03-13 10:13:48.775990'),
(171, 3, '34.0', '2020-03-13 10:14:30.339525'),
(172, 1, '0.45', '2020-03-13 10:14:43.733866'),
(173, 3, '34.0', '2020-03-13 10:15:27.568050'),
(174, 1, '0.23', '2020-03-13 10:15:36.803831'),
(175, 3, '34.0', '2020-03-13 10:16:08.883496'),
(176, 1, '0.23', '2020-03-13 10:16:21.849882'),
(177, 1, '0.23', '2020-03-13 10:17:07.837676'),
(178, 4, '0.23', '2020-03-13 10:17:47.183225'),
(179, 3, '35.0', '2020-03-13 10:18:20.990043'),
(180, 1, '0.68', '2020-03-13 10:18:59.884934'),
(181, 4, '0.23', '2020-03-13 10:19:25.126852'),
(182, 3, '35.0', '2020-03-13 10:20:02.397118'),
(183, 1, '0.23', '2020-03-13 10:20:36.041993'),
(184, 4, '1.81', '2020-03-13 10:21:11.791490'),
(185, 3, '35.0', '2020-03-13 10:21:39.548701'),
(186, 1, '1.59', '2020-03-13 10:22:15.076824'),
(187, 3, '35.0', '2020-03-13 10:23:25.150737'),
(188, 4, '0.23', '2020-03-13 10:23:36.676937'),
(189, 1, '0.23', '2020-03-13 10:23:54.358573'),
(190, 3, '35.0', '2020-03-13 10:24:50.159926'),
(191, 4, '0.23', '2020-03-13 10:24:57.159959'),
(192, 1, '0.23', '2020-03-13 10:25:17.360024'),
(193, 3, '35.0', '2020-03-13 10:26:24.210555'),
(194, 4, '0.45', '2020-03-13 10:26:35.819706'),
(195, 1, '0.23', '2020-03-13 10:26:47.387073'),
(196, 3, '36.0', '2020-03-13 10:27:47.302226'),
(197, 4, '0.23', '2020-03-13 10:27:56.253469'),
(198, 1, '0.23', '2020-03-13 10:28:08.962966'),
(199, 3, '36.0', '2020-03-13 10:29:04.743332'),
(200, 1, '0.23', '2020-03-13 10:29:19.462477'),
(201, 3, '35.0', '2020-03-13 10:30:39.386667'),
(202, 1, '1.59', '2020-03-13 10:30:56.531164'),
(203, 1, 'Network Error', '2020-03-18 17:47:53.360346'),
(204, 3, '5.0', '2020-03-18 17:48:15.264061'),
(205, 1, 'Network Error', '2020-03-18 17:48:43.866549'),
(206, 3, '5.0', '2020-03-18 17:49:05.531992'),
(207, 1, 'Network Error', '2020-03-18 17:49:36.050570'),
(208, 3, '5.0', '2020-03-18 17:49:57.301795'),
(209, 1, 'Network Error', '2020-04-27 11:08:33.957952'),
(210, 3, '75.0', '2020-04-27 11:09:34.715340'),
(211, 1, 'Network Error', '2020-04-27 11:09:36.899026'),
(212, 3, '75.0', '2020-04-27 11:10:02.614392'),
(213, 1, 'Network Error', '2020-04-27 11:10:27.397121'),
(214, 3, '75.0', '2020-04-27 11:10:52.994755'),
(215, 1, 'Network Error', '2020-04-27 11:11:18.490900'),
(216, 3, '75.0', '2020-04-27 11:11:47.356871'),
(217, 1, 'Network Error', '2020-04-27 11:12:10.773307'),
(218, 3, '75.0', '2020-04-27 11:12:38.730243'),
(219, 1, 'Network Error', '2020-04-27 11:13:02.829436'),
(220, 3, '75.0', '2020-04-27 11:13:29.976709'),
(221, 1, 'Network Error', '2020-04-27 11:13:58.071467'),
(222, 3, '76.0', '2020-04-27 11:14:24.402864'),
(223, 1, 'Network Error', '2020-04-27 11:15:00.778275'),
(224, 3, '75.0', '2020-04-27 11:15:26.875371'),
(225, 1, 'Network Error', '2020-04-27 11:15:57.253091'),
(226, 3, '75.0', '2020-04-27 11:16:21.208142'),
(227, 1, 'Network Error', '2020-04-27 11:16:46.498947'),
(228, 3, '76.0', '2020-04-27 11:17:10.570579'),
(229, 1, 'Network Error', '2020-04-27 11:17:38.709329'),
(230, 3, '76.0', '2020-04-27 11:18:01.463555'),
(231, 1, 'Network Error', '2020-04-27 11:18:28.160473'),
(232, 3, '75.0', '2020-04-27 11:18:51.366728'),
(233, 1, 'Network Error', '2020-04-27 11:19:19.593438'),
(234, 3, '75.0', '2020-04-27 11:19:42.953380'),
(235, 3, '76.0', '2020-04-27 11:20:15.902658'),
(236, 1, 'Network Error', '2020-04-27 11:20:17.891837'),
(237, 3, '75.0', '2020-04-27 11:20:45.383765'),
(238, 1, 'Network Error', '2020-04-27 11:21:08.731990'),
(239, 3, '94.0', '2020-04-27 11:21:37.591117'),
(240, 1, 'Network Error', '2020-04-27 11:22:01.642280'),
(241, 3, '75.0', '2020-04-27 11:22:29.630197'),
(242, 1, 'Network Error', '2020-04-27 11:22:45.239520'),
(243, 3, '75.0', '2020-04-27 11:23:16.254278'),
(244, 1, 'Network Error', '2020-04-27 11:23:43.403787'),
(245, 3, '75.0', '2020-04-27 11:24:15.352261'),
(246, 1, 'Network Error', '2020-04-27 11:24:39.637036'),
(247, 3, '75.0', '2020-04-27 11:25:20.693633'),
(248, 1, 'Network Error', '2020-04-27 11:25:47.569740'),
(249, 3, '75.0', '2020-04-27 11:26:11.636394'),
(250, 1, 'Network Error', '2020-04-27 11:26:36.757826'),
(251, 3, '75.0', '2020-04-27 11:27:01.236440'),
(252, 1, 'Network Error', '2020-04-27 11:27:30.823761'),
(253, 3, '75.0', '2020-04-27 11:27:53.915451'),
(254, 1, 'Network Error', '2020-04-27 11:28:24.165984'),
(255, 3, '75.0', '2020-04-27 11:28:47.649958'),
(256, 1, 'Network Error', '2020-04-27 11:29:14.213193'),
(257, 3, '75.0', '2020-04-27 11:29:35.615119'),
(258, 1, 'Network Error', '2020-04-27 11:30:14.614228'),
(259, 3, '75.0', '2020-04-27 11:30:35.950092'),
(260, 3, '75.0', '2020-04-27 11:31:05.728062'),
(261, 1, 'Network Error', '2020-04-27 11:31:09.730272'),
(262, 3, '75.0', '2020-04-27 11:31:37.920334'),
(263, 1, 'Network Error', '2020-04-27 11:32:10.315689'),
(264, 3, '76.0', '2020-04-27 11:32:48.491628'),
(265, 1, 'Network Error', '2020-04-27 11:33:37.240452'),
(266, 3, '6.0', '2020-04-27 11:34:22.800718'),
(267, 1, 'Network Error', '2020-04-27 11:35:23.487651'),
(268, 3, '6.0', '2020-04-27 11:36:00.417968'),
(269, 1, 'Network Error', '2020-04-27 11:36:41.885829'),
(270, 3, '7.0', '2020-04-27 11:37:37.862311'),
(271, 1, 'Network Error', '2020-04-27 11:38:44.391439'),
(272, 3, '6.0', '2020-04-27 11:39:35.373063'),
(273, 1, 'Network Error', '2020-04-27 11:40:52.924182'),
(274, 3, '7.0', '2020-04-27 11:41:44.895446'),
(275, 1, 'Network Error', '2020-04-27 11:42:42.147148'),
(276, 3, '7.0', '2020-04-27 11:43:12.320200'),
(277, 1, 'Network Error', '2020-04-27 11:43:49.586702'),
(278, 3, '7.0', '2020-04-27 11:44:42.643619'),
(279, 1, 'Network Error', '2020-04-27 11:46:01.316440'),
(280, 3, '7.0', '2020-04-27 11:46:54.185946'),
(281, 1, 'Network Error', '2020-04-27 11:47:51.668939'),
(282, 3, '7.0', '2020-04-27 11:48:50.885120'),
(283, 1, 'Network Error', '2020-04-27 11:49:45.133071'),
(284, 3, '7.0', '2020-04-27 11:50:41.140954'),
(285, 1, 'Network Error', '2020-04-27 11:51:39.313671'),
(286, 3, '7.0', '2020-04-27 11:52:27.619351'),
(287, 1, 'Network Error', '2020-04-27 11:53:24.902944'),
(288, 3, '124.0', '2020-04-27 11:54:06.043939'),
(289, 1, 'Network Error', '2020-04-27 11:55:01.910021'),
(290, 3, '75.0', '2020-04-27 11:55:52.009790'),
(291, 1, 'Network Error', '2020-04-27 11:56:44.718298'),
(292, 3, '76.0', '2020-04-27 11:57:39.997538'),
(293, 1, 'Network Error', '2020-04-27 11:58:33.774627'),
(294, 3, '76.0', '2020-04-27 11:59:30.859090'),
(295, 1, 'Network Error', '2020-04-27 12:00:28.484653'),
(296, 3, '71.0', '2020-04-27 12:01:22.781244'),
(297, 1, 'Network Error', '2020-04-27 12:02:22.432268'),
(298, 3, '71.0', '2020-04-27 12:03:13.630413'),
(299, 1, 'Network Error', '2020-04-27 12:04:26.417075'),
(300, 3, '71.0', '2020-04-27 12:05:18.686322'),
(301, 1, 'Network Error', '2020-04-27 12:06:27.491982'),
(302, 3, '71.0', '2020-04-27 12:07:23.747503'),
(303, 1, 'Network Error', '2020-04-27 12:08:34.351519'),
(304, 3, '72.0', '2020-04-27 12:09:17.514620'),
(305, 1, 'Network Error', '2020-04-27 12:09:54.832649'),
(306, 3, '71.0', '2020-04-27 12:10:51.338493'),
(307, 1, 'Network Error', '2020-04-27 12:12:00.759238'),
(308, 3, '115.0', '2020-04-27 12:12:39.186032'),
(309, 1, 'Network Error', '2020-04-27 12:13:13.645654'),
(310, 3, '72.0', '2020-04-27 12:14:00.932867'),
(311, 1, 'Network Error', '2020-04-27 12:14:57.398143'),
(312, 3, '72.0', '2020-04-27 12:15:37.629811'),
(313, 1, 'Network Error', '2020-04-27 12:16:19.105752'),
(314, 3, '6.0', '2020-04-27 12:17:00.278916'),
(315, 1, 'Network Error', '2020-04-27 12:17:34.729641'),
(316, 3, '6.0', '2020-04-27 12:18:32.695131'),
(317, 1, 'Network Error', '2020-04-27 12:19:28.063845'),
(318, 3, '71.0', '2020-04-27 12:20:22.431578'),
(319, 1, 'Network Error', '2020-04-27 12:21:27.137834'),
(320, 3, '71.0', '2020-04-27 12:22:23.411707'),
(321, 1, 'Network Error', '2020-04-27 12:23:21.060818'),
(322, 3, '70.0', '2020-04-27 12:24:07.257630'),
(323, 1, 'Network Error', '2020-04-27 12:25:03.949818'),
(324, 3, '72.0', '2020-04-27 12:25:54.038746'),
(325, 1, 'Network Error', '2020-04-27 12:26:48.614044'),
(326, 3, '75.0', '2020-04-27 12:27:29.840087'),
(327, 1, 'Network Error', '2020-04-27 12:28:05.231301'),
(328, 3, '72.0', '2020-04-27 12:29:01.044555'),
(329, 1, 'Network Error', '2020-04-27 12:29:57.201225'),
(330, 3, '6.0', '2020-04-27 12:30:47.670892'),
(331, 1, 'Network Error', '2020-04-27 12:31:41.890758'),
(332, 3, '6.0', '2020-04-27 12:32:31.832867'),
(333, 1, 'Network Error', '2020-04-27 12:33:38.232020'),
(334, 3, '207.0', '2020-05-05 16:28:32.646717'),
(335, 3, '104.0', '2020-07-16 14:22:26.688042'),
(336, 3, '111.0', '2020-07-16 14:25:35.804941'),
(337, 2, '110.0', '2020-07-16 14:26:17.258612'),
(338, 1, 'Network Error', '2020-07-16 14:26:29.353876'),
(339, 4, 'Network Error', '2020-07-16 14:26:51.957307'),
(340, 3, '113.0', '2020-07-16 14:27:54.375876'),
(341, 2, '104.0', '2020-07-16 14:28:06.405988'),
(342, 1, 'Network Error', '2020-07-16 14:28:12.047116'),
(343, 4, 'Network Error', '2020-07-16 14:28:33.317465'),
(344, 3, '111.0', '2020-07-16 14:29:06.980171'),
(345, 2, '103.0', '2020-07-16 14:29:23.140730'),
(346, 1, 'Network Error', '2020-07-16 14:29:27.171538'),
(347, 4, 'Network Error', '2020-07-16 14:29:49.612445'),
(348, 3, '103.0', '2020-07-16 14:30:21.806218'),
(349, 4, 'Network Error', '2020-07-16 14:30:45.519758'),
(350, 3, '110.0', '2020-07-16 14:31:17.469918'),
(351, 4, 'Network Error', '2020-07-16 14:31:33.569914'),
(352, 3, '105.0', '2020-07-16 14:32:01.785342'),
(353, 4, 'Network Error', '2020-07-16 14:32:22.027114'),
(354, 3, '105.0', '2020-07-16 14:32:50.952264'),
(355, 4, 'Network Error', '2020-07-16 14:33:10.742945'),
(356, 3, '110.0', '2020-07-16 14:33:38.817829'),
(357, 4, 'Network Error', '2020-07-16 14:33:59.109055'),
(358, 3, '110.0', '2020-07-16 14:34:27.391842'),
(359, 4, 'Network Error', '2020-07-16 14:34:47.732610'),
(360, 3, '111.0', '2020-07-16 14:35:15.807031'),
(361, 4, 'Network Error', '2020-07-16 14:35:37.664243'),
(362, 3, '110.0', '2020-07-16 14:36:06.466559'),
(363, 4, 'Network Error', '2020-07-16 14:36:28.840708'),
(364, 3, '104.0', '2020-07-16 14:36:58.970571'),
(365, 4, 'Network Error', '2020-07-16 14:37:19.234670'),
(366, 3, '106.0', '2020-07-16 14:37:47.469576'),
(367, 4, 'Network Error', '2020-07-16 14:38:07.727538'),
(368, 3, '113.0', '2020-07-16 14:38:35.926962'),
(369, 4, 'Network Error', '2020-07-16 14:38:56.200909'),
(370, 3, '111.0', '2020-07-16 14:39:24.796441'),
(371, 4, 'Network Error', '2020-07-16 14:39:44.689305'),
(372, 3, '102.0', '2020-07-16 14:40:13.074071'),
(373, 4, 'Network Error', '2020-07-16 14:40:33.328962'),
(374, 3, '113.0', '2020-07-16 14:41:00.528031'),
(375, 4, 'Network Error', '2020-07-16 14:41:23.814673'),
(376, 3, '111.0', '2020-07-16 14:41:51.997426'),
(377, 4, 'Network Error', '2020-07-16 14:42:12.262218'),
(378, 3, '112.0', '2020-07-16 14:42:39.545078'),
(379, 4, 'Network Error', '2020-07-16 14:43:00.900594'),
(380, 3, '103.0', '2020-07-16 14:43:30.019111'),
(381, 4, 'Network Error', '2020-07-16 14:43:51.274888'),
(382, 3, '111.0', '2020-07-16 14:44:19.876679'),
(383, 4, 'Network Error', '2020-07-16 14:44:40.807550'),
(384, 3, '112.0', '2020-07-16 14:45:09.033860'),
(385, 4, 'Network Error', '2020-07-16 14:45:30.274079'),
(386, 3, '111.0', '2020-07-16 14:45:58.625078'),
(387, 4, 'Network Error', '2020-07-16 14:46:18.789878'),
(388, 3, '111.0', '2020-07-16 14:46:47.356088'),
(389, 4, 'Network Error', '2020-07-16 14:47:06.321960'),
(390, 3, '111.0', '2020-07-16 14:47:34.630647'),
(391, 4, 'Network Error', '2020-07-16 14:47:55.896497'),
(392, 3, '110.0', '2020-07-16 14:48:22.145486'),
(393, 4, 'Network Error', '2020-07-16 14:48:43.286265'),
(394, 3, '110.0', '2020-07-16 14:49:11.654084');

-- --------------------------------------------------------

--
-- Table structure for table `strata_sensor_flag`
--

CREATE TABLE IF NOT EXISTS `strata_sensor_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `pause_waring_duration_end_datetime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `strata_sensor_flag`
--

INSERT INTO `strata_sensor_flag` (`id`, `sensor_id`, `limit`, `type`, `created_date`, `modified_date`, `pause_waring_duration_end_datetime`) VALUES
(1, 1, 5, 'High', '2020-03-12 17:58:50.871586', '2020-03-12 18:02:44.416958', '2020-03-12 17:58:50.871586'),
(2, 3, 1, 'High', '2020-03-13 10:08:28.135547', '2020-05-05 16:28:38.856118', '2020-03-13 10:08:28.135547');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_details`
--

CREATE TABLE IF NOT EXISTS `supplier_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Supplier_Details_mine_id_id_6edb13d0_fk_MineDetails_id` (`mine_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `supplier_details`
--

INSERT INTO `supplier_details` (`id`, `business_name`, `business_website`, `name`, `mobile_no`, `email`, `pincode`, `address`, `landmark`, `area`, `city`, `state`, `map_loc`, `pan`, `gstin`, `notes`, `mine_id_id`) VALUES
(1, 'Jhajharia Computers', 'www.Jhajharia@co.in', 'Rakesh Tekam', 9204851311, 'default@gmail.com', 826001, 'Geeta Tower', 'Geeta Tower', 'Bank More', 'Dhanbad', 'Jharkhand', 'Geeta Tower', 'AEYPV7665N', 'AEYPV7665N', 'No notes', 1),
(2, 'Desktop dealer', 'www.desktopd@co.in', 'Rajesh', 9883268534, 'default@gmail.com', 822129, 'Bartand', 'Near bus stand', 'Bartand', 'Dhanbad', 'Jharkhand', 'Jharkhand', 'CIRPK1234', 'CIRPK1234', '', 1),
(4, 'Priya Infotech', 'www.priya.co.in', 'Priya Deshaye', 9852961805, 'default@gmail.com', 828309, 'Fathepur Lane', 'Nai Duniya Mohlla', 'Chinakuri', 'Dhanbad', 'Jharkhand', 'Dhanbad', 'CIRKL4567', '35AABCS1429B1ZX', 'Dealing done on 15 Nov', 2),
(5, 'ADITYA EQUIPMENTS AND SERVICE (AES)', 'WWW.ADITA.CO.IN', 'ADITYA  RAJ', 9883268534, 'ADITRA@gmail.com', 826005, 'Old, Government Polytechnic Rd, Shankar Colony', 'Forest Colony', 'Saraidhella', 'Dhanbad', 'Jharkhand', '', 'ADDR123', '37AABCS1429B1ZT', '', 3),
(7, 'Lakhmi Interprises', 'www.lakhmi.co.in', 'Lakhmi Narayan', 9883268534, 'default@gmail.com', 123456, 'bnp', 'Near Gate No1', 'Bratand', 'Dhanbad', 'Jharkhand', '', '123456', '123ADRTGBU12', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `temp_monitoring_automatic`
--

CREATE TABLE IF NOT EXISTS `temp_monitoring_automatic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wbt` double NOT NULL,
  `dbt` double NOT NULL,
  `relativeHumidity` double NOT NULL,
  `dewPointTemp` double NOT NULL,
  `moistureContent` double NOT NULL,
  `enthalpy` double NOT NULL,
  `sigmaHeat` double NOT NULL,
  `rel_hum_status` varchar(100) NOT NULL,
  `dew_status` varchar(100) NOT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `temp_monitoring_automatic`
--

INSERT INTO `temp_monitoring_automatic` (`id`, `wbt`, `dbt`, `relativeHumidity`, `dewPointTemp`, `moistureContent`, `enthalpy`, `sigmaHeat`, `rel_hum_status`, `dew_status`, `ip_address`, `created_date`, `modified_date`) VALUES
(1, 28.58, 28.58, 100, 20.79046827259868, 19.837352727679967, 79.36853435728696, 76.99470825529961, 'Normal', 'Normal', '192.168.1.11', '2020-07-16 15:03:49.755853', '2020-07-16 15:03:49.755853'),
(2, 28.58, 29.06, 96.57750111559898, 20.66240079436249, 19.63268555633894, 79.34537270381847, 76.99603798836937, 'Danger', 'Normal', '192.168.1.11', '2020-07-16 15:04:14.809859', '2020-07-16 15:04:14.809859'),
(3, 29.06, 29.06, 100, 21.106083958462904, 20.35118958905926, 81.18036590101514, 78.70415078169422, 'Normal', 'Normal', '192.168.1.11', '2020-07-16 15:04:21.818265', '2020-07-16 15:04:21.818265');

-- --------------------------------------------------------

--
-- Table structure for table `temp_monitoring_manual`
--

CREATE TABLE IF NOT EXISTS `temp_monitoring_manual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wbt` double NOT NULL,
  `dbt` double NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `temp_monitoring_manual`
--

INSERT INTO `temp_monitoring_manual` (`id`, `wbt`, `dbt`, `date`) VALUES
(1, 22, 23, '2020-07-16');

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE IF NOT EXISTS `todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(1000) DEFAULT NULL,
  `mode` varchar(100) DEFAULT NULL,
  `row_order` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tracking_router`
--

CREATE TABLE IF NOT EXISTS `tracking_router` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `router_id` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `location` varchar(200) DEFAULT NULL,
  `is_block` varchar(100) NOT NULL,
  `x_axis` double DEFAULT NULL,
  `y_axis` double DEFAULT NULL,
  `ip_add` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tracking_router_mine_id_id_router_id_1ac31439_uniq` (`mine_id_id`,`router_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tracking_router`
--

INSERT INTO `tracking_router` (`id`, `router_id`, `address`, `location`, `is_block`, `x_axis`, `y_axis`, `ip_add`, `created_date`, `modified_date`, `mine_id_id`) VALUES
(1, 'R001', 'R1', 'Main Building Right', 'No', 58.04, 52.13, '192.168.1.120', '2019-08-07 16:45:04.334554', '2020-03-02 12:11:19.223519', 8),
(2, 'R002', 'R2', 'Main Building Right 1', 'No', 60.13, 43.33, '192.168.1.121', '2019-08-07 16:52:09.813057', '2020-03-02 12:11:33.383042', 8),
(3, 'R003', 'R3', 'Main Building Left', 'No', 66.67, 56.76, '192.168.1.1', '2019-09-13 10:42:06.889634', '2019-10-21 11:10:06.329887', 1),
(4, 'R004', 'A', 'Stairs Left', 'No', 28.07, 56.76, '192.168.1.1', '2019-09-30 11:29:48.098325', '2019-10-14 17:46:29.417573', 1),
(5, 'R005', 'Dhanbad', 'Near Pillar 17', 'No', 68.87, 50.56, '192.168.1.122', '2019-10-14 17:32:55.436017', '2020-03-02 12:11:42.422695', 8),
(7, 'R006', 'Dhanbad', 'Near Pillar 17', 'No', 61.28, 28.43, '192.168.1.123', '2019-10-14 17:44:12.687149', '2020-03-02 12:11:54.092659', 8),
(8, 'R007', 'g', 'ggg', 'No', 92.59, 34.44, '192.168.1.211', '2019-10-31 16:12:11.033573', '2019-10-31 16:12:11.034571', 1),
(9, 'R007', 'R7', 'Near Blocked Area 1', 'Yes', 71.76, 8.61, '192.168.1.124', '2020-03-17 11:39:14.279081', '2020-03-17 11:39:14.279081', 8);

-- --------------------------------------------------------

--
-- Table structure for table `training_attendance`
--

CREATE TABLE IF NOT EXISTS `training_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `training_date` varchar(255) DEFAULT NULL,
  `training_type` varchar(255) DEFAULT NULL,
  `training_tittle` varchar(255) DEFAULT NULL,
  `training_desc` varchar(255) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  `shift_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `training_attendance_mine_id_id_379eb13f_fk_MineDetails_id` (`mine_id_id`),
  KEY `training_attendance_shift_id_id_fd90e294_fk_MineShift_id` (`shift_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `training_attendance_details`
--

CREATE TABLE IF NOT EXISTS `training_attendance_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_present` varchar(3) NOT NULL,
  `emp_id_id` int(11) DEFAULT NULL,
  `training_attendance_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `training_attendance_details_emp_id_id_9a76abbf_fk_employee_id` (`emp_id_id`),
  KEY `training_attendance__training_attendance__e6610ad8_fk_training_` (`training_attendance_id_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `usersession`
--

CREATE TABLE IF NOT EXISTS `usersession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `session_id` varchar(40) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usersession_session_id_87b6832f_fk_django_session_session_key` (`session_id`),
  KEY `usersession_user_id_bc976b70_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `usersession`
--

INSERT INTO `usersession` (`id`, `ip`, `time`, `useragent`, `session_id`, `user_id`) VALUES
(1, '127.0.0.1', '2020-06-08 15:33:47.882198', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:46.0) Gecko/20100101 Firefox/46.0', 'ylkt38t0eyw5a2s0bru5bu6hcdkxyvnn', 62),
(2, '192.168.1.131', '2020-06-08 15:55:18.879195', 'Mozilla/5.0 (Windows NT 6.3; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0', '3okcrs8nx8yb8mos85uguc4hdo63cz0l', 62),
(3, '192.168.1.113', '2020-06-08 16:13:37.399222', 'Mozilla/5.0 (Windows NT 5.1; Win64; x64; rv:46.0) Gecko/20100101 Firefox/46.0', '5yaijacejdizv50fa9pce0xjsul7m43q', 62),
(4, '127.0.0.1', '2020-06-12 10:27:36.346401', 'Mozilla/5.0 (Windows NT 5.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2632.21 Safari/537.36', '64eg9m0y1xhtsz83khzp12ocl277ymo2', 62),
(5, '192.168.1.129', '2020-06-12 12:17:04.284016', 'Mozilla/5.0 (X11; Ubuntu; Linux i686 on x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2853.49 Safari/537.36', 'gvrd0bwx949lgr8vkey6u1yayaned03i', 62),
(6, '192.168.1.104', '2020-06-12 12:45:03.742073', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2841.92 Safari/537.36', 'dr4lif3iljghxf17lfcl5cv3o15ute2q', 62),
(7, '127.0.0.1', '2020-06-15 11:43:05.231894', 'Mozilla/5.0 (X11; Ubuntu; Linux i686 on x86_64; rv:48.0) Gecko/20100101 Firefox/48.0', '9k2o3al7lvsv1otwoddswsf2usahsmc4', 62),
(8, '127.0.0.1', '2020-06-15 18:46:52.095946', 'Mozilla/5.0 (Windows NT 6.3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2731.28 Safari/537.36', 'dyqxra0yrht8kl18cgr7gf5g79desyzc', 62),
(10, '192.168.1.124', '2020-06-16 12:03:46.031076', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2644.35 Safari/537.36', '0e1za7cwrpzcwdbn0xy7a7j3525192fr', 62),
(11, '127.0.0.1', '2020-06-17 12:15:01.939170', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2725.61 Safari/537.36', 'y8hly4x3prby8ov86u2dc2aayypq6jko', 62),
(12, '127.0.0.1', '2020-06-17 14:16:42.063465', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.3; Win64; x64; Trident/6.0)', 'tjxtksfpgmg2re3ezah2rnviy7bcin9j', 62),
(14, '127.0.0.1', '2020-06-22 11:45:26.035908', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.2; Trident/5.0)', 'fktxcc2ml0svglyl8ts13s8snownlcnr', 62),
(15, '127.0.0.1', '2020-06-22 15:30:50.331175', 'Mozilla/5.0 (X11; Ubuntu; Linux i686 on x86_64; rv:50.0) Gecko/20100101 Firefox/50.0', 'csdijq3t6gl4kgul01jbs5fz3mvh6m1y', 62),
(16, '192.168.1.131', '2020-06-22 17:00:53.706353', 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko', '66v7bdfggj1ffsle8jx7fuscg46cet7z', 62),
(17, '127.0.0.1', '2020-06-30 09:42:47.960493', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2709.36 Safari/537.36', '3894ljmyu1zc4tgwmsm808ggjf7ftwh4', 62),
(18, '127.0.0.1', '2020-07-03 09:47:24.019072', 'Mozilla/5.0 (Windows NT 6.2; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2926.33 Safari/537.36', 'f4mhqjmx4u6o42m71ljl0mivowco49wk', 62),
(19, '127.0.0.1', '2020-07-07 10:07:33.518318', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:50.0) Gecko/20100101 Firefox/50.0', '7emph61v6qa0i0e32vhv66b523898j9j', 62),
(20, '127.0.0.1', '2020-07-08 10:03:05.361288', 'Mozilla/5.0 (X11; Linux x86_64; rv:48.0) Gecko/20100101 Firefox/48.0', 'vc5p1p6w6uc3g058npo6fknrip79maq9', 62),
(22, '127.0.0.1', '2020-07-14 11:50:56.975062', 'Mozilla/5.0 (Windows NT 6.1; rv:46.0) Gecko/20100101 Firefox/46.0', 'klaf89sjszbxa9h6j8gr49bdfn7r5t3h', 62),
(23, '127.0.0.1', '2020-07-14 12:20:21.842004', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2718.13 Safari/537.36', 'rjy1cqj8zzdl8ds498aqccthl7u0llt5', 62),
(24, '127.0.0.1', '2020-07-14 12:32:02.556900', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.85 Safari/537.36', 'miqusfczlavh1hz639y6nnws6j1niyjn', 62),
(25, '192.168.1.111', '2020-07-14 12:36:11.554715', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2791.97 Safari/537.36', 'tnmn1x92irknb54kjcp6cmw3ywbtjiba', 62),
(26, '192.168.1.113', '2020-07-14 16:54:33.043530', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2716.6 Safari/537.36', 'qgpcjp76nbsd9rprmxwx1oo1x9tbkovl', 62),
(27, '127.0.0.1', '2020-07-15 10:35:58.371735', 'Mozilla/5.0 (Windows NT 6.2; rv:51.0) Gecko/20100101 Firefox/51.0', 'sxfdp083szi4j11kcdjnf2jephxmorvc', 62),
(28, '127.0.0.1', '2020-07-16 10:27:23.195142', 'Mozilla/5.0 (X11; Linux i686 on x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2691.68 Safari/537.36', 'is986qv8wmmxayfr5abx83hmeu4dod0q', 62),
(29, '192.168.1.126', '2020-07-16 15:33:22.236769', 'Mozilla/5.0 (Windows NT 6.2; rv:45.0) Gecko/20100101 Firefox/45.0', 'd74u1xug961lzukqzsdwxlya9dqpnw3t', 62);

-- --------------------------------------------------------

--
-- Table structure for table `water_level_acquisition_data`
--

CREATE TABLE IF NOT EXISTS `water_level_acquisition_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `sensor_value` varchar(50) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=436 ;

--
-- Dumping data for table `water_level_acquisition_data`
--

INSERT INTO `water_level_acquisition_data` (`id`, `sensor_id`, `sensor_value`, `created_date`) VALUES
(1, 2, '7.0', '2019-12-04 16:00:08.370691'),
(2, 2, '13.0', '2019-12-04 16:00:31.271471'),
(3, 2, '208.0', '2019-12-04 16:01:28.483649'),
(4, 2, '207.0', '2019-12-04 16:01:29.803914'),
(5, 2, '209.0', '2019-12-04 16:02:24.072845'),
(6, 2, '208.0', '2019-12-04 16:02:26.211046'),
(7, 2, '208.0', '2019-12-04 16:03:19.902216'),
(8, 2, '208.0', '2019-12-04 16:03:24.088905'),
(9, 2, '207.0', '2019-12-04 16:04:18.979290'),
(10, 2, '209.0', '2019-12-04 16:04:22.103026'),
(11, 2, '207.0', '2019-12-04 16:05:19.442738'),
(12, 2, '209.0', '2019-12-04 16:05:21.992771'),
(13, 2, '208.0', '2019-12-04 16:06:17.041648'),
(14, 2, '208.0', '2019-12-04 16:06:18.916607'),
(15, 2, '208.0', '2019-12-04 16:07:14.043558'),
(16, 2, '208.0', '2019-12-04 16:07:17.873711'),
(17, 2, '208.0', '2020-03-12 12:05:22.671114'),
(18, 2, '208.0', '2020-03-12 12:06:01.839319'),
(19, 2, '208.0', '2020-03-12 12:07:29.708675'),
(20, 2, '34.0', '2020-03-12 17:23:39.970151'),
(21, 2, '34.0', '2020-03-12 17:24:27.240294'),
(22, 2, '33.0', '2020-03-12 17:24:51.336538'),
(23, 2, '33.0', '2020-03-12 17:25:37.216607'),
(24, 2, '34.0', '2020-03-12 17:25:38.091821'),
(25, 2, '34.0', '2020-03-12 17:26:46.808322'),
(26, 2, '34.0', '2020-03-12 17:26:50.366132'),
(27, 2, '34.0', '2020-03-12 17:28:04.445701'),
(28, 2, '34.0', '2020-03-12 17:28:06.696032'),
(29, 2, '34.0', '2020-03-12 17:29:21.466660'),
(30, 2, '33.0', '2020-03-12 17:29:22.133805'),
(31, 2, '33.0', '2020-03-12 17:30:42.503548'),
(32, 2, '34.0', '2020-03-12 17:30:45.528705'),
(33, 2, '33.0', '2020-03-12 17:31:55.900868'),
(34, 2, '34.0', '2020-03-12 17:31:59.827870'),
(35, 2, '34.0', '2020-03-12 17:33:10.450332'),
(36, 2, '34.0', '2020-03-12 17:33:12.676188'),
(37, 2, '34.0', '2020-03-12 17:34:26.608874'),
(38, 2, '34.0', '2020-03-12 17:34:29.384168'),
(39, 2, '34.0', '2020-03-12 17:35:40.083960'),
(40, 2, '34.0', '2020-03-12 17:35:40.858297'),
(41, 2, '34.0', '2020-03-12 17:36:52.483106'),
(42, 2, '34.0', '2020-03-12 17:37:01.150530'),
(43, 2, '34.0', '2020-03-12 17:38:09.025199'),
(44, 2, '33.0', '2020-03-12 17:38:15.565486'),
(45, 2, '34.0', '2020-03-12 17:39:26.773009'),
(46, 2, '34.0', '2020-03-12 17:39:28.817228'),
(47, 2, '34.0', '2020-03-12 17:40:44.275710'),
(48, 2, '34.0', '2020-03-12 17:40:52.268574'),
(49, 2, '34.0', '2020-03-12 17:42:21.832858'),
(50, 2, '34.0', '2020-03-12 17:42:29.895956'),
(51, 2, '34.0', '2020-03-12 17:43:53.321312'),
(52, 2, '34.0', '2020-03-12 17:43:55.280492'),
(53, 2, '34.0', '2020-03-12 17:45:03.815324'),
(54, 2, '33.0', '2020-03-12 17:45:07.529465'),
(55, 2, '38.0', '2020-03-12 17:46:14.339370'),
(56, 2, '38.0', '2020-03-12 17:46:19.887376'),
(57, 2, '38.0', '2020-03-12 17:47:30.146219'),
(58, 2, '38.0', '2020-03-12 17:47:32.178610'),
(59, 2, '37.0', '2020-03-12 17:48:44.379068'),
(60, 2, '38.0', '2020-03-12 17:48:48.429491'),
(61, 2, '35.0', '2020-03-12 17:49:59.695191'),
(62, 2, '35.0', '2020-03-12 17:50:01.804387'),
(63, 2, '34.0', '2020-03-12 17:51:13.137333'),
(64, 2, '34.0', '2020-03-12 17:51:15.034583'),
(65, 2, '34.0', '2020-03-12 17:52:26.243291'),
(66, 2, '34.0', '2020-03-12 17:52:28.320881'),
(67, 2, '34.0', '2020-03-12 17:53:38.584147'),
(68, 2, '34.0', '2020-03-12 17:53:40.528613'),
(69, 2, '34.0', '2020-03-12 17:54:49.895048'),
(70, 2, '34.0', '2020-03-12 17:54:53.817376'),
(71, 2, '34.0', '2020-03-12 17:55:27.357915'),
(72, 2, '34.0', '2020-03-12 17:55:35.258619'),
(73, 2, '34.0', '2020-03-12 17:56:17.796182'),
(74, 2, '34.0', '2020-03-12 17:56:22.384871'),
(75, 2, '34.0', '2020-03-12 17:56:40.486916'),
(76, 2, '34.0', '2020-03-12 17:56:44.491200'),
(77, 2, '34.0', '2020-03-12 17:57:21.070300'),
(78, 2, '34.0', '2020-03-12 17:57:24.803987'),
(79, 2, '34.0', '2020-03-12 17:58:06.045116'),
(80, 2, '34.0', '2020-03-12 17:58:09.061356'),
(81, 2, '34.0', '2020-03-12 17:59:06.973375'),
(82, 2, '34.0', '2020-03-12 17:59:07.309132'),
(83, 2, '34.0', '2020-03-12 17:59:50.303328'),
(84, 2, '34.0', '2020-03-12 17:59:58.848306'),
(85, 2, '34.0', '2020-03-12 18:00:40.935514'),
(86, 2, '34.0', '2020-03-12 18:00:47.001787'),
(87, 2, '34.0', '2020-03-12 18:01:30.015295'),
(88, 2, '34.0', '2020-03-12 18:01:42.399341'),
(89, 2, '34.0', '2020-03-12 18:02:24.963005'),
(90, 2, '34.0', '2020-03-12 18:02:29.579484'),
(91, 2, '34.0', '2020-03-12 18:03:07.109571'),
(92, 2, '34.0', '2020-03-12 18:03:09.817360'),
(93, 2, '34.0', '2020-03-12 18:03:38.995390'),
(94, 2, '34.0', '2020-03-12 18:04:02.372801'),
(95, 2, '34.0', '2020-03-12 18:04:37.253856'),
(96, 2, '34.0', '2020-03-12 18:04:45.410348'),
(97, 2, '34.0', '2020-03-12 18:05:39.136728'),
(98, 2, '34.0', '2020-03-12 18:05:45.793602'),
(99, 2, '34.0', '2020-03-13 10:04:34.394480'),
(100, 2, '34.0', '2020-03-13 10:04:35.291093'),
(101, 2, '34.0', '2020-03-13 10:05:35.726588'),
(102, 2, '34.0', '2020-03-13 10:05:38.518074'),
(103, 2, '34.0', '2020-03-13 10:07:32.037698'),
(104, 2, '34.0', '2020-03-13 10:07:34.188193'),
(105, 2, '34.0', '2020-03-13 10:09:00.946740'),
(106, 2, '34.0', '2020-03-13 10:09:06.605557'),
(107, 2, '34.0', '2020-03-13 10:10:13.969233'),
(108, 2, '34.0', '2020-03-13 10:10:14.954042'),
(109, 2, '34.0', '2020-03-13 10:10:54.807868'),
(110, 2, '34.0', '2020-03-13 10:10:58.225951'),
(111, 2, '34.0', '2020-03-13 10:11:46.455484'),
(112, 2, '34.0', '2020-03-13 10:11:48.430172'),
(113, 2, '34.0', '2020-03-13 10:12:42.686321'),
(114, 2, '34.0', '2020-03-13 10:12:44.811368'),
(115, 2, '34.0', '2020-03-13 10:13:32.549954'),
(116, 2, '34.0', '2020-03-13 10:13:36.042576'),
(117, 2, '34.0', '2020-03-13 10:14:23.112339'),
(118, 2, '34.0', '2020-03-13 10:14:24.413726'),
(119, 2, '34.0', '2020-03-13 10:15:20.851761'),
(120, 2, '34.0', '2020-03-13 10:15:23.587299'),
(121, 2, '34.0', '2020-03-13 10:16:01.614049'),
(122, 2, '34.0', '2020-03-13 10:16:02.816291'),
(123, 2, '34.0', '2020-03-13 10:16:43.945608'),
(124, 2, '34.0', '2020-03-13 10:16:49.121070'),
(125, 2, '35.0', '2020-03-13 10:18:28.907632'),
(126, 2, '35.0', '2020-03-13 10:18:36.797064'),
(127, 3, '36.0', '2020-03-13 10:19:21.425452'),
(128, 2, '35.0', '2020-03-13 10:20:07.546672'),
(129, 2, '35.0', '2020-03-13 10:20:15.340077'),
(130, 3, '35.0', '2020-03-13 10:21:01.257209'),
(131, 2, '35.0', '2020-03-13 10:21:42.015277'),
(132, 2, '35.0', '2020-03-13 10:21:45.928507'),
(133, 3, '36.0', '2020-03-13 10:22:44.018326'),
(134, 2, '36.0', '2020-03-13 10:22:48.314126'),
(135, 2, '36.0', '2020-03-13 10:22:54.344931'),
(136, 3, '35.0', '2020-03-13 10:24:15.363340'),
(137, 2, '35.0', '2020-03-13 10:24:22.912035'),
(138, 2, '35.0', '2020-03-13 10:24:31.253986'),
(139, 3, '35.0', '2020-03-13 10:25:45.979909'),
(140, 2, '35.0', '2020-03-13 10:25:49.605797'),
(141, 2, '36.0', '2020-03-13 10:25:55.532839'),
(142, 3, '36.0', '2020-03-13 10:26:58.621363'),
(143, 2, '35.0', '2020-03-13 10:27:07.973623'),
(144, 2, '36.0', '2020-03-13 10:27:20.023917'),
(145, 3, '35.0', '2020-03-13 10:28:21.631115'),
(146, 2, '35.0', '2020-03-13 10:28:28.439724'),
(147, 2, '35.0', '2020-03-13 10:28:34.515430'),
(148, 3, '36.0', '2020-03-13 10:29:26.497733'),
(149, 2, '35.0', '2020-03-13 10:29:38.861875'),
(150, 2, '35.0', '2020-03-13 10:29:55.156330'),
(151, 3, '35.0', '2020-03-13 10:31:00.905363'),
(152, 2, '35.0', '2020-03-13 10:31:11.581352'),
(153, 2, '5.0', '2020-03-18 17:47:20.644227'),
(154, 2, '5.0', '2020-03-18 17:48:17.725611'),
(155, 2, '5.0', '2020-03-18 17:49:07.487793'),
(156, 2, '5.0', '2020-03-18 17:49:59.032279'),
(157, 2, '75.0', '2020-04-27 11:09:03.410072'),
(158, 2, '75.0', '2020-04-27 11:09:59.405963'),
(159, 2, '75.0', '2020-04-27 11:10:49.862842'),
(160, 2, '75.0', '2020-04-27 11:11:39.890874'),
(161, 2, '75.0', '2020-04-27 11:12:32.036110'),
(162, 2, '75.0', '2020-04-27 11:13:24.169934'),
(163, 2, '75.0', '2020-04-27 11:14:19.385500'),
(164, 2, '75.0', '2020-04-27 11:15:24.911580'),
(165, 2, '75.0', '2020-04-27 11:16:20.085624'),
(166, 2, '75.0', '2020-04-27 11:17:09.223424'),
(167, 2, '75.0', '2020-04-27 11:18:00.046208'),
(168, 2, '75.0', '2020-04-27 11:18:49.509933'),
(169, 2, '75.0', '2020-04-27 11:19:41.025555'),
(170, 2, '75.0', '2020-04-27 11:20:39.784430'),
(171, 2, '76.0', '2020-04-27 11:21:30.234094'),
(172, 2, '75.0', '2020-04-27 11:22:25.974836'),
(173, 2, '75.0', '2020-04-27 11:23:14.221603'),
(174, 2, '76.0', '2020-04-27 11:24:14.112603'),
(175, 2, '75.0', '2020-04-27 11:25:08.341463'),
(176, 2, '75.0', '2020-04-27 11:26:10.011970'),
(177, 2, '75.0', '2020-04-27 11:26:59.493574'),
(178, 2, '75.0', '2020-04-27 11:27:52.101221'),
(179, 2, '75.0', '2020-04-27 11:28:45.697193'),
(180, 2, '76.0', '2020-04-27 11:29:45.156639'),
(181, 2, '76.0', '2020-04-27 11:30:38.550532'),
(182, 2, '75.0', '2020-04-27 11:31:31.022671'),
(183, 2, '75.0', '2020-04-27 11:32:31.613787'),
(184, 2, '6.0', '2020-04-27 11:33:58.560860'),
(185, 2, '6.0', '2020-04-27 11:35:44.720712'),
(186, 2, '6.0', '2020-04-27 11:37:03.177409'),
(187, 2, '7.0', '2020-04-27 11:39:05.776234'),
(188, 2, '7.0', '2020-04-27 11:41:14.213241'),
(189, 2, '7.0', '2020-04-27 11:43:03.401781'),
(190, 2, '7.0', '2020-04-27 11:44:10.826567'),
(191, 2, '7.0', '2020-04-27 11:46:22.666386'),
(192, 2, '7.0', '2020-04-27 11:48:13.039588'),
(193, 2, '7.0', '2020-04-27 11:50:06.502955'),
(194, 2, '7.0', '2020-04-27 11:52:00.583363'),
(195, 2, '75.0', '2020-04-27 11:53:46.178821'),
(196, 2, '75.0', '2020-04-27 11:55:23.286537'),
(197, 2, '75.0', '2020-04-27 11:57:06.031773'),
(198, 2, '76.0', '2020-04-27 11:58:55.446276'),
(199, 2, '64.0', '2020-04-27 12:00:49.986403'),
(200, 2, '72.0', '2020-04-27 12:02:43.720945'),
(201, 2, '70.0', '2020-04-27 12:04:47.687294'),
(202, 2, '71.0', '2020-04-27 12:06:48.761311'),
(203, 2, '70.0', '2020-04-27 12:08:55.598728'),
(204, 2, '72.0', '2020-04-27 12:10:16.132205'),
(205, 2, '71.0', '2020-04-27 12:12:22.042328'),
(206, 2, '72.0', '2020-04-27 12:13:34.936006'),
(207, 2, '71.0', '2020-04-27 12:15:18.738522'),
(208, 2, '70.0', '2020-04-27 12:16:40.463613'),
(209, 2, '6.0', '2020-04-27 12:17:56.020537'),
(210, 2, '71.0', '2020-04-27 12:19:49.355229'),
(211, 2, '71.0', '2020-04-27 12:21:48.426062'),
(212, 2, '71.0', '2020-04-27 12:23:42.349306'),
(213, 2, '75.0', '2020-04-27 12:25:25.281912'),
(214, 2, '74.0', '2020-04-27 12:27:09.905064'),
(215, 2, '71.0', '2020-04-27 12:28:26.503945'),
(216, 2, '6.0', '2020-04-27 12:30:18.577670'),
(217, 2, '6.0', '2020-04-27 12:32:03.218726'),
(218, 2, '6.0', '2020-04-27 12:33:59.523083'),
(219, 2, '206.0', '2020-05-05 16:29:16.817473'),
(220, 2, '206.0', '2020-05-05 16:29:44.120312'),
(221, 2, '207.0', '2020-05-05 16:35:07.259932'),
(222, 2, '207.0', '2020-05-05 16:35:45.812937'),
(223, 2, '207.0', '2020-05-05 16:37:15.273284'),
(224, 2, '207.0', '2020-05-05 16:37:47.663089'),
(225, 2, '207.0', '2020-05-05 16:38:22.371524'),
(226, 2, '207.0', '2020-05-05 16:38:54.252737'),
(227, 2, '207.0', '2020-05-05 16:39:31.118114'),
(228, 2, '206.0', '2020-05-05 16:39:38.386297'),
(229, 2, '206.0', '2020-05-05 16:40:10.826299'),
(230, 2, '207.0', '2020-05-05 16:40:49.267159'),
(231, 2, '208.0', '2020-05-05 16:41:22.200333'),
(232, 2, '208.0', '2020-05-05 16:42:03.124096'),
(233, 2, '207.0', '2020-05-05 16:42:51.531378'),
(234, 2, '207.0', '2020-05-05 16:43:36.155255'),
(235, 2, '73.0', '2020-05-05 16:44:11.771544'),
(236, 2, '207.0', '2020-05-05 16:44:43.413713'),
(237, 2, '208.0', '2020-05-05 16:45:15.871698'),
(238, 2, '206.0', '2020-05-05 16:45:24.979706'),
(239, 2, '206.0', '2020-05-05 16:45:54.310686'),
(240, 2, '206.0', '2020-05-05 16:46:24.894073'),
(241, 2, '206.0', '2020-05-05 16:46:56.326182'),
(242, 2, '58.0', '2020-05-05 16:47:27.575821'),
(243, 2, '206.0', '2020-05-05 16:47:55.193979'),
(244, 2, '207.0', '2020-05-05 16:48:27.668644'),
(245, 2, '206.0', '2020-05-05 16:49:02.280906'),
(246, 2, '207.0', '2020-05-05 16:49:13.564825'),
(247, 2, '206.0', '2020-05-05 16:49:45.134137'),
(248, 2, '207.0', '2020-05-05 16:50:24.628672'),
(249, 2, '207.0', '2020-05-05 16:50:57.920236'),
(250, 2, '207.0', '2020-05-05 16:51:35.481687'),
(251, 2, '207.0', '2020-05-05 16:52:03.828475'),
(252, 2, '207.0', '2020-05-05 16:52:11.973946'),
(253, 2, '206.0', '2020-05-05 16:52:43.475632'),
(254, 2, '215.0', '2020-05-05 16:53:25.882129'),
(255, 2, '4.0', '2020-05-05 16:54:08.565786'),
(256, 2, '4.0', '2020-05-05 16:54:56.698271'),
(257, 2, '4.0', '2020-05-05 16:55:42.920460'),
(258, 2, '5.0', '2020-05-05 16:56:27.196354'),
(259, 2, '5.0', '2020-05-05 16:57:13.502584'),
(260, 2, '5.0', '2020-05-05 16:58:03.576829'),
(261, 2, '5.0', '2020-05-05 16:58:47.825396'),
(262, 2, '5.0', '2020-05-05 16:59:38.100404'),
(263, 2, '5.0', '2020-05-05 17:00:27.366704'),
(264, 2, '5.0', '2020-05-05 17:01:11.523215'),
(265, 2, '5.0', '2020-05-05 17:02:05.629567'),
(266, 2, '5.0', '2020-05-05 17:02:55.903741'),
(267, 2, '5.0', '2020-05-05 17:03:39.069048'),
(268, 2, '5.0', '2020-05-05 17:04:28.256338'),
(269, 2, '5.0', '2020-05-05 17:05:17.579089'),
(270, 2, '5.0', '2020-05-05 17:06:05.811018'),
(271, 2, '5.0', '2020-05-05 17:06:48.435647'),
(272, 2, '5.0', '2020-05-05 17:07:28.680781'),
(273, 2, '5.0', '2020-05-05 17:08:12.512630'),
(274, 2, '5.0', '2020-05-05 17:09:02.442348'),
(275, 2, '5.0', '2020-05-05 17:09:52.733030'),
(276, 2, '5.0', '2020-05-05 17:10:45.992139'),
(277, 2, '5.0', '2020-05-05 17:11:40.306203'),
(278, 2, '5.0', '2020-05-05 17:12:33.297071'),
(279, 2, '5.0', '2020-05-05 17:13:30.355622'),
(280, 2, '5.0', '2020-05-05 17:14:33.941568'),
(281, 2, '5.0', '2020-05-05 17:15:15.668404'),
(282, 2, '5.0', '2020-05-05 17:16:05.450604'),
(283, 2, '5.0', '2020-05-05 17:16:59.594335'),
(284, 2, '5.0', '2020-05-05 17:17:50.087393'),
(285, 2, '5.0', '2020-05-05 17:18:44.092391'),
(286, 2, '5.0', '2020-05-05 17:19:34.379318'),
(287, 2, '5.0', '2020-05-05 17:20:20.975666'),
(288, 2, '5.0', '2020-05-05 17:20:55.127629'),
(289, 2, '5.0', '2020-05-05 17:21:29.235703'),
(290, 2, '5.0', '2020-05-05 17:22:05.909077'),
(291, 2, '5.0', '2020-05-05 17:22:18.768832'),
(292, 2, '5.0', '2020-05-05 17:22:55.966266'),
(293, 2, '213.0', '2020-05-06 12:04:26.838600'),
(294, 2, 'Network Error', '2020-05-06 12:05:10.015020'),
(295, 2, '212.0', '2020-05-06 12:06:28.422441'),
(296, 2, '211.0', '2020-05-06 12:07:00.478692'),
(297, 2, '212.0', '2020-05-06 12:07:54.229453'),
(298, 2, '3159.0', '2020-05-06 12:11:30.297071'),
(299, 2, '207.0', '2020-05-06 12:37:57.526573'),
(300, 2, '208.0', '2020-05-06 12:40:11.848809'),
(301, 2, '208.0', '2020-05-06 12:40:50.430671'),
(302, 2, '208.0', '2020-05-06 12:41:21.941054'),
(303, 2, '208.0', '2020-05-06 12:41:51.901509'),
(304, 2, '208.0', '2020-05-06 12:42:23.304381'),
(305, 2, '208.0', '2020-05-06 12:42:53.423988'),
(306, 2, '209.0', '2020-05-06 12:43:23.014420'),
(307, 2, '208.0', '2020-05-06 12:44:05.367689'),
(308, 2, '209.0', '2020-05-06 12:44:31.555427'),
(309, 2, '4.0', '2020-05-06 12:45:26.791102'),
(310, 2, '5.0', '2020-05-06 12:46:55.703364'),
(311, 2, '4.0', '2020-05-06 12:51:42.790828'),
(312, 2, '4.0', '2020-05-06 12:52:34.897492'),
(313, 2, '4.0', '2020-05-06 12:53:09.712590'),
(314, 2, '4.0', '2020-05-06 12:53:37.002165'),
(315, 2, '4.0', '2020-05-06 12:54:01.903684'),
(316, 2, '4.0', '2020-05-06 12:54:46.219219'),
(317, 2, '4.0', '2020-05-06 12:55:23.251697'),
(318, 2, '4.0', '2020-05-06 12:55:58.458899'),
(319, 2, '4.0', '2020-05-06 12:56:37.534183'),
(320, 2, '5.0', '2020-05-06 12:57:02.799729'),
(321, 2, '4.0', '2020-05-06 12:57:32.691108'),
(322, 2, '4.0', '2020-05-06 12:57:58.023590'),
(323, 2, '4.0', '2020-05-06 12:58:20.680930'),
(324, 2, '4.0', '2020-05-06 12:58:54.230498'),
(325, 2, '5.0', '2020-05-06 12:59:22.541713'),
(326, 2, '5.0', '2020-05-06 12:59:53.475086'),
(327, 2, '4.0', '2020-05-06 13:00:28.616680'),
(328, 2, '4.0', '2020-05-06 13:00:53.791162'),
(329, 2, '5.0', '2020-05-06 13:01:23.932285'),
(330, 2, '4.0', '2020-05-06 13:01:51.998967'),
(331, 2, '4.0', '2020-05-06 13:02:31.242969'),
(332, 2, '208.0', '2020-05-06 13:03:45.288430'),
(333, 2, '208.0', '2020-05-06 13:04:35.671007'),
(334, 2, '209.0', '2020-05-06 13:05:10.196241'),
(335, 2, '207.0', '2020-05-06 13:05:29.596271'),
(336, 2, '208.0', '2020-05-06 13:06:01.228040'),
(337, 2, '208.0', '2020-05-06 13:06:23.461264'),
(338, 2, '208.0', '2020-05-06 13:06:59.119659'),
(339, 2, '208.0', '2020-05-06 13:07:20.419008'),
(340, 2, '208.0', '2020-05-06 13:07:53.251868'),
(341, 2, '208.0', '2020-05-06 13:08:16.316580'),
(342, 2, '207.0', '2020-05-06 13:08:46.814990'),
(343, 2, '208.0', '2020-05-06 13:09:14.231789'),
(344, 2, '209.0', '2020-05-06 13:09:41.389519'),
(345, 2, '208.0', '2020-05-06 13:10:11.067547'),
(346, 2, '208.0', '2020-05-06 13:10:39.581060'),
(347, 2, '208.0', '2020-05-06 13:11:08.541547'),
(348, 2, '207.0', '2020-05-06 13:11:35.582730'),
(349, 2, '209.0', '2020-05-06 13:12:07.003587'),
(350, 2, '208.0', '2020-05-06 13:12:49.715306'),
(351, 2, '208.0', '2020-05-06 13:13:18.084966'),
(352, 2, '209.0', '2020-05-06 13:13:58.797359'),
(353, 2, '209.0', '2020-05-06 13:14:44.571917'),
(354, 2, '208.0', '2020-05-06 13:15:53.653873'),
(355, 2, '208.0', '2020-05-06 13:16:36.313607'),
(356, 2, '208.0', '2020-05-06 13:17:25.069319'),
(357, 2, '208.0', '2020-05-06 13:18:03.711291'),
(358, 2, '208.0', '2020-05-06 13:18:48.393111'),
(359, 2, '208.0', '2020-05-06 13:19:31.484272'),
(360, 2, '208.0', '2020-05-06 13:20:18.217320'),
(361, 2, '208.0', '2020-05-06 13:21:04.658056'),
(362, 2, '106.0', '2020-05-06 13:21:51.264873'),
(363, 2, '208.0', '2020-05-06 13:22:38.830533'),
(364, 2, '209.0', '2020-05-06 13:23:25.704309'),
(365, 2, '209.0', '2020-05-06 13:24:15.504236'),
(366, 2, '208.0', '2020-05-06 13:25:04.619832'),
(367, 2, '208.0', '2020-05-06 13:25:33.119760'),
(368, 2, '208.0', '2020-05-06 13:26:20.716924'),
(369, 2, '4.0', '2020-05-06 14:58:53.913809'),
(370, 2, '4.0', '2020-05-06 15:01:17.238290'),
(371, 2, '4.0', '2020-05-06 15:02:10.246831'),
(372, 2, '4.0', '2020-05-06 15:03:01.069686'),
(373, 2, '4.0', '2020-05-06 15:03:31.337486'),
(374, 2, '4.0', '2020-05-06 15:04:21.610949'),
(375, 2, '206.0', '2020-05-06 15:05:55.341798'),
(376, 2, '206.0', '2020-05-06 15:07:00.241025'),
(377, 2, '207.0', '2020-05-06 15:07:46.173293'),
(378, 2, '207.0', '2020-05-06 15:08:32.481338'),
(379, 2, '206.0', '2020-05-06 15:09:22.103897'),
(380, 2, '207.0', '2020-05-06 15:10:26.019474'),
(381, 2, '207.0', '2020-05-06 15:11:26.945159'),
(382, 2, '207.0', '2020-05-06 15:12:25.427790'),
(383, 2, '207.0', '2020-05-06 15:13:26.384910'),
(384, 3, '111', '2020-07-16 14:27:24.006880'),
(385, 2, '104', '2020-07-16 14:27:38.090315'),
(386, 3, '110', '2020-07-16 14:28:58.966143'),
(387, 2, '110', '2020-07-16 14:29:03.024780'),
(388, 3, '111', '2020-07-16 14:30:10.829489'),
(389, 2, '103', '2020-07-16 14:30:13.730793'),
(390, 3, '104', '2020-07-16 14:31:06.738563'),
(391, 2, '103', '2020-07-16 14:31:10.536083'),
(392, 3, '104', '2020-07-16 14:31:54.828938'),
(393, 2, '112', '2020-07-16 14:31:59.044275'),
(394, 3, '109', '2020-07-16 14:32:43.202226'),
(395, 2, '115', '2020-07-16 14:32:48.227322'),
(396, 3, '112', '2020-07-16 14:33:31.968235'),
(397, 2, '112', '2020-07-16 14:33:35.967363'),
(398, 3, '110', '2020-07-16 14:34:20.284173'),
(399, 2, '104', '2020-07-16 14:34:24.466497'),
(400, 3, '115', '2020-07-16 14:35:08.923847'),
(401, 2, '110', '2020-07-16 14:35:12.932248'),
(402, 3, '104', '2020-07-16 14:35:58.946795'),
(403, 2, '111', '2020-07-16 14:36:03.722478'),
(404, 3, '103', '2020-07-16 14:36:52.179942'),
(405, 2, '109', '2020-07-16 14:36:55.107164'),
(406, 3, '111', '2020-07-16 14:37:40.515741'),
(407, 2, '110', '2020-07-16 14:37:44.836967'),
(408, 3, '109', '2020-07-16 14:38:28.939395'),
(409, 2, '111', '2020-07-16 14:38:33.197484'),
(410, 3, '104', '2020-07-16 14:39:17.467945'),
(411, 2, '115', '2020-07-16 14:39:21.726252'),
(412, 3, '110', '2020-07-16 14:40:05.966384'),
(413, 2, '110', '2020-07-16 14:40:10.224132'),
(414, 3, '104', '2020-07-16 14:40:54.577633'),
(415, 2, '102', '2020-07-16 14:40:58.590223'),
(416, 3, '106', '2020-07-16 14:41:45.022513'),
(417, 2, '111', '2020-07-16 14:41:49.294387'),
(418, 3, '110', '2020-07-16 14:42:33.572181'),
(419, 2, '105', '2020-07-16 14:42:36.628858'),
(420, 3, '110', '2020-07-16 14:43:23.378025'),
(421, 2, '110', '2020-07-16 14:43:25.975416'),
(422, 3, '111', '2020-07-16 14:44:12.491518'),
(423, 2, '109', '2020-07-16 14:44:16.616283'),
(424, 3, '105', '2020-07-16 14:45:01.982610'),
(425, 2, '111', '2020-07-16 14:45:06.600203'),
(426, 3, '111', '2020-07-16 14:45:51.457621'),
(427, 2, '103', '2020-07-16 14:45:54.632172'),
(428, 3, '110', '2020-07-16 14:46:40.006042'),
(429, 2, '104', '2020-07-16 14:46:43.213800'),
(430, 3, '110', '2020-07-16 14:47:27.504611'),
(431, 2, '111', '2020-07-16 14:47:31.614161'),
(432, 3, '103', '2020-07-16 14:48:17.120231'),
(433, 2, '104', '2020-07-16 14:48:19.246246'),
(434, 3, '111', '2020-07-16 14:49:04.653581'),
(435, 2, '105', '2020-07-16 14:49:07.669634');

-- --------------------------------------------------------

--
-- Table structure for table `water_level_monitoring_sensor`
--

CREATE TABLE IF NOT EXISTS `water_level_monitoring_sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `mine_id_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `water_level_monitori_mine_id_id_e72fd679_fk_MineDetai` (`mine_id_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `water_level_monitoring_sensor`
--

INSERT INTO `water_level_monitoring_sensor` (`id`, `area_name`, `distance_bet_roof_and_water`, `alarm_water_level_1`, `alarm_water_level_2`, `alarm_water_level_3`, `level_1_msg`, `level_2_msg`, `level_3_msg`, `level_1_audio`, `level_2_audio`, `level_3_audio`, `ip_address`, `desc`, `audio_play_type`, `created_date`, `modified_date`, `moter_start_level`, `moter_stop_level`, `mine_id_id`) VALUES
(2, 'Location 501', '250', '100', '150', '200', 'First Stage Warning Message , Please be Careful.', 'Second Stage Warning Message , Please be alert situation is not good.', 'Third Stage Warning Message , Please  leave the underground', 'water_warning_audio/water_first_level_warn.mp3', 'water_warning_audio/water_second_level_warn.mp3', 'water_warning_audio/water_third_level_warn.mp3', '192.168.1.181', 'nnn', 'mp3only', '2019-11-15 11:23:13.201735', '2019-12-26 10:33:11.693449', '200', '230', 1),
(3, 'WD/89K', '100', '10', '20', '30', 'First Stage Warning Message , Please be Careful.', 'Second Stage Warning Message , Please be alert situation is not good.', 'Third Stage Warning Message , Please  leave the underground', 'water_warning_audio/water_first_level_warn_VZF1VMR.mp3', 'water_warning_audio/water_second_level_warn_UrjuxUW.mp3', 'water_warning_audio/water_third_level_warn_gWyloN7.mp3', '192.168.1.181', 'nai', 'mp3only', '2019-12-31 11:17:45.932947', '2020-03-02 12:37:15.007499', '50', '20', 8);

-- --------------------------------------------------------

--
-- Table structure for table `windroseaddsensor`
--

CREATE TABLE IF NOT EXISTS `windroseaddsensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` varchar(200) DEFAULT NULL,
  `sensor_name` varchar(200) DEFAULT NULL,
  `sensor_unit` varchar(200) DEFAULT NULL,
  `min_range` varchar(200) DEFAULT NULL,
  `max_range` varchar(200) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `windrosedata`
--

CREATE TABLE IF NOT EXISTS `windrosedata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_id` int(11) DEFAULT NULL,
  `rain_gauge` varchar(200) DEFAULT NULL,
  `pm2_5` varchar(200) DEFAULT NULL,
  `pm10` varchar(200) DEFAULT NULL,
  `humidity` varchar(200) DEFAULT NULL,
  `temperature` varchar(200) DEFAULT NULL,
  `ws_value` varchar(200) DEFAULT NULL,
  `wd_value` varchar(200) DEFAULT NULL,
  `no2` varchar(200) DEFAULT NULL,
  `so2` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time(6) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `windrosesetting`
--

CREATE TABLE IF NOT EXISTS `windrosesetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) DEFAULT NULL,
  `wd_sensor_name` varchar(100) DEFAULT NULL,
  `wd_unit` varchar(10) DEFAULT NULL,
  `ws_sensor_name` varchar(15) DEFAULT NULL,
  `ws_unit` varchar(10) DEFAULT NULL,
  `rg_sensor_name` varchar(100) DEFAULT NULL,
  `rg_unit` varchar(10) DEFAULT NULL,
  `pm2_5_sensor_name` varchar(100) DEFAULT NULL,
  `pm2_5_unit` varchar(10) DEFAULT NULL,
  `pm10_sensor_name` varchar(100) DEFAULT NULL,
  `pm10_unit` varchar(10) DEFAULT NULL,
  `humidity_sensor_name` varchar(100) DEFAULT NULL,
  `humidity_unit` varchar(10) DEFAULT NULL,
  `temperature_sensor_name` varchar(100) DEFAULT NULL,
  `temperature_unit` varchar(10) DEFAULT NULL,
  `so2_sensor_name` varchar(100) DEFAULT NULL,
  `so2_unit` varchar(10) DEFAULT NULL,
  `no2_sensor_name` varchar(100) DEFAULT NULL,
  `no2_unit` varchar(10) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accident_records`
--
ALTER TABLE `accident_records`
  ADD CONSTRAINT `accident_records_mine_id_92cb3e77_fk_MineDetails_id` FOREIGN KEY (`mine_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `accident_records_shift_id_id_85df117c_fk_MineShift_id` FOREIGN KEY (`shift_id_id`) REFERENCES `mineshift` (`id`);

--
-- Constraints for table `accident_records_others`
--
ALTER TABLE `accident_records_others`
  ADD CONSTRAINT `accident_records_oth_accident_id_id_fecd9bdd_fk_accident_` FOREIGN KEY (`accident_id_id`) REFERENCES `accident_records` (`id`);

--
-- Constraints for table `accident_record_employee`
--
ALTER TABLE `accident_record_employee`
  ADD CONSTRAINT `accident_record_employee_employee_id_id_a7d8af8f_fk_employee_id` FOREIGN KEY (`employee_id_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `accident_record_empl_accident_record_id_978186b1_fk_accident_` FOREIGN KEY (`accident_record_id`) REFERENCES `accident_records` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

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
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

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
  ADD CONSTRAINT `employee1_mining_role_id_0904bb33_fk_MiningRole_id` FOREIGN KEY (`mining_role_id`) REFERENCES `miningrole` (`id`),
  ADD CONSTRAINT `employee_shift_id_id_4914bbfb_fk_MineShift_id` FOREIGN KEY (`shift_id_id`) REFERENCES `mineshift` (`id`);

--
-- Constraints for table `employeeshiftassign`
--
ALTER TABLE `employeeshiftassign`
  ADD CONSTRAINT `EmployeeShiftAssign_employee_id_id_93107e43_fk_employee_id` FOREIGN KEY (`employee_id_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `EmployeeShiftAssign_shift_id_id_84e1204f_fk_MineShift_id` FOREIGN KEY (`shift_id_id`) REFERENCES `mineshift` (`id`);

--
-- Constraints for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  ADD CONSTRAINT `employee_attendance_emp_id_id_166c3f10_fk_employee_id` FOREIGN KEY (`emp_id_id`) REFERENCES `employee` (`id`);

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
-- Constraints for table `medical_report`
--
ALTER TABLE `medical_report`
  ADD CONSTRAINT `medical_report_employee_id_id_dbf45bba_fk_employee_id` FOREIGN KEY (`employee_id_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `medical_report_mine_id_id_80b83d54_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

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
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_employee_id_id_440ac6f5_fk_employee_id` FOREIGN KEY (`employee_id_id`) REFERENCES `employee` (`id`);

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
  ADD CONSTRAINT `rescue_records_mine_id_7c3ac060_fk_MineDetails_id` FOREIGN KEY (`mine_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `rescue_records_shift_id_id_3fb6da7b_fk_MineShift_id` FOREIGN KEY (`shift_id_id`) REFERENCES `mineshift` (`id`);

--
-- Constraints for table `rescue_records_others`
--
ALTER TABLE `rescue_records_others`
  ADD CONSTRAINT `rescue_records_others_rescue_id_id_9d8892cd_fk_rescue_records_id` FOREIGN KEY (`rescue_id_id`) REFERENCES `rescue_records` (`id`);

--
-- Constraints for table `rescue_records_rescued_employees_name`
--
ALTER TABLE `rescue_records_rescued_employees_name`
  ADD CONSTRAINT `rescue_records_rescu_employee_id_5e0c8726_fk_employee_` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `rescue_records_rescu_rescue_records_id_79cd199e_fk_rescue_re` FOREIGN KEY (`rescue_records_id`) REFERENCES `rescue_records` (`id`);

--
-- Constraints for table `rescue_records_rescue_person_name`
--
ALTER TABLE `rescue_records_rescue_person_name`
  ADD CONSTRAINT `rescue_records_rescu_employee_id_e46e0d83_fk_employee_` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `rescue_records_rescu_rescue_records_id_61aea38b_fk_rescue_re` FOREIGN KEY (`rescue_records_id`) REFERENCES `rescue_records` (`id`);

--
-- Constraints for table `safety`
--
ALTER TABLE `safety`
  ADD CONSTRAINT `safety_mine_id_73f6a4e6_fk_MineDetails_id` FOREIGN KEY (`mine_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `safetytable`
--
ALTER TABLE `safetytable`
  ADD CONSTRAINT `safetytable_safety_id_id_ef70be42_fk_safety_id` FOREIGN KEY (`safety_id_id`) REFERENCES `safety` (`id`);

--
-- Constraints for table `sensor_node`
--
ALTER TABLE `sensor_node`
  ADD CONSTRAINT `sensor_node_mine_id_id_22542281_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `sensor_sensor_node`
--
ALTER TABLE `sensor_sensor_node`
  ADD CONSTRAINT `sensor_sensor_node_mine_id_id_7de6491d_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `sensor_sensor_node_node_id_id_f6b7a19e_fk_sensor_node_id` FOREIGN KEY (`node_id_id`) REFERENCES `sensor_node` (`id`);

--
-- Constraints for table `slope_location`
--
ALTER TABLE `slope_location`
  ADD CONSTRAINT `slope_location_mine_name_id_dba9c1e0_fk_MineDetails_id` FOREIGN KEY (`mine_name_id`) REFERENCES `minedetails` (`id`);

--
-- Constraints for table `slope_sensor`
--
ALTER TABLE `slope_sensor`
  ADD CONSTRAINT `slope_sensor_location_id_id_66a2595b_fk_slope_location_id` FOREIGN KEY (`location_id_id`) REFERENCES `slope_location` (`id`),
  ADD CONSTRAINT `slope_sensor_mine_name_id_e612d8b4_fk_MineDetails_id` FOREIGN KEY (`mine_name_id`) REFERENCES `minedetails` (`id`);

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
-- Constraints for table `training_attendance`
--
ALTER TABLE `training_attendance`
  ADD CONSTRAINT `training_attendance_mine_id_id_379eb13f_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `training_attendance_shift_id_id_fd90e294_fk_MineShift_id` FOREIGN KEY (`shift_id_id`) REFERENCES `mineshift` (`id`);

--
-- Constraints for table `training_attendance_details`
--
ALTER TABLE `training_attendance_details`
  ADD CONSTRAINT `training_attendance_details_emp_id_id_9a76abbf_fk_employee_id` FOREIGN KEY (`emp_id_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `training_attendance__training_attendance__e6610ad8_fk_training_` FOREIGN KEY (`training_attendance_id_id`) REFERENCES `training_attendance` (`id`);

--
-- Constraints for table `usersession`
--
ALTER TABLE `usersession`
  ADD CONSTRAINT `usersession_session_id_87b6832f_fk_django_session_session_key` FOREIGN KEY (`session_id`) REFERENCES `django_session` (`session_key`),
  ADD CONSTRAINT `usersession_user_id_bc976b70_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `water_level_monitoring_sensor`
--
ALTER TABLE `water_level_monitoring_sensor`
  ADD CONSTRAINT `water_level_monitori_mine_id_id_e72fd679_fk_MineDetai` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
