-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2024 at 01:32 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `accreditation`
--

-- --------------------------------------------------------

--
-- Table structure for table `accreditations`
--

CREATE TABLE `accreditations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_name` varchar(255) NOT NULL,
  `program_level_id` bigint(20) UNSIGNED NOT NULL,
  `instrument_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_type` varchar(255) NOT NULL,
  `apply_type` varchar(255) NOT NULL,
  `internal_accreditation_date_start` date NOT NULL,
  `internal_accreditation_date_end` date NOT NULL,
  `external_accreditation_date_start` date DEFAULT NULL,
  `external_accreditation_date_end` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accreditations`
--

INSERT INTO `accreditations` (`id`, `accreditation_name`, `program_level_id`, `instrument_id`, `accreditation_type`, `apply_type`, `internal_accreditation_date_start`, `internal_accreditation_date_end`, `external_accreditation_date_start`, `external_accreditation_date_end`, `created_at`, `updated_at`) VALUES
(31, 'IT ACCREDITATION 2024', 5, 21, 'Old', 'Re-Accreditation', '2024-01-22', '2024-01-29', NULL, NULL, '2024-01-21 19:17:57', '2024-01-21 19:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `accreditation_areas`
--

CREATE TABLE `accreditation_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accreditation_areas`
--

INSERT INTO `accreditation_areas` (`id`, `accreditation_id`, `area_id`, `created_at`, `updated_at`) VALUES
(173, 31, 56, '2024-01-21 19:17:57', '2024-01-21 19:17:57'),
(174, 31, 57, '2024-01-21 19:17:57', '2024-01-21 19:17:57'),
(175, 31, 58, '2024-01-21 19:17:57', '2024-01-21 19:17:57'),
(176, 31, 59, '2024-01-21 19:17:57', '2024-01-21 19:17:57'),
(177, 31, 60, '2024-01-21 19:17:57', '2024-01-21 19:17:57');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instrument_id` bigint(20) UNSIGNED NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `area_title` varchar(255) NOT NULL,
  `area_weight` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `instrument_id`, `area_name`, `area_title`, `area_weight`, `created_at`, `updated_at`) VALUES
(56, 21, 'Area 1', 'Vision, Mission, Goals and objectives', NULL, '2024-01-11 03:43:25', '2024-01-11 03:43:25'),
(57, 21, 'Area 3', 'Curriculum and Instruction', 8, '2024-01-11 03:56:43', '2024-01-18 00:45:45'),
(58, 21, 'Area 2', 'Faculty', 8, '2024-01-11 03:58:16', '2024-01-18 00:45:36'),
(59, 21, 'Area 4', 'Support to Students', 8, '2024-01-11 03:58:57', '2024-01-18 00:45:53'),
(60, 21, 'Area 5', 'Research', 5, '2024-01-11 03:59:27', '2024-01-18 00:46:03'),
(61, 21, 'Area 6', 'Extension And Community Involvement', 4, '2024-01-11 03:59:54', '2024-01-18 00:46:13'),
(62, 21, 'Area 7', 'Library', 5, '2024-01-11 04:23:01', '2024-01-18 00:46:28'),
(63, 21, 'Area 8', 'Physical plant and Facilities', 3, '2024-01-11 04:23:06', '2024-01-18 00:46:48'),
(64, 21, 'Area 9', 'Laboratories', 4, '2024-01-11 04:23:27', '2024-01-18 00:46:59'),
(65, 21, 'Area 10', 'Administration', 5, '2024-01-11 04:24:00', '2024-01-18 00:47:07'),
(66, 26, 'Area 1', 'Instruction', NULL, '2024-01-16 04:59:36', '2024-01-16 06:26:04'),
(67, 26, 'Area 2', 'Extension', NULL, '2024-01-16 06:26:15', '2024-01-16 06:26:15'),
(68, 26, 'Area 3', 'Research', NULL, '2024-01-16 06:26:23', '2024-01-16 06:26:23'),
(69, 26, 'Area 4', 'Linkages and Faculty Development', NULL, '2024-01-16 06:26:31', '2024-01-16 06:26:31'),
(70, 23, 'Area 1', 'Vision, Mission, Goals and objectives', NULL, '2024-01-18 00:26:58', '2024-01-18 00:26:58'),
(71, 26, 'Area 5', 'DIKO ALAM', NULL, '2024-01-19 11:06:31', '2024-01-19 11:06:31'),
(72, 30, 'Area 1', 'Vision, Mission, Goals and Objectives', NULL, '2024-01-21 05:01:23', '2024-01-21 05:01:23'),
(73, 30, 'Area 2', 'Faculty', NULL, '2024-01-21 05:26:56', '2024-01-21 05:26:56'),
(74, 30, 'Area 3', 'Curriculum and Instruction', NULL, '2024-01-21 05:27:03', '2024-01-21 05:27:03'),
(75, 30, 'Area 4', 'Support to Students', NULL, '2024-01-21 05:27:11', '2024-01-21 05:27:11'),
(76, 30, 'Area 5', 'Research', NULL, '2024-01-21 05:27:18', '2024-01-21 05:28:36'),
(77, 30, 'Area 6', 'Extension and Community Involvement', NULL, '2024-01-21 05:27:29', '2024-01-21 05:27:29'),
(78, 30, 'Area 7', 'Library', NULL, '2024-01-21 05:27:38', '2024-01-21 05:28:12'),
(79, 30, 'Area 8', 'Physical Plant and Facilities', NULL, '2024-01-21 05:27:45', '2024-01-21 05:28:50'),
(80, 30, 'Area 9', 'Laboratories', NULL, '2024-01-21 05:28:57', '2024-01-21 05:28:57'),
(81, 30, 'Area 10', 'Administration', NULL, '2024-01-21 05:29:03', '2024-01-21 05:29:03'),
(86, 31, 'Area 1', 'Vision, Mission, Goals and Objectives', NULL, '2024-01-21 06:18:24', '2024-01-21 06:18:24'),
(87, 31, 'Area 2', 'Faculty', NULL, '2024-01-21 06:18:42', '2024-01-21 06:18:42'),
(88, 31, 'Area 3', 'Curriculum and Instruction', NULL, '2024-01-21 06:18:52', '2024-01-21 06:18:52'),
(89, 31, 'Area 4', 'Support to Students', NULL, '2024-01-21 06:19:04', '2024-01-21 06:19:04'),
(90, 31, 'Area 5', 'Research', NULL, '2024-01-21 09:11:50', '2024-01-21 09:11:50'),
(91, 31, 'Area 6', 'Extension And Community Involvement', NULL, '2024-01-21 09:20:51', '2024-01-21 09:21:14'),
(92, 31, 'Area 7', 'Library', NULL, '2024-01-21 09:34:43', '2024-01-21 09:34:43'),
(93, 31, 'Area 8', 'Physical Plant and Facilities', NULL, '2024-01-21 09:47:28', '2024-01-21 09:47:28'),
(94, 31, 'Area 9', 'Laboratories', NULL, '2024-01-21 10:06:08', '2024-01-21 10:06:08'),
(95, 31, 'Area 10', 'Administration', NULL, '2024-01-21 10:17:23', '2024-01-21 10:17:23');

-- --------------------------------------------------------

--
-- Table structure for table `area_members`
--

CREATE TABLE `area_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `member_type` varchar(155) NOT NULL,
  `disableInternal` smallint(6) NOT NULL DEFAULT 0,
  `disableExternal` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `area_members`
--

INSERT INTO `area_members` (`id`, `accreditation_id`, `user_id`, `area_id`, `member_type`, `disableInternal`, `disableExternal`, `created_at`, `updated_at`) VALUES
(182, 31, 3, 56, 'internal', 0, 0, '2024-01-21 19:18:36', '2024-01-21 19:18:36'),
(184, 31, 30, 56, 'external', 0, 0, '2024-01-21 19:36:00', '2024-01-21 19:36:00'),
(185, 31, 37, 56, 'chair', 0, 0, '2024-01-23 05:37:57', '2024-01-23 05:37:57'),
(186, 31, 21, 56, 'member', 0, 0, '2024-01-23 05:38:22', '2024-01-23 05:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `area_programs`
--

CREATE TABLE `area_programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_ratings`
--

CREATE TABLE `area_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `rating` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `area_ratings`
--

INSERT INTO `area_ratings` (`id`, `user_id`, `area_id`, `accreditation_id`, `rating`, `created_at`, `updated_at`) VALUES
(11, 3, 56, 31, 2.09, '2024-01-21 19:33:15', '2024-01-21 19:33:15');

-- --------------------------------------------------------

--
-- Table structure for table `campuses`
--

CREATE TABLE `campuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `university_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `campuses`
--

INSERT INTO `campuses` (`id`, `university_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Urdaneta City Campus', '2023-09-18 03:28:47', '2024-01-21 06:22:45'),
(2, 1, 'Infanta Campus', '2023-09-18 03:38:19', '2023-09-18 03:38:19'),
(3, 1, 'Asingan Campus', '2023-09-18 03:38:26', '2023-09-18 03:38:26'),
(4, 1, 'Binmaley Campus', '2023-09-18 03:38:31', '2023-09-18 03:38:31'),
(5, 1, 'Lingayen Campus', '2023-09-18 03:38:34', '2023-09-18 03:38:34'),
(6, 1, 'Bayambang Campus', '2023-09-18 03:38:57', '2023-09-18 03:38:57'),
(7, 1, 'Sta. Maria Campus', '2023-09-18 03:39:04', '2023-09-18 03:39:04'),
(8, 1, 'San Carlos Campus', '2023-09-18 03:39:08', '2023-09-18 03:39:08'),
(9, 1, 'Alaminos Campus', '2023-09-18 03:39:27', '2023-09-18 03:39:27'),
(11, 5, 'Tayug Campus', '2024-01-16 23:23:34', '2024-01-16 23:23:34'),
(12, 5, 'Urdaneta Campus', '2024-01-16 23:45:30', '2024-01-16 23:45:30'),
(13, 3, 'Binalonan Campus', '2024-01-16 23:45:51', '2024-01-16 23:50:08'),
(14, 4, 'Dagupan Campus', '2024-01-16 23:50:27', '2024-01-16 23:50:27'),
(15, 4, 'Urdaneta Campus', '2024-01-16 23:50:35', '2024-01-16 23:50:35'),
(16, 2, 'Urdaneta Campus', '2024-01-16 23:50:45', '2024-01-16 23:50:45'),
(17, 8, 'Baguio City Campus', '2024-01-17 06:53:04', '2024-01-17 06:53:04'),
(18, 6, 'Baguio City Campus', '2024-01-17 06:53:18', '2024-01-17 06:53:18'),
(19, 9, 'Muñoz Campus', '2024-01-17 06:59:19', '2024-01-17 06:59:19'),
(20, 7, 'Baguio City Campus', '2024-01-17 07:11:00', '2024-01-17 07:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `compliance_report_files`
--

CREATE TABLE `compliance_report_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `screen_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_location` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `criterias`
--

CREATE TABLE `criterias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `criteria_description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `criterias`
--

INSERT INTO `criterias` (`id`, `criteria_description`, `created_at`, `updated_at`) VALUES
(1, 'Well-defined objectives', '2024-01-18 04:34:44', '2024-01-18 04:34:44'),
(2, 'Adequate and relevant projects/activities to achieve objectives', '2024-01-18 04:37:22', '2024-01-18 04:37:22'),
(3, 'Systematic and effective procedures, (teaching methods, curriculum development, testing, etc.', '2024-01-18 04:38:27', '2024-01-18 04:38:27'),
(4, 'Reasonable budget', '2024-01-18 04:38:37', '2024-01-18 04:38:37'),
(5, 'Provision of materials and other Resources', '2024-01-18 04:38:49', '2024-01-18 04:38:49'),
(6, 'Participation of significant number of faculty/staff/Students/community in major projects/activities', '2024-01-18 04:39:17', '2024-01-18 04:39:17'),
(7, 'Well-documented', '2024-01-18 04:39:36', '2024-01-18 04:39:36'),
(8, 'Distinctions, Achievements and Grants of this Program.', '2024-01-18 04:39:51', '2024-01-18 04:39:51'),
(9, 'Best Practices', '2024-01-18 04:40:02', '2024-01-18 04:40:02');

-- --------------------------------------------------------

--
-- Table structure for table `criteria_files`
--

CREATE TABLE `criteria_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `criteria_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `screen_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_location` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `criteria_messages`
--

CREATE TABLE `criteria_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `criteria_file_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `criteria_ratings`
--

CREATE TABLE `criteria_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `criteria_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `rating` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `designated_accreditor_areas`
--

CREATE TABLE `designated_accreditor_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `external_ratings`
--

CREATE TABLE `external_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `indicator_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `rating` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `external_sub_component_ratings`
--

CREATE TABLE `external_sub_component_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `sub_component_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `rating` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `external_sub_ratings`
--

CREATE TABLE `external_sub_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `sub_indicator_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `rating` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `indicators`
--

CREATE TABLE `indicators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `indicator_category_id` bigint(20) UNSIGNED NOT NULL,
  `indicator_name` varchar(255) NOT NULL,
  `indicator_desc` varchar(255) NOT NULL,
  `isOptional` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `indicators`
--

INSERT INTO `indicators` (`id`, `parameter_id`, `indicator_category_id`, `indicator_name`, `indicator_desc`, `isOptional`, `created_at`, `updated_at`) VALUES
(45, 49, 1, 'S.1.', 'The institution has a system of determining its Vision and Mission.', 0, '2024-01-11 04:42:50', '2024-01-11 04:42:50'),
(46, 49, 1, 'S.2.', 'The vision clearly reflects what the institution hopes to become in the future.', 0, '2024-01-11 04:43:02', '2024-01-11 04:43:02'),
(47, 49, 1, 'S.3.', 'The Mission clearly reflects the institution’s legal and other statutory mandates.', 0, '2024-01-11 04:43:18', '2024-01-11 04:43:18'),
(48, 49, 1, 'S.4.', 'The Goals of the College/Academic Unit/ are consistent with the Mission of the institution.', 0, '2024-01-11 04:43:30', '2024-01-11 04:43:30'),
(49, 49, 1, 'S.5.', 'The Objectives of the program have the expected outcomes in terms of competencies (skills and knowledge), values and other attributes of the graduates which include the development of:', 0, '2024-01-11 04:43:42', '2024-01-11 04:43:42'),
(50, 49, 3, 'I.1.', 'The Institution/College conducts review on the statement of the Vision and Mission as well as its goals and program objectives for the approval of authorities concerned.', 0, '2024-01-11 05:08:21', '2024-01-11 05:08:21'),
(51, 49, 3, 'I.2.', 'The College/Academic Unit follows a system of formulating its goals and the objectives of the program.', 0, '2024-01-11 05:08:39', '2024-01-11 05:09:18'),
(52, 49, 3, 'I.3.', 'The College’s/Academic Unit’s faculty, personnel, students and other stakeholders (cooperating agencies, linkages, alumni, industry sector and other concerned groups) participate in the formulation, review and/or revision of the VMGO.', 0, '2024-01-11 05:09:09', '2024-01-11 05:09:09'),
(53, 49, 6, 'O.1.', 'The VMGO are crafted and duly approved by the BOR/BOT.', 0, '2024-01-11 05:09:33', '2024-01-11 05:09:33'),
(54, 50, 1, 'S.1.', 'The VMGO are available on bulletin boards, in catalogs/manuals and in other forms of communication media.', 0, '2024-01-11 05:20:31', '2024-01-11 05:20:31'),
(55, 50, 3, 'I.1.', 'A system of dissemination and acceptability of the VMGO is enforced.', 0, '2024-01-11 05:20:43', '2024-01-11 05:20:43'),
(56, 50, 3, 'I.2.', 'The administrators/faculty attend in-service seminars and training on awareness and acceptability of the:', 0, '2024-01-11 05:20:58', '2024-01-11 05:20:58'),
(57, 50, 3, 'I.3.', 'The formulation/review/revision of the VMGO is participated in by the following:', 0, '2024-01-11 05:21:47', '2024-01-11 05:21:47'),
(58, 50, 3, 'I.4.', 'The faculty and staff perform their jobs/functions in consonance with the VMGO.', 0, '2024-01-11 05:22:37', '2024-01-11 05:22:37'),
(59, 50, 6, 'O.1.', 'There is full awareness and acceptance of the VMGO by the administrators, faculty, staff, students and other stakeholders', 0, '2024-01-11 05:22:51', '2024-01-11 05:22:51'),
(60, 50, 6, 'O.2.', 'There is congruency between actual educational practices and activities with the following:', 0, '2024-01-11 05:23:05', '2024-01-11 05:23:05'),
(61, 50, 6, 'O.3.', 'The goals and objectives are being achieved.', 0, '2024-01-11 05:23:55', '2024-01-11 05:23:55'),
(62, 51, 1, 'S.1.', 'The required number of faculty (3 full time) possess graduate degrees appropriate and relevant to the program (CMO 53 s. 2006) and other qualifications namely:', 0, '2024-01-11 05:33:03', '2024-01-11 09:15:02'),
(63, 51, 1, 'S.2.', 'Other qualifications such as the following are considered:', 0, '2024-01-11 08:03:14', '2024-01-11 08:03:14'),
(64, 51, 1, 'S.3.', 'Faculty handling OJT/practicum courses have had at least three (3) years of teaching and industry-based experience in the area, if applicable.', 0, '2024-01-11 08:04:22', '2024-01-11 08:04:22'),
(65, 51, 1, 'S.4', 'At least 50% of the faculty are Graduate Degree holders.', 0, '2024-01-11 08:04:34', '2024-01-11 08:04:34'),
(66, 51, 3, 'I.1.', 'The faculty demonstrate professional competence and are engage in any or a combination of the following:', 0, '2024-01-11 08:04:46', '2024-01-11 08:04:46'),
(67, 51, 3, 'I.2.', 'Faculty pursue graduate degrees in Information Technology and/or allied fields from reputable institutions (with at least Level II accreditation status or World/Asian rank).', 0, '2024-01-11 08:06:10', '2024-01-11 08:06:10'),
(68, 51, 6, 'O.1.', 'The institution has qualified and competent faculty', 0, '2024-01-11 08:06:23', '2024-01-11 08:06:23'),
(70, 52, 1, 'S.1.', 'There is an institutional Human Resource Development Plan/Program (HRDP) designed for faculty recruitment.', 0, '2024-01-11 09:28:03', '2024-01-11 09:28:03'),
(71, 52, 3, 'I.1.', 'Recruitment and selection of faculty is processed by the Faculty Selection Board using the following criteria:', 0, '2024-01-11 09:28:22', '2024-01-11 09:28:22'),
(72, 52, 3, 'I.2.', 'The hiring system adopts an open competitive selection, based on the CSC-approved Merit System and Promotion Plan of the Institution, published and well-disseminated through various means of communications:', 0, '2024-01-11 09:29:40', '2024-01-11 09:29:40'),
(73, 52, 3, 'I.3.', 'A Screening Committee selects and recommends the best and most qualified applicant.', 0, '2024-01-11 09:30:49', '2024-01-11 09:30:49'),
(74, 52, 3, 'I.4.', 'Measures to avoid professional in-breeding are observed.', 0, '2024-01-11 09:30:59', '2024-01-11 09:30:59'),
(75, 52, 3, 'I.5.', 'The institution conducts orientation for newly-hired faculty on the institutional vision and mission; CSC, PRC, DBM; and administration policies on their duties, responsibilities, benefits and other academic concerns.', 0, '2024-01-11 09:31:09', '2024-01-11 09:31:09'),
(76, 52, 6, 'O.1.', 'The most qualified faculty are selected.', 0, '2024-01-11 09:31:20', '2024-01-11 09:31:20'),
(77, 53, 1, 'S.1', 'Faculty-student ratio is in accordance with the program requirements and standards as follows:', 0, '2024-01-11 09:38:06', '2024-01-11 09:38:06'),
(78, 53, 1, 'S.2', 'There is provision for incentives of overload teaching in accordance with the CMO of the program and/or institutional guidelines.', 0, '2024-01-11 09:38:35', '2024-01-11 09:38:35'),
(79, 53, 1, 'S.3.', 'There is full-time faculty classified by rank, subject/specialization.', 0, '2024-01-11 09:38:50', '2024-01-11 09:38:50'),
(80, 53, 1, 'S.4.', 'Faculty schedule has time for preparation of lessons, scoring test papers, record-keeping, class evaluation, and other instruction-related activities.', 0, '2024-01-11 09:39:03', '2024-01-11 09:39:03'),
(81, 53, 1, 'S.5.', 'Workload Guidelines contain sufficient time for teaching and/or research, extension production and other assigned task.', 0, '2024-01-11 09:39:16', '2024-01-11 09:39:16'),
(82, 53, 1, 'S.6', 'There is equitable, measurable, and fair distribution of teaching load and other assignment.', 0, '2024-01-11 09:39:28', '2024-01-11 09:39:28'),
(83, 53, 3, 'I.1', 'The maximum total load is assigned to regular full-time faculty in accordance to the CMO If the Information Technology Education program and/or institutional guidelines.', 0, '2024-01-11 09:39:44', '2024-01-11 09:39:44'),
(84, 53, 3, 'I.2', 'A Faculty Manual is published formalizing faculty policies, standards and guidelines.', 0, '2024-01-11 09:39:53', '2024-01-11 09:39:53'),
(85, 53, 3, 'I.3', 'Professional subjects are handled by specialists in the discipline/program.', 0, '2024-01-11 09:40:01', '2024-01-11 09:40:01'),
(86, 53, 3, 'I. 4', 'The faculty are assigned to teach their minor/major fields specialization, for maximum of four (4) different subject preparations within a semester.', 0, '2024-01-11 09:40:12', '2024-01-11 09:40:12'),
(87, 53, 3, 'I.5', 'Administrative arrangements are adopted whenever vacancies/leaves of absence occur during the term', 0, '2024-01-11 09:40:25', '2024-01-11 09:40:25'),
(88, 53, 3, 'I.6', 'No less than 60% of the professional subjects in Information Technology Education program are handled by full-time faculty.', 0, '2024-01-11 09:40:35', '2024-01-11 09:40:35'),
(89, 53, 3, 'I.7', 'Teaching schedule does not allow more than six (6) hours continuous teaching.', 0, '2024-01-11 09:40:46', '2024-01-11 09:40:46'),
(90, 53, 3, 'I.8', 'Administrative research and/or professional assignment outside of regular teaching are given credits.', 0, '2024-01-11 09:40:56', '2024-01-11 09:40:56'),
(91, 53, 3, 'I.9', 'Consultation, tutorial, remedial classes, expert services, and other instructional-related activities are given credits in consonance with faculty workload guidelines.', 0, '2024-01-11 09:41:04', '2024-01-11 09:41:04'),
(92, 53, 6, 'O.1', 'The faculty are efficient and effective with sufficient time for instruction, research, extension, production and other assigned tasks.', 0, '2024-01-11 09:41:12', '2024-01-11 09:41:12'),
(93, 54, 1, 'S.1', 'The institution has a system of promotion in rank and tenure based of official issuance.', 0, '2024-01-11 09:41:25', '2024-01-11 09:41:25'),
(94, 54, 1, 'S.2', 'The institution has a policy on probationary status of employment.', 0, '2024-01-11 09:41:33', '2024-01-11 09:41:33'),
(95, 54, 1, 'S.3', 'At least 50% of the full-time faculty teaching the professional course are under permanent/regular status.', 0, '2024-01-11 09:41:43', '2024-01-11 09:41:43'),
(96, 54, 3, 'I.1', 'The institution implements the system of promotion in rank and salary based on existing policies and issuance.', 0, '2024-01-11 09:41:58', '2024-01-11 09:41:58'),
(97, 54, 3, 'I.2', 'Retirement, separation or termination benefits are implemented in accordance with institutional and government (CSC, GSIS/DBM) policies and guidelines.', 0, '2024-01-11 09:42:06', '2024-01-11 09:42:06'),
(98, 54, 3, 'I.3', 'The faculty are officially informed of their rank and tenure after evaluation of the credentials and performance.', 0, '2024-01-11 09:42:14', '2024-01-11 09:42:14'),
(99, 54, 3, 'I.4', 'The faculty concerned is officially informed of the extension, renewal, or termination of their appointments.', 0, '2024-01-11 09:42:21', '2024-01-11 09:42:21'),
(100, 54, 3, 'I.5', 'The institution implements a CSC-approved Strategic Performance Management System (SPMS) which emphasize quality teaching performance, research, creative work, extension and production service.', 0, '2024-01-11 09:42:30', '2024-01-11 09:42:30'),
(101, 54, 3, 'I.6', 'The probationary period or temporary status required before the grant of a permanent status to the faculty is in accordance with Civil Service and Institutional policies and guidelines.', 0, '2024-01-11 09:42:44', '2024-01-11 09:42:44'),
(102, 54, 6, 'O.1', 'The faculty are satisfied with their rank and employment status.', 0, '2024-01-11 09:42:56', '2024-01-11 09:42:56'),
(103, 55, 1, 'S.1', 'The institution has an approved and sustainable Faculty Development Program (FDP).', 0, '2024-01-11 09:43:14', '2024-01-11 09:43:14'),
(104, 55, 1, 'S.2', 'There are policies on faculty academic recognition and grant of scholarships/fellowships and awards.', 0, '2024-01-11 09:43:22', '2024-01-11 09:43:22'),
(105, 55, 1, 'S.3', 'Every faculty member has at least one active membership in professional/scientific or honor society relevant to his/her assignment and field of specialization.', 0, '2024-01-11 09:43:34', '2024-01-11 09:43:34'),
(106, 55, 1, 'S.4', 'The budget allocation for faculty development is adequate.', 0, '2024-01-11 09:43:45', '2024-01-11 09:43:45'),
(107, 55, 3, 'I.1', 'The institution implements a sustainable Faculty Development Program based on identified priorities/needs and in accordance with the CMO of the programs as follows:', 0, '2024-01-11 09:43:57', '2024-01-11 09:43:57'),
(108, 55, 3, 'I.2', 'The institution supports the professional growth of the faculty through attendance in educational lectures, symposia, seminars, workshops, conference and other forms of training.', 0, '2024-01-11 09:44:31', '2024-01-11 09:44:31'),
(109, 55, 3, 'I.3', 'The institution conducts in-service training activities regularly at least once per term.', 0, '2024-01-11 09:44:42', '2024-01-11 09:44:42'),
(110, 55, 3, 'I.4', 'Selection of deserving faculty to be granted scholarships, fellowships, seminars, conferences and/or training grants is done objectively.', 0, '2024-01-11 09:44:52', '2024-01-11 09:44:52'),
(111, 55, 3, 'I.5', 'The budget for faculty development is adequately allocated.', 0, '2024-01-11 09:44:59', '2024-01-11 09:44:59'),
(112, 55, 3, 'I.6', 'The budget for faculty development is wisely utilized.', 0, '2024-01-11 09:45:07', '2024-01-11 09:45:07'),
(113, 55, 3, 'I.7', 'The Faculty Development Program is implemented with the following provisions:', 0, '2024-01-11 09:45:16', '2024-01-11 09:45:16'),
(114, 55, 3, 'I.8', 'Opportunities for the faculty to attend/participate in capability -building and enhancing activities are fairly distributed.', 0, '2024-01-11 09:46:30', '2024-01-11 09:46:30'),
(115, 55, 3, 'I.9', 'Tuition fee privilege and other forms of assistance are utilized by faculty pursuing advanced (master’s and/or doctoral) degrees.', 0, '2024-01-11 09:46:40', '2024-01-11 09:46:40'),
(116, 55, 3, 'I.10', 'Faculty are given incentives for book writing, manuals, handbooks, compilations and instructional materials to keep up with new knowledge and techniques in the field of specialization.', 0, '2024-01-11 09:46:47', '2024-01-11 09:46:47'),
(117, 55, 6, 'O.1', 'The faculty are well-trained and competent to serve the institution.', 0, '2024-01-11 09:46:57', '2024-01-11 09:46:57'),
(118, 55, 6, 'O.2', 'The faculty are committed to serve and support the program and projects of the institution.', 0, '2024-01-11 09:47:04', '2024-01-11 09:47:04'),
(119, 56, 1, 'S.1.', 'The institution has a system of evaluating the faculty on the following:', 0, '2024-01-11 09:47:27', '2024-01-11 09:47:27'),
(120, 56, 3, 'I.1', 'demonstrate the skills and competencies in all of the following:', 0, '2024-01-11 09:47:58', '2024-01-11 09:47:58'),
(121, 56, 3, 'I.2', 'promptly submit the required reports and other academic outputs.', 0, '2024-01-11 09:48:54', '2024-01-11 09:48:54'),
(122, 56, 3, 'I.3', 'update lecture notes through an interface of relevant research findings and new knowledge.', 0, '2024-01-11 09:49:06', '2024-01-11 09:49:06'),
(123, 56, 3, 'I.4', 'serve as resource person/lecturer/consultant in the field of Information Technology Education.', 0, '2024-01-11 09:49:44', '2024-01-11 09:49:44'),
(124, 56, 3, 'I.5', 'present paper in local/regional/national and/or international fora', 0, '2024-01-11 09:51:56', '2024-01-11 09:51:56'),
(125, 56, 3, 'I.6', 'publish papers in regional, national and international magazines and journals;', 0, '2024-01-11 09:52:12', '2024-01-11 09:52:12'),
(126, 56, 3, 'I.7', 'conduct research and publish outputs as refereed journals of national and international circulation.', 0, '2024-01-11 09:52:24', '2024-01-11 09:52:24'),
(127, 56, 3, 'I.8', 'conduct extension and outreach activities.', 0, '2024-01-11 09:52:41', '2024-01-11 09:52:41'),
(128, 56, 3, 'I.9', 'regularly update respective course syllabi', 0, '2024-01-11 09:52:51', '2024-01-11 09:52:51'),
(129, 56, 3, 'I.10', 'utilize ICT and other resources in the enhancement of the teaching-learning process.', 0, '2024-01-11 09:53:03', '2024-01-11 09:53:03'),
(130, 56, 3, 'I.11', 'produce instructional materials, e.g. workbooks, manuals, modules, audio-visual aids, etc. to facilitate teaching and learning.', 0, '2024-01-11 09:53:17', '2024-01-11 09:53:17'),
(131, 56, 6, 'O.1', 'The faculty performance is generally satisfactory.', 0, '2024-01-11 09:59:48', '2024-01-11 09:59:48'),
(132, 56, 6, 'O.2', 'The scholarly works of the faculty are commendable.', 0, '2024-01-11 09:59:58', '2024-01-11 09:59:58'),
(133, 57, 1, 'S.1', 'The institution has a system of compensation and rewards to its faculty and staff.', 0, '2024-01-11 10:00:21', '2024-01-11 10:00:21'),
(134, 57, 3, 'I.1', 'the following fringe benefits are granted:', 0, '2024-01-11 10:00:29', '2024-01-11 10:00:29'),
(135, 57, 3, 'I.2', 'Policies on salaries/benefits and other privilege are disseminated to the faculty.', 0, '2024-01-11 10:16:36', '2024-01-11 10:16:36'),
(136, 57, 3, 'I.3', 'Salaries are paid regularly and promptly.', 0, '2024-01-11 10:16:42', '2024-01-11 10:16:42'),
(137, 57, 3, 'I.4', 'Teaching assignments beyond the regular load are compensated (e.g. overload pa, service credit, etc.).', 0, '2024-01-11 10:16:49', '2024-01-11 10:16:49'),
(138, 57, 3, 'I.5', 'Faculty who are actually involved in the production of scholarly materials are given credits for their work.', 0, '2024-01-11 10:16:56', '2024-01-11 10:16:56'),
(139, 57, 3, 'I.6', 'Faculty with outstanding performance are given recognition/awards and incentives.', 0, '2024-01-11 10:17:06', '2024-01-11 10:17:06'),
(140, 57, 6, 'O.1', 'The faculty are satisfied with their compensation and rewards.', 0, '2024-01-11 10:17:14', '2024-01-11 10:17:14'),
(141, 58, 1, 'S.1', 'The are approved SUC Code and SUC Faculty Manual that define the policies, guidelines, rules and regulations affecting the faculty.', 0, '2024-01-11 10:17:30', '2024-01-11 10:17:30'),
(142, 58, 3, 'I.1', 'responsibly observe the following:', 0, '2024-01-11 10:17:40', '2024-01-11 10:17:40'),
(143, 58, 3, 'I.2', 'follow the Code of Ethics of the Profession and the Code of Ethical Standards for Government Officials and Employees (RA 6713).', 0, '2024-01-11 10:18:11', '2024-01-11 10:18:11'),
(144, 58, 3, 'I.3', 'excuse academic freedom judiciously.', 0, '2024-01-11 10:18:18', '2024-01-11 10:18:18'),
(145, 58, 3, 'I.4', 'show commitment and loyalty to the institution as evidence by:', 0, '2024-01-11 10:18:26', '2024-01-11 10:18:26'),
(146, 58, 3, 'I.5', 'maintain harmonious interpersonal relations with superiors, peers, students, parents, and the community.', 0, '2024-01-11 10:19:30', '2024-01-11 10:19:30'),
(147, 58, 3, 'I.6', 'demonstrate knowledge of recent educational trends/issues/resources in the field of Information Technology Education.', 0, '2024-01-11 10:19:36', '2024-01-11 10:19:36'),
(148, 58, 3, 'I.7', 'show evidence of professional growth through further and continuing studies.', 0, '2024-01-11 10:19:44', '2024-01-11 10:19:44'),
(149, 58, 3, 'I.8', 'engage in practices which enables the faculty to demonstrate harmonious interpersonal relations with the students, parents, and the community.', 0, '2024-01-11 10:19:50', '2024-01-11 10:19:50'),
(150, 58, 6, 'O.1', 'The corps of faculty manifest a commendable level of professionalism.', 0, '2024-01-11 10:19:57', '2024-01-11 10:19:57'),
(151, 59, 1, 'S.1.', 'The curriculum provides for the development of the following professional competencies:', 0, '2024-01-11 10:34:46', '2024-01-11 10:34:46'),
(152, 59, 1, 'S.2.', 'There is a system of validation of subjects taken from other schools.', 0, '2024-01-11 10:35:14', '2024-01-11 10:35:14'),
(153, 59, 1, 'S.3.', 'The curriculum reflects the local, regional and national development goals as well as the institution’s vision and mission.', 0, '2024-01-11 10:35:20', '2024-01-11 10:35:20'),
(154, 59, 3, 'I.1.', 'The curriculum/program is implemented utilizing and/or even judiciously exceeding CHED requirements and standards as follows:', 0, '2024-01-11 10:35:34', '2024-01-11 10:35:34'),
(155, 59, 3, 'I.2.', 'The subjects are logically sequenced and prerequisite courses are identified.', 0, '2024-01-11 10:36:55', '2024-01-11 10:36:55'),
(156, 59, 3, 'I.3.', 'The curricular content is responsive to the needs of the country and recent developments in the profession.', 0, '2024-01-11 10:37:03', '2024-01-11 10:37:03'),
(157, 59, 3, 'I.4.', 'The curricular content covers the extent of the professional and technical preparation required of its graduates.', 0, '2024-01-11 10:37:13', '2024-01-11 10:37:13'),
(158, 59, 3, 'I.5.', 'The curricular integrates values, reflective of national customs, culture and tradition in case where applicable.', 0, '2024-01-11 10:37:19', '2024-01-11 10:37:19'),
(159, 59, 3, 'I.6.', 'Opportunities for participation in hands-on activities, such as immersion/practical training and field study are maintained in the curriculum.', 0, '2024-01-11 10:37:26', '2024-01-11 10:37:26'),
(160, 59, 3, 'I.7.', 'The following activities are undertaken to ensure quality in the process of curriculum development:', 0, '2024-01-11 10:37:38', '2024-01-11 10:37:38'),
(161, 59, 3, 'I.8.', 'The program of study allows the accommodation of students with special needs and assists them to finish the degree.', 0, '2024-01-11 10:39:07', '2024-01-11 10:39:07'),
(162, 59, 6, 'O.1.', 'The curriculum is responsive and relevant to the demands of the times.', 0, '2024-01-11 10:39:14', '2024-01-11 10:39:14'),
(163, 60, 1, 'S.1.', 'There is an institutional outcomes-based standard format in the preparation of course syllabi.', 0, '2024-01-11 10:39:55', '2024-01-11 10:39:55'),
(164, 60, 1, 'S.2.', 'The syllabus includes a list of suggested readings and references of print and electronic resources within the last ten (10) years', 0, '2024-01-11 10:40:04', '2024-01-11 10:40:04'),
(165, 60, 1, 'S.3.', 'Copies of all course syllabi during the term are at the Dean’s office or in any other appropriate repository.', 0, '2024-01-11 10:40:11', '2024-01-11 10:40:11'),
(166, 60, 1, 'S.4.', 'Copies of all course syllabi in the previous terms are filed for reference purposes.', 0, '2024-01-11 10:40:18', '2024-01-11 10:40:18'),
(167, 60, 1, 'S.5.', 'There is provision for remedial measures to strengthen the basic skills in Mathematics and English, and other “tool” subjects.', 0, '2024-01-11 10:40:26', '2024-01-11 10:40:26'),
(168, 60, 1, 'S.6.', 'There is a mechanism to facilitate the teaching-learning process.', 0, '2024-01-11 10:40:35', '2024-01-11 10:40:35'),
(169, 60, 3, 'I.1.', 'The Dean or official concerned approves the updated syllabus for each subject', 0, '2024-01-11 10:40:44', '2024-01-11 10:40:44'),
(170, 60, 3, 'I.2.', 'The faculty prepares syllabi with comprehensive contents.', 0, '2024-01-11 10:40:53', '2024-01-11 10:40:53'),
(171, 60, 3, 'I.3.', 'The faculty revise and enhances their syllabi preferably every two (2) years and as needed.', 0, '2024-01-11 10:41:01', '2024-01-11 10:41:01'),
(172, 60, 3, 'I.4.', 'The faculty distributes a copy of the syllabus to each student.', 0, '2024-01-11 10:41:08', '2024-01-11 10:41:08'),
(173, 60, 3, 'I.5.', 'Teaching strategies stimulate the development of the students’ higher-order thinking skills (HOTS) such as critical thinking, analytical thinking, creative thinking and problem-solving,', 0, '2024-01-11 10:41:19', '2024-01-11 10:41:19'),
(174, 60, 3, 'I.6.', 'Classroom instruction is enriched through the use of the following strategies:', 0, '2024-01-11 10:41:26', '2024-01-11 10:41:26'),
(175, 60, 3, 'I.7.', 'At least three (3) of the following course requirements are used:', 0, '2024-01-11 10:41:33', '2024-01-11 10:41:33'),
(176, 60, 3, 'I.8.', 'Instruction is enriched through the use of at least ten (10) of the following techniques/strategies:', 0, '2024-01-11 10:44:09', '2024-01-11 10:44:09'),
(177, 60, 3, 'I.9.', 'Instructional strategies provide for student’s individual needs and multiple intelligences.', 0, '2024-01-11 10:47:13', '2024-01-11 10:47:13'),
(178, 60, 3, 'I.10.', 'Instruction is enhanced through the following:', 0, '2024-01-11 10:47:23', '2024-01-11 10:47:23'),
(179, 60, 3, 'I.11.', 'Instructional materials (IMs) are reviewed and recommended by the Instructional Materials Committee (IMC).', 0, '2024-01-11 10:48:27', '2024-01-11 10:48:27'),
(180, 60, 3, 'I.12.', 'Varies multi-sensory materials and computer programs are utilized.', 0, '2024-01-11 10:48:42', '2024-01-11 10:48:42'),
(181, 60, 3, 'I.13.', 'The College/Academic Unit maintains consortia and linkages with other learning institutions for academic exchange of instructional materials.', 0, '2024-01-11 10:48:48', '2024-01-11 10:48:48'),
(182, 60, 3, 'I.14.', 'The faculty are encourages to produce their own instructional materials such as modules, software, visual aids, manuals and textbooks.', 0, '2024-01-11 10:48:57', '2024-01-11 10:48:57'),
(183, 60, 6, 'O.1.', 'Course syllabi are updated and approved by concerned authorities.', 0, '2024-01-11 10:49:06', '2024-01-11 10:49:06'),
(184, 60, 6, 'O.2.', 'Varies teaching strategies are efficiently and effectively used.', 0, '2024-01-11 10:49:11', '2024-01-11 10:49:11'),
(185, 60, 6, 'O.3.', 'Instructional Materials produced by the faculty are copyrighted/patented.', 0, '2024-01-11 10:49:20', '2024-01-11 10:49:20'),
(186, 61, 1, 'S.1.', 'The program of studies has a system of evaluating student performance through a combination of the following:', 0, '2024-01-11 10:52:35', '2024-01-11 10:52:35'),
(187, 61, 1, 'S.2.', 'The summative test have the following descriptions:', 0, '2024-01-11 10:53:22', '2024-01-11 10:53:22'),
(188, 61, 3, 'I.1.', 'Varied evaluation measures are used, such as:', 0, '2024-01-11 10:54:04', '2024-01-11 10:54:04'),
(189, 61, 3, 'I.2.', 'Evaluation tools/ instruments are reviewed and revised periodically.', 0, '2024-01-11 10:55:51', '2024-01-11 10:55:51'),
(190, 61, 3, 'I.3.', 'The faculty are trained how to assess student performance properly.', 0, '2024-01-11 10:55:57', '2024-01-11 10:55:57'),
(191, 61, 3, 'I.4.', 'The College/Academic Unit encourages and supports assessment for multiple intelligences.', 0, '2024-01-11 10:56:07', '2024-01-11 10:56:07'),
(192, 61, 3, 'I.5.', 'Course and test requirements are returned to students after results are checked, recorded, and analyzed.', 0, '2024-01-11 10:56:15', '2024-01-11 10:56:15'),
(193, 61, 3, 'I.6.', 'The system of student evaluation and grading is defined, understood, and disseminated to:', 0, '2024-01-11 10:56:22', '2024-01-11 10:56:22'),
(194, 61, 6, 'O.1.', 'The student’s academic performance is commendable.', 0, '2024-01-11 10:56:56', '2024-01-11 10:56:56'),
(195, 61, 6, 'O.2.', 'Retention rate of students is on the average.', 0, '2024-01-11 10:57:05', '2024-01-11 10:57:05'),
(196, 62, 1, 'S.1.', 'There are policies on management of learning which includes the following:', 0, '2024-01-11 21:11:20', '2024-01-11 21:11:20'),
(197, 62, 3, 'I.1.', 'The policies on management of learning are enforced.', 0, '2024-01-11 21:11:56', '2024-01-11 21:11:56'),
(198, 62, 3, 'I.2.', 'Students activities are well-planned and implemented.', 0, '2024-01-11 21:12:04', '2024-01-11 21:12:04'),
(199, 62, 3, 'I.3.', 'Assignments are designed to reinforce teaching which results in student maximum learning.', 0, '2024-01-11 21:12:16', '2024-01-11 21:12:16'),
(200, 62, 3, 'I.4.', 'In classes using lecture and other similar methods of teaching, the number of students does not exceed 50.', 0, '2024-01-11 21:12:26', '2024-01-11 21:12:26'),
(201, 62, 3, 'I.5.', 'Classroom discipline is maintained in accordance with democratic practices.', 0, '2024-01-11 21:12:47', '2024-01-11 21:12:47'),
(202, 62, 3, 'I.6.', 'The officers and assigned students assist in maintaining cleanliness of classrooms, laboratories, corridors and the school campus.', 0, '2024-01-11 21:12:55', '2024-01-11 21:12:55'),
(203, 62, 3, 'I.7.', 'Independent work and performance are encouraged and monitored in the following activities:', 0, '2024-01-11 21:13:03', '2024-01-11 21:13:03'),
(204, 62, 3, 'I.8.', 'In practicum courses, (field study, OJT, practice teaching, etc;) the number of trainees supervised by each coordinator does not exceed 50.', 0, '2024-01-11 21:13:35', '2024-01-11 21:13:35'),
(205, 62, 6, 'O.1.', 'Learning is efficiently and effectively managed.', 0, '2024-01-11 21:13:43', '2024-01-11 21:13:43'),
(206, 63, 1, 'S.1.', 'There is a policy on graduation requirements.', 0, '2024-01-11 21:13:59', '2024-01-11 21:13:59'),
(207, 63, 3, 'I.1.', 'The students are regularly informed of the academic requirements of their respective courses.', 0, '2024-01-11 21:14:07', '2024-01-11 21:14:07'),
(208, 63, 3, 'I.2.', 'The College/Academic Unit implements the system for student returnees and transferees to meet the residence and other graduation requirements.', 0, '2024-01-11 21:14:17', '2024-01-11 21:14:17'),
(209, 63, 3, 'I.3.', 'Graduating students conduct research and/or undergo practicum/OJT or other activities prescribed in their respective curricula.', 0, '2024-01-11 21:14:29', '2024-01-11 21:14:29'),
(210, 63, 3, 'I.4.', 'The Collage/department of the information Technology assists the graduating students with academic deficiencies, disciplinary cases, and other problems which hinder issuance of clearances.', 0, '2024-01-11 21:14:38', '2024-01-11 21:14:38'),
(211, 63, 3, 'I.5.', 'Clearances form academic and financial accountabilities and responsibilities is required before graduation.', 0, '2024-01-11 21:14:45', '2024-01-11 21:14:45'),
(212, 63, 6, 'O.1.', 'At least 60% of the students enrolled in the program are able to graduate within the regular time frame.', 0, '2024-01-11 21:14:54', '2024-01-11 21:14:54'),
(213, 64, 1, 'S.1.', 'The institution has policies on:', 0, '2024-01-11 21:15:12', '2024-01-11 21:15:12'),
(214, 64, 3, 'I.1.', 'The institution implements rules on the attendance of the faculty in their respective classes and other academic related activities.', 0, '2024-01-11 21:15:41', '2024-01-11 21:15:41'),
(215, 64, 3, 'I.2.', 'Dialogues are regularly conducted by the administration with the:', 0, '2024-01-11 21:15:55', '2024-01-11 21:15:55'),
(216, 64, 3, 'I.3.', 'Quality instruction is assured through the following strategies:', 0, '2024-01-11 21:16:18', '2024-01-11 21:16:18'),
(217, 64, 3, 'I.4.', 'Periodic faculty performance evaluation on teaching and in other functions is conducted by at least three of the following:', 0, '2024-01-11 21:17:39', '2024-01-11 21:17:39'),
(218, 64, 3, 'I.5.', 'The results of the performance evaluation are used to improve the performance/competencies of the faculty.', 0, '2024-01-11 21:19:22', '2024-01-11 21:19:22'),
(219, 64, 3, 'I.6.', 'Students are given recognition for exemplary academic and non-academic performances.', 0, '2024-01-11 21:19:31', '2024-01-11 21:19:31'),
(220, 64, 3, 'I.7.', 'Outstanding achievement of students is recognized and encouraged through:', 0, '2024-01-11 21:19:38', '2024-01-11 21:19:38'),
(221, 64, 3, 'I.8.', 'Indicators on performance of graduates are studied such as:', 0, '2024-01-11 21:20:29', '2024-01-11 21:20:29'),
(222, 64, 6, 'O.1.', 'The faculty students have commendable performance as a result of administrative support.', 0, '2024-01-11 21:21:00', '2024-01-11 21:21:00'),
(223, 64, 6, 'O.2.', 'The graduates of the program are employable.', 0, '2024-01-11 21:21:09', '2024-01-11 21:21:09'),
(227, 93, 1, 'S.1.', 'The institution has a system of determining its Vision and Mission.', 0, '2024-01-18 00:26:58', '2024-01-18 00:26:58'),
(228, 93, 1, 'S.2.', 'The vision clearly reflects what the institution hopes to become in the future.', 0, '2024-01-18 00:26:58', '2024-01-18 00:26:58'),
(229, 93, 1, 'S.3.', 'The Mission clearly reflects the institution’s legal and other statutory mandates.', 0, '2024-01-18 00:26:58', '2024-01-18 00:26:58'),
(230, 93, 1, 'S.4.', 'The Goals of the College/Academic Unit/ are consistent with the Mission of the institution.', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(231, 93, 1, 'S.5.', 'The Objectives of the program have the expected outcomes in terms of competencies (skills and knowledge), values and other attributes of the graduates which include the development of:', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(232, 93, 3, 'I.1.', 'The Institution/College conducts review on the statement of the Vision and Mission as well as its goals and program objectives for the approval of authorities concerned.', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(233, 93, 3, 'I.2.', 'The College/Academic Unit follows a system of formulating its goals and the objectives of the program.', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(234, 93, 3, 'I.3.', 'The College’s/Academic Unit’s faculty, personnel, students and other stakeholders (cooperating agencies, linkages, alumni, industry sector and other concerned groups) participate in the formulation, review and/or revision of the VMGO.', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(235, 93, 6, 'O.1.', 'The VMGO are crafted and duly approved by the BOR/BOT.', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(236, 94, 1, 'S.1.', 'The VMGO are available on bulletin boards, in catalogs/manuals and in other forms of communication media.', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(237, 94, 3, 'I.1.', 'A system of dissemination and acceptability of the VMGO is enforced.', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(238, 94, 3, 'I.2.', 'The administrators/faculty attend in-service seminars and training on awareness and acceptability of the:', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(239, 94, 3, 'I.3.', 'The formulation/review/revision of the VMGO is participated in by the following:', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(240, 94, 3, 'I.4.', 'The faculty and staff perform their jobs/functions in consonance with the VMGO.', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(241, 94, 6, 'O.1.', 'There is full awareness and acceptance of the VMGO by the administrators, faculty, staff, students and other stakeholders', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(242, 94, 6, 'O.2.', 'There is congruency between actual educational practices and activities with the following:', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(243, 94, 6, 'O.3.', 'The goals and objectives are being achieved.', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(244, 95, 7, 'A.1', 'Vision Statement', 0, '2024-01-21 05:02:45', '2024-01-21 05:02:45'),
(245, 95, 7, 'A.2', 'Mission Statement', 0, '2024-01-21 05:03:05', '2024-01-21 05:03:05'),
(246, 95, 7, 'A.3', 'Statement of the Goals of the Academic Unit', 0, '2024-01-21 05:18:33', '2024-01-21 05:18:33'),
(247, 95, 7, 'A.4', 'Statement of the Program Objectives', 0, '2024-01-21 05:18:57', '2024-01-21 05:18:57'),
(248, 95, 7, 'A.5', 'Copy of the Charter of the Institution', 0, '2024-01-21 05:21:50', '2024-01-21 05:21:50'),
(249, 95, 7, 'A.6', 'Minutes of Meetings on the formulation, review and\r\nrevision of the VMGO', 0, '2024-01-21 05:21:56', '2024-01-21 05:21:56'),
(250, 95, 7, 'A.7', 'File Copies of Letters of Invitation to Participants', 0, '2024-01-21 05:22:01', '2024-01-21 05:22:01'),
(251, 95, 7, 'A.8', 'Attendance Record of Stakeholders-Participants', 0, '2024-01-21 05:22:06', '2024-01-21 05:22:06'),
(252, 95, 7, 'A.9', 'Copies of CMOs relevant to VMGO formulation, if\r\nany.', 0, '2024-01-21 05:22:13', '2024-01-21 05:22:13'),
(253, 96, 7, 'B.1', 'Display boards on which the VMGO are posted.', 0, '2024-01-21 05:25:55', '2024-01-21 05:25:55'),
(254, 96, 7, 'B.2', 'Samples of dissemination materials (brochures,\r\nleaflets, flyers, etc.)', 0, '2024-01-21 05:26:08', '2024-01-21 05:26:08'),
(255, 96, 7, 'B.3', 'Evidence/s of awareness and acceptability of the\r\nVMGO', 0, '2024-01-21 05:26:14', '2024-01-21 05:26:14'),
(256, 97, 7, 'C.1', 'Evidences of congruence between educational\r\npractices/activities and the VMGO.', 0, '2024-01-21 05:26:28', '2024-01-21 05:26:28'),
(257, 97, 7, 'C.2', 'Awards/citations received by the program under\r\nsurvey.', 0, '2024-01-21 05:26:32', '2024-01-21 05:26:32'),
(258, 97, 7, 'C.3', 'Data on employability of graduates', 0, '2024-01-21 05:26:37', '2024-01-21 05:26:37'),
(259, 106, 7, 'A.1', 'Copy of the Curriculum (with prerequisite course,\r\nwhere applicable)', 0, '2024-01-21 05:33:06', '2024-01-21 05:33:06'),
(260, 106, 7, 'A.2', 'CHED Policies and Standards, CMOs, where\r\napplicable', 0, '2024-01-21 05:33:13', '2024-01-21 05:33:13'),
(261, 106, 7, 'A.3', 'Copies of MOA or MOU with agencies/institutions\r\nregarding immersion, OJT, RLE. Practice\r\nTeaching and other related activities.', 0, '2024-01-21 05:33:19', '2024-01-21 05:33:19'),
(262, 106, 7, 'A.4', 'Minutes of Academic Council Meetings.', 0, '2024-01-21 05:33:24', '2024-01-21 05:33:24'),
(263, 106, 7, 'A.5', 'Policies on curriculum development/review.', 0, '2024-01-21 05:33:31', '2024-01-21 05:33:31'),
(264, 106, 7, 'A.6', 'Policies on validation of subjects taken by\r\ntransferees, and accommodation of students with\r\nspecial needs', 0, '2024-01-21 05:33:38', '2024-01-21 05:33:38'),
(265, 107, 7, 'B.1', 'Compilation of updated course syllabi in all\r\nsubjects.', 0, '2024-01-21 05:33:48', '2024-01-21 05:33:48'),
(266, 107, 7, 'B.2', 'Evidence/s on remedial programs conducted.', 0, '2024-01-21 05:33:52', '2024-01-21 05:33:52'),
(267, 107, 7, 'B.3', 'List of teaching strategies used in the different\r\nsubject areas.', 0, '2024-01-21 05:34:00', '2024-01-21 05:34:00'),
(268, 107, 7, 'B.4', 'Sample course requirements submitted by\r\nstudents.', 0, '2024-01-21 05:34:06', '2024-01-21 05:34:06'),
(269, 107, 7, 'B.5', 'Record of class observations', 0, '2024-01-21 05:34:11', '2024-01-21 05:34:11'),
(270, 107, 7, 'B.6', 'List of academic linkages or consortia.', 0, '2024-01-21 05:34:18', '2024-01-21 05:34:18'),
(271, 108, 7, 'C.1', 'ample copies of summative examination (midterm and final) with Table of Specifications.', 0, '2024-01-21 05:34:29', '2024-01-21 05:34:29'),
(272, 108, 7, 'C.2', 'Samples of non-traditional assessment tools, e.g.\r\nrubric, portfolio, etc.', 0, '2024-01-21 05:34:34', '2024-01-21 05:34:34'),
(273, 108, 7, 'C.3', 'Samples of assessment tools for individual\r\ndifferences and multiple intelligences.', 0, '2024-01-21 05:34:40', '2024-01-21 05:34:40'),
(274, 108, 7, 'C.4', 'Sample class records.', 0, '2024-01-21 05:34:43', '2024-01-21 05:34:43'),
(275, 108, 7, 'C.5', 'Copy of the grading system, including evidence that\r\nit has been approved.', 0, '2024-01-21 05:34:49', '2024-01-21 05:34:49'),
(276, 108, 7, 'C.6', 'Evidence that course requirements are returned to\r\nstudents after they were evaluated and recorded.', 0, '2024-01-21 05:34:53', '2024-01-21 05:34:53'),
(277, 109, 7, 'D.1', 'Policies on Class attendance and discipline', 0, '2024-01-21 05:35:02', '2024-01-21 05:35:02'),
(278, 109, 7, 'D.2', 'Evidence that independent work/performance is\r\nencouraged and monitored, such as student\r\noutputs.', 0, '2024-01-21 05:35:09', '2024-01-21 05:35:09'),
(279, 110, 7, 'E.1', 'Policies that apply to student returnees,\r\ntransferees and students with academic\r\ndeficiencies including residency', 0, '2024-01-21 05:35:17', '2024-01-21 05:35:17'),
(280, 110, 7, 'E.2', 'Sample copy of a Students’ Clearance before\r\ngraduation.', 0, '2024-01-21 05:35:25', '2024-01-21 05:35:25'),
(281, 110, 7, 'E.3', 'Samples of research conducted by students.', 0, '2024-01-21 05:35:29', '2024-01-21 05:35:29'),
(282, 110, 7, 'E.4', 'Policies on OJT. (Practice Teaching, RLE,\r\nApprenticeship, Practicum, etc. if applicable)', 0, '2024-01-21 05:35:35', '2024-01-21 05:35:35'),
(283, 111, 7, 'F.1', 'Administrative Manual', 0, '2024-01-21 05:35:47', '2024-01-21 05:35:47'),
(284, 111, 7, 'F.2', 'Evidence/s of dialogues conducted among the\r\nadministration, faculty and students.', 0, '2024-01-21 05:35:50', '2024-01-21 05:35:50'),
(285, 111, 7, 'F.3', 'Schedule of regular faculty consultation hours.', 0, '2024-01-21 05:35:54', '2024-01-21 05:35:54'),
(286, 111, 7, 'F.4', 'A system of awards/recognition for graduating\r\nstudents with outstanding achievements.', 0, '2024-01-21 05:36:02', '2024-01-21 05:36:02'),
(287, 111, 7, 'F.5', 'Results of a study on the licensure performance of\r\ngraduates, if applicable.', 0, '2024-01-21 05:36:06', '2024-01-21 05:36:06'),
(288, 111, 7, 'F.6', 'Evidence of administrative support to improve\r\nlicensure performance of graduates, if applicable.', 0, '2024-01-21 05:36:11', '2024-01-21 05:36:11'),
(289, 111, 7, 'F.7', 'Conduct of a tracer study on the employability of\r\ngraduates.', 0, '2024-01-21 05:36:16', '2024-01-21 05:36:16'),
(290, 111, 7, 'F.8', 'Feedback from employers regarding performance\r\nof graduates.', 0, '2024-01-21 05:36:19', '2024-01-21 05:36:19'),
(291, 112, 7, 'A.1', 'A copy of the objectives of the SSP', 0, '2024-01-21 05:38:10', '2024-01-21 05:38:10'),
(292, 112, 7, 'A.2', 'Organizational Chart of the SSP', 0, '2024-01-21 05:38:14', '2024-01-21 05:38:14'),
(293, 112, 7, 'A.3', 'Functional Chart of the SSP.', 0, '2024-01-21 05:38:20', '2024-01-21 05:38:20'),
(294, 112, 7, 'A.4', 'Profile of the SSP Staff.', 0, '2024-01-21 05:38:25', '2024-01-21 05:38:25'),
(295, 112, 7, 'A.5', 'Copy of the SSP Master Plan.', 0, '2024-01-21 05:38:30', '2024-01-21 05:38:30'),
(296, 112, 7, 'A.6', 'Evaluation Program to assess the effectiveness of\r\nthe SSP.', 0, '2024-01-21 05:38:36', '2024-01-21 05:38:36'),
(297, 112, 7, 'A.7', 'nventory of physical facilities, equipment, supplies\r\nand materials for the SSP', 0, '2024-01-21 05:38:41', '2024-01-21 05:38:41'),
(298, 113, 7, 'B.1', 'Bulletin of Information', 0, '2024-01-21 05:39:52', '2024-01-21 05:39:52'),
(299, 113, 7, 'B.2', 'Student Handbook', 0, '2024-01-21 05:39:55', '2024-01-21 05:39:55'),
(300, 113, 7, 'B.3', 'Data on student admission (enrollment trends,\r\ndrop-out rate, transferees, course shifters, etc.)', 0, '2024-01-21 05:39:59', '2024-01-21 05:39:59'),
(301, 114, 7, 'C.1', 'Profile of the Guidance and Counseling Head', 0, '2024-01-21 05:40:07', '2024-01-21 05:40:07'),
(302, 114, 7, 'C.2', 'Updated Student Profiles', 0, '2024-01-21 05:40:13', '2024-01-21 05:40:13'),
(303, 114, 7, 'C.3', 'Policies on the confidentiality of student records.', 0, '2024-01-21 05:40:17', '2024-01-21 05:40:17'),
(304, 114, 7, 'C.4', 'A copy of the Testing Program.', 0, '2024-01-21 05:40:23', '2024-01-21 05:40:23'),
(305, 114, 7, 'C.5', 'List of tests and evaluative tools used in Guidance\r\nand Counseling Services.', 0, '2024-01-21 05:40:27', '2024-01-21 05:40:27'),
(306, 114, 7, 'C.6', 'List of students who availed of the counseling\r\nservice.', 0, '2024-01-21 05:40:32', '2024-01-21 05:40:32'),
(307, 114, 7, 'C.7', 'Sample counselling referral form.', 0, '2024-01-21 05:40:37', '2024-01-21 05:40:37'),
(308, 114, 7, 'C.8', 'List of perspective employers of graduates of a\r\nparticular program.', 0, '2024-01-21 05:40:41', '2024-01-21 05:40:41'),
(309, 114, 7, 'C.9', 'Sample letters of employers inviting graduates of a\r\nparticular program to apply.', 0, '2024-01-21 05:40:46', '2024-01-21 05:40:46'),
(310, 114, 7, 'C.10', 'Alumni Directory and officers of the Alumni\r\nAssociation', 0, '2024-01-21 05:40:50', '2024-01-21 05:40:50'),
(311, 114, 7, 'C.11', 'Linkage/s established with industries and\r\nprospective employers', 0, '2024-01-21 05:40:56', '2024-01-21 05:41:21'),
(312, 114, 7, 'C.12', 'Copy of the instrument to evaluate the guidance\r\nprogram', 0, '2024-01-21 05:41:01', '2024-01-21 05:41:28'),
(313, 115, 7, 'D.1', 'Copies of the Health Services Program', 0, '2024-01-21 05:48:38', '2024-01-21 05:48:38'),
(314, 115, 7, 'D.2', 'Profile of the Medical/Dental Staff', 0, '2024-01-21 05:48:44', '2024-01-21 05:48:44'),
(315, 115, 7, 'D.3', 'Records of students who availed of Medical/Dental\r\nservices.', 0, '2024-01-21 05:48:51', '2024-01-21 05:48:51'),
(316, 115, 7, 'D.4', 'Copy of sanitary permit for canteen operation.', 0, '2024-01-21 05:49:02', '2024-01-21 05:49:02'),
(317, 115, 7, 'D.5', 'Health certificates of the canteen staff and food\r\nhandlers', 0, '2024-01-21 05:49:07', '2024-01-21 05:49:07'),
(318, 115, 7, 'D.6', 'Policies on selection of athletes.', 0, '2024-01-21 05:49:11', '2024-01-21 05:49:11'),
(319, 115, 7, 'D.7', 'Budget allocation for sports development', 0, '2024-01-21 05:49:16', '2024-01-21 05:49:16'),
(320, 115, 7, 'D.8', 'Inventory of facilities, equipment, supplies and\r\nmaterials provided to the Sports Services Unit.', 0, '2024-01-21 05:49:23', '2024-01-21 05:49:23'),
(321, 115, 7, 'D.9', 'Policies governing student publication', 0, '2024-01-21 05:49:32', '2024-01-21 05:49:32'),
(322, 115, 7, 'D.10', 'Composition of the Editorial Board, including\r\nadvisers.', 0, '2024-01-21 05:49:36', '2024-01-21 05:49:36'),
(323, 115, 7, 'D.11', 'Copies of the school paper published.', 0, '2024-01-21 05:49:49', '2024-01-21 05:49:49'),
(324, 115, 7, 'D.12', 'Profile of the school paper’s advisers.', 0, '2024-01-21 05:50:13', '2024-01-21 05:50:13'),
(325, 115, 7, 'D.13', 'Inventory of facilities equipment, supplies and\r\nmaterials for the Student Publication Unit.', 0, '2024-01-21 05:50:31', '2024-01-21 05:50:31'),
(326, 115, 7, 'D.14', 'A copy of the Socio-Cultural Development\r\nProgram', 0, '2024-01-21 05:50:35', '2024-01-21 05:50:35'),
(327, 115, 7, 'D.15', 'Schedule of socio-cultural activities regularly\r\nconducted.', 0, '2024-01-21 05:50:40', '2024-01-21 05:50:40'),
(328, 115, 7, 'D.16', 'Copy of the financial assistance program\r\n(scholarship, grant-in-aid) student loans,\r\nattendance to seminars, etc.)', 0, '2024-01-21 05:50:46', '2024-01-21 05:50:46'),
(329, 115, 7, 'D.17', 'List of incentives and privileges to varsity athletes\r\nand members of cultural groups.', 0, '2024-01-21 05:50:50', '2024-01-21 05:50:50'),
(330, 115, 7, 'D.18', 'Policies on the operation of Student Dormitories.', 0, '2024-01-21 05:50:55', '2024-01-21 05:50:55'),
(331, 115, 7, 'D.19', 'Profile of the Dormitory Head and Staff.', 0, '2024-01-21 05:50:59', '2024-01-21 05:50:59'),
(332, 115, 7, 'D.20', 'Copy of Dormitory rules and regulation.', 0, '2024-01-21 05:51:03', '2024-01-21 05:51:03'),
(333, 115, 7, 'D.21', 'Report on the monitoring and evaluation of\r\nprivate boarding houses', 0, '2024-01-21 05:51:08', '2024-01-21 05:51:08'),
(334, 116, 7, 'E.1', 'Copy of the Institutional Scholarship Program\r\ncontaining:', 0, '2024-01-21 05:51:22', '2024-01-21 05:51:22'),
(336, 116, 7, 'E.2', 'Copy of the orientation program for scholars and\r\ngrantees', 0, '2024-01-21 05:52:45', '2024-01-21 05:52:45'),
(337, 117, 7, 'F.1', 'List of recognized student organizations, including\r\ntheir advisers.', 0, '2024-01-21 05:53:03', '2024-01-21 05:53:03'),
(338, 117, 7, 'F.2', 'Sample Constitution-and-By-Laws of student\r\norganizations.', 0, '2024-01-21 05:53:12', '2024-01-21 05:53:12'),
(339, 117, 7, 'F.3', 'List of co-curricular and extra-curricular activities\r\nincluding relevant information', 0, '2024-01-21 05:53:17', '2024-01-21 05:53:17'),
(340, 117, 7, 'F.4', 'system of incentives, awards/recognition for\r\noutstanding achievement in co-curricular and\r\nextra-curricular activities.', 0, '2024-01-21 05:53:22', '2024-01-21 05:53:22'),
(341, 117, 7, 'F.5', 'Sample Accomplishment Reports of recognized\r\nstudent organizations', 0, '2024-01-21 05:53:27', '2024-01-21 05:53:27'),
(439, 141, 7, 'A.1', 'Vision Statement', 0, '2024-01-21 06:18:24', '2024-01-21 06:18:24'),
(440, 141, 7, 'A.2', 'Mission Statement', 0, '2024-01-21 06:18:24', '2024-01-21 06:18:24'),
(441, 141, 7, 'A.3', 'Statement of the Goals of the Academic Unit', 0, '2024-01-21 06:18:24', '2024-01-21 06:18:24'),
(442, 141, 7, 'A.4', 'Statement of the Program Objectives', 0, '2024-01-21 06:18:24', '2024-01-21 06:18:24'),
(443, 141, 7, 'A.5', 'Copy of the Charter of the Institution', 0, '2024-01-21 06:18:24', '2024-01-21 06:18:24'),
(444, 141, 7, 'A.6', 'Minutes of Meetings on the formulation, review and\r\nrevision of the VMGO', 0, '2024-01-21 06:18:24', '2024-01-21 06:18:24'),
(445, 141, 7, 'A.7', 'File Copies of Letters of Invitation to Participants', 0, '2024-01-21 06:18:24', '2024-01-21 06:18:24'),
(446, 141, 7, 'A.8', 'Attendance Record of Stakeholders-Participants', 0, '2024-01-21 06:18:25', '2024-01-21 06:18:25'),
(447, 141, 7, 'A.9', 'Copies of CMOs relevant to VMGO formulation, if\r\nany.', 0, '2024-01-21 06:18:25', '2024-01-21 06:18:25'),
(448, 142, 7, 'B.1', 'Display boards on which the VMGO are posted.', 0, '2024-01-21 06:18:25', '2024-01-21 06:18:25'),
(449, 142, 7, 'B.2', 'Samples of dissemination materials (brochures,\r\nleaflets, flyers, etc.)', 0, '2024-01-21 06:18:25', '2024-01-21 06:18:25'),
(450, 142, 7, 'B.3', 'Evidence/s of awareness and acceptability of the\r\nVMGO', 0, '2024-01-21 06:18:25', '2024-01-21 06:18:25'),
(451, 143, 7, 'C.1', 'Evidences of congruence between educational\r\npractices/activities and the VMGO.', 0, '2024-01-21 06:18:25', '2024-01-21 06:18:25'),
(452, 143, 7, 'C.2', 'Awards/citations received by the program under\r\nsurvey.', 0, '2024-01-21 06:18:25', '2024-01-21 06:18:25'),
(453, 143, 7, 'C.3', 'Data on employability of graduates', 0, '2024-01-21 06:18:25', '2024-01-21 06:18:25'),
(454, 152, 7, 'A.1', 'Copy of the Curriculum (with prerequisite course,\r\nwhere applicable)', 0, '2024-01-21 06:18:52', '2024-01-21 06:18:52'),
(455, 152, 7, 'A.2', 'CHED Policies and Standards, CMOs, where\r\napplicable', 0, '2024-01-21 06:18:52', '2024-01-21 06:18:52'),
(456, 152, 7, 'A.3', 'Copies of MOA or MOU with agencies/institutions\r\nregarding immersion, OJT, RLE. Practice\r\nTeaching and other related activities.', 0, '2024-01-21 06:18:52', '2024-01-21 06:18:52'),
(457, 152, 7, 'A.4', 'Minutes of Academic Council Meetings.', 0, '2024-01-21 06:18:52', '2024-01-21 06:18:52'),
(458, 152, 7, 'A.5', 'Policies on curriculum development/review.', 0, '2024-01-21 06:18:52', '2024-01-21 06:18:52'),
(459, 152, 7, 'A.6', 'Policies on validation of subjects taken by\r\ntransferees, and accommodation of students with\r\nspecial needs', 0, '2024-01-21 06:18:52', '2024-01-21 06:18:52'),
(460, 153, 7, 'B.1', 'Compilation of updated course syllabi in all\r\nsubjects.', 0, '2024-01-21 06:18:52', '2024-01-21 06:18:52'),
(461, 153, 7, 'B.2', 'Evidence/s on remedial programs conducted.', 0, '2024-01-21 06:18:52', '2024-01-21 06:18:52'),
(462, 153, 7, 'B.3', 'List of teaching strategies used in the different\r\nsubject areas.', 0, '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(463, 153, 7, 'B.4', 'Sample course requirements submitted by\r\nstudents.', 0, '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(464, 153, 7, 'B.5', 'Record of class observations', 0, '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(465, 153, 7, 'B.6', 'List of academic linkages or consortia.', 0, '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(466, 154, 7, 'C.1', 'ample copies of summative examination (midterm and final) with Table of Specifications.', 0, '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(467, 154, 7, 'C.2', 'Samples of non-traditional assessment tools, e.g.\r\nrubric, portfolio, etc.', 0, '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(468, 154, 7, 'C.3', 'Samples of assessment tools for individual\r\ndifferences and multiple intelligences.', 0, '2024-01-21 06:18:53', '2024-01-21 06:18:53');
INSERT INTO `indicators` (`id`, `parameter_id`, `indicator_category_id`, `indicator_name`, `indicator_desc`, `isOptional`, `created_at`, `updated_at`) VALUES
(469, 154, 7, 'C.4', 'Sample class records.', 0, '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(470, 154, 7, 'C.5', 'Copy of the grading system, including evidence that\r\nit has been approved.', 0, '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(471, 154, 7, 'C.6', 'Evidence that course requirements are returned to\r\nstudents after they were evaluated and recorded.', 0, '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(472, 155, 7, 'D.1', 'Policies on Class attendance and discipline', 0, '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(473, 155, 7, 'D.2', 'Evidence that independent work/performance is\r\nencouraged and monitored, such as student\r\noutputs.', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(474, 156, 7, 'E.1', 'Policies that apply to student returnees,\r\ntransferees and students with academic\r\ndeficiencies including residency', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(475, 156, 7, 'E.2', 'Sample copy of a Students’ Clearance before\r\ngraduation.', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(476, 156, 7, 'E.3', 'Samples of research conducted by students.', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(477, 156, 7, 'E.4', 'Policies on OJT. (Practice Teaching, RLE,\r\nApprenticeship, Practicum, etc. if applicable)', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(478, 157, 7, 'F.1', 'Administrative Manual', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(479, 157, 7, 'F.2', 'Evidence/s of dialogues conducted among the\r\nadministration, faculty and students.', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(480, 157, 7, 'F.3', 'Schedule of regular faculty consultation hours.', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(481, 157, 7, 'F.4', 'A system of awards/recognition for graduating\r\nstudents with outstanding achievements.', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(482, 157, 7, 'F.5', 'Results of a study on the licensure performance of\r\ngraduates, if applicable.', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(483, 157, 7, 'F.6', 'Evidence of administrative support to improve\r\nlicensure performance of graduates, if applicable.', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(484, 157, 7, 'F.7', 'Conduct of a tracer study on the employability of\r\ngraduates.', 0, '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(485, 157, 7, 'F.8', 'Feedback from employers regarding performance\r\nof graduates.', 0, '2024-01-21 06:18:55', '2024-01-21 06:18:55'),
(486, 158, 7, 'A.1', 'A copy of the objectives of the SSP', 0, '2024-01-21 06:19:04', '2024-01-21 06:19:04'),
(487, 158, 7, 'A.2', 'Organizational Chart of the SSP', 0, '2024-01-21 06:19:04', '2024-01-21 06:19:04'),
(488, 158, 7, 'A.3', 'Functional Chart of the SSP.', 0, '2024-01-21 06:19:04', '2024-01-21 06:19:04'),
(489, 158, 7, 'A.4', 'Profile of the SSP Staff.', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(490, 158, 7, 'A.5', 'Copy of the SSP Master Plan.', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(491, 158, 7, 'A.6', 'Evaluation Program to assess the effectiveness of\r\nthe SSP.', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(492, 158, 7, 'A.7', 'nventory of physical facilities, equipment, supplies\r\nand materials for the SSP', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(493, 159, 7, 'B.1', 'Bulletin of Information', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(494, 159, 7, 'B.2', 'Student Handbook', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(495, 159, 7, 'B.3', 'Data on student admission (enrollment trends,\r\ndrop-out rate, transferees, course shifters, etc.)', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(496, 160, 7, 'C.1', 'Profile of the Guidance and Counseling Head', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(497, 160, 7, 'C.2', 'Updated Student Profiles', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(498, 160, 7, 'C.3', 'Policies on the confidentiality of student records.', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(499, 160, 7, 'C.4', 'A copy of the Testing Program.', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(500, 160, 7, 'C.5', 'List of tests and evaluative tools used in Guidance\r\nand Counseling Services.', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(501, 160, 7, 'C.6', 'List of students who availed of the counseling\r\nservice.', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(502, 160, 7, 'C.7', 'Sample counselling referral form.', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(503, 160, 7, 'C.8', 'List of perspective employers of graduates of a\r\nparticular program.', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(504, 160, 7, 'C.9', 'Sample letters of employers inviting graduates of a\r\nparticular program to apply.', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(505, 160, 7, 'C.10', 'Alumni Directory and officers of the Alumni\r\nAssociation', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(506, 160, 7, 'C.11', 'Linkage/s established with industries and\r\nprospective employers', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(507, 160, 7, 'C.12', 'Copy of the instrument to evaluate the guidance\r\nprogram', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(508, 161, 7, 'D.1', 'Copies of the Health Services Program', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(509, 161, 7, 'D.2', 'Profile of the Medical/Dental Staff', 0, '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(510, 161, 7, 'D.3', 'Records of students who availed of Medical/Dental\r\nservices.', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(511, 161, 7, 'D.4', 'Copy of sanitary permit for canteen operation.', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(512, 161, 7, 'D.5', 'Health certificates of the canteen staff and food\r\nhandlers', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(513, 161, 7, 'D.6', 'Policies on selection of athletes.', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(514, 161, 7, 'D.7', 'Budget allocation for sports development', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(515, 161, 7, 'D.8', 'Inventory of facilities, equipment, supplies and\r\nmaterials provided to the Sports Services Unit.', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(516, 161, 7, 'D.9', 'Policies governing student publication', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(517, 161, 7, 'D.10', 'Composition of the Editorial Board, including\r\nadvisers.', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(518, 161, 7, 'D.11', 'Copies of the school paper published.', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(519, 161, 7, 'D.12', 'Profile of the school paper’s advisers.', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(520, 161, 7, 'D.13', 'Inventory of facilities equipment, supplies and\r\nmaterials for the Student Publication Unit.', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(521, 161, 7, 'D.14', 'A copy of the Socio-Cultural Development\r\nProgram', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(522, 161, 7, 'D.15', 'Schedule of socio-cultural activities regularly\r\nconducted.', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(523, 161, 7, 'D.16', 'Copy of the financial assistance program\r\n(scholarship, grant-in-aid) student loans,\r\nattendance to seminars, etc.)', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(524, 161, 7, 'D.17', 'List of incentives and privileges to varsity athletes\r\nand members of cultural groups.', 0, '2024-01-21 06:19:06', '2024-01-21 06:19:06'),
(525, 161, 7, 'D.18', 'Policies on the operation of Student Dormitories.', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(526, 161, 7, 'D.19', 'Profile of the Dormitory Head and Staff.', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(527, 161, 7, 'D.20', 'Copy of Dormitory rules and regulation.', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(528, 161, 7, 'D.21', 'Report on the monitoring and evaluation of\r\nprivate boarding houses', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(529, 162, 7, 'E.1', 'Copy of the Institutional Scholarship Program\r\ncontaining:', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(530, 162, 7, 'E.2', 'Copy of the orientation program for scholars and\r\ngrantees', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(531, 163, 7, 'F.1', 'List of recognized student organizations, including\r\ntheir advisers.', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(532, 163, 7, 'F.2', 'Sample Constitution-and-By-Laws of student\r\norganizations.', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(533, 163, 7, 'F.3', 'List of co-curricular and extra-curricular activities\r\nincluding relevant information', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(534, 163, 7, 'F.4', 'system of incentives, awards/recognition for\r\noutstanding achievement in co-curricular and\r\nextra-curricular activities.', 0, '2024-01-21 06:19:08', '2024-01-21 06:19:08'),
(535, 163, 7, 'F.5', 'Sample Accomplishment Reports of recognized\r\nstudent organizations', 0, '2024-01-21 06:19:08', '2024-01-21 06:19:08'),
(536, 164, 7, 'A.1', 'Copy of the Institutional Research Agenda.', 0, '2024-01-21 09:12:58', '2024-01-21 09:12:58'),
(537, 164, 7, 'A.2', 'Structure of the Research and Development Unit,\r\nincluding the profile of the Research Head.', 0, '2024-01-21 09:13:12', '2024-01-21 09:13:12'),
(538, 164, 7, 'A.3', 'A copy of the research program of the program\r\nunder survey.', 0, '2024-01-21 09:13:23', '2024-01-21 09:13:23'),
(539, 164, 7, 'A.4', 'Evidence of participation of different stakeholders.', 0, '2024-01-21 09:13:39', '2024-01-21 09:13:39'),
(540, 164, 7, 'A.5', 'Abstracts of research agenda.', 0, '2024-01-21 09:13:53', '2024-01-21 09:13:53'),
(541, 165, 7, 'B.1', 'Copy of the budget allocation for research.', 0, '2024-01-21 09:14:24', '2024-01-21 09:14:24'),
(542, 165, 7, 'B.2', 'List of linkages/networking with research funding\r\nagencies.', 0, '2024-01-21 09:14:32', '2024-01-21 09:14:32'),
(543, 165, 7, 'B.3', 'Inventory of research facilities, equipment and\r\namenities.', 0, '2024-01-21 09:14:47', '2024-01-21 09:14:47'),
(544, 165, 7, 'B.4', 'Profile of the research personnel/staff.', 0, '2024-01-21 09:14:56', '2024-01-21 09:14:56'),
(545, 165, 7, 'B.5', 'List of patents, licenses, copyrights and other\r\nresearch outputs, including income generated\r\nfrom each of them, if any.', 0, '2024-01-21 09:15:12', '2024-01-21 09:15:12'),
(546, 165, 7, 'B.6', 'Copy of the research staff development program.', 0, '2024-01-21 09:15:27', '2024-01-21 09:15:27'),
(547, 165, 7, 'B.7', 'List of team collaborative researches conducted.', 0, '2024-01-21 09:15:37', '2024-01-21 09:15:37'),
(548, 166, 7, 'C.1', 'Copy of the Research Manual.', 0, '2024-01-21 09:17:19', '2024-01-21 09:17:19'),
(549, 166, 7, 'C.2', 'Summary of faculty researches conducted.', 0, '2024-01-21 09:17:37', '2024-01-21 09:17:37'),
(550, 166, 7, 'C.3', 'List of in-service training conducted to enhance\r\nfaculty research capabilities of faculty.', 0, '2024-01-21 09:18:01', '2024-01-21 09:18:01'),
(551, 166, 7, 'C.4', 'Report on in-house reviews conducted.', 0, '2024-01-21 09:18:11', '2024-01-21 09:18:11'),
(552, 166, 7, 'C.5', 'Evidence/s that research results have been utilized.', 0, '2024-01-21 09:18:20', '2024-01-21 09:18:20'),
(553, 166, 7, 'C.6', 'Policies pertaining to Intellectual Property Rights\r\n(IPR)', 0, '2024-01-21 09:18:29', '2024-01-21 09:18:29'),
(554, 167, 7, 'D.1', 'Evidence of publication and dissemination of\r\nresearch results', 0, '2024-01-21 09:19:10', '2024-01-21 09:19:10'),
(555, 167, 7, 'D.2', 'List of dissemination activities conducted (forum,\r\nconference, seminars, etc.)', 0, '2024-01-21 09:19:26', '2024-01-21 09:19:26'),
(556, 167, 7, 'D.3', 'Copies of published articles', 0, '2024-01-21 09:19:35', '2024-01-21 09:19:35'),
(557, 167, 7, 'D.4', 'Linkage/s established for exchange of research\r\npublications', 0, '2024-01-21 09:19:46', '2024-01-21 09:19:46'),
(558, 167, 7, 'D.5', 'Composition of a Technical Committee to edit\r\nresearch manuscripts and technical reports', 0, '2024-01-21 09:19:55', '2024-01-21 09:19:55'),
(559, 167, 7, 'D.6', 'List of faculty who served as paper presentors,\r\nlecturers, external evaluator, dissertation/thesis\r\nadviser, critic, etc., including relevant information', 0, '2024-01-21 09:20:08', '2024-01-21 09:20:08'),
(560, 168, 7, 'A.1', 'Copy of the benchmark survey instrument', 0, '2024-01-21 09:22:35', '2024-01-21 09:22:35'),
(561, 168, 7, 'A.2', 'Evidence of the complementation between the\r\ncurriculum of the program under survey and its\r\nextension program', 0, '2024-01-21 09:23:24', '2024-01-21 09:23:24'),
(563, 168, 7, 'A.3', 'List of linkages established with extension-oriented\r\nagencies.', 0, '2024-01-21 09:25:01', '2024-01-21 09:25:01'),
(564, 168, 7, 'A.4', 'Copies of MOA or MOU with partner or\r\ncollaborating GA’s, NGO’s and institutions', 0, '2024-01-21 09:25:12', '2024-01-21 09:25:12'),
(565, 169, 7, 'B.1', 'Evidence of extension planning session', 0, '2024-01-21 09:25:33', '2024-01-21 09:25:33'),
(566, 169, 7, 'B.2', 'Copy of the extension program, including relevant\r\ninformation', 0, '2024-01-21 09:26:13', '2024-01-21 09:26:13'),
(567, 169, 7, 'B.3', 'Organizational Structure of the Extension Unit.', 0, '2024-01-21 09:31:33', '2024-01-21 09:31:33'),
(568, 169, 7, 'B.4', 'Profile of the Unit Head and his/her Staff', 0, '2024-01-21 09:31:45', '2024-01-21 09:31:45'),
(569, 169, 7, 'B.5', 'Operational Plan of the Extension Program, with\r\nfocus on implementation strategies', 0, '2024-01-21 09:31:55', '2024-01-21 09:31:55'),
(570, 169, 7, 'B.6', 'Roster/Experts for extension projects, if\r\nnecessary.', 0, '2024-01-21 09:32:06', '2024-01-21 09:32:06'),
(571, 169, 7, 'B.7', 'Evidence of transfer of appropriate technology to\r\nthe target clientele', 0, '2024-01-21 09:32:16', '2024-01-21 09:32:16'),
(572, 169, 7, 'B.8', 'Samples of packaged\r\ntechnologies/news/information disseminated to\r\nthe clientele.', 0, '2024-01-21 09:32:26', '2024-01-21 09:32:26'),
(573, 169, 7, 'B.9', 'Copy of the Extension Manual.', 0, '2024-01-21 09:32:39', '2024-01-21 09:32:39'),
(574, 169, 7, 'B.10', 'Copy of the monitoring and evaluation\r\ninstrument/s.', 0, '2024-01-21 09:32:49', '2024-01-21 09:32:49'),
(575, 169, 7, 'B.11', 'Sample of accomplishment and terminal reports.', 0, '2024-01-21 09:32:59', '2024-01-21 09:32:59'),
(576, 169, 7, 'B.12', 'Copy of the budgetary allocation for the\r\nextension program.', 0, '2024-01-21 09:33:07', '2024-01-21 09:33:07'),
(577, 169, 7, 'B.13', 'Evidences of outsourcing for fund augmentation.', 0, '2024-01-21 09:33:20', '2024-01-21 09:33:20'),
(578, 169, 7, 'B.14', 'Evidences of outsourcing for technical\r\nassistance and service inputs from other\r\nagencies.', 0, '2024-01-21 09:33:36', '2024-01-21 09:33:36'),
(579, 170, 7, 'C.1', 'Evidence of community participation in the\r\nplanning and implementation of extension\r\nprojects/activities.', 0, '2024-01-21 09:33:53', '2024-01-21 09:33:53'),
(580, 170, 7, 'C.2', 'Evidence of technology adoption utilization and\r\ncommercialization.', 0, '2024-01-21 09:34:02', '2024-01-21 09:34:02'),
(581, 170, 7, 'C.3', 'Copy of a long-term sustainable extension\r\nprogram, e.g. community development projects,\r\netc.', 0, '2024-01-21 09:34:10', '2024-01-21 09:34:10'),
(582, 170, 7, 'C.4', 'List of collaborating agencies, including the nature\r\nof collaboration', 0, '2024-01-21 09:34:20', '2024-01-21 09:34:20'),
(583, 177, 7, 'G.1', 'List of linkages established for exchange for\r\nexchange of materials, funding and technical\r\nassistance', 0, '2024-01-21 09:36:40', '2024-01-21 09:36:40'),
(584, 176, 7, 'F.1', 'Copy of the general budgetary allocation for the\r\nlibrary', 0, '2024-01-21 09:37:10', '2024-01-21 09:37:10'),
(585, 176, 7, 'F.2', 'Evidence of the Head Librarian’s participation in\r\nbudget preparation.', 0, '2024-01-21 09:37:26', '2024-01-21 09:37:26'),
(586, 176, 7, 'F.3', 'Evidence that library fees are utilized for library\r\npurposes', 0, '2024-01-21 09:37:34', '2024-01-21 09:37:34'),
(587, 175, 7, 'E.1', 'Library floor plan showing the location of the\r\ndifferent offices.', 0, '2024-01-21 09:38:13', '2024-01-21 09:38:13'),
(590, 175, 7, 'E.2', 'Description of lighting, ventilation, safety and\r\nsecurity conditions', 0, '2024-01-21 09:39:09', '2024-01-21 09:39:09'),
(591, 175, 7, 'E.3', 'Inventory of library, furniture, and other physical\r\namenities', 0, '2024-01-21 09:39:20', '2024-01-21 09:39:20'),
(592, 174, 7, 'D.1', 'Schedule of library hours posted conspicuously.', 0, '2024-01-21 09:39:43', '2024-01-21 09:39:43'),
(593, 174, 7, 'D.2', 'Copy of library riles and regulations posted\r\nconspicuously.', 0, '2024-01-21 09:39:56', '2024-01-21 09:39:56'),
(594, 174, 7, 'D.3', 'Display board where list of new book arrivals and\r\nother relevant information are posted.', 0, '2024-01-21 09:40:06', '2024-01-21 09:40:06'),
(595, 174, 7, 'D.4', 'Evidence on the existence of an integrated library\r\nsystem (OPAC, Internet, CD Rom, Database, elibrary,\r\netc.)', 0, '2024-01-21 09:40:17', '2024-01-21 09:40:17'),
(596, 174, 7, 'D.5', 'Summarized statistical data on library resources\r\nutilization', 0, '2024-01-21 09:40:54', '2024-01-21 09:40:54'),
(597, 173, 7, 'C.1', 'Policies on Collection Development', 0, '2024-01-21 09:41:08', '2024-01-21 09:41:08'),
(598, 173, 7, 'C.2', 'Inventory of core collections', 0, '2024-01-21 09:41:45', '2024-01-21 09:41:45'),
(599, 173, 7, 'C.3', 'Evidence on the provision for non-print digital and\r\nelectronic resources', 0, '2024-01-21 09:41:53', '2024-01-21 09:41:53'),
(600, 173, 7, 'C.4', 'List of research books and materials', 0, '2024-01-21 09:42:03', '2024-01-21 09:42:03'),
(601, 173, 7, 'C.5', 'Inventory of Filipiniana collections', 0, '2024-01-21 09:42:12', '2024-01-21 09:42:12'),
(602, 173, 7, 'C.6', 'Evidence of an accepted and standard\r\nclassification system', 0, '2024-01-21 09:42:23', '2024-01-21 09:42:23'),
(603, 173, 7, 'C.7', 'Policies on preservation, care and upkeep of\r\nlibrary resources', 0, '2024-01-21 09:42:36', '2024-01-21 09:42:36'),
(604, 173, 7, 'C.8', 'Evidence that library resources are provided.', 0, '2024-01-21 09:42:46', '2024-01-21 09:42:46'),
(605, 173, 7, 'C.9', 'List of classified library holdings discarded or\r\nweeded-out books, serials, professional books\r\nand electronic resources.', 0, '2024-01-21 09:42:58', '2024-01-21 09:42:58'),
(606, 173, 7, 'C.9', 'List of classified library holdings discarded or\r\nweeded-out books, serials, professional books\r\nand electronic resources.', 0, '2024-01-21 09:42:59', '2024-01-21 09:42:59'),
(607, 172, 7, 'B.1', 'Profile of the Library staff/personnel', 0, '2024-01-21 09:45:37', '2024-01-21 09:45:37'),
(608, 172, 7, 'B.2', 'Evidence of compliance on adequacy of library\r\npersonnel', 0, '2024-01-21 09:45:45', '2024-01-21 09:45:45'),
(609, 172, 7, 'B.3', 'Copy of the Library Staff Development Plan', 0, '2024-01-21 09:45:54', '2024-01-21 09:45:54'),
(610, 172, 7, 'B.4', 'Policies on the library personnel compensation,\r\nprivileges and fringe benefits', 0, '2024-01-21 09:46:03', '2024-01-21 09:46:03'),
(611, 171, 7, 'A.1', 'Organizational Structure of the Library', 0, '2024-01-21 09:46:21', '2024-01-21 09:46:21'),
(612, 171, 7, 'A.2', 'Profile and Functions of the Head Librarian', 0, '2024-01-21 09:46:30', '2024-01-21 09:46:30'),
(613, 171, 7, 'A.3', 'Composition of the Library Advisory Committee\r\nincluding their functions.', 0, '2024-01-21 09:46:40', '2024-01-21 09:46:40'),
(614, 187, 7, 'K.1', 'Floor plan of Dormitories, showing entrance and\r\nexit points, conference hall, mess hall, Dorm\r\nHead’s office, etc.', 0, '2024-01-21 09:51:16', '2024-01-21 09:51:16'),
(615, 187, 7, 'K.2', 'Certificate of Occupancy', 0, '2024-01-21 09:51:31', '2024-01-21 09:51:31'),
(616, 187, 7, 'K.3', 'Evidence that a maintenance system exists.', 0, '2024-01-21 09:51:41', '2024-01-21 09:51:41'),
(617, 187, 7, 'K.4', 'Requirement on admission of student, faculty and\r\nstaff boarders.', 0, '2024-01-21 09:51:49', '2024-01-21 09:51:49'),
(618, 187, 7, 'K.5', 'Copy of house rules and regulations including\r\nstrategies for dissemination.', 0, '2024-01-21 09:51:58', '2024-01-21 09:51:58'),
(619, 187, 7, 'K.6', 'List of dormitory staff and their PDF', 0, '2024-01-21 09:52:11', '2024-01-21 09:52:11'),
(620, 187, 7, 'K.7', 'List of occupants including vital information about\r\nthem.', 0, '2024-01-21 09:52:23', '2024-01-21 09:52:23'),
(621, 189, 7, 'J.1', 'Inventory of equipment, furniture and amenities.', 0, '2024-01-21 09:54:28', '2024-01-21 09:54:28'),
(622, 186, 7, 'I.1', 'Copy of the Permit to Operate conspicuously\r\ndisplayed.', 0, '2024-01-21 09:54:53', '2024-01-21 09:54:53'),
(623, 186, 7, 'I.2', 'Display board where food/menu for the day,\r\nincluding prices ae posted.', 0, '2024-01-21 09:55:12', '2024-01-21 09:55:12'),
(624, 186, 7, 'I.3', 'Health Certificates of Canteen Staff and food\r\nhandlers.', 0, '2024-01-21 09:55:24', '2024-01-21 09:55:24'),
(625, 186, 7, 'I.4', 'Inventory of equipment and furniture.', 0, '2024-01-21 09:55:35', '2024-01-21 09:55:35'),
(626, 185, 7, 'H.1', 'Floor Plan of the Student Center showing the\r\nlocation of different offices.', 0, '2024-01-21 09:55:59', '2024-01-21 09:55:59'),
(627, 185, 7, 'H.2', 'Inventory of equipment, furniture and amenities at\r\nthe SC', 0, '2024-01-21 09:56:11', '2024-01-21 09:56:11'),
(628, 184, 7, 'G.1', 'Floor plan of the Medical and Dental Clinic', 0, '2024-01-21 09:56:26', '2024-01-21 09:56:26'),
(629, 184, 7, 'G.2', 'Qualification of the medical and dental staff', 0, '2024-01-21 09:56:38', '2024-01-21 09:56:38'),
(630, 184, 7, 'G.3', 'Inventory of equipment, supplies and other material\r\nresources.', 0, '2024-01-21 09:56:50', '2024-01-21 09:56:50'),
(631, 183, 7, 'F.1', 'Lay-out of the Sports Center', 0, '2024-01-21 09:57:12', '2024-01-21 09:57:12'),
(632, 183, 7, 'F.2', 'Inventory of sports facilities', 0, '2024-01-21 09:57:20', '2024-01-21 09:57:20'),
(633, 183, 7, 'F.3', 'List of Assembly Halls', 0, '2024-01-21 09:57:28', '2024-01-21 09:57:28'),
(634, 183, 7, 'F.4', 'Copy of rules and regulations in the use of\r\nassembly halls and sports/athletic facilities.', 0, '2024-01-21 09:57:39', '2024-01-21 09:57:39'),
(635, 182, 7, 'E.1', 'Photographs of offices and function rooms.', 0, '2024-01-21 09:57:55', '2024-01-21 09:57:55'),
(636, 182, 7, 'E.2', 'Inventory of equipment, amenities and supplies in\r\nfunction rooms and offices.', 0, '2024-01-21 09:58:10', '2024-01-21 09:58:10'),
(637, 182, 7, 'E.3', 'Availability of toilets and storeroom, where\r\nneeded.', 0, '2024-01-21 09:58:21', '2024-01-21 09:58:21'),
(638, 182, 7, 'E.4', 'List and description of function rooms\r\n(administrative office, faculty room, faculty lounge,\r\nmusic room, conference hall, multimedia room,\r\netc.)', 0, '2024-01-21 09:58:33', '2024-01-21 09:58:33'),
(639, 182, 7, 'E.5', 'File copies of approved requests for the use of the\r\nfunction rooms.', 0, '2024-01-21 09:58:45', '2024-01-21 09:58:45'),
(640, 181, 7, 'D.1', 'Number of classrooms utilized by the program\r\nunder survey.', 0, '2024-01-21 09:59:20', '2024-01-21 09:59:20'),
(641, 181, 7, 'D.2', 'Sample of Photographs of material resources\r\ninside the classrooms.', 0, '2024-01-21 09:59:31', '2024-01-21 09:59:31'),
(642, 180, 7, 'C.1', 'Approved building plan, showing the location of\r\nthe different buildings in the campus.', 0, '2024-01-21 09:59:49', '2024-01-21 09:59:49'),
(643, 180, 7, 'C.2', 'Evidence that electrical lines are safely installed\r\nand periodically checked.', 0, '2024-01-21 09:59:59', '2024-01-21 09:59:59'),
(644, 180, 7, 'C.3', 'Schedule of water potability testing and pest\r\ncontrol inspection.', 0, '2024-01-21 10:00:17', '2024-01-21 10:00:17'),
(646, 180, 7, 'C.4', 'PDF of the janitorial staff, including work schedule', 0, '2024-01-21 10:00:47', '2024-01-21 10:00:47'),
(647, 179, 7, 'B.1', 'A copy of the Campus Development Plan', 0, '2024-01-21 10:01:23', '2024-01-21 10:01:23'),
(648, 179, 7, 'B.2', 'Description of a mechanism to ensure the\r\nfollowing:', 0, '2024-01-21 10:01:33', '2024-01-21 10:01:33'),
(649, 178, 7, 'A.1', 'Site Development, Plant/Physical Plant Map\r\ndisplayed prominently in the campus.', 0, '2024-01-21 10:03:37', '2024-01-21 10:03:37'),
(650, 178, 7, 'A.2', 'Evidence of land ownership.', 0, '2024-01-21 10:03:56', '2024-01-21 10:03:56'),
(651, 178, 7, 'A.3', 'Vicinity map', 0, '2024-01-21 10:04:13', '2024-01-21 10:04:13'),
(652, 193, 7, 'D.1', 'Evidence of compliance on the requirements and\r\noperation of laboratories, if applicable.', 0, '2024-01-21 10:11:43', '2024-01-21 10:11:43'),
(653, 192, 7, 'C.1', 'Description of a system on:', 0, '2024-01-21 10:12:17', '2024-01-21 10:12:17'),
(654, 192, 7, 'C.2', 'Composition of the Maintenance and Repair Unit', 0, '2024-01-21 10:13:02', '2024-01-21 10:13:02'),
(655, 192, 7, 'C.3', 'PDF of the maintenance personnel.', 0, '2024-01-21 10:13:18', '2024-01-21 10:13:18'),
(656, 191, 7, 'B.1', 'Inventory of available equipment, apparatuses,\r\nsupplies and materials.', 0, '2024-01-21 10:13:41', '2024-01-21 10:13:41'),
(657, 191, 7, 'B.2', 'List of fabricated tools and apparatuses, including\r\nrelevant information', 0, '2024-01-21 10:13:54', '2024-01-21 10:13:54'),
(658, 191, 7, 'B.3', 'List of fabricated equipment with patent (state\r\npatent number (if any).', 0, '2024-01-21 10:14:05', '2024-01-21 10:14:05'),
(659, 190, 7, 'A.1', 'Building plan showing the location of laboratory\r\nrooms/shops used by the program under survey.', 0, '2024-01-21 10:14:24', '2024-01-21 10:14:24'),
(660, 190, 7, 'A.2', 'Copy of the laboratory lay-out.', 0, '2024-01-21 10:14:36', '2024-01-21 10:14:36'),
(661, 190, 7, 'A.3', 'Inventory of available equipment, gadgets, fixtures\r\nin every laboratory', 0, '2024-01-21 10:14:43', '2024-01-21 10:14:43'),
(662, 190, 7, 'A.4', 'Laboratory Manuals', 0, '2024-01-21 10:14:53', '2024-01-21 10:14:53'),
(663, 190, 7, 'A.5', 'First-aid Kit and Antidote Charts displayed\r\nconspicuously.', 0, '2024-01-21 10:15:08', '2024-01-21 10:15:08'),
(664, 190, 7, 'A.6', 'List of safety and precautionary measures being\r\nimplemented.', 0, '2024-01-21 10:15:18', '2024-01-21 10:15:18'),
(665, 190, 7, 'A.7', 'Evidence of training conducted on the proper use of\r\nlaboratories', 0, '2024-01-21 10:15:25', '2024-01-21 10:15:25'),
(666, 190, 7, 'A.8', 'Inventory of usable computer units and other\r\nequipment.', 0, '2024-01-21 10:15:35', '2024-01-21 10:15:35'),
(667, 190, 7, 'A.9', 'Guidelines in the use of computer laboratories.', 0, '2024-01-21 10:15:44', '2024-01-21 10:15:44'),
(668, 190, 7, 'A.10', 'PDF of the designated computer technician/s.', 0, '2024-01-21 10:15:54', '2024-01-21 10:15:54'),
(669, 190, 7, 'A.11', 'Inventory of equipment, fixtures, apparatuses,\r\nsupplies and materials.', 0, '2024-01-21 10:16:03', '2024-01-21 10:16:03'),
(670, 190, 7, 'A.12', 'Availability of a stockroom.', 0, '2024-01-21 10:16:19', '2024-01-21 10:16:19'),
(671, 190, 7, 'A.13', 'Evidence on the availability of gas, water, and\r\nelectricity for practicum purposes.', 0, '2024-01-21 10:16:35', '2024-01-21 10:16:35'),
(672, 190, 7, 'A.13', 'Evidence on the availability of gas, water, and\r\nelectricity for practicum purposes.', 0, '2024-01-21 10:16:36', '2024-01-21 10:16:36'),
(673, 190, 7, 'A.14', 'Guidelines in the use of equipment and\r\napparatuses.', 0, '2024-01-21 10:16:46', '2024-01-21 10:16:46'),
(674, 200, 7, 'G.1', 'Composition of the Planning Unit including their\r\nfunctions.', 0, '2024-01-21 10:19:02', '2024-01-21 10:19:02'),
(675, 200, 7, 'G.2', 'Copy of the Development Plan, long term and short\r\nterm.', 0, '2024-01-21 10:19:10', '2024-01-21 10:19:10'),
(676, 200, 7, 'G.3', 'Evidence of participatory financial management.', 0, '2024-01-21 10:19:21', '2024-01-21 10:19:21'),
(677, 200, 7, 'G.4', 'Description of inter-office sharing of resources\r\n(facilities and equipment).', 0, '2024-01-21 10:19:34', '2024-01-21 10:19:48'),
(678, 200, 7, 'G.5', 'Copy of the Personnel Performance Evaluation.', 0, '2024-01-21 10:20:06', '2024-01-21 10:20:06'),
(679, 200, 7, 'G.6', 'Evidence on the use of the Personnel Evaluation\r\nresults to improve performance and delivery of\r\nservices.', 0, '2024-01-21 10:20:16', '2024-01-21 10:20:16'),
(680, 200, 7, 'G.7', 'Annual Reports', 0, '2024-01-21 10:20:24', '2024-01-21 10:20:24'),
(681, 199, 7, 'F.1', 'Composition of the Records Management Office,\r\ntheir qualifications and functions.', 0, '2024-01-21 10:20:43', '2024-01-21 10:20:43'),
(682, 199, 7, 'F.2', 'Description of the records management in the\r\ninstitution.', 0, '2024-01-21 10:20:53', '2024-01-21 10:20:53'),
(683, 199, 7, 'F.3', 'Description of the system pf maintaining the\r\nconfidentiality and security of official records.', 0, '2024-01-21 10:21:03', '2024-01-21 10:21:03'),
(684, 199, 7, 'F.4', 'Updated records/files identified under Administration.', 0, '2024-01-21 10:21:13', '2024-01-21 10:21:13'),
(685, 198, 7, 'E.1', 'Composition of the Supply Management Office,\r\nincluding their qualifications, functions and\r\nresponsibilities.', 0, '2024-01-21 10:21:41', '2024-01-21 10:21:41'),
(686, 198, 7, 'E.2', 'Description of the system of supply management.', 0, '2024-01-21 10:21:48', '2024-01-21 10:21:48'),
(687, 198, 7, 'E.3', 'Composition and functions of the Bids and Awards\r\nCommittee.', 0, '2024-01-21 10:22:00', '2024-01-21 10:22:00'),
(688, 198, 7, 'E.4', 'Evidence of compliance to RA 9184 (Procurement of\r\nequipment, supplies and materials)', 0, '2024-01-21 10:22:10', '2024-01-21 10:22:10'),
(689, 198, 7, 'E.5', 'File copies of annual inventories of serviceable and\r\nnon-serviceable equipment.', 0, '2024-01-21 10:22:26', '2024-01-21 10:22:26'),
(690, 197, 7, 'D.1', 'Qualification of the Head of the FMO, including\r\nhis/her functions.', 0, '2024-01-21 10:22:55', '2024-01-21 10:22:55'),
(691, 197, 7, 'D.2', 'Guidelines in budget preparation', 0, '2024-01-21 10:23:04', '2024-01-21 10:23:04'),
(692, 197, 7, 'D.3', 'Evidence of participation of the academic nit in\r\nbudget allocation.', 0, '2024-01-21 10:23:15', '2024-01-21 10:23:15'),
(693, 197, 7, 'D.4', 'Statement of budget priorities', 0, '2024-01-21 10:23:23', '2024-01-21 10:23:23'),
(694, 197, 7, 'D.5', 'Plantilla of Administrative Personnel', 0, '2024-01-21 10:23:31', '2024-01-21 10:23:31'),
(695, 196, 7, 'C.1', 'Policies and guidelines on different aspects of\r\nstudent life', 0, '2024-01-21 10:24:03', '2024-01-21 10:24:03'),
(696, 196, 7, 'C.2', 'Evidence of students’ participation in planning and\r\nimplementation of student activities.', 0, '2024-01-21 10:24:19', '2024-01-21 10:24:19'),
(697, 196, 7, 'C.3', 'Evidence of good working relationship among the\r\nadministration, faculty, staff and students.', 0, '2024-01-21 10:24:29', '2024-01-21 10:24:29'),
(698, 195, 7, 'B.1', 'Educational profile and functions of the academic\r\nadministrators:', 0, '2024-01-21 10:24:52', '2024-01-21 10:24:52'),
(699, 195, 7, 'B.2', 'Evidence of participatory administration in the\r\nCollege/ Institute', 0, '2024-01-21 10:25:31', '2024-01-21 10:25:31'),
(700, 195, 7, 'B.3', 'Dean’s Supervisory Program', 0, '2024-01-21 10:25:44', '2024-01-21 10:25:44'),
(701, 194, 7, 'A.1', 'Organizational Chart of the Institution displayed at\r\nthe Administration Office.', 0, '2024-01-21 10:26:00', '2024-01-21 10:26:00'),
(703, 194, 7, 'A.2', 'Copy of Board Resolution approving the\r\norganizational structure and other relevant\r\nresolutions.', 0, '2024-01-21 10:26:16', '2024-01-21 10:26:16'),
(704, 194, 7, 'A.3', 'Functional Chart', 0, '2024-01-21 10:26:23', '2024-01-21 10:26:23'),
(705, 194, 7, 'A.4', 'Composition of the Administrative Council including\r\nits powers and functions.', 0, '2024-01-21 10:26:49', '2024-01-21 10:26:49'),
(706, 194, 7, 'A.5', 'College or University Code', 0, '2024-01-21 10:27:03', '2024-01-21 10:27:03'),
(707, 194, 7, 'A.6', 'System of communication flow', 0, '2024-01-21 10:27:22', '2024-01-21 10:27:22'),
(708, 194, 7, 'A.7', 'Administrative/ Operations Manual', 0, '2024-01-21 10:27:31', '2024-01-21 10:27:31'),
(709, 194, 7, 'A.8', 'Qualification Standards for Administrative Personnel', 0, '2024-01-21 10:27:47', '2024-01-21 10:27:47'),
(710, 65, 1, 'S.1.', 'The institution has Student Services Program (SSP).', 0, '2024-01-21 18:02:55', '2024-01-21 18:02:55'),
(711, 65, 1, 'S.2.', 'The Students Affairs Services (SAS) program is consistent with the vision and mission of the Institution, goals of the College/Academic Unit and objectives of the Program.', 0, '2024-01-21 18:03:09', '2024-01-21 18:03:09'),
(712, 65, 1, 'S.3.', 'The objectives of the SAS are clearly defined.', 0, '2024-01-21 18:03:24', '2024-01-21 18:03:24'),
(713, 65, 1, 'S.4.', 'The objectives of the SAS are in accordance with CMO No. 9 series of 2013.', 0, '2024-01-21 18:03:43', '2024-01-21 18:03:43'),
(714, 65, 1, 'S.5.', 'The SAS is composed of:', 0, '2024-01-21 18:03:59', '2024-01-21 18:03:59'),
(715, 65, 1, 'S.6', 'The following basic services are available:', 0, '2024-01-21 18:04:43', '2024-01-21 18:04:43'),
(716, 65, 1, 'S.7.', 'There is a SAS Unit that manages student affairs development and welfare programs.', 0, '2024-01-21 18:20:25', '2024-01-21 18:20:25'),
(717, 65, 1, 'S.8', 'The SAS Unit an organizational structure indicating its relationship with other Units.', 0, '2024-01-21 18:20:38', '2024-01-21 18:20:38'),
(718, 65, 1, 'S.9', 'The SAS Unit is headed by a qualified official.', 0, '2024-01-21 18:20:50', '2024-01-21 18:20:50'),
(719, 65, 1, 'S.10', 'The SAS Unit is staffed with qualified personnel.', 0, '2024-01-21 18:21:03', '2024-01-21 18:21:03'),
(720, 65, 1, 'S.11', 'The various services are provided with adequate staff, physical facilities, equipment and materials (e.g. one (1) guidance counselor for every 1,000 students, etc.)', 0, '2024-01-21 18:21:19', '2024-01-21 18:21:19'),
(721, 65, 1, 'S.12', 'There is sufficient budget allocation for the Student Affairs and Services of the institution.', 0, '2024-01-21 18:21:35', '2024-01-21 18:21:35'),
(722, 65, 3, 'I.1', 'The objectives of the SAS are disseminated to and understood by the student, faculty, staff and administrators.', 0, '2024-01-21 18:21:47', '2024-01-21 18:21:47'),
(723, 65, 3, 'I.2', 'The SAS plans, implements, monitors and coordinates programs and services for student welfare and development.', 0, '2024-01-21 18:21:59', '2024-01-21 18:21:59'),
(724, 65, 3, 'I.3', 'Prompt, courteous and efficient services in the handling of business transactions with students are evident.', 0, '2024-01-21 18:22:10', '2024-01-21 18:22:10'),
(725, 65, 3, 'I.4', 'The SAS staff receive salaries on time.', 0, '2024-01-21 18:22:19', '2024-01-21 18:22:19'),
(726, 65, 3, 'I.5', 'The SAS represented in the policy and decision-making body of the Institution.', 0, '2024-01-21 18:22:31', '2024-01-21 18:22:31'),
(727, 65, 3, 'I.6', 'The projects and activities of the SAS Unit are recognized and implemented.', 1, '2024-01-21 18:22:51', '2024-01-21 18:22:51'),
(728, 65, 3, 'I.7', 'There is a continuous and systematic evaluation of the effectiveness of the programs and services for student welfare and development.', 0, '2024-01-21 18:23:05', '2024-01-21 18:23:05'),
(729, 65, 6, 'O.1', 'The students are satisfied with the Student Services Program.', 0, '2024-01-21 18:23:19', '2024-01-21 18:23:19'),
(730, 66, 1, 'S.1', 'The institution has a Student Handbook containing comprehensive information on programs and services for student welfare and development.', 0, '2024-01-21 18:23:43', '2024-01-21 18:23:43'),
(731, 66, 1, 'S.2', 'A regular and comprehensive Orientation Program is held for new, returning and continuing students.', 0, '2024-01-21 18:23:58', '2024-01-21 18:23:58'),
(732, 66, 1, 'S.3', 'The information materials on educational, career, personal and social concerns are readily available, such as:', 0, '2024-01-21 18:24:07', '2024-01-21 18:24:07'),
(733, 66, 1, 'S.4', 'The Guidance and Counseling Program provides the following services:', 0, '2024-01-21 18:25:30', '2024-01-21 18:25:30'),
(734, 66, 1, 'S.5', 'Gender-sensitive individual and group counseling is provided.', 0, '2024-01-21 18:26:23', '2024-01-21 18:26:23'),
(735, 66, 1, 'S.6', 'Counseling Services consider cultural differences.', 0, '2024-01-21 18:26:33', '2024-01-21 18:26:33'),
(736, 66, 1, 'S.7', 'The Guidance Program is headed by a licensed Guidance Counselor with at least a master’s degree in Guidance and Counseling.', 0, '2024-01-21 18:26:43', '2024-01-21 18:26:43'),
(737, 66, 1, 'S.8', 'All the Guidance Counselors are licensed.', 0, '2024-01-21 18:26:54', '2024-01-21 18:26:54'),
(738, 66, 1, 'S.9', 'The Guidance Program is supported by qualified staff.', 0, '2024-01-21 18:27:05', '2024-01-21 18:27:05'),
(739, 66, 1, 'S.10', 'The Guidance Program is supported by qualified staff.', 0, '2024-01-21 18:27:15', '2024-01-21 18:27:15'),
(740, 66, 1, 'S.11', 'A counseling room is provided for student including those with special needs.', 0, '2024-01-21 18:27:27', '2024-01-21 18:27:27'),
(741, 66, 1, 'S.12', 'There is a well-planned assessment program for students with appropriate standardized psychological test.', 0, '2024-01-21 18:27:39', '2024-01-21 18:27:39'),
(742, 66, 1, 'S.13', 'Career seminars and job placement services are available for the students.', 0, '2024-01-21 18:27:50', '2024-01-21 18:27:50'),
(743, 66, 1, 'S.14', 'There is a mechanism to establish partnership and collaboration with other institutions, agencies and industry.', 0, '2024-01-21 18:27:59', '2024-01-21 18:27:59'),
(744, 66, 1, 'S.15', 'There is mechanism for storing and archiving student records for reference purposes.', 0, '2024-01-21 18:28:10', '2024-01-21 18:28:10'),
(745, 66, 3, 'I.1', 'The ration of a Guidance Counselor to student population is 1:1000.', 0, '2024-01-21 18:28:22', '2024-01-21 18:28:22'),
(746, 66, 3, 'I.2', 'Counseling  and other student records are maintained and keep confidential.', 0, '2024-01-21 18:28:34', '2024-01-21 18:28:34'),
(747, 66, 3, 'I.3', 'Appropriate intervention programs and services are adopted to promote and enhance student welfare and development.', 0, '2024-01-21 18:28:47', '2024-01-21 18:28:47'),
(748, 66, 3, 'I.4', 'The Guidance Office maintains an updated inventory of student cumulative records.', 0, '2024-01-21 18:29:00', '2024-01-21 18:31:46'),
(749, 66, 3, 'I.5', 'The psychological test are administered, scored and interpreted by qualified staff and the results are kept confidential.', 0, '2024-01-21 18:29:15', '2024-01-21 18:29:15'),
(750, 66, 3, 'I.6', 'The test result are disseminated to concerned parties.', 0, '2024-01-21 18:29:28', '2024-01-21 18:29:28'),
(751, 66, 3, 'I.7', 'Test result are utilized in designing activities to meet student needs.', 0, '2024-01-21 18:29:44', '2024-01-21 18:29:44'),
(752, 66, 3, 'I.8', 'A scheme for appropriate follow-up and referrals is utilized.', 0, '2024-01-21 18:29:55', '2024-01-21 18:29:55'),
(753, 66, 3, 'I.9', 'The Guidance Office prepares valid appraisal data of students for career and job placement.', 0, '2024-01-21 18:30:06', '2024-01-21 18:30:06'),
(754, 66, 3, 'I.10', 'Student placement is regularly monitored and followed-up.', 0, '2024-01-21 18:30:18', '2024-01-21 18:30:18'),
(755, 66, 3, 'I.11', 'The institution maintains active networking with the schools, the communities, alumni, and other concerned agencies for career and job placement of students.', 0, '2024-01-21 18:30:31', '2024-01-21 18:30:31'),
(756, 66, 3, 'I.12', 'Career counseling is provided to enable students to choose appropriate major/field of specialization.', 0, '2024-01-21 18:30:47', '2024-01-21 18:30:47'),
(757, 66, 3, 'I.13', 'Information materials on career and job opportunities are made accessible.', 0, '2024-01-21 18:31:00', '2024-01-21 18:31:00'),
(758, 66, 3, 'I.14', 'The SAS maintains liaison with its alumni to follow up graduates job performance, vis-à-vis:', 0, '2024-01-21 18:31:13', '2024-01-21 18:31:13'),
(759, 66, 3, 'I.15', 'Skills development programs are conducted.', 0, '2024-01-21 18:32:17', '2024-01-21 18:32:17'),
(760, 66, 3, 'I.16', 'The students are given assistance in career and job placement.', 0, '2024-01-21 18:32:28', '2024-01-21 18:32:28'),
(761, 66, 3, 'I.17', 'The institution encourages student economic ventures such as but not limited to:', 0, '2024-01-21 18:32:39', '2024-01-21 18:32:39'),
(762, 66, 3, 'I.18', 'Updated information on student welfare and development are accessible and disseminated.', 0, '2024-01-21 18:33:38', '2024-01-21 18:33:38'),
(763, 66, 3, 'I.19', 'The student body is involved in the development and revision of Student Handbook.', 0, '2024-01-21 18:33:51', '2024-01-21 18:33:51'),
(764, 66, 6, 'O.1', 'Quality student welfare services are available.', 0, '2024-01-21 18:34:02', '2024-01-21 18:34:02'),
(765, 67, 1, 'S.1', 'The institution has a system of accreditation, monitoring and evaluation of student organizations.', 0, '2024-01-21 18:34:25', '2024-01-21 18:35:36'),
(766, 67, 1, 'S.2', 'The institution provides adequate office space and other forms of support to accredited student organizations.', 0, '2024-01-21 18:34:40', '2024-01-21 18:34:40'),
(767, 67, 1, 'S.3', 'There is coordination between the school administration and SAS concerning students with drug related problems.', 0, '2024-01-21 18:34:51', '2024-01-21 18:34:51'),
(768, 67, 1, 'S.4', 'A mechanism to address student grievance is in place.', 0, '2024-01-21 18:35:02', '2024-01-21 18:38:45'),
(769, 67, 1, 'S.5', 'Programs and opportunities to develop and enhance leadership among students are provided.', 0, '2024-01-21 18:35:15', '2024-01-21 18:35:15'),
(770, 67, 3, 'I.1', 'Requirements and procedures for recognition/accreditation of student organizations are widely disseminated.', 0, '2024-01-21 18:35:53', '2024-01-21 18:35:53'),
(771, 67, 3, 'I.2', 'The Constitution and by-laws of student organizations incorporate participation and advocacy in social action activities.', 0, '2024-01-21 18:36:03', '2024-01-21 18:36:03'),
(772, 67, 3, 'I.3', 'The institution conducts leadership training.', 0, '2024-01-21 18:36:15', '2024-01-21 18:36:15'),
(773, 67, 3, 'I.4', 'The institution recognizes the right of the students to:', 0, '2024-01-21 18:36:26', '2024-01-21 18:36:26'),
(774, 67, 3, 'I.5', 'The institutional ensures transparency in the development/revision of guidelines and procedures for the student council/government.', 0, '2024-01-21 18:37:06', '2024-01-21 18:37:06'),
(775, 67, 3, 'I.6', 'The institutional ensures transparency in the development/revision of guidelines and procedures for the student council/government.', 0, '2024-01-21 18:37:19', '2024-01-21 18:37:19'),
(776, 67, 3, 'I.7', 'Sanctions are enforced for misconduct such as but not limited to acts of vandalism, hazing, bullying, libelous statements and other negative acts that threaten peace and order inside and outside the school premises.', 0, '2024-01-21 18:37:30', '2024-01-21 18:37:30'),
(777, 67, 3, 'I.8', 'Grievance Committee is established to ensure due process in dealing with students misconduct.', 0, '2024-01-21 18:37:46', '2024-01-21 18:37:46'),
(778, 67, 3, 'I.9', 'The institution supports the establishment and implementation of student publication as provided for R.A. 7079, otherwise known as “Campus Journalism Act of 1991” and other media forms.', 0, '2024-01-21 18:38:01', '2024-01-21 18:38:01'),
(779, 67, 3, 'I.10', 'The production/publication of a yearbook is encouraged.', 0, '2024-01-21 18:38:14', '2024-01-21 18:38:14'),
(780, 67, 6, 'O.1', 'Quality student development services are assured.', 0, '2024-01-21 18:38:24', '2024-01-21 18:38:24'),
(781, 68, 1, 'S.1', 'there is a system of student recruitment, selection, administration and retention.', 0, '2024-01-21 18:39:31', '2024-01-21 18:39:31'),
(782, 68, 1, 'S.2', 'Administration requirements and procedure of persons with disabilities as stipulated in R.A. 7277 are in place.', 0, '2024-01-21 18:39:49', '2024-01-21 18:39:49'),
(783, 68, 1, 'S.3', 'Scholarships and financial assistance in various forms are available to students.', 0, '2024-01-21 18:40:03', '2024-01-21 18:40:03'),
(784, 68, 1, 'S.4', 'Policies and guidelines are institutionalized for students from marginalized sector of the country.', 0, '2024-01-21 18:40:28', '2024-01-21 18:40:28'),
(785, 68, 1, 'S.5', 'There is a policy on wellness and healthy lifestyle.', 0, '2024-01-21 18:40:44', '2024-01-21 18:40:44'),
(786, 68, 1, 'S.6', 'Building and facilities which conform with government standards are provided with accessible and safe amenities for persons with disabilities.', 0, '2024-01-21 18:41:07', '2024-01-21 18:41:07'),
(787, 68, 1, 'S.7', 'There is a disaster risk reduction and management program in compliance with R.A. 10121, other known as the “Philippine Disaster Risk Reduction and Management Act of 2010”.', 0, '2024-01-21 18:41:22', '2024-01-21 18:41:22'),
(788, 68, 1, 'S.8', 'Policies on the use of student facilities are in place.', 0, '2024-01-21 18:41:40', '2024-01-21 18:41:40'),
(789, 68, 1, 'S.9', 'An integrated service program that caters to the various needs of foreign students are available, whenever applicable.', 0, '2024-01-21 18:41:57', '2024-01-21 18:41:57'),
(790, 68, 1, 'S.10', 'A liaison officer is available to assist foreign students in their transactions with concerned government agencies, whenever applicable.', 0, '2024-01-21 18:42:16', '2024-01-21 18:42:16'),
(791, 68, 1, 'S.11', 'There are programs for life skills training (e.g. conflict and stress management, harassment, etc.) counseling, testing, and referrals for students with special needs.', 0, '2024-01-21 18:42:31', '2024-01-21 18:42:31'),
(792, 68, 1, 'S.12', 'The institution provides opportunities for promotion and appreciation of culture and arts.', 0, '2024-01-21 18:42:46', '2024-01-21 18:42:46'),
(793, 68, 1, 'S.13', 'The institution has well equipped offices for:', 0, '2024-01-21 18:43:57', '2024-01-21 18:43:57'),
(794, 68, 1, 'S.14', 'There is a well-furnished medical-dental clinic.', 0, '2024-01-21 18:44:55', '2024-01-21 18:44:55'),
(795, 68, 1, 'S.15', 'There is a medical and dental program designed for:', 0, '2024-01-21 18:45:08', '2024-01-21 18:45:08'),
(796, 68, 1, 'S.16', 'An updated information on student health condition is available to parents/guardians.', 0, '2024-01-21 18:46:06', '2024-01-21 18:46:06'),
(797, 68, 1, 'S.17', 'There are mechanism to promote national, sectoral and cultural sports activities and development in coordination with concerned agencies.', 0, '2024-01-21 18:46:18', '2024-01-21 18:46:18'),
(798, 68, 1, 'S.18', 'There are financial assistance programs design for:', 0, '2024-01-21 18:46:34', '2024-01-21 18:46:34'),
(799, 68, 3, 'I.1', 'The faculty and students are properly informed of the admission guidelines and retention policies.', 0, '2024-01-21 18:48:12', '2024-01-21 18:48:12'),
(800, 68, 3, 'I.2', 'The policies and procedures on selection, admission and retention of students are implemented.', 0, '2024-01-21 18:48:25', '2024-01-21 18:48:25'),
(801, 68, 3, 'I.3', 'The following student admission records are filed and made available to concerned parties:', 0, '2024-01-21 18:48:40', '2024-01-21 18:48:40'),
(802, 68, 3, 'I.4', 'Retention policies are approved by the Academic Council and confirmed by the Board of Regents/Trustees.', 0, '2024-01-21 18:49:43', '2024-01-21 18:49:43'),
(803, 68, 3, 'I.5', 'The list of tuition and other school fees is posted conspicuously.', 0, '2024-01-21 18:49:54', '2024-01-21 18:49:54'),
(804, 68, 3, 'I.6', 'The institution provides access to scholarship and financial assistance.', 0, '2024-01-21 18:50:08', '2024-01-21 18:50:08'),
(805, 68, 3, 'I.7', 'Guidelines on scholarship and financial assistance are widely and promptly disseminated.', 0, '2024-01-21 18:50:30', '2024-01-21 18:50:30'),
(806, 68, 3, 'I.8', 'Criteria for safety, sanitation and food choice in the school canteen/cafeteria are disseminated.', 0, '2024-01-21 18:51:01', '2024-01-21 18:51:01'),
(807, 68, 3, 'I.9', 'The institution coordinated with the local government for the safety and sanitation of food services outside the school premises.', 0, '2024-01-21 18:51:14', '2024-01-21 18:51:14'),
(808, 68, 3, 'I.10', 'The institution periodically inspects food outlets for sanitation and hygiene. The sanitary permit is displayed in a prominent area of the food outlet.', 0, '2024-01-21 18:51:26', '2024-01-21 18:51:26'),
(809, 68, 3, 'I.11', 'The primary health care services are administered to all students by licensed medical, dental and allied professionals.', 0, '2024-01-21 18:51:40', '2024-01-21 18:51:40'),
(810, 68, 3, 'I.12', 'Facilities for keeping health care and updated records of students are adequate and well-maintained.', 0, '2024-01-21 18:52:02', '2024-01-21 18:52:02'),
(811, 68, 3, 'I.13', 'Policies and procedures in the selection of students athletes, performers, writers, etc. are implemented.', 0, '2024-01-21 18:52:18', '2024-01-21 18:52:18'),
(812, 68, 3, 'I.14', 'Health and related laws, rules and regulations are enforced.', 0, '2024-01-21 18:52:30', '2024-01-21 18:52:30'),
(813, 68, 3, 'I.15', 'Licensed and competent security personnel ensure the safety and security of students.', 0, '2024-01-21 18:52:56', '2024-01-21 18:52:56'),
(814, 68, 3, 'I.16', 'Earthquake and fire drills involving students, faculty and administrative staff are conducted regularly.', 0, '2024-01-21 18:53:09', '2024-01-21 18:53:09'),
(815, 68, 3, 'I.17', 'The institution establishes programs for the students to help in crime prevention, cleanliness and orderliness, observance of a clean and green environment, safety and security of the school premises.', 0, '2024-01-21 18:53:23', '2024-01-21 18:53:23'),
(816, 68, 3, 'I.18', 'The institution provides assistance to students on accessible, affordable, clean, conducive to learning, dormitories and housing facilities.', 0, '2024-01-21 18:53:36', '2024-01-21 18:53:36'),
(817, 68, 3, 'I.19', 'The institution ensures that the students right to practice his/her religion is respected.', 0, '2024-01-21 18:54:09', '2024-01-21 18:54:09'),
(818, 68, 3, 'I.20', 'Submission of required reports on foreign students to concerned governments agencies is done, whenever applicable.', 0, '2024-01-21 18:54:21', '2024-01-21 18:54:21'),
(819, 68, 3, 'I.21', 'The Code of Conduct for foreign students in the country is enforced.', 0, '2024-01-21 18:54:37', '2024-01-21 18:54:37');
INSERT INTO `indicators` (`id`, `parameter_id`, `indicator_category_id`, `indicator_name`, `indicator_desc`, `isOptional`, `created_at`, `updated_at`) VALUES
(820, 68, 3, 'I.22', 'The institution accommodates students with special needs.', 0, '2024-01-21 18:54:51', '2024-01-21 18:54:51'),
(821, 68, 3, 'I.23', 'There is a regular submission of the list of students with special needs to the CHEDRO describing the Institutions intervention programs.', 0, '2024-01-21 18:55:08', '2024-01-21 18:55:08'),
(822, 68, 3, 'I.23', 'There is a regular submission of the list of students with special needs to the CHEDRO describing the Institutions intervention programs.', 0, '2024-01-21 18:55:08', '2024-01-21 18:55:08'),
(823, 68, 3, 'I.24', 'Sports development programs are regularly conducted.', 0, '2024-01-21 18:55:21', '2024-01-21 18:55:21'),
(824, 68, 3, 'I.25', 'The institution ensures opportunities for students to participate in socio and civic action activities.', 0, '2024-01-21 18:55:34', '2024-01-21 18:55:34'),
(825, 68, 3, 'I.26', 'The students are covered with Life and Accident Insurance.', 0, '2024-01-21 18:55:50', '2024-01-21 18:55:50'),
(826, 68, 3, 'I.27', 'The institution rewards SAS staff for exceptional job performance.', 0, '2024-01-21 18:56:06', '2024-01-21 18:56:06'),
(827, 68, 3, 'I.28', 'The institution informs the students and other stakeholders on other related programs and services not cited in CMO No.9 s.2013.', 0, '2024-01-21 18:56:26', '2024-01-21 18:56:26'),
(828, 68, 3, 'I.28', 'The institution informs the students and other stakeholders on other related programs and services not cited in CMO No.9 s.2013.', 0, '2024-01-21 18:56:27', '2024-01-21 18:56:27'),
(829, 68, 6, 'O.1', 'The institutional programs and services develop student potentials to the fullest.', 0, '2024-01-21 18:56:45', '2024-01-21 18:56:45'),
(830, 69, 1, 'S.1', 'The institution has a program on student affairs and services.', 0, '2024-01-21 18:57:07', '2024-01-21 18:57:07'),
(831, 69, 1, 'S.2', 'There is mechanism for monitoring and evaluation of SAS programs.', 0, '2024-01-21 18:57:21', '2024-01-21 18:57:21'),
(832, 69, 1, 'S.3', 'There is mechanism for monitoring and evaluation of SAS programs.', 0, '2024-01-21 18:57:34', '2024-01-21 18:57:34'),
(833, 69, 1, 'S.4', 'There is adequate funding for the conduct of SAS researches and monitoring and evaluation.', 0, '2024-01-21 18:57:49', '2024-01-21 18:57:49'),
(834, 69, 3, 'I.1', 'Researches on student affairs and services are conducted.', 0, '2024-01-21 18:58:02', '2024-01-21 18:58:02'),
(835, 69, 3, 'I.2', 'Research results and outputs are disseminated and utilized.', 0, '2024-01-21 18:58:14', '2024-01-21 18:58:14'),
(836, 69, 3, 'I.3', 'Regular monitoring and evaluation on the implementation of student services are conducted.', 0, '2024-01-21 18:58:28', '2024-01-21 18:58:28'),
(837, 69, 3, 'I.4', 'Monitoring and evaluation instruments are developed, reviewed, and continuously improved.', 0, '2024-01-21 18:58:44', '2024-01-21 18:58:44'),
(838, 69, 3, 'I.5', 'Reports are filed and submitted regularly to CHEDRO.', 0, '2024-01-21 18:58:57', '2024-01-21 18:58:57'),
(839, 69, 3, 'O.1', 'Research outputs are presented and published.', 0, '2024-01-21 18:59:10', '2024-01-21 18:59:10'),
(840, 70, 1, 'S.1', 'The institution’s research agenda is in consonance with institutional, regional and national priorities concerned such as DOST, CHED-National Higher Education Research Agenda, NEDA, etc.', 0, '2024-01-21 19:01:28', '2024-01-21 19:01:28'),
(841, 70, 1, 'S.2', 'The institution has a approved Research Manual.', 0, '2024-01-21 19:01:41', '2024-01-21 19:01:41'),
(842, 70, 3, 'I.1', 'The approved Research Agenda is implemented.', 0, '2024-01-21 19:01:53', '2024-01-21 19:01:53'),
(843, 70, 3, 'I.2', 'The following stakeholders participate in the formulation of research agenda as based for identifying institutional thrusts and priorities:', 0, '2024-01-21 19:02:06', '2024-01-21 19:02:06'),
(844, 70, 3, 'I.3', 'Action researches to test theory in practices are conducted by faculty and students.', 0, '2024-01-21 19:03:03', '2024-01-21 19:03:03'),
(845, 70, 3, 'I.4', 'Team/collaborative and interdisciplinary research is encouraged.', 0, '2024-01-21 19:03:25', '2024-01-21 19:03:25'),
(846, 70, 3, 'I.5', 'Research outputs are published in refereed national and/or international journals.', 0, '2024-01-21 19:03:38', '2024-01-21 19:03:38'),
(847, 70, 6, 'O.1', 'Priority researches are identified and conducted.', 0, '2024-01-21 19:03:50', '2024-01-21 19:03:50'),
(848, 70, 6, 'O.2', 'Research results are published.', 0, '2024-01-21 19:04:07', '2024-01-21 19:04:07'),
(849, 71, 1, 'S.1', 'The institution has a approved and adequate budget for research.', 0, '2024-01-21 19:04:42', '2024-01-21 19:04:42'),
(850, 71, 1, 'S.2', 'There are provisions for the following:', 0, '2024-01-21 19:04:51', '2024-01-21 19:04:51'),
(851, 71, 3, 'I.1', 'allocate adequate funds for the conduct of faculty and student research.', 0, '2024-01-21 19:05:39', '2024-01-21 19:05:39'),
(852, 71, 3, 'I.2', 'establishes linkages with the local/national/international agencies for funding support and assistance.', 0, '2024-01-21 19:05:56', '2024-01-21 19:05:56'),
(853, 71, 3, 'I.3', 'maintain a functional and long-range program of faculty/staff development to enhance research capability and competence.', 0, '2024-01-21 19:06:08', '2024-01-21 19:06:08'),
(854, 71, 3, 'I.4', 'encourages the conduct of externally founded researches.', 0, '2024-01-21 19:06:36', '2024-01-21 19:06:36'),
(855, 71, 6, 'O.1', 'The Research Program is adequately funded.', 0, '2024-01-21 19:06:54', '2024-01-21 19:06:54'),
(856, 72, 1, 'S.1', 'There is a system of implementation, monitoring, evaluation and utilization of research outputs.', 0, '2024-01-21 19:07:15', '2024-01-21 19:07:15'),
(857, 72, 1, 'S.2', 'There is a policy on Intellectual Property Rights (IPR).', 0, '2024-01-21 19:07:28', '2024-01-21 19:07:28'),
(858, 72, 3, 'I.1', 'The institution/College/Academic Unit has a Research Unit management by competent staff.', 0, '2024-01-21 19:07:42', '2024-01-21 19:07:42'),
(859, 72, 3, 'I.2', 'The Research Manual provides guidelines and procedures for the administration and conduct of research.', 0, '2024-01-21 19:08:01', '2024-01-21 19:08:01'),
(860, 72, 3, 'I.3', 'The faculty conduct applied and operational researches in their fields of specialization in accordance with the thrusts and priorities of the program/institution.', 0, '2024-01-21 19:08:16', '2024-01-21 19:08:16'),
(861, 72, 3, 'I.4', 'The institution provides incentives to faculty researchers such as honoraria, service credits, deloading, etc.', 0, '2024-01-21 19:08:29', '2024-01-21 19:08:29'),
(862, 72, 3, 'I.5', 'The College/Academic Units requires its students to conduct research, as a course requirement, (whenever applicable).', 0, '2024-01-21 19:08:41', '2024-01-21 19:08:41'),
(863, 72, 3, 'I.6', 'The institution provides opportunities for advance studies and/or training to enhance faculty/staff research competence.', 0, '2024-01-21 19:08:52', '2024-01-21 19:08:52'),
(864, 72, 3, 'I.7', 'Completed and on-going research studies are periodically monitored and evaluated in local and regional in-house reviews.', 0, '2024-01-21 19:09:03', '2024-01-21 19:09:03'),
(865, 72, 3, 'I.8', 'Research outputs are utilized as inputs in:', 0, '2024-01-21 19:09:14', '2024-01-21 19:09:14'),
(866, 72, 3, 'I.9', 'Packaged technologies and new information are disseminated to the target clientele through appropriate delivery systems.', 0, '2024-01-21 19:09:55', '2024-01-21 19:09:55'),
(867, 72, 3, 'I.10', 'The institution ensures that:', 0, '2024-01-21 19:10:08', '2024-01-21 19:10:08'),
(868, 72, 6, 'O.1', 'Implementation, monitoring, evaluation and research utilization of outputs are effective.', 0, '2024-01-21 19:10:38', '2024-01-21 19:10:38'),
(869, 73, 1, 'S.1', 'The institution has an approves and copyrighted Research Journal.', 0, '2024-01-21 19:10:54', '2024-01-21 19:10:54'),
(870, 73, 1, 'S.2', 'The institution has incentives for:', 0, '2024-01-21 19:11:05', '2024-01-21 19:11:05'),
(871, 73, 3, 'I.1', 'The institution provides opportunities for the dissemination of research in for a, conferences, seminars, and other related means.', 0, '2024-01-21 19:11:51', '2024-01-21 19:11:51'),
(872, 73, 3, 'I.2', 'The institution regularly publishes a research journal.', 0, '2024-01-21 19:12:05', '2024-01-21 19:12:05'),
(873, 73, 3, 'I.3', 'Library exchange of researches publications with other HEI’s and agencies is maintained.', 0, '2024-01-21 19:12:18', '2024-01-21 19:12:18'),
(874, 73, 3, 'I.4', 'Research manuscripts/technical reports are well-written, and edited following the institutional format.', 0, '2024-01-21 19:12:29', '2024-01-21 19:12:29'),
(875, 73, 3, 'I.5', 'The institutional supports the researchers in all of the following activities:', 0, '2024-01-21 19:12:41', '2024-01-21 19:12:41'),
(876, 73, 3, 'I.6', 'Research results are published preferably in refereed journals.', 0, '2024-01-21 19:13:50', '2024-01-21 19:13:50'),
(877, 73, 3, 'I.7', 'Research results are disseminated to the target clientele.', 0, '2024-01-21 19:14:02', '2024-01-21 19:14:02'),
(878, 73, 3, 'I.8', 'The Collage/Academic Unit generates income from patents, licenses, copyrights, and research outputs.', 0, '2024-01-21 19:14:15', '2024-01-21 19:14:15'),
(879, 73, 6, 'O.1', 'Research outputs are published in refereed journals.', 0, '2024-01-21 19:14:27', '2024-01-21 19:14:27'),
(880, 73, 6, 'O.2', 'Research outputs are utilized.', 0, '2024-01-21 19:14:40', '2024-01-21 19:14:40'),
(881, 73, 6, 'O.3', 'Patented and copyrighted research outputs are commercialized.', 0, '2024-01-21 19:14:52', '2024-01-21 19:14:52'),
(882, 74, 1, 'S.1', 'The extension agenda is in consonance of local, regional and national development thrusts and priorities.', 0, '2024-01-23 03:17:29', '2024-01-23 03:18:47'),
(883, 74, 1, 'S.2', 'The College/Academic Unit of Information Technology Education has a benchmark survey of the problems, needs priorities and resources of the community', 0, '2024-01-23 03:17:53', '2024-01-23 03:18:36'),
(884, 74, 1, 'S.3', 'The extension program reflects the VMGO.', 0, '2024-01-23 03:18:58', '2024-01-23 03:18:58'),
(885, 74, 1, 'S.4', 'There is a pool of consultants/experts from various disciplines to serve in extension projects and activities.', 0, '2024-01-23 03:19:09', '2024-01-23 03:19:29'),
(886, 74, 1, 'S.5', 'The institution has an approved and copyrighted Extension Manual.', 0, '2024-01-23 03:19:42', '2024-01-23 03:19:42'),
(887, 74, 3, 'I.1', 'The extension projects and activities implemented are based on the results of the benchmark survey.', 0, '2024-01-23 03:19:59', '2024-01-23 03:19:59'),
(888, 74, 3, 'I.2', 'The extension projects and activities complement the curriculum of the Information Technology Education program under review.', 0, '2024-01-23 03:20:12', '2024-01-23 03:20:12'),
(889, 74, 3, 'I.3', 'A mutual exchange of resources and services between the College/Academic Unit and the community is evident.', 0, '2024-01-23 03:20:32', '2024-01-23 03:20:32'),
(890, 74, 3, 'I.4', 'Linkages with local, national, foreign, and non-governmental agencies are institutionalized.', 0, '2024-01-23 03:20:44', '2024-01-23 03:20:44'),
(891, 74, 6, 'O.1', 'Priority and relevant extension projects and activities are conducted.', 0, '2024-01-23 03:21:00', '2024-01-23 03:21:00'),
(892, 75, 1, 'S.1', 'There is a distinct office that manages the Extension Program.', 0, '2024-01-23 03:21:22', '2024-01-23 03:21:44'),
(893, 75, 1, 'S.2', 'Instruments for monitoring and evaluation are available.', 0, '2024-01-23 03:21:57', '2024-01-23 03:21:57'),
(894, 75, 3, 'I.1', 'The administration, faculty, students and other stakeholders of the College/Academic Unit of Information Technology Education participate in the planning and organization of Extension Program.', 0, '2024-01-23 03:22:08', '2024-01-23 03:22:08'),
(895, 75, 3, 'I.2', 'The administration, faculty and students are involved in the implementation and dissemination of extension programs.', 0, '2024-01-23 03:22:25', '2024-01-23 03:22:25'),
(896, 75, 3, 'I.3', 'The extension projects and activities serve varied clientele.', 0, '2024-01-23 03:22:40', '2024-01-23 03:22:40'),
(897, 75, 3, 'I.4', 'The conduct of extension projects and activities is sustainable.', 0, '2024-01-23 03:22:54', '2024-01-23 03:22:54'),
(898, 75, 3, 'I.5', 'Technologies/new knowledge are disseminated to the target clientele through appropriate extension delivery systems.', 0, '2024-01-23 03:23:08', '2024-01-23 03:23:08'),
(899, 75, 3, 'I.6', 'The extension activities are documented in the form of:', 0, '2024-01-23 03:23:21', '2024-01-23 03:23:21'),
(900, 75, 3, 'I.7', 'Periodic monitoring and evaluation of extension projects and activities are conducted', 0, '2024-01-23 03:24:15', '2024-01-23 03:24:15'),
(901, 75, 3, 'I.8', 'Results of monitoring and evaluation are disseminated and discussed with concerned stakeholders.', 0, '2024-01-23 03:24:29', '2024-01-23 03:24:29'),
(902, 75, 3, 'I.9', 'Replanning of activities based on feedback is conducted.', 0, '2024-01-23 03:24:38', '2024-01-23 03:24:38'),
(903, 75, 3, 'I.10', 'Accomplishment and terminal reports are filed and submitted on time.', 0, '2024-01-23 03:24:51', '2024-01-23 03:24:51'),
(904, 75, 6, 'O.1', 'The Extension Program is well-planned, implemented, monitored, evaluated and disseminated.', 0, '2024-01-23 03:25:25', '2024-01-23 03:25:25'),
(905, 75, 6, '0.2', 'The Extension Program has contributed to the improvement on the quality of life of the target clientele/beneficiaries.', 0, '2024-01-23 03:25:35', '2024-01-23 03:25:35'),
(906, 77, 1, 'S.1', 'There is a strategy for involving the community, government and private agencies in the Extension Program.', 0, '2024-01-23 03:26:53', '2024-01-23 03:26:53'),
(907, 77, 3, 'I.1', 'The College/Academic Unit is committed to the service and development of the community, and', 0, '2024-01-23 03:27:11', '2024-01-23 03:27:11'),
(908, 77, 3, 'I.2', 'There is community participation and involvement in extension activities in the following:', 0, '2024-01-23 03:27:43', '2024-01-23 03:27:43'),
(909, 77, 6, '0.1', 'There is wholesome coordination between the Extension Program implementers and the target clientele/beneficiaries.', 0, '2024-01-23 03:28:35', '2024-01-23 03:28:35'),
(910, 78, 1, 'S.1', 'The laboratory layout conforms to acceptable standards (RA 6541 National Building Code of the Philippines/PD 856 \"Code of Sanitation of the Philippines) and to particular needs of the Information Technology program.', 0, '2024-01-23 03:30:18', '2024-01-23 03:30:18'),
(911, 78, 1, 'S.2', 'Room lightings conform to the standard requirements of fluorescent bulbs relative to the size.', 0, '2024-01-23 03:30:27', '2024-01-23 03:30:27'),
(912, 78, 1, 'S.3', 'The laboratories are properly lighted and well ventilated.', 0, '2024-01-23 03:30:38', '2024-01-23 03:30:38'),
(913, 78, 1, 'S.4', 'Each laboratory room has at least two exit doors that open outward.', 0, '2024-01-23 03:30:48', '2024-01-23 03:30:48'),
(914, 78, 1, 'S.5', 'There is a laboratory for shop work for specific technologies.', 0, '2024-01-23 03:31:47', '2024-01-23 03:31:47'),
(915, 78, 1, 'S.6', 'There is a computer laboratory with at least 15 usable computer units and a printer.', 0, '2024-01-23 03:31:57', '2024-01-23 03:31:57'),
(916, 79, 1, 'S.1', 'The equipment, instruments and materials needed in the classrooms are available.', 0, '2024-01-23 03:32:44', '2024-01-23 03:32:44'),
(917, 79, 1, 'S.2', 'Apparatuses, tools and materials conform to the specifications required in accordance with the CMO of the program.', 0, '2024-01-23 03:32:55', '2024-01-23 03:32:55'),
(918, 79, 1, 'S.3', 'Varied computer software are available.', 0, '2024-01-23 03:33:04', '2024-01-23 03:33:04'),
(919, 79, 3, 'I.1', 'Equipment are well-maintained.', 0, '2024-01-23 03:33:19', '2024-01-23 03:33:19'),
(920, 79, 3, 'I.2', 'Laboratory supplies and materials are wisely utilized.', 0, '2024-01-23 03:33:28', '2024-01-23 03:33:28'),
(921, 79, 3, 'I.3', 'Licensed computer software are installed and utilized.', 0, '2024-01-23 03:33:36', '2024-01-23 03:33:36'),
(922, 79, 6, '0.1', 'The laboratory equipment, supplies and materials are sufficient and wisely utilized.', 0, '2024-01-23 03:33:56', '2024-01-23 03:33:56'),
(923, 80, 1, 'S.1', 'A laboratory technician/assistant is available for the proper upkeep of the laboratories.', 0, '2024-01-23 03:34:25', '2024-01-23 03:34:25'),
(924, 80, 1, 'S.2', 'The institution has a Maintenance and Repair Department/Unit manned by skilled personnel who provides services on direct call.', 0, '2024-01-23 03:34:34', '2024-01-23 03:34:34'),
(925, 80, 3, 'I.1', 'The institution keeps the laboratories neat, clean and orderly.', 0, '2024-01-23 03:35:12', '2024-01-23 03:35:12'),
(926, 80, 3, 'I.2', 'Laboratory supplies and materials are regularly replenished/replaced, whenever applicable.', 0, '2024-01-23 03:35:21', '2024-01-23 03:35:21'),
(927, 80, 3, 'I.3', 'The inventory of laboratory facilities and equipment is systematically and periodically conducted.', 0, '2024-01-23 03:35:35', '2024-01-23 03:35:35'),
(928, 80, 3, 'I.4', 'The laboratory equipment and instruments are in good condition and are periodically callorated.', 0, '2024-01-23 03:36:05', '2024-01-23 03:36:05'),
(929, 80, 3, 'I.5', 'All equipment are coded, fisted and inventoried.', 0, '2024-01-23 03:36:15', '2024-01-23 03:36:15'),
(930, 80, 3, 'I.6', 'Waste disposal is efficiently and effectively managed on campus.', 0, '2024-01-23 03:36:24', '2024-01-23 03:36:24'),
(931, 80, 3, 'I.7', 'The following are properly maintained by trained staff/technicians:', 0, '2024-01-23 03:36:33', '2024-01-23 03:36:33'),
(932, 80, 6, 'O.1', 'The laboratories and shops are functional and are properly maintained.', 0, '2024-01-23 03:52:04', '2024-01-23 03:52:04'),
(933, 81, 1, 'S.1', 'Specific program requirements (listing of materials and equipment as per CMO) are in accordance with guidelines/policies embodied in official issuances.', 0, '2024-01-23 03:52:36', '2024-01-23 03:52:36'),
(934, 81, 1, 'S.2', 'There is an approved Project Procurement Management Plan (PPMP).', 0, '2024-01-23 03:52:45', '2024-01-23 03:52:45'),
(935, 81, 1, 'S.3', 'There is an approved Annual Procurement Plan (APP) for laboratory equipment, supplies and materials.', 0, '2024-01-23 03:52:53', '2024-01-23 03:52:53'),
(936, 81, 3, 'I.1', 'The institution implements the special provisions as listed in the CMO.', 0, '2024-01-23 03:53:03', '2024-01-23 03:53:03'),
(937, 81, 6, 'O.1', 'The special provisions in the CMO of the program are complied with.', 0, '2024-01-23 03:53:32', '2024-01-23 03:53:32'),
(938, 201, 1, 'S.1', 'There is a Site Development Plan, and program of implementation.', 0, '2024-01-23 04:02:55', '2024-01-23 04:02:55'),
(939, 201, 1, 'S.2', 'The Campus has accessible good roads and pathways.', 0, '2024-01-23 04:03:04', '2024-01-23 04:03:04'),
(940, 201, 1, 'S.3', 'The campus is in a well-planned, clean and properly landscaped environment.', 0, '2024-01-23 04:03:15', '2024-01-23 04:03:15'),
(941, 201, 1, 'S.4', 'There is a system to ensure that all of the following are provided:', 0, '2024-01-23 04:03:24', '2024-01-23 04:03:24'),
(942, 201, 1, 'S.5', 'An area for outdoor educational activities, e.g. social, physical, athletic, cultural, military training, etc. exists.', 0, '2024-01-23 04:04:06', '2024-01-23 04:04:06'),
(943, 201, 1, 'S.6', 'There is a campus security unit that ensures safety of the academic community.', 0, '2024-01-23 04:04:16', '2024-01-23 04:04:16'),
(944, 201, 3, 'I.1', 'The site infrastructure development plan is implemented as planned.', 0, '2024-01-23 04:04:25', '2024-01-23 04:04:25'),
(945, 201, 3, 'I.2', 'The site plan is strategically displayed inside the campus indicating the location of the different buildings, driveways, parking areas, etc.', 0, '2024-01-23 04:04:38', '2024-01-23 04:04:38'),
(946, 201, 3, 'I.3', 'The infrastructure development plan is implemented in accordance with approved zoning ordinances.', 0, '2024-01-23 04:04:50', '2024-01-23 04:04:50'),
(947, 201, 3, 'I.4', 'Covered walks are provided to protect the academic community from inclement weather.', 0, '2024-01-23 04:04:58', '2024-01-23 04:04:58'),
(948, 201, 3, 'I.5', 'The institution implements a Waste Management Program.', 0, '2024-01-23 04:05:08', '2024-01-23 04:05:08'),
(949, 201, 6, 'O.1', 'The Campus environment is conducive to all educational activities.', 0, '2024-01-23 04:05:23', '2024-01-23 04:05:23'),
(950, 201, 6, 'O.2', 'The site can accommodate its present school population and future expansion.', 0, '2024-01-23 04:05:28', '2024-01-23 04:05:28'),
(951, 201, 6, 'O.3', 'The campus is safe and well-maintained.', 0, '2024-01-23 04:05:36', '2024-01-23 04:05:36'),
(952, 202, 1, 'S.1', 'The buildings meet all requirements of the Building Code. A Certificate of Occupancy for each building is conspicuously displayed.', 0, '2024-01-23 04:05:56', '2024-01-23 04:05:56'),
(953, 202, 1, 'S.2', 'The buildings are constructed according to their respective uses.', 0, '2024-01-23 04:06:05', '2024-01-23 04:06:05'),
(954, 202, 1, 'S.3', 'The buildings are well-planned and appropriately located to provide for future expansion.', 0, '2024-01-23 04:06:15', '2024-01-23 04:06:15'),
(955, 202, 1, 'S.4', 'Entry and exit points permit the use of the buildings for public and other functions with minimum interference to school activities.', 0, '2024-01-23 04:06:22', '2024-01-23 04:06:22'),
(956, 202, 1, 'S.5', 'Emergency exits are provided and properly marked.', 0, '2024-01-23 04:06:30', '2024-01-23 04:06:30'),
(957, 202, 1, 'S.6', 'The buildings are equipped with emergency/fire escapes which are readily accessible.', 0, '2024-01-23 04:06:39', '2024-01-23 04:06:39'),
(958, 202, 1, 'S.7', 'The corridors, doorways, and alleys are well-constructed for better mobility.', 0, '2024-01-23 04:06:51', '2024-01-23 04:06:51'),
(959, 202, 1, 'S.8', 'The buildings are well-ventilated and lighted.', 0, '2024-01-23 04:06:59', '2024-01-23 04:06:59'),
(960, 202, 1, 'S.9', 'The buildings have facilities for persons with disability (PWDs) as provided by law.', 0, '2024-01-23 04:07:11', '2024-01-23 04:07:11'),
(961, 202, 1, 'S.10', 'There is a central signal and fire alarm system.', 0, '2024-01-23 04:07:19', '2024-01-23 04:07:19'),
(962, 202, 1, 'S.11', 'There are readily accessible and functional fire extinguishers and other fire-fighting equipment.', 0, '2024-01-23 04:07:27', '2024-01-23 04:07:27'),
(963, 202, 1, 'S.12', 'Bulletin boards, display boards, waste disposal containers and other amenities are strategically located inside the buildings.', 0, '2024-01-23 04:07:37', '2024-01-23 04:07:37'),
(964, 202, 1, 'S.13', 'There are faculty rooms and offices.', 0, '2024-01-23 04:07:44', '2024-01-23 04:07:44'),
(965, 202, 1, 'S.14', 'The buildings are insured.', 0, '2024-01-23 04:07:51', '2024-01-23 04:07:51'),
(966, 202, 3, 'I.1', 'The buildings are clean, well-maintained and free from vandalistic acts.', 0, '2024-01-23 04:08:05', '2024-01-23 04:08:05'),
(967, 202, 3, 'I.2', 'Toilets are clean and well-maintained.', 0, '2024-01-23 04:08:13', '2024-01-23 04:08:13'),
(968, 202, 3, 'I.3', 'Electrical lines are safely installed and periodically checked.', 0, '2024-01-23 04:09:28', '2024-01-23 04:09:28'),
(969, 202, 3, 'I.4', 'Water facilities are functional and well-distributed in all buildings.', 0, '2024-01-23 04:09:38', '2024-01-23 04:09:38'),
(970, 202, 3, 'I.5', 'There is a periodic potability testing of drinking water.', 0, '2024-01-23 04:09:46', '2024-01-23 04:09:46'),
(971, 202, 3, 'I.6', 'Floor plans indicating fire exits and location of fire-fighting equipment, stand pipes, and other water sources are conspicuously displayed in each building.', 0, '2024-01-23 04:09:57', '2024-01-23 04:09:57'),
(972, 202, 3, 'I.7', 'All school facilities are periodically subjected to pest control and inspection.', 0, '2024-01-23 04:10:05', '2024-01-23 04:10:05'),
(973, 202, 3, 'I.8', 'Smoking is strictly prohibited inside the campus.', 0, '2024-01-23 04:10:13', '2024-01-23 04:10:13'),
(974, 202, 3, 'I.9', 'Periodic drill on disaster and risk reduction (earthquake, flood, fire, etc.) is conducted.', 0, '2024-01-23 04:10:26', '2024-01-23 04:10:26'),
(975, 202, 6, 'O.1', 'O.1. The buildings and other facilities are safe, well-maintained and functional.', 0, '2024-01-23 04:10:42', '2024-01-23 04:10:42'),
(976, 203, 1, 'S.1', 'Classroom size (1.5 sq.m. per student) meets standard specifications for instruction.', 0, '2024-01-23 04:11:22', '2024-01-23 04:11:22'),
(977, 203, 1, 'S.2', 'The classrooms are well-lighted, ventilated and acoustically conditioned.', 0, '2024-01-23 04:11:31', '2024-01-23 04:11:31'),
(978, 203, 1, 'S.3', 'The classrooms are adequate and are provided with enough chairs, furniture and equipment.', 0, '2024-01-23 04:11:41', '2024-01-23 04:11:41'),
(979, 203, 1, 'S.4', 'There are sufficient supplies (chalkboards/whiteboards, and instructional materials) in each classroom.', 0, '2024-01-23 04:11:53', '2024-01-23 04:11:53'),
(980, 203, 3, 'I.1', 'The classrooms are clearly marked and arranged relative to their functions.', 0, '2024-01-23 04:12:04', '2024-01-23 04:12:04'),
(981, 203, 3, 'I.2', 'The classrooms are well-maintained and free from interference.', 0, '2024-01-23 04:12:19', '2024-01-23 04:12:19'),
(982, 203, 3, 'I.3', 'Students cooperate in maintaining the cleanliness and orderliness of the classrooms.', 0, '2024-01-23 04:12:28', '2024-01-23 04:12:28'),
(983, 203, 6, 'O.1', 'Classrooms are adequate and conducive to learning.', 0, '2024-01-23 04:12:42', '2024-01-23 04:12:42'),
(984, 204, 1, 'S.1', 'The administrative offices are accessible to stakeholders.', 0, '2024-01-23 04:13:05', '2024-01-23 04:13:05'),
(985, 204, 1, 'S.2', 'All offices are accessible and conveniently located in accordance to their functions.', 0, '2024-01-23 04:13:11', '2024-01-23 04:13:11'),
(986, 204, 1, 'S.3', 'There are offices and workspaces for all officials, faculty and administrative staff.', 0, '2024-01-23 04:13:19', '2024-01-23 04:13:19'),
(987, 204, 1, 'S.4', 'Administration and faculty offices and staff rooms are clean, well- lighted and ventilated.', 0, '2024-01-23 04:13:27', '2024-01-23 04:13:27'),
(988, 204, 1, 'S.5', 'Function rooms and lounge are available.', 0, '2024-01-23 04:13:37', '2024-01-23 04:13:37'),
(989, 204, 1, 'S.6', 'Storerooms are strategically located.', 0, '2024-01-23 04:13:47', '2024-01-23 04:13:47'),
(990, 204, 1, 'S.7', 'There is internal and external communication system.', 0, '2024-01-23 04:13:57', '2024-01-23 04:13:57'),
(991, 204, 1, 'S.8', 'There are clean toilets for administrators, faculty, staff, and students.', 0, '2024-01-23 04:14:04', '2024-01-23 04:14:04'),
(992, 204, 3, 'I.1', 'All offices are furnished with the necessary equipment, furniture, supplies and materials.', 0, '2024-01-23 04:14:24', '2024-01-23 04:14:24'),
(993, 204, 3, 'I.2', 'All offices are well-maintained.', 0, '2024-01-23 04:14:33', '2024-01-23 04:14:33'),
(994, 204, 6, 'O.1', 'The offices and staff rooms are adequate and conducive to working environment.', 0, '2024-01-23 04:14:45', '2024-01-23 04:14:45'),
(995, 205, 1, 'S.1', 'Function rooms for holding meetings, conferences, convocations and similar activities are sufficient.', 0, '2024-01-23 04:15:09', '2024-01-23 04:15:09'),
(996, 205, 1, 'S.2', 'Facilities for athletics sports, cultural activities, military training, etc. are accessible.', 0, '2024-01-23 04:15:23', '2024-01-23 04:15:23'),
(997, 205, 1, 'S.3', 'The seating capacity conforms to standards.', 0, '2024-01-23 04:15:28', '2024-01-23 04:15:28'),
(998, 205, 1, 'S.4', 'There are adequate and well-marked entry and exit points.', 0, '2024-01-23 04:15:37', '2024-01-23 04:15:37'),
(999, 205, 1, 'S.5', 'There are storage facilities for athletic sports and other curricular training equipment.', 0, '2024-01-23 04:15:46', '2024-01-23 04:15:46'),
(1000, 205, 3, 'I.1', 'Indoor facilities are constructed with:', 0, '2024-01-23 04:16:14', '2024-01-23 04:16:14'),
(1001, 205, 3, 'I.2', 'The constructed outdoor facilities are:', 0, '2024-01-23 04:17:09', '2024-01-23 04:17:09'),
(1002, 205, 3, 'I.3', 'Assembly, athletic sports and cultural facilities are sufficient and varied to meet the requirements of the institution.', 0, '2024-01-23 04:19:07', '2024-01-23 04:19:07'),
(1003, 205, 3, 'I.4', 'Audio-visual room and facilities with appropriate equipment are utilized in support of the teaching-learning such as but not limited to video/ overhead/ slide projector, sound system, LCD projectors and', 0, '2024-01-23 04:19:14', '2024-01-23 04:19:14'),
(1004, 205, 6, 'O.1', 'Indoor and outdoor facilities are well-equipped and properly maintained.', 0, '2024-01-23 04:19:27', '2024-01-23 04:19:27'),
(1005, 206, 1, 'S.1', 'The Medical and Dental Clinic has basic facilities such as: reception area, records section, examination/treatment room and toilets.', 0, '2024-01-23 04:19:43', '2024-01-23 04:19:43'),
(1006, 206, 1, 'S.2', 'The institution has functional medical and dental section/area.', 0, '2024-01-23 04:19:50', '2024-01-23 04:19:50'),
(1007, 206, 1, 'S.3', 'Potable water is available and sufficient.', 0, '2024-01-23 04:20:00', '2024-01-23 04:20:00'),
(1008, 206, 1, 'S.4', 'Medical and dental equipment are provided.', 0, '2024-01-23 04:20:07', '2024-01-23 04:20:07'),
(1009, 206, 1, 'S.5', 'There are enough medical and dental supplies and materials.', 0, '2024-01-23 04:20:17', '2024-01-23 04:20:17'),
(1010, 206, 1, 'S.6', 'Storage facilities (refrigerator, steel cabinets, etc.) are available.', 0, '2024-01-23 04:20:25', '2024-01-23 04:20:25'),
(1011, 206, 1, 'S.7', 'Medical and dental supplies and materials have proper labels.', 0, '2024-01-23 04:20:32', '2024-01-23 04:20:32'),
(1012, 206, 1, 'S.8', 'The following basic medical equipment and medicines are all available:', 0, '2024-01-23 04:20:45', '2024-01-23 04:20:45'),
(1013, 206, 1, 'S.9', 'The following basic dental equipment and apparatuses are available:', 0, '2024-01-23 04:23:23', '2024-01-23 04:23:23'),
(1014, 206, 1, 'S.10', 'The Medical/Dental Clinic has ample space, adequate lighting and ventilation.', 0, '2024-01-23 04:24:12', '2024-01-23 04:24:12'),
(1015, 206, 3, 'I.1', 'The Medical and Dental Clinics are managed by qualified medical and dental officers.', 0, '2024-01-23 04:24:25', '2024-01-23 04:24:25'),
(1016, 206, 3, 'I.2', 'Distinct rooms and storage areas are properly labeled.', 0, '2024-01-23 04:24:34', '2024-01-23 04:24:34'),
(1017, 206, 3, 'I.3', 'Medical and dental services are regularly monitored and evaluated', 0, '2024-01-23 04:24:58', '2024-01-23 04:24:58'),
(1018, 206, 6, 'O.1', 'The medical, dental clinic and services are functional.', 0, '2024-01-23 04:25:51', '2024-01-23 04:25:51'),
(1029, 207, 3, 'I.1', 'Student activities at the Student Center are regularly conducted and monitored', 0, '2024-01-23 04:31:17', '2024-01-23 04:31:17'),
(1030, 207, 3, 'I.2', 'The Student Center is properly maintained.', 0, '2024-01-23 04:32:15', '2024-01-23 04:32:15'),
(1031, 207, 1, 'S.1', 'The institution has a Student Center with supplies and materials.', 0, '2024-01-23 04:33:17', '2024-01-23 04:33:17'),
(1032, 207, 1, 'S.2', 'Policies and guidance on the proper utilization of Student Center are in place.', 0, '2024-01-23 04:33:24', '2024-01-23 04:33:47'),
(1033, 207, 1, 'S.3', 'The Student Center is well-lighted and ventilated.', 0, '2024-01-23 04:33:38', '2024-01-23 04:33:38'),
(1034, 207, 1, 'S.4', 'A conference room is available for students\' use.', 0, '2024-01-23 04:34:01', '2024-01-23 04:34:01'),
(1035, 207, 1, 'S.5', 'There are facilities and equipment for table games, music appreciation, and TV or video viewing.', 0, '2024-01-23 04:34:12', '2024-01-23 04:34:57'),
(1036, 207, 1, 'S.6', 'Clean and sanitary toilets, for men separate from those of women are available.', 0, '2024-01-23 04:35:09', '2024-01-23 04:35:09'),
(1037, 207, 1, 'S.7', 'Toilet fixtures for students with special needs and PWD\'s are provided.', 0, '2024-01-23 04:35:26', '2024-01-23 04:35:26'),
(1038, 207, 1, 'S.8', 'There are offices for student leaders, the editorial staff of the student publication and the officers of other student organizations.', 0, '2024-01-23 04:35:43', '2024-01-23 04:35:43'),
(1039, 207, 6, 'O.1', 'The Student Center is fully equipped and functional', 0, '2024-01-23 04:35:55', '2024-01-23 04:35:55'),
(1040, 208, 1, 'S.1', 'The canteen/cafeteria is well-lighted, ventilated, screened and provided with potable water supply.', 0, '2024-01-23 04:37:28', '2024-01-23 04:37:28'),
(1041, 208, 1, 'S.2', 'There are enough;', 0, '2024-01-23 04:37:35', '2024-01-23 04:37:35'),
(1042, 208, 1, 'S.3', 'Wash area and toilets are available.', 0, '2024-01-23 04:38:59', '2024-01-23 04:38:59'),
(1043, 208, 3, 'I.1', 'The institution requires business and sanitary permits for the operation of the Food Center/Cafeteria/ Canteen.', 0, '2024-01-23 04:39:16', '2024-01-23 04:39:16'),
(1044, 208, 3, 'I.2', 'Food served is varied, nutritious, safe and sold at affordable price.', 0, '2024-01-23 04:39:25', '2024-01-23 04:39:25'),
(1045, 208, 3, 'I.3', 'The Food Center/ Cafeteria/Canteen is well-managed by qualified and competent staff.', 0, '2024-01-23 04:39:34', '2024-01-23 04:39:34'),
(1046, 208, 3, 'I.4', 'Cleanliness and orderliness are enforced.', 0, '2024-01-23 04:39:42', '2024-01-23 04:39:42'),
(1047, 208, 3, 'I.5', 'The food services are prompt.', 0, '2024-01-23 04:41:07', '2024-01-23 04:41:07'),
(1048, 208, 6, 'O.1', 'The Canteen/Cafeteria/Food Center is well-patronized.', 0, '2024-01-23 04:41:19', '2024-01-23 04:41:19'),
(1049, 208, 6, 'O.2', 'The food services generate income for the institution.', 0, '2024-01-23 04:41:29', '2024-01-23 04:41:29'),
(1050, 209, 1, 'S.1', 'The Accreditation Center (AC) is accessible and conveniently located.', 0, '2024-01-23 04:46:52', '2024-01-23 04:46:52'),
(1051, 209, 1, 'S.2', 'The AC has the following equipment and fixtures:', 0, '2024-01-23 04:47:03', '2024-01-23 04:47:03'),
(1052, 209, 3, 'I.1', 'The Institution/College/Academic Unit maintains the AC with the required resources, furniture, and documents.', 0, '2024-01-23 04:48:03', '2024-01-23 04:48:03'),
(1053, 209, 3, 'I.2', 'The AC is managed by a qualified and committed staff/faculty.', 0, '2024-01-23 04:48:10', '2024-01-23 04:48:10'),
(1054, 209, 3, 'I.3', 'Required documents/information and exhibits are updated, systematically packaged and readily available.', 0, '2024-01-23 04:48:21', '2024-01-23 04:48:21'),
(1055, 209, 6, 'O.1', 'The AC is well-equipped and managed.', 0, '2024-01-23 04:48:39', '2024-01-23 04:48:39'),
(1056, 210, 1, 'S.1', 'There are dormitories and housing facilities for students, faculty and staff.', 0, '2024-01-23 04:49:06', '2024-01-23 04:49:06'),
(1057, 210, 1, 'S.2', 'There is an Implementing Rules and Regulations (IRR) for in-campus housing services.', 0, '2024-01-23 04:49:15', '2024-01-23 04:49:15'),
(1058, 210, 1, 'S.3', 'There is a system of coordinating with LGU\'s on privately owned boarding houses.', 0, '2024-01-23 04:49:24', '2024-01-23 04:49:24'),
(1059, 210, 3, 'I.1', 'The housing facilities are functionally designed.', 0, '2024-01-23 04:49:39', '2024-01-23 04:49:39'),
(1060, 210, 3, 'I.2', 'The housing facilities and surroundings are properly maintained and monitored.', 0, '2024-01-23 04:49:45', '2024-01-23 04:49:45'),
(1061, 210, 3, 'I.3', 'The IRR on housing services is strictly followed (e.g. dormitory fees, etc.)', 0, '2024-01-23 04:49:53', '2024-01-23 04:49:53'),
(1062, 210, 3, 'I.4', 'The institution coordinates with LGU\'s and owners of private boarding houses.', 0, '2024-01-23 04:50:05', '2024-01-23 04:50:05'),
(1063, 210, 6, 'O.1', 'The housing facilities are safe, habitable and well-maintained.', 0, '2024-01-23 04:50:20', '2024-01-23 04:50:20'),
(1064, 210, 6, 'O.2', 'There is wholesome coordination among the Institution, the LGU\'s and the owners of private boarding houses.', 0, '2024-01-23 04:50:29', '2024-01-23 04:50:29'),
(1065, 76, 1, 'S.1', 'There is an approved and adequate budget for extension.', 0, '2024-01-23 04:51:20', '2024-01-23 04:51:20'),
(1066, 76, 1, 'S.2', 'There is a provision of:', 0, '2024-01-23 04:51:37', '2024-01-23 04:51:37'),
(1067, 76, 3, 'I.1', 'The budget for the extension program is utilized as planned.', 0, '2024-01-23 04:52:28', '2024-01-23 04:52:28'),
(1068, 76, 3, 'I.2', 'Honoraria and other incentives (deloading, credit unit equivalent, etc.) to faculty involved in extension work are granted.', 0, '2024-01-23 04:52:41', '2024-01-23 04:52:41'),
(1069, 76, 3, 'I.3', 'The College/Academic Unit of information Technology Education sources out the following from other agencies:', 0, '2024-01-23 04:52:55', '2024-01-23 04:52:55'),
(1070, 76, 6, 'O.1', 'The Extension Program is adequately funded.', 0, '2024-01-23 04:53:31', '2024-01-23 04:53:31'),
(1071, 82, 1, 'S.1', 'The organizational structure of the library is well-defined.', 0, '2024-01-23 04:55:04', '2024-01-23 04:55:04'),
(1072, 82, 1, 'S.2', 'The development of the library goals and objectives is the responsibility of the library head and staff with the approval of the Head of the Institution.', 0, '2024-01-23 04:55:12', '2024-01-23 04:55:12'),
(1073, 82, 1, 'S.3', 'There is a Library Board/Committee which sets library policies, rules and procedures and periodically reviews them.', 0, '2024-01-23 04:56:11', '2024-01-23 04:56:11'),
(1074, 82, 1, 'S.4', 'There is a duly approved and widely disseminated Library Manual or written policies and procedures covering the library’s Internal administration and operation.', 0, '2024-01-23 04:56:21', '2024-01-23 04:56:21'),
(1075, 82, 3, 'I.1', 'The library develops an explicit statement of Its goals and objectives in conformity with the mandate of the institution.', 0, '2024-01-23 04:56:33', '2024-01-23 04:56:33'),
(1076, 82, 3, 'I.2', 'The library Is administered and supervised by:', 0, '2024-01-23 04:56:41', '2024-01-23 04:56:41'),
(1077, 82, 3, 'I.3', 'The Head Librarian directs and supervises the total operation of the library and is responsible for the administration of Its resources and services.', 0, '2024-01-23 04:57:01', '2024-01-23 04:57:01'),
(1078, 82, 3, 'I.4', 'The Head Librarian, preferably with an academic rank, actively participates in the academic and administrative activities of the institution.', 0, '2024-01-23 04:57:14', '2024-01-23 04:57:14'),
(1079, 82, 3, 'I.5', 'The annual accomplishments and other reports of the library are promptly submitted to the higher offices concerned.', 0, '2024-01-23 04:57:25', '2024-01-23 04:57:25'),
(1080, 82, 3, 'I.6', 'A Library Development Plan is prepared in consultation with the institution’s officials and stakeholders.', 0, '2024-01-23 04:57:35', '2024-01-23 04:57:35'),
(1081, 82, 6, 'O.1', 'The goals and objectives of the library are satisfactorily attained.', 0, '2024-01-23 04:57:47', '2024-01-23 04:57:47'),
(1082, 82, 6, 'O.2', 'The library organizational structure is well-designed and effectively implemented.', 0, '2024-01-23 04:57:57', '2024-01-23 04:57:57'),
(1083, 83, 1, 'S.1', 'The library has staff with the following qualifications:', 0, '2024-01-23 04:58:11', '2024-01-23 04:58:11'),
(1084, 83, 1, 'S.2', 'The library meets the required number of qualified and licensed librarians and staff to meet the needs of the school population with the ratio of:', 0, '2024-01-23 04:58:39', '2024-01-23 04:58:39'),
(1085, 83, 1, 'S.3', 'There is a continuing staff development program with the corresponding financial assistance from the institution.', 0, '2024-01-23 04:59:07', '2024-01-23 04:59:07'),
(1086, 83, 3, 'I.1', 'The library staff compensation, retirement, and fringe benefits, as well as other privileges, are granted in accordance with existing government laws and institutional policies.', 0, '2024-01-23 04:59:17', '2024-01-23 04:59:17'),
(1087, 83, 6, 'O.1', 'The librarians are qualified.', 0, '2024-01-23 04:59:26', '2024-01-23 04:59:26'),
(1088, 84, 1, 'S.1', 'There is a written Collection Development Policy.', 0, '2024-01-23 04:59:38', '2024-01-23 04:59:38'),
(1089, 84, 1, 'S.2', 'There is a core collection of at least:', 0, '2024-01-23 04:59:55', '2024-01-23 04:59:55'),
(1090, 84, 1, 'S.3', 'Twenty percent (20%) at the library holdings are of current edition, Le. With copyright within the last 5 years.', 0, '2024-01-23 05:00:12', '2024-01-23 05:00:12'),
(1091, 84, 1, 'S.4', 'The Non-print, digital and electronic resources are available.', 0, '2024-01-23 05:00:20', '2024-01-23 05:00:20'),
(1092, 84, 1, 'S.5', 'There Is an integrated library system.', 0, '2024-01-23 05:00:30', '2024-01-23 05:00:30'),
(1093, 84, 1, 'S.6', 'There are provisions for the preservation, general care, and upkeep of library resources.', 0, '2024-01-23 05:00:40', '2024-01-23 05:00:40'),
(1094, 84, 3, 'I.1', 'The Collection Development Policy is regularly reviewed and evaluated by the Library Committee.', 0, '2024-01-23 05:00:57', '2024-01-23 05:00:57'),
(1095, 84, 3, 'I.2', 'The library collection and services support the mission and vision of the Institution, goals of the College/Academic Unit and objectives of the Program.', 0, '2024-01-23 05:01:05', '2024-01-23 05:01:05'),
(1096, 84, 3, 'I.3', 'The library provides sufficient research books and materials to supplement the clients’ curricular needs.', 0, '2024-01-23 05:01:13', '2024-01-23 05:01:13'),
(1097, 84, 3, 'I.4', 'library maintains an extensive (15% of the total) Filipiniana collection.', 0, '2024-01-23 05:01:23', '2024-01-23 05:01:23'),
(1098, 84, 3, 'I.5', 'The library provides 3-5 book/journal titles for professional subjects in the major fields of specialization.', 0, '2024-01-23 05:01:30', '2024-01-23 05:01:30'),
(1099, 84, 3, 'I.6', 'The library collection is organized according to an accepted scheme of classification and standard code of cataloguing.', 0, '2024-01-23 05:01:39', '2024-01-23 05:01:39'),
(1100, 84, 3, 'I.7', 'Regular weeding- out program is conducted to maintain a relevant and updated collection', 0, '2024-01-23 05:01:49', '2024-01-23 05:01:49'),
(1101, 84, 3, 'I.8', 'The quality and quantity of library materials and resources conform with the standards set for a particular academic program.', 0, '2024-01-23 05:01:59', '2024-01-23 05:01:59'),
(1102, 84, 6, 'O.1', 'The library core collection Is adequate, updated and well-balanced.', 0, '2024-01-23 05:02:13', '2024-01-23 05:02:13'),
(1103, 84, 6, '0.2', 'The professional books, journals and electronic resources for the program are sufficient.', 0, '2024-01-23 05:02:24', '2024-01-23 05:02:24'),
(1104, 85, 1, 'S.1', 'The library has information services pertinent to the Institution’s requirements.', 0, '2024-01-23 05:02:37', '2024-01-23 05:02:37'),
(1105, 85, 3, 'I.1', 'The following services/programs are provided:', 0, '2024-01-23 05:02:47', '2024-01-23 05:02:47'),
(1106, 85, 3, 'I.2', 'The library opens at least 54 hours per week far the College/Academic Unit or 60 hours per week for the Institution.', 0, '2024-01-23 05:04:58', '2024-01-23 05:04:58'),
(1107, 85, 3, 'I.3', 'The Ebrary promotes and disseminates its program through a regular announcement of its new acquisitions of print materials (books, Journals, magazines), resources, facilities, and services.', 0, '2024-01-23 05:05:07', '2024-01-23 05:05:07'),
(1108, 85, 3, 'I.4', 'Librarians and staff are available during library hours to assist and provide library services.', 0, '2024-01-23 05:05:30', '2024-01-23 05:05:30'),
(1109, 85, 3, 'I.5', 'Statistical data on the utilization of various resources and services are compiled and used to improve the library collection and operations.', 0, '2024-01-23 05:06:19', '2024-01-23 05:06:19'),
(1110, 85, 6, 'O.1', 'The library services are efficiently and effectively provided.', 0, '2024-01-23 05:06:29', '2024-01-23 05:06:29'),
(1111, 85, 6, 'O.2', 'The library users are satisfied with library services.', 0, '2024-01-23 05:06:40', '2024-01-23 05:06:40'),
(1112, 86, 1, 'S.1', 'The library is strategically located and accessible to students, faculty and other clientele.', 0, '2024-01-23 05:07:02', '2024-01-23 05:07:02'),
(1113, 86, 1, 'S.2', 'The library systematically planned to allow future expansion. Space Requirement', 0, '2024-01-23 05:07:10', '2024-01-23 05:07:10'),
(1114, 86, 1, 'S.3', 'The size the library meets standard requirements considering the present enrolment and future expansion.', 0, '2024-01-23 05:07:21', '2024-01-23 05:07:21'),
(1115, 86, 1, 'S.4', 'The reading room can accommodate at least 10% of the school enrolment at any given time.', 0, '2024-01-23 05:07:30', '2024-01-23 05:07:30'),
(1116, 86, 1, 'S.5', 'Space is provided for print resources as well as work stations for electronic resources.', 0, '2024-01-23 05:07:40', '2024-01-23 05:07:40'),
(1117, 86, 1, 'S.6', 'Space Is provided for the librarians’ office, staff room, technical room, etc.', 0, '2024-01-23 05:07:48', '2024-01-23 05:07:48'),
(1118, 86, 1, 'S.7', 'Ramps for the physically disabled are provided.', 0, '2024-01-23 05:07:57', '2024-01-23 05:07:57'),
(1119, 86, 1, 'S.8', 'The library meets the required and standard-sized furniture and equipment.', 0, '2024-01-23 05:08:12', '2024-01-23 05:08:12'),
(1120, 86, 1, 'S.9', 'The following library furniture and equipment are available:', 0, '2024-01-23 05:08:20', '2024-01-23 05:08:20'),
(1121, 86, 1, 'S.10', 'The library is well lighted.', 0, '2024-01-23 05:10:39', '2024-01-23 05:10:39'),
(1122, 86, 1, 'S.11', 'The library is well-ventilated', 0, '2024-01-23 05:10:52', '2024-01-23 05:10:52'),
(1123, 86, 1, 'S.12', 'The atmosphere is conducive to learning. Security/Control', 0, '2024-01-23 05:11:00', '2024-01-23 05:11:00'),
(1124, 86, 1, 'S.13', 'Fire extinguishers and a local fire alarm system are available.', 0, '2024-01-23 05:11:10', '2024-01-23 05:11:10'),
(1125, 86, 1, 'S.14', 'The library employs a system for security and control of library resources.', 0, '2024-01-23 05:11:21', '2024-01-23 05:11:21'),
(1126, 86, 3, 'I.1', 'IT software and multi-media equipment are utilized.', 0, '2024-01-23 05:11:52', '2024-01-23 05:11:52'),
(1127, 86, 6, 'O.1', 'The environment in the library is conducive to learning.', 0, '2024-01-23 05:12:02', '2024-01-23 05:12:02'),
(1128, 86, 6, 'O.2', 'The library facilities are well-maintained and aesthetically designed.', 0, '2024-01-23 05:12:11', '2024-01-23 05:12:11'),
(1129, 87, 1, 'S.1', 'The institution has a regular and realistic budget for the library.', 0, '2024-01-23 05:12:36', '2024-01-23 05:12:36'),
(1130, 87, 3, 'I.1', 'The Head Librarian and staff, in coordination with other officials of the Institution, prepare and manage the annual library budget.', 0, '2024-01-23 05:12:47', '2024-01-23 05:12:47'),
(1131, 87, 3, 'I.2', 'All fees and funds allocated for library resources and services are utilized solely for such purposes and are properly audited.', 0, '2024-01-23 05:12:56', '2024-01-23 05:12:56'),
(1132, 87, 3, 'I.3', 'Other sources of financial assistance are sought.', 0, '2024-01-23 05:13:07', '2024-01-23 05:13:07'),
(1133, 87, 6, 'O.1', 'The financial support from fiduciary, supplemental and external funds is adequate.', 0, '2024-01-23 05:14:28', '2024-01-23 05:14:28'),
(1134, 88, 1, 'S.1', 'The library is on the mailing list of agencies, foundations, etc., for exchange of publications and other books and journals donations.', 0, '2024-01-23 05:15:18', '2024-01-23 05:15:18'),
(1135, 88, 3, 'I.1', 'Unkages with other institutions and funding agencies are explored and established for purposes enhancing library facilities and resources.', 0, '2024-01-23 05:15:28', '2024-01-23 05:15:28'),
(1136, 88, 3, 'I.2', 'The library establishes consortia, networking and resource sharing with other institutions and library collaborative activities.', 0, '2024-01-23 05:15:38', '2024-01-23 05:15:38'),
(1137, 88, 6, 'O.1', 'Library resource sharing and linkages are well-established', 0, '2024-01-23 05:17:24', '2024-01-23 05:17:24'),
(1138, 211, 1, 'S.1', 'The institution has an organizational structure approved by the Boardof Regents/Trustees (BOR/BOT).', 0, '2024-01-24 05:42:13', '2024-01-24 05:42:13'),
(1139, 211, 1, 'S.2', 'Every office/unit in the organizational structure has functions approved by the BOR/BOT.', 0, '2024-01-24 05:42:24', '2024-01-24 05:42:24'),
(1140, 211, 3, 'I.1', 'The institution is subdivided into administrative units in accordance with the organizational structure.', 0, '2024-01-24 05:42:31', '2024-01-24 05:42:53'),
(1141, 211, 3, 'I.2', 'The functions, duties and responsibilities of the administrative personnel/staff in each unit/office are identified and carried out.', 0, '2024-01-24 05:42:44', '2024-01-24 05:42:44'),
(1142, 211, 3, 'I.3', 'The Board of Regents/Trustees is supportive with the growth and development of the institution.', 0, '2024-01-24 05:43:04', '2024-01-24 05:43:04'),
(1143, 211, 3, 'I.4', 'The Academic and Administrative Councils exercise their powers and perform their functions.', 0, '2024-01-24 05:43:14', '2024-01-24 05:43:14'),
(1144, 211, 3, 'I.5', 'The flow of communication among and within units/departments is observed.', 0, '2024-01-24 05:43:23', '2024-01-24 05:43:23'),
(1145, 211, 6, 'O.1', 'The institution has a well-designed and functional organizational structure.', 0, '2024-01-24 05:44:03', '2024-01-24 05:44:03'),
(1146, 212, 1, 'S.1', 'The Dean/Academic Unit Head possesses the required educational qualification, experience and other prescribed requirements needed to administer the College/Academic Unit, as follows:', 0, '2024-01-24 05:44:19', '2024-01-24 05:44:19'),
(1147, 212, 1, 'S.2', 'The Department Chair/s or their equivalent has appropriate/relevant educational qualification and experience.', 0, '2024-01-24 05:45:31', '2024-01-24 05:45:31'),
(1148, 212, 3, 'I.1', 'The Dean is assisted by Department Chairs or their equivalent with appropriate/relevant educational qualification and experience as follows:', 0, '2024-01-24 05:45:40', '2024-01-24 05:45:40'),
(1149, 212, 3, 'I.2', 'The Dean implements a supervisory program.', 0, '2024-01-24 05:47:59', '2024-01-24 05:47:59'),
(1150, 212, 3, 'I.3', 'The Dean participates in the recruitment and promotion of faculty and staff.', 0, '2024-01-24 05:48:08', '2024-01-24 05:48:08');
INSERT INTO `indicators` (`id`, `parameter_id`, `indicator_category_id`, `indicator_name`, `indicator_desc`, `isOptional`, `created_at`, `updated_at`) VALUES
(1151, 212, 3, 'I.4', 'The Dean, the faculty and the administration work together for the improvement of the College/Academic Unit particularly in:', 0, '2024-01-24 05:48:17', '2024-01-24 05:48:17'),
(1152, 212, 3, 'I.5', 'Definite criteria and procedures in the selection and promotion of the most qualified faculty and staff are observed.', 0, '2024-01-24 05:53:13', '2024-01-24 05:53:13'),
(1153, 212, 3, 'I.6', 'The Dean, faculty, staff, and students pursue collaborative activities in generating resources and income and in implementing cost-effective measures.', 0, '2024-01-24 05:53:23', '2024-01-24 05:53:23'),
(1154, 212, 3, 'I.7', 'The Dean implements policies and procedures on internal administration and operations of the College/Academic Unit.', 0, '2024-01-24 06:14:26', '2024-01-24 06:14:26'),
(1155, 212, 6, 'O.1', 'The College/Academic Unit is efficiently and effectively managed.', 0, '2024-01-24 06:14:35', '2024-01-24 06:14:35'),
(1156, 213, 1, 'S.1', 'The institution has an approved and printed Student Handbook/Manual containing policies and guidelines on the following aspects of student life:', 0, '2024-01-24 06:17:59', '2024-01-24 06:17:59'),
(1157, 213, 3, 'I.1', 'Students are provided opportunities to participate in the planning and implementation of activities concerning their welfare.', 0, '2024-01-24 06:20:24', '2024-01-24 06:20:24'),
(1158, 213, 3, 'I.2', 'Concerned officials, faculty and staff act promptly on requests, needs, and problems of the students.', 0, '2024-01-24 06:20:36', '2024-01-24 06:20:36'),
(1159, 213, 3, 'I.3', 'The administration, faculty, staff and students work harmoniously and maintain good relationship.', 0, '2024-01-24 06:20:47', '2024-01-24 06:20:47'),
(1160, 213, 6, 'O.1', 'The institution has an effective and functional Student Administration.', 0, '2024-01-24 06:29:06', '2024-01-24 06:29:06'),
(1161, 213, 6, 'O.2', 'Policy implementation is efficient.', 0, '2024-01-24 06:29:16', '2024-01-24 06:29:16'),
(1162, 214, 1, 'S.1', 'The institution has an approved Financial Development Plan (FDP)', 0, '2024-01-24 06:32:46', '2024-01-24 06:32:46'),
(1163, 214, 1, 'S.2', 'The approved budget is in consonance with the FDP.', 0, '2024-01-24 06:32:55', '2024-01-24 06:32:55'),
(1164, 214, 1, 'S.3', 'The institution has specific budgetary allotment for the following:', 0, '2024-01-24 06:33:04', '2024-01-24 06:33:04'),
(1165, 214, 3, 'I.1', 'The institution maintains a Financial Management Office managed by qualified and competent personnel.', 0, '2024-01-24 06:33:37', '2024-01-24 06:33:37'),
(1166, 214, 3, 'I.2', 'The financial management personnel are responsible for the efficient management of financial resources/funds of the institution.', 0, '2024-01-24 06:33:49', '2024-01-24 06:33:49'),
(1167, 214, 3, 'I.3', 'The administrative, faculty staff and student representatives participate in the budget preparation and in the procurement program of the institution.', 0, '2024-01-24 06:33:58', '2024-01-24 06:33:58'),
(1168, 214, 3, 'I.4', 'The budget of the institution is fairly and objectively allocated.', 0, '2024-01-24 06:34:07', '2024-01-24 06:34:15'),
(1169, 214, 3, 'I.5', 'The institution allocates funds for the following student services and activities:', 0, '2024-01-24 06:34:26', '2024-01-24 06:34:26'),
(1170, 214, 3, 'I.6', 'The budget for specific expenditures indicated in itern 1.5 is allotted in consonance with existing policies and guidelines.', 0, '2024-01-24 06:36:16', '2024-01-24 06:36:16'),
(1171, 214, 6, 'O.1', 'The Institution has a sound and effective financial management system.', 0, '2024-01-24 06:36:33', '2024-01-24 06:36:33'),
(1172, 215, 1, 'S.1', 'The institution has an approved procurement management system in consonance with the Revised IRR of RA 9184 (Government Procurement Reform Act).', 0, '2024-01-24 06:36:52', '2024-01-24 06:36:52'),
(1173, 215, 1, 'S.2', 'The institution has a system for proper disposal on non-serviceable and condemned equipment, supplies and materials.', 0, '2024-01-24 06:37:00', '2024-01-24 06:37:00'),
(1174, 215, 1, 'S.3', 'The office has a storeroom for keeping and securing all equipment, supplies and materials purchased.', 0, '2024-01-24 06:37:08', '2024-01-24 06:37:08'),
(1175, 215, 3, 'I.1', 'The institution maintains a Supply Management Office (SMO) managed by qualified staff with specific functions and responsibilities.', 0, '2024-01-24 06:48:11', '2024-01-24 06:48:11'),
(1176, 215, 3, 'I.2', 'The Bids and awards Committee (BAC) is responsible for the procurement and deliveries of needed equipment, supplies and materials in accordance with the approved Annual Procurement Plan (APP) and Project Procurement Management Plan (PPMP).', 0, '2024-01-24 06:48:21', '2024-01-24 06:48:21'),
(1177, 215, 3, 'I.3', 'The BAC perform its tasks and responsibilities in accordance with recent procurement policies and official issuances.', 0, '2024-01-24 06:48:31', '2024-01-24 06:48:31'),
(1178, 215, 3, 'I.4', 'The SMO prepares, evaluates, and submits the annual inventory of serviceable and non-serviceable facilities and equipment.', 0, '2024-01-24 06:48:41', '2024-01-24 06:48:41'),
(1179, 215, 3, 'I.5', 'I.5. All approved requests for procurement are published with the Philippine Government Electronic Procurement System (PhilGEPS).', 0, '2024-01-24 06:49:50', '2024-01-24 06:49:50'),
(1180, 215, 6, 'O.1', 'The institution has an efficient and effective Supply Management System.', 0, '2024-01-24 06:50:01', '2024-01-24 06:50:01'),
(1181, 215, 6, 'O.2', 'All procurement transactions are transparent.', 0, '2024-01-24 06:50:10', '2024-01-24 06:50:10'),
(1182, 216, 1, 'S.1', 'The institution has a system of records keeping.', 0, '2024-01-24 06:50:27', '2024-01-24 06:50:27'),
(1183, 216, 1, 'S.2', 'The institution has policies and procedures to ensure the security and confidentiality of records.', 0, '2024-01-24 06:50:36', '2024-01-24 06:50:36'),
(1184, 216, 1, 'S.3', 'Policies and procedures on prompt release of records are in place.', 0, '2024-01-24 06:50:44', '2024-01-24 06:50:44'),
(1185, 216, 3, 'I.1', 'The institution maintains a Records Management Office (RMO) managed by a qualified Records Officer.', 0, '2024-01-24 06:50:53', '2024-01-24 06:50:53'),
(1186, 216, 3, 'I.2', 'A records system is installed in offices where it allows easy access to information needed by concerned parties.', 0, '2024-01-24 06:51:01', '2024-01-24 06:51:01'),
(1187, 216, 3, 'I.3', 'The Human Resource Management Office (HRMO) maintains accurate, up-to-date and systematic records of faculty and staff.', 0, '2024-01-24 06:51:08', '2024-01-24 06:51:08'),
(1188, 216, 3, 'I.4', 'The following updated record compilations are made available to concerned parties:', 0, '2024-01-24 06:51:17', '2024-01-24 06:51:17'),
(1189, 216, 6, 'O.1', 'The institution has a commendable Records Management System.', 0, '2024-01-24 06:53:14', '2024-01-24 06:53:14'),
(1190, 217, 1, 'S.1', 'The institution has an approved Strategic Development Plan (SDP) available in printed and/or electronic forms.', 0, '2024-01-24 07:01:31', '2024-01-24 07:01:31'),
(1191, 217, 1, 'S.2', 'There is a system of monitoring the implementation of the (SDP).', 0, '2024-01-24 07:01:40', '2024-01-24 07:01:40'),
(1192, 217, 3, 'I.1', 'The institution\'s Planning and Development Unit plans, monitors and evaluates planned activities/targets.', 0, '2024-01-24 07:01:49', '2024-01-24 07:02:08'),
(1193, 217, 3, 'I.2', 'The planning process is a cooperative and participative endeavor of the administration, the faculty staff and the students.', 0, '2024-01-24 07:01:58', '2024-01-24 07:01:58'),
(1194, 217, 3, 'I.3', 'The SDP is implemented, monitored, evaluated, reviewed and updated regularly.', 0, '2024-01-24 07:02:18', '2024-01-24 07:02:18'),
(1195, 217, 6, 'O.1', 'The SDP is congruent with the VMGO as well as with the local, regional and national development goals and agenda.', 0, '2024-01-24 07:02:30', '2024-01-24 07:02:30'),
(1196, 218, 1, 'S.1', 'The institution has an approved performance evaluation system for administrative personnel which includes the following items:', 0, '2024-01-24 07:02:44', '2024-01-24 07:02:44'),
(1197, 218, 3, 'I.1', 'The institution regularly monitors and evaluates the performance of the administrative personnel.', 0, '2024-01-24 07:03:26', '2024-01-24 07:03:26'),
(1198, 218, 3, 'I.2', 'The results of performance evaluation of the administrative personnel are utilized:', 0, '2024-01-24 07:03:35', '2024-01-24 07:03:35'),
(1199, 218, 6, 'O.1', 'The administrative personnel/staff have commendable performance.', 0, '2024-01-24 07:03:59', '2024-01-24 07:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `indicator_backup_file`
--

CREATE TABLE `indicator_backup_file` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `screen_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_location` text NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `indicator_backup_file`
--

INSERT INTO `indicator_backup_file` (`id`, `user_id`, `file_id`, `file_name`, `screen_name`, `file_type`, `file_location`, `type`, `created_at`, `updated_at`) VALUES
(10, 37, 36, '8eee01a8-3487-4178-a75f-5a1f535621da.jpg', 'AARON', 'jpg', 'storage/files/8eee01a8-3487-4178-a75f-5a1f535621da.jpg', 1, '2024-01-22 03:21:43', '2024-01-22 03:22:18');

-- --------------------------------------------------------

--
-- Table structure for table `indicator_categories`
--

CREATE TABLE `indicator_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `forOld` smallint(6) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `indicator_categories`
--

INSERT INTO `indicator_categories` (`id`, `category_name`, `forOld`, `created_at`, `updated_at`) VALUES
(1, 'SYSTEM - INPUTS AND PROCESSES', 1, '2023-09-24 04:08:15', '2023-09-24 04:08:15'),
(3, 'IMPLEMENTATION', 1, '2023-09-24 04:08:22', '2023-12-05 21:01:17'),
(6, 'OUTCOME/S', 1, '2023-12-05 21:01:40', '2023-12-05 21:01:40'),
(7, 'NOT APPLICABLE', 0, '2024-01-16 02:19:43', '2024-01-16 02:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `indicator_files`
--

CREATE TABLE `indicator_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `indicator_id` bigint(20) UNSIGNED NOT NULL,
  `screen_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_location` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `indicator_files`
--

INSERT INTO `indicator_files` (`id`, `user_id`, `accreditation_id`, `parameter_id`, `indicator_id`, `screen_name`, `file_name`, `file_type`, `file_location`, `status`, `created_at`, `updated_at`) VALUES
(35, 37, 31, 49, 45, 'ERROL', '58497018-43b5-4431-b459-cd05a68eb10b.JPG', 'jpg', 'storage/files/58497018-43b5-4431-b459-cd05a68eb10b.JPG', 'checked', '2024-01-21 19:20:42', '2024-01-23 05:49:10'),
(36, 37, 31, 49, 45, 'GIL', '4a262d5f-e47a-4169-835e-152d4a86bbaf.pdf', 'pdf', 'storage/files/4a262d5f-e47a-4169-835e-152d4a86bbaf.pdf', 'checked', '2024-01-21 19:20:51', '2024-01-21 19:22:52'),
(37, 37, 31, 49, 46, 'HAHA', '0a5f084a-4982-4b7f-9066-34ff4c221fd1.JPG', 'jpg', 'storage/files/0a5f084a-4982-4b7f-9066-34ff4c221fd1.JPG', 'pending', '2024-01-21 19:23:31', '2024-01-21 19:23:31'),
(38, 37, 31, 49, 47, 'OKAY', '6ffcee28-9167-4ce5-92d9-cb3d90289bee.png', 'png', 'storage/files/6ffcee28-9167-4ce5-92d9-cb3d90289bee.png', 'pending', '2024-01-21 19:23:46', '2024-01-21 19:23:46'),
(39, 37, 31, 49, 48, 'POGI', 'd206ccab-e921-42f5-9b1b-cdf8a392dfd2.JPG', 'jpg', 'storage/files/d206ccab-e921-42f5-9b1b-cdf8a392dfd2.JPG', 'pending', '2024-01-21 19:24:00', '2024-01-21 19:24:00'),
(40, 37, 31, 49, 50, 'DFGHJ', 'f198a7a2-d691-4dcc-a080-186bfea8932a.JPG', 'jpg', 'storage/files/f198a7a2-d691-4dcc-a080-186bfea8932a.JPG', 'pending', '2024-01-21 19:25:36', '2024-01-21 19:25:36'),
(41, 37, 31, 49, 51, 'FGVHBJNK', '0fe593d5-702c-48d0-a44d-7dc029fe5392.JPG', 'jpg', 'storage/files/0fe593d5-702c-48d0-a44d-7dc029fe5392.JPG', 'pending', '2024-01-21 19:25:47', '2024-01-21 19:25:47'),
(42, 37, 31, 49, 52, 'DRTFYGHUBJNK', '608605f3-89d9-4df2-bd33-8095890f30aa.JPG', 'jpg', 'storage/files/608605f3-89d9-4df2-bd33-8095890f30aa.JPG', 'pending', '2024-01-21 19:26:04', '2024-01-21 19:26:04'),
(43, 37, 31, 49, 53, 'FHBJNK', 'ceda2065-6938-4864-9963-7fb930e3b51d.pdf', 'pdf', 'storage/files/ceda2065-6938-4864-9963-7fb930e3b51d.pdf', 'checked', '2024-01-21 19:26:22', '2024-01-21 19:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `indicator_messages`
--

CREATE TABLE `indicator_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `indicator_file_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instruments`
--

CREATE TABLE `instruments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_instrument_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `isLevel_1` smallint(6) NOT NULL DEFAULT 0,
  `isLevel_2` smallint(6) NOT NULL DEFAULT 0,
  `isLevel_3` smallint(6) NOT NULL DEFAULT 0,
  `isLevel_4` smallint(6) NOT NULL DEFAULT 0,
  `instrument_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instruments`
--

INSERT INTO `instruments` (`id`, `program_instrument_id`, `name`, `isLevel_1`, `isLevel_2`, `isLevel_3`, `isLevel_4`, `instrument_type`, `created_at`, `updated_at`) VALUES
(21, 1, 'IT Instrument for level 1 and 2 Old', 1, 1, 0, 0, 'Old', '2024-01-10 03:56:12', '2024-01-18 00:50:54'),
(23, 1, 'IT Instrument for level 3 and 4 Old', 0, 0, 1, 1, 'Old', '2024-01-11 03:29:07', '2024-01-18 00:51:01'),
(26, 1, 'IT Instrument for level 3 and 4 New', 0, 0, 1, 1, 'New', '2024-01-11 03:29:54', '2024-01-18 00:51:07'),
(30, 1, 'IT Instrument for PSV', 0, 0, 0, 0, 'PSV', '2024-01-12 06:35:14', '2024-01-18 00:51:13'),
(31, 2, 'CE PSV instrument', 0, 0, 0, 0, 'PSV', '2024-01-21 05:54:46', '2024-01-21 06:00:49');

-- --------------------------------------------------------

--
-- Table structure for table `internal_ratings`
--

CREATE TABLE `internal_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `indicator_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `rating` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `internal_ratings`
--

INSERT INTO `internal_ratings` (`id`, `user_id`, `parameter_id`, `indicator_id`, `accreditation_id`, `rating`, `created_at`, `updated_at`) VALUES
(686, 3, 49, 45, 31, 4.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(687, 3, 49, 46, 31, 4.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(688, 3, 49, 47, 31, 4.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(689, 3, 49, 48, 31, 4.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(690, 3, 49, 49, 31, 1.67, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(691, 3, 49, 50, 31, 1.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(692, 3, 49, 51, 31, 1.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(693, 3, 49, 52, 31, 1.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(694, 3, 49, 53, 31, 5.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(703, 3, 50, 54, 31, 1.00, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(704, 3, 50, 55, 31, 1.00, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(705, 3, 50, 56, 31, 1.00, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(706, 3, 50, 57, 31, 1.00, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(707, 3, 50, 58, 31, NULL, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(708, 3, 50, 59, 31, 1.00, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(709, 3, 50, 60, 31, NULL, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(710, 3, 50, 61, 31, NULL, '2024-01-21 19:33:04', '2024-01-21 19:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `internal_sub_component_ratings`
--

CREATE TABLE `internal_sub_component_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `sub_component_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `rating` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `internal_sub_ratings`
--

CREATE TABLE `internal_sub_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `sub_indicator_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `rating` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `internal_sub_ratings`
--

INSERT INTO `internal_sub_ratings` (`id`, `user_id`, `parameter_id`, `sub_indicator_id`, `accreditation_id`, `rating`, `created_at`, `updated_at`) VALUES
(595, 3, 49, 15, 31, 1.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(596, 3, 49, 16, 31, 1.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(597, 3, 49, 17, 31, 1.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(598, 3, 49, 18, 31, 1.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(599, 3, 49, 19, 31, 1.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(600, 3, 49, 20, 31, 5.00, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(611, 3, 50, 21, 31, 1.00, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(612, 3, 50, 22, 31, 1.00, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(613, 3, 50, 23, 31, 1.00, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(614, 3, 50, 24, 31, 1.00, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(615, 3, 50, 25, 31, NULL, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(616, 3, 50, 26, 31, NULL, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(617, 3, 50, 27, 31, NULL, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(618, 3, 50, 28, 31, NULL, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(619, 3, 50, 29, 31, NULL, '2024-01-21 19:33:04', '2024-01-21 19:33:04'),
(620, 3, 50, 30, 31, NULL, '2024-01-21 19:33:04', '2024-01-21 19:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `isCoordinator` smallint(6) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(20, '2014_10_12_100000_create_password_resets_table', 1),
(21, '2019_08_19_000000_create_failed_jobs_table', 1),
(22, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(23, '2023_08_26_084039_create_campuses_table', 1),
(24, '2023_08_26_170357_create_programs_table', 1),
(30, '2023_09_04_142539_create_program_levels_table', 1),
(31, '2023_09_05_160328_create_accreditations_table', 1),
(32, '2023_09_09_161243_create_users_table', 1),
(33, '2023_09_09_161244_create_members_table', 1),
(39, '2023_09_18_152745_create_members_table', 2),
(40, '2023_09_19_130322_create_members_table', 3),
(42, '2023_08_28_104004_create_instruments_table', 4),
(43, '2023_09_18_080301_create_roles_table', 4),
(46, '2023_08_28_104005_create_areas_table', 5),
(47, '2023_08_29_103715_create_parameters_table', 5),
(48, '2023_08_30_063310_create_indicator_categories_table', 5),
(49, '2023_08_30_063311_create_indicators_table', 5),
(50, '2023_09_01_144427_create_sub_indicators_table', 5),
(51, '2023_09_11_010942_create_sub_indicator_components_table', 5),
(53, '2023_09_13_160229_create_sub_indicator_files_table', 5),
(54, '2023_09_13_160404_create_sub_component_files_table', 5),
(55, '2023_09_21_143706_create_area_members_table', 6),
(56, '2023_09_23_163030_create_accreditation_areas_table', 7),
(57, '2023_09_13_155907_create_indicator_files_table', 8),
(58, '2023_10_15_151316_create_indicator_messages_table', 9),
(68, '2023_11_27_122651_create_external_ratings_table', 10),
(69, '2023_11_27_142643_create_external_sub_ratings_table', 10),
(70, '2023_11_27_152004_create_external_sub_component_ratings_table', 10),
(71, '2023_11_27_163224_create_sub_indicator_messages_table', 10),
(72, '2023_11_28_030453_create_sub_component_messages_table', 10),
(73, '2023_11_29_043736_create_internal_ratings_table', 10),
(74, '2023_11_29_044057_create_internal_sub_ratings_table', 10),
(75, '2023_11_29_044129_create_internal_sub_component_ratings_table', 10),
(76, '2023_12_04_162232_create_designated_accreditor_areas_table', 11),
(77, '2023_12_06_032237_create_area_programs_table', 12),
(78, '2023_12_08_185345_create_notifications_table', 13),
(79, '2023_12_14_112921_create_compliance_report_files_table', 14),
(80, '2024_01_14_051925_create_area_ratings_table', 15),
(81, '2024_01_14_151916_create_parameter_reports_table', 16),
(82, '2023_08_26_084038_create_universities_table', 17),
(83, '2023_08_28_104003_create_program_instruments_table', 18),
(84, '2024_01_13_081058_create_parameter_ratings_table', 19),
(85, '2024_01_18_110230_create_criterias_table', 20),
(86, '2024_01_18_144117_create_criteria_files_table', 20),
(87, '2024_01_18_150742_create_criteria_messages_table', 21),
(88, '2024_01_19_001306_create_criteria_ratings_table', 22);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('015c81c0-e1c3-4095-a894-06f6504b4889', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the Urdaneta IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/26\"}', '2024-01-17 07:58:49', '2024-01-17 07:30:57', '2024-01-17 07:58:49'),
('0199a35c-47e9-4d4a-85ba-f24ae982ac90', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and objectives as member for the Asingan IT Accreditation 2024\",\"title\":\"Admin admin has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-20 21:50:20', '2024-01-20 21:49:59', '2024-01-20 21:50:20'),
('01f7f542-7de2-4a83-8e02-df00fa1a71f0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 25, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and Objectives as external for the CE ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the CE ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/30\"}', NULL, '2024-01-21 06:52:01', '2024-01-21 06:52:01'),
('027a04a4-0335-46c8-9fe5-02fe6b177340', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 11, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:33:37', '2024-01-15 03:33:37'),
('03e415fa-0a7a-46fc-b869-bcbffc0f3a49', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-12 09:46:53', '2024-01-12 09:15:05', '2024-01-12 09:46:53'),
('04491be8-c2ad-4424-8a34-864a3ca3c476', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-18 01:51:00', '2024-01-18 01:51:00'),
('0472ebed-0c6c-4228-8eac-220a78c1590e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/28\"}', '2024-01-18 08:20:19', '2024-01-18 08:06:40', '2024-01-18 08:20:19'),
('051cf128-f198-4818-8ca8-9875f641a877', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:37:13', '2024-01-17 09:37:13'),
('06a8dec4-be58-4e5e-ab88-f2227d4aeb08', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added and assigned to Area 2: Faculty as internal for the CE ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the CE ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/30\"}', NULL, '2024-01-21 06:35:43', '2024-01-21 06:35:43'),
('077da55f-2068-4196-994c-780e99c5ecf3', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"Notice! You Have been removed for the IT ACCREDITATION 2023\",\"url\":\"\"}', '2024-01-18 16:00:03', '2024-01-18 15:59:48', '2024-01-18 16:00:03'),
('0887af88-f771-4ab4-9f76-b8f35f464e61', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-20 21:44:27', '2024-01-17 09:14:30', '2024-01-20 21:44:27'),
('08ba5508-b9e3-449d-a325-9926c660edd4', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 7: Library as internal for the Asingan IT Accreditation 2024\",\"title\":\"Gil Lopez III has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-21 01:17:43', '2024-01-20 23:51:52', '2024-01-21 01:17:43'),
('09b7a7cb-ed0e-41a1-90cd-c70be87c2886', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the Asingan IT Accreditation 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-18 09:36:53', '2024-01-18 08:23:08', '2024-01-18 09:36:53'),
('0b30d12c-5bb0-4a6c-ba7e-cd663f0e2f7c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:33:37', '2024-01-15 03:33:37'),
('0e993e64-5ea9-4702-aa31-16ed5c2f931d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/7\"}', '2024-01-13 23:58:58', '2023-12-21 06:27:07', '2024-01-13 23:58:58'),
('0e9bf454-918c-4148-a966-c6ae70f12630', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 12, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', NULL, '2024-01-15 04:01:21', '2024-01-15 04:01:21'),
('0ee1fa8b-6a73-44ac-bbe4-33d942d059db', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-18 08:20:19', '2024-01-17 10:01:55', '2024-01-18 08:20:19'),
('0eebc1fe-67d3-4b93-8bc4-6bfc51c65410', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 25, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and objectives as external for the IT ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the IT ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/31\"}', NULL, '2024-01-21 19:35:07', '2024-01-21 19:35:07'),
('108f0836-e95b-4931-afb2-952003378086', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-18 00:56:59', '2024-01-18 00:56:59'),
('14975a8f-58f3-40ec-b7a0-fe0615b688a4', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 5, '{\"content\":\"Account has been disabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\"}', '2023-12-14 14:30:25', '2023-12-14 14:30:19', '2023-12-14 14:30:25'),
('154909ed-c6dd-478e-a3b0-89d03292eb23', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 07:32:18', '2024-01-15 07:32:18'),
('158ec0e0-e140-4d12-9392-675e13a84176', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2023-12-21 06:27:27', '2023-12-21 06:25:32', '2023-12-21 06:27:27'),
('166ca450-59bf-4313-8c09-59f067e03c79', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-15 09:47:56', '2024-01-15 08:27:16', '2024-01-15 09:47:56'),
('1a445102-18c6-47aa-8296-8ff55bee47e7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 8: Physical plant and Facilities as internal for the Asingan IT Accreditation 2024\",\"title\":\"Gil Lopez III has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-21 01:17:42', '2024-01-20 23:52:02', '2024-01-21 01:17:42'),
('1a7ea219-58c5-4f3f-8848-452057e2d507', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as member for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-16 05:30:08', '2024-01-15 08:38:44', '2024-01-16 05:30:08'),
('1a967f2e-d82e-4534-bec9-60022f92728b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 5, '{\"content\":\"Account has been disabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\\/manage_accreditation\"}', '2023-12-14 14:30:59', '2023-12-14 14:30:54', '2023-12-14 14:30:59'),
('1c1956df-f0a2-49d6-9fd4-22fef879b5ec', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-18 08:20:19', '2024-01-17 10:01:00', '2024-01-18 08:20:19'),
('1c8be1c5-1b29-44c0-9953-0af5358366b7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-15 08:28:43', '2024-01-15 08:28:43'),
('26ce10ea-aa78-4970-b2c7-de7c0c703780', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"Account has been disabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\\/manage_accreditation\"}', '2023-12-21 06:27:27', '2023-12-14 14:30:54', '2023-12-21 06:27:27'),
('285487be-6f21-4345-8a7e-744b7d8fa9d7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:50:03', '2024-01-17 09:50:03'),
('29b151a2-d102-4267-b77e-b00155fe6e70', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-15 09:47:56', '2024-01-15 08:30:18', '2024-01-15 09:47:56'),
('29e0a712-1561-495a-97d7-c34f7b0186c7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-16 05:30:08', '2024-01-15 09:43:54', '2024-01-16 05:30:08'),
('2a138fc5-ecfc-4507-9b9f-abbd162eb548', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 3: Curriculum and Instruction as internal for the Asingan IT Accreditation 2024\",\"title\":\"Gil Lopez III has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-21 01:17:43', '2024-01-20 23:51:12', '2024-01-21 01:17:43'),
('2af96537-3d08-4e9b-8fba-ecf31637e311', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-12 08:06:09', '2024-01-12 08:05:54', '2024-01-12 08:06:09'),
('2b9d77c4-9c2f-4234-9165-e7ea9c6f7ba0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-15 09:47:56', '2024-01-15 08:06:38', '2024-01-15 09:47:56'),
('2ca55548-1260-410a-b9f7-ec9a5ecc3e4f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:25:22', '2024-01-17 09:25:22'),
('2ca572b6-56c1-46fc-95a5-1236416eb0ed', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2023-12-14 07:02:10', '2023-12-13 23:35:17', '2023-12-14 07:02:10'),
('2ef22a73-a8c2-4aa9-b5fe-12111ba6f45e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-07 14:11:19', '2024-01-07 04:39:33', '2024-01-07 14:11:19'),
('2f8c87fc-4bbf-4d68-a7c5-e7a78dc66b36', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as member for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-18 05:37:26', '2024-01-18 01:16:51', '2024-01-18 05:37:26'),
('3181a182-ce89-4d0b-afbb-d93d1550cc48', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-07 14:11:19', '2024-01-07 04:41:57', '2024-01-07 14:11:19'),
('34122e27-ae75-4d32-b21d-6915d4435ea4', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:25:04', '2024-01-17 09:25:04'),
('35a52405-178c-4ec7-aad8-aa3056c71f7d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:34:13', '2024-01-15 08:34:13'),
('35f2bbe4-5d1b-4d27-8de2-c95033463aaf', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:19', '2024-01-06 09:06:01', '2024-01-07 14:11:19'),
('37cbdb26-87cb-4e77-be6d-4e6951c4fcbe', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:57:54', '2024-01-15 03:57:54'),
('3c565c70-aed8-4907-96e7-d3a3a495c448', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 37, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and objectives as chair for the Asingan IT Accreditation 2024\",\"title\":\"Gil Lopez III has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', NULL, '2024-01-20 22:12:56', '2024-01-20 22:12:56'),
('3f3614b1-579c-42ed-bf5b-c2881d1d8807', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as chair for the Asingan IT Accreditation 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-20 21:44:26', '2024-01-18 08:23:23', '2024-01-20 21:44:26'),
('3f4e6e05-8d91-401e-9cb9-5b1ee06a4ccd', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 28, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 10:00:33', '2024-01-17 10:00:33'),
('4100339d-b5a2-448f-9c88-6250f1e1438a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-20 21:45:45', '2024-01-17 09:53:59', '2024-01-20 21:45:45'),
('412daf9f-0e4c-4f64-9de9-15e5d28a7750', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/21\"}', '2024-01-12 19:57:46', '2024-01-12 19:52:49', '2024-01-12 19:57:46'),
('413756ec-5c21-422f-a42d-893eb0e50c62', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', NULL, '2024-01-15 04:01:21', '2024-01-15 04:01:21'),
('42c78d74-86fe-422a-ad78-697a1d9cbc97', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 07:31:54', '2024-01-15 07:31:54'),
('43321755-1df3-433f-8546-e577f6e6b590', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-15 09:47:56', '2024-01-15 09:47:41', '2024-01-15 09:47:56'),
('43645c8d-1683-40ed-9044-6a6d96fdc5ca', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/7\"}', '2023-12-21 06:27:27', '2023-12-21 06:26:44', '2023-12-21 06:27:27'),
('4b6f8f9e-fb83-4cf3-9ffd-e5cf368b30ed', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', NULL, '2024-01-07 04:41:18', '2024-01-07 04:41:18'),
('4bc1253d-2b08-4bf2-a454-4ca1dabb09a8', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 9: Laboratories as internal for the Asingan IT Accreditation 2024\",\"title\":\"Gil Lopez III has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-21 01:17:42', '2024-01-20 23:52:11', '2024-01-21 01:17:42'),
('4e1f9b14-e32f-43c3-9291-5504ea2a1b5e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as member for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-18 05:37:26', '2024-01-17 10:02:11', '2024-01-18 05:37:26'),
('4e3d9b0b-cc78-4a69-827f-8a54527afc20', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:19', '2024-01-07 04:41:37', '2024-01-07 14:11:19'),
('4eb7aa34-09bf-4e31-b8de-07250bb0205b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-20 21:44:27', '2024-01-17 09:14:23', '2024-01-20 21:44:27'),
('4eff8605-002c-4e63-b5de-6c999c12f1d2', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', NULL, '2024-01-15 03:52:51', '2024-01-15 03:52:51'),
('4f31c71f-c251-4461-a923-0f708f2e2f7d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/7\"}', '2023-12-21 06:27:27', '2023-12-21 06:26:37', '2023-12-21 06:27:27'),
('5367dc1a-3efa-4441-a0d1-c47595060bd1', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and Objectives as internal for the CE ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the CE ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/30\"}', NULL, '2024-01-21 06:23:17', '2024-01-21 06:23:17'),
('53873ad8-06c7-4a65-aa5b-7b36cc5dda7e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-15 09:47:56', '2024-01-14 00:04:00', '2024-01-15 09:47:56'),
('53d48595-b908-4442-ad74-4fd29319975b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-13 23:58:58', '2024-01-07 05:17:50', '2024-01-13 23:58:58'),
('540f315c-167b-45d6-b526-6f0e72de1ac8', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-20 21:44:27', '2024-01-17 09:16:37', '2024-01-20 21:44:27'),
('550ac478-b337-449e-9246-373513eba37f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 14:03:38', '2024-01-07 14:11:18'),
('550f1a9c-24c2-4d9b-83ae-20f23f9442af', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:56:15', '2024-01-15 08:56:15'),
('563593a4-20ec-4c19-ab21-8936944caebb', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 07:35:18', '2024-01-15 07:35:18'),
('5694ce48-9bb0-4530-af88-a9f8684287b0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', NULL, '2024-01-15 03:52:54', '2024-01-15 03:52:54'),
('57d7e3dc-91a2-4304-991a-08fd0da50fe1', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 11, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', NULL, '2023-12-13 23:35:12', '2023-12-13 23:35:12'),
('58116e94-0ef0-4e8f-be56-40eb2a3cd9b0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-15 09:47:56', '2024-01-15 03:57:53', '2024-01-15 09:47:56'),
('59a6f51a-a9af-4f8f-b20d-a04415d6996b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-15 08:42:04', '2024-01-15 08:42:04'),
('5a6323dd-cd33-4e9c-9421-b08a779ad186', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and objectives as member for the IT ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the IT ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/31\"}', NULL, '2024-01-23 05:38:22', '2024-01-23 05:38:22'),
('5c451991-f99e-496f-a1e1-08511f266f63', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-18 01:57:16', '2024-01-18 01:57:16'),
('5c67b438-b65e-45b0-85a9-694b61d9edc6', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:30:25', '2024-01-17 09:30:25'),
('5c8ba01b-7f37-4075-9b8a-cb9d7eb0b3bc', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the CE ACCREDITATION 2024\",\"title\":\"Notice! You Have been removed for the CE ACCREDITATION 2024\",\"url\":\"\"}', NULL, '2024-01-21 06:30:15', '2024-01-21 06:30:15'),
('5ca39679-f3a2-4d2f-b2ca-ae5714625931', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:18', '2024-01-07 08:41:23', '2024-01-07 14:11:18'),
('5e46cdab-80d4-4fca-9942-5ce78d62182c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:19', '2024-01-07 04:42:04', '2024-01-07 14:11:19'),
('5e4a3bb8-76b0-4429-87c3-fbff7dc86b4b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and objectives as chair for the Asingan IT Accreditation 2024\",\"title\":\"Amos Ezra Aduan has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-20 21:45:45', '2024-01-20 21:44:15', '2024-01-20 21:45:45'),
('5e5c8f71-9e77-4e5f-a0cd-2a073461d76a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-13 23:58:58', '2024-01-07 08:44:37', '2024-01-13 23:58:58'),
('5f0805b7-e2b9-4ecb-a992-5d7912568071', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:25:26', '2024-01-17 09:25:26'),
('60200af5-6d2b-48e4-b9b2-022aecd9af77', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 07:44:38', '2024-01-07 14:11:18'),
('64ba8f58-e67d-486a-82e1-b96b2b869e86', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Internal Accreditor for the Asingan IT Accreditation 2024\",\"title\":\"Notice! You Have been removed for the Asingan IT Accreditation 2024\",\"url\":\"\"}', NULL, '2024-01-21 06:11:04', '2024-01-21 06:11:04'),
('65176474-39e2-4db9-9acd-939c04e501a0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:49:50', '2024-01-17 09:49:50'),
('6676617b-eeee-43b8-a463-632e6b66da46', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 4, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 09:31:29', '2023-12-14 09:31:12', '2023-12-14 09:31:29'),
('6695a6ea-5b7e-4af7-9345-529a7548dd4a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 7, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:52:53', '2024-01-17 09:52:53'),
('689d061e-0485-4e5c-bc02-f20ce59fa214', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-07 14:11:19', '2024-01-07 04:39:23', '2024-01-07 14:11:19'),
('6d1fa771-b47b-405d-b1e9-ced84e5a89d0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:18', '2024-01-07 08:41:28', '2024-01-07 14:11:18'),
('72c8c978-8b5c-4182-8111-3e7a8c85e0ac', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2024\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 08:01:47', '2023-12-10 21:01:30', '2023-12-14 08:01:47'),
('73a7b385-2a2a-42d9-be2a-0f7fa0915163', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:33:37', '2024-01-15 03:33:37'),
('750551e8-60c5-4f4d-a95f-f3f8b2fa52e7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 14:11:11', '2024-01-07 14:11:18'),
('75199828-0680-4702-91c7-53d10a17a1d5', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-17 07:58:49', '2024-01-17 07:45:10', '2024-01-17 07:58:49'),
('78969ab4-2dc7-4b15-8703-c7e118052375', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-20 21:44:26', '2024-01-17 09:46:54', '2024-01-20 21:44:26'),
('7b946fa8-ff10-455f-a1c4-098c0674bd02', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-20 21:44:26', '2024-01-17 09:33:14', '2024-01-20 21:44:26'),
('7b9bf518-7579-484c-b6e2-2ccfb2569c10', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 07:02:10', '2023-12-13 23:35:12', '2023-12-14 07:02:10'),
('7d759b30-1c97-4299-804a-5a7b0f88390a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-13 23:58:58', '2024-01-07 08:43:57', '2024-01-13 23:58:58'),
('7db97b77-0e38-44ff-9b28-12aa74d1f07e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 7, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:57:53', '2024-01-15 03:57:53'),
('7e13ac34-0ca0-4793-82d0-608f9c893dbf', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:35:34', '2024-01-17 09:35:34'),
('7f84b82b-3332-4a87-9431-b2eda4c88e94', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 28, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:57:50', '2024-01-17 09:57:50'),
('80ecb512-54c6-459d-b3d5-9d2264cb7068', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-20 21:44:27', '2024-01-17 09:28:02', '2024-01-20 21:44:27'),
('81e20df2-bb70-4c47-9c9f-9484ac77ba59', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 27, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:58:07', '2024-01-17 09:58:07'),
('823bd3ec-d2f0-4c23-92b6-668cc2eed0b0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:52:34', '2024-01-17 09:52:34'),
('82b9011f-cdb3-4855-9edd-e9a675bd39aa', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 6: Extension And Community Involvement as internal for the Asingan IT Accreditation 2024\",\"title\":\"Gil Lopez III has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-21 01:17:42', '2024-01-20 23:51:56', '2024-01-21 01:17:42'),
('851bd569-c0ee-4ee6-a090-ff0ff83ffad7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:19', '2023-12-21 09:46:06', '2024-01-07 14:11:19'),
('88a58c14-b229-484e-b10a-5b588d4b1d7e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-20 21:44:26', '2024-01-17 09:30:31', '2024-01-20 21:44:26'),
('88bfbc94-37ce-4d28-92df-1508c23e0147', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as a Coordinator for the sdffghgjkl;\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/7\"}', NULL, '2023-12-21 06:26:51', '2023-12-21 06:26:51'),
('88f8f4b0-927b-4e78-8b9c-584f7b200c6d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"Notice! You Have been Removed for the. IT ACCREDITATION 2023\",\"url\":\"\"}', '2024-01-18 15:57:18', '2024-01-18 15:57:00', '2024-01-18 15:57:18'),
('8b20455f-7963-466f-b817-c544a0b3918c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:15:16', '2024-01-17 09:15:16'),
('8ba23e1c-a1f2-4adb-b97a-f5ac60c2920e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-13 23:58:58', '2024-01-07 11:48:14', '2024-01-13 23:58:58'),
('8cf6ca66-5782-4107-ab4b-0c3672521c46', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 14:09:37', '2024-01-07 14:11:18'),
('8d24b1a2-fa07-4b8b-87c7-bfb179b1114f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-20 21:44:26', '2024-01-17 09:46:37', '2024-01-20 21:44:26'),
('8d8ac09f-5f4c-4cd4-9c27-564b2a7cc2d1', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-20 21:44:26', '2024-01-17 09:42:25', '2024-01-20 21:44:26'),
('8dea65d7-5d6b-40a3-a2be-cc02e4360c48', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Internal Accreditor for the Asingan IT Accreditation 2024\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 02:52:03', '2024-01-17 02:52:03'),
('8df33111-6c0a-4f8b-bb70-c1b67c25ddb3', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"Account has been disabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\\/manage_accreditation\"}', '2023-12-21 06:27:27', '2023-12-14 14:32:23', '2023-12-21 06:27:27'),
('8ef192e0-baca-45ec-ba97-fa29507e9414', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-07 14:11:19', '2024-01-07 04:42:15', '2024-01-07 14:11:19'),
('8f2e332f-dac1-4d82-ae5b-6f274b6d7b9a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:18', '2024-01-07 07:31:38', '2024-01-07 14:11:18'),
('915e3662-4dcc-450c-97dd-bf08c7a18ec3', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:25:12', '2024-01-17 09:25:12'),
('93a0a160-5a60-47f9-9208-77078421b07c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:46:59', '2024-01-17 09:46:59'),
('943a72e2-f279-4c44-b852-061255785950', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-20 21:44:27', '2024-01-17 09:15:09', '2024-01-20 21:44:27'),
('957c008c-7f17-4960-b6dd-5496e8ea3a44', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-13 23:58:58', '2024-01-07 08:44:41', '2024-01-13 23:58:58'),
('982c89b4-13d1-4cdf-b616-6df21a444150', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 11, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:57:54', '2024-01-15 03:57:54'),
('99c79cda-3833-4f23-bfe5-ab32a6b8220f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-20 21:45:46', '2024-01-15 07:40:43', '2024-01-20 21:45:46'),
('9ac79216-3d24-493a-8c86-15b5fc1202f5', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 4: Support to Students as internal for the Asingan IT Accreditation 2024\",\"title\":\"Gil Lopez III has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-21 01:17:43', '2024-01-20 23:51:20', '2024-01-21 01:17:43'),
('9d4ef88e-eb70-4b1d-836a-e363991c669b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"Account has been enabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\"}', '2023-12-21 06:27:27', '2023-12-14 14:29:48', '2023-12-21 06:27:27'),
('9dc50ab0-c080-43dd-8d67-54bad7d1d6c1', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-13 23:58:58', '2024-01-07 05:17:31', '2024-01-13 23:58:58'),
('9f2a33f5-a560-48ef-af15-b47827f71916', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-18 01:12:14', '2024-01-18 01:12:14'),
('9f82b2c7-6202-4fb9-9a84-d1b6d608e1ee', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as member for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-18 05:37:26', '2024-01-18 01:51:09', '2024-01-18 05:37:26'),
('a03a1d9a-167c-40cc-bb7f-feb84437a810', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as chair for the Asingan IT Accreditation 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/24\"}', '2024-01-20 21:44:27', '2024-01-17 03:16:13', '2024-01-20 21:44:27'),
('a06399ba-0914-4422-958f-fdff664d6882', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added and assigned to Area 2: Faculty as member for the CE ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the CE ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/30\"}', NULL, '2024-01-21 06:23:02', '2024-01-21 06:23:02'),
('a0fb2548-f064-4d9e-b10d-227a37fba65f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-20 21:44:26', '2024-01-17 09:33:08', '2024-01-20 21:44:26'),
('a12e0851-9f60-4a4b-9fba-4c7c27a70449', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 40, '{\"content\":\"You have been remove as Internal Accreditor for the CE ACCREDITATION 2024\",\"title\":\"Notice! You Have been removed for the CE ACCREDITATION 2024\",\"url\":\"\"}', NULL, '2024-01-21 06:35:01', '2024-01-21 06:35:01'),
('a2540608-e72d-47cb-9124-314ac3db1910', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 2: Faculty as internal for the Asingan IT Accreditation 2024\",\"title\":\"Gil Lopez III has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-21 01:17:43', '2024-01-20 23:51:04', '2024-01-21 01:17:43'),
('a29980a0-c1a0-4d77-8914-54e94081e5c7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 05:18:34', '2024-01-07 14:11:18'),
('a378dbec-a49f-45b8-bad3-79dc40da11cd', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:46:25', '2024-01-17 09:46:25'),
('a5b7291c-0be6-4536-b651-f496064c4d8e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 12, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:57:54', '2024-01-15 03:57:54'),
('a5e0fed2-f5c9-4a77-b092-7855ac1ac457', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-20 21:45:45', '2024-01-17 09:34:12', '2024-01-20 21:45:45'),
('a6667bce-067c-4587-baca-77035fc78d64', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as chair for the Urdaneta IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/26\"}', '2024-01-17 07:58:49', '2024-01-17 07:30:49', '2024-01-17 07:58:49'),
('a6fac955-cbaa-4ec2-aaa3-b96c169f4819', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-16 05:30:08', '2024-01-15 09:48:57', '2024-01-16 05:30:08'),
('a7092d3c-d377-4397-a924-48fa6b022169', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:45:51', '2024-01-17 09:45:51'),
('a9c5470d-4db8-41c3-86e8-1a98d6463a13', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the Asingan IT Accreditation 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/24\"}', NULL, '2024-01-17 02:51:14', '2024-01-17 02:51:14'),
('ab909560-6561-4404-93f1-8ebb36ba21e5', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-13 23:58:58', '2024-01-13 23:58:37', '2024-01-13 23:58:58'),
('acf6e0d6-1ae7-444e-a6be-9fdc920b0193', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-16 05:30:08', '2024-01-15 09:52:18', '2024-01-16 05:30:08'),
('ad4deaad-d836-4296-8d93-b89635170e6c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 37, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"Notice! You Have been removed for the IT ACCREDITATION 2024\",\"url\":\"\"}', NULL, '2024-01-23 05:37:44', '2024-01-23 05:37:44'),
('ad63edf6-2bc5-4087-9394-5848db5123c5', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 31, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-18 01:12:01', '2024-01-18 01:12:01'),
('ae3d9570-543f-4ca6-8fc5-523e31fa72e9', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:25:16', '2024-01-17 09:25:16'),
('ae6f27cf-f9ef-4eba-9ec8-c7fe7ff60413', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 07:45:50', '2024-01-07 14:11:18'),
('ae83e028-e2f5-4f47-b989-07e8aeaf594e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', '2024-01-20 21:44:27', '2024-01-15 03:52:55', '2024-01-20 21:44:27'),
('ae8b1259-2259-40e3-a295-4bb18aea3c54', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 12:49:38', '2024-01-07 14:11:18');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('ae92af33-03e8-4cda-b749-124c7d02fa52', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and Objectives as chair for the CE ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the CE ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/30\"}', NULL, '2024-01-21 06:22:29', '2024-01-21 06:22:29'),
('aff419ad-2755-4c4d-8ba1-3e05454dc906', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:33:03', '2024-01-17 09:33:03'),
('b13325a3-44e7-4017-b7de-0ff3e59a1aeb', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 7, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:52:48', '2024-01-17 09:52:48'),
('b1b77c1d-d216-4438-a51d-200d7dab36ca', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-20 21:44:26', '2024-01-17 09:30:09', '2024-01-20 21:44:26'),
('b36c23ec-b391-405e-b028-3279489499d1', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-12 08:06:09', '2024-01-12 08:05:44', '2024-01-12 08:06:09'),
('b4f6600b-a302-4f64-a05e-05acc1778dd2', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 31, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:57:58', '2024-01-17 09:57:58'),
('b544ec46-136c-4768-b1c6-c65960c04d80', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:24:58', '2024-01-17 09:24:58'),
('b57618ea-7ce4-44b0-8e23-65821ad3386e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-07 14:11:18', '2024-01-07 07:53:15', '2024-01-07 14:11:18'),
('b7348bc8-c394-4c7e-835f-7c05b711b1cb', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/28\"}', '2024-01-18 05:37:25', '2024-01-18 05:34:18', '2024-01-18 05:37:25'),
('b7ddbdf3-fbca-4dd9-a7b9-ded7f6937585', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"Account has been enabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\"}', '2023-12-21 06:27:27', '2023-12-14 14:29:17', '2023-12-21 06:27:27'),
('b84abf7d-32c0-4e30-91bb-dee7ff1a568f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', '2023-12-13 06:22:18', '2023-12-09 07:09:26', '2023-12-13 06:22:18'),
('b86dfe73-7cdd-4ac5-bfdd-d86de707599a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 5, '{\"content\":\"Account has been enabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\"}', '2023-12-14 14:29:25', '2023-12-14 14:29:17', '2023-12-14 14:29:25'),
('b8753cfa-63dd-4883-938e-6eee973717df', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:46:32', '2024-01-17 09:46:32'),
('b8b426cb-def9-4568-ba60-48878885c98e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 7, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', NULL, '2024-01-15 04:01:23', '2024-01-15 04:01:23'),
('b9b167ec-12ce-4d18-a770-3e3007a3638c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 11, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', NULL, '2024-01-15 03:52:50', '2024-01-15 03:52:50'),
('b9c9d056-8dc8-41d6-b054-82ee61cb68ab', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the Asingan IT Accreditation 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/24\"}', NULL, '2024-01-17 02:56:31', '2024-01-17 02:56:31'),
('ba40a229-317e-433d-befd-f59f11d45af2', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-13 23:58:58', '2024-01-07 08:44:45', '2024-01-13 23:58:58'),
('ba421941-5c10-4527-ad7c-95cce043a696', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"Account has been disabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\"}', '2023-12-21 06:27:27', '2023-12-14 14:30:19', '2023-12-21 06:27:27'),
('baaa175b-6388-4c4b-b994-20c96b88d77e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:49:56', '2024-01-17 09:49:56'),
('bae81d53-901a-4c92-82a2-ebdd72143847', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as chair for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-12 08:06:09', '2024-01-07 14:18:34', '2024-01-12 08:06:09'),
('bb6b7484-2b00-4d12-a9ef-0a2239d6b75e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 05:17:56', '2024-01-07 14:11:18'),
('bc4f0791-1040-4a77-a39c-5a81c4335161', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-16 05:30:08', '2024-01-16 05:17:43', '2024-01-16 05:30:08'),
('bcbeb7db-d829-4a52-9302-82d3f289a79c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:24:36', '2024-01-17 09:24:36'),
('becf4144-a4fb-41bb-bcfe-9a56e49d6356', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as member for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:38:44', '2024-01-15 08:38:44'),
('bf947cfe-1573-4ab1-a1a2-9ae4a1a08445', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 37, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and objectives as chair for the IT ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the IT ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/31\"}', NULL, '2024-01-21 19:18:29', '2024-01-21 19:18:29'),
('c15b11b5-6653-4e27-8bb0-ed12deba968b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-20 21:44:27', '2024-01-17 09:15:05', '2024-01-20 21:44:27'),
('c15fe596-bbc2-48ab-845a-12dc59e24342', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:18', '2024-01-07 07:45:45', '2024-01-07 14:11:18'),
('c20bb639-2c1f-4669-a89c-a099ab165807', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:57:53', '2024-01-15 03:57:53'),
('c30f1f1c-2335-47a4-a8d4-28439d351fd6', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 11, '{\"content\":\"You have been added as member for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 10:02:11', '2024-01-17 10:02:11'),
('c33e055d-f1ad-4784-abc3-8ce566c1998d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:36:59', '2024-01-15 08:36:59'),
('c4ad5036-8f41-4c33-b989-fa01f670b1ca', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2024-01-20 21:44:27', '2023-12-13 23:35:35', '2024-01-20 21:44:27'),
('c727c3ac-301a-41a7-9cce-d59156dae971', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 07:02:10', '2023-12-13 23:35:35', '2023-12-14 07:02:10'),
('c839c9b4-a89f-4c5f-833f-5e4c3a5587a7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:40:38', '2024-01-15 08:40:38'),
('cb73b577-5c34-4222-93db-668b289bb464', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:19:04', '2024-01-17 09:19:04'),
('cb7e153c-d951-40d5-a13c-0653e9f40893', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/21\"}', '2024-01-14 06:17:31', '2024-01-14 06:17:25', '2024-01-14 06:17:31'),
('cb83a5d6-ea2b-4ea5-bc34-94fc33138ead', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-20 21:44:27', '2024-01-17 09:26:29', '2024-01-20 21:44:27'),
('cbd11b1c-01a1-4762-9835-397a1b6b47f9', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 39, '{\"content\":\"You have been added and assigned to Area 2: Faculty as chair for the CE ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the CE ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/30\"}', NULL, '2024-01-21 06:32:21', '2024-01-21 06:32:21'),
('cc3f37a5-29b8-4503-912b-299a42cd5fb2', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-20 21:44:27', '2024-01-15 03:33:36', '2024-01-20 21:44:27'),
('cd890c0a-3e04-4df0-92ce-e56e52040406', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 08:01:46', '2023-12-13 23:34:57', '2023-12-14 08:01:46'),
('ceede0d3-5e0d-42a5-bf4f-514c4eff5076', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/3\"}', '2023-12-13 06:22:18', '2023-12-09 07:09:47', '2023-12-13 06:22:18'),
('cfa8af59-cbae-4af7-aafb-f65444a1c4d6', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 5: Research as internal for the Asingan IT Accreditation 2024\",\"title\":\"Gil Lopez III has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-21 01:17:43', '2024-01-20 23:51:30', '2024-01-21 01:17:43'),
('cfbb80e8-f8f9-48b7-9591-543fe3c0898b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 31, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:13:37', '2024-01-17 09:13:37'),
('d04c4d35-834b-4afa-80fd-7d85b01b7a74', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the CE ACCREDITATION 2024\",\"title\":\"Notice! You Have been removed for the CE ACCREDITATION 2024\",\"url\":\"\"}', NULL, '2024-01-21 06:32:15', '2024-01-21 06:32:15'),
('d0e481e2-aec4-4816-832b-f013b4f0171e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-20 21:44:26', '2024-01-17 09:42:30', '2024-01-20 21:44:26'),
('d0edcd96-aa49-4ac3-b8dc-4d462cfc149d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 31, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:24:29', '2024-01-17 09:24:29'),
('d19ad876-718b-4f73-8fb6-e207218074c4', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:31:28', '2024-01-15 08:31:28'),
('d1bddcaf-a68b-458a-85ae-6a9f9f2f17f2', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:24:43', '2024-01-17 09:24:43'),
('d1d5bb9e-4f86-47e0-aac1-73d471c6cc9b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2024\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-13 06:22:18', '2023-12-10 22:00:21', '2023-12-13 06:22:18'),
('d30ac76f-af47-4c1b-a93a-0f3fdc3eba96', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:16:29', '2024-01-17 09:16:29'),
('d386ed56-e5a6-4845-b99c-5ed66495632f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been remove as Internal Accreditor for the Asingan IT Accreditation 2024\",\"title\":\"Notice! You Have been removed for the Asingan IT Accreditation 2024\",\"url\":\"\"}', '2024-01-20 21:50:20', '2024-01-20 21:49:52', '2024-01-20 21:50:20'),
('d3f0bdf1-a7e8-4b1e-a0d9-79b657e30808', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-13 23:58:58', '2024-01-07 08:38:56', '2024-01-13 23:58:58'),
('d46b69ac-c875-44cb-b74e-09ddfdbe8754', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added and assigned to Area 2: Faculty as internal for the Asingan IT Accreditation 2024\",\"title\":\"Admin admin has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', NULL, '2024-01-21 06:10:56', '2024-01-21 06:10:56'),
('d483ea0d-514d-4733-a7f7-c86a20cd367f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-13 23:58:58', '2024-01-07 14:18:34', '2024-01-13 23:58:58'),
('d6969c22-48a3-4870-9f1b-e6c5fe2b144e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 5, '{\"content\":\"Account has been enabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\"}', '2023-12-14 14:29:52', '2023-12-14 14:29:48', '2023-12-14 14:29:52'),
('d6a66833-99c8-48f3-8265-bff101453cd4', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-18 05:37:26', '2024-01-16 05:30:44', '2024-01-18 05:37:26'),
('d6e3f970-04aa-4d30-b48a-387660d8e4cb', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:28:34', '2024-01-15 08:28:34'),
('d763cd0e-d47c-450c-a744-c9ccd71f8903', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 11, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2023-12-13 23:35:19', '2023-12-13 23:35:19'),
('d7c8ceff-145a-4a11-93dd-ed1e57f27705', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 37, '{\"content\":\"You have been added as a Coordinator for the Asingan IT Accreditation 2024\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-20 22:06:23', '2024-01-20 22:02:20', '2024-01-20 22:06:23'),
('d83eee79-1f92-4a5a-9bf4-d81ca550adb8', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-20 21:44:27', '2024-01-17 09:17:57', '2024-01-20 21:44:27'),
('d9eaa569-bc7e-49a1-b40e-1ebdcb0f1953', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-18 05:37:26', '2024-01-15 22:21:54', '2024-01-18 05:37:26'),
('dbd7c79a-688c-49ae-b793-449731772eb0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-15 08:28:10', '2024-01-15 08:28:10'),
('dc82e2ee-4136-4bff-aa08-977f0fb407c5', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 10: Administration as internal for the Asingan IT Accreditation 2024\",\"title\":\"Gil Lopez III has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-21 01:17:42', '2024-01-20 23:52:16', '2024-01-21 01:17:42'),
('dca0ceb6-0f4f-4bdb-b0e2-dd1b92f91d03', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 24, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 10:02:26', '2024-01-17 10:02:26'),
('de22ef6c-8f70-44da-b330-a121f29afba7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the CE ACCREDITATION 2024\",\"title\":\"Notice! You Have been removed for the CE ACCREDITATION 2024\",\"url\":\"\"}', NULL, '2024-01-21 06:42:04', '2024-01-21 06:42:04'),
('e035e075-3331-46bc-91ee-15f313883744', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 7, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', NULL, '2023-12-13 23:34:57', '2023-12-13 23:34:57'),
('e1585f8a-76b2-4a4e-b52e-17636fce2763', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-20 21:44:27', '2024-01-17 09:27:56', '2024-01-20 21:44:27'),
('e1782a44-b2ba-4205-8214-51b31a8e0c55', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 07:34:41', '2024-01-15 07:34:41'),
('e23b4f47-d83a-4231-9d2d-0fbc56df5767', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 30, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and objectives as external for the IT ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the IT ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/31\"}', NULL, '2024-01-21 19:36:00', '2024-01-21 19:36:00'),
('e439ba65-97f0-44f6-841d-aee98cbcef84', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 1: Instruction as internal for the IT ACCREDITATION 2023\",\"title\":\"Admin admin has added you! for the IT ACCREDITATION 2023\",\"url\":\"\\/manage_member\\/28\"}', '2024-01-18 16:00:03', '2024-01-18 15:59:56', '2024-01-18 16:00:03'),
('e4f3aec9-c9d0-4751-8c2d-24c675bcd2ce', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:19', '2024-01-07 04:39:28', '2024-01-07 14:11:19'),
('e5753568-b243-4d10-bc81-e9451f006665', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Internal Accreditor for the Asingan IT Accreditation 2024\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 03:16:04', '2024-01-17 03:16:04'),
('ea3af4f6-a299-4862-bd69-2fb924be1c18', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 41, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and Objectives as chair for the CE ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the CE ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/30\"}', NULL, '2024-01-21 06:35:09', '2024-01-21 06:35:09'),
('ea8461ad-803c-4cf0-a01c-5e51b81bc07a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 37, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and objectives as chair for the IT ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the IT ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/31\"}', NULL, '2024-01-23 05:37:57', '2024-01-23 05:37:57'),
('eb141c5d-4711-432c-a861-042de927abcc', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:35:39', '2024-01-17 09:35:39'),
('eb80d93a-6a2e-401b-9f42-50055a5efb35', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/7\"}', '2023-12-21 06:27:27', '2023-12-21 06:25:25', '2023-12-21 06:27:27'),
('ee372c0c-0577-4f6e-8465-14dabe23b893', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-15 08:31:36', '2024-01-15 08:31:36'),
('ee5523d9-7bf3-4fae-af54-5ffe4d92335b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been remove as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-07 04:41:37', '2024-01-07 04:41:37'),
('f0dcd9b8-01e4-43ce-820c-16c89dfd81d1', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:18:55', '2024-01-17 09:18:55'),
('f1bb9f27-be83-411a-94fe-43d7aac70b20', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and objectives as internal for the IT ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the IT ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/31\"}', NULL, '2024-01-21 19:18:36', '2024-01-21 19:18:36'),
('f30484b8-5209-4068-8d7b-ccd43f6592f3', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', '2024-01-15 09:47:56', '2024-01-15 03:52:50', '2024-01-15 09:47:56'),
('f4a3a40f-b8c6-4c26-8078-a9bc5d904497', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 05:29:29', '2024-01-07 14:11:18'),
('f4e4dbe7-2749-4a33-ab14-b84ca82a513d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-15 09:47:56', '2024-01-15 08:30:12', '2024-01-15 09:47:56'),
('f559e2c4-7645-4260-adec-06cc66fd754c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 25, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"Notice! You Have been removed for the IT ACCREDITATION 2024\",\"url\":\"\"}', NULL, '2024-01-21 19:35:50', '2024-01-21 19:35:50'),
('f60a7423-eb11-4551-9f7f-a3ecfa74ffb9', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-20 21:45:45', '2024-01-15 08:00:06', '2024-01-20 21:45:45'),
('f6fc0746-bda5-4789-9545-49ac6313d521', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 40, '{\"content\":\"You have been added and assigned to Area 1: Vision, Mission, Goals and Objectives as chair for the CE ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the CE ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/30\"}', NULL, '2024-01-21 06:32:11', '2024-01-21 06:32:11'),
('f80bec17-7dd8-44a4-a5b8-98479aaf8714', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-20 21:44:26', '2024-01-17 09:33:18', '2024-01-20 21:44:26'),
('f8c0c115-098a-47f7-b417-97dab1733d24', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added and assigned to Area 3: Curriculum and Instruction as internal for the Asingan IT Accreditation 2024\",\"title\":\"Admin admin has added you! for the Asingan IT Accreditation 2024\",\"url\":\"\\/manage_member\\/29\"}', '2024-01-21 01:17:42', '2024-01-21 01:17:34', '2024-01-21 01:17:42'),
('f8cd60e8-1e39-496d-9b03-90f6a5633d6f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added and assigned to Area 2: Faculty as internal for the CE ACCREDITATION 2024\",\"title\":\"Admin admin has added you! for the CE ACCREDITATION 2024\",\"url\":\"\\/manage_member\\/30\"}', NULL, '2024-01-21 06:51:49', '2024-01-21 06:51:49'),
('f8d747ae-d72e-4c5b-ae06-1dae86a0afc9', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:19:11', '2024-01-17 09:19:11'),
('fa7ebeb7-bad8-4575-a333-daa9f612e188', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 00:30:32', '2023-12-13 23:44:48', '2023-12-14 00:30:32'),
('fdcfa97a-a7b7-483d-b05c-b0a203cf8ecb', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 5, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-13 23:26:44', '2023-12-13 23:26:34', '2023-12-13 23:26:44'),
('fef41c67-b154-48ac-8eac-08eff2e0b6a6', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 08:44:03', '2024-01-07 14:11:18'),
('ff4f4d30-9612-4d91-aa44-83b0cc61da90', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 5, '{\"content\":\"Account has been disabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\\/manage_accreditation\"}', NULL, '2023-12-14 14:32:23', '2023-12-14 14:32:23'),
('ff563b34-1b88-4452-a383-39679077ee74', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/28\"}', '2024-01-18 15:44:37', '2024-01-18 15:43:52', '2024-01-18 15:44:37');

-- --------------------------------------------------------

--
-- Table structure for table `parameters`
--

CREATE TABLE `parameters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `parameter` varchar(255) NOT NULL,
  `parameter_title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parameters`
--

INSERT INTO `parameters` (`id`, `area_id`, `parameter`, `parameter_title`, `description`, `created_at`, `updated_at`) VALUES
(49, 56, 'A', 'Vision, Mission, Goals and Objectives', 'The Vision is the state the Institution hopes to become in the future. The MGO represents the hierarchy of aims of the Institution. The Mission reflects the mandate/aim of the whole state university or state college. The Goals are the aims at the hierarchical structure below the Institutional level (the academic Unit/Institute/School); and the Objectives are the aims at the program level, i. e., what the program hopes to achieve.\r\n\r\nThe Institution shall define its mission in accordance with its legal and educational development mandate and the thrusts of the government.\r\n\r\nThe program outcomes are the foci of program accreditation. These are the competencies (knowledge and skills), values and other attributes, which the Institution hopes their graduates shall acquire to enable them to compete for employment, locally and internationally', '2024-01-11 04:39:01', '2024-01-11 04:39:01'),
(50, 56, 'B', 'Dissemination and Acceptability', 'It is expected that the Institution disseminates, and work for the acceptance of the Vision, Mission, Goals and Objectives by the stakeholders. In order to facilitate awareness and acceptance, it is a good practice that the faculty, non-teaching staff, students, linkages, the community, and other stakeholders are involved in the formulation, review and/or revision of the VMGO.\r\n\r\nAn outcomes-based assessment will focus on the extent to which the program objectives are attained as shown in the outcomes. Thus, there must be a common understanding and acceptance of the end results of the program by both the faculty and the students.\r\n\r\nIt should be demonstrated that the program objectives (outcomes) are consistent with the College goals; and the College goals with the Mission of the Institution. On a long-term perspective, the accomplishment of the Mission will lead to the realization of the Vision of the Institution', '2024-01-11 04:59:39', '2024-01-11 04:59:58'),
(51, 58, 'A', 'Academic Qualifications and Professional Experience', 'The faculty should have the appropriate academic preparation and experience relevant to the program. They must be holders of appropriate degrees. In case of any deficiency, they should possess relevant and/or compensatory qualifications. Moreover, they must be licensed (where applicable) if they are handling professional subjects. They must exhibit competence as evidence by their professional license, performance evaluation, consultancy and scholarly works.', '2024-01-11 05:24:50', '2024-01-12 02:52:57'),
(52, 58, 'B', 'Recruitment, Selection and Orientation', 'Recruitment and selection of the faculty are among the important activities undertaken by an institution. Success in the implementation of an academic program depends to a great extent on the quality of the faculty.\r\nThe institution should have an effective system of recruitment and selection of the most qualified faculty. The system may include the conduct of psychological test, interview, demonstration teaching, etc. The process is a participative effort of the dean, chairperson, faculty representative/s, and other designated officials. New faculty members must be given orientation on the institution’s VMGO and policies as well as on their responsibilities and', '2024-01-11 05:25:02', '2024-01-12 02:53:04'),
(53, 58, 'C', 'Faculty Adequacy and Loading', 'The institution must have an adequate number of faculty with the appropriate qualifications to handle the courses offered by a particular program. Teaching assignment/loading should be based on the major/minor fields of specialization of the faculty. Their workload should allow them time to prepare lessons, score papers and other course requirements, advise students, conduct research and extension activities to perform other instruction-related and institutional service. If possible, faculty should not be given more three academic subject preparations.', '2024-01-11 05:25:14', '2024-01-12 02:53:13'),
(54, 58, 'D', 'Rank and Tenure', 'The institution should implement a system of promotion in rank and salary based on existing policies and guidelines. Faculty members must be informed of the promotion, and retirement.', '2024-01-11 05:25:21', '2024-01-12 02:53:19'),
(55, 58, 'E', 'Faculty Development', 'The institution should have a well-funded Faculty Development Program. The program should be based on objective criteria. The faculty should also be involved in the dissemination of knowledge, innovations, and technologies in national and international fora and in the development of instructional materials such as modules software, teach wares, multi-media devices, etc. Moreover, they are expected to render expert services and consultancies.', '2024-01-11 05:25:33', '2024-01-12 02:53:27'),
(56, 58, 'F', 'Professional Performance and Scholarly Works', 'Teaching is the main function of the faculty and a performance evaluation system should be based on objective criteria. The faculty should be also involved in the dissemination of knowledge, innovations, and technologies in national and international fora and in the development of instructional materials such as modules, software, teach wares, multi-media devices, etc. Moreover, they are expected to render expert services and consultancies.', '2024-01-11 05:25:46', '2024-01-12 02:53:35'),
(57, 58, 'G', 'Salaries, Fringe Benefits and Incentives', 'The salary scale of the faculty follows the DBM Salary Standardization Scheme and the most recent government issuances on compensation. Fridge benefits of faculty members such as leave privileges and financial assistance should be embodied in the Institution’s Code or Manual in consonance with CSC and other government policies and guidelines. Overloads are appropriately compensated. Outstanding performance (publication, reproduction, scholarly works, etc.) of faculty should be recognized and incentives be given correspondingly.', '2024-01-11 05:25:56', '2024-01-12 02:53:42'),
(58, 58, 'H', 'Professionalism', 'Professionalism should be practiced based on the SUC Code, the Civil Service Code of Ethical Standards for Government Officials and Employees (RA 6713), and the Code of Ethics for the Profession. Academic freedom should be judiciously exercised.', '2024-01-11 05:26:04', '2024-01-12 02:53:50'),
(59, 57, 'A', 'Curriculum and Program of Studies', 'The Curriculum must have content and design that will enable the students to archive intended learning outcomes. It should work towards the attainment of the mission of the Institution, and the attainment of the course objectives. It should include recent developments in teaching and learning techniques, and other attributes necessary for the employment, such as teamwork, communication, leadership skill, etc.', '2024-01-11 10:33:43', '2024-01-12 03:03:54'),
(60, 57, 'B', 'Instructional Processes, Methodologies and Learning Enhancement Opportunities', 'The instructional process should provide learning opportunities for the students. It should also make use of different strategies, methodologies and techniques. Learning opportunities could be in the following areas: 1) teaching and learning; 2) professional development; 3) collaboration.', '2024-01-11 10:33:52', '2024-01-12 03:04:00'),
(61, 57, 'C', 'Assessment of Academic Performance', 'Assessment is an integral part of a curricular program for purposes of continuous improvement. It is used to demonstrate how well the program carries out the mission of the institution. The methods used for assessment should demonstrate reliable relationships between the educational experience (curriculum) and the expected/outcomes. Assessment may be done before, during, and after implementation of the curricular program.', '2024-01-11 10:34:07', '2024-01-12 03:04:18'),
(62, 57, 'D', 'Management of Learning', 'The rues and practices relating to classroom management should be conductive to effective instruction and carefully observed. Measured should be taken to ensure punctual attendance of faculty members in their scheduled classes. The rule on absences should follow the institution’s policy. Records of these absences should be kept.', '2024-01-11 10:34:14', '2024-01-12 03:04:12'),
(63, 57, 'E', 'Graduation Requirements', 'Requirements for graduation are made clear and well-known to the students. Research, practicum, on-the-job training and other activities prescribed in the curriculum as requirements for graduation should be strictly implemented to further improve quality of graduates.', '2024-01-11 10:34:24', '2024-01-12 03:04:25'),
(64, 57, 'F', 'Administrative Support for Effective Instruction', 'Quality instruction should be sustained by providing the required instructional materials like syllabi, assessment instruments, etc., to make teaching learning meaningful and fruitful. To ensure effective instruction, it is necessary that students and faculty are punctual in their respective classes. Likewise, this is sustained through utilization of updated/enhanced instructional materials like syllabi, examination questions and departmental examinations; provisions for substitutions and special arrangements for absences or leaves of faculty members; and supervisory visit to monitor academic activities.', '2024-01-11 10:34:33', '2024-01-12 03:04:33'),
(65, 59, 'A', 'Student Services Program (SSP)', 'There should be a well-organized, properly administered and adequately staffed Student Services Program (SSP). Such a program should be provided with adequate services, physical facilities and adequate resources to attain its objectives. A program of activities and services such as Student Welfare, Student Development, Institutional Student Programs and Services should be known and accepted by the administrators, faculty and students.', '2024-01-12 02:54:27', '2024-01-21 18:01:32'),
(66, 59, 'B', 'Student Welfare', 'The Student Welfare Services are basic services and programs needed to ensure and promote the well-being of students. These include information, Orientation and Awareness, Guidance and Counseling, Career and Placement, Economic Enterprise Development, and Student Handbook Development.\r\n	A well-planned and functional Student Welfare Program directed towards the welfare and total personality development of students should be provided by the Institution.', '2024-01-12 02:54:38', '2024-01-21 18:01:46'),
(67, 59, 'C', 'Student Development', 'Student Development is composed of programs and activities designed for the enhancement and deepening of leadership skills and social responsibility. This includes student organizations and activities, professional organization or societies, special interests, Leadership Training Programs, Student Council/ Government, Student Discipline, Student Publication/Media.', '2024-01-12 02:54:50', '2024-01-21 18:01:59'),
(68, 59, 'D', 'Institutional Student Programs and Services', 'These are programs and activities that would facilitate the delivery of essential services to the students such as: a) Administration; b) Scholarship and Financial Assistance; c) Food; d) Health; e) Security and Safety; f) Housing and Residential Services; g) Multi-Faith; h) Foreign Students; i) services for Students with Special Needs; j) culture and arts; k) sports; l) social; and m) community involvement.', '2024-01-12 02:55:01', '2024-01-21 18:02:14'),
(69, 59, 'E', 'Research, Monitoring and Evaluation', 'The Institution should encourage the students to conduct research on student affairs and programs. The results should be disseminated and utilized, monitoring and evaluation of student affairs and services can serve as feedback mechanism to ensure sustainability and effectiveness of the Student Affairs and Services program.', '2024-01-12 02:55:15', '2024-01-21 18:02:37'),
(70, 60, 'A', 'Priorities and Relevance', 'none', '2024-01-12 02:56:07', '2024-01-12 02:56:07'),
(71, 60, 'B', 'Funding and Other Resources', 'asd', '2024-01-12 02:56:14', '2024-01-12 02:56:14'),
(72, 60, 'C', 'Implementation, Monitoring, Evaluation and Utilization of Research Results/Outputs', 'asd', '2024-01-12 02:56:22', '2024-01-12 02:56:22'),
(73, 60, 'D', 'Publication and Dissemination', 'asd', '2024-01-12 02:56:30', '2024-01-12 02:56:30'),
(74, 61, 'A', 'Priorities and Relevance', 'extension services are provided by the Academic Unit in response to the needs and\r\nurgent concerns of the community it serves. Likewise, it takes into consideration local, regional and national development thrusts. The services extended should be reflective of the Institution\'s vision, mission, goals and objectives.', '2024-01-12 02:56:55', '2024-01-12 02:57:33'),
(75, 61, 'B', 'Planning, Implementation, Monitoring and Evaluation', 'There is an extension unit which coordinates a functional extension program.\r\nStakeholders, administration, faculty, and students are involved in the planning; implementation, monitoring and evaluation of extension activities. Multi-disciplinary or multi-sectoral approach is encouraged in the conduct of the various extension activities, including the assessment of the impact of each extension activity implemented for various clientele.', '2024-01-12 02:57:04', '2024-01-12 02:57:39'),
(76, 61, 'C', 'Funding and Other Resources', 'The extension program is provided regularly with a definite budget to ensure its sustainability. Funds, as well as material and service inputs from the Institution or from other agencies, are needed in the implementation of a viable extension program.', '2024-01-12 02:57:10', '2024-01-12 02:57:46'),
(77, 61, 'D', 'Community Involvement and Participation', 'A harmonious and collaborative school-community relationship is a major factor in\r\nthe life of an extension program. The community should be invited to participate in the planning, implementing, monitoring and evaluation of activities, as well as sourcing of, funds and other resources', '2024-01-12 02:57:21', '2024-01-12 02:58:03'),
(78, 64, 'A', 'Laboratories, Shops/Facilities', 'In general, facilities include well-equipped rooms which are adequately ventilated/air-conditioned, and lighted. The furniture are properly arranged. Safety devices and measures to cope with emergency situations are available. Facilities conform with accepted standards.', '2024-01-12 20:07:21', '2024-01-12 20:07:21'),
(79, 64, 'B', 'Equipment and Supplies', 'Certain courses require specific equipment, materials and supplies. The list of these equipment, materials and supplies should be included under the section on special provisions for the academic program. Apparatuses, tools and materials conform to specifications as required.', '2024-01-12 20:07:31', '2024-01-12 20:07:31'),
(80, 64, 'C', 'Maintenance', 'All laboratory equipment should be stored properly, maintained, and checked regularly to ascertain their good working condition.', '2024-01-12 20:07:43', '2024-01-12 20:07:43'),
(81, 64, 'D', 'Special Provisions', 'The special provisions should include the program requirements (listing of materials and equipment as per CMO). There should be an approved Annual Procurement Plan (APP).', '2024-01-12 20:07:56', '2024-01-12 20:07:56'),
(82, 62, 'A', 'Campus', 'The site should be located in a wholesome environment, safe from traffic and transportation hazards, sufficiently free from noise, dust, smoke, and other undesirable elements. It should be provided with adequate facilities for drainage and sewage disposal. It should be adequate to meet the needs of the present school population and its future expansion. The school should be accessible to present and anticipated school population by means of public and private transportation. It should have satisfactory road network and sidewalks.\r\nThe campus should be so planned that it would be adequate for the intellectual, social, physical and cultural interests of the Institution. It should be kept in good condition and physical appearance.', '2024-01-12 20:08:27', '2024-01-12 20:08:27'),
(83, 62, 'B', 'Buildings', 'The buildings should be functionally designed and constructed of strong and durable materials to withstand natural calamities like earthquakes, typhoons, and fire. Their design should be pleasing to the eye and in conformity with the surroundings. At the same time, these are imbued with the proper atmosphere conducive to learning. Likewise, there should be provisions for disabled persons.\r\nThey should anticipate to accommodate future expansion needs. Entrance and exit points should be well-planned to insure safe and convenient mobility of the school population and the transacting public.\r\nStairways and fire exits should be adequate and standard in size and number, and conveniently located. No obstruction along the corridors impede the free flow of movement and physical activity.', '2024-01-12 20:08:39', '2024-01-12 20:08:39'),
(84, 62, 'C', 'Classrooms', 'The size and number of classrooms should be in accordance with the standards and sufficient to accommodate the student population. Classrooms should be adequately equipped with the required furniture, blackboards/whiteboards, and should have a pleasant atmosphere. Lighting, ventilation, general appearance, and acoustics should be satisfactory.', '2024-01-12 20:09:05', '2024-01-12 20:09:05'),
(85, 62, 'D', 'Offices, Staff and Function Rooms', 'Adequate provisions should be made for administrative offices, faculty rooms, and reception areas, where needed.', '2024-01-12 20:09:17', '2024-01-12 20:09:17'),
(86, 62, 'E', 'Assembly and Athletic Facilities', 'Group assembly facilities should have a seating capacity adequate to meet the needs of the Institution. These facilities should be designed with good acoustics and proper ventilation. Necessary facilities and equipment should be adequate and kept in good condition. Athletic facilities should be accessible to the students, and must be sufficient in number and variety, depending on the requirements of the school population. There should be suitable arrangements for athletic activities during the rainy season.', '2024-01-12 20:09:29', '2024-01-12 20:09:29'),
(87, 62, 'F', 'Medical and Dental Clinic', 'A medical and dental clinic should be properly set-up, strategically located, well- ventilated and lighted, screened, and provided with clean water supply. It should be spacious enough to accommodate the five (5) distinct sections: 1) reception area; 2) examination room; 3) treatment room; 4) dental section; and 5) rest/recovery room, separate for male and female. It should be provided with basic equipment, medical supplies, beds, cabinets, and linen.', '2024-01-12 20:09:39', '2024-01-12 20:09:39'),
(88, 62, 'G', 'Student Center', 'A Student Center is available where students can make wholesome interaction and listen to good music, play table games, watch TV programs, etc.', '2024-01-12 20:09:51', '2024-01-12 20:09:51'),
(93, 70, 'A', 'Vision, Mission, Goals and Objectives', 'The Vision is the state the Institution hopes to become in the future. The MGO represents the hierarchy of aims of the Institution. The Mission reflects the mandate/aim of the whole state university or state college. The Goals are the aims at the hierarchical structure below the Institutional level (the academic Unit/Institute/School); and the Objectives are the aims at the program level, i. e., what the program hopes to achieve.\r\n\r\nThe Institution shall define its mission in accordance with its legal and educational development mandate and the thrusts of the government.\r\n\r\nThe program outcomes are the foci of program accreditation. These are the competencies (knowledge and skills), values and other attributes, which the Institution hopes their graduates shall acquire to enable them to compete for employment, locally and internationally', '2024-01-18 00:26:58', '2024-01-18 00:26:58'),
(94, 70, 'B', 'Dissemination and Acceptability', 'It is expected that the Institution disseminates, and work for the acceptance of the Vision, Mission, Goals and Objectives by the stakeholders. In order to facilitate awareness and acceptance, it is a good practice that the faculty, non-teaching staff, students, linkages, the community, and other stakeholders are involved in the formulation, review and/or revision of the VMGO.\r\n\r\nAn outcomes-based assessment will focus on the extent to which the program objectives are attained as shown in the outcomes. Thus, there must be a common understanding and acceptance of the end results of the program by both the faculty and the students.\r\n\r\nIt should be demonstrated that the program objectives (outcomes) are consistent with the College goals; and the College goals with the Mission of the Institution. On a long-term perspective, the accomplishment of the Mission will lead to the realization of the Vision of the Institution', '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(95, 72, 'A', 'Statement of Vision, Mission, Goals and Objectives', 'none', '2024-01-21 05:01:41', '2024-01-21 05:01:41'),
(96, 72, 'B', 'Dissemination and Acceptability', 'none', '2024-01-21 05:01:52', '2024-01-21 05:01:52'),
(97, 72, 'C', 'Congruence and Implementation', 'none', '2024-01-21 05:02:12', '2024-01-21 05:02:12'),
(98, 73, 'A', 'Academic Qualifications and Professional Experience', 'None', '2024-01-21 05:29:45', '2024-01-21 05:29:45'),
(99, 73, 'B', 'Recruitment, Selection and Orientation', 'None', '2024-01-21 05:30:01', '2024-01-21 05:30:01'),
(100, 73, 'C', 'Faculty Adequacy and Loading', 'none', '2024-01-21 05:30:14', '2024-01-21 05:30:14'),
(101, 73, 'D', 'Rank and Tenure', 'asd', '2024-01-21 05:30:23', '2024-01-21 05:30:23'),
(102, 73, 'E', 'Faculty Development', 'asdasd', '2024-01-21 05:30:31', '2024-01-21 05:30:31'),
(103, 73, 'F', 'Professional Performance and Scholarly Works', 'asd', '2024-01-21 05:30:41', '2024-01-21 05:30:41'),
(104, 73, 'G', 'Salaries, Fringe Benefits and Incentives', 'asd', '2024-01-21 05:30:53', '2024-01-21 05:30:53'),
(105, 73, 'H', 'Professionalism', 'asd', '2024-01-21 05:31:01', '2024-01-21 05:31:01'),
(106, 74, 'A', 'Curriculum and Program of Studies', 'asd', '2024-01-21 05:31:13', '2024-01-21 05:31:13'),
(107, 74, 'B', 'Instructional Process, Methodologies and Learning Opportunities', 'asd', '2024-01-21 05:31:24', '2024-01-21 05:31:24'),
(108, 74, 'C', 'Assessment of Academic Performance', 'asd', '2024-01-21 05:31:34', '2024-01-21 05:31:34'),
(109, 74, 'D', 'Classroom Management', 'asd', '2024-01-21 05:31:43', '2024-01-21 05:31:43'),
(110, 74, 'E', 'Graduation Requirements', 'asd', '2024-01-21 05:31:59', '2024-01-21 05:31:59'),
(111, 74, 'F', 'Administrative Support for Effective Instruction', 'asd', '2024-01-21 05:32:07', '2024-01-21 05:32:19'),
(112, 75, 'A', 'Student Services Program', 'asd', '2024-01-21 05:36:39', '2024-01-21 05:36:39'),
(113, 75, 'B', 'Admission and Retention', 'asd', '2024-01-21 05:36:54', '2024-01-21 05:36:54'),
(114, 75, 'C', 'Guidance Program', 'asd', '2024-01-21 05:37:00', '2024-01-21 05:37:00'),
(115, 75, 'D', 'Other Student Services', 'asd', '2024-01-21 05:37:08', '2024-01-21 05:37:08'),
(116, 75, 'E', 'Scholarships/Grants', 'asd', '2024-01-21 05:37:27', '2024-01-21 05:37:27'),
(117, 75, 'F', 'Co-curricular and Extra-curricular Programs and Activities', 'asd', '2024-01-21 05:37:36', '2024-01-21 05:37:36'),
(141, 86, 'A', 'Statement of Vision, Mission, Goals and Objectives', 'none', '2024-01-21 06:18:24', '2024-01-21 06:18:24'),
(142, 86, 'B', 'Dissemination and Acceptability', 'none', '2024-01-21 06:18:25', '2024-01-21 06:18:25'),
(143, 86, 'C', 'Congruence and Implementation', 'none', '2024-01-21 06:18:25', '2024-01-21 06:18:25'),
(144, 87, 'A', 'Academic Qualifications and Professional Experience', 'None', '2024-01-21 06:18:43', '2024-01-21 06:18:43'),
(145, 87, 'B', 'Recruitment, Selection and Orientation', 'None', '2024-01-21 06:18:43', '2024-01-21 06:18:43'),
(146, 87, 'C', 'Faculty Adequacy and Loading', 'none', '2024-01-21 06:18:43', '2024-01-21 06:18:43'),
(147, 87, 'D', 'Rank and Tenure', 'asd', '2024-01-21 06:18:43', '2024-01-21 06:18:43'),
(148, 87, 'E', 'Faculty Development', 'asdasd', '2024-01-21 06:18:43', '2024-01-21 06:18:43'),
(149, 87, 'F', 'Professional Performance and Scholarly Works', 'asd', '2024-01-21 06:18:43', '2024-01-21 06:18:43'),
(150, 87, 'G', 'Salaries, Fringe Benefits and Incentives', 'asd', '2024-01-21 06:18:43', '2024-01-21 06:18:43'),
(151, 87, 'H', 'Professionalism', 'asd', '2024-01-21 06:18:43', '2024-01-21 06:18:43'),
(152, 88, 'A', 'Curriculum and Program of Studies', 'asd', '2024-01-21 06:18:52', '2024-01-21 06:18:52'),
(153, 88, 'B', 'Instructional Process, Methodologies and Learning Opportunities', 'asd', '2024-01-21 06:18:52', '2024-01-21 06:18:52'),
(154, 88, 'C', 'Assessment of Academic Performance', 'asd', '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(155, 88, 'D', 'Classroom Management', 'asd', '2024-01-21 06:18:53', '2024-01-21 06:18:53'),
(156, 88, 'E', 'Graduation Requirements', 'asd', '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(157, 88, 'F', 'Administrative Support for Effective Instruction', 'asd', '2024-01-21 06:18:54', '2024-01-21 06:18:54'),
(158, 89, 'A', 'Student Services Program', 'asd', '2024-01-21 06:19:04', '2024-01-21 06:19:04'),
(159, 89, 'B', 'Admission and Retention', 'asd', '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(160, 89, 'C', 'Guidance Program', 'asd', '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(161, 89, 'D', 'Other Student Services', 'asd', '2024-01-21 06:19:05', '2024-01-21 06:19:05'),
(162, 89, 'E', 'Scholarships/Grants', 'asd', '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(163, 89, 'F', 'Co-curricular and Extra-curricular Programs and Activities', 'asd', '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(164, 90, 'A', 'Priorities and Relevance', 'asd', '2024-01-21 09:12:38', '2024-01-21 09:12:38'),
(165, 90, 'B', 'Funding and other Resources', 'ASD', '2024-01-21 09:14:11', '2024-01-21 09:14:11'),
(166, 90, 'C', 'Implementation, Monitoring, Evaluation and Utilization of Research Results/Outputs', 'ASD', '2024-01-21 09:15:56', '2024-01-21 09:15:56'),
(167, 90, 'D', 'Publication and Dissemination', 'ASD', '2024-01-21 09:18:52', '2024-01-21 09:18:52'),
(168, 91, 'A', 'Priorities and Relevance', 'asd', '2024-01-21 09:21:29', '2024-01-21 09:21:29'),
(169, 91, 'B', 'Planning, Implementation, Monitoring and Evaluation', 'SAD', '2024-01-21 09:22:10', '2024-01-21 09:26:41'),
(170, 91, 'C', 'Community Involvement and Participation in the Extension Activities', 'SDF', '2024-01-21 09:22:17', '2024-01-21 09:22:17'),
(171, 92, 'A', 'Administration', 'ASD', '2024-01-21 09:35:02', '2024-01-21 09:35:02'),
(172, 92, 'B', 'Staff/Personnel', 'SAD', '2024-01-21 09:35:16', '2024-01-21 09:35:16'),
(173, 92, 'C', 'Collection, Development, Organization and Preservation', 'ASD', '2024-01-21 09:35:30', '2024-01-21 09:35:30'),
(174, 92, 'D', 'Services and Utilization', 'SDD', '2024-01-21 09:35:43', '2024-01-21 09:35:43'),
(175, 92, 'E', 'Physical Set-up and Facilities', 'ASD', '2024-01-21 09:35:54', '2024-01-21 09:35:54'),
(176, 92, 'F', 'Financial support', 'ASD', '2024-01-21 09:36:08', '2024-01-21 09:36:08'),
(177, 92, 'G', 'Linkages', 'ASD', '2024-01-21 09:36:22', '2024-01-21 09:36:22'),
(178, 93, 'A', 'Site', 'asd', '2024-01-21 09:47:40', '2024-01-21 09:47:40'),
(179, 93, 'B', 'Campus', 'ASD', '2024-01-21 09:47:54', '2024-01-21 09:47:54'),
(180, 93, 'C', 'Buildings', 'ASD', '2024-01-21 09:48:06', '2024-01-21 09:48:06'),
(181, 93, 'D', 'Classrooms (Four ocular inspection)', 'SAD', '2024-01-21 09:48:18', '2024-01-21 09:48:18'),
(182, 93, 'E', 'Offices, Function Rooms and Staff Rooms (for ocular inspection', 'ASD', '2024-01-21 09:48:31', '2024-01-21 09:48:31'),
(183, 93, 'F', 'Assembly and Athletic Facilities (For ocular inspection)', 'ASD', '2024-01-21 09:48:43', '2024-01-21 09:48:43'),
(184, 93, 'G', 'Medical and Dental Clinic', 'ASD', '2024-01-21 09:49:06', '2024-01-21 09:49:06'),
(185, 93, 'H', 'Student Center (For ocular inspection)', 'ASD', '2024-01-21 09:49:20', '2024-01-21 09:49:20'),
(186, 93, 'I', 'Food Service/Canteen (For ocular inspection)', 'ASD', '2024-01-21 09:50:21', '2024-01-21 09:50:21'),
(187, 93, 'K', 'Housing (Optional)', 'ASD', '2024-01-21 09:50:36', '2024-01-21 09:53:20'),
(189, 93, 'J', 'Accreditation Center (For ocular inspection)', 'ASD', '2024-01-21 09:53:39', '2024-01-21 09:53:39'),
(190, 94, 'A', 'Laboratories/Shops/Facilities', 'ASD', '2024-01-21 10:06:42', '2024-01-21 10:06:42'),
(191, 94, 'B', 'Equipment and Supplies', 'SAD', '2024-01-21 10:07:27', '2024-01-21 10:07:27'),
(192, 94, 'C', 'Maintenance', 'SADS', '2024-01-21 10:08:04', '2024-01-21 10:08:04'),
(193, 94, 'D', 'Special Provisions', 'ASD', '2024-01-21 10:08:59', '2024-01-21 10:08:59'),
(194, 95, 'A', 'Organization', 'ASD', '2024-01-21 10:17:41', '2024-01-21 10:17:41'),
(195, 95, 'B', 'Academic Administration', 'SDA', '2024-01-21 10:17:51', '2024-01-21 10:17:51'),
(196, 95, 'C', 'Student Administration', 'ASD', '2024-01-21 10:18:01', '2024-01-21 10:18:01'),
(197, 95, 'D', 'Financial Management', 'ASD', '2024-01-21 10:18:10', '2024-01-21 10:18:10'),
(198, 95, 'E', 'Supply Management', 'ASD', '2024-01-21 10:18:20', '2024-01-21 10:18:20'),
(199, 95, 'F', 'Records Management', 'ASD', '2024-01-21 10:18:29', '2024-01-21 10:18:29'),
(200, 95, 'G', 'Institutional Planning and Development', 'asd', '2024-01-21 10:18:44', '2024-01-21 10:18:44'),
(201, 63, 'A', 'Campus', 'The site should be located in a wholesome environment, safe from traffic and transportation hazards, sufficiently free from noise, dust, smoke, and other undesirable elements. It should be provided with adequate facilities for drainage and sewage disposal. It should be adequate to meet the needs of the present school population and its future expansion. The school should be accessible to present and anticipated school population by means of public and private transportation. It should have satisfactory road network and sidewalks. The campus should be so planned that it would be adequate for the intellectual, social, physical and cultural interests of the Institution. It should be kept in good condition and physical appearance.', '2024-01-23 03:57:46', '2024-01-23 04:00:15'),
(202, 63, 'B', 'Buildings', 'The buildings should be functionally designed and constructed of strong and durable materials to withstand natural calamities like earthquakes, typhoons, and fire. Their design should be pleasing to the eye and in conformity with the surroundings. At the same time, these are imbued with the proper atmosphere conducive to learning. Likewise, there should be provisions for disabled persons.\r\nThey should anticipate to accommodate future expansion needs. Entrance and exit points should be well-planned to insure safe and convenient mobility of the school population and the transacting public. Stairways and fire exits should be adequate and standard in size and number, and conveniently located. No obstruction along the corridors impede the free flow of movement and physical activity.', '2024-01-23 03:57:56', '2024-01-23 04:00:28'),
(203, 63, 'C', 'Classrooms', 'The size and number of classrooms should be in accordance with the standards and sufficient to accommodate the student population. Classrooms should be adequately equipped with the required furniture, blackboards/whiteboards, and should have a pleasant atmosphere. Lighting, ventilation, general appearance, and acoustics should be satisfactory.', '2024-01-23 03:58:07', '2024-01-23 04:00:44'),
(204, 63, 'D', 'Offices, Staff and Function Rooms', 'Adequate provisions should be made for administrative offices, faculty rooms, and reception areas, where needed.', '2024-01-23 03:58:39', '2024-01-23 04:00:54'),
(205, 63, 'E', 'Assembly and Athletic Facilities', 'Group assembly facilities should have a seating capacity adequate to meet the needs of the Institution. These facilities should be designed with good acoustics and proper ventilation. Necessary facilities and equipment should be adequate and kept in good condition. Athletic facilities should be accessible to the students, and must be sufficient in number and variety, depending on the requirements of the school population. There should be suitable arrangements for athletic activities during the rainy season.', '2024-01-23 03:58:51', '2024-01-23 04:01:04'),
(206, 63, 'F', 'Medical and Dental Clinic', 'A medical and dental clinic should be properly set-up, strategically located, well- ventilated and lighted, screened, and provided with clean water supply. It should be spacious enough to accommodate the five (5) distinct sections: 1) reception area; 2) examination room; 3) treatment room; 4) dental section; and 5) rest/recovery room, separate for male and female. It should be provided with basic equipment, medical supplies, beds, cabinets, and linen.', '2024-01-23 03:59:03', '2024-01-23 04:01:20'),
(207, 63, 'G', 'Student Center', 'A Student Center is available where students can make wholesome interaction and listen to good music, play table games, watch TV programs, etc.', '2024-01-23 03:59:11', '2024-01-23 04:01:40'),
(208, 63, 'H', 'Food Services/Canteen', 'Clean and sanitary food services unit/canteen must be set up and managed effectively. It should serve balanced yet affordable meals and snacks to the school community.', '2024-01-23 03:59:22', '2024-01-23 04:01:50'),
(209, 63, 'I', 'Accreditation Center', 'There should be a properly maintained and equipped Accreditation Center with necessary facilities.', '2024-01-23 03:59:32', '2024-01-23 04:02:04'),
(210, 63, 'J', 'Housing', 'Housing should be maintained and provided with electricity and water. should have proper drainage and waste disposal system.', '2024-01-23 03:59:41', '2024-01-23 04:02:15'),
(211, 65, 'A', 'Organization', 'An educational institution should have a Governing Board of Regents/Trustees. Board has the responsibility to formulate general policies. The policies should be Implemented by a sufficient number qualified officials duly appointed/designated for the purpose. A detailed description of the organizational set-up of the whole Institution under survey should be found in an official document.', '2024-01-24 05:28:46', '2024-01-25 03:50:54'),
(212, 65, 'B', 'Academic Administration', 'An educational institution should have a Governing Board of Regents/Trustees. Board has the responsibility to formulate general policies. The policies should be Implemented by a sufficient number qualified officials duly appointed/designated for the purpose. A detailed description of the organizational set-up of the whole Institution under survey should be found in an official document.', '2024-01-24 05:28:57', '2024-01-25 03:51:03'),
(213, 65, 'C', 'Student Administration', 'The following activities fall under this Area: admission and retention policies; registration, school fees, academic load, transfers, residence, course work, scholastic and graduation requirements, examination and grading system, scholarship/grants, shifting and adding/dropping of course, code of conduct and discipline, availability of a student handbook, and organization of the recorded data for statistical use.', '2024-01-24 05:29:04', '2024-01-25 03:51:26'),
(214, 65, 'D', 'Financial Management', 'The business administration of the Institution should be well- maintained and managed by qualified and competent personnel. Business functions are well-delineated to promote fiscal Integrity, economy, responsibility and accountability. Financial management includes budgeting, accounting, auditing, requisition and purchase of supplies, and the preparation of financial reports. The effectiveness in the performance of the business services and sound financial management are Indicators of a healthy financial administration.', '2024-01-24 05:29:12', '2024-01-25 03:51:45'),
(215, 65, 'E', 'Supply Management', 'Supplies support the operations of the Institution. The Institution therefore should have a scheme of managing supplies, materials and equipment. While committees may assist the Institution in the procurement of these supplies/materials/equipment, a supply management office takes charge of their procurement distribution and storage.', '2024-01-24 05:29:29', '2024-01-25 03:51:55'),
(216, 65, 'F', 'Records Management', 'Records and reports Include: minutes of the board meetings, minutes of faculty meetings, faculty directory; records of faculty training and experience; records of enrolment by class, gender and course; students’ directory; alumni directory; recorded data for statistical use; Inventory of property; reports of administrative officials; summary of disciplinary matters; records of scholarships granted, etc. Adequate, accurate, accessible, up-to-date and systematic records are Indicators of sound records management.', '2024-01-24 05:29:37', '2024-01-25 03:52:06'),
(217, 65, 'G', 'Institutional Planning and Development', 'Sound Institutional planning should show concern for, and attention to, the following: congruence with the institutional vision and mission, academic unit’s goals and program objectives; alignment with national, regional, and local goals and needs; adequate allocation of resources; participation of all sectors of the academic community in the planning process; formal documentation of all plans and progress of implementation; long- and short-term dimensions of planning; and mechanisms for periodic review, evaluation and updating. A Planning Officer should be responsible for the coordination of the planning activity.', '2024-01-24 05:29:45', '2024-01-25 03:52:18'),
(218, 65, 'H', 'Performance of Administrative Personnel', 'The administrative personnel should be qualified to perform the various administrative services. The performance evaluation of the personnel should include: (1) competence; (2) quality of work; (3) work ethic; (4) creative ability; (5) interpersonal relations; and (6) ability to handle internal and external pressures. The performance of the administrative personnel should be monitored and evaluated regularly. The efficiency of the administrative set-up and harmonious relationship among the personnel are considered significant criteria for excellence.', '2024-01-24 05:29:54', '2024-01-25 03:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `parameter_ratings`
--

CREATE TABLE `parameter_ratings` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `rating` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parameter_ratings`
--

INSERT INTO `parameter_ratings` (`id`, `user_id`, `parameter_id`, `accreditation_id`, `rating`, `created_at`, `updated_at`) VALUES
(32, 3, 49, 31, 3.18, '2024-01-21 19:28:54', '2024-01-21 19:28:54'),
(33, 3, 50, 31, 1.00, '2024-01-21 19:31:17', '2024-01-21 19:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `parameter_reports`
--

CREATE TABLE `parameter_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `system_remarks` text NOT NULL,
  `system_status` text NOT NULL,
  `implementation_remarks` text NOT NULL,
  `implementation_status` text NOT NULL,
  `outcome_remarks` text NOT NULL,
  `outcome_status` text NOT NULL,
  `observation` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('aaron.espiritulopez07@gmail.com', '$2y$10$sBuPjHJPdR6HT8kHJZKg9O6E6zwwJIGDpMjS72o2wwYvAgYhdOzQu', '2023-11-29 00:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `program`, `created_at`, `updated_at`) VALUES
(1, 'Administration', '2023-09-18 03:28:47', '2023-09-18 03:28:47'),
(2, 'Bachelor of Science in Information Technology', '2023-09-18 03:39:49', '2023-09-18 03:39:49'),
(3, 'Bachelor of Science in Civil Engineering', '2023-09-18 03:39:53', '2023-09-18 03:40:33'),
(4, 'Bachelor of Science in Electrical Engineering', '2023-09-18 03:39:56', '2023-09-18 03:39:56'),
(5, 'Bachelor of Science in Mechanical Engineering', '2023-09-18 03:40:00', '2023-09-18 03:40:38'),
(6, 'Bachelor of Science in Hospitality Management', '2023-09-18 03:40:05', '2023-09-18 03:40:05'),
(7, 'Bachelor of Science in Computer Engineering', '2023-09-18 03:40:14', '2023-09-18 03:40:43'),
(8, 'Bachelor of Science in Nursing', '2023-09-18 03:40:54', '2023-09-18 03:40:54'),
(9, 'Bachelor of Arts in English Language Studies', '2023-09-18 03:41:19', '2023-09-18 03:41:19'),
(10, 'Bachelor of Science in Architecture', '2023-09-18 03:41:31', '2023-09-18 03:41:31'),
(11, 'Bachelor of Science in Mathematics', '2023-09-18 03:41:47', '2023-09-18 03:41:47'),
(12, 'Bachelor of Science in Agricultural Engineering', '2023-09-18 03:42:09', '2023-09-18 03:42:09'),
(13, 'Bachelor of Early Childhood Education', '2023-09-18 03:44:16', '2023-09-18 03:44:16'),
(14, 'Bachelor of Secondary Education', '2023-09-18 03:44:44', '2023-09-18 03:44:44'),
(15, 'Bachelor of Science in Business Administration', '2023-09-18 03:59:35', '2023-09-18 03:59:35'),
(16, 'Bachelor in Public Administration', '2023-09-18 03:59:53', '2023-11-29 00:37:19'),
(17, 'Bachelor of Arts in Economics', '2023-09-18 04:01:16', '2023-09-18 04:01:16'),
(18, 'Bachelor of Science in Social Work', '2023-09-18 04:01:32', '2023-09-18 04:01:32'),
(21, 'Bachelor of Science in Agriculture', '2024-01-17 07:00:14', '2024-01-17 07:01:32'),
(22, 'Bachelor of Science in Accountancy', '2024-01-17 07:06:22', '2024-01-17 07:06:22');

-- --------------------------------------------------------

--
-- Table structure for table `program_instruments`
--

CREATE TABLE `program_instruments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program_instruments`
--

INSERT INTO `program_instruments` (`id`, `program_id`, `created_at`, `updated_at`) VALUES
(1, 2, '2024-01-10 02:20:24', '2024-01-10 10:20:24'),
(2, 3, '2024-01-21 04:57:20', '2024-01-21 12:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `program_levels`
--

CREATE TABLE `program_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `campus_id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `level` smallint(6) NOT NULL,
  `validity_from` date NOT NULL,
  `validity_to` date NOT NULL,
  `rating` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `program_levels`
--

INSERT INTO `program_levels` (`id`, `campus_id`, `program_id`, `level`, `validity_from`, `validity_to`, `rating`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 2, '2023-09-18', '2023-09-30', 4.44, '2023-09-18 03:57:14', '2024-01-12 07:33:41'),
(2, 1, 3, 0, '2023-09-18', '2023-09-25', 0.00, '2023-09-18 03:57:26', '2024-01-21 06:21:40'),
(3, 1, 9, 2, '2023-09-18', '2023-09-25', 0.00, '2023-09-18 03:57:38', '2023-09-18 03:57:38'),
(4, 4, 8, 2, '2023-09-18', '2023-09-23', 0.00, '2023-09-18 03:57:51', '2023-09-18 03:57:51'),
(5, 3, 2, 1, '2023-09-25', '2023-10-02', 0.00, '2023-09-18 03:58:01', '2024-01-12 07:52:16'),
(6, 3, 14, 2, '2023-09-18', '2023-09-25', 0.00, '2023-09-18 03:58:33', '2023-09-18 03:58:33'),
(7, 6, 16, 3, '2023-09-18', '2023-09-25', 0.00, '2023-09-18 04:00:13', '2023-11-29 00:41:51'),
(8, 6, 15, 3, '2023-09-18', '2023-09-25', 0.00, '2023-09-18 04:00:27', '2023-09-18 04:00:27'),
(10, 5, 17, 2, '2023-09-18', '2023-09-25', 0.00, '2023-09-18 04:02:20', '2023-09-18 04:02:20'),
(11, 3, 18, 1, '2023-12-03', '2023-12-10', 0.00, '2023-11-29 02:23:22', '2023-11-29 02:23:22'),
(12, 2, 10, 0, '2024-01-22', '2024-02-08', 0.00, '2024-01-15 09:35:27', '2024-01-15 09:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_component_files`
--

CREATE TABLE `sub_component_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `sub_component_id` bigint(20) UNSIGNED NOT NULL,
  `screen_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_location` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_component_messages`
--

CREATE TABLE `sub_component_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `sub_component_file_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_indicators`
--

CREATE TABLE `sub_indicators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `indicator_id` bigint(20) UNSIGNED NOT NULL,
  `sub_indicator_name` varchar(255) NOT NULL,
  `sub_indicator_desc` text NOT NULL,
  `isOptional` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_indicators`
--

INSERT INTO `sub_indicators` (`id`, `parameter_id`, `indicator_id`, `sub_indicator_name`, `sub_indicator_desc`, `isOptional`, `created_at`, `updated_at`) VALUES
(15, 49, 49, 'S.5.1', 'technical skills in Information Technology Education;', 0, '2024-01-11 04:44:00', '2024-01-11 04:44:00'),
(16, 49, 49, 'S.5.2', 'research and extension capabilities;', 0, '2024-01-11 05:06:13', '2024-01-11 05:06:48'),
(17, 49, 49, 'S.5.3', 'students’ own ideas, desirable attitudes and personal discipline;', 0, '2024-01-11 05:07:07', '2024-01-11 05:07:07'),
(18, 49, 49, 'S.5.4', 'moral character;', 0, '2024-01-11 05:07:16', '2024-01-11 05:07:16'),
(19, 49, 49, 'S.5.5', 'critical, analytical, problem solving and other higher order thinking skills; and', 0, '2024-01-11 05:07:28', '2024-01-11 05:07:28'),
(20, 49, 49, 'S.5.6', 'aesthetic and cultural values.', 0, '2024-01-11 05:07:38', '2024-01-11 05:07:38'),
(21, 50, 56, 'I.2.1', 'Vision and Mission of the Institution', 0, '2024-01-11 05:21:09', '2024-01-11 05:21:09'),
(22, 50, 56, 'I.2.2', 'Goals of the College/Academic Unit; and', 0, '2024-01-11 05:21:26', '2024-01-11 05:21:26'),
(23, 50, 56, 'I.2.3', 'Objectives of the Program.', 0, '2024-01-11 05:21:34', '2024-01-11 05:21:34'),
(24, 50, 57, 'I.3.1', 'administrators;', 0, '2024-01-11 05:22:04', '2024-01-11 05:22:04'),
(25, 50, 57, 'I.3.2', 'faculty;', 0, '2024-01-11 05:22:13', '2024-01-11 05:22:13'),
(26, 50, 57, 'I.3.3', 'students; and', 0, '2024-01-11 05:22:20', '2024-01-11 05:22:20'),
(27, 50, 57, 'I.3.4', 'other stakeholders', 0, '2024-01-11 05:22:27', '2024-01-11 05:22:27'),
(28, 50, 60, 'O.2.1', 'Vision and mission of the SUC;', 0, '2024-01-11 05:23:19', '2024-01-11 05:23:19'),
(29, 50, 60, 'O.2.2', 'Goals of the College/Academic Unit; and', 0, '2024-01-11 05:23:34', '2024-01-11 05:23:34'),
(30, 50, 60, 'O.2.3', 'Objectives of the Information Technology Education Program.', 0, '2024-01-11 05:23:43', '2024-01-11 05:23:43'),
(31, 51, 62, 'S.1.1', 'Master in Information Technology for 30% of the faculty handling ITE courses; and', 0, '2024-01-11 05:33:14', '2024-01-11 05:33:14'),
(32, 51, 62, 'S.1.2', 'BSIT or allied degrees and any of the following:', 0, '2024-01-11 05:33:20', '2024-01-11 05:33:20'),
(33, 51, 63, 'S.2.1', 'related professional experience;', 0, '2024-01-11 08:03:25', '2024-01-11 08:03:32'),
(34, 51, 63, 'S.2.2', 'computer literacy:', 0, '2024-01-11 08:03:40', '2024-01-11 08:03:40'),
(35, 51, 63, 'S.2.3', 'technical/pedagogical skills and competence;', 0, '2024-01-11 08:03:49', '2024-01-11 08:03:49'),
(36, 51, 63, 'S.2.4', 'special abilities; and', 0, '2024-01-11 08:03:57', '2024-01-11 08:03:57'),
(37, 51, 63, 'S.2.5', 'research capability.', 0, '2024-01-11 08:04:06', '2024-01-11 08:04:06'),
(38, 51, 66, 'I.1.1', 'instruction;', 0, '2024-01-11 08:04:54', '2024-01-11 08:05:11'),
(39, 51, 66, 'I.1.2', 'research;', 0, '2024-01-11 08:05:03', '2024-01-11 08:05:19'),
(40, 51, 66, 'I.1.3', 'extension;', 0, '2024-01-11 08:05:30', '2024-01-11 08:05:30'),
(41, 51, 66, 'I.1.4', 'production:', 0, '2024-01-11 08:05:41', '2024-01-11 08:05:41'),
(42, 51, 66, 'I.1.5', 'consultancy and expert service; and', 0, '2024-01-11 08:05:48', '2024-01-11 08:05:48'),
(43, 51, 66, 'I.1.6', 'publication, creative and scholarly works.', 0, '2024-01-11 08:05:56', '2024-01-11 08:05:56'),
(44, 52, 71, 'I.1.1', 'academic qualifications;', 0, '2024-01-11 09:28:31', '2024-01-11 09:28:31'),
(45, 52, 71, 'I.1.2', 'personal qualities;', 0, '2024-01-11 09:28:41', '2024-01-11 09:28:41'),
(46, 52, 71, 'I.1.3', 'communication skills;', 0, '2024-01-11 09:28:47', '2024-01-11 09:28:47'),
(47, 52, 71, 'I.1.4', 'teaching ability;', 0, '2024-01-11 09:28:53', '2024-01-11 09:28:53'),
(48, 52, 71, 'I.1.5', 'medical examination result;', 0, '2024-01-11 09:28:58', '2024-01-11 09:28:58'),
(49, 52, 71, 'I.1.6', 'psychological examination result;', 0, '2024-01-11 09:29:03', '2024-01-11 09:29:03'),
(50, 52, 71, 'I.1.7', 'relevant professional experiences; (if any)', 1, '2024-01-11 09:29:09', '2024-01-11 09:29:09'),
(51, 52, 71, 'I.1.8', 'previous record of employment, (if any)', 1, '2024-01-11 09:29:15', '2024-01-11 09:29:15'),
(52, 52, 71, 'I.1.9', 'technical/special skills & abilities, and', 1, '2024-01-11 09:29:22', '2024-01-11 09:29:22'),
(53, 52, 71, 'I.1.10', 'previous performance rating. (if any)', 1, '2024-01-11 09:29:28', '2024-01-11 09:30:16'),
(54, 52, 72, 'I.2.1', 'print media; (newspaper, flyers, CSC Bulleting of Vacant positions)', 0, '2024-01-11 09:29:59', '2024-01-11 09:29:59'),
(55, 52, 72, 'I.2.2', 'broadcast media (TV, radio);', 0, '2024-01-11 09:30:05', '2024-01-11 09:30:05'),
(56, 52, 72, 'I.2.3', 'website;', 0, '2024-01-11 09:30:25', '2024-01-11 09:30:25'),
(57, 52, 72, 'I.2.4', 'bulletin boards; and', 0, '2024-01-11 09:30:29', '2024-01-11 09:30:29'),
(58, 52, 72, 'I.2.5', 'others (specify).', 0, '2024-01-11 09:30:35', '2024-01-11 09:30:35'),
(59, 53, 77, 'S.1.1', 'lecture (1:50)', 0, '2024-01-11 09:38:16', '2024-01-11 09:38:16'),
(60, 53, 77, 'S.1.2', 'laboratory (1:50)', 0, '2024-01-11 09:38:21', '2024-01-11 09:38:21'),
(61, 55, 107, 'I.1.1', 'upgraded educational qualification (graduate studies);', 0, '2024-01-11 09:44:03', '2024-01-11 09:44:03'),
(62, 55, 107, 'I.1.2', 'attendance to seminars, symposia and conferences for continuing education;', 0, '2024-01-11 09:44:09', '2024-01-11 09:44:09'),
(63, 55, 107, 'I.1.3', 'conduct of research activities and publication of research output: and', 0, '2024-01-11 09:44:14', '2024-01-11 09:44:14'),
(64, 55, 107, 'I.1.4', 'giving lectures and presentation of papers in national/international conferences, symposia, and seminars.', 0, '2024-01-11 09:44:20', '2024-01-11 09:44:20'),
(65, 55, 113, 'I.7.1', 'adequate and qualified supervision of faculty;', 0, '2024-01-11 09:45:30', '2024-01-11 09:45:30'),
(66, 55, 113, 'I.7.2', 'scholarships, fellowships, sabbatical leaves, and travel grants;', 0, '2024-01-11 09:45:36', '2024-01-11 09:45:36'),
(67, 55, 113, 'I.7.3', 'financial support for active membership in professional organizations;', 0, '2024-01-11 09:45:42', '2024-01-11 09:45:42'),
(68, 55, 113, 'I.7.4', 'deloading to finish the faculty’s thesis/dissertation;', 0, '2024-01-11 09:45:51', '2024-01-11 09:45:51'),
(69, 55, 113, 'I.7.5', 'attendance in continuing professional education (CPE) programs such as seminars, workshops and conferences or some in-service training courses;', 0, '2024-01-11 09:45:57', '2024-01-11 09:45:57'),
(70, 55, 113, 'I.7.6', 'conducting research activities related to the program;', 0, '2024-01-11 09:46:05', '2024-01-11 09:46:05'),
(71, 55, 113, 'I.7.7', 'publishing scholarly articles and research output;', 0, '2024-01-11 09:46:12', '2024-01-11 09:46:12'),
(72, 55, 113, 'I.7.8', 'production of instructional materials (IM’s).', 0, '2024-01-11 09:46:18', '2024-01-11 09:46:18'),
(73, 56, 119, 'S.1.1', 'professional performance; and', 0, '2024-01-11 09:47:35', '2024-01-11 09:57:30'),
(74, 56, 119, 'S.1.2', 'scholarly works.', 0, '2024-01-11 09:47:40', '2024-01-11 09:47:40'),
(75, 56, 120, 'I.1.1', 'knowledge of the program objectives/outcome(s);', 0, '2024-01-11 09:48:04', '2024-01-11 09:48:04'),
(76, 56, 120, 'I.1.2', 'reflecting the program outcomes in the course objectives;', 0, '2024-01-11 09:48:10', '2024-01-11 09:48:10'),
(77, 56, 120, 'I.1.3', 'knowledge mastery of the content, issues and methodologies in the discipline;', 0, '2024-01-11 09:48:16', '2024-01-11 09:48:16'),
(78, 56, 120, 'I.1.4', 'proficiency in the use of the language of instruction;', 0, '2024-01-11 09:48:22', '2024-01-11 09:48:22'),
(79, 56, 120, 'I.1.5', 'the use of higher order thinking skills such as analytical, critical, creative and innovative and problem solving;', 0, '2024-01-11 09:48:28', '2024-01-11 09:48:28'),
(80, 56, 120, 'I.1.6', 'innovativeness and resourcefulness in the different instructional processes; and', 0, '2024-01-11 09:48:32', '2024-01-11 09:48:32'),
(81, 56, 120, 'I.1.7', 'integration of values and work ethics in the teaching-learning process; and', 0, '2024-01-11 09:48:38', '2024-01-11 09:48:38'),
(82, 56, 120, 'I.1.8', 'integration of Gender and Development (GAD) activities.', 0, '2024-01-11 09:48:44', '2024-01-11 09:48:44'),
(83, 57, 134, 'I.1.1', 'maternity leave/paternity leave with pay;', 0, '2024-01-11 10:00:39', '2024-01-11 10:00:39'),
(84, 57, 134, 'I.1.2', 'sick leave;', 0, '2024-01-11 10:00:43', '2024-01-11 10:00:43'),
(85, 57, 134, 'I.1.3', 'study leave (with or without pay);', 0, '2024-01-11 10:00:47', '2024-01-11 10:00:47'),
(86, 57, 134, 'I.1.4', 'vacation leave;', 0, '2024-01-11 10:00:52', '2024-01-11 10:00:52'),
(87, 57, 134, 'I.1.5', 'tuition fee discount for faculty and their dependents;', 0, '2024-01-11 10:00:57', '2024-01-11 10:00:57'),
(88, 57, 134, 'I.1.6', 'clothing/uniform allowance;', 0, '2024-01-11 10:01:01', '2024-01-11 10:01:01'),
(89, 57, 134, 'I.1.7', 'performance-based bonus (PBB);', 0, '2024-01-11 10:01:06', '2024-01-11 10:01:06'),
(90, 57, 134, 'I.1.8', 'anniversary bonus;', 0, '2024-01-11 10:01:10', '2024-01-11 10:01:10'),
(91, 57, 134, 'I.1.9', 'honoraria/ incentive for conducting research or for the production of scholarly works;', 0, '2024-01-11 10:01:15', '2024-01-11 10:01:15'),
(92, 57, 134, 'I.1.10', 'housing privilege;', 1, '2024-01-11 10:01:22', '2024-01-11 10:01:22'),
(93, 57, 134, 'I.1.11', 'sabbatical leave;', 0, '2024-01-11 10:01:37', '2024-01-11 10:01:37'),
(94, 57, 134, 'I.1.12', 'compensatory leave credit;', 0, '2024-01-11 10:16:12', '2024-01-11 10:16:12'),
(95, 57, 134, 'I.1.13', 'deloading to finish thesis/dissertation;', 0, '2024-01-11 10:16:17', '2024-01-11 10:16:17'),
(96, 57, 134, 'I.1.14', 'thesis/dissertation aid; and', 0, '2024-01-11 10:16:23', '2024-01-11 10:16:23'),
(97, 57, 134, 'I.1.15', 'others, (please specify).', 0, '2024-01-11 10:16:27', '2024-01-11 10:16:27'),
(98, 58, 142, 'I.1.1', 'regular and prompt attendance to classes;', 0, '2024-01-11 10:17:46', '2024-01-11 10:17:46'),
(99, 58, 142, 'I.1.2', 'participate in faculty meeting and university/college activities;', 0, '2024-01-11 10:17:50', '2024-01-11 10:17:50'),
(100, 58, 142, 'I.1.3', 'completion of assigned tasks on time;', 0, '2024-01-11 10:17:54', '2024-01-11 10:17:54'),
(101, 58, 142, 'I.1.4', 'submission of all required reports promptly; and', 0, '2024-01-11 10:17:59', '2024-01-11 10:17:59'),
(102, 58, 142, 'I.1.5', 'decorum at all times.', 0, '2024-01-11 10:18:04', '2024-01-11 10:18:04'),
(103, 58, 145, 'I.4.1', 'observance of official time;', 0, '2024-01-11 10:18:52', '2024-01-11 10:18:52'),
(104, 58, 145, 'I.4.2', 'productive use of official time;', 0, '2024-01-11 10:19:00', '2024-01-11 10:19:00'),
(105, 58, 145, 'I.4.3', 'performance of tasks and assignments, with or without compensation: and', 0, '2024-01-11 10:19:06', '2024-01-11 10:19:06'),
(106, 58, 145, 'I.4.4', 'compliance with terms of agreement/contracts (e.g. scholarship and training).', 0, '2024-01-11 10:19:16', '2024-01-11 10:19:16'),
(107, 59, 151, 'S.1.1', 'acquisition of knowledge and theories based on the field of specialization/discipline;', 0, '2024-01-11 10:34:53', '2024-01-11 10:34:53'),
(108, 59, 151, 'S.1.2', 'application of the theories to real problems in the field;', 0, '2024-01-11 10:34:58', '2024-01-11 10:34:58'),
(109, 59, 151, 'S.1.3', 'demonstration of skills in applying different strategies in actual work setting.', 0, '2024-01-11 10:35:03', '2024-01-11 10:35:03'),
(110, 59, 154, 'I.1.1', 'General Education - 54 units', 0, '2024-01-11 10:35:48', '2024-01-11 10:35:48'),
(111, 59, 154, 'I.1.2', 'Basic ITE Core Course - 18 units', 0, '2024-01-11 10:35:57', '2024-01-11 10:35:57'),
(112, 59, 154, 'I.1.3', 'Professional Courses - 33 units', 0, '2024-01-11 10:36:06', '2024-01-11 10:36:06'),
(113, 59, 154, 'I.1.4', 'ITE Elective - 12 units', 0, '2024-01-11 10:36:15', '2024-01-11 10:36:15'),
(114, 59, 154, 'I.1.5', 'Free Elective - 9 units', 0, '2024-01-11 10:36:25', '2024-01-11 10:36:25'),
(115, 59, 154, 'I.1.6', 'PE - 8 units', 0, '2024-01-11 10:36:35', '2024-01-11 10:36:35'),
(116, 59, 154, 'I.1.7', 'NSTP - 6 units', 0, '2024-01-11 10:36:44', '2024-01-11 10:36:44'),
(117, 59, 160, 'I.7.1', 'participative planning and designing of the curriculum by the following stakeholders;', 0, '2024-01-11 10:37:49', '2024-01-11 10:37:49'),
(118, 59, 160, 'I.7.2', 'periodic review, assessment, updating and approval of the curriculum by the Academic Council;', 0, '2024-01-11 10:38:41', '2024-01-11 10:38:41'),
(119, 59, 160, 'I.7.3', 'confirmation of the curriculum by the Board of Regents/Trustees (BOR/BOT).', 0, '2024-01-11 10:38:49', '2024-01-11 10:38:49'),
(120, 59, 160, 'I.7.4', 'others (please specify)', 0, '2024-01-11 10:38:56', '2024-01-11 10:38:56'),
(121, 60, 174, 'I.6.1', 'symposia, seminars, workshops, professional lectures;', 0, '2024-01-11 10:41:51', '2024-01-11 10:41:51'),
(122, 60, 174, 'I.6.2', 'education tours/learning visits/other co-curricular activities;', 0, '2024-01-11 10:42:00', '2024-01-11 10:42:00'),
(123, 60, 174, 'I.6.3', 'peer teaching/ cooperative learning; and', 0, '2024-01-11 10:42:06', '2024-01-11 10:42:06'),
(124, 60, 174, 'I.6.4', 'computer-assisted instruction (CIA) and computer-assisted learning (CAL).', 0, '2024-01-11 10:42:11', '2024-01-11 10:42:11'),
(125, 60, 175, 'I.7.1', 'group/individual projects;', 0, '2024-01-11 10:42:44', '2024-01-11 10:42:51'),
(126, 60, 175, 'I.7.2', 'group/individual reports;', 0, '2024-01-11 10:42:59', '2024-01-11 10:42:59'),
(127, 60, 175, 'I.7.3', 'group/individual term papers;', 0, '2024-01-11 10:43:04', '2024-01-11 10:43:04'),
(128, 60, 175, 'I.7.4', 'performance activities;', 0, '2024-01-11 10:43:13', '2024-01-11 10:43:13'),
(129, 60, 175, 'I.7.5', 'learning contract;', 0, '2024-01-11 10:43:20', '2024-01-11 10:43:20'),
(130, 60, 175, 'I.7.6', 'portfolio;', 0, '2024-01-11 10:43:28', '2024-01-11 10:43:28'),
(131, 60, 175, 'I.7.7', 'learning modules;', 0, '2024-01-11 10:43:38', '2024-01-11 10:43:38'),
(132, 60, 175, 'I.7.8', 'research study; and', 0, '2024-01-11 10:43:53', '2024-01-11 10:43:53'),
(133, 60, 175, 'I.7.9', 'others (please specify)', 0, '2024-01-11 10:43:58', '2024-01-11 10:43:58'),
(134, 60, 176, 'I.8.1', 'film showing;', 0, '2024-01-11 10:44:20', '2024-01-11 10:44:20'),
(135, 60, 176, 'I.8.2', 'projects;', 0, '2024-01-11 10:44:28', '2024-01-11 10:44:28'),
(136, 60, 176, 'I.8.3', 'group dynamics;', 0, '2024-01-11 10:44:34', '2024-01-11 10:44:34'),
(137, 60, 176, 'I.8.4', 'case study;', 0, '2024-01-11 10:44:39', '2024-01-11 10:44:39'),
(138, 60, 176, 'I.8.5', 'workshop;', 0, '2024-01-11 10:44:46', '2024-01-11 10:44:46'),
(139, 60, 176, 'I.8.6', 'simulation;', 0, '2024-01-11 10:44:53', '2024-01-11 10:44:53'),
(140, 60, 176, 'I.8.7', 'dimensional question approach;', 0, '2024-01-11 10:44:58', '2024-01-11 10:44:58'),
(141, 60, 176, 'I.8.8', 'brainstorming;', 0, '2024-01-11 10:45:06', '2024-01-11 10:45:06'),
(142, 60, 176, 'I.8.9', 'buzz section;', 0, '2024-01-11 10:45:13', '2024-01-11 10:45:13'),
(143, 60, 176, 'I.8.10', 'informal creative groups;', 0, '2024-01-11 10:45:26', '2024-01-11 10:45:26'),
(144, 60, 176, 'I.8.11', 'interactive learning;', 0, '2024-01-11 10:45:32', '2024-01-11 10:45:32'),
(145, 60, 176, 'I.8.12', 'team teaching;', 0, '2024-01-11 10:45:40', '2024-01-11 10:45:40'),
(146, 60, 176, 'I.8.13', 'micro teaching;', 0, '2024-01-11 10:45:47', '2024-01-11 10:45:47'),
(147, 60, 176, 'I.8.14', 'macro teaching;', 0, '2024-01-11 10:46:00', '2024-01-11 10:46:00'),
(148, 60, 176, 'I.8.15', 'tandem teaching;', 0, '2024-01-11 10:46:06', '2024-01-11 10:46:06'),
(149, 60, 176, 'I.8.16', 'peer teaching;', 0, '2024-01-11 10:46:12', '2024-01-11 10:46:12'),
(150, 60, 176, 'I.8.17', 'multi-media/ courseware/ teachware;', 0, '2024-01-11 10:46:19', '2024-01-11 10:46:19'),
(151, 60, 176, 'I.8.18', 'experiments;', 0, '2024-01-11 10:46:26', '2024-01-11 10:46:26'),
(152, 60, 176, 'I.8.19', 'problem-solving;', 0, '2024-01-11 10:46:32', '2024-01-11 10:46:32'),
(153, 60, 176, 'I.8.20', 'type study methods;', 0, '2024-01-11 10:46:38', '2024-01-11 10:46:38'),
(154, 60, 176, 'I.8.21', 'reporting;', 0, '2024-01-11 10:46:47', '2024-01-11 10:46:47'),
(155, 60, 176, 'I.8.22', 'panel discussion; and', 0, '2024-01-11 10:46:53', '2024-01-11 10:46:53'),
(156, 60, 176, 'I.8.23', 'others (please specify)', 0, '2024-01-11 10:47:00', '2024-01-11 10:47:00'),
(157, 60, 178, 'I.10.1', 'submission of approved and updated syllabus per course;', 0, '2024-01-11 10:47:35', '2024-01-11 10:47:35'),
(158, 60, 178, 'I.10.2', 'regular classroom observation/supervision;', 0, '2024-01-11 10:47:41', '2024-01-11 10:47:41'),
(159, 60, 178, 'I.10.3', 'regular faculty meetings with the College/Academic Unit/Dean/Department Chair;', 0, '2024-01-11 10:47:47', '2024-01-11 10:47:47'),
(160, 60, 178, 'I.10.4', 'regular faculty performance evaluation;', 0, '2024-01-11 10:47:58', '2024-01-11 10:47:58'),
(161, 60, 178, 'I.10.5', 'attendance/participation of faculty in in-service training;', 0, '2024-01-11 10:48:04', '2024-01-11 10:48:04'),
(162, 60, 178, 'I.10.6', 'conduct of experimental classes; and', 0, '2024-01-11 10:48:12', '2024-01-11 10:48:12'),
(163, 60, 178, 'I.10.7', 'adoption of alternative instructional delivery models such as modular instruction, e-learning and on-line study.', 0, '2024-01-11 10:48:18', '2024-01-11 10:48:18'),
(164, 61, 186, 'S.1.1', 'formative tests such as quizzes, units tests;', 0, '2024-01-11 10:52:50', '2024-01-11 10:52:50'),
(165, 61, 186, 'S.1.2', 'formative tests such as quizzes, units tests;', 0, '2024-01-11 10:52:55', '2024-01-11 10:52:55'),
(166, 61, 186, 'S.1.3', 'project and term papers;', 0, '2024-01-11 10:52:58', '2024-01-11 10:52:58'),
(167, 61, 186, 'S.1.4', 'practicum and performance test; and', 0, '2024-01-11 10:53:03', '2024-01-11 10:53:03'),
(168, 61, 186, 'S.1.5', 'other course requirements.', 0, '2024-01-11 10:53:07', '2024-01-11 10:53:07'),
(169, 61, 187, 'S.2.1', 'comprehensive enough to test the different levels of cognitive skills and knowledge of content; and', 0, '2024-01-11 10:53:29', '2024-01-11 10:53:29'),
(170, 61, 187, 'S.2.2', 'based on well-designed Table of Specifications (TOS).', 0, '2024-01-11 10:53:49', '2024-01-11 10:53:49'),
(171, 61, 188, 'I.1.1', 'portfolio;', 0, '2024-01-11 10:54:17', '2024-01-11 10:54:17'),
(172, 61, 188, 'I.1.2', 'rubric assessment;', 0, '2024-01-11 10:54:24', '2024-01-11 10:54:24'),
(173, 61, 188, 'I.1.3', 'skills demonstration;', 0, '2024-01-11 10:54:30', '2024-01-11 10:54:30'),
(174, 61, 188, 'I.1.4', 'paper and pencil tests;', 0, '2024-01-11 10:55:23', '2024-01-11 10:55:23'),
(175, 61, 188, 'I.1.5', 'oral examinations;', 0, '2024-01-11 10:55:27', '2024-01-11 10:55:27'),
(176, 61, 188, 'I.1.6', 'group/individual reports;', 0, '2024-01-11 10:55:33', '2024-01-11 10:55:33'),
(177, 61, 188, 'I.1.7', 'group/individual study; and', 0, '2024-01-11 10:55:37', '2024-01-11 10:55:37'),
(178, 61, 188, 'I.1.8', 'others (please specify)', 0, '2024-01-11 10:55:42', '2024-01-11 10:55:42'),
(179, 61, 193, 'I.6.1', 'students;', 0, '2024-01-11 10:56:31', '2024-01-11 10:56:31'),
(180, 61, 193, 'I.6.2', 'faculty;', 0, '2024-01-11 10:56:37', '2024-01-11 10:56:37'),
(181, 61, 193, 'I.6.3', 'academic administrators; and', 0, '2024-01-11 10:56:42', '2024-01-11 10:56:42'),
(182, 61, 193, 'I.6.4', 'parents/guardians.', 0, '2024-01-11 10:56:47', '2024-01-11 10:56:47'),
(183, 62, 196, 'S.1.1', 'student attendance in class and other academic activities;', 0, '2024-01-11 21:11:28', '2024-01-11 21:11:28'),
(184, 62, 196, 'S.1.2', 'schedule of classes;', 0, '2024-01-11 21:11:33', '2024-01-11 21:11:33'),
(185, 62, 196, 'S.1.3', 'student discipline; and', 0, '2024-01-11 21:11:40', '2024-01-11 21:11:40'),
(186, 62, 196, 'S.1.4', 'maintenance of cleanliness and orderliness.', 0, '2024-01-11 21:11:46', '2024-01-11 21:11:46'),
(187, 62, 200, 'I.4..1', '48 sqm.  – 25 students', 0, '2024-01-11 21:12:35', '2024-01-11 21:12:35'),
(188, 62, 200, 'I.4..2', '60 sqm. – 50 students', 0, '2024-01-11 21:12:40', '2024-01-11 21:12:40'),
(189, 62, 203, 'I.7.1', 'projects/reports;', 0, '2024-01-11 21:13:11', '2024-01-11 21:13:11'),
(190, 62, 203, 'I.7.2', 'thesis; and', 0, '2024-01-11 21:13:17', '2024-01-11 21:13:17'),
(191, 62, 203, 'I.7.3', 'others (please specify)', 0, '2024-01-11 21:13:26', '2024-01-11 21:13:26'),
(192, 64, 213, 'S.1.1', 'substitution or special arrangements whenever a faculty is on leave or absent;', 0, '2024-01-11 21:15:18', '2024-01-11 21:15:18'),
(193, 64, 213, 'S.1.2', 'giving awards and/or recognition for faculty and students with outstanding achievements; and', 0, '2024-01-11 21:15:23', '2024-01-11 21:15:23'),
(194, 64, 213, 'S.1.3', 'supervision/monitoring and evaluation of faculty performance.', 0, '2024-01-11 21:15:27', '2024-01-11 21:15:27'),
(195, 64, 215, 'I.2.1', 'faculty; and', 0, '2024-01-11 21:16:01', '2024-01-11 21:16:01'),
(196, 64, 215, 'I.2.2', 'students', 0, '2024-01-11 21:16:09', '2024-01-11 21:16:09'),
(197, 64, 216, 'I.3.1', 'conducting seminar/workshops on syllabi making;', 0, '2024-01-11 21:16:30', '2024-01-11 21:16:30'),
(198, 64, 216, 'I.3.2', 'holding workshops on test construction and the corresponding table of specifications;', 0, '2024-01-11 21:16:37', '2024-01-11 21:16:37'),
(199, 64, 216, 'I.3.3', 'conducting competency assessment;', 0, '2024-01-11 21:16:42', '2024-01-11 21:16:42'),
(200, 64, 216, 'I.3.4', 'conducting supervisory visit of classes and providing assistance, if necessary;', 0, '2024-01-11 21:16:48', '2024-01-11 21:16:48'),
(201, 64, 216, 'I.3.5', 'holding of regular faculty meetings;', 0, '2024-01-11 21:16:53', '2024-01-11 21:16:53'),
(202, 64, 216, 'I.3.6', 'requiring consultations between students and faculty;', 0, '2024-01-11 21:17:00', '2024-01-11 21:17:00'),
(203, 64, 216, 'I.3.7', 'conducting studies on academic performances of students; and', 0, '2024-01-11 21:17:06', '2024-01-11 21:17:06'),
(204, 64, 216, 'I.3.8', 'providing opportunities for the participation of the faculty in in-service training activities.', 0, '2024-01-11 21:17:31', '2024-01-11 21:17:31'),
(205, 64, 217, 'I.4.1', 'the Dean/Academic Head/Department Chair;', 0, '2024-01-11 21:18:51', '2024-01-11 21:18:51'),
(206, 64, 217, 'I.4.2', 'the students;', 0, '2024-01-11 21:18:57', '2024-01-11 21:18:57'),
(207, 64, 217, 'I.4.3', 'the faculty member himself/herself;', 0, '2024-01-11 21:19:03', '2024-01-11 21:19:03'),
(208, 64, 217, 'I.4.4', 'peers; and', 0, '2024-01-11 21:19:08', '2024-01-11 21:19:08'),
(209, 64, 217, 'I.4.5', 'others (please specify)', 0, '2024-01-11 21:19:15', '2024-01-11 21:19:15'),
(210, 64, 220, 'I.7.1', 'inclusion in honor roll, Dean’s list, etc.;', 0, '2024-01-11 21:19:47', '2024-01-11 21:19:47'),
(211, 64, 220, 'I.7.2', 'grant of tuition scholarships;', 0, '2024-01-11 21:19:53', '2024-01-11 21:19:53'),
(212, 64, 220, 'I.7.3', 'award of honor medals and merit certificates;', 0, '2024-01-11 21:19:59', '2024-01-11 21:19:59'),
(213, 64, 220, 'I.7.4', 'membership in honor societies/honor class/ sections, etc.;', 0, '2024-01-11 21:20:05', '2024-01-11 21:20:05'),
(214, 64, 220, 'I.7.5', 'grant of special privileges such as opportunities for leadership and others (excluding exemption from major exams on all professional business subjects); and', 0, '2024-01-11 21:20:14', '2024-01-11 21:20:14'),
(215, 64, 220, 'I.7.6', 'grant of awards and recognition for outstanding academic accomplishments, e.g., Best Thesis, Student Researcher of the Year, etc.', 0, '2024-01-11 21:20:21', '2024-01-11 21:20:21'),
(216, 64, 221, 'I.8.1', 'analysis performance of graduates in the information Technology Licensure Examination; (if applicable)', 0, '2024-01-11 21:20:39', '2024-01-11 21:20:39'),
(217, 64, 221, 'I.8.2', 'employability of graduates; and', 0, '2024-01-11 21:20:44', '2024-01-11 21:20:44'),
(218, 64, 221, 'I.8.3', 'feedback from employers regarding performance of graduates.', 0, '2024-01-11 21:20:50', '2024-01-11 21:20:50'),
(219, 49, 231, 'S.5.1', 'technical skills in Information Technology Education;', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(220, 49, 231, 'S.5.2', 'research and extension capabilities;', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(221, 49, 231, 'S.5.3', 'students’ own ideas, desirable attitudes and personal discipline;', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(222, 49, 231, 'S.5.4', 'moral character;', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(223, 49, 231, 'S.5.5', 'critical, analytical, problem solving and other higher order thinking skills; and', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(224, 49, 231, 'S.5.6', 'aesthetic and cultural values.', 0, '2024-01-18 00:26:59', '2024-01-18 00:26:59'),
(225, 50, 238, 'I.2.1', 'Vision and Mission of the Institution', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(226, 50, 238, 'I.2.2', 'Goals of the College/Academic Unit; and', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(227, 50, 238, 'I.2.3', 'Objectives of the Program.', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(228, 50, 239, 'I.3.1', 'administrators;', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(229, 50, 239, 'I.3.2', 'faculty;', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(230, 50, 239, 'I.3.3', 'students; and', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(231, 50, 239, 'I.3.4', 'other stakeholders', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(232, 50, 242, 'O.2.1', 'Vision and mission of the SUC;', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(233, 50, 242, 'O.2.2', 'Goals of the College/Academic Unit; and', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(234, 50, 242, 'O.2.3', 'Objectives of the Information Technology Education Program.', 0, '2024-01-18 00:27:00', '2024-01-18 00:27:00'),
(235, 116, 334, 'E.1.1', 'list of scholarships available;', 0, '2024-01-21 05:51:30', '2024-01-21 05:51:30'),
(237, 116, 334, 'E.1.2', 'list of school privileges of scholars (stipend,\r\nfree or discounted tuition fees, food allowance,\r\netc.)', 0, '2024-01-21 05:52:13', '2024-01-21 05:52:13'),
(238, 116, 334, 'E.1.3', 'policies on the selection and retention of\r\nscholars/grantees in different categories;', 0, '2024-01-21 05:52:25', '2024-01-21 05:52:25'),
(239, 116, 334, 'E.1.4', 'a mechanism for fund generation from\r\nsponsors, benevolent individuals, agencies,\r\ninstitutions and organization; and', 0, '2024-01-21 05:52:32', '2024-01-21 05:52:32'),
(240, 116, 334, 'E.1.5', 'system of monitoring a grantee/scholar’s\r\nacademic status', 0, '2024-01-21 05:52:37', '2024-01-21 05:52:37'),
(246, 116, 529, 'E.1.1', 'list of scholarships available;', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(247, 116, 529, 'E.1.2', 'list of school privileges of scholars (stipend,\r\nfree or discounted tuition fees, food allowance,\r\netc.)', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(248, 116, 529, 'E.1.3', 'policies on the selection and retention of\r\nscholars/grantees in different categories;', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(249, 116, 529, 'E.1.4', 'a mechanism for fund generation from\r\nsponsors, benevolent individuals, agencies,\r\ninstitutions and organization; and', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(250, 116, 529, 'E.1.5', 'system of monitoring a grantee/scholar’s\r\nacademic status', 0, '2024-01-21 06:19:07', '2024-01-21 06:19:07'),
(251, 179, 648, 'B.2.1', 'traffic safety in an out of the campus;', 0, '2024-01-21 10:01:53', '2024-01-21 10:01:53'),
(252, 179, 648, 'B.2.2', 'waste management;', 0, '2024-01-21 10:02:03', '2024-01-21 10:02:03'),
(253, 179, 648, 'B.2.3', 'maintenance, repair and upkeep of property;', 0, '2024-01-21 10:02:20', '2024-01-21 10:02:20'),
(254, 179, 648, 'B.2.4', 'cleanliness and orderliness in the campus;\r\nand', 0, '2024-01-21 10:02:42', '2024-01-21 10:02:42'),
(255, 179, 648, 'B.2.5', 'Security of the academic community inside\r\nthe campus', 0, '2024-01-21 10:03:02', '2024-01-21 10:03:02'),
(256, 192, 653, 'C.1.1', 'maintenance of cleanliness and orderliness in\r\nthe laboratories;', 0, '2024-01-21 10:12:25', '2024-01-21 10:12:25'),
(257, 192, 653, 'C.1.2', 'replenishment of perishable materials;', 0, '2024-01-21 10:12:33', '2024-01-21 10:12:33'),
(258, 192, 653, 'C.1.3', 'coding and inventory; and', 0, '2024-01-21 10:12:39', '2024-01-21 10:12:39'),
(259, 192, 653, 'C.1.4', 'repairs and calibration.', 0, '2024-01-21 10:12:51', '2024-01-21 10:12:51'),
(260, 195, 698, 'B.1.1', 'Dean/Director; and', 0, '2024-01-21 10:25:11', '2024-01-21 10:25:11'),
(261, 195, 698, 'B.1.2', 'Department Chair or his/her equivalent', 0, '2024-01-21 10:25:17', '2024-01-21 10:25:17'),
(262, 65, 714, 'S.5.1', 'student welfare programs and services; and', 0, '2024-01-21 18:04:13', '2024-01-21 18:04:13'),
(263, 65, 714, 'S.5.2', 'student development programs and services.', 0, '2024-01-21 18:04:26', '2024-01-21 18:04:26'),
(264, 65, 715, 'S.6.1', 'Student Welfare;', 0, '2024-01-21 18:04:53', '2024-01-21 18:04:53'),
(265, 65, 715, 'S.6.2', 'Student Development;', 0, '2024-01-21 18:06:10', '2024-01-21 18:06:10'),
(266, 65, 715, 'S.6.3', 'Institutional Student Programs and Services;', 0, '2024-01-21 18:06:23', '2024-01-21 18:06:23'),
(267, 66, 732, 'S.3.1', 'The information materials on educational, career, personal and social concerns are readily available, such as:', 0, '2024-01-21 18:24:17', '2024-01-21 18:24:17'),
(268, 66, 732, 'S.3.2', 'Anti-Bullying Act;', 0, '2024-01-21 18:24:25', '2024-01-21 18:24:25'),
(269, 66, 732, 'S.3.3', 'Guidance on drug abuse prevention and control;', 0, '2024-01-21 18:24:33', '2024-01-21 18:24:33'),
(270, 66, 732, 'S.3.4', 'R.A. 7877 or the Anti-Sexual Harassment Act of 1995;', 0, '2024-01-21 18:24:46', '2024-01-21 18:24:46'),
(271, 66, 732, 'S.3.5', 'HIV AIDS awareness;', 0, '2024-01-21 18:24:57', '2024-01-21 18:24:57'),
(272, 66, 732, 'S.3.6', 'Self-care and healthy lifestyles; and', 0, '2024-01-21 18:25:06', '2024-01-21 18:25:06'),
(273, 66, 732, 'S.3.7', 'R.A. 9442, particularly on the provision on public ridicule and vilification against persons with disability.', 0, '2024-01-21 18:25:17', '2024-01-21 18:25:17'),
(274, 66, 733, 'S.4.1', 'information and inventory;', 0, '2024-01-21 18:25:38', '2024-01-21 18:25:38'),
(275, 66, 733, 'S.4.2', 'counseling;', 0, '2024-01-21 18:25:47', '2024-01-21 18:25:47'),
(276, 66, 733, 'S.4.3', 'appraisal and testing;', 0, '2024-01-21 18:25:54', '2024-01-21 18:25:54'),
(277, 66, 733, 'S.4.4', 'placement and follow-up; and', 0, '2024-01-21 18:26:02', '2024-01-21 18:26:02'),
(278, 66, 733, 'S.4.5', 'referral;', 0, '2024-01-21 18:26:09', '2024-01-21 18:26:09'),
(279, 66, 758, 'I.14.1', 'awards received;', 0, '2024-01-21 18:31:34', '2024-01-21 18:31:34'),
(280, 66, 758, 'I.14.2', 'key positions in private and/or government agencies; and', 0, '2024-01-21 18:31:57', '2024-01-21 18:31:57'),
(281, 66, 758, 'I.14.3', 'status of the enterprise, if applicable.', 0, '2024-01-21 18:32:06', '2024-01-21 18:32:06'),
(282, 66, 761, 'I.17.1', 'student laboratory cooperatives;', 0, '2024-01-21 18:32:48', '2024-01-21 18:32:48'),
(283, 66, 761, 'I.17.2', 'entrepreneurial activities/projects;', 0, '2024-01-21 18:32:57', '2024-01-21 18:32:57'),
(284, 66, 761, 'I.17.3', '. savings; and', 0, '2024-01-21 18:33:05', '2024-01-21 18:33:05'),
(285, 66, 761, 'I.17.4', 'others (please specify)', 0, '2024-01-21 18:33:25', '2024-01-21 18:33:25'),
(286, 67, 773, 'I.4.1', 'The institution recognizes the right of the students to:', 0, '2024-01-21 18:36:39', '2024-01-21 18:36:39'),
(287, 67, 773, 'I.4.2', 'be transparent and accountable to their constituents; and', 0, '2024-01-21 18:36:47', '2024-01-21 18:36:47'),
(288, 67, 773, 'I.4.3', 'be represented in various for a where the students need to be consulted.', 0, '2024-01-21 18:36:55', '2024-01-21 18:36:55'),
(289, 68, 793, 'S.13.1', 'Culture and the Arts;', 0, '2024-01-21 18:44:08', '2024-01-21 18:44:08'),
(290, 68, 793, 'S.13.2', 'Sports Development;', 0, '2024-01-21 18:44:18', '2024-01-21 18:44:18'),
(291, 68, 793, 'S.13.3', 'Student Publications; and', 0, '2024-01-21 18:44:28', '2024-01-21 18:44:28'),
(292, 68, 793, 'S.13.4', 'Medical-Dental Clinic.', 0, '2024-01-21 18:44:41', '2024-01-21 18:44:41'),
(293, 68, 795, 'S.15.1', 'Diagnostic purposes;', 0, '2024-01-21 18:45:18', '2024-01-21 18:45:18'),
(294, 68, 795, 'S.15.2', 'first aid;', 0, '2024-01-21 18:45:28', '2024-01-21 18:45:28'),
(295, 68, 795, 'S.15.3', 'prevention and prophylaxis; and', 0, '2024-01-21 18:45:40', '2024-01-21 18:45:40'),
(296, 68, 793, 'S.13.5', 'physical-dental exam.', 0, '2024-01-21 18:45:51', '2024-01-21 18:45:51'),
(297, 68, 798, 'S.18.1', 'educational loans;', 0, '2024-01-21 18:46:43', '2024-01-21 18:46:43'),
(298, 68, 798, 'S.18.2', 'student assistantship;', 0, '2024-01-21 18:46:55', '2024-01-21 18:46:55'),
(299, 68, 798, 'S.18.3', 'attendance to seminars, training (sports, leadership, etc.);', 0, '2024-01-21 18:47:31', '2024-01-21 18:47:31'),
(300, 68, 798, 'S.18.4', 'grants-in-aid; and', 0, '2024-01-21 18:47:44', '2024-01-21 18:47:44'),
(301, 68, 798, 'S.18.5', 'others (please specify)', 0, '2024-01-21 18:47:54', '2024-01-21 18:47:54'),
(302, 68, 801, 'I.3.1', 'enrollment trends;', 0, '2024-01-21 18:48:49', '2024-01-21 18:48:49'),
(303, 68, 801, 'I.3.2', 'drop-out rate;', 0, '2024-01-21 18:48:56', '2024-01-21 18:48:56'),
(304, 68, 801, 'I.3.3', 'licensure examination results and passing percentage;', 0, '2024-01-21 18:49:06', '2024-01-21 18:49:06'),
(305, 68, 801, 'I.3.4', 'employability of graduates;', 0, '2024-01-21 18:49:16', '2024-01-21 18:49:16'),
(306, 68, 801, 'I.3.5', 'student transferees; and', 0, '2024-01-21 18:49:24', '2024-01-21 18:49:24'),
(307, 68, 801, 'I.3.6', 'student classification by specialization.', 0, '2024-01-21 18:49:32', '2024-01-21 18:49:32'),
(308, 70, 843, 'I.2.1', 'administrators;', 0, '2024-01-21 19:02:14', '2024-01-21 19:02:14'),
(309, 70, 843, 'I.2.2', 'faculty;', 0, '2024-01-21 19:02:23', '2024-01-21 19:02:23'),
(310, 70, 843, 'I.2.3', 'students;', 0, '2024-01-21 19:02:30', '2024-01-21 19:02:30'),
(311, 70, 843, 'I.2.4', 'government agency representatives (DOST, CHED, NEDA, etc.); and', 0, '2024-01-21 19:02:39', '2024-01-21 19:02:39'),
(312, 70, 843, 'I.2.5', 'other stakeholders (alumni, parents, etc.).', 0, '2024-01-21 19:02:51', '2024-01-21 19:02:51'),
(313, 71, 850, 'S.2.1', 'facilities and equipment such as Internet, statistical software, and other ICT resources;', 0, '2024-01-21 19:05:00', '2024-01-21 19:05:00'),
(314, 71, 850, 'S.2.2', 'research staff;', 0, '2024-01-21 19:05:08', '2024-01-21 19:05:08'),
(315, 71, 850, 'S.2.3', 'supplies and materials; and', 0, '2024-01-21 19:05:15', '2024-01-21 19:05:15'),
(316, 71, 850, 'S.2.4', 'workplace.', 0, '2024-01-21 19:05:22', '2024-01-21 19:05:22'),
(317, 72, 865, 'I.8.1', 'institutional development;', 0, '2024-01-21 19:09:24', '2024-01-21 19:09:24'),
(318, 72, 865, 'I.8.2', 'the improvement of instructional processes; and', 0, '2024-01-21 19:09:33', '2024-01-21 19:09:33'),
(319, 72, 865, 'I.8.3', 'the transfer of generated technology/knowledge to the community.', 0, '2024-01-21 19:09:43', '2024-01-21 19:09:43'),
(320, 72, 867, 'I.10.1', 'research outputs are protected by IPR laws; and', 0, '2024-01-21 19:10:18', '2024-01-21 19:10:18'),
(321, 72, 867, 'I.10.2', 'faculty and students observe research ethics to avoid malpractices like plagiarism, fabrication of data, etc.', 0, '2024-01-21 19:10:27', '2024-01-21 19:10:27'),
(322, 73, 870, 'S.2.1', 'paper presentation;', 0, '2024-01-21 19:11:11', '2024-01-21 19:11:11'),
(323, 73, 870, 'S.2.2', 'journal publication;', 0, '2024-01-21 19:11:18', '2024-01-21 19:11:18'),
(324, 73, 870, 'S.2.3', 'outstanding research related performance; and', 0, '2024-01-21 19:11:27', '2024-01-21 19:11:27'),
(325, 73, 870, 'S.2.4', 'patented outputs.', 0, '2024-01-21 19:11:34', '2024-01-21 19:11:34'),
(326, 73, 875, 'I.5.1', 'Instructional Materials Development;', 0, '2024-01-21 19:13:01', '2024-01-21 19:13:01'),
(327, 73, 875, 'I.5.2', 'paper presentation, journal publication, classroom lectures, and other similar activities;', 0, '2024-01-21 19:13:09', '2024-01-21 19:13:09'),
(328, 73, 875, 'I.5.3', 'editorship/writing in academic, scientific and professional journals;', 0, '2024-01-21 19:13:20', '2024-01-21 19:13:20'),
(329, 73, 875, 'I.5.4', 'thesis/dissertation advising; and', 0, '2024-01-21 19:13:28', '2024-01-21 19:13:28'),
(330, 73, 875, 'I.5.5', 'patenting of research outputs;', 0, '2024-01-21 19:13:38', '2024-01-21 19:13:38'),
(331, 75, 899, 'I.6.1', 'pamphlets;', 0, '2024-01-23 03:23:30', '2024-01-23 03:23:30'),
(332, 75, 899, 'I.6.2', 'flyers;', 0, '2024-01-23 03:23:37', '2024-01-23 03:23:37'),
(333, 75, 899, 'I.6.3', 'bulletins;', 0, '2024-01-23 03:23:45', '2024-01-23 03:23:45'),
(334, 75, 899, 'I.6.4', 'newsletters; and', 0, '2024-01-23 03:23:51', '2024-01-23 03:23:51'),
(335, 75, 899, 'I.6.5', 'electronic resources.', 0, '2024-01-23 03:23:58', '2024-01-23 03:23:58'),
(336, 77, 907, 'I.1.1', 'initiates and maintains community development projects;', 0, '2024-01-23 03:27:19', '2024-01-23 03:27:19'),
(337, 77, 907, 'I.1.2', 'involves the students, faculty, staff administrators in the projects; and', 0, '2024-01-23 03:27:25', '2024-01-23 03:27:25'),
(338, 77, 907, 'I.1.3', 'coordinates its community programs and services with the target clientele.', 0, '2024-01-23 03:27:34', '2024-01-23 03:27:34'),
(339, 77, 908, 'I.2.1', 'planning;', 0, '2024-01-23 03:27:52', '2024-01-23 03:27:52'),
(340, 77, 908, 'I.2.2', 'implementation and dissemination;', 0, '2024-01-23 03:27:58', '2024-01-23 03:27:58'),
(341, 77, 908, 'I.2.3', 'monitoring and evaluation;', 0, '2024-01-23 03:28:04', '2024-01-23 03:28:04'),
(342, 77, 908, 'I.2.4', 'out-sourcing of funds, materials and other service inputs; and', 0, '2024-01-23 03:28:16', '2024-01-23 03:28:16'),
(343, 77, 908, 'I.2.5', 'utilization of technology, knowledge learned, skills acquired from the extension projects and activities.', 0, '2024-01-23 03:28:24', '2024-01-23 03:28:24'),
(344, 80, 924, 'S.2.1', 'inventory of equipment and supplies;', 0, '2024-01-23 03:34:42', '2024-01-23 03:34:42'),
(345, 80, 924, 'S.2.2', 'checking on the physical conditions of equipment and supplies;', 0, '2024-01-23 03:34:49', '2024-01-23 03:34:49'),
(346, 80, 924, 'S.2.3', 'maintenance of the laboratories and shops.', 0, '2024-01-23 03:35:02', '2024-01-23 03:35:02'),
(347, 80, 931, 'I.7.1', 'shops;', 0, '2024-01-23 03:36:40', '2024-01-23 03:36:40'),
(348, 80, 931, 'I.7.2', 'computer laboratory,', 0, '2024-01-23 03:36:46', '2024-01-23 03:36:46'),
(349, 80, 931, 'I.7.3', 'multi-media/educational technology center;', 0, '2024-01-23 03:36:54', '2024-01-23 03:36:54'),
(350, 80, 931, 'I.7.4', 'research facility;', 0, '2024-01-23 03:37:00', '2024-01-23 03:37:00'),
(351, 80, 931, 'I.7.5', 'general education laboratory:', 0, '2024-01-23 03:37:07', '2024-01-23 03:37:07'),
(352, 201, 941, 'S.4.1', 'traffic safety in and outside the campus;', 0, '2024-01-23 04:03:31', '2024-01-23 04:03:31'),
(353, 201, 941, 'S.4.2', 'waste management program;', 0, '2024-01-23 04:03:36', '2024-01-23 04:03:36'),
(354, 201, 941, 'S.4.3', 'proper utilization, repair and upkeep of school facilities and equipment; and', 0, '2024-01-23 04:03:50', '2024-01-23 04:03:50'),
(355, 201, 941, 'S.4.4', 'cleanliness and orderliness of the school campus.', 0, '2024-01-23 04:03:56', '2024-01-23 04:03:56'),
(356, 205, 1000, 'I.1.1', 'appropriate flooring;', 0, '2024-01-23 04:16:21', '2024-01-23 04:16:21'),
(357, 205, 1000, 'I.1.2', 'proper lighting and ventilation;', 0, '2024-01-23 04:16:27', '2024-01-23 04:16:27'),
(358, 205, 1000, 'I.1.3', 'safety measures;', 0, '2024-01-23 04:16:35', '2024-01-23 04:16:35'),
(359, 205, 1000, 'I.1.4', 'toilets;', 0, '2024-01-23 04:16:40', '2024-01-23 04:16:40'),
(360, 205, 1000, 'I.1.5', 'functional drinking facilities; and', 0, '2024-01-23 04:16:46', '2024-01-23 04:16:46'),
(361, 205, 1000, 'I.1.6', 'enough chairs.', 0, '2024-01-23 04:16:55', '2024-01-23 04:16:55'),
(362, 205, 1001, 'I.2.1', 'free from hazards;', 0, '2024-01-23 04:17:46', '2024-01-23 04:17:46'),
(363, 205, 1001, 'I.2.2', 'suitably surfaced floor;', 0, '2024-01-23 04:17:52', '2024-01-23 04:17:52'),
(364, 205, 1001, 'I.2.3', 'appropriately laid out for a variety of activities;', 0, '2024-01-23 04:18:11', '2024-01-23 04:18:11'),
(365, 205, 1001, 'I.2.4', 'properly maintained and secured; and', 0, '2024-01-23 04:18:18', '2024-01-23 04:18:18'),
(366, 205, 1001, 'I.2.5', 'installed with drainage system.', 0, '2024-01-23 04:18:24', '2024-01-23 04:18:24'),
(367, 206, 1012, 'S.8.1', 'emergency medicines;', 0, '2024-01-23 04:20:59', '2024-01-23 04:20:59'),
(368, 206, 1012, 'S.8.2', 'ambubag;', 0, '2024-01-23 04:22:08', '2024-01-23 04:22:08'),
(369, 206, 1012, 'S.8.3', 'oxygen tank;', 0, '2024-01-23 04:22:16', '2024-01-23 04:22:16'),
(370, 206, 1012, 'S.8.4', 'intravenous fluid;', 0, '2024-01-23 04:22:21', '2024-01-23 04:22:21'),
(371, 206, 1012, 'S.8.5', 'sphygmomanometer (at least 2 sets);', 0, '2024-01-23 04:22:28', '2024-01-23 04:22:28'),
(372, 206, 1012, 'S.8.6', 'thermometer (at least 10 pcs);', 0, '2024-01-23 04:22:34', '2024-01-23 04:22:34'),
(373, 206, 1012, 'S.8.7', 'diagnostic sets;', 0, '2024-01-23 04:22:44', '2024-01-23 04:22:44'),
(374, 206, 1012, 'S.8.8', 'stethoscope (at least 2 units);', 0, '2024-01-23 04:22:49', '2024-01-23 04:22:49'),
(375, 206, 1012, 'S.8.9', 'treatment cart; and', 0, '2024-01-23 04:22:58', '2024-01-23 04:22:58'),
(376, 206, 1012, 'S.8.10', 'nebulizer.', 0, '2024-01-23 04:23:07', '2024-01-23 04:23:07'),
(377, 206, 1013, 'S.9.1', 'dental chair;', 0, '2024-01-23 04:23:29', '2024-01-23 04:23:29'),
(378, 206, 1013, 'S.9.2', 'autoclave (sterilizer);', 0, '2024-01-23 04:23:36', '2024-01-23 04:23:36'),
(379, 206, 1013, 'S.9.3', 'medical supplies;', 0, '2024-01-23 04:23:46', '2024-01-23 04:23:46'),
(380, 206, 1013, 'S.9.4', 'filling instruments; and', 0, '2024-01-23 04:23:56', '2024-01-23 04:23:56'),
(381, 206, 1013, 'S.9.5', 'basic instruments (forceps, mouth mirror, cotton fliers, explorer, etc).', 0, '2024-01-23 04:24:01', '2024-01-23 04:24:01'),
(382, 208, 1041, 'S.2.1', 'cooking and preparatory equipment;', 0, '2024-01-23 04:37:50', '2024-01-23 04:37:50'),
(383, 208, 1041, 'S.2.2', 'serving tools and utensils;', 0, '2024-01-23 04:38:16', '2024-01-23 04:38:16'),
(384, 208, 1041, 'S.2.3', 'cleaning supplies and materials; and', 0, '2024-01-23 04:38:22', '2024-01-23 04:38:22'),
(385, 208, 1041, 'S.2.4', 'dining tables and chairs.', 0, '2024-01-23 04:38:28', '2024-01-23 04:38:28'),
(387, 209, 1051, 'S.2.1', 'working tables and chairs;', 0, '2024-01-23 04:47:12', '2024-01-23 04:47:12'),
(388, 209, 1051, 'S.2.2', 'cabinets for display and filing:', 0, '2024-01-23 04:47:17', '2024-01-23 04:47:17'),
(389, 209, 1051, 'S.2.3', 'good ventilation and lighting;', 0, '2024-01-23 04:47:22', '2024-01-23 04:47:22'),
(390, 209, 1051, 'S.2.4', 'computer unit;', 0, '2024-01-23 04:47:31', '2024-01-23 04:47:31'),
(391, 209, 1051, 'S.2.5', 'toilets; and', 0, '2024-01-23 04:47:44', '2024-01-23 04:47:44'),
(392, 209, 1051, 'S.2.6', 'lounge.', 0, '2024-01-23 04:47:47', '2024-01-23 04:47:47'),
(393, 76, 1066, 'S.2.1', 'facilities and equipment such as internet and other ICT\r\nresources;', 0, '2024-01-23 04:51:54', '2024-01-23 04:51:54'),
(394, 76, 1066, 'S.2.2', 'extension staff;', 0, '2024-01-23 04:52:01', '2024-01-23 04:52:01'),
(395, 76, 1066, 'S.2.3', 'supplies and materials; and', 0, '2024-01-23 04:52:08', '2024-01-23 04:52:08'),
(396, 76, 1066, 'S.2.4', 'workplace.', 0, '2024-01-23 04:52:14', '2024-01-23 04:52:14'),
(397, 76, 1069, 'I.3.1', 'additional funding; and', 0, '2024-01-23 04:53:03', '2024-01-23 04:53:03'),
(398, 76, 1069, 'I.3.2', 'technical assistance and service inputs', 0, '2024-01-23 04:53:10', '2024-01-23 04:53:10'),
(399, 82, 1076, 'I.2.1', 'a full-time professional licensed librarian; and', 0, '2024-01-23 04:56:47', '2024-01-23 04:56:47'),
(400, 82, 1076, 'I.2.2', 'at least a master’s degree holder In MS Library and Information Science or MAEd/MA in Library Science.', 0, '2024-01-23 04:56:52', '2024-01-23 04:56:52'),
(401, 83, 1083, 'S.1.1', 'BS in Library and Information Science for the College/Academic Unit Library; and', 0, '2024-01-23 04:58:25', '2024-01-23 04:58:25'),
(402, 83, 1083, 'S.1.2', 'MS In Library and Information Science or · MAED/MA In Ubrary Science) for the Institution.', 0, '2024-01-23 04:58:30', '2024-01-23 04:58:30'),
(403, 83, 1084, 'S.2.1', 'one (1) Licensed Librarian with two (2) full time staff for the first 500 – student population; and', 0, '2024-01-23 04:58:51', '2024-01-23 04:58:51'),
(404, 83, 1084, 'S.2.2', 'one (1) additional full time Professional Librarian with one (1) full time staff for every additional 1,000 students.', 0, '2024-01-23 04:58:55', '2024-01-23 04:58:55'),
(405, 84, 1089, 'S.2.1', '5,000 titles for the Academic Unit Library;', 0, '2024-01-23 04:59:58', '2024-01-23 04:59:58'),
(406, 84, 1089, 'S.2.2', '10,000 titles that support the Instruction, research and other programs for an Institution Library,', 0, '2024-01-23 05:00:04', '2024-01-23 05:00:04'),
(407, 85, 1105, 'I.1.1', 'functional and interactive library web page;', 0, '2024-01-23 05:02:53', '2024-01-23 05:02:53'),
(408, 85, 1105, 'I.1.2', 'functional and interactive library web page;', 0, '2024-01-23 05:03:00', '2024-01-23 05:03:00'),
(409, 85, 1105, 'I.1.3', 'on-line public access (OPAC);', 0, '2024-01-23 05:03:05', '2024-01-23 05:03:05'),
(410, 85, 1105, 'I.1.4', 'circulation on-line;', 0, '2024-01-23 05:03:09', '2024-01-23 05:03:09'),
(411, 85, 1105, 'I.1.5', 'computerized cataloguing;', 0, '2024-01-23 05:03:15', '2024-01-23 05:03:15'),
(412, 85, 1105, 'I.1.6', 'inventory reporting;', 0, '2024-01-23 05:03:29', '2024-01-23 05:03:29'),
(413, 85, 1105, 'I.1.7', 'serials control;', 0, '2024-01-23 05:03:33', '2024-01-23 05:03:33'),
(414, 85, 1105, 'I.1.8', 'Internet searching;', 0, '2024-01-23 05:03:38', '2024-01-23 05:03:38'),
(415, 85, 1105, 'I.1.9', 'CD-ROM;', 0, '2024-01-23 05:04:06', '2024-01-23 05:04:06'),
(416, 85, 1105, 'I.1.10', 'on-line database;', 0, '2024-01-23 05:04:16', '2024-01-23 05:04:16'),
(417, 85, 1105, 'I.1.11', 'photocopying: and', 0, '2024-01-23 05:04:42', '2024-01-23 05:04:42'),
(418, 85, 1105, 'I.1.12', 'bar coding.', 0, '2024-01-23 05:04:48', '2024-01-23 05:04:48'),
(419, 86, 1120, 'S.9.1', 'adjustable/movable shelves;', 0, '2024-01-23 05:08:27', '2024-01-23 05:08:27'),
(420, 86, 1120, 'S.9.2', 'magazine display shelves;', 0, '2024-01-23 05:08:33', '2024-01-23 05:08:33'),
(421, 86, 1120, 'S.9.3', 'newspaper racks;', 0, '2024-01-23 05:08:40', '2024-01-23 05:08:40'),
(422, 86, 1120, 'S.9.4', 'standard tables and chairs;', 0, '2024-01-23 05:08:48', '2024-01-23 05:08:48'),
(423, 86, 1120, 'S.9.5', 'carrels for individual study;', 0, '2024-01-23 05:08:55', '2024-01-23 05:08:55'),
(424, 86, 1120, 'S.9.6', 'desks and chairs for staff;', 0, '2024-01-23 05:09:01', '2024-01-23 05:09:01'),
(425, 86, 1120, 'S.9.7', 'charging desk;', 0, '2024-01-23 05:09:10', '2024-01-23 05:09:10'),
(426, 86, 1120, 'S.9.8', 'dictionary stand;', 0, '2024-01-23 05:09:15', '2024-01-23 05:09:15'),
(427, 86, 1120, 'S.9.9', 'atlas stand;', 0, '2024-01-23 05:09:22', '2024-01-23 05:09:22'),
(428, 86, 1120, 'S.9.10', 'bulletin boards and display cabinets;', 0, '2024-01-23 05:09:28', '2024-01-23 05:09:28'),
(429, 86, 1120, 'S.9.11', 'vertical file cabinets;', 0, '2024-01-23 05:09:36', '2024-01-23 05:09:36'),
(430, 86, 1120, 'S.9.12', 'book racks;', 0, '2024-01-23 05:09:45', '2024-01-23 05:09:45'),
(431, 86, 1120, 'S.9.13', 'map stands/cabinets;', 0, '2024-01-23 05:09:51', '2024-01-23 05:09:51'),
(432, 86, 1120, 'S.9.14', 'cardex/ rotadex or any filing equipment far periodical records;', 0, '2024-01-23 05:09:59', '2024-01-23 05:09:59'),
(433, 86, 1120, 'S.9.15', 'typewriters;', 0, '2024-01-23 05:10:05', '2024-01-23 05:10:05'),
(434, 86, 1120, 'S.9.16', 'computers with printers; and', 0, '2024-01-23 05:10:11', '2024-01-23 05:10:11'),
(435, 86, 1120, 'S.9.17', 'others (please specify)', 0, '2024-01-23 05:10:24', '2024-01-23 05:10:24'),
(436, 212, 1146, 'S.1.1', 'MS in ITE program. at least three (3) years of IT work/consultancy experience, and at least three (3) years of ITE teaching experience beyond computer literacy both of which must be within the last five (5) years;', 0, '2024-01-24 05:44:24', '2024-01-24 05:44:24'),
(437, 212, 1146, 'S.1.2', 'PhD/MS in an ITE allied program and any of the following:', 0, '2024-01-24 05:44:30', '2024-01-24 05:44:30'),
(438, 212, 1146, 'S.1.3', 'doctorate in an ITE program and at least three (3) years of IT work/consultancy experience within the last five (5) years;', 0, '2024-01-24 05:44:53', '2024-01-24 05:45:03'),
(439, 212, 1146, 'S.1.4', 'doctorate in an ITE allied program, at least three (3) years of work/consultancy experience, at least five (5) years of ITE teaching experience beyond computer literacy both of which must be within the last five (5) years.', 0, '2024-01-24 05:45:22', '2024-01-24 05:45:22'),
(440, 212, 1148, 'I.1.1', 'Master\'s degree in any ITE program;', 0, '2024-01-24 05:45:46', '2024-01-24 05:45:46'),
(441, 212, 1148, 'I.1.2', 'Master\'s degree in an ITE allied program and at least any of the following:', 0, '2024-01-24 05:45:57', '2024-01-24 05:45:57'),
(442, 212, 1148, 'I.1.3', 'doctorate in an ITE allied program and five (5) years experience teaching ITE (beyond computer literacy courses) within the last eight (8) years.', 0, '2024-01-24 05:46:25', '2024-01-24 05:46:25'),
(443, 212, 1151, 'I.4.1', 'setting standards and targets;', 0, '2024-01-24 05:48:24', '2024-01-24 05:48:24'),
(444, 212, 1151, 'I.4.2', 'planning of programs and other related activities;', 0, '2024-01-24 05:48:30', '2024-01-24 05:48:30'),
(445, 212, 1151, 'I.4.3', 'implementing, monitoring and evaluation of plans, programs and other related activities;', 0, '2024-01-24 05:48:37', '2024-01-24 05:48:37'),
(446, 212, 1151, 'I.4.4', 'establishing linkages, partnerships and networking activities;', 0, '2024-01-24 05:48:45', '2024-01-24 05:48:45'),
(447, 212, 1151, 'I.4.5', 'providing opportunities for professional growth and development of the faculty and staff;', 0, '2024-01-24 05:48:56', '2024-01-24 05:48:56'),
(448, 212, 1151, 'I.4.6', 'preparing policies and guidelines in the internal administration and operation of the College/Academic Unit; and', 0, '2024-01-24 05:52:49', '2024-01-24 05:52:49'),
(449, 212, 1151, 'I.4.7', 'preparing guidelines on the proper use and maintenance of facilities, equipment, supplies and materials, etc.', 0, '2024-01-24 05:52:59', '2024-01-24 05:52:59'),
(450, 213, 1156, 'S.1.1', 'admission and retention;', 0, '2024-01-24 06:18:05', '2024-01-24 06:18:05'),
(451, 213, 1156, 'S.1.2', 'registration requirements;', 0, '2024-01-24 06:18:12', '2024-01-24 06:18:12');
INSERT INTO `sub_indicators` (`id`, `parameter_id`, `indicator_id`, `sub_indicator_name`, `sub_indicator_desc`, `isOptional`, `created_at`, `updated_at`) VALUES
(452, 213, 1156, 'S.1.3', 'school fees;', 0, '2024-01-24 06:18:17', '2024-01-24 06:18:17'),
(453, 213, 1156, 'S.1.4', 'academic load;', 0, '2024-01-24 06:18:22', '2024-01-24 06:18:22'),
(454, 213, 1156, 'S.1.5', 'transfers;', 0, '2024-01-24 06:18:30', '2024-01-24 06:18:30'),
(455, 213, 1156, 'S.1.6', 'residence, course work, scholastic and graduation requirements;', 0, '2024-01-24 06:19:38', '2024-01-24 06:19:38'),
(456, 213, 1156, 'S.1.7', 'examination and grading system;', 0, '2024-01-24 06:19:44', '2024-01-24 06:19:44'),
(457, 213, 1156, 'S.1.8', 'scholarships/grants/assistantships;', 0, '2024-01-24 06:19:49', '2024-01-24 06:19:49'),
(458, 213, 1156, 'S.1.9', 'shifting and adding/dropping of course/s/subject/s;', 0, '2024-01-24 06:19:54', '2024-01-24 06:19:54'),
(459, 213, 1156, 'S.1.10', 'code of conduct and discipline;', 0, '2024-01-24 06:20:00', '2024-01-24 06:20:00'),
(460, 213, 1156, 'S.1.11', 'attendance; and', 0, '2024-01-24 06:20:05', '2024-01-24 06:20:05'),
(461, 213, 1156, 'S.1.12', 'others (please specify)___________________________', 0, '2024-01-24 06:20:10', '2024-01-24 06:20:10'),
(462, 214, 1164, 'S.3.1', 'personnel services;', 0, '2024-01-24 06:33:10', '2024-01-24 06:33:10'),
(463, 214, 1164, 'S.3.2', 'Maintenance and Other Operating Expenses (MOOE);', 0, '2024-01-24 06:33:17', '2024-01-24 06:33:17'),
(464, 214, 1164, 'S.3.3', 'capital outlay; and', 0, '2024-01-24 06:33:22', '2024-01-24 06:33:22'),
(465, 214, 1164, 'S.3.4', 'special projects.', 0, '2024-01-24 06:33:28', '2024-01-24 06:33:28'),
(466, 214, 1169, 'I.5.1', 'cultural development;', 0, '2024-01-24 06:34:34', '2024-01-24 06:34:34'),
(467, 214, 1169, 'I.5.2', 'athletic and sports development;', 0, '2024-01-24 06:34:41', '2024-01-24 06:34:41'),
(468, 214, 1169, 'I.5.3', 'medical and dental services;', 0, '2024-01-24 06:34:47', '2024-01-24 06:34:47'),
(469, 214, 1169, 'I.5.4', 'library;', 0, '2024-01-24 06:34:54', '2024-01-24 06:34:54'),
(470, 214, 1169, 'I.5.5', 'student body organization;', 0, '2024-01-24 06:35:03', '2024-01-24 06:35:03'),
(471, 214, 1169, 'I.5.6', 'guidance and counseling;', 0, '2024-01-24 06:35:10', '2024-01-24 06:35:10'),
(472, 214, 1169, 'I.5.7', 'improvement of laboratories/shops;', 0, '2024-01-24 06:35:18', '2024-01-24 06:35:18'),
(473, 214, 1169, 'I.5.8', 'repair and maintenance of facilities and equipment;', 0, '2024-01-24 06:35:24', '2024-01-24 06:35:24'),
(474, 214, 1169, 'I.5.9', 'purchase of new equipment, supplies and materials;', 0, '2024-01-24 06:35:30', '2024-01-24 06:35:30'),
(475, 214, 1169, 'I.5.10', 'replacement of old and unserviceable equipment;', 0, '2024-01-24 06:35:38', '2024-01-24 06:35:38'),
(476, 214, 1169, 'I.5.11', 'construction of new facilities; as needed', 0, '2024-01-24 06:35:44', '2024-01-24 06:35:44'),
(477, 214, 1169, 'I.5.12', 'improvement/expansion of physical plant;', 0, '2024-01-24 06:35:49', '2024-01-24 06:35:49'),
(478, 214, 1169, 'I.5.13', 'extension and community service;', 0, '2024-01-24 06:35:55', '2024-01-24 06:35:55'),
(479, 214, 1169, 'I.5.14', 'disaster and risk reduction and', 0, '2024-01-24 06:36:01', '2024-01-24 06:36:01'),
(480, 214, 1169, 'I.5.15', 'auxiliary services.', 0, '2024-01-24 06:36:07', '2024-01-24 06:36:07'),
(481, 216, 1188, 'I.4.1', 'minutes of the Board of Regents/Trustees meetings;', 0, '2024-01-24 06:51:27', '2024-01-24 06:51:27'),
(482, 216, 1188, 'I.4.2', 'minutes of the faculty meetings, e.g. minutes of the Academic Council meetings;', 0, '2024-01-24 06:51:33', '2024-01-24 06:51:33'),
(483, 216, 1188, 'I.4.3', 'faculty and staff individual files;', 0, '2024-01-24 06:51:38', '2024-01-24 06:51:38'),
(484, 216, 1188, 'I.4.4', 'faculty and staff performance evaluation results; and', 0, '2024-01-24 06:51:43', '2024-01-24 06:51:43'),
(485, 216, 1188, 'I.4.5', 'other records such as:', 0, '2024-01-24 06:51:49', '2024-01-24 06:51:49'),
(486, 218, 1196, 'S.1.1', 'competence;', 0, '2024-01-24 07:02:51', '2024-01-24 07:02:51'),
(487, 218, 1196, 'S.1.2', 'competence;', 0, '2024-01-24 07:02:57', '2024-01-24 07:02:57'),
(488, 218, 1196, 'S.1.3', 'work ethic (punctuality, wise use of time, etc.);', 0, '2024-01-24 07:03:02', '2024-01-24 07:03:02'),
(489, 218, 1196, 'S.1.4', 'creative ability and innovativeness;', 0, '2024-01-24 07:03:07', '2024-01-24 07:03:07'),
(491, 218, 1196, 'S.1.5', 'ability to handle internal and external pressures; and', 0, '2024-01-24 07:03:18', '2024-01-24 07:03:18'),
(492, 218, 1198, 'I.2.1', 'to improve performance and delivery of service; and', 0, '2024-01-24 07:03:43', '2024-01-24 07:03:43'),
(493, 218, 1198, 'I.2.2', 'for promotion.', 0, '2024-01-24 07:03:52', '2024-01-24 07:03:52');

-- --------------------------------------------------------

--
-- Table structure for table `sub_indicator_components`
--

CREATE TABLE `sub_indicator_components` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `sub_indicator_id` bigint(20) UNSIGNED NOT NULL,
  `component_name` varchar(255) NOT NULL,
  `component_desc` text NOT NULL,
  `isOptional` smallint(6) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_indicator_components`
--

INSERT INTO `sub_indicator_components` (`id`, `parameter_id`, `sub_indicator_id`, `component_name`, `component_desc`, `isOptional`, `created_at`, `updated_at`) VALUES
(7, 51, 32, 'S.1.2.1', 'IT industry experience of 20% of the faculty for 3 years in technical administration, system design, applications programming or equivalent within the last 5 years; and', 0, '2024-01-11 05:33:30', '2024-01-11 05:33:30'),
(8, 51, 32, 'S.1.2.2', 'proficiency in teaching. ITE courses as proven by a certification issued by a certifying body as the Philippine National IT Standards (PhilNITS), Brainbench, Oracle or Microsoft, etc. provided that the teaching load assigned to him/her is aligned with the area of certification.', 0, '2024-01-11 05:33:38', '2024-01-11 05:33:38'),
(10, 59, 117, 'I.7.1.1', 'administration;', 0, '2024-01-11 10:37:57', '2024-01-11 10:37:57'),
(11, 59, 117, 'I.7.1.2', 'faculty;', 0, '2024-01-11 10:38:02', '2024-01-11 10:38:02'),
(12, 59, 117, 'I.7.1.3', 'students;', 0, '2024-01-11 10:38:09', '2024-01-11 10:38:09'),
(13, 59, 117, 'I.7.1.4', 'alumni;', 0, '2024-01-11 10:38:15', '2024-01-11 10:38:15'),
(14, 59, 117, 'I.7.1.5', 'representatives from the industry/sector; and', 0, '2024-01-11 10:38:21', '2024-01-11 10:38:21'),
(15, 59, 117, 'I.7.1.6', 'others (please specify)', 0, '2024-01-11 10:38:27', '2024-01-11 10:38:27'),
(16, 65, 264, 'S.6.1.1', 'Information and Orientation Services;', 0, '2024-01-21 18:05:03', '2024-01-21 18:05:03'),
(17, 65, 264, 'S.6.1.2', 'Guidance and Counseling Services;', 0, '2024-01-21 18:05:21', '2024-01-21 18:05:21'),
(18, 65, 264, 'S.6.1.3', 'Career and Job Placement Services;', 0, '2024-01-21 18:05:33', '2024-01-21 18:05:33'),
(19, 65, 264, 'S.6.1.4', 'Economic Enterprise Development; and', 0, '2024-01-21 18:05:44', '2024-01-21 18:05:44'),
(20, 65, 264, 'S.6.1.5', 'Student Handbook Development', 0, '2024-01-21 18:05:56', '2024-01-21 18:05:56'),
(21, 65, 265, 'S.6.2.1', 'Student Activities;', 0, '2024-01-21 18:06:38', '2024-01-21 18:06:38'),
(22, 65, 265, 'S.6.2.2', 'Student Organizations and Activities;', 0, '2024-01-21 18:06:49', '2024-01-21 18:06:49'),
(23, 65, 265, 'S.6.2.3', 'Leadership Training;', 0, '2024-01-21 18:06:59', '2024-01-21 18:06:59'),
(24, 65, 265, 'S.6.2.4', 'Student Council/Government;', 0, '2024-01-21 18:06:59', '2024-01-21 18:14:09'),
(27, 65, 265, 'S.6.2.5', 'Student Discipline; and', 0, '2024-01-21 18:15:48', '2024-01-21 18:15:48'),
(28, 65, 265, 'S.6.2.6', 'Student Publication/Year Book.', 0, '2024-01-21 18:16:05', '2024-01-21 18:16:05'),
(29, 65, 266, 'S.6.3.1', 'Administration Services;', 0, '2024-01-21 18:16:32', '2024-01-21 18:16:32'),
(30, 65, 266, 'S.6.3.2', 'Scholarship and Financial Assistance (SFA);', 0, '2024-01-21 18:17:24', '2024-01-21 18:17:24'),
(31, 65, 266, 'S.6.3.3', 'Food Services;', 0, '2024-01-21 18:17:37', '2024-01-21 18:17:37'),
(32, 65, 266, 'S.6.3.4', 'Health and Wellness Services;', 0, '2024-01-21 18:17:51', '2024-01-21 18:17:51'),
(33, 65, 266, 'S.6.3.5', 'Safety and Security Services;', 0, '2024-01-21 18:18:01', '2024-01-21 18:18:01'),
(34, 65, 266, 'S.6.3.6', 'Student Housing and Residential Services;', 0, '2024-01-21 18:18:11', '2024-01-21 18:18:11'),
(35, 65, 266, 'S.6.3.7', 'Multi-faith and Inter-faith Services;', 0, '2024-01-21 18:18:22', '2024-01-21 18:18:22'),
(36, 65, 266, 'S.6.3.8', 'Foreign/International Students Services (whenever applicable);', 0, '2024-01-21 18:18:37', '2024-01-21 18:18:37'),
(37, 65, 266, 'S.6.3.9', 'Services for Students with Special Needs;', 0, '2024-01-21 18:18:49', '2024-01-21 18:18:49'),
(38, 65, 266, 'S.6.3.10', 'Culture and Arts Programs;', 0, '2024-01-21 18:19:28', '2024-01-21 18:19:28'),
(39, 65, 266, 'S.6.3.11', 'Sports and Development Programs;', 0, '2024-01-21 18:19:39', '2024-01-21 18:19:39'),
(40, 65, 266, 'S.6.3.12', 'Social and Community Involvement Programs; and', 0, '2024-01-21 18:19:52', '2024-01-21 18:19:52'),
(41, 65, 266, 'S.6.3.13', 'others (please specify)', 0, '2024-01-21 18:20:04', '2024-01-21 18:20:04'),
(42, 80, 351, 'I.7.5.1', 'natural science/physical science;', 0, '2024-01-23 03:37:15', '2024-01-23 03:37:15'),
(43, 80, 351, 'I.7.5.2', 'speech laboratory,', 0, '2024-01-23 03:37:22', '2024-01-23 03:37:22'),
(44, 80, 351, 'I.7.5.3', 'physical education; and', 0, '2024-01-23 03:37:31', '2024-01-23 03:37:31'),
(45, 80, 351, 'I.7.5.4', 'other (please specify)', 0, '2024-01-23 03:37:37', '2024-01-23 03:37:37'),
(46, 212, 437, 'S.1.2.1', 'completion of coursework requirements;', 0, '2024-01-24 05:44:40', '2024-01-24 05:44:40'),
(47, 212, 437, 'S.1.2.2', 'five (5) years experience in systems design, applications programming, IT project management, or information technology research within the last eight (8) years.', 0, '2024-01-24 05:44:45', '2024-01-24 05:44:45'),
(48, 212, 441, 'I.1.2.1', 'completion of coursework requirements for a master\'s degree in any of the ITE programs;', 0, '2024-01-24 05:46:04', '2024-01-24 05:46:04'),
(49, 212, 441, 'I.1.2.2', 'five (5) years experience in systems design, applications programming, IT project management, or information technology research within the last eight (8) years.', 0, '2024-01-24 05:46:13', '2024-01-24 05:46:13'),
(50, 216, 485, 'I.4.5.1', 'student directory;', 0, '2024-01-24 06:51:56', '2024-01-24 06:51:56'),
(51, 216, 485, 'I.4.5.2', 'alumni directory;', 0, '2024-01-24 06:52:00', '2024-01-24 06:52:00'),
(52, 216, 485, 'I.4.5.3', 'permanent records of students;', 0, '2024-01-24 06:52:06', '2024-01-24 06:52:06'),
(53, 216, 485, 'I.4.5.4', 'reports of Director/Dean;', 0, '2024-01-24 06:52:12', '2024-01-24 06:52:12'),
(54, 216, 485, 'I.4.5.5', 'annual reports;', 0, '2024-01-24 06:52:19', '2024-01-24 06:52:19'),
(55, 216, 485, 'I.4.5.6', 'accomplishment/progress reports;', 0, '2024-01-24 06:52:27', '2024-01-24 06:52:27'),
(56, 216, 485, 'I.4.5.7', 'scholarship records;', 0, '2024-01-24 06:52:33', '2024-01-24 06:52:33'),
(57, 216, 485, 'I.4.5.8', 'statistical data;', 0, '2024-01-24 06:52:40', '2024-01-24 06:52:40'),
(58, 216, 485, 'I.4.5.9', 'financial records of students;', 0, '2024-01-24 06:52:46', '2024-01-24 06:52:46'),
(59, 216, 485, 'I.4.5.10', 'inventory of property;', 0, '2024-01-24 06:52:51', '2024-01-24 06:52:51'),
(60, 216, 485, 'I.4.5.11', 'proceedings of administrative investigation (if any); and', 0, '2024-01-24 06:52:57', '2024-01-24 06:52:57'),
(61, 216, 485, 'I.4.5.12', 'others (please specify).', 0, '2024-01-24 06:53:04', '2024-01-24 06:53:04');

-- --------------------------------------------------------

--
-- Table structure for table `sub_indicator_files`
--

CREATE TABLE `sub_indicator_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parameter_id` bigint(20) UNSIGNED NOT NULL,
  `sub_indicator_id` bigint(20) UNSIGNED NOT NULL,
  `screen_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_location` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_indicator_files`
--

INSERT INTO `sub_indicator_files` (`id`, `user_id`, `accreditation_id`, `parameter_id`, `sub_indicator_id`, `screen_name`, `file_name`, `file_type`, `file_location`, `status`, `created_at`, `updated_at`) VALUES
(13, 37, 31, 49, 15, 'HATO', '281e8838-5146-4e36-ba06-51ef5575bfc1.JPG', 'jpg', 'storage/files/281e8838-5146-4e36-ba06-51ef5575bfc1.JPG', 'pending', '2024-01-21 19:24:17', '2024-01-21 19:24:17'),
(14, 37, 31, 49, 16, 'POGI NI SIR MAGAT', '0587cdb0-0dac-4c64-855f-6b3df05b389c.JPG', 'jpg', 'storage/files/0587cdb0-0dac-4c64-855f-6b3df05b389c.JPG', 'pending', '2024-01-21 19:24:34', '2024-01-21 19:24:34'),
(15, 37, 31, 49, 17, 'JHKJS', '275d1372-037e-4445-b517-35900ead80bb.png', 'png', 'storage/files/275d1372-037e-4445-b517-35900ead80bb.png', 'pending', '2024-01-21 19:24:52', '2024-01-21 19:24:52'),
(16, 37, 31, 49, 18, 'KHUS', 'ce0c5f7d-ae03-4161-bbd3-3763d258bef8.pdf', 'pdf', 'storage/files/ce0c5f7d-ae03-4161-bbd3-3763d258bef8.pdf', 'pending', '2024-01-21 19:25:05', '2024-01-21 19:25:05'),
(17, 37, 31, 49, 19, 'HAHA', '046b289d-41b0-4c52-9e08-8096f219b8fb.JPG', 'jpg', 'storage/files/046b289d-41b0-4c52-9e08-8096f219b8fb.JPG', 'pending', '2024-01-21 19:25:23', '2024-01-21 19:25:23');

-- --------------------------------------------------------

--
-- Table structure for table `sub_indicator_messages`
--

CREATE TABLE `sub_indicator_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `accreditation_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `sub_indicator_file_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `university_id` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`id`, `university_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'psu', 'Pangasinan State University', '2024-01-16 19:48:57', '2024-01-16 22:48:30'),
(2, 'ucu', 'Urdaneta City University', '2024-01-16 19:49:20', '2024-01-16 22:49:01'),
(3, 'uep', 'University of Eastern Pangasinan', '2024-01-16 19:49:40', '2024-01-16 22:48:47'),
(4, 'upang', 'PHINMA-University of Pangasinan', '2024-01-16 19:50:04', '2024-01-16 22:49:08'),
(5, 'punp', 'Panpacific University', '2024-01-16 19:50:55', '2024-01-16 22:48:39'),
(6, 'slu', 'Saint Louis University', '2024-01-17 06:25:16', '2024-01-17 06:25:23'),
(7, 'bsu', 'Baguio State University', '2024-01-17 06:26:01', '2024-01-17 06:54:12'),
(8, 'uc', 'University of the Cordilleras', '2024-01-17 06:52:45', '2024-01-17 06:58:16'),
(9, 'clsu', 'Central Luzon State University', '2024-01-17 06:58:50', '2024-01-17 06:58:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `university_id` bigint(20) UNSIGNED DEFAULT NULL,
  `campus_id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'user',
  `isInternal` smallint(6) NOT NULL DEFAULT 0,
  `isExternal` smallint(6) NOT NULL DEFAULT 0,
  `current_role` varchar(255) NOT NULL DEFAULT 'none',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `university_id`, `campus_id`, `program_id`, `email`, `email_verified_at`, `password`, `user_type`, `isInternal`, `isExternal`, `current_role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 1, 1, 1, 'admin@gmail.com', NULL, '$2y$10$sYdGtY2c1zLGM4CNCAjcP.oZ7MvwT7RwKvRGXxtfN./86cgfnfNki', 'admin', 0, 0, 'none', '', '2023-09-18 03:29:01', '2023-12-10 21:06:16'),
(2, 'Aaron', 'Lopez', 1, 1, 2, 'aaron.espiritulopez07@gmail.com', NULL, '$2y$10$WFUG1TMV63YTplxeBstIeOKCIouPlIvBuJW8hAqxWZTnivQVt4E9e', 'user', 0, 0, 'chair', NULL, '2023-09-18 03:30:51', '2024-01-25 04:27:58'),
(3, 'Errol', 'Lopez', 1, 1, 7, 'errol@gmail.com', NULL, '$2y$10$bFekmR4XZHSvuq.iWzf9SOd79dP4a3dWaesH2Othl/SPsr7ry6Axq', 'user', 1, 0, 'internal', 'btbFuPtkfnGCRt6TWxECnGo9dRkjiNJYzfO8VXALVNyD2QvF0P7sZUueELET', '2023-09-18 03:33:57', '2024-01-23 06:34:53'),
(4, 'Fredirick', 'Patacsil', 1, 1, 1, 'patacsil@gmail.com', NULL, '$2y$10$A9C39u0E3m0/Emyn1IbyW.DqR4lIxTPaWgXAmQdP2TRPe9fOL1v.S', 'user', 0, 1, 'area member', NULL, '2023-09-18 03:34:24', '2024-01-07 02:49:17'),
(6, 'Amos Ezra', 'Aduan', 1, 3, 2, 'amos@gmail.com', NULL, '$2y$10$pCiDz8ZnNZGNH/U/Dc8Xmefndotplk2jAUe.WBNHbsxDw0cmBwMWC', 'user', 0, 0, 'chair', NULL, '2023-09-18 03:46:15', '2024-01-25 04:17:49'),
(7, 'John Azriel', 'Perez', 1, 1, 2, 'azriel@gmail.com', NULL, '$2y$10$VhantScrbmCANaEyTf1qt.96b/GTzl5SseJoIDH2IXWj.qk0/bPsa', 'user', 1, 0, 'none', NULL, '2023-09-18 03:49:03', '2024-01-07 02:36:46'),
(8, 'Aries', 'Reyes', 1, 1, 7, 'aries@gmail.com', NULL, '$2y$10$XvWHMCOqcqnCtY//mLB1huCRG5Azuv5Z6zxIO.XiGy9O2zziBXTa.', 'user', 0, 0, 'none', NULL, '2023-09-18 03:50:24', '2023-09-18 03:50:24'),
(11, 'Raygeena Franchesca Ashley', 'Fernandez', 1, 1, 2, 'fernandez.ashley@yahoo.com', NULL, '$2y$10$pNdpL3Np2fCkmdo34EpXQuzoqqYIagbAqDTkdOsZyrGopkT1XRmAm', 'user', 0, 0, 'none', NULL, '2023-09-19 04:48:48', '2023-09-19 04:48:48'),
(12, 'Bonifacio', 'Salazar Jr', 1, 1, 2, 'salazar@gmail.com', NULL, '$2y$10$F8jRtJjIHZnwWP98rsjcZuy5L5Jd92/fjUgqLv0ohjejVZg4oIzBO', 'user', 1, 0, 'none', NULL, '2023-09-19 04:49:17', '2024-01-07 02:36:56'),
(13, 'Michael', 'Acosta', 1, 1, 2, 'micheal@gmail.com', NULL, '$2y$10$HPvpISZX0qaY3nc2B5sE.ujXL0rAj3e7q2VPi4V9faDP5BF.13Mce', 'user', 1, 0, 'internal', NULL, '2023-09-19 04:49:52', '2024-01-21 06:56:56'),
(14, 'Juan', 'Dela Cruz', 1, 5, 17, 'juan@gmail.com', NULL, '$2y$10$WsoCzNMqxNjzu5b3euCiEOhWx7pBhKbVDhqSUv2mL1GO56DTqJY.G', 'user', 1, 0, 'none', NULL, '2023-09-21 06:13:46', '2024-01-16 18:33:54'),
(16, 'Dick', 'Lomibao', 1, 4, 18, 'sorianokid771@gmail.com', NULL, '$2y$10$TNQqDbY1FiW6dCux.8JOC.HLPekd.cfy0Qi3tGvKP4q1UphI/QIqa', 'user', 0, 0, 'none', NULL, '2024-01-13 22:48:05', '2024-01-13 22:48:05'),
(21, 'Irene', 'Perez', 1, 3, 13, 'ireneperez@gmail.com', NULL, '$2y$10$.VP5o7QZkfIk0FJ4PJVMCu2EsBAuMds8SayrFkj26H4ytZxIX0U16', 'user', 1, 0, 'area member', NULL, '2024-01-15 04:46:31', '2024-01-23 05:49:01'),
(25, 'Raditha Mae', 'Galamgam', 8, 17, 8, 'raditha@gmail.com', NULL, '$2y$10$nPo8dwgAJ.VjxhlWvqZVLurGuYHSaxbwlzbiduK5GauK2BnX5GDE.', 'user', 0, 1, 'none', NULL, '2024-01-17 06:55:48', '2024-01-17 06:55:48'),
(27, 'Nyah Xien', 'Santong', 9, 19, 13, 'nyah@gmail.com', NULL, '$2y$10$257Kin/xOWC/9EDESrfK3.qd7MdAcHymt6ljMwBqVn/DJTRgBkFlK', 'user', 0, 1, 'none', NULL, '2024-01-17 07:03:11', '2024-01-17 07:03:11'),
(28, 'Mark Chlouie', 'Pasion', 6, 18, 7, 'markchlouie@gmail.com', NULL, '$2y$10$Yh0tPlBRPDDUmPksozsf9uTBbjyfKZyr31NbIqiLpho1zAJgxE/se', 'user', 0, 1, 'none', NULL, '2024-01-17 07:04:28', '2024-01-17 07:04:28'),
(29, 'Kathlyn Caye', 'Marzan', 6, 18, 14, 'caye@gmail.com', NULL, '$2y$10$COrJbnr711IJU49eDntQMeul.7dfvUhEZNK3UXlmxayz353R0FFVe', 'user', 0, 1, 'none', NULL, '2024-01-17 07:05:10', '2024-01-17 07:05:10'),
(30, 'Ruthie Caryl', 'De Leon', 6, 18, 22, 'ruthie@gmail.com', NULL, '$2y$10$sYdGtY2c1zLGM4CNCAjcP.oZ7MvwT7RwKvRGXxtfN./86cgfnfNki', 'user', 0, 1, 'external', NULL, '2024-01-17 07:09:03', '2024-01-23 06:59:34'),
(31, 'Cyril', 'Asuncion', 1, 6, 8, 'cyrill@gmail.com', NULL, '$2y$10$S77D5oE2Be7LeVGjb3eYieBkHqSDf1A9r8Gq.uye5wCBIddBnaMhK', 'user', 1, 0, 'none', NULL, '2024-01-17 07:09:53', '2024-01-17 07:09:53'),
(32, 'Gabriel Sam', 'Amarillo', 7, 20, 8, 'gabriel@gmail.com', NULL, '$2y$10$4iOZrfXmZHnRD82kkYMiC.wbs/juAQfX0fG2zvjzaLQBxaj.ZlBR2', 'user', 0, 1, 'none', NULL, '2024-01-17 07:11:24', '2024-01-25 04:30:25'),
(35, 'Mel Nia Hope', 'Artemio', 9, 19, 21, 'melniaartemio@gmail.com', NULL, '$2y$10$KdD7hfI0qrPT55u3ME/xqu4cEglIyblN5/Joq4N3l627vmNIE5wz2', 'user', 0, 1, 'none', NULL, '2024-01-19 07:33:08', '2024-01-19 07:33:08'),
(37, 'Gil', 'Lopez III', 1, 3, 2, 'gil@gmail.com', NULL, '$2y$10$sYdGtY2c1zLGM4CNCAjcP.oZ7MvwT7RwKvRGXxtfN./86cgfnfNki', 'user', 0, 0, 'chair', NULL, '2024-01-20 21:55:47', '2024-01-23 05:41:52'),
(38, 'John Phillip', 'Zambrano', 1, 1, 3, 'phillip@gmail.com', NULL, '$2y$10$4VSFeGR53mSgJHdy5dEV8O.c7/IV4NthhBLNHj.PoSR8n7Qmi/3QS', 'user', 0, 0, 'none', NULL, '2024-01-21 06:28:27', '2024-01-21 06:28:27'),
(39, 'John Rey', 'Rivera', 1, 1, 3, 'johnrey@gmail.com', NULL, '$2y$10$sYdGtY2c1zLGM4CNCAjcP.oZ7MvwT7RwKvRGXxtfN./86cgfnfNki', 'user', 0, 0, 'none', NULL, '2024-01-21 06:29:02', '2024-01-21 06:29:02'),
(40, 'Kiziah Joy', 'Paguyo', 1, 1, 3, 'kiziah@gmail.com', NULL, '$2y$10$sYdGtY2c1zLGM4CNCAjcP.oZ7MvwT7RwKvRGXxtfN./86cgfnfNki', 'user', 0, 0, 'none', NULL, '2024-01-21 06:29:26', '2024-01-21 06:29:26'),
(41, 'Yves', 'Barro', 1, 1, 3, 'yves@gmail.com', NULL, '$2y$10$sYdGtY2c1zLGM4CNCAjcP.oZ7MvwT7RwKvRGXxtfN./86cgfnfNki', 'user', 0, 0, 'chair', NULL, '2024-01-21 06:29:45', '2024-01-21 06:53:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accreditations`
--
ALTER TABLE `accreditations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accreditations_program_level_id_foreign` (`program_level_id`),
  ADD KEY `accreditations_instrument_id_foreign` (`instrument_id`);

--
-- Indexes for table `accreditation_areas`
--
ALTER TABLE `accreditation_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accreditation_areas_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `accreditation_areas_area_id_foreign` (`area_id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_instrument_id_foreign` (`instrument_id`);

--
-- Indexes for table `area_members`
--
ALTER TABLE `area_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_members_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `area_members_user_id_foreign` (`user_id`),
  ADD KEY `area_members_area_id_foreign` (`area_id`);

--
-- Indexes for table `area_programs`
--
ALTER TABLE `area_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_programs_program_id_foreign` (`program_id`),
  ADD KEY `area_programs_area_id_foreign` (`area_id`);

--
-- Indexes for table `area_ratings`
--
ALTER TABLE `area_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `area_ratings_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `area_ratings_user_id_foreign` (`user_id`),
  ADD KEY `area_ratings_area_id_foreign` (`area_id`);

--
-- Indexes for table `campuses`
--
ALTER TABLE `campuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campuses_university_id_foreign` (`university_id`);

--
-- Indexes for table `compliance_report_files`
--
ALTER TABLE `compliance_report_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compliance_report_files_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `compliance_report_files_user_id_foreign` (`user_id`),
  ADD KEY `compliance_report_files_area_id_foreign` (`area_id`);

--
-- Indexes for table `criterias`
--
ALTER TABLE `criterias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `criteria_files`
--
ALTER TABLE `criteria_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criteria_files_user_id_foreign` (`user_id`),
  ADD KEY `criteria_files_area_id_foreign` (`area_id`),
  ADD KEY `criteria_files_criteria_id_foreign` (`criteria_id`),
  ADD KEY `criteria_files_accreditation_id_foreign` (`accreditation_id`);

--
-- Indexes for table `criteria_messages`
--
ALTER TABLE `criteria_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criteria_messages_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `criteria_messages_sender_id_foreign` (`sender_id`),
  ADD KEY `criteria_messages_criteria_file_id_foreign` (`criteria_file_id`);

--
-- Indexes for table `criteria_ratings`
--
ALTER TABLE `criteria_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criteria_ratings_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `criteria_ratings_user_id_foreign` (`user_id`),
  ADD KEY `criteria_ratings_criteria_id_foreign` (`criteria_id`),
  ADD KEY `criteria_ratings_area_id_foreign` (`area_id`);

--
-- Indexes for table `designated_accreditor_areas`
--
ALTER TABLE `designated_accreditor_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `designated_accreditor_areas_user_id_foreign` (`user_id`),
  ADD KEY `designated_accreditor_areas_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `designated_accreditor_areas_area_id_foreign` (`area_id`);

--
-- Indexes for table `external_ratings`
--
ALTER TABLE `external_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `external_ratings_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `external_ratings_user_id_foreign` (`user_id`),
  ADD KEY `external_ratings_parameter_id_foreign` (`parameter_id`),
  ADD KEY `external_ratings_indicator_id_foreign` (`indicator_id`);

--
-- Indexes for table `external_sub_component_ratings`
--
ALTER TABLE `external_sub_component_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `external_sub_component_ratings_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `external_sub_component_ratings_user_id_foreign` (`user_id`),
  ADD KEY `external_sub_component_ratings_parameter_id_foreign` (`parameter_id`),
  ADD KEY `external_sub_component_ratings_sub_component_id_foreign` (`sub_component_id`);

--
-- Indexes for table `external_sub_ratings`
--
ALTER TABLE `external_sub_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `external_sub_ratings_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `external_sub_ratings_user_id_foreign` (`user_id`),
  ADD KEY `external_sub_ratings_parameter_id_foreign` (`parameter_id`),
  ADD KEY `external_sub_ratings_sub_indicator_id_foreign` (`sub_indicator_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indicators_parameter_id_foreign` (`parameter_id`),
  ADD KEY `indicators_indicator_category_id_foreign` (`indicator_category_id`);

--
-- Indexes for table `indicator_backup_file`
--
ALTER TABLE `indicator_backup_file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indicator_categories`
--
ALTER TABLE `indicator_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indicator_files`
--
ALTER TABLE `indicator_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indicator_files_user_id_foreign` (`user_id`),
  ADD KEY `indicator_files_parameter_id_foreign` (`parameter_id`),
  ADD KEY `indicator_files_indicator_id_foreign` (`indicator_id`),
  ADD KEY `indicator_files_accreditation_id_foreign` (`accreditation_id`);

--
-- Indexes for table `indicator_messages`
--
ALTER TABLE `indicator_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indicator_messages_sender_id_foreign` (`sender_id`),
  ADD KEY `indicator_messages_indicator_file_id_foreign` (`indicator_file_id`),
  ADD KEY `indicator_messages_accreditation_id_foreign` (`accreditation_id`);

--
-- Indexes for table `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instruments_program_instrument_id_foreign` (`program_instrument_id`);

--
-- Indexes for table `internal_ratings`
--
ALTER TABLE `internal_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `internal_ratings_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `internal_ratings_user_id_foreign` (`user_id`),
  ADD KEY `internal_ratings_parameter_id_foreign` (`parameter_id`),
  ADD KEY `internal_ratings_indicator_id_foreign` (`indicator_id`);

--
-- Indexes for table `internal_sub_component_ratings`
--
ALTER TABLE `internal_sub_component_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `internal_sub_component_ratings_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `internal_sub_component_ratings_user_id_foreign` (`user_id`),
  ADD KEY `internal_sub_component_ratings_parameter_id_foreign` (`parameter_id`),
  ADD KEY `internal_sub_component_ratings_sub_component_id_foreign` (`sub_component_id`);

--
-- Indexes for table `internal_sub_ratings`
--
ALTER TABLE `internal_sub_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `internal_sub_ratings_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `internal_sub_ratings_user_id_foreign` (`user_id`),
  ADD KEY `internal_sub_ratings_parameter_id_foreign` (`parameter_id`),
  ADD KEY `internal_sub_ratings_sub_indicator_id_foreign` (`sub_indicator_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `members_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `members_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `parameters`
--
ALTER TABLE `parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parameters_area_id_foreign` (`area_id`);

--
-- Indexes for table `parameter_ratings`
--
ALTER TABLE `parameter_ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parameter_reports`
--
ALTER TABLE `parameter_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parameter_reports_accreditation_id_foreign` (`accreditation_id`),
  ADD KEY `parameter_reports_user_id_foreign` (`user_id`),
  ADD KEY `parameter_reports_parameter_id_foreign` (`parameter_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_instruments`
--
ALTER TABLE `program_instruments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `program_levels`
--
ALTER TABLE `program_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_levels_campus_id_foreign` (`campus_id`),
  ADD KEY `program_levels_program_id_foreign` (`program_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_component_files`
--
ALTER TABLE `sub_component_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_component_files_user_id_foreign` (`user_id`),
  ADD KEY `sub_component_files_parameter_id_foreign` (`parameter_id`),
  ADD KEY `sub_component_files_sub_component_id_foreign` (`sub_component_id`),
  ADD KEY `sub_component_files_accreditation_id_foreign` (`accreditation_id`);

--
-- Indexes for table `sub_component_messages`
--
ALTER TABLE `sub_component_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_component_messages_sender_id_foreign` (`sender_id`),
  ADD KEY `sub_component_messages_sub_component_file_id_foreign` (`sub_component_file_id`),
  ADD KEY `sub_component_messages_accreditation_id_foreign` (`accreditation_id`);

--
-- Indexes for table `sub_indicators`
--
ALTER TABLE `sub_indicators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_indicators_parameter_id_foreign` (`parameter_id`),
  ADD KEY `sub_indicators_indicator_id_foreign` (`indicator_id`);

--
-- Indexes for table `sub_indicator_components`
--
ALTER TABLE `sub_indicator_components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_indicator_components_parameter_id_foreign` (`parameter_id`),
  ADD KEY `sub_indicator_components_sub_indicator_id_foreign` (`sub_indicator_id`);

--
-- Indexes for table `sub_indicator_files`
--
ALTER TABLE `sub_indicator_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_indicator_files_user_id_foreign` (`user_id`),
  ADD KEY `sub_indicator_files_parameter_id_foreign` (`parameter_id`),
  ADD KEY `sub_indicator_files_sub_indicator_id_foreign` (`sub_indicator_id`),
  ADD KEY `sub_indicator_files_accreditation_id_foreign` (`accreditation_id`);

--
-- Indexes for table `sub_indicator_messages`
--
ALTER TABLE `sub_indicator_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_indicator_messages_sender_id_foreign` (`sender_id`),
  ADD KEY `sub_indicator_messages_sub_indicator_file_id_foreign` (`sub_indicator_file_id`),
  ADD KEY `sub_indicator_messages_accreditation_id_foreign` (`accreditation_id`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `university_id` (`university_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_campus_id_foreign` (`campus_id`),
  ADD KEY `users_program_id_foreign` (`program_id`),
  ADD KEY `users_university_id_foreign` (`university_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accreditations`
--
ALTER TABLE `accreditations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `accreditation_areas`
--
ALTER TABLE `accreditation_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `area_members`
--
ALTER TABLE `area_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `area_programs`
--
ALTER TABLE `area_programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `area_ratings`
--
ALTER TABLE `area_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `campuses`
--
ALTER TABLE `campuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `compliance_report_files`
--
ALTER TABLE `compliance_report_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `criterias`
--
ALTER TABLE `criterias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `criteria_files`
--
ALTER TABLE `criteria_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `criteria_messages`
--
ALTER TABLE `criteria_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `criteria_ratings`
--
ALTER TABLE `criteria_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `designated_accreditor_areas`
--
ALTER TABLE `designated_accreditor_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `external_ratings`
--
ALTER TABLE `external_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `external_sub_component_ratings`
--
ALTER TABLE `external_sub_component_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `external_sub_ratings`
--
ALTER TABLE `external_sub_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `indicators`
--
ALTER TABLE `indicators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1200;

--
-- AUTO_INCREMENT for table `indicator_backup_file`
--
ALTER TABLE `indicator_backup_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `indicator_categories`
--
ALTER TABLE `indicator_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `indicator_files`
--
ALTER TABLE `indicator_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `indicator_messages`
--
ALTER TABLE `indicator_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `internal_ratings`
--
ALTER TABLE `internal_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=711;

--
-- AUTO_INCREMENT for table `internal_sub_component_ratings`
--
ALTER TABLE `internal_sub_component_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `internal_sub_ratings`
--
ALTER TABLE `internal_sub_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=621;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `parameters`
--
ALTER TABLE `parameters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `parameter_ratings`
--
ALTER TABLE `parameter_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `parameter_reports`
--
ALTER TABLE `parameter_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `program_instruments`
--
ALTER TABLE `program_instruments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `program_levels`
--
ALTER TABLE `program_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_component_files`
--
ALTER TABLE `sub_component_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_component_messages`
--
ALTER TABLE `sub_component_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sub_indicators`
--
ALTER TABLE `sub_indicators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=494;

--
-- AUTO_INCREMENT for table `sub_indicator_components`
--
ALTER TABLE `sub_indicator_components`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `sub_indicator_files`
--
ALTER TABLE `sub_indicator_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sub_indicator_messages`
--
ALTER TABLE `sub_indicator_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accreditations`
--
ALTER TABLE `accreditations`
  ADD CONSTRAINT `accreditations_instrument_id_foreign` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accreditations_program_level_id_foreign` FOREIGN KEY (`program_level_id`) REFERENCES `program_levels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `accreditation_areas`
--
ALTER TABLE `accreditation_areas`
  ADD CONSTRAINT `accreditation_areas_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `accreditation_areas_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_instrument_id_foreign` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `area_members`
--
ALTER TABLE `area_members`
  ADD CONSTRAINT `area_members_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `area_members_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `area_members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `area_programs`
--
ALTER TABLE `area_programs`
  ADD CONSTRAINT `area_programs_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `area_programs_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `area_ratings`
--
ALTER TABLE `area_ratings`
  ADD CONSTRAINT `area_ratings_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `area_ratings_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `area_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `campuses`
--
ALTER TABLE `campuses`
  ADD CONSTRAINT `campuses_university_id_foreign` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `compliance_report_files`
--
ALTER TABLE `compliance_report_files`
  ADD CONSTRAINT `compliance_report_files_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compliance_report_files_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `compliance_report_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `criteria_files`
--
ALTER TABLE `criteria_files`
  ADD CONSTRAINT `criteria_files_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `criteria_files_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `criteria_files_criteria_id_foreign` FOREIGN KEY (`criteria_id`) REFERENCES `criterias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `criteria_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `criteria_messages`
--
ALTER TABLE `criteria_messages`
  ADD CONSTRAINT `criteria_messages_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `criteria_messages_criteria_file_id_foreign` FOREIGN KEY (`criteria_file_id`) REFERENCES `criteria_files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `criteria_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `criteria_ratings`
--
ALTER TABLE `criteria_ratings`
  ADD CONSTRAINT `criteria_ratings_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `criteria_ratings_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `criteria_ratings_criteria_id_foreign` FOREIGN KEY (`criteria_id`) REFERENCES `criterias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `criteria_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `designated_accreditor_areas`
--
ALTER TABLE `designated_accreditor_areas`
  ADD CONSTRAINT `designated_accreditor_areas_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `designated_accreditor_areas_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `designated_accreditor_areas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `external_ratings`
--
ALTER TABLE `external_ratings`
  ADD CONSTRAINT `external_ratings_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `external_ratings_indicator_id_foreign` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `external_ratings_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `external_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `external_sub_component_ratings`
--
ALTER TABLE `external_sub_component_ratings`
  ADD CONSTRAINT `external_sub_component_ratings_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `external_sub_component_ratings_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `external_sub_component_ratings_sub_component_id_foreign` FOREIGN KEY (`sub_component_id`) REFERENCES `sub_indicator_components` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `external_sub_component_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `external_sub_ratings`
--
ALTER TABLE `external_sub_ratings`
  ADD CONSTRAINT `external_sub_ratings_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `external_sub_ratings_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `external_sub_ratings_sub_indicator_id_foreign` FOREIGN KEY (`sub_indicator_id`) REFERENCES `sub_indicators` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `external_sub_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `indicators`
--
ALTER TABLE `indicators`
  ADD CONSTRAINT `indicators_indicator_category_id_foreign` FOREIGN KEY (`indicator_category_id`) REFERENCES `indicator_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indicators_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `indicator_files`
--
ALTER TABLE `indicator_files`
  ADD CONSTRAINT `indicator_files_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indicator_files_indicator_id_foreign` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indicator_files_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indicator_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `indicator_messages`
--
ALTER TABLE `indicator_messages`
  ADD CONSTRAINT `indicator_messages_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indicator_messages_indicator_file_id_foreign` FOREIGN KEY (`indicator_file_id`) REFERENCES `indicator_files` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `indicator_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `instruments`
--
ALTER TABLE `instruments`
  ADD CONSTRAINT `instruments_program_instrument_id_foreign` FOREIGN KEY (`program_instrument_id`) REFERENCES `program_instruments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `internal_ratings`
--
ALTER TABLE `internal_ratings`
  ADD CONSTRAINT `internal_ratings_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `internal_ratings_indicator_id_foreign` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `internal_ratings_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `internal_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `internal_sub_component_ratings`
--
ALTER TABLE `internal_sub_component_ratings`
  ADD CONSTRAINT `internal_sub_component_ratings_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `internal_sub_component_ratings_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `internal_sub_component_ratings_sub_component_id_foreign` FOREIGN KEY (`sub_component_id`) REFERENCES `sub_indicator_components` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `internal_sub_component_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `internal_sub_ratings`
--
ALTER TABLE `internal_sub_ratings`
  ADD CONSTRAINT `internal_sub_ratings_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `internal_sub_ratings_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `internal_sub_ratings_sub_indicator_id_foreign` FOREIGN KEY (`sub_indicator_id`) REFERENCES `sub_indicators` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `internal_sub_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `members_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parameters`
--
ALTER TABLE `parameters`
  ADD CONSTRAINT `parameters_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parameter_reports`
--
ALTER TABLE `parameter_reports`
  ADD CONSTRAINT `parameter_reports_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parameter_reports_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `parameter_reports_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `program_levels`
--
ALTER TABLE `program_levels`
  ADD CONSTRAINT `program_levels_campus_id_foreign` FOREIGN KEY (`campus_id`) REFERENCES `campuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `program_levels_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_component_files`
--
ALTER TABLE `sub_component_files`
  ADD CONSTRAINT `sub_component_files_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_component_files_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_component_files_sub_component_id_foreign` FOREIGN KEY (`sub_component_id`) REFERENCES `sub_indicator_components` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_component_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_component_messages`
--
ALTER TABLE `sub_component_messages`
  ADD CONSTRAINT `sub_component_messages_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_component_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_component_messages_sub_component_file_id_foreign` FOREIGN KEY (`sub_component_file_id`) REFERENCES `sub_component_files` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_indicators`
--
ALTER TABLE `sub_indicators`
  ADD CONSTRAINT `sub_indicators_indicator_id_foreign` FOREIGN KEY (`indicator_id`) REFERENCES `indicators` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_indicators_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_indicator_components`
--
ALTER TABLE `sub_indicator_components`
  ADD CONSTRAINT `sub_indicator_components_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_indicator_components_sub_indicator_id_foreign` FOREIGN KEY (`sub_indicator_id`) REFERENCES `sub_indicators` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_indicator_files`
--
ALTER TABLE `sub_indicator_files`
  ADD CONSTRAINT `sub_indicator_files_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_indicator_files_parameter_id_foreign` FOREIGN KEY (`parameter_id`) REFERENCES `parameters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_indicator_files_sub_indicator_id_foreign` FOREIGN KEY (`sub_indicator_id`) REFERENCES `sub_indicators` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_indicator_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_indicator_messages`
--
ALTER TABLE `sub_indicator_messages`
  ADD CONSTRAINT `sub_indicator_messages_accreditation_id_foreign` FOREIGN KEY (`accreditation_id`) REFERENCES `accreditations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_indicator_messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_indicator_messages_sub_indicator_file_id_foreign` FOREIGN KEY (`sub_indicator_file_id`) REFERENCES `sub_indicator_files` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_campus_id_foreign` FOREIGN KEY (`campus_id`) REFERENCES `campuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_university_id_foreign` FOREIGN KEY (`university_id`) REFERENCES `universities` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
