-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2020 at 06:45 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `gas_value` varchar(50) NOT NULL,
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `carousal`
--
ALTER TABLE `carousal`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employeeshiftassign`
--
ALTER TABLE `employeeshiftassign`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_employee`
--
ALTER TABLE `employee_employee`
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
-- AUTO_INCREMENT for table `gasmonitoring_auto`
--
ALTER TABLE `gasmonitoring_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gasmonitoring_manual`
--
ALTER TABLE `gasmonitoring_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `miner_tracking`
--
ALTER TABLE `miner_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mineshift`
--
ALTER TABLE `mineshift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `miningrole`
--
ALTER TABLE `miningrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news_bulletin`
--
ALTER TABLE `news_bulletin`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensor_wireless`
--
ALTER TABLE `sensor_wireless`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strata_sensor`
--
ALTER TABLE `strata_sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `strata_sensor_data`
--
ALTER TABLE `strata_sensor_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `temp_monitoring_manual`
--
ALTER TABLE `temp_monitoring_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tracking_router`
--
ALTER TABLE `tracking_router`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `training_rescue_accident`
--
ALTER TABLE `training_rescue_accident`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `water_level_acquisition_data`
--
ALTER TABLE `water_level_acquisition_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `water_level_monitoring_sensor`
--
ALTER TABLE `water_level_monitoring_sensor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
