-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2024 at 12:59 AM
-- Server version: 10.4.27-MariaDB
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
(27, 'IT ACCREDITATION 2023', 1, 21, 'Old', 'Re-Visit', '2024-01-22', '2024-01-29', NULL, NULL, '2024-01-17 07:44:17', '2024-01-17 07:44:17');

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
(142, 27, 56, '2024-01-17 07:44:24', '2024-01-17 07:44:24'),
(143, 27, 65, '2024-01-17 09:36:43', '2024-01-17 09:36:43'),
(144, 27, 64, '2024-01-17 09:36:53', '2024-01-17 09:36:53'),
(145, 27, 58, '2024-01-17 10:00:41', '2024-01-17 10:00:41'),
(146, 27, 57, '2024-01-17 10:00:43', '2024-01-17 10:00:43'),
(147, 27, 59, '2024-01-17 10:00:49', '2024-01-17 10:00:49'),
(148, 27, 60, '2024-01-17 10:00:50', '2024-01-17 10:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instrument_id` bigint(20) UNSIGNED NOT NULL,
  `area_name` varchar(255) NOT NULL,
  `area_title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `instrument_id`, `area_name`, `area_title`, `created_at`, `updated_at`) VALUES
(56, 21, 'Area 1', 'Vision, Mission, Goals and objectives', '2024-01-11 03:43:25', '2024-01-11 03:43:25'),
(57, 21, 'Area 3', 'Curriculum and Instruction', '2024-01-11 03:56:43', '2024-01-11 03:58:11'),
(58, 21, 'Area 2', 'Faculty', '2024-01-11 03:58:16', '2024-01-11 03:58:16'),
(59, 21, 'Area 4', 'Support to Students', '2024-01-11 03:58:57', '2024-01-11 03:58:57'),
(60, 21, 'Area 5', 'Research', '2024-01-11 03:59:27', '2024-01-11 03:59:27'),
(61, 21, 'Area 6', 'Extension And Community Involvement', '2024-01-11 03:59:54', '2024-01-11 03:59:54'),
(62, 21, 'Area 7', 'Library', '2024-01-11 04:23:01', '2024-01-12 03:03:03'),
(63, 21, 'Area 8', 'Physical plant and Facilities', '2024-01-11 04:23:06', '2024-01-12 05:02:48'),
(64, 21, 'Area 9', 'Laboratories', '2024-01-11 04:23:27', '2024-01-11 04:23:27'),
(65, 21, 'Area 10', 'Administration', '2024-01-11 04:24:00', '2024-01-11 04:24:00'),
(66, 26, 'Area 1', 'Instruction', '2024-01-16 04:59:36', '2024-01-16 06:26:04'),
(67, 26, 'Area 2', 'Extension', '2024-01-16 06:26:15', '2024-01-16 06:26:15'),
(68, 26, 'Area 3', 'Research', '2024-01-16 06:26:23', '2024-01-16 06:26:23'),
(69, 26, 'Area 4', 'Linkages and Faculty Development', '2024-01-16 06:26:31', '2024-01-16 06:26:31');

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
(110, 27, 3, 56, 'chair', 0, 0, '2024-01-17 07:45:10', '2024-01-17 07:45:10'),
(116, 27, 13, 56, 'chair', 0, 0, '2024-01-17 09:18:55', '2024-01-17 09:18:55'),
(129, 27, 14, 64, 'internal', 0, 0, '2024-01-17 09:37:13', '2024-01-17 09:37:13'),
(139, 27, 31, 56, 'internal', 0, 0, '2024-01-17 09:57:58', '2024-01-17 09:57:58'),
(140, 27, 27, 64, 'external', 0, 0, '2024-01-17 09:58:07', '2024-01-17 09:58:07'),
(141, 27, 3, 65, 'internal', 0, 0, '2024-01-17 10:01:00', '2024-01-17 10:01:00'),
(142, 27, 3, 57, 'chair', 0, 0, '2024-01-17 10:01:55', '2024-01-17 10:01:55'),
(143, 27, 2, 57, 'member', 0, 0, '2024-01-17 10:02:10', '2024-01-17 10:02:10'),
(144, 27, 11, 57, 'member', 0, 0, '2024-01-17 10:02:11', '2024-01-17 10:02:11'),
(145, 27, 24, 59, 'external', 0, 0, '2024-01-17 10:02:26', '2024-01-17 10:02:26');

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
(1, 1, 'Udaneta City Campus', '2023-09-18 03:28:47', '2023-09-18 03:28:47'),
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
(224, 92, 7, 'qwe', 'qwe', 0, '2024-01-16 04:59:56', '2024-01-16 04:59:56'),
(225, 92, 1, 'asd', 'asdasd', 0, '2024-01-16 05:02:33', '2024-01-16 05:02:33'),
(226, 92, 7, 'asd', 'asd', 0, '2024-01-16 05:09:17', '2024-01-16 05:09:17');

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
(29, 3, 27, 49, 45, '111', 'f33b9b08-696c-4384-9046-39547a2429ad.pdf', 'pdf', 'storage/files/f33b9b08-696c-4384-9046-39547a2429ad.pdf', 'pending', '2024-01-17 08:42:08', '2024-01-17 08:46:26'),
(30, 3, 27, 49, 45, '222', '0fe100be-c3f5-46ee-bc75-ace7e675d251.pdf', 'pdf', 'storage/files/0fe100be-c3f5-46ee-bc75-ace7e675d251.pdf', 'pending', '2024-01-17 08:42:17', '2024-01-17 08:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `indicator_messages`
--

CREATE TABLE `indicator_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(21, 1, 'Instrument for level 1 and 2 Old', 1, 1, 0, 0, 'Old', '2024-01-10 03:56:12', '2024-01-17 02:39:08'),
(23, 1, 'Instrument for level 3 and 4 Old', 0, 0, 1, 1, 'Old', '2024-01-11 03:29:07', '2024-01-17 02:39:11'),
(26, 1, 'Instrument for level 3 and 4 New', 0, 0, 1, 1, 'New', '2024-01-11 03:29:54', '2024-01-17 02:39:17'),
(30, 1, 'Instrument for PSV', 0, 0, 0, 0, 'PSV', '2024-01-12 06:35:14', '2024-01-17 02:39:22');

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
(81, '2024_01_14_151916_create_parameter_reports_table', 16);

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
('027a04a4-0335-46c8-9fe5-02fe6b177340', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 11, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:33:37', '2024-01-15 03:33:37'),
('03e415fa-0a7a-46fc-b869-bcbffc0f3a49', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-12 09:46:53', '2024-01-12 09:15:05', '2024-01-12 09:46:53'),
('051cf128-f198-4818-8ca8-9875f641a877', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:37:13', '2024-01-17 09:37:13'),
('0887af88-f771-4ab4-9f76-b8f35f464e61', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:14:30', '2024-01-17 09:14:30'),
('0b30d12c-5bb0-4a6c-ba7e-cd663f0e2f7c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:33:37', '2024-01-15 03:33:37'),
('0e993e64-5ea9-4702-aa31-16ed5c2f931d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/7\"}', '2024-01-13 23:58:58', '2023-12-21 06:27:07', '2024-01-13 23:58:58'),
('0e9bf454-918c-4148-a966-c6ae70f12630', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 12, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', NULL, '2024-01-15 04:01:21', '2024-01-15 04:01:21'),
('0ee1fa8b-6a73-44ac-bbe4-33d942d059db', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 10:01:55', '2024-01-17 10:01:55'),
('14975a8f-58f3-40ec-b7a0-fe0615b688a4', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 5, '{\"content\":\"Account has been disabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\"}', '2023-12-14 14:30:25', '2023-12-14 14:30:19', '2023-12-14 14:30:25'),
('154909ed-c6dd-478e-a3b0-89d03292eb23', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 07:32:18', '2024-01-15 07:32:18'),
('158ec0e0-e140-4d12-9392-675e13a84176', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2023-12-21 06:27:27', '2023-12-21 06:25:32', '2023-12-21 06:27:27'),
('166ca450-59bf-4313-8c09-59f067e03c79', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-15 09:47:56', '2024-01-15 08:27:16', '2024-01-15 09:47:56'),
('1a7ea219-58c5-4f3f-8848-452057e2d507', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as member for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-16 05:30:08', '2024-01-15 08:38:44', '2024-01-16 05:30:08'),
('1a967f2e-d82e-4534-bec9-60022f92728b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 5, '{\"content\":\"Account has been disabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\\/manage_accreditation\"}', '2023-12-14 14:30:59', '2023-12-14 14:30:54', '2023-12-14 14:30:59'),
('1c1956df-f0a2-49d6-9fd4-22fef879b5ec', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 10:01:00', '2024-01-17 10:01:00'),
('1c8be1c5-1b29-44c0-9953-0af5358366b7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-15 08:28:43', '2024-01-15 08:28:43'),
('26ce10ea-aa78-4970-b2c7-de7c0c703780', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"Account has been disabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\\/manage_accreditation\"}', '2023-12-21 06:27:27', '2023-12-14 14:30:54', '2023-12-21 06:27:27'),
('285487be-6f21-4345-8a7e-744b7d8fa9d7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:50:03', '2024-01-17 09:50:03'),
('29b151a2-d102-4267-b77e-b00155fe6e70', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-15 09:47:56', '2024-01-15 08:30:18', '2024-01-15 09:47:56'),
('29e0a712-1561-495a-97d7-c34f7b0186c7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-16 05:30:08', '2024-01-15 09:43:54', '2024-01-16 05:30:08'),
('2af96537-3d08-4e9b-8fba-ecf31637e311', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-12 08:06:09', '2024-01-12 08:05:54', '2024-01-12 08:06:09'),
('2b9d77c4-9c2f-4234-9165-e7ea9c6f7ba0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-15 09:47:56', '2024-01-15 08:06:38', '2024-01-15 09:47:56'),
('2ca55548-1260-410a-b9f7-ec9a5ecc3e4f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:25:22', '2024-01-17 09:25:22'),
('2ca572b6-56c1-46fc-95a5-1236416eb0ed', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2023-12-14 07:02:10', '2023-12-13 23:35:17', '2023-12-14 07:02:10'),
('2ef22a73-a8c2-4aa9-b5fe-12111ba6f45e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-07 14:11:19', '2024-01-07 04:39:33', '2024-01-07 14:11:19'),
('3181a182-ce89-4d0b-afbb-d93d1550cc48', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-07 14:11:19', '2024-01-07 04:41:57', '2024-01-07 14:11:19'),
('34122e27-ae75-4d32-b21d-6915d4435ea4', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:25:04', '2024-01-17 09:25:04'),
('35a52405-178c-4ec7-aad8-aa3056c71f7d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:34:13', '2024-01-15 08:34:13'),
('35f2bbe4-5d1b-4d27-8de2-c95033463aaf', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:19', '2024-01-06 09:06:01', '2024-01-07 14:11:19'),
('37cbdb26-87cb-4e77-be6d-4e6951c4fcbe', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:57:54', '2024-01-15 03:57:54'),
('3f4e6e05-8d91-401e-9cb9-5b1ee06a4ccd', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 28, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 10:00:33', '2024-01-17 10:00:33'),
('4100339d-b5a2-448f-9c88-6250f1e1438a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:53:59', '2024-01-17 09:53:59'),
('412daf9f-0e4c-4f64-9de9-15e5d28a7750', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/21\"}', '2024-01-12 19:57:46', '2024-01-12 19:52:49', '2024-01-12 19:57:46'),
('413756ec-5c21-422f-a42d-893eb0e50c62', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', NULL, '2024-01-15 04:01:21', '2024-01-15 04:01:21'),
('42c78d74-86fe-422a-ad78-697a1d9cbc97', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 07:31:54', '2024-01-15 07:31:54'),
('43321755-1df3-433f-8546-e577f6e6b590', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-15 09:47:56', '2024-01-15 09:47:41', '2024-01-15 09:47:56'),
('43645c8d-1683-40ed-9044-6a6d96fdc5ca', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/7\"}', '2023-12-21 06:27:27', '2023-12-21 06:26:44', '2023-12-21 06:27:27'),
('4b6f8f9e-fb83-4cf3-9ffd-e5cf368b30ed', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', NULL, '2024-01-07 04:41:18', '2024-01-07 04:41:18'),
('4e1f9b14-e32f-43c3-9291-5504ea2a1b5e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as member for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 10:02:11', '2024-01-17 10:02:11'),
('4e3d9b0b-cc78-4a69-827f-8a54527afc20', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:19', '2024-01-07 04:41:37', '2024-01-07 14:11:19'),
('4eb7aa34-09bf-4e31-b8de-07250bb0205b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:14:23', '2024-01-17 09:14:23'),
('4eff8605-002c-4e63-b5de-6c999c12f1d2', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', NULL, '2024-01-15 03:52:51', '2024-01-15 03:52:51'),
('4f31c71f-c251-4461-a923-0f708f2e2f7d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/7\"}', '2023-12-21 06:27:27', '2023-12-21 06:26:37', '2023-12-21 06:27:27'),
('53873ad8-06c7-4a65-aa5b-7b36cc5dda7e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-15 09:47:56', '2024-01-14 00:04:00', '2024-01-15 09:47:56'),
('53d48595-b908-4442-ad74-4fd29319975b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-13 23:58:58', '2024-01-07 05:17:50', '2024-01-13 23:58:58'),
('540f315c-167b-45d6-b526-6f0e72de1ac8', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:16:37', '2024-01-17 09:16:37'),
('550ac478-b337-449e-9246-373513eba37f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 14:03:38', '2024-01-07 14:11:18'),
('550f1a9c-24c2-4d9b-83ae-20f23f9442af', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:56:15', '2024-01-15 08:56:15'),
('563593a4-20ec-4c19-ab21-8936944caebb', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 07:35:18', '2024-01-15 07:35:18'),
('5694ce48-9bb0-4530-af88-a9f8684287b0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', NULL, '2024-01-15 03:52:54', '2024-01-15 03:52:54'),
('57d7e3dc-91a2-4304-991a-08fd0da50fe1', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 11, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', NULL, '2023-12-13 23:35:12', '2023-12-13 23:35:12'),
('58116e94-0ef0-4e8f-be56-40eb2a3cd9b0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-15 09:47:56', '2024-01-15 03:57:53', '2024-01-15 09:47:56'),
('59a6f51a-a9af-4f8f-b20d-a04415d6996b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-15 08:42:04', '2024-01-15 08:42:04'),
('5c67b438-b65e-45b0-85a9-694b61d9edc6', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:30:25', '2024-01-17 09:30:25'),
('5ca39679-f3a2-4d2f-b2ca-ae5714625931', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:18', '2024-01-07 08:41:23', '2024-01-07 14:11:18'),
('5e46cdab-80d4-4fca-9942-5ce78d62182c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:19', '2024-01-07 04:42:04', '2024-01-07 14:11:19'),
('5e5c8f71-9e77-4e5f-a0cd-2a073461d76a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-13 23:58:58', '2024-01-07 08:44:37', '2024-01-13 23:58:58'),
('5f0805b7-e2b9-4ecb-a992-5d7912568071', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:25:26', '2024-01-17 09:25:26'),
('60200af5-6d2b-48e4-b9b2-022aecd9af77', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 07:44:38', '2024-01-07 14:11:18'),
('65176474-39e2-4db9-9acd-939c04e501a0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:49:50', '2024-01-17 09:49:50'),
('6676617b-eeee-43b8-a463-632e6b66da46', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 4, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 09:31:29', '2023-12-14 09:31:12', '2023-12-14 09:31:29'),
('6695a6ea-5b7e-4af7-9345-529a7548dd4a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 7, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:52:53', '2024-01-17 09:52:53'),
('689d061e-0485-4e5c-bc02-f20ce59fa214', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-07 14:11:19', '2024-01-07 04:39:23', '2024-01-07 14:11:19'),
('6d1fa771-b47b-405d-b1e9-ced84e5a89d0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:18', '2024-01-07 08:41:28', '2024-01-07 14:11:18'),
('72c8c978-8b5c-4182-8111-3e7a8c85e0ac', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2024\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 08:01:47', '2023-12-10 21:01:30', '2023-12-14 08:01:47'),
('73a7b385-2a2a-42d9-be2a-0f7fa0915163', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:33:37', '2024-01-15 03:33:37'),
('750551e8-60c5-4f4d-a95f-f3f8b2fa52e7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 14:11:11', '2024-01-07 14:11:18'),
('75199828-0680-4702-91c7-53d10a17a1d5', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', '2024-01-17 07:58:49', '2024-01-17 07:45:10', '2024-01-17 07:58:49'),
('78969ab4-2dc7-4b15-8703-c7e118052375', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:46:54', '2024-01-17 09:46:54'),
('7b946fa8-ff10-455f-a1c4-098c0674bd02', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:33:14', '2024-01-17 09:33:14'),
('7b9bf518-7579-484c-b6e2-2ccfb2569c10', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 07:02:10', '2023-12-13 23:35:12', '2023-12-14 07:02:10'),
('7d759b30-1c97-4299-804a-5a7b0f88390a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-13 23:58:58', '2024-01-07 08:43:57', '2024-01-13 23:58:58'),
('7db97b77-0e38-44ff-9b28-12aa74d1f07e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 7, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:57:53', '2024-01-15 03:57:53'),
('7e13ac34-0ca0-4793-82d0-608f9c893dbf', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:35:34', '2024-01-17 09:35:34'),
('7f84b82b-3332-4a87-9431-b2eda4c88e94', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 28, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:57:50', '2024-01-17 09:57:50'),
('80ecb512-54c6-459d-b3d5-9d2264cb7068', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:28:02', '2024-01-17 09:28:02'),
('81e20df2-bb70-4c47-9c9f-9484ac77ba59', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 27, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:58:07', '2024-01-17 09:58:07'),
('823bd3ec-d2f0-4c23-92b6-668cc2eed0b0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:52:34', '2024-01-17 09:52:34'),
('851bd569-c0ee-4ee6-a090-ff0ff83ffad7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:19', '2023-12-21 09:46:06', '2024-01-07 14:11:19'),
('88a58c14-b229-484e-b10a-5b588d4b1d7e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:30:31', '2024-01-17 09:30:31'),
('88bfbc94-37ce-4d28-92df-1508c23e0147', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as a Coordinator for the sdffghgjkl;\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/7\"}', NULL, '2023-12-21 06:26:51', '2023-12-21 06:26:51'),
('8b20455f-7963-466f-b817-c544a0b3918c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:15:16', '2024-01-17 09:15:16'),
('8ba23e1c-a1f2-4adb-b97a-f5ac60c2920e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-13 23:58:58', '2024-01-07 11:48:14', '2024-01-13 23:58:58'),
('8cf6ca66-5782-4107-ab4b-0c3672521c46', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 14:09:37', '2024-01-07 14:11:18'),
('8d24b1a2-fa07-4b8b-87c7-bfb179b1114f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:46:37', '2024-01-17 09:46:37'),
('8d8ac09f-5f4c-4cd4-9c27-564b2a7cc2d1', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:42:25', '2024-01-17 09:42:25'),
('8dea65d7-5d6b-40a3-a2be-cc02e4360c48', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Internal Accreditor for the Asingan IT Accreditation 2024\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 02:52:03', '2024-01-17 02:52:03'),
('8df33111-6c0a-4f8b-bb70-c1b67c25ddb3', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"Account has been disabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\\/manage_accreditation\"}', '2023-12-21 06:27:27', '2023-12-14 14:32:23', '2023-12-21 06:27:27'),
('8ef192e0-baca-45ec-ba97-fa29507e9414', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-07 14:11:19', '2024-01-07 04:42:15', '2024-01-07 14:11:19'),
('8f2e332f-dac1-4d82-ae5b-6f274b6d7b9a', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:18', '2024-01-07 07:31:38', '2024-01-07 14:11:18'),
('915e3662-4dcc-450c-97dd-bf08c7a18ec3', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:25:12', '2024-01-17 09:25:12'),
('93a0a160-5a60-47f9-9208-77078421b07c', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:46:59', '2024-01-17 09:46:59'),
('943a72e2-f279-4c44-b852-061255785950', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:15:09', '2024-01-17 09:15:09'),
('957c008c-7f17-4960-b6dd-5496e8ea3a44', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-13 23:58:58', '2024-01-07 08:44:41', '2024-01-13 23:58:58'),
('982c89b4-13d1-4cdf-b616-6df21a444150', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 11, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:57:54', '2024-01-15 03:57:54'),
('99c79cda-3833-4f23-bfe5-ab32a6b8220f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 07:40:43', '2024-01-15 07:40:43'),
('9d4ef88e-eb70-4b1d-836a-e363991c669b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"Account has been enabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\"}', '2023-12-21 06:27:27', '2023-12-14 14:29:48', '2023-12-21 06:27:27'),
('9dc50ab0-c080-43dd-8d67-54bad7d1d6c1', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-13 23:58:58', '2024-01-07 05:17:31', '2024-01-13 23:58:58'),
('a03a1d9a-167c-40cc-bb7f-feb84437a810', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as chair for the Asingan IT Accreditation 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/24\"}', NULL, '2024-01-17 03:16:13', '2024-01-17 03:16:13'),
('a0fb2548-f064-4d9e-b10d-227a37fba65f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:33:08', '2024-01-17 09:33:08'),
('a29980a0-c1a0-4d77-8914-54e94081e5c7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 05:18:34', '2024-01-07 14:11:18'),
('a378dbec-a49f-45b8-bad3-79dc40da11cd', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:46:25', '2024-01-17 09:46:25'),
('a5b7291c-0be6-4536-b651-f496064c4d8e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 12, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:57:54', '2024-01-15 03:57:54'),
('a5e0fed2-f5c9-4a77-b092-7855ac1ac457', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:34:12', '2024-01-17 09:34:12'),
('a6667bce-067c-4587-baca-77035fc78d64', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as chair for the Urdaneta IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/26\"}', '2024-01-17 07:58:49', '2024-01-17 07:30:49', '2024-01-17 07:58:49'),
('a6fac955-cbaa-4ec2-aaa3-b96c169f4819', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-16 05:30:08', '2024-01-15 09:48:57', '2024-01-16 05:30:08'),
('a7092d3c-d377-4397-a924-48fa6b022169', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:45:51', '2024-01-17 09:45:51'),
('a9c5470d-4db8-41c3-86e8-1a98d6463a13', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the Asingan IT Accreditation 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/24\"}', NULL, '2024-01-17 02:51:14', '2024-01-17 02:51:14'),
('ab909560-6561-4404-93f1-8ebb36ba21e5', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-13 23:58:58', '2024-01-13 23:58:37', '2024-01-13 23:58:58'),
('acf6e0d6-1ae7-444e-a6be-9fdc920b0193', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-16 05:30:08', '2024-01-15 09:52:18', '2024-01-16 05:30:08'),
('ae3d9570-543f-4ca6-8fc5-523e31fa72e9', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:25:16', '2024-01-17 09:25:16'),
('ae6f27cf-f9ef-4eba-9ec8-c7fe7ff60413', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 07:45:50', '2024-01-07 14:11:18'),
('ae83e028-e2f5-4f47-b989-07e8aeaf594e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', NULL, '2024-01-15 03:52:55', '2024-01-15 03:52:55'),
('ae8b1259-2259-40e3-a295-4bb18aea3c54', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 12:49:38', '2024-01-07 14:11:18'),
('aff419ad-2755-4c4d-8ba1-3e05454dc906', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:33:03', '2024-01-17 09:33:03'),
('b13325a3-44e7-4017-b7de-0ff3e59a1aeb', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 7, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:52:48', '2024-01-17 09:52:48'),
('b1b77c1d-d216-4438-a51d-200d7dab36ca', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:30:09', '2024-01-17 09:30:09'),
('b36c23ec-b391-405e-b028-3279489499d1', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-12 08:06:09', '2024-01-12 08:05:44', '2024-01-12 08:06:09'),
('b4f6600b-a302-4f64-a05e-05acc1778dd2', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 31, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:57:58', '2024-01-17 09:57:58'),
('b544ec46-136c-4768-b1c6-c65960c04d80', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:24:58', '2024-01-17 09:24:58'),
('b57618ea-7ce4-44b0-8e23-65821ad3386e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-07 14:11:18', '2024-01-07 07:53:15', '2024-01-07 14:11:18'),
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
('c15b11b5-6653-4e27-8bb0-ed12deba968b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:15:05', '2024-01-17 09:15:05'),
('c15fe596-bbc2-48ab-845a-12dc59e24342', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:18', '2024-01-07 07:45:45', '2024-01-07 14:11:18'),
('c20bb639-2c1f-4669-a89c-a099ab165807', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:57:53', '2024-01-15 03:57:53'),
('c30f1f1c-2335-47a4-a8d4-28439d351fd6', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 11, '{\"content\":\"You have been added as member for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 10:02:11', '2024-01-17 10:02:11'),
('c33e055d-f1ad-4784-abc3-8ce566c1998d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:36:59', '2024-01-15 08:36:59'),
('c4ad5036-8f41-4c33-b989-fa01f670b1ca', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', NULL, '2023-12-13 23:35:35', '2023-12-13 23:35:35'),
('c727c3ac-301a-41a7-9cce-d59156dae971', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 07:02:10', '2023-12-13 23:35:35', '2023-12-14 07:02:10'),
('c839c9b4-a89f-4c5f-833f-5e4c3a5587a7', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:40:38', '2024-01-15 08:40:38'),
('cb73b577-5c34-4222-93db-668b289bb464', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:19:04', '2024-01-17 09:19:04'),
('cb7e153c-d951-40d5-a13c-0653e9f40893', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/21\"}', '2024-01-14 06:17:31', '2024-01-14 06:17:25', '2024-01-14 06:17:31'),
('cb83a5d6-ea2b-4ea5-bc34-94fc33138ead', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:26:29', '2024-01-17 09:26:29'),
('cc3f37a5-29b8-4503-912b-299a42cd5fb2', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 03:33:36', '2024-01-15 03:33:36'),
('cd890c0a-3e04-4df0-92ce-e56e52040406', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 08:01:46', '2023-12-13 23:34:57', '2023-12-14 08:01:46'),
('ceede0d3-5e0d-42a5-bf4f-514c4eff5076', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/3\"}', '2023-12-13 06:22:18', '2023-12-09 07:09:47', '2023-12-13 06:22:18'),
('cfbb80e8-f8f9-48b7-9591-543fe3c0898b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 31, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:13:37', '2024-01-17 09:13:37'),
('d0e481e2-aec4-4816-832b-f013b4f0171e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:42:30', '2024-01-17 09:42:30'),
('d0edcd96-aa49-4ac3-b8dc-4d462cfc149d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 31, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:24:29', '2024-01-17 09:24:29'),
('d19ad876-718b-4f73-8fb6-e207218074c4', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been added as internal for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:31:28', '2024-01-15 08:31:28');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('d1bddcaf-a68b-458a-85ae-6a9f9f2f17f2', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:24:43', '2024-01-17 09:24:43'),
('d1d5bb9e-4f86-47e0-aac1-73d471c6cc9b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as a Coordinator for the IT ACCREDITATION 2024\",\"title\":\"Member Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-13 06:22:18', '2023-12-10 22:00:21', '2023-12-13 06:22:18'),
('d30ac76f-af47-4c1b-a93a-0f3fdc3eba96', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 9, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:16:29', '2024-01-17 09:16:29'),
('d3f0bdf1-a7e8-4b1e-a0d9-79b657e30808', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-13 23:58:58', '2024-01-07 08:38:56', '2024-01-13 23:58:58'),
('d483ea0d-514d-4733-a7f7-c86a20cd367f', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the ASDAD\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/17\"}', '2024-01-13 23:58:58', '2024-01-07 14:18:34', '2024-01-13 23:58:58'),
('d6969c22-48a3-4870-9f1b-e6c5fe2b144e', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 5, '{\"content\":\"Account has been enabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\"}', '2023-12-14 14:29:52', '2023-12-14 14:29:48', '2023-12-14 14:29:52'),
('d6a66833-99c8-48f3-8265-bff101453cd4', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-16 05:30:44', '2024-01-16 05:30:44'),
('d6e3f970-04aa-4d30-b48a-387660d8e4cb', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 08:28:34', '2024-01-15 08:28:34'),
('d763cd0e-d47c-450c-a744-c9ccd71f8903', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 11, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2023-12-13 23:35:19', '2023-12-13 23:35:19'),
('d83eee79-1f92-4a5a-9bf4-d81ca550adb8', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:17:57', '2024-01-17 09:17:57'),
('d9eaa569-bc7e-49a1-b40e-1ebdcb0f1953', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-15 22:21:54', '2024-01-15 22:21:54'),
('dbd7c79a-688c-49ae-b793-449731772eb0', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-15 08:28:10', '2024-01-15 08:28:10'),
('dca0ceb6-0f4f-4bdb-b0e2-dd1b92f91d03', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 24, '{\"content\":\"You have been added as external for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 10:02:26', '2024-01-17 10:02:26'),
('e035e075-3331-46bc-91ee-15f313883744', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 7, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', NULL, '2023-12-13 23:34:57', '2023-12-13 23:34:57'),
('e1585f8a-76b2-4a4e-b52e-17636fce2763', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:27:56', '2024-01-17 09:27:56'),
('e1782a44-b2ba-4205-8214-51b31a8e0c55', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', NULL, '2024-01-15 07:34:41', '2024-01-15 07:34:41'),
('e4f3aec9-c9d0-4751-8c2d-24c675bcd2ce', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been remove as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', '2024-01-07 14:11:19', '2024-01-07 04:39:28', '2024-01-07 14:11:19'),
('e5753568-b243-4d10-bc81-e9451f006665', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Internal Accreditor for the Asingan IT Accreditation 2024\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 03:16:04', '2024-01-17 03:16:04'),
('eb141c5d-4711-432c-a861-042de927abcc', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:35:39', '2024-01-17 09:35:39'),
('eb80d93a-6a2e-401b-9f42-50055a5efb35', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the sdffghgjkl;\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/7\"}', '2023-12-21 06:27:27', '2023-12-21 06:25:25', '2023-12-21 06:27:27'),
('ee372c0c-0577-4f6e-8465-14dabe23b893', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 10, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-15 08:31:36', '2024-01-15 08:31:36'),
('ee5523d9-7bf3-4fae-af54-5ffe4d92335b', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 14, '{\"content\":\"You have been remove as Internal Accreditor for the ASDAD\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-07 04:41:37', '2024-01-07 04:41:37'),
('f0dcd9b8-01e4-43ce-820c-16c89dfd81d1', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 13, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/27\"}', NULL, '2024-01-17 09:18:55', '2024-01-17 09:18:55'),
('f30484b8-5209-4068-8d7b-ccd43f6592f3', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been remove as Coordinator for the IT ACCREDITATION 2023\",\"title\":\"Member Removed!\",\"url\":\"\"}', '2024-01-15 09:47:56', '2024-01-15 03:52:50', '2024-01-15 09:47:56'),
('f4a3a40f-b8c6-4c26-8078-a9bc5d904497', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 05:29:29', '2024-01-07 14:11:18'),
('f4e4dbe7-2749-4a33-ab14-b84ca82a513d', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as chair for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/20\"}', '2024-01-15 09:47:56', '2024-01-15 08:30:12', '2024-01-15 09:47:56'),
('f60a7423-eb11-4551-9f7f-a3ecfa74ffb9', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 21, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-15 08:00:06', '2024-01-15 08:00:06'),
('f80bec17-7dd8-44a4-a5b8-98479aaf8714', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 6, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:33:18', '2024-01-17 09:33:18'),
('f8d747ae-d72e-4c5b-ae06-1dae86a0afc9', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 8, '{\"content\":\"You have been remove as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Removed!\",\"url\":\"\"}', NULL, '2024-01-17 09:19:11', '2024-01-17 09:19:11'),
('fa7ebeb7-bad8-4575-a333-daa9f612e188', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 2, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-14 00:30:32', '2023-12-13 23:44:48', '2023-12-14 00:30:32'),
('fdcfa97a-a7b7-483d-b05c-b0a203cf8ecb', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 5, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2024\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/5\"}', '2023-12-13 23:26:44', '2023-12-13 23:26:34', '2023-12-13 23:26:44'),
('fef41c67-b154-48ac-8eac-08eff2e0b6a6', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 3, '{\"content\":\"You have been added as Internal Accreditor for the IT ACCREDITATION 2023\",\"title\":\"You Have been Added!\",\"url\":\"\\/manage_member\\/16\"}', '2024-01-07 14:11:18', '2024-01-07 08:44:03', '2024-01-07 14:11:18'),
('ff4f4d30-9612-4d91-aa44-83b0cc61da90', 'App\\Notifications\\AccreditationNotification', 'App\\Models\\User', 5, '{\"content\":\"Account has been disabled for the IT ACCREDITATION 2024\",\"title\":\"Account Notice!\",\"url\":\"\\/manage_accreditation\"}', NULL, '2023-12-14 14:32:23', '2023-12-14 14:32:23');

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
(65, 59, 'A', 'Student Services Program (SSP)', 'none', '2024-01-12 02:54:27', '2024-01-12 02:54:27'),
(66, 59, 'B', 'Student Welfare', 'none', '2024-01-12 02:54:38', '2024-01-12 02:54:38'),
(67, 59, 'C', 'Student Development', 'none', '2024-01-12 02:54:50', '2024-01-12 02:54:50'),
(68, 59, 'D', 'Institutional Student Programs and Services', 'none', '2024-01-12 02:55:01', '2024-01-12 02:55:01'),
(69, 59, 'E', 'Research, Monitoring and Evaluation', 'none', '2024-01-12 02:55:15', '2024-01-12 02:55:15'),
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
(89, 62, 'H', 'Food Services Unit/Canteen', 'Clean and sanitary food services unit/canteen must be set up and managed effectively. It should serve balanced yet affordable meals and snacks to the school community.', '2024-01-12 20:10:02', '2024-01-12 20:10:02'),
(90, 62, 'I', 'Accreditation Center', 'There should be a properly maintained and equipped Accreditation Center with necessary facilities.', '2024-01-12 20:10:20', '2024-01-12 20:10:20'),
(91, 62, 'J', 'Housing (Optional)', 'Housing should be maintained and provided with electricity and water. should have proper drainage and waste disposal system.', '2024-01-12 20:10:34', '2024-01-12 20:10:34'),
(92, 66, 'A', 'asd', 'asd', '2024-01-16 04:59:45', '2024-01-16 04:59:45');

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
(5, 3, 54, 20, '2.44', '2024-01-13 19:48:59', '2024-01-14 00:23:11'),
(6, 3, 51, 20, '3.27', '2024-01-13 19:50:09', '2024-01-13 20:23:42'),
(7, 3, 49, 20, '3.88', '2024-01-13 20:49:50', '2024-01-16 05:23:06'),
(8, 3, 50, 20, '4.04', '2024-01-13 20:50:11', '2024-01-13 20:50:11'),
(9, 3, 49, 21, '3.51', '2024-01-13 23:40:27', '2024-01-14 00:16:01'),
(10, 3, 50, 21, '5.00', '2024-01-13 23:40:56', '2024-01-13 23:40:56'),
(11, 3, 58, 20, '0.00', '2024-01-14 00:17:00', '2024-01-14 00:17:00'),
(12, 3, 59, 20, '3.40', '2024-01-15 09:54:02', '2024-01-15 09:54:02');

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
(19, 'Bachelor of Science in Biology', '2023-09-18 04:01:47', '2023-09-18 04:01:47'),
(21, 'Bachelor of Science in Agriculture', '2024-01-17 07:00:14', '2024-01-17 07:01:32'),
(22, 'Bachelor of Science in Accountancy', '2024-01-17 07:06:22', '2024-01-17 07:06:22'),
(23, 'Bachelor of Science in Aircraft Maintenance Technology', '2024-01-17 07:07:17', '2024-01-17 07:07:17'),
(24, 'Bachelor of Science in Aeronautical Engineering', '2024-01-17 07:07:27', '2024-01-17 07:07:27');

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
(1, 2, '2024-01-10 02:20:24', '2024-01-10 10:20:24');

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
(1, 1, 2, 2, '2023-09-18', '2023-09-30', '4.44', '2023-09-18 03:57:14', '2024-01-12 07:33:41'),
(2, 1, 3, 3, '2023-09-18', '2023-09-25', '0.00', '2023-09-18 03:57:26', '2023-09-18 03:57:26'),
(3, 1, 9, 2, '2023-09-18', '2023-09-25', '0.00', '2023-09-18 03:57:38', '2023-09-18 03:57:38'),
(4, 4, 8, 2, '2023-09-18', '2023-09-23', '0.00', '2023-09-18 03:57:51', '2023-09-18 03:57:51'),
(5, 3, 2, 1, '2023-09-25', '2023-10-02', '0.00', '2023-09-18 03:58:01', '2024-01-12 07:52:16'),
(6, 3, 14, 2, '2023-09-18', '2023-09-25', '0.00', '2023-09-18 03:58:33', '2023-09-18 03:58:33'),
(7, 6, 16, 3, '2023-09-18', '2023-09-25', '0.00', '2023-09-18 04:00:13', '2023-11-29 00:41:51'),
(8, 6, 15, 3, '2023-09-18', '2023-09-25', '0.00', '2023-09-18 04:00:27', '2023-09-18 04:00:27'),
(9, 5, 19, 2, '2023-09-18', '2023-09-25', '0.00', '2023-09-18 04:02:00', '2023-09-18 04:02:00'),
(10, 5, 17, 2, '2023-09-18', '2023-09-25', '0.00', '2023-09-18 04:02:20', '2023-09-18 04:02:20'),
(11, 3, 18, 1, '2023-12-03', '2023-12-10', '0.00', '2023-11-29 02:23:22', '2023-11-29 02:23:22'),
(12, 2, 10, 0, '2024-01-22', '2024-02-08', '0.00', '2024-01-15 09:35:27', '2024-01-15 09:35:27');

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
(218, 64, 221, 'I.8.3', 'feedback from employers regarding performance of graduates.', 0, '2024-01-11 21:20:50', '2024-01-11 21:20:50');

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
(15, 59, 117, 'I.7.1.6', 'others (please specify)', 0, '2024-01-11 10:38:27', '2024-01-11 10:38:27');

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

-- --------------------------------------------------------

--
-- Table structure for table `sub_indicator_messages`
--

CREATE TABLE `sub_indicator_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
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
(1, 'Admin', 'admin', NULL, 1, 1, 'admin@gmail.com', NULL, '$2y$10$sYdGtY2c1zLGM4CNCAjcP.oZ7MvwT7RwKvRGXxtfN./86cgfnfNki', 'admin', 0, 0, 'none', '', '2023-09-18 03:29:01', '2023-12-10 21:06:16'),
(2, 'Aaron', 'Espiritu', NULL, 1, 2, 'aaron.espiritulopez07@gmail.com', NULL, '$2y$10$G5n2qfgUMclO/Ug94J3nBeuXYBOVir62rkbPMxggFqQrI2XIyEaBK', 'user', 0, 0, 'area member', NULL, '2023-09-18 03:30:51', '2024-01-16 05:40:28'),
(3, 'Errol', 'Lopez', NULL, 1, 7, 'errol@gmail.com', NULL, '$2y$10$bFekmR4XZHSvuq.iWzf9SOd79dP4a3dWaesH2Othl/SPsr7ry6Axq', 'user', 1, 0, 'area member', 'nb7eodKRfqPix4OoXuJQIYcShGfySux4yZVohu4yRTzuNecOFdueCDSWxeRt', '2023-09-18 03:33:57', '2024-01-17 08:41:49'),
(4, 'Fredirick', 'Patacsil', NULL, 1, 1, 'patacsil@gmail.com', NULL, '$2y$10$A9C39u0E3m0/Emyn1IbyW.DqR4lIxTPaWgXAmQdP2TRPe9fOL1v.S', 'user', 0, 1, 'area member', NULL, '2023-09-18 03:34:24', '2024-01-07 02:49:17'),
(6, 'Amos Ezra', 'Aduan', NULL, 3, 2, 'amos@gmail.com', NULL, '$2y$10$.VP5o7QZkfIk0FJ4PJVMCu2EsBAuMds8SayrFkj26H4ytZxIX0U16', 'user', 0, 0, 'none', NULL, '2023-09-18 03:46:15', '2023-09-18 03:46:15'),
(7, 'John Azriel', 'Perez', NULL, 1, 2, 'azriel@gmail.com', NULL, '$2y$10$VhantScrbmCANaEyTf1qt.96b/GTzl5SseJoIDH2IXWj.qk0/bPsa', 'user', 1, 1, 'none', NULL, '2023-09-18 03:49:03', '2024-01-07 02:36:46'),
(8, 'Aries', 'Reyes', NULL, 1, 7, 'aries@gmail.com', NULL, '$2y$10$XvWHMCOqcqnCtY//mLB1huCRG5Azuv5Z6zxIO.XiGy9O2zziBXTa.', 'user', 0, 0, 'none', NULL, '2023-09-18 03:50:24', '2023-09-18 03:50:24'),
(9, 'Arni', 'Tamayo', NULL, 1, 2, 'arni@gmail.com', NULL, '$2y$10$WdRQMYTpMzfriWZ.us.WTOAGiCA5da4pyh2XJt6Bq8POsCzr4HNLi', 'user', 0, 0, 'area member', NULL, '2023-09-18 03:51:00', '2023-12-14 07:57:00'),
(10, 'Cherry Mae', 'Centino', NULL, 5, 19, 'cherry@gmail.com', NULL, '$2y$10$oRt75/dEYKJReFQK0ysGXeEbVm.RlOnwroxnkeL8du./MMmC9MxYu', 'user', 1, 0, 'none', NULL, '2023-09-18 06:46:24', '2024-01-07 02:49:12'),
(11, 'Raygeena Franchesca Ashley', 'Fernandez', NULL, 1, 2, 'fernandez.ashley@yahoo.com', NULL, '$2y$10$pNdpL3Np2fCkmdo34EpXQuzoqqYIagbAqDTkdOsZyrGopkT1XRmAm', 'user', 0, 0, 'none', NULL, '2023-09-19 04:48:48', '2023-09-19 04:48:48'),
(12, 'Bonifacio', 'Salazar Jr', NULL, 1, 2, 'salazar@gmail.com', NULL, '$2y$10$F8jRtJjIHZnwWP98rsjcZuy5L5Jd92/fjUgqLv0ohjejVZg4oIzBO', 'user', 1, 0, 'none', NULL, '2023-09-19 04:49:17', '2024-01-07 02:36:56'),
(13, 'Michael', 'Acosta', NULL, 1, 2, 'micheal@gmail.com', NULL, '$2y$10$HPvpISZX0qaY3nc2B5sE.ujXL0rAj3e7q2VPi4V9faDP5BF.13Mce', 'user', 1, 0, 'area member', NULL, '2023-09-19 04:49:52', '2024-01-16 18:33:47'),
(14, 'Juan', 'Dela Cruz', NULL, 5, 17, 'juan@gmail.com', NULL, '$2y$10$WsoCzNMqxNjzu5b3euCiEOhWx7pBhKbVDhqSUv2mL1GO56DTqJY.G', 'user', 1, 0, 'none', NULL, '2023-09-21 06:13:46', '2024-01-16 18:33:54'),
(16, 'Dick', 'Lomibao', NULL, 4, 18, 'sorianokid771@gmail.com', NULL, '$2y$10$TNQqDbY1FiW6dCux.8JOC.HLPekd.cfy0Qi3tGvKP4q1UphI/QIqa', 'user', 0, 0, 'none', NULL, '2024-01-13 22:48:05', '2024-01-13 22:48:05'),
(21, 'Irene', 'Perez', NULL, 3, 13, 'ireneperez@gmail.com', NULL, '$2y$10$a72UAF5C4q4Ek8gviUjX.eWksfH6z5VzqOZvLdXalEt2zPoie0QeO', 'user', 1, 0, 'none', NULL, '2024-01-15 04:46:31', '2024-01-15 04:49:16'),
(24, 'Boy', 'Tattoo', 5, 12, 8, 'boytattoo16@gmail.com', NULL, '$2y$10$tyWw0YRXvnzfMpWdA250d.TkTJjbHwHeSVwARP2wLd6zJWFtSl9k2', 'user', 0, 1, 'none', NULL, '2024-01-17 06:20:00', '2024-01-17 06:20:00'),
(25, 'Raditha Mae', 'Galamgam', 8, 17, 8, 'raditha@gmail.com', NULL, '$2y$10$nPo8dwgAJ.VjxhlWvqZVLurGuYHSaxbwlzbiduK5GauK2BnX5GDE.', 'user', 0, 1, 'none', NULL, '2024-01-17 06:55:48', '2024-01-17 06:55:48'),
(26, 'Mel Nia Hope', 'Artermio', 9, 19, 21, 'hope@gmail.com', NULL, '$2y$10$7YVn8WawsKUHP5zE/s2Y5.btD.dkNF7eJ1L9cMIZMBcBl0hB/yh3u', 'user', 0, 1, 'none', NULL, '2024-01-17 07:02:13', '2024-01-17 07:02:13'),
(27, 'Nyah Xien', 'Santong', 9, 19, 13, 'nyah@gmail.com', NULL, '$2y$10$257Kin/xOWC/9EDESrfK3.qd7MdAcHymt6ljMwBqVn/DJTRgBkFlK', 'user', 0, 1, 'none', NULL, '2024-01-17 07:03:11', '2024-01-17 07:03:11'),
(28, 'Mark Chlouie', 'Pasion', 6, 18, 7, 'markchlouie@gmail.com', NULL, '$2y$10$Yh0tPlBRPDDUmPksozsf9uTBbjyfKZyr31NbIqiLpho1zAJgxE/se', 'user', 0, 1, 'none', NULL, '2024-01-17 07:04:28', '2024-01-17 07:04:28'),
(29, 'Kathlyn Caye', 'Marzan', 6, 18, 14, 'caye@gmail.com', NULL, '$2y$10$COrJbnr711IJU49eDntQMeul.7dfvUhEZNK3UXlmxayz353R0FFVe', 'user', 0, 1, 'none', NULL, '2024-01-17 07:05:10', '2024-01-17 07:05:10'),
(30, 'Ruthie Caryl', 'De Leon', 6, 18, 22, 'ruthie@gmail.com', NULL, '$2y$10$34WoHuq3PfveAWG1cLNSjuFZ3CjSvjl76lxEcqQmCsr38O7ODkHZq', 'user', 0, 1, 'none', NULL, '2024-01-17 07:09:03', '2024-01-17 07:09:03'),
(31, 'Cyril', 'Asuncion', NULL, 6, 8, 'cyrill@gmail.com', NULL, '$2y$10$S77D5oE2Be7LeVGjb3eYieBkHqSDf1A9r8Gq.uye5wCBIddBnaMhK', 'user', 1, 0, 'none', NULL, '2024-01-17 07:09:53', '2024-01-17 07:09:53'),
(32, 'Gabriel Sam', 'Amarillo', 7, 20, 8, 'gabriel@gmail.com', NULL, '$2y$10$lBoJ.Zk.9k8PhKqLd5IWuu5Xlk6y6EjUbXxOuXoys63wu5wkbiT26', 'user', 0, 1, 'none', NULL, '2024-01-17 07:11:24', '2024-01-17 07:11:24');

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
  ADD KEY `indicator_messages_indicator_file_id_foreign` (`indicator_file_id`);

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
  ADD KEY `sub_component_messages_sub_component_file_id_foreign` (`sub_component_file_id`);

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
  ADD KEY `sub_indicator_messages_sub_indicator_file_id_foreign` (`sub_indicator_file_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `accreditation_areas`
--
ALTER TABLE `accreditation_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `area_members`
--
ALTER TABLE `area_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `area_programs`
--
ALTER TABLE `area_programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `area_ratings`
--
ALTER TABLE `area_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `campuses`
--
ALTER TABLE `campuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `compliance_report_files`
--
ALTER TABLE `compliance_report_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT for table `indicator_categories`
--
ALTER TABLE `indicator_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `indicator_files`
--
ALTER TABLE `indicator_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `indicator_messages`
--
ALTER TABLE `indicator_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `internal_ratings`
--
ALTER TABLE `internal_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=350;

--
-- AUTO_INCREMENT for table `internal_sub_component_ratings`
--
ALTER TABLE `internal_sub_component_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `internal_sub_ratings`
--
ALTER TABLE `internal_sub_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=313;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `parameters`
--
ALTER TABLE `parameters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `parameter_ratings`
--
ALTER TABLE `parameter_ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sub_component_messages`
--
ALTER TABLE `sub_component_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_indicators`
--
ALTER TABLE `sub_indicators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- AUTO_INCREMENT for table `sub_indicator_components`
--
ALTER TABLE `sub_indicator_components`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sub_indicator_files`
--
ALTER TABLE `sub_indicator_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
