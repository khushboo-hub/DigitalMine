-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2020 at 11:33 AM
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
(54, 'pbkdf2_sha256$150000$VvTBCvotj97r$0msL1fuiyUkfwg1KJPO9Xu+sg7v/x5i+tagjS4j2N8k=', '2020-01-22 11:01:23.307953', 1, 'admin', 'ADmin', 'ADmin', 'admin@gmail.com', 1, 1, '2020-01-22 11:01:15.005492'),
(55, 'pbkdf2_sha256$150000$qKYs7sNHnrCx$yF0EcnsE2s2sdCHfjLm5nVjc/EBUzpi2WzX8NLiksns=', '2020-02-03 15:56:07.253603', 0, 'cimfr', 'CSIRR', 'CIMFR', 'cimfr@gmail.com', 0, 1, '2020-01-22 12:11:46.893992'),
(57, 'pbkdf2_sha256$150000$yRSNPX5mgpp2$IVwmkNxSE28Ye9xU/VOf4ID62RI/eS6XyYThkwro0rs=', NULL, 0, 'cvbvcx', 'zxcvzv', 'xcvxc', 'xcbvxc@dsfg.com', 0, 0, '2020-01-22 12:15:37.452526'),
(58, 'pbkdf2_sha256$150000$KMGvZyefLB1g$LJM5nL0zVJVOQDTtyxiQsd83GxFnIQCp/crrRqiw6+I=', NULL, 0, 'cimfrxcvbxcvb', 'cvbvcx', 'cxvbvxc', 'xcbc@xfg.com', 0, 0, '2020-01-22 12:20:54.185246'),
(63, 'pbkdf2_sha256$150000$ZRjUVI63Nti2$/SN2hNaBaVP2zGFp8kjxbybkoKxBfr3RtqzKf58u9oQ=', '2020-01-22 12:36:46.695701', 0, 'vkisku', 'Vikash', 'Kiaku', 'vikashkisku@gmail.com', 0, 1, '2020-01-22 12:36:19.113071');

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
(55, 'setting', '0001_initial', '2020-01-24 11:12:56.346273');

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
('bkq9cjabia7eprg1it1m621vefg0lt22', 'YWU5ZjIyMmMyNjFkMjliMTJjNThjOGNiZTY0ODc4MGI5NjE5NmQ5Nzp7Il9hdXRoX3VzZXJfaWQiOiI1NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjk3MDY0MjMxZjA2ZTEzMmVlNDk3MDRlMTFiOGRmMjdhMjI4MjFiZiJ9', '2020-02-12 11:15:45.925936'),
('ff45a3lrqc7d7eaaw2leygvwicvj5ntp', 'YWU5ZjIyMmMyNjFkMjliMTJjNThjOGNiZTY0ODc4MGI5NjE5NmQ5Nzp7Il9hdXRoX3VzZXJfaWQiOiI1NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjk3MDY0MjMxZjA2ZTEzMmVlNDk3MDRlMTFiOGRmMjdhMjI4MjFiZiJ9', '2020-02-17 15:56:07.376864');

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
(2, 'M002', 'mohit', 'aanand', '2018-07-04', 'wb', 'mohit@example.com', '0000000000', 'Andra Pradesh', 'jj', '', 'M', 'M', 'employee_image/csir_logo_NRj_icon.ico', 'R687689', '3e2', 'T798795', '2018-06-21', '2018-07-09', 'Regular', 'underground', 'No', 'O+', 'OK', '', '', '', '', '', '', '', '', '', '', '', '0.00', '2018-07-04 12:42:18.017876', '2019-10-03 10:48:23.839205', 1, 1, 2),
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
(2, 'Goaf Area', 'Goaf Description', '192.168.1.154', 1);

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
  `gas_name` varchar(10) NOT NULL,
  `gas_value` double NOT NULL,
  `date_time` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'Jharia Coal Mine', 'Jhariya Jharkhand', 'Jharkhand', 23.7413105, 86.4067042, 'mine_map_image/cimfr_img.JPG', 8, 'Dhanbad Village/Road/Area', 'Dhanbad Tehsil', 'Dhanbad Dist.', '826001', '1978-02-23', 'LN78834784', '2018-06-27 07:28:36.806195'),
(2, 'Chinakuri', 'West Bangal', 'West Bangal', 23.6852802, 86.8574166, 'mine_map_image/Map.JPG', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-27 07:28:36.806195'),
(3, 'Lakhi Mata Coliary', 'Mugma', 'Jharkhand', 23.7409112, 86.4134906, '', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-28 06:42:25.208716'),
(4, 'Lalmatiya Coal Mines', 'Jharkhand', 'Bihar', 25.0552347, 87.3597246, 'mine_map_image/mine.gif', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-06-28 09:16:58.461585'),
(5, 'Mandal Mine', 'Dhabad', 'Jharkhand', 23.8172421, 86.4277111, 'mine_map_image/10_main.jpg', 8, NULL, NULL, NULL, NULL, NULL, NULL, '2018-07-17 11:35:18.730493'),
(6, 'bokaro mine', 'bokaro', 'Jharkhand', 23.6692956, 86.151112, 'mine_map_image/imagesFigure4.jpg', 40, NULL, NULL, NULL, NULL, NULL, NULL, '2018-07-24 09:25:10.247157'),
(7, 'CSIR-CIMFR', 'DHANBAD', 'Jharkhand', 23.8170376, 86.4276411, 'mine_map_image/cimfr_img.JPG', 8, 'Dhanbad', 'Dhanbad', 'Dhanbad', '826001', '2019-01-10', 'LOO9', '2019-01-10 11:06:42.454839'),
(8, 'Vikash Mines', 'Dhaiaya', 'Jharkhand', 25, 25, 'mine_map_image/mining_background_image.jpg', 8.9, 'Dhanbad', 'Dhanbad', 'Dhanbad', '826001', '2019-09-18', '12345678', '2019-09-18 17:11:59.985943');

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
(8, 8, 'R005', 'M004', 1, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000'),
(9, 8, 'R005', 'M001', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000'),
(10, 8, 'R002', 'M001', 0, '2019-07-31 16:47:27', '2019-11-14 00:00:00.000000');

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
(15, 'My Test Role', 'worker', '', '2019-10-31 15:59:21.015653', '2019-10-31 15:59:21.022606', 14, 8);

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
(2, 'RC meeting at CSIR-CIMFR on 16.11.2019 for R&D project on \"Development of Digital Mine using IoT\" | CSIR - Central Institute of Mining & Fuel Research | सीएसआईआर - केंद्रीय खनन एवं ईंधन अनुसंधान', '2020-01-22', NULL, '2020-01-22', 'news_bulletin/Digital_Mine_IoT___CSIR-CIMFR_NDfZoKT.pdf', 0, 54, 'FFFFFF');

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
(11, 'employee_image/images_dgjoaTJ.jpg', 55, 1),
(12, 'employee_image/images_ZMnzmsH.jpg', 63, 1);

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
  `mine_id_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sensor_node`
--

INSERT INTO `sensor_node` (`id`, `nodeid`, `name`, `location`, `x_axis`, `y_axis`, `photo1`, `photo2`, `description`, `mine_id_id`) VALUES
(1, 'N001', 'Node1', 'Left Side', 85.65, 42.78, 'emp_img/node_logo_q5YCuoz.png', 'emp_img/node_red.png', 'sdgs', 1),
(2, 'N002', 'Node 2', 'New Pillar 1', 62.38, 43.98, 'emp_img/node_logo_q5YCuoz.png', 'emp_img/node_red.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s', 8),
(3, 'N003', 'Node 3', 'pillar 3 ke pass', 65.97, 27.22, 'emp_img/node_logo_q5YCuoz.png', 'emp_img/node_red.png', 'second node for vikash mine', 8),
(4, 'vxv', 'xvcx', 'zxvzx', 45.37, 52.31, 'emp_img/Captu1re.jpg', 'emp_img/Captu1re_Rlis9Fv.jpg', 'xcvcxv', 1);

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
(5, '192.168.1.181', 'CH4-001', 'mETHANE SENSOR', 'ppm', '100', '100', '150', '200', 'ist level of ch4 on vikash mine node3', '2nd level of ch4 on vikash mine node3', '3rd level of ch4 on vikash mine node3', '#97ff28', '#ffcb0f', '#ff430f', 'ds', 8, 3);

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
(1, 'convergence', 'mm', 'c67', 2, 3, 5, '#ADFF2F', '#FFA500', '#FF0000', 'Strata Condition:First Stage Warning Message , Please be Careful.', 'Strata Condition:Second Stage Warning Message , Please be alert situation is not good.', 'Strata Condition:Third Stage Warning Message , Please  leave the underground', 'strata_warning_audio/strata-first-level-warning_richa_Orlrnwt.mp3', 'strata_warning_audio/strata_second_level_warning_richa_PKShIBB.mp3', 'strata_warning_audio/strata_third_level_warning_richa_0F00vvU.mp3', '192.168.1.201', 30, 'mp3only', 'n', '2019-10-21 12:10:11.972045', '2019-12-26 10:41:59.299494', 1, 1),
(2, 'Load Cell', 'mm', '', 100, 200, 300, '#ADFF2F', '#FFA500', '#FF0000', 'Strata Condition:First Stage Warning Message , Please be Careful.', 'Strata Condition:Second Stage Warning Message , Please be alert situation is not good.', 'Strata Condition:Third Stage Warning Message , Please  leave the underground', 'strata_warning_audio/strata-first-level-warning_richa_6ethUA3.mp3', 'strata_warning_audio/strata_second_level_warning_richa_Vx3SLyC.mp3', 'strata_warning_audio/strata_third_level_warning_richa_aSpaoRk.mp3', '192.168.1.181', 30, 'mp3only', 'vv', '2019-11-21 12:25:53.689867', '2019-12-26 10:41:02.199285', 2, 1),
(3, 'convergence', 'mm', 'c89', 5, 8, 10, '#ADFF2F', '#FFA500', '#FF0000', 'Strata Condition:First Stage Warning Message , Please be Careful.', 'Strata Condition:Second Stage Warning Message , Please be alert situation is not good.', 'Strata Condition:Third Stage Warning Message , Please  leave the underground', 'strata_warning_audio/strata-first-level-warning_richa_6ethUA3_zEDaTQn.mp3', 'strata_warning_audio/strata_second_level_warning_richa_Vx3SLyC_knkMJRk.mp3', 'strata_warning_audio/strata_third_level_warning_richa_aSpaoRk_iPUlnac.mp3', '192.168.1.201', 30, 'mp3only', '', '2019-12-31 11:15:30.360694', '2019-12-31 11:15:30.369653', 3, 8);

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
(9, 'Test', 'Test', 'Test', 'No', 55.21, 25, '192.168.1.1161', '2020-01-22 11:29:08.816731', '2020-01-22 11:29:08.816731', 8);

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
(2, 'WD/89K', '100', '10', '20', '30', 'First Stage Warning Message , Please be Careful.', 'Second Stage Warning Message , Please be alert situation is not good.', 'Third Stage Warning Message , Please  leave the underground', '', '', '', '192.168.1.181', 'nai', 'mp3only', '2019-12-31 11:17:45.932947', '2019-12-31 11:17:45.958878', '50', '20', 8);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT for table `background_task_completedtask`
--
ALTER TABLE `background_task_completedtask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fire_exp_gases`
--
ALTER TABLE `fire_exp_gases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fire_exp_gaseswifi`
--
ALTER TABLE `fire_exp_gaseswifi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fire_exp_manual`
--
ALTER TABLE `fire_exp_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gasmodel_auto`
--
ALTER TABLE `gasmodel_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `strata_sensor_flag`
--
ALTER TABLE `strata_sensor_flag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
