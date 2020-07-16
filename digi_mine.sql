-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2020 at 08:37 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digi_mine`
--

-- --------------------------------------------------------

--
-- Table structure for table `accident_records`
--

CREATE TABLE `accident_records` (
  `id` int(11) NOT NULL,
  `situation_mines` varchar(255) DEFAULT NULL,
  `name_address` varchar(255) DEFAULT NULL,
  `vil_pin` varchar(255) DEFAULT NULL,
  `date_hour_accident` datetime(6) DEFAULT NULL,
  `accident_location` varchar(255) DEFAULT NULL,
  `killed_num` int(11) DEFAULT NULL,
  `injured_num` int(11) DEFAULT NULL,
  `accident_cause_description` varchar(255) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL,
  `shift_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accident_records_others`
--

CREATE TABLE `accident_records_others` (
  `id` int(11) NOT NULL,
  `killed_or_injured` varchar(15) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `nature_of_employment` varchar(50) DEFAULT NULL,
  `cause` varchar(255) DEFAULT NULL,
  `accident_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `accident_record_employee`
--

CREATE TABLE `accident_record_employee` (
  `id` int(11) NOT NULL,
  `employee_name` varchar(50) DEFAULT NULL,
  `killed_or_injured` varchar(15) DEFAULT NULL,
  `cause` varchar(100) DEFAULT NULL,
  `accident_record_id` int(11) DEFAULT NULL,
  `employee_id_id` int(11) DEFAULT NULL
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
  `ab_pr_date` date NOT NULL,
  `ab_pr` varchar(255) NOT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `leave_no` int(11) DEFAULT NULL,
  `emp_id_id` int(11) NOT NULL,
  `mine_id_id` int(11) NOT NULL,
  `shift_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add employee', 7, 'add_employee'),
(26, 'Can change employee', 7, 'change_employee'),
(27, 'Can delete employee', 7, 'delete_employee'),
(28, 'Can view employee', 7, 'view_employee'),
(29, 'Can add mine details', 8, 'add_minedetails'),
(30, 'Can change mine details', 8, 'change_minedetails'),
(31, 'Can delete mine details', 8, 'delete_minedetails'),
(32, 'Can view mine details', 8, 'view_minedetails'),
(33, 'Can add mine shift', 9, 'add_mineshift'),
(34, 'Can change mine shift', 9, 'change_mineshift'),
(35, 'Can delete mine shift', 9, 'delete_mineshift'),
(36, 'Can view mine shift', 9, 'view_mineshift'),
(37, 'Can add sensor data', 10, 'add_sensordata'),
(38, 'Can change sensor data', 10, 'change_sensordata'),
(39, 'Can delete sensor data', 10, 'delete_sensordata'),
(40, 'Can view sensor data', 10, 'view_sensordata'),
(41, 'Can add mining role', 11, 'add_miningrole'),
(42, 'Can change mining role', 11, 'change_miningrole'),
(43, 'Can delete mining role', 11, 'delete_miningrole'),
(44, 'Can view mining role', 11, 'view_miningrole'),
(45, 'Can add medical report', 12, 'add_medicalreport'),
(46, 'Can change medical report', 12, 'change_medicalreport'),
(47, 'Can delete medical report', 12, 'delete_medicalreport'),
(48, 'Can view medical report', 12, 'view_medicalreport'),
(49, 'Can add employee shift assign', 13, 'add_employeeshiftassign'),
(50, 'Can change employee shift assign', 13, 'change_employeeshiftassign'),
(51, 'Can delete employee shift assign', 13, 'delete_employeeshiftassign'),
(52, 'Can view employee shift assign', 13, 'view_employeeshiftassign'),
(53, 'Can add rate of minimum wages', 14, 'add_rateofminimumwages'),
(54, 'Can change rate of minimum wages', 14, 'change_rateofminimumwages'),
(55, 'Can delete rate of minimum wages', 14, 'delete_rateofminimumwages'),
(56, 'Can view rate of minimum wages', 14, 'view_rateofminimumwages'),
(57, 'Can add miner tracking', 15, 'add_minertracking'),
(58, 'Can change miner tracking', 15, 'change_minertracking'),
(59, 'Can delete miner tracking', 15, 'delete_minertracking'),
(60, 'Can view miner tracking', 15, 'view_minertracking'),
(61, 'Can add tracking router', 16, 'add_trackingrouter'),
(62, 'Can change tracking router', 16, 'change_trackingrouter'),
(63, 'Can delete tracking router', 16, 'delete_trackingrouter'),
(64, 'Can view tracking router', 16, 'view_trackingrouter'),
(65, 'Can add fire_exp_gases', 17, 'add_fire_exp_gases'),
(66, 'Can change fire_exp_gases', 17, 'change_fire_exp_gases'),
(67, 'Can delete fire_exp_gases', 17, 'delete_fire_exp_gases'),
(68, 'Can view fire_exp_gases', 17, 'view_fire_exp_gases'),
(69, 'Can add gasdb', 18, 'add_gasdb'),
(70, 'Can change gasdb', 18, 'change_gasdb'),
(71, 'Can delete gasdb', 18, 'delete_gasdb'),
(72, 'Can view gasdb', 18, 'view_gasdb'),
(73, 'Can add development_permission_model', 19, 'add_development_permission_model'),
(74, 'Can change development_permission_model', 19, 'change_development_permission_model'),
(75, 'Can delete development_permission_model', 19, 'delete_development_permission_model'),
(76, 'Can view development_permission_model', 19, 'view_development_permission_model'),
(77, 'Can add dgm s_ coal mine_ annual_ annexure_ i_ subtable_1', 20, 'add_dgms_coalmine_annual_annexure_i_subtable_1'),
(78, 'Can change dgm s_ coal mine_ annual_ annexure_ i_ subtable_1', 20, 'change_dgms_coalmine_annual_annexure_i_subtable_1'),
(79, 'Can delete dgm s_ coal mine_ annual_ annexure_ i_ subtable_1', 20, 'delete_dgms_coalmine_annual_annexure_i_subtable_1'),
(80, 'Can view dgm s_ coal mine_ annual_ annexure_ i_ subtable_1', 20, 'view_dgms_coalmine_annual_annexure_i_subtable_1'),
(81, 'Can add dgm s_ coal mine_ annual_ annexure_ i_ subtable_2', 21, 'add_dgms_coalmine_annual_annexure_i_subtable_2'),
(82, 'Can change dgm s_ coal mine_ annual_ annexure_ i_ subtable_2', 21, 'change_dgms_coalmine_annual_annexure_i_subtable_2'),
(83, 'Can delete dgm s_ coal mine_ annual_ annexure_ i_ subtable_2', 21, 'delete_dgms_coalmine_annual_annexure_i_subtable_2'),
(84, 'Can view dgm s_ coal mine_ annual_ annexure_ i_ subtable_2', 21, 'view_dgms_coalmine_annual_annexure_i_subtable_2'),
(85, 'Can add dgm s_ coal mine_ annual_ annexure_ i_ subtable_3', 22, 'add_dgms_coalmine_annual_annexure_i_subtable_3'),
(86, 'Can change dgm s_ coal mine_ annual_ annexure_ i_ subtable_3', 22, 'change_dgms_coalmine_annual_annexure_i_subtable_3'),
(87, 'Can delete dgm s_ coal mine_ annual_ annexure_ i_ subtable_3', 22, 'delete_dgms_coalmine_annual_annexure_i_subtable_3'),
(88, 'Can view dgm s_ coal mine_ annual_ annexure_ i_ subtable_3', 22, 'view_dgms_coalmine_annual_annexure_i_subtable_3'),
(89, 'Can add dgm s_ coal mine_ table_ a_ model', 23, 'add_dgms_coalmine_table_a_model'),
(90, 'Can change dgm s_ coal mine_ table_ a_ model', 23, 'change_dgms_coalmine_table_a_model'),
(91, 'Can delete dgm s_ coal mine_ table_ a_ model', 23, 'delete_dgms_coalmine_table_a_model'),
(92, 'Can view dgm s_ coal mine_ table_ a_ model', 23, 'view_dgms_coalmine_table_a_model'),
(93, 'Can add dgm s_ coal mine_ table_ b_ model', 24, 'add_dgms_coalmine_table_b_model'),
(94, 'Can change dgm s_ coal mine_ table_ b_ model', 24, 'change_dgms_coalmine_table_b_model'),
(95, 'Can delete dgm s_ coal mine_ table_ b_ model', 24, 'delete_dgms_coalmine_table_b_model'),
(96, 'Can view dgm s_ coal mine_ table_ b_ model', 24, 'view_dgms_coalmine_table_b_model'),
(97, 'Can add dgm s_ coal mine_ table_ c_ model', 25, 'add_dgms_coalmine_table_c_model'),
(98, 'Can change dgm s_ coal mine_ table_ c_ model', 25, 'change_dgms_coalmine_table_c_model'),
(99, 'Can delete dgm s_ coal mine_ table_ c_ model', 25, 'delete_dgms_coalmine_table_c_model'),
(100, 'Can view dgm s_ coal mine_ table_ c_ model', 25, 'view_dgms_coalmine_table_c_model'),
(101, 'Can add dgm s_ coal mine_ table_ d_ model', 26, 'add_dgms_coalmine_table_d_model'),
(102, 'Can change dgm s_ coal mine_ table_ d_ model', 26, 'change_dgms_coalmine_table_d_model'),
(103, 'Can delete dgm s_ coal mine_ table_ d_ model', 26, 'delete_dgms_coalmine_table_d_model'),
(104, 'Can view dgm s_ coal mine_ table_ d_ model', 26, 'view_dgms_coalmine_table_d_model'),
(105, 'Can add dgm s_ coal mine_ table_ e_ model', 27, 'add_dgms_coalmine_table_e_model'),
(106, 'Can change dgm s_ coal mine_ table_ e_ model', 27, 'change_dgms_coalmine_table_e_model'),
(107, 'Can delete dgm s_ coal mine_ table_ e_ model', 27, 'delete_dgms_coalmine_table_e_model'),
(108, 'Can view dgm s_ coal mine_ table_ e_ model', 27, 'view_dgms_coalmine_table_e_model'),
(109, 'Can add dgm s_ metalliferous mine_ annual_ annexure_i i_ subtable_1', 28, 'add_dgms_metalliferousmine_annual_annexure_ii_subtable_1'),
(110, 'Can change dgm s_ metalliferous mine_ annual_ annexure_i i_ subtable_1', 28, 'change_dgms_metalliferousmine_annual_annexure_ii_subtable_1'),
(111, 'Can delete dgm s_ metalliferous mine_ annual_ annexure_i i_ subtable_1', 28, 'delete_dgms_metalliferousmine_annual_annexure_ii_subtable_1'),
(112, 'Can view dgm s_ metalliferous mine_ annual_ annexure_i i_ subtable_1', 28, 'view_dgms_metalliferousmine_annual_annexure_ii_subtable_1'),
(113, 'Can add dgm s_ metalliferous mines_ annual_ annexure_i i_ subtable_2', 29, 'add_dgms_metalliferousmines_annual_annexure_ii_subtable_2'),
(114, 'Can change dgm s_ metalliferous mines_ annual_ annexure_i i_ subtable_2', 29, 'change_dgms_metalliferousmines_annual_annexure_ii_subtable_2'),
(115, 'Can delete dgm s_ metalliferous mines_ annual_ annexure_i i_ subtable_2', 29, 'delete_dgms_metalliferousmines_annual_annexure_ii_subtable_2'),
(116, 'Can view dgm s_ metalliferous mines_ annual_ annexure_i i_ subtable_2', 29, 'view_dgms_metalliferousmines_annual_annexure_ii_subtable_2'),
(117, 'Can add dgm s_ metalliferous mines_annua l_ annexure_i i_ subtable_3', 30, 'add_dgms_metalliferousmines_annual_annexure_ii_subtable_3'),
(118, 'Can change dgm s_ metalliferous mines_annua l_ annexure_i i_ subtable_3', 30, 'change_dgms_metalliferousmines_annual_annexure_ii_subtable_3'),
(119, 'Can delete dgm s_ metalliferous mines_annua l_ annexure_i i_ subtable_3', 30, 'delete_dgms_metalliferousmines_annual_annexure_ii_subtable_3'),
(120, 'Can view dgm s_ metalliferous mines_annua l_ annexure_i i_ subtable_3', 30, 'view_dgms_metalliferousmines_annual_annexure_ii_subtable_3'),
(121, 'Can add dgm s_ oil mines_ annual_ annexure_ii i_ subtable_1', 31, 'add_dgms_oilmines_annual_annexure_iii_subtable_1'),
(122, 'Can change dgm s_ oil mines_ annual_ annexure_ii i_ subtable_1', 31, 'change_dgms_oilmines_annual_annexure_iii_subtable_1'),
(123, 'Can delete dgm s_ oil mines_ annual_ annexure_ii i_ subtable_1', 31, 'delete_dgms_oilmines_annual_annexure_iii_subtable_1'),
(124, 'Can view dgm s_ oil mines_ annual_ annexure_ii i_ subtable_1', 31, 'view_dgms_oilmines_annual_annexure_iii_subtable_1'),
(125, 'Can add dgm s_ oil mines_ annual_ annexure_ii i_ subtable_2', 32, 'add_dgms_oilmines_annual_annexure_iii_subtable_2'),
(126, 'Can change dgm s_ oil mines_ annual_ annexure_ii i_ subtable_2', 32, 'change_dgms_oilmines_annual_annexure_iii_subtable_2'),
(127, 'Can delete dgm s_ oil mines_ annual_ annexure_ii i_ subtable_2', 32, 'delete_dgms_oilmines_annual_annexure_iii_subtable_2'),
(128, 'Can view dgm s_ oil mines_ annual_ annexure_ii i_ subtable_2', 32, 'view_dgms_oilmines_annual_annexure_iii_subtable_2'),
(129, 'Can add extract_or_reduce_pillars_models', 33, 'add_extract_or_reduce_pillars_models'),
(130, 'Can change extract_or_reduce_pillars_models', 33, 'change_extract_or_reduce_pillars_models'),
(131, 'Can delete extract_or_reduce_pillars_models', 33, 'delete_extract_or_reduce_pillars_models'),
(132, 'Can view extract_or_reduce_pillars_models', 33, 'view_extract_or_reduce_pillars_models'),
(133, 'Can add first_schedule_form_v_ model', 34, 'add_first_schedule_form_v_model'),
(134, 'Can change first_schedule_form_v_ model', 34, 'change_first_schedule_form_v_model'),
(135, 'Can delete first_schedule_form_v_ model', 34, 'delete_first_schedule_form_v_model'),
(136, 'Can view first_schedule_form_v_ model', 34, 'view_first_schedule_form_v_model'),
(137, 'Can add identification_report_of_the_problem_model', 35, 'add_identification_report_of_the_problem_model'),
(138, 'Can change identification_report_of_the_problem_model', 35, 'change_identification_report_of_the_problem_model'),
(139, 'Can delete identification_report_of_the_problem_model', 35, 'delete_identification_report_of_the_problem_model'),
(140, 'Can view identification_report_of_the_problem_model', 35, 'view_identification_report_of_the_problem_model'),
(141, 'Can add metal_mine_extract_permission_model', 36, 'add_metal_mine_extract_permission_model'),
(142, 'Can change metal_mine_extract_permission_model', 36, 'change_metal_mine_extract_permission_model'),
(143, 'Can delete metal_mine_extract_permission_model', 36, 'delete_metal_mine_extract_permission_model'),
(144, 'Can view metal_mine_extract_permission_model', 36, 'view_metal_mine_extract_permission_model'),
(145, 'Can add ventilation_ model', 37, 'add_ventilation_model'),
(146, 'Can change ventilation_ model', 37, 'change_ventilation_model'),
(147, 'Can delete ventilation_ model', 37, 'delete_ventilation_model'),
(148, 'Can view ventilation_ model', 37, 'view_ventilation_model'),
(149, 'Can add first_ schedule_ form_iii_ model', 38, 'add_first_schedule_form_iii_model'),
(150, 'Can change first_ schedule_ form_iii_ model', 38, 'change_first_schedule_form_iii_model'),
(151, 'Can delete first_ schedule_ form_iii_ model', 38, 'delete_first_schedule_form_iii_model'),
(152, 'Can view first_ schedule_ form_iii_ model', 38, 'view_first_schedule_form_iii_model'),
(153, 'Can add dgm s_ oil mines_ annual_ annexure_iii', 39, 'add_dgms_oilmines_annual_annexure_iii'),
(154, 'Can change dgm s_ oil mines_ annual_ annexure_iii', 39, 'change_dgms_oilmines_annual_annexure_iii'),
(155, 'Can delete dgm s_ oil mines_ annual_ annexure_iii', 39, 'delete_dgms_oilmines_annual_annexure_iii'),
(156, 'Can view dgm s_ oil mines_ annual_ annexure_iii', 39, 'view_dgms_oilmines_annual_annexure_iii'),
(157, 'Can add dgm s_ metelliferous mine_ annual_ annexure_ii', 40, 'add_dgms_metelliferousmine_annual_annexure_ii'),
(158, 'Can change dgm s_ metelliferous mine_ annual_ annexure_ii', 40, 'change_dgms_metelliferousmine_annual_annexure_ii'),
(159, 'Can delete dgm s_ metelliferous mine_ annual_ annexure_ii', 40, 'delete_dgms_metelliferousmine_annual_annexure_ii'),
(160, 'Can view dgm s_ metelliferous mine_ annual_ annexure_ii', 40, 'view_dgms_metelliferousmine_annual_annexure_ii'),
(161, 'Can add dgm s_ coal mine_ annual_ annexure_i', 41, 'add_dgms_coalmine_annual_annexure_i'),
(162, 'Can change dgm s_ coal mine_ annual_ annexure_i', 41, 'change_dgms_coalmine_annual_annexure_i'),
(163, 'Can delete dgm s_ coal mine_ annual_ annexure_i', 41, 'delete_dgms_coalmine_annual_annexure_i'),
(164, 'Can view dgm s_ coal mine_ annual_ annexure_i', 41, 'view_dgms_coalmine_annual_annexure_i'),
(165, 'Can add strata_location', 42, 'add_strata_location'),
(166, 'Can change strata_location', 42, 'change_strata_location'),
(167, 'Can delete strata_location', 42, 'delete_strata_location'),
(168, 'Can view strata_location', 42, 'view_strata_location'),
(169, 'Can add strata_sensor_data', 43, 'add_strata_sensor_data'),
(170, 'Can change strata_sensor_data', 43, 'change_strata_sensor_data'),
(171, 'Can delete strata_sensor_data', 43, 'delete_strata_sensor_data'),
(172, 'Can view strata_sensor_data', 43, 'view_strata_sensor_data'),
(173, 'Can add strata_sensor_flag', 44, 'add_strata_sensor_flag'),
(174, 'Can change strata_sensor_flag', 44, 'change_strata_sensor_flag'),
(175, 'Can delete strata_sensor_flag', 44, 'delete_strata_sensor_flag'),
(176, 'Can view strata_sensor_flag', 44, 'view_strata_sensor_flag'),
(177, 'Can add strata_sensor', 45, 'add_strata_sensor'),
(178, 'Can change strata_sensor', 45, 'change_strata_sensor'),
(179, 'Can delete strata_sensor', 45, 'delete_strata_sensor'),
(180, 'Can view strata_sensor', 45, 'view_strata_sensor'),
(181, 'Can add user session', 46, 'add_usersession'),
(182, 'Can change user session', 46, 'change_usersession'),
(183, 'Can delete user session', 46, 'delete_usersession'),
(184, 'Can view user session', 46, 'view_usersession'),
(185, 'Can add profile_extension', 47, 'add_profile_extension'),
(186, 'Can change profile_extension', 47, 'change_profile_extension'),
(187, 'Can delete profile_extension', 47, 'delete_profile_extension'),
(188, 'Can view profile_extension', 47, 'view_profile_extension'),
(189, 'Can add snippet', 48, 'add_snippet'),
(190, 'Can change snippet', 48, 'change_snippet'),
(191, 'Can delete snippet', 48, 'delete_snippet'),
(192, 'Can view snippet', 48, 'view_snippet'),
(193, 'Can add comment', 49, 'add_comment'),
(194, 'Can change comment', 49, 'change_comment'),
(195, 'Can delete comment', 49, 'delete_comment'),
(196, 'Can view comment', 49, 'view_comment'),
(197, 'Can add gas model', 50, 'add_gasmodel'),
(198, 'Can change gas model', 50, 'change_gasmodel'),
(199, 'Can delete gas model', 50, 'delete_gasmodel'),
(200, 'Can view gas model', 50, 'view_gasmodel'),
(201, 'Can add home model', 51, 'add_homemodel'),
(202, 'Can change home model', 51, 'change_homemodel'),
(203, 'Can delete home model', 51, 'delete_homemodel'),
(204, 'Can view home model', 51, 'view_homemodel'),
(205, 'Can add temp_monitoring_automatic', 52, 'add_temp_monitoring_automatic'),
(206, 'Can change temp_monitoring_automatic', 52, 'change_temp_monitoring_automatic'),
(207, 'Can delete temp_monitoring_automatic', 52, 'delete_temp_monitoring_automatic'),
(208, 'Can view temp_monitoring_automatic', 52, 'view_temp_monitoring_automatic'),
(209, 'Can add completed task', 53, 'add_completedtask'),
(210, 'Can change completed task', 53, 'change_completedtask'),
(211, 'Can delete completed task', 53, 'delete_completedtask'),
(212, 'Can view completed task', 53, 'view_completedtask'),
(213, 'Can add task', 54, 'add_task'),
(214, 'Can change task', 54, 'change_task'),
(215, 'Can delete task', 54, 'delete_task'),
(216, 'Can view task', 54, 'view_task'),
(217, 'Can add fire_exp_gases wifi', 55, 'add_fire_exp_gaseswifi'),
(218, 'Can change fire_exp_gases wifi', 55, 'change_fire_exp_gaseswifi'),
(219, 'Can delete fire_exp_gases wifi', 55, 'delete_fire_exp_gaseswifi'),
(220, 'Can view fire_exp_gases wifi', 55, 'view_fire_exp_gaseswifi'),
(221, 'Can add area model', 56, 'add_areamodel'),
(222, 'Can change area model', 56, 'change_areamodel'),
(223, 'Can delete area model', 56, 'delete_areamodel'),
(224, 'Can view area model', 56, 'view_areamodel'),
(225, 'Can add alternate prod model', 57, 'add_alternateprodmodel'),
(226, 'Can change alternate prod model', 57, 'change_alternateprodmodel'),
(227, 'Can delete alternate prod model', 57, 'delete_alternateprodmodel'),
(228, 'Can view alternate prod model', 57, 'view_alternateprodmodel'),
(229, 'Can add category model', 58, 'add_categorymodel'),
(230, 'Can change category model', 58, 'change_categorymodel'),
(231, 'Can delete category model', 58, 'delete_categorymodel'),
(232, 'Can view category model', 58, 'view_categorymodel'),
(233, 'Can add deduct model', 59, 'add_deductmodel'),
(234, 'Can change deduct model', 59, 'change_deductmodel'),
(235, 'Can delete deduct model', 59, 'delete_deductmodel'),
(236, 'Can view deduct model', 59, 'view_deductmodel'),
(237, 'Can add distribute model', 60, 'add_distributemodel'),
(238, 'Can change distribute model', 60, 'change_distributemodel'),
(239, 'Can delete distribute model', 60, 'delete_distributemodel'),
(240, 'Can view distribute model', 60, 'view_distributemodel'),
(241, 'Can add reorder model', 61, 'add_reordermodel'),
(242, 'Can change reorder model', 61, 'change_reordermodel'),
(243, 'Can delete reorder model', 61, 'delete_reordermodel'),
(244, 'Can view reorder model', 61, 'view_reordermodel'),
(245, 'Can add supplier model', 62, 'add_suppliermodel'),
(246, 'Can change supplier model', 62, 'change_suppliermodel'),
(247, 'Can delete supplier model', 62, 'delete_suppliermodel'),
(248, 'Can view supplier model', 62, 'view_suppliermodel'),
(249, 'Can add product model', 63, 'add_productmodel'),
(250, 'Can change product model', 63, 'change_productmodel'),
(251, 'Can delete product model', 63, 'delete_productmodel'),
(252, 'Can view product model', 63, 'view_productmodel'),
(253, 'Can add branch model', 64, 'add_branchmodel'),
(254, 'Can change branch model', 64, 'change_branchmodel'),
(255, 'Can delete branch model', 64, 'delete_branchmodel'),
(256, 'Can view branch model', 64, 'view_branchmodel'),
(257, 'Can add set attendance from api model', 65, 'add_setattendancefromapimodel'),
(258, 'Can change set attendance from api model', 65, 'change_setattendancefromapimodel'),
(259, 'Can delete set attendance from api model', 65, 'delete_setattendancefromapimodel'),
(260, 'Can view set attendance from api model', 65, 'view_setattendancefromapimodel'),
(261, 'Can add employee attendance', 66, 'add_employeeattendance'),
(262, 'Can change employee attendance', 66, 'change_employeeattendance'),
(263, 'Can delete employee attendance', 66, 'delete_employeeattendance'),
(264, 'Can view employee attendance', 66, 'view_employeeattendance'),
(265, 'Can add accident_ records', 67, 'add_accident_records'),
(266, 'Can change accident_ records', 67, 'change_accident_records'),
(267, 'Can delete accident_ records', 67, 'delete_accident_records'),
(268, 'Can view accident_ records', 67, 'view_accident_records'),
(269, 'Can add training_attendance', 68, 'add_training_attendance'),
(270, 'Can change training_attendance', 68, 'change_training_attendance'),
(271, 'Can delete training_attendance', 68, 'delete_training_attendance'),
(272, 'Can view training_attendance', 68, 'view_training_attendance'),
(273, 'Can add training_attendance_details', 69, 'add_training_attendance_details'),
(274, 'Can change training_attendance_details', 69, 'change_training_attendance_details'),
(275, 'Can delete training_attendance_details', 69, 'delete_training_attendance_details'),
(276, 'Can view training_attendance_details', 69, 'view_training_attendance_details'),
(277, 'Can add rescue_ records', 70, 'add_rescue_records'),
(278, 'Can change rescue_ records', 70, 'change_rescue_records'),
(279, 'Can delete rescue_ records', 70, 'delete_rescue_records'),
(280, 'Can view rescue_ records', 70, 'view_rescue_records'),
(281, 'Can add rescu e_ others', 71, 'add_rescue_others'),
(282, 'Can change rescu e_ others', 71, 'change_rescue_others'),
(283, 'Can delete rescu e_ others', 71, 'delete_rescue_others'),
(284, 'Can view rescu e_ others', 71, 'view_rescue_others'),
(285, 'Can add accident_ records_others', 72, 'add_accident_records_others'),
(286, 'Can change accident_ records_others', 72, 'change_accident_records_others'),
(287, 'Can delete accident_ records_others', 72, 'delete_accident_records_others'),
(288, 'Can view accident_ records_others', 72, 'view_accident_records_others'),
(289, 'Can add accident_ records_employees', 73, 'add_accident_records_employees'),
(290, 'Can change accident_ records_employees', 73, 'change_accident_records_employees'),
(291, 'Can delete accident_ records_employees', 73, 'delete_accident_records_employees'),
(292, 'Can view accident_ records_employees', 73, 'view_accident_records_employees'),
(293, 'Can add container_ details', 74, 'add_container_details'),
(294, 'Can change container_ details', 74, 'change_container_details'),
(295, 'Can delete container_ details', 74, 'delete_container_details'),
(296, 'Can view container_ details', 74, 'view_container_details'),
(297, 'Can add production_ yearly entry', 75, 'add_production_yearlyentry'),
(298, 'Can change production_ yearly entry', 75, 'change_production_yearlyentry'),
(299, 'Can delete production_ yearly entry', 75, 'delete_production_yearlyentry'),
(300, 'Can view production_ yearly entry', 75, 'view_production_yearlyentry'),
(301, 'Can add production_ yearly dispatch', 76, 'add_production_yearlydispatch'),
(302, 'Can change production_ yearly dispatch', 76, 'change_production_yearlydispatch'),
(303, 'Can delete production_ yearly dispatch', 76, 'delete_production_yearlydispatch'),
(304, 'Can view production_ yearly dispatch', 76, 'view_production_yearlydispatch'),
(305, 'Can add production_ weighbridge', 77, 'add_production_weighbridge'),
(306, 'Can change production_ weighbridge', 77, 'change_production_weighbridge'),
(307, 'Can delete production_ weighbridge', 77, 'delete_production_weighbridge'),
(308, 'Can view production_ weighbridge', 77, 'view_production_weighbridge'),
(309, 'Can add production_ vehicle', 78, 'add_production_vehicle'),
(310, 'Can change production_ vehicle', 78, 'change_production_vehicle'),
(311, 'Can delete production_ vehicle', 78, 'delete_production_vehicle'),
(312, 'Can view production_ vehicle', 78, 'view_production_vehicle'),
(313, 'Can add production_ tub', 79, 'add_production_tub'),
(314, 'Can change production_ tub', 79, 'change_production_tub'),
(315, 'Can delete production_ tub', 79, 'delete_production_tub'),
(316, 'Can view production_ tub', 79, 'view_production_tub'),
(317, 'Can add production_ monthly dispatch', 80, 'add_production_monthlydispatch'),
(318, 'Can change production_ monthly dispatch', 80, 'change_production_monthlydispatch'),
(319, 'Can delete production_ monthly dispatch', 80, 'delete_production_monthlydispatch'),
(320, 'Can view production_ monthly dispatch', 80, 'view_production_monthlydispatch'),
(321, 'Can add production_ monthly', 81, 'add_production_monthly'),
(322, 'Can change production_ monthly', 81, 'change_production_monthly'),
(323, 'Can delete production_ monthly', 81, 'delete_production_monthly'),
(324, 'Can view production_ monthly', 81, 'view_production_monthly'),
(325, 'Can add production_ material_ waste', 82, 'add_production_material_waste'),
(326, 'Can change production_ material_ waste', 82, 'change_production_material_waste'),
(327, 'Can delete production_ material_ waste', 82, 'delete_production_material_waste'),
(328, 'Can view production_ material_ waste', 82, 'view_production_material_waste'),
(329, 'Can add production_ manualentry', 83, 'add_production_manualentry'),
(330, 'Can change production_ manualentry', 83, 'change_production_manualentry'),
(331, 'Can delete production_ manualentry', 83, 'delete_production_manualentry'),
(332, 'Can view production_ manualentry', 83, 'view_production_manualentry'),
(333, 'Can add production_ daily entry', 84, 'add_production_dailyentry'),
(334, 'Can change production_ daily entry', 84, 'change_production_dailyentry'),
(335, 'Can delete production_ daily entry', 84, 'delete_production_dailyentry'),
(336, 'Can view production_ daily entry', 84, 'view_production_dailyentry'),
(337, 'Can add production_ daily dispatch', 85, 'add_production_dailydispatch'),
(338, 'Can change production_ daily dispatch', 85, 'change_production_dailydispatch'),
(339, 'Can delete production_ daily dispatch', 85, 'delete_production_dailydispatch'),
(340, 'Can view production_ daily dispatch', 85, 'view_production_dailydispatch'),
(341, 'Can add gas model_auto', 86, 'add_gasmodel_auto'),
(342, 'Can change gas model_auto', 86, 'change_gasmodel_auto'),
(343, 'Can delete gas model_auto', 86, 'delete_gasmodel_auto'),
(344, 'Can view gas model_auto', 86, 'view_gasmodel_auto'),
(345, 'Can add node', 87, 'add_node'),
(346, 'Can change node', 87, 'change_node'),
(347, 'Can delete node', 87, 'delete_node'),
(348, 'Can view node', 87, 'view_node'),
(349, 'Can add sensor_ node', 88, 'add_sensor_node'),
(350, 'Can change sensor_ node', 88, 'change_sensor_node'),
(351, 'Can delete sensor_ node', 88, 'delete_sensor_node'),
(352, 'Can view sensor_ node', 88, 'view_sensor_node'),
(353, 'Can add water_level_monitoring_data_acquisition_model', 89, 'add_water_level_monitoring_data_acquisition_model'),
(354, 'Can change water_level_monitoring_data_acquisition_model', 89, 'change_water_level_monitoring_data_acquisition_model'),
(355, 'Can delete water_level_monitoring_data_acquisition_model', 89, 'delete_water_level_monitoring_data_acquisition_model'),
(356, 'Can view water_level_monitoring_data_acquisition_model', 89, 'view_water_level_monitoring_data_acquisition_model'),
(357, 'Can add water_level_monitoring_model', 90, 'add_water_level_monitoring_model'),
(358, 'Can change water_level_monitoring_model', 90, 'change_water_level_monitoring_model'),
(359, 'Can delete water_level_monitoring_model', 90, 'delete_water_level_monitoring_model'),
(360, 'Can view water_level_monitoring_model', 90, 'view_water_level_monitoring_model'),
(361, 'Can add sms_configuration', 91, 'add_sms_configuration'),
(362, 'Can change sms_configuration', 91, 'change_sms_configuration'),
(363, 'Can delete sms_configuration', 91, 'delete_sms_configuration'),
(364, 'Can view sms_configuration', 91, 'view_sms_configuration'),
(365, 'Can add news_bulletin', 92, 'add_news_bulletin'),
(366, 'Can change news_bulletin', 92, 'change_news_bulletin'),
(367, 'Can delete news_bulletin', 92, 'delete_news_bulletin'),
(368, 'Can view news_bulletin', 92, 'view_news_bulletin'),
(369, 'Can add emails', 93, 'add_emails'),
(370, 'Can change emails', 93, 'change_emails'),
(371, 'Can delete emails', 93, 'delete_emails'),
(372, 'Can view emails', 93, 'view_emails'),
(373, 'Can add setting', 94, 'add_setting'),
(374, 'Can change setting', 94, 'change_setting'),
(375, 'Can delete setting', 94, 'delete_setting'),
(376, 'Can view setting', 94, 'view_setting'),
(377, 'Can add notification', 95, 'add_notification'),
(378, 'Can change notification', 95, 'change_notification'),
(379, 'Can delete notification', 95, 'delete_notification'),
(380, 'Can view notification', 95, 'view_notification'),
(381, 'Can add wind rose add sensor', 96, 'add_windroseaddsensor'),
(382, 'Can change wind rose add sensor', 96, 'change_windroseaddsensor'),
(383, 'Can delete wind rose add sensor', 96, 'delete_windroseaddsensor'),
(384, 'Can view wind rose add sensor', 96, 'view_windroseaddsensor'),
(385, 'Can add wind rose data', 97, 'add_windrosedata'),
(386, 'Can change wind rose data', 97, 'change_windrosedata'),
(387, 'Can delete wind rose data', 97, 'delete_windrosedata'),
(388, 'Can view wind rose data', 97, 'view_windrosedata'),
(389, 'Can add wind rose setting', 98, 'add_windrosesetting'),
(390, 'Can change wind rose setting', 98, 'change_windrosesetting'),
(391, 'Can delete wind rose setting', 98, 'delete_windrosesetting'),
(392, 'Can view wind rose setting', 98, 'view_windrosesetting'),
(393, 'Can add slope_location', 99, 'add_slope_location'),
(394, 'Can change slope_location', 99, 'change_slope_location'),
(395, 'Can delete slope_location', 99, 'delete_slope_location'),
(396, 'Can view slope_location', 99, 'view_slope_location'),
(397, 'Can add slope_sensor_data', 100, 'add_slope_sensor_data'),
(398, 'Can change slope_sensor_data', 100, 'change_slope_sensor_data'),
(399, 'Can delete slope_sensor_data', 100, 'delete_slope_sensor_data'),
(400, 'Can view slope_sensor_data', 100, 'view_slope_sensor_data'),
(401, 'Can add slope_sensor_flag', 101, 'add_slope_sensor_flag'),
(402, 'Can change slope_sensor_flag', 101, 'change_slope_sensor_flag'),
(403, 'Can delete slope_sensor_flag', 101, 'delete_slope_sensor_flag'),
(404, 'Can view slope_sensor_flag', 101, 'view_slope_sensor_flag'),
(405, 'Can add slope_sensor', 102, 'add_slope_sensor'),
(406, 'Can change slope_sensor', 102, 'change_slope_sensor'),
(407, 'Can delete slope_sensor', 102, 'delete_slope_sensor'),
(408, 'Can view slope_sensor', 102, 'view_slope_sensor'),
(409, 'Can add safety', 103, 'add_safety'),
(410, 'Can change safety', 103, 'change_safety'),
(411, 'Can delete safety', 103, 'delete_safety'),
(412, 'Can view safety', 103, 'view_safety'),
(413, 'Can add safety table', 104, 'add_safetytable'),
(414, 'Can change safety table', 104, 'change_safetytable'),
(415, 'Can delete safety table', 104, 'delete_safetytable'),
(416, 'Can view safety table', 104, 'view_safetytable');

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
(1, 'pbkdf2_sha256$150000$a7VUhS1qPCKT$JHbVyc5Yf0f2b7HN5xKPZWkx7eEcRNbWM4VBcUtQLw4=', '2020-07-15 09:34:42.784612', 1, 'admin', 'Admin', 'Admin', 'admin@gmail.com', 1, 1, '2020-07-13 11:42:20.080419');

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
(1, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-13 11:43:37.895430', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(2, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-13 11:43:58.710557', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(3, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-13 14:14:46.206162', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(4, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-13 14:17:12.847418', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(5, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-13 17:57:08.761953', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(6, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-14 14:13:52.586880', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(7, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-14 14:24:40.449198', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(8, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-14 14:51:20.151768', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(9, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-14 15:34:41.712751', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(10, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-14 15:35:00.101400', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(11, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-14 17:07:21.660479', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(12, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-14 17:28:09.845645', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(13, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-14 17:29:46.280552', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(14, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-14 17:32:42.953923', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(15, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-15 09:35:42.917417', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL),
(16, 'employee.views.notify_user', '[[], {}]', '36c5c2794ef8ea2cfc9253b6c35cc45657f37481', NULL, 0, '2020-07-15 09:49:14.149010', 0, NULL, NULL, 0, NULL, '', NULL, NULL, NULL, NULL);

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
-- Table structure for table `dgms_first_schedule_form_v`
--

CREATE TABLE `dgms_first_schedule_form_v` (
  `id` int(11) NOT NULL,
  `form_address` varchar(500) DEFAULT NULL,
  `chief_inspector_of_mine` varchar(500) DEFAULT NULL,
  `regional_inspector_of_mine` varchar(500) DEFAULT NULL,
  `inspector_of_mine_er` varchar(500) DEFAULT NULL,
  `distric_magistrate` varchar(500) DEFAULT NULL,
  `mine_name` varchar(500) DEFAULT NULL,
  `mine_owner` varchar(500) DEFAULT NULL,
  `owner_state` varchar(500) DEFAULT NULL,
  `situation_of_mine` varchar(500) DEFAULT NULL,
  `mine_vill` varchar(500) DEFAULT NULL,
  `mine_po` varchar(500) DEFAULT NULL,
  `mine_ps` varchar(500) DEFAULT NULL,
  `mine_subdistric` varchar(500) DEFAULT NULL,
  `mine_dist` varchar(500) DEFAULT NULL,
  `mine_state` varchar(500) DEFAULT NULL,
  `mineral_workd` varchar(500) DEFAULT NULL,
  `postel_address_of_owner` varchar(500) DEFAULT NULL,
  `person_affected_name` varchar(500) DEFAULT NULL,
  `person_caste` varchar(500) DEFAULT NULL,
  `person_vill` varchar(500) DEFAULT NULL,
  `person_po` varchar(500) DEFAULT NULL,
  `person_ps` varchar(500) DEFAULT NULL,
  `person_sub_div` varchar(500) DEFAULT NULL,
  `person_dist` varchar(500) DEFAULT NULL,
  `person_state` varchar(500) DEFAULT NULL,
  `person_sex` varchar(500) DEFAULT NULL,
  `person_dob` varchar(500) DEFAULT NULL,
  `person_occupation` varchar(500) DEFAULT NULL,
  `engage_duration` varchar(500) DEFAULT NULL,
  `commencement_of_emp_date` varchar(500) DEFAULT NULL,
  `in_your_mine` varchar(500) DEFAULT NULL,
  `in_mining` varchar(500) DEFAULT NULL,
  `nature_of_disease_state_stage` varchar(500) DEFAULT NULL,
  `disease_detection_date` varchar(500) DEFAULT NULL,
  `medical_practitioner_suspecting_disease` varchar(500) DEFAULT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `designation` varchar(500) DEFAULT NULL,
  `sig_date` varchar(500) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
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

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(47, 'accounts', 'profile_extension'),
(46, 'accounts', 'usersession'),
(1, 'admin', 'logentry'),
(66, 'attendance', 'employeeattendance'),
(65, 'attendance', 'setattendancefromapimodel'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(53, 'background_task', 'completedtask'),
(54, 'background_task', 'task'),
(5, 'contenttypes', 'contenttype'),
(19, 'DGMS_Forms', 'development_permission_model'),
(41, 'DGMS_Forms', 'dgms_coalmine_annual_annexure_i'),
(20, 'DGMS_Forms', 'dgms_coalmine_annual_annexure_i_subtable_1'),
(21, 'DGMS_Forms', 'dgms_coalmine_annual_annexure_i_subtable_2'),
(22, 'DGMS_Forms', 'dgms_coalmine_annual_annexure_i_subtable_3'),
(23, 'DGMS_Forms', 'dgms_coalmine_table_a_model'),
(24, 'DGMS_Forms', 'dgms_coalmine_table_b_model'),
(25, 'DGMS_Forms', 'dgms_coalmine_table_c_model'),
(26, 'DGMS_Forms', 'dgms_coalmine_table_d_model'),
(27, 'DGMS_Forms', 'dgms_coalmine_table_e_model'),
(29, 'DGMS_Forms', 'dgms_metalliferousmines_annual_annexure_ii_subtable_2'),
(30, 'DGMS_Forms', 'dgms_metalliferousmines_annual_annexure_ii_subtable_3'),
(28, 'DGMS_Forms', 'dgms_metalliferousmine_annual_annexure_ii_subtable_1'),
(40, 'DGMS_Forms', 'dgms_metelliferousmine_annual_annexure_ii'),
(39, 'DGMS_Forms', 'dgms_oilmines_annual_annexure_iii'),
(31, 'DGMS_Forms', 'dgms_oilmines_annual_annexure_iii_subtable_1'),
(32, 'DGMS_Forms', 'dgms_oilmines_annual_annexure_iii_subtable_2'),
(33, 'DGMS_Forms', 'extract_or_reduce_pillars_models'),
(38, 'DGMS_Forms', 'first_schedule_form_iii_model'),
(34, 'DGMS_Forms', 'first_schedule_form_v_model'),
(35, 'DGMS_Forms', 'identification_report_of_the_problem_model'),
(36, 'DGMS_Forms', 'metal_mine_extract_permission_model'),
(37, 'DGMS_Forms', 'ventilation_model'),
(93, 'emails', 'emails'),
(7, 'employee', 'employee'),
(13, 'employee', 'employeeshiftassign'),
(12, 'employee', 'medicalreport'),
(8, 'employee', 'minedetails'),
(9, 'employee', 'mineshift'),
(11, 'employee', 'miningrole'),
(14, 'employee', 'rateofminimumwages'),
(10, 'employee', 'sensordata'),
(17, 'FireExp', 'fire_exp_gases'),
(18, 'FireExp', 'gasdb'),
(50, 'gasmonitoring', 'gasmodel'),
(56, 'gasmonitoring_wifi', 'areamodel'),
(55, 'gasmonitoring_wifi', 'fire_exp_gaseswifi'),
(57, 'inventory_management', 'alternateprodmodel'),
(64, 'inventory_management', 'branchmodel'),
(58, 'inventory_management', 'categorymodel'),
(59, 'inventory_management', 'deductmodel'),
(60, 'inventory_management', 'distributemodel'),
(63, 'inventory_management', 'productmodel'),
(61, 'inventory_management', 'reordermodel'),
(62, 'inventory_management', 'suppliermodel'),
(15, 'MinersTracking', 'minertracking'),
(16, 'MinersTracking', 'trackingrouter'),
(92, 'news', 'news_bulletin'),
(74, 'ProductionMonitoring', 'container_details'),
(85, 'ProductionMonitoring', 'production_dailydispatch'),
(84, 'ProductionMonitoring', 'production_dailyentry'),
(83, 'ProductionMonitoring', 'production_manualentry'),
(82, 'ProductionMonitoring', 'production_material_waste'),
(81, 'ProductionMonitoring', 'production_monthly'),
(80, 'ProductionMonitoring', 'production_monthlydispatch'),
(79, 'ProductionMonitoring', 'production_tub'),
(78, 'ProductionMonitoring', 'production_vehicle'),
(77, 'ProductionMonitoring', 'production_weighbridge'),
(76, 'ProductionMonitoring', 'production_yearlydispatch'),
(75, 'ProductionMonitoring', 'production_yearlyentry'),
(103, 'safety', 'safety'),
(104, 'safety', 'safetytable'),
(86, 'sensor', 'gasmodel_auto'),
(87, 'sensor', 'node'),
(88, 'sensor', 'sensor_node'),
(6, 'sessions', 'session'),
(95, 'setting', 'notification'),
(94, 'setting', 'setting'),
(99, 'Slope', 'slope_location'),
(102, 'Slope', 'slope_sensor'),
(100, 'Slope', 'slope_sensor_data'),
(101, 'Slope', 'slope_sensor_flag'),
(91, 'SMS', 'sms_configuration'),
(49, 'snippets', 'comment'),
(48, 'snippets', 'snippet'),
(42, 'Strata', 'strata_location'),
(45, 'Strata', 'strata_sensor'),
(43, 'Strata', 'strata_sensor_data'),
(44, 'Strata', 'strata_sensor_flag'),
(51, 'temp_monitoring', 'homemodel'),
(52, 'temp_monitoring', 'temp_monitoring_automatic'),
(67, 'Training_Rescue_Accident', 'accident_records'),
(73, 'Training_Rescue_Accident', 'accident_records_employees'),
(72, 'Training_Rescue_Accident', 'accident_records_others'),
(71, 'Training_Rescue_Accident', 'rescue_others'),
(70, 'Training_Rescue_Accident', 'rescue_records'),
(68, 'Training_Rescue_Accident', 'training_attendance'),
(69, 'Training_Rescue_Accident', 'training_attendance_details'),
(89, 'water_level_monitoring', 'water_level_monitoring_data_acquisition_model'),
(90, 'water_level_monitoring', 'water_level_monitoring_model'),
(96, 'wm_test', 'windroseaddsensor'),
(97, 'wm_test', 'windrosedata'),
(98, 'wm_test', 'windrosesetting');

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
(1, 'employee', '0001_initial', '2020-07-13 11:39:35.001131'),
(2, 'DGMS_Forms', '0001_initial', '2020-07-13 11:39:52.613223'),
(3, 'FireExp', '0001_initial', '2020-07-13 11:39:58.426020'),
(4, 'MinersTracking', '0001_initial', '2020-07-13 11:39:59.278603'),
(5, 'ProductionMonitoring', '0001_initial', '2020-07-13 11:40:04.195074'),
(6, 'contenttypes', '0001_initial', '2020-07-13 11:40:15.840605'),
(7, 'auth', '0001_initial', '2020-07-13 11:40:17.346989'),
(8, 'SMS', '0001_initial', '2020-07-13 11:40:25.330461'),
(9, 'Slope', '0001_initial', '2020-07-13 11:40:27.440357'),
(10, 'Strata', '0001_initial', '2020-07-13 11:40:30.841837'),
(11, 'Training_Rescue_Accident', '0001_initial', '2020-07-13 11:40:37.001756'),
(12, 'sessions', '0001_initial', '2020-07-13 11:40:52.854036'),
(13, 'accounts', '0001_initial', '2020-07-13 11:40:53.927804'),
(14, 'admin', '0001_initial', '2020-07-13 11:40:58.110661'),
(15, 'admin', '0002_logentry_remove_auto_add', '2020-07-13 11:41:00.055643'),
(16, 'admin', '0003_logentry_add_action_flag_choices', '2020-07-13 11:41:00.119649'),
(17, 'attendance', '0001_initial', '2020-07-13 11:41:00.918924'),
(18, 'contenttypes', '0002_remove_content_type_name', '2020-07-13 11:41:05.984998'),
(19, 'auth', '0002_alter_permission_name_max_length', '2020-07-13 11:41:06.722650'),
(20, 'auth', '0003_alter_user_email_max_length', '2020-07-13 11:41:07.664154'),
(21, 'auth', '0004_alter_user_username_opts', '2020-07-13 11:41:07.720154'),
(22, 'auth', '0005_alter_user_last_login_null', '2020-07-13 11:41:08.485590'),
(23, 'auth', '0006_require_contenttypes_0002', '2020-07-13 11:41:08.531664'),
(24, 'auth', '0007_alter_validators_add_error_messages', '2020-07-13 11:41:08.612624'),
(25, 'auth', '0008_alter_user_username_max_length', '2020-07-13 11:41:08.744913'),
(26, 'auth', '0009_alter_user_last_name_max_length', '2020-07-13 11:41:09.059594'),
(27, 'auth', '0010_alter_group_name_max_length', '2020-07-13 11:41:09.964397'),
(28, 'auth', '0011_update_proxy_permissions', '2020-07-13 11:41:10.157397'),
(29, 'background_task', '0001_initial', '2020-07-13 11:41:10.769355'),
(30, 'background_task', '0002_auto_20170927_1109', '2020-07-13 11:41:22.665345'),
(31, 'emails', '0001_initial', '2020-07-13 11:41:23.036777'),
(32, 'gasmonitoring', '0001_initial', '2020-07-13 11:41:24.299326'),
(33, 'gasmonitoring_wifi', '0001_initial', '2020-07-13 11:41:24.881274'),
(34, 'inventory_management', '0001_initial', '2020-07-13 11:41:28.532021'),
(35, 'news', '0001_initial', '2020-07-13 11:41:34.132928'),
(36, 'safety', '0001_initial', '2020-07-13 11:41:35.547032'),
(37, 'sensor', '0001_initial', '2020-07-13 11:41:38.093294'),
(38, 'setting', '0001_initial', '2020-07-13 11:41:42.805224'),
(39, 'snippets', '0001_initial', '2020-07-13 11:41:44.530219'),
(40, 'temp_monitoring', '0001_initial', '2020-07-13 11:41:48.439958'),
(41, 'water_level_monitoring', '0001_initial', '2020-07-13 11:41:49.127080'),
(42, 'wm_test', '0001_initial', '2020-07-13 11:41:51.273637'),
(43, 'temp_monitoring', '0002_homemodel_date', '2020-07-13 11:53:17.537335');

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
('m6srydxqknhczn07stxi9ovowxe0d3p6', 'N2I5MGY0YTZlNjIyYzQ5YWQyMDQ5OGQ4ZTIwYjM2YTA5M2FkMTFhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMTg3ODYyMTQzYzZhMTc4MDhiMWViMTg1NzViOTU3M2Q5NzZiMTU5In0=', '2020-07-28 17:31:42.899928'),
('myrfdm9wgq80gfcia8f6h2jpvwjnbdpd', 'N2I5MGY0YTZlNjIyYzQ5YWQyMDQ5OGQ4ZTIwYjM2YTA5M2FkMTFhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMTg3ODYyMTQzYzZhMTc4MDhiMWViMTg1NzViOTU3M2Q5NzZiMTU5In0=', '2020-07-28 17:28:46.187916'),
('yz63q3jynkncwhgmrpdph1c6nvz6ovv0', 'N2I5MGY0YTZlNjIyYzQ5YWQyMDQ5OGQ4ZTIwYjM2YTA5M2FkMTFhZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMTg3ODYyMTQzYzZhMTc4MDhiMWViMTg1NzViOTU3M2Q5NzZiMTU5In0=', '2020-07-29 09:34:42.874745');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `type` varchar(1000) DEFAULT NULL,
  `subject` varchar(1000) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  `email_to` varchar(1000) DEFAULT NULL,
  `email_from` varchar(1000) DEFAULT NULL,
  `sent_on` datetime(6) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL
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
  `present_address` varchar(200) DEFAULT NULL,
  `permanent_address` varchar(200) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `identification_mark` varchar(50) DEFAULT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `mob` varchar(100) DEFAULT NULL,
  `state` varchar(100) NOT NULL,
  `city` longtext NOT NULL,
  `pin` longtext DEFAULT NULL,
  `gender` varchar(128) DEFAULT NULL,
  `marital_status` varchar(128) DEFAULT NULL,
  `spouse_name` varchar(50) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `rfid` longtext DEFAULT NULL,
  `designation` longtext DEFAULT NULL,
  `token_no` longtext DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `retirement_date` date DEFAULT NULL,
  `job_type` varchar(128) DEFAULT NULL,
  `category_address` varchar(50) DEFAULT NULL,
  `cat_type` longtext DEFAULT NULL,
  `is_rescue` varchar(10) NOT NULL,
  `blood_group` varchar(200) DEFAULT NULL,
  `medical_status` longtext NOT NULL,
  `esic_ip` varchar(50) DEFAULT NULL,
  `lwf` varchar(50) DEFAULT NULL,
  `aadhaar_no` varchar(20) DEFAULT NULL,
  `pan_no` varchar(20) DEFAULT NULL,
  `voter_id_no` varchar(20) DEFAULT NULL,
  `medical_ins_no` varchar(30) DEFAULT NULL,
  `date_of_exit` date DEFAULT NULL,
  `reason_of_exit` varchar(50) DEFAULT NULL,
  `uan` varchar(100) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_ac_no` varchar(30) DEFAULT NULL,
  `bank_ifsc` varchar(20) DEFAULT NULL,
  `bank_pf_no` varchar(20) DEFAULT NULL,
  `service_book_no` varchar(50) DEFAULT NULL,
  `remarks` varchar(50) DEFAULT NULL,
  `edu_course_name` varchar(50) DEFAULT NULL,
  `edu_board_name` varchar(50) DEFAULT NULL,
  `edu_year` varchar(20) DEFAULT NULL,
  `edu_percent` varchar(20) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `immediate_staff_id` int(11) DEFAULT NULL,
  `mine_id` int(11) NOT NULL,
  `mining_role_id` int(11) DEFAULT NULL,
  `shift_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `empid`, `name`, `father_name`, `dob`, `present_address`, `permanent_address`, `email`, `nationality`, `identification_mark`, `signature`, `mob`, `state`, `city`, `pin`, `gender`, `marital_status`, `spouse_name`, `photo`, `rfid`, `designation`, `token_no`, `date_of_joining`, `retirement_date`, `job_type`, `category_address`, `cat_type`, `is_rescue`, `blood_group`, `medical_status`, `esic_ip`, `lwf`, `aadhaar_no`, `pan_no`, `voter_id_no`, `medical_ins_no`, `date_of_exit`, `reason_of_exit`, `uan`, `bank_name`, `bank_ac_no`, `bank_ifsc`, `bank_pf_no`, `service_book_no`, `remarks`, `edu_course_name`, `edu_board_name`, `edu_year`, `edu_percent`, `created_date`, `modified_date`, `immediate_staff_id`, `mine_id`, `mining_role_id`, `shift_id_id`) VALUES
(1, 'Example_new', 'Dew Kumar_new', 'Anand Kumar Kumar', '1991-02-15', 'Dhanbad', NULL, 'devwangshu@gmail.com', NULL, '', NULL, '7870249601', 'Jharkhand', 'Dhanbad', '826001', 'M', 'M', NULL, 'employee_image/img_new_26kb.jpg', 'M007', 'des', 'T894654', '2018-06-20', '2018-07-09', 'Regular', NULL, 'opencast', 'No', 'A+', 'ok', NULL, NULL, '999999999999', 'QPK123456', '987654321', '987654321', NULL, NULL, NULL, 'State Bank of India', '12345678945', 'SBIN0001670', '999999999', NULL, NULL, 'Lorem Ipsum', 'CBSE', '2019', '99.99', '2018-07-04 12:42:18.017876', '2019-10-31 15:46:35.558401', NULL, 1, 11, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employeeshiftassign`
--

CREATE TABLE `employeeshiftassign` (
  `id` int(11) NOT NULL,
  `assign_date` date NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `employee_id_id` int(11) DEFAULT NULL,
  `shift_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employee_attendance`
--

CREATE TABLE `employee_attendance` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `emp_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `extract_or_reduce_pillars`
--

CREATE TABLE `extract_or_reduce_pillars` (
  `id` int(11) NOT NULL,
  `name_of_mine` longtext NOT NULL,
  `name_of_owner` longtext NOT NULL,
  `particular_about_seam` longtext NOT NULL,
  `name_of_seam_proposed_to_depillared` longtext NOT NULL,
  `total_thickness_of_seam` longtext NOT NULL,
  `thickness_of_seam_section` longtext NOT NULL,
  `rate_of_dip` longtext NOT NULL,
  `plans` longtext NOT NULL,
  `give_plan_no_of_date` longtext NOT NULL,
  `plan_up_to_date_and_accurate` longtext NOT NULL,
  `when_whom_area_applied_for_and_surveyed` longtext NOT NULL,
  `name_size_of_panel_proposed_extraction` longtext NOT NULL,
  `max_min_height_width_of_working` longtext NOT NULL,
  `average_height_and_width_of_working` longtext NOT NULL,
  `max_min_size_of_pillars` longtext NOT NULL,
  `average_size_of_pillars_center_to_center` longtext NOT NULL,
  `think_seam` longtext NOT NULL,
  `age_of_working` longtext NOT NULL,
  `nature_of_roof_and_floor` longtext NOT NULL,
  `are_working_dry_dump_naturally_wet` longtext NOT NULL,
  `max_min_thickness` longtext NOT NULL,
  `percentage_of_sand_stone` longtext NOT NULL,
  `rate_of_emission_inflammable_in_district` longtext NOT NULL,
  `rate_of_emission_inflammable_in_seam` longtext NOT NULL,
  `max_percentage_inflammable_in_district` longtext NOT NULL,
  `max_percentage_inflammable_in_seam` longtext NOT NULL,
  `are_there_any_geological_disturbances` longtext NOT NULL,
  `general_condition_of_working_as_actually_determind` longtext NOT NULL,
  `if_there_are_singes_of_spalling_of_caol` longtext NOT NULL,
  `fall_of_roof` longtext NOT NULL,
  `is_there_history_of_fire` longtext NOT NULL,
  `section_of_strata_from_surface_showing` longtext NOT NULL,
  `proposed_method_of_extraction` longtext NOT NULL,
  `convention_depillaring_with_slicing_stooking_method` longtext NOT NULL,
  `splitting_of_pillars_as_final_operations` longtext NOT NULL,
  `with_without_hydraulic_dry_stowing` longtext NOT NULL,
  `if_conjuction_with_stowing` longtext NOT NULL,
  `give_details_amount_of_existing` longtext NOT NULL,
  `manner_extraction_splitting_of_pillar` longtext NOT NULL,
  `condition_of_overlying` longtext NOT NULL,
  `are_the_seam_free_from_water` longtext NOT NULL,
  `are_the_seam_extracted` longtext NOT NULL,
  `if_seam_extracted_have_been_extracted` longtext NOT NULL,
  `is_there_any_fire_in_any_overlying` longtext NOT NULL,
  `the_rate_omission` longtext NOT NULL,
  `the_percantage_inflammable` longtext NOT NULL,
  `is_roof_eaisly_cavable` longtext NOT NULL,
  `is_there_any_danger_of_air_blast` longtext NOT NULL,
  `railway` longtext NOT NULL,
  `public_private_road` longtext NOT NULL,
  `river_nallah` longtext NOT NULL,
  `buliding_dwelling_belonging_to_owner` longtext NOT NULL,
  `buliding_dwelling_not_belonging_to_owner` longtext NOT NULL,
  `ht_transmission_line` longtext NOT NULL,
  `arial_ropeway` longtext NOT NULL,
  `any_other_structure` longtext NOT NULL,
  `distance_of_highest_known_flood_level` longtext NOT NULL,
  `do_you_apprehend_danger` longtext NOT NULL,
  `due_to_proposed_operation` longtext NOT NULL,
  `due_to_vicinity_fault` longtext NOT NULL,
  `give_particular_of_subsidence_experience` longtext NOT NULL,
  `if_surface_likely_to_be_affected` longtext NOT NULL,
  `is_there_any_waterlogged` longtext NOT NULL,
  `is_there_any_danger_inundation` longtext NOT NULL,
  `surface_water` longtext NOT NULL,
  `underground_working` longtext NOT NULL,
  `in_any_seam_section_lying_above` longtext NOT NULL,
  `of_theadjoining` longtext NOT NULL,
  `from_the_same_seam` longtext NOT NULL,
  `what_precautionary_measures_are_suggested` longtext NOT NULL,
  `where_there_is_fire_in_either_the_overlying` longtext NOT NULL,
  `whether_ventilation_is` longtext NOT NULL,
  `fan_capacity_and_water_gauge` longtext NOT NULL,
  `quantity_of_air_reaching_district` longtext NOT NULL,
  `do_you_apprehend_any_premature_collapse` longtext NOT NULL,
  `incubation_period` longtext NOT NULL,
  `what_are_the_crossing` longtext NOT NULL,
  `what_the_known_or_expected` longtext NOT NULL,
  `what_was_average_rate` longtext NOT NULL,
  `percentage_of_extraction_achieved` longtext NOT NULL,
  `expected_percentage_of_extraction` longtext NOT NULL,
  `what_is_coal_raised_sand_stowed` longtext NOT NULL,
  `what_was_the_average_rate_of_daily` longtext NOT NULL,
  `state_the_number_of_pillars` longtext NOT NULL,
  `has_the_area_applied_for_depilling` longtext NOT NULL,
  `please_state_the_type` longtext NOT NULL,
  `how_long_it_will_take_you` longtext NOT NULL,
  `have_you_submitted_draft_systematic` longtext NOT NULL,
  `does_the_area_proposed_to_be_depillared` longtext NOT NULL,
  `whether_the_application_has_been_made_under_105` longtext NOT NULL,
  `please_state_whether_any_permission_for_extraction` longtext NOT NULL,
  `where_permission_has_been_granted` longtext NOT NULL,
  `has_the_extraction_been_completed` longtext NOT NULL,
  `give_details_of_experience` longtext NOT NULL,
  `any_other_relevant_details` longtext NOT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `designation` longtext NOT NULL,
  `sig_date` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `gasmodel_auto`
--

CREATE TABLE `gasmodel_auto` (
  `id` int(11) NOT NULL,
  `mine_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `sensor_name` varchar(10) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `sensor_value` double DEFAULT NULL,
  `date_time` datetime(6) NOT NULL
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

--
-- Dumping data for table `gasmonitoring_manual`
--

INSERT INTO `gasmonitoring_manual` (`id`, `CH4`, `CH4_ALERT`, `CO`, `CO_ALERT`, `CO2`, `CO2_ALERT`, `O2`, `O2_ALERT`, `H2S`, `H2S_ALERT`, `NO2`, `NO2_ALERT`, `SO2`, `SO2_ALERT`, `H2`, `H2_ALERT`, `He`, `He_ALERT`, `dt`) VALUES
(2, 16, 'Evacuate', 12, 'Normal', 12, 'Normal', 23, 'Normal', 34, 'Alarming', 34, 'Critical', 34, 'Critical', 45, 'Alarming', 34, 'Alarming', '2020-07-13 12:03:41.056094');

-- --------------------------------------------------------

--
-- Table structure for table `identification_report_of_the_problem`
--

CREATE TABLE `identification_report_of_the_problem` (
  `id` int(11) NOT NULL,
  `problem_type` varchar(500) DEFAULT NULL,
  `application_desc` varchar(500) DEFAULT NULL,
  `mine_manager_name` varchar(500) DEFAULT NULL,
  `problem` varchar(500) DEFAULT NULL,
  `nature` varchar(500) DEFAULT NULL,
  `findings` varchar(500) DEFAULT NULL,
  `root_cause` varchar(500) DEFAULT NULL,
  `corrective_action` varchar(500) DEFAULT NULL,
  `result` varchar(500) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `medical_report`
--

CREATE TABLE `medical_report` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `report` varchar(200) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  `employee_id_id` int(11) NOT NULL,
  `mine_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `metal_mine_extract_permission`
--

CREATE TABLE `metal_mine_extract_permission` (
  `id` int(11) NOT NULL,
  `name_of_mine` longtext NOT NULL,
  `name_of_owner` longtext NOT NULL,
  `mineral_worked` longtext NOT NULL,
  `name_of_ore_bodies` longtext NOT NULL,
  `location` longtext NOT NULL,
  `thickness_of_ore` longtext NOT NULL,
  `average_true_width` longtext NOT NULL,
  `reff_width` longtext NOT NULL,
  `stoping_width` longtext NOT NULL,
  `size_of_ore_block` longtext NOT NULL,
  `depth_of_vein_of_ore_body` longtext NOT NULL,
  `rate_of_dip` longtext NOT NULL,
  `are_there_any_parallel_reefs` longtext NOT NULL,
  `is_there_any_history_of_occurance` longtext NOT NULL,
  `is_there_any_history_of_fire` longtext NOT NULL,
  `particular_about_the_working_to_be_stoped` longtext NOT NULL,
  `max_height_and_width_of_working` longtext NOT NULL,
  `nature_and_type_of_hanging_wall` longtext NOT NULL,
  `general_condition_of_workings` longtext NOT NULL,
  `are_the_working_dry_damp_naturally_wet` longtext NOT NULL,
  `maximum_and_minimum_thickness` longtext NOT NULL,
  `maximum` longtext NOT NULL,
  `minimum` longtext NOT NULL,
  `are_there_any_geological_dist` longtext NOT NULL,
  `plan_showing_the_area_to_be_stoped` longtext NOT NULL,
  `are_the_main_approach_roads` longtext NOT NULL,
  `section_plan_of_strata_showing` longtext NOT NULL,
  `proposed_method_of_extraction` longtext NOT NULL,
  `manner_of_extraction_of_ore_block` longtext NOT NULL,
  `condition_of_overlying_and_underlying` longtext NOT NULL,
  `is_these_areas_free_from_water` longtext NOT NULL,
  `are_the_deposits_extracted` longtext NOT NULL,
  `if_it_has_been_extracted` longtext NOT NULL,
  `railway` longtext NOT NULL,
  `public_private` longtext NOT NULL,
  `river_nallah` longtext NOT NULL,
  `building_dwelling` longtext NOT NULL,
  `high_tension` longtext NOT NULL,
  `arial_rope_way` longtext NOT NULL,
  `water_pipe_and_gas_main` longtext NOT NULL,
  `any_other_structure` longtext NOT NULL,
  `highest_flood_level` longtext NOT NULL,
  `damage_to_surface_structure` longtext NOT NULL,
  `if_you_apprehend_danger` longtext NOT NULL,
  `if_you_do_not_apprehend` longtext NOT NULL,
  `due_to_the_vicinity_of_geological` longtext NOT NULL,
  `a_5_into_6_stretch_of_pcc_road` longtext NOT NULL,
  `however_there_is_no_further` longtext NOT NULL,
  `acquisition_fencing_of_surface` longtext NOT NULL,
  `if_the_surface_is_likely_to_be_affected` longtext NOT NULL,
  `if_not_what_alternative` longtext NOT NULL,
  `danger_of_inundation` longtext NOT NULL,
  `is_there_any_danger_of_inundation` longtext NOT NULL,
  `surface_water` longtext NOT NULL,
  `under_ground_working` longtext NOT NULL,
  `of_any_working_lying_above` longtext NOT NULL,
  `of_the_adjoining_mines` longtext NOT NULL,
  `whether_precautionary` longtext NOT NULL,
  `danger_from_fire` longtext NOT NULL,
  `danger_of_premature` longtext NOT NULL,
  `do_you_apprehend_any_premature` longtext NOT NULL,
  `division_of_the_area_into_panel` longtext NOT NULL,
  `has_the_area_applied_for_stoping` longtext NOT NULL,
  `systematic_timbering_rules` longtext NOT NULL,
  `have_the_systermatic_timber` longtext NOT NULL,
  `working_within_disputed_area` longtext NOT NULL,
  `does_the_area_proposed` longtext NOT NULL,
  `for_application_under_109` longtext NOT NULL,
  `reference_to_previous_permission` longtext NOT NULL,
  `the_reference_number_and_date_of_letter` longtext NOT NULL,
  `has_extraction_been_completed` longtext NOT NULL,
  `whether_all_plans_and_section` longtext NOT NULL,
  `any_other_relevent_details` longtext NOT NULL,
  `underground_plan` varchar(100) DEFAULT NULL,
  `longitudinal_vertical_section` varchar(100) DEFAULT NULL,
  `geological_plan` varchar(100) DEFAULT NULL,
  `vertical_section` varchar(100) DEFAULT NULL,
  `plan_sections_showing` varchar(100) DEFAULT NULL,
  `schematic_diagram` varchar(100) DEFAULT NULL,
  `a_brief_write_up` varchar(100) DEFAULT NULL,
  `photo_copy_of_approved_ssr` varchar(100) DEFAULT NULL,
  `survey_report` varchar(100) DEFAULT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `designation` longtext NOT NULL,
  `sig_date` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
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
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `minedetails`
--

INSERT INTO `minedetails` (`id`, `name`, `area`, `state`, `latitude`, `longitude`, `mine_map_image`, `mine_map_unit`, `village_area_road`, `tehsil_taluka_subdivision`, `district`, `pin`, `date_of_opening`, `lin_no`, `created_at`) VALUES
(1, 'Jharia Mines', 'Dhanbad', 'Jharkhand', 23.741, 86.406, 'mine_map_image/cimfr_img_WoNxeIG.JPG', 8, 'Dhanbad', 'Dhanbad', 'Dhanbad', '826001', '2020-07-13', 'LIN00001', '2020-07-13 11:44:43.363311'),
(2, 'Chinakuri', 'Dhanbad', 'Jharkhand', 23.6852802, 86.8574166, 'mine_map_image/cimfr_img_coWkOj1.JPG', 8, 'Dhanbad', 'Dhanbad', 'Dhanbad', '826001', '2020-07-14', 'LIN012345', '2018-06-27 07:28:36.806195'),
(3, 'Mandal Mine', 'Dhabad', 'Jharkhand', 23.8172421, 86.4277111, 'mine_map_image/cimfr_img_S9hvoQs.JPG', 8, 'Dhanbad', 'Dhanbad', 'Dhanbad', '826001', '1976-02-03', 'LIN012345', '2018-07-17 11:35:18.730493'),
(4, 'CSIR-CIMFR', 'DHANBAD', 'Jharkhand', 23.8170376, 86.4276411, 'mine_map_image/cimfr_img.JPG', 8, 'Dhanbad', 'Dhanbad', 'Dhanbad', '826001', '2019-01-10', 'LOO9', '2019-01-10 11:06:42.454839');

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
(1, 'First Shift', 4, '6:00 AM', '2:00 PM', '.', '2020-07-14 17:50:55.831624', '2020-07-14 17:50:55.831624'),
(2, 'Second Shift', 4, '2:00 PM', '10:00 PM', '.', '2020-07-14 17:51:21.453395', '2020-07-14 17:51:21.453395'),
(3, 'Third Shift', 4, '10:00 PM', '6:00 AM', '.', '2020-07-14 17:51:48.882775', '2020-07-14 17:51:48.882775');

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
  `mine_id` int(11) DEFAULT NULL,
  `parent_role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `miningrole`
--

INSERT INTO `miningrole` (`id`, `name`, `type`, `description`, `created_date`, `modified_date`, `mine_id`, `parent_role_id`) VALUES
(1, 'General Manager(GM)', 'officer', '', '2018-06-28 18:02:04.284629', '2020-07-15 09:53:00.113706', 4, NULL),
(12, 'Manager', 'officer', '', '2020-07-15 09:53:14.819730', '2020-07-15 09:53:14.829734', 4, 1),
(13, 'Asst Manager', 'officer', '', '2020-07-15 09:53:44.675432', '2020-07-15 09:53:44.685431', 4, 12),
(14, 'Engineer / Level Incharge', 'officer', '', '2020-07-15 09:54:57.966364', '2020-07-15 09:54:57.977369', 4, 13),
(15, 'Foreman', 'officer', '', '2020-07-15 09:55:14.132625', '2020-07-15 09:55:14.143626', 4, 14),
(16, 'Mining Mate', 'worker', '', '2020-07-15 09:55:41.295209', '2020-07-15 09:55:41.304850', 4, 15),
(17, 'Drilling Man', 'worker', '', '2020-07-15 09:57:11.549069', '2020-07-15 09:57:11.558746', 4, 16),
(18, 'Timber Man', 'worker', '', '2020-07-15 09:57:29.211319', '2020-07-15 09:57:29.221324', 4, 17),
(19, 'Drilling Helper', 'worker', '', '2020-07-15 09:57:54.113442', '2020-07-15 09:57:54.121439', 4, 18),
(20, 'Other Worker...', 'worker', '', '2020-07-15 09:58:13.589854', '2020-07-15 09:58:13.597854', 4, 19);

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
  `color` varchar(200) NOT NULL,
  `download_link` varchar(100) DEFAULT NULL,
  `download_number` int(11) DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `isread` int(11) NOT NULL,
  `employee_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `mine_id_id` int(11) NOT NULL
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
  `mine_id_id` int(11) NOT NULL
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
  `mine_id_id` int(11) NOT NULL
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
  `mine_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_monthly`
--

CREATE TABLE `production_monthly` (
  `id` int(11) NOT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `month` int(11) NOT NULL,
  `years` int(11) NOT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `mine_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_monthlydispatch`
--

CREATE TABLE `production_monthlydispatch` (
  `id` int(11) NOT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `month` int(11) NOT NULL,
  `years` int(11) NOT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) NOT NULL
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
  `mine_id_id` int(11) NOT NULL
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
  `mine_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_yearlydispatch`
--

CREATE TABLE `production_yearlydispatch` (
  `id` int(11) NOT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `years` int(11) NOT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `production_yearlyentry`
--

CREATE TABLE `production_yearlyentry` (
  `id` int(11) NOT NULL,
  `production_type` varchar(100) DEFAULT NULL,
  `total_weight` int(11) DEFAULT NULL,
  `years` int(11) NOT NULL,
  `weight_unit` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) NOT NULL
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
  `mine_id_id` int(11) DEFAULT NULL,
  `user_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile_extension`
--

INSERT INTO `profile_extension` (`id`, `profile_avatar`, `mine_id_id`, `user_id_id`) VALUES
(1, 'employee_image/cimfr-logo.jpg', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rate_of_minimum_wage`
--

CREATE TABLE `rate_of_minimum_wage` (
  `id` int(11) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `minimum_basic` double DEFAULT NULL,
  `dearness_allowance` double DEFAULT NULL,
  `overtime` double DEFAULT NULL,
  `mine_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `area` varchar(255) DEFAULT NULL,
  `date_fr` datetime(6) DEFAULT NULL,
  `date_to` datetime(6) DEFAULT NULL,
  `incident_type` varchar(255) DEFAULT NULL,
  `mine_id` int(11) DEFAULT NULL,
  `shift_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rescue_records_others`
--

CREATE TABLE `rescue_records_others` (
  `id` int(11) NOT NULL,
  `rescue_or_rescued` varchar(1) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `rescue_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rescue_records_rescued_employees_name`
--

CREATE TABLE `rescue_records_rescued_employees_name` (
  `id` int(11) NOT NULL,
  `rescue_records_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rescue_records_rescue_person_name`
--

CREATE TABLE `rescue_records_rescue_person_name` (
  `id` int(11) NOT NULL,
  `rescue_records_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `safety`
--

CREATE TABLE `safety` (
  `id` int(11) NOT NULL,
  `owner` varchar(200) NOT NULL,
  `agent` varchar(200) NOT NULL,
  `manager` varchar(200) NOT NULL,
  `status_report` date NOT NULL,
  `mine_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `safety`
--

INSERT INTO `safety` (`id`, `owner`, `agent`, `manager`, `status_report`, `mine_id`) VALUES
(1, 'Vikash', 'Shyam', 'Pandit', '2020-07-13', 1),
(2, 'Vikash', 'Shyam', 'khusboo', '2020-07-14', 1),
(3, 'Vikash', 'Shyam', 'khusboo', '2020-07-14', 1),
(4, 'Vikash', 'Shyam', 'Pandit', '2020-07-14', 1),
(5, 'Vikash', 'Shyam', 'Pandit', '2020-07-14', 1),
(6, 'Vikash', 'Shyam', 'Pandit', '2020-07-14', 1);

-- --------------------------------------------------------

--
-- Table structure for table `safetytable`
--

CREATE TABLE `safetytable` (
  `id` int(11) NOT NULL,
  `print_hazard` varchar(200) NOT NULL,
  `mit_date` date DEFAULT NULL,
  `auditable_work` varchar(200) NOT NULL,
  `comp_date` date DEFAULT NULL,
  `remarks` varchar(200) NOT NULL,
  `safety_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `safetytable`
--

INSERT INTO `safetytable` (`id`, `print_hazard`, `mit_date`, `auditable_work`, `comp_date`, `remarks`, `safety_id_id`) VALUES
(1, 'A', '2020-07-13', 'B', '2020-06-08', 'C', 1),
(3, 'C', '2020-07-13', 'D', '2020-07-13', 'E', 1),
(4, 'earthquake1', '2020-07-13', 'fgh', '2020-07-14', 'Nil', 2),
(5, 'earthquake2', '2020-07-14', 'sdfggh', '2020-07-14', 'Nil', 2),
(6, 'earthquake2', '2020-07-14', 'sdfggh', '2020-07-14', 'Nil', 3),
(7, 'A', '2020-06-02', 'B', '2020-07-14', 'C', 4),
(8, 'A', '2020-06-02', 'B', '2020-07-14', 'C', 5),
(9, 'A', '2020-06-02', 'B', '2020-07-14', 'C', 6);

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
-- Table structure for table `sensor_node`
--

CREATE TABLE `sensor_node` (
  `id` int(11) NOT NULL,
  `node_id` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `x_axis` double NOT NULL,
  `y_axis` double NOT NULL,
  `photo1` varchar(100) DEFAULT NULL,
  `photo2` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `isgoaf` tinyint(1) NOT NULL,
  `mine_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sensor_sensor_node`
--

CREATE TABLE `sensor_sensor_node` (
  `id` int(11) NOT NULL,
  `ip_add` varchar(200) NOT NULL,
  `sensor_id` varchar(200) NOT NULL,
  `sensor_name` varchar(200) NOT NULL,
  `sensor_unit` varchar(200) NOT NULL,
  `sensor_threshold_limit` varchar(200) NOT NULL,
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
  `interval_time` int(11) DEFAULT NULL,
  `audio_play_type` varchar(10) NOT NULL,
  `description` longtext NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_id_id` int(11) NOT NULL,
  `node_id_id` int(11) NOT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `slope_location`
--

CREATE TABLE `slope_location` (
  `id` int(11) NOT NULL,
  `location_name` varchar(200) NOT NULL,
  `tag_no` varchar(200) DEFAULT NULL,
  `x_axis` double DEFAULT NULL,
  `y_axis` double DEFAULT NULL,
  `json_url` varchar(200) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_date` date NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `mine_name_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `slope_sensor`
--

CREATE TABLE `slope_sensor` (
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

-- --------------------------------------------------------

--
-- Table structure for table `slope_sensor_data`
--

CREATE TABLE `slope_sensor_data` (
  `id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `sensor_value` varchar(50) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `slope_sensor_flag`
--

CREATE TABLE `slope_sensor_flag` (
  `id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `limit` int(11) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL,
  `pause_waring_duration_end_datetime` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `mine_name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `strata_location`
--

INSERT INTO `strata_location` (`id`, `location_name`, `tag_no`, `x_axis`, `y_axis`, `description`, `created_date`, `modified_date`, `mine_name_id`) VALUES
(1, 'L1', 'tag1', 42.32, 43.06, 'na', '2020-07-15', '2020-07-15 11:13:47.135773', 4);

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
  `location_id_id` int(11) NOT NULL,
  `mine_name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `strata_sensor`
--

INSERT INTO `strata_sensor` (`id`, `sensor_name`, `sensor_unit`, `tag_no`, `level_1_warning_unit`, `level_2_warning_unit`, `level_3_warning_unit`, `level_1_color`, `level_2_color`, `level_3_color`, `level_1_msg`, `level_2_msg`, `level_3_msg`, `level_1_audio`, `level_2_audio`, `level_3_audio`, `ip_address`, `interval_time`, `audio_play_type`, `description`, `created_date`, `modified_date`, `location_id_id`, `mine_name_id`) VALUES
(1, 'conversion', 'mm', 'tag1', 5, 8, 10, '#ADFF2F', '#FFA500', '#FF0000', 'abcgf', 'fytfr', 'yhdg', NULL, NULL, NULL, '', NULL, '', NULL, '2020-07-15 11:15:11.000000', '2020-07-15 11:15:11.000000', 1, 4);

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
(1, 1, '1', '2019-10-21 12:15:52.324515'),
(2, 1, '1', '2019-10-21 12:16:13.710658'),
(3, 1, '1', '2019-10-21 12:16:38.475547'),
(4, 1, '1', '2019-10-21 12:16:59.868661'),
(5, 1, '1', '2019-10-21 12:17:24.417928'),
(6, 1, '1', '2019-10-21 12:17:49.041650'),
(7, 1, '1', '2019-10-21 12:18:13.254220'),
(8, 1, '1', '2019-10-21 12:18:34.518618'),
(9, 1, '1', '2019-10-21 12:18:58.587631'),
(10, 1, '1', '2019-10-21 12:19:22.760896'),
(11, 1, '1', '2019-10-21 12:19:44.179061'),
(12, 1, '1', '2019-10-21 12:20:09.169995'),
(13, 1, '1', '2019-10-21 12:20:34.319873'),
(14, 1, '1', '2019-10-21 12:20:55.595652'),
(15, 1, '1', '2019-10-21 12:21:19.726941'),
(16, 1, '1', '2019-10-21 12:21:45.015728'),
(17, 1, '1', '2019-10-21 12:22:07.218678'),
(18, 1, '1', '2019-10-21 12:22:34.081029'),
(19, 1, '1', '2019-10-21 12:22:55.413789'),
(20, 1, '1', '2019-10-21 12:23:19.731781'),
(21, 1, '1', '2019-10-21 12:23:41.922049'),
(22, 1, '1', '2019-10-21 12:24:08.165498'),
(23, 1, '1', '2019-10-21 12:24:29.542785'),
(24, 1, '1', '2019-10-21 12:24:53.590379'),
(25, 1, '1', '2019-10-21 12:25:19.872115'),
(26, 1, '1', '2019-10-21 12:25:41.284083'),
(27, 1, '1', '2019-10-21 12:26:08.182811'),
(28, 1, '1', '2019-10-21 12:26:31.468579'),
(29, 1, '1', '2019-10-21 12:26:53.716322'),
(30, 1, '1', '2019-10-21 12:27:17.814950'),
(31, 1, '1', '2019-10-21 12:27:43.026105'),
(32, 1, '1', '2019-10-21 12:28:04.267516'),
(33, 1, '1', '2019-10-21 12:28:29.401124'),
(34, 1, '1', '2019-10-21 12:28:50.748497'),
(35, 1, '1', '2019-10-21 12:29:14.756714'),
(36, 1, '1', '2019-10-21 12:29:38.947653'),
(37, 1, '1', '2019-10-21 12:30:03.197766'),
(38, 1, '1', '2019-10-21 12:30:24.592073'),
(39, 1, '1', '2019-10-21 12:30:49.097277'),
(40, 1, '1', '2019-10-21 12:31:13.832278'),
(41, 1, '1', '2019-10-21 12:31:38.007333'),
(42, 1, '1', '2019-10-21 12:31:59.322621'),
(43, 1, '1', '2019-10-21 12:32:23.455157'),
(44, 1, '1', '2019-10-21 12:32:44.753401'),
(45, 1, '1', '2019-10-21 12:33:08.639030'),
(46, 1, '1', '2019-10-21 12:33:32.952268'),
(47, 1, '1', '2019-10-21 12:33:58.110015'),
(48, 1, '1', '2019-10-21 12:34:19.546044'),
(49, 1, '1', '2019-10-21 12:34:43.470686'),
(50, 1, '1', '2019-10-21 12:35:07.670543'),
(51, 1, '1', '2019-12-04 15:58:38.365586'),
(52, 1, '1', '2019-12-04 15:59:45.292853'),
(53, 1, '1', '2019-12-04 16:00:37.525377'),
(54, 1, '1', '2019-12-04 16:01:06.945512'),
(55, 1, '1', '2019-12-04 16:01:33.461879'),
(56, 1, '1', '2019-12-04 16:02:02.856682'),
(57, 1, '1', '2019-12-04 16:02:34.631093'),
(58, 1, '1', '2019-12-04 16:02:58.694398'),
(59, 1, '1', '2019-12-04 16:03:36.352524'),
(60, 1, '1', '2019-12-04 16:03:57.646040'),
(61, 1, '1', '2019-12-04 16:04:36.977261'),
(62, 1, '1', '2019-12-04 16:04:58.219117'),
(63, 1, '1', '2019-12-04 16:05:34.351613'),
(64, 1, '1', '2019-12-04 16:05:55.834169'),
(65, 1, '1', '2019-12-04 16:06:31.284848'),
(66, 1, '1', '2019-12-04 16:06:52.660682'),
(67, 1, '1', '2019-12-04 16:07:30.073703'),
(68, 1, '1', '2020-05-05 11:54:27.278430'),
(69, 1, '1', '2020-05-05 11:55:44.215907'),
(70, 1, '1', '2020-05-05 11:56:10.910988'),
(71, 1, '1', '2020-05-05 11:56:51.247619'),
(72, 1, '1', '2020-05-05 11:57:12.555155'),
(73, 1, '1', '2020-05-05 11:57:43.371307'),
(74, 1, '1', '2020-05-05 11:58:04.670598'),
(75, 1, '1', '2020-05-05 11:58:38.976905'),
(76, 1, '1', '2020-05-05 11:59:01.486434'),
(77, 1, '1', '2020-05-05 11:59:32.982113'),
(78, 1, '1', '2020-05-05 11:59:54.264124'),
(79, 1, '1', '2020-05-05 12:00:22.724960'),
(80, 1, '1', '2020-05-05 12:00:43.916212'),
(81, 1, '1', '2020-05-05 12:01:13.919896'),
(82, 1, '1', '2020-05-05 12:01:35.085274'),
(83, 1, '1', '2020-05-05 12:02:06.234353'),
(84, 1, '1', '2020-05-05 12:02:34.141747'),
(85, 1, '1', '2020-05-05 12:03:01.364117'),
(86, 1, '1', '2020-05-05 12:03:24.380884'),
(87, 1, '1', '2020-05-05 12:03:56.454168'),
(88, 1, '1', '2020-05-05 12:04:20.689174'),
(89, 1, '1', '2020-05-05 12:04:58.777675'),
(90, 1, '1', '2020-05-05 12:05:24.268691'),
(91, 1, '1', '2020-05-05 12:08:53.628319'),
(92, 1, '1', '2020-05-05 12:09:19.942529'),
(93, 1, '1', '2020-05-05 12:09:46.332945'),
(94, 1, '1', '2020-05-05 12:18:41.722791'),
(95, 1, '1', '2020-05-05 12:19:08.106196'),
(96, 1, '1', '2020-05-05 12:19:34.359950'),
(97, 1, '1', '2020-05-05 12:20:00.707744'),
(98, 1, '1', '2020-05-05 12:20:27.071053'),
(99, 1, '1', '2020-05-05 12:20:53.440181'),
(100, 1, '1', '2020-05-05 12:21:19.772071'),
(101, 1, '1', '2020-05-05 12:21:41.072689'),
(102, 1, '1', '2020-05-05 12:22:07.506029'),
(103, 1, '1', '2020-05-05 12:22:33.738216'),
(104, 1, '1', '2020-05-05 12:23:00.018644'),
(105, 1, '1', '2020-05-05 12:23:26.367004'),
(106, 1, '1', '2020-05-05 12:23:52.582494'),
(107, 1, '1', '2020-05-05 12:24:18.981575'),
(108, 1, '1', '2020-05-05 12:24:45.263749'),
(109, 1, '1', '2020-05-05 12:25:11.530965'),
(110, 1, '1', '2020-05-05 12:25:37.903103'),
(111, 1, '1', '2020-05-05 12:26:04.261224'),
(112, 1, '1', '2020-05-05 12:26:30.665870'),
(113, 1, '1', '2020-05-05 12:26:57.116296'),
(114, 1, '1', '2020-05-05 12:27:23.490986'),
(115, 1, '1', '2020-05-05 12:27:49.881020'),
(116, 1, '1', '2020-05-05 12:28:16.447302'),
(117, 1, '1', '2020-05-05 12:28:42.771468'),
(118, 1, '1', '2020-05-05 12:29:09.136935'),
(119, 1, '1', '2020-05-05 12:29:35.578982'),
(120, 1, '1', '2020-05-05 12:30:01.909725'),
(121, 1, '1', '2020-05-05 12:30:28.235020'),
(122, 1, '1', '2020-05-05 12:30:54.675821'),
(123, 1, '1', '2020-05-05 12:31:20.964388'),
(124, 1, '1', '2020-05-05 12:31:47.430841'),
(125, 1, '1', '2020-05-05 12:32:13.830158'),
(126, 1, '1', '2020-05-05 12:32:40.178574'),
(127, 1, '1', '2020-05-05 12:33:06.431131'),
(128, 1, '1', '2020-05-05 12:33:32.735127'),
(129, 1, '1', '2020-05-05 12:33:59.120868'),
(130, 1, '1', '2020-05-05 12:34:25.390485'),
(131, 1, '1', '2020-05-05 12:34:51.757241'),
(132, 1, '1', '2020-05-05 12:35:18.322320'),
(133, 1, '1', '2020-05-05 12:35:44.754463'),
(134, 1, '1', '2020-05-05 12:36:11.219833'),
(135, 1, '1', '2020-05-05 12:36:37.602870'),
(136, 1, '1', '2020-05-05 12:37:03.977037'),
(137, 1, '1', '2020-05-05 12:37:30.275030'),
(138, 1, '1', '2020-05-05 12:37:56.791821'),
(139, 1, '1', '2020-05-05 12:38:23.181904'),
(140, 1, '1', '2020-05-05 12:38:49.489037'),
(141, 1, '1', '2020-05-05 12:39:15.829033'),
(142, 1, '1', '2020-05-05 12:39:42.179243'),
(143, 1, '1', '2020-05-05 12:40:08.570290'),
(144, 1, '1', '2020-05-05 12:40:35.020569'),
(145, 1, '1', '2020-05-05 12:41:01.259238'),
(146, 1, '1', '2020-05-05 12:41:27.607378'),
(147, 1, '1', '2020-05-05 12:41:53.842656'),
(148, 1, '1', '2020-05-05 12:42:20.084071'),
(149, 1, '1', '2020-05-05 12:42:46.374398'),
(150, 1, '1', '2020-05-05 12:43:12.711878'),
(151, 1, '1', '2020-05-05 12:43:39.065385'),
(152, 1, '1', '2020-05-05 12:44:05.751053'),
(153, 1, '1', '2020-05-05 12:44:32.075943'),
(154, 1, '1', '2020-05-05 12:44:58.598613'),
(155, 1, '1', '2020-05-05 12:45:24.890295'),
(156, 1, '1', '2020-05-05 12:45:51.405781'),
(157, 1, '1', '2020-05-05 12:46:17.712338'),
(158, 1, '1', '2020-05-05 12:46:44.478768'),
(159, 1, '1', '2020-05-05 12:47:10.977210'),
(160, 1, '1', '2020-05-05 12:47:37.309998'),
(161, 1, '1', '2020-05-05 12:48:03.883693'),
(162, 1, '1', '2020-05-05 12:48:30.332324'),
(163, 1, '1', '2020-05-05 12:48:56.632450'),
(164, 1, '1', '2020-05-05 12:49:22.963675'),
(165, 1, '1', '2020-05-05 12:49:49.338592'),
(166, 1, '1', '2020-05-05 12:50:15.696375'),
(167, 1, '1', '2020-05-05 12:50:42.010321'),
(168, 1, '1', '2020-05-05 12:51:08.287220'),
(169, 1, '1', '2020-05-05 12:51:34.520459'),
(170, 1, '1', '2020-05-05 12:52:00.802911'),
(171, 1, '1', '2020-05-05 12:52:27.031588'),
(172, 1, '1', '2020-05-05 12:52:53.272271'),
(173, 1, '1', '2020-05-05 12:53:19.555613'),
(174, 1, '1', '2020-05-05 12:53:45.957799'),
(175, 1, '1', '2020-05-05 12:54:12.331398'),
(176, 1, '1', '2020-05-05 12:54:38.664169'),
(177, 1, '1', '2020-05-05 12:55:05.041441'),
(178, 1, '1', '2020-05-05 12:55:31.349212'),
(179, 1, '1', '2020-05-05 12:55:57.756279'),
(180, 1, '1', '2020-05-05 12:56:24.315385'),
(181, 1, '1', '2020-05-05 12:56:50.679984'),
(182, 1, '1', '2020-05-05 12:57:17.053949'),
(183, 1, '1', '2020-05-05 12:57:43.360609'),
(184, 1, '1', '2020-05-05 12:58:09.676560'),
(185, 1, '1', '2020-05-05 12:58:36.034139'),
(186, 1, '1', '2020-05-05 12:59:02.365846'),
(187, 1, '1', '2020-05-05 12:59:28.640711'),
(188, 1, '1', '2020-05-05 12:59:55.090119'),
(189, 1, '1', '2020-05-05 13:00:21.338355'),
(190, 1, '1', '2020-05-05 13:00:47.704849'),
(191, 1, '1', '2020-05-05 13:01:14.087722'),
(192, 1, '1', '2020-05-05 13:01:40.483922'),
(193, 1, '1', '2020-05-05 13:02:09.180896'),
(194, 1, '1', '2020-05-05 13:02:36.016101'),
(195, 1, '1', '2020-05-05 13:03:02.727665'),
(196, 1, '1', '2020-05-05 13:03:29.163992'),
(197, 1, '1', '2020-05-05 13:03:55.571369'),
(198, 1, '1', '2020-05-05 13:04:21.804238'),
(199, 1, '1', '2020-05-05 13:04:48.078179'),
(200, 1, '1', '2020-05-05 13:05:14.412493'),
(201, 1, '1', '2020-05-05 13:05:40.711771'),
(202, 1, '1', '2020-05-05 13:06:06.935673'),
(203, 1, '1', '2020-05-05 13:06:33.214527'),
(204, 1, '1', '2020-05-05 13:06:59.472583'),
(205, 1, '1', '2020-05-05 13:07:25.936998'),
(206, 1, '1', '2020-05-05 13:07:52.286667'),
(207, 1, '1', '2020-05-05 13:08:19.193766'),
(208, 1, '1', '2020-05-05 13:08:45.493530'),
(209, 1, '1', '2020-05-05 13:09:11.858053'),
(210, 1, '1', '2020-05-05 13:09:38.171957'),
(211, 1, '1', '2020-05-05 13:10:04.706034'),
(212, 1, '1', '2020-05-05 13:10:26.013560'),
(213, 1, '1', '2020-05-05 13:10:47.310638'),
(214, 1, '1', '2020-05-05 13:11:08.604500'),
(215, 1, '1', '2020-05-05 13:11:29.928545'),
(216, 1, '1', '2020-05-05 13:11:51.193707'),
(217, 1, '1', '2020-05-05 13:12:12.484852'),
(218, 1, '1', '2020-05-05 13:12:33.825778'),
(219, 1, '1', '2020-05-05 13:12:55.208553'),
(220, 1, '1', '2020-05-05 13:13:16.499546'),
(221, 1, '1', '2020-05-05 13:13:37.765327'),
(222, 1, '1', '2020-05-05 13:13:59.071413'),
(223, 1, '1', '2020-05-05 13:14:20.372753'),
(224, 1, '1', '2020-05-05 13:14:41.622568'),
(225, 1, '1', '2020-05-05 13:15:02.838077'),
(226, 1, '1', '2020-05-05 13:15:24.076745'),
(227, 1, '1', '2020-05-05 13:15:45.505166'),
(228, 1, '1', '2020-05-05 13:16:06.822186'),
(229, 1, '1', '2020-05-05 13:16:28.204838'),
(230, 1, '1', '2020-05-05 13:16:49.640913'),
(231, 1, '1', '2020-05-05 13:17:11.106332'),
(232, 1, '1', '2020-05-05 13:17:32.596488'),
(233, 1, '1', '2020-05-05 13:17:53.937917'),
(234, 1, '1', '2020-05-05 13:18:15.211544'),
(235, 1, '1', '2020-05-05 13:18:36.577149'),
(236, 1, '1', '2020-05-05 13:18:57.835050'),
(237, 1, '1', '2020-05-05 13:19:19.251269'),
(238, 1, '1', '2020-05-05 13:19:40.534241'),
(239, 1, '1', '2020-05-05 13:20:01.898817'),
(240, 1, '1', '2020-05-05 13:20:23.340629'),
(241, 1, '1', '2020-05-05 13:20:44.631872'),
(242, 1, '1', '2020-05-05 13:21:05.914499'),
(243, 1, '1', '2020-05-05 13:21:27.280361'),
(244, 1, '1', '2020-05-05 13:21:48.578504'),
(245, 1, '1', '2020-05-05 13:22:09.994688'),
(246, 1, '1', '2020-05-05 13:22:31.370286'),
(247, 1, '1', '2020-05-05 13:22:52.851837'),
(248, 1, '1', '2020-05-05 13:23:14.102458'),
(249, 1, '1', '2020-05-05 13:23:35.390627'),
(250, 1, '1', '2020-05-05 13:23:56.652191'),
(251, 1, '1', '2020-05-05 13:24:17.935819'),
(252, 1, '1', '2020-05-05 13:24:39.285551'),
(253, 1, '1', '2020-05-05 13:25:00.551246'),
(254, 1, '1', '2020-05-05 13:25:21.911801'),
(255, 1, '1', '2020-05-05 13:25:43.251802'),
(256, 1, '1', '2020-05-05 13:26:04.593499'),
(257, 1, '1', '2020-05-05 13:26:26.251704'),
(258, 1, '1', '2020-05-05 13:26:47.783484'),
(259, 1, '1', '2020-05-05 13:27:09.031619'),
(260, 1, '1', '2020-05-05 13:27:30.289375'),
(261, 1, '1', '2020-05-05 13:27:51.564501'),
(262, 1, '1', '2020-05-05 13:28:12.805043'),
(263, 1, '1', '2020-05-05 13:28:34.170676'),
(264, 1, '1', '2020-05-05 13:28:55.478546'),
(265, 1, '1', '2020-05-05 13:29:16.836860'),
(266, 1, '1', '2020-05-05 13:29:38.169708'),
(267, 1, '1', '2020-05-05 13:29:59.458114'),
(268, 1, '1', '2020-05-05 13:30:20.710293'),
(269, 1, '1', '2020-05-05 13:30:41.984456'),
(270, 1, '1', '2020-05-05 13:31:03.217555'),
(271, 1, '1', '2020-05-05 13:31:24.514211'),
(272, 1, '1', '2020-05-05 13:31:45.812027'),
(273, 1, '1', '2020-05-05 13:32:07.082428'),
(274, 1, '1', '2020-05-05 13:32:28.494643'),
(275, 1, '1', '2020-05-05 13:32:49.714434'),
(276, 1, '1', '2020-05-05 13:33:11.093518'),
(277, 1, '1', '2020-05-05 13:33:32.491535'),
(278, 1, '1', '2020-05-05 13:33:53.757794'),
(279, 1, '1', '2020-05-05 13:34:14.999292'),
(280, 1, '1', '2020-05-05 13:34:36.263085'),
(281, 1, '1', '2020-05-05 13:34:57.597730'),
(282, 1, '1', '2020-05-05 13:35:18.946594'),
(283, 1, '1', '2020-05-05 13:35:40.262267'),
(284, 1, '1', '2020-05-05 13:36:01.569764'),
(285, 1, '1', '2020-05-05 13:36:22.901816'),
(286, 1, '1', '2020-05-05 13:36:44.193535'),
(287, 1, '1', '2020-05-05 13:37:05.434615'),
(288, 1, '1', '2020-05-05 13:37:26.783239'),
(289, 1, '1', '2020-05-05 13:37:48.083861'),
(290, 1, '1', '2020-05-05 13:38:09.324314'),
(291, 1, '1', '2020-05-05 13:38:30.722304'),
(292, 1, '1', '2020-05-05 13:38:52.040064'),
(293, 1, '1', '2020-05-05 13:39:13.307127'),
(294, 1, '1', '2020-05-05 13:39:34.514442'),
(295, 1, '1', '2020-05-05 13:39:55.804675'),
(296, 1, '1', '2020-05-05 13:40:17.017966'),
(297, 1, '1', '2020-05-05 13:40:38.208351'),
(298, 1, '1', '2020-05-05 13:40:59.453940'),
(299, 1, '1', '2020-05-05 13:41:20.640270'),
(300, 1, '1', '2020-05-05 13:41:41.882221'),
(301, 1, '1', '2020-05-05 13:42:03.205717'),
(302, 1, '1', '2020-05-05 13:42:24.447789'),
(303, 1, '1', '2020-05-05 13:42:45.753510'),
(304, 1, '1', '2020-05-05 13:43:07.044687'),
(305, 1, '1', '2020-05-05 13:43:28.320796'),
(306, 1, '1', '2020-05-05 13:43:49.700595'),
(307, 1, '1', '2020-05-05 13:44:10.992277'),
(308, 1, '1', '2020-05-05 13:44:32.311369'),
(309, 1, '1', '2020-05-05 13:44:53.578002'),
(310, 1, '1', '2020-05-05 13:45:14.930419'),
(311, 1, '1', '2020-05-05 13:45:36.197425'),
(312, 1, '1', '2020-05-05 13:45:57.434213'),
(313, 1, '1', '2020-05-05 13:46:18.720208'),
(314, 1, '1', '2020-05-05 13:46:40.060382'),
(315, 1, '1', '2020-05-05 13:47:01.415614'),
(316, 1, '1', '2020-05-05 13:47:22.692733'),
(317, 1, '1', '2020-05-05 13:47:44.050230'),
(318, 1, '1', '2020-05-05 13:48:05.407585'),
(319, 1, '1', '2020-05-05 13:48:26.737917'),
(320, 1, '1', '2020-05-05 13:48:48.117861'),
(321, 1, '1', '2020-05-05 13:49:09.380400'),
(322, 1, '1', '2020-05-05 13:49:30.755105'),
(323, 1, '1', '2020-05-05 13:49:52.029430'),
(324, 1, '1', '2020-05-05 13:50:13.370207'),
(325, 1, '1', '2020-05-05 13:50:34.628255'),
(326, 1, '1', '2020-05-05 13:50:55.878008'),
(327, 1, '1', '2020-05-05 13:51:17.250847'),
(328, 1, '1', '2020-05-05 13:51:38.630012'),
(329, 1, '1', '2020-05-05 13:51:59.867124'),
(330, 1, '1', '2020-05-05 13:52:21.192474'),
(331, 1, '1', '2020-05-05 13:52:42.422206'),
(332, 1, '1', '2020-05-05 13:53:03.687079'),
(333, 1, '1', '2020-05-05 13:53:24.903444'),
(334, 1, '1', '2020-05-05 13:53:46.119281'),
(335, 1, '1', '2020-05-05 13:54:07.389057'),
(336, 1, '1', '2020-05-05 13:54:28.680462'),
(337, 1, '1', '2020-05-05 13:54:49.950616'),
(338, 1, '1', '2020-05-05 13:55:11.262395'),
(339, 1, '1', '2020-05-05 13:55:32.614395'),
(340, 1, '1', '2020-05-05 13:55:53.914772'),
(341, 1, '1', '2020-05-05 13:56:15.171544'),
(342, 1, '1', '2020-05-05 13:56:36.704182'),
(343, 1, '1', '2020-05-05 13:56:58.061521'),
(344, 1, '1', '2020-05-05 13:57:19.369676'),
(345, 1, '1', '2020-05-05 13:57:40.702319'),
(346, 1, '1', '2020-05-05 13:58:01.950814'),
(347, 1, '1', '2020-05-05 13:58:23.226352'),
(348, 1, '1', '2020-05-05 13:58:44.666760'),
(349, 1, '1', '2020-05-05 13:59:05.891461'),
(350, 1, '1', '2020-05-05 13:59:27.223526'),
(351, 1, '1', '2020-05-05 13:59:48.488303'),
(352, 1, '1', '2020-05-05 14:00:09.914932'),
(353, 1, '1', '2020-05-05 14:00:31.361449'),
(354, 1, '1', '2020-05-05 14:00:52.669309'),
(355, 1, '1', '2020-05-05 14:01:13.904805'),
(356, 1, '1', '2020-05-05 14:01:35.175777'),
(357, 1, '1', '2020-05-05 14:01:56.475316'),
(358, 1, '1', '2020-05-05 14:02:17.773784'),
(359, 1, '1', '2020-05-05 14:02:39.085714'),
(360, 1, '1', '2020-05-05 14:03:00.447416'),
(361, 1, '1', '2020-05-05 14:03:21.726821'),
(362, 1, '1', '2020-05-05 14:03:43.100309'),
(363, 1, '1', '2020-05-05 14:04:04.394415'),
(364, 1, '1', '2020-05-05 14:04:25.794145'),
(365, 1, '1', '2020-05-05 14:04:47.084715'),
(366, 1, '1', '2020-05-05 14:05:08.433890'),
(367, 1, '1', '2020-05-05 14:05:29.816561'),
(368, 1, '1', '2020-05-05 14:05:51.141311'),
(369, 1, '1', '2020-05-05 14:06:12.398897'),
(370, 1, '1', '2020-05-05 14:06:33.722149'),
(371, 1, '1', '2020-05-05 14:06:55.463594'),
(372, 1, '1', '2020-05-05 14:07:16.712049'),
(373, 1, '1', '2020-05-05 14:07:38.028038'),
(374, 1, '1', '2020-05-05 14:07:59.369600'),
(375, 1, '1', '2020-05-05 14:08:20.736677'),
(376, 1, '1', '2020-05-05 14:08:42.010766'),
(377, 1, '1', '2020-05-05 14:09:03.274664'),
(378, 1, '1', '2020-05-05 14:09:24.557304'),
(379, 1, '1', '2020-05-05 14:09:45.838524'),
(380, 1, '1', '2020-05-05 14:10:07.450022'),
(381, 1, '1', '2020-05-05 14:10:28.913446'),
(382, 1, '1', '2020-05-05 14:10:50.283034'),
(383, 1, '1', '2020-05-05 14:11:11.565364'),
(384, 1, '1', '2020-05-05 14:11:32.843620'),
(385, 1, '1', '2020-05-05 14:11:54.139851'),
(386, 1, '1', '2020-05-05 14:12:15.458155'),
(387, 1, '1', '2020-05-05 14:12:36.757146'),
(388, 1, '1', '2020-05-05 14:12:58.064852'),
(389, 1, '1', '2020-05-05 14:13:19.463908'),
(390, 1, '1', '2020-05-05 14:13:40.813438'),
(391, 1, '1', '2020-05-05 14:14:02.162723'),
(392, 1, '1', '2020-05-05 14:14:23.519513'),
(393, 1, '1', '2020-05-05 14:14:44.802378'),
(394, 1, '1', '2020-05-05 14:15:06.168788'),
(395, 1, '1', '2020-05-05 14:15:27.400201'),
(396, 1, '1', '2020-05-05 14:15:48.684021'),
(397, 1, '1', '2020-05-05 14:16:09.982581'),
(398, 1, '1', '2020-05-05 14:16:31.248949'),
(399, 1, '1', '2020-05-05 14:16:53.105118'),
(400, 1, '1', '2020-05-05 14:17:14.389535'),
(401, 1, '1', '2020-05-05 14:17:35.739577'),
(402, 1, '1', '2020-05-05 14:17:57.011559'),
(403, 1, '1', '2020-05-05 14:18:45.680777'),
(404, 1, '1', '2020-05-05 14:19:07.000894'),
(405, 1, '1', '2020-05-05 14:19:28.383240'),
(406, 1, '1', '2020-05-05 14:19:49.833908'),
(407, 1, '1', '2020-05-05 14:20:11.132478'),
(408, 1, '1', '2020-05-05 14:20:32.365660'),
(409, 1, '1', '2020-05-05 14:20:53.646996'),
(410, 1, '1', '2020-05-05 14:21:41.039223'),
(411, 1, '1', '2020-05-05 14:23:56.480813'),
(412, 1, '1', '2020-05-05 14:24:22.741750'),
(413, 1, '1', '2020-05-05 14:25:11.297009'),
(414, 1, '1', '2020-05-05 14:25:16.860869'),
(415, 1, '1', '2020-05-05 14:25:38.184124'),
(416, 1, '1', '2020-05-05 14:25:41.685072'),
(417, 1, '1', '2020-05-05 14:26:02.961101'),
(418, 1, '1', '2020-05-05 14:26:10.400534'),
(419, 1, '1', '2020-05-05 14:26:31.682408'),
(420, 1, '1', '2020-05-05 14:26:38.066671'),
(421, 1, '1', '2020-05-05 14:26:59.482317'),
(422, 1, '1', '2020-05-05 14:27:09.073046'),
(423, 1, '1', '2020-05-05 14:27:30.480818'),
(424, 1, '1', '2020-05-05 14:27:37.122071'),
(425, 1, '1', '2020-05-05 14:31:12.179839'),
(426, 1, '1', '2020-05-05 14:31:25.170969'),
(427, 1, '1', '2020-05-05 14:31:33.345849'),
(428, 1, '1', '2020-05-05 14:31:43.362379'),
(429, 1, '1', '2020-05-05 14:35:00.171972'),
(430, 1, '1', '2020-05-05 14:35:13.137917'),
(431, 1, '1', '2020-05-05 14:35:25.370575'),
(432, 1, '1', '2020-05-05 14:35:34.212333'),
(433, 1, '1', '2020-05-05 14:35:48.544965'),
(434, 1, '1', '2020-05-05 14:35:58.411970'),
(435, 1, '1', '2020-05-05 14:36:10.534837'),
(436, 1, '1', '2020-05-05 14:36:18.710201'),
(437, 1, '1', '2020-05-05 14:36:34.619074'),
(438, 1, '1', '2020-05-05 14:36:50.794001'),
(439, 1, '1', '2020-05-05 14:36:58.725333'),
(440, 1, '1', '2020-05-05 14:37:08.818321'),
(441, 1, '1', '2020-05-05 14:37:20.806960'),
(442, 1, '1', '2020-05-05 14:37:29.832011'),
(443, 1, '1', '2020-05-05 14:37:45.847241'),
(444, 1, '1', '2020-05-05 14:37:58.072906'),
(445, 1, '1', '2020-05-05 14:38:03.906310'),
(446, 1, '1', '2020-05-05 14:38:12.904458'),
(447, 1, '1', '2020-05-05 14:38:24.905128'),
(448, 1, '1', '2020-05-05 14:38:33.237372'),
(449, 1, '1', '2020-05-05 14:38:43.162335'),
(450, 1, '1', '2020-05-05 14:38:53.153794'),
(451, 1, '1', '2020-05-05 14:39:05.177338'),
(452, 1, '1', '2020-05-05 14:39:17.368233'),
(453, 1, '1', '2020-05-05 14:39:27.443326'),
(454, 1, '1', '2020-05-05 14:39:40.410436'),
(455, 1, '1', '2020-05-05 14:39:53.409595'),
(456, 1, '1', '2020-05-05 14:40:04.525676'),
(457, 1, '1', '2020-05-05 14:40:16.425254'),
(458, 1, '1', '2020-05-05 14:40:27.565821'),
(459, 1, '1', '2020-05-05 14:40:39.730466'),
(460, 1, '1', '2020-05-05 14:40:49.632707'),
(461, 1, '1', '2020-05-05 14:40:57.765317'),
(462, 1, '1', '2020-05-05 14:41:07.780935'),
(463, 1, '1', '2020-05-05 14:41:21.730757'),
(464, 1, '1', '2020-05-05 14:41:28.922164'),
(465, 1, '1', '2020-05-05 14:41:37.930625'),
(466, 1, '1', '2020-05-05 14:41:47.921677'),
(467, 1, '1', '2020-05-05 14:41:58.013273'),
(468, 1, '1', '2020-05-05 14:42:08.096183'),
(469, 1, '1', '2020-05-05 14:42:18.037068'),
(470, 1, '1', '2020-05-05 14:42:30.462935'),
(471, 1, '1', '2020-05-05 14:42:41.102880'),
(472, 1, '1', '2020-05-05 14:42:55.070416'),
(473, 1, '1', '2020-05-05 14:43:01.194930'),
(474, 1, '1', '2020-05-05 14:43:09.418228'),
(475, 1, '1', '2020-05-05 14:43:18.268099'),
(476, 1, '1', '2020-05-05 14:43:28.601209'),
(477, 1, '1', '2020-05-05 14:43:38.544669'),
(478, 1, '1', '2020-05-05 14:43:48.400627'),
(479, 1, '1', '2020-05-05 14:43:58.725086'),
(480, 1, '1', '2020-05-05 14:44:11.788626'),
(481, 1, '1', '2020-05-05 14:44:21.585156'),
(482, 1, '1', '2020-05-05 14:44:29.698454'),
(483, 1, '1', '2020-05-05 14:44:38.723433'),
(484, 1, '1', '2020-05-05 14:44:51.172595'),
(485, 1, '1', '2020-05-05 14:45:02.684208'),
(486, 1, '1', '2020-05-05 14:45:13.213211'),
(487, 1, '1', '2020-05-05 14:45:21.841943'),
(488, 1, '1', '2020-05-05 14:45:28.905548'),
(489, 1, '1', '2020-05-05 14:45:41.854597'),
(490, 1, '1', '2020-05-05 14:45:54.028872'),
(491, 1, '1', '2020-05-05 14:46:02.120811'),
(492, 1, '1', '2020-05-05 14:46:10.361429'),
(493, 1, '1', '2020-05-05 14:46:20.403585'),
(494, 1, '1', '2020-05-05 14:46:30.224872'),
(495, 1, '1', '2020-05-05 14:46:42.644314'),
(496, 1, '1', '2020-05-05 14:46:52.201422'),
(497, 1, '1', '2020-05-05 14:47:04.409127'),
(498, 1, '1', '2020-05-05 14:47:16.642295'),
(499, 1, '1', '2020-05-05 14:47:26.425327'),
(500, 1, '1', '2020-05-05 14:47:36.658094'),
(501, 1, '1', '2020-05-05 14:47:46.599074'),
(502, 1, '1', '2020-05-05 14:47:56.581614'),
(503, 1, '1', '2020-05-05 14:48:06.723572'),
(504, 1, '1', '2020-05-05 14:48:16.623253'),
(505, 1, '1', '2020-05-05 14:48:30.755265'),
(506, 1, '1', '2020-05-05 14:48:40.672550'),
(507, 1, '1', '2020-05-05 14:48:50.763375'),
(508, 1, '1', '2020-05-05 14:49:00.763954'),
(509, 1, '1', '2020-05-05 14:49:11.946022'),
(510, 1, '1', '2020-05-05 14:49:19.894889'),
(511, 1, '1', '2020-05-05 14:49:27.954044'),
(512, 1, '1', '2020-05-05 14:49:38.895920'),
(513, 1, '1', '2020-05-05 14:49:52.128473'),
(514, 1, '1', '2020-05-05 14:50:04.245373'),
(515, 1, '1', '2020-05-05 14:50:14.127535'),
(516, 1, '1', '2020-05-05 14:50:26.252667'),
(517, 1, '1', '2020-05-05 14:50:34.318583'),
(518, 1, '1', '2020-05-05 14:50:46.235161'),
(519, 1, '1', '2020-05-05 14:50:56.324719'),
(520, 1, '1', '2020-05-05 14:51:04.335396'),
(521, 1, '1', '2020-05-05 14:51:14.405770'),
(522, 1, '1', '2020-05-05 14:51:28.482015'),
(523, 1, '1', '2020-05-05 14:51:36.601273'),
(524, 1, '1', '2020-05-05 14:51:46.714982'),
(525, 1, '1', '2020-05-05 14:51:56.492644'),
(526, 1, '1', '2020-05-05 14:52:06.562952'),
(527, 1, '1', '2020-05-05 14:52:16.558196'),
(528, 1, '1', '2020-05-05 14:52:24.705121'),
(529, 1, '1', '2020-05-05 14:52:36.704537'),
(530, 1, '1', '2020-05-05 14:52:48.674123'),
(531, 1, '1', '2020-05-05 14:52:58.820363'),
(532, 1, '1', '2020-05-05 14:53:10.798418'),
(533, 1, '1', '2020-05-05 14:53:22.990196'),
(534, 1, '1', '2020-05-05 14:53:32.977448'),
(535, 1, '1', '2020-05-05 14:53:43.223148'),
(536, 1, '1', '2020-05-05 14:53:53.034202'),
(537, 1, '1', '2020-05-05 14:54:01.050896'),
(538, 1, '1', '2020-05-05 14:54:11.167548'),
(539, 1, '1', '2020-05-05 14:54:23.184249'),
(540, 1, '1', '2020-05-05 14:54:33.464515'),
(541, 1, '1', '2020-05-05 14:54:43.349342'),
(542, 1, '1', '2020-05-05 14:54:53.540786'),
(543, 1, '1', '2020-05-05 14:55:01.956883'),
(544, 1, '1', '2020-05-05 14:55:13.397478'),
(545, 1, '1', '2020-05-05 14:55:23.373649'),
(546, 1, '1', '2020-05-05 14:55:36.572671'),
(547, 1, '1', '2020-05-05 14:55:52.580172'),
(548, 1, '1', '2020-05-05 14:56:08.695550'),
(549, 1, '1', '2020-05-05 14:56:24.779249'),
(550, 1, '1', '2020-05-05 14:56:40.719905'),
(551, 1, '1', '2020-05-05 14:56:54.761217'),
(552, 1, '1', '2020-05-05 14:57:10.949582'),
(553, 1, '1', '2020-05-05 14:57:29.984913'),
(554, 1, '1', '2020-05-05 14:57:46.009136'),
(555, 1, '1', '2020-05-05 14:57:58.092616'),
(556, 1, '1', '2020-05-05 14:58:08.392594'),
(557, 1, '1', '2020-05-05 14:58:18.441832'),
(558, 1, '1', '2020-05-05 14:58:28.298786'),
(559, 1, '1', '2020-05-05 14:58:38.283620'),
(560, 1, '1', '2020-05-05 14:58:48.350115'),
(561, 1, '1', '2020-05-05 14:58:58.305832'),
(562, 1, '1', '2020-05-05 14:59:10.449518'),
(563, 1, '1', '2020-05-05 14:59:22.504383'),
(564, 1, '1', '2020-05-05 14:59:32.548855'),
(565, 1, '1', '2020-05-05 14:59:45.090300'),
(566, 1, '1', '2020-05-05 14:59:54.656555'),
(567, 1, '1', '2020-05-05 15:00:04.694618'),
(568, 1, '1', '2020-05-05 15:00:14.806454'),
(569, 1, '1', '2020-05-05 15:00:22.719279'),
(570, 1, '1', '2020-05-05 15:00:32.802532'),
(571, 1, '1', '2020-05-05 15:00:46.859541'),
(572, 1, '1', '2020-05-05 15:00:53.896511'),
(573, 1, '1', '2020-05-05 15:01:04.912790'),
(574, 1, '1', '2020-05-05 15:01:15.096493'),
(575, 1, '1', '2020-05-05 15:01:27.024795'),
(576, 1, '1', '2020-05-05 15:01:39.441835'),
(577, 1, '1', '2020-05-05 15:01:51.170597'),
(578, 1, '1', '2020-05-05 15:01:59.098376'),
(579, 1, '1', '2020-05-05 15:02:13.273217'),
(580, 1, '1', '2020-05-05 15:02:25.423599'),
(581, 1, '1', '2020-05-05 15:02:39.355599'),
(582, 1, '1', '2020-05-05 15:02:53.647912'),
(583, 1, '1', '2020-05-05 15:03:07.496793'),
(584, 1, '1', '2020-05-05 15:03:18.528604'),
(585, 1, '1', '2020-05-05 15:03:30.522084'),
(586, 1, '1', '2020-05-05 15:03:42.671912'),
(587, 1, '1', '2020-05-05 15:03:56.626844'),
(588, 1, '1', '2020-05-05 15:04:06.912963'),
(589, 1, '1', '2020-05-05 15:04:16.978431'),
(590, 1, '1', '2020-05-05 15:04:30.837086'),
(591, 1, '1', '2020-05-05 15:04:42.875709'),
(592, 1, '1', '2020-05-05 15:04:55.139059'),
(593, 1, '1', '2020-05-05 15:05:06.941534'),
(594, 1, '1', '2020-05-05 15:05:19.091264'),
(595, 1, '1', '2020-05-05 15:05:33.273438'),
(596, 1, '1', '2020-05-05 15:05:45.390326'),
(597, 1, '1', '2020-05-05 15:05:55.598037'),
(598, 1, '1', '2020-05-05 15:06:07.926095'),
(599, 1, '1', '2020-05-05 15:06:21.097731'),
(600, 1, '1', '2020-05-05 15:06:34.175085'),
(601, 1, '1', '2020-05-05 15:06:48.437999'),
(602, 1, '1', '2020-05-05 15:07:01.761463'),
(603, 1, '1', '2020-05-05 15:07:15.919915'),
(604, 1, '1', '2020-05-05 15:07:30.227793'),
(605, 1, '1', '2020-05-05 15:07:40.290826'),
(606, 1, '1', '2020-05-05 15:07:50.573643'),
(607, 1, '1', '2020-05-05 15:08:02.632264'),
(608, 1, '1', '2020-05-05 15:08:17.076336'),
(609, 1, '1', '2020-05-05 15:08:33.149588'),
(610, 1, '1', '2020-05-05 15:08:43.991076'),
(611, 1, '1', '2020-05-05 15:08:55.440857'),
(612, 1, '1', '2020-05-05 15:09:09.723588'),
(613, 1, '1', '2020-05-05 15:09:21.939156'),
(614, 1, '1', '2020-05-05 15:09:32.164055'),
(615, 1, '1', '2020-05-05 15:09:46.296811'),
(616, 1, '1', '2020-05-05 15:09:59.437931'),
(617, 1, '1', '2020-05-05 15:10:08.896133'),
(618, 1, '1', '2020-05-05 15:10:22.037363'),
(619, 1, '1', '2020-05-05 15:10:32.437736'),
(620, 1, '1', '2020-05-05 15:10:44.519844'),
(621, 1, '1', '2020-05-05 15:10:55.702959'),
(622, 1, '1', '2020-05-05 15:11:07.811841'),
(623, 1, '1', '2020-05-05 15:11:19.935626'),
(624, 1, '1', '2020-05-05 15:11:34.952318'),
(625, 1, '1', '2020-05-05 15:11:46.342409'),
(626, 1, '1', '2020-05-05 15:11:58.485245'),
(627, 1, '1', '2020-05-05 15:12:12.842214'),
(628, 1, '1', '2020-05-05 15:12:27.082372'),
(629, 1, '1', '2020-05-05 15:12:36.190076'),
(630, 1, '1', '2020-05-05 15:12:46.331429'),
(631, 1, '1', '2020-05-05 15:12:57.491755'),
(632, 1, '1', '2020-05-05 15:13:08.607568'),
(633, 1, '1', '2020-05-05 15:13:13.898975'),
(634, 1, '1', '2020-05-05 15:13:24.849836'),
(635, 1, '1', '2020-05-05 15:13:37.046961'),
(636, 1, '1', '2020-05-05 15:13:48.245483'),
(637, 1, '1', '2020-05-05 15:14:00.952947'),
(638, 1, '1', '2020-05-05 15:14:11.636942'),
(639, 1, '1', '2020-05-05 15:14:25.927551'),
(640, 1, '1', '2020-05-05 15:14:38.143918'),
(641, 1, '1', '2020-05-05 15:14:46.251853'),
(642, 1, '1', '2020-05-05 15:14:54.347369'),
(643, 1, '1', '2020-05-05 15:15:04.533669'),
(644, 1, '1', '2020-05-05 15:15:12.567882'),
(645, 1, '1', '2020-05-05 15:15:20.758741'),
(646, 1, '1', '2020-05-05 15:15:29.935088'),
(647, 1, '1', '2020-05-05 15:15:40.083661'),
(648, 1, '1', '2020-05-05 15:15:48.224331'),
(649, 1, '1', '2020-05-05 15:15:58.465857'),
(650, 1, '1', '2020-05-05 15:16:06.498138'),
(651, 1, '1', '2020-05-05 15:16:14.731231'),
(652, 1, '1', '2020-05-05 15:16:24.906498'),
(653, 1, '1', '2020-05-05 15:16:33.030582'),
(654, 1, '1', '2020-05-05 15:16:45.206124'),
(655, 1, '1', '2020-05-05 15:16:59.418882'),
(656, 1, '1', '2020-05-05 15:17:11.662882'),
(657, 1, '1', '2020-05-05 15:17:25.828383'),
(658, 1, '1', '2020-05-05 15:17:40.028496'),
(659, 1, '1', '2020-05-05 15:17:52.261556'),
(660, 1, '1', '2020-05-05 15:18:03.452069'),
(661, 1, '1', '2020-05-05 15:18:11.876892'),
(662, 1, '1', '2020-05-05 15:18:22.701526'),
(663, 1, '1', '2020-05-05 15:18:30.743538'),
(664, 1, '1', '2020-05-05 15:18:42.975894'),
(665, 1, '1', '2020-05-05 15:18:57.256876'),
(666, 1, '1', '2020-05-05 15:19:09.733186'),
(667, 1, '1', '2020-05-05 15:19:18.540957'),
(668, 1, '1', '2020-05-05 15:19:30.765186'),
(669, 1, '1', '2020-05-05 15:19:40.974150'),
(670, 1, '1', '2020-05-05 15:19:53.645492'),
(671, 1, '1', '2020-05-05 15:20:03.613786'),
(672, 1, '1', '2020-05-05 15:20:15.564982'),
(673, 1, '1', '2020-05-05 15:20:27.739714'),
(674, 1, '1', '2020-05-05 15:20:35.738895'),
(675, 1, '1', '2020-05-05 15:20:38.947376'),
(676, 1, '1', '2020-05-05 15:20:50.061754'),
(677, 1, '1', '2020-05-05 15:21:02.609259'),
(678, 1, '1', '2020-05-05 15:21:14.496240'),
(679, 1, '1', '2020-05-05 15:21:22.571395'),
(680, 1, '1', '2020-05-05 15:21:30.702112'),
(681, 1, '1', '2020-05-05 15:21:43.020749'),
(682, 1, '1', '2020-05-05 15:21:54.608278'),
(683, 1, '1', '2020-05-05 15:22:06.500906'),
(684, 1, '1', '2020-05-05 15:22:12.293163'),
(685, 1, '1', '2020-05-05 15:22:22.525682'),
(686, 1, '1', '2020-05-05 15:22:31.749733'),
(687, 1, '1', '2020-05-05 15:22:42.922776'),
(688, 1, '1', '2020-05-05 15:22:53.027088'),
(689, 1, '1', '2020-05-05 15:23:01.799511'),
(690, 1, '1', '2020-05-05 15:23:11.260517'),
(691, 1, '1', '2020-05-05 15:23:26.852662'),
(692, 1, '1', '2020-05-05 15:23:37.909414'),
(693, 1, '1', '2020-05-05 15:23:46.867149'),
(694, 1, '1', '2020-05-05 15:23:55.083887'),
(695, 1, '1', '2020-05-05 15:24:09.213539'),
(696, 1, '1', '2020-05-05 15:24:18.316756'),
(697, 1, '1', '2020-05-05 15:24:26.445852'),
(698, 1, '1', '2020-05-05 15:24:34.878450'),
(699, 1, '1', '2020-05-05 15:24:46.974657'),
(700, 1, '1', '2020-05-05 15:24:56.877948'),
(701, 1, '1', '2020-05-05 15:24:58.957418'),
(702, 1, '1', '2020-05-05 15:25:03.960701'),
(703, 1, '1', '2020-05-05 15:25:13.151665'),
(704, 1, '1', '2020-05-05 15:25:19.168236'),
(705, 1, '1', '2020-05-05 15:25:25.276733'),
(706, 1, '1', '2020-05-05 15:25:35.406534'),
(707, 1, '1', '2020-05-05 15:25:43.409000'),
(708, 1, '1', '2020-05-05 15:25:54.891943'),
(709, 1, '1', '2020-05-05 15:26:02.849870'),
(710, 1, '1', '2020-05-05 15:26:10.890978'),
(711, 1, '1', '2020-05-05 15:26:21.074810'),
(712, 1, '1', '2020-05-05 15:26:29.165870'),
(713, 1, '1', '2020-05-05 15:26:42.137304'),
(714, 1, '1', '2020-05-05 15:26:53.448151'),
(715, 1, '1', '2020-05-05 15:27:02.806739'),
(716, 1, '1', '2020-05-05 15:27:09.739461'),
(717, 1, '1', '2020-05-05 15:27:17.880461'),
(718, 1, '1', '2020-05-05 15:27:24.080237'),
(719, 1, '1', '2020-05-05 15:27:30.171684'),
(720, 1, '1', '2020-05-05 15:27:36.086489'),
(721, 1, '1', '2020-05-05 15:27:45.237526'),
(722, 1, '1', '2020-05-05 15:27:51.603806'),
(723, 1, '1', '2020-05-05 15:27:57.412948'),
(724, 1, '1', '2020-05-05 15:28:03.487080'),
(725, 1, '1', '2020-05-05 15:28:04.628475'),
(726, 1, '1', '2020-05-05 15:28:06.695632'),
(727, 1, '1', '2020-05-05 15:28:10.928659'),
(728, 1, '1', '2020-05-05 15:28:15.311796'),
(729, 1, '1', '2020-05-05 15:28:20.219638'),
(730, 1, '1', '2020-05-05 15:28:24.125284'),
(731, 1, '1', '2020-05-05 15:28:25.969912'),
(732, 1, '1', '2020-05-05 15:28:27.970324'),
(733, 1, '1', '2020-05-05 15:28:30.114353'),
(734, 1, '1', '2020-05-05 15:28:32.310092'),
(735, 1, '1', '2020-05-05 15:28:35.960624'),
(736, 1, '1', '2020-05-05 15:28:37.102415'),
(737, 1, '1', '2020-05-05 15:28:39.219878'),
(738, 1, '1', '2020-05-05 15:28:43.749691'),
(739, 1, '1', '2020-05-05 15:28:46.184509'),
(740, 1, '1', '2020-05-05 15:28:55.368688'),
(741, 1, '1', '2020-05-05 15:28:56.384723'),
(742, 1, '1', '2020-05-05 15:29:03.584791'),
(743, 1, '1', '2020-05-05 15:29:04.568202'),
(744, 1, '1', '2020-05-05 15:29:11.684744'),
(745, 1, '1', '2020-05-05 15:29:12.651345'),
(746, 1, '1', '2020-05-05 15:29:14.633966'),
(747, 1, '1', '2020-05-05 15:29:16.767968'),
(748, 1, '1', '2020-05-05 15:29:21.026244'),
(749, 1, '1', '2020-05-05 15:29:24.925832'),
(750, 1, '1', '2020-05-05 15:29:29.024565'),
(751, 1, '1', '2020-05-05 15:29:33.033884'),
(752, 1, '1', '2020-05-05 15:29:35.159323'),
(753, 1, '1', '2020-05-05 15:29:37.974941'),
(754, 1, '1', '2020-05-05 15:29:39.176789'),
(755, 1, '1', '2020-05-05 15:29:41.051429'),
(756, 1, '1', '2020-05-05 15:29:48.215751'),
(757, 1, '1', '2020-05-05 15:29:49.310100'),
(758, 1, '1', '2020-05-05 15:29:56.290901'),
(759, 1, '1', '2020-05-05 15:29:57.342636'),
(760, 1, '1', '2020-05-05 15:30:01.426742'),
(761, 1, '1', '2020-05-05 15:30:10.617137'),
(762, 1, '1', '2020-05-05 15:30:12.132162'),
(763, 1, '1', '2020-05-05 15:30:19.582179'),
(764, 1, '1', '2020-05-05 15:30:20.817187'),
(765, 1, '1', '2020-05-05 15:30:22.759003'),
(766, 1, '1', '2020-05-05 15:30:24.914604'),
(767, 1, '1', '2020-05-05 15:30:29.005665'),
(768, 1, '1', '2020-05-05 15:30:37.959201'),
(769, 1, '1', '2020-05-05 15:30:39.120276'),
(770, 1, '1', '2020-05-05 15:30:41.031752'),
(771, 1, '1', '2020-05-05 15:30:48.058354'),
(772, 1, '1', '2020-05-05 15:30:49.125501'),
(773, 1, '1', '2020-05-05 15:30:56.221791'),
(774, 1, '1', '2020-05-05 15:30:57.238222'),
(775, 1, '1', '2020-05-05 15:30:59.271908'),
(776, 1, '1', '2020-05-05 15:31:03.287847'),
(777, 1, '1', '2020-05-05 15:31:07.516726'),
(778, 1, '1', '2020-05-05 15:31:11.624859'),
(779, 1, '1', '2020-05-05 15:31:15.562322'),
(780, 1, '1', '2020-05-05 15:31:17.730002'),
(781, 1, '1', '2020-05-05 15:31:19.622939'),
(782, 1, '1', '2020-05-05 15:31:21.637583'),
(783, 1, '1', '2020-05-05 15:31:28.650002'),
(784, 1, '1', '2020-05-05 15:31:29.891033'),
(785, 1, '1', '2020-05-05 15:31:36.828107'),
(786, 1, '1', '2020-05-05 15:31:38.904963'),
(787, 1, '1', '2020-05-05 15:31:42.907097'),
(788, 1, '1', '2020-05-05 15:31:47.149369'),
(789, 1, '1', '2020-05-05 15:31:49.033829'),
(790, 1, '1', '2020-05-05 15:31:51.161244'),
(791, 1, '1', '2020-05-05 15:31:58.485441'),
(792, 1, '1', '2020-05-05 15:31:59.224053'),
(793, 1, '1', '2020-05-05 15:32:01.261427'),
(794, 1, '1', '2020-05-05 15:32:03.394467'),
(795, 1, '1', '2020-05-05 15:32:05.469018'),
(796, 1, '1', '2020-05-05 15:32:07.468666'),
(797, 1, '1', '2020-05-05 15:32:11.460298'),
(798, 1, '1', '2020-05-05 15:32:15.626639'),
(799, 1, '1', '2020-05-05 15:32:20.119414'),
(800, 1, '1', '2020-05-05 15:32:23.848298'),
(801, 1, '1', '2020-05-05 15:32:25.843187'),
(802, 1, '1', '2020-05-05 15:32:27.973011'),
(803, 1, '1', '2020-05-05 15:32:30.856465'),
(804, 1, '1', '2020-05-05 15:32:33.293175'),
(805, 1, '1', '2020-05-05 15:32:34.834789'),
(806, 1, '1', '2020-05-05 15:32:41.916373'),
(807, 1, '1', '2020-05-05 15:32:43.026214'),
(808, 1, '1', '2020-05-05 15:32:46.972295'),
(809, 1, '1', '2020-05-05 15:32:51.075837'),
(810, 1, '1', '2020-05-05 15:32:55.242136'),
(811, 1, '1', '2020-05-05 15:32:59.225124'),
(812, 1, '1', '2020-05-05 15:33:01.358213'),
(813, 1, '1', '2020-05-05 15:33:08.483515'),
(814, 1, '1', '2020-05-05 15:33:11.333012'),
(815, 1, '1', '2020-05-05 15:33:13.482739'),
(816, 1, '1', '2020-05-05 15:33:15.414489'),
(817, 1, '1', '2020-05-05 15:33:17.458112'),
(818, 1, '1', '2020-05-05 15:33:19.824391'),
(819, 1, '1', '2020-05-05 15:33:23.707665'),
(820, 1, '1', '2020-05-05 15:33:27.640318'),
(821, 1, '1', '2020-05-05 15:33:31.982232'),
(822, 1, '1', '2020-05-05 15:33:35.689910'),
(823, 1, '1', '2020-05-05 15:33:37.874309'),
(824, 1, '1', '2020-05-05 15:33:39.774606'),
(825, 1, '1', '2020-05-05 15:33:41.738864'),
(826, 1, '1', '2020-05-05 15:33:43.782285'),
(827, 1, '1', '2020-05-05 15:33:45.856113'),
(828, 1, '1', '2020-05-05 15:33:47.840650'),
(829, 1, '1', '2020-05-05 15:33:50.000239'),
(830, 1, '1', '2020-05-05 15:33:56.964485'),
(831, 1, '1', '2020-05-05 15:33:59.056437'),
(832, 1, '1', '2020-05-05 15:34:03.039817'),
(833, 1, '1', '2020-05-05 15:34:07.248254'),
(834, 1, '1', '2020-05-05 15:34:09.331467'),
(835, 1, '1', '2020-05-05 15:34:11.381169'),
(836, 1, '1', '2020-05-05 15:34:13.355601'),
(837, 1, '1', '2020-05-05 15:34:15.514208'),
(838, 1, '1', '2020-05-05 15:34:17.880670'),
(839, 1, '1', '2020-05-05 15:34:19.614401'),
(840, 1, '1', '2020-05-05 15:34:22.621770'),
(841, 1, '1', '2020-05-05 15:34:24.445647'),
(842, 1, '1', '2020-05-05 15:34:26.497600'),
(843, 1, '1', '2020-05-05 15:34:30.804953'),
(844, 1, '1', '2020-05-05 15:34:36.912936'),
(845, 1, '1', '2020-05-05 15:34:39.729785'),
(846, 1, '1', '2020-05-05 15:34:43.795792'),
(847, 1, '1', '2020-05-05 15:34:45.980510'),
(848, 1, '1', '2020-05-05 15:34:47.862820'),
(849, 1, '1', '2020-05-05 15:34:49.895829'),
(850, 1, '1', '2020-05-05 15:34:51.879020'),
(851, 1, '1', '2020-05-05 15:34:54.037303'),
(852, 1, '1', '2020-05-05 15:34:56.037576'),
(853, 1, '1', '2020-05-05 15:34:58.070942'),
(854, 1, '1', '2020-05-05 15:35:00.053900'),
(855, 1, '1', '2020-05-05 15:35:02.079332'),
(856, 1, '1', '2020-05-05 15:35:04.070209'),
(857, 1, '1', '2020-05-05 15:35:08.253946'),
(858, 1, '1', '2020-05-05 15:35:14.361488'),
(859, 1, '1', '2020-05-05 15:35:20.378064'),
(860, 1, '1', '2020-05-05 15:35:24.378586'),
(861, 1, '1', '2020-05-05 15:35:26.536019'),
(862, 1, '1', '2020-05-05 15:35:28.512369'),
(863, 1, '1', '2020-05-05 15:35:30.528093'),
(864, 1, '1', '2020-05-05 15:35:32.562653'),
(865, 1, '1', '2020-05-05 15:35:34.694799'),
(866, 1, '1', '2020-05-05 15:35:36.761095'),
(867, 1, '1', '2020-05-05 15:35:43.720163'),
(868, 1, '1', '2020-05-05 15:35:46.836431'),
(869, 1, '1', '2020-05-05 15:35:50.941128'),
(870, 1, '1', '2020-05-05 15:35:54.852706'),
(871, 1, '1', '2020-05-05 15:35:58.969446'),
(872, 1, '1', '2020-05-05 15:36:01.111236'),
(873, 1, '1', '2020-05-05 15:36:08.119696'),
(874, 1, '1', '2020-05-05 15:36:09.168488'),
(875, 1, '1', '2020-05-05 15:36:11.393858'),
(876, 1, '1', '2020-05-05 15:36:18.519187'),
(877, 1, '1', '2020-05-05 15:36:22.369344'),
(878, 1, '1', '2020-05-05 15:36:24.436068'),
(879, 1, '1', '2020-05-05 15:36:26.469235'),
(880, 1, '1', '2020-05-05 15:36:28.467695'),
(881, 1, '1', '2020-05-05 15:36:30.559389'),
(882, 1, '1', '2020-05-05 15:36:32.660842'),
(883, 1, '1', '2020-05-05 15:36:34.690267'),
(884, 1, '1', '2020-05-05 15:36:41.791622'),
(885, 1, '1', '2020-05-05 15:36:45.641386'),
(886, 1, '1', '2020-05-05 15:36:49.741417'),
(887, 1, '1', '2020-05-05 15:36:53.222343'),
(888, 1, '1', '2020-05-05 15:36:54.811742'),
(889, 1, '1', '2020-05-05 15:36:56.957207'),
(890, 1, '1', '2020-05-05 15:37:00.994413'),
(891, 1, '1', '2020-05-05 15:37:05.023989'),
(892, 1, '1', '2020-05-05 15:37:07.077690'),
(893, 1, '1', '2020-05-05 15:37:09.209215'),
(894, 1, '1', '2020-05-05 15:37:11.032642'),
(895, 1, '1', '2020-05-05 15:37:13.315540'),
(896, 1, '1', '2020-05-05 15:37:15.215537'),
(897, 1, '1', '2020-05-05 15:37:17.332196'),
(898, 1, '1', '2020-05-05 15:37:19.207034'),
(899, 1, '1', '2020-05-05 15:37:21.490112'),
(900, 1, '1', '2020-05-05 15:37:28.474335'),
(901, 1, '1', '2020-05-05 15:37:31.489391'),
(902, 1, '1', '2020-05-05 15:37:35.556352'),
(903, 1, '1', '2020-05-05 15:37:37.506014'),
(904, 1, '1', '2020-05-05 15:37:39.573662'),
(905, 1, '1', '2020-05-05 15:37:41.581937'),
(906, 1, '1', '2020-05-05 15:37:48.764546'),
(907, 1, '1', '2020-05-05 15:37:49.973122'),
(908, 1, '1', '2020-05-05 15:37:51.705904'),
(909, 1, '1', '2020-05-05 15:37:53.973356'),
(910, 1, '1', '2020-05-05 15:38:01.080341'),
(911, 1, '1', '2020-05-05 15:38:02.071447'),
(912, 1, '1', '2020-05-05 15:38:06.972993'),
(913, 1, '1', '2020-05-05 15:38:11.247687'),
(914, 1, '1', '2020-05-05 15:38:13.031066'),
(915, 1, '1', '2020-05-05 15:38:15.297533'),
(916, 1, '1', '2020-05-05 15:38:17.165168'),
(917, 1, '1', '2020-05-05 15:38:19.173934'),
(918, 1, '1', '2020-05-05 15:38:21.196304'),
(919, 1, '1', '2020-05-05 15:38:23.264773'),
(920, 1, '1', '2020-05-05 15:38:25.304229'),
(921, 1, '1', '2020-05-05 15:38:28.964609'),
(922, 1, '1', '2020-05-05 15:38:30.373109'),
(923, 1, '1', '2020-05-05 15:38:34.495603'),
(924, 1, '1', '2020-05-05 15:38:38.562078'),
(925, 1, '1', '2020-05-05 15:38:42.486431'),
(926, 1, '1', '2020-05-05 15:38:46.603345'),
(927, 1, '1', '2020-05-05 15:38:48.828430'),
(928, 1, '1', '2020-05-05 15:38:55.731376'),
(929, 1, '1', '2020-05-05 15:38:58.923281'),
(930, 1, '1', '2020-05-05 15:39:02.863822'),
(931, 1, '1', '2020-05-05 15:39:04.972887'),
(932, 1, '1', '2020-05-05 15:39:11.969175'),
(933, 1, '1', '2020-05-05 15:39:13.088710'),
(934, 1, '1', '2020-05-05 15:39:15.072668'),
(935, 1, '1', '2020-05-05 15:39:22.122329'),
(936, 1, '1', '2020-05-05 15:39:25.242919'),
(937, 1, '1', '2020-05-05 15:39:29.279993'),
(938, 1, '1', '2020-05-05 15:39:31.355215'),
(939, 1, '1', '2020-05-05 15:39:38.342711'),
(940, 1, '1', '2020-05-05 15:39:39.438448'),
(941, 1, '1', '2020-05-05 15:39:41.592159'),
(942, 1, '1', '2020-05-05 15:39:48.608298'),
(943, 1, '1', '2020-05-05 15:39:49.593194'),
(944, 1, '1', '2020-05-05 15:39:51.583900'),
(945, 1, '1', '2020-05-05 15:39:58.591813'),
(946, 1, '1', '2020-05-05 15:39:59.758755'),
(947, 1, '1', '2020-05-05 15:40:01.867216'),
(948, 1, '1', '2020-05-05 15:40:08.782631'),
(949, 1, '1', '2020-05-05 15:40:12.891451'),
(950, 1, '1', '2020-05-05 15:40:16.954518'),
(951, 1, '1', '2020-05-05 15:40:20.928814'),
(952, 1, '1', '2020-05-05 15:40:23.022246'),
(953, 1, '1', '2020-05-05 15:40:25.165717'),
(954, 1, '1', '2020-05-05 15:40:27.043375'),
(955, 1, '1', '2020-05-05 15:40:29.146369'),
(956, 1, '1', '2020-05-05 15:40:31.157689'),
(957, 1, '1', '2020-05-05 15:40:38.190734'),
(958, 1, '1', '2020-05-05 15:40:39.212356'),
(959, 1, '1', '2020-05-05 15:40:41.287482'),
(960, 1, '1', '2020-05-05 15:40:45.354320'),
(961, 1, '1', '2020-05-05 15:40:49.381804'),
(962, 1, '1', '2020-05-05 15:40:53.522725'),
(963, 1, '1', '2020-05-05 15:40:57.456239'),
(964, 1, '1', '2020-05-05 15:40:59.570326'),
(965, 1, '1', '2020-05-05 15:41:01.556747'),
(966, 1, '1', '2020-05-05 15:41:08.731562'),
(967, 1, '1', '2020-05-05 15:41:09.656169'),
(968, 1, '1', '2020-05-05 15:41:11.748044'),
(969, 1, '1', '2020-05-05 15:41:18.958975'),
(970, 1, '1', '2020-05-05 15:41:20.738898'),
(971, 1, '1', '2020-05-05 15:41:26.240680'),
(972, 1, '1', '2020-05-05 15:41:29.912753'),
(973, 1, '1', '2020-05-05 15:41:31.922271'),
(974, 1, '1', '2020-05-05 15:41:33.952216'),
(975, 1, '1', '2020-05-05 15:41:35.970571'),
(976, 1, '1', '2020-05-05 15:41:37.955309'),
(977, 1, '1', '2020-05-05 15:41:40.130096'),
(978, 1, '1', '2020-05-05 15:41:42.129461'),
(979, 1, '1', '2020-05-05 15:41:44.046190'),
(980, 1, '1', '2020-05-05 15:41:46.223137'),
(981, 1, '1', '2020-05-05 15:41:50.679084'),
(982, 1, '1', '2020-05-05 15:41:53.245811'),
(983, 1, '1', '2020-05-05 15:41:58.070993'),
(984, 1, '1', '2020-05-05 15:42:02.411726'),
(985, 1, '1', '2020-05-05 15:42:04.461797'),
(986, 1, '1', '2020-05-05 15:42:06.635732'),
(987, 1, '1', '2020-05-05 15:42:10.537587'),
(988, 1, '1', '2020-05-05 15:42:14.695799'),
(989, 1, '1', '2020-05-05 15:42:18.095104'),
(990, 1, '1', '2020-05-05 15:42:19.728677'),
(991, 1, '1', '2020-05-05 15:42:21.711509'),
(992, 1, '1', '2020-05-05 15:42:23.677895'),
(993, 1, '1', '2020-05-05 15:42:26.544597'),
(994, 1, '1', '2020-05-05 15:42:27.931901'),
(995, 1, '1', '2020-05-05 15:42:29.861171'),
(996, 1, '1', '2020-05-05 15:42:31.828540'),
(997, 1, '1', '2020-05-05 15:42:33.852572'),
(998, 1, '1', '2020-05-05 15:42:37.152006'),
(999, 1, '1', '2020-05-05 15:42:40.994181'),
(1000, 1, '1', '2020-05-05 15:42:45.177092'),
(1001, 1, '1', '2020-05-05 15:42:47.510669'),
(1002, 1, '1', '2020-05-05 15:42:50.110073'),
(1003, 1, '1', '2020-05-05 15:42:52.101458'),
(1004, 1, '1', '2020-05-05 15:42:54.268548'),
(1005, 1, '1', '2020-05-05 15:42:58.601216'),
(1006, 1, '1', '2020-05-05 15:43:02.310517'),
(1007, 1, '1', '2020-05-05 15:43:04.544022'),
(1008, 1, '1', '2020-05-05 15:43:07.076041'),
(1009, 1, '1', '2020-05-05 15:43:08.726862'),
(1010, 1, '1', '2020-05-05 15:43:12.551217'),
(1011, 1, '1', '2020-05-05 15:43:16.584903'),
(1012, 1, '1', '2020-05-05 15:43:20.984420'),
(1013, 1, '1', '2020-05-05 15:43:24.917074'),
(1014, 1, '1', '2020-05-05 15:43:26.825483'),
(1015, 1, '1', '2020-05-05 15:43:28.716825'),
(1016, 1, '1', '2020-05-05 15:43:31.019511'),
(1017, 1, '1', '2020-05-05 15:43:32.825666'),
(1018, 1, '1', '2020-05-05 15:43:34.933404'),
(1019, 1, '1', '2020-05-05 15:43:38.067017'),
(1020, 1, '1', '2020-05-05 15:43:42.025618'),
(1021, 1, '1', '2020-05-05 15:43:46.050817'),
(1022, 1, '1', '2020-05-05 15:43:50.058923'),
(1023, 1, '1', '2020-05-05 15:43:54.166228'),
(1024, 1, '1', '2020-05-05 15:43:56.266533'),
(1025, 1, '1', '2020-05-05 15:43:58.316194'),
(1026, 1, '1', '2020-05-05 15:44:00.323720'),
(1027, 1, '1', '2020-05-05 15:44:02.308272'),
(1028, 1, '1', '2020-05-05 15:44:04.488544'),
(1029, 1, '1', '2020-05-05 15:44:06.523807'),
(1030, 1, '1', '2020-05-05 15:44:08.548961'),
(1031, 1, '1', '2020-05-05 15:44:10.941600'),
(1032, 1, '1', '2020-05-05 15:44:12.408764'),
(1033, 1, '1', '2020-05-05 15:44:14.915102'),
(1034, 1, '1', '2020-05-05 15:44:18.609119'),
(1035, 1, '1', '2020-05-05 15:44:22.616224'),
(1036, 1, '1', '2020-05-05 15:44:26.666373'),
(1037, 1, '1', '2020-05-05 15:44:30.790191'),
(1038, 1, '1', '2020-05-05 15:44:32.873364'),
(1039, 1, '1', '2020-05-05 15:44:34.874923'),
(1040, 1, '1', '2020-05-05 15:44:41.898874'),
(1041, 1, '1', '2020-05-05 15:44:43.024490'),
(1042, 1, '1', '2020-05-05 15:44:45.072147'),
(1043, 1, '1', '2020-05-05 15:44:52.039022'),
(1044, 1, '1', '2020-05-05 15:44:54.421029'),
(1045, 1, '1', '2020-05-05 15:44:58.355074'),
(1046, 1, '1', '2020-05-05 15:45:02.540901'),
(1047, 1, '1', '2020-05-05 15:45:04.508938'),
(1048, 1, '1', '2020-05-05 15:45:06.375472'),
(1049, 1, '1', '2020-05-05 15:45:08.500065'),
(1050, 1, '1', '2020-05-05 15:45:11.022077'),
(1051, 1, '1', '2020-05-05 15:45:12.425479'),
(1052, 1, '1', '2020-05-05 15:45:14.858039'),
(1053, 1, '1', '2020-05-05 15:45:18.172031'),
(1054, 1, '1', '2020-05-05 15:45:19.571801'),
(1055, 1, '1', '2020-05-05 15:45:26.587874'),
(1056, 1, '1', '2020-05-05 15:45:27.754861'),
(1057, 1, '1', '2020-05-05 15:45:31.671246'),
(1058, 1, '1', '2020-05-05 15:45:35.962888'),
(1059, 1, '1', '2020-05-05 15:45:37.879538'),
(1060, 1, '1', '2020-05-05 15:45:39.970763'),
(1061, 1, '1', '2020-05-05 15:45:42.995202'),
(1062, 1, '1', '2020-05-05 15:45:45.037738'),
(1063, 1, '1', '2020-05-05 15:45:46.953099'),
(1064, 1, '1', '2020-05-05 15:45:49.003316'),
(1065, 1, '1', '2020-05-05 15:45:51.011063'),
(1066, 1, '1', '2020-05-05 15:45:53.078660'),
(1067, 1, '1', '2020-05-05 15:45:55.262004'),
(1068, 1, '1', '2020-05-05 15:45:59.198992'),
(1069, 1, '1', '2020-05-05 15:46:03.219299'),
(1070, 1, '1', '2020-05-05 15:46:07.290973'),
(1071, 1, '1', '2020-05-05 15:46:11.977703'),
(1072, 1, '1', '2020-05-05 15:46:13.443798'),
(1073, 1, '1', '2020-05-05 15:46:15.851701'),
(1074, 1, '1', '2020-05-05 15:46:17.485615'),
(1075, 1, '1', '2020-05-05 15:46:19.535581'),
(1076, 1, '1', '2020-05-05 15:46:21.593244'),
(1077, 1, '1', '2020-05-05 15:46:28.607259'),
(1078, 1, '1', '2020-05-05 15:46:29.634908'),
(1079, 1, '1', '2020-05-05 15:46:31.665342'),
(1080, 1, '1', '2020-05-05 15:46:35.781513'),
(1081, 1, '1', '2020-05-05 15:46:39.801933'),
(1082, 1, '1', '2020-05-05 15:46:43.873398'),
(1083, 1, '1', '2020-05-05 15:46:47.909271'),
(1084, 1, '1', '2020-05-05 15:46:50.577431'),
(1085, 1, '1', '2020-05-05 15:46:57.389940'),
(1086, 1, '1', '2020-05-05 15:46:58.233767'),
(1087, 1, '1', '2020-05-05 15:47:00.117506'),
(1088, 1, '1', '2020-05-05 15:47:07.308460'),
(1089, 1, '1', '2020-05-05 15:47:11.464846'),
(1090, 1, '1', '2020-05-05 15:47:15.442117'),
(1091, 1, '1', '2020-05-05 15:47:19.424862'),
(1092, 1, '1', '2020-05-05 15:47:21.516698'),
(1093, 1, '1', '2020-05-05 15:47:23.575406'),
(1094, 1, '1', '2020-05-05 15:47:25.474437'),
(1095, 1, '1', '2020-05-05 15:47:27.530782'),
(1096, 1, '1', '2020-05-05 15:47:29.641322'),
(1097, 1, '1', '2020-05-05 15:47:31.780986'),
(1098, 1, '1', '2020-05-05 15:47:38.782000'),
(1099, 1, '1', '2020-05-05 15:47:42.774232'),
(1100, 1, '1', '2020-05-05 15:47:50.315525'),
(1101, 1, '1', '2020-05-05 15:47:56.014461'),
(1102, 1, '1', '2020-05-05 15:48:02.305323'),
(1103, 1, '1', '2020-05-05 15:48:08.172627'),
(1104, 1, '1', '2020-05-05 15:48:12.248453'),
(1105, 1, '1', '2020-05-05 15:48:16.331306'),
(1106, 1, '1', '2020-05-05 15:48:20.431594'),
(1107, 1, '1', '2020-05-05 15:48:26.421522'),
(1108, 1, '1', '2020-05-05 15:48:32.437535'),
(1109, 1, '1', '2020-05-05 15:48:41.095380'),
(1110, 1, '1', '2020-05-05 15:48:48.712716'),
(1111, 1, '1', '2020-05-05 15:48:56.945829'),
(1112, 1, '1', '2020-05-05 15:49:02.871384'),
(1113, 1, '1', '2020-05-05 15:49:06.945652'),
(1114, 1, '1', '2020-05-05 15:49:13.136761'),
(1115, 1, '1', '2020-05-05 15:49:19.095198'),
(1116, 1, '1', '2020-05-05 15:49:25.411831'),
(1117, 1, '1', '2020-05-05 15:49:31.394577'),
(1118, 1, '1', '2020-05-05 15:49:39.621730'),
(1119, 1, '1', '2020-05-05 15:49:49.694243'),
(1120, 1, '1', '2020-05-05 15:49:57.751553'),
(1121, 1, '1', '2020-05-05 15:50:03.894618'),
(1122, 1, '1', '2020-05-05 15:50:12.033698'),
(1123, 1, '1', '2020-05-05 15:50:18.110411'),
(1124, 1, '1', '2020-05-05 15:50:28.260297'),
(1125, 1, '1', '2020-05-05 15:50:38.382895'),
(1126, 1, '1', '2020-05-05 15:50:46.484314'),
(1127, 1, '1', '2020-05-05 15:50:54.684294'),
(1128, 1, '1', '2020-05-05 15:51:00.784348'),
(1129, 1, '1', '2020-05-05 15:51:06.867513'),
(1130, 1, '1', '2020-05-05 15:51:14.033856'),
(1131, 1, '1', '2020-05-05 15:51:20.148837'),
(1132, 1, '1', '2020-05-05 15:51:28.209344'),
(1133, 1, '1', '2020-05-05 15:51:35.400365'),
(1134, 1, '1', '2020-05-05 15:51:41.489584'),
(1135, 1, '1', '2020-05-05 15:51:43.639397'),
(1136, 1, '1', '2020-05-05 15:51:45.607976'),
(1137, 1, '1', '2020-05-05 15:51:47.616552'),
(1138, 1, '1', '2020-05-05 15:51:53.010311'),
(1139, 1, '1', '2020-05-05 15:51:56.682682'),
(1140, 1, '1', '2020-05-05 15:51:58.763701'),
(1141, 1, '1', '2020-05-05 15:52:03.636675'),
(1142, 1, '1', '2020-05-05 15:52:06.816104'),
(1143, 1, '1', '2020-05-05 15:52:10.965491'),
(1144, 1, '1', '2020-05-05 15:52:14.910993'),
(1145, 1, '1', '2020-05-05 15:52:17.174610'),
(1146, 1, '1', '2020-05-05 15:52:19.021324'),
(1147, 1, '1', '2020-05-05 15:52:21.074148'),
(1148, 1, '1', '2020-05-05 15:52:23.016162'),
(1149, 1, '1', '2020-05-05 15:52:25.398405'),
(1150, 1, '1', '2020-05-05 15:52:28.154454'),
(1151, 1, '1', '2020-05-05 15:52:29.304619'),
(1152, 1, '1', '2020-05-05 15:52:31.195668'),
(1153, 1, '1', '2020-05-05 15:52:33.236775'),
(1154, 1, '1', '2020-05-05 15:52:35.287602'),
(1155, 1, '1', '2020-05-05 15:52:39.373700'),
(1156, 1, '1', '2020-05-05 15:52:43.420897'),
(1157, 1, '1', '2020-05-05 15:52:47.498917'),
(1158, 1, '1', '2020-05-05 15:52:51.570211'),
(1159, 1, '1', '2020-05-05 15:52:53.861730');
INSERT INTO `strata_sensor_data` (`id`, `sensor_id`, `sensor_value`, `created_date`) VALUES
(1160, 1, '1', '2020-05-05 15:52:56.166369'),
(1161, 1, '1', '2020-05-05 15:52:57.916146'),
(1162, 1, '1', '2020-05-05 15:53:05.870044'),
(1163, 1, '1', '2020-05-05 15:53:07.849086'),
(1164, 1, '1', '2020-05-05 15:53:09.816495'),
(1165, 1, '1', '2020-05-05 15:53:12.952261'),
(1166, 1, '1', '2020-05-05 15:53:18.027143'),
(1167, 1, '1', '2020-05-05 15:53:22.436209'),
(1168, 1, '1', '2020-05-05 15:53:26.176307'),
(1169, 1, '1', '2020-05-05 15:53:31.001868'),
(1170, 1, '1', '2020-05-05 15:53:32.268274'),
(1171, 1, '1', '2020-05-05 15:53:36.043621'),
(1172, 1, '1', '2020-05-05 15:53:37.284910'),
(1173, 1, '1', '2020-05-05 15:53:39.976189'),
(1174, 1, '1', '2020-05-05 15:53:42.317767'),
(1175, 1, '1', '2020-05-05 15:53:44.460081'),
(1176, 1, '1', '2020-05-05 15:53:47.042240'),
(1177, 1, '1', '2020-05-05 15:53:48.885135'),
(1178, 1, '1', '2020-05-05 15:53:50.759732'),
(1179, 1, '1', '2020-05-05 15:53:54.575866'),
(1180, 1, '1', '2020-05-05 15:53:58.583484'),
(1181, 1, '1', '2020-05-05 15:54:03.025423'),
(1182, 1, '1', '2020-05-05 15:54:06.808434'),
(1183, 1, '1', '2020-05-05 15:54:09.033887'),
(1184, 1, '1', '2020-05-05 15:54:11.034117'),
(1185, 1, '1', '2020-05-05 15:54:12.841981'),
(1186, 1, '1', '2020-05-05 15:54:15.099928'),
(1187, 1, '1', '2020-05-05 15:54:17.956500'),
(1188, 1, '1', '2020-05-05 15:54:19.915420'),
(1189, 1, '1', '2020-05-05 15:54:22.232749'),
(1190, 1, '1', '2020-05-05 15:54:24.308547'),
(1191, 1, '1', '2020-05-05 15:54:25.981623'),
(1192, 1, '1', '2020-05-05 15:54:30.109970'),
(1193, 1, '1', '2020-05-05 15:54:34.566167'),
(1194, 1, '1', '2020-05-05 15:54:38.207624'),
(1195, 1, '1', '2020-05-05 15:54:42.264028'),
(1196, 1, '1', '2020-05-05 15:54:45.157359'),
(1197, 1, '1', '2020-05-05 15:54:46.356014'),
(1198, 1, '1', '2020-05-05 15:54:48.524276'),
(1199, 1, '1', '2020-05-05 15:54:50.448888'),
(1200, 1, '1', '2020-05-05 15:54:52.506897'),
(1201, 1, '1', '2020-05-05 15:54:54.631623'),
(1202, 1, '1', '2020-05-05 15:54:56.581294'),
(1203, 1, '1', '2020-05-05 15:55:03.790268'),
(1204, 1, '1', '2020-05-05 15:55:08.397285'),
(1205, 1, '1', '2020-05-05 15:55:13.163734'),
(1206, 1, '1', '2020-05-05 15:55:15.781497'),
(1207, 1, '1', '2020-05-05 15:55:17.838528'),
(1208, 1, '1', '2020-05-05 15:55:19.872173'),
(1209, 1, '1', '2020-05-05 15:55:21.916317'),
(1210, 1, '1', '2020-05-05 15:55:23.967612'),
(1211, 1, '1', '2020-05-05 15:55:25.904690'),
(1212, 1, '1', '2020-05-05 15:55:28.013762'),
(1213, 1, '1', '2020-05-05 15:55:30.013593'),
(1214, 1, '1', '2020-05-05 15:55:37.038133'),
(1215, 1, '1', '2020-05-05 15:55:39.080318'),
(1216, 1, '1', '2020-05-05 15:55:43.138330'),
(1217, 1, '1', '2020-05-05 15:55:47.213039'),
(1218, 1, '1', '2020-05-05 15:55:49.188254'),
(1219, 1, '1', '2020-05-05 15:55:51.987910'),
(1220, 1, '1', '2020-05-05 15:55:53.329323'),
(1221, 1, '1', '2020-05-05 15:55:55.312530'),
(1222, 1, '1', '2020-05-05 15:55:59.453271'),
(1223, 1, '1', '2020-05-05 15:56:03.553812'),
(1224, 1, '1', '2020-05-05 15:56:07.579717'),
(1225, 1, '1', '2020-05-05 15:56:14.937776'),
(1226, 1, '1', '2020-05-05 15:56:22.120348'),
(1227, 1, '1', '2020-05-05 15:56:29.719985'),
(1228, 1, '1', '2020-05-05 15:56:35.803499'),
(1229, 1, '1', '2020-05-05 15:56:39.929058'),
(1230, 1, '1', '2020-05-05 15:56:46.001972'),
(1231, 1, '1', '2020-05-05 15:56:51.977898'),
(1232, 1, '1', '2020-05-05 15:56:58.078161'),
(1233, 1, '1', '2020-05-05 15:57:04.343951'),
(1234, 1, '1', '2020-05-05 15:57:10.276495'),
(1235, 1, '1', '2020-05-05 15:57:18.415772'),
(1236, 1, '1', '2020-05-05 15:57:28.531623'),
(1237, 1, '1', '2020-05-05 15:57:34.884189'),
(1238, 1, '1', '2020-05-05 15:57:38.733269'),
(1239, 1, '1', '2020-05-05 15:57:42.800338'),
(1240, 1, '1', '2020-05-05 15:57:47.376943'),
(1241, 1, '1', '2020-05-05 15:57:53.910063'),
(1242, 1, '1', '2020-05-05 15:58:04.799534'),
(1243, 1, '1', '2020-05-05 15:58:12.409164'),
(1244, 1, '1', '2020-05-05 15:58:18.384325'),
(1245, 1, '1', '2020-05-05 15:58:25.392875'),
(1246, 1, '1', '2020-05-05 15:58:29.492997'),
(1247, 1, '1', '2020-05-05 15:58:33.482274'),
(1248, 1, '1', '2020-05-05 15:58:39.650109'),
(1249, 1, '1', '2020-05-05 15:58:43.775079'),
(1250, 1, '1', '2020-05-05 15:58:50.044743'),
(1251, 1, '1', '2020-05-05 15:58:55.934168'),
(1252, 1, '1', '2020-05-05 15:59:04.230603'),
(1253, 1, '1', '2020-05-05 15:59:12.146405'),
(1254, 1, '1', '2020-05-05 15:59:18.396795'),
(1255, 1, '1', '2020-05-05 15:59:22.446603'),
(1256, 1, '1', '2020-05-05 15:59:28.395453'),
(1257, 1, '1', '2020-05-05 15:59:34.565961'),
(1258, 1, '1', '2020-05-05 15:59:40.674460'),
(1259, 1, '1', '2020-05-05 15:59:49.240586'),
(1260, 1, '1', '2020-05-05 15:59:54.894776'),
(1261, 1, '1', '2020-05-05 16:00:03.544173'),
(1262, 1, '1', '2020-05-05 16:00:08.110585'),
(1263, 1, '1', '2020-05-05 16:00:14.323876'),
(1264, 1, '1', '2020-05-05 16:00:20.373732'),
(1265, 1, '1', '2020-05-05 16:00:26.484962'),
(1266, 1, '1', '2020-05-05 16:00:32.476040'),
(1267, 1, '1', '2020-05-05 16:00:40.767200'),
(1268, 1, '1', '2020-05-05 16:00:50.809272'),
(1269, 1, '1', '2020-05-05 16:00:54.884711'),
(1270, 1, '1', '2020-05-05 16:00:58.842094'),
(1271, 1, '1', '2020-05-05 16:01:02.975679'),
(1272, 1, '1', '2020-05-05 16:01:07.319084'),
(1273, 1, '1', '2020-05-05 16:01:15.008207'),
(1274, 1, '1', '2020-05-05 16:01:22.299679'),
(1275, 1, '1', '2020-05-05 16:01:31.415570'),
(1276, 1, '1', '2020-05-05 16:01:37.532604'),
(1277, 1, '1', '2020-05-05 16:01:45.732365'),
(1278, 1, '1', '2020-05-05 16:01:51.773684'),
(1279, 1, '1', '2020-05-05 16:01:55.898081'),
(1280, 1, '1', '2020-05-05 16:01:59.873938'),
(1281, 1, '1', '2020-05-05 16:02:04.014248'),
(1282, 1, '1', '2020-05-05 16:02:10.072964'),
(1283, 1, '1', '2020-05-05 16:02:20.647194'),
(1284, 1, '1', '2020-05-05 16:02:26.430777'),
(1285, 1, '1', '2020-05-05 16:02:32.388166'),
(1286, 1, '1', '2020-05-05 16:02:36.806126'),
(1287, 1, '1', '2020-05-05 16:02:44.662694'),
(1288, 1, '1', '2020-05-05 16:02:52.737677'),
(1289, 1, '1', '2020-05-05 16:03:01.029399'),
(1290, 1, '1', '2020-05-05 16:03:07.053946'),
(1291, 1, '1', '2020-05-05 16:03:13.036939'),
(1292, 1, '1', '2020-05-05 16:03:19.153583'),
(1293, 1, '1', '2020-05-05 16:03:26.328535'),
(1294, 1, '1', '2020-05-05 16:03:30.353227'),
(1295, 1, '1', '2020-05-05 16:03:34.403406'),
(1296, 1, '1', '2020-05-05 16:03:40.428537'),
(1297, 1, '1', '2020-05-05 16:03:46.490907'),
(1298, 1, '1', '2020-05-05 16:03:54.635782'),
(1299, 1, '1', '2020-05-05 16:04:02.919064'),
(1300, 1, '1', '2020-05-05 16:04:11.023937'),
(1301, 1, '1', '2020-05-05 16:04:19.306984'),
(1302, 1, '1', '2020-05-05 16:04:23.018425'),
(1303, 1, '1', '2020-05-05 16:04:27.093671'),
(1304, 1, '1', '2020-05-05 16:04:31.268530'),
(1305, 1, '1', '2020-05-05 16:04:35.194033'),
(1306, 1, '1', '2020-05-05 16:04:39.834622'),
(1307, 1, '1', '2020-05-05 16:04:47.276563'),
(1308, 1, '1', '2020-05-05 16:04:53.318255'),
(1309, 1, '1', '2020-05-05 16:04:57.383446'),
(1310, 1, '1', '2020-05-05 16:05:01.433720'),
(1311, 1, '1', '2020-05-05 16:05:05.592037'),
(1312, 1, '1', '2020-05-05 16:05:13.650346'),
(1313, 1, '1', '2020-05-05 16:05:19.717531'),
(1314, 1, '1', '2020-05-05 16:05:23.731534'),
(1315, 1, '1', '2020-05-05 16:05:29.865162'),
(1316, 1, '1', '2020-05-05 16:05:37.933817'),
(1317, 1, '1', '2020-05-05 16:05:50.255862'),
(1318, 1, '1', '2020-05-05 16:05:58.263828'),
(1319, 1, '1', '2020-05-05 16:06:04.379791'),
(1320, 1, '1', '2020-05-05 16:06:10.529730'),
(1321, 1, '1', '2020-05-05 16:06:18.671156'),
(1322, 1, '1', '2020-05-05 16:06:29.581831'),
(1323, 1, '1', '2020-05-05 16:06:33.740629'),
(1324, 1, '1', '2020-05-05 16:06:37.796365'),
(1325, 1, '1', '2020-05-05 16:06:41.937300'),
(1326, 1, '1', '2020-05-05 16:06:45.919692'),
(1327, 1, '1', '2020-05-05 16:06:50.161108'),
(1328, 1, '1', '2020-05-05 16:06:54.181507'),
(1329, 1, '1', '2020-05-05 16:06:58.194905'),
(1330, 1, '1', '2020-05-05 16:07:06.402537'),
(1331, 1, '1', '2020-05-05 16:07:12.402597'),
(1332, 1, '1', '2020-05-05 16:07:18.518612'),
(1333, 1, '1', '2020-05-05 16:07:26.614232'),
(1334, 1, '1', '2020-05-05 16:07:32.750867'),
(1335, 1, '1', '2020-05-05 16:07:38.960257'),
(1336, 1, '1', '2020-05-05 16:07:43.034582'),
(1337, 1, '1', '2020-05-05 16:07:48.984118'),
(1338, 1, '1', '2020-05-05 16:07:59.250100'),
(1339, 1, '1', '2020-05-05 16:08:09.392491'),
(1340, 1, '1', '2020-05-05 16:08:13.466856'),
(1341, 1, '1', '2020-05-05 16:08:17.466567'),
(1342, 1, '1', '2020-05-05 16:08:21.542250'),
(1343, 1, '1', '2020-05-05 16:08:29.775329'),
(1344, 1, '1', '2020-05-05 16:08:41.908609'),
(1345, 1, '1', '2020-05-05 16:08:49.990715'),
(1346, 1, '1', '2020-05-05 16:08:58.116225'),
(1347, 1, '1', '2020-05-05 16:09:04.249123'),
(1348, 1, '1', '2020-05-05 16:09:10.475002'),
(1349, 1, '1', '2020-05-05 16:09:18.516957'),
(1350, 1, '1', '2020-05-05 16:09:26.596774'),
(1351, 1, '1', '2020-05-05 16:09:34.790272'),
(1352, 1, '1', '2020-05-05 16:09:38.823393'),
(1353, 1, '1', '2020-05-05 16:09:45.912931'),
(1354, 1, '1', '2020-05-05 16:09:52.048793'),
(1355, 1, '1', '2020-05-05 16:09:58.112054'),
(1356, 1, '1', '2020-05-05 16:10:04.197931'),
(1357, 1, '1', '2020-05-05 16:10:10.256907'),
(1358, 1, '1', '2020-05-05 16:10:16.395378'),
(1359, 1, '1', '2020-05-05 16:10:24.539020'),
(1360, 1, '1', '2020-05-05 16:10:30.580491'),
(1361, 1, '1', '2020-05-05 16:10:36.763411'),
(1362, 1, '1', '2020-05-05 16:10:46.835974'),
(1363, 1, '1', '2020-05-05 16:10:58.056223'),
(1364, 1, '1', '2020-05-05 16:11:08.210545'),
(1365, 1, '1', '2020-05-05 16:11:16.303947'),
(1366, 1, '1', '2020-05-05 16:11:24.495755'),
(1367, 1, '1', '2020-05-05 16:11:32.617281'),
(1368, 1, '1', '2020-05-05 16:11:37.703646'),
(1369, 1, '1', '2020-05-05 16:11:41.735455'),
(1370, 1, '1', '2020-05-05 16:11:45.912627'),
(1371, 1, '1', '2020-05-05 16:11:50.024559'),
(1372, 1, '1', '2020-05-05 16:11:58.958448'),
(1373, 1, '1', '2020-05-05 16:12:07.082592'),
(1374, 1, '1', '2020-05-05 16:12:15.240436'),
(1375, 1, '1', '2020-05-05 16:12:21.339833'),
(1376, 1, '1', '2020-05-05 16:12:25.431524'),
(1377, 1, '1', '2020-05-05 16:12:29.457063'),
(1378, 1, '1', '2020-05-05 16:12:35.610590'),
(1379, 1, '1', '2020-05-05 16:12:41.719226'),
(1380, 1, '1', '2020-05-05 16:12:49.859874'),
(1381, 1, '1', '2020-05-05 16:12:55.976994'),
(1382, 1, '1', '2020-05-05 16:13:04.113721'),
(1383, 1, '1', '2020-05-05 16:13:12.222231'),
(1384, 1, '1', '2020-05-05 16:13:18.268051'),
(1385, 1, '1', '2020-05-05 16:13:26.504333'),
(1386, 1, '1', '2020-05-05 16:13:32.587065'),
(1387, 1, '1', '2020-05-05 16:13:42.769832'),
(1388, 1, '1', '2020-05-05 16:13:50.828281'),
(1389, 1, '1', '2020-05-05 16:14:00.962265'),
(1390, 1, '1', '2020-05-05 16:14:11.318961'),
(1391, 1, '1', '2020-05-05 16:14:21.316660'),
(1392, 1, '1', '2020-05-05 16:14:31.559927'),
(1393, 1, '1', '2020-05-05 16:14:39.668541'),
(1394, 1, '1', '2020-05-05 16:14:47.759455'),
(1395, 1, '1', '2020-05-05 16:14:57.858675'),
(1396, 1, '1', '2020-05-05 16:15:06.050368'),
(1397, 1, '1', '2020-05-05 16:15:14.116796'),
(1398, 1, '1', '2020-05-05 16:15:24.316596'),
(1399, 1, '1', '2020-05-05 16:15:36.575261'),
(1400, 1, '1', '2020-05-05 16:15:44.673346'),
(1401, 1, '1', '2020-05-05 16:15:52.798238'),
(1402, 1, '1', '2020-05-05 16:16:00.889465'),
(1403, 1, '1', '2020-05-05 16:16:13.121831'),
(1404, 1, '1', '2020-05-05 16:16:23.439219'),
(1405, 1, '1', '2020-05-05 16:16:29.397984'),
(1406, 1, '1', '2020-05-05 16:16:35.530860'),
(1407, 1, '1', '2020-05-05 16:16:43.605431'),
(1408, 1, '1', '2020-05-05 16:16:53.922550'),
(1409, 1, '1', '2020-05-05 16:17:01.963948'),
(1410, 1, '1', '2020-05-05 16:17:16.211453'),
(1411, 1, '1', '2020-05-05 16:17:26.562655'),
(1412, 1, '1', '2020-05-05 16:17:34.436021'),
(1413, 1, '1', '2020-05-05 16:17:43.445648'),
(1414, 1, '1', '2020-05-05 16:17:55.694890'),
(1415, 1, '1', '2020-05-05 16:18:05.819811'),
(1416, 1, '1', '2020-05-05 16:18:14.017887'),
(1417, 1, '1', '2020-05-05 16:18:26.166843'),
(1418, 1, '1', '2020-05-05 16:18:38.291346'),
(1419, 1, '1', '2020-05-05 16:18:46.452127'),
(1420, 1, '1', '2020-05-05 16:18:56.558504'),
(1421, 1, '1', '2020-05-05 16:19:10.843729'),
(1422, 1, '1', '2020-05-05 16:19:25.276783'),
(1423, 1, '1', '2020-05-05 16:19:35.275779'),
(1424, 1, '1', '2020-05-05 16:19:43.314480'),
(1425, 1, '1', '2020-05-05 16:19:53.555601'),
(1426, 1, '1', '2020-05-05 16:20:04.658680'),
(1427, 1, '1', '2020-05-05 16:20:14.851916'),
(1428, 1, '1', '2020-05-05 16:20:23.035803'),
(1429, 1, '1', '2020-05-05 16:20:29.124295'),
(1430, 1, '1', '2020-05-05 16:20:37.190558'),
(1431, 1, '1', '2020-05-05 16:20:45.311449'),
(1432, 1, '1', '2020-05-05 16:20:57.194327'),
(1433, 1, '1', '2020-05-05 16:21:04.636244'),
(1434, 1, '1', '2020-05-05 16:21:14.760061'),
(1435, 1, '1', '2020-05-05 16:21:24.951771'),
(1436, 1, '1', '2020-05-05 16:21:35.097429'),
(1437, 1, '1', '2020-05-05 16:21:43.209902'),
(1438, 1, '1', '2020-05-05 16:21:51.987722'),
(1439, 1, '1', '2020-05-05 16:22:00.526233'),
(1440, 1, '1', '2020-05-05 16:22:08.608644'),
(1441, 1, '1', '2020-05-05 16:22:14.707618'),
(1442, 1, '1', '2020-05-05 16:22:20.957659'),
(1443, 1, '1', '2020-05-05 16:22:32.957702'),
(1444, 1, '1', '2020-05-05 16:22:39.056905'),
(1445, 1, '1', '2020-05-05 16:22:44.313905'),
(1446, 1, '1', '2020-05-05 16:22:50.264648'),
(1447, 1, '1', '2020-05-05 16:23:03.355744'),
(1448, 1, '1', '2020-05-05 16:23:10.589366'),
(1449, 1, '1', '2020-05-05 16:23:17.822022'),
(1450, 1, '1', '2020-05-05 16:23:24.752488'),
(1451, 1, '1', '2020-05-05 16:23:30.962878'),
(1452, 1, '1', '2020-05-05 16:23:37.146342'),
(1453, 1, '1', '2020-05-05 16:23:42.858067'),
(1454, 1, '1', '2020-05-05 16:23:48.574531'),
(1455, 1, '1', '2020-05-05 16:23:54.304295'),
(1456, 1, '1', '2020-05-05 16:24:00.359599'),
(1457, 1, '1', '2020-05-05 16:24:06.520069'),
(1458, 1, '1', '2020-05-05 16:24:10.529289'),
(1459, 1, '1', '2020-05-05 16:24:14.636306'),
(1460, 1, '1', '2020-05-05 16:24:18.744319'),
(1461, 1, '1', '2020-05-05 16:24:22.775538'),
(1462, 1, '1', '2020-05-05 16:24:28.903150'),
(1463, 1, '1', '2020-05-05 16:24:34.894128'),
(1464, 1, '1', '2020-05-05 16:24:40.983843'),
(1465, 1, '1', '2020-05-05 16:24:47.043635'),
(1466, 1, '1', '2020-05-05 16:24:55.251947'),
(1467, 1, '1', '2020-05-05 16:25:01.244493'),
(1468, 1, '1', '2020-05-05 16:25:05.569065'),
(1469, 1, '1', '2020-05-05 16:25:09.418769'),
(1470, 1, '1', '2020-05-05 16:25:13.393140'),
(1471, 1, '1', '2020-05-05 16:25:19.542786'),
(1472, 1, '1', '2020-05-05 16:25:28.041826'),
(1473, 1, '1', '2020-05-05 16:25:36.041709'),
(1474, 1, '1', '2020-05-05 16:25:44.133069'),
(1475, 1, '1', '2020-05-05 16:25:50.044361'),
(1476, 1, '1', '2020-05-05 16:25:56.276721'),
(1477, 1, '1', '2020-05-05 16:26:00.308909'),
(1478, 1, '1', '2020-05-05 16:26:06.306896'),
(1479, 1, '1', '2020-05-05 16:26:16.383435'),
(1480, 1, '1', '2020-05-05 16:26:25.167973'),
(1481, 1, '1', '2020-05-05 16:26:30.833075'),
(1482, 1, '1', '2020-05-05 16:26:36.997837'),
(1483, 1, '1', '2020-05-05 16:26:40.914604'),
(1484, 1, '1', '2020-05-05 16:26:44.954810'),
(1485, 1, '1', '2020-05-05 16:26:51.240700'),
(1486, 1, '1', '2020-05-05 16:26:59.171828'),
(1487, 1, '1', '2020-05-05 16:27:08.041058'),
(1488, 1, '1', '2020-05-05 16:27:15.448217'),
(1489, 1, '1', '2020-05-05 16:27:23.496071'),
(1490, 1, '1', '2020-05-05 16:27:33.623263'),
(1491, 1, '1', '2020-05-05 16:27:37.770165'),
(1492, 1, '1', '2020-05-05 16:27:43.756335'),
(1493, 1, '1', '2020-05-05 16:27:49.953891'),
(1494, 1, '1', '2020-05-05 16:27:56.977830'),
(1495, 1, '1', '2020-05-05 16:28:04.218742'),
(1496, 1, '1', '2020-05-05 16:28:12.311085'),
(1497, 1, '1', '2020-05-05 16:28:20.759772'),
(1498, 1, '1', '2020-05-05 16:28:26.560460'),
(1499, 1, '1', '2020-05-05 16:28:32.613128'),
(1500, 1, '1', '2020-05-05 16:28:40.776324'),
(1501, 1, '1', '2020-05-05 16:28:48.965803'),
(1502, 1, '1', '2020-05-05 16:28:59.103950'),
(1503, 1, '1', '2020-05-05 16:29:09.179298'),
(1504, 1, '1', '2020-05-05 16:29:17.328769'),
(1505, 1, '1', '2020-05-05 16:29:23.508927'),
(1506, 1, '1', '2020-05-05 16:29:31.691483'),
(1507, 1, '1', '2020-05-05 16:29:37.674388'),
(1508, 1, '1', '2020-05-05 16:29:47.854876'),
(1509, 1, '1', '2020-05-05 16:29:58.156964'),
(1510, 1, '1', '2020-05-05 16:30:06.418895'),
(1511, 1, '1', '2020-05-05 16:30:16.414458'),
(1512, 1, '1', '2020-05-05 16:30:24.430125'),
(1513, 1, '1', '2020-05-05 16:30:28.506713'),
(1514, 1, '1', '2020-05-05 16:30:32.714125'),
(1515, 1, '1', '2020-05-05 16:30:38.855329'),
(1516, 1, '1', '2020-05-05 16:30:46.846349'),
(1517, 1, '1', '2020-05-05 16:30:52.926271'),
(1518, 1, '1', '2020-05-05 16:30:59.036470'),
(1519, 1, '1', '2020-05-05 16:31:05.278181'),
(1520, 1, '1', '2020-05-05 16:31:11.169710'),
(1521, 1, '1', '2020-05-05 16:31:15.203520'),
(1522, 1, '1', '2020-05-05 16:31:19.276331'),
(1523, 1, '1', '2020-05-05 16:31:23.319530'),
(1524, 1, '1', '2020-05-05 16:31:29.361246'),
(1525, 1, '1', '2020-05-05 16:31:35.525802'),
(1526, 1, '1', '2020-05-05 16:31:43.533007'),
(1527, 1, '1', '2020-05-05 16:31:53.735203'),
(1528, 1, '1', '2020-05-05 16:31:57.843970'),
(1529, 1, '1', '2020-05-05 16:31:59.943797'),
(1530, 1, '1', '2020-05-05 16:32:01.975058'),
(1531, 1, '1', '2020-05-05 16:32:03.976578'),
(1532, 1, '1', '2020-05-05 16:32:06.051365'),
(1533, 1, '1', '2020-05-05 16:32:07.977208'),
(1534, 1, '1', '2020-05-05 16:32:12.076307'),
(1535, 1, '1', '2020-05-05 16:32:16.243157'),
(1536, 1, '1', '2020-05-05 16:32:20.237557'),
(1537, 1, '1', '2020-05-05 16:32:24.408138'),
(1538, 1, '1', '2020-05-05 16:32:28.382885'),
(1539, 1, '1', '2020-05-05 16:32:30.400743'),
(1540, 1, '1', '2020-05-05 16:32:32.492793'),
(1541, 1, '1', '2020-05-05 16:32:36.558558'),
(1542, 1, '1', '2020-05-05 16:32:40.583607'),
(1543, 1, '1', '2020-05-05 16:32:47.084946'),
(1544, 1, '1', '2020-05-05 16:32:51.732962'),
(1545, 1, '1', '2020-05-05 16:32:57.849270'),
(1546, 1, '1', '2020-05-05 16:33:05.981493'),
(1547, 1, '1', '2020-05-05 16:33:10.081530'),
(1548, 1, '1', '2020-05-05 16:33:14.030966'),
(1549, 1, '1', '2020-05-05 16:33:18.298525'),
(1550, 1, '1', '2020-05-05 16:33:24.281552'),
(1551, 1, '1', '2020-05-05 16:33:28.356625'),
(1552, 1, '1', '2020-05-05 16:33:30.306438'),
(1553, 1, '1', '2020-05-05 16:33:36.497852'),
(1554, 1, '1', '2020-05-05 16:33:44.589214'),
(1555, 1, '1', '2020-05-05 16:33:50.613950'),
(1556, 1, '1', '2020-05-05 16:34:00.933030'),
(1557, 1, '1', '2020-05-05 16:34:05.021975'),
(1558, 1, '1', '2020-05-05 16:34:08.996985'),
(1559, 1, '1', '2020-05-05 16:34:13.088331'),
(1560, 1, '1', '2020-05-05 16:34:21.121530'),
(1561, 1, '1', '2020-05-05 16:34:27.412745'),
(1562, 1, '1', '2020-05-05 16:34:29.546039'),
(1563, 1, '1', '2020-05-05 16:34:31.990502'),
(1564, 1, '1', '2020-05-05 16:34:38.380431'),
(1565, 1, '1', '2020-05-05 16:34:39.381248'),
(1566, 1, '1', '2020-05-05 16:34:41.412762'),
(1567, 1, '1', '2020-05-05 16:34:48.128811'),
(1568, 1, '1', '2020-05-05 16:34:54.647284'),
(1569, 1, '1', '2020-05-05 16:35:02.771425'),
(1570, 1, '1', '2020-05-05 16:35:10.968812'),
(1571, 1, '1', '2020-05-05 16:35:19.455277'),
(1572, 1, '1', '2020-05-05 16:35:23.204307'),
(1573, 1, '1', '2020-05-05 16:35:25.251305'),
(1574, 1, '1', '2020-05-05 16:35:27.179753'),
(1575, 1, '1', '2020-05-05 16:35:29.237698'),
(1576, 1, '1', '2020-05-05 16:35:31.193908'),
(1577, 1, '1', '2020-05-05 16:35:33.312247'),
(1578, 1, '1', '2020-05-05 16:35:35.293008'),
(1579, 1, '1', '2020-05-05 16:35:38.081703'),
(1580, 1, '1', '2020-05-05 16:35:43.515547'),
(1581, 1, '1', '2020-05-05 16:35:52.200660'),
(1582, 1, '1', '2020-05-05 16:36:00.738193'),
(1583, 1, '1', '2020-05-05 16:36:06.878559'),
(1584, 1, '1', '2020-05-05 16:36:08.941703'),
(1585, 1, '1', '2020-05-05 16:36:10.799914'),
(1586, 1, '1', '2020-05-05 16:36:12.949839'),
(1587, 1, '1', '2020-05-05 16:36:14.924662'),
(1588, 1, '1', '2020-05-05 16:36:17.056540'),
(1589, 1, '1', '2020-05-05 16:36:20.011231'),
(1590, 1, '1', '2020-05-05 16:36:22.216180'),
(1591, 1, '1', '2020-05-05 16:36:26.262052'),
(1592, 1, '1', '2020-05-05 16:36:32.257622'),
(1593, 1, '1', '2020-05-05 16:36:36.356249'),
(1594, 1, '1', '2020-05-05 16:36:40.399086'),
(1595, 1, '1', '2020-05-05 16:36:46.998173'),
(1596, 1, '1', '2020-05-05 16:36:54.086030'),
(1597, 1, '1', '2020-05-05 16:37:03.014806'),
(1598, 1, '1', '2020-05-05 16:37:07.126995'),
(1599, 1, '1', '2020-05-05 16:37:10.726752'),
(1600, 1, '1', '2020-05-05 16:37:17.006184'),
(1601, 1, '1', '2020-05-05 16:37:22.943879'),
(1602, 1, '1', '2020-05-05 16:37:26.988598'),
(1603, 1, '1', '2020-05-05 16:37:31.121927'),
(1604, 1, '1', '2020-05-05 16:37:33.105221'),
(1605, 1, '1', '2020-05-05 16:37:35.301746'),
(1606, 1, '1', '2020-05-05 16:37:37.253045'),
(1607, 1, '1', '2020-05-05 16:37:39.347387'),
(1608, 1, '1', '2020-05-05 16:37:41.305259'),
(1609, 1, '1', '2020-05-05 16:37:45.646382'),
(1610, 1, '1', '2020-05-05 16:37:49.425829'),
(1611, 1, '1', '2020-05-05 16:37:55.962584'),
(1612, 1, '1', '2020-05-05 16:38:01.633558'),
(1613, 1, '1', '2020-05-05 16:38:08.050423'),
(1614, 1, '1', '2020-05-05 16:38:14.336511'),
(1615, 1, '1', '2020-05-05 16:38:19.087092'),
(1616, 1, '1', '2020-05-05 16:38:24.035969'),
(1617, 1, '1', '2020-05-05 16:38:28.061383'),
(1618, 1, '1', '2020-05-05 16:38:34.222067'),
(1619, 1, '1', '2020-05-05 16:38:40.269088'),
(1620, 1, '1', '2020-05-05 16:38:44.727626'),
(1621, 1, '1', '2020-05-05 16:38:49.360751'),
(1622, 1, '1', '2020-05-05 16:38:55.468609'),
(1623, 1, '1', '2020-05-05 16:39:03.652090'),
(1624, 1, '1', '2020-05-05 16:39:13.776794'),
(1625, 1, '1', '2020-05-05 16:39:21.875384'),
(1626, 1, '1', '2020-05-05 16:39:26.032258'),
(1627, 1, '1', '2020-05-05 16:39:30.642293'),
(1628, 1, '1', '2020-05-05 16:39:32.233229'),
(1629, 1, '1', '2020-05-05 16:39:36.147877'),
(1630, 1, '1', '2020-05-05 16:39:40.667224'),
(1631, 1, '1', '2020-05-05 16:39:45.057866'),
(1632, 1, '1', '2020-05-05 16:39:51.024526'),
(1633, 1, '1', '2020-05-05 16:39:55.465633'),
(1634, 1, '1', '2020-05-05 16:39:59.457948'),
(1635, 1, '1', '2020-05-05 16:40:03.527121'),
(1636, 1, '1', '2020-05-05 16:40:07.824324'),
(1637, 1, '1', '2020-05-05 16:40:13.057076'),
(1638, 1, '1', '2020-05-05 16:40:18.814879'),
(1639, 1, '1', '2020-05-05 16:40:24.138410'),
(1640, 1, '1', '2020-05-05 16:40:25.956548'),
(1641, 1, '1', '2020-05-05 16:40:28.072975'),
(1642, 1, '1', '2020-05-05 16:40:31.998111'),
(1643, 1, '1', '2020-05-05 16:40:36.078911'),
(1644, 1, '1', '2020-05-05 16:40:40.098368'),
(1645, 1, '1', '2020-05-05 16:40:46.263944'),
(1646, 1, '1', '2020-05-05 16:40:50.639124'),
(1647, 1, '1', '2020-05-05 16:40:55.288091'),
(1648, 1, '1', '2020-05-05 16:40:57.390872'),
(1649, 1, '1', '2020-05-05 16:40:59.471999'),
(1650, 1, '1', '2020-05-05 16:41:01.814573'),
(1651, 1, '1', '2020-05-05 16:41:08.688187'),
(1652, 1, '1', '2020-05-05 16:41:14.146271'),
(1653, 1, '1', '2020-05-05 16:41:17.821008'),
(1654, 1, '1', '2020-05-05 16:41:27.935949'),
(1655, 1, '1', '2020-05-05 16:41:34.145934'),
(1656, 1, '1', '2020-05-05 16:41:38.237330'),
(1657, 1, '1', '2020-05-05 16:41:42.254005'),
(1658, 1, '1', '2020-05-05 16:41:46.203447'),
(1659, 1, '1', '2020-05-05 16:41:52.361475'),
(1660, 1, '1', '2020-05-05 16:42:00.394278'),
(1661, 1, '1', '2020-05-05 16:42:13.753437'),
(1662, 1, '1', '2020-05-05 16:42:34.952742'),
(1663, 1, '1', '2020-05-05 16:42:49.277267'),
(1664, 1, '1', '2020-05-05 16:42:57.375887'),
(1665, 1, '1', '2020-05-05 16:43:06.543028'),
(1666, 1, '1', '2020-05-05 16:43:22.641338'),
(1667, 1, '1', '2020-05-05 16:43:37.914894'),
(1668, 1, '1', '2020-05-05 16:43:50.027206'),
(1669, 1, '1', '2020-05-05 16:43:55.945893'),
(1670, 1, '1', '2020-05-05 16:43:59.231405'),
(1671, 1, '1', '2020-05-05 16:44:01.240115'),
(1672, 1, '1', '2020-05-05 16:44:08.256394'),
(1673, 1, '1', '2020-05-05 16:44:09.431555'),
(1674, 1, '1', '2020-05-05 16:44:13.488984'),
(1675, 1, '1', '2020-05-05 16:44:17.506188'),
(1676, 1, '1', '2020-05-05 16:44:23.626224'),
(1677, 1, '1', '2020-05-05 16:44:27.779932'),
(1678, 1, '1', '2020-05-05 16:44:33.703023'),
(1679, 1, '1', '2020-05-05 16:44:36.913814'),
(1680, 1, '1', '2020-05-05 16:44:40.921577'),
(1681, 1, '1', '2020-05-05 16:44:46.038167'),
(1682, 1, '1', '2020-05-05 16:44:52.288154'),
(1683, 1, '1', '2020-05-05 16:44:56.188067'),
(1684, 1, '1', '2020-05-05 16:44:58.255023'),
(1685, 1, '1', '2020-05-05 16:45:05.262281'),
(1686, 1, '1', '2020-05-05 16:45:07.196614'),
(1687, 1, '1', '2020-05-05 16:45:10.311859'),
(1688, 1, '1', '2020-05-05 16:45:14.486066'),
(1689, 1, '1', '2020-05-05 16:45:19.228815'),
(1690, 1, '1', '2020-05-05 16:45:22.595602'),
(1691, 1, '1', '2020-05-05 16:45:27.161474'),
(1692, 1, '1', '2020-05-05 16:45:30.860448'),
(1693, 1, '1', '2020-05-05 16:45:34.860872'),
(1694, 1, '1', '2020-05-05 16:45:40.094295'),
(1695, 1, '1', '2020-05-05 16:45:45.943308'),
(1696, 1, '1', '2020-05-05 16:45:52.010475'),
(1697, 1, '1', '2020-05-05 16:45:58.052441'),
(1698, 1, '1', '2020-05-05 16:46:01.160102'),
(1699, 1, '1', '2020-05-05 16:46:05.187525'),
(1700, 1, '1', '2020-05-05 16:46:08.009198'),
(1701, 1, '1', '2020-05-05 16:46:09.295432'),
(1702, 1, '1', '2020-05-05 16:46:11.376407'),
(1703, 1, '1', '2020-05-05 16:46:14.251771'),
(1704, 1, '1', '2020-05-05 16:46:17.375842'),
(1705, 1, '1', '2020-05-05 16:46:21.437662'),
(1706, 1, '1', '2020-05-05 16:46:26.540753'),
(1707, 1, '1', '2020-05-05 16:46:32.692566'),
(1708, 1, '1', '2020-05-05 16:46:38.766700'),
(1709, 1, '1', '2020-05-05 16:46:42.845443'),
(1710, 1, '1', '2020-05-05 16:46:46.803171'),
(1711, 1, '1', '2020-05-05 16:46:48.936647'),
(1712, 1, '1', '2020-05-05 16:46:55.890658'),
(1713, 1, '1', '2020-05-05 16:46:56.986815'),
(1714, 1, '1', '2020-05-05 16:47:01.061629'),
(1715, 1, '1', '2020-05-05 16:47:07.255188'),
(1716, 1, '1', '2020-05-05 16:47:15.290629'),
(1717, 1, '1', '2020-05-05 16:47:21.331397'),
(1718, 1, '1', '2020-05-05 16:47:25.540162'),
(1719, 1, '1', '2020-05-05 16:47:28.023381'),
(1720, 1, '1', '2020-05-05 16:47:31.569576'),
(1721, 1, '1', '2020-05-05 16:47:35.735405'),
(1722, 1, '1', '2020-05-05 16:47:39.897614'),
(1723, 1, '1', '2020-05-05 16:47:45.067524'),
(1724, 1, '1', '2020-05-05 16:47:50.981119'),
(1725, 1, '1', '2020-05-05 16:47:57.118857'),
(1726, 1, '1', '2020-05-05 16:48:04.230376'),
(1727, 1, '1', '2020-05-05 16:48:10.212912'),
(1728, 1, '1', '2020-05-05 16:48:14.229580'),
(1729, 1, '1', '2020-05-05 16:48:16.288106'),
(1730, 1, '1', '2020-05-05 16:48:18.330114'),
(1731, 1, '1', '2020-05-05 16:48:22.407158'),
(1732, 1, '1', '2020-05-05 16:48:26.478951'),
(1733, 1, '1', '2020-05-05 16:48:30.512362'),
(1734, 1, '1', '2020-05-05 16:48:38.778788'),
(1735, 1, '1', '2020-05-05 16:48:50.844642'),
(1736, 1, '1', '2020-05-05 16:48:57.202718'),
(1737, 1, '1', '2020-05-05 16:49:01.061530'),
(1738, 1, '1', '2020-05-05 16:49:05.128040'),
(1739, 1, '1', '2020-05-05 16:49:11.350456'),
(1740, 1, '1', '2020-05-05 16:49:15.251840'),
(1741, 1, '1', '2020-05-05 16:49:21.316528'),
(1742, 1, '1', '2020-05-05 16:49:25.485488'),
(1743, 1, '1', '2020-05-05 16:49:27.860539'),
(1744, 1, '1', '2020-05-05 16:49:29.460217'),
(1745, 1, '1', '2020-05-05 16:49:35.542537'),
(1746, 1, '1', '2020-05-05 16:49:42.761617'),
(1747, 1, '1', '2020-05-05 16:49:50.784007'),
(1748, 1, '1', '2020-05-05 16:50:01.017163'),
(1749, 1, '1', '2020-05-05 16:50:06.933376'),
(1750, 1, '1', '2020-05-05 16:50:11.082986'),
(1751, 1, '1', '2020-05-05 16:50:15.117399'),
(1752, 1, '1', '2020-05-05 16:50:19.124800'),
(1753, 1, '1', '2020-05-05 16:50:21.218557'),
(1754, 1, '1', '2020-05-05 16:50:25.215721'),
(1755, 1, '1', '2020-05-05 16:50:29.458388'),
(1756, 1, '1', '2020-05-05 16:50:34.082815'),
(1757, 1, '1', '2020-05-05 16:50:35.549784'),
(1758, 1, '1', '2020-05-05 16:50:42.538730'),
(1759, 1, '1', '2020-05-05 16:50:45.732031'),
(1760, 1, '1', '2020-05-05 16:50:52.040230'),
(1761, 1, '1', '2020-05-05 16:50:55.948125'),
(1762, 1, '1', '2020-05-05 16:50:59.781463'),
(1763, 1, '1', '2020-05-05 16:51:03.672694'),
(1764, 1, '1', '2020-05-05 16:51:08.113965'),
(1765, 1, '1', '2020-05-05 16:51:12.114590'),
(1766, 1, '1', '2020-05-05 16:51:20.197550'),
(1767, 1, '1', '2020-05-05 16:51:29.179976'),
(1768, 1, '1', '2020-05-05 16:51:37.296540'),
(1769, 1, '1', '2020-05-05 16:51:43.213764'),
(1770, 1, '1', '2020-05-05 16:51:48.555253'),
(1771, 1, '1', '2020-05-05 16:51:54.929728'),
(1772, 1, '1', '2020-05-05 16:52:01.479413'),
(1773, 1, '1', '2020-05-05 16:52:05.607297'),
(1774, 1, '1', '2020-05-05 16:52:09.604566'),
(1775, 1, '1', '2020-05-05 16:52:13.646746'),
(1776, 1, '1', '2020-05-05 16:52:19.679714'),
(1777, 1, '1', '2020-05-05 16:52:31.920521'),
(1778, 1, '1', '2020-05-05 16:52:39.077359'),
(1779, 1, '1', '2020-05-05 16:52:45.103984'),
(1780, 1, '1', '2020-05-05 16:52:55.236600'),
(1781, 1, '1', '2020-05-05 16:53:08.421278'),
(1782, 1, '1', '2020-05-05 16:53:19.486258'),
(1783, 1, '1', '2020-05-05 16:53:30.035235'),
(1784, 1, '1', '2020-05-05 16:53:39.866583'),
(1785, 1, '1', '2020-05-05 16:53:47.877057'),
(1786, 1, '1', '2020-05-05 16:53:56.015212'),
(1787, 1, '1', '2020-05-05 16:54:06.009909'),
(1788, 1, '1', '2020-05-05 16:54:18.185475'),
(1789, 1, '1', '2020-05-05 16:54:33.048729'),
(1790, 1, '1', '2020-05-05 16:54:41.089559'),
(1791, 1, '1', '2020-05-05 16:54:47.080341'),
(1792, 1, '1', '2020-05-05 16:54:55.168034'),
(1793, 1, '1', '2020-05-05 16:55:08.247135'),
(1794, 1, '1', '2020-05-05 16:55:19.529189'),
(1795, 1, '1', '2020-05-05 16:55:29.279419'),
(1796, 1, '1', '2020-05-05 16:55:39.470215'),
(1797, 1, '1', '2020-05-05 16:55:51.661811'),
(1798, 1, '1', '2020-05-05 16:56:03.627653'),
(1799, 1, '1', '2020-05-05 16:56:14.643875'),
(1800, 1, '1', '2020-05-05 16:56:24.819011'),
(1801, 1, '1', '2020-05-05 16:56:36.910714'),
(1802, 1, '1', '2020-05-05 16:56:48.742922'),
(1803, 1, '1', '2020-05-05 16:56:58.950475'),
(1804, 1, '1', '2020-05-05 16:57:04.916235'),
(1805, 1, '1', '2020-05-05 16:57:12.941631'),
(1806, 1, '1', '2020-05-05 16:57:22.990758'),
(1807, 1, '1', '2020-05-05 16:57:40.057384'),
(1808, 1, '1', '2020-05-05 16:57:56.106607'),
(1809, 1, '1', '2020-05-05 16:58:06.289693'),
(1810, 1, '1', '2020-05-05 16:58:18.246687'),
(1811, 1, '1', '2020-05-05 16:58:32.562609'),
(1812, 1, '1', '2020-05-05 16:58:44.604349'),
(1813, 1, '1', '2020-05-05 16:58:58.379740'),
(1814, 1, '1', '2020-05-05 16:59:14.536838'),
(1815, 1, '1', '2020-05-05 16:59:26.528298'),
(1816, 1, '1', '2020-05-05 16:59:38.544367'),
(1817, 1, '1', '2020-05-05 16:59:51.842053'),
(1818, 1, '1', '2020-05-05 17:00:07.702094'),
(1819, 1, '1', '2020-05-05 17:00:19.701585'),
(1820, 1, '1', '2020-05-05 17:00:31.858478'),
(1821, 1, '1', '2020-05-05 17:00:43.867747'),
(1822, 1, '1', '2020-05-05 17:00:55.858589'),
(1823, 1, '1', '2020-05-05 17:01:08.124256'),
(1824, 1, '1', '2020-05-05 17:01:23.007830'),
(1825, 1, '1', '2020-05-05 17:01:39.032824'),
(1826, 1, '1', '2020-05-05 17:01:56.098467'),
(1827, 1, '1', '2020-05-05 17:02:05.221782'),
(1828, 1, '1', '2020-05-05 17:02:16.273197'),
(1829, 1, '1', '2020-05-05 17:02:30.370041'),
(1830, 1, '1', '2020-05-05 17:02:49.094430'),
(1831, 1, '1', '2020-05-05 17:02:59.538267'),
(1832, 1, '1', '2020-05-05 17:03:11.994066'),
(1833, 1, '1', '2020-05-05 17:03:25.018284'),
(1834, 1, '1', '2020-05-05 17:03:40.592927'),
(1835, 1, '1', '2020-05-05 17:03:56.586993'),
(1836, 1, '1', '2020-05-05 17:04:08.769758'),
(1837, 1, '1', '2020-05-05 17:04:18.803375'),
(1838, 1, '1', '2020-05-05 17:04:27.327496'),
(1839, 1, '1', '2020-05-05 17:04:38.090717'),
(1840, 1, '1', '2020-05-05 17:04:53.998333'),
(1841, 1, '1', '2020-05-05 17:05:12.047630'),
(1842, 1, '1', '2020-05-05 17:05:24.121843'),
(1843, 1, '1', '2020-05-05 17:05:38.130030'),
(1844, 1, '1', '2020-05-05 17:05:52.204539'),
(1845, 1, '1', '2020-05-05 17:06:06.187220'),
(1846, 1, '1', '2020-05-05 17:06:20.377821'),
(1847, 1, '1', '2020-05-05 17:06:30.428158'),
(1848, 1, '1', '2020-05-05 17:06:36.825980'),
(1849, 1, '1', '2020-05-05 17:06:42.677431'),
(1850, 1, '1', '2020-05-05 17:06:49.893980'),
(1851, 1, '1', '2020-05-05 17:07:02.022275'),
(1852, 1, '1', '2020-05-05 17:07:12.600810'),
(1853, 1, '1', '2020-05-05 17:07:16.565828'),
(1854, 1, '1', '2020-05-05 17:07:25.082729'),
(1855, 1, '1', '2020-05-05 17:07:32.626147'),
(1856, 1, '1', '2020-05-05 17:07:44.958059'),
(1857, 1, '1', '2020-05-05 17:07:56.815412'),
(1858, 1, '1', '2020-05-05 17:08:06.882097'),
(1859, 1, '1', '2020-05-05 17:08:18.906265'),
(1860, 1, '1', '2020-05-05 17:08:32.823204'),
(1861, 1, '1', '2020-05-05 17:08:49.047270'),
(1862, 1, '1', '2020-05-05 17:09:07.121603'),
(1863, 1, '1', '2020-05-05 17:09:25.145802'),
(1864, 1, '1', '2020-05-05 17:09:39.228709'),
(1865, 1, '1', '2020-05-05 17:09:49.278573'),
(1866, 1, '1', '2020-05-05 17:10:03.103291'),
(1867, 1, '1', '2020-05-05 17:10:18.419645'),
(1868, 1, '1', '2020-05-05 17:10:34.535682'),
(1869, 1, '1', '2020-05-05 17:10:44.443726'),
(1870, 1, '1', '2020-05-05 17:10:59.754514'),
(1871, 1, '1', '2020-05-05 17:11:14.684555'),
(1872, 1, '1', '2020-05-05 17:11:26.690797'),
(1873, 1, '1', '2020-05-05 17:11:36.732356'),
(1874, 1, '1', '2020-05-05 17:11:48.965310'),
(1875, 1, '1', '2020-05-05 17:12:01.772731'),
(1876, 1, '1', '2020-05-05 17:12:17.939053'),
(1877, 1, '1', '2020-05-05 17:12:38.090544'),
(1878, 1, '1', '2020-05-05 17:12:58.193632'),
(1879, 1, '1', '2020-05-05 17:13:14.069999'),
(1880, 1, '1', '2020-05-05 17:13:36.577131'),
(1881, 1, '1', '2020-05-05 17:13:56.267841'),
(1882, 1, '1', '2020-05-05 17:14:18.008405'),
(1883, 1, '1', '2020-05-05 17:14:29.512968'),
(1884, 1, '1', '2020-05-05 17:14:35.483238'),
(1885, 1, '1', '2020-05-05 17:14:44.558684'),
(1886, 1, '1', '2020-05-05 17:14:58.707264'),
(1887, 1, '1', '2020-05-05 17:15:10.649063'),
(1888, 1, '1', '2020-05-05 17:15:24.148721'),
(1889, 1, '1', '2020-05-05 17:15:39.880792'),
(1890, 1, '1', '2020-05-05 17:15:50.813221'),
(1891, 1, '1', '2020-05-05 17:16:01.130421'),
(1892, 1, '1', '2020-05-05 17:16:17.322309'),
(1893, 1, '1', '2020-05-05 17:16:36.028523'),
(1894, 1, '1', '2020-05-05 17:16:52.128589'),
(1895, 1, '1', '2020-05-05 17:17:09.210405'),
(1896, 1, '1', '2020-05-05 17:17:21.235765'),
(1897, 1, '1', '2020-05-05 17:17:33.353097'),
(1898, 1, '1', '2020-05-05 17:17:45.400828'),
(1899, 1, '1', '2020-05-05 17:17:57.549968'),
(1900, 1, '1', '2020-05-05 17:18:15.649982'),
(1901, 1, '1', '2020-05-05 17:18:31.549449'),
(1902, 1, '1', '2020-05-05 17:18:44.774342'),
(1903, 1, '1', '2020-05-05 17:18:59.040474'),
(1904, 1, '1', '2020-05-05 17:19:14.705533'),
(1905, 1, '1', '2020-05-05 17:19:26.797606'),
(1906, 1, '1', '2020-05-05 17:19:38.813422'),
(1907, 1, '1', '2020-05-05 17:19:52.897191'),
(1908, 1, '1', '2020-05-05 17:20:03.097587'),
(1909, 1, '1', '2020-05-05 17:20:10.962562'),
(1910, 1, '1', '2020-05-05 17:20:16.979162'),
(1911, 1, '1', '2020-05-05 17:20:22.979554'),
(1912, 1, '1', '2020-05-05 17:20:29.062894'),
(1913, 1, '1', '2020-05-05 17:20:35.270528'),
(1914, 1, '1', '2020-05-05 17:20:41.095983'),
(1915, 1, '1', '2020-05-05 17:20:47.085196'),
(1916, 1, '1', '2020-05-05 17:20:53.127373'),
(1917, 1, '1', '2020-05-05 17:20:57.168162'),
(1918, 1, '1', '2020-05-05 17:21:03.311743'),
(1919, 1, '1', '2020-05-05 17:21:13.336598'),
(1920, 1, '1', '2020-05-05 17:21:21.374922'),
(1921, 1, '1', '2020-05-05 17:21:27.294262'),
(1922, 1, '1', '2020-05-05 17:21:32.327066'),
(1923, 1, '1', '2020-05-05 17:21:40.400141'),
(1924, 1, '1', '2020-05-05 17:21:52.373854'),
(1925, 1, '1', '2020-05-05 17:21:58.410499'),
(1926, 1, '1', '2020-05-05 17:22:04.468398'),
(1927, 1, '1', '2020-05-05 17:22:08.476459'),
(1928, 1, '1', '2020-05-05 17:22:16.593585'),
(1929, 1, '1', '2020-05-05 17:22:26.739548'),
(1930, 1, '1', '2020-05-05 17:22:36.701473'),
(1931, 1, '1', '2020-05-05 17:22:44.630262'),
(1932, 1, '1', '2020-05-05 17:22:51.771124'),
(1933, 1, '1', '2020-05-05 17:22:57.833146'),
(1934, 1, '1', '2020-05-05 17:23:05.730261'),
(1935, 1, '1', '2020-05-05 17:23:13.829589'),
(1936, 1, '1', '2020-05-05 17:23:19.747954'),
(1937, 1, '1', '2020-05-05 17:23:25.746510'),
(1938, 1, '1', '2020-05-05 17:23:33.820016'),
(1939, 1, '1', '2020-05-05 17:23:41.878670'),
(1940, 1, '1', '2020-05-05 17:23:47.870245'),
(1941, 1, '1', '2020-05-05 17:23:54.069777'),
(1942, 1, '1', '2020-05-05 17:24:03.973285'),
(1943, 1, '1', '2020-05-05 17:24:12.076550'),
(1944, 1, '1', '2020-05-05 17:24:20.119645'),
(1945, 1, '1', '2020-05-05 17:24:30.134699'),
(1946, 1, '1', '2020-05-05 17:24:40.543675'),
(1947, 1, '1', '2020-05-05 17:24:46.135026'),
(1948, 1, '1', '2020-05-05 17:24:50.375636'),
(1949, 1, '1', '2020-05-05 17:24:54.751371'),
(1950, 1, '1', '2020-05-05 17:25:00.233874'),
(1951, 1, '1', '2020-05-05 17:25:06.301769'),
(1952, 1, '1', '2020-05-05 17:25:14.507887'),
(1953, 1, '1', '2020-05-05 17:25:18.769408'),
(1954, 1, '1', '2020-05-05 17:25:22.509146'),
(1955, 1, '1', '2020-05-05 17:25:26.507830'),
(1956, 1, '1', '2020-05-05 17:25:30.332428'),
(1957, 1, '1', '2020-05-05 17:25:32.365868'),
(1958, 1, '1', '2020-05-05 17:25:38.233053'),
(1959, 1, '1', '2020-05-05 17:25:41.606929'),
(1960, 1, '1', '2020-05-05 17:25:45.607140'),
(1961, 1, '1', '2020-05-05 17:25:49.489636'),
(1962, 1, '1', '2020-05-05 17:25:53.506838'),
(1963, 1, '1', '2020-05-05 17:25:57.539777'),
(1964, 1, '1', '2020-05-05 17:25:59.500497'),
(1965, 1, '1', '2020-05-05 17:26:03.599912'),
(1966, 1, '1', '2020-05-05 17:26:04.716995'),
(1967, 1, '1', '2020-05-05 17:26:06.589358'),
(1968, 1, '1', '2020-05-05 17:26:08.564345'),
(1969, 1, '1', '2020-05-05 17:26:10.581163'),
(1970, 1, '1', '2020-05-05 17:26:12.574995'),
(1971, 1, '1', '2020-05-05 17:26:14.617558'),
(1972, 1, '1', '2020-05-05 17:26:16.558620'),
(1973, 1, '1', '2020-05-05 17:26:20.616373'),
(1974, 1, '1', '2020-05-05 17:26:24.604808'),
(1975, 1, '1', '2020-05-05 17:26:28.666536'),
(1976, 1, '1', '2020-05-05 17:26:32.671502'),
(1977, 1, '1', '2020-05-05 17:26:36.096171'),
(1978, 1, '1', '2020-05-05 17:26:37.624907'),
(1979, 1, '1', '2020-05-05 17:26:39.682663'),
(1980, 1, '1', '2020-05-05 17:26:46.732949'),
(1981, 1, '1', '2020-05-05 17:26:47.671517'),
(1982, 1, '1', '2020-05-05 17:26:49.840777'),
(1983, 1, '1', '2020-05-05 17:26:56.753829'),
(1984, 1, '1', '2020-05-05 17:26:59.729015'),
(1985, 1, '1', '2020-05-05 17:27:06.016547'),
(1986, 1, '1', '2020-05-05 17:27:07.528622'),
(1987, 1, '1', '2020-05-05 17:27:09.442735'),
(1988, 1, '1', '2020-05-05 17:27:15.791145'),
(1989, 1, '1', '2020-05-05 17:27:16.903501'),
(1990, 1, '1', '2020-05-05 17:27:18.865160'),
(1991, 1, '1', '2020-05-05 17:27:25.777787'),
(1992, 1, '1', '2020-05-05 17:27:30.087219'),
(1993, 1, '1', '2020-05-05 17:27:34.989709'),
(1994, 1, '1', '2020-05-05 17:27:38.194051'),
(1995, 1, '1', '2020-05-05 17:27:40.277607'),
(1996, 1, '1', '2020-05-05 17:27:41.992231'),
(1997, 1, '1', '2020-05-05 17:27:44.842211'),
(1998, 1, '1', '2020-05-05 17:27:45.985175'),
(1999, 1, '1', '2020-05-05 17:27:47.919249'),
(2000, 1, '1', '2020-05-05 17:27:49.984833'),
(2001, 1, '1', '2020-05-05 17:27:53.073176'),
(2002, 1, '1', '2020-05-05 17:27:54.489300'),
(2003, 1, '1', '2020-05-05 17:27:56.040084'),
(2004, 1, '1', '2020-05-05 17:27:58.023361'),
(2005, 1, '1', '2020-05-05 17:28:02.036912'),
(2006, 1, '1', '2020-05-05 17:28:06.189294'),
(2007, 1, '1', '2020-05-05 17:28:10.081211'),
(2008, 1, '1', '2020-05-05 17:28:14.125896'),
(2009, 1, '1', '2020-05-05 17:28:16.525872'),
(2010, 1, '1', '2020-05-05 17:28:18.539071'),
(2011, 1, '1', '2020-05-05 17:28:20.334467'),
(2012, 1, '1', '2020-05-05 17:28:22.184221'),
(2013, 1, '1', '2020-05-05 17:28:24.150474'),
(2014, 1, '1', '2020-05-05 17:28:26.255927'),
(2015, 1, '1', '2020-05-05 17:28:33.155592'),
(2016, 1, '1', '2020-05-05 17:28:36.292565'),
(2017, 1, '1', '2020-05-05 17:28:40.225328'),
(2018, 1, '1', '2020-05-05 17:28:45.330297'),
(2019, 1, '1', '2020-05-05 17:28:50.999868'),
(2020, 1, '1', '2020-05-05 17:28:52.274856'),
(2021, 1, '1', '2020-05-05 17:28:54.267195'),
(2022, 1, '1', '2020-05-05 17:28:56.171579'),
(2023, 1, '1', '2020-05-05 17:28:58.224720'),
(2024, 1, '1', '2020-05-05 17:29:00.283399'),
(2025, 1, '1', '2020-05-05 17:29:02.216249'),
(2026, 1, '1', '2020-05-05 17:29:04.823540'),
(2027, 1, '1', '2020-05-05 17:29:07.082212'),
(2028, 1, '1', '2020-05-05 17:29:08.790557'),
(2029, 1, '1', '2020-05-05 17:29:10.514945'),
(2030, 1, '1', '2020-05-05 17:29:14.356672'),
(2031, 1, '1', '2020-05-05 17:29:18.397864'),
(2032, 1, '1', '2020-05-05 17:29:22.489919'),
(2033, 1, '1', '2020-05-05 17:29:28.031100'),
(2034, 1, '1', '2020-05-05 17:29:29.764464'),
(2035, 1, '1', '2020-05-05 17:29:36.535651'),
(2036, 1, '1', '2020-05-05 17:29:37.789555'),
(2037, 1, '1', '2020-05-06 09:50:47.148626'),
(2038, 1, '1', '2020-05-06 09:51:08.482063'),
(2039, 1, '1', '2020-05-06 09:51:26.247641'),
(2040, 1, '1', '2020-05-06 09:51:33.006253'),
(2041, 1, '1', '2020-05-06 09:51:37.339546'),
(2042, 1, '1', '2020-05-06 09:51:41.055342'),
(2043, 1, '1', '2020-05-06 09:51:42.130422'),
(2044, 1, '1', '2020-05-06 09:51:44.097422'),
(2045, 1, '1', '2020-05-06 09:51:46.005564'),
(2046, 1, '1', '2020-05-06 09:51:48.089090'),
(2047, 1, '1', '2020-05-06 09:51:50.080622'),
(2048, 1, '1', '2020-05-06 09:51:52.122706'),
(2049, 1, '1', '2020-05-06 09:51:54.531028'),
(2050, 1, '1', '2020-05-06 09:51:56.129998'),
(2051, 1, '1', '2020-05-06 09:52:00.280686'),
(2052, 1, '1', '2020-05-06 09:52:02.155272'),
(2053, 1, '1', '2020-05-06 09:52:04.121816'),
(2054, 1, '1', '2020-05-06 09:52:06.229746'),
(2055, 1, '1', '2020-05-06 09:52:08.196766'),
(2056, 1, '1', '2020-05-06 09:52:10.097161'),
(2057, 1, '1', '2020-05-06 09:52:12.330057'),
(2058, 1, '1', '2020-05-06 09:52:14.171384'),
(2059, 1, '1', '2020-05-06 09:52:16.171945'),
(2060, 1, '1', '2020-05-06 09:52:18.171428'),
(2061, 1, '1', '2020-05-06 09:52:20.188675'),
(2062, 1, '1', '2020-05-06 09:52:25.186495'),
(2063, 1, '1', '2020-05-06 09:52:29.330385'),
(2064, 1, '1', '2020-05-06 09:52:31.313086'),
(2065, 1, '1', '2020-05-06 09:52:38.287793'),
(2066, 1, '1', '2020-05-06 09:52:39.879877'),
(2067, 1, '1', '2020-05-06 09:52:41.227848'),
(2068, 1, '1', '2020-05-06 09:52:48.312413'),
(2069, 1, '1', '2020-05-06 09:52:49.287385'),
(2070, 1, '1', '2020-05-06 09:52:51.319636'),
(2071, 1, '1', '2020-05-06 09:52:55.660032'),
(2072, 1, '1', '2020-05-06 09:52:57.345827'),
(2073, 1, '1', '2020-05-06 09:52:59.329665'),
(2074, 1, '1', '2020-05-06 09:53:01.520994'),
(2075, 1, '1', '2020-05-06 09:53:03.837658'),
(2076, 1, '1', '2020-05-06 09:53:05.345723'),
(2077, 1, '1', '2020-05-06 09:53:07.343599'),
(2078, 1, '1', '2020-05-06 09:53:09.421179'),
(2079, 1, '1', '2020-05-06 09:53:11.412308'),
(2080, 1, '1', '2020-05-06 09:53:18.514905'),
(2081, 1, '1', '2020-05-06 09:53:19.412067'),
(2082, 1, '1', '2020-05-06 09:53:21.559674'),
(2083, 1, '1', '2020-05-06 09:53:28.601269'),
(2084, 1, '1', '2020-05-06 09:53:29.460015'),
(2085, 1, '1', '2020-05-06 09:53:31.459353'),
(2086, 1, '1', '2020-05-06 09:53:38.509869'),
(2087, 1, '1', '2020-05-06 09:53:41.753554'),
(2088, 1, '1', '2020-05-06 09:53:44.784428'),
(2089, 1, '1', '2020-05-06 09:53:46.553115'),
(2090, 1, '1', '2020-05-06 09:53:48.660780'),
(2091, 1, '1', '2020-05-06 09:53:50.536716'),
(2092, 1, '1', '2020-05-06 09:53:52.545072'),
(2093, 1, '1', '2020-05-06 09:53:54.620245'),
(2094, 1, '1', '2020-05-06 09:53:56.461598'),
(2095, 1, '1', '2020-05-06 09:54:03.591639'),
(2096, 1, '1', '2020-05-06 09:54:06.502725'),
(2097, 1, '1', '2020-05-06 09:54:10.636201'),
(2098, 1, '1', '2020-05-06 09:54:14.878051'),
(2099, 1, '1', '2020-05-06 09:54:15.685789'),
(2100, 1, '1', '2020-05-06 09:54:17.632980'),
(2101, 1, '1', '2020-05-06 09:54:19.782814'),
(2102, 1, '1', '2020-05-06 09:54:21.790993'),
(2103, 1, '1', '2020-05-06 09:54:24.507521'),
(2104, 1, '1', '2020-05-06 09:54:25.707631'),
(2105, 1, '1', '2020-05-06 09:54:27.757925'),
(2106, 1, '1', '2020-05-06 09:54:29.677582'),
(2107, 1, '1', '2020-05-06 09:54:33.906743'),
(2108, 1, '1', '2020-05-06 09:54:36.640934'),
(2109, 1, '1', '2020-05-06 09:54:38.673516'),
(2110, 1, '1', '2020-05-06 09:55:18.609062'),
(2111, 1, '1', '2020-05-06 09:55:19.796570'),
(2112, 1, '1', '2020-05-06 09:55:26.827798'),
(2113, 1, '1', '2020-05-06 09:55:28.027956'),
(2114, 1, '1', '2020-05-06 09:55:29.826066'),
(2115, 1, '1', '2020-05-06 09:56:50.830717'),
(2116, 1, '1', '2020-05-06 09:56:52.309958'),
(2117, 1, '1', '2020-05-06 09:56:58.759524'),
(2118, 1, '1', '2020-05-06 09:57:20.064022'),
(2119, 1, '1', '2020-05-06 09:57:29.100352'),
(2120, 1, '1', '2020-05-06 09:57:41.133346'),
(2121, 1, '1', '2020-05-06 09:57:45.157389'),
(2122, 1, '1', '2020-05-06 09:57:47.215830'),
(2123, 1, '1', '2020-05-06 09:58:08.315522'),
(2124, 1, '1', '2020-05-06 09:58:14.514558'),
(2125, 1, '1', '2020-05-06 09:58:36.130451'),
(2126, 1, '1', '2020-05-06 09:59:11.654407'),
(2127, 1, '1', '2020-05-06 09:59:13.288519'),
(2128, 1, '1', '2020-05-06 09:59:15.329186'),
(2129, 1, '1', '2020-05-06 09:59:19.362615'),
(2130, 1, '1', '2020-05-06 09:59:21.354416'),
(2131, 1, '1', '2020-05-06 09:59:23.420414'),
(2132, 1, '1', '2020-05-06 10:00:44.575137'),
(2133, 1, '1', '2020-05-06 10:00:46.558659'),
(2134, 1, '1', '2020-05-06 10:00:48.634205'),
(2135, 1, '1', '2020-05-06 10:00:58.691959'),
(2136, 1, '1', '2020-05-06 10:01:00.658400'),
(2137, 1, '1', '2020-05-06 10:01:02.641559'),
(2138, 1, '1', '2020-05-06 10:01:17.370244'),
(2139, 1, '1', '2020-05-06 10:01:25.270100'),
(2140, 1, '1', '2020-05-06 10:01:26.274641'),
(2141, 1, '1', '2020-05-06 10:01:32.365368'),
(2142, 1, '1', '2020-05-06 10:01:35.526021'),
(2143, 1, '1', '2020-05-06 10:01:38.840100'),
(2144, 1, '1', '2020-05-06 10:01:42.916112'),
(2145, 1, '1', '2020-05-06 10:01:44.882603'),
(2146, 1, '1', '2020-05-06 10:01:46.881240'),
(2147, 1, '1', '2020-05-06 10:01:51.110003'),
(2148, 1, '1', '2020-05-06 10:01:53.640802'),
(2149, 1, '1', '2020-05-06 10:01:55.832412'),
(2150, 1, '1', '2020-05-06 10:02:01.896924'),
(2151, 1, '1', '2020-05-06 10:02:16.163700'),
(2152, 1, '1', '2020-05-06 10:02:35.206028'),
(2153, 1, '1', '2020-05-06 10:02:40.372641'),
(2154, 1, '1', '2020-05-06 10:02:42.945676'),
(2155, 1, '1', '2020-05-06 10:02:43.995775'),
(2156, 1, '1', '2020-05-06 10:02:56.670489'),
(2157, 1, '1', '2020-05-06 10:02:57.055036'),
(2158, 1, '1', '2020-05-06 10:02:59.081061'),
(2159, 1, '1', '2020-05-06 10:03:07.428394'),
(2160, 1, '1', '2020-05-06 10:03:09.085675'),
(2161, 1, '1', '2020-05-06 10:03:11.072035'),
(2162, 1, '1', '2020-05-06 10:03:17.219807'),
(2163, 1, '1', '2020-05-06 10:03:21.169492'),
(2164, 1, '1', '2020-05-06 10:03:27.777472'),
(2165, 1, '1', '2020-05-06 10:03:36.200203'),
(2166, 1, '1', '2020-05-06 10:03:38.651586'),
(2167, 1, '1', '2020-05-06 10:03:51.320891'),
(2168, 1, '1', '2020-05-06 10:03:59.242759'),
(2169, 1, '1', '2020-05-06 10:04:01.892835'),
(2170, 1, '1', '2020-05-06 10:04:03.396302'),
(2171, 1, '1', '2020-05-06 10:04:07.225336'),
(2172, 1, '1', '2020-05-06 10:04:09.234156'),
(2173, 1, '1', '2020-05-06 10:04:13.295609'),
(2174, 1, '1', '2020-05-06 10:04:17.392065'),
(2175, 1, '1', '2020-05-06 10:04:19.603190'),
(2176, 1, '1', '2020-05-06 10:04:24.341650'),
(2177, 1, '1', '2020-05-06 10:04:33.422888'),
(2178, 1, '1', '2020-05-06 10:04:37.349975'),
(2179, 1, '1', '2020-05-06 10:04:41.395142'),
(2180, 1, '1', '2020-05-06 10:04:47.732420'),
(2181, 1, '1', '2020-05-06 10:04:48.419645'),
(2182, 1, '1', '2020-05-06 10:04:50.478225'),
(2183, 1, '1', '2020-05-06 10:05:02.540971'),
(2184, 1, '1', '2020-05-06 10:05:06.523024'),
(2185, 1, '1', '2020-05-06 10:05:10.689804'),
(2186, 1, '1', '2020-05-06 10:05:24.087146'),
(2187, 1, '1', '2020-05-06 10:05:24.705923'),
(2188, 1, '1', '2020-05-06 10:05:33.989279'),
(2189, 1, '1', '2020-05-06 10:06:16.775782'),
(2190, 1, '1', '2020-05-06 10:06:19.160308'),
(2191, 1, '1', '2020-05-06 10:06:20.911557'),
(2192, 1, '1', '2020-05-06 10:06:28.761705'),
(2193, 1, '1', '2020-05-06 10:06:42.703111'),
(2194, 1, '1', '2020-05-06 10:06:52.969885'),
(2195, 1, '1', '2020-05-06 10:06:56.833153'),
(2196, 1, '1', '2020-05-06 10:07:08.857333'),
(2197, 1, '1', '2020-05-06 10:07:11.057798'),
(2198, 1, '1', '2020-05-06 10:07:14.966073'),
(2199, 1, '1', '2020-05-06 10:07:19.015822'),
(2200, 1, '1', '2020-05-06 10:07:23.085140'),
(2201, 1, '1', '2020-05-06 10:07:25.009156'),
(2202, 1, '1', '2020-05-06 10:07:29.142972'),
(2203, 1, '1', '2020-05-06 10:07:33.000477'),
(2204, 1, '1', '2020-05-06 10:07:41.064759'),
(2205, 1, '1', '2020-05-06 10:07:47.034150'),
(2206, 1, '1', '2020-05-06 10:08:13.183019'),
(2207, 1, '1', '2020-05-06 10:08:20.398908'),
(2208, 1, '1', '2020-05-06 10:08:25.240833'),
(2209, 1, '1', '2020-05-06 10:08:30.290475'),
(2210, 1, '1', '2020-05-06 10:08:44.914502'),
(2211, 1, '1', '2020-05-06 10:08:55.314736'),
(2212, 1, '1', '2020-05-06 10:09:55.495263'),
(2213, 1, '1', '2020-05-06 10:10:11.569877'),
(2214, 1, '1', '2020-05-06 10:10:48.021191'),
(2215, 1, '1', '2020-05-06 10:10:58.860147'),
(2216, 1, '1', '2020-05-06 10:11:25.615823'),
(2217, 1, '1', '2020-05-06 10:11:28.925481'),
(2218, 1, '1', '2020-05-06 10:11:40.035523'),
(2219, 1, '1', '2020-05-06 10:11:42.002031'),
(2220, 1, '1', '2020-05-06 10:12:06.074585'),
(2221, 1, '1', '2020-05-06 10:12:13.042310'),
(2222, 1, '1', '2020-05-06 10:12:17.461564'),
(2223, 1, '1', '2020-05-06 10:12:19.131218'),
(2224, 1, '1', '2020-05-06 10:12:23.058900'),
(2225, 1, '1', '2020-05-06 10:15:05.074510'),
(2226, 1, '1', '2020-05-06 10:15:09.624826'),
(2227, 1, '1', '2020-05-06 10:15:11.366598'),
(2228, 1, '1', '2020-05-06 10:15:22.607791'),
(2229, 1, '1', '2020-05-06 10:15:27.386023'),
(2230, 1, '1', '2020-05-06 10:15:56.684988'),
(2231, 1, '1', '2020-05-06 10:16:01.514290'),
(2232, 1, '1', '2020-05-06 10:16:31.362915'),
(2233, 1, '1', '2020-05-06 10:16:34.854648'),
(2234, 1, '1', '2020-05-06 10:16:48.887218'),
(2235, 1, '1', '2020-05-06 10:16:57.191103'),
(2236, 1, '1', '2020-05-06 10:17:14.283049'),
(2237, 1, '1', '2020-05-06 10:17:21.208386'),
(2238, 1, '1', '2020-05-06 10:17:26.443902'),
(2239, 1, '1', '2020-05-06 10:17:29.027433'),
(2240, 1, '1', '2020-05-06 10:17:38.010652'),
(2241, 1, '1', '2020-05-06 10:17:43.952426'),
(2242, 1, '1', '2020-05-06 10:17:48.063015'),
(2243, 1, '1', '2020-05-06 10:18:00.108987'),
(2244, 1, '1', '2020-05-06 10:18:02.075881'),
(2245, 1, '1', '2020-05-06 10:18:09.976281'),
(2246, 1, '1', '2020-05-06 10:18:11.981419'),
(2247, 1, '1', '2020-05-06 10:18:22.134073'),
(2248, 1, '1', '2020-05-06 10:18:28.108870'),
(2249, 1, '1', '2020-05-06 10:18:34.141949'),
(2250, 1, '1', '2020-05-06 10:18:38.150076'),
(2251, 1, '1', '2020-05-06 10:18:48.166913'),
(2252, 1, '1', '2020-05-06 10:18:52.248538'),
(2253, 1, '1', '2020-05-06 10:18:58.498932'),
(2254, 1, '1', '2020-05-06 10:19:00.223287'),
(2255, 1, '1', '2020-05-06 10:19:04.272870'),
(2256, 1, '1', '2020-05-06 10:19:06.199034'),
(2257, 1, '1', '2020-05-06 10:19:14.381583'),
(2258, 1, '1', '2020-05-06 10:19:18.389940'),
(2259, 1, '1', '2020-05-06 10:19:26.414652'),
(2260, 1, '1', '2020-05-06 10:19:30.305122'),
(2261, 1, '1', '2020-05-06 10:19:36.589120'),
(2262, 1, '1', '2020-05-06 10:19:38.439551'),
(2263, 1, '1', '2020-05-06 10:19:40.505571'),
(2264, 1, '1', '2020-05-06 10:19:44.605478'),
(2265, 1, '1', '2020-05-06 10:19:46.681201'),
(2266, 1, '1', '2020-05-06 10:19:56.489121'),
(2267, 1, '1', '2020-05-06 10:20:00.537947'),
(2268, 1, '1', '2020-05-06 10:20:06.638534'),
(2269, 1, '1', '2020-05-06 10:20:13.629763'),
(2270, 1, '1', '2020-05-06 10:20:16.520463'),
(2271, 1, '1', '2020-05-06 10:20:23.654058'),
(2272, 1, '1', '2020-05-06 10:20:29.687555'),
(2273, 1, '1', '2020-05-06 10:20:34.129236'),
(2274, 1, '1', '2020-05-06 10:20:39.762072'),
(2275, 1, '1', '2020-05-06 10:20:42.309959'),
(2276, 1, '1', '2020-05-06 10:20:47.719988'),
(2277, 1, '1', '2020-05-06 10:20:49.737004'),
(2278, 1, '1', '2020-05-06 10:20:53.686040'),
(2279, 1, '1', '2020-05-06 10:20:55.811080'),
(2280, 1, '1', '2020-05-06 10:21:00.519925'),
(2281, 1, '1', '2020-05-06 10:21:01.945038'),
(2282, 1, '1', '2020-05-06 10:21:03.920055'),
(2283, 1, '1', '2020-05-06 10:21:16.602935'),
(2284, 1, '1', '2020-05-06 10:21:20.034967'),
(2285, 1, '1', '2020-05-06 10:21:25.960932'),
(2286, 1, '1', '2020-05-06 10:21:28.018518'),
(2287, 1, '1', '2020-05-06 10:21:31.927519'),
(2288, 1, '1', '2020-05-06 10:21:35.978010'),
(2289, 1, '1', '2020-05-06 10:21:42.202774'),
(2290, 1, '1', '2020-05-06 10:21:46.076143'),
(2291, 1, '1', '2020-05-06 10:22:02.617856'),
(2292, 1, '1', '2020-05-06 10:22:06.093293'),
(2293, 1, '1', '2020-05-06 10:22:08.024682');
INSERT INTO `strata_sensor_data` (`id`, `sensor_id`, `sensor_value`, `created_date`) VALUES
(2294, 1, '1', '2020-05-06 10:22:10.203817'),
(2295, 1, '1', '2020-05-06 10:22:12.191988'),
(2296, 1, '1', '2020-05-06 10:22:15.475188'),
(2297, 1, '1', '2020-05-06 10:22:17.049860'),
(2298, 1, '1', '2020-05-06 10:22:19.149847'),
(2299, 1, '1', '2020-05-06 10:22:21.136034'),
(2300, 1, '1', '2020-05-06 10:22:28.124600'),
(2301, 1, '1', '2020-05-06 10:22:31.152222'),
(2302, 1, '1', '2020-05-06 10:22:35.290664'),
(2303, 1, '1', '2020-05-06 10:22:39.223808'),
(2304, 1, '1', '2020-05-06 10:22:46.290136'),
(2305, 1, '1', '2020-05-06 10:22:47.297924'),
(2306, 1, '1', '2020-05-06 10:22:49.189819'),
(2307, 1, '1', '2020-05-06 10:22:51.190484'),
(2308, 1, '1', '2020-05-06 10:22:58.314632'),
(2309, 1, '1', '2020-05-06 10:23:02.373063'),
(2310, 1, '1', '2020-05-06 10:23:06.380648'),
(2311, 1, '1', '2020-05-06 10:23:15.330921'),
(2312, 1, '1', '2020-05-06 10:23:17.264321'),
(2313, 1, '1', '2020-05-06 10:23:24.388727'),
(2314, 1, '1', '2020-05-06 10:23:25.371415'),
(2315, 1, '1', '2020-05-06 10:23:27.414388'),
(2316, 1, '1', '2020-05-06 10:23:31.446913'),
(2317, 1, '1', '2020-05-06 10:23:40.363941'),
(2318, 1, '1', '2020-05-06 10:23:43.447121'),
(2319, 1, '1', '2020-05-06 10:23:50.430184'),
(2320, 1, '1', '2020-05-06 10:23:51.737870'),
(2321, 1, '1', '2020-05-06 10:23:58.646912'),
(2322, 1, '1', '2020-05-06 10:23:59.645617'),
(2323, 1, '1', '2020-05-06 10:24:06.555941'),
(2324, 1, '1', '2020-05-06 10:24:09.505921'),
(2325, 1, '1', '2020-05-06 10:24:18.654945'),
(2326, 1, '1', '2020-05-06 10:24:19.794498'),
(2327, 1, '1', '2020-05-06 10:24:26.636110'),
(2328, 1, '1', '2020-05-06 10:24:27.686231'),
(2329, 1, '1', '2020-05-06 10:24:29.609848'),
(2330, 1, '1', '2020-05-06 10:24:31.577505'),
(2331, 1, '1', '2020-05-06 10:24:33.947233'),
(2332, 1, '1', '2020-05-06 10:24:38.722813'),
(2333, 1, '1', '2020-05-06 10:24:39.911046'),
(2334, 1, '1', '2020-05-06 10:24:41.594035'),
(2335, 1, '1', '2020-05-06 10:24:48.668853'),
(2336, 1, '1', '2020-05-06 10:24:49.617846'),
(2337, 1, '1', '2020-05-06 10:24:56.884680'),
(2338, 1, '1', '2020-05-06 10:24:58.054894'),
(2339, 1, '1', '2020-05-06 10:25:01.718050'),
(2340, 1, '1', '2020-05-06 10:25:09.234183'),
(2341, 1, '1', '2020-05-06 10:25:09.717877'),
(2342, 1, '1', '2020-05-06 10:25:11.685116'),
(2343, 1, '1', '2020-05-06 10:25:18.670972'),
(2344, 1, '1', '2020-05-06 10:25:19.726037'),
(2345, 1, '1', '2020-05-06 10:25:26.742097'),
(2346, 1, '1', '2020-05-06 10:25:27.854060'),
(2347, 1, '1', '2020-05-06 10:25:29.850890'),
(2348, 1, '1', '2020-05-06 10:25:31.704170'),
(2349, 1, '1', '2020-05-06 10:25:38.832852'),
(2350, 1, '1', '2020-05-06 10:25:42.824440'),
(2351, 1, '1', '2020-05-06 10:25:46.903993'),
(2352, 1, '1', '2020-05-06 10:25:49.022475'),
(2353, 1, '1', '2020-05-06 10:25:55.891348'),
(2354, 1, '1', '2020-05-06 10:25:56.799269'),
(2355, 1, '1', '2020-05-06 10:25:58.861669'),
(2356, 1, '1', '2020-05-06 10:26:01.028920'),
(2357, 1, '1', '2020-05-06 10:26:07.906350'),
(2358, 1, '1', '2020-05-06 10:26:08.849088'),
(2359, 1, '1', '2020-05-06 10:26:11.344913'),
(2360, 1, '1', '2020-05-06 10:26:13.198572'),
(2361, 1, '1', '2020-05-06 10:26:14.990051'),
(2362, 1, '1', '2020-05-06 10:26:16.929774'),
(2363, 1, '1', '2020-05-06 10:26:18.969952'),
(2364, 1, '1', '2020-05-06 10:26:21.156412'),
(2365, 1, '1', '2020-05-06 10:26:28.073522'),
(2366, 1, '1', '2020-05-06 10:26:29.115443'),
(2367, 1, '1', '2020-05-06 10:26:30.989919'),
(2368, 1, '1', '2020-05-06 10:26:38.117866'),
(2369, 1, '1', '2020-05-06 10:26:39.213612'),
(2370, 1, '1', '2020-05-06 10:26:46.087269'),
(2371, 1, '1', '2020-05-06 10:26:47.055400'),
(2372, 1, '1', '2020-05-06 10:26:49.213884'),
(2373, 1, '1', '2020-05-06 10:26:53.230723'),
(2374, 1, '1', '2020-05-06 10:26:57.147556'),
(2375, 1, '1', '2020-05-06 10:27:01.301788'),
(2376, 1, '1', '2020-05-06 10:27:08.196669'),
(2377, 1, '1', '2020-05-06 10:27:09.229938'),
(2378, 1, '1', '2020-05-06 10:27:16.196535'),
(2379, 1, '1', '2020-05-06 10:27:17.219308'),
(2380, 1, '1', '2020-05-06 10:27:19.329062'),
(2381, 1, '1', '2020-05-06 10:27:23.387816'),
(2382, 1, '1', '2020-05-06 10:27:25.193344'),
(2383, 1, '1', '2020-05-06 10:27:27.287704'),
(2384, 1, '1', '2020-05-06 10:27:29.237296'),
(2385, 1, '1', '2020-05-06 10:27:35.187166'),
(2386, 1, '1', '2020-05-06 10:27:41.245106'),
(2387, 1, '1', '2020-05-06 10:27:48.469217'),
(2388, 1, '1', '2020-05-06 10:27:49.395137'),
(2389, 1, '1', '2020-05-06 10:27:56.453967'),
(2390, 1, '1', '2020-05-06 10:27:57.303268'),
(2391, 1, '1', '2020-05-06 10:28:03.659678'),
(2392, 1, '1', '2020-05-06 10:28:11.343600'),
(2393, 1, '1', '2020-05-06 10:28:17.543481'),
(2394, 1, '1', '2020-05-06 10:28:24.468790'),
(2395, 1, '1', '2020-05-06 10:28:25.493656'),
(2396, 1, '1', '2020-05-06 10:28:27.468275'),
(2397, 1, '1', '2020-05-06 10:28:29.510042'),
(2398, 1, '1', '2020-05-06 10:28:33.410400'),
(2399, 1, '1', '2020-05-06 10:28:39.584749'),
(2400, 1, '1', '2020-05-06 10:28:45.534884'),
(2401, 1, '1', '2020-05-06 10:28:51.625440'),
(2402, 1, '1', '2020-05-06 10:29:00.647392'),
(2403, 1, '1', '2020-05-06 10:29:03.592269'),
(2404, 1, '1', '2020-05-06 10:29:07.753307'),
(2405, 1, '1', '2020-05-06 10:29:09.683410'),
(2406, 1, '1', '2020-05-06 10:29:12.009111'),
(2407, 1, '1', '2020-05-06 10:29:18.699556'),
(2408, 1, '1', '2020-05-06 10:29:21.649587'),
(2409, 1, '1', '2020-05-06 10:29:27.665956'),
(2410, 1, '1', '2020-05-06 10:29:31.849780'),
(2411, 1, '1', '2020-05-06 10:29:35.890859'),
(2412, 1, '1', '2020-05-06 10:29:37.957069'),
(2413, 1, '1', '2020-05-06 10:29:39.705411'),
(2414, 1, '1', '2020-05-06 10:29:42.065825'),
(2415, 1, '1', '2020-05-06 10:29:48.824088'),
(2416, 1, '1', '2020-05-06 10:29:51.839753'),
(2417, 1, '1', '2020-05-06 10:29:59.931115'),
(2418, 1, '1', '2020-05-06 10:30:03.872922'),
(2419, 1, '1', '2020-05-06 10:30:05.914576'),
(2420, 1, '1', '2020-05-06 10:30:07.905867'),
(2421, 1, '1', '2020-05-06 10:30:09.881897'),
(2422, 1, '1', '2020-05-06 10:30:12.031785'),
(2423, 1, '1', '2020-05-06 10:30:16.039296'),
(2424, 1, '1', '2020-05-06 10:30:20.006547'),
(2425, 1, '1', '2020-05-06 10:30:24.079932'),
(2426, 1, '1', '2020-05-06 10:30:31.714470'),
(2427, 1, '1', '2020-05-06 10:30:37.073406'),
(2428, 1, '1', '2020-05-06 10:30:44.322958'),
(2429, 1, '1', '2020-05-06 10:30:45.997644'),
(2430, 1, '1', '2020-05-06 10:30:47.172797'),
(2431, 1, '1', '2020-05-06 10:30:49.189722'),
(2432, 1, '1', '2020-05-06 10:30:51.129816'),
(2433, 1, '1', '2020-05-06 10:30:58.111053'),
(2434, 1, '1', '2020-05-06 10:31:04.121246'),
(2435, 1, '1', '2020-05-06 10:31:13.496916'),
(2436, 1, '1', '2020-05-06 10:31:16.488662'),
(2437, 1, '1', '2020-05-06 10:31:22.177667'),
(2438, 1, '1', '2020-05-06 10:31:28.254794'),
(2439, 1, '1', '2020-05-06 10:31:36.496761'),
(2440, 1, '1', '2020-05-06 10:31:44.296991'),
(2441, 1, '1', '2020-05-06 10:31:53.276942'),
(2442, 1, '1', '2020-05-06 10:32:04.371490'),
(2443, 1, '1', '2020-05-06 10:32:15.500704'),
(2444, 1, '1', '2020-05-06 10:32:25.679937'),
(2445, 1, '1', '2020-05-06 10:32:29.712557'),
(2446, 1, '1', '2020-05-06 10:32:31.467717'),
(2447, 1, '1', '2020-05-06 10:32:38.475445'),
(2448, 1, '1', '2020-05-06 10:32:41.541685'),
(2449, 1, '1', '2020-05-06 10:32:45.641376'),
(2450, 1, '1', '2020-05-06 10:32:47.629438'),
(2451, 1, '1', '2020-05-06 10:32:51.604259'),
(2452, 1, '1', '2020-05-06 10:32:56.553988'),
(2453, 1, '1', '2020-05-06 10:33:00.661697'),
(2454, 1, '1', '2020-05-06 10:33:04.620962'),
(2455, 1, '1', '2020-05-06 10:33:13.715907'),
(2456, 1, '1', '2020-05-06 10:33:15.670405'),
(2457, 1, '1', '2020-05-06 10:33:22.714835'),
(2458, 1, '1', '2020-05-06 10:33:25.930727'),
(2459, 1, '1', '2020-05-06 10:33:29.889576'),
(2460, 1, '1', '2020-05-06 10:33:36.288038'),
(2461, 1, '1', '2020-05-06 10:33:41.755619'),
(2462, 1, '1', '2020-05-06 10:33:45.039378'),
(2463, 1, '1', '2020-05-06 10:33:57.238180'),
(2464, 1, '1', '2020-05-06 10:34:02.897076'),
(2465, 1, '1', '2020-05-06 10:34:03.929696'),
(2466, 1, '1', '2020-05-06 10:34:07.905244'),
(2467, 1, '1', '2020-05-06 10:34:14.396138'),
(2468, 1, '1', '2020-05-06 10:34:28.737571'),
(2469, 1, '1', '2020-05-06 10:34:31.044701'),
(2470, 1, '1', '2020-05-06 10:34:38.037647'),
(2471, 1, '1', '2020-05-06 10:34:42.976727'),
(2472, 1, '1', '2020-05-06 10:34:44.961871'),
(2473, 1, '1', '2020-05-06 10:34:48.969658'),
(2474, 1, '1', '2020-05-06 10:34:56.028503'),
(2475, 1, '1', '2020-05-06 10:34:57.178367'),
(2476, 1, '1', '2020-05-06 10:34:58.969556'),
(2477, 1, '1', '2020-05-06 10:35:01.161203'),
(2478, 1, '1', '2020-05-06 10:35:08.110981'),
(2479, 1, '1', '2020-05-06 10:35:11.036067'),
(2480, 1, '1', '2020-05-06 10:35:17.210935'),
(2481, 1, '1', '2020-05-06 10:35:24.227062'),
(2482, 1, '1', '2020-05-06 10:35:27.575527'),
(2483, 1, '1', '2020-05-06 10:35:33.110511'),
(2484, 1, '1', '2020-05-06 10:35:36.751638'),
(2485, 1, '1', '2020-05-06 10:35:39.750340'),
(2486, 1, '1', '2020-05-06 10:35:43.434288'),
(2487, 1, '1', '2020-05-06 10:35:49.309294'),
(2488, 1, '1', '2020-05-06 10:35:55.258975'),
(2489, 1, '1', '2020-05-06 10:36:02.325299'),
(2490, 1, '1', '2020-05-06 10:36:03.249677'),
(2491, 1, '1', '2020-05-06 10:36:05.299866'),
(2492, 1, '1', '2020-05-06 10:36:09.591957'),
(2493, 1, '1', '2020-05-06 10:36:15.392368'),
(2494, 1, '1', '2020-05-06 10:36:22.016838'),
(2495, 1, '1', '2020-05-06 10:36:25.841605'),
(2496, 1, '1', '2020-05-06 10:36:27.552104'),
(2497, 1, '1', '2020-05-06 10:36:29.417013'),
(2498, 1, '1', '2020-05-06 10:36:31.407896'),
(2499, 1, '1', '2020-05-06 10:36:38.399168'),
(2500, 1, '1', '2020-05-06 10:36:44.124212'),
(2501, 1, '1', '2020-05-06 10:36:48.423566'),
(2502, 1, '1', '2020-05-06 10:36:53.489823'),
(2503, 1, '1', '2020-05-06 10:36:57.565528'),
(2504, 1, '1', '2020-05-06 10:37:03.557633'),
(2505, 1, '1', '2020-05-06 10:37:05.606753'),
(2506, 1, '1', '2020-05-06 10:37:14.989252'),
(2507, 1, '1', '2020-05-06 10:37:20.672640'),
(2508, 1, '1', '2020-05-06 10:37:25.630713'),
(2509, 1, '1', '2020-05-06 10:37:33.771872'),
(2510, 1, '1', '2020-05-06 10:37:37.705872'),
(2511, 1, '1', '2020-05-06 10:37:41.838974'),
(2512, 1, '1', '2020-05-06 10:37:48.704429'),
(2513, 1, '1', '2020-05-06 10:37:49.721649'),
(2514, 1, '1', '2020-05-06 10:37:56.846498'),
(2515, 1, '1', '2020-05-06 10:38:01.770414'),
(2516, 1, '1', '2020-05-06 10:38:05.888608'),
(2517, 1, '1', '2020-05-06 10:38:09.906128'),
(2518, 1, '1', '2020-05-06 10:38:18.840039'),
(2519, 1, '1', '2020-05-06 10:38:19.861368'),
(2520, 1, '1', '2020-05-06 10:38:24.102506'),
(2521, 1, '1', '2020-05-06 10:38:30.961171'),
(2522, 1, '1', '2020-05-06 10:38:32.879514'),
(2523, 1, '1', '2020-05-06 10:38:36.871426'),
(2524, 1, '1', '2020-05-06 10:38:41.116511'),
(2525, 1, '1', '2020-05-06 10:38:45.002495'),
(2526, 1, '1', '2020-05-06 10:38:48.945819'),
(2527, 1, '1', '2020-05-06 10:38:52.961053'),
(2528, 1, '1', '2020-05-06 10:38:54.970337'),
(2529, 1, '1', '2020-05-06 10:38:57.276981'),
(2530, 1, '1', '2020-05-06 10:38:59.268859'),
(2531, 1, '1', '2020-05-06 10:39:00.995828'),
(2532, 1, '1', '2020-05-06 10:39:05.088244'),
(2533, 1, '1', '2020-05-06 10:39:13.167512'),
(2534, 1, '1', '2020-05-06 10:39:20.242710'),
(2535, 1, '1', '2020-05-06 10:39:23.844854'),
(2536, 1, '1', '2020-05-06 10:39:26.134004'),
(2537, 1, '1', '2020-05-06 10:39:35.408749'),
(2538, 1, '1', '2020-05-06 10:39:40.839913'),
(2539, 1, '1', '2020-05-06 10:39:44.141729'),
(2540, 1, '1', '2020-05-06 10:39:53.452584'),
(2541, 1, '1', '2020-05-06 10:39:54.217006'),
(2542, 1, '1', '2020-05-06 10:40:01.178056'),
(2543, 1, '1', '2020-05-06 10:40:06.335036'),
(2544, 1, '1', '2020-05-06 10:40:12.249744'),
(2545, 1, '1', '2020-05-06 10:40:21.332223'),
(2546, 1, '1', '2020-05-06 10:40:25.473260'),
(2547, 1, '1', '2020-05-06 10:40:31.665400'),
(2548, 1, '1', '2020-05-06 10:40:42.010800'),
(2549, 1, '1', '2020-05-06 10:40:50.413969'),
(2550, 1, '1', '2020-05-06 10:40:53.497477'),
(2551, 1, '1', '2020-05-06 10:40:59.487979'),
(2552, 1, '1', '2020-05-06 10:41:08.630248'),
(2553, 1, '1', '2020-05-06 10:41:09.563166'),
(2554, 1, '1', '2020-05-06 10:41:16.654586'),
(2555, 1, '1', '2020-05-06 10:41:17.580453'),
(2556, 1, '1', '2020-05-06 10:41:19.588539'),
(2557, 1, '1', '2020-05-06 10:41:21.579620'),
(2558, 1, '1', '2020-05-06 10:41:28.645258'),
(2559, 1, '1', '2020-05-06 10:41:33.729079'),
(2560, 1, '1', '2020-05-06 10:41:41.745748'),
(2561, 1, '1', '2020-05-06 10:41:49.711854'),
(2562, 1, '1', '2020-05-06 10:41:57.778050'),
(2563, 1, '1', '2020-05-06 10:42:03.853324'),
(2564, 1, '1', '2020-05-06 10:42:13.969199'),
(2565, 1, '1', '2020-05-06 10:42:21.943102'),
(2566, 1, '1', '2020-05-06 10:42:27.911040'),
(2567, 1, '1', '2020-05-06 10:42:33.943657'),
(2568, 1, '1', '2020-05-06 10:42:45.226446'),
(2569, 1, '1', '2020-05-06 10:42:53.384332'),
(2570, 1, '1', '2020-05-06 10:42:56.018508'),
(2571, 1, '1', '2020-05-06 10:42:58.308658'),
(2572, 1, '1', '2020-05-06 10:43:02.066942'),
(2573, 1, '1', '2020-05-06 10:43:06.982960'),
(2574, 1, '1', '2020-05-06 10:43:13.133502'),
(2575, 1, '1', '2020-05-06 10:43:19.066826'),
(2576, 1, '1', '2020-05-06 10:43:28.116552'),
(2577, 1, '1', '2020-05-06 10:43:31.191217'),
(2578, 1, '1', '2020-05-06 10:43:35.199659'),
(2579, 1, '1', '2020-05-06 10:43:39.223769'),
(2580, 1, '1', '2020-05-06 10:43:45.423917'),
(2581, 1, '1', '2020-05-06 10:44:01.648281'),
(2582, 1, '1', '2020-05-06 10:44:11.380735'),
(2583, 1, '1', '2020-05-06 10:44:26.421816'),
(2584, 1, '1', '2020-05-06 10:44:37.472251'),
(2585, 1, '1', '2020-05-06 10:44:50.538179'),
(2586, 1, '1', '2020-05-06 10:44:54.588278'),
(2587, 1, '1', '2020-05-06 10:45:01.571724'),
(2588, 1, '1', '2020-05-06 10:45:08.587984'),
(2589, 1, '1', '2020-05-06 10:45:13.562199'),
(2590, 1, '1', '2020-05-06 10:45:18.430249'),
(2591, 1, '1', '2020-05-06 10:45:25.720091'),
(2592, 1, '1', '2020-05-06 10:45:27.745458'),
(2593, 1, '1', '2020-05-06 10:45:33.803890'),
(2594, 1, '1', '2020-05-06 10:45:37.649561'),
(2595, 1, '1', '2020-05-06 10:45:40.669898'),
(2596, 1, '1', '2020-05-06 10:45:42.857414'),
(2597, 1, '1', '2020-05-06 10:45:44.678897'),
(2598, 1, '1', '2020-05-06 10:45:54.811858'),
(2599, 1, '1', '2020-05-06 10:46:00.828837'),
(2600, 1, '1', '2020-05-06 10:46:08.878394'),
(2601, 1, '1', '2020-05-06 10:46:09.901043'),
(2602, 1, '1', '2020-05-06 10:46:13.828494'),
(2603, 1, '1', '2020-05-06 10:46:18.853204'),
(2604, 1, '1', '2020-05-06 10:46:24.951046'),
(2605, 1, '1', '2020-05-06 10:46:28.969909'),
(2606, 1, '1', '2020-05-06 10:46:39.308148'),
(2607, 1, '1', '2020-05-06 10:46:39.917956'),
(2608, 1, '1', '2020-05-06 10:46:46.994534'),
(2609, 1, '1', '2020-05-06 10:46:48.969283'),
(2610, 1, '1', '2020-05-06 10:46:52.950265'),
(2611, 1, '1', '2020-05-06 10:46:55.083542'),
(2612, 1, '1', '2020-05-06 10:47:05.082091'),
(2613, 1, '1', '2020-05-06 10:47:11.073876'),
(2614, 1, '1', '2020-05-06 10:47:22.052308'),
(2615, 1, '1', '2020-05-06 10:47:28.115621'),
(2616, 1, '1', '2020-05-06 10:47:44.298278'),
(2617, 1, '1', '2020-05-06 10:47:54.289778'),
(2618, 1, '1', '2020-05-06 10:48:08.314321'),
(2619, 1, '1', '2020-05-06 10:48:20.154963'),
(2620, 1, '1', '2020-05-06 10:48:34.504180'),
(2621, 1, '1', '2020-05-06 10:49:02.424634'),
(2622, 1, '1', '2020-05-06 10:49:05.603151'),
(2623, 1, '1', '2020-05-06 10:49:07.637011'),
(2624, 1, '1', '2020-05-06 10:49:11.944601'),
(2625, 1, '1', '2020-05-06 10:49:20.677820'),
(2626, 1, '1', '2020-05-06 10:49:33.100160'),
(2627, 1, '1', '2020-05-06 10:50:05.625816'),
(2628, 1, '1', '2020-05-06 10:50:13.467045'),
(2629, 1, '1', '2020-05-06 10:50:29.907342'),
(2630, 1, '1', '2020-05-06 10:50:31.958477'),
(2631, 1, '1', '2020-05-06 10:50:35.916622'),
(2632, 1, '1', '2020-05-06 10:50:37.922654'),
(2633, 1, '1', '2020-05-06 10:50:41.924212'),
(2634, 1, '1', '2020-05-06 10:50:46.040809'),
(2635, 1, '1', '2020-05-06 10:51:28.164479'),
(2636, 1, '1', '2020-05-06 10:51:43.086809'),
(2637, 1, '1', '2020-05-06 10:51:48.321241'),
(2638, 1, '1', '2020-05-06 10:52:00.465679'),
(2639, 1, '1', '2020-05-06 10:52:08.312405'),
(2640, 1, '1', '2020-05-06 10:52:24.695601'),
(2641, 1, '1', '2020-05-06 10:52:33.386986'),
(2642, 1, '1', '2020-05-06 10:52:56.843969'),
(2643, 1, '1', '2020-05-06 10:53:03.552681'),
(2644, 1, '1', '2020-05-06 10:53:17.635661'),
(2645, 1, '1', '2020-05-06 10:53:20.776740'),
(2646, 1, '1', '2020-05-06 10:53:32.659817'),
(2647, 1, '1', '2020-05-06 10:53:35.726898'),
(2648, 1, '1', '2020-05-06 10:53:49.735890'),
(2649, 1, '1', '2020-05-06 10:53:58.676187'),
(2650, 1, '1', '2020-05-06 10:54:22.800712'),
(2651, 1, '1', '2020-05-06 10:54:26.749594'),
(2652, 1, '1', '2020-05-06 10:54:33.892412'),
(2653, 1, '1', '2020-05-06 10:54:38.806907'),
(2654, 1, '1', '2020-05-06 10:54:43.433622'),
(2655, 1, '1', '2020-05-06 10:54:45.831792'),
(2656, 1, '1', '2020-05-06 10:54:55.164646'),
(2657, 1, '1', '2020-05-06 10:55:12.655921'),
(2658, 1, '1', '2020-05-06 10:55:43.578942'),
(2659, 1, '1', '2020-05-06 10:55:52.597335'),
(2660, 1, '1', '2020-05-06 10:56:05.419881'),
(2661, 1, '1', '2020-05-06 10:56:10.612139'),
(2662, 1, '1', '2020-05-06 10:56:18.153192'),
(2663, 1, '1', '2020-05-06 10:56:39.735439'),
(2664, 1, '1', '2020-05-06 10:56:56.367847'),
(2665, 1, '1', '2020-05-06 10:57:09.549866'),
(2666, 1, '1', '2020-05-06 10:57:15.366855'),
(2667, 1, '1', '2020-05-06 10:57:25.383683'),
(2668, 1, '1', '2020-05-06 10:57:32.033642'),
(2669, 1, '1', '2020-05-06 10:57:36.556228'),
(2670, 1, '1', '2020-05-06 10:57:43.487319'),
(2671, 1, '1', '2020-05-06 10:57:56.578651'),
(2672, 1, '1', '2020-05-06 10:58:00.615886'),
(2673, 1, '1', '2020-05-06 10:58:12.565712'),
(2674, 1, '1', '2020-05-06 10:58:18.773965'),
(2675, 1, '1', '2020-05-06 10:58:22.773712'),
(2676, 1, '1', '2020-05-06 10:58:24.698934'),
(2677, 1, '1', '2020-05-06 10:58:42.889771'),
(2678, 1, '1', '2020-05-06 10:58:56.798156'),
(2679, 1, '1', '2020-05-06 10:59:01.822835'),
(2680, 1, '1', '2020-05-06 10:59:04.289279'),
(2681, 1, '1', '2020-05-06 10:59:19.122426'),
(2682, 1, '1', '2020-05-06 10:59:24.414094'),
(2683, 1, '1', '2020-05-06 10:59:30.039250'),
(2684, 1, '1', '2020-05-06 10:59:32.928369'),
(2685, 1, '1', '2020-05-06 10:59:54.805105'),
(2686, 1, '1', '2020-05-06 10:59:57.086398'),
(2687, 1, '1', '2020-05-06 11:00:03.060988'),
(2688, 1, '1', '2020-05-06 11:00:05.110448'),
(2689, 1, '1', '2020-05-06 11:00:09.137937'),
(2690, 1, '1', '2020-05-06 11:00:16.071219'),
(2691, 1, '1', '2020-05-06 11:00:26.154773'),
(2692, 1, '1', '2020-05-06 11:00:30.113125'),
(2693, 1, '1', '2020-05-06 11:00:34.171073'),
(2694, 1, '1', '2020-05-06 11:00:36.200935'),
(2695, 1, '1', '2020-05-06 11:00:42.426459'),
(2696, 1, '1', '2020-05-06 11:00:44.246153'),
(2697, 1, '1', '2020-05-06 11:00:53.250290'),
(2698, 1, '1', '2020-05-06 11:00:56.375601'),
(2699, 1, '1', '2020-05-06 11:01:09.425190'),
(2700, 1, '1', '2020-05-06 11:01:11.530559'),
(2701, 1, '1', '2020-05-06 11:01:19.582672'),
(2702, 1, '1', '2020-05-06 11:01:22.449263'),
(2703, 1, '1', '2020-05-06 11:01:26.452583'),
(2704, 1, '1', '2020-05-06 11:01:47.881845'),
(2705, 1, '1', '2020-05-06 11:01:58.102444'),
(2706, 1, '1', '2020-05-06 11:02:01.631202'),
(2707, 1, '1', '2020-05-06 11:02:05.631246'),
(2708, 1, '1', '2020-05-06 11:02:07.598086'),
(2709, 1, '1', '2020-05-06 11:02:09.648113'),
(2710, 1, '1', '2020-05-06 11:02:22.558419'),
(2711, 1, '1', '2020-05-06 11:02:33.930043'),
(2712, 1, '1', '2020-05-06 11:02:41.967954'),
(2713, 1, '1', '2020-05-06 11:02:50.023377'),
(2714, 1, '1', '2020-05-06 11:02:59.978715'),
(2715, 1, '1', '2020-05-06 11:03:03.044877'),
(2716, 1, '1', '2020-05-06 11:03:15.419642'),
(2717, 1, '1', '2020-05-06 11:03:23.060749'),
(2718, 1, '1', '2020-05-06 11:03:48.318557'),
(2719, 1, '1', '2020-05-06 11:03:56.993189'),
(2720, 1, '1', '2020-05-06 11:04:08.234234'),
(2721, 1, '1', '2020-05-06 11:04:18.266970'),
(2722, 1, '1', '2020-05-06 11:04:38.673236'),
(2723, 1, '1', '2020-05-06 11:04:47.149713'),
(2724, 1, '1', '2020-05-06 11:05:15.173642'),
(2725, 1, '1', '2020-05-06 11:05:25.206554'),
(2726, 1, '1', '2020-05-06 11:05:29.309024'),
(2727, 1, '1', '2020-05-06 11:05:31.498189'),
(2728, 1, '1', '2020-05-06 11:05:42.747598'),
(2729, 1, '1', '2020-05-06 11:05:48.797708'),
(2730, 1, '1', '2020-05-06 11:06:43.171275'),
(2731, 1, '1', '2020-05-06 11:06:50.202809'),
(2732, 1, '1', '2020-05-06 11:06:59.704333'),
(2733, 1, '1', '2020-05-06 11:07:39.450945'),
(2734, 1, '1', '2020-05-06 11:07:41.327640'),
(2735, 1, '1', '2020-05-06 11:07:43.343003'),
(2736, 1, '1', '2020-05-06 11:07:53.410772'),
(2737, 1, '1', '2020-05-06 11:07:57.558258'),
(2738, 1, '1', '2020-05-06 11:08:01.602021'),
(2739, 1, '1', '2020-05-06 11:08:11.792807'),
(2740, 1, '1', '2020-05-06 11:08:19.848925'),
(2741, 1, '1', '2020-05-06 11:08:26.029750'),
(2742, 1, '1', '2020-05-06 11:08:32.134940'),
(2743, 1, '1', '2020-05-06 11:08:34.109726'),
(2744, 1, '1', '2020-05-06 11:08:36.384719'),
(2745, 1, '1', '2020-05-06 11:08:42.176320'),
(2746, 1, '1', '2020-05-06 11:08:44.206976'),
(2747, 1, '1', '2020-05-06 11:08:48.309382'),
(2748, 1, '1', '2020-05-06 11:09:07.805869'),
(2749, 1, '1', '2020-05-06 11:09:12.805911'),
(2750, 1, '1', '2020-05-06 11:09:16.921878'),
(2751, 1, '1', '2020-05-06 11:09:24.438628'),
(2752, 1, '1', '2020-05-06 11:09:26.263382'),
(2753, 1, '1', '2020-05-06 11:09:30.055156'),
(2754, 1, '1', '2020-05-06 11:09:44.041565'),
(2755, 1, '1', '2020-05-06 11:09:47.645763'),
(2756, 1, '1', '2020-05-06 11:10:05.174249'),
(2757, 1, '1', '2020-05-06 11:10:08.603914'),
(2758, 1, '1', '2020-05-06 11:10:10.707871'),
(2759, 1, '1', '2020-05-06 11:10:14.778712'),
(2760, 1, '1', '2020-05-06 11:10:16.715225'),
(2761, 1, '1', '2020-05-06 11:10:20.865543'),
(2762, 1, '1', '2020-05-06 11:10:33.102466'),
(2763, 1, '1', '2020-05-06 11:10:39.486349'),
(2764, 1, '1', '2020-05-06 11:10:44.394355'),
(2765, 1, '1', '2020-05-06 11:10:49.201156'),
(2766, 1, '1', '2020-05-06 11:10:57.184804'),
(2767, 1, '1', '2020-05-06 11:10:58.401359'),
(2768, 1, '1', '2020-05-06 11:11:02.355509'),
(2769, 1, '1', '2020-05-06 11:11:09.067887'),
(2770, 1, '1', '2020-05-06 11:11:12.584657'),
(2771, 1, '1', '2020-05-06 11:11:25.838923'),
(2772, 1, '1', '2020-05-06 11:11:27.875479'),
(2773, 1, '1', '2020-05-06 11:11:32.033403'),
(2774, 1, '1', '2020-05-06 11:11:34.967031'),
(2775, 1, '1', '2020-05-06 11:11:36.983167'),
(2776, 1, '1', '2020-05-06 11:11:39.133048'),
(2777, 1, '1', '2020-05-06 11:11:43.199944'),
(2778, 1, '1', '2020-05-06 11:11:51.324247'),
(2779, 1, '1', '2020-05-06 11:11:57.823822'),
(2780, 1, '1', '2020-05-06 11:12:22.340159'),
(2781, 1, '1', '2020-05-06 11:12:25.837642'),
(2782, 1, '1', '2020-05-06 11:12:40.339771'),
(2783, 1, '1', '2020-05-06 11:12:45.936272'),
(2784, 1, '1', '2020-05-06 11:12:48.138601'),
(2785, 1, '1', '2020-05-06 11:12:50.430213'),
(2786, 1, '1', '2020-05-06 11:12:54.263698'),
(2787, 1, '1', '2020-05-06 11:12:56.272121'),
(2788, 1, '1', '2020-05-06 11:13:00.304843'),
(2789, 1, '1', '2020-05-06 11:13:09.555266'),
(2790, 1, '1', '2020-05-06 11:13:15.621270'),
(2791, 1, '1', '2020-05-06 11:13:19.674863'),
(2792, 1, '1', '2020-05-06 11:13:23.670835'),
(2793, 1, '1', '2020-05-06 11:13:25.662818'),
(2794, 1, '1', '2020-05-06 11:13:27.906182'),
(2795, 1, '1', '2020-05-06 11:13:31.820388'),
(2796, 1, '1', '2020-05-06 11:13:33.912092'),
(2797, 1, '1', '2020-05-06 11:13:35.885824'),
(2798, 1, '1', '2020-05-06 11:13:43.944271'),
(2799, 1, '1', '2020-05-06 11:13:49.136916'),
(2800, 1, '1', '2020-05-06 11:13:53.219680'),
(2801, 1, '1', '2020-05-06 11:14:03.377928'),
(2802, 1, '1', '2020-05-06 11:14:06.494274'),
(2803, 1, '1', '2020-05-06 11:14:08.535982'),
(2804, 1, '1', '2020-05-06 11:14:12.569129'),
(2805, 1, '1', '2020-05-06 11:14:18.686296'),
(2806, 1, '1', '2020-05-06 11:14:22.891762'),
(2807, 1, '1', '2020-05-06 11:14:50.941877'),
(2808, 1, '1', '2020-05-06 11:16:09.882315'),
(2809, 1, '1', '2020-05-06 11:16:11.665773'),
(2810, 1, '1', '2020-05-06 11:16:18.190541'),
(2811, 1, '1', '2020-05-06 11:16:18.764292'),
(2812, 1, '1', '2020-05-06 11:16:23.906725'),
(2813, 1, '1', '2020-05-06 11:16:34.013624'),
(2814, 1, '1', '2020-05-06 11:16:39.413609'),
(2815, 1, '1', '2020-05-06 11:16:41.230565'),
(2816, 1, '1', '2020-05-06 11:16:45.427862'),
(2817, 1, '1', '2020-05-06 11:16:47.271213'),
(2818, 1, '1', '2020-05-06 11:16:49.365412'),
(2819, 1, '1', '2020-05-06 11:16:53.345935'),
(2820, 1, '1', '2020-05-06 11:16:57.739890'),
(2821, 1, '1', '2020-05-06 11:17:03.249966'),
(2822, 1, '1', '2020-05-06 11:17:13.762196'),
(2823, 1, '1', '2020-05-06 11:17:19.772173'),
(2824, 1, '1', '2020-05-06 11:17:24.003344'),
(2825, 1, '1', '2020-05-06 11:17:31.961660'),
(2826, 1, '1', '2020-05-06 11:17:34.103017'),
(2827, 1, '1', '2020-05-06 11:17:35.993748'),
(2828, 1, '1', '2020-05-06 11:17:44.530397'),
(2829, 1, '1', '2020-05-06 11:17:49.785856'),
(2830, 1, '1', '2020-05-06 11:17:52.385090'),
(2831, 1, '1', '2020-05-06 11:18:01.593041'),
(2832, 1, '1', '2020-05-06 11:18:06.250759'),
(2833, 1, '1', '2020-05-06 11:18:08.721303'),
(2834, 1, '1', '2020-05-06 11:18:12.659258'),
(2835, 1, '1', '2020-05-06 11:18:14.936974'),
(2836, 1, '1', '2020-05-06 11:18:16.795443'),
(2837, 1, '1', '2020-05-06 11:18:26.883662'),
(2838, 1, '1', '2020-05-06 11:18:32.992322'),
(2839, 1, '1', '2020-05-06 11:18:37.991539'),
(2840, 1, '1', '2020-05-06 11:18:42.033619'),
(2841, 1, '1', '2020-05-06 11:18:44.168061'),
(2842, 1, '1', '2020-05-06 11:18:46.111917'),
(2843, 1, '1', '2020-05-06 11:18:52.203974'),
(2844, 1, '1', '2020-05-06 11:18:54.208119'),
(2845, 1, '1', '2020-05-06 11:18:56.266343'),
(2846, 1, '1', '2020-05-06 11:19:02.482787'),
(2847, 1, '1', '2020-05-06 11:19:06.507415'),
(2848, 1, '1', '2020-05-06 11:19:13.499380'),
(2849, 1, '1', '2020-05-06 11:19:41.447947'),
(2850, 1, '1', '2020-05-06 11:19:42.044056'),
(2851, 1, '1', '2020-05-06 11:19:46.168928'),
(2852, 1, '1', '2020-05-06 11:19:56.755796'),
(2853, 1, '1', '2020-05-06 11:20:01.343819'),
(2854, 1, '1', '2020-05-06 11:20:05.455437'),
(2855, 1, '1', '2020-05-06 11:20:16.654604'),
(2856, 1, '1', '2020-05-06 11:20:18.676808'),
(2857, 1, '1', '2020-05-06 11:20:20.704522'),
(2858, 1, '1', '2020-05-06 11:20:31.021070'),
(2859, 1, '1', '2020-05-06 11:20:41.303514'),
(2860, 1, '1', '2020-05-06 11:20:42.062110'),
(2861, 1, '1', '2020-05-06 11:20:46.195850'),
(2862, 1, '1', '2020-05-06 11:20:48.228450'),
(2863, 1, '1', '2020-05-06 11:20:52.119779'),
(2864, 1, '1', '2020-05-06 11:20:58.236570'),
(2865, 1, '1', '2020-05-06 11:21:00.278480'),
(2866, 1, '1', '2020-05-06 11:21:06.927596'),
(2867, 1, '1', '2020-05-06 11:21:08.385989'),
(2868, 1, '1', '2020-05-06 11:21:19.485560'),
(2869, 1, '1', '2020-05-06 11:21:22.594329'),
(2870, 1, '1', '2020-05-06 11:21:24.694398'),
(2871, 1, '1', '2020-05-06 11:21:26.518735'),
(2872, 1, '1', '2020-05-06 11:21:30.652415'),
(2873, 1, '1', '2020-05-06 11:21:32.643450'),
(2874, 1, '1', '2020-05-06 11:21:36.683729'),
(2875, 1, '1', '2020-05-06 11:21:45.775682'),
(2876, 1, '1', '2020-05-06 11:21:47.058948'),
(2877, 1, '1', '2020-05-06 11:21:51.032976'),
(2878, 1, '1', '2020-05-06 11:21:58.043125'),
(2879, 1, '1', '2020-05-06 11:22:00.300685'),
(2880, 1, '1', '2020-05-06 11:22:04.900121'),
(2881, 1, '1', '2020-05-06 11:22:10.391800'),
(2882, 1, '1', '2020-05-06 11:22:12.332953'),
(2883, 1, '1', '2020-05-06 11:22:14.549697'),
(2884, 1, '1', '2020-05-06 11:22:29.699532'),
(2885, 1, '1', '2020-05-06 11:22:31.649551'),
(2886, 1, '1', '2020-05-06 11:22:34.774559'),
(2887, 1, '1', '2020-05-06 11:22:41.907384'),
(2888, 1, '1', '2020-05-06 11:22:43.832431'),
(2889, 1, '1', '2020-05-06 11:22:45.990352'),
(2890, 1, '1', '2020-05-06 11:22:54.106826'),
(2891, 1, '1', '2020-05-06 11:22:56.181828'),
(2892, 1, '1', '2020-05-06 11:22:57.982073'),
(2893, 1, '1', '2020-05-06 11:23:04.258867'),
(2894, 1, '1', '2020-05-06 11:23:06.518070'),
(2895, 1, '1', '2020-05-06 11:23:10.747867'),
(2896, 1, '1', '2020-05-06 11:23:17.552886'),
(2897, 1, '1', '2020-05-06 11:23:21.530730'),
(2898, 1, '1', '2020-05-06 11:23:22.473155'),
(2899, 1, '1', '2020-05-06 11:23:28.490963'),
(2900, 1, '1', '2020-05-06 11:23:30.613958'),
(2901, 1, '1', '2020-05-06 11:23:32.682911'),
(2902, 1, '1', '2020-05-06 11:23:40.713162'),
(2903, 1, '1', '2020-05-06 11:23:44.754925'),
(2904, 1, '1', '2020-05-06 11:23:46.780310'),
(2905, 1, '1', '2020-05-06 11:23:54.998582'),
(2906, 1, '1', '2020-05-06 11:23:59.039896'),
(2907, 1, '1', '2020-05-06 11:24:00.973500'),
(2908, 1, '1', '2020-05-06 11:24:09.215090'),
(2909, 1, '1', '2020-05-06 11:24:12.220233'),
(2910, 1, '1', '2020-05-06 11:24:14.220241'),
(2911, 1, '1', '2020-05-06 11:24:20.254517'),
(2912, 1, '1', '2020-05-06 11:24:26.486391'),
(2913, 1, '1', '2020-05-06 11:24:34.602597'),
(2914, 1, '1', '2020-05-06 11:24:36.648530'),
(2915, 1, '1', '2020-05-06 11:24:38.731304'),
(2916, 1, '1', '2020-05-06 11:24:46.686112'),
(2917, 1, '1', '2020-05-06 11:24:48.776984'),
(2918, 1, '1', '2020-05-06 11:24:50.776918'),
(2919, 1, '1', '2020-05-06 11:25:02.976603'),
(2920, 1, '1', '2020-05-06 11:25:07.068147'),
(2921, 1, '1', '2020-05-06 11:25:08.984787'),
(2922, 1, '1', '2020-05-06 11:25:15.121817'),
(2923, 1, '1', '2020-05-06 11:25:17.178554'),
(2924, 1, '1', '2020-05-06 11:25:19.259416'),
(2925, 1, '1', '2020-05-06 11:25:25.297300'),
(2926, 1, '1', '2020-05-06 11:25:29.375535'),
(2927, 1, '1', '2020-05-06 11:25:32.475534'),
(2928, 1, '1', '2020-05-06 11:25:42.850182'),
(2929, 1, '1', '2020-05-06 11:25:47.725682'),
(2930, 1, '1', '2020-05-06 11:25:50.983035'),
(2931, 1, '1', '2020-05-06 11:25:56.933070'),
(2932, 1, '1', '2020-05-06 11:25:58.899602'),
(2933, 1, '1', '2020-05-06 11:26:03.049702'),
(2934, 1, '1', '2020-05-06 11:26:17.154888'),
(2935, 1, '1', '2020-05-06 11:26:19.157640'),
(2936, 1, '1', '2020-05-06 11:26:21.231845'),
(2937, 1, '1', '2020-05-06 11:26:27.331815'),
(2938, 1, '1', '2020-05-06 11:26:31.414740'),
(2939, 1, '1', '2020-05-06 11:26:37.681707'),
(2940, 1, '1', '2020-05-06 11:26:48.215065'),
(2941, 1, '1', '2020-05-06 11:26:51.250276'),
(2942, 1, '1', '2020-05-06 11:26:54.106353'),
(2943, 1, '1', '2020-05-06 11:27:04.028263'),
(2944, 1, '1', '2020-05-06 11:27:08.021855'),
(2945, 1, '1', '2020-05-06 11:27:12.030369'),
(2946, 1, '1', '2020-05-06 11:27:22.496868'),
(2947, 1, '1', '2020-05-06 11:27:24.313220'),
(2948, 1, '1', '2020-05-06 11:27:26.287661'),
(2949, 1, '1', '2020-05-06 11:27:36.803382'),
(2950, 1, '1', '2020-05-06 11:27:37.728679'),
(2951, 1, '1', '2020-05-06 11:27:39.829189'),
(2952, 1, '1', '2020-05-06 11:27:54.853886'),
(2953, 1, '1', '2020-05-06 11:27:58.903354'),
(2954, 1, '1', '2020-05-06 11:28:00.877885'),
(2955, 1, '1', '2020-05-06 11:28:11.143842'),
(2956, 1, '1', '2020-05-06 11:28:12.060783'),
(2957, 1, '1', '2020-05-06 11:28:14.086014'),
(2958, 1, '1', '2020-05-06 11:28:29.351239'),
(2959, 1, '1', '2020-05-06 11:28:33.277493'),
(2960, 1, '1', '2020-05-06 11:28:37.434433'),
(2961, 1, '1', '2020-05-06 11:28:44.467859'),
(2962, 1, '1', '2020-05-06 11:28:48.868009'),
(2963, 1, '1', '2020-05-06 11:30:10.606806'),
(2964, 1, '1', '2020-05-06 11:30:25.015108'),
(2965, 1, '1', '2020-05-06 11:30:28.956450'),
(2966, 1, '1', '2020-05-06 11:30:31.089121'),
(2967, 1, '1', '2020-05-06 11:30:37.146792'),
(2968, 1, '1', '2020-05-06 11:30:39.338752'),
(2969, 1, '1', '2020-05-06 11:30:41.246963'),
(2970, 1, '1', '2020-05-06 11:30:53.456074'),
(2971, 1, '1', '2020-05-06 11:30:59.562832'),
(2972, 1, '1', '2020-05-06 11:31:01.629366'),
(2973, 1, '1', '2020-05-06 11:31:08.672696'),
(2974, 1, '1', '2020-05-06 11:31:12.721843'),
(2975, 1, '1', '2020-05-06 11:31:16.780592'),
(2976, 1, '1', '2020-05-06 11:31:22.912024'),
(2977, 1, '1', '2020-05-06 11:31:24.819785'),
(2978, 1, '1', '2020-05-06 11:31:26.886202'),
(2979, 1, '1', '2020-05-06 11:31:32.961685'),
(2980, 1, '1', '2020-05-06 11:31:36.020314'),
(2981, 1, '1', '2020-05-06 11:31:40.106459'),
(2982, 1, '1', '2020-05-06 11:31:58.414756'),
(2983, 1, '1', '2020-05-06 11:32:00.835606'),
(2984, 1, '1', '2020-05-06 11:32:02.493112'),
(2985, 1, '1', '2020-05-06 11:32:09.509626'),
(2986, 1, '1', '2020-05-06 11:32:19.009630'),
(2987, 1, '1', '2020-05-06 11:32:23.876564'),
(2988, 1, '1', '2020-05-06 11:32:38.059265'),
(2989, 1, '1', '2020-05-06 11:32:42.101105'),
(2990, 1, '1', '2020-05-06 11:32:46.134095'),
(2991, 1, '1', '2020-05-06 11:32:52.984122'),
(2992, 1, '1', '2020-05-06 11:32:56.384421'),
(2993, 1, '1', '2020-05-06 11:33:00.400047'),
(2994, 1, '1', '2020-05-06 11:33:10.566619'),
(2995, 1, '1', '2020-05-06 11:33:16.634259'),
(2996, 1, '1', '2020-05-06 11:33:23.573298'),
(2997, 1, '1', '2020-05-06 11:33:32.848735'),
(2998, 1, '1', '2020-05-06 11:33:34.984465'),
(2999, 1, '1', '2020-05-06 11:33:36.898480'),
(3000, 1, '1', '2020-05-06 11:33:43.067665'),
(3001, 1, '1', '2020-05-06 11:33:47.089781'),
(3002, 1, '1', '2020-05-06 11:33:51.314562'),
(3003, 1, '1', '2020-05-06 11:34:03.417336'),
(3004, 1, '1', '2020-05-06 11:34:07.662735'),
(3005, 1, '1', '2020-05-06 11:34:10.466702'),
(3006, 1, '1', '2020-05-06 11:34:18.608645'),
(3007, 1, '1', '2020-05-06 11:34:20.721853'),
(3008, 1, '1', '2020-05-06 11:34:24.733138'),
(3009, 1, '1', '2020-05-06 11:34:31.920936'),
(3010, 1, '1', '2020-05-06 11:34:34.091318'),
(3011, 1, '1', '2020-05-06 11:34:37.904063'),
(3012, 1, '1', '2020-05-06 11:34:47.128719'),
(3013, 1, '1', '2020-05-06 11:34:51.275062'),
(3014, 1, '1', '2020-05-06 11:34:55.474501'),
(3015, 1, '1', '2020-05-06 11:35:04.345405'),
(3016, 1, '1', '2020-05-06 11:35:06.461514'),
(3017, 1, '1', '2020-05-06 11:35:10.483117'),
(3018, 1, '1', '2020-05-06 11:35:19.511123'),
(3019, 1, '1', '2020-05-06 11:35:22.727465'),
(3020, 1, '1', '2020-05-06 11:35:26.927004'),
(3021, 1, '1', '2020-05-06 11:35:32.914826'),
(3022, 1, '1', '2020-05-06 11:35:34.876059'),
(3023, 1, '1', '2020-05-06 11:35:37.074184'),
(3024, 1, '1', '2020-05-06 11:35:52.117578'),
(3025, 1, '1', '2020-05-06 11:35:56.708965'),
(3026, 1, '1', '2020-05-06 11:36:00.350791'),
(3027, 1, '1', '2020-05-06 11:36:16.017067'),
(3028, 1, '1', '2020-05-06 11:36:18.790202'),
(3029, 1, '1', '2020-05-06 11:36:19.658720'),
(3030, 1, '1', '2020-05-06 11:36:25.724407'),
(3031, 1, '1', '2020-05-06 11:36:30.758503'),
(3032, 1, '1', '2020-05-06 11:36:34.999530'),
(3033, 1, '1', '2020-05-06 11:37:26.773039'),
(3034, 1, '1', '2020-05-06 11:37:28.856310'),
(3035, 1, '1', '2020-05-06 11:37:30.714803'),
(3036, 1, '1', '2020-05-06 11:37:38.887735'),
(3037, 1, '1', '2020-05-06 11:37:44.976710'),
(3038, 1, '1', '2020-05-06 11:37:49.104665'),
(3039, 1, '1', '2020-05-06 11:38:00.188168'),
(3040, 1, '1', '2020-05-06 11:38:02.337936'),
(3041, 1, '1', '2020-05-06 11:38:06.713246'),
(3042, 1, '1', '2020-05-06 11:38:22.428950'),
(3043, 1, '1', '2020-05-06 11:38:26.486612'),
(3044, 1, '1', '2020-05-06 11:38:30.594938'),
(3045, 1, '1', '2020-05-06 11:38:38.688088'),
(3046, 1, '1', '2020-05-06 11:38:40.670346'),
(3047, 1, '1', '2020-05-06 11:38:43.853164'),
(3048, 1, '1', '2020-05-06 11:38:51.894926'),
(3049, 1, '1', '2020-05-06 11:38:55.969849'),
(3050, 1, '1', '2020-05-06 11:39:00.011022'),
(3051, 1, '1', '2020-05-06 11:39:06.194222'),
(3052, 1, '1', '2020-05-06 11:39:08.144207'),
(3053, 1, '1', '2020-05-06 11:39:14.310917'),
(3054, 1, '1', '2020-05-06 11:39:41.001356'),
(3055, 1, '1', '2020-05-06 11:39:47.943069'),
(3056, 1, '1', '2020-05-06 11:39:56.089370'),
(3057, 1, '1', '2020-05-06 11:42:04.286252'),
(3058, 1, '1', '2020-05-06 11:42:12.213890'),
(3059, 1, '1', '2020-05-06 11:42:26.244069'),
(3060, 1, '1', '2020-05-06 11:43:07.996796'),
(3061, 1, '1', '2020-05-06 11:43:20.192159'),
(3062, 1, '1', '2020-05-06 11:43:29.408139'),
(3063, 1, '1', '2020-05-06 11:44:05.928197'),
(3064, 1, '1', '2020-05-06 11:44:18.098061'),
(3065, 1, '1', '2020-05-06 11:44:26.622475'),
(3066, 1, '1', '2020-05-06 11:44:44.630586'),
(3067, 1, '1', '2020-05-06 11:44:46.526754'),
(3068, 1, '1', '2020-05-06 11:44:48.630824'),
(3069, 1, '1', '2020-05-06 11:45:00.812971'),
(3070, 1, '1', '2020-05-06 11:45:06.979685'),
(3071, 1, '1', '2020-05-06 11:45:13.037919'),
(3072, 1, '1', '2020-05-06 11:45:23.491123'),
(3073, 1, '1', '2020-05-06 11:45:25.236620'),
(3074, 1, '1', '2020-05-06 11:45:27.234627'),
(3075, 1, '1', '2020-05-06 11:45:33.268109'),
(3076, 1, '1', '2020-05-06 11:45:37.453200'),
(3077, 1, '1', '2020-05-06 11:45:41.534534'),
(3078, 1, '1', '2020-05-06 11:45:56.694424'),
(3079, 1, '1', '2020-05-06 11:45:58.786019'),
(3080, 1, '1', '2020-05-06 11:46:02.850229'),
(3081, 1, '1', '2020-05-06 11:46:08.952431'),
(3082, 1, '1', '2020-05-06 11:46:10.985710'),
(3083, 1, '1', '2020-05-06 11:46:12.926638'),
(3084, 1, '1', '2020-05-06 11:46:27.251146'),
(3085, 1, '1', '2020-05-06 11:46:31.226047'),
(3086, 1, '1', '2020-05-06 11:46:35.326256'),
(3087, 1, '1', '2020-05-06 11:46:41.449960'),
(3088, 1, '1', '2020-05-06 11:46:43.718035'),
(3089, 1, '1', '2020-05-06 11:46:45.608451'),
(3090, 1, '1', '2020-05-06 11:46:57.649671'),
(3091, 1, '1', '2020-05-06 11:47:01.717552'),
(3092, 1, '1', '2020-05-06 11:47:05.807867'),
(3093, 1, '1', '2020-05-06 11:47:16.024451'),
(3094, 1, '1', '2020-05-06 11:47:17.983203'),
(3095, 1, '1', '2020-05-06 11:47:22.058165'),
(3096, 1, '1', '2020-05-06 11:47:30.073989'),
(3097, 1, '1', '2020-05-06 11:47:34.348471'),
(3098, 1, '1', '2020-05-06 11:47:39.057559'),
(3099, 1, '1', '2020-05-06 11:47:51.457229'),
(3100, 1, '1', '2020-05-06 11:47:53.506839'),
(3101, 1, '1', '2020-05-06 11:47:55.456216'),
(3102, 1, '1', '2020-05-06 11:48:01.490556'),
(3103, 1, '1', '2020-05-06 11:48:03.472632'),
(3104, 1, '1', '2020-05-06 11:48:07.664613'),
(3105, 1, '1', '2020-05-06 11:48:19.931511'),
(3106, 1, '1', '2020-05-06 11:48:26.089671'),
(3107, 1, '1', '2020-05-06 11:48:30.148096'),
(3108, 1, '1', '2020-05-06 11:48:40.480871'),
(3109, 1, '1', '2020-05-06 11:48:46.537529'),
(3110, 1, '1', '2020-05-06 11:48:52.663523'),
(3111, 1, '1', '2020-05-06 11:49:11.080567'),
(3112, 1, '1', '2020-05-06 11:49:21.389977'),
(3113, 1, '1', '2020-05-06 11:49:27.461476'),
(3114, 1, '1', '2020-05-06 11:49:47.531787'),
(3115, 1, '1', '2020-05-06 11:49:57.814564'),
(3116, 1, '1', '2020-05-06 11:50:09.850534'),
(3117, 1, '1', '2020-05-06 11:50:46.452712'),
(3118, 1, '1', '2020-05-06 11:50:56.614975'),
(3119, 1, '1', '2020-05-06 11:51:18.495182'),
(3120, 1, '1', '2020-05-06 11:51:54.802198'),
(3121, 1, '1', '2020-05-06 11:52:06.935369'),
(3122, 1, '1', '2020-05-06 11:52:17.170663'),
(3123, 1, '1', '2020-05-06 11:52:34.484147'),
(3124, 1, '1', '2020-05-06 11:52:36.419878'),
(3125, 1, '1', '2020-05-06 11:52:38.719810'),
(3126, 1, '1', '2020-05-06 11:52:52.683487'),
(3127, 1, '1', '2020-05-06 11:52:56.419428'),
(3128, 1, '1', '2020-05-06 11:52:58.769172'),
(3129, 1, '1', '2020-05-06 11:53:11.044051'),
(3130, 1, '1', '2020-05-06 11:53:15.227013'),
(3131, 1, '1', '2020-05-06 11:53:19.277231'),
(3132, 1, '1', '2020-05-06 11:53:27.418077'),
(3133, 1, '1', '2020-05-06 11:53:31.518143'),
(3134, 1, '1', '2020-05-06 11:53:35.601659'),
(3135, 1, '1', '2020-05-06 11:53:53.009100'),
(3136, 1, '1', '2020-05-06 11:53:57.109038'),
(3137, 1, '1', '2020-05-06 11:53:59.275136'),
(3138, 1, '1', '2020-05-06 11:54:05.250465'),
(3139, 1, '1', '2020-05-06 11:54:07.224633'),
(3140, 1, '1', '2020-05-06 11:54:09.324945'),
(3141, 1, '1', '2020-05-06 11:54:21.532262'),
(3142, 1, '1', '2020-05-06 11:54:25.691458'),
(3143, 1, '1', '2020-05-06 11:54:31.791088'),
(3144, 1, '1', '2020-05-06 11:54:42.029259'),
(3145, 1, '1', '2020-05-06 11:54:46.081791'),
(3146, 1, '1', '2020-05-06 11:54:48.049508'),
(3147, 1, '1', '2020-05-06 11:54:54.074156'),
(3148, 1, '1', '2020-05-06 11:54:56.099029'),
(3149, 1, '1', '2020-05-06 11:55:00.290395'),
(3150, 1, '1', '2020-05-06 11:55:12.373491'),
(3151, 1, '1', '2020-05-06 11:55:16.514640'),
(3152, 1, '1', '2020-05-06 11:55:18.547459'),
(3153, 1, '1', '2020-05-06 11:55:24.611676'),
(3154, 1, '1', '2020-05-06 11:55:28.916902'),
(3155, 1, '1', '2020-05-06 11:55:32.797792'),
(3156, 1, '1', '2020-05-06 11:55:43.489553'),
(3157, 1, '1', '2020-05-06 11:55:45.920752'),
(3158, 1, '1', '2020-05-06 11:55:48.022478'),
(3159, 1, '1', '2020-05-06 11:56:12.030649'),
(3160, 1, '1', '2020-05-06 11:56:14.544820'),
(3161, 1, '1', '2020-05-06 11:56:18.752597'),
(3162, 1, '1', '2020-05-06 11:56:29.900858'),
(3163, 1, '1', '2020-05-06 11:56:33.746334'),
(3164, 1, '1', '2020-05-06 11:56:41.201579'),
(3165, 1, '1', '2020-05-06 11:56:48.168346'),
(3166, 1, '1', '2020-05-06 11:56:52.362881'),
(3167, 1, '1', '2020-05-06 11:56:54.160264'),
(3168, 1, '1', '2020-05-06 11:57:13.467901'),
(3169, 1, '1', '2020-05-06 11:57:14.770250'),
(3170, 1, '1', '2020-05-06 11:57:16.770234'),
(3171, 1, '1', '2020-05-06 11:57:28.945140'),
(3172, 1, '1', '2020-05-06 11:57:31.367527'),
(3173, 1, '1', '2020-05-06 11:57:33.053342'),
(3174, 1, '1', '2020-05-06 11:57:45.157540'),
(3175, 1, '1', '2020-05-06 11:57:48.270064'),
(3176, 1, '1', '2020-05-06 11:57:50.191190'),
(3177, 1, '1', '2020-05-06 11:58:00.457634'),
(3178, 1, '1', '2020-05-06 11:58:02.469914'),
(3179, 1, '1', '2020-05-06 11:58:04.590736'),
(3180, 1, '1', '2020-05-06 11:58:11.015208'),
(3181, 1, '1', '2020-05-06 11:58:12.774029'),
(3182, 1, '1', '2020-05-06 11:58:16.931755'),
(3183, 1, '1', '2020-05-06 11:58:34.956425'),
(3184, 1, '1', '2020-05-06 11:58:38.218797'),
(3185, 1, '1', '2020-05-06 11:58:42.251317'),
(3186, 1, '1', '2020-05-06 11:58:52.454975'),
(3187, 1, '1', '2020-05-06 11:58:54.496821'),
(3188, 1, '1', '2020-05-06 11:58:56.463382'),
(3189, 1, '1', '2020-05-06 11:59:08.844425'),
(3190, 1, '1', '2020-05-06 11:59:12.946434'),
(3191, 1, '1', '2020-05-06 11:59:21.113212'),
(3192, 1, '1', '2020-05-06 11:59:31.379445'),
(3193, 1, '1', '2020-05-06 11:59:33.316539'),
(3194, 1, '1', '2020-05-06 11:59:35.328982'),
(3195, 1, '1', '2020-05-06 11:59:45.402969'),
(3196, 1, '1', '2020-05-06 11:59:47.519502'),
(3197, 1, '1', '2020-05-06 11:59:49.494832'),
(3198, 1, '1', '2020-05-06 11:59:55.619803'),
(3199, 1, '1', '2020-05-06 11:59:57.653607'),
(3200, 1, '1', '2020-05-06 12:00:01.994242'),
(3201, 1, '1', '2020-05-06 12:00:35.651725'),
(3202, 1, '1', '2020-05-06 12:00:37.617724'),
(3203, 1, '1', '2020-05-06 12:00:39.610584'),
(3204, 1, '1', '2020-05-06 12:00:47.692855'),
(3205, 1, '1', '2020-05-06 12:00:49.925382'),
(3206, 1, '1', '2020-05-06 12:00:52.019079'),
(3207, 1, '1', '2020-05-06 12:01:05.525720'),
(3208, 1, '1', '2020-05-06 12:01:09.367044'),
(3209, 1, '1', '2020-05-06 12:01:11.918414'),
(3210, 1, '1', '2020-05-06 12:01:17.375787'),
(3211, 1, '1', '2020-05-06 12:01:19.425602'),
(3212, 1, '1', '2020-05-06 12:01:21.449867'),
(3213, 1, '1', '2020-05-06 12:01:33.591367'),
(3214, 1, '1', '2020-05-06 12:01:44.290089'),
(3215, 1, '1', '2020-05-06 12:01:47.058064'),
(3216, 1, '1', '2020-05-06 12:01:59.574100'),
(3217, 1, '1', '2020-05-06 12:02:01.356739'),
(3218, 1, '1', '2020-05-06 12:02:03.431416'),
(3219, 1, '1', '2020-05-06 12:02:09.749911'),
(3220, 1, '1', '2020-05-06 12:02:11.624089'),
(3221, 1, '1', '2020-05-06 12:02:16.294043'),
(3222, 1, '1', '2020-05-06 12:02:31.923556'),
(3223, 1, '1', '2020-05-06 12:02:36.007356'),
(3224, 1, '1', '2020-05-06 12:02:38.021125'),
(3225, 1, '1', '2020-05-06 12:02:48.223105'),
(3226, 1, '1', '2020-05-06 12:02:50.114964'),
(3227, 1, '1', '2020-05-06 12:02:54.179105'),
(3228, 1, '1', '2020-05-06 12:04:32.945620'),
(3229, 1, '1', '2020-05-06 12:04:46.935547'),
(3230, 1, '1', '2020-05-06 12:04:53.752921'),
(3231, 1, '1', '2020-05-06 12:05:40.473144'),
(3232, 1, '1', '2020-05-06 12:05:51.101229'),
(3233, 1, '1', '2020-05-06 12:05:51.647915'),
(3234, 1, '1', '2020-05-06 12:06:09.129397'),
(3235, 1, '1', '2020-05-06 12:06:30.416806'),
(3236, 1, '1', '2020-05-06 12:06:51.763070'),
(3237, 1, '1', '2020-05-06 12:07:56.318086'),
(3238, 1, '1', '2020-05-06 12:08:18.099633'),
(3239, 1, '1', '2020-05-06 12:08:39.416172'),
(3240, 1, '1', '2020-05-06 12:09:43.238755'),
(3241, 1, '1', '2020-05-06 12:10:04.529323'),
(3242, 1, '1', '2020-05-06 12:10:25.856581'),
(3243, 1, '1', '2020-05-06 12:11:29.767898'),
(3244, 1, '1', '2020-05-06 12:11:43.766666'),
(3245, 1, '1', '2020-05-06 12:11:54.063674'),
(3246, 1, '1', '2020-05-06 12:12:43.089503'),
(3247, 1, '1', '2020-05-06 12:12:59.577626'),
(3248, 1, '1', '2020-05-06 12:13:14.163757'),
(3249, 1, '1', '2020-05-06 12:13:55.977583'),
(3250, 1, '1', '2020-05-06 12:14:10.402312'),
(3251, 1, '1', '2020-05-06 12:14:24.502523'),
(3252, 1, '1', '2020-05-06 12:15:07.533670'),
(3253, 1, '1', '2020-05-06 12:15:21.984155'),
(3254, 1, '1', '2020-05-06 12:15:38.258439'),
(3255, 1, '1', '2020-05-06 12:16:21.482123'),
(3256, 1, '1', '2020-05-06 12:16:37.797638'),
(3257, 1, '1', '2020-05-06 12:16:50.063960'),
(3258, 1, '1', '2020-05-06 12:17:33.096336'),
(3259, 1, '1', '2020-05-06 12:17:47.387603'),
(3260, 1, '1', '2020-05-06 12:18:01.528663'),
(3261, 1, '1', '2020-05-06 12:18:46.325098'),
(3262, 1, '1', '2020-05-06 12:19:00.441310'),
(3263, 1, '1', '2020-05-06 12:19:12.656529'),
(3264, 1, '1', '2020-05-06 12:19:57.830930'),
(3265, 1, '1', '2020-05-06 12:20:13.004838'),
(3266, 1, '1', '2020-05-06 12:20:30.413045'),
(3267, 1, '1', '2020-05-06 12:21:13.189593'),
(3268, 1, '1', '2020-05-06 12:21:29.429986'),
(3269, 1, '1', '2020-05-06 12:21:41.685123'),
(3270, 1, '1', '2020-05-06 12:22:13.233663'),
(3271, 1, '1', '2020-05-06 12:22:29.499239'),
(3272, 1, '1', '2020-05-06 12:22:43.733026'),
(3273, 1, '1', '2020-05-06 12:23:23.703231'),
(3274, 1, '1', '2020-05-06 12:23:29.436781'),
(3275, 1, '1', '2020-05-06 12:23:35.563487'),
(3276, 1, '1', '2020-05-06 12:23:51.852373'),
(3277, 1, '1', '2020-05-06 12:23:56.079648'),
(3278, 1, '1', '2020-05-06 12:24:00.063256'),
(3279, 1, '1', '2020-05-06 12:24:12.085039'),
(3280, 1, '1', '2020-05-06 12:24:16.328798'),
(3281, 1, '1', '2020-05-06 12:24:20.860102'),
(3282, 1, '1', '2020-05-06 12:24:30.836350'),
(3283, 1, '1', '2020-05-06 12:24:32.769588'),
(3284, 1, '1', '2020-05-06 12:24:34.794553'),
(3285, 1, '1', '2020-05-06 12:24:49.085928'),
(3286, 1, '1', '2020-05-06 12:24:59.309687'),
(3287, 1, '1', '2020-05-06 12:25:05.449412'),
(3288, 1, '1', '2020-05-06 12:25:32.101035'),
(3289, 1, '1', '2020-05-06 12:25:46.417071'),
(3290, 1, '1', '2020-05-06 12:26:00.750125'),
(3291, 1, '1', '2020-05-06 12:26:33.389271'),
(3292, 1, '1', '2020-05-06 12:26:43.599937'),
(3293, 1, '1', '2020-05-06 12:26:56.198862'),
(3294, 1, '1', '2020-05-06 12:27:24.292122'),
(3295, 1, '1', '2020-05-06 12:27:34.387913'),
(3296, 1, '1', '2020-05-06 12:27:46.556554'),
(3297, 1, '1', '2020-05-06 12:28:25.180654'),
(3298, 1, '1', '2020-05-06 12:28:39.421387'),
(3299, 1, '1', '2020-05-06 12:28:49.604921'),
(3300, 1, '1', '2020-05-06 12:29:18.053827'),
(3301, 1, '1', '2020-05-06 12:29:32.282551'),
(3302, 1, '1', '2020-05-06 12:29:48.710028'),
(3303, 1, '1', '2020-05-06 12:30:25.318596'),
(3304, 1, '1', '2020-05-06 12:30:37.580020'),
(3305, 1, '1', '2020-05-06 12:30:49.692306'),
(3306, 1, '1', '2020-05-06 12:31:32.869436'),
(3307, 1, '1', '2020-05-06 12:31:47.061326'),
(3308, 1, '1', '2020-05-06 12:31:53.061140'),
(3309, 1, '1', '2020-05-06 12:32:26.658973'),
(3310, 1, '1', '2020-05-06 12:32:38.785052'),
(3311, 1, '1', '2020-05-06 12:32:49.050167'),
(3312, 1, '1', '2020-05-06 12:32:54.975413'),
(3313, 1, '1', '2020-05-06 12:32:57.017036'),
(3314, 1, '1', '2020-05-06 12:32:59.158202'),
(3315, 1, '1', '2020-05-06 12:33:21.390166'),
(3316, 1, '1', '2020-05-06 12:33:29.582142'),
(3317, 1, '1', '2020-05-06 12:33:37.964118'),
(3318, 1, '1', '2020-05-06 12:34:15.371733'),
(3319, 1, '1', '2020-05-06 12:34:29.336942'),
(3320, 1, '1', '2020-05-06 12:34:43.496854'),
(3321, 1, '1', '2020-05-06 12:35:29.335829'),
(3322, 1, '1', '2020-05-06 12:35:43.526386'),
(3323, 1, '1', '2020-05-06 12:35:55.727238'),
(3324, 1, '1', '2020-05-06 12:36:44.648426'),
(3325, 1, '1', '2020-05-06 12:36:59.965081'),
(3326, 1, '1', '2020-05-06 12:37:18.989380'),
(3327, 1, '1', '2020-05-06 12:38:19.356898'),
(3328, 1, '1', '2020-05-06 12:38:38.610611'),
(3329, 1, '1', '2020-05-06 12:38:46.269939'),
(3330, 1, '1', '2020-05-06 12:39:11.113886'),
(3331, 1, '1', '2020-05-06 12:40:43.763946'),
(3332, 1, '1', '2020-05-06 12:40:47.221827'),
(3333, 1, '1', '2020-05-06 12:41:06.581948'),
(3334, 1, '1', '2020-05-06 12:41:16.779484'),
(3335, 1, '1', '2020-05-06 12:41:22.763291'),
(3336, 1, '1', '2020-05-06 12:41:41.112362'),
(3337, 1, '1', '2020-05-06 12:41:58.844444'),
(3338, 1, '1', '2020-05-06 12:42:05.536414'),
(3339, 1, '1', '2020-05-06 12:42:23.810875'),
(3340, 1, '1', '2020-05-06 12:42:29.843393'),
(3341, 1, '1', '2020-05-06 12:42:40.216252'),
(3342, 1, '1', '2020-05-06 12:43:02.473732'),
(3343, 1, '1', '2020-05-06 12:43:13.150361'),
(3344, 1, '1', '2020-05-06 12:43:19.933873'),
(3345, 1, '1', '2020-05-06 12:43:46.223357'),
(3346, 1, '1', '2020-05-06 12:43:52.524054'),
(3347, 1, '1', '2020-05-06 12:44:02.390577'),
(3348, 1, '1', '2020-05-06 12:44:14.722761'),
(3349, 1, '1', '2020-05-06 12:44:16.607929'),
(3350, 1, '1', '2020-05-06 12:44:20.881352'),
(3351, 1, '1', '2020-05-06 12:44:51.188490'),
(3352, 1, '1', '2020-05-06 12:45:03.912170'),
(3353, 1, '1', '2020-05-06 12:45:16.128587'),
(3354, 1, '1', '2020-05-06 12:46:10.976872'),
(3355, 1, '1', '2020-05-06 12:46:29.267860'),
(3356, 1, '1', '2020-05-06 12:46:45.842338'),
(3357, 1, '1', '2020-05-06 12:47:12.182739'),
(3358, 1, '1', '2020-05-06 12:47:16.274815'),
(3359, 1, '1', '2020-05-06 12:47:23.157784'),
(3360, 1, '1', '2020-05-06 12:47:31.306806'),
(3361, 1, '1', '2020-05-06 12:47:33.298110'),
(3362, 1, '1', '2020-05-06 12:47:35.107715'),
(3363, 1, '1', '2020-05-06 12:47:43.658073'),
(3364, 1, '1', '2020-05-06 12:47:51.639594'),
(3365, 1, '1', '2020-05-06 12:48:00.190210'),
(3366, 1, '1', '2020-05-06 12:48:13.021800'),
(3367, 1, '1', '2020-05-06 12:48:16.806347'),
(3368, 1, '1', '2020-05-06 12:48:20.473350'),
(3369, 1, '1', '2020-05-06 12:48:28.563228'),
(3370, 1, '1', '2020-05-06 12:48:34.913127'),
(3371, 1, '1', '2020-05-06 12:48:40.416418'),
(3372, 1, '1', '2020-05-06 12:48:53.507371'),
(3373, 1, '1', '2020-05-06 12:48:57.903132'),
(3374, 1, '1', '2020-05-06 12:49:01.903563'),
(3375, 1, '1', '2020-05-06 12:49:09.813468'),
(3376, 1, '1', '2020-05-06 12:49:13.886299'),
(3377, 1, '1', '2020-05-06 12:49:19.727413'),
(3378, 1, '1', '2020-05-06 12:49:34.827235'),
(3379, 1, '1', '2020-05-06 12:49:37.094189'),
(3380, 1, '1', '2020-05-06 12:49:38.811358'),
(3381, 1, '1', '2020-05-06 12:49:45.035617'),
(3382, 1, '1', '2020-05-06 12:49:48.768679'),
(3383, 1, '1', '2020-05-06 12:49:54.862240'),
(3384, 1, '1', '2020-05-06 12:50:11.790607'),
(3385, 1, '1', '2020-05-06 12:50:13.767321'),
(3386, 1, '1', '2020-05-06 12:50:15.927556'),
(3387, 1, '1', '2020-05-06 12:50:25.824823'),
(3388, 1, '1', '2020-05-06 12:50:31.858041'),
(3389, 1, '1', '2020-05-06 12:50:35.833127'),
(3390, 1, '1', '2020-05-06 12:50:48.052389'),
(3391, 1, '1', '2020-05-06 12:50:49.968780'),
(3392, 1, '1', '2020-05-06 12:50:53.974074'),
(3393, 1, '1', '2020-05-06 12:51:03.015229'),
(3394, 1, '1', '2020-05-06 12:51:07.051226'),
(3395, 1, '1', '2020-05-06 12:51:11.115742'),
(3396, 1, '1', '2020-05-06 12:51:23.090023'),
(3397, 1, '1', '2020-05-06 12:51:33.472400'),
(3398, 1, '1', '2020-05-06 12:51:41.229547'),
(3399, 1, '1', '2020-05-06 12:52:04.229910'),
(3400, 1, '1', '2020-05-06 12:52:10.283547'),
(3401, 1, '1', '2020-05-06 12:52:14.375294'),
(3402, 1, '1', '2020-05-06 12:52:27.449583'),
(3403, 1, '1', '2020-05-06 12:52:39.302605'),
(3404, 1, '1', '2020-05-06 12:52:45.519648'),
(3405, 1, '1', '2020-05-06 12:52:56.702704'),
(3406, 1, '1', '2020-05-06 12:53:00.712177'),
(3407, 1, '1', '2020-05-06 12:53:06.577330'),
(3408, 1, '1', '2020-05-06 12:53:20.793882'),
(3409, 1, '1', '2020-05-06 12:53:26.756978'),
(3410, 1, '1', '2020-05-06 12:53:30.617883'),
(3411, 1, '1', '2020-05-06 12:53:44.733659'),
(3412, 1, '1', '2020-05-06 12:53:48.875156'),
(3413, 1, '1', '2020-05-06 12:53:54.792876'),
(3414, 1, '1', '2020-05-06 12:54:22.923627'),
(3415, 1, '1', '2020-05-06 12:54:30.990037'),
(3416, 1, '1', '2020-05-06 12:54:34.981665'),
(3417, 1, '1', '2020-05-06 12:54:47.031411'),
(3418, 1, '1', '2020-05-06 12:54:55.064979'),
(3419, 1, '1', '2020-05-06 12:55:01.073504'),
(3420, 1, '1', '2020-05-06 12:55:21.238546'),
(3421, 1, '1', '2020-05-06 12:55:25.272680'),
(3422, 1, '1', '2020-05-06 12:55:33.280513'),
(3423, 1, '1', '2020-05-06 12:55:47.312633'),
(3424, 1, '1', '2020-05-06 12:55:51.270962'),
(3425, 1, '1', '2020-05-06 12:55:55.295321'),
(3426, 1, '1', '2020-05-06 12:56:13.369973'),
(3427, 1, '1', '2020-05-06 12:56:21.411171');
INSERT INTO `strata_sensor_data` (`id`, `sensor_id`, `sensor_value`, `created_date`) VALUES
(3428, 1, '1', '2020-05-06 12:56:27.461154'),
(3429, 1, '1', '2020-05-06 12:56:45.584834'),
(3430, 1, '1', '2020-05-06 12:56:51.626735'),
(3431, 1, '1', '2020-05-06 12:56:57.685614'),
(3432, 1, '1', '2020-05-06 12:57:19.795679'),
(3433, 1, '1', '2020-05-06 12:57:27.734451'),
(3434, 1, '1', '2020-05-06 12:57:32.766561'),
(3435, 1, '1', '2020-05-06 12:57:48.833998'),
(3436, 1, '1', '2020-05-06 12:57:54.858811'),
(3437, 1, '1', '2020-05-06 12:57:59.050489'),
(3438, 1, '1', '2020-05-06 12:58:14.875286'),
(3439, 1, '1', '2020-05-06 12:58:22.980326'),
(3440, 1, '1', '2020-05-06 12:58:31.030369'),
(3441, 1, '1', '2020-05-06 12:58:51.163225'),
(3442, 1, '1', '2020-05-06 12:58:57.096274'),
(3443, 1, '1', '2020-05-06 12:59:01.129107'),
(3444, 1, '1', '2020-05-06 12:59:18.220611'),
(3445, 1, '1', '2020-05-06 12:59:30.461445'),
(3446, 1, '1', '2020-05-06 12:59:39.319396'),
(3447, 1, '1', '2020-05-06 12:59:54.461517'),
(3448, 1, '1', '2020-05-06 13:00:00.402435'),
(3449, 1, '1', '2020-05-06 13:00:08.525223'),
(3450, 1, '1', '2020-05-06 13:00:24.584765'),
(3451, 1, '1', '2020-05-06 13:00:28.451020'),
(3452, 1, '1', '2020-05-06 13:00:34.672479'),
(3453, 1, '1', '2020-05-06 13:00:54.658071'),
(3454, 1, '1', '2020-05-06 13:01:00.738490'),
(3455, 1, '1', '2020-05-06 13:01:08.890874'),
(3456, 1, '1', '2020-05-06 13:01:32.806820'),
(3457, 1, '1', '2020-05-06 13:01:40.890272'),
(3458, 1, '1', '2020-05-06 13:01:46.856304'),
(3459, 1, '1', '2020-05-06 13:02:15.246859'),
(3460, 1, '1', '2020-05-06 13:02:25.339194'),
(3461, 1, '1', '2020-05-06 13:02:38.296255'),
(3462, 1, '1', '2020-05-06 13:03:31.660398'),
(3463, 1, '1', '2020-05-06 13:03:52.017845'),
(3464, 1, '1', '2020-05-06 13:04:14.367128'),
(3465, 1, '1', '2020-05-06 13:04:40.658179'),
(3466, 1, '1', '2020-05-06 13:04:46.799829'),
(3467, 1, '1', '2020-05-06 13:04:55.140910'),
(3468, 1, '1', '2020-05-06 13:05:15.249836'),
(3469, 1, '1', '2020-05-06 13:05:19.323660'),
(3470, 1, '1', '2020-05-06 13:05:25.550107'),
(3471, 1, '1', '2020-05-06 13:05:48.273534'),
(3472, 1, '1', '2020-05-06 13:05:56.081893'),
(3473, 1, '1', '2020-05-06 13:06:04.388999'),
(3474, 1, '1', '2020-05-06 13:06:20.572082'),
(3475, 1, '1', '2020-05-06 13:06:27.364019'),
(3476, 1, '1', '2020-05-06 13:06:33.455401'),
(3477, 1, '1', '2020-05-06 13:06:59.920588'),
(3478, 1, '1', '2020-05-06 13:07:06.393575'),
(3479, 1, '1', '2020-05-06 13:07:09.129046'),
(3480, 1, '1', '2020-05-06 13:07:31.412304'),
(3481, 1, '1', '2020-05-06 13:07:37.478696'),
(3482, 1, '1', '2020-05-06 13:07:47.608666'),
(3483, 1, '1', '2020-05-06 13:08:07.035603'),
(3484, 1, '1', '2020-05-06 13:08:13.124157'),
(3485, 1, '1', '2020-05-06 13:08:21.190196'),
(3486, 1, '1', '2020-05-06 13:08:43.615022'),
(3487, 1, '1', '2020-05-06 13:08:49.872868'),
(3488, 1, '1', '2020-05-06 13:08:55.914440'),
(3489, 1, '1', '2020-05-06 13:09:15.113703'),
(3490, 1, '1', '2020-05-06 13:09:27.463435'),
(3491, 1, '1', '2020-05-06 13:09:33.437629'),
(3492, 1, '1', '2020-05-06 13:09:47.754353'),
(3493, 1, '1', '2020-05-06 13:09:55.886761'),
(3494, 1, '1', '2020-05-06 13:10:03.928229'),
(3495, 1, '1', '2020-05-06 13:10:22.152425'),
(3496, 1, '1', '2020-05-06 13:10:28.294483'),
(3497, 1, '1', '2020-05-06 13:10:34.526879'),
(3498, 1, '1', '2020-05-06 13:10:50.677256'),
(3499, 1, '1', '2020-05-06 13:10:58.784582'),
(3500, 1, '1', '2020-05-06 13:11:08.967525'),
(3501, 1, '1', '2020-05-06 13:11:25.183204'),
(3502, 1, '1', '2020-05-06 13:11:31.432749'),
(3503, 1, '1', '2020-05-06 13:11:35.441344'),
(3504, 1, '1', '2020-05-06 13:11:57.944485'),
(3505, 1, '1', '2020-05-06 13:12:08.089552'),
(3506, 1, '1', '2020-05-06 13:12:14.173264'),
(3507, 1, '1', '2020-05-06 13:12:30.297910'),
(3508, 1, '1', '2020-05-06 13:12:34.506656'),
(3509, 1, '1', '2020-05-06 13:12:40.768352'),
(3510, 1, '1', '2020-05-06 13:12:50.855837'),
(3511, 1, '1', '2020-05-06 13:12:56.881148'),
(3512, 1, '1', '2020-05-06 13:13:02.914253'),
(3513, 1, '1', '2020-05-06 13:13:25.138495'),
(3514, 1, '1', '2020-05-06 13:13:29.221784'),
(3515, 1, '1', '2020-05-06 13:13:35.338079'),
(3516, 1, '1', '2020-05-06 13:13:49.487934'),
(3517, 1, '1', '2020-05-06 13:13:53.685674'),
(3518, 1, '1', '2020-05-06 13:13:59.694511'),
(3519, 1, '1', '2020-05-06 13:14:22.017769'),
(3520, 1, '1', '2020-05-06 13:14:24.109780'),
(3521, 1, '1', '2020-05-06 13:14:26.201547'),
(3522, 1, '1', '2020-05-06 13:14:41.459492'),
(3523, 1, '1', '2020-05-06 13:14:51.516573'),
(3524, 1, '1', '2020-05-06 13:14:57.575242'),
(3525, 1, '1', '2020-05-06 13:15:07.783106'),
(3526, 1, '1', '2020-05-06 13:15:09.736160'),
(3527, 1, '1', '2020-05-06 13:15:11.928010'),
(3528, 1, '1', '2020-05-06 13:15:28.157410'),
(3529, 1, '1', '2020-05-06 13:15:34.174304'),
(3530, 1, '1', '2020-05-06 13:15:38.298607'),
(3531, 1, '1', '2020-05-06 13:15:54.518712'),
(3532, 1, '1', '2020-05-06 13:16:00.590042'),
(3533, 1, '1', '2020-05-06 13:16:06.726737'),
(3534, 1, '1', '2020-05-06 13:16:22.884886'),
(3535, 1, '1', '2020-05-06 13:16:27.037894'),
(3536, 1, '1', '2020-05-06 13:16:33.163729'),
(3537, 1, '1', '2020-05-06 13:16:47.413109'),
(3538, 1, '1', '2020-05-06 13:16:51.509719'),
(3539, 1, '1', '2020-05-06 13:16:57.678725'),
(3540, 1, '1', '2020-05-06 13:17:13.802929'),
(3541, 1, '1', '2020-05-06 13:17:19.977984'),
(3542, 1, '1', '2020-05-06 13:17:26.077439'),
(3543, 1, '1', '2020-05-06 13:17:40.327516'),
(3544, 1, '1', '2020-05-06 13:17:46.360565'),
(3545, 1, '1', '2020-05-06 13:17:52.502429'),
(3546, 1, '1', '2020-05-06 13:18:04.700336'),
(3547, 1, '1', '2020-05-06 13:18:10.817874'),
(3548, 1, '1', '2020-05-06 13:18:18.867458'),
(3549, 1, '1', '2020-05-06 13:18:33.092090'),
(3550, 1, '1', '2020-05-06 13:18:37.083240'),
(3551, 1, '1', '2020-05-06 13:18:43.274264'),
(3552, 1, '1', '2020-05-06 13:19:03.540810'),
(3553, 1, '1', '2020-05-06 13:19:09.748998'),
(3554, 1, '1', '2020-05-06 13:19:13.682540'),
(3555, 1, '1', '2020-05-06 13:19:28.040162'),
(3556, 1, '1', '2020-05-06 13:19:32.039780'),
(3557, 1, '1', '2020-05-06 13:19:38.181013'),
(3558, 1, '1', '2020-05-06 13:19:56.522971'),
(3559, 1, '1', '2020-05-06 13:20:00.538342'),
(3560, 1, '1', '2020-05-06 13:20:07.596701'),
(3561, 1, '1', '2020-05-06 13:20:23.857912'),
(3562, 1, '1', '2020-05-06 13:20:30.019881'),
(3563, 1, '1', '2020-05-06 13:20:39.179087'),
(3564, 1, '1', '2020-05-06 13:20:55.346617'),
(3565, 1, '1', '2020-05-06 13:20:57.443794'),
(3566, 1, '1', '2020-05-06 13:21:01.521666'),
(3567, 1, '1', '2020-05-06 13:21:17.751933'),
(3568, 1, '1', '2020-05-06 13:21:25.854043'),
(3569, 1, '1', '2020-05-06 13:21:31.932631'),
(3570, 1, '1', '2020-05-06 13:21:42.141850'),
(3571, 1, '1', '2020-05-06 13:21:44.037288'),
(3572, 1, '1', '2020-05-06 13:21:48.217727'),
(3573, 1, '1', '2020-05-06 13:22:08.450417'),
(3574, 1, '1', '2020-05-06 13:22:14.591706'),
(3575, 1, '1', '2020-05-06 13:22:20.644529'),
(3576, 1, '1', '2020-05-06 13:22:38.891118'),
(3577, 1, '1', '2020-05-06 13:22:42.923230'),
(3578, 1, '1', '2020-05-06 13:22:46.989670'),
(3579, 1, '1', '2020-05-06 13:23:08.384792'),
(3580, 1, '1', '2020-05-06 13:23:14.622446'),
(3581, 1, '1', '2020-05-06 13:23:16.513453'),
(3582, 1, '1', '2020-05-06 13:23:28.729999'),
(3583, 1, '1', '2020-05-06 13:23:34.879875'),
(3584, 1, '1', '2020-05-06 13:23:43.013020'),
(3585, 1, '1', '2020-05-06 13:24:03.345805'),
(3586, 1, '1', '2020-05-06 13:24:05.321282'),
(3587, 1, '1', '2020-05-06 13:24:09.386082'),
(3588, 1, '1', '2020-05-06 13:24:21.636917'),
(3589, 1, '1', '2020-05-06 13:24:29.353545'),
(3590, 1, '1', '2020-05-06 13:24:36.828873'),
(3591, 1, '1', '2020-05-06 13:24:55.178028'),
(3592, 1, '1', '2020-05-06 13:24:59.187079'),
(3593, 1, '1', '2020-05-06 13:25:04.176390'),
(3594, 1, '1', '2020-05-06 13:25:18.436186'),
(3595, 1, '1', '2020-05-06 13:25:26.742166'),
(3596, 1, '1', '2020-05-06 13:25:34.810914'),
(3597, 1, '1', '2020-05-06 13:25:53.058005'),
(3598, 1, '1', '2020-05-06 13:25:57.116538'),
(3599, 1, '1', '2020-05-06 13:25:59.084783'),
(3600, 1, '1', '2020-05-06 13:26:09.287751'),
(3601, 1, '1', '2020-05-06 13:26:15.498421'),
(3602, 1, '1', '2020-05-06 13:26:21.593109'),
(3603, 1, '1', '2020-05-06 13:26:45.896507'),
(3604, 1, '1', '2020-05-06 13:26:47.884089'),
(3605, 1, '1', '2020-05-06 13:26:49.906134'),
(3606, 1, '1', '2020-05-06 13:26:58.047019'),
(3607, 1, '1', '2020-05-06 13:27:04.250546'),
(3608, 1, '1', '2020-05-06 13:27:08.221843'),
(3609, 1, '1', '2020-05-06 13:27:18.354827'),
(3610, 1, '1', '2020-05-06 13:27:20.416916'),
(3611, 1, '1', '2020-05-06 13:27:22.525176'),
(3612, 1, '1', '2020-05-06 13:27:28.608653'),
(3613, 1, '1', '2020-05-06 13:27:34.704080'),
(3614, 1, '1', '2020-05-06 13:27:38.878719'),
(3615, 1, '1', '2020-05-06 13:27:50.911570'),
(3616, 1, '1', '2020-05-06 13:27:55.034417'),
(3617, 1, '1', '2020-05-06 13:27:57.186496'),
(3618, 1, '1', '2020-05-06 13:28:07.127452'),
(3619, 1, '1', '2020-05-06 13:28:09.410357'),
(3620, 1, '1', '2020-05-06 13:28:11.365865'),
(3621, 1, '1', '2020-05-06 13:28:19.351933'),
(3622, 1, '1', '2020-05-06 13:28:25.543725'),
(3623, 1, '1', '2020-05-06 13:28:29.577027'),
(3624, 1, '1', '2020-05-06 13:28:37.700634'),
(3625, 1, '1', '2020-05-06 13:28:39.718120'),
(3626, 1, '1', '2020-05-06 13:28:41.959249'),
(3627, 1, '1', '2020-05-06 13:28:49.857090'),
(3628, 1, '1', '2020-05-06 13:28:53.875532'),
(3629, 1, '1', '2020-05-06 13:28:58.115458'),
(3630, 1, '1', '2020-05-06 13:29:12.291910'),
(3631, 1, '1', '2020-05-06 13:29:14.425641'),
(3632, 1, '1', '2020-05-06 13:29:18.316212'),
(3633, 1, '1', '2020-05-06 13:29:26.466724'),
(3634, 1, '1', '2020-05-06 13:29:28.489415'),
(3635, 1, '1', '2020-05-06 13:29:30.473370'),
(3636, 1, '1', '2020-05-06 13:29:42.707114'),
(3637, 1, '1', '2020-05-06 13:29:46.831584'),
(3638, 1, '1', '2020-05-06 13:29:48.781686'),
(3639, 1, '1', '2020-05-06 13:29:54.931052'),
(3640, 1, '1', '2020-05-06 13:29:59.006416'),
(3641, 1, '1', '2020-05-06 13:30:03.006035'),
(3642, 1, '1', '2020-05-06 13:30:15.206033'),
(3643, 1, '1', '2020-05-06 13:30:19.313909'),
(3644, 1, '1', '2020-05-06 13:30:23.439543'),
(3645, 1, '1', '2020-05-06 13:30:32.505315'),
(3646, 1, '1', '2020-05-06 13:30:36.613666'),
(3647, 1, '1', '2020-05-06 13:30:38.680932'),
(3648, 1, '1', '2020-05-06 13:30:49.729578'),
(3649, 1, '1', '2020-05-06 13:30:54.846710'),
(3650, 1, '1', '2020-05-06 13:30:58.953873'),
(3651, 1, '1', '2020-05-06 13:31:07.088346'),
(3652, 1, '1', '2020-05-06 13:31:09.396623'),
(3653, 1, '1', '2020-05-06 13:31:11.087621'),
(3654, 1, '1', '2020-05-06 13:31:17.270428'),
(3655, 1, '1', '2020-05-06 13:31:21.262019'),
(3656, 1, '1', '2020-05-06 13:31:25.528649'),
(3657, 1, '1', '2020-05-06 13:31:39.722878'),
(3658, 1, '1', '2020-05-06 13:31:43.760309'),
(3659, 1, '1', '2020-05-06 13:31:45.812525'),
(3660, 1, '1', '2020-05-06 13:31:55.870850'),
(3661, 1, '1', '2020-05-06 13:31:58.370575'),
(3662, 1, '1', '2020-05-06 13:31:59.886974'),
(3663, 1, '1', '2020-05-06 13:32:08.045176'),
(3664, 1, '1', '2020-05-06 13:32:12.117948'),
(3665, 1, '1', '2020-05-06 13:32:16.318332'),
(3666, 1, '1', '2020-05-06 13:32:26.361603'),
(3667, 1, '1', '2020-05-06 13:32:28.303227'),
(3668, 1, '1', '2020-05-06 13:32:30.375782'),
(3669, 1, '1', '2020-05-06 13:32:40.583309'),
(3670, 1, '1', '2020-05-06 13:32:44.652780'),
(3671, 1, '1', '2020-05-06 13:32:48.727713'),
(3672, 1, '1', '2020-05-06 13:32:58.877822'),
(3673, 1, '1', '2020-05-06 13:33:00.911200'),
(3674, 1, '1', '2020-05-06 13:33:04.982309'),
(3675, 1, '1', '2020-05-06 13:33:15.135772'),
(3676, 1, '1', '2020-05-06 13:33:17.189619'),
(3677, 1, '1', '2020-05-06 13:33:21.189807'),
(3678, 1, '1', '2020-05-06 13:33:33.326283'),
(3679, 1, '1', '2020-05-06 13:33:35.672648'),
(3680, 1, '1', '2020-05-06 13:33:37.614236'),
(3681, 1, '1', '2020-05-06 13:33:43.531116'),
(3682, 1, '1', '2020-05-06 13:33:45.556482'),
(3683, 1, '1', '2020-05-06 13:33:49.696911'),
(3684, 1, '1', '2020-05-06 13:34:03.909715'),
(3685, 1, '1', '2020-05-06 13:34:07.984554'),
(3686, 1, '1', '2020-05-06 13:34:12.171509'),
(3687, 1, '1', '2020-05-06 13:34:22.196282'),
(3688, 1, '1', '2020-05-06 13:34:24.204753'),
(3689, 1, '1', '2020-05-06 13:34:26.312433'),
(3690, 1, '1', '2020-05-06 13:34:32.375195'),
(3691, 1, '1', '2020-05-06 13:34:36.537711'),
(3692, 1, '1', '2020-05-06 13:34:40.604023'),
(3693, 1, '1', '2020-05-06 13:34:52.753097'),
(3694, 1, '1', '2020-05-06 13:34:54.719673'),
(3695, 1, '1', '2020-05-06 13:34:56.819426'),
(3696, 1, '1', '2020-05-06 13:35:04.875431'),
(3697, 1, '1', '2020-05-06 13:35:08.977396'),
(3698, 1, '1', '2020-05-06 13:35:11.127384'),
(3699, 1, '1', '2020-05-06 13:35:23.227291'),
(3700, 1, '1', '2020-05-06 13:35:27.259501'),
(3701, 1, '1', '2020-05-06 13:35:29.360035'),
(3702, 1, '1', '2020-05-06 13:35:41.501454'),
(3703, 1, '1', '2020-05-06 13:35:43.526309'),
(3704, 1, '1', '2020-05-06 13:35:45.517618'),
(3705, 1, '1', '2020-05-06 13:35:55.735373'),
(3706, 1, '1', '2020-05-06 13:35:59.833934'),
(3707, 1, '1', '2020-05-06 13:36:03.841915'),
(3708, 1, '1', '2020-05-06 13:36:10.150414'),
(3709, 1, '1', '2020-05-06 13:36:12.017662'),
(3710, 1, '1', '2020-05-06 13:36:13.991774'),
(3711, 1, '1', '2020-05-06 13:36:26.256872'),
(3712, 1, '1', '2020-05-06 13:36:30.441198'),
(3713, 1, '1', '2020-05-06 13:36:34.407717'),
(3714, 1, '1', '2020-05-06 13:36:44.456597'),
(3715, 1, '1', '2020-05-06 13:36:48.565098'),
(3716, 1, '1', '2020-05-06 13:36:52.864805'),
(3717, 1, '1', '2020-05-06 13:36:58.748587'),
(3718, 1, '1', '2020-05-06 13:37:00.706944'),
(3719, 1, '1', '2020-05-06 13:37:02.831439'),
(3720, 1, '1', '2020-05-06 13:37:17.081673'),
(3721, 1, '1', '2020-05-06 13:37:21.056459'),
(3722, 1, '1', '2020-05-06 13:37:23.073656'),
(3723, 1, '1', '2020-05-06 13:37:29.248713'),
(3724, 1, '1', '2020-05-06 13:37:31.206903'),
(3725, 1, '1', '2020-05-06 13:37:35.348565'),
(3726, 1, '1', '2020-05-06 13:37:45.529823'),
(3727, 1, '1', '2020-05-06 13:37:49.564655'),
(3728, 1, '1', '2020-05-06 13:37:53.713118'),
(3729, 1, '1', '2020-05-06 13:38:05.914378'),
(3730, 1, '1', '2020-05-06 13:38:09.980792'),
(3731, 1, '1', '2020-05-06 13:38:12.022402'),
(3732, 1, '1', '2020-05-06 13:38:18.044519'),
(3733, 1, '1', '2020-05-06 13:38:22.153067'),
(3734, 1, '1', '2020-05-06 13:38:26.172556'),
(3735, 1, '1', '2020-05-06 13:38:36.253070'),
(3736, 1, '1', '2020-05-06 13:38:38.367502'),
(3737, 1, '1', '2020-05-06 13:38:40.438911'),
(3738, 1, '1', '2020-05-06 13:38:48.551974'),
(3739, 1, '1', '2020-05-06 13:38:52.543747'),
(3740, 1, '1', '2020-05-06 13:38:56.617894'),
(3741, 1, '1', '2020-05-06 13:39:08.843754'),
(3742, 1, '1', '2020-05-06 13:39:12.817750'),
(3743, 1, '1', '2020-05-06 13:39:14.896264'),
(3744, 1, '1', '2020-05-06 13:39:25.012817'),
(3745, 1, '1', '2020-05-06 13:39:27.101227'),
(3746, 1, '1', '2020-05-06 13:39:29.025518'),
(3747, 1, '1', '2020-05-06 13:39:39.353930'),
(3748, 1, '1', '2020-05-06 13:39:43.391352'),
(3749, 1, '1', '2020-05-06 13:39:47.420608'),
(3750, 1, '1', '2020-05-06 13:39:55.561715'),
(3751, 1, '1', '2020-05-06 13:39:57.590981'),
(3752, 1, '1', '2020-05-06 13:39:59.595840'),
(3753, 1, '1', '2020-05-06 13:40:07.846135'),
(3754, 1, '1', '2020-05-06 13:40:11.907847'),
(3755, 1, '1', '2020-05-06 13:40:15.849349'),
(3756, 1, '1', '2020-05-06 13:40:30.098521'),
(3757, 1, '1', '2020-05-06 13:40:32.136210'),
(3758, 1, '1', '2020-05-06 13:40:36.239887'),
(3759, 1, '1', '2020-05-06 13:40:44.419671'),
(3760, 1, '1', '2020-05-06 13:40:46.513802'),
(3761, 1, '1', '2020-05-06 13:40:48.444597'),
(3762, 1, '1', '2020-05-06 13:40:58.739021'),
(3763, 1, '1', '2020-05-06 13:41:02.655260'),
(3764, 1, '1', '2020-05-06 13:41:06.630758'),
(3765, 1, '1', '2020-05-06 13:41:14.838240'),
(3766, 1, '1', '2020-05-06 13:41:18.796975'),
(3767, 1, '1', '2020-05-06 13:41:22.026536'),
(3768, 1, '1', '2020-05-06 13:41:34.129260'),
(3769, 1, '1', '2020-05-06 13:41:38.229539'),
(3770, 1, '1', '2020-05-06 13:41:42.220430'),
(3771, 1, '1', '2020-05-06 13:41:50.370272'),
(3772, 1, '1', '2020-05-06 13:41:54.403026'),
(3773, 1, '1', '2020-05-06 13:41:58.777727'),
(3774, 1, '1', '2020-05-06 13:42:06.678285'),
(3775, 1, '1', '2020-05-06 13:42:10.692748'),
(3776, 1, '1', '2020-05-06 13:42:12.719233'),
(3777, 1, '1', '2020-05-06 13:42:18.869138'),
(3778, 1, '1', '2020-05-06 13:42:21.052940'),
(3779, 1, '1', '2020-05-06 13:42:23.119176'),
(3780, 1, '1', '2020-05-06 13:42:29.010440'),
(3781, 1, '1', '2020-05-06 13:42:31.051684'),
(3782, 1, '1', '2020-05-06 13:42:33.118127'),
(3783, 1, '1', '2020-05-06 13:42:39.343082'),
(3784, 1, '1', '2020-05-06 13:42:41.176193'),
(3785, 1, '1', '2020-05-06 13:42:45.401492'),
(3786, 1, '1', '2020-05-06 13:42:53.834081'),
(3787, 1, '1', '2020-05-06 13:42:54.392568'),
(3788, 1, '1', '2020-05-06 13:42:56.517628'),
(3789, 1, '1', '2020-05-06 13:43:02.550503'),
(3790, 1, '1', '2020-05-06 13:43:04.542383'),
(3791, 1, '1', '2020-05-06 13:43:06.675493'),
(3792, 1, '1', '2020-05-06 13:43:12.833051'),
(3793, 1, '1', '2020-05-06 13:43:14.758406'),
(3794, 1, '1', '2020-05-06 13:43:16.966196'),
(3795, 1, '1', '2020-05-06 13:43:22.867182'),
(3796, 1, '1', '2020-05-06 13:43:25.341413'),
(3797, 1, '1', '2020-05-06 13:43:27.049415'),
(3798, 1, '1', '2020-05-06 13:43:37.275211'),
(3799, 1, '1', '2020-05-06 13:43:38.174862'),
(3800, 1, '1', '2020-05-06 13:43:40.107664'),
(3801, 1, '1', '2020-05-06 13:43:48.325916'),
(3802, 1, '1', '2020-05-06 13:43:49.373580'),
(3803, 1, '1', '2020-05-06 13:43:51.342514'),
(3804, 1, '1', '2020-05-06 13:43:57.808979'),
(3805, 1, '1', '2020-05-06 13:43:59.675696'),
(3806, 1, '1', '2020-05-06 13:44:01.567558'),
(3807, 1, '1', '2020-05-06 13:44:08.673006'),
(3808, 1, '1', '2020-05-06 13:44:12.538861'),
(3809, 1, '1', '2020-05-06 13:44:15.722116'),
(3810, 1, '1', '2020-05-06 13:44:22.764506'),
(3811, 1, '1', '2020-05-06 13:44:24.916882'),
(3812, 1, '1', '2020-05-06 13:44:27.474341'),
(3813, 1, '1', '2020-05-06 13:44:32.975192'),
(3814, 1, '1', '2020-05-06 13:44:35.324811'),
(3815, 1, '1', '2020-05-06 13:44:37.097192'),
(3816, 1, '1', '2020-05-06 13:44:43.139122'),
(3817, 1, '1', '2020-05-06 13:44:45.162380'),
(3818, 1, '1', '2020-05-06 13:44:47.179916'),
(3819, 1, '1', '2020-05-06 13:44:53.337385'),
(3820, 1, '1', '2020-05-06 13:44:55.405028'),
(3821, 1, '1', '2020-05-06 13:44:57.312534'),
(3822, 1, '1', '2020-05-06 13:45:05.587541'),
(3823, 1, '1', '2020-05-06 13:45:07.582960'),
(3824, 1, '1', '2020-05-06 13:45:10.029588'),
(3825, 1, '1', '2020-05-06 13:45:16.878613'),
(3826, 1, '1', '2020-05-06 13:45:18.720283'),
(3827, 1, '1', '2020-05-06 13:45:20.725122'),
(3828, 1, '1', '2020-05-06 13:45:27.728269'),
(3829, 1, '1', '2020-05-06 13:45:29.840307'),
(3830, 1, '1', '2020-05-06 13:45:31.894337'),
(3831, 1, '1', '2020-05-06 13:45:38.894733'),
(3832, 1, '1', '2020-05-06 13:45:41.027604'),
(3833, 1, '1', '2020-05-06 13:45:43.077849'),
(3834, 1, '1', '2020-05-06 13:45:51.376976'),
(3835, 1, '1', '2020-05-06 13:45:53.476347'),
(3836, 1, '1', '2020-05-06 13:45:55.369077'),
(3837, 1, '1', '2020-05-06 13:46:01.393402'),
(3838, 1, '1', '2020-05-06 13:46:03.407007'),
(3839, 1, '1', '2020-05-06 13:46:05.409522'),
(3840, 1, '1', '2020-05-06 13:46:11.609788'),
(3841, 1, '1', '2020-05-06 13:46:13.543239'),
(3842, 1, '1', '2020-05-06 13:46:15.576157'),
(3843, 1, '1', '2020-05-06 13:46:21.659872'),
(3844, 1, '1', '2020-05-06 13:46:23.809732'),
(3845, 1, '1', '2020-05-06 13:46:25.842558'),
(3846, 1, '1', '2020-05-06 13:46:34.284071'),
(3847, 1, '1', '2020-05-06 13:46:36.974277'),
(3848, 1, '1', '2020-05-06 13:46:38.973209'),
(3849, 1, '1', '2020-05-06 13:46:45.083606'),
(3850, 1, '1', '2020-05-06 13:46:47.031376'),
(3851, 1, '1', '2020-05-06 13:46:49.199851'),
(3852, 1, '1', '2020-05-06 13:46:55.224841'),
(3853, 1, '1', '2020-05-06 13:46:58.365730'),
(3854, 1, '1', '2020-05-06 13:47:00.825318'),
(3855, 1, '1', '2020-05-06 13:47:06.782355'),
(3856, 1, '1', '2020-05-06 13:47:08.758027'),
(3857, 1, '1', '2020-05-06 13:47:10.605882'),
(3858, 1, '1', '2020-05-06 13:47:16.490995'),
(3859, 1, '1', '2020-05-06 13:47:18.565782'),
(3860, 1, '1', '2020-05-06 13:47:20.640639'),
(3861, 1, '1', '2020-05-06 13:47:28.789989'),
(3862, 1, '1', '2020-05-06 13:47:30.797983'),
(3863, 1, '1', '2020-05-06 13:47:32.756437'),
(3864, 1, '1', '2020-05-06 13:47:38.898299'),
(3865, 1, '1', '2020-05-06 13:47:40.964892'),
(3866, 1, '1', '2020-05-06 13:47:42.906526'),
(3867, 1, '1', '2020-05-06 13:47:51.097481'),
(3868, 1, '1', '2020-05-06 13:47:53.114090'),
(3869, 1, '1', '2020-05-06 13:47:55.206167'),
(3870, 1, '1', '2020-05-06 13:48:01.313379'),
(3871, 1, '1', '2020-05-06 13:48:03.255245'),
(3872, 1, '1', '2020-05-06 13:48:05.521848'),
(3873, 1, '1', '2020-05-06 13:48:13.555351'),
(3874, 1, '1', '2020-05-06 13:48:15.538204'),
(3875, 1, '1', '2020-05-06 13:48:17.554924'),
(3876, 1, '1', '2020-05-06 13:48:23.571648'),
(3877, 1, '1', '2020-05-06 13:48:25.571558'),
(3878, 1, '1', '2020-05-06 13:48:27.587960'),
(3879, 1, '1', '2020-05-06 13:48:34.821309'),
(3880, 1, '1', '2020-05-06 13:48:36.819715'),
(3881, 1, '1', '2020-05-06 13:48:38.871010'),
(3882, 1, '1', '2020-05-06 13:48:44.995576'),
(3883, 1, '1', '2020-05-06 13:48:47.011769'),
(3884, 1, '1', '2020-05-06 13:48:49.020879'),
(3885, 1, '1', '2020-05-06 13:48:57.145156'),
(3886, 1, '1', '2020-05-06 13:48:59.195766'),
(3887, 1, '1', '2020-05-06 13:49:01.229288'),
(3888, 1, '1', '2020-05-06 13:49:07.654137'),
(3889, 1, '1', '2020-05-06 13:49:09.578587'),
(3890, 1, '1', '2020-05-06 13:49:11.461585'),
(3891, 1, '1', '2020-05-06 13:49:17.552597'),
(3892, 1, '1', '2020-05-06 13:49:19.603260'),
(3893, 1, '1', '2020-05-06 13:49:21.604025'),
(3894, 1, '1', '2020-05-06 13:49:27.637006'),
(3895, 1, '1', '2020-05-06 13:49:29.620075'),
(3896, 1, '1', '2020-05-06 13:49:31.677024'),
(3897, 1, '1', '2020-05-06 13:49:38.819850'),
(3898, 1, '1', '2020-05-06 13:49:42.846832'),
(3899, 1, '1', '2020-05-06 13:49:44.826600'),
(3900, 1, '1', '2020-05-06 13:49:50.925837'),
(3901, 1, '1', '2020-05-06 13:49:53.051127'),
(3902, 1, '1', '2020-05-06 13:49:55.092982'),
(3903, 1, '1', '2020-05-06 13:50:01.192344'),
(3904, 1, '1', '2020-05-06 13:50:03.192271'),
(3905, 1, '1', '2020-05-06 13:50:05.359007'),
(3906, 1, '1', '2020-05-06 13:50:11.312929'),
(3907, 1, '1', '2020-05-06 13:50:13.366848'),
(3908, 1, '1', '2020-05-06 13:50:15.392118'),
(3909, 1, '1', '2020-05-06 13:50:21.458109'),
(3910, 1, '1', '2020-05-06 13:50:23.524627'),
(3911, 1, '1', '2020-05-06 13:50:25.624759'),
(3912, 1, '1', '2020-05-06 13:50:33.675110'),
(3913, 1, '1', '2020-05-06 13:50:35.891220'),
(3914, 1, '1', '2020-05-06 13:50:37.682924'),
(3915, 1, '1', '2020-05-06 13:50:43.890330'),
(3916, 1, '1', '2020-05-06 13:50:45.924074'),
(3917, 1, '1', '2020-05-06 13:50:47.983027'),
(3918, 1, '1', '2020-05-06 13:50:54.238498'),
(3919, 1, '1', '2020-05-06 13:50:56.173720'),
(3920, 1, '1', '2020-05-06 13:50:58.107902'),
(3921, 1, '1', '2020-05-06 13:51:04.257899'),
(3922, 1, '1', '2020-05-06 13:51:06.249241'),
(3923, 1, '1', '2020-05-06 13:51:08.214926'),
(3924, 1, '1', '2020-05-06 13:51:16.441853'),
(3925, 1, '1', '2020-05-06 13:51:18.398234'),
(3926, 1, '1', '2020-05-06 13:51:20.430406'),
(3927, 1, '1', '2020-05-06 13:51:28.572857'),
(3928, 1, '1', '2020-05-06 13:51:29.566771'),
(3929, 1, '1', '2020-05-06 13:51:31.555923'),
(3930, 1, '1', '2020-05-06 13:51:37.714163'),
(3931, 1, '1', '2020-05-06 13:51:39.778341'),
(3932, 1, '1', '2020-05-06 13:51:41.722605'),
(3933, 1, '1', '2020-05-06 13:51:48.763243'),
(3934, 1, '1', '2020-05-06 13:51:50.924224'),
(3935, 1, '1', '2020-05-06 13:51:54.614641'),
(3936, 1, '1', '2020-05-06 13:52:01.954574'),
(3937, 1, '1', '2020-05-06 13:52:03.932306'),
(3938, 1, '1', '2020-05-06 13:52:06.038199'),
(3939, 1, '1', '2020-05-06 13:52:12.170239'),
(3940, 1, '1', '2020-05-06 13:52:14.107841'),
(3941, 1, '1', '2020-05-06 13:52:16.204144'),
(3942, 1, '1', '2020-05-06 13:52:22.232735'),
(3943, 1, '1', '2020-05-06 13:52:24.244927'),
(3944, 1, '1', '2020-05-06 13:52:26.320523'),
(3945, 1, '1', '2020-05-06 13:52:32.569632'),
(3946, 1, '1', '2020-05-06 13:52:34.403266'),
(3947, 1, '1', '2020-05-06 13:52:36.461180'),
(3948, 1, '1', '2020-05-06 13:52:42.510560'),
(3949, 1, '1', '2020-05-06 13:52:44.577878'),
(3950, 1, '1', '2020-05-06 13:52:48.594376'),
(3951, 1, '1', '2020-05-06 13:52:54.740313'),
(3952, 1, '1', '2020-05-06 13:52:56.726192'),
(3953, 1, '1', '2020-05-06 13:52:58.818702'),
(3954, 1, '1', '2020-05-06 13:53:04.926429'),
(3955, 1, '1', '2020-05-06 13:53:06.885012'),
(3956, 1, '1', '2020-05-06 13:53:08.951936'),
(3957, 1, '1', '2020-05-06 13:53:15.001504'),
(3958, 1, '1', '2020-05-06 13:53:17.193301'),
(3959, 1, '1', '2020-05-06 13:53:19.106815'),
(3960, 1, '1', '2020-05-06 13:53:25.132565'),
(3961, 1, '1', '2020-05-06 13:53:27.142915'),
(3962, 1, '1', '2020-05-06 13:53:29.142661'),
(3963, 1, '1', '2020-05-06 13:53:37.226064'),
(3964, 1, '1', '2020-05-06 13:53:39.257003'),
(3965, 1, '1', '2020-05-06 13:53:41.291914'),
(3966, 1, '1', '2020-05-06 13:53:47.541916'),
(3967, 1, '1', '2020-05-06 13:53:49.492297'),
(3968, 1, '1', '2020-05-06 13:53:51.583077'),
(3969, 1, '1', '2020-05-06 13:53:57.616437'),
(3970, 1, '1', '2020-05-06 13:53:59.599913'),
(3971, 1, '1', '2020-05-06 13:54:01.732754'),
(3972, 1, '1', '2020-05-06 13:54:07.716459'),
(3973, 1, '1', '2020-05-06 13:54:09.957377'),
(3974, 1, '1', '2020-05-06 13:54:11.924024'),
(3975, 1, '1', '2020-05-06 13:54:18.190423'),
(3976, 1, '1', '2020-05-06 13:54:21.948966'),
(3977, 1, '1', '2020-05-06 13:54:24.023560'),
(3978, 1, '1', '2020-05-06 13:54:30.182083'),
(3979, 1, '1', '2020-05-06 13:54:32.087438'),
(3980, 1, '1', '2020-05-06 13:54:34.231093'),
(3981, 1, '1', '2020-05-06 13:54:40.273277'),
(3982, 1, '1', '2020-05-06 13:54:42.380829'),
(3983, 1, '1', '2020-05-06 13:54:44.314849'),
(3984, 1, '1', '2020-05-06 13:54:50.481023'),
(3985, 1, '1', '2020-05-06 13:54:52.505845'),
(3986, 1, '1', '2020-05-06 13:54:54.563879'),
(3987, 1, '1', '2020-05-06 13:55:00.705935'),
(3988, 1, '1', '2020-05-06 13:55:02.671472'),
(3989, 1, '1', '2020-05-06 13:55:04.680363'),
(3990, 1, '1', '2020-05-06 13:55:12.963328'),
(3991, 1, '1', '2020-05-06 13:55:14.829935'),
(3992, 1, '1', '2020-05-06 13:55:16.880710'),
(3993, 1, '1', '2020-05-06 13:55:22.913561'),
(3994, 1, '1', '2020-05-06 13:55:25.019040'),
(3995, 1, '1', '2020-05-06 13:55:27.021795'),
(3996, 1, '1', '2020-05-06 13:55:33.180081'),
(3997, 1, '1', '2020-05-06 13:55:35.188174'),
(3998, 1, '1', '2020-05-06 13:55:37.212038'),
(3999, 1, '1', '2020-05-06 13:55:43.321818'),
(4000, 1, '1', '2020-05-06 13:55:45.437108'),
(4001, 1, '1', '2020-05-06 13:55:47.295154'),
(4002, 1, '1', '2020-05-06 13:55:55.446215'),
(4003, 1, '1', '2020-05-06 13:55:57.597351'),
(4004, 1, '1', '2020-05-06 13:55:59.521827'),
(4005, 1, '1', '2020-05-06 13:56:05.613154'),
(4006, 1, '1', '2020-05-06 13:56:07.688113'),
(4007, 1, '1', '2020-05-06 13:56:09.671149'),
(4008, 1, '1', '2020-05-06 13:56:15.746209'),
(4009, 1, '1', '2020-05-06 13:56:17.887829'),
(4010, 1, '1', '2020-05-06 13:56:19.894658'),
(4011, 1, '1', '2020-05-06 13:56:26.218876'),
(4012, 1, '1', '2020-05-06 13:56:27.996147'),
(4013, 1, '1', '2020-05-06 13:56:29.937933'),
(4014, 1, '1', '2020-05-06 13:56:36.092853'),
(4015, 1, '1', '2020-05-06 13:56:38.160242'),
(4016, 1, '1', '2020-05-06 13:56:42.193279'),
(4017, 1, '1', '2020-05-06 13:56:48.259792'),
(4018, 1, '1', '2020-05-06 13:56:50.293285'),
(4019, 1, '1', '2020-05-06 13:56:52.305377'),
(4020, 1, '1', '2020-05-06 13:56:58.417478'),
(4021, 1, '1', '2020-05-06 13:57:00.649084'),
(4022, 1, '1', '2020-05-06 13:57:02.633976'),
(4023, 1, '1', '2020-05-06 13:57:08.738824'),
(4024, 1, '1', '2020-05-06 13:57:10.654973'),
(4025, 1, '1', '2020-05-06 13:57:12.767133'),
(4026, 1, '1', '2020-05-06 13:57:18.791554'),
(4027, 1, '1', '2020-05-06 13:57:20.849926'),
(4028, 1, '1', '2020-05-06 13:57:22.913619'),
(4029, 1, '1', '2020-05-06 13:57:30.982393'),
(4030, 1, '1', '2020-05-06 13:57:33.124697'),
(4031, 1, '1', '2020-05-06 13:57:35.116457'),
(4032, 1, '1', '2020-05-06 13:57:43.199931'),
(4033, 1, '1', '2020-05-06 13:57:44.129635'),
(4034, 1, '1', '2020-05-06 13:57:46.424076'),
(4035, 1, '1', '2020-05-06 13:57:52.407087'),
(4036, 1, '1', '2020-05-06 13:57:54.415438'),
(4037, 1, '1', '2020-05-06 13:57:56.432134'),
(4038, 1, '1', '2020-05-06 13:58:03.773708'),
(4039, 1, '1', '2020-05-06 13:58:05.598878'),
(4040, 1, '1', '2020-05-06 13:58:07.514291'),
(4041, 1, '1', '2020-05-06 13:58:15.814743'),
(4042, 1, '1', '2020-05-06 13:58:17.778703'),
(4043, 1, '1', '2020-05-06 13:58:19.831304'),
(4044, 1, '1', '2020-05-06 13:58:25.996959'),
(4045, 1, '1', '2020-05-06 13:58:27.881282'),
(4046, 1, '1', '2020-05-06 13:58:29.946943'),
(4047, 1, '1', '2020-05-06 13:58:36.214102'),
(4048, 1, '1', '2020-05-06 13:58:38.221903'),
(4049, 1, '1', '2020-05-06 13:58:40.213458'),
(4050, 1, '1', '2020-05-06 13:58:46.245474'),
(4051, 1, '1', '2020-05-06 13:58:48.246902'),
(4052, 1, '1', '2020-05-06 13:58:50.271788'),
(4053, 1, '1', '2020-05-06 13:58:56.487838'),
(4054, 1, '1', '2020-05-06 13:58:58.437942'),
(4055, 1, '1', '2020-05-06 13:59:04.587615'),
(4056, 1, '1', '2020-05-06 13:59:09.845322'),
(4057, 1, '1', '2020-05-06 13:59:11.668436'),
(4058, 1, '1', '2020-05-06 13:59:13.869924'),
(4059, 1, '1', '2020-05-06 13:59:19.862736'),
(4060, 1, '1', '2020-05-06 13:59:21.936481'),
(4061, 1, '1', '2020-05-06 13:59:23.970205'),
(4062, 1, '1', '2020-05-06 13:59:29.987243'),
(4063, 1, '1', '2020-05-06 13:59:31.896608'),
(4064, 1, '1', '2020-05-06 13:59:33.963264'),
(4065, 1, '1', '2020-05-06 13:59:40.011412'),
(4066, 1, '1', '2020-05-06 13:59:42.094875'),
(4067, 1, '1', '2020-05-06 13:59:44.053429'),
(4068, 1, '1', '2020-05-06 13:59:52.194070'),
(4069, 1, '1', '2020-05-06 13:59:54.219209'),
(4070, 1, '1', '2020-05-06 13:59:56.235306'),
(4071, 1, '1', '2020-05-06 14:00:02.662963'),
(4072, 1, '1', '2020-05-06 14:00:04.752231'),
(4073, 1, '1', '2020-05-06 14:00:06.660898'),
(4074, 1, '1', '2020-05-06 14:00:13.051144'),
(4075, 1, '1', '2020-05-06 14:00:14.727642'),
(4076, 1, '1', '2020-05-06 14:00:16.851070'),
(4077, 1, '1', '2020-05-06 14:00:23.285165'),
(4078, 1, '1', '2020-05-06 14:00:24.817919'),
(4079, 1, '1', '2020-05-06 14:00:26.935879'),
(4080, 1, '1', '2020-05-06 14:00:37.175513'),
(4081, 1, '1', '2020-05-06 14:00:39.702611'),
(4082, 1, '1', '2020-05-06 14:00:41.252388'),
(4083, 1, '1', '2020-05-06 14:00:47.158655'),
(4084, 1, '1', '2020-05-06 14:00:49.158710'),
(4085, 1, '1', '2020-05-06 14:00:51.441540'),
(4086, 1, '1', '2020-05-06 14:00:57.339612'),
(4087, 1, '1', '2020-05-06 14:00:59.652100'),
(4088, 1, '1', '2020-05-06 14:01:01.623814'),
(4089, 1, '1', '2020-05-06 14:01:07.457653'),
(4090, 1, '1', '2020-05-06 14:01:09.368577'),
(4091, 1, '1', '2020-05-06 14:01:11.365856'),
(4092, 1, '1', '2020-05-06 14:01:17.468605'),
(4093, 1, '1', '2020-05-06 14:01:19.532445'),
(4094, 1, '1', '2020-05-06 14:01:21.524066'),
(4095, 1, '1', '2020-05-06 14:01:30.051367'),
(4096, 1, '1', '2020-05-06 14:01:31.690425'),
(4097, 1, '1', '2020-05-06 14:01:33.776219'),
(4098, 1, '1', '2020-05-06 14:01:40.173140'),
(4099, 1, '1', '2020-05-06 14:01:41.990262'),
(4100, 1, '1', '2020-05-06 14:01:44.214221'),
(4101, 1, '1', '2020-05-06 14:01:52.923066'),
(4102, 1, '1', '2020-05-06 14:01:54.464129'),
(4103, 1, '1', '2020-05-06 14:01:55.994073'),
(4104, 1, '1', '2020-05-06 14:02:02.202400'),
(4105, 1, '1', '2020-05-06 14:02:04.229636'),
(4106, 1, '1', '2020-05-06 14:02:06.305756'),
(4107, 1, '1', '2020-05-06 14:02:14.404772'),
(4108, 1, '1', '2020-05-06 14:02:17.455657'),
(4109, 1, '1', '2020-05-06 14:02:21.368804'),
(4110, 1, '1', '2020-05-06 14:02:27.587721'),
(4111, 1, '1', '2020-05-06 14:02:29.556689'),
(4112, 1, '1', '2020-05-06 14:02:31.713250'),
(4113, 1, '1', '2020-05-06 14:02:37.787563'),
(4114, 1, '1', '2020-05-06 14:02:39.729007'),
(4115, 1, '1', '2020-05-06 14:02:41.845958'),
(4116, 1, '1', '2020-05-06 14:02:48.794845'),
(4117, 1, '1', '2020-05-06 14:02:51.169863'),
(4118, 1, '1', '2020-05-06 14:02:52.987597'),
(4119, 1, '1', '2020-05-06 14:02:59.012095'),
(4120, 1, '1', '2020-05-06 14:03:03.078874'),
(4121, 1, '1', '2020-05-06 14:03:05.261529'),
(4122, 1, '1', '2020-05-06 14:03:11.244857'),
(4123, 1, '1', '2020-05-06 14:03:13.278051'),
(4124, 1, '1', '2020-05-06 14:03:15.277845'),
(4125, 1, '1', '2020-05-06 14:03:21.336300'),
(4126, 1, '1', '2020-05-06 14:03:23.669097'),
(4127, 1, '1', '2020-05-06 14:03:25.426889'),
(4128, 1, '1', '2020-05-06 14:03:31.709655'),
(4129, 1, '1', '2020-05-06 14:03:33.750663'),
(4130, 1, '1', '2020-05-06 14:03:35.677483'),
(4131, 1, '1', '2020-05-06 14:03:41.785463'),
(4132, 1, '1', '2020-05-06 14:03:43.818725'),
(4133, 1, '1', '2020-05-06 14:03:45.776269'),
(4134, 1, '1', '2020-05-06 14:03:54.026243'),
(4135, 1, '1', '2020-05-06 14:03:56.050498'),
(4136, 1, '1', '2020-05-06 14:03:58.025550'),
(4137, 1, '1', '2020-05-06 14:04:04.126304'),
(4138, 1, '1', '2020-05-06 14:04:06.334712'),
(4139, 1, '1', '2020-05-06 14:04:08.317840'),
(4140, 1, '1', '2020-05-06 14:04:14.433871'),
(4141, 1, '1', '2020-05-06 14:04:16.425666'),
(4142, 1, '1', '2020-05-06 14:04:18.492653'),
(4143, 1, '1', '2020-05-06 14:04:25.549948'),
(4144, 1, '1', '2020-05-06 14:04:30.066838'),
(4145, 1, '1', '2020-05-06 14:04:30.675198'),
(4146, 1, '1', '2020-05-06 14:04:39.666355'),
(4147, 1, '1', '2020-05-06 14:04:41.632975'),
(4148, 1, '1', '2020-05-06 14:04:43.708570'),
(4149, 1, '1', '2020-05-06 14:04:49.841619'),
(4150, 1, '1', '2020-05-06 14:04:51.967102'),
(4151, 1, '1', '2020-05-06 14:04:53.974240'),
(4152, 1, '1', '2020-05-06 14:04:59.982306'),
(4153, 1, '1', '2020-05-06 14:05:02.048511'),
(4154, 1, '1', '2020-05-06 14:05:03.915317'),
(4155, 1, '1', '2020-05-06 14:05:10.131635'),
(4156, 1, '1', '2020-05-06 14:05:12.114849'),
(4157, 1, '1', '2020-05-06 14:05:14.108042'),
(4158, 1, '1', '2020-05-06 14:05:20.382961'),
(4159, 1, '1', '2020-05-06 14:05:25.399722'),
(4160, 1, '1', '2020-05-06 14:05:27.505845'),
(4161, 1, '1', '2020-05-06 14:05:33.339161'),
(4162, 1, '1', '2020-05-06 14:05:35.491149'),
(4163, 1, '1', '2020-05-06 14:05:37.480700'),
(4164, 1, '1', '2020-05-06 14:05:43.563762'),
(4165, 1, '1', '2020-05-06 14:05:45.671356'),
(4166, 1, '1', '2020-05-06 14:05:47.616153'),
(4167, 1, '1', '2020-05-06 14:05:53.747215'),
(4168, 1, '1', '2020-05-06 14:05:55.755296'),
(4169, 1, '1', '2020-05-06 14:05:57.829792'),
(4170, 1, '1', '2020-05-06 14:06:03.921393'),
(4171, 1, '1', '2020-05-06 14:06:05.924196'),
(4172, 1, '1', '2020-05-06 14:06:08.024065'),
(4173, 1, '1', '2020-05-06 14:06:16.248803'),
(4174, 1, '1', '2020-05-06 14:06:18.586962'),
(4175, 1, '1', '2020-05-06 14:06:20.214805'),
(4176, 1, '1', '2020-05-06 14:06:26.565677'),
(4177, 1, '1', '2020-05-06 14:06:28.239776'),
(4178, 1, '1', '2020-05-06 14:06:30.562164'),
(4179, 1, '1', '2020-05-06 14:06:36.573567'),
(4180, 1, '1', '2020-05-06 14:06:38.661276'),
(4181, 1, '1', '2020-05-06 14:06:40.420198'),
(4182, 1, '1', '2020-05-06 14:06:46.569220'),
(4183, 1, '1', '2020-05-06 14:06:48.586626'),
(4184, 1, '1', '2020-05-06 14:06:50.736209'),
(4185, 1, '1', '2020-05-06 14:06:58.769511'),
(4186, 1, '1', '2020-05-06 14:07:00.964735'),
(4187, 1, '1', '2020-05-06 14:07:02.827708'),
(4188, 1, '1', '2020-05-06 14:07:08.955667'),
(4189, 1, '1', '2020-05-06 14:07:10.855945'),
(4190, 1, '1', '2020-05-06 14:07:12.935650'),
(4191, 1, '1', '2020-05-06 14:07:19.167950'),
(4192, 1, '1', '2020-05-06 14:07:21.143257'),
(4193, 1, '1', '2020-05-06 14:07:23.261148'),
(4194, 1, '1', '2020-05-06 14:07:31.340316'),
(4195, 1, '1', '2020-05-06 14:07:35.320394'),
(4196, 1, '1', '2020-05-06 14:07:36.617634'),
(4197, 1, '1', '2020-05-06 14:07:44.542531'),
(4198, 1, '1', '2020-05-06 14:07:46.949786'),
(4199, 1, '1', '2020-05-06 14:07:48.954046'),
(4200, 1, '1', '2020-05-06 14:07:55.004651'),
(4201, 1, '1', '2020-05-06 14:07:58.091740'),
(4202, 1, '1', '2020-05-06 14:08:00.650413'),
(4203, 1, '1', '2020-05-06 14:08:12.815977'),
(4204, 1, '1', '2020-05-06 14:08:14.891166'),
(4205, 1, '1', '2020-05-06 14:08:16.941167'),
(4206, 1, '1', '2020-05-06 14:08:23.015364'),
(4207, 1, '1', '2020-05-06 14:08:25.023612'),
(4208, 1, '1', '2020-05-06 14:08:29.141216'),
(4209, 1, '1', '2020-05-06 14:08:39.582460'),
(4210, 1, '1', '2020-05-06 14:08:41.732135'),
(4211, 1, '1', '2020-05-06 14:08:43.498490'),
(4212, 1, '1', '2020-05-06 14:08:49.446711'),
(4213, 1, '1', '2020-05-06 14:08:51.456589'),
(4214, 1, '1', '2020-05-06 14:08:53.398557'),
(4215, 1, '1', '2020-05-06 14:08:59.605754'),
(4216, 1, '1', '2020-05-06 14:09:01.589069'),
(4217, 1, '1', '2020-05-06 14:09:03.639308'),
(4218, 1, '1', '2020-05-06 14:09:09.697402'),
(4219, 1, '1', '2020-05-06 14:09:11.948049'),
(4220, 1, '1', '2020-05-06 14:09:13.772595'),
(4221, 1, '1', '2020-05-06 14:09:21.937803'),
(4222, 1, '1', '2020-05-06 14:09:24.022294'),
(4223, 1, '1', '2020-05-06 14:09:26.038773'),
(4224, 1, '1', '2020-05-06 14:09:32.091850'),
(4225, 1, '1', '2020-05-06 14:09:34.139169'),
(4226, 1, '1', '2020-05-06 14:09:36.173100'),
(4227, 1, '1', '2020-05-06 14:09:42.179319'),
(4228, 1, '1', '2020-05-06 14:09:44.280126'),
(4229, 1, '1', '2020-05-06 14:09:46.288248'),
(4230, 1, '1', '2020-05-06 14:09:54.627269'),
(4231, 1, '1', '2020-05-06 14:09:55.472215'),
(4232, 1, '1', '2020-05-06 14:09:57.445648'),
(4233, 1, '1', '2020-05-06 14:10:05.653890'),
(4234, 1, '1', '2020-05-06 14:10:07.679898'),
(4235, 1, '1', '2020-05-06 14:10:09.771499'),
(4236, 1, '1', '2020-05-06 14:10:15.779872'),
(4237, 1, '1', '2020-05-06 14:10:17.811097'),
(4238, 1, '1', '2020-05-06 14:10:19.878334'),
(4239, 1, '1', '2020-05-06 14:10:25.927244'),
(4240, 1, '1', '2020-05-06 14:10:28.069084'),
(4241, 1, '1', '2020-05-06 14:10:30.046059'),
(4242, 1, '1', '2020-05-06 14:10:36.321390'),
(4243, 1, '1', '2020-05-06 14:10:38.094002'),
(4244, 1, '1', '2020-05-06 14:10:40.251543'),
(4245, 1, '1', '2020-05-06 14:10:46.245847'),
(4246, 1, '1', '2020-05-06 14:10:48.260178'),
(4247, 1, '1', '2020-05-06 14:10:52.521115'),
(4248, 1, '1', '2020-05-06 14:10:58.451606'),
(4249, 1, '1', '2020-05-06 14:11:00.475748'),
(4250, 1, '1', '2020-05-06 14:11:02.587209'),
(4251, 1, '1', '2020-05-06 14:11:08.792518'),
(4252, 1, '1', '2020-05-06 14:11:10.634682'),
(4253, 1, '1', '2020-05-06 14:11:12.901118'),
(4254, 1, '1', '2020-05-06 14:11:18.812367'),
(4255, 1, '1', '2020-05-06 14:11:20.801060'),
(4256, 1, '1', '2020-05-06 14:11:22.888774'),
(4257, 1, '1', '2020-05-06 14:11:28.858077'),
(4258, 1, '1', '2020-05-06 14:11:30.944655'),
(4259, 1, '1', '2020-05-06 14:11:33.016882'),
(4260, 1, '1', '2020-05-06 14:11:41.178520'),
(4261, 1, '1', '2020-05-06 14:11:43.191325'),
(4262, 1, '1', '2020-05-06 14:11:45.178665'),
(4263, 1, '1', '2020-05-06 14:11:51.321595'),
(4264, 1, '1', '2020-05-06 14:11:53.290764'),
(4265, 1, '1', '2020-05-06 14:11:55.361686'),
(4266, 1, '1', '2020-05-06 14:12:01.440233'),
(4267, 1, '1', '2020-05-06 14:12:03.515218'),
(4268, 1, '1', '2020-05-06 14:12:05.565195'),
(4269, 1, '1', '2020-05-06 14:12:11.673558'),
(4270, 1, '1', '2020-05-06 14:12:13.589982'),
(4271, 1, '1', '2020-05-06 14:12:15.806894'),
(4272, 1, '1', '2020-05-06 14:12:21.981338'),
(4273, 1, '1', '2020-05-06 14:12:25.881893'),
(4274, 1, '1', '2020-05-06 14:12:27.890180'),
(4275, 1, '1', '2020-05-06 14:12:34.022952'),
(4276, 1, '1', '2020-05-06 14:12:36.021657'),
(4277, 1, '1', '2020-05-06 14:12:38.139457'),
(4278, 1, '1', '2020-05-06 14:12:44.281755'),
(4279, 1, '1', '2020-05-06 14:12:46.281062'),
(4280, 1, '1', '2020-05-06 14:12:48.348748'),
(4281, 1, '1', '2020-05-06 14:12:55.305350'),
(4282, 1, '1', '2020-05-06 14:12:57.381072'),
(4283, 1, '1', '2020-05-06 14:12:59.379649'),
(4284, 1, '1', '2020-05-06 14:13:05.471313'),
(4285, 1, '1', '2020-05-06 14:13:07.571052'),
(4286, 1, '1', '2020-05-06 14:13:09.563119'),
(4287, 1, '1', '2020-05-06 14:13:17.695971'),
(4288, 1, '1', '2020-05-06 14:13:19.812209'),
(4289, 1, '1', '2020-05-06 14:13:21.779025'),
(4290, 1, '1', '2020-05-06 14:13:27.972025'),
(4291, 1, '1', '2020-05-06 14:13:29.878576'),
(4292, 1, '1', '2020-05-06 14:13:31.903326'),
(4293, 1, '1', '2020-05-06 14:13:38.003650'),
(4294, 1, '1', '2020-05-06 14:13:40.219638'),
(4295, 1, '1', '2020-05-06 14:13:41.986374'),
(4296, 1, '1', '2020-05-06 14:13:48.085696'),
(4297, 1, '1', '2020-05-06 14:13:50.221867'),
(4298, 1, '1', '2020-05-06 14:13:52.252286'),
(4299, 1, '1', '2020-05-06 14:14:00.319026'),
(4300, 1, '1', '2020-05-06 14:14:02.419328'),
(4301, 1, '1', '2020-05-06 14:14:04.402767'),
(4302, 1, '1', '2020-05-06 14:14:10.513427'),
(4303, 1, '1', '2020-05-06 14:14:12.526976'),
(4304, 1, '1', '2020-05-06 14:14:14.538475'),
(4305, 1, '1', '2020-05-06 14:14:20.659968'),
(4306, 1, '1', '2020-05-06 14:14:22.743252'),
(4307, 1, '1', '2020-05-06 14:14:24.763966'),
(4308, 1, '1', '2020-05-06 14:14:30.840744'),
(4309, 1, '1', '2020-05-06 14:14:32.829266'),
(4310, 1, '1', '2020-05-06 14:14:34.917688'),
(4311, 1, '1', '2020-05-06 14:14:41.025760'),
(4312, 1, '1', '2020-05-06 14:14:43.434366'),
(4313, 1, '1', '2020-05-06 14:14:47.096480'),
(4314, 1, '1', '2020-05-06 14:14:53.150962'),
(4315, 1, '1', '2020-05-06 14:14:55.241919'),
(4316, 1, '1', '2020-05-06 14:14:57.258384'),
(4317, 1, '1', '2020-05-06 14:15:03.325355'),
(4318, 1, '1', '2020-05-06 14:15:05.483229'),
(4319, 1, '1', '2020-05-06 14:15:07.432998'),
(4320, 1, '1', '2020-05-06 14:15:13.570950'),
(4321, 1, '1', '2020-05-06 14:15:16.054187'),
(4322, 1, '1', '2020-05-06 14:15:17.704232'),
(4323, 1, '1', '2020-05-06 14:15:23.857330'),
(4324, 1, '1', '2020-05-06 14:15:25.949733'),
(4325, 1, '1', '2020-05-06 14:15:27.916138'),
(4326, 1, '1', '2020-05-06 14:15:35.915097'),
(4327, 1, '1', '2020-05-06 14:15:38.040761'),
(4328, 1, '1', '2020-05-06 14:15:40.090578'),
(4329, 1, '1', '2020-05-06 14:15:46.156811'),
(4330, 1, '1', '2020-05-06 14:15:48.131666'),
(4331, 1, '1', '2020-05-06 14:15:50.231368'),
(4332, 1, '1', '2020-05-06 14:15:56.248090'),
(4333, 1, '1', '2020-05-06 14:15:58.264773'),
(4334, 1, '1', '2020-05-06 14:16:00.503830'),
(4335, 1, '1', '2020-05-06 14:16:08.463968'),
(4336, 1, '1', '2020-05-06 14:16:09.555698'),
(4337, 1, '1', '2020-05-06 14:16:11.572348'),
(4338, 1, '1', '2020-05-06 14:16:19.630312'),
(4339, 1, '1', '2020-05-06 14:16:21.655544'),
(4340, 1, '1', '2020-05-06 14:16:23.680431'),
(4341, 1, '1', '2020-05-06 14:16:29.853079'),
(4342, 1, '1', '2020-05-06 14:16:31.812801'),
(4343, 1, '1', '2020-05-06 14:16:33.887839'),
(4344, 1, '1', '2020-05-06 14:16:39.979719'),
(4345, 1, '1', '2020-05-06 14:16:42.121058'),
(4346, 1, '1', '2020-05-06 14:16:44.145908'),
(4347, 1, '1', '2020-05-06 14:16:50.095776'),
(4348, 1, '1', '2020-05-06 14:16:52.187571'),
(4349, 1, '1', '2020-05-06 14:16:54.237499'),
(4350, 1, '1', '2020-05-06 14:17:00.320498'),
(4351, 1, '1', '2020-05-06 14:17:02.262400'),
(4352, 1, '1', '2020-05-06 14:17:06.330715'),
(4353, 1, '1', '2020-05-06 14:17:12.461166'),
(4354, 1, '1', '2020-05-06 14:17:14.478722'),
(4355, 1, '1', '2020-05-06 14:17:16.570560'),
(4356, 1, '1', '2020-05-06 14:17:22.836079'),
(4357, 1, '1', '2020-05-06 14:17:24.720072'),
(4358, 1, '1', '2020-05-06 14:17:26.703581'),
(4359, 1, '1', '2020-05-06 14:17:32.820236'),
(4360, 1, '1', '2020-05-06 14:17:34.918828'),
(4361, 1, '1', '2020-05-06 14:17:36.828771'),
(4362, 1, '1', '2020-05-06 14:17:42.951292'),
(4363, 1, '1', '2020-05-06 14:17:45.020090'),
(4364, 1, '1', '2020-05-06 14:17:47.145184'),
(4365, 1, '1', '2020-05-06 14:17:55.109904'),
(4366, 1, '1', '2020-05-06 14:17:57.202685'),
(4367, 1, '1', '2020-05-06 14:17:59.203120'),
(4368, 1, '1', '2020-05-06 14:18:05.334246'),
(4369, 1, '1', '2020-05-06 14:18:07.402626'),
(4370, 1, '1', '2020-05-06 14:18:09.453087'),
(4371, 1, '1', '2020-05-06 14:18:15.617849'),
(4372, 1, '1', '2020-05-06 14:18:17.575400'),
(4373, 1, '1', '2020-05-06 14:18:19.708939'),
(4374, 1, '1', '2020-05-06 14:18:25.633859'),
(4375, 1, '1', '2020-05-06 14:18:27.719205'),
(4376, 1, '1', '2020-05-06 14:18:29.650452'),
(4377, 1, '1', '2020-05-06 14:18:35.999998'),
(4378, 1, '1', '2020-05-06 14:18:40.017107'),
(4379, 1, '1', '2020-05-06 14:18:42.068357'),
(4380, 1, '1', '2020-05-06 14:18:48.485366'),
(4381, 1, '1', '2020-05-06 14:18:50.107961'),
(4382, 1, '1', '2020-05-06 14:18:52.427293'),
(4383, 1, '1', '2020-05-06 14:18:58.119389'),
(4384, 1, '1', '2020-05-06 14:19:00.182912'),
(4385, 1, '1', '2020-05-06 14:19:02.406860'),
(4386, 1, '1', '2020-05-06 14:19:08.232241'),
(4387, 1, '1', '2020-05-06 14:19:10.334739'),
(4388, 1, '1', '2020-05-06 14:19:12.306796'),
(4389, 1, '1', '2020-05-06 14:19:18.389745'),
(4390, 1, '1', '2020-05-06 14:19:20.422891'),
(4391, 1, '1', '2020-05-06 14:19:22.451746'),
(4392, 1, '1', '2020-05-06 14:19:30.639399'),
(4393, 1, '1', '2020-05-06 14:19:32.681297'),
(4394, 1, '1', '2020-05-06 14:19:34.734584'),
(4395, 1, '1', '2020-05-06 14:19:40.780364'),
(4396, 1, '1', '2020-05-06 14:19:42.889124'),
(4397, 1, '1', '2020-05-06 14:19:45.039380'),
(4398, 1, '1', '2020-05-06 14:19:50.930318'),
(4399, 1, '1', '2020-05-06 14:19:52.956559'),
(4400, 1, '1', '2020-05-06 14:19:55.011450'),
(4401, 1, '1', '2020-05-06 14:20:01.254565'),
(4402, 1, '1', '2020-05-06 14:20:03.171171'),
(4403, 1, '1', '2020-05-06 14:20:05.276102'),
(4404, 1, '1', '2020-05-06 14:20:13.320919'),
(4405, 1, '1', '2020-05-06 14:20:15.446393'),
(4406, 1, '1', '2020-05-06 14:20:17.534781'),
(4407, 1, '1', '2020-05-06 14:20:23.478927'),
(4408, 1, '1', '2020-05-06 14:20:25.662446'),
(4409, 1, '1', '2020-05-06 14:20:27.628688'),
(4410, 1, '1', '2020-05-06 14:20:33.687354'),
(4411, 1, '1', '2020-05-06 14:20:35.711774'),
(4412, 1, '1', '2020-05-06 14:20:37.769334'),
(4413, 1, '1', '2020-05-06 14:20:44.970180'),
(4414, 1, '1', '2020-05-06 14:20:47.100883'),
(4415, 1, '1', '2020-05-06 14:20:49.084078'),
(4416, 1, '1', '2020-05-06 14:20:55.053009'),
(4417, 1, '1', '2020-05-06 14:20:59.143572'),
(4418, 1, '1', '2020-05-06 14:21:01.083828'),
(4419, 1, '1', '2020-05-06 14:21:07.292499'),
(4420, 1, '1', '2020-05-06 14:21:09.276329'),
(4421, 1, '1', '2020-05-06 14:21:11.394269'),
(4422, 1, '1', '2020-05-06 14:21:17.419392'),
(4423, 1, '1', '2020-05-06 14:21:19.704481'),
(4424, 1, '1', '2020-05-06 14:21:21.593569'),
(4425, 1, '1', '2020-05-06 14:21:27.709916'),
(4426, 1, '1', '2020-05-06 14:21:32.100001'),
(4427, 1, '1', '2020-05-06 14:21:32.718262'),
(4428, 1, '1', '2020-05-06 14:21:38.708106'),
(4429, 1, '1', '2020-05-06 14:21:40.733945'),
(4430, 1, '1', '2020-05-06 14:21:44.791296'),
(4431, 1, '1', '2020-05-06 14:21:50.882904'),
(4432, 1, '1', '2020-05-06 14:21:52.942516'),
(4433, 1, '1', '2020-05-06 14:21:54.949905'),
(4434, 1, '1', '2020-05-06 14:22:01.124496'),
(4435, 1, '1', '2020-05-06 14:22:03.157883'),
(4436, 1, '1', '2020-05-06 14:22:05.124390'),
(4437, 1, '1', '2020-05-06 14:22:11.333620'),
(4438, 1, '1', '2020-05-06 14:22:13.491274'),
(4439, 1, '1', '2020-05-06 14:22:15.374513'),
(4440, 1, '1', '2020-05-06 14:22:21.916738'),
(4441, 1, '1', '2020-05-06 14:22:23.725325'),
(4442, 1, '1', '2020-05-06 14:22:26.125129'),
(4443, 1, '1', '2020-05-06 14:22:34.223593'),
(4444, 1, '1', '2020-05-06 14:22:36.024510'),
(4445, 1, '1', '2020-05-06 14:22:38.216797'),
(4446, 1, '1', '2020-05-06 14:22:44.142342'),
(4447, 1, '1', '2020-05-06 14:22:46.198289'),
(4448, 1, '1', '2020-05-06 14:22:48.032688'),
(4449, 1, '1', '2020-05-06 14:22:53.989616'),
(4450, 1, '1', '2020-05-06 14:23:02.866109'),
(4451, 1, '1', '2020-05-06 14:23:10.215281'),
(4452, 1, '1', '2020-05-06 14:23:38.731936'),
(4453, 1, '1', '2020-05-06 14:23:48.981913'),
(4454, 1, '1', '2020-05-06 14:24:00.995434'),
(4455, 1, '1', '2020-05-06 14:24:36.636065'),
(4456, 1, '1', '2020-05-06 14:24:44.680424'),
(4457, 1, '1', '2020-05-06 14:24:52.916360'),
(4458, 1, '1', '2020-05-06 14:25:13.167486'),
(4459, 1, '1', '2020-05-06 14:25:15.179597'),
(4460, 1, '1', '2020-05-06 14:25:17.196307'),
(4461, 1, '1', '2020-05-06 14:25:23.345628'),
(4462, 1, '1', '2020-05-06 14:25:25.353854'),
(4463, 1, '1', '2020-05-06 14:25:27.403804'),
(4464, 1, '1', '2020-05-06 14:25:41.628740'),
(4465, 1, '1', '2020-05-06 14:25:47.716321'),
(4466, 1, '1', '2020-05-06 14:25:51.774387'),
(4467, 1, '1', '2020-05-06 14:26:03.956918'),
(4468, 1, '1', '2020-05-06 14:26:08.048422'),
(4469, 1, '1', '2020-05-06 14:26:16.081717'),
(4470, 1, '1', '2020-05-06 14:26:38.771646'),
(4471, 1, '1', '2020-05-06 14:26:44.701955'),
(4472, 1, '1', '2020-05-06 14:26:52.801708'),
(4473, 1, '1', '2020-05-06 14:27:15.338767'),
(4474, 1, '1', '2020-05-06 14:27:21.293101'),
(4475, 1, '1', '2020-05-06 14:27:27.295804'),
(4476, 1, '1', '2020-05-06 14:27:47.728191'),
(4477, 1, '1', '2020-05-06 14:27:53.786110'),
(4478, 1, '1', '2020-05-06 14:28:01.844070'),
(4479, 1, '1', '2020-05-06 14:28:20.209347'),
(4480, 1, '1', '2020-05-06 14:28:28.401202'),
(4481, 1, '1', '2020-05-06 14:28:40.525545'),
(4482, 1, '1', '2020-05-06 14:29:11.016885'),
(4483, 1, '1', '2020-05-06 14:29:21.241079'),
(4484, 1, '1', '2020-05-06 14:29:35.390103'),
(4485, 1, '1', '2020-05-06 14:30:10.172801'),
(4486, 1, '1', '2020-05-06 14:30:22.232413'),
(4487, 1, '1', '2020-05-06 14:30:34.421817'),
(4488, 1, '1', '2020-05-06 14:31:02.037549'),
(4489, 1, '1', '2020-05-06 14:31:09.970638'),
(4490, 1, '1', '2020-05-06 14:31:20.020146'),
(4491, 1, '1', '2020-05-06 14:31:50.537338'),
(4492, 1, '1', '2020-05-06 14:31:58.686887'),
(4493, 1, '1', '2020-05-06 14:32:12.811331'),
(4494, 1, '1', '2020-05-06 14:32:45.416649'),
(4495, 1, '1', '2020-05-06 14:32:57.532446'),
(4496, 1, '1', '2020-05-06 14:33:11.843174'),
(4497, 1, '1', '2020-05-06 14:33:44.364065'),
(4498, 1, '1', '2020-05-06 14:33:58.571224'),
(4499, 1, '1', '2020-05-06 14:34:10.782984'),
(4500, 1, '1', '2020-05-06 14:34:49.460826'),
(4501, 1, '1', '2020-05-06 14:35:03.610781'),
(4502, 1, '1', '2020-05-06 14:35:15.776921'),
(4503, 1, '1', '2020-05-06 14:35:50.485449'),
(4504, 1, '1', '2020-05-06 14:35:58.509224'),
(4505, 1, '1', '2020-05-06 14:36:04.699265'),
(4506, 1, '1', '2020-05-06 14:36:20.880117'),
(4507, 1, '1', '2020-05-06 14:36:27.315482'),
(4508, 1, '1', '2020-05-06 14:36:35.307721'),
(4509, 1, '1', '2020-05-06 14:36:59.522972'),
(4510, 1, '1', '2020-05-06 14:37:08.106149'),
(4511, 1, '1', '2020-05-06 14:37:17.655377'),
(4512, 1, '1', '2020-05-06 14:37:54.951376'),
(4513, 1, '1', '2020-05-06 14:38:02.619920'),
(4514, 1, '1', '2020-05-06 14:38:08.752761'),
(4515, 1, '1', '2020-05-06 14:38:28.827774'),
(4516, 1, '1', '2020-05-06 14:38:38.993762'),
(4517, 1, '1', '2020-05-06 14:38:47.085119'),
(4518, 1, '1', '2020-05-06 14:39:19.609545'),
(4519, 1, '1', '2020-05-06 14:39:33.966507'),
(4520, 1, '1', '2020-05-06 14:39:41.958435'),
(4521, 1, '1', '2020-05-06 14:40:14.538407'),
(4522, 1, '1', '2020-05-06 14:40:24.681442'),
(4523, 1, '1', '2020-05-06 14:40:36.864646'),
(4524, 1, '1', '2020-05-06 14:41:13.860732'),
(4525, 1, '1', '2020-05-06 14:41:27.713625'),
(4526, 1, '1', '2020-05-06 14:41:42.038551'),
(4527, 1, '1', '2020-05-06 14:42:18.585455'),
(4528, 1, '1', '2020-05-06 14:42:34.751056'),
(4529, 1, '1', '2020-05-06 14:42:46.938006'),
(4530, 1, '1', '2020-05-06 14:43:25.592338'),
(4531, 1, '1', '2020-05-06 14:43:35.698734'),
(4532, 1, '1', '2020-05-06 14:43:41.923897'),
(4533, 1, '1', '2020-05-06 14:44:00.056615'),
(4534, 1, '1', '2020-05-06 14:44:08.214989'),
(4535, 1, '1', '2020-05-06 14:44:18.313154'),
(4536, 1, '1', '2020-05-06 14:45:01.589357'),
(4537, 1, '1', '2020-05-06 14:45:19.663588'),
(4538, 1, '1', '2020-05-06 14:45:30.552898'),
(4539, 1, '1', '2020-05-06 14:46:08.810019'),
(4540, 1, '1', '2020-05-06 14:46:26.753485'),
(4541, 1, '1', '2020-05-06 14:46:36.878496'),
(4542, 1, '1', '2020-05-06 14:47:17.402144'),
(4543, 1, '1', '2020-05-06 14:47:30.414147'),
(4544, 1, '1', '2020-05-06 14:47:44.688212'),
(4545, 1, '1', '2020-05-06 14:48:29.387075'),
(4546, 1, '1', '2020-05-06 14:48:41.644699'),
(4547, 1, '1', '2020-05-06 14:48:53.836258'),
(4548, 1, '1', '2020-05-06 14:49:38.356984'),
(4549, 1, '1', '2020-05-06 14:49:52.858795'),
(4550, 1, '1', '2020-05-06 14:50:04.806569'),
(4551, 1, '1', '2020-05-06 14:50:47.346219'),
(4552, 1, '1', '2020-05-06 14:51:01.514305'),
(4553, 1, '1', '2020-05-06 14:51:18.764640'),
(4554, 1, '1', '2020-05-06 14:51:55.311669'),
(4555, 1, '1', '2020-05-06 14:52:07.620244'),
(4556, 1, '1', '2020-05-06 14:52:13.652586'),
(4557, 1, '1', '2020-05-06 14:52:31.919565'),
(4558, 1, '1', '2020-05-06 14:52:36.093847'),
(4559, 1, '1', '2020-05-06 14:52:42.227053'),
(4560, 1, '1', '2020-05-06 14:53:21.392826'),
(4561, 1, '1', '2020-05-06 14:53:34.467669');
INSERT INTO `strata_sensor_data` (`id`, `sensor_id`, `sensor_value`, `created_date`) VALUES
(4562, 1, '1', '2020-05-06 14:53:44.417112'),
(4563, 1, '1', '2020-05-06 14:54:26.532604'),
(4564, 1, '1', '2020-05-06 14:54:40.615623'),
(4565, 1, '1', '2020-05-06 14:54:58.846805'),
(4566, 1, '1', '2020-05-06 14:55:24.778740'),
(4567, 1, '1', '2020-05-06 14:55:28.795907'),
(4568, 1, '1', '2020-05-06 14:55:35.157211'),
(4569, 1, '1', '2020-05-06 14:56:01.010045'),
(4570, 1, '1', '2020-05-06 14:56:09.986265'),
(4571, 1, '1', '2020-05-06 14:56:18.068510'),
(4572, 1, '1', '2020-05-06 14:56:54.250780'),
(4573, 1, '1', '2020-05-06 14:57:04.267381'),
(4574, 1, '1', '2020-05-06 14:57:12.274564'),
(4575, 1, '1', '2020-05-06 14:57:48.698811'),
(4576, 1, '1', '2020-05-06 14:57:56.531609'),
(4577, 1, '1', '2020-05-06 14:58:06.472434'),
(4578, 1, '1', '2020-05-06 14:58:46.796124'),
(4579, 1, '1', '2020-05-06 14:58:58.687184'),
(4580, 1, '1', '2020-05-06 14:59:12.836770'),
(4581, 1, '1', '2020-05-06 14:59:51.018781'),
(4582, 1, '1', '2020-05-06 15:00:07.151630'),
(4583, 1, '1', '2020-05-06 15:00:24.109426'),
(4584, 1, '1', '2020-05-06 15:01:18.439132'),
(4585, 1, '1', '2020-05-06 15:01:28.455884'),
(4586, 1, '1', '2020-05-06 15:01:32.447960'),
(4587, 1, '1', '2020-05-06 15:01:54.586533'),
(4588, 1, '1', '2020-05-06 15:02:02.554969'),
(4589, 1, '1', '2020-05-06 15:02:04.655653'),
(4590, 1, '1', '2020-05-06 15:02:16.579807'),
(4591, 1, '1', '2020-05-06 15:02:20.771293'),
(4592, 1, '1', '2020-05-06 15:02:28.628620'),
(4593, 1, '1', '2020-05-06 15:02:46.762671'),
(4594, 1, '1', '2020-05-06 15:02:48.761975'),
(4595, 1, '1', '2020-05-06 15:02:50.762481'),
(4596, 1, '1', '2020-05-06 15:03:02.869673'),
(4597, 1, '1', '2020-05-06 15:03:10.836985'),
(4598, 1, '1', '2020-05-06 15:03:16.928205'),
(4599, 1, '1', '2020-05-06 15:03:36.984719'),
(4600, 1, '1', '2020-05-06 15:03:39.010932'),
(4601, 1, '1', '2020-05-06 15:03:40.960691'),
(4602, 1, '1', '2020-05-06 15:03:55.102781'),
(4603, 1, '1', '2020-05-06 15:04:01.257946'),
(4604, 1, '1', '2020-05-06 15:04:07.260685'),
(4605, 1, '1', '2020-05-06 15:04:36.321809'),
(4606, 1, '1', '2020-05-06 15:04:46.248482'),
(4607, 1, '1', '2020-05-06 15:05:01.398055'),
(4608, 1, '1', '2020-05-06 15:05:52.179329'),
(4609, 1, '1', '2020-05-06 15:06:15.499713'),
(4610, 1, '1', '2020-05-06 15:06:31.819005'),
(4611, 1, '1', '2020-05-06 15:06:48.952005'),
(4612, 1, '1', '2020-05-06 15:06:57.018520'),
(4613, 1, '1', '2020-05-06 15:07:03.243624'),
(4614, 1, '1', '2020-05-06 15:07:23.550644'),
(4615, 1, '1', '2020-05-06 15:07:27.484066'),
(4616, 1, '1', '2020-05-06 15:07:29.483380'),
(4617, 1, '1', '2020-05-06 15:07:39.572255'),
(4618, 1, '1', '2020-05-06 15:07:47.708128'),
(4619, 1, '1', '2020-05-06 15:07:55.816255'),
(4620, 1, '1', '2020-05-06 15:08:14.332309'),
(4621, 1, '1', '2020-05-06 15:08:20.124793'),
(4622, 1, '1', '2020-05-06 15:08:24.189663'),
(4623, 1, '1', '2020-05-06 15:08:39.488322'),
(4624, 1, '1', '2020-05-06 15:08:48.548212'),
(4625, 1, '1', '2020-05-06 15:08:54.597648'),
(4626, 1, '1', '2020-05-06 15:09:04.692914'),
(4627, 1, '1', '2020-05-06 15:09:08.712543'),
(4628, 1, '1', '2020-05-06 15:09:12.830037'),
(4629, 1, '1', '2020-05-06 15:09:29.095454'),
(4630, 1, '1', '2020-05-06 15:09:35.137232'),
(4631, 1, '1', '2020-05-06 15:09:43.402573'),
(4632, 1, '1', '2020-05-06 15:10:00.411438'),
(4633, 1, '1', '2020-05-06 15:10:02.768396'),
(4634, 1, '1', '2020-05-06 15:10:04.461210'),
(4635, 1, '1', '2020-05-06 15:10:15.711344'),
(4636, 1, '1', '2020-05-06 15:10:23.752415'),
(4637, 1, '1', '2020-05-06 15:10:28.827413'),
(4638, 1, '1', '2020-05-06 15:10:47.126097'),
(4639, 1, '1', '2020-05-06 15:10:53.151111'),
(4640, 1, '1', '2020-05-06 15:10:55.250895'),
(4641, 1, '1', '2020-05-06 15:11:09.360252'),
(4642, 1, '1', '2020-05-06 15:11:15.434074'),
(4643, 1, '1', '2020-05-06 15:11:19.550920'),
(4644, 1, '1', '2020-05-06 15:11:35.759047'),
(4645, 1, '1', '2020-05-06 15:11:43.791801'),
(4646, 1, '1', '2020-05-06 15:11:51.857166'),
(4647, 1, '1', '2020-05-06 15:12:09.080804'),
(4648, 1, '1', '2020-05-06 15:12:11.097847'),
(4649, 1, '1', '2020-05-06 15:12:13.147563'),
(4650, 1, '1', '2020-05-06 15:12:21.290925'),
(4651, 1, '1', '2020-05-06 15:12:23.247466'),
(4652, 1, '1', '2020-05-06 15:12:25.279742'),
(4653, 1, '1', '2020-05-06 15:12:58.604315'),
(4654, 1, '1', '2020-05-06 15:13:02.839604'),
(4655, 1, '1', '2020-05-06 15:13:06.873229'),
(4656, 1, '1', '2020-05-06 15:13:21.006493'),
(4657, 1, '1', '2020-05-06 15:13:25.015216'),
(4658, 1, '1', '2020-05-06 15:13:29.139836'),
(4659, 1, '1', '2020-05-06 15:13:49.418662'),
(4660, 1, '1', '2020-05-06 15:13:57.526957'),
(4661, 1, '1', '2020-05-06 15:14:01.538869'),
(4662, 1, '1', '2020-05-06 15:14:14.123898'),
(4663, 1, '1', '2020-05-06 15:14:18.347727'),
(4664, 1, '1', '2020-05-06 15:14:22.267460'),
(4665, 1, '1', '2020-05-06 15:14:32.257827'),
(4666, 1, '1', '2020-05-06 15:14:34.725119'),
(4667, 1, '1', '2020-05-06 15:14:40.446614'),
(4668, 1, '1', '2020-05-06 15:14:52.655261'),
(4669, 1, '1', '2020-05-06 15:14:58.499989'),
(4670, 1, '1', '2020-05-06 15:15:04.666179'),
(4671, 1, '1', '2020-05-06 15:15:12.565384'),
(4672, 1, '1', '2020-05-06 15:15:14.732184'),
(4673, 1, '1', '2020-05-06 15:15:16.866757'),
(4674, 1, '1', '2020-05-06 15:15:22.748199'),
(4675, 1, '1', '2020-05-06 15:15:31.131871'),
(4676, 1, '1', '2020-05-06 15:15:38.847443'),
(4677, 1, '1', '2020-05-06 15:15:55.054921'),
(4678, 1, '1', '2020-05-06 15:15:57.470177'),
(4679, 1, '1', '2020-05-06 15:16:00.205770'),
(4680, 1, '1', '2020-05-06 15:16:10.438385'),
(4681, 1, '1', '2020-05-06 15:16:14.370871'),
(4682, 1, '1', '2020-05-06 15:16:20.462201'),
(4683, 1, '1', '2020-05-06 15:16:32.561978'),
(4684, 1, '1', '2020-05-06 15:16:36.653404'),
(4685, 1, '1', '2020-05-06 15:16:42.786519'),
(4686, 1, '1', '2020-05-06 15:16:50.978338'),
(4687, 1, '1', '2020-05-06 15:16:52.935947'),
(4688, 1, '1', '2020-05-06 15:16:58.935942'),
(4689, 1, '1', '2020-05-06 15:17:18.229509'),
(4690, 1, '1', '2020-05-06 15:17:20.182969'),
(4691, 1, '1', '2020-05-06 15:17:22.227405'),
(4692, 1, '1', '2020-05-06 15:17:34.401964'),
(4693, 1, '1', '2020-05-06 15:17:36.477074'),
(4694, 1, '1', '2020-05-06 15:17:38.476615'),
(4695, 1, '1', '2020-05-06 15:17:50.765000'),
(4696, 1, '1', '2020-05-06 15:17:54.809088'),
(4697, 1, '1', '2020-05-06 15:18:02.785058'),
(4698, 1, '1', '2020-05-06 15:18:14.876410'),
(4699, 1, '1', '2020-05-06 15:18:20.957719'),
(4700, 1, '1', '2020-05-06 15:18:25.042035'),
(4701, 1, '1', '2020-05-06 15:18:37.192929'),
(4702, 1, '1', '2020-05-06 15:18:39.226051'),
(4703, 1, '1', '2020-05-06 15:18:42.292321'),
(4704, 1, '1', '2020-05-06 15:18:54.406900'),
(4705, 1, '1', '2020-05-06 15:18:58.517186'),
(4706, 1, '1', '2020-05-06 15:19:02.583916'),
(4707, 1, '1', '2020-05-06 15:19:12.681198'),
(4708, 1, '1', '2020-05-06 15:19:16.680767'),
(4709, 1, '1', '2020-05-06 15:19:22.746827'),
(4710, 1, '1', '2020-05-06 15:19:32.963709'),
(4711, 1, '1', '2020-05-06 15:19:36.974778'),
(4712, 1, '1', '2020-05-06 15:19:41.037942'),
(4713, 1, '1', '2020-05-06 15:19:51.188486'),
(4714, 1, '1', '2020-05-06 15:19:53.163387'),
(4715, 1, '1', '2020-05-06 15:19:55.257127'),
(4716, 1, '1', '2020-05-06 15:20:01.295382'),
(4717, 1, '1', '2020-05-06 15:20:05.437019'),
(4718, 1, '1', '2020-05-06 15:20:09.407361'),
(4719, 1, '1', '2020-05-06 15:20:23.615303'),
(4720, 1, '1', '2020-05-06 15:20:28.071649'),
(4721, 1, '1', '2020-05-06 15:20:29.644168'),
(4722, 1, '1', '2020-05-06 15:20:39.861055'),
(4723, 1, '1', '2020-05-06 15:20:41.835897'),
(4724, 1, '1', '2020-05-06 15:20:44.198160'),
(4725, 1, '1', '2020-05-06 15:20:51.943393'),
(4726, 1, '1', '2020-05-06 15:20:56.022896'),
(4727, 1, '1', '2020-05-06 15:21:00.027048'),
(4728, 1, '1', '2020-05-06 15:21:13.510490'),
(4729, 1, '1', '2020-05-06 15:21:14.285624'),
(4730, 1, '1', '2020-05-06 15:21:16.460024'),
(4731, 1, '1', '2020-05-06 15:21:28.493137'),
(4732, 1, '1', '2020-05-06 15:21:32.466567'),
(4733, 1, '1', '2020-05-06 15:21:36.743408'),
(4734, 1, '1', '2020-05-06 15:21:50.826286'),
(4735, 1, '1', '2020-05-06 15:21:56.849620'),
(4736, 1, '1', '2020-05-06 15:21:58.825646'),
(4737, 1, '1', '2020-05-06 15:22:08.998557'),
(4738, 1, '1', '2020-05-06 15:22:15.033335'),
(4739, 1, '1', '2020-05-06 15:22:19.165210'),
(4740, 1, '1', '2020-05-06 15:22:25.242217'),
(4741, 1, '1', '2020-05-06 15:22:27.383929'),
(4742, 1, '1', '2020-05-06 15:22:29.298085'),
(4743, 1, '1', '2020-05-06 15:22:47.516128'),
(4744, 1, '1', '2020-05-06 15:22:51.546247'),
(4745, 1, '1', '2020-05-06 15:22:55.580522'),
(4746, 1, '1', '2020-05-06 15:23:09.928631'),
(4747, 1, '1', '2020-05-06 15:23:11.907406'),
(4748, 1, '1', '2020-05-06 15:23:13.957558'),
(4749, 1, '1', '2020-05-06 15:23:19.832460'),
(4750, 1, '1', '2020-05-06 15:23:24.082114'),
(4751, 1, '1', '2020-05-06 15:23:28.070565'),
(4752, 1, '1', '2020-05-06 15:23:44.203484'),
(4753, 1, '1', '2020-05-06 15:23:46.257033'),
(4754, 1, '1', '2020-05-06 15:23:48.319364'),
(4755, 1, '1', '2020-05-06 15:23:58.469176'),
(4756, 1, '1', '2020-05-06 15:24:02.402363'),
(4757, 1, '1', '2020-05-06 15:24:06.461167'),
(4758, 1, '1', '2020-05-06 15:24:19.756586'),
(4759, 1, '1', '2020-05-06 15:24:25.877645'),
(4760, 1, '1', '2020-05-06 15:24:27.860274'),
(4761, 1, '1', '2020-05-06 15:24:33.843814'),
(4762, 1, '1', '2020-05-06 15:24:35.918043'),
(4763, 1, '1', '2020-05-06 15:24:39.942771'),
(4764, 1, '1', '2020-05-06 15:24:52.143176'),
(4765, 1, '1', '2020-05-06 15:24:54.205822'),
(4766, 1, '1', '2020-05-06 15:24:56.371915'),
(4767, 1, '1', '2020-05-06 15:25:02.267143'),
(4768, 1, '1', '2020-05-06 15:25:04.305975'),
(4769, 1, '1', '2020-05-06 15:25:08.549617'),
(4770, 1, '1', '2020-05-06 15:25:22.532584'),
(4771, 1, '1', '2020-05-06 15:25:26.941110'),
(4772, 1, '1', '2020-05-06 15:25:30.929007'),
(4773, 1, '1', '2020-05-06 15:25:40.990512'),
(4774, 1, '1', '2020-05-06 15:25:42.982873'),
(4775, 1, '1', '2020-05-06 15:25:44.941003'),
(4776, 1, '1', '2020-05-06 15:25:50.973788'),
(4777, 1, '1', '2020-05-06 15:25:54.973275'),
(4778, 1, '1', '2020-05-06 15:26:00.463154'),
(4779, 1, '1', '2020-05-06 15:26:13.213377'),
(4780, 1, '1', '2020-05-06 15:26:17.314256'),
(4781, 1, '1', '2020-05-06 15:26:19.273014'),
(4782, 1, '1', '2020-05-06 15:26:29.430936'),
(4783, 1, '1', '2020-05-06 15:26:33.552537'),
(4784, 1, '1', '2020-05-06 15:26:37.580404'),
(4785, 1, '1', '2020-05-06 15:26:53.887615'),
(4786, 1, '1', '2020-05-06 15:26:57.762696'),
(4787, 1, '1', '2020-05-06 15:26:59.862636'),
(4788, 1, '1', '2020-05-06 15:27:08.062436'),
(4789, 1, '1', '2020-05-06 15:27:14.020770'),
(4790, 1, '1', '2020-05-06 15:27:18.096094'),
(4791, 1, '1', '2020-05-06 15:27:28.185551'),
(4792, 1, '1', '2020-05-06 15:27:30.919685'),
(4793, 1, '1', '2020-05-06 15:27:34.318935'),
(4794, 1, '1', '2020-05-06 15:27:46.444557'),
(4795, 1, '1', '2020-05-06 15:27:50.503210'),
(4796, 1, '1', '2020-05-06 15:27:54.569929'),
(4797, 1, '1', '2020-05-06 15:28:08.819273'),
(4798, 1, '1', '2020-05-06 15:28:13.918854'),
(4799, 1, '1', '2020-05-06 15:28:17.886026'),
(4800, 1, '1', '2020-05-06 15:28:27.977702'),
(4801, 1, '1', '2020-05-06 15:28:33.052436'),
(4802, 1, '1', '2020-05-06 15:28:37.167513'),
(4803, 1, '1', '2020-05-06 15:28:45.227368'),
(4804, 1, '1', '2020-05-06 15:28:47.224792'),
(4805, 1, '1', '2020-05-06 15:28:49.291778'),
(4806, 1, '1', '2020-05-06 15:28:59.407415'),
(4807, 1, '1', '2020-05-06 15:29:03.401654'),
(4808, 1, '1', '2020-05-06 15:29:11.557374'),
(4809, 1, '1', '2020-05-06 15:29:31.734791'),
(4810, 1, '1', '2020-05-06 15:29:33.834333'),
(4811, 1, '1', '2020-05-06 15:29:35.864812'),
(4812, 1, '1', '2020-05-06 15:29:41.866982'),
(4813, 1, '1', '2020-05-06 15:29:43.939129'),
(4814, 1, '1', '2020-05-06 15:29:46.042788'),
(4815, 1, '1', '2020-05-06 15:29:54.031132'),
(4816, 1, '1', '2020-05-06 15:30:04.444213'),
(4817, 1, '1', '2020-05-06 15:30:16.353949'),
(4818, 1, '1', '2020-05-06 15:30:24.437953'),
(4819, 1, '1', '2020-05-06 15:30:26.554279'),
(4820, 1, '1', '2020-05-06 15:30:28.513779'),
(4821, 1, '1', '2020-05-06 15:30:39.716351'),
(4822, 1, '1', '2020-05-06 15:30:43.836066'),
(4823, 1, '1', '2020-05-06 15:30:47.807409'),
(4824, 1, '1', '2020-05-06 15:31:00.040779'),
(4825, 1, '1', '2020-05-06 15:31:01.961528'),
(4826, 1, '1', '2020-05-06 15:31:04.006895'),
(4827, 1, '1', '2020-05-06 15:31:12.277076'),
(4828, 1, '1', '2020-05-06 15:31:18.319833'),
(4829, 1, '1', '2020-05-06 15:31:24.473635'),
(4830, 1, '1', '2020-05-06 15:31:36.585278'),
(4831, 1, '1', '2020-05-06 15:31:38.492891'),
(4832, 1, '1', '2020-05-06 15:31:42.747597'),
(4833, 1, '1', '2020-05-06 15:31:59.192435'),
(4834, 1, '1', '2020-05-06 15:32:04.925347'),
(4835, 1, '1', '2020-05-06 15:32:08.916669'),
(4836, 1, '1', '2020-05-06 15:32:25.063628'),
(4837, 1, '1', '2020-05-06 15:32:31.140480'),
(4838, 1, '1', '2020-05-06 15:32:37.357173'),
(4839, 1, '1', '2020-05-06 15:32:49.440241'),
(4840, 1, '1', '2020-05-06 15:32:53.472945'),
(4841, 1, '1', '2020-05-06 15:32:57.716344'),
(4842, 1, '1', '2020-05-06 15:33:05.606029'),
(4843, 1, '1', '2020-05-06 15:33:07.689138'),
(4844, 1, '1', '2020-05-06 15:33:09.713114'),
(4845, 1, '1', '2020-05-06 15:33:17.747452'),
(4846, 1, '1', '2020-05-06 15:33:21.981234'),
(4847, 1, '1', '2020-05-06 15:33:29.887078'),
(4848, 1, '1', '2020-05-06 15:33:44.104413'),
(4849, 1, '1', '2020-05-06 15:33:48.173036'),
(4850, 1, '1', '2020-05-06 15:33:52.270722'),
(4851, 1, '1', '2020-05-06 15:34:00.294640'),
(4852, 1, '1', '2020-05-06 15:34:04.503695'),
(4853, 1, '1', '2020-05-06 15:34:08.653931'),
(4854, 1, '1', '2020-05-06 15:34:22.628078'),
(4855, 1, '1', '2020-05-06 15:34:24.703435'),
(4856, 1, '1', '2020-05-06 15:34:26.696169'),
(4857, 1, '1', '2020-05-06 15:34:32.895879'),
(4858, 1, '1', '2020-05-06 15:34:36.962041'),
(4859, 1, '1', '2020-05-06 15:34:40.895170'),
(4860, 1, '1', '2020-05-06 15:34:51.053650'),
(4861, 1, '1', '2020-05-06 15:34:55.060487'),
(4862, 1, '1', '2020-05-06 15:35:01.211617'),
(4863, 1, '1', '2020-05-06 15:35:19.393135'),
(4864, 1, '1', '2020-05-06 15:35:23.450218'),
(4865, 1, '1', '2020-05-06 15:35:27.492751'),
(4866, 1, '1', '2020-05-06 15:35:43.802212'),
(4867, 1, '1', '2020-05-06 15:35:48.085379'),
(4868, 1, '1', '2020-05-06 15:35:53.902349'),
(4869, 1, '1', '2020-05-06 15:36:06.026362'),
(4870, 1, '1', '2020-05-06 15:36:09.960332'),
(4871, 1, '1', '2020-05-06 15:36:16.155947'),
(4872, 1, '1', '2020-05-06 15:36:28.310236'),
(4873, 1, '1', '2020-05-06 15:36:30.331343'),
(4874, 1, '1', '2020-05-06 15:36:32.264876'),
(4875, 1, '1', '2020-05-06 15:36:42.481656'),
(4876, 1, '1', '2020-05-06 15:36:48.614095'),
(4877, 1, '1', '2020-05-06 15:36:54.676153'),
(4878, 1, '1', '2020-05-06 15:37:02.711154'),
(4879, 1, '1', '2020-05-06 15:37:04.779658'),
(4880, 1, '1', '2020-05-06 15:37:06.831240'),
(4881, 1, '1', '2020-05-06 15:37:19.088032'),
(4882, 1, '1', '2020-05-06 15:37:25.054799'),
(4883, 1, '1', '2020-05-06 15:37:31.103623'),
(4884, 1, '1', '2020-05-06 15:37:43.207941'),
(4885, 1, '1', '2020-05-06 15:37:49.399976'),
(4886, 1, '1', '2020-05-06 15:37:53.461211'),
(4887, 1, '1', '2020-05-06 15:37:59.441283'),
(4888, 1, '1', '2020-05-06 15:38:03.524464'),
(4889, 1, '1', '2020-05-06 15:38:07.610947'),
(4890, 1, '1', '2020-05-06 15:38:19.727168'),
(4891, 1, '1', '2020-05-06 15:38:21.866013'),
(4892, 1, '1', '2020-05-06 15:38:23.817703'),
(4893, 1, '1', '2020-05-06 15:38:31.868748'),
(4894, 1, '1', '2020-05-06 15:38:36.025738'),
(4895, 1, '1', '2020-05-06 15:38:40.076191'),
(4896, 1, '1', '2020-05-06 15:38:56.200330'),
(4897, 1, '1', '2020-05-06 15:39:00.257926'),
(4898, 1, '1', '2020-05-06 15:39:06.366975'),
(4899, 1, '1', '2020-05-06 15:39:12.456138'),
(4900, 1, '1', '2020-05-06 15:39:16.623087'),
(4901, 1, '1', '2020-05-06 15:39:20.857999'),
(4902, 1, '1', '2020-05-06 15:39:26.781122'),
(4903, 1, '1', '2020-05-06 15:39:28.707199'),
(4904, 1, '1', '2020-05-06 15:39:30.740899'),
(4905, 1, '1', '2020-05-06 15:39:37.101487'),
(4906, 1, '1', '2020-05-06 15:39:38.840385'),
(4907, 1, '1', '2020-05-06 15:39:40.856914'),
(4908, 1, '1', '2020-05-06 15:39:53.234859'),
(4909, 1, '1', '2020-05-06 15:39:54.990240'),
(4910, 1, '1', '2020-05-06 15:39:57.048592'),
(4911, 1, '1', '2020-05-06 15:40:03.201387'),
(4912, 1, '1', '2020-05-06 15:40:05.123497'),
(4913, 1, '1', '2020-05-06 15:40:07.189961'),
(4914, 1, '1', '2020-05-06 15:40:13.306557'),
(4915, 1, '1', '2020-05-06 15:40:15.389538'),
(4916, 1, '1', '2020-05-06 15:40:17.431063'),
(4917, 1, '1', '2020-05-06 15:40:23.513079'),
(4918, 1, '1', '2020-05-06 15:40:27.422284'),
(4919, 1, '1', '2020-05-06 15:40:31.512824'),
(4920, 1, '1', '2020-05-06 15:40:39.738498'),
(4921, 1, '1', '2020-05-06 15:40:41.696802'),
(4922, 1, '1', '2020-05-06 15:40:43.780385'),
(4923, 1, '1', '2020-05-06 15:40:49.821889'),
(4924, 1, '1', '2020-05-06 15:40:51.896410'),
(4925, 1, '1', '2020-05-06 15:40:55.828917'),
(4926, 1, '1', '2020-05-06 15:41:03.987815'),
(4927, 1, '1', '2020-05-06 15:41:05.929251'),
(4928, 1, '1', '2020-05-06 15:41:07.970614'),
(4929, 1, '1', '2020-05-06 15:41:14.128184'),
(4930, 1, '1', '2020-05-06 15:41:16.205731'),
(4931, 1, '1', '2020-05-06 15:41:18.163708'),
(4932, 1, '1', '2020-05-06 15:41:26.286585'),
(4933, 1, '1', '2020-05-06 15:41:28.254871'),
(4934, 1, '1', '2020-05-06 15:41:30.313753'),
(4935, 1, '1', '2020-05-06 15:41:36.677747'),
(4936, 1, '1', '2020-05-06 15:41:38.536718'),
(4937, 1, '1', '2020-05-06 15:41:40.572145'),
(4938, 1, '1', '2020-05-06 15:41:50.546146'),
(4939, 1, '1', '2020-05-06 15:41:52.521883'),
(4940, 1, '1', '2020-05-06 15:41:54.612714'),
(4941, 1, '1', '2020-05-06 15:42:00.710079'),
(4942, 1, '1', '2020-05-06 15:42:02.776748'),
(4943, 1, '1', '2020-05-06 15:42:06.696231'),
(4944, 1, '1', '2020-05-06 15:42:20.973723'),
(4945, 1, '1', '2020-05-06 15:42:23.062703'),
(4946, 1, '1', '2020-05-06 15:42:25.050621'),
(4947, 1, '1', '2020-05-06 15:42:31.088528'),
(4948, 1, '1', '2020-05-06 15:42:35.141823'),
(4949, 1, '1', '2020-05-06 15:42:39.170565'),
(4950, 1, '1', '2020-05-06 15:42:45.358470'),
(4951, 1, '1', '2020-05-06 15:42:47.291863'),
(4952, 1, '1', '2020-05-06 15:42:49.258315'),
(4953, 1, '1', '2020-05-06 15:42:55.416374'),
(4954, 1, '1', '2020-05-06 15:43:01.320418'),
(4955, 1, '1', '2020-05-06 15:43:02.482740'),
(4956, 1, '1', '2020-05-06 15:43:08.582393'),
(4957, 1, '1', '2020-05-06 15:43:10.790485'),
(4958, 1, '1', '2020-05-06 15:43:12.907060'),
(4959, 1, '1', '2020-05-06 15:43:18.842728'),
(4960, 1, '1', '2020-05-06 15:43:20.707202'),
(4961, 1, '1', '2020-05-06 15:43:22.773626'),
(4962, 1, '1', '2020-05-06 15:43:28.840495'),
(4963, 1, '1', '2020-05-06 15:43:30.864740'),
(4964, 1, '1', '2020-05-06 15:43:32.967185'),
(4965, 1, '1', '2020-05-06 15:43:38.989656'),
(4966, 1, '1', '2020-05-06 15:43:41.090110'),
(4967, 1, '1', '2020-05-06 15:43:43.011169'),
(4968, 1, '1', '2020-05-06 15:43:59.363068'),
(4969, 1, '1', '2020-05-06 15:44:01.255182'),
(4970, 1, '1', '2020-05-06 15:44:03.421671'),
(4971, 1, '1', '2020-05-06 15:44:09.583864'),
(4972, 1, '1', '2020-05-06 15:44:11.487807'),
(4973, 1, '1', '2020-05-06 15:44:13.455501'),
(4974, 1, '1', '2020-05-06 15:44:25.654796'),
(4975, 1, '1', '2020-05-06 15:44:29.762482'),
(4976, 1, '1', '2020-05-06 15:44:31.710119'),
(4977, 1, '1', '2020-05-06 15:44:39.828049'),
(4978, 1, '1', '2020-05-06 15:44:41.796030'),
(4979, 1, '1', '2020-05-06 15:44:43.928066'),
(4980, 1, '1', '2020-05-06 15:44:49.928711'),
(4981, 1, '1', '2020-05-06 15:44:53.953381'),
(4982, 1, '1', '2020-05-06 15:44:58.069414'),
(4983, 1, '1', '2020-05-06 15:45:04.168165'),
(4984, 1, '1', '2020-05-06 15:45:06.094594'),
(4985, 1, '1', '2020-05-06 15:45:08.210058'),
(4986, 1, '1', '2020-05-06 15:45:14.353116'),
(4987, 1, '1', '2020-05-06 15:45:16.293992'),
(4988, 1, '1', '2020-05-06 15:45:18.293612'),
(4989, 1, '1', '2020-05-06 15:45:32.509730'),
(4990, 1, '1', '2020-05-06 15:45:36.559850'),
(4991, 1, '1', '2020-05-06 15:45:38.609011'),
(4992, 1, '1', '2020-05-06 15:45:44.584596'),
(4993, 1, '1', '2020-05-06 15:45:46.659132'),
(4994, 1, '1', '2020-05-06 15:45:48.825773'),
(4995, 1, '1', '2020-05-06 15:45:54.784393'),
(4996, 1, '1', '2020-05-06 15:45:57.100906'),
(4997, 1, '1', '2020-05-06 15:46:00.950573'),
(4998, 1, '1', '2020-05-06 15:46:08.924625'),
(4999, 1, '1', '2020-05-06 15:46:11.125400'),
(5000, 1, '1', '2020-05-06 15:46:15.092207'),
(5001, 1, '1', '2020-05-06 15:46:21.158492'),
(5002, 1, '1', '2020-05-06 15:46:23.116158'),
(5003, 1, '1', '2020-05-06 15:46:29.258173'),
(5004, 1, '1', '2020-05-06 15:46:35.300337'),
(5005, 1, '1', '2020-05-06 15:46:37.324576'),
(5006, 1, '1', '2020-05-06 15:46:43.615752'),
(5007, 1, '1', '2020-05-06 15:46:45.532958'),
(5008, 1, '1', '2020-05-06 15:46:47.516807'),
(5009, 1, '1', '2020-05-06 15:46:53.723875'),
(5010, 1, '1', '2020-05-06 15:46:57.674774'),
(5011, 1, '1', '2020-05-06 15:47:03.749313'),
(5012, 1, '1', '2020-05-06 15:47:09.715809'),
(5013, 1, '1', '2020-05-06 15:47:11.732300'),
(5014, 1, '1', '2020-05-06 15:47:13.805919'),
(5015, 1, '1', '2020-05-06 15:47:19.907481'),
(5016, 1, '1', '2020-05-06 15:47:21.905171'),
(5017, 1, '1', '2020-05-06 15:47:25.930415'),
(5018, 1, '1', '2020-05-06 15:47:34.038506'),
(5019, 1, '1', '2020-05-06 15:47:36.112881'),
(5020, 1, '1', '2020-05-06 15:47:38.055238'),
(5021, 1, '1', '2020-05-06 15:47:45.154679'),
(5022, 1, '1', '2020-05-06 15:47:49.237675'),
(5023, 1, '1', '2020-05-06 15:47:51.279118'),
(5024, 1, '1', '2020-05-06 15:47:57.658242'),
(5025, 1, '1', '2020-05-06 15:47:59.478619'),
(5026, 1, '1', '2020-05-06 15:48:01.454079'),
(5027, 1, '1', '2020-05-06 15:48:07.461927'),
(5028, 1, '1', '2020-05-06 15:48:09.594984'),
(5029, 1, '1', '2020-05-06 15:48:11.595668'),
(5030, 1, '1', '2020-05-06 15:48:17.754222'),
(5031, 1, '1', '2020-05-06 15:48:19.753789'),
(5032, 1, '1', '2020-05-06 15:48:21.779201'),
(5033, 1, '1', '2020-05-06 15:48:27.852117'),
(5034, 1, '1', '2020-05-06 15:48:29.852804'),
(5035, 1, '1', '2020-05-06 15:48:31.885706'),
(5036, 1, '1', '2020-05-06 15:48:40.045278'),
(5037, 1, '1', '2020-05-06 15:48:41.986320'),
(5038, 1, '1', '2020-05-06 15:48:43.968971'),
(5039, 1, '1', '2020-05-06 15:48:50.121218'),
(5040, 1, '1', '2020-05-06 15:48:52.103140'),
(5041, 1, '1', '2020-05-06 15:48:54.118069'),
(5042, 1, '1', '2020-05-06 15:49:00.745854'),
(5043, 1, '1', '2020-05-06 15:49:02.379428'),
(5044, 1, '1', '2020-05-06 15:49:04.279143'),
(5045, 1, '1', '2020-05-06 15:49:10.326136'),
(5046, 1, '1', '2020-05-06 15:49:12.344165'),
(5047, 1, '1', '2020-05-06 15:49:14.309745'),
(5048, 1, '1', '2020-05-06 15:49:22.493096'),
(5049, 1, '1', '2020-05-06 15:49:24.587700'),
(5050, 1, '1', '2020-05-06 15:49:26.617132'),
(5051, 1, '1', '2020-05-06 15:49:32.603444'),
(5052, 1, '1', '2020-05-06 15:49:34.642351'),
(5053, 1, '1', '2020-05-06 15:49:36.691723'),
(5054, 1, '1', '2020-05-06 15:49:42.745414'),
(5055, 1, '1', '2020-05-06 15:49:44.804214'),
(5056, 1, '1', '2020-05-06 15:49:46.811703'),
(5057, 1, '1', '2020-05-06 15:49:52.891199'),
(5058, 1, '1', '2020-05-06 15:49:54.873901'),
(5059, 1, '1', '2020-05-06 15:49:56.882706'),
(5060, 1, '1', '2020-05-06 15:50:03.123656'),
(5061, 1, '1', '2020-05-06 15:50:05.106873'),
(5062, 1, '1', '2020-05-06 15:50:09.123334'),
(5063, 1, '1', '2020-05-06 15:50:15.256653'),
(5064, 1, '1', '2020-05-06 15:50:17.398723'),
(5065, 1, '1', '2020-05-06 15:50:19.414875'),
(5066, 1, '1', '2020-05-06 15:50:25.439573'),
(5067, 1, '1', '2020-05-06 15:50:27.506813'),
(5068, 1, '1', '2020-05-06 15:50:29.531136'),
(5069, 1, '1', '2020-05-06 15:50:35.515757'),
(5070, 1, '1', '2020-05-06 15:50:37.523346'),
(5071, 1, '1', '2020-05-06 15:50:39.605826'),
(5072, 1, '1', '2020-05-06 15:50:45.705371'),
(5073, 1, '1', '2020-05-06 15:50:47.722725'),
(5074, 1, '1', '2020-05-06 15:50:49.614390'),
(5075, 1, '1', '2020-05-06 15:50:57.823206'),
(5076, 1, '1', '2020-05-06 15:50:59.827617'),
(5077, 1, '1', '2020-05-06 15:51:01.838714'),
(5078, 1, '1', '2020-05-06 15:51:08.180011'),
(5079, 1, '1', '2020-05-06 15:51:09.938768'),
(5080, 1, '1', '2020-05-06 15:51:12.030309'),
(5081, 1, '1', '2020-05-06 15:51:18.021563'),
(5082, 1, '1', '2020-05-06 15:51:20.120965'),
(5083, 1, '1', '2020-05-06 15:51:22.129034'),
(5084, 1, '1', '2020-05-06 15:51:28.287266'),
(5085, 1, '1', '2020-05-06 15:51:30.187804'),
(5086, 1, '1', '2020-05-06 15:51:32.245352'),
(5087, 1, '1', '2020-05-06 15:51:38.312491'),
(5088, 1, '1', '2020-05-06 15:51:42.412066'),
(5089, 1, '1', '2020-05-06 15:51:44.774087'),
(5090, 1, '1', '2020-05-06 15:51:50.527558'),
(5091, 1, '1', '2020-05-06 15:51:52.741828'),
(5092, 1, '1', '2020-05-06 15:51:54.544927'),
(5093, 1, '1', '2020-05-06 15:52:00.645112'),
(5094, 1, '1', '2020-05-06 15:52:02.652691'),
(5095, 1, '1', '2020-05-06 15:52:04.677494'),
(5096, 1, '1', '2020-05-06 15:52:10.835640'),
(5097, 1, '1', '2020-05-06 15:52:12.794396'),
(5098, 1, '1', '2020-05-06 15:52:14.902528'),
(5099, 1, '1', '2020-05-06 15:52:20.919012'),
(5100, 1, '1', '2020-05-06 15:52:23.057994'),
(5101, 1, '1', '2020-05-06 15:52:24.877419'),
(5102, 1, '1', '2020-05-06 15:52:33.060020'),
(5103, 1, '1', '2020-05-06 15:52:35.060536'),
(5104, 1, '1', '2020-05-06 15:52:37.043668'),
(5105, 1, '1', '2020-05-06 15:52:43.250660'),
(5106, 1, '1', '2020-05-06 15:52:45.226434'),
(5107, 1, '1', '2020-05-06 15:52:47.309351'),
(5108, 1, '1', '2020-05-06 15:52:53.242433'),
(5109, 1, '1', '2020-05-06 15:52:55.326523'),
(5110, 1, '1', '2020-05-06 15:52:57.426768'),
(5111, 1, '1', '2020-05-06 15:53:03.416588'),
(5112, 1, '1', '2020-05-06 15:53:05.617788'),
(5113, 1, '1', '2020-05-06 15:53:07.648315'),
(5114, 1, '1', '2020-05-06 15:53:15.906649'),
(5115, 1, '1', '2020-05-06 15:53:17.550004'),
(5116, 1, '1', '2020-05-06 15:53:19.959556'),
(5117, 1, '1', '2020-05-06 15:53:26.032548'),
(5118, 1, '1', '2020-05-06 15:53:27.992560'),
(5119, 1, '1', '2020-05-06 15:53:29.884577'),
(5120, 1, '1', '2020-05-06 15:53:35.924440'),
(5121, 1, '1', '2020-05-06 15:53:38.026131'),
(5122, 1, '1', '2020-05-06 15:53:39.841783'),
(5123, 1, '1', '2020-05-06 15:53:46.090744'),
(5124, 1, '1', '2020-05-06 15:53:47.958479'),
(5125, 1, '1', '2020-05-06 15:53:50.089245'),
(5126, 1, '1', '2020-05-06 15:53:56.156290'),
(5127, 1, '1', '2020-05-06 15:53:58.089750'),
(5128, 1, '1', '2020-05-06 15:54:02.208136'),
(5129, 1, '1', '2020-05-06 15:54:08.284640'),
(5130, 1, '1', '2020-05-06 15:54:10.250152'),
(5131, 1, '1', '2020-05-06 15:54:12.310023'),
(5132, 1, '1', '2020-05-06 15:54:18.409629'),
(5133, 1, '1', '2020-05-06 15:54:20.342975'),
(5134, 1, '1', '2020-05-06 15:54:22.413214'),
(5135, 1, '1', '2020-05-06 15:54:28.497678'),
(5136, 1, '1', '2020-05-06 15:54:30.613723'),
(5137, 1, '1', '2020-05-06 15:54:32.633953'),
(5138, 1, '1', '2020-05-06 15:54:38.696461'),
(5139, 1, '1', '2020-05-06 15:54:40.638544'),
(5140, 1, '1', '2020-05-06 15:54:42.755246'),
(5141, 1, '1', '2020-05-06 15:54:50.939761'),
(5142, 1, '1', '2020-05-06 15:54:52.920617'),
(5143, 1, '1', '2020-05-06 15:54:54.921283'),
(5144, 1, '1', '2020-05-06 15:55:01.062682'),
(5145, 1, '1', '2020-05-06 15:55:02.975737'),
(5146, 1, '1', '2020-05-06 15:55:04.934161'),
(5147, 1, '1', '2020-05-06 15:55:11.044530'),
(5148, 1, '1', '2020-05-06 15:55:13.234363'),
(5149, 1, '1', '2020-05-06 15:55:15.175046'),
(5150, 1, '1', '2020-05-06 15:55:21.319442'),
(5151, 1, '1', '2020-05-06 15:55:23.253280'),
(5152, 1, '1', '2020-05-06 15:55:25.294995'),
(5153, 1, '1', '2020-05-06 15:55:31.427288'),
(5154, 1, '1', '2020-05-06 15:55:35.436504'),
(5155, 1, '1', '2020-05-06 15:55:37.460482'),
(5156, 1, '1', '2020-05-06 15:55:43.785296'),
(5157, 1, '1', '2020-05-06 15:55:45.610634'),
(5158, 1, '1', '2020-05-06 15:55:47.657462'),
(5159, 1, '1', '2020-05-06 15:55:53.685789'),
(5160, 1, '1', '2020-05-06 15:55:55.702092'),
(5161, 1, '1', '2020-05-06 15:55:57.693884'),
(5162, 1, '1', '2020-05-06 15:56:03.876894'),
(5163, 1, '1', '2020-05-06 15:56:05.833012'),
(5164, 1, '1', '2020-05-06 15:56:07.926821'),
(5165, 1, '1', '2020-05-06 15:56:13.917452'),
(5166, 1, '1', '2020-05-06 15:56:16.084527'),
(5167, 1, '1', '2020-05-06 15:56:18.084792'),
(5168, 1, '1', '2020-05-06 15:56:26.117822'),
(5169, 1, '1', '2020-05-06 15:56:28.125552'),
(5170, 1, '1', '2020-05-06 15:56:30.158358'),
(5171, 1, '1', '2020-05-06 15:56:36.216164'),
(5172, 1, '1', '2020-05-06 15:56:38.275119'),
(5173, 1, '1', '2020-05-06 15:56:40.395535'),
(5174, 1, '1', '2020-05-06 15:56:46.407648'),
(5175, 1, '1', '2020-05-06 15:56:48.491744'),
(5176, 1, '1', '2020-05-06 15:56:50.374601'),
(5177, 1, '1', '2020-05-06 15:56:56.608059'),
(5178, 1, '1', '2020-05-06 15:56:58.532865'),
(5179, 1, '1', '2020-05-06 15:57:00.617019'),
(5180, 1, '1', '2020-05-06 15:57:08.715890'),
(5181, 1, '1', '2020-05-06 15:57:10.666163'),
(5182, 1, '1', '2020-05-06 15:57:12.782248'),
(5183, 1, '1', '2020-05-06 15:57:18.740570'),
(5184, 1, '1', '2020-05-06 15:57:20.774030'),
(5185, 1, '1', '2020-05-06 15:57:22.889996'),
(5186, 1, '1', '2020-05-06 15:57:28.965601'),
(5187, 1, '1', '2020-05-06 15:57:30.956821'),
(5188, 1, '1', '2020-05-06 15:57:32.956837'),
(5189, 1, '1', '2020-05-06 15:57:39.265061'),
(5190, 1, '1', '2020-05-06 15:57:41.150278'),
(5191, 1, '1', '2020-05-06 15:57:43.214198'),
(5192, 1, '1', '2020-05-06 15:57:49.289866'),
(5193, 1, '1', '2020-05-06 15:57:51.331927'),
(5194, 1, '1', '2020-05-06 15:57:55.248067'),
(5195, 1, '1', '2020-05-06 15:58:01.430313'),
(5196, 1, '1', '2020-05-06 15:58:03.347798'),
(5197, 1, '1', '2020-05-06 15:58:05.373381'),
(5198, 1, '1', '2020-05-06 15:58:11.521413'),
(5199, 1, '1', '2020-05-06 15:58:13.548028'),
(5200, 1, '1', '2020-05-06 15:58:15.588119'),
(5201, 1, '1', '2020-05-06 15:58:21.704515'),
(5202, 1, '1', '2020-05-06 15:58:23.755784'),
(5203, 1, '1', '2020-05-06 15:58:25.662956'),
(5204, 1, '1', '2020-05-06 15:58:31.771007'),
(5205, 1, '1', '2020-05-06 15:58:33.803806'),
(5206, 1, '1', '2020-05-06 15:58:35.864406'),
(5207, 1, '1', '2020-05-06 15:58:43.954232'),
(5208, 1, '1', '2020-05-06 15:58:45.894993'),
(5209, 1, '1', '2020-05-06 15:58:48.022599'),
(5210, 1, '1', '2020-05-06 15:58:54.286875'),
(5211, 1, '1', '2020-05-06 15:58:56.469474'),
(5212, 1, '1', '2020-05-06 15:58:58.105977'),
(5213, 1, '1', '2020-05-06 15:59:04.169341'),
(5214, 1, '1', '2020-05-06 15:59:06.250561'),
(5215, 1, '1', '2020-05-06 15:59:08.260516'),
(5216, 1, '1', '2020-05-06 15:59:14.403807'),
(5217, 1, '1', '2020-05-06 15:59:16.310860'),
(5218, 1, '1', '2020-05-06 15:59:18.421842'),
(5219, 1, '1', '2020-05-06 15:59:24.460952'),
(5220, 1, '1', '2020-05-06 15:59:28.639029'),
(5221, 1, '1', '2020-05-06 15:59:30.601469'),
(5222, 1, '1', '2020-05-06 15:59:36.584831'),
(5223, 1, '1', '2020-05-06 15:59:38.723350'),
(5224, 1, '1', '2020-05-06 15:59:40.648345'),
(5225, 1, '1', '2020-05-06 15:59:46.759294'),
(5226, 1, '1', '2020-05-06 15:59:48.785006'),
(5227, 1, '1', '2020-05-06 15:59:50.750408'),
(5228, 1, '1', '2020-05-06 15:59:56.875376'),
(5229, 1, '1', '2020-05-06 15:59:59.034362'),
(5230, 1, '1', '2020-05-06 16:00:00.967562'),
(5231, 1, '1', '2020-05-06 16:00:07.200037'),
(5232, 1, '1', '2020-05-06 16:00:09.116723'),
(5233, 1, '1', '2020-05-06 16:00:11.084126'),
(5234, 1, '1', '2020-05-06 16:00:19.241414'),
(5235, 1, '1', '2020-05-06 16:00:21.190942'),
(5236, 1, '1', '2020-05-06 16:00:23.207765'),
(5237, 1, '1', '2020-05-06 16:00:29.549839'),
(5238, 1, '1', '2020-05-06 16:00:31.324342'),
(5239, 1, '1', '2020-05-06 16:00:33.382801'),
(5240, 1, '1', '2020-05-06 16:00:39.440167'),
(5241, 1, '1', '2020-05-06 16:00:41.600160'),
(5242, 1, '1', '2020-05-06 16:00:43.707588'),
(5243, 1, '1', '2020-05-06 16:00:49.580894'),
(5244, 1, '1', '2020-05-06 16:00:51.622877'),
(5245, 1, '1', '2020-05-06 16:00:53.615469'),
(5246, 1, '1', '2020-05-06 16:01:01.873379'),
(5247, 1, '1', '2020-05-06 16:01:03.773371'),
(5248, 1, '1', '2020-05-06 16:01:05.847679'),
(5249, 1, '1', '2020-05-06 16:01:11.947519'),
(5250, 1, '1', '2020-05-06 16:01:13.989014'),
(5251, 1, '1', '2020-05-06 16:01:15.922972'),
(5252, 1, '1', '2020-05-06 16:01:22.088216'),
(5253, 1, '1', '2020-05-06 16:01:24.180356'),
(5254, 1, '1', '2020-05-06 16:01:26.046921'),
(5255, 1, '1', '2020-05-06 16:01:32.121520'),
(5256, 1, '1', '2020-05-06 16:01:34.239130'),
(5257, 1, '1', '2020-05-06 16:01:36.188072'),
(5258, 1, '1', '2020-05-06 16:01:42.311058'),
(5259, 1, '1', '2020-05-06 16:01:44.361785'),
(5260, 1, '1', '2020-05-06 16:01:48.396958'),
(5261, 1, '1', '2020-05-06 16:01:54.521768'),
(5262, 1, '1', '2020-05-06 16:01:56.587610'),
(5263, 1, '1', '2020-05-06 16:01:58.604289'),
(5264, 1, '1', '2020-05-06 16:02:04.745818'),
(5265, 1, '1', '2020-05-06 16:02:06.729696'),
(5266, 1, '1', '2020-05-06 16:02:08.637745'),
(5267, 1, '1', '2020-05-06 16:02:14.887685'),
(5268, 1, '1', '2020-05-06 16:02:17.199969'),
(5269, 1, '1', '2020-05-06 16:02:18.928390'),
(5270, 1, '1', '2020-05-06 16:02:24.795178'),
(5271, 1, '1', '2020-05-06 16:02:27.055063'),
(5272, 1, '1', '2020-05-06 16:02:28.895643'),
(5273, 1, '1', '2020-05-06 16:02:37.036589'),
(5274, 1, '1', '2020-05-06 16:02:39.135669'),
(5275, 1, '1', '2020-05-06 16:02:41.076989'),
(5276, 1, '1', '2020-05-06 16:02:47.220392'),
(5277, 1, '1', '2020-05-06 16:02:49.219155'),
(5278, 1, '1', '2020-05-06 16:02:51.259805'),
(5279, 1, '1', '2020-05-06 16:02:57.342869'),
(5280, 1, '1', '2020-05-06 16:02:59.623452'),
(5281, 1, '1', '2020-05-06 16:03:01.269805'),
(5282, 1, '1', '2020-05-06 16:03:07.478147'),
(5283, 1, '1', '2020-05-06 16:03:09.443127'),
(5284, 1, '1', '2020-05-06 16:03:11.446203'),
(5285, 1, '1', '2020-05-06 16:03:17.517718'),
(5286, 1, '1', '2020-05-06 16:03:21.533734'),
(5287, 1, '1', '2020-05-06 16:03:23.642336'),
(5288, 1, '1', '2020-05-06 16:03:29.702623'),
(5289, 1, '1', '2020-05-06 16:03:31.744455'),
(5290, 1, '1', '2020-05-06 16:03:33.703119'),
(5291, 1, '1', '2020-05-06 16:03:39.850941'),
(5292, 1, '1', '2020-05-06 16:03:41.952920'),
(5293, 1, '1', '2020-05-06 16:03:43.844393'),
(5294, 1, '1', '2020-05-06 16:03:50.078467'),
(5295, 1, '1', '2020-05-06 16:03:51.974429'),
(5296, 1, '1', '2020-05-06 16:03:54.161016'),
(5297, 1, '1', '2020-05-06 16:04:00.202506'),
(5298, 1, '1', '2020-05-06 16:04:02.190685'),
(5299, 1, '1', '2020-05-06 16:04:04.140568'),
(5300, 1, '1', '2020-05-06 16:04:12.174231'),
(5301, 1, '1', '2020-05-06 16:04:14.273796'),
(5302, 1, '1', '2020-05-06 16:04:16.240854'),
(5303, 1, '1', '2020-05-06 16:04:22.314879'),
(5304, 1, '1', '2020-05-06 16:04:24.415615'),
(5305, 1, '1', '2020-05-06 16:04:26.629396'),
(5306, 1, '1', '2020-05-06 16:04:32.593394'),
(5307, 1, '1', '2020-05-06 16:04:34.513883'),
(5308, 1, '1', '2020-05-06 16:04:36.581784'),
(5309, 1, '1', '2020-05-06 16:04:42.697752'),
(5310, 1, '1', '2020-05-06 16:04:44.648156'),
(5311, 1, '1', '2020-05-06 16:04:46.614932'),
(5312, 1, '1', '2020-05-06 16:04:54.776955'),
(5313, 1, '1', '2020-05-06 16:04:56.830611'),
(5314, 1, '1', '2020-05-06 16:04:59.101808'),
(5315, 1, '1', '2020-05-06 16:05:04.946612'),
(5316, 1, '1', '2020-05-06 16:05:07.037906'),
(5317, 1, '1', '2020-05-06 16:05:09.147445'),
(5318, 1, '1', '2020-05-06 16:05:15.154453'),
(5319, 1, '1', '2020-05-06 16:05:17.413131'),
(5320, 1, '1', '2020-05-06 16:05:19.279263'),
(5321, 1, '1', '2020-05-06 16:05:25.195444'),
(5322, 1, '1', '2020-05-06 16:05:27.254247'),
(5323, 1, '1', '2020-05-06 16:05:29.270708'),
(5324, 1, '1', '2020-05-06 16:05:35.329183'),
(5325, 1, '1', '2020-05-06 16:05:37.412296'),
(5326, 1, '1', '2020-05-06 16:05:41.428826'),
(5327, 1, '1', '2020-05-06 16:05:47.487027'),
(5328, 1, '1', '2020-05-06 16:05:49.645019'),
(5329, 1, '1', '2020-05-06 16:05:51.678340'),
(5330, 1, '1', '2020-05-06 16:05:57.611089'),
(5331, 1, '1', '2020-05-06 16:05:59.669889'),
(5332, 1, '1', '2020-05-06 16:06:01.716866'),
(5333, 1, '1', '2020-05-06 16:06:07.785688'),
(5334, 1, '1', '2020-05-06 16:06:09.836097'),
(5335, 1, '1', '2020-05-06 16:06:11.836058'),
(5336, 1, '1', '2020-05-06 16:06:17.910364'),
(5337, 1, '1', '2020-05-06 16:06:19.910444'),
(5338, 1, '1', '2020-05-06 16:06:21.927495'),
(5339, 1, '1', '2020-05-06 16:06:30.059841'),
(5340, 1, '1', '2020-05-06 16:06:32.101844'),
(5341, 1, '1', '2020-05-06 16:06:34.126729'),
(5342, 1, '1', '2020-05-06 16:06:40.501342'),
(5343, 1, '1', '2020-05-06 16:06:42.192772'),
(5344, 1, '1', '2020-05-06 16:06:44.501960'),
(5345, 1, '1', '2020-05-06 16:06:50.493052'),
(5346, 1, '1', '2020-05-06 16:06:52.509401'),
(5347, 1, '1', '2020-05-06 16:06:54.568115'),
(5348, 1, '1', '2020-05-06 16:07:00.400445'),
(5349, 1, '1', '2020-05-06 16:07:02.459344'),
(5350, 1, '1', '2020-05-06 16:07:04.600159'),
(5351, 1, '1', '2020-05-06 16:07:10.608917'),
(5352, 1, '1', '2020-05-06 16:07:14.732574'),
(5353, 1, '1', '2020-05-06 16:07:16.716628'),
(5354, 1, '1', '2020-05-06 16:07:22.725775'),
(5355, 1, '1', '2020-05-06 16:07:24.864241'),
(5356, 1, '1', '2020-05-06 16:07:26.859789'),
(5357, 1, '1', '2020-05-06 16:07:32.891673'),
(5358, 1, '1', '2020-05-06 16:07:34.900951'),
(5359, 1, '1', '2020-05-06 16:07:37.040934'),
(5360, 1, '1', '2020-05-06 16:07:43.357285'),
(5361, 1, '1', '2020-05-06 16:07:45.141842'),
(5362, 1, '1', '2020-05-06 16:07:47.198731'),
(5363, 1, '1', '2020-05-06 16:07:53.173232'),
(5364, 1, '1', '2020-05-06 16:07:55.225742'),
(5365, 1, '1', '2020-05-06 16:07:57.275499'),
(5366, 1, '1', '2020-05-06 16:08:05.341483'),
(5367, 1, '1', '2020-05-06 16:08:07.375696'),
(5368, 1, '1', '2020-05-06 16:08:09.341329'),
(5369, 1, '1', '2020-05-06 16:08:15.425449'),
(5370, 1, '1', '2020-05-06 16:08:17.455513'),
(5371, 1, '1', '2020-05-06 16:08:19.488535'),
(5372, 1, '1', '2020-05-06 16:08:25.547870'),
(5373, 1, '1', '2020-05-06 16:08:27.738360'),
(5374, 1, '1', '2020-05-06 16:08:29.755632'),
(5375, 1, '1', '2020-05-06 16:08:35.850028'),
(5376, 1, '1', '2020-05-06 16:08:37.849370'),
(5377, 1, '1', '2020-05-06 16:08:39.703984'),
(5378, 1, '1', '2020-05-06 16:08:47.807945'),
(5379, 1, '1', '2020-05-06 16:08:49.904666'),
(5380, 1, '1', '2020-05-06 16:08:51.988458'),
(5381, 1, '1', '2020-05-06 16:08:57.987345'),
(5382, 1, '1', '2020-05-06 16:09:00.104274'),
(5383, 1, '1', '2020-05-06 16:09:02.029346'),
(5384, 1, '1', '2020-05-06 16:09:08.170553'),
(5385, 1, '1', '2020-05-06 16:09:10.361848'),
(5386, 1, '1', '2020-05-06 16:09:12.415752'),
(5387, 1, '1', '2020-05-06 16:09:18.245503'),
(5388, 1, '1', '2020-05-06 16:09:20.320169'),
(5389, 1, '1', '2020-05-06 16:09:22.524820'),
(5390, 1, '1', '2020-05-06 16:09:28.482442'),
(5391, 1, '1', '2020-05-06 16:09:30.386022'),
(5392, 1, '1', '2020-05-06 16:09:34.478377'),
(5393, 1, '1', '2020-05-06 16:09:40.602205'),
(5394, 1, '1', '2020-05-06 16:09:42.661235'),
(5395, 1, '1', '2020-05-06 16:09:44.686647'),
(5396, 1, '1', '2020-05-06 16:09:50.719403'),
(5397, 1, '1', '2020-05-06 16:09:52.719222'),
(5398, 1, '1', '2020-05-06 16:09:54.859900'),
(5399, 1, '1', '2020-05-06 16:10:00.936302'),
(5400, 1, '1', '2020-05-06 16:10:02.910730'),
(5401, 1, '1', '2020-05-06 16:10:04.952857'),
(5402, 1, '1', '2020-05-06 16:10:10.969303'),
(5403, 1, '1', '2020-05-06 16:10:13.060656'),
(5404, 1, '1', '2020-05-06 16:10:15.251562'),
(5405, 1, '1', '2020-05-06 16:10:23.242533'),
(5406, 1, '1', '2020-05-06 16:10:25.311048'),
(5407, 1, '1', '2020-05-06 16:10:27.317578'),
(5408, 1, '1', '2020-05-06 16:10:33.493159'),
(5409, 1, '1', '2020-05-06 16:10:35.325442'),
(5410, 1, '1', '2020-05-06 16:10:37.352492'),
(5411, 1, '1', '2020-05-06 16:10:43.410316'),
(5412, 1, '1', '2020-05-06 16:10:45.392221'),
(5413, 1, '1', '2020-05-06 16:10:47.443889'),
(5414, 1, '1', '2020-05-06 16:10:53.507555'),
(5415, 1, '1', '2020-05-06 16:10:55.551867'),
(5416, 1, '1', '2020-05-06 16:10:57.568806'),
(5417, 1, '1', '2020-05-06 16:11:03.657046'),
(5418, 1, '1', '2020-05-06 16:11:07.693291'),
(5419, 1, '1', '2020-05-06 16:11:09.774091'),
(5420, 1, '1', '2020-05-06 16:11:16.035121'),
(5421, 1, '1', '2020-05-06 16:11:17.998827'),
(5422, 1, '1', '2020-05-06 16:11:19.873194'),
(5423, 1, '1', '2020-05-06 16:11:26.059339'),
(5424, 1, '1', '2020-05-06 16:11:28.165510'),
(5425, 1, '1', '2020-05-06 16:11:30.281396'),
(5426, 1, '1', '2020-05-06 16:11:36.379259'),
(5427, 1, '1', '2020-05-06 16:11:38.192253'),
(5428, 1, '1', '2020-05-06 16:11:40.384953'),
(5429, 1, '1', '2020-05-06 16:11:46.281212'),
(5430, 1, '1', '2020-05-06 16:11:48.451320'),
(5431, 1, '1', '2020-05-06 16:11:50.317524'),
(5432, 1, '1', '2020-05-06 16:11:58.525463'),
(5433, 1, '1', '2020-05-06 16:12:00.463595'),
(5434, 1, '1', '2020-05-06 16:12:02.439048'),
(5435, 1, '1', '2020-05-06 16:12:08.509403'),
(5436, 1, '1', '2020-05-06 16:12:10.588290'),
(5437, 1, '1', '2020-05-06 16:12:12.650900'),
(5438, 1, '1', '2020-05-06 16:12:18.721679'),
(5439, 1, '1', '2020-05-06 16:12:20.804871'),
(5440, 1, '1', '2020-05-06 16:12:22.800624'),
(5441, 1, '1', '2020-05-06 16:12:28.779354'),
(5442, 1, '1', '2020-05-06 16:12:30.904233'),
(5443, 1, '1', '2020-05-06 16:12:32.803914'),
(5444, 1, '1', '2020-05-06 16:12:41.099992'),
(5445, 1, '1', '2020-05-06 16:12:43.134581'),
(5446, 1, '1', '2020-05-06 16:12:45.078835'),
(5447, 1, '1', '2020-05-06 16:12:51.425196'),
(5448, 1, '1', '2020-05-06 16:12:53.419309'),
(5449, 1, '1', '2020-05-06 16:12:55.736797'),
(5450, 1, '1', '2020-05-06 16:13:02.250182'),
(5451, 1, '1', '2020-05-06 16:13:04.219575'),
(5452, 1, '1', '2020-05-06 16:13:06.335766'),
(5453, 1, '1', '2020-05-06 16:13:12.394154'),
(5454, 1, '1', '2020-05-06 16:13:14.427210'),
(5455, 1, '1', '2020-05-06 16:13:16.485387'),
(5456, 1, '1', '2020-05-06 16:13:22.576533'),
(5457, 1, '1', '2020-05-06 16:13:26.643724'),
(5458, 1, '1', '2020-05-06 16:13:28.643950'),
(5459, 1, '1', '2020-05-06 16:13:34.834785'),
(5460, 1, '1', '2020-05-06 16:13:36.919103'),
(5461, 1, '1', '2020-05-06 16:13:39.001513'),
(5462, 1, '1', '2020-05-06 16:13:44.943237'),
(5463, 1, '1', '2020-05-06 16:13:46.884688'),
(5464, 1, '1', '2020-05-06 16:13:48.892834'),
(5465, 1, '1', '2020-05-06 16:13:54.975981'),
(5466, 1, '1', '2020-05-06 16:13:56.991941'),
(5467, 1, '1', '2020-05-06 16:13:58.992132'),
(5468, 1, '1', '2020-05-06 16:14:05.067091'),
(5469, 1, '1', '2020-05-06 16:14:07.191930'),
(5470, 1, '1', '2020-05-06 16:14:09.083829'),
(5471, 1, '1', '2020-05-06 16:14:17.381736'),
(5472, 1, '1', '2020-05-06 16:14:19.241392'),
(5473, 1, '1', '2020-05-06 16:14:21.333408'),
(5474, 1, '1', '2020-05-06 16:14:27.416924'),
(5475, 1, '1', '2020-05-06 16:14:29.541224'),
(5476, 1, '1', '2020-05-06 16:14:31.533804'),
(5477, 1, '1', '2020-05-06 16:14:38.561756'),
(5478, 1, '1', '2020-05-06 16:14:40.533090'),
(5479, 1, '1', '2020-05-06 16:14:42.699847'),
(5480, 1, '1', '2020-05-06 16:14:48.690000'),
(5481, 1, '1', '2020-05-06 16:14:51.249046'),
(5482, 1, '1', '2020-05-06 16:14:53.468323'),
(5483, 1, '1', '2020-05-06 16:15:01.065757'),
(5484, 1, '1', '2020-05-06 16:15:03.923223'),
(5485, 1, '1', '2020-05-06 16:15:05.041067'),
(5486, 1, '1', '2020-05-06 16:15:11.479221'),
(5487, 1, '1', '2020-05-06 16:15:13.449341'),
(5488, 1, '1', '2020-05-06 16:15:15.555975'),
(5489, 1, '1', '2020-05-06 16:15:21.373632'),
(5490, 1, '1', '2020-05-06 16:15:22.815741'),
(5491, 1, '1', '2020-05-06 16:15:24.249666'),
(5492, 1, '1', '2020-05-06 16:15:27.440716'),
(5493, 1, '1', '2020-05-06 16:15:28.299179'),
(5494, 1, '1', '2020-05-06 16:15:29.266003'),
(5495, 1, '1', '2020-05-06 16:15:32.132463'),
(5496, 1, '1', '2020-05-06 16:15:32.597688'),
(5497, 1, '1', '2020-05-06 16:15:38.082274'),
(5498, 1, '1', '2020-05-06 16:15:40.049352'),
(5499, 1, '1', '2020-05-06 16:15:40.789838'),
(5500, 1, '1', '2020-05-06 16:15:41.196554'),
(5501, 1, '1', '2020-05-06 16:15:42.913241'),
(5502, 1, '1', '2020-05-06 16:15:43.346427'),
(5503, 1, '1', '2020-05-06 16:15:44.007767'),
(5504, 1, '1', '2020-05-06 16:15:50.390376'),
(5505, 1, '1', '2020-05-06 16:15:50.799042'),
(5506, 1, '1', '2020-05-06 16:15:51.479133'),
(5507, 1, '1', '2020-05-06 16:15:53.096539'),
(5508, 1, '1', '2020-05-06 16:15:54.085771'),
(5509, 1, '1', '2020-05-06 16:15:54.466143'),
(5510, 1, '1', '2020-05-06 16:15:56.389081'),
(5511, 1, '1', '2020-05-06 16:16:02.111333'),
(5512, 1, '1', '2020-05-06 16:16:02.499223'),
(5513, 1, '1', '2020-05-06 16:16:03.682378'),
(5514, 1, '1', '2020-05-06 16:16:04.045127'),
(5515, 1, '1', '2020-05-06 16:16:04.420773'),
(5516, 1, '1', '2020-05-06 16:16:10.878153'),
(5517, 1, '1', '2020-05-06 16:16:11.295789'),
(5518, 1, '1', '2020-05-06 16:16:11.936999'),
(5519, 1, '1', '2020-05-06 16:16:12.853345'),
(5520, 1, '1', '2020-05-06 16:16:18.628599'),
(5521, 1, '1', '2020-05-06 16:16:20.057189'),
(5522, 1, '1', '2020-05-06 16:16:20.428015'),
(5523, 1, '1', '2020-05-06 16:16:22.116138'),
(5524, 1, '1', '2020-05-06 16:16:23.745229'),
(5525, 1, '1', '2020-05-06 16:16:24.203489'),
(5526, 1, '1', '2020-05-06 16:16:27.152680'),
(5527, 1, '1', '2020-05-06 16:16:27.790236'),
(5528, 1, '1', '2020-05-06 16:16:33.294596'),
(5529, 1, '1', '2020-05-06 16:16:35.911552'),
(5530, 1, '1', '2020-05-06 16:16:37.151802'),
(5531, 1, '1', '2020-05-06 16:16:38.710208'),
(5532, 1, '1', '2020-05-06 16:16:45.751880'),
(5533, 1, '1', '2020-05-06 16:16:46.558390'),
(5534, 1, '1', '2020-05-06 16:16:46.931909'),
(5535, 1, '1', '2020-05-06 16:16:47.948626'),
(5536, 1, '1', '2020-05-06 16:16:53.456674'),
(5537, 1, '1', '2020-05-06 16:16:54.910418'),
(5538, 1, '1', '2020-05-06 16:16:55.652061'),
(5539, 1, '1', '2020-05-06 16:16:56.068268'),
(5540, 1, '1', '2020-05-06 16:16:57.477165'),
(5541, 1, '1', '2020-05-06 16:16:58.026887'),
(5542, 1, '1', '2020-05-06 16:17:03.460609'),
(5543, 1, '1', '2020-05-06 16:17:04.959308'),
(5544, 1, '1', '2020-05-06 16:17:05.826031'),
(5545, 1, '1', '2020-05-06 16:17:06.309580'),
(5546, 1, '1', '2020-05-06 16:17:07.682120'),
(5547, 1, '1', '2020-05-06 16:17:08.090491'),
(5548, 1, '1', '2020-05-06 16:17:13.667875'),
(5549, 1, '1', '2020-05-06 16:17:15.506929'),
(5550, 1, '1', '2020-05-06 16:17:16.668045'),
(5551, 1, '1', '2020-05-06 16:17:17.593032'),
(5552, 1, '1', '2020-05-06 16:17:23.209203'),
(5553, 1, '1', '2020-05-06 16:17:24.742468'),
(5554, 1, '1', '2020-05-06 16:17:25.291834'),
(5555, 1, '1', '2020-05-06 16:17:25.723134'),
(5556, 1, '1', '2020-05-06 16:17:27.240407'),
(5557, 1, '1', '2020-05-06 16:17:27.658529'),
(5558, 1, '1', '2020-05-06 16:17:33.300923'),
(5559, 1, '1', '2020-05-06 16:17:35.516162'),
(5560, 1, '1', '2020-05-06 16:17:36.081312'),
(5561, 1, '1', '2020-05-06 16:17:36.616866'),
(5562, 1, '1', '2020-05-06 16:17:38.058297'),
(5563, 1, '1', '2020-05-06 16:17:38.490136'),
(5564, 1, '1', '2020-05-06 16:17:39.231413'),
(5565, 1, '1', '2020-05-06 16:17:41.008077'),
(5566, 1, '1', '2020-05-06 16:17:46.532679'),
(5567, 1, '1', '2020-05-06 16:17:47.058455'),
(5568, 1, '1', '2020-05-06 16:17:48.741667'),
(5569, 1, '1', '2020-05-06 16:17:49.248786'),
(5570, 1, '1', '2020-05-06 16:17:49.741371'),
(5571, 1, '1', '2020-05-06 16:17:51.566760'),
(5572, 1, '1', '2020-05-06 16:17:56.997334'),
(5573, 1, '1', '2020-05-06 16:17:57.623783'),
(5574, 1, '1', '2020-05-06 16:17:59.289050'),
(5575, 1, '1', '2020-05-06 16:17:59.782293'),
(5576, 1, '1', '2020-05-06 16:18:00.232426'),
(5577, 1, '1', '2020-05-06 16:18:01.587701'),
(5578, 1, '1', '2020-05-06 16:18:07.032620'),
(5579, 1, '1', '2020-05-06 16:18:07.674295'),
(5580, 1, '1', '2020-05-06 16:18:09.249490'),
(5581, 1, '1', '2020-05-06 16:18:09.699188'),
(5582, 1, '1', '2020-05-06 16:18:10.182274'),
(5583, 1, '1', '2020-05-06 16:18:11.588690'),
(5584, 1, '1', '2020-05-06 16:18:17.065211'),
(5585, 1, '1', '2020-05-06 16:18:17.499193'),
(5586, 1, '1', '2020-05-06 16:18:18.973445'),
(5587, 1, '1', '2020-05-06 16:18:19.441346'),
(5588, 1, '1', '2020-05-06 16:18:20.094766'),
(5589, 1, '1', '2020-05-06 16:18:21.307134'),
(5590, 1, '1', '2020-05-06 16:18:26.815919'),
(5591, 1, '1', '2020-05-06 16:18:27.241043'),
(5592, 1, '1', '2020-05-06 16:18:29.114440'),
(5593, 1, '1', '2020-05-06 16:18:29.659381'),
(5594, 1, '1', '2020-05-06 16:18:30.081483'),
(5595, 1, '1', '2020-05-06 16:18:32.215911'),
(5596, 1, '1', '2020-05-06 16:18:33.399806'),
(5597, 1, '1', '2020-05-06 16:18:38.839173'),
(5598, 1, '1', '2020-05-06 16:18:40.782758'),
(5599, 1, '1', '2020-05-06 16:18:41.232828'),
(5600, 1, '1', '2020-05-06 16:18:46.778980'),
(5601, 1, '1', '2020-05-06 16:18:47.182756'),
(5602, 1, '1', '2020-05-06 16:18:48.857575'),
(5603, 1, '1', '2020-05-06 16:18:49.314108'),
(5604, 1, '1', '2020-05-06 16:18:49.965844'),
(5605, 1, '1', '2020-05-06 16:18:51.341079'),
(5606, 1, '1', '2020-05-06 16:18:56.805455'),
(5607, 1, '1', '2020-05-06 16:18:57.448980'),
(5608, 1, '1', '2020-05-06 16:18:59.038845'),
(5609, 1, '1', '2020-05-06 16:18:59.507926'),
(5610, 1, '1', '2020-05-06 16:18:59.949087'),
(5611, 1, '1', '2020-05-06 16:19:01.230463'),
(5612, 1, '1', '2020-05-06 16:19:06.621628'),
(5613, 1, '1', '2020-05-06 16:19:07.073484'),
(5614, 1, '1', '2020-05-06 16:19:08.590310'),
(5615, 1, '1', '2020-05-06 16:19:09.024112'),
(5616, 1, '1', '2020-05-06 16:19:09.438498'),
(5617, 1, '1', '2020-05-06 16:19:10.945778'),
(5618, 1, '1', '2020-05-06 16:19:16.411122'),
(5619, 1, '1', '2020-05-06 16:19:16.862474'),
(5620, 1, '1', '2020-05-06 16:19:18.237756'),
(5621, 1, '1', '2020-05-06 16:19:18.641285'),
(5622, 1, '1', '2020-05-06 16:19:19.207568'),
(5623, 1, '1', '2020-05-06 16:19:25.613130'),
(5624, 1, '1', '2020-05-06 16:19:26.049259'),
(5625, 1, '1', '2020-05-06 16:19:26.747191'),
(5626, 1, '1', '2020-05-06 16:19:27.882805'),
(5627, 1, '1', '2020-05-06 16:19:28.529368'),
(5628, 1, '1', '2020-05-06 16:19:28.899124'),
(5629, 1, '1', '2020-05-06 16:19:35.420467'),
(5630, 1, '1', '2020-05-06 16:19:36.241266'),
(5631, 1, '1', '2020-05-06 16:19:37.734699'),
(5632, 1, '1', '2020-05-06 16:19:38.506789'),
(5633, 1, '1', '2020-05-06 16:19:39.270879'),
(5634, 1, '1', '2020-05-06 16:19:39.736701'),
(5635, 1, '1', '2020-05-06 16:19:46.126622'),
(5636, 1, '1', '2020-05-06 16:19:46.523562'),
(5637, 1, '1', '2020-05-06 16:19:46.940839'),
(5638, 1, '1', '2020-05-06 16:19:48.581363'),
(5639, 1, '1', '2020-05-06 16:19:49.136571'),
(5640, 1, '1', '2020-05-06 16:19:55.607331'),
(5641, 1, '1', '2020-05-06 16:19:56.053103'),
(5642, 1, '1', '2020-05-06 16:19:56.477809'),
(5643, 1, '1', '2020-05-06 16:19:57.369579'),
(5644, 1, '1', '2020-05-06 16:19:57.911291'),
(5645, 1, '1', '2020-05-06 16:20:03.577957'),
(5646, 1, '1', '2020-05-06 16:20:04.894559'),
(5647, 1, '1', '2020-05-06 16:20:05.715622'),
(5648, 1, '1', '2020-05-06 16:20:07.386018'),
(5649, 1, '1', '2020-05-06 16:20:07.927462'),
(5650, 1, '1', '2020-05-06 16:20:13.660730'),
(5651, 1, '1', '2020-05-06 16:20:16.673459'),
(5652, 1, '1', '2020-05-06 16:20:17.743923'),
(5653, 1, '1', '2020-05-06 16:20:23.560353'),
(5654, 1, '1', '2020-05-06 16:20:25.009890'),
(5655, 1, '1', '2020-05-06 16:20:25.468795'),
(5656, 1, '1', '2020-05-06 16:20:27.253288'),
(5657, 1, '1', '2020-05-06 16:20:28.715050'),
(5658, 1, '1', '2020-05-06 16:20:29.210541'),
(5659, 1, '1', '2020-05-06 16:20:35.943265'),
(5660, 1, '1', '2020-05-06 16:20:36.365245'),
(5661, 1, '1', '2020-05-06 16:20:37.143275'),
(5662, 1, '1', '2020-05-06 16:20:38.651340'),
(5663, 1, '1', '2020-05-06 16:20:39.351917'),
(5664, 1, '1', '2020-05-06 16:20:41.093638'),
(5665, 1, '1', '2020-05-06 16:20:46.525095'),
(5666, 1, '1', '2020-05-06 16:20:46.950479'),
(5667, 1, '1', '2020-05-06 16:20:48.534042'),
(5668, 1, '1', '2020-05-06 16:20:49.033994'),
(5669, 1, '1', '2020-05-06 16:20:49.618075'),
(5670, 1, '1', '2020-05-06 16:20:51.151087'),
(5671, 1, '1', '2020-05-06 16:20:56.625243'),
(5672, 1, '1', '2020-05-06 16:20:57.135357'),
(5673, 1, '1', '2020-05-06 16:20:58.748655'),
(5674, 1, '1', '2020-05-06 16:20:59.284017'),
(5675, 1, '1', '2020-05-06 16:20:59.725969'),
(5676, 1, '1', '2020-05-06 16:21:01.224943'),
(5677, 1, '1', '2020-05-06 16:21:06.708206'),
(5678, 1, '1', '2020-05-06 16:21:07.100146'),
(5679, 1, '1', '2020-05-06 16:21:08.566292'),
(5680, 1, '1', '2020-05-06 16:21:09.034140'),
(5681, 1, '1', '2020-05-06 16:21:09.774587'),
(5682, 1, '1', '2020-05-06 16:21:11.272970'),
(5683, 1, '1', '2020-05-06 16:21:16.941429'),
(5684, 1, '1', '2020-05-06 16:21:17.516430'),
(5685, 1, '1', '2020-05-06 16:21:19.041829'),
(5686, 1, '1', '2020-05-06 16:21:19.447678'),
(5687, 1, '1', '2020-05-06 16:21:20.066882'),
(5688, 1, '1', '2020-05-06 16:21:21.374775'),
(5689, 1, '1', '2020-05-06 16:21:26.849897'),
(5690, 1, '1', '2020-05-06 16:21:27.614934'),
(5691, 1, '1', '2020-05-06 16:21:29.416515'),
(5692, 1, '1', '2020-05-06 16:21:29.865354'),
(5693, 1, '1', '2020-05-06 16:21:30.274753'),
(5694, 1, '1', '2020-05-06 16:21:32.399398'),
(5695, 1, '1', '2020-05-06 16:21:32.898631');
INSERT INTO `strata_sensor_data` (`id`, `sensor_id`, `sensor_value`, `created_date`) VALUES
(5696, 1, '1', '2020-05-06 16:21:38.349239'),
(5697, 1, '1', '2020-05-06 16:21:40.107379'),
(5698, 1, '1', '2020-05-06 16:21:42.556438'),
(5699, 1, '1', '2020-05-06 16:21:44.098918'),
(5700, 1, '1', '2020-05-06 16:21:50.781962'),
(5701, 1, '1', '2020-05-06 16:21:51.231424'),
(5702, 1, '1', '2020-05-06 16:21:51.740543'),
(5703, 1, '1', '2020-05-06 16:21:53.031242'),
(5704, 1, '1', '2020-05-06 16:21:58.803362'),
(5705, 1, '1', '2020-05-06 16:22:02.031460'),
(5706, 1, '1', '2020-05-06 16:22:02.481666'),
(5707, 1, '1', '2020-05-06 16:22:07.980965'),
(5708, 1, '1', '2020-05-06 16:22:09.347869'),
(5709, 1, '1', '2020-05-06 16:22:09.805820'),
(5710, 1, '1', '2020-05-06 16:22:10.239489'),
(5711, 1, '1', '2020-05-06 16:22:11.797004'),
(5712, 1, '1', '2020-05-06 16:22:17.321838'),
(5713, 1, '1', '2020-05-06 16:22:17.924285'),
(5714, 1, '1', '2020-05-06 16:22:19.138645'),
(5715, 1, '1', '2020-05-06 16:22:19.607580'),
(5716, 1, '1', '2020-05-06 16:22:21.247439'),
(5717, 1, '1', '2020-05-06 16:22:26.647114'),
(5718, 1, '1', '2020-05-06 16:22:27.146959'),
(5719, 1, '1', '2020-05-06 16:22:29.005151'),
(5720, 1, '1', '2020-05-06 16:22:29.373513'),
(5721, 1, '1', '2020-05-06 16:22:30.174087'),
(5722, 1, '1', '2020-05-06 16:22:31.671374'),
(5723, 1, '1', '2020-05-06 16:22:32.555591'),
(5724, 1, '1', '2020-05-06 16:22:38.614481'),
(5725, 1, '1', '2020-05-06 16:22:40.062694'),
(5726, 1, '1', '2020-05-06 16:22:40.450597'),
(5727, 1, '1', '2020-05-06 16:22:41.388654'),
(5728, 1, '1', '2020-05-06 16:22:46.891218'),
(5729, 1, '1', '2020-05-06 16:22:47.420815'),
(5730, 1, '1', '2020-05-06 16:22:49.041178'),
(5731, 1, '1', '2020-05-06 16:22:49.541154'),
(5732, 1, '1', '2020-05-06 16:22:50.032736'),
(5733, 1, '1', '2020-05-06 16:22:51.379427'),
(5734, 1, '1', '2020-05-06 16:22:56.996201'),
(5735, 1, '1', '2020-05-06 16:22:57.448624'),
(5736, 1, '1', '2020-05-06 16:22:59.420438'),
(5737, 1, '1', '2020-05-06 16:22:59.882005'),
(5738, 1, '1', '2020-05-06 16:23:00.345895'),
(5739, 1, '1', '2020-05-06 16:23:01.665674'),
(5740, 1, '1', '2020-05-06 16:23:07.103959'),
(5741, 1, '1', '2020-05-06 16:23:07.470175'),
(5742, 1, '1', '2020-05-06 16:23:08.920217'),
(5743, 1, '1', '2020-05-06 16:23:09.411545'),
(5744, 1, '1', '2020-05-06 16:23:09.894440'),
(5745, 1, '1', '2020-05-06 16:23:12.237511'),
(5746, 1, '1', '2020-05-06 16:23:12.645847'),
(5747, 1, '1', '2020-05-06 16:23:18.061486'),
(5748, 1, '1', '2020-05-06 16:23:19.290290'),
(5749, 1, '1', '2020-05-06 16:23:19.752538'),
(5750, 1, '1', '2020-05-06 16:23:20.232368'),
(5751, 1, '1', '2020-05-06 16:23:21.553586'),
(5752, 1, '1', '2020-05-06 16:23:26.957223'),
(5753, 1, '1', '2020-05-06 16:23:27.419771'),
(5754, 1, '1', '2020-05-06 16:23:28.937996'),
(5755, 1, '1', '2020-05-06 16:23:29.311173'),
(5756, 1, '1', '2020-05-06 16:23:29.724014'),
(5757, 1, '1', '2020-05-06 16:23:31.358343'),
(5758, 1, '1', '2020-05-06 16:23:36.768424'),
(5759, 1, '1', '2020-05-06 16:23:37.356967'),
(5760, 1, '1', '2020-05-06 16:23:38.699477'),
(5761, 1, '1', '2020-05-06 16:23:39.127601'),
(5762, 1, '1', '2020-05-06 16:23:39.793592'),
(5763, 1, '1', '2020-05-06 16:23:41.252770'),
(5764, 1, '1', '2020-05-06 16:23:46.768370'),
(5765, 1, '1', '2020-05-06 16:23:47.209701'),
(5766, 1, '1', '2020-05-06 16:23:49.060263'),
(5767, 1, '1', '2020-05-06 16:23:49.444163'),
(5768, 1, '1', '2020-05-06 16:23:49.990931'),
(5769, 1, '1', '2020-05-06 16:23:51.535204'),
(5770, 1, '1', '2020-05-06 16:23:57.160179'),
(5771, 1, '1', '2020-05-06 16:23:57.585097'),
(5772, 1, '1', '2020-05-06 16:23:59.243303'),
(5773, 1, '1', '2020-05-06 16:23:59.685350'),
(5774, 1, '1', '2020-05-06 16:24:00.226703'),
(5775, 1, '1', '2020-05-06 16:24:01.810523'),
(5776, 1, '1', '2020-05-06 16:24:07.234645'),
(5777, 1, '1', '2020-05-06 16:24:07.767382'),
(5778, 1, '1', '2020-05-06 16:24:11.984367'),
(5779, 1, '1', '2020-05-06 16:24:12.475281'),
(5780, 1, '1', '2020-05-06 16:24:13.309087'),
(5781, 1, '1', '2020-05-06 16:24:18.784188'),
(5782, 1, '1', '2020-05-06 16:24:20.301263'),
(5783, 1, '1', '2020-05-06 16:24:20.776558'),
(5784, 1, '1', '2020-05-06 16:24:21.933632'),
(5785, 1, '1', '2020-05-06 16:24:22.567933'),
(5786, 1, '1', '2020-05-06 16:24:28.050544'),
(5787, 1, '1', '2020-05-06 16:24:29.750730'),
(5788, 1, '1', '2020-05-06 16:24:30.250837'),
(5789, 1, '1', '2020-05-06 16:24:30.840255'),
(5790, 1, '1', '2020-05-06 16:24:32.342398'),
(5791, 1, '1', '2020-05-06 16:24:33.042341'),
(5792, 1, '1', '2020-05-06 16:24:38.491655'),
(5793, 1, '1', '2020-05-06 16:24:39.941121'),
(5794, 1, '1', '2020-05-06 16:24:40.433865'),
(5795, 1, '1', '2020-05-06 16:24:41.038189'),
(5796, 1, '1', '2020-05-06 16:24:42.391592'),
(5797, 1, '1', '2020-05-06 16:24:42.832294'),
(5798, 1, '1', '2020-05-06 16:24:48.232815'),
(5799, 1, '1', '2020-05-06 16:24:49.764678'),
(5800, 1, '1', '2020-05-06 16:24:50.399213'),
(5801, 1, '1', '2020-05-06 16:24:50.849508'),
(5802, 1, '1', '2020-05-06 16:24:52.657982'),
(5803, 1, '1', '2020-05-06 16:24:53.174648'),
(5804, 1, '1', '2020-05-06 16:24:58.615151'),
(5805, 1, '1', '2020-05-06 16:25:00.232769'),
(5806, 1, '1', '2020-05-06 16:25:00.790949'),
(5807, 1, '1', '2020-05-06 16:25:01.807241'),
(5808, 1, '1', '2020-05-06 16:25:07.240544'),
(5809, 1, '1', '2020-05-06 16:25:07.907333'),
(5810, 1, '1', '2020-05-06 16:25:09.399406'),
(5811, 1, '1', '2020-05-06 16:25:10.007633'),
(5812, 1, '1', '2020-05-06 16:25:11.617189'),
(5813, 1, '1', '2020-05-06 16:25:17.214846'),
(5814, 1, '1', '2020-05-06 16:25:17.706345'),
(5815, 1, '1', '2020-05-06 16:25:19.198865'),
(5816, 1, '1', '2020-05-06 16:25:19.631814'),
(5817, 1, '1', '2020-05-06 16:25:21.807222'),
(5818, 1, '1', '2020-05-06 16:25:27.398186'),
(5819, 1, '1', '2020-05-06 16:25:27.856800'),
(5820, 1, '1', '2020-05-06 16:25:29.439744'),
(5821, 1, '1', '2020-05-06 16:25:30.015174'),
(5822, 1, '1', '2020-05-06 16:25:31.340587'),
(5823, 1, '1', '2020-05-06 16:25:37.056822'),
(5824, 1, '1', '2020-05-06 16:25:37.498365'),
(5825, 1, '1', '2020-05-06 16:25:39.023503'),
(5826, 1, '1', '2020-05-06 16:25:39.580884'),
(5827, 1, '1', '2020-05-06 16:25:40.022843'),
(5828, 1, '1', '2020-05-06 16:25:41.482847'),
(5829, 1, '1', '2020-05-06 16:25:46.890017'),
(5830, 1, '1', '2020-05-06 16:25:47.322908'),
(5831, 1, '1', '2020-05-06 16:25:48.805797'),
(5832, 1, '1', '2020-05-06 16:25:49.265219'),
(5833, 1, '1', '2020-05-06 16:25:49.822428'),
(5834, 1, '1', '2020-05-06 16:25:52.176115'),
(5835, 1, '1', '2020-05-06 16:25:52.589710'),
(5836, 1, '1', '2020-05-06 16:25:58.064917'),
(5837, 1, '1', '2020-05-06 16:25:59.607453'),
(5838, 1, '1', '2020-05-06 16:26:00.106304'),
(5839, 1, '1', '2020-05-06 16:26:00.523427'),
(5840, 1, '1', '2020-05-06 16:26:02.190185'),
(5841, 1, '1', '2020-05-06 16:26:02.789423'),
(5842, 1, '1', '2020-05-06 16:26:08.365109'),
(5843, 1, '1', '2020-05-06 16:26:09.746406'),
(5844, 1, '1', '2020-05-06 16:26:10.833298'),
(5845, 1, '1', '2020-05-06 16:26:13.614202'),
(5846, 1, '1', '2020-05-06 16:26:23.820781'),
(5847, 1, '1', '2020-05-06 16:26:26.724505'),
(5848, 1, '1', '2020-05-06 16:26:28.791467'),
(5849, 1, '1', '2020-05-06 16:26:36.953587'),
(5850, 1, '1', '2020-05-06 16:26:38.961890'),
(5851, 1, '1', '2020-05-06 16:26:41.004186'),
(5852, 1, '1', '2020-05-06 16:26:47.127706'),
(5853, 1, '1', '2020-05-06 16:26:49.219646'),
(5854, 1, '1', '2020-05-06 16:26:51.336998'),
(5855, 1, '1', '2020-05-06 16:26:57.311749'),
(5856, 1, '1', '2020-05-06 16:26:59.461704'),
(5857, 1, '1', '2020-05-06 16:27:01.527927'),
(5858, 1, '1', '2020-05-06 16:27:07.428406'),
(5859, 1, '1', '2020-05-06 16:27:09.569172'),
(5860, 1, '1', '2020-05-06 16:27:13.710976'),
(5861, 1, '1', '2020-05-06 16:27:25.719464'),
(5862, 1, '1', '2020-05-06 16:27:29.852692'),
(5863, 1, '1', '2020-05-06 16:27:33.977510'),
(5864, 1, '1', '2020-05-06 16:27:40.012128'),
(5865, 1, '1', '2020-05-06 16:27:42.028209'),
(5866, 1, '1', '2020-05-06 16:27:44.011976'),
(5867, 1, '1', '2020-05-06 16:27:52.120035'),
(5868, 1, '1', '2020-05-06 16:27:56.153534'),
(5869, 1, '1', '2020-05-06 16:27:58.403140'),
(5870, 1, '1', '2020-05-06 16:28:04.303252'),
(5871, 1, '1', '2020-05-06 16:28:06.328799'),
(5872, 1, '1', '2020-05-06 16:28:08.403152'),
(5873, 1, '1', '2020-05-06 16:28:20.708920'),
(5874, 1, '1', '2020-05-06 16:28:22.575007'),
(5875, 1, '1', '2020-05-06 16:28:24.635929'),
(5876, 1, '1', '2020-05-06 16:28:34.783445'),
(5877, 1, '1', '2020-05-06 16:28:36.832445'),
(5878, 1, '1', '2020-05-06 16:28:38.866237'),
(5879, 1, '1', '2020-05-06 16:28:45.152221'),
(5880, 1, '1', '2020-05-06 16:28:47.119658'),
(5881, 1, '1', '2020-05-06 16:28:49.215241'),
(5882, 1, '1', '2020-05-06 16:29:02.294641'),
(5883, 1, '1', '2020-05-06 16:29:04.297483'),
(5884, 1, '1', '2020-05-06 16:29:06.428727'),
(5885, 1, '1', '2020-05-06 16:29:15.535665'),
(5886, 1, '1', '2020-05-06 16:29:20.676635'),
(5887, 1, '1', '2020-05-06 16:29:23.647277'),
(5888, 1, '1', '2020-05-06 16:29:38.946232'),
(5889, 1, '1', '2020-05-06 16:29:40.929066'),
(5890, 1, '1', '2020-05-06 16:29:45.343337'),
(5891, 1, '1', '2020-05-06 16:30:00.370889'),
(5892, 1, '1', '2020-05-06 16:30:04.928564'),
(5893, 1, '1', '2020-05-06 16:30:10.345849'),
(5894, 1, '1', '2020-05-06 16:30:19.610681'),
(5895, 1, '1', '2020-05-06 16:30:26.710304'),
(5896, 1, '1', '2020-05-06 16:30:30.836444'),
(5897, 1, '1', '2020-05-06 16:30:50.179073'),
(5898, 1, '1', '2020-05-06 16:30:52.482890'),
(5899, 1, '1', '2020-05-06 16:30:55.360263'),
(5900, 1, '1', '2020-05-06 16:31:05.951258'),
(5901, 1, '1', '2020-05-06 16:31:11.009838'),
(5902, 1, '1', '2020-05-06 16:31:14.517638'),
(5903, 1, '1', '2020-05-06 16:31:25.709111'),
(5904, 1, '1', '2020-05-06 16:31:29.891618'),
(5905, 1, '1', '2020-05-06 16:31:31.749568'),
(5906, 1, '1', '2020-05-06 16:31:43.958549'),
(5907, 1, '1', '2020-05-06 16:31:48.993352'),
(5908, 1, '1', '2020-05-06 16:31:55.715691'),
(5909, 1, '1', '2020-05-06 16:32:06.498645'),
(5910, 1, '1', '2020-05-06 16:32:09.490429'),
(5911, 1, '1', '2020-05-06 16:32:13.431960'),
(5912, 1, '1', '2020-05-06 16:32:22.509661'),
(5913, 1, '1', '2020-05-06 16:32:26.681575'),
(5914, 1, '1', '2020-05-06 16:32:30.723271'),
(5915, 1, '1', '2020-05-06 16:32:40.781229'),
(5916, 1, '1', '2020-05-06 16:32:42.738893'),
(5917, 1, '1', '2020-05-06 16:32:45.081050'),
(5918, 1, '1', '2020-05-06 16:32:52.939353'),
(5919, 1, '1', '2020-05-06 16:32:54.398361'),
(5920, 1, '1', '2020-05-06 16:32:55.946691'),
(5921, 1, '1', '2020-05-06 16:33:09.080522'),
(5922, 1, '1', '2020-05-06 16:33:13.055585'),
(5923, 1, '1', '2020-05-06 16:33:17.129748'),
(5924, 1, '1', '2020-05-06 16:33:23.337199'),
(5925, 1, '1', '2020-05-06 16:33:25.387219'),
(5926, 1, '1', '2020-05-06 16:33:27.295389'),
(5927, 1, '1', '2020-05-06 16:33:33.472286'),
(5928, 1, '1', '2020-05-06 16:33:35.495406'),
(5929, 1, '1', '2020-05-06 16:33:37.430245'),
(5930, 1, '1', '2020-05-06 16:33:49.679942'),
(5931, 1, '1', '2020-05-06 16:33:55.938071'),
(5932, 1, '1', '2020-05-06 16:33:57.721771'),
(5933, 1, '1', '2020-05-06 16:34:03.888179'),
(5934, 1, '1', '2020-05-06 16:34:05.911531'),
(5935, 1, '1', '2020-05-06 16:34:09.927529'),
(5936, 1, '1', '2020-05-06 16:34:18.760108'),
(5937, 1, '1', '2020-05-06 16:34:20.271297'),
(5938, 1, '1', '2020-05-06 16:34:21.371263'),
(5939, 1, '1', '2020-05-06 16:34:24.679241'),
(5940, 1, '1', '2020-05-06 16:34:25.452528'),
(5941, 1, '1', '2020-05-06 16:34:26.279533'),
(5942, 1, '1', '2020-05-06 16:34:33.709936'),
(5943, 1, '1', '2020-05-06 16:34:34.909405'),
(5944, 1, '1', '2020-05-06 16:34:36.078078'),
(5945, 1, '1', '2020-05-06 16:34:39.284935'),
(5946, 1, '1', '2020-05-06 16:34:40.030811'),
(5947, 1, '1', '2020-05-06 16:34:40.946685'),
(5948, 1, '1', '2020-05-06 16:34:43.305790'),
(5949, 1, '1', '2020-05-06 16:34:44.009288'),
(5950, 1, '1', '2020-05-06 16:34:44.634707'),
(5951, 1, '1', '2020-05-06 16:34:47.280011'),
(5952, 1, '1', '2020-05-06 16:34:48.200774'),
(5953, 1, '1', '2020-05-06 16:35:09.588748'),
(5954, 1, '1', '2020-05-06 16:35:10.866460'),
(5955, 1, '1', '2020-05-06 16:35:16.249356'),
(5956, 1, '1', '2020-05-06 16:35:17.296130'),
(5957, 1, '1', '2020-05-06 16:35:20.074539'),
(5958, 1, '1', '2020-05-06 16:35:20.680039'),
(5959, 1, '1', '2020-05-06 16:35:21.415662'),
(5960, 1, '1', '2020-05-06 16:35:23.980005'),
(5961, 1, '1', '2020-05-06 16:35:24.475081'),
(5962, 1, '1', '2020-05-06 16:35:25.113155'),
(5963, 1, '1', '2020-05-06 16:35:27.116702'),
(5964, 1, '1', '2020-05-06 16:35:27.512925'),
(5965, 1, '1', '2020-05-06 16:35:33.107804'),
(5966, 1, '1', '2020-05-06 16:35:34.840589'),
(5967, 1, '1', '2020-05-06 16:35:35.403978'),
(5968, 1, '1', '2020-05-06 16:35:35.821276'),
(5969, 1, '1', '2020-05-06 16:35:37.713178'),
(5970, 1, '1', '2020-05-06 16:35:38.290859'),
(5971, 1, '1', '2020-05-06 16:35:43.864937'),
(5972, 1, '1', '2020-05-06 16:35:45.254544'),
(5973, 1, '1', '2020-05-06 16:35:45.740331'),
(5974, 1, '1', '2020-05-06 16:35:46.781988'),
(5975, 1, '1', '2020-05-06 16:35:52.406421'),
(5976, 1, '1', '2020-05-06 16:35:53.691075'),
(5977, 1, '1', '2020-05-06 16:35:56.048243'),
(5978, 1, '1', '2020-05-06 16:36:01.497646'),
(5979, 1, '1', '2020-05-06 16:36:02.023441'),
(5980, 1, '1', '2020-05-06 16:36:03.587797'),
(5981, 1, '1', '2020-05-06 16:36:04.012814'),
(5982, 1, '1', '2020-05-06 16:36:04.431246'),
(5983, 1, '1', '2020-05-06 16:36:06.089408'),
(5984, 1, '1', '2020-05-06 16:36:11.639364'),
(5985, 1, '1', '2020-05-06 16:36:12.114002'),
(5986, 1, '1', '2020-05-06 16:36:13.897597'),
(5987, 1, '1', '2020-05-06 16:36:14.354512'),
(5988, 1, '1', '2020-05-06 16:36:14.906260'),
(5989, 1, '1', '2020-05-06 16:36:16.305610'),
(5990, 1, '1', '2020-05-06 16:36:21.739496'),
(5991, 1, '1', '2020-05-06 16:36:22.230506'),
(5992, 1, '1', '2020-05-06 16:36:23.688963'),
(5993, 1, '1', '2020-05-06 16:36:24.137923'),
(5994, 1, '1', '2020-05-06 16:36:24.613734'),
(5995, 1, '1', '2020-05-06 16:36:26.164494'),
(5996, 1, '1', '2020-05-06 16:36:32.029927'),
(5997, 1, '1', '2020-05-06 16:36:32.537816'),
(5998, 1, '1', '2020-05-06 16:36:34.307445'),
(5999, 1, '1', '2020-05-06 16:36:34.755218'),
(6000, 1, '1', '2020-05-06 16:36:35.204645'),
(6001, 1, '1', '2020-05-06 16:36:36.963128'),
(6002, 1, '1', '2020-05-06 16:36:37.780055'),
(6003, 1, '1', '2020-05-06 16:36:38.954829'),
(6004, 1, '1', '2020-05-06 16:36:41.560304'),
(6005, 1, '1', '2020-05-06 16:36:42.554096'),
(6006, 1, '1', '2020-05-06 16:36:48.470794'),
(6007, 1, '1', '2020-05-06 16:36:50.066598'),
(6008, 1, '1', '2020-05-06 16:36:50.872460'),
(6009, 1, '1', '2020-05-06 16:36:52.588193'),
(6010, 1, '1', '2020-05-06 16:36:53.096025'),
(6011, 1, '1', '2020-05-06 16:36:58.704091'),
(6012, 1, '1', '2020-05-06 16:37:00.220305'),
(6013, 1, '1', '2020-05-06 16:37:00.778848'),
(6014, 1, '1', '2020-05-06 16:37:02.345561'),
(6015, 1, '1', '2020-05-06 16:37:03.012443'),
(6016, 1, '1', '2020-05-06 16:37:08.479302'),
(6017, 1, '1', '2020-05-06 16:37:10.196133'),
(6018, 1, '1', '2020-05-06 16:37:10.804419'),
(6019, 1, '1', '2020-05-06 16:37:12.570069'),
(6020, 1, '1', '2020-05-06 16:37:13.103774'),
(6021, 1, '1', '2020-05-06 16:37:18.661771'),
(6022, 1, '1', '2020-05-06 16:37:20.396062'),
(6023, 1, '1', '2020-05-06 16:37:20.971986'),
(6024, 1, '1', '2020-05-06 16:37:22.270161'),
(6025, 1, '1', '2020-05-06 16:37:23.254093'),
(6026, 1, '1', '2020-05-06 16:37:23.986513'),
(6027, 1, '1', '2020-05-06 16:37:30.488079'),
(6028, 1, '1', '2020-05-06 16:37:31.038701'),
(6029, 1, '1', '2020-05-06 16:37:31.502555'),
(6030, 1, '1', '2020-05-06 16:37:31.927446'),
(6031, 1, '1', '2020-05-06 16:37:32.577708'),
(6032, 1, '1', '2020-05-06 16:37:38.060645'),
(6033, 1, '1', '2020-05-06 16:37:40.115663'),
(6034, 1, '1', '2020-05-06 16:37:40.672307'),
(6035, 1, '1', '2020-05-06 16:37:41.508167'),
(6036, 1, '1', '2020-05-06 16:37:43.036129'),
(6037, 1, '1', '2020-05-06 16:37:43.629420'),
(6038, 1, '1', '2020-05-06 16:37:44.143671'),
(6039, 1, '1', '2020-05-06 16:37:50.820582'),
(6040, 1, '1', '2020-05-06 16:37:51.435451'),
(6041, 1, '1', '2020-05-06 16:37:51.911773'),
(6042, 1, '1', '2020-05-06 16:37:52.979358'),
(6043, 1, '1', '2020-05-06 16:37:58.703865'),
(6044, 1, '1', '2020-05-06 16:38:00.270893'),
(6045, 1, '1', '2020-05-06 16:38:00.804221'),
(6046, 1, '1', '2020-05-06 16:38:01.802110'),
(6047, 1, '1', '2020-05-06 16:38:07.203932'),
(6048, 1, '1', '2020-05-06 16:38:07.595182'),
(6049, 1, '1', '2020-05-06 16:38:09.370711'),
(6050, 1, '1', '2020-05-06 16:38:10.350883'),
(6051, 1, '1', '2020-05-06 16:38:11.776303'),
(6052, 1, '1', '2020-05-06 16:38:12.737128'),
(6053, 1, '1', '2020-05-06 16:38:18.228967'),
(6054, 1, '1', '2020-05-06 16:38:19.895969'),
(6055, 1, '1', '2020-05-06 16:38:20.383954'),
(6056, 1, '1', '2020-05-06 16:38:20.845455'),
(6057, 1, '1', '2020-05-06 16:38:22.267552'),
(6058, 1, '1', '2020-05-06 16:38:22.659657'),
(6059, 1, '1', '2020-05-06 16:38:28.217270'),
(6060, 1, '1', '2020-05-06 16:38:29.983401'),
(6061, 1, '1', '2020-05-06 16:38:30.783717'),
(6062, 1, '1', '2020-05-06 16:38:31.242053'),
(6063, 1, '1', '2020-05-06 16:38:32.975181'),
(6064, 1, '1', '2020-05-06 16:38:33.535051'),
(6065, 1, '1', '2020-05-06 16:38:34.296641'),
(6066, 1, '1', '2020-05-06 16:38:40.950205'),
(6067, 1, '1', '2020-05-06 16:38:41.491595'),
(6068, 1, '1', '2020-05-06 16:38:42.582964'),
(6069, 1, '1', '2020-05-06 16:38:44.224796'),
(6070, 1, '1', '2020-05-06 16:38:44.861864'),
(6071, 1, '1', '2020-05-06 16:38:46.825010'),
(6072, 1, '1', '2020-05-06 16:38:52.374953'),
(6073, 1, '1', '2020-05-06 16:38:52.833077'),
(6074, 1, '1', '2020-05-06 16:38:54.265583'),
(6075, 1, '1', '2020-05-06 16:38:54.850438'),
(6076, 1, '1', '2020-05-06 16:38:56.429403'),
(6077, 1, '1', '2020-05-06 16:39:01.857268'),
(6078, 1, '1', '2020-05-06 16:39:02.465413'),
(6079, 1, '1', '2020-05-06 16:39:04.449409'),
(6080, 1, '1', '2020-05-06 16:39:04.865301'),
(6081, 1, '1', '2020-05-06 16:39:05.465489'),
(6082, 1, '1', '2020-05-06 16:39:07.052587'),
(6083, 1, '1', '2020-05-06 16:39:07.573431'),
(6084, 1, '1', '2020-05-06 16:39:13.123950'),
(6085, 1, '1', '2020-05-06 16:39:14.980298'),
(6086, 1, '1', '2020-05-06 16:39:15.898297'),
(6087, 1, '1', '2020-05-06 16:39:16.590271'),
(6088, 1, '1', '2020-05-06 16:39:18.440874'),
(6089, 1, '1', '2020-05-06 16:39:19.157542'),
(6090, 1, '1', '2020-05-06 16:39:19.640118'),
(6091, 1, '1', '2020-05-06 16:39:21.139336'),
(6092, 1, '1', '2020-05-06 16:39:26.748923'),
(6093, 1, '1', '2020-05-06 16:39:27.281531'),
(6094, 1, '1', '2020-05-06 16:39:28.689800'),
(6095, 1, '1', '2020-05-06 16:39:29.214275'),
(6096, 1, '1', '2020-05-06 16:39:29.739562'),
(6097, 1, '1', '2020-05-06 16:39:31.547820'),
(6098, 1, '1', '2020-05-06 16:39:37.031300'),
(6099, 1, '1', '2020-05-06 16:39:37.614014'),
(6100, 1, '1', '2020-05-06 16:39:39.287218'),
(6101, 1, '1', '2020-05-06 16:39:39.939331'),
(6102, 1, '1', '2020-05-06 16:39:40.430753'),
(6103, 1, '1', '2020-05-06 16:39:42.114303'),
(6104, 1, '1', '2020-05-06 16:39:42.664111'),
(6105, 1, '1', '2020-05-06 16:39:48.238613'),
(6106, 1, '1', '2020-05-06 16:39:49.829293'),
(6107, 1, '1', '2020-05-06 16:39:50.590548'),
(6108, 1, '1', '2020-05-06 16:39:51.193843'),
(6109, 1, '1', '2020-05-06 16:39:53.029937'),
(6110, 1, '1', '2020-05-06 16:39:53.639769'),
(6111, 1, '1', '2020-05-06 16:39:54.163983'),
(6112, 1, '1', '2020-05-06 16:40:00.730056'),
(6113, 1, '1', '2020-05-06 16:40:01.246910'),
(6114, 1, '1', '2020-05-06 16:40:01.670916'),
(6115, 1, '1', '2020-05-06 16:40:02.830003'),
(6116, 1, '1', '2020-05-06 16:40:08.455815'),
(6117, 1, '1', '2020-05-06 16:40:10.188567'),
(6118, 1, '1', '2020-05-06 16:40:10.805147'),
(6119, 1, '1', '2020-05-06 16:40:12.896286'),
(6120, 1, '1', '2020-05-06 16:40:13.530155'),
(6121, 1, '1', '2020-05-06 16:40:14.145956'),
(6122, 1, '1', '2020-05-06 16:40:20.771480'),
(6123, 1, '1', '2020-05-06 16:40:21.404130'),
(6124, 1, '1', '2020-05-06 16:40:21.988159'),
(6125, 1, '1', '2020-05-06 16:40:23.522562'),
(6126, 1, '1', '2020-05-06 16:40:24.104991'),
(6127, 1, '1', '2020-05-06 16:40:30.504041'),
(6128, 1, '1', '2020-05-06 16:40:30.954636'),
(6129, 1, '1', '2020-05-06 16:40:31.779110'),
(6130, 1, '1', '2020-05-06 16:40:33.757246'),
(6131, 1, '1', '2020-05-06 16:40:34.338528'),
(6132, 1, '1', '2020-05-06 16:40:34.912489'),
(6133, 1, '1', '2020-05-06 16:40:36.829815'),
(6134, 1, '1', '2020-05-06 16:40:42.271626'),
(6135, 1, '1', '2020-05-06 16:40:42.795761'),
(6136, 1, '1', '2020-05-06 16:40:44.469517'),
(6137, 1, '1', '2020-05-06 16:40:45.029965'),
(6138, 1, '1', '2020-05-06 16:40:46.537694'),
(6139, 1, '1', '2020-05-06 16:40:51.979006'),
(6140, 1, '1', '2020-05-06 16:40:52.521735'),
(6141, 1, '1', '2020-05-06 16:40:53.996247'),
(6142, 1, '1', '2020-05-06 16:40:54.787939'),
(6143, 1, '1', '2020-05-06 16:40:55.212402'),
(6144, 1, '1', '2020-05-06 16:40:56.879722'),
(6145, 1, '1', '2020-05-06 16:41:02.352858'),
(6146, 1, '1', '2020-05-06 16:41:02.826906'),
(6147, 1, '1', '2020-05-06 16:41:04.479898'),
(6148, 1, '1', '2020-05-06 16:41:05.152526'),
(6149, 1, '1', '2020-05-06 16:41:48.902992'),
(6150, 1, '1', '2020-05-06 16:42:10.168894'),
(6151, 1, '1', '2020-05-06 16:42:31.518504'),
(6152, 1, '1', '2020-05-06 16:43:35.604692'),
(6153, 1, '1', '2020-05-06 16:43:57.401065'),
(6154, 1, '1', '2020-05-06 16:44:18.753233'),
(6155, 1, '1', '2020-05-06 16:45:22.758625'),
(6156, 1, '1', '2020-05-06 16:45:44.115625'),
(6157, 1, '1', '2020-05-06 16:46:05.432116'),
(6158, 1, '1', '2020-05-06 16:47:09.555229'),
(6159, 1, '1', '2020-05-06 16:47:30.912470'),
(6160, 1, '1', '2020-05-06 16:47:52.170070'),
(6161, 1, '1', '2020-05-06 16:48:56.200653'),
(6162, 1, '1', '2020-05-06 16:49:17.501531'),
(6163, 1, '1', '2020-05-06 16:49:38.806927'),
(6164, 1, '1', '2020-05-06 16:50:43.335617'),
(6165, 1, '1', '2020-05-06 16:51:05.140719'),
(6166, 1, '1', '2020-05-06 16:51:26.648511'),
(6167, 1, '1', '2020-05-06 16:52:31.334005'),
(6168, 1, '1', '2020-05-06 16:52:52.700300'),
(6169, 1, '1', '2020-05-06 16:53:13.974942'),
(6170, 1, '1', '2020-05-06 16:54:18.148371'),
(6171, 1, '1', '2020-05-06 16:54:39.553736'),
(6172, 1, '1', '2020-05-06 16:55:00.860668'),
(6173, 1, '1', '2020-05-06 16:56:04.662560'),
(6174, 1, '1', '2020-05-06 16:56:25.928510'),
(6175, 1, '1', '2020-05-06 16:56:47.156302'),
(6176, 1, '1', '2020-05-06 16:57:51.087514'),
(6177, 1, '1', '2020-05-06 16:58:12.361316'),
(6178, 1, '1', '2020-05-06 16:58:33.802406'),
(6179, 1, '1', '2020-05-06 16:59:37.923682'),
(6180, 1, '1', '2020-05-06 16:59:59.199207'),
(6181, 1, '1', '2020-05-06 17:00:20.548689'),
(6182, 1, '1', '2020-05-06 17:01:24.779614'),
(6183, 1, '1', '2020-05-06 17:01:46.180245'),
(6184, 1, '1', '2020-05-06 17:02:07.464711'),
(6185, 1, '1', '2020-05-06 17:03:11.269076'),
(6186, 1, '1', '2020-05-06 17:03:33.248972'),
(6187, 1, '1', '2020-05-06 17:03:54.589827'),
(6188, 1, '1', '2020-05-06 17:04:58.299332'),
(6189, 1, '1', '2020-05-06 17:05:19.619727'),
(6190, 1, '1', '2020-05-06 17:05:40.890058'),
(6191, 1, '1', '2020-05-06 17:06:45.589470'),
(6192, 1, '1', '2020-05-06 17:07:10.509404'),
(6193, 1, '1', '2020-05-06 17:07:34.516441'),
(6194, 1, '1', '2020-05-06 17:08:38.953980'),
(6195, 1, '1', '2020-05-06 17:09:01.111292'),
(6196, 1, '1', '2020-05-06 17:09:22.726385'),
(6197, 1, '1', '2020-05-06 17:10:26.782260'),
(6198, 1, '1', '2020-05-06 17:10:48.265482'),
(6199, 1, '1', '2020-05-06 17:11:09.928039'),
(6200, 1, '1', '2020-05-06 17:12:14.281414'),
(6201, 1, '1', '2020-05-06 17:12:36.000577'),
(6202, 1, '1', '2020-05-06 17:12:57.534440'),
(6203, 1, '1', '2020-05-06 17:14:03.512595'),
(6204, 1, '1', '2020-05-06 17:14:24.848259'),
(6205, 1, '1', '2020-05-06 17:14:46.134993'),
(6206, 1, '1', '2020-05-06 17:15:50.275550'),
(6207, 1, '1', '2020-05-06 17:16:11.627271'),
(6208, 1, '1', '2020-05-06 17:16:33.117719'),
(6209, 1, '1', '2020-05-06 17:17:37.140061'),
(6210, 1, '1', '2020-05-06 17:17:58.447531'),
(6211, 1, '1', '2020-05-06 17:18:19.747023'),
(6212, 1, '1', '2020-05-06 17:19:23.769570'),
(6213, 1, '1', '2020-05-06 17:19:45.029636'),
(6214, 1, '1', '2020-05-06 17:20:06.259804'),
(6215, 1, '1', '2020-05-06 17:21:10.119624'),
(6216, 1, '1', '2020-05-06 17:21:31.451483'),
(6217, 1, '1', '2020-05-06 17:21:52.702370'),
(6218, 1, '1', '2020-05-06 17:22:57.045247'),
(6219, 1, '1', '2020-05-06 17:23:18.491585'),
(6220, 1, '1', '2020-05-06 17:23:40.184923');

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
-- Table structure for table `temp_monitoring_automatic`
--

CREATE TABLE `temp_monitoring_automatic` (
  `id` int(11) NOT NULL,
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
  `modified_date` datetime(6) NOT NULL
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
  `dew_status` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `temp_monitoring_manual`
--

INSERT INTO `temp_monitoring_manual` (`id`, `wbt`, `dbt`, `relativeHumidity`, `dewPointTemp`, `moistureContent`, `enthalpy`, `sigmaHeat`, `rel_hum_status`, `dew_status`, `date`) VALUES
(1, 34, 45, 48.62705312540252, 21.860632048752613, 21.63606475328263, 101.1023008318277, 98.0222339256799, 'Danger', 'Normal', '2020-07-13'),
(2, 45, 46, 94.58136541088074, 30.927225852915342, 45.729414480799925, 164.4130987841793, 155.7969911547794, 'Danger', 'Danger', '2020-07-13'),
(3, 0.75, 0.8, 99.18035849899107, 0.5360824607985691, 3.9461625415930426, 10.68140268810905, 10.66901075118781, 'Safe', 'Normal', '2020-07-13'),
(4, 0.75, 0.8, 99.18035849899107, 0.5360824607985691, 3.9461625415930426, 10.68140268810905, 10.66901075118781, 'Safe', 'Normal', '2020-07-13');

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

-- --------------------------------------------------------

--
-- Table structure for table `training_attendance`
--

CREATE TABLE `training_attendance` (
  `id` int(11) NOT NULL,
  `training_date` varchar(255) DEFAULT NULL,
  `training_type` varchar(255) DEFAULT NULL,
  `training_tittle` varchar(255) DEFAULT NULL,
  `training_desc` varchar(255) DEFAULT NULL,
  `mine_id_id` int(11) DEFAULT NULL,
  `shift_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `training_attendance_details`
--

CREATE TABLE `training_attendance_details` (
  `id` int(11) NOT NULL,
  `is_present` varchar(3) NOT NULL,
  `emp_id_id` int(11) DEFAULT NULL,
  `training_attendance_id_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usersession`
--

CREATE TABLE `usersession` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `time` datetime(6) NOT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `session_id` varchar(40) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usersession`
--

INSERT INTO `usersession` (`id`, `ip`, `time`, `useragent`, `session_id`, `user_id`) VALUES
(3, '192.168.1.115', '2020-07-14 17:28:46.147559', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2705.29 Safari/537.36', 'myrfdm9wgq80gfcia8f6h2jpvwjnbdpd', 1),
(4, '192.168.1.126', '2020-07-14 17:31:42.872927', 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2728.54 Safari/537.36', 'm6srydxqknhczn07stxi9ovowxe0d3p6', 1),
(5, '192.168.1.126', '2020-07-15 09:34:42.854614', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:51.0) Gecko/20100101 Firefox/51.0', 'yz63q3jynkncwhgmrpdph1c6nvz6ovv0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `water_level_acquisition_data`
--

CREATE TABLE `water_level_acquisition_data` (
  `id` int(11) NOT NULL,
  `sensor_id` int(11) NOT NULL,
  `sensor_value` double NOT NULL,
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
  `alarm_water_level_1` double NOT NULL,
  `alarm_water_level_2` double NOT NULL,
  `alarm_water_level_3` double NOT NULL,
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
(1, 'L1', '100', 20, 30, 40, 'First Stage Warning Message , Please be Careful.', 'Second Stage Warning Message , Please be alert situation is not good.', 'Third Stage Warning Message , Please  leave the underground', '', '', '', '192.168.1.181', '', 'text2voice', '2020-07-15 10:50:26.427053', '2020-07-15 10:50:26.437055', '70', '10', 4);

-- --------------------------------------------------------

--
-- Table structure for table `windroseaddsensor`
--

CREATE TABLE `windroseaddsensor` (
  `id` int(11) NOT NULL,
  `sensor_id` varchar(200) DEFAULT NULL,
  `sensor_name` varchar(200) DEFAULT NULL,
  `sensor_unit` varchar(200) DEFAULT NULL,
  `min_range` varchar(200) DEFAULT NULL,
  `max_range` varchar(200) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `created_date` datetime(6) NOT NULL,
  `modified_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `windrosedata`
--

CREATE TABLE `windrosedata` (
  `id` int(11) NOT NULL,
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
  `modified_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `windrosesetting`
--

CREATE TABLE `windrosesetting` (
  `id` int(11) NOT NULL,
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
  `modified_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accident_records`
--
ALTER TABLE `accident_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accident_records_mine_id_92cb3e77_fk_MineDetails_id` (`mine_id`),
  ADD KEY `accident_records_shift_id_id_85df117c_fk_MineShift_id` (`shift_id_id`);

--
-- Indexes for table `accident_records_others`
--
ALTER TABLE `accident_records_others`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accident_records_oth_accident_id_id_fecd9bdd_fk_accident_` (`accident_id_id`);

--
-- Indexes for table `accident_record_employee`
--
ALTER TABLE `accident_record_employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accident_record_empl_accident_record_id_978186b1_fk_accident_` (`accident_record_id`),
  ADD KEY `accident_record_employee_employee_id_id_a7d8af8f_fk_employee_id` (`employee_id_id`);

--
-- Indexes for table `alternateprodmodel`
--
ALTER TABLE `alternateprodmodel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_emp`
--
ALTER TABLE `attendance_emp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attendance_emp_mine_id_id_shift_id_id_e_9405fccb_uniq` (`mine_id_id`,`shift_id_id`,`emp_id_id`,`ab_pr_date`),
  ADD KEY `attendance_emp_emp_id_id_f3219312_fk_employee_id` (`emp_id_id`),
  ADD KEY `attendance_emp_shift_id_id_0337145a_fk_MineShift_id` (`shift_id_id`);

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
  ADD UNIQUE KEY `username` (`username`);

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
-- Indexes for table `dgms_first_schedule_form_v`
--
ALTER TABLE `dgms_first_schedule_form_v`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `employee_immediate_staff_id_2fe45a98_fk_employee_id` (`immediate_staff_id`),
  ADD KEY `employee_mine_id_54296788_fk_MineDetails_id` (`mine_id`),
  ADD KEY `employee_mining_role_id_af80969e_fk_MiningRole_id` (`mining_role_id`),
  ADD KEY `employee_shift_id_id_4914bbfb_fk_MineShift_id` (`shift_id_id`);

--
-- Indexes for table `employeeshiftassign`
--
ALTER TABLE `employeeshiftassign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EmployeeShiftAssign_employee_id_id_93107e43_fk_employee_id` (`employee_id_id`),
  ADD KEY `EmployeeShiftAssign_shift_id_id_84e1204f_fk_MineShift_id` (`shift_id_id`);

--
-- Indexes for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_attendance_emp_id_id_166c3f10_fk_employee_id` (`emp_id_id`);

--
-- Indexes for table `extract_or_reduce_pillars`
--
ALTER TABLE `extract_or_reduce_pillars`
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `date` (`date`);

--
-- Indexes for table `gasmodel_auto`
--
ALTER TABLE `gasmodel_auto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gasmonitoring_manual`
--
ALTER TABLE `gasmonitoring_manual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `identification_report_of_the_problem`
--
ALTER TABLE `identification_report_of_the_problem`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_report`
--
ALTER TABLE `medical_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medical_report_employee_id_id_dbf45bba_fk_employee_id` (`employee_id_id`),
  ADD KEY `medical_report_mine_id_id_80b83d54_fk_MineDetails_id` (`mine_id_id`);

--
-- Indexes for table `metal_mine_extract_permission`
--
ALTER TABLE `metal_mine_extract_permission`
  ADD PRIMARY KEY (`id`);

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
  ADD UNIQUE KEY `MiningRole_mine_id_name_c0702997_uniq` (`mine_id`,`name`),
  ADD KEY `MiningRole_parent_role_id_59fe44ec_fk_MiningRole_id` (`parent_role_id`);

--
-- Indexes for table `news_bulletin`
--
ALTER TABLE `news_bulletin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_bulletin_user_id_id_04cc1349_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `notification_type_message_470de7ab_uniq` (`type`,`message`),
  ADD KEY `notification_employee_id_id_440ac6f5_fk_employee_id` (`employee_id_id`);

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
  ADD KEY `profile_extension_mine_id_id_70967400_fk_MineDetails_id` (`mine_id_id`),
  ADD KEY `profile_extension_user_id_id_20e360b3_fk_auth_user_id` (`user_id_id`);

--
-- Indexes for table `rate_of_minimum_wage`
--
ALTER TABLE `rate_of_minimum_wage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rate_of_minimum_wage_mine_id_id_category_c1dacdc7_uniq` (`mine_id_id`,`category`);

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
  ADD KEY `rescue_records_mine_id_7c3ac060_fk_MineDetails_id` (`mine_id`),
  ADD KEY `rescue_records_shift_id_id_3fb6da7b_fk_MineShift_id` (`shift_id_id`);

--
-- Indexes for table `rescue_records_others`
--
ALTER TABLE `rescue_records_others`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rescue_records_others_rescue_id_id_9d8892cd_fk_rescue_records_id` (`rescue_id_id`);

--
-- Indexes for table `rescue_records_rescued_employees_name`
--
ALTER TABLE `rescue_records_rescued_employees_name`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rescue_records_rescued_e_rescue_records_id_employ_50876a5a_uniq` (`rescue_records_id`,`employee_id`),
  ADD KEY `rescue_records_rescu_employee_id_5e0c8726_fk_employee_` (`employee_id`);

--
-- Indexes for table `rescue_records_rescue_person_name`
--
ALTER TABLE `rescue_records_rescue_person_name`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rescue_records_rescue_pe_rescue_records_id_employ_0d7619be_uniq` (`rescue_records_id`,`employee_id`),
  ADD KEY `rescue_records_rescu_employee_id_e46e0d83_fk_employee_` (`employee_id`);

--
-- Indexes for table `safety`
--
ALTER TABLE `safety`
  ADD PRIMARY KEY (`id`),
  ADD KEY `safety_mine_id_73f6a4e6_fk_MineDetails_id` (`mine_id`);

--
-- Indexes for table `safetytable`
--
ALTER TABLE `safetytable`
  ADD PRIMARY KEY (`id`),
  ADD KEY `safetytable_safety_id_id_ef70be42_fk_safety_id` (`safety_id_id`);

--
-- Indexes for table `sensordata`
--
ALTER TABLE `sensordata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor_node`
--
ALTER TABLE `sensor_node`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sensor_node_mine_id_id_node_id_52490764_uniq` (`mine_id_id`,`node_id`);

--
-- Indexes for table `sensor_sensor_node`
--
ALTER TABLE `sensor_sensor_node`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sensor_sensor_node_mine_id_id_node_id_id_sensor_id_c2fd51ed_uniq` (`mine_id_id`,`node_id_id`,`sensor_id`),
  ADD KEY `sensor_sensor_node_node_id_id_f6b7a19e_fk_sensor_node_id` (`node_id_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slope_location`
--
ALTER TABLE `slope_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slope_location_mine_name_id_dba9c1e0_fk_MineDetails_id` (`mine_name_id`);

--
-- Indexes for table `slope_sensor`
--
ALTER TABLE `slope_sensor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slope_sensor_location_id_id_66a2595b_fk_slope_location_id` (`location_id_id`),
  ADD KEY `slope_sensor_mine_name_id_e612d8b4_fk_MineDetails_id` (`mine_name_id`);

--
-- Indexes for table `slope_sensor_data`
--
ALTER TABLE `slope_sensor_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slope_sensor_flag`
--
ALTER TABLE `slope_sensor_flag`
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
-- Indexes for table `temp_monitoring_automatic`
--
ALTER TABLE `temp_monitoring_automatic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_monitoring_manual`
--
ALTER TABLE `temp_monitoring_manual`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tracking_router`
--
ALTER TABLE `tracking_router`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tracking_router_mine_id_id_router_id_1ac31439_uniq` (`mine_id_id`,`router_id`);

--
-- Indexes for table `training_attendance`
--
ALTER TABLE `training_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `training_attendance_mine_id_id_379eb13f_fk_MineDetails_id` (`mine_id_id`),
  ADD KEY `training_attendance_shift_id_id_fd90e294_fk_MineShift_id` (`shift_id_id`);

--
-- Indexes for table `training_attendance_details`
--
ALTER TABLE `training_attendance_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `training_attendance_details_emp_id_id_9a76abbf_fk_employee_id` (`emp_id_id`),
  ADD KEY `training_attendance__training_attendance__e6610ad8_fk_training_` (`training_attendance_id_id`);

--
-- Indexes for table `usersession`
--
ALTER TABLE `usersession`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usersession_session_id_87b6832f_fk_django_session_session_key` (`session_id`),
  ADD KEY `usersession_user_id_bc976b70_fk_auth_user_id` (`user_id`);

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
-- AUTO_INCREMENT for table `accident_records_others`
--
ALTER TABLE `accident_records_others`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accident_record_employee`
--
ALTER TABLE `accident_record_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alternateprodmodel`
--
ALTER TABLE `alternateprodmodel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_emp`
--
ALTER TABLE `attendance_emp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch_details`
--
ALTER TABLE `branch_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_details`
--
ALTER TABLE `category_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `container_details`
--
ALTER TABLE `container_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deduct_details`
--
ALTER TABLE `deduct_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `development_permission`
--
ALTER TABLE `development_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_coalmine_annual_annexure_i`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_coalmine_annual_annexure_i_subtable_1`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i_subtable_1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_coalmine_annual_annexure_i_subtable_2`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i_subtable_2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dgms_coalmine_annual_annexure_i_subtable_3`
--
ALTER TABLE `dgms_coalmine_annual_annexure_i_subtable_3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `dgms_first_schedule_form_v`
--
ALTER TABLE `dgms_first_schedule_form_v`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employeeshiftassign`
--
ALTER TABLE `employeeshiftassign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_attendance`
--
ALTER TABLE `employee_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extract_or_reduce_pillars`
--
ALTER TABLE `extract_or_reduce_pillars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fireexp_area`
--
ALTER TABLE `fireexp_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fire_exp_gases`
--
ALTER TABLE `fire_exp_gases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fire_exp_gaseswifi`
--
ALTER TABLE `fire_exp_gaseswifi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fire_exp_manual`
--
ALTER TABLE `fire_exp_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gasmodel_auto`
--
ALTER TABLE `gasmodel_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gasmonitoring_manual`
--
ALTER TABLE `gasmonitoring_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `identification_report_of_the_problem`
--
ALTER TABLE `identification_report_of_the_problem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical_report`
--
ALTER TABLE `medical_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `metal_mine_extract_permission`
--
ALTER TABLE `metal_mine_extract_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `minedetails`
--
ALTER TABLE `minedetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `miner_tracking`
--
ALTER TABLE `miner_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mineshift`
--
ALTER TABLE `mineshift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `miningrole`
--
ALTER TABLE `miningrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `news_bulletin`
--
ALTER TABLE `news_bulletin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `production_weighbridge`
--
ALTER TABLE `production_weighbridge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profile_extension`
--
ALTER TABLE `profile_extension`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rate_of_minimum_wage`
--
ALTER TABLE `rate_of_minimum_wage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reorder_details`
--
ALTER TABLE `reorder_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rescue_records`
--
ALTER TABLE `rescue_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rescue_records_others`
--
ALTER TABLE `rescue_records_others`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rescue_records_rescued_employees_name`
--
ALTER TABLE `rescue_records_rescued_employees_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rescue_records_rescue_person_name`
--
ALTER TABLE `rescue_records_rescue_person_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `safety`
--
ALTER TABLE `safety`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `safetytable`
--
ALTER TABLE `safetytable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sensordata`
--
ALTER TABLE `sensordata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor_node`
--
ALTER TABLE `sensor_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor_sensor_node`
--
ALTER TABLE `sensor_sensor_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slope_location`
--
ALTER TABLE `slope_location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slope_sensor`
--
ALTER TABLE `slope_sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slope_sensor_data`
--
ALTER TABLE `slope_sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slope_sensor_flag`
--
ALTER TABLE `slope_sensor_flag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sms_configuration`
--
ALTER TABLE `sms_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `strata_sensor`
--
ALTER TABLE `strata_sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `strata_sensor_data`
--
ALTER TABLE `strata_sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6221;

--
-- AUTO_INCREMENT for table `strata_sensor_flag`
--
ALTER TABLE `strata_sensor_flag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier_details`
--
ALTER TABLE `supplier_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_monitoring_automatic`
--
ALTER TABLE `temp_monitoring_automatic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_monitoring_manual`
--
ALTER TABLE `temp_monitoring_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tracking_router`
--
ALTER TABLE `tracking_router`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training_attendance`
--
ALTER TABLE `training_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training_attendance_details`
--
ALTER TABLE `training_attendance_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usersession`
--
ALTER TABLE `usersession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `water_level_acquisition_data`
--
ALTER TABLE `water_level_acquisition_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `water_level_monitoring_sensor`
--
ALTER TABLE `water_level_monitoring_sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `windroseaddsensor`
--
ALTER TABLE `windroseaddsensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `windrosedata`
--
ALTER TABLE `windrosedata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `windrosesetting`
--
ALTER TABLE `windrosesetting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `accident_record_empl_accident_record_id_978186b1_fk_accident_` FOREIGN KEY (`accident_record_id`) REFERENCES `accident_records` (`id`),
  ADD CONSTRAINT `accident_record_employee_employee_id_id_a7d8af8f_fk_employee_id` FOREIGN KEY (`employee_id_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `attendance_emp`
--
ALTER TABLE `attendance_emp`
  ADD CONSTRAINT `attendance_emp_emp_id_id_f3219312_fk_employee_id` FOREIGN KEY (`emp_id_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `attendance_emp_mine_id_id_2967489a_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `attendance_emp_shift_id_id_0337145a_fk_MineShift_id` FOREIGN KEY (`shift_id_id`) REFERENCES `mineshift` (`id`);

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
  ADD CONSTRAINT `employee_immediate_staff_id_2fe45a98_fk_employee_id` FOREIGN KEY (`immediate_staff_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `employee_mine_id_54296788_fk_MineDetails_id` FOREIGN KEY (`mine_id`) REFERENCES `minedetails` (`id`),
  ADD CONSTRAINT `employee_mining_role_id_af80969e_fk_MiningRole_id` FOREIGN KEY (`mining_role_id`) REFERENCES `miningrole` (`id`),
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
-- Constraints for table `rate_of_minimum_wage`
--
ALTER TABLE `rate_of_minimum_wage`
  ADD CONSTRAINT `rate_of_minimum_wage_mine_id_id_d54e6bdf_fk_MineDetails_id` FOREIGN KEY (`mine_id_id`) REFERENCES `minedetails` (`id`);

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
  ADD CONSTRAINT `training_attendance__training_attendance__e6610ad8_fk_training_` FOREIGN KEY (`training_attendance_id_id`) REFERENCES `training_attendance` (`id`),
  ADD CONSTRAINT `training_attendance_details_emp_id_id_9a76abbf_fk_employee_id` FOREIGN KEY (`emp_id_id`) REFERENCES `employee` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
