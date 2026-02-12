-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2026 at 03:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_nextjs_laravel_12_db_01`
--

-- --------------------------------------------------------

--
-- Table structure for table `bangladeshi_areas`
--

CREATE TABLE `bangladeshi_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `thana_name` varchar(100) DEFAULT NULL,
  `code` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `delivery_charge_base` decimal(8,2) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bangladeshi_areas`
--

INSERT INTO `bangladeshi_areas` (`id`, `district_id`, `name`, `thana_name`, `code`, `description`, `delivery_charge_base`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sadar', 'Sadar', 'DHAKA-SAD', NULL, NULL, 1, '2026-01-28 23:56:23', '2026-01-28 23:56:23'),
(2, 2, 'Sadar', 'Sadar', 'GAZIPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:23', '2026-01-28 23:56:23'),
(3, 3, 'Sadar', 'Sadar', 'NARAYANG36-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(4, 4, 'Sadar', 'Sadar', 'NARSINGDI-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(5, 5, 'Sadar', 'Sadar', 'MUNSHIGANJ-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(6, 6, 'Sadar', 'Sadar', 'MANIKGANJ-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(7, 7, 'Sadar', 'Sadar', 'TANGAIL-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(8, 8, 'Sadar', 'Sadar', 'KISHOREGAA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(9, 9, 'Sadar', 'Sadar', 'FARIDPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(10, 10, 'Sadar', 'Sadar', 'GOPALGANJ-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(11, 11, 'Sadar', 'Sadar', 'MADARIPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(12, 12, 'Sadar', 'Sadar', 'RAJBARI-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(13, 13, 'Sadar', 'Sadar', 'SHARIATPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(14, 14, 'Sadar', 'Sadar', 'CHATTOGRAM-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(15, 15, 'Sadar', 'Sadar', 'COXSBAZAR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(16, 16, 'Sadar', 'Sadar', 'CUMILLA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(17, 17, 'Sadar', 'Sadar', 'BRAHMANB35-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(18, 18, 'Sadar', 'Sadar', 'CHANDPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(19, 19, 'Sadar', 'Sadar', 'FENI-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(20, 20, 'Sadar', 'Sadar', 'LAKSHMIPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(21, 21, 'Sadar', 'Sadar', 'NOAKHALI-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(22, 22, 'Sadar', 'Sadar', 'KHAGRACHAC-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(23, 23, 'Sadar', 'Sadar', 'RANGAMATI-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(24, 24, 'Sadar', 'Sadar', 'BANDARBAN-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(25, 25, 'Sadar', 'Sadar', 'RAJSHAHI-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(26, 26, 'Sadar', 'Sadar', 'BOGURA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(27, 27, 'Sadar', 'Sadar', 'PABNA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(28, 28, 'Sadar', 'Sadar', 'SIRAJGANJ-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(29, 29, 'Sadar', 'Sadar', 'NAOGAON-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(30, 30, 'Sadar', 'Sadar', 'NATORE-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(31, 31, 'Sadar', 'Sadar', 'CHAPAINAC0-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(32, 32, 'Sadar', 'Sadar', 'JOYPURHAT-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(33, 33, 'Sadar', 'Sadar', 'KHULNA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(34, 34, 'Sadar', 'Sadar', 'JASHORE-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(35, 35, 'Sadar', 'Sadar', 'SATKHIRA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(36, 36, 'Sadar', 'Sadar', 'BAGERHAT-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(37, 37, 'Sadar', 'Sadar', 'NARAIL-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(38, 38, 'Sadar', 'Sadar', 'JHENAIDAH-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(39, 39, 'Sadar', 'Sadar', 'KUSHTIA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(40, 40, 'Sadar', 'Sadar', 'MAGURA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(41, 41, 'Sadar', 'Sadar', 'CHUADANGA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(42, 42, 'Sadar', 'Sadar', 'MEHERPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(43, 43, 'Sadar', 'Sadar', 'BARISHAL-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(44, 44, 'Sadar', 'Sadar', 'BHOLA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(45, 45, 'Sadar', 'Sadar', 'PATUAKHALI-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(46, 46, 'Sadar', 'Sadar', 'PIROJPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(47, 47, 'Sadar', 'Sadar', 'BARGUNA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(48, 48, 'Sadar', 'Sadar', 'JHALOKATI-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(49, 49, 'Sadar', 'Sadar', 'SYLHET-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(50, 50, 'Sadar', 'Sadar', 'MOULVIBA30-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(51, 51, 'Sadar', 'Sadar', 'HABIGANJ-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(52, 52, 'Sadar', 'Sadar', 'SUNAMGANJ-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(53, 53, 'Sadar', 'Sadar', 'RANGPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(54, 54, 'Sadar', 'Sadar', 'DINAJPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(55, 55, 'Sadar', 'Sadar', 'KURIGRAM-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(56, 56, 'Sadar', 'Sadar', 'LALMONIRF1-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(57, 57, 'Sadar', 'Sadar', 'NILPHAMARI-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(58, 58, 'Sadar', 'Sadar', 'PANCHAGARH-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(59, 59, 'Sadar', 'Sadar', 'THAKURGAON-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(60, 60, 'Sadar', 'Sadar', 'GAIBANDHA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(61, 61, 'Sadar', 'Sadar', 'MYMENSINGH-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(62, 62, 'Sadar', 'Sadar', 'JAMALPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(63, 63, 'Sadar', 'Sadar', 'SHERPUR-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(64, 64, 'Sadar', 'Sadar', 'NETROKONA-SAD', NULL, NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(65, 1, 'Uttara', 'Uttara', 'DHAKA-UTT-1230', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(66, 1, 'Mirpur', 'Mirpur', 'DHAKA-MIR-1216', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(67, 1, 'Mohammadpur', 'Mohammadpur', 'DHAKA-MOH-1207', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(68, 1, 'Dhanmondi', 'Dhanmondi', 'DHAKA-DHA-1209', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(69, 1, 'Gulshan', 'Gulshan', 'DHAKA-GUL-1212', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(70, 1, 'Banani', 'Banani', 'DHAKA-BAN-1213', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(71, 1, 'Motijheel', 'Motijheel', 'DHAKA-MOT-1000', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(72, 1, 'Shahbag', 'Shahbag', 'DHAKA-SHA-1000', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(73, 1, 'Tejgaon', 'Tejgaon', 'DHAKA-TEJ-1215', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(74, 1, 'Badda', 'Badda', 'DHAKA-BAD-1212', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(75, 1, 'Rampura', 'Rampura', 'DHAKA-RAM-1219', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(76, 1, 'Banasree', 'Banasree', 'DHAKA-BAN-1219', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(77, 1, 'Bashundhara', 'Bashundhara', 'DHAKA-BAS-1229', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(78, 1, 'Baridhara', 'Baridhara', 'DHAKA-BAR-1212', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(79, 1, 'Khilkhet', 'Khilkhet', 'DHAKA-KHI-1229', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(80, 1, 'Mohakhali', 'Mohakhali', 'DHAKA-MOH-1212', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(81, 1, 'Pallabi', 'Pallabi', 'DHAKA-PAL-1216', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(82, 1, 'Kafrul', 'Kafrul', 'DHAKA-KAF-1206', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(83, 1, 'Cantonment', 'Cantonment', 'DHAKA-CAN-1206', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24'),
(84, 1, 'Old Dhaka', 'Old Dhaka', 'DHAKA-OLD-1100', NULL, 60.00, 1, '2026-01-29 06:25:24', '2026-01-29 06:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `bangladeshi_districts`
--

CREATE TABLE `bangladeshi_districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `division_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bangladeshi_districts`
--

INSERT INTO `bangladeshi_districts` (`id`, `division_id`, `name`, `code`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dhaka', 'DHAKA', NULL, 1, '2026-01-28 23:56:23', '2026-01-28 23:56:23'),
(2, 1, 'Gazipur', 'GAZIPUR', NULL, 1, '2026-01-28 23:56:23', '2026-01-28 23:56:23'),
(3, 1, 'Narayanganj', 'NARAYANG36', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(4, 1, 'Narsingdi', 'NARSINGDI', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(5, 1, 'Munshiganj', 'MUNSHIGANJ', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(6, 1, 'Manikganj', 'MANIKGANJ', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(7, 1, 'Tangail', 'TANGAIL', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(8, 1, 'Kishoreganj', 'KISHOREGAA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(9, 1, 'Faridpur', 'FARIDPUR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(10, 1, 'Gopalganj', 'GOPALGANJ', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(11, 1, 'Madaripur', 'MADARIPUR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(12, 1, 'Rajbari', 'RAJBARI', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(13, 1, 'Shariatpur', 'SHARIATPUR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(14, 2, 'Chattogram', 'CHATTOGRAM', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(15, 2, 'Cox\'s Bazar', 'COXSBAZAR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(16, 2, 'Cumilla', 'CUMILLA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(17, 2, 'Brahmanbaria', 'BRAHMANB35', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(18, 2, 'Chandpur', 'CHANDPUR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(19, 2, 'Feni', 'FENI', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(20, 2, 'Lakshmipur', 'LAKSHMIPUR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(21, 2, 'Noakhali', 'NOAKHALI', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(22, 2, 'Khagrachhari', 'KHAGRACHAC', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(23, 2, 'Rangamati', 'RANGAMATI', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(24, 2, 'Bandarban', 'BANDARBAN', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(25, 3, 'Rajshahi', 'RAJSHAHI', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(26, 3, 'Bogura', 'BOGURA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(27, 3, 'Pabna', 'PABNA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(28, 3, 'Sirajganj', 'SIRAJGANJ', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(29, 3, 'Naogaon', 'NAOGAON', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(30, 3, 'Natore', 'NATORE', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(31, 3, 'Chapainawabganj', 'CHAPAINAC0', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(32, 3, 'Joypurhat', 'JOYPURHAT', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(33, 4, 'Khulna', 'KHULNA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(34, 4, 'Jashore', 'JASHORE', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(35, 4, 'Satkhira', 'SATKHIRA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(36, 4, 'Bagerhat', 'BAGERHAT', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(37, 4, 'Narail', 'NARAIL', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(38, 4, 'Jhenaidah', 'JHENAIDAH', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(39, 4, 'Kushtia', 'KUSHTIA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(40, 4, 'Magura', 'MAGURA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(41, 4, 'Chuadanga', 'CHUADANGA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(42, 4, 'Meherpur', 'MEHERPUR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(43, 5, 'Barishal', 'BARISHAL', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(44, 5, 'Bhola', 'BHOLA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(45, 5, 'Patuakhali', 'PATUAKHALI', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(46, 5, 'Pirojpur', 'PIROJPUR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(47, 5, 'Barguna', 'BARGUNA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(48, 5, 'Jhalokati', 'JHALOKATI', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(49, 6, 'Sylhet', 'SYLHET', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(50, 6, 'Moulvibazar', 'MOULVIBA30', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(51, 6, 'Habiganj', 'HABIGANJ', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(52, 6, 'Sunamganj', 'SUNAMGANJ', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(53, 7, 'Rangpur', 'RANGPUR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(54, 7, 'Dinajpur', 'DINAJPUR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(55, 7, 'Kurigram', 'KURIGRAM', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(56, 7, 'Lalmonirhat', 'LALMONIRF1', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(57, 7, 'Nilphamari', 'NILPHAMARI', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(58, 7, 'Panchagarh', 'PANCHAGARH', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(59, 7, 'Thakurgaon', 'THAKURGAON', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(60, 7, 'Gaibandha', 'GAIBANDHA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(61, 8, 'Mymensingh', 'MYMENSINGH', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(62, 8, 'Jamalpur', 'JAMALPUR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(63, 8, 'Sherpur', 'SHERPUR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(64, 8, 'Netrokona', 'NETROKONA', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `bangladeshi_divisions`
--

CREATE TABLE `bangladeshi_divisions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bangladeshi_divisions`
--

INSERT INTO `bangladeshi_divisions` (`id`, `name`, `code`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Dhaka', 'DHA', NULL, 1, '2026-01-28 23:56:23', '2026-01-28 23:56:23'),
(2, 'Chattogram', 'CHT', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(3, 'Rajshahi', 'RAJ', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(4, 'Khulna', 'KHU', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(5, 'Barishal', 'BAR', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(6, 'Sylhet', 'SYL', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(7, 'Rangpur', 'RAN', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47'),
(8, 'Mymensingh', 'MYM', NULL, 1, '2026-01-28 23:56:47', '2026-01-28 23:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'NikeUpdate', 1, '2026-01-28 06:19:30', '2026-01-28 22:26:12'),
(2, 'Adidas', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(3, 'Apple', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(4, 'Samsung', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(5, 'Sony', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(6, 'LG', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(7, 'Dell', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(8, 'HP', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(9, 'Zara', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(10, 'H&M', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(11, 'Puma', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(12, 'Canon', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(13, 'Nikon', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(14, 'Bose', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(15, 'JBL', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-7f3072bf378b98d6bbf2f013cff3e287', 'i:5;', 1770283620),
('laravel-cache-7f3072bf378b98d6bbf2f013cff3e287:timer', 'i:1770283620;', 1770283620),
('laravel-cache-a75f3f172bfb296f2e10cbfc6dfc1883', 'i:21;', 1770301339),
('laravel-cache-a75f3f172bfb296f2e10cbfc6dfc1883:timer', 'i:1770301339;', 1770301339),
('laravel-cache-ad4954e2e38bb42a3ba5cbc5eebbbdbc', 'i:1;', 1770279256),
('laravel-cache-ad4954e2e38bb42a3ba5cbc5eebbbdbc:timer', 'i:1770279256;', 1770279256),
('laravel-cache-de226f3f5dc0c66a464effdc07ca6b1f', 'i:2;', 1770299552),
('laravel-cache-de226f3f5dc0c66a464effdc07ca6b1f:timer', 'i:1770299552;', 1770299552),
('laravel-cache-f1f70ec40aaa556905d4a030501c0ba4', 'i:16;', 1770295418),
('laravel-cache-f1f70ec40aaa556905d4a030501c0ba4:timer', 'i:1770295418;', 1770295418);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Electronics', 1, 'Latest electronic gadgets and devices', '2026-01-28 06:19:30', '2026-01-28 22:26:40'),
(2, 'Clothing & Fashion', 1, 'Trendy clothes and fashion accessories', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(3, 'Sports & Outdoors', 1, 'Sports equipment and outdoor gear', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(4, 'Home & Kitchen', 1, 'Home appliances and kitchen essentials', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(5, 'Books & Media', 1, 'Books, movies, music, and games', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(6, 'Beauty & Health', 1, 'Beauty products and health supplements', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(7, 'Toys & Games', 1, 'Fun toys and board games for all ages', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(8, 'Automotive', 1, 'Car accessories and automotive parts', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(9, 'Jewelry & Watches', 1, 'Elegant jewelry and premium watches', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(10, 'Furniture', 1, 'Modern furniture for home and office', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(11, 'Computers & Laptops', 1, 'High-performance computers and laptops', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(12, 'Mobile Phones', 1, 'Latest smartphones and accessories', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(13, 'Cameras & Photography', 1, 'Professional cameras and photo equipment', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(14, 'Audio & Headphones', 1, 'Premium audio equipment and headphones', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(15, 'Gaming', 1, 'Gaming consoles, games, and accessories', '2026-01-28 06:19:30', '2026-01-28 06:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_purchase_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `max_discount_amount` decimal(10,2) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `usage_limit` int(11) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `description`, `discount_type`, `discount_value`, `min_purchase_amount`, `max_discount_amount`, `valid_from`, `valid_to`, `usage_limit`, `status`, `created_at`, `updated_at`) VALUES
(1, 'WELCOME10', 'Get 10% off on your first purchase.', 'percentage', 10.00, 500.00, 200.00, '2026-01-23', '2026-02-27', 100, 'active', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(2, 'FLAT50', 'Flat 50 BDT off on any order.', 'fixed', 50.00, 0.00, NULL, '2026-01-28', '2026-03-14', 0, 'active', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(3, 'SUMMER25', '25% discount for summer sale.', 'percentage', 25.00, 1000.00, 400.00, '2026-01-18', '2026-02-17', 50, 'active', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(4, 'FREESHIP', 'Free shipping on orders over 1500 BDT.', 'fixed', 100.00, 1500.00, 100.00, '2026-01-28', '2026-03-29', 0, 'active', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(5, 'NEWYEAR2025', 'Celebrate New Year with 20% off.', 'percentage', 20.00, 800.00, 300.00, '2025-01-01', '2025-01-31', 200, 'inactive', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(6, 'BUYMORE5', '5% off on purchases above 2000 BDT.', 'percentage', 5.00, 2000.00, 150.00, '2026-01-28', '2026-03-09', 500, 'active', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(7, 'FLASHSALE', '50 BDT off during flash sale hours.', 'fixed', 50.00, 300.00, NULL, '2026-01-28', '2026-02-04', 100, 'active', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(8, 'STUDENT15', 'Exclusive 15% off for students.', 'percentage', 15.00, 700.00, 250.00, '2026-01-26', '2026-02-22', 300, 'active', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(9, 'BIRTHDAY100', 'Get 100 BDT off on your birthday!', 'fixed', 100.00, 500.00, 100.00, '2026-01-28', '2027-01-28', 1, 'active', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(10, 'APPONLY10', '10% off for mobile app users only.', 'percentage', 10.00, 1000.00, 300.00, '2026-01-27', '2026-04-28', 1000, 'active', '2026-01-28 06:19:30', '2026-01-28 06:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `coupon_usages`
--

CREATE TABLE `coupon_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupon_usages`
--

INSERT INTO `coupon_usages` (`id`, `coupon_id`, `user_id`, `order_id`, `used_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 2, 3, '2026-01-08 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(2, 4, 5, 5, '2026-01-26 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(3, 2, 2, 3, '2026-01-25 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(4, 5, 4, 2, '2026-01-17 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(5, 2, 5, 2, '2026-01-27 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(6, 2, 2, 5, '2026-01-17 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(7, 3, 2, 4, '2026-01-02 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(8, 2, 5, 3, '2026-01-13 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(9, 4, 1, 4, '2026-01-24 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(10, 1, 4, 5, '2026-01-17 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_label` varchar(100) DEFAULT NULL,
  `address_line_1` text NOT NULL,
  `address_line_2` text DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `district` varchar(100) NOT NULL,
  `area` varchar(100) DEFAULT NULL,
  `bangladeshi_area_id` bigint(20) UNSIGNED DEFAULT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Bangladesh',
  `phone` varchar(20) NOT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_addresses`
--

INSERT INTO `customer_addresses` (`id`, `user_id`, `address_label`, `address_line_1`, `address_line_2`, `city`, `district`, `area`, `bangladeshi_area_id`, `postal_code`, `country`, `phone`, `recipient_name`, `is_default`, `is_active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'Home', '123 Main Street', 'Apt 4B', 'Dhaka', 'Dhaka', 'Gulshan', NULL, '1212', 'Bangladesh', '01700000001', 'Shaimum Hasan', 1, 1, '2026-01-29 00:54:33', '2026-01-29 00:54:33', NULL),
(2, 3, 'Office', '456 Corporate Plaza', NULL, 'Dhaka', 'Dhaka', 'Banani', NULL, '1213', 'Bangladesh', '01700000002', 'Shaimum Hasan', 0, 1, '2026-01-29 00:54:39', '2026-01-29 00:54:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zones`
--

CREATE TABLE `delivery_zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `area_code` varchar(50) DEFAULT NULL,
  `districts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`districts`)),
  `areas` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`areas`)),
  `standard_delivery_charge` decimal(8,2) NOT NULL,
  `express_delivery_charge` decimal(8,2) DEFAULT NULL,
  `standard_delivery_days` int(11) NOT NULL DEFAULT 2,
  `express_delivery_days` int(11) DEFAULT NULL,
  `free_delivery_min_amount` decimal(10,2) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `priority` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_zones`
--

INSERT INTO `delivery_zones` (`id`, `zone_name`, `description`, `area_code`, `districts`, `areas`, `standard_delivery_charge`, `express_delivery_charge`, `standard_delivery_days`, `express_delivery_days`, `free_delivery_min_amount`, `is_active`, `priority`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dhaka Metro', 'Dhaka metro and nearby districts', NULL, '[\"Dhaka\",\"Gazipur\",\"Narayanganj\"]', NULL, 60.00, 120.00, 2, 1, 1500.00, 1, 100, '2026-01-28 23:56:23', '2026-01-28 23:56:23', NULL),
(2, 'Major Cities', 'Major cities outside Dhaka', NULL, '[\"Chattogram\",\"Rajshahi\",\"Khulna\",\"Sylhet\",\"Barishal\",\"Rangpur\",\"Mymensingh\"]', NULL, 80.00, 150.00, 3, 2, 2000.00, 1, 50, '2026-01-28 23:56:23', '2026-01-28 23:56:23', NULL),
(3, 'Nationwide', 'All districts (fallback)', NULL, '[\"Dhaka\",\"Gazipur\",\"Narayanganj\",\"Narsingdi\",\"Munshiganj\",\"Manikganj\",\"Tangail\",\"Kishoreganj\",\"Faridpur\",\"Gopalganj\",\"Madaripur\",\"Rajbari\",\"Shariatpur\",\"Chattogram\",\"Cox\'s Bazar\",\"Cumilla\",\"Brahmanbaria\",\"Chandpur\",\"Feni\",\"Lakshmipur\",\"Noakhali\",\"Khagrachhari\",\"Rangamati\",\"Bandarban\",\"Rajshahi\",\"Bogura\",\"Pabna\",\"Sirajganj\",\"Naogaon\",\"Natore\",\"Chapainawabganj\",\"Joypurhat\",\"Khulna\",\"Jashore\",\"Satkhira\",\"Bagerhat\",\"Narail\",\"Jhenaidah\",\"Kushtia\",\"Magura\",\"Chuadanga\",\"Meherpur\",\"Barishal\",\"Bhola\",\"Patuakhali\",\"Pirojpur\",\"Barguna\",\"Jhalokati\",\"Sylhet\",\"Moulvibazar\",\"Habiganj\",\"Sunamganj\",\"Rangpur\",\"Dinajpur\",\"Kurigram\",\"Lalmonirhat\",\"Nilphamari\",\"Panchagarh\",\"Thakurgaon\",\"Gaibandha\",\"Mymensingh\",\"Jamalpur\",\"Sherpur\",\"Netrokona\"]', NULL, 100.00, 250.00, 4, 1, 2500.00, 1, 10, '2026-01-28 23:56:23', '2026-01-29 00:22:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zone_areas`
--

CREATE TABLE `delivery_zone_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_zone_id` bigint(20) UNSIGNED NOT NULL,
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_zone_districts`
--

CREATE TABLE `delivery_zone_districts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `delivery_zone_id` bigint(20) UNSIGNED NOT NULL,
  `district_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `product_id`, `category_id`, `discount_type`, `discount_value`, `valid_from`, `valid_to`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'fixed', 45.00, '2026-01-18', '2026-02-15', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(2, 1, 3, 'percentage', 32.00, '2026-01-22', '2026-02-14', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(3, 2, 2, 'percentage', 12.00, '2026-01-23', '2026-02-12', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(4, 1, 2, 'percentage', 31.00, '2026-01-18', '2026-02-17', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(5, 2, 2, 'fixed', 12.00, '2026-01-25', '2026-02-13', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(6, 2, 1, 'percentage', 35.00, '2026-01-28', '2026-02-14', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(7, 2, 3, 'percentage', 11.00, '2026-01-26', '2026-02-17', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(8, 2, 1, 'fixed', 17.00, '2026-01-21', '2026-02-09', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(9, 1, 1, 'fixed', 25.00, '2026-01-23', '2026-02-09', '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(10, 2, 1, 'percentage', 21.00, '2026-01-21', '2026-02-09', '2026-01-28 06:19:30', '2026-01-28 06:19:30');

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
-- Table structure for table `inventory_logs`
--

CREATE TABLE `inventory_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `change_type` enum('in','out') NOT NULL,
  `quantity_changed` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_logs`
--

INSERT INTO `inventory_logs` (`id`, `product_id`, `variant_id`, `change_type`, `quantity_changed`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 4, 1, 'out', 7, 'Sample note for inventory log #1', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(2, 4, NULL, 'out', 37, 'Sample note for inventory log #2', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(3, 4, NULL, 'in', 5, 'Sample note for inventory log #3', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(4, 5, NULL, 'out', 30, 'Sample note for inventory log #4', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(5, 2, 1, 'out', 48, 'Sample note for inventory log #5', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(6, 5, NULL, 'in', 44, 'Sample note for inventory log #6', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(7, 5, NULL, 'in', 14, 'Sample note for inventory log #7', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(8, 2, 2, 'out', 13, 'Sample note for inventory log #8', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(9, 2, 3, 'out', 6, 'Sample note for inventory log #9', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(10, 3, 2, 'in', 35, 'Sample note for inventory log #10', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_04_095633_create_personal_access_tokens_table', 1),
(5, '2025_10_04_104815_add_role_to_users_table', 1),
(6, '2025_10_04_130511_create_brands_table', 1),
(7, '2025_10_05_120444_create_categories_table', 1),
(8, '2025_10_05_134913_create_sizes_table', 1),
(9, '2025_10_06_010808_create_shippings_table', 1),
(10, '2025_10_06_021259_create_products_table', 1),
(11, '2025_10_06_043128_create_product_images_table', 1),
(12, '2025_10_06_103138_create_coupons_table', 1),
(13, '2025_10_06_130916_create_orders_table', 1),
(14, '2025_10_08_080120_create_product_variants_table', 1),
(15, '2025_10_08_090130_create_wishlists_table', 1),
(16, '2025_10_09_042242_create_order_items_table', 1),
(17, '2025_10_09_052116_create_reviews_table', 1),
(18, '2025_10_09_061456_create_inventory_logs_table', 1),
(19, '2025_10_09_072251_create_discounts_table', 1),
(20, '2025_10_09_083520_create_notifications_table', 1),
(21, '2025_10_09_085528_create_shipping_methods_table', 1),
(22, '2025_10_09_104434_create_coupon_usages_table', 1),
(23, '2025_10_09_111940_create_order_shippings_table', 1),
(24, '2025_10_09_120216_create_transactions_table', 1),
(25, '2025_10_09_153109_create_payments_table', 1),
(26, '2025_10_15_add_customer_fields_to_orders_table', 2),
(27, '2025_10_15_add_phone_to_users_table', 3),
(28, '2025_10_15_create_bangladeshi_locations_tables', 4),
(29, '2025_10_15_create_customer_addresses_table', 5),
(30, '2025_10_15_create_delivery_zones_table', 6),
(31, '2025_10_15_create_order_status_history_table', 7),
(32, '2025_10_15_update_payments_table', 8),
(33, '2026_01_29_120001_add_delivery_zone_id_to_orders_table', 9),
(34, '2026_01_29_120002_add_payment_id_to_orders_table', 9),
(35, '2026_01_29_120003_add_shipping_method_id_to_orders_table', 9),
(36, '2026_01_29_120004_add_billing_fields_to_orders_table', 9),
(37, '2026_01_29_120005_add_order_shipping_id_to_orders_table', 9),
(38, '2026_01_29_120006_add_bangladeshi_area_id_to_customer_addresses_table', 9),
(39, '2026_01_29_120007_add_category_id_to_order_items_table', 9),
(40, '2026_01_29_120008_add_coupon_id_to_orders_table', 9),
(41, '2026_01_29_create_newsletters_table', 10),
(42, '2026_01_29_add_product_features_to_products_table', 11),
(43, '2026_01_29_110000_add_payment_method_to_orders_table', 12),
(44, '2026_01_29_110001_add_state_columns_to_orders_table', 12),
(45, '2026_01_29_110002_make_user_id_nullable_in_orders', 13),
(46, '2026_02_05_000001_update_payment_method_enums', 14),
(47, '2026_02_05_000002_cleanup_order_relationships', 14),
(48, '2026_02_05_000003_add_constraints_indexes', 15),
(49, '2026_02_05_000004_normalize_delivery_zones', 15),
(50, '2026_02_05_000005_create_user_device_tokens_table', 16),
(51, '2026_02_05_add_payment_id_to_orders', 17),
(52, '2026_02_05_000010_create_settings_table', 18),
(53, '2026_02_05_000011_create_settings_history_table', 19),
(54, '2025_02_05_add_barcode_to_products', 20);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `subscribed_at` timestamp NULL DEFAULT NULL,
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `status` enum('unread','read') NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `message`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'This is a sample notification message number 1.', 'unread', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(2, 1, 'This is a sample notification message number 2.', 'unread', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(3, 1, 'This is a sample notification message number 3.', 'read', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(4, 1, 'This is a sample notification message number 4.', 'read', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(5, 1, 'This is a sample notification message number 5.', 'unread', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(6, 1, 'This is a sample notification message number 6.', 'read', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(7, 1, 'This is a sample notification message number 7.', 'read', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(8, 1, 'This is a sample notification message number 8.', 'read', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(9, 1, 'This is a sample notification message number 9.', 'unread', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(10, 1, 'This is a sample notification message number 10.', 'read', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Bangladesh',
  `billing_address` text DEFAULT NULL,
  `billing_city` varchar(100) DEFAULT NULL,
  `billing_district` varchar(100) DEFAULT NULL,
  `billing_area` varchar(100) DEFAULT NULL,
  `billing_postal_code` varchar(20) DEFAULT NULL,
  `billing_state` varchar(100) DEFAULT NULL,
  `billing_country` varchar(100) DEFAULT 'Bangladesh',
  `billing_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_address_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_zone_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `coupon_id` bigint(20) UNSIGNED DEFAULT NULL,
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `final_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','paid','shipped','delivered','cancelled') NOT NULL DEFAULT 'pending',
  `payment_method` enum('cod','bkash','nagad','rocket','card','bank_transfer','mobile_banking','wallet') DEFAULT 'cod',
  `customer_notes` text DEFAULT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `payment_id`, `user_id`, `customer_name`, `customer_email`, `customer_phone`, `shipping_address`, `city`, `district`, `area`, `postal_code`, `state`, `country`, `billing_address`, `billing_city`, `billing_district`, `billing_area`, `billing_postal_code`, `billing_state`, `billing_country`, `billing_address_id`, `shipping_address_id`, `delivery_zone_id`, `total_amount`, `discount_amount`, `coupon_id`, `shipping_fee`, `final_amount`, `status`, `payment_method`, `customer_notes`, `tracking_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 354.00, 90.00, NULL, 40.00, 304.00, 'paid', 'cod', NULL, NULL, NULL, '2025-11-10 06:19:30', '2026-01-28 23:56:23'),
(2, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 683.00, 96.00, 2, 20.00, 607.00, 'delivered', 'cod', NULL, NULL, NULL, '2025-11-23 06:19:30', '2026-01-28 23:56:23'),
(3, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 829.00, 76.00, 2, 38.00, 791.00, 'pending', 'cod', NULL, NULL, NULL, '2026-01-24 06:19:30', '2026-01-28 23:56:23'),
(4, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 546.00, 80.00, 4, 35.00, 501.00, 'paid', 'cod', NULL, NULL, NULL, '2026-01-28 06:19:30', '2026-01-28 23:56:23'),
(5, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 575.00, 92.00, 1, 28.00, 511.00, 'delivered', 'cod', NULL, NULL, NULL, '2026-01-14 06:19:30', '2026-01-28 23:56:23'),
(6, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 916.00, 77.00, NULL, 40.00, 879.00, 'cancelled', 'cod', NULL, NULL, NULL, '2026-01-04 06:19:30', '2026-01-28 23:56:23'),
(7, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 675.00, 47.00, NULL, 3.00, 631.00, 'pending', 'cod', NULL, NULL, NULL, '2026-01-22 06:19:30', '2026-01-28 23:56:23'),
(8, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 831.00, 79.00, NULL, 26.00, 778.00, 'delivered', 'cod', NULL, NULL, NULL, '2025-11-18 06:19:30', '2026-01-28 23:56:23'),
(9, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 53.00, 35.00, NULL, 4.00, 22.00, 'cancelled', 'cod', NULL, NULL, NULL, '2025-11-11 06:19:30', '2026-01-28 23:56:23'),
(10, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 622.00, 54.00, NULL, 15.00, 583.00, 'shipped', 'cod', NULL, NULL, NULL, '2026-01-01 06:19:30', '2026-01-28 23:56:23'),
(11, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 615.00, 84.00, NULL, 31.00, 562.00, 'paid', 'cod', NULL, NULL, NULL, '2025-12-01 06:19:30', '2026-01-28 23:56:23'),
(12, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 283.00, 6.00, NULL, 18.00, 295.00, 'delivered', 'cod', NULL, NULL, NULL, '2025-12-19 06:19:30', '2026-01-28 23:56:23'),
(13, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 493.00, 54.00, NULL, 11.00, 450.00, 'cancelled', 'cod', NULL, NULL, NULL, '2025-11-08 06:19:30', '2026-01-28 23:56:23'),
(14, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 352.00, 59.00, NULL, 12.00, 305.00, 'pending', 'cod', NULL, NULL, NULL, '2025-12-15 06:19:30', '2026-01-28 23:56:23'),
(15, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 795.00, 79.00, NULL, 38.00, 754.00, 'paid', 'cod', NULL, NULL, NULL, '2025-12-21 06:19:30', '2026-01-28 23:56:23'),
(16, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 868.00, 32.00, NULL, 30.00, 866.00, 'pending', 'cod', NULL, NULL, NULL, '2025-11-10 06:19:30', '2026-01-28 23:56:23'),
(17, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 85.00, 32.00, NULL, 23.00, 76.00, 'pending', 'cod', NULL, NULL, NULL, '2025-12-05 06:19:30', '2026-01-28 23:56:23'),
(18, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 415.00, 9.00, NULL, 14.00, 420.00, 'paid', 'cod', NULL, NULL, NULL, '2026-01-26 06:19:30', '2026-01-28 23:56:23'),
(19, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 537.00, 59.00, NULL, 0.00, 478.00, 'pending', 'cod', NULL, NULL, NULL, '2025-11-23 06:19:30', '2026-01-28 23:56:23'),
(20, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 522.00, 88.00, NULL, 6.00, 440.00, 'cancelled', 'cod', NULL, NULL, NULL, '2025-11-24 06:19:30', '2026-01-28 23:56:23'),
(21, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 744.00, 74.00, NULL, 33.00, 703.00, 'shipped', 'cod', NULL, NULL, NULL, '2025-11-15 06:19:30', '2026-01-28 23:56:23'),
(22, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 362.00, 44.00, NULL, 29.00, 347.00, 'delivered', 'cod', NULL, NULL, NULL, '2025-11-18 06:19:30', '2026-01-28 23:56:23'),
(23, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 99.00, 15.00, NULL, 49.00, 133.00, 'pending', 'cod', NULL, NULL, NULL, '2025-11-20 06:19:30', '2026-01-28 23:56:23'),
(24, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 172.00, 4.00, NULL, 27.00, 195.00, 'cancelled', 'cod', NULL, NULL, NULL, '2025-10-30 06:19:30', '2026-01-28 23:56:23'),
(25, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 571.00, 4.00, NULL, 33.00, 600.00, 'delivered', 'cod', NULL, NULL, NULL, '2025-11-27 06:19:30', '2026-01-28 23:56:23'),
(26, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 129.00, 45.00, NULL, 7.00, 91.00, 'delivered', 'cod', NULL, NULL, NULL, '2026-01-21 06:19:30', '2026-01-28 23:56:23'),
(27, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 688.00, 33.00, NULL, 16.00, 671.00, 'delivered', 'cod', NULL, NULL, NULL, '2025-11-23 06:19:30', '2026-01-28 23:56:23'),
(28, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 826.00, 24.00, NULL, 2.00, 804.00, 'cancelled', 'cod', NULL, NULL, NULL, '2025-11-19 06:19:30', '2026-01-28 23:56:23'),
(29, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 229.00, 9.00, NULL, 42.00, 262.00, 'delivered', 'cod', NULL, NULL, NULL, '2026-01-04 06:19:30', '2026-01-28 23:56:23'),
(30, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 518.00, 88.00, NULL, 2.00, 432.00, 'cancelled', 'cod', NULL, NULL, NULL, '2026-01-21 06:19:30', '2026-01-28 23:56:23'),
(31, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 939.00, 95.00, NULL, 41.00, 885.00, 'pending', 'cod', NULL, NULL, NULL, '2026-01-10 06:19:30', '2026-01-28 23:56:23'),
(32, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 480.00, 29.00, NULL, 6.00, 457.00, 'pending', 'cod', NULL, NULL, NULL, '2025-12-17 06:19:30', '2026-01-28 23:56:23'),
(33, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 871.00, 27.00, NULL, 26.00, 870.00, 'pending', 'cod', NULL, NULL, NULL, '2025-11-24 06:19:30', '2026-01-28 23:56:23'),
(34, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 649.00, 25.00, NULL, 6.00, 630.00, 'cancelled', 'cod', NULL, NULL, NULL, '2025-12-27 06:19:30', '2026-01-28 23:56:23'),
(35, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 421.00, 16.00, NULL, 40.00, 445.00, 'cancelled', 'cod', NULL, NULL, NULL, '2025-12-02 06:19:30', '2026-01-28 23:56:23'),
(36, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 721.00, 98.00, NULL, 37.00, 660.00, 'delivered', 'cod', NULL, NULL, NULL, '2025-11-13 06:19:30', '2026-01-28 23:56:23'),
(37, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 846.00, 52.00, NULL, 13.00, 807.00, 'paid', 'cod', NULL, NULL, NULL, '2025-11-11 06:19:30', '2026-01-28 23:56:23'),
(38, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 440.00, 35.00, NULL, 47.00, 452.00, 'paid', 'cod', NULL, NULL, NULL, '2025-12-16 06:19:30', '2026-01-28 23:56:23'),
(39, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 522.00, 7.00, NULL, 49.00, 564.00, 'delivered', 'cod', NULL, NULL, NULL, '2025-12-11 06:19:30', '2026-01-28 23:56:23'),
(40, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 391.00, 46.00, NULL, 50.00, 395.00, 'pending', 'cod', NULL, NULL, NULL, '2026-01-24 06:19:30', '2026-01-28 23:56:23'),
(41, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 555.00, 62.00, NULL, 35.00, 528.00, 'delivered', 'cod', NULL, NULL, NULL, '2025-11-19 06:19:30', '2026-01-28 23:56:23'),
(42, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 107.00, 72.00, NULL, 43.00, 78.00, 'delivered', 'cod', NULL, NULL, NULL, '2025-12-19 06:19:30', '2026-01-28 23:56:23'),
(43, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 615.00, 30.00, NULL, 0.00, 585.00, 'paid', 'cod', NULL, NULL, NULL, '2025-11-16 06:19:30', '2026-01-28 23:56:23'),
(44, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 736.00, 49.00, NULL, 17.00, 704.00, 'delivered', 'cod', NULL, NULL, NULL, '2026-01-25 06:19:30', '2026-01-28 23:56:23'),
(45, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 290.00, 19.00, NULL, 50.00, 321.00, 'paid', 'cod', NULL, NULL, NULL, '2026-01-14 06:19:30', '2026-01-28 23:56:23'),
(46, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 889.00, 51.00, NULL, 36.00, 874.00, 'cancelled', 'cod', NULL, NULL, NULL, '2025-11-09 06:19:30', '2026-01-28 23:56:23'),
(47, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 232.00, 43.00, NULL, 25.00, 214.00, 'paid', 'cod', NULL, NULL, NULL, '2026-01-10 06:19:30', '2026-01-28 23:56:23'),
(48, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 982.00, 71.00, NULL, 32.00, 943.00, 'pending', 'cod', NULL, NULL, NULL, '2025-10-30 06:19:30', '2026-01-28 23:56:23'),
(49, NULL, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 390.00, 3.00, NULL, 35.00, 422.00, 'delivered', 'cod', NULL, NULL, NULL, '2025-12-22 06:19:30', '2026-01-28 23:56:23'),
(50, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, 1, 715.00, 29.00, NULL, 47.00, 733.00, 'pending', 'cod', NULL, NULL, NULL, '2026-01-05 06:19:30', '2026-01-28 23:56:23'),
(51, NULL, NULL, 'John Doe', 'john@example.com', '01923456789', '456 Main St', 'Dhaka', NULL, NULL, '1200', NULL, 'Bangladesh', '456 Main St', 'Dhaka', NULL, NULL, '1200', NULL, 'Bangladesh', NULL, NULL, NULL, 2500.00, 0.00, NULL, 0.00, 2500.00, 'cancelled', 'cod', NULL, NULL, NULL, '2026-01-29 05:01:56', '2026-01-29 05:03:24'),
(52, NULL, NULL, 'Jane Smith', 'jane@example.com', '01812345678', '789 Oak Ave', 'Chittagong', NULL, NULL, '4000', NULL, 'Bangladesh', '789 Oak Ave', 'Chittagong', NULL, NULL, '4000', NULL, 'Bangladesh', NULL, NULL, NULL, 3500.00, 0.00, NULL, 0.00, 3500.00, 'pending', 'bkash', NULL, NULL, NULL, '2026-01-29 05:03:54', '2026-01-29 05:03:54'),
(53, NULL, NULL, 'Nayem Islam', 'nayem@gmail.com', '01707656845', 'Mohammapur', 'Mohammapur', NULL, NULL, '1230', NULL, 'Bangladesh', 'Mohammapur', 'Mohammapur', NULL, NULL, '1230', NULL, 'Bangladesh', NULL, NULL, NULL, 1208.90, 50.00, NULL, 100.00, 1208.90, 'paid', 'cod', NULL, NULL, NULL, '2026-01-29 05:09:18', '2026-01-29 06:38:28'),
(54, NULL, NULL, 'Farid Ahmed', 'farid@gmail.com', '01707568463', 'Mirpur', 'Mirpur', NULL, NULL, '1200', NULL, 'Bangladesh', 'Mirpur', 'Mirpur', NULL, NULL, '1200', NULL, 'Bangladesh', NULL, NULL, NULL, 5936.70, 100.00, NULL, 50.00, 5936.70, 'pending', 'cod', NULL, NULL, NULL, '2026-01-29 05:56:54', '2026-01-29 06:14:46'),
(55, NULL, NULL, 'Jahid  Islam', 'jahid@gmail.com', '01707568461', 'Sector-04, Uttara Dhaka', 'Dhaka', NULL, NULL, 'DHAKA-UTT-1230', NULL, 'Bangladesh', 'Sector-04, Uttara Dhaka', 'Dhaka', NULL, NULL, 'DHAKA-UTT-1230', NULL, 'Bangladesh', NULL, NULL, NULL, 30244.50, 100.00, NULL, 50.00, 30244.50, 'pending', 'cod', NULL, NULL, NULL, '2026-01-29 06:32:33', '2026-01-29 06:33:45'),
(56, NULL, NULL, 'Zunayed  Ahmed', 'Zuanaed@gmail.com', '01707568468', 'Jhaocar', 'Dhaka', NULL, NULL, 'DHAKA-MOH-1207', NULL, 'Bangladesh', 'Jhaocar', 'Dhaka', NULL, NULL, 'DHAKA-MOH-1207', NULL, 'Bangladesh', NULL, NULL, NULL, 12866.70, 0.00, NULL, 0.00, 12866.70, 'pending', 'bkash', NULL, NULL, NULL, '2026-01-29 06:37:14', '2026-01-29 06:37:14'),
(57, NULL, NULL, 'Tanvir Ahmed', 'tanvir@gmail.com', '01707568468', 'Mohammapur', 'Dhaka', NULL, NULL, 'DHAKA-CAN-1206', NULL, 'Bangladesh', 'Mohammapur', 'Dhaka', NULL, NULL, 'DHAKA-CAN-1206', NULL, 'Bangladesh', NULL, NULL, NULL, 131.96, 0.00, NULL, 0.00, 131.96, 'pending', 'bkash', NULL, NULL, NULL, '2026-02-05 04:26:45', '2026-02-05 04:26:45'),
(58, NULL, NULL, 'Tanvir Ahmed', 'tanvir@gmail.com', '01707568468', 'Mohammapur', 'Dhaka', NULL, NULL, 'DHAKA-MOH-1207', NULL, 'Bangladesh', 'Mohammapur', 'Dhaka', NULL, NULL, 'DHAKA-MOH-1207', NULL, 'Bangladesh', NULL, NULL, NULL, 218.90, 0.00, NULL, 0.00, 218.90, 'pending', 'nagad', NULL, NULL, NULL, '2026-02-05 05:27:51', '2026-02-05 05:27:51');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_purchase` decimal(10,2) NOT NULL,
  `discount_applied` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `category_id`, `variant_id`, `quantity`, `price_at_purchase`, `discount_applied`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 12, 2, 1, 466.00, 18.00, '2026-01-28 06:19:30', '2026-01-28 23:56:23', NULL),
(2, 2, 2, 12, 2, 4, 430.00, 62.00, '2026-01-28 06:19:30', '2026-01-28 23:56:23', NULL),
(3, 1, 2, 12, 1, 1, 103.00, 20.00, '2026-01-28 06:19:30', '2026-01-28 23:56:23', NULL),
(4, 2, 1, 1, 1, 1, 640.00, 3.00, '2026-01-28 06:19:30', '2026-01-28 23:56:23', NULL),
(5, 2, 1, 1, 1, 3, 454.00, 42.00, '2026-01-28 06:19:30', '2026-01-28 23:56:23', NULL),
(6, 1, 2, 12, 1, 4, 995.00, 50.00, '2026-01-28 06:19:30', '2026-01-28 23:56:23', NULL),
(7, 1, 2, 12, 1, 1, 828.00, 26.00, '2026-01-28 06:19:30', '2026-01-28 23:56:23', NULL),
(8, 2, 2, 12, 1, 4, 743.00, 7.00, '2026-01-28 06:19:30', '2026-01-28 23:56:23', NULL),
(9, 1, 1, 1, 2, 2, 810.00, 70.00, '2026-01-28 06:19:30', '2026-01-28 23:56:23', NULL),
(10, 2, 2, 12, 2, 1, 914.00, 6.00, '2026-01-28 06:19:30', '2026-01-28 23:56:23', NULL),
(11, 51, 1, NULL, NULL, 1, 1199.00, 0.00, '2026-01-29 05:01:56', '2026-01-29 05:01:56', NULL),
(12, 52, 1, NULL, NULL, 2, 1199.00, 0.00, '2026-01-29 05:03:54', '2026-01-29 05:03:54', NULL),
(13, 52, 2, NULL, NULL, 1, 1099.00, 0.00, '2026-01-29 05:03:54', '2026-01-29 05:03:54', NULL),
(14, 53, 2, NULL, NULL, 1, 1099.00, 0.00, '2026-01-29 05:09:18', '2026-01-29 05:09:18', NULL),
(15, 54, 4, NULL, NULL, 3, 1799.00, 0.00, '2026-01-29 05:56:54', '2026-01-29 05:56:54', NULL),
(16, 55, 8, NULL, NULL, 5, 5499.00, 0.00, '2026-01-29 06:32:33', '2026-01-29 06:32:33', NULL),
(17, 56, 7, NULL, NULL, 3, 3899.00, 0.00, '2026-01-29 06:37:14', '2026-01-29 06:37:14', NULL),
(18, 57, 14, NULL, NULL, 4, 29.99, 0.00, '2026-02-05 04:26:45', '2026-02-05 04:26:45', NULL),
(19, 58, 20, NULL, NULL, 1, 199.00, 0.00, '2026-02-05 05:27:51', '2026-02-05 05:27:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_shippings`
--

CREATE TABLE `order_shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `shipping_method_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `tracking_number` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_shippings`
--

INSERT INTO `order_shippings` (`id`, `order_id`, `shipping_method_id`, `address`, `tracking_number`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 'House 1, Road 5, Dhaka, Bangladesh', 'TRK-6979FED28CB50', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(2, 3, 2, 'House 2, Road 8, Dhaka, Bangladesh', 'TRK-6979FED28D7AB', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(3, 5, 5, 'House 3, Road 7, Dhaka, Bangladesh', 'TRK-6979FED28DD8C', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(4, 1, 2, 'House 4, Road 15, Dhaka, Bangladesh', 'TRK-6979FED28ED1A', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(5, 5, 4, 'House 5, Road 12, Dhaka, Bangladesh', 'TRK-6979FED28F521', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(6, 4, 5, 'House 6, Road 10, Dhaka, Bangladesh', 'TRK-6979FED28FB83', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(7, 5, 2, 'House 7, Road 3, Dhaka, Bangladesh', 'TRK-6979FED290164', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(8, 5, 1, 'House 8, Road 18, Dhaka, Bangladesh', 'TRK-6979FED2906EB', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(9, 3, 5, 'House 9, Road 4, Dhaka, Bangladesh', 'TRK-6979FED290CAA', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(10, 4, 5, 'House 10, Road 3, Dhaka, Bangladesh', 'TRK-6979FED291206', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_status_history`
--

CREATE TABLE `order_status_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `old_status` varchar(50) DEFAULT NULL,
  `new_status` varchar(50) NOT NULL,
  `remarks` text DEFAULT NULL,
  `changed_by` varchar(255) DEFAULT NULL,
  `change_source` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status_history`
--

INSERT INTO `order_status_history` (`id`, `order_id`, `old_status`, `new_status`, `remarks`, `changed_by`, `change_source`, `created_at`) VALUES
(1, 1, 'pending', 'paid', 'Payment received', 'admin', 'admin', '2026-01-29 06:52:27'),
(2, 1, 'paid', 'shipped', 'Order shipped', 'system', 'system', '2026-01-29 06:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` enum('cod','bkash','nagad','rocket','card','bank_transfer','mobile_banking','wallet') DEFAULT NULL,
  `payment_gateway` varchar(100) DEFAULT NULL,
  `payment_phone_number` varchar(20) DEFAULT NULL,
  `transaction_id` varchar(150) NOT NULL,
  `payment_reference` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','success','failed') NOT NULL,
  `paid_at` timestamp NULL DEFAULT NULL,
  `refund_status` enum('none','pending','completed','failed') NOT NULL DEFAULT 'none',
  `refund_amount` decimal(10,2) DEFAULT NULL,
  `refunded_at` timestamp NULL DEFAULT NULL,
  `payment_response` longtext DEFAULT NULL,
  `payment_notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_method`, `payment_gateway`, `payment_phone_number`, `transaction_id`, `payment_reference`, `amount`, `status`, `paid_at`, `refund_status`, `refund_amount`, `refunded_at`, `payment_response`, `payment_notes`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 'cod', NULL, NULL, 'PAYPFXUAIBIZA', NULL, 487.90, 'pending', NULL, 'none', NULL, NULL, NULL, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(2, 11, 'card', NULL, NULL, 'PAY85RAAEQ5XQ', NULL, 84.20, 'success', NULL, 'none', NULL, NULL, NULL, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(3, 4, 'cod', NULL, NULL, 'PAYY50XYQZJJM', NULL, 454.60, 'pending', NULL, 'none', NULL, NULL, NULL, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(4, 32, 'mobile_banking', NULL, NULL, 'PAYH8HLLQZSZ3', NULL, 150.50, 'failed', NULL, 'none', NULL, NULL, NULL, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(5, 32, 'card', NULL, NULL, 'PAYQANSX3REGB', NULL, 291.30, 'failed', NULL, 'none', NULL, NULL, NULL, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(6, 41, 'mobile_banking', NULL, NULL, 'PAYKLIIMEDRLB', NULL, 208.30, 'failed', NULL, 'none', NULL, NULL, NULL, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(7, 32, 'mobile_banking', NULL, NULL, 'PAYCJVTTZDT0Z', NULL, 167.50, 'failed', NULL, 'none', NULL, NULL, NULL, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(8, 40, 'mobile_banking', NULL, NULL, 'PAY9BX2J3WMJQ', NULL, 482.10, 'failed', NULL, 'none', NULL, NULL, NULL, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(9, 39, 'cod', NULL, NULL, 'PAYIULTZNVRNK', NULL, 236.10, 'success', NULL, 'none', NULL, NULL, NULL, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(10, 11, 'mobile_banking', NULL, NULL, 'PAYSTAEZR2TJJ', NULL, 67.00, 'failed', NULL, 'none', NULL, NULL, NULL, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'token', 'cc403fd20775e65d92d8361cb05120ee64628f367a38f75c1a50abbb4510b82c', '[\"*\"]', '2026-02-05 00:07:01', NULL, '2026-01-28 22:26:00', '2026-02-05 00:07:01'),
(2, 'App\\Models\\User', 1, 'admin-token', '59de6df93548dfc1cf49a68d770fd539dc44234ff822dbaccdd051316c15589a', '[\"*\"]', '2026-01-29 00:20:11', NULL, '2026-01-29 00:19:52', '2026-01-29 00:20:11'),
(3, 'App\\Models\\User', 1, 'dashboard-test', '5b4b1655a4107eaebaa4c48695e54bbc5929f6d7b88c5ed791251f2200bec9dc', '[\"*\"]', '2026-01-29 02:10:31', NULL, '2026-01-29 02:05:31', '2026-01-29 02:10:31'),
(4, 'App\\Models\\User', 11, 'auth_token', '996780a661702bb51fd4b8971a419d8b3c7d480d37df800dd8423f072898cbaa', '[\"*\"]', NULL, NULL, '2026-02-05 02:10:24', '2026-02-05 02:10:24'),
(6, 'App\\Models\\User', 12, 'auth_token', '4afc305a2b81f0b40a0f07014322eab0caad395572fa353a6116deb591eae5ef', '[\"*\"]', NULL, NULL, '2026-02-05 02:17:35', '2026-02-05 02:17:35'),
(7, 'App\\Models\\User', 12, 'auth_token', '3db78163cc26fc25c9e9ba95a0adfac1b8bdab8085cc22290cbfc18d32b26c9e', '[\"*\"]', NULL, NULL, '2026-02-05 02:30:01', '2026-02-05 02:30:01'),
(8, 'App\\Models\\User', 13, 'auth_token', 'f07c1f71a158e56c6bfa908150f8bb9e0a91ddcc0314340bdca9ab6063a09c7f', '[\"*\"]', '2026-02-05 03:26:33', NULL, '2026-02-05 03:21:12', '2026-02-05 03:26:33'),
(9, 'App\\Models\\User', 14, 'auth_token', '9823fd0d68fc8dc654858825e838a1e6afdbd7081c4bb3679122b694087f9fc9', '[\"*\"]', NULL, NULL, '2026-02-05 03:29:40', '2026-02-05 03:29:40'),
(10, 'App\\Models\\User', 12, 'auth_token', 'cc89e049b5b305623432aff1410ad7917ded7c7b7581fc9f3d56546ddd47edd2', '[\"*\"]', NULL, NULL, '2026-02-05 03:31:35', '2026-02-05 03:31:35'),
(11, 'App\\Models\\User', 14, 'auth_token', 'c8d5de7973016f39965fba7607531831b5ef33ecf02db1d9257ce02ad80ed1d6', '[\"*\"]', NULL, NULL, '2026-02-05 03:32:00', '2026-02-05 03:32:00'),
(12, 'App\\Models\\User', 14, 'auth_token', '9413acbec76a6d4f62895702faedba9ec3a94c3da87cc09e9237c4c59f8369d5', '[\"*\"]', NULL, NULL, '2026-02-05 03:32:59', '2026-02-05 03:32:59'),
(13, 'App\\Models\\User', 14, 'auth_token', 'e85d8195fa0e7eac3d7deb7bcbf63cf88ddf24f828bc7ad58a2ce932adc4a992', '[\"*\"]', '2026-02-05 04:49:02', NULL, '2026-02-05 03:37:28', '2026-02-05 04:49:02'),
(14, 'App\\Models\\User', 1, 'token', '10fac690b11abde19ef50f40f572b396d58bba71f714c36ddc18335a17aece41', '[\"*\"]', '2026-02-05 04:50:19', NULL, '2026-02-05 04:49:10', '2026-02-05 04:50:19'),
(15, 'App\\Models\\User', 14, 'auth_token', '393327594693896e0ef562de014c8281d1d5b6bb04ec978c536af1586af2b729', '[\"*\"]', '2026-02-05 07:23:29', NULL, '2026-02-05 04:51:15', '2026-02-05 07:23:29'),
(16, 'App\\Models\\User', 1, 'token', '87559d2383f5ec35fec3e681e88f4f3fb52783278df05c6b53fe78f3f0b86d41', '[\"*\"]', '2026-02-05 06:42:57', NULL, '2026-02-05 06:25:49', '2026-02-05 06:42:57'),
(17, 'App\\Models\\User', 14, 'auth_token', 'd87fe820d3089237432bdcfd6ef38d758980581620167980f8c956b8ce4e670a', '[\"*\"]', '2026-02-05 07:51:33', NULL, '2026-02-05 07:23:59', '2026-02-05 07:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `weight` decimal(8,2) DEFAULT NULL,
  `is_seasonal` tinyint(1) NOT NULL DEFAULT 0,
  `is_new` tinyint(1) NOT NULL DEFAULT 0,
  `is_bestseller` tinyint(1) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `sales_count` int(11) NOT NULL DEFAULT 0,
  `rating` decimal(3,2) NOT NULL DEFAULT 0.00,
  `review_count` int(11) NOT NULL DEFAULT 0,
  `featured_image` varchar(255) DEFAULT NULL,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `seasonal_start_date` date DEFAULT NULL,
  `seasonal_end_date` date DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `name`, `sku`, `barcode`, `description`, `base_price`, `stock_quantity`, `weight`, `is_seasonal`, `is_new`, `is_bestseller`, `is_featured`, `sales_count`, `rating`, `review_count`, `featured_image`, `display_order`, `seasonal_start_date`, `seasonal_end_date`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'iPhone 15 Pro Max', 'IPHONE-15-PRO-MAX-8582', NULL, 'Latest iPhone with A17 Pro chip and titanium design', 1199.00, 48, 0.22, 0, 1, 0, 0, 0, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:08:02'),
(2, 1, 4, 'Samsung Galaxy S24 Ultra', 'SAMSUNG-GALAXY-S24-U-1552', NULL, 'Flagship Android phone with S Pen and AI features', 1099.00, 43, 0.23, 0, 1, 0, 0, 0, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:08:02'),
(3, 1, 3, 'MacBook Pro 16\" M3', 'MACBOOK-PRO-16\"-M3-2701', NULL, 'Professional laptop with M3 chip and stunning display', 2499.00, 30, 2.10, 0, 1, 1, 1, 0, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:08:02'),
(4, 1, 7, 'Dell XPS 15', 'DELL-XPS-15-3314', NULL, 'Powerful laptop for creators and professionals', 1799.00, 22, 1.86, 0, 1, 0, 0, 0, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:08:02'),
(5, 14, 5, 'Sony WH-1000XM5', 'SONY-WH-1000XM5-9799', NULL, 'Industry-leading noise cancelling headphones', 399.00, 100, 0.25, 0, 1, 1, 0, 241, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:09:46'),
(6, 14, 14, 'Bose QuietComfort Ultra', 'BOSE-QUIETCOMFORT-UL-7321', NULL, 'Premium wireless headphones with spatial audio', 429.00, 80, 0.25, 0, 1, 1, 0, 420, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:09:46'),
(7, 13, 12, 'Canon EOS R5', 'CANON-EOS-R5-9309', NULL, 'Professional mirrorless camera with 8K video', 3899.00, 12, 0.74, 0, 1, 0, 1, 0, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:08:02'),
(8, 13, 13, 'Nikon Z9', 'NIKON-Z9-2800', NULL, 'Flagship mirrorless camera for professionals', 5499.00, 5, 1.34, 0, 1, 1, 0, 125, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:09:46'),
(9, 1, 6, 'LG OLED TV 65\"', 'LG-OLED-TV-65\"-3893', NULL, '4K OLED TV with stunning picture quality', 1999.00, 20, 22.50, 0, 1, 1, 0, 117, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:09:46'),
(10, 15, 5, 'Sony PlayStation 5', 'SONY-PLAYSTATION-5-7775', NULL, 'Next-gen gaming console with ray tracing', 499.00, 60, 4.50, 0, 1, 0, 0, 0, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:08:02'),
(11, 3, 1, 'Nike Air Max 270', 'NIKE-AIR-MAX-270-3161', NULL, 'Comfortable running shoes with Air cushioning', 150.00, 200, 0.80, 0, 1, 1, 0, 301, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:09:46'),
(12, 3, 2, 'Adidas Ultraboost 22', 'ADIDAS-ULTRABOOST-22-9975', NULL, 'Premium running shoes with Boost technology', 180.00, 180, 0.85, 0, 1, 1, 1, 310, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:09:46'),
(13, 2, 9, 'Zara Slim Fit Blazer', 'ZARA-SLIM-FIT-BLAZER-7478', NULL, 'Elegant blazer for formal occasions', 129.00, 75, 0.60, 0, 1, 0, 0, 0, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:08:02'),
(14, 2, 10, 'H&M Cotton T-Shirt Pack', 'H&M-COTTON-T-SHIRT-P-6153', NULL, 'Pack of 3 comfortable cotton t-shirts', 29.99, 296, 0.30, 0, 1, 1, 1, 123, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:09:46'),
(15, 3, 11, 'Puma Track Jacket', 'PUMA-TRACK-JACKET-8238', NULL, 'Sporty jacket for casual and athletic wear', 85.00, 120, 0.50, 0, 1, 1, 0, 339, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:09:46'),
(16, 4, 4, 'Samsung Smart Refrigerator', 'SAMSUNG-SMART-REFRIG-3353', NULL, 'Smart fridge with touchscreen and AI', 2299.00, 12, 120.00, 0, 1, 1, 1, 318, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:09:46'),
(17, 4, 6, 'LG Washing Machine', 'LG-WASHING-MACHINE-7125', NULL, 'Energy-efficient washing machine with AI DD', 899.00, 18, 75.00, 0, 1, 0, 0, 0, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:08:02'),
(18, 11, 8, 'HP DeskJet Printer', 'HP-DESKJET-PRINTER-5884', NULL, 'All-in-one wireless printer for home and office', 149.00, 85, 5.50, 0, 1, 0, 1, 0, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:08:02'),
(19, 14, 15, 'JBL Flip 6', 'JBL-FLIP-6-4723', NULL, 'Portable Bluetooth speaker with powerful sound', 129.00, 150, 0.55, 0, 1, 1, 1, 0, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:08:02'),
(20, 14, 14, 'Bose SoundLink Mini', 'BOSE-SOUNDLINK-MINI-5863', NULL, 'Compact wireless speaker with deep bass', 199.00, 94, 0.67, 0, 1, 1, 0, 280, 0.00, 0, NULL, 0, NULL, NULL, 'active', NULL, '2026-01-28 06:19:30', '2026-02-05 06:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image_url`, `is_primary`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'products/product-1-main.jpg', 1, '2026-01-28 22:27:02', '2026-01-28 06:19:30', '2026-01-28 22:27:02'),
(2, 1, 'products/product-1-2.jpg', 0, '2026-01-28 22:27:02', '2026-01-28 06:19:30', '2026-01-28 22:27:02'),
(3, 2, 'products/product-2-main.jpg', 1, '2026-01-28 22:27:51', '2026-01-28 06:19:30', '2026-01-28 22:27:51'),
(4, 2, 'products/product-2-2.jpg', 0, '2026-01-28 22:27:51', '2026-01-28 06:19:30', '2026-01-28 22:27:51'),
(5, 2, 'products/product-2-3.jpg', 0, '2026-01-28 22:27:51', '2026-01-28 06:19:30', '2026-01-28 22:27:51'),
(6, 2, 'products/product-2-4.jpg', 0, '2026-01-28 22:27:51', '2026-01-28 06:19:30', '2026-01-28 22:27:51'),
(7, 3, 'products/product-3-main.jpg', 1, '2026-01-28 22:28:08', '2026-01-28 06:19:30', '2026-01-28 22:28:08'),
(8, 3, 'products/product-3-2.jpg', 0, '2026-01-28 22:28:08', '2026-01-28 06:19:30', '2026-01-28 22:28:08'),
(9, 3, 'products/product-3-3.jpg', 0, '2026-01-28 22:28:08', '2026-01-28 06:19:30', '2026-01-28 22:28:08'),
(10, 4, 'products/product-4-main.jpg', 1, '2026-01-28 22:28:26', '2026-01-28 06:19:30', '2026-01-28 22:28:26'),
(11, 4, 'products/product-4-2.jpg', 0, '2026-01-28 22:28:26', '2026-01-28 06:19:30', '2026-01-28 22:28:26'),
(12, 4, 'products/product-4-3.jpg', 0, '2026-01-28 22:28:26', '2026-01-28 06:19:30', '2026-01-28 22:28:26'),
(13, 4, 'products/product-4-4.jpg', 0, '2026-01-28 22:28:26', '2026-01-28 06:19:30', '2026-01-28 22:28:26'),
(14, 5, 'products/product-5-main.jpg', 1, '2026-01-28 22:28:46', '2026-01-28 06:19:30', '2026-01-28 22:28:46'),
(15, 5, 'products/product-5-2.jpg', 0, '2026-01-28 22:28:46', '2026-01-28 06:19:30', '2026-01-28 22:28:46'),
(16, 6, 'products/product-6-main.jpg', 1, '2026-01-28 22:29:43', '2026-01-28 06:19:30', '2026-01-28 22:29:43'),
(17, 6, 'products/product-6-2.jpg', 0, '2026-01-28 22:29:43', '2026-01-28 06:19:30', '2026-01-28 22:29:43'),
(18, 6, 'products/product-6-3.jpg', 0, '2026-01-28 22:29:43', '2026-01-28 06:19:30', '2026-01-28 22:29:43'),
(19, 7, 'products/product-7-main.jpg', 1, '2026-01-28 22:31:36', '2026-01-28 06:19:30', '2026-01-28 22:31:36'),
(20, 7, 'products/product-7-2.jpg', 0, '2026-01-28 22:31:36', '2026-01-28 06:19:30', '2026-01-28 22:31:36'),
(21, 7, 'products/product-7-3.jpg', 0, '2026-01-28 22:31:36', '2026-01-28 06:19:30', '2026-01-28 22:31:36'),
(22, 8, 'products/product-8-main.jpg', 1, '2026-01-28 22:31:48', '2026-01-28 06:19:30', '2026-01-28 22:31:48'),
(23, 8, 'products/product-8-2.jpg', 0, '2026-01-28 22:31:48', '2026-01-28 06:19:30', '2026-01-28 22:31:48'),
(24, 8, 'products/product-8-3.jpg', 0, '2026-01-28 22:31:48', '2026-01-28 06:19:30', '2026-01-28 22:31:48'),
(25, 8, 'products/product-8-4.jpg', 0, '2026-01-28 22:31:48', '2026-01-28 06:19:30', '2026-01-28 22:31:48'),
(26, 9, 'products/product-9-main.jpg', 1, '2026-01-28 22:30:11', '2026-01-28 06:19:30', '2026-01-28 22:30:11'),
(27, 9, 'products/product-9-2.jpg', 0, '2026-01-28 22:30:11', '2026-01-28 06:19:30', '2026-01-28 22:30:11'),
(28, 9, 'products/product-9-3.jpg', 0, '2026-01-28 22:30:11', '2026-01-28 06:19:30', '2026-01-28 22:30:11'),
(29, 10, 'products/product-10-main.jpg', 1, '2026-01-28 22:30:56', '2026-01-28 06:19:30', '2026-01-28 22:30:56'),
(30, 10, 'products/product-10-2.jpg', 0, '2026-01-28 22:30:56', '2026-01-28 06:19:30', '2026-01-28 22:30:56'),
(31, 10, 'products/product-10-3.jpg', 0, '2026-01-28 22:30:56', '2026-01-28 06:19:30', '2026-01-28 22:30:56'),
(32, 10, 'products/product-10-4.jpg', 0, '2026-01-28 22:30:56', '2026-01-28 06:19:30', '2026-01-28 22:30:56'),
(33, 11, 'products/product-11-main.jpg', 1, '2026-01-28 22:31:23', '2026-01-28 06:19:30', '2026-01-28 22:31:23'),
(34, 11, 'products/product-11-2.jpg', 0, '2026-01-28 22:31:23', '2026-01-28 06:19:30', '2026-01-28 22:31:23'),
(35, 11, 'products/product-11-3.jpg', 0, '2026-01-28 22:31:23', '2026-01-28 06:19:30', '2026-01-28 22:31:23'),
(36, 11, 'products/product-11-4.jpg', 0, '2026-01-28 22:31:23', '2026-01-28 06:19:30', '2026-01-28 22:31:23'),
(37, 12, 'products/product-12-main.jpg', 1, '2026-01-28 22:32:05', '2026-01-28 06:19:30', '2026-01-28 22:32:05'),
(38, 12, 'products/product-12-2.jpg', 0, '2026-01-28 22:32:05', '2026-01-28 06:19:30', '2026-01-28 22:32:05'),
(39, 12, 'products/product-12-3.jpg', 0, '2026-01-28 22:32:05', '2026-01-28 06:19:30', '2026-01-28 22:32:05'),
(40, 12, 'products/product-12-4.jpg', 0, '2026-01-28 22:32:05', '2026-01-28 06:19:30', '2026-01-28 22:32:05'),
(41, 13, 'products/product-13-main.jpg', 1, '2026-01-28 22:32:19', '2026-01-28 06:19:30', '2026-01-28 22:32:19'),
(42, 13, 'products/product-13-2.jpg', 0, '2026-01-28 22:32:19', '2026-01-28 06:19:30', '2026-01-28 22:32:19'),
(43, 14, 'products/product-14-main.jpg', 1, '2026-01-28 22:32:35', '2026-01-28 06:19:30', '2026-01-28 22:32:35'),
(44, 14, 'products/product-14-2.jpg', 0, '2026-01-28 22:32:35', '2026-01-28 06:19:30', '2026-01-28 22:32:35'),
(45, 14, 'products/product-14-3.jpg', 0, '2026-01-28 22:32:35', '2026-01-28 06:19:30', '2026-01-28 22:32:35'),
(46, 14, 'products/product-14-4.jpg', 0, '2026-01-28 22:32:35', '2026-01-28 06:19:30', '2026-01-28 22:32:35'),
(47, 15, 'products/product-15-main.jpg', 1, '2026-01-28 22:32:53', '2026-01-28 06:19:30', '2026-01-28 22:32:53'),
(48, 15, 'products/product-15-2.jpg', 0, '2026-01-28 22:32:53', '2026-01-28 06:19:30', '2026-01-28 22:32:53'),
(49, 15, 'products/product-15-3.jpg', 0, '2026-01-28 22:32:53', '2026-01-28 06:19:30', '2026-01-28 22:32:53'),
(50, 16, 'products/product-16-main.jpg', 1, '2026-01-28 22:33:07', '2026-01-28 06:19:30', '2026-01-28 22:33:07'),
(51, 16, 'products/product-16-2.jpg', 0, '2026-01-28 22:33:07', '2026-01-28 06:19:30', '2026-01-28 22:33:07'),
(52, 17, 'products/product-17-main.jpg', 1, '2026-01-28 22:33:22', '2026-01-28 06:19:30', '2026-01-28 22:33:22'),
(53, 17, 'products/product-17-2.jpg', 0, '2026-01-28 22:33:22', '2026-01-28 06:19:30', '2026-01-28 22:33:22'),
(54, 18, 'products/product-18-main.jpg', 1, '2026-01-28 22:33:40', '2026-01-28 06:19:30', '2026-01-28 22:33:40'),
(55, 18, 'products/product-18-2.jpg', 0, '2026-01-28 22:33:40', '2026-01-28 06:19:30', '2026-01-28 22:33:40'),
(56, 19, 'products/product-19-main.jpg', 1, '2026-01-28 22:34:01', '2026-01-28 06:19:30', '2026-01-28 22:34:01'),
(57, 19, 'products/product-19-2.jpg', 0, '2026-01-28 22:34:01', '2026-01-28 06:19:30', '2026-01-28 22:34:01'),
(58, 20, 'products/product-20-main.jpg', 1, '2026-01-28 22:34:17', '2026-01-28 06:19:30', '2026-01-28 22:34:17'),
(59, 20, 'products/product-20-2.jpg', 0, '2026-01-28 22:34:17', '2026-01-28 06:19:30', '2026-01-28 22:34:17'),
(60, 1, '/storage/uploads/products/kjqdEpKTbkKbKt7yxWETacdcwLJPrUUT7yhZJbeH.webp', 1, '2026-01-28 22:27:29', '2026-01-28 22:27:02', '2026-01-28 22:27:29'),
(61, 1, '/storage/uploads/products/x4HTx85jVB9pDF6ma0N4yCh41hZN6vVCBPUjoFtv.jpg', 1, NULL, '2026-01-28 22:27:29', '2026-01-28 22:27:29'),
(62, 2, '/storage/uploads/products/hG6mM5ydW8QY7c8W0ao9tAhcKZOXjunq1fOBl8L1.webp', 1, NULL, '2026-01-28 22:27:51', '2026-01-28 22:27:51'),
(63, 3, '/storage/uploads/products/s1DNSQeuu9rh6t4tcoCcjnh5Cndldz6vLtFMJWua.jpg', 1, NULL, '2026-01-28 22:28:08', '2026-01-28 22:28:08'),
(64, 4, '/storage/uploads/products/SfdTXpTmb8kevdLHhlqsc2QLdKkZgG7UK6b3SUbf.webp', 1, NULL, '2026-01-28 22:28:26', '2026-01-28 22:28:26'),
(65, 5, '/storage/uploads/products/qZ4UARyqPMoM9byRWvAt9sFwSaNviggYcawebfZ5.jpg', 1, NULL, '2026-01-28 22:28:46', '2026-01-28 22:28:46'),
(66, 6, '/storage/uploads/products/Vb0DXUdLwImT8CqfjrIbddS2G7dtKgmVZbGpxpkh.jpg', 1, NULL, '2026-01-28 22:29:43', '2026-01-28 22:29:43'),
(67, 9, '/storage/uploads/products/qN4G0nlF5YSE8zXNVGfMpHDpLsWVNoudo6thuBeN.jpg', 1, NULL, '2026-01-28 22:30:24', '2026-01-28 22:30:24'),
(68, 10, '/storage/uploads/products/dPwTWKwhBUnRup0R7VIW1vD7wemUhqdPKQOXAJa8.jpg', 1, NULL, '2026-01-28 22:30:56', '2026-01-28 22:30:56'),
(69, 11, '/storage/uploads/products/OpUfZZFYNAEnDUVqwci6vCz7mjCbVyi4JkPtlNIM.jpg', 1, NULL, '2026-01-28 22:31:23', '2026-01-28 22:31:23'),
(70, 7, '/storage/uploads/products/65xZM3FZRg0BZL8zJv0YGaebuXj1H0mnrHFfUfuT.jpg', 1, NULL, '2026-01-28 22:31:36', '2026-01-28 22:31:36'),
(71, 8, '/storage/uploads/products/8VzsD3mW93VHOGX61HLipgkEqWqxAA1isEWrLWGA.jpg', 1, NULL, '2026-01-28 22:31:48', '2026-01-28 22:31:48'),
(72, 12, '/storage/uploads/products/IC0MpCmazpwyIEpRuRewk97m6YLMLwmvdSjm3TFA.webp', 1, NULL, '2026-01-28 22:32:05', '2026-01-28 22:32:05'),
(73, 12, '/storage/uploads/products/tNIXGn0KhRoMQrWhWFt4bgucDev2iIJa7S51Ggic.jpg', 0, NULL, '2026-01-28 22:32:05', '2026-01-28 22:32:05'),
(74, 12, '/storage/uploads/products/X0h1tqQulpVNUOFw22AdTO5QRm3S9ZOZVcPnK66a.jpg', 0, NULL, '2026-01-28 22:32:05', '2026-01-28 22:32:05'),
(75, 12, '/storage/uploads/products/mu0zOQioaPxyoyJgbFIIBvt2SpmsKQc1TzuVukE2.jpg', 0, NULL, '2026-01-28 22:32:05', '2026-01-28 22:32:05'),
(76, 13, '/storage/uploads/products/IhdMBJ2NoTGTg8nD1wCOIb7mLJUfh3i5ZCy39L8R.jpg', 1, NULL, '2026-01-28 22:32:19', '2026-01-28 22:32:19'),
(77, 13, '/storage/uploads/products/ChHbytcEpRqqBIgqGytrbwDFESIxL1QXzLre2Kwk.jpg', 0, NULL, '2026-01-28 22:32:19', '2026-01-28 22:32:19'),
(78, 13, '/storage/uploads/products/U1UYJ6APX3gFyFS61XmaWXEcsHkt3wnvGKfbgU3q.webp', 0, NULL, '2026-01-28 22:32:19', '2026-01-28 22:32:19'),
(79, 14, '/storage/uploads/products/QjlZDoX6T0F1kAJLcPzOmg8BMCRvZdUYWoq0YBOB.webp', 1, NULL, '2026-01-28 22:32:35', '2026-01-28 22:32:35'),
(80, 14, '/storage/uploads/products/H2WJFD2gD8u2QTIfZ5kmYAoPQYBvnTe2j9UGIMnh.jpg', 0, NULL, '2026-01-28 22:32:35', '2026-01-28 22:32:35'),
(81, 14, '/storage/uploads/products/upZZEVGjl80ic4RMf95kliM9Ddr831BXkJxHt0LQ.jpg', 0, NULL, '2026-01-28 22:32:35', '2026-01-28 22:32:35'),
(82, 15, '/storage/uploads/products/wT53KRabwGhyZUni1OL8Jjha9dvHZmj1j5CrKQAg.jpg', 1, NULL, '2026-01-28 22:32:53', '2026-01-28 22:32:53'),
(83, 15, '/storage/uploads/products/OBvVs0xUOHoHYypmDyTnSNHHqaq0WO68UQtzWb6w.jpg', 0, NULL, '2026-01-28 22:32:53', '2026-01-28 22:32:53'),
(84, 15, '/storage/uploads/products/SMvdPJTmGBiCtwrP4qimKbs9Q3QSYxDBsv1YmTzI.jpg', 0, NULL, '2026-01-28 22:32:53', '2026-01-28 22:32:53'),
(85, 15, '/storage/uploads/products/iih41j671zpfHX5zcc0pZUtaTyBw4A5R7h9rL8pO.jpg', 0, NULL, '2026-01-28 22:32:53', '2026-01-28 22:32:53'),
(86, 15, '/storage/uploads/products/HwTysDsE4e5pzBMENnAXGajfRq1F5dfDDCcl3j20.jpg', 0, NULL, '2026-01-28 22:32:53', '2026-01-28 22:32:53'),
(87, 16, '/storage/uploads/products/GbYcdMBDES4YwjHRKbL8FRVUg0esWmQa29Zdn9qN.jpg', 1, NULL, '2026-01-28 22:33:07', '2026-01-28 22:33:07'),
(88, 16, '/storage/uploads/products/hsyNH0P1p2IYivSTsrdJSJavP0SEBfyNAIfCd4OV.jpg', 0, NULL, '2026-01-28 22:33:07', '2026-01-28 22:33:07'),
(89, 16, '/storage/uploads/products/rHSlyhVmMKIJqhBpRosoxdM0wvt0mc8yHn7c82D5.jpg', 0, NULL, '2026-01-28 22:33:07', '2026-01-28 22:33:07'),
(90, 17, '/storage/uploads/products/biYeVWheQAbM3m3NtjzuDTCtIIh600m16kONIya2.jpg', 1, NULL, '2026-01-28 22:33:22', '2026-01-28 22:33:22'),
(91, 17, '/storage/uploads/products/UHJJxdY5yh6ED5r1IuSkiReNgDi3wvbmo4Ob8heK.jpg', 0, NULL, '2026-01-28 22:33:22', '2026-01-28 22:33:22'),
(92, 17, '/storage/uploads/products/4vO9SfprBaVyTgpaypnjkqEnN4bSLjz4I3FiAVLT.jpg', 0, NULL, '2026-01-28 22:33:22', '2026-01-28 22:33:22'),
(93, 18, '/storage/uploads/products/kxGkLXI9ryIc13fXz7VKjuXKoDeGzmyJCg7KzCtY.webp', 1, NULL, '2026-01-28 22:33:40', '2026-01-28 22:33:40'),
(94, 18, '/storage/uploads/products/uD4QOrcH6qnrldP1cHHAnIC05zXDD4kflpEUSECC.jpg', 0, NULL, '2026-01-28 22:33:40', '2026-01-28 22:33:40'),
(95, 18, '/storage/uploads/products/RdgJCzrjM6IMywnfX6PJlxaURzdnIzXyo3s9k70I.jpg', 0, NULL, '2026-01-28 22:33:40', '2026-01-28 22:33:40'),
(96, 19, '/storage/uploads/products/xxdPcfSt5T458wzSxMgUoTAfFvMnilRifj1cIwqb.jpg', 1, NULL, '2026-01-28 22:34:01', '2026-01-28 22:34:01'),
(97, 19, '/storage/uploads/products/gu0eCcl0OBjp2XPUmqiTd1x1G9gbPpzSdu1ochzz.jpg', 0, NULL, '2026-01-28 22:34:01', '2026-01-28 22:34:01'),
(98, 19, '/storage/uploads/products/jmAtPjbYW5iXJhmTLFlNEQ44SQFeIEErfpXtPVzb.webp', 0, NULL, '2026-01-28 22:34:01', '2026-01-28 22:34:01'),
(99, 19, '/storage/uploads/products/kkjx0FsLw8W9rBybh0uIPL2iOXD5cbWLle7oOoky.jpg', 0, NULL, '2026-01-28 22:34:01', '2026-01-28 22:34:01'),
(100, 20, '/storage/uploads/products/F86ZXNjaI3TbETi6ZXrZm1fjIFs15U3LnCXOAIcC.jpg', 1, NULL, '2026-01-28 22:34:17', '2026-01-28 22:34:17'),
(101, 20, '/storage/uploads/products/jODpk4fmAgAzNJWGFx7Fnkb6BH1ShVmzoBUYyVtz.jpg', 0, NULL, '2026-01-28 22:34:17', '2026-01-28 22:34:17'),
(102, 20, '/storage/uploads/products/fdKylB5WME3oYsjLv7hfNTvYi6MhNXeVRc9Ffyhp.jpg', 0, NULL, '2026-01-28 22:34:17', '2026-01-28 22:34:17'),
(103, 20, '/storage/uploads/products/gYAZxPZ4sn95aFTsVStNRXAy8Dw3ivC200KWn0Cd.jpg', 0, NULL, '2026-01-28 22:34:17', '2026-01-28 22:34:17'),
(104, 20, '/storage/uploads/products/vWokZc78Bn9eeB1zOXCTAad5qxuwoHR97HCQ4jQy.jpg', 0, NULL, '2026-01-28 22:34:17', '2026-01-28 22:34:17'),
(105, 20, '/storage/uploads/products/TJbGaVqc1olhfLujMDlsuI2hBKaLYOockS1eqWBz.jpg', 0, NULL, '2026-01-28 22:34:17', '2026-01-28 22:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `size_id` bigint(20) UNSIGNED DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `additional_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock_quantity` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variants`
--

INSERT INTO `product_variants` (`id`, `product_id`, `size_id`, `color`, `additional_price`, `stock_quantity`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 2, 'Green', 179.00, 77, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(2, 1, 3, 'Blue', 195.00, 31, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(3, 4, 3, 'Red', 68.00, 83, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(4, 5, 3, 'Blue', 177.00, 66, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(5, 5, 1, 'Blue', 146.00, 34, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(6, 1, 2, 'Blue', 161.00, 98, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(7, 4, 2, 'White', 184.00, 77, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(8, 1, 1, 'Red', 157.00, 87, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(9, 4, 3, 'Green', 131.00, 91, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(10, 2, 2, 'Red', 94.00, 24, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `product_id`, `rating`, `comment`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 1, 2, 4, 'This is a sample review number 5', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(10, 1, 1, 4, 'This is a sample review number 10', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0axlwkdvyFHNpkbCXwgPC65u9SpU4T47Nzzsel44', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3d1SXBQcm9TQmVLenoxdmZjNnN6dWlqRjNGZm9hanZpdENYQVdSQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297821),
('0BrThkHqHxohSAvM8HQXe6KHoeDTa0rAQFKJ3Lxc', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2NXQzh3WDlyUmVhbDJobFJld3BVcGlSNlVQcEZ2Q3lHRTdNQXZGeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297272),
('0D65wcj62JzAqdOOHKh6lBhnwPC9N1WyfwOrQgUr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzdWMTR2bHNsa2tNS21mcTIzTU1TT0JEN0g4RDdvNEJmeXdDaHVwWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299592),
('0fvsi53Rzk2yfJlsj6WZXTcJsDaAQmPOfdMvpa9t', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGpnRnRGeVo5TnVTUW12UGI4clZJTmlhSnNndGNnWkxBQTJWaXRGVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294321),
('0GviTwA6Z9oFNgMIQVjG0X8grk8eq2s5qTcdU6bh', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODZjRnprTFVuejFWeFZ5M2J3b3BreVdZeFJOMk03TUNzS2t0MmNRNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297387),
('0UbXMqyTirGtVkGASA8mTj5cGE4da4DHVmZRCocm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXVoemJYSlpTclBTbWptaVUycVJFVVp4RWNsYlpNTWM4YXNZU3U3WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298098),
('0WECTdSDfmT60R2Y20zc7k3LfY0aZ2yBhaWaTH7o', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicm94bHFJdDBNMTVvWXoxWjM0dk51UzlReFp3QWpzUmlmQVdoaWR6UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295261),
('0xrlY1AqJGIepXT0I29IDq6nlOqYkA1vTje8mYmQ', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1lZSm5wak5vYk9mNVlMMGdvRFRVYTZ5amdNOFk1S3JGZ0FyU3k0ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297240),
('15OfA9iv0CxkTtWHRjiUIM0SwGtSl5Sh5AGRJt1X', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieERuWklDbVhTNm51dFZUcEplb01PcHE1YzZ6VDF5UlQ4SDFvdEM0cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294165),
('18pKM4dlYJ5NkyzhXjbRfebaLTNTcU6uKIxweUDN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEhLOWJLZ0pUekc3SU56M0FOVWNLWUR1WEgybGhpQVNxdmZpb201NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297940),
('1AtuSVEU0nUnArJYLt1haDHboMPDCy99PGyEAvi7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVdLY0RmbEJUbGVJVzYxOHN6OFNmdHBPREZsQWZ1UFFsNEtLSTRQNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297949),
('1DQHdEzrLGMsr5wCd5dFQ8zQ3ZnxSoAqZwk2wn2z', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0N5N3RaTGY4QlV2NUZTaGd1NU9hZ05qV2xuajRLUndicnNManQwYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296479),
('1kdiYKQxBIZ2CFTSfmrkh4qo8npnNRzCw9EshON0', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXBVcEpueXNDYXZhendUZXhuZ1pFOTFTYVRQRFhxeTFuQzc0Y3ozaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297563),
('1u6ufrAsfqrMmu8TbjzxehBkXnL5sXz0ZOXQbiuQ', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaU5BMTdpcFlENW0yNnZqazg2YjUzN25nOWdjbGRZQXpnRDF3QUx0USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297260),
('1Z9wl1tBPoZm8nYGsHEfXcyVkDW19kICrfaHs8lh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.109.0 Chrome/142.0.7444.265 Electron/39.3.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0FVRWZjZDZGaEdyWVJ1cVAxUE5QZmQxQ093dlNNeWpDYndQbEJySyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770301316),
('1zIH2QBw3F6jXYyVuxuy8V5tA7MAHzKzIOH2WUCv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3VIeXFaUzd5WkZjY05qbXZhd2t3Qm1kbEwyRFcydjFCMnhQYVcweiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298478),
('2Ja7HWhbfRTpHBSzJd62yB5t1ihU2Iqzmidaybkg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXhucEtBOEJQZ1RVZ3A4bGxkWGE0ZXVRRUwwWGNIblRaYTU5UlFjSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299591),
('2JSibOT5FyGBRE7mGXOz8We4kOR8lytKTusW6lDY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHgyU2Q0bEdPS1hqT3lDcVNSTGtqRW1UdkIzNWMxeXZEM21mYXVMOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298787),
('2Ks2odx4EnGg0CITtBVbxa5serRsHLw4sYdt45ZG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHdYdE5NUzFaQURlWFdPSlYwMW1CTHJnbGt6ak94RFhWMXA4TEJabiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299827),
('2LUYtexlhG0onjhiOckkqXvFhQfP63XPToUlSS4b', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTFKWGl0ZEMwMk1kVzJYSlVYSktmTkdBcURZOUdBalVaQWFVdkl5UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdXNlcnM/cGFnZT0xJnBlcl9wYWdlPTEwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295339),
('2mdVP5Q4cCTKAUHB60m1mF8Us70QlGKzQP8g3mu7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWhYTklHb1VneEFVRlhGMnlwUE9UNGxGVFE5TFRTcjJoRVBQSWVTQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294179),
('2mo1z57mgrebU00NJRKFiRP8OkUzp7GSS1pCCcXc', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXFoQklCQVFBZHpDSVVUb3pmT2Y5NHg0ZVBKZ1pBOU1zdXd6aFRwRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298569),
('2ndYeYxvVNlC9bQoL01fwP1hSrQDk785GURjFFhm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTW14aFhiNkdaMXo5RTU0bkZ4OXhBNnRZNlVaVWlEUzU0cExMMlRsYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294185),
('2r2UZttAJaMN9aJIh33lXylUYrKrbxmwlneP2PgB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQld1UlI1eFFUQTgzNFVuUmh6aGs2UVh0VmVuTm1qeEF3RWlMZmN6dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770300102),
('2zdfM0cuEtMxtibDFAAobAXAj0F4vFfhw1BkfF15', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1Jsa2w5RmFyaUk5YnVudm1qMlVMVkJDaUYyTUF2alBtUGVzTW53bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294320),
('39EFRvQuIubhTJWhYnzj7Z6Kk8zNT9ZBPVwK9o0m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3p5UFpRUkpWdDhGT3VucWtVUUdLOXlqVE1qV2JlRmZSOHpwQ0lZSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299815),
('3Dd2cWAnBLmHmSgAEFlpBd9jniTq3DAe8LhI0BUs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamhydzVNQ1l0SndTRmM2WUl3VWE2RjE1ZkZ3bDJCWGF2U1pxYlc4NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299781),
('3G0v76ShfLeCib9XeK9srjBABcZOL4DYCS4D8E3M', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU00Q28wUmVsdUJHVFFmWFIzZTVBcVBWaXpFTWRINHV0QnVOdzI3RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298822),
('3hGHfQ79sip1w7l2O2BW8wizBJbYYVC0BSwZxSMb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXBFcDNxM3lyS2xEN0Y5dzVrbEg4TjRXNEgwMERPZXo2VG1jQkUydCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298480),
('3hRobwJUhfyNTPis4NDACKeEhbRArBPlPaoYF9c4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTNqV1FSaDlpekFpSFJ2M0pTNkllNXdqSWg2N1hJRHJZbTBJQ3M1ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298307),
('3RJiuQJ9U4BNLkOlsu7L2iIDKnSz7zsGPlP48xNm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibk5uOW9pWGljWG5TM0ZHMEJSalhyWFhiSHZoU2c0QjdjaGhOdkdOWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295266),
('43v3bSkbNR52aqotEE8Ajap1uw96uNpEzimiU1sK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWY1UWpLYjJqbHczWDY0YmZNMk50QnNoMzRBSWtSODRxdEJwdlM2eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297932),
('43XjGPRHyhol1Q6ScemlzpQb2ICYkjCUgahOleW7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGt4VDEyOXVIck5kQTJmVW5zUkQ4RmpiWlRCVHdNWGZ6M1lQZFRaZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297816),
('4FqVhVVGcCMYEmfQlIdsVHKwY5VUlUjn6EUKeDjj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHhxbWhyYzdCd2tqclJwWE80T21JWUdEc2M4WmV3OG1rMnFvdXRpOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298806),
('4iLfI6hAW49BfzuwpLPtcDK4cnXUdwnhr5cS9xnq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVldtZGFTekpkQlBxbHVMSUh1b0dJbGtUTmdMejlzR3lXTFVDdXl0biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294288),
('4KWdweAej7zQ0SOB9nFGW3arzMCg876c0JGr9SNs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0pFU20wYzlPdzJ3M1Y3cEd6aXBsc3MzOEtlUVFHeW1jakdSbkxtViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299727),
('4mGrGhfHGBJvIrSnNB5Dfw3DzVOfVklaOaOUUvsf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnFNcDFjT3dyTUNTZzFWTjJobnpYWDJYR3ZtaHhldXZXNURaOGdxVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297834),
('4tudLH0AoH6eMBkjR5ksikh9QAmHvOWCinueQfiD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFpxR3E5UWtkVEFwRFU4eUpKamEwNmI4YTl0eVJOVTZlM0JEbkNjbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294289),
('4v33OGszSKcmPs12xXaWn8tWbO4reS2pe5PMdDLa', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkxRRWREMVU4UE9EUk9TM01VUllmdXp6T09EMjBCQjhCTkdDZktGMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvb3JkZXItc2hpcHBpbmdzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295377),
('4y7MOUgbaoYc273Sj0fvdvZbK6QrHOs9cgn5qLDC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTZVcnI2SHp2cVNyZ24yWWNTNmFZSWptb25uekd3c2N2R2ZtVHJoVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299832),
('50pjZKPR10XUMLEg82qTXU5afdkqpsl6y4sMfbuX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTlFellSQU1ZVTZPRUllQ3BrT0JRQ0lDR24zYTFsMlRDSWhEdUpRUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299597),
('53T4LPcbucTiIn6kaIjzmsVINXQhIjxgFYm0686A', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUltbEJFeDN3NGh4ZmVVVTVlaFRoQUZsYkZMS3piVEd2VGpaODc2cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295267),
('5aJqbA5THqiYg71vGNOZncm1ZbomJowiWZ97l60d', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHU1UWRNUEhRS0dvU1VBRWlmamlJWVdQNVRZQ3BsS1hSV3JVb3pzRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298568),
('5bTYUiilUAiSkyc1tRDSxQIRwL1zgpmZRrR8dR0Q', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZmU3dGRwbGx3aEdYUTA2SGFRMDYwcXViOHhmTENsOUtndEZDaG90bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297844),
('5EnwE3Ny5HlzH0ZnslfvbbKAFzinhu9JL9Z3sUZt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkZ6b3lhaU9hYXZzZ3psOE1jc1pzZnhRTVhVSVMyaGJzOE9hVHBpbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294320),
('5klT6HBufLC1JCcoIxA6SqZmFusK5hw2OWnJHsYJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjB2bjdUZ3pQdnMySFhTd3BWQk9Dc1M3Z0VZQ2V2WGZoTnFFdVNRbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297936),
('5kUqBeQWuHwwPi4Gbq1Y4gIkMe1VcWckK1n8fyHA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicktTVVNUcm1aZ1FGa01VbjdHZW9qMmhMQmhBMzJWdW94VDR2N3RwRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297943),
('5oJiFIc7AZL0tdFufbvkc93CXfveTIOsdqSQxg10', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXoyYmpkdHd0Ym4ySENJUjJtejlTTlVweW9wNDA3QTFUR0hDRWZUbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298478),
('5scnCc6tz1bE80MgnMzWjawFL9S4L5islJiz4TQ8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielBpMnRoNFFoekptZ1ZoSzM2Q1lYWlp4ekVVczE5RGRQdExhdHBnSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298821),
('5UbW2hR7vTSfwk2xHiarLQaaS0ApSPJzVfx3DXKZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzNVZlhpT0RzRkF2UWJnQnNwMUtnTUt5WGVEUXJiS3pmcFVZcVNxayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299857),
('5WqYt742EYQ0SnVeMRL0E3qckweZ87KeYyvSywQO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnY4N0hyV0xaUmdYWEd0YjFaS0R1cjNyeUlLTlpLSzRZVWF3WE5QaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298811),
('65hBbepwLAVq8w8KXIdjiVO3Bh0uu94hXy4dEKSb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkFoY1hUalZrS3B6aXpSb3JValE5YW14QURHVUxXRDNrRGpmMHVBZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298097),
('694nTH3A6LWkD14Og35P0hlq7ZmENFZlPu4efPo8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEh4V2RRNjJWc2p5bjFZY0o2cUZMR1hVaHZCOEdCd3RiVjRsT290RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299492),
('69QElaFmCvNKiz5qks18FbVhvZ2yvyZQmER98nu6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHpRcEV1VFlBZlU5NTMzVVB3MXAyVU9HcWNISG52QWxJT0lBQlZzZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299797),
('6e6biVhzPGBFHSH3PXC73YIqLGYIpVriLhPVGr5Z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXJ3T2ZPMGVuUjc4aHllbkVMU1FNTmVabU5pNkRueXFkVFJlaTdGeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298810),
('6Rs0tPqB4vpDRNIG8xFDORbaikexFvg3W7Yj3oBA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXNlNVB3MDZQZm83eHBKNHV1eDJ2N0JuQkxidm5icTY3cndvUmN0dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299594),
('6ZRQvQgmZsmVHiWLv4AbBvB4rWN361Nt2Tk1j6Qp', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUZ4QWZWODM5SENWUjhORXJtR29XQjBzRDZQR0V0aklud05GVTBSeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbm90aWZpY2F0aW9ucz9wYWdlPTEmcGVyX3BhZ2U9MTAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295286),
('77pxjLSwjHqIZT5NHUheb6YIDxoPHFcpBNVrxkJO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnVqOGhKYzlQbXliM0Z4Y3Y4c0c1WFVoeXRJWXZQMHpDQkNsN1pVZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298794),
('7aM9bBTXju7bOLcbnTx3XIERcPNoW5JLfDsl5aPF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0FRNXI3MjhYMDY5S2ttSlhrMmpTN2ZBVzhXcnJJSlRjbENNTEg0WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770300102),
('7dZqjjX9GqsmQBZon9VghJNncLVAKnkLug3FRw9p', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidExEMnBqZGlhZkFaNHFWMmpzZERtbkNBTGtXcW5aS0d3aDZDS0RtZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299592),
('7IHmJHLIxRnDTLQZMQgwmJSLhHuB5aQmkCHMwUcp', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnRRemI3Tm1vVnoxMGZiZnVhSkNFbEhzM0JpYmV4SGtrN2RsV3FtdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297036),
('7kjYrifqWv3fIbsTqDPHMGT0iXTNwW1IuZdSVRH4', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFpUZG5yRWNIU2lrZE9uVzVxM1dpdTJ4bHhqNjlzbDRKWW9SSlUzZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvb3JkZXItc2hpcHBpbmdzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295377),
('7L9eL5OJZUlvu2qzz7ypTLKTbt2e364Vetc0QuKO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3dTV0tqY1JYcTBVWVRPRlVLWTdFUGRITXBDc3pRRFpTVHlYUXI4dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299729),
('7Ljkq4wTu8L3YNY5y0jVr1isYGN9Y4c54LLa1rBo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVE1RTNxbkJGd0lYa0lTeHVkaTBOVktheDlmN1VWY0V5ajJMQ292diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298569),
('7NIwyI08MonmMQGjQv0R7di2RH2O5vxEcf1EJ6Ik', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3J1aTBqVkhXeDZpUkZkMERMN3pUWExsVXpUdnpBR2djMmhFSlhsTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295426),
('7t4uRsUodW0bjWBMk9Mbcjcyd9N7TsKf5DVBp9UR', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHR1b1JPcDl1MlNESjY3SHoyMDdVc3VEZUFsMm9uTmlDQTRkZkZvaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL3JlcG9ydHM/ZW5kX2RhdGU9MjAyNi0wMi0wNSZzdGFydF9kYXRlPTIwMjYtMDEtMDYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295326),
('7YALKhkaziVv4fosUl84PeqDq0DOeA5xUI2tNHuw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiem1PZnBBbTFpTUNYTjhQOFZ5SzVSRG5oNWplNVdQdVo4dHJscWtOVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299852),
('7ZwDwbOqih6hU0eYCP3t6aABDiDnVhVY7r8EplxV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWZnWTdPUkh0aVJUY01rYTFoV1JHUEx4a3ZPRlFmbVpPM1VCbDBqaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298804),
('8Az5UsxHMbBHF43wUqSLeRQseH5NYhuvR3yUs90u', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN25pMXg3aFlHdlBXSEZOUHd2eE1wSWFmOHI3b3pVdDBia2ZhdXM4SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294306),
('8fd8VijYd07B0YGlsA42dTsbkDFYlMpx2oVFGHU1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDdjejZMcjJScEtrcGEzNmxHZWJCRndCMWdmVGxwTEdNaGdJUkV5TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHM/cGFnZT0xJnBlcl9wYWdlPTEwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295384),
('8gxyvj5Ale3dfLOVjtfIdRo0dAemHHHZQ5SivhfB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzk0MWVNTjFHUkF1Z290aDNrbjc5dzNyMlFoREdBaHp2WkVScWlUaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297828),
('8LjQXMSxqf0juwCygd7vsUYU3mO0OY6nEl2udhEJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTFYaUtyR0Flc2NzaThKaXRmcTFjdlpPTmVDclV0RG9uUlhhZ3ZHQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299782),
('8LNSRvUPGbBosGrjOrwJT3VqtnEUbo35hT47qmlM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlhncFpjMTVPVUxJZW81VW5RVlBnRUJkd0o3MzB6SWhtRDRMWWRDdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294291),
('8MqxWgG1Qlf7r8IOynp9ivPYZZyoRwUhjHs6rSk3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTB3dDdMcElSZllqS2R5T1dpZDlRc0JKamhLMnhSZ2ZxMVhqTTBIQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299833),
('8RAUni50aqV1Wlu2sYeGlA9c1Ce1NabekD6mIodq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1BiN1YxUFZnOFVUd1lTUVNYMzRQNHNaUWJ4TFl0WG43T2JVcGplbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298101),
('8RGvHT5dFgsJQTiNCrXP55LaDM67kdzze0UhYSgB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGdzb2diRmNDMVNqelVrZlQzRjZOWlpqcnRzWURmTXM5ejVqVVFhMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294291),
('8t4RU7q2S7DJwLyWQIA6xLA8DZh92zoJCTMaT0ZI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkxlUXA1YVVDd05WRER3SE44ZnJ1d0NScmhORmRYTFBYOFVpbXZsUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294165),
('8wKqYie3t13ohEV1iL1ed2bsmePWrihPWbZEJb0J', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWduSHhwaXRzeWhETjZhZm01OUZMWGk3ZlREVWE4ajZSU3VIUVMyOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296451),
('8x80nYIyMGYWT8Tnmh5o1bQP92BpotkpA6mWzHKN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRU5aalROcHJXUUsyZWFDNTZrbWs2MDh5Z1B0blZ6QjNLR21WT29UWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295276),
('8y07AGQsARiXExZenVwxy0wMgHDj5XZxHM4h87Ej', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGh0bmQ5WlR1NGhZT01lOWdpZGpSMFhlODBiRmdwTENaa2NPdXFsRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298819),
('8ZJL0Uob9BzOWb9s3P8j0Y1dxbER3F2XxQRl3Tap', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHdSb2tKOTBxQXpWNHlFVER5MFVVYkxiem9uMmxXNUtNMjdmQThwaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297942),
('90JRPngRwHpcyH0EZVutDU1nV4nICPchBxEY0w3H', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjVWREpTQXJ4ZThJRjRvdmFpdGhEVWlxT1F6aFl0OUgxdDNLeGJaNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297105),
('9EGzqNIcbU7kG2WEHn7aiKM4jlVDoPdQ4MYV209I', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkFoUVNpVjhBZ3lEekdJVDUydjhnMzFxQTBDRGtydmloWVNVNVpRNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298583),
('9gOgr0Dt38l1JMmiAwDKrrkKQSAzNG2Bv7YcKQdJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUc0MTJ5VFhFYjV6TmVQalpJRWptTmx4MFAxNVNaZ1R4Zk1QRVZ6dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294295),
('9hstJFVkiSTPcl7TsRPMQTh7KB4Pz5OEPXhesL5Z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY3F0eDloUWxPb1dOMXI5MGpzTkY5SU5oNVU0WWw1Q3Z3dElBVE9BRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294290),
('9jsAjP7uKU6lR7bLXDG4XVexi4io8X8bC2SCUIw0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1lZazh4aUZWV3JhU01NYUdEaE5la2thdkVHaFJ6NTlNaU42M0Y4NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294295),
('9nVkQ5JFdRvO5xcctqbdIWVv6RCpRzgs0n09FEpE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.109.0 Chrome/142.0.7444.265 Electron/39.3.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1NEalpYRmRxWm8wV29DVjlUS0tSMlQ0NUp0N2NCZzJENnFqbkZ1SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770301309),
('9oHorKncMq6MvhGGqd41YKJYAeDgLabado42g42z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaE54Z0lVRVZLSGdld215SFAwY2h4bkdoUXA0RUdqaGFpMDNHV0Q5eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298941),
('9rOrQMVeDrW1ioB5RbQraf7SKjqlrbyxSQfTTJua', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWVWREZmSTE3T0tPQktweGhZUklza2NVRGE1U1liN1dUbDNRdElvRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299849),
('9TLxj3NY1cPSf9uC9U5tPZuLUzhRpF3GA702Rhlu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU09FVjhkOUxHYkZXZ21GaUcyVDJsc1MxWXkzV3VFM1loT2swbHdNbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299753),
('9w5TAfD4PRWvQxydLo5i5M1RddG8IqbazQFfVYrJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialUwR0NpV0dmaXBpQ2ZLZXZtdnVuWjVWeERhU0JWNDMxMWw3NHVLWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297845),
('a3NcEQYbx1P3dQvtU0a30SIgkAMviRzoRMKAc4jK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWW1Hb054WUNpaVpVMVplUmJOWndRUzB0MWFTbVhtdnVKRDdSWnpLTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvMiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294196),
('A5EHAOIZkpp08O5XWupEOPMgUevE1xOXr7ylLlpz', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjBtTWJNdXdudXFkTGpxN1N3a0s3OUVqc2NCQVJTdFY5azdDUnRVRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297809),
('Aa6UkGQKJdviSlAzWfu0XyAfG5OXEZGDcpQL7SUp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0lXSDZlTWQ4bkNJanprZGt2Q0VnRThZcXlqSHhheXVwckJ1R2FyVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770297940),
('aAf4tUoMiI6lbW7Be6PC2RMM2GkZo3iunJs76LgF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.109.0 Chrome/142.0.7444.265 Electron/39.3.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkRybkZBVFh4VnZ2ejQzaFNac3NXcjk0MGdKS2dVQWRqYmtOVGVpbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770301317),
('aEOvv5jOj2L5EiEeB0dhrK9G7ontuzHScJlc715t', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1lKUUFpdDlMOU51amRvdk9IQUxFeWRuSGZUT3JVM2JyZnBEdnN0eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299691),
('afBD30mE2zQS59UJ455IvPSAC2GZGl4QgbtP1BTi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEx6dE50RXROWm5YdjhKb3Nrdkp0NURtTVJTaWxadnNOa2YzRHdsMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299796),
('AhFaVJPg0u6hvtz3i6p48HAGneel053E0PUte9j8', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1hGT2syTlJ4QVpsWTZBMktLNEFvTlBFQXdvUTJVRlBrdldXeWdodiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295059),
('AjfAuQf9mvfA9ISqwoaIy5rt5mfWM2PmT1f7xrmp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1I5MmZWY0hyNDYzUmtUb3BLZ205RURXSjJzNGdPQjJ4OUxBcGFLUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294306),
('AJzaw0u9xNQ2EkXqidAWqQH7dpsZ9dpW0cfItGh6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczhoQTlMaE1Kb0FEOExrbUpWdlBKZjZaM3VLMFVneVVPUkNUZEtjTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294306),
('Alskx2ErmO8ytdFErcCIYJkqXcwyWu9CMrzfks4V', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielBUM0ViUTZsVlVIeFVQd28zRmFBQnE2emdFRnBTYng1QThBckU4OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299815),
('AnL5b07WAp632iagjp1GGLLDlRHrgxeWBhSUvOng', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaG5oQVVzZWlDbmR3bXdiOXROQk1BSkhQNGpyVUlMTjFsdDhhVVd5MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdXNlci9wcm9maWxlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770296979),
('ANPtI9DvJdT8PjJEcQgTF7I1DRDX6eBuChwxDoJI', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTRiTzNMNkNGZDlLOW04SnUyWXl5SExuQXhKSG42dDhYVExrdVJadiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297359),
('Aope9seraFflYDts8MJp9KlmdfiEdUhD0OxIOmVV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVRsV2k0QXBhN1BWQXBQQThlV0xZV29sbk10MFBCaUtVajVnZzNTcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295268),
('ASJuW6CqwhtYViAITSSALX1xDa1FWeTUR4NFpnTQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTU85QUhvTXFvSUVlVHFNWXRpSG9TM1JqMjFaN1BTSnVvY2I1UjZxYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297842),
('aSTY1AeFrNs1dVZeaxMJLJXjvdp6zXNxwkL3tafm', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaklXdndMU2ZIMExqdDFlcW9vNVJTREhieGUxWkFiRlBtQ2pNYnZLZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297554),
('aURXzTqNeBXZKgSLSHSQWkEBItlRxvcKzmcXX0KM', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnUyUGZ6a0pVMFVyaU0zYVNSeHRPcVJsYUtiR0hBUjZqWkpNTG9mViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvb3JkZXJzP3BhZ2U9MSZwZXJfcGFnZT0xMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295369),
('AuXBuWHqMK1xlMIEOlnHdShSvF9LgzMW1nL8xLAZ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUhvYU1EN1B6M3g5S3hPNUloY2VYNTNOWXoyWWlvSVA0VjNnencxbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGF5bWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295360),
('AWZcvPaILR5v6vHRhDxWf469q6YGSQAKCcheQaPD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWxGYkhVZ0VqWk43THhaekIwQ2R1WG5Gb2lkVkFzQWRicUlrTnBpcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299852),
('Ax3Kp7WUXtR5P7HxREcCbohJHI1QAtQWTM8QNCu6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXFKYTQ4UkJqUTB3ZVRoY2NyRVR6dU92VDVMR0N0OEphV2pPRFFLRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298582),
('aXDAKff3BwbMhZppE2ppHqSAKS2qHImx7gD5yUme', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWlSWlljUXVsNnNaalI3TFl5TVhvcWxRYTZPUjBibWtocndUa2ZNciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770297940),
('AxqnyRFeNPd9ZgEMW0bLHLu8oPUUxIze5yNCcLgD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicG9Ca0xnbHk5d2pDODViTFllTm5wVXZ2MUpqOGJCZEJZU2VWNEZrRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294286),
('AZUhsNqSzd9dXla3GxzsdQGC5IxCRsznWnm9e99U', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlZxWjFKUzdyV1YwcUd0am4yNmVacUNoT1JycmN6aHRDbWdncHo2ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294171),
('AzzzR9wiNQ8PfhXpSeUvTEXv9JtluTjCpiBrBQRm', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGR1SkdOSVcyUERVTG1MOWdwN2tqZkxoRXlaa0M5SzdTMTloTnJvMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdHJhbnNhY3Rpb25zP3BhZ2U9MSZwZXJfcGFnZT0xMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295363),
('b12pFQrfUuiFA89JPHWgFP0psvbRDT6lVC1Nlhcp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidXh6UGVHdkMwUWJkMEphZ2VWb0FKR01uVGlmcldGYlBxSldRWUZybSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298092);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('B1EqcVV8I1AjNKaFaxcy6XdfmhLmW6oMfFQgTxq9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienptdUdMSjRja1puRWJjQUFHb3k0amZPYkFLdzdvOUtjY1BmVzEyYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295276),
('b2kRzp0x25Cv9AxHaOUS0YhbBRGbcmif4hxrdnl7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVdTMmpSWVhROWJRUVVNOTFYMkQ4TzNQWWY1OU9CbnFUdjhCMFhmeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295427),
('B2LQL7oLZTUUoBEjbyMxcBsm07mXadfZcT9byI4X', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUdlVkJvRUZuRXpEdHdpRFdRYmZpVDZwdFNZbVNxVVRFa2JGWmhXbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299727),
('b7fkQvmyGB6qL1neyLTLSodWnchAwLjzCm9w7opZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTJUVTRYd0FFUnhNemRzakFmZzM3eWtTV203ZTdyNzZrUDJha21taiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770297834),
('Bax46CYtEKKvFZQNWaHapsrAMNdY1yzaCn4o9MID', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS25UdEJFeVlzakllSUFGMlUzalI1YTA2MDJ1cFVVMnlwdkNPVERyUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL3JlcG9ydHM/ZW5kX2RhdGU9MjAyNi0wMi0wNSZzdGFydF9kYXRlPTIwMjYtMDEtMDYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295326),
('baXQmCILjePH62XOT8gLmriVr9Rono9gMXX6eLlo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWxLc3RRVlJZektVN3BDTkVsRVNXaWNEdEpnU3FiREVsVjlKdDhoVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297940),
('bBhxX7WBNCbTJnv0laXJxgwr2iJz2mmaREPvyLzY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmc1and2a0hDYXE1RHRZcGt2R1I4UGk3MUV4WUhBcm5DV2VvSklkdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297833),
('bEUsdux4pkpAuFhxafpcXdYu1RBQtdfXf0dMvwI7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3k2SldDZmZoRHFOa3g2ak9UR3IyTW1Icmo5OTQySFJ1SGF5M25LaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298794),
('BewShTr4wuAl9095lRCxjruOuzePaaiUBm7i1WqF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjRsbWNLSk44NUhjdUo3SlJDcHkya0xhaTVTcWo2bFBjMUxJVmFOaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298307),
('BGI8haEN9OqyOqDjWrGZgdRNHyrt8bF8XD9qDEwI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFE2bEs0dXZGYlV6YUpYWW54ZG1McnVOZnJ4d0JzUEROUjBPcFlxVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295425),
('bHs46wcP80NvpzUuAEZdwQIS5ElrzxSLFeG32nxv', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1FRQzlyaVUzeVN4ejJ2WXRqVEkyQVVvZTlxMjZIVFpaeHI1aUhiYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2V0dGluZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294355),
('BIrAGPDhnXiLyzQ6combOeRSDHvccWoiDI1Shu9K', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkhPUmNQWGYydUU1U08wTXZrbEZac05PV1l2VXJ1cGNvZXFBYldLUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298775),
('BiXyd1o0qh4oGhK2CxTbNdWGvsmXbnSzSvcMO82h', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.109.0 Chrome/142.0.7444.265 Electron/39.3.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmh4STZHNHBYWll0ZGk4eGVwOUg1YUIxeGdVYjVaR3dIQmJGcVd1NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770301309),
('BkqeuUcO03VByFe1L4wEgw9kQRCUW8MfjGDVc0DA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0xkUUpHb2RtSFhlcjhtT1ZJNGE2N2FocUtuamIwSGE4eFZoalZWUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297941),
('BMEkqHnWjChIk80WOFgI7OAeuQoxgPrHnqeeTrwn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDR4QkpkMmh1SThzTzFqR3RZTzhkdUl5a2tiVVMxMG9qaElZSmJJRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298811),
('bmXZi1aOusQ4yVikAwrPJHCe8t55hq69xRO1UOAN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWJod3Q2dlFFekpJNm1ibzdXeFhBNldORUgzdjVyeXhYd2Y4RTJkOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294307),
('bNtlVUgNfs9uqdoQFa8esxpVqOU2AjjLp026Ogvd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0NYME9wQ3V0anBGU3JYR0xsVVRRZkNuMDdLeXhIT1Bpd2lZVmFMcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295266),
('bOvyZeSZMOx9rKK1X9NIkfvxODHe2eJ74XoRBK4c', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmpRUlhyNEczVGdyTWpSOTZBQURpUzVmTW5lZWFuSUh6aEp6V080QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297828),
('bpfUP5OThHzh2f27Fk8WNjtKy3DGDKqoEIry0W0P', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1FnNTF6T2hleUhwNjhFSXAzU0FXWXU2eDM0NWNBZk1VNDZNTUE1WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298807),
('BpqCzfS6szGBWnbP71FunagwECqR4XuhrPF0Gmy2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickZqelhCTm9SSWt5QVFsUUlUS1VTRlRQRFppYmJtV293aGJMbDdBZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298820),
('BpxPlWUzI8OxqXooPVkIuMtOEhITZD0JPmPTJCzI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUViTzdnN3M2cDJ5cVJ6c1FnZHZNTk9jdW5Bd3FuN3pKV0pzb01DZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295442),
('BqQpPpZ0lC6VEnbUvTWC59No34nhRsYOgQbceafq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTF5UHU3QjZub2Jhb3lnTUtPeVYwSzdlcDlyRFlWVFNRaFFQaXBHcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299822),
('BRJ7tKKumtldcrsr6vmOQPEGw3Up27wEebsBXhey', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiektreUo0V3FIQVE5RVlNSWU4dno4YlMzOUwyb0pZeFNDVEk0YzBjNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297300),
('BRxvjFsKrUi8tVDtjVNCTJCw9N2rdqM8OZ2mtlm9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU45OFpKTVpFMW8zQ3JLamJPd0NuZ2w4OXNhVGkzY0pFVkxZTUFtayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298083),
('BS5dwOjg6ASckrtKIshydmdmGWuxDZu7HzxmbBDW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3ZURndjV2JRZkVXVThGZ3Z4SFpkc3FibFlONUJTcjZtTnVlU3RWWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298083),
('bs7HHORZszImNcSGWrfsQp25wV3Js7itvssO32kx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1Z2TmtocXQ2SW1wS1pWa0NjeE5UeGF6QzVuelRBQUtmdjNaQ3BxRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299829),
('bVAVBF2hF1O7EFSVMIqEIFZKQRzYlOkV7pEoCQjE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjd2dTF5VTRvNHpwcUg3NERRcUJNWDdYazYyejhaOXhJeklZaTkwWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299756),
('BW7WfwaEpqQc9B0GyQES6ziTnRfLZJlDts43EjMO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0xSc2dhenk1OVVpVGpFZTl4dFhFVE9td01hM1ZRcVh4aFBUOWFUZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294189),
('bymcz3UQmcrcs3lLzh3S01mHV3jlzPVoHWRL3lwc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1N0UmllRXFEa1N3d3JseURyeTF6OGpaMUsxelN1NFc2a3V6Z21PbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298787),
('bZGZpNbJZoClrPHaciIy4LjtHQ6xnUGw4oDZorJ3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3ZtTUJDZENvZEVkQ1M5RUZTR2FzU0phc2hKRkxHb2M1SUFKYzdsTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294166),
('c0HsV0q7ijcIEA3jZo9sXsNdwOZDSt4e7itKOTS8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkVibldNdWlEUEYyUDB6VVZ3TXdGcTRTUlg1OG1DSDVJSTVraTYxciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295443),
('cBHlz4mvsBCisQ9iM8qTJKRnXThNBFTtH2EBEOMO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialpWWEFQOHhTSFkzOXJZdFhpNXJ2cGFLc3QybXB1Q2JRRHZCb05XUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299757),
('cCYlBnorP3xxpXZ7Qjtn2f15GIRnxf2qn9WlKpAk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnNNYnROQ1NDd2ZEbXRNeVNHQ1JJMmptYUxvdnJOMDBYeEtwZ3VVSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299831),
('cDdHGcJN4MGyD1zxhsS8vgU9k3c1F6bLZtN6pvTa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXlQUk44dlQ5bnBraFhObzdJM1liU0YwcFEwUnYxVEZBdjQ2VjdKVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295262),
('cdt3aF89wgrkje00V2LxtplKXjJj2ukOKuLp4Z23', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHk2dU9wdlY1OHp0UURSMTNQd1c4WXVpRXVYMWVFM2xqVm5wRmxBZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298480),
('CF0QTMmknLT6he9UWJeTzk8ZJB7nvoDSV5vvMPWZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEFrMEVlZURLYXF2TE9lclpEWUJMTFlXcDF1cGFZRWdGQWFHVWdJayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298583),
('CFAgDFJJwJiTQFRnDO1CnGENmDpMs9ugRF2QtpL4', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG16UEl1YW93TkJwM0t5V2lEeDFrQVY0WUloT3lUVEw4QW1ySzR3ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9wYWdlPTEmcGVyX3BhZ2U9MTAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295337),
('CGdha51UAK6eC24hUuyFy0HJgNE9C6EwYT6UI8a3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.109.0 Chrome/142.0.7444.265 Electron/39.3.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMW5hTHlkNHpsaVdiSDRCYzFpTVFBZGhyWGVCWTZXVHF6RGc5VjQ3TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770301309),
('cPrsKysKi0czovFBLBWHHFVlbxrlBCb3bbUxHKAb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTY5eU5Fd2ZSQkpkd3V4UDdOSjB2SjhhREdGQnZQckRvbDZSdm02TiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298064),
('CtoO4EfuKYZbX2Y3iGIv6cx4hqFtMvpoS1kz3m8a', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRklzS0ZaeEhtU1Zqd2duVzVhQnJOaktzcUt4TVNPamFpVkZqd3pXQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294175),
('CXno00EA7Iwo3wLJxhFq2qkmr72Gv8guvN13Ofkq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVNpVmY4NjNOZXBWR3lIR1FCOXhkOEFwMEdJNFdWNTdxWVRYTVZMNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770293336),
('D1vYNYcwJwuIPVWfR2NLMVdZKqZslvoXZKZH45OT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTRpRmdGWEU0NVlXQWlEa0V5TGk4UG9Ub29UWXcyNXI2cWdYeFp5YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294318),
('d2EAPBIMjKjjGJtKq2vclnNhboM2MG4zCzfiXwLI', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickpXOEdHSGpXZVVVOHF1djNwRW1WU2hWbENONVY1Z08yd1JJVnJPZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297095),
('D8F1trNrT2Gdtt0j49pSPBvkSiExqzPLNX6OQNlc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjh2MjlQMm10a2JraVZaVnE0Yjc1ZVlWVk5BVmUyTHlvWHozQ3piZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297822),
('dCNlpkEGtu71u95T2uR4CzCHcEtxAptSdtclPImQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0xuMlBieFpNSGNldlc3TjFxMUZobThHa0JIemx1bWZwVDhTVDNwTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295261),
('dFG4USYCPPtDoaHVXQHX9euxDiSj2G0XzF6AYWvk', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2hPTU1LT2s2YkxCN1VYc25KVjd1RXBRb2FlWmtnVjIzVGFGNk9hNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297063),
('dgONVzhI205YnoNIMV1ASl5lthLeCGj0nm0AQnNV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZU51UDJkV3RXdVpvUmZjbHI0TkU3MkYxZjk2RWhEczh1ZUh2Q2VLcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298091),
('dhzSHH5KBgR9RNXmwbsiEEHazDpA489WBPugavaO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUtpTlBsVEJxRmxNN0NxcUhEV0FCVW5oVVB4RWNRMjJ1ZXBBaU5xeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298819),
('dIaswjqp5nihUz5ur9VALV4QnvfhNkmdr1j0Wtk6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQld5NDdhQ08zWGs5bkNnVjdYbFpWOHY4UnRWQmlyQXI4MkRYNENkQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295383),
('diomxK7mSB9aQlczaWbyB0UiqaFaMbk2Zmp9HY0m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzZwYldjMkdsQW4yNWZHRnk1WUxNcUdWSWFTRGFTTVhOMXFvT0pweCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHM/cGFnZT0xJnBlcl9wYWdlPTEwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295384),
('DiXRt6V76mPGEZ3SdmHULLHQt7l64cfMPxq0gDXO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTd0MmhGQlp5UlhMUEVUVXIwcWR0cTdCM1luOTN5ekxWODVOSWFwUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295269),
('DJw1y8WnXwJ2yaILhpTLrh6XtSXMn550EfP3rEIN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2xPU3NIVHE3Z0FJQTdaMnROclc5WUlaaGh5T0JvYW5ET1hOVTJnRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299750),
('DkTiP5Ex1W2yNk5kRllu7acizqvAfedd9vHgSPG8', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlJoZHIxYTRqUmtVczI1UDVTQXViakZKbHJ1bUpMYUxwazVvSUFwRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297233),
('dmWAS7LM4zQJETURtHoskJnYMGnvpea7nsku0bqm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjFUa3hwaUJDNWQzbzF6a0NvS280aDd4SG0yY1JyUUZTQjEyWFQwTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298811),
('dNdTppK9FSZjwqvG8KoYLOWfc9xCQhFTew8Jm1cl', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemY5SE12U1VFeEdnR3RrTXBLYUpESG1DQW0wZ3hrMjRUWFVCMTh2dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hpcHBpbmctbWV0aG9kcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295375),
('dNXJl3dReGm0sXEFdkHhRumjOgfAFLx9QJvTNQzm', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1dPeldNaGJ6cHZudzl4ZEJHelNPdDFSTHNuNktTOFVhcHNEdGpoSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297019),
('dRPkJO0F9ztIibp6myMwTRjTD3VZ0Io7WzOn8ul6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUpxZ0R3TkVoZ1Zpc1pScVV5cENadTN5ZnN4S2lKNWRlb09DRnVSeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298968),
('dsMUqkAZneJWBucrLPiNtGmmnk8BXaVfx3UKzYxu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2pCMVY0SWxwRndMOVB2SWEzRG80OGxUQmdXRnllVHlrbVNaNlNieSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295275),
('dxM6tQPYzdMmk9fjXG9wf3JLBUMHT3YAhLgdzZXq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2lhcDVweU1kYjRVNVcxbjNUTGN1VnJJMGlxZjNmOTd4VTVMWGFhTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298768),
('dYu1hkVXURBTHhWLkc4R9xIWpL6qDhryTdeaAE5N', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmtWbk95Tk9kQ3lCNThGWmVyZ25sdVYyTHpwZ29oVnAzdVkzRWJEaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299851),
('e40hqEOCxpMmz4fYtnbrS6pzj3WVpuTekTF4NZv3', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVlvejQwamljMUxCODFuU3pSZUpQcGd5RHlJRHAxcWNuS1hKd28xNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9wYWdlPTEmcGVyX3BhZ2U9MTAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295337),
('E72Z3FLKS48baYaD1G97kpE56b1Z7Hgk5ijmI195', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWEF0SVRKeDJFcHA5ZXBORW1hbVZKdjJEVDdiUkhIRVRTQXc3TzQ5UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298065),
('e9sXNF2uMTLFia8YfnoDhObrtdWBJCW1fsjZ48V4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibW1HWEJaTWFRSGpUVmhSU0RxcE5qWHNwT0ZvaHV2Sm16MUJOTDZwbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294290),
('EC7wcTgfNTWXEPJzV0OSXZ6gsj4XCItrGBVCyKVG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjFoUXplaUhRY0tSMTI2Z0FLYzF6MmN6WW1PNmJIQUlhMWR6SEs5WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298768),
('ef1NXVcF4QE78IUcgqTdzekqke0waQHGtumesJ3K', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekVXZHNWMlFpQVN5dlFzbzRZWFBzYXkybjdYSktSUXFDNjNVQ3NkRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299831),
('eJb3oRIYf3aJ73Tzo1yYbxMqPBIiD9cFpqh5fxeE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWJwdzlUNzNnQ2VTWDZkOTFpbWxBQW5MNWx4d3hGSlVPY0VlbWRNayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297948),
('ekQjYfmIjqI9j0AqcLvqgkdtRJUl6MEMMo1dWpRA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV05GWGNVYk1mNTBPb1lEMjRkTjNEVHlJa1ZETkxZaVlNd2dEM2dnaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299727),
('eLGK7ZxOdeu7oVSoBKc2CCm4j3cJcD57iKN0nVJ8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTk3ZTQyVjBNVzF1QXc5cmJhU1BTM3JjV2JDQThYSDFDd0FONXQzcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299750),
('EmiIpMBT9KcKKwT0bMOp1LGXgTs7eLCepAOS6QSS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXdDU1k3OVZTTzhvbnh5ZWxKUTljdzdjVFJIejZzT1VtOVhSRFpFbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297932),
('ENZZHrNanrj6c0Tg2vcDweFzobhKteEcb17pjP3W', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkZvQW5aa1JNdThtZjlRU0FGWFZkSFVRbVVqTjlqdmV3aElqWUtNayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294295),
('Eo5js0smKl36yCgtjCo0I2tvk7LPZJTHxS2lcstk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFRxcTExaFlDbkh1YUxqSDBSSUJJeTlFZXJCTGFpM1ZmMDdzalJIRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298775),
('eq4QX6PLSZo4INHnf0REh8vNWjjl2CCvMjDXmCYU', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTZ6VlJXMnFUOWVPSUVLYW96VTdGUUFHVDFJaTBSRmc3a3RJeFRhQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297554),
('eyDbYELyfZWMhZKBH2ZgsK9m2vB7GyFTD2RPM9PT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0EzVnNDYTN1blFId2YwTm9aZDVHazQ4cVJUNEMxTnBGaFVlMnlWbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299822),
('F5lYA8gyHtHRljiSyknotKWhf7rM31WE9BsolGqq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRG1zaGlQS0FFdUsyTm8wTFMwc05CTWd5a1lXOE9RYVN1aU9TQVZ1OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295273),
('F5Qr5UBhQp5BprVyShIXPiZ9pfOIQ1FVOZZDCS2R', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTJ0eEZjaWo2cExPdHRhQ1EyQUxCRDJyMlY2emhhSVN2U3pFYzQ0UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295270),
('FaMLbj5WVWRlnwstAUfvJuoQtaHmGjWuBtX016pG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEw2MmlZR2tvQzBabllsMmRKVlk0TGRRakRJaFJIREp2SWhUdk5JdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298821),
('faOjRQVMGKVuW9ohJM5dJ5AWnztTogTvEtuBII3G', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXozRkxVeHc0VHBlV0tLYnF6aFdIN2JxVE9vbkhlWnNpUjBuZ0FkZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299596),
('fESBjZIQdUCfcEDZJIfKuKCNZpmmlFmIChptPK0I', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG9UZEd5aGQ5R2ZSSnNvbktmdGp5eWY1U0tNb1FLWk9UZTBVcU1ReSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297036),
('FgPtnLWb4OFmZZrmn7SnManIw1A17LV0JiDfSWL1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSW9Vc3pIWXB4SmNmcm91cklHQWkxSjZrUXA1TUpqaXFqdlNLTVo0QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295443),
('fh6VjhwOPvNIiwLmWQOyxsDbIbsjcCE2jRYnEc04', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3BxM2prUU5NNmZYRjlWWlc1VDdPYWxZcUVncEZHTTZjNUtwd0tsaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299833),
('FIb3OwmvM9T1p9ME3CEUeptGf55YNOFNkonu0QWg', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXVmdE42OVJ3RHZpdmE4Q3AzelJYWVRWQ2tGWG1ONU9oZ2x4WG5ybiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL3JlcG9ydHM/ZW5kX2RhdGU9MjAyNi0wMi0wNSZzdGFydF9kYXRlPTIwMjYtMDEtMDYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295281),
('FJZ62I0DExJw5ZD2RbkUjEH7tVJoPgwFafCySG7H', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTFZZFpvSlNFeFZPTEY3Y2ZxeTR0QmFzNm5lVno4STk0UTBKZXplRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296581),
('fkwkJvzMOOgcMtxSXp5SbqMQYNfMaq4fxxPpHiYB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUW95N3lUd1Z6NXBKdEd0T0hkcVl6MHEwYjJjQTFNU21LdzBYR05XTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297935),
('fLMPCa1nVq94dNWsigaUNCCG8G1nMmWAKWZ3anPV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXVQQlpvRG1XSjZCYmd0UXBUcXhYbWdPZVNDY1NFREcyTVUyMGxobiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295272),
('fN00lCRIKWlf9kORWOlfj2ToitPxbnWPhgxjOHDW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFNwRUxIb2JmSUJxMDBwSkV3cnpXSEI1YkV3RGhUSTg4ZFo0OTltdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294185),
('fPOSwun22sfJSKgeK3oG78wTlEh7J1225pRTnCD0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1VrNjQzNnpjQlhlekZad0V5a0ZLZVZxejR6V2d3eExrTHJqbmhXUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770297941),
('fR3O82WFvXWGXYLssaVWAVHDOtsEyUBasqyyTQ1A', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWtheGV3bUx4dGc5QXNPMHQ0OTZ5WFZEeUtiNWV0RGFkZnlsTzMxayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298822),
('fvbp9mqtgCtlUaEAO3ebScvGqaI4hjHTCDWAahcZ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTcyRkdkU3h3alZTWVAxdmVXd3FBeVRBUTA4Zzc1SXg2Tk1jbTdaUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdXNlcnM/cGFnZT0xJnBlcl9wYWdlPTEwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295339),
('fWEkKTbctiZzUlnQ0KVgVXwzMugcEpn0Zbw2LAvB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjB3MzFPZW80bHk4TGpOVE5xVWtOYUxFMTFWQUxEZFc0NjNGVXRrUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299492),
('fwJTxJbxMl5nitCS8Jc6c9yo92ylpAxBA70AEyM4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjBybVFrZlNycjZOV1lWSjdidEpJdnliMnNxRWNrYkd6V0I4V3AxYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297933),
('Fy3ILU7NwRFlusp3zkhAPYgaNKSqTFwZv4pyhTLo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0NPeURHam1FT25qeDI5ODV0M3QyRjdVdjVJcUswQ0tlODBETEhnWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299729),
('FZUl8f1Nk3FbuNG9R06IS05HfVNxix2HpabCcbxH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.109.0 Chrome/142.0.7444.265 Electron/39.3.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHVHMnZHRENFTFRIcUl2M29mVTFnb0VsNm9HTWlzR0VlVXhvdTNIbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770301282),
('g6gFLNrAHgCWFRy6d9ITPtltbptrPb9LlDuigmuj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVBQTE5HRGhaUU1ZeVNrbjM3bkxlS25aWGRoSGo2MFZLQ3NnSzcyRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770300101),
('GfTNMppUIDC2UyGkPJgZaDqhTEBib8poKJEuUBUD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGk2Q3NlejViN01TUDVReEg1RnJ4VVFMdlNNYUVrVTIzSGZvbkM3WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298943),
('gg4zZY7Q8tArlbZQ3OAHBJJEJxs8OP9kF7TFMgoQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclF6RWU2NndVWTJvT3RNRlRQamE2VVNhejNEZ2prMkdHWlZ4bVBkNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295278),
('GGcS8W8BtxYwgwMBCJxr1rgl0S1jIUUFX2R7CJi5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm5zMEVHR3lnTjkycHcyMGs3bmMxYkppRW56dTNBR25sRDlneHBTViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299852),
('GgWnmK8nyXr6dTcJsqFQwmzmxZOntQdnb6X86NDL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDA0amNLOWlWdm54VlJ5Ym1meDhUbGJBWVIzU0l1aTlTbVlqRmZMSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299816),
('GI3md9anyv2RemcX5qvORTbYlJRcleZaHOP1APon', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVE9zQ3Rwbm1JUlJPb2FQZkdCWlp3ODRmckpLVDdBSG1kTWhuMldWViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299822),
('GpbU8UMy8ajb2B8duNzC72uIuHY1A8haWJVm1mWV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVdKRUxtMzVqMWRJZE1wMWw0V2p5TWtnWEJhOXBlSWllZVVnV1UzUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298771),
('GPgz4S0CnNoyMevAqVviWYwy39uTPDHAzbUFRm9G', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaER3WU5zaW1OZTJvUENzNTdMdmhOanBZV3drQmNsMVJYZ1N3b21hQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298583),
('GpiG3pmt6XvVzqXhWwBVD6UifWzEzV0TWSoYvzXh', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkJlSGFNdWNXSEcxZWZzN2NPNDRnS0dyb1hsUllHeko5TWFYWkZrYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297009),
('Gquqzgpq5SAivFtNC0CYfxIkJgxxJHF1BI6xmkWF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnNLcjFiQVV5RXUwUWVyWGxZdnZnSlZ4OUt6OTZzRVFSYVZRRURNSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298099),
('gZ6YR2YbFeiTps0oSJUJEEg10cYx2dh8nOwtnas6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3JJc2ppczU1YmVoSnVlblV4ckRmakxxZjNQWDBFcXpveHJkenk0dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297942),
('H4sqgjqlCZ5QYYN46dGgOWSJXnAyJllnTYc1BRsV', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlpUcm04dkI1ZXBMRnp3NVJORXp5enZOS1RJUjNaemtHWThVeEl3aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGF5bWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295360),
('H5LhgQzUzZRxnPfXiT4wPWBrkeoqiBBeMRxXust5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXhiUDJQd0RmbjRmMmpsUVRKcWxvZXdaUmxpZVp1OHJhQVlMMndOcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298776),
('H6MW9kjB59cjggQ7ER2ZuxygaIrhrIQg9NjrwTuR', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekNwT241S0h6WlhERWY2VFRLNVd3YzE2YmpCelNHUE02Vkd2VlF4byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbm90aWZpY2F0aW9ucz9wYWdlPTEmcGVyX3BhZ2U9MTAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295330),
('HAzCuFUn6aOokkBwJmlyV4nrTskQzman7g0Xh4qC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1JmSWpuOWl5eFFVQ1BzZGtoZWdPNVF1WGhlazBNTmtSSmh0d2hpMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294309),
('hCCgB9QwthAyng8Tgs9osw2C0ap3jb9vQybx6rSG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGdUQ1lmOThyUnlIMlV5NGpicXFDdmJsZXUxeksyMmFPelVMbVlzYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297941),
('hE1CoKW4vww1zEBlKl6PePa3TC3mWq8R2O2uGQ2r', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYm9zdTFTNE5UdUd4OHh3SFZyamFkTHRuR0xhWVcwYUFmYXdkb0l5cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295276),
('hIczaiM6mEQXdALQoKUlTEm9ZW4L9j7Y3u2yJW1m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTFBMVV2ck5EbmdCcGl6anBiNDNuakVSOTNPSnBSQk14VGc5QW1LTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299757),
('HiLfeuYtSKTxFMmvb1cmusPmODU7bId1if5wOhhz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVVZNzNhSXU4SDFZeXBjVlJ2eDh6MDRBMXAyOFIyRUpuRUpqRlRIRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298091),
('hlewKg6O3hPjvEXHSFqTQ66PG2rIrPQs1fwt8Gq1', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDN3TGZjdU1MSlplZUlYRHU5V2RZQmo1WVRUWk9hYXZiQU5yVzg1WCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294349),
('hlOknEQpQi8qkGnaQ2ioijFszJl6NR22KLFcwMSi', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzdROTFKdWJVcUJVWlR0YWIxWEtyc2RTbWtMNm5KTElZTjNpTWlTRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297563),
('HMnyQotBXod1qNmbyYSH34XMxxE7QDxy4ysfIuvh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmZTOEVBSFRTd0xVcjdDYlNPUWpIcDJ6NW84NENYdjc2RmlSODVCUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297936),
('Hmshiqp26JTutixWUDgMpQ51EuHGnGGMXONSYABU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzFxc1dQRVgzNXpnYkd5NWJPbmNGVE9YNWVwS0RhZ2tsYmNHd3dMbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299757),
('HRSPV6ov5Iv7SPBCpIQnOo9JZfw4lZOoMHzkYfCY', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUVBRDkzZVFMbVdyejdhMFV6ZlFmdVR6d1Q3MkFtOFI0RTVOaUk2ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297264);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('hsm3NAcuspw1vEH1WnH0y1JAMSRLFRiRtprNLE7k', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEVicG45bm5rNjN6QkdiM3FsUTdBaGtJT1lEODFpOE1tOUJBaldnbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294300),
('htDm1bTOsnbrJPSXcv6rRZK9dvIbJHrNEv9l7UA4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.109.0 Chrome/142.0.7444.265 Electron/39.3.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGZRMlJVdG50UWJUOFJvOVpVRXFBbVozdFJ4TUdDSmFFWldqQmhwciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2V0dGluZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294524),
('hTfJPqyDVv8pcJ4S71aMSPWPvu7mivM1S41iYSBn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3N3U3owVDlTWExmNGtkVmh4VVZpbEpPNkNWdVpTVndhdTFsRjVtQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770300103),
('hUtW9fOGYWQyM8lVnNP0qc016Der3CAQVCDs7FJQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTZLZm5LVEpPcDJmZXNNSDQ4b1ZxZ2VXQmwzdTR6cEtkNTl1VHg1RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY3VzdG9tZXItb3JkZXJzP2VtYWlsPXRhbnZpciU0MGdtYWlsLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770296011),
('HuvLnNw9epxE81YbekJEVzVFDukQOFAU9NTFV3yQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1A4MGh4RHVIS0ZTZVN1Mm9hanNWYWRFSVg4WlN1RGJSVDVybWVpNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299750),
('HVHGmfyClm2IXlo9j6eDwH9Amg5G39Uv0sEgMctn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTV0ZzhzQ29hZHBZcWJzbnJSUUU1QVFOWnB4M3pDZEFsSUdqT21UdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294286),
('HVO85MZqXKutkrCeKVPsfjlVnnFXWUn0ZmbtuDBM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0xGckxBZzhpVU1GQzNRT2NzUkViQjRrWXp2Vk9xb3EydDBXOXppYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298582),
('HWgOCclW0kQPfIlZBoff7wMY3qU6ttMPrJ4M3CcI', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSENzRk15U3NuanFrbml5VVVTQ3VxY2FxMkdienF3NW5adEVNYjZUaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296368),
('HWvXTBVnT2NBZF8NTFWAITQ6GI7MELdojO4RBimw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0tmWEduZllYWDdWVkZlSlFJV0dicHpMUnlYSXVvdko4bUZkSGhFMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299491),
('I0U893vuQEnYQK4b5LRbpyzHyti8Efibe8Y5YGC7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQndJUXRTbjI4d3NFaGxYYWxzNTE3MWEwUEozU0R1QURtaVdVV2VEbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298099),
('i1PlEq27kLGSxdB0QULaS4SfUT0NZQlL4XsDoJub', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXlHNFluTkNCUGwzelhHdExJOGdWbjZ1MUlJOTI3d21odkZlSHRGTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbm90aWZpY2F0aW9ucz9wYWdlPTEmcGVyX3BhZ2U9MTAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295286),
('i1S0nwbPexehHXO6dKDAonyfcDFBsKDtuJPI7pLQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUTFaazZEd0FYVlVzdm9NeUt5ckdVNFNicHQ2ZWoxTEpYUTNxWTY0QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298480),
('IATuZmfOEevslJjGEuULNYdvpdeePiyBSf1ALIQf', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVd0ZTA5cXByNXV3VUs0SlpuNUNFN3VLcGR1SlVuUDQ0elNCMEh6OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdHJhbnNhY3Rpb25zP3BhZ2U9MSZwZXJfcGFnZT0xMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295363),
('ijdGBILiiq0v7e1Hn3v57yuYPfhaSLY75RFN3lCu', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3FsWThOa1cyYjV6TnZJalp2enQ3bWtOd24yWDJWUmZQdXV5aHJYRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvb3JkZXItc3RhdHVzLWhpc3RvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295373),
('iK79nkryVEAcOW6gq2vuL7pZVbIVlYWxL9pdkHuD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1JFeXdxVTVxdVBVVE5yVXp3MGdub2paVUhkczFCSG9WeHRPeGxFRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298970),
('IlPjv5JBpWSG1yyCTOhzqyXayZIOtRXf0caGzUKT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUhWZ0o1OXlKRlpBMFB3SndXYmlBM3NlUEZhUmhFU3hlbFJZdXk5diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299816),
('iMWlnaDx8hxbVoi5Jif7pEpo3rDUbTkUINUV76AK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVowUTJRYjdHcnJlQVZIWklrMTlKeXNVMDk2VGtINUlneVJYajVyRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294296),
('INQ7tSn1pKhNPsMMxx1pu2PXO6NMH8I4WuIKHoHu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3pDOTNSV2pNRDRXY3VVSUwzTlBVbWRXM1owbUM0Sm43eU9Fc2xpUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299833),
('IphiDyO2V7wt6pnUH4s1Egkj7eiOjxa6bQQ7f90f', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkUwTlV2VmtjVVdZVHhRM0xtdVlqMndUaFhiQ1g5SG9kb25rTVpqTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298569),
('iRv7GvaUedQtxzDKeHLjvvy1gHBY9GqTrCH2qq0D', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWpBY1BYUnE0U0tGZEtOZ3QzMkpKUzhFb1k1TnRvQkJOU1IzYU11VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297299),
('ITZZOMFyeKsBpG9pmEQKKmHVJjNhBnkRfULjNh9g', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHdrbGNOS2lwNmhBTmRkMkxTa3JFTGhUMllWcUN5Y3BvZW5aMklqZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL3JlcG9ydHM/ZW5kX2RhdGU9MjAyNi0wMi0wNSZzdGFydF9kYXRlPTIwMjYtMDEtMDYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295334),
('IuKueO6h5L1dlZgihB2QX0xbI224p2oOozD7GG4I', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREtuRUppOFlFU1VtOTdEWmlrNWI1aHR0aFBIVktVUTJZc1JVV1N0NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298307),
('IVkJv1G5bvSTLoMpH9oy8uw8CAQhMi60Mu34gAnW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWTlSUEZMWEx1ckZPSXJucHhneWMxVm9HbEVVUlg3SWRrRHZRbDVkTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770293408),
('iwCBa1PolktxXo8uXTStz3I0lrv2m9DYn5ELNHcc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSW41dHg1VEEwZDNKbWlhTnM0ZEFDWkJhSjRrOU1VRE9hd3phR2tpZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299850),
('izIa4O1Xpf6G54ActkNP8WxFqzL5IGtT1uOEbwJM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDZtNkl3UW00ZkdEUVNmemJqd2F3ZGttZ0JkMGVCSzJwMUVmYURseCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298942),
('j2Ua2IbUbwJ0ThBGjZoJ7fYbJOeY442a6qhzexB3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkNydzhxaWxNdkxLSjdheUQwZGtOOEJZZzVERkppcE5Tc2hVRExFRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299796),
('j80MX40dv2MC0iant2oyGWuJvtaKdxFW8qwv2tdI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTURQeXZrZzViamhYM3pNb1RsSnM2dGVTR0VEcURzVWNPS2hSWVJreSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298817),
('jajdqlGotKui3lVO8VJND04kcUFupA6G1Fk8Nnkz', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3ZiRkZmU0VNUFpseFRMc21EdkZoa1J3a3BnZ1ZkTU44bmpROTV2aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296490),
('jBwHk8WAoM13WcvV3I6K4Sr5Oc7rCrnzO9QjYu9x', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMk5kMTk1RVVMdTEyQWk1b1Y4Q21GYTZaZ3R2d094Rk9JSjFzRzVyYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298101),
('jGux0v06dkMQYUycvFE0OV79OkIyxq6X4Dq1gmxS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUh4QzhJZlcwYmJTaWlFYWZSTFdpOGdVaTVxTXRpUGJvcTJrVFdWUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299859),
('jGx5TmsaYxW7rOV5mMv7zM8WKICtk6bwafQoOHCR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXFuNlJUamRxQjU5T2ZaQVFyaWN0bVdIbHpRR3RSclBxR1dRbE9UcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298770),
('JhETihbwwdPByyCzHriKxdlUyjVRc5NKEKy7AnQE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3JLcXg4SDhmbkdDNnVMc0ZrYlpWT05uZVlFRGNRdDRRV3pCVTBENSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294185),
('JiBSWoaZaezi62hotM5a98Fjgf2ElXSHagapULbt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDM2TDh6eUxoR05qdFVtWEJjNTBSS0FzZ1pOQ2pHcm94QWQ3b2F3ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299856),
('jKIi6H3YVZ1ZDTtSm9lfssaGExN2NsS44k1bX7ev', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.109.0 Chrome/142.0.7444.265 Electron/39.3.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmt2eENLOUxqTTI2cWxDV2hZcjMxUXZWVjEwb1BSeVdwRko3MUd4YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770301309),
('jkjy0rvB4LjkVirYsDsvRNSurXl9QQh1PaOhKZv6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjVKeVpuUG1NQU1KaUtCc0syZ1RKMENrZ0t2VXFqRHdUd3pSZ3B2aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299691),
('jKLS7bZQMHTy6ngg7Kyv6YfZPtEeFS297RvVGkqk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTJ0VjhuczRqRHA2YWZVMjVubGF2d29hVGprSHVJWHNmZ3pKZktoUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294319),
('JNszbV3vVpvFnWTIY0nbxYN7Xg7lDXdhn7FJfsQc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFFheGdQeFpqRVh0Z2hGTG1RQ1NlMTRSSkVUakZNbmdFeGF1QlZqdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297816),
('JPebf6EzWOOzh8jnNpt5U0f13FuM0SJ1GYwC3nHR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnBaalB2T2R6aHlmWEtmVU1LVnhaZkZKMmZtT0diWFp4RWNuSlhsVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298805),
('JqiND4Ov0FrCcm8gboe8yAAOdfyrkMKXHiwrqjo3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXM2eFBFTGZqUVZON1dvYURONGtzclJqZXFDekJhbzFYc0xzWXo3aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298943),
('JsuBiL6IB20rhVQZRLbqFWHXCYcyxJeoiXkbKsFZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzdySzFjMHc2aHNqNFJNdlhoaHVyekxYbmVWcDd3YVpVOHFMUVBCciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298811),
('JTREBcegaMZkmdP9PdOWOzuA7EN55CQFFaSpQL0I', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEhGeVBTcW43QlhybDVkWVNBS1RHUWhhMDdqcDJaS2NWTU5kQ3R3VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298083),
('jULajflP3AVs2jb8zkCimgerQEOs7zY7QYj1ZKzh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlZLQTFoTkFNRHRDZ3Q5MWswSkU5MXlVTXdZT1Rjdlg0Vnp3RVJDMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299795),
('JvHKiPefsXOO7zOaqSLgSU6wLcp5lpU92GwBFY5B', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEpUOEpTRjF2QnRxQU5xV2xwcVBYMmZrVFRjSVFyMDV5WURCNU9pRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297840),
('JzBXKummZetuHbFbEzuGWPESXZfR03nZqQ5Ekubm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWVPN08wN1c3NFpvVTRINDhvdTV6eWhWR2huNEoxdU04TTVrVmpNUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297820),
('jzWOYNP5LR1LHAN2pu9dM3j2RNWH9J85WrMpNyxA', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTNIU1lRRGdFRDRxMTJicllQY3ZLYll1QTZ4TThFS0thYTk2OHRVRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL3JlcG9ydHM/ZW5kX2RhdGU9MjAyNi0wMi0wNSZzdGFydF9kYXRlPTIwMjYtMDEtMDYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295333),
('k0DQa7gT8wZgQUnNnxn1UCNz3AyU5x8ukTvZn5Us', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUVGSTRTMnJkV1Awbm44dEhuWUhNaWRtSkk3bW5qYlNLNGg2c2VDZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296025),
('k8OrP2lvxfOm4HW23eKQrEQjGyujGhHeMpB8gaev', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzE0TDdDVzRDNnNyNXZIV0NOdHFUVWhGZkRSbUIwOUlwN2lFTXRkVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295427),
('k9Wz5kXkdYXm04fKaT6nJI4pcf3VavpEEovexQWi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHdweEZ0eHd4N2x3dHRBeXBnM3o4bkxuZXM5bXoydnl1MzFkR2xrNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299729),
('KAgFmCTQHI02la6lrjjKwOAuBfn9prznEtFm4vQa', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicURXZG9RRVM4Y3B5RlZnWHZMendBeVM2N09Zc3haSWNha2p6YUVEeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297359),
('KCxkrcUTkvkkj3t1Bpkn20QsEWwUth6gfsUNFfDk', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibVczaFZGbjFRVG5MN3VpMlE4aG5Gd0ZvSXJvdjh1b090UEVFREo1biI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295308),
('kFR6X80sfMPpvSs8J20V7hfsGIZycVWECOqGS4h6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM05Tc0pLbk1TbFF1NElBZDFNVnVTMzJEbDlXTWUyOHFrOGpVenJQbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298066),
('kiW8NVkTZFJkylkCUgCOiHuFx5MOAyWjpmIZDwm0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjdycVROaVg5Tm5zYXpSQ3doOHQ0VmFMU0NWYjFmMmdQMUlRb0lDbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298821),
('Kkvr3P1jjDjgaj888N4xkPINSfwzCkP3r2n1psgn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjI0aEtRNGNBSG05OVpZSW5mWmUzUlJMMGh2VVkxNmMyNUZkNUtoSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297818),
('KmDFNdJ8Xt28JuIITsIBEtUdMwC91mb8zvuqGIZR', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkUwSzhRdTloenJ4T2VQM1Rqc3BnbFRETHFIMG90NlZDeHd0RGtjMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvb3JkZXItaXRlbXM/cGFnZT0xJnBlcl9wYWdlPTEwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295371),
('KMdIaXojYlRobtI0XiUgEfC5lKBYuRo9p2lfEtpI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXhYWDRYdlluUXhRS3dJbWxLZlVTTUI4VWtjcTYwbEY4Skd2QXRtQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299822),
('kOyaXHgywpDO5woGWKcSXDfW4PjzpgSprGlrtDIG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzU1VmcyMHp6ejNUQ243SzBxUEgzRU5oTk9GNHFsenJWUUFYaFdrMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298806),
('KtCrnEpVCYGQkIf1Td4ieEJJsE5WPyktTmQw0OOB', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlZOQ0dSd0kySzVGUlJlajR2TW9yZ1dRUENVMmlZbElNVUpxZURVZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296994),
('kvmmwXXgv0koKLyPqeagSYgJYRUwJ03MHoZ7f6sg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDBzeDh4ZzhoOVlJTUg4STRRUXVqYnRGZjFad1FteU9LTERmRDJTdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299597),
('kwg9xELqTV1yg3JgyzhRwXTF6grUp4TdG3XYtdCr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMExrWTdjOW11YVJxdEtFNjZRWjM4akdUUmRaZUVzRnpKY1ZtMWRnTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770293410),
('Kwoxbv6DUlKjgn4EOaP2Qguox1ukZ9CGob3906n0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidExKSGxoSXoxUXlmdUd2SnpmcVlkMk4yT0swN2ZoQWtZZjZPU0xTeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294289),
('KWPRv1R8xTTGOD8d9Y6zkn44knHB4QmdReYLKjMU', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVZYZlFHSmVaamZ0bTVob2lrbE1NZE5UMENHeEl4WmgzQ01MQVR0OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296994),
('kwwEMqZqkhVRqXyCFeHzio5cnykV0p7Mp03gLV96', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDRVTTlvY0VKbEJtcUFIdktNNlEwQWFZZ3hZYk9RU0JMOG9KOHU3dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294196),
('L0VUTzcwQGvqa4MZJoHaOJhoa6UTbuefMtcgC3Br', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2oxMlI3Skc2Sm05S1J6WHlPMnVkR3FUdng0YmN2NmRDV3VxVmhwSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298822),
('l16qz9YlF61BBDguRfAk8m6gzwCueCWSAu7MriAj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzhZTEFzcGVkakl3RWJLSUJLOExKYzdBV2tmWFVXNklSbUtPOWNGdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298819),
('L3bLNzQGWSgbLh4QbPmgA46AWPUKY6qYbUSu0Weh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEVhS0NPMzJXZVBzdGxweVFySndOTlcwRnFLSUFGNGtHdlZLRjNhTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294189),
('L3r8okiCesHgAxcIvXFoTOnzlfzeh5dYHSebYWKN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiak44UHFzTlk1dmZKQU9raU5hOWozTU9ET2FvV2NFaUoxSlBGUXlqaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299833),
('l7VbkvaQvi6UriaR14UqC7adGvNXHln12vC1Bxp3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlZHdGxpa3RTdkFkTjE5MGNiMjdXaks2c2M3REk4VFZXSEpoREVYYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295443),
('l82k3spcgsWrMZaKegwupHKFnZcWdHqDa5p9bqnb', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTU5KT3N3OXFjaVNRSUZiWlFVWXJjdUlSNndqSkxKRlhENXhOTGtldiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298570),
('L9XJk11WhMnyoi6JaydVEa7QwQ24bYTNXcBiFDga', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVlqUGc4T2I1cjNKckxmckNueWlLMXVjd05qV3lwNDNHQ3U0Q0V0ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294295),
('lAEzhjkmqx1EaW0nGwF1t9oH9wjcseME5Qn9Tq8s', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQk44dUNodnMyNnVHN0dkVnBJenFzUUdwd0N2amZTMnVZcTBlMFhpTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297821),
('lBfxG0LmdGQunt3XuojrquxuJ0QsaMcgtqaiNgE4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEpuQ3pvcE1SYUQzNzBkaG1tYXhCSE52T0NRdmdzeUlacDlLQnIyVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298768),
('Ldm3Q39FgkFpkvkBShDsjJq1ovbLqyrwz7KuDPna', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYm5jd295dHhDN3J6SU1QNzF2RlR6N0FtZkdoQVZtUmhjdU94cERWMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298099),
('lIfiL3nzWDq0iCVx61p3gCshbQqSEkBBSm8xjWFG', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHZrZDNGbG9FV3pCRkFla3JCaEdPRXFxeG1IZEZZcjlzeVI5YU03bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdXNlci9wYXltZW50LW1ldGhvZHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296979),
('Lj9g0ANx9wXYTV26iF566JsTGFCzWzAC1zAWGsa4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkRmeFU4NTlQOEVtbWtyRmdUT3ZQd0VLM3pHYWZ6RmZ5Zzc2b2xkWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294185),
('lpQic28ds5xRhPxw0jPYKnqjqUA50RjpOXpHS7pV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlFGY2xQaDZhMmw0QzVGNzNHd3pvN0F0REpPalpZREdDaTJNVlRzOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294184),
('LqpjSJp9NRppF4Cv39PQigAsMWHjdisgw2rFBsEd', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1gwVng2U2ZnMWZ1ZUxKbW4wR294YVZmZEVsUHh0Z0J3SE9CNFpjeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvb3JkZXJzP3BhZ2U9MSZwZXJfcGFnZT0xMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295369),
('Lqzo9rBOJM7tLTOnkgRN7kdj2HirCZiJy8hWb4rD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmJsZTdIMkw0R3BXeGxhSVdRZmNMcFpkdE44MjlPVmtMakZJYlBOUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294179),
('lS93wQwloPVcoatR01Ebnq47YtDZx3lJnWSUFaUw', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXdGQmx6WGR5NEVjeGxsSmMyYk9odU9ESVFjVVFiVlp6RUd5WGhpdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvbm90aWZpY2F0aW9ucz9wYWdlPTEmcGVyX3BhZ2U9MTAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295330),
('LtvG0FarsXmskX790PrLWcIRquUdt4n4VraHEIEx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianJ6NTc0WmZxTTV5NHhtNmVFUzJJV2RQZEMxQWtpMHJpRU5xYXlBTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299829),
('lzXiI8erxCHyS83D9cDcSJ71GVJYSXLJbT6GJRaK', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEp4TFpRZTdwWnpUM3lpRlZxMjRwc0E5TFhGWjNIV1BkVzEyRk5rTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297941),
('m2JWSUfYG89m6zlW2ohWWSLDiu0OxlUqbIGZyGP6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUE0cG5rNmRrekhBVG5RcHBoenhTcWJSMUFLZFhmZmhmRHVhRzcybiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299592),
('M3c2Oox6QqOud4fqQtbvlz9tL9l6M1M0eXbZ03sO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGhkUkdmZVhqUGZXeG1TVzFXeEFyUUdhY1o0a0hJOXhWa2Y4VTJqTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298097),
('M4BZfiyKDsU3pxun4DiYT66PHYEsGyFlrzEWBtuB', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUQzZkVaMHhVYUpKc3FXQ0tFMnVsZXNSSXR0M1pXNUZGU0pRVHFYZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295220),
('mE0BpErrnRfsSwSDW6zsHQjFd0IoTmWJ1FeqjW7c', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiek04cDZQeEhOVzdvWHZoQmZIam54bWQxYkllTFZVRlFvWmI1eGxnYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297009),
('mHBhsIYXid0aBiuGZNCwFeJymBunkkUSa5EDYEth', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYU5walV4Y1pMYmhVcnZVYTg0eHprU0tPWUJSVnRUVUExdWh1QXdPWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294288),
('MhmcHYlylwyKIRjZZsPKQ9IhWJyfmnUZDLLT82TL', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1loSG9vOU1mQnVOb0QzSjlSdjhBa3BhcUR2Ym5hcERYRmZlWHpXbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296581),
('Mi0TT4K88xvBwkGW0XWwMx8jyNv4ko4vj8n1zmo6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUlZbG5LelRyYUFZQ2VlWFhkRkU5ZWRIVm5rSFFudmFJYnpkU0lMcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298478),
('MLGSBPDaR36QFQRA6UhkQxncuy1CyevIoaBjOqO9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWZmRjMyRUYxZ3h0UW9rVTZMNUJoM0JiTFZxOFdobGR1djU2QlljVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770297939),
('MLLj8pT953ApHo89fgsRB30sZ8IN8Oeagd6LjOli', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGpRMEVNeHdYOWd5Q2NNOFhHY0pnc2NGc2F6ZWJCSHFORlhMekhEcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297014),
('mN2Sbq0VEWglT6MzH8UwqnHNw2MWbkGZyXe4YP0z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDBnVDkyTVJmczhmUkxQM1ZtTllNM2czS2dYMnpJYXB0V3Y0b0ViYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299756),
('MplXqFWopdxBXAU5xMv6RJj6o8LtxT0xwnettyWA', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEU5OEZQZHFRVXNpdFJtRjBmeUJ6QXUxV0d3eHNscHR4MzAxMm90MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297251),
('MrFmrEHPCWh48Ce2d0kZnqeiT8NIvlKpd1ziRQ2D', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2ZkaWxUM1o4RVFNSTNUdGxuSmlmOVlZNWZmejVFWUpaaGpHNktuUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298582),
('MthNx8C161OBHsDPcjEQ7rgQljCOa5h9fn30gTX0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzZLMEpoOWNJVWVUU1VvTmg0b3VvejVRS1pFQ1U5OGh5alhOZE54WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298099),
('mUMQrBzQ0JpdTKQv7VVkzYLM7KFuJpTMHuKIciwB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkU0c0Y5aHFTODA4NU52TVFKTTh5R1hUaENEWDhpdHh2eTFtRGRZdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298818),
('MxushL8Nr0iqNIBc6aNwCoBfITRFwDAunmfcEzSO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmhOeGZXY0s1dElWT2licjJzRnJVRVBjeDJGYnAyU2RJalNkNndiMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298775),
('mZMDaly7UyKKxIb5nGsbZjQXVtav2q84OZ72F9zp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXc4eGpvZEpQN0t0cExQVlBoUmdjUXNEeXd2Y0laTVExOTRZelM1ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295259),
('n0QJB3MPyu1bp0TTblO7sWKbd4LAlT7TNezY5Ums', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWNmQW9kT3dIZEppQkpVSjUyZFhKQzhhbDBSRUFic0pTRUYyNHpwRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294165),
('n2qE0SSLdQnaDApiDbii2q0SWGoCLtmgx552aZQR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHpZOE53UnkxZ0QwWWNlbHZSeFJkYmJFY0MydVJVOVNLRUNCY0hjYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299851),
('N81bs97qDfeBwG7FrvvEPt2ajaaz0xrckGooXnyt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFpGY1NCSkZvN1EwQVNVSFByQ3B5RlZ1a1EzTmh5UTNDZUdqT0FxdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298100),
('naECYW5lpk4lpJVIH9e95Lup128gKE9VlxuLaaSx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWRGODRyWlgxOGJkNE5scnhxdGRDNmFmSEQwdE9kMERYSHRKTlRyZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294322),
('nFboSC3Ga1NjfZrsv2i6KAQm4lQeleut0HOFxSvG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2VycVFGbVA2c3BiQVB5Rmptenk3UUwySXAxY2d3bHlnMUFWSlZlWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770293336),
('NGa01BmnvuKOojn5cO31QO8j1NcauyScVPeWw2jc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjNDeWQ2cWNjdFdhSW9uQmxVS2ZKU2hFdkNUZm5ZMmp4bWo4S1MyQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297828),
('nIKpKnG4o2jYmlvovnursjA0X9wTkbWMsXqvflAu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzhXTWRCRXZvSEtPREowUHRiM0gxZ1dBcThCbFRSTmZvNFNNS2xrZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299599),
('nlYtnRtpPtPBwjcZ7NqDfQZZZILWZuzmjhR0mPZa', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.109.0 Chrome/142.0.7444.265 Electron/39.3.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3U5ellwTFJNaFFKdURKSWJwc1Q1elpWVjBqclBaMzBZWHZOV1duayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770301309),
('NO47ddWeoFLAtyZ24gaoO1lA37VyiS1wZrt1djbz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjdXR3hIdXdEUzJLRmRaY05HN1NYSkV4cE45V0h2azNrMnlHUU5lQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294306),
('np317jflwi0b6Z186lDO5EktB6x2EUoUa2g7auQV', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWFNclQweWhNemJXbGtKNGNyaVd6cWR6UjNmNFpQOEJEbHdLS2NVTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297019),
('nQA36RQLaan5MhQLR3wdVGqrISkuj6KDwdGihydu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWpRS0VwZ2Zxcm53dTNrTXZUV09McUNIckFmMllaNWNyUFhnUzNoSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295381),
('nRr3QrnTJqCs7gOctlfA5OS7wRBMWEBpaohoU5Hf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWU05SmtpeHh4ak1rTllLSWJHRlVGcGtrbjZMRjM5UFVyWG9jTzNQUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299691),
('nUFlyxGkrb9qBbantbKRA2Rmy1h7FZDY9E14IO1h', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNE1rMHRxNFpXZzZmVFpoNWRjN21BSWpMMmlBY01GbHM2dEl2TDZmOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299750),
('nV4ekHhdq06v3lS0eh6n2sBrGd1GAM0ZwDZYwbOP', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicU9ObHA1N0ZnN2RYMlFrTnptZGZQSUw3cHBuT0I4NzN5NXpKMVl3RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770300102),
('nxkMWxRl1RlLYPXD41CfzGFOfqxBmWkJ7kHHonFX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVZMWlZaMGpEc0NUaVMyanlkRDh2bGh4ZnRhcnhEbzBGZ3VHRWNvVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297833),
('NyE3ZFQawL1naPy7gvf7ncUdPdK3Lq4u5GcnfUbv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkhFZkVjZDRxUzRGcFhKUHlFb2tSNDJlcndJNDV5ZFFZZEN0ejVSZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295272),
('NymQlLFsAs6tXYGbJtcp9KfgsvIjPmcvzhurtfv0', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVB6cUlrc2Z6MXBCNWhEV2FYZ2FjSEx6WWRvcDVQWm5ZRm9Rck1UcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdXNlcnM/cGFnZT0xJnBlcl9wYWdlPTEwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295335),
('o55kJZMiYHzWkR5hQff5fsqQEs3SzjGpsrl7fZep', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU9WeDZNMXN2ODVWNGF3blFUeFNndmJZQ2tKdGhCRU5nNGUxY01xZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299783),
('o60l2taurQV2sUZE9rxGHNShXwS2yOfhzkUSXWj0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDRNWnlOWDZ4OWk0alJJdVZhV09IWU1RUnNCYk5ld0swTzdISDJkZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295260);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('o7BVGL4xO4OQ9utcng8t4aNj2uiZnnJ8UcaIQsUD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2lSMUlkMm9FMnlMMFVCendGM2FGNUNJM29vU3lWNVROc2JMRHF5OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295265),
('OBpGNTwZSTbDZDY6tBZelwcj2EksQISAGAVZ0sPe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlhmZVlmcmxWNGZSRmNYODBRQURRQWswYUx5TzBlekhLU1doWUFPWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299834),
('oDMbko7ad93tkJ2TGlcNC0A8yjj8V7F4eTRcxq5K', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXUwbHV3ZlN4dGhmYVdteFBCWWRWUzJOcXdlWVU5dTZFRmxNZU5heSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299755),
('ODmNuLFFDZMBwoLKjbDHQ5nhqO4GqHZyy9OZvQyI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemUzcTNucGcwRXhwQkxSaVI5WDBMNlBVdklqbGtwa2FYMzJCVlFLZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299756),
('oDpog19AdWLz0e6voV0e2nHIVRMtXulhz2UyA6ti', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUFEaXhDUDVjRnRiZmczazVud1U2Wm1TcEFwdDVPc3pkcTFPYVBhVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295275),
('OEc46K21fApVBLmcAzHsaPob6EITu5uXdQWt28tH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGpXUlNKdGxUdDdmdkNUUnBXVUxqeHNqeExpcWt2bk9kZTdJZzRTcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297845),
('oEVqqxgqthesOlN7W9EIACSgRKVEjfEqG8tiXwl2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlNXcVNjNnNUODl2SEIwR0tlUFpDSEpTamlLMHpySFdRRFdWb2dIciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295270),
('OexVXWrUq8ZEUJ7hD0F3hQl0XtWjQv93R2ajZavD', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSk5ibkdaZERHaWxxZWhCRUNJSnVPTzZtWmgzRjJrRjhZQkQ5cGFOQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295247),
('oH7MjhsC8x5uyRcaCTHAanYLlrpDRgTh7gZbNEUD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXNiZVlIY2E2RXcwWWxMMkxrYmFaTE43Z3dzWkNJRlVxWXl2Q1FaNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299859),
('OHxGmJ9Adk4q58tk7gxlCAFBNZ2D9OtePkgpbiHG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVc3RDBueWppcDhwY0V4RXdTemU1TGVITWhqTk5ZS21hbVRONVNaSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770293336),
('oJ7zfTcvsqGQUpD3YqOPttHzYzX7IiBu3d39YnyG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1ljR0g0NmNvWXR4MEhONHQzenV0RzJaSVlGNnFKTDhRcTdiUVdHOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298307),
('ortDOz6fwRObJ2ZN50aDheVS4zovu62THNpaog65', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1RPWFRCNzZoWWZFOVF3b05LNUNXeFFrdUZ2dGJ6Y2hreHVzS2JwSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297822),
('oRuP6gUCv3ZVTWjK22NnW8b2SIvMTWYUAGrrnmOz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2pOZ3pFVmUxcHNFa29hMmhkd3dDdmhqSDc2Y2c4TDUxMkJOWDIyNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299857),
('Os379RUnQy1v4avPUgjhnUJThKeUoRFKdoELkdQ6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXprUDY0U1hnN2JCSFR2ZU9WdkRxNlJWc2JteTZITU9VdmtVNWVITCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297831),
('ov9FLonbOj6wfMWUwcdU02RUHncpYmYbA3prAqSw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVlXMUJvR0dCeVRJb2RzOVd1WW1ZclJZRjBCNXBiYnBxSEtQSE9uOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298819),
('oX7riZljhdeHsoR6yM1qIOQt9MEAgIrjfPwxfZse', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieE9iNEVyNk9NSnZmNU1nNnlFcG5pVnZ4dXdNY09JM3gxYXNxSnJicyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295277),
('oYGJ8p1ejPaKI3xHxpKInXGk7PwvhXU673A7f94v', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlg5Q2xOSnBSOXQ2SGszU0dmZnVFblRiNUNXb1RhYk9acGNtS0w3YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297935),
('p1BFYKGgS2yPtskeY3p5wLQVb44Q9sBO4BLctfhp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmpQcnFyNFpLazNxZ3RyR2lESGNsRVI4eHRGYW1mRUNmdWpaVVRuayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298823),
('P2r3WONhDiY0JhdMUscJyGsNJth5yRyTrr7t1Etl', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1hId0FpU3JXRlF3bE1RVDJCdnlSZW8zUG82S3NYanA2U241d1FHYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297260),
('p3thUTNSJCF6g0cTg0bidhZLDjMwNvYxVGPo6wqe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWdBc2hKWkV0a1BGcHR0V2FsSjBOTGZYU3N4WTJISmVHbDNIYkNEaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297819),
('P5NyAh8Ps874AOct0mvrwWfvzJ5svOiJZPwyIAJO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHJ5eHZpQkU5TkhTZ0hqWloxSzl4WnJjMmJTakMzS01GVTZiOVlOZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294323),
('p7VhysoWuP0l4lyBLkuctWRMlHpnh50Iyef3IIpV', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQXNNNXNHOVFIMnR6SW9yeVlaSHV3Ujk2bVh6VENzY0pKdEJ5UmNraCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297233),
('pDlQFsI5sK9AeJqXCbuU9tGsuIcB5hSfaXGyFPlu', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVG9xeVpRbk51YW91cEM3S2ZtUXNWS1pPcnlTZWlYQmNUZnJRT2I1YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294344),
('pEBcMslKDj4hxo8WHSI2P5CrA02nrimyu3aZ2pwi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEp4UVhvNUhYMzlXM1B1dU9pdnN0ZnRiaUZIQWR6UXV4N0h6bEQyVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770300103),
('PG1j3g5kZrXH1ezg2kwVfx6ZVUdJaGtZE8ABHvKo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHVrSHpMVDVhOTRHdXJyOVJXRXBkZU5ITm45MHFWR1Q4dDRnRzVtTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297941),
('PgnqjQaSPXZPiEHvPUpPDvyaUPbjlidxhi7VLclN', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0hmb2NHMkU2bDJ6QThNdUtDZHByb1RtajVFRjVxcFBDVTFQaXlMbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297063),
('PixcjIdV7EaqVbqgIbzZOZPJoFWMqsafqLNsr11U', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDBiSjdHRmhpQW8ycGlVZ2ZnN1gwamlYMjhCcUdBbHlRVmVsUmxzTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298969),
('pK0Uv3FLxxRzbxaPJWMJiqzUQjWHVquKQ9wUz0gG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDlOb0dYcHhEYlNoY1BrWVBqMTBvRHg5cTYwNk1QdG9vVWVGUHg0TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298793),
('pM6p2GY238Ddp759IJjxvh4pyEd2qHNapqeyvnjQ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVVl2ZVJCVXRvTWM2RkNya3ZOMFl2MmFzamlpNnYzMEluZ2REeFFueiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299856),
('pmIuz3grSoSmbIZcU6pVkdUerrNYouSccZ251lpI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1ZDSVkxNFg4Q1A5SmlvVHJNanJtRGY3cGhCQWt0ejRVNHZyY3dZSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770300104),
('poBAlyMXxeWhkkk1BGs4rIHLWzmoxXAMu791R6en', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidU5KSWVWSXNpQ3daejFNVHJIdEpOM0lKOXBzUWJMT3c1ZlMwclQ5UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294165),
('ppQmG8zHrAQBotqyFP7UEUpAP8HnYFsjjRrXbGUN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibE5TMk4wM3hxRkVUdmx3aVJOdWFXSXNKMkVFNUQ4YnkzUkFoWEFCTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298804),
('pRGUfbfulg2CCRRIIvOrp0HOOhu7kQ6IctkBa1Fn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXcyZ20xZjcyY09qRkZsSVE1elRLT2ROMmFlbGRlOGpidVFsMllwMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297845),
('pRq3BuOHiOwN0T5uBKt7H5VtLbwObpXztrQtEA7g', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXNVVkRRbUE2WkJVeWJIU3BremVXaXhKUWlVVFRzam5aaXVLekVLbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298805),
('pUCTzMK2LeebM3DAKafuD8ZJ0ZEeFQkzAYMwDubN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3lqa05ScG1WeWNiaHdxVjJvVm41Q3I0RzVCQThXbDY1bDUzWWVNeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298809),
('pUZRkqmgMSYZhoyL2tKd1bPtvFrhsxiuSqodG8hq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVduajJhZTg5SzFiS1RZbWNMeGNCN0s2SXBHbjNVamJZZGp6MHJXRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295266),
('PvezVk87VB9zjTiZB6VePFBuUOFjVTPxPlJnLzgC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkN5VU9nNjN1dUxWZmVnWmZvNGh3cFpvektxY1NXV1NscjRpZkFzaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294321),
('pxIFRq3bT4jEBAJkXeCZPByccFJfFgwPduV0SmeE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnVVQk53S3NBSkUzSnZuendOSE5lY211MXZpWTA0aFdTQ256ZE9RWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299592),
('PXtPmooDRQfaYD7RnpywFhDaFUIANakhUagzeHDJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzJPaHJROWFNdFltbXM3R1FMeUJoZHQ2V0JId0t6elZxMUZaRGJMbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299592),
('pYF9vmn8vlRs3AfKlsIwn2N67yydWNz1sTcJMBGV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWE1TU9DTDkxZVNIVHJNYnNTdzY3S29qajQwNlRQS3NjRlRUZldLMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770293408),
('PzWnuYGtsOZTj0EwBWwPloYyHMUglLVP01nh63vf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3ZkMDRacjk3SnNhRkFkTWg1YmtjcmRzSFZkb1RMRFZSQVRaWjh4TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297816),
('q1c4iN3U3m1LnLdyURTZXKGXVqXrvDXRwm9DKZzC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZW80UlRBaFQ2ZXcyR2kwck91b1Q0SjRibnZXWkRWRnM0VWVOUUhyVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297830),
('q1H1XloSuNAqf8L2WuHOecBUvXUnV8ow4Mdl0XO0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicXpVaEpZVjdyVjdNeG9vUXNTMFF2T3RoY2pLMG5JcmdQcjRwSzBNMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297832),
('Q2xGjJUVLGKePJ2CJ8GCIiBF83JjqilxtVJLMsTL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDh4ZVhxOHNmMnlPY3dEanE0N0MwMUZIRWlTcW9zYjZXWmlna2J4UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299491),
('q3KNztdbmELcJaehdAjLaFMfXv6TecgLjMI3q3ND', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVVTVE5lRlZkNHJwWVZCUjNGYlZNSUNuWld6OUhOWG1oTGtMMmVHbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294196),
('Q6JEsgP2uHTdFVxYacbIvh0X3BPVQQiqeKIkTeDB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieE9hNlJKQlRGQWFsUkZ3Q0cxNlFUYm9DM0xqSmc2Z1B3WVFxZWFJNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770293334),
('Q8DlPZFu1k5wFidMxHaQlw7Wq8xMl1PY2AStj8kM', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVE1QWEdmdUFKbzZZMzU0Nm5LRVd4NWY1S1B5cDllVHk3OUNLSm5nbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299817),
('QBUmOy7LlyD5octJYGbxxeBA6d1EzeSHzCCupciJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFdiazByUmJ6Wm05S1B4WTRjZ0QzTlBjUmhlUG9veWVDWkZPcFJncyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295265),
('QcUshjFNjDa6DAqoVfqW9TM1UejS6faEhmZMdLUL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFlhRlBRUEEzSkxLWngxcmx2ZXZwam1CaGVScDI3QzU3aDRxVVRRciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298083),
('qCwRtyzagkmx95bbCOzvG2o25apRVOeow41T6gHp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2kzMG92b3dsUTlUV09uNzVRejJMZW5VRlJVaWlKQWM2cVl3cDI0TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299750),
('QfQvEu0MrXQxZKDNcpqbzVYxxhtG6oZJB94KuQzg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0tUdVVCcXU1aGgyUWVhdUVqbGJGVlBtY1ZrVXF0TG9rRzRrYUhSRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298777),
('qGKwLI0dgHLTAIUlSzxRn9crVa2rEzVw4U81o6ka', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDVacko0SnRNYmljeGFIanJ1WGtLcnV0WUhhdmJuYXZSWjlLbmpmUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297943),
('QJSTFuLvu0vXq68kLn8PPo3zhPRWWfwpbGfxlI7K', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibzZmUldFWjhMVEtpbjhzVDZQY0M1ZUc1NjRpeTY0clIwY2hyNVU4aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294185),
('QMFMarUvZqeCMImX9F7xQIAG1r9iUmQiIiOVMIcV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQW9Eaml3U3d1UkcxVTFyUlAwSG92ZHQ5Z0QyeDMyYnFJREYwSkVGeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297942),
('QOfQfohDq4Z4xuylyZJzMV7avUfY9iIvpXIbNeg7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQlVqNTZKN3ZWdWFHU3g0dDFWRklLMGxGUmUzRFFtdE5OdlN3ZE9GWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298091),
('qRyKy3fTcGaBup1pePqve1tNdLdZiiuMI8AptldC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGs4WnlGSFdGR2VVaVExanFUZElIa2VQU01LUndUa01aOWpneDF3NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297843),
('QsiaoWG2yae5RhDH7xnEmLKEQVXbGoXyPeHZcYHs', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHI1ckQ5OVRrME5Jdk8wZ2xWTnZzVUlDV3ptNWp5SDJzSE9rbXF5ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGF5bWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295358),
('qt1evfI6tUo1x7yWqonpfAYQhF0SVP2fiS6e8Skj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaE1KaDc3SVZnSDVvTWp0djNWSEJ5SDJtWFNNZ29ZY25lanlYTTZSSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298100),
('qUrJyaBBD4SS7Pfa9RdnDNcaVTp0zvUXBwR4KxnT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzdVNWJnUVhvUkJkSnhHOGx4cVlWZDc2UGdXT2Z2NE8xYklGd0tHUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770297943),
('QVB2xcD8wxQ5a9V7es9ZXu60sDQy9hJ00ODe3vrL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFduTzh3U01zVUdwZU92d05HRDBlTU5LbWNuMzhDWXBnNE45RnltNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299822),
('Qx4aX5DpZok07VUpRgblFevFggcqJRatXQ70HeAy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWxVdFFmM2VLNmRVemR0R1QwYTF1dE5jNFdJZHZVUUxsYXJZYXhNQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770293409),
('QyqbgczTl6RSr1aaJf2CI1iFtMdh80kNGU5Q5Jn9', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXFFb1ZUWnN5bUtkWjR5cTF6VjRwTVFpSW5yT2xBeWx1Rm9iV0ZCMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2V0dGluZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295291),
('qZJnRREOxy2YnCMdrv53KuomDOWGbD9y0RYZVrlS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFZ1ZnpRcjlWZEI5ZDJGYmdKZUtlQzZjYlBQeXJmNHFZNFhqOFpiMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299860),
('R6oBC9BtyVzZI3uVDklMlKMuaquMoaZkkmEn9s3b', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGZPT09IY1piQXJlQW9mYUZqNnA5bTJKOGNwRUhWeVlWMTdnamt3YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297830),
('RA6WMWcWhOQ6vTAS9GwSiC8wYWIVXbOHjbaaUEHt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXpCR0J6R08yMWtPNUgxeFB5NUZRY0NQNkJpR3ZpUWd5SXNkZG80MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295277),
('RBbXkN9AXFCQVexbUNU0dseKOZu3nTVkAQuCJMr1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTBQcHZRY0R4dGdrcFMyNzhtamxFVkFSalRhSnM2U0FacGdsZ29UQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297830),
('RDI3hdya2GOoCwg8BR7GtRKO7Z9I4a3VM1qOtsid', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1h4RUFuQloxQWlnZWJkbThUNzBoQVpMR1FBMDFSbUpkanZkVnJFUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770300104),
('RGPc1wgrRlFFXvQiD1qScJEPxxii4EAs2i4J9QLp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3RGS3V4MFNxSlphNG1hYVhXS1VFaWlyekFBOHZON0l4VkM0dkZKTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298770),
('rGY5eeF6WrHTj9PlvBdh9e9UPCKfIciqRWIht1zg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlVHWUVKcXhSR09MQW12UlNWV2hJMGs1ck5uTklIRzlVWVdsOTN3ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770293334),
('RIAiQvhNybi4NfMIycQCsXp9aGszr8X52hEsuWGy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3A1aHJ5dm45cEZkWkJQa1NTVUthTG5vSjF5M2lHajdvZzJub2tlNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297830),
('rImyCAANqvEiE9EPvsK1EXgPVPBL5Kitx69YDEUl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1FqUEZOdUNRa05oQlNxcFZlRmhGdnJVYlpaaVdOUnptN1BPRldnMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294286),
('rjiHUeLgqpQGSw5MJkPoabVmkYywK9msYjECYnMd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFprWXVFdzV2VnV5NnZZbUQwQnVWWUlyZXpKVWFkc085YmhtNVdLeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299851),
('rmG4YhLk3HQow2FfgWf1Of1BOm1iSfCTmktSYWVW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXozbDRCc3l4cVlKVXVxQ0dhQ2VabmNTMXoxNjA5bDNTcDhoaGUzbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298820),
('rmI1K3iO6zb2bYIobMdeu3b5IZZVOMyii6Xmdc9M', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGp0M01jUGs1aW9aUWtNSUZGaXpJckZmV2pRaWpTOUZ5NlJhem43ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294175),
('rO8i9MAU7FimQQKwvexHfxy3VednsyIXK0iedZow', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjJOYkM4alhDWUIzS3BoTEtIZXNRN0xoR0ZESDB3WTFWd3F0ek1HUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299692),
('Rp2AhwzPVv8YnrA40dHQe3XC4eTB2YWfcoDU4X6l', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0xhTXlwWmVvTzNNdm1KM3FCVzJGWWVEaVlwNGl4MHRTeW9FSkJaQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298816),
('rpZ58JPuyAmNkg1GLVrXayF0pu5ZknjGIvY5w5HY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibllBRkdicHh6MlM1R0JvWjFJUktyV3NsN1d0MmNRSzBlbzV6NHI2ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299827),
('rqnpv8VFbFYBy7Rhy6sTJ340E0GmAmTL42KKoOzm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUENLdUFYNGxsVExpa3dkZDNscGxKM1A3eUJSN3cyWHNEMWFlVWxENCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299815),
('rRzjH9ty5XxseaBZqcod3LXLZsw21NQUVLaDiGJO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmRBcEVqN1NFRm0zR2ttUVcyeUkySEcwWHpmb1gyRG9KUWdCUG80RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298091),
('rsSAr47ELR1KkbGJWPuWNXjTkU3L38xMi8pLRybu', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGJ1OWtuYkhwYXF2UUx4NjZyeFFTMUx4VUNrQUxITUxibjZxQkFFTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2hpcHBpbmctbWV0aG9kcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295375),
('Rt7bWDnDO2R4f2oFeQoQuVnjHtHoniGTDKWsxRij', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDdSVHh0NTBlNVBkOHE3M0NINzhJQUlQa1E5NVlPSGdSeTRZbDJsOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294320),
('rtBaZROIOgTFahZVeVoeShiHjHVwGa6slPMkfdGY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnh1S0t3ajNOdkd4SWUwSGJ1dm1XYTlsanJHZHFxWVlWeUQ2TzRGcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297934),
('Ru6SiKY0gBlBU1QQhxPOBB8ZQ7StFmkXkF7mJ60Z', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDExR2JrRmNSSVQ5SnJaNGhpSjlnN0I1bENqVUdEdDZQWlRqdVE0VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294319),
('RvLoUEmoCLIuSB4xreRFuG7EMDMcxm3ObmQNEXfS', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialAwWnE2RDdPcDZFaVF3a3ZCMDVtRG9QS3VpdFZPVGc2OFd6MXduWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2V0dGluZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295291),
('rwan4SP3UWKyCofv2SL57hQwFfXTGQYKby0ryQBN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEFTbXBVeVBETnFQQkdKbnoxdU1TUHowTTNCazdReXUxeFN2MkxHciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297819),
('rxpUycghMruvJJEmSrDIZfrFiaso2acHEPVxAZVd', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2hJbGpocExTRDE5STVrekNxcjQ1MlRINkVIbXFsWlVvZlhVc3N1eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299817),
('RZhx5XdS04mIyDakVnYzQjAfJH7fYrSaOozJMDyu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1dWMU10TXRYRk5sMHQycDlSTWFSUjFmSEd4aHpSZ2N6ZVdhWmd4UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299693),
('RZtHtWfRcXHl23Z7r3E7DyJB6qyosto25COBlQp6', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoickl2VkhIVFlqb3p6R2JLdXdJOG9PMlBrRmJzbFdWbWxFSzhhQnNGVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297229),
('S0Cn5tW8CDniCjNPG0vQyJBGqcmIaUnSsatpDB0k', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFZRVWpENG5ZYnBCZTZoVzlwUWJJOHVHNklKSG9rY0lhQVloUVVzYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297251),
('s1zwxICGQrOuuVMD51RxKk7iAmFhuWQj2r612X5Y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWpSSG1nU2JUNXBZVktrY2NlSkdtUzJ3TjJINXp4SFhLc0VWdFdwSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297842),
('S3MWCOFUuucwH22E79TB8ynS9TSjv7kr0jFepMjw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2pNMnFzY0NCazFLeWFvbXd1NGlQQk9HQWVxbG5tNnBLSXk2YUllMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299599),
('s3VAxsiW2nJiJDIKaG5L3EsV1TOucDSVEezbaGHo', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib01sTDVIbEpBNjNBNkdtMnhCZDh6enozVVBJUmFqSHpUZ1p3ZGp3VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298817),
('sbRbf8MqJgrpkkwCMdqFdY1gjedRuhNoGdQAAIjZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTVBSmg1d1FOTmFKU0NFd0xtRmcxbkRlUFRNdWw4eDRzdXUxYXJIaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297833),
('scejlpvvPnGEWzP7KAmSKn12gmqdklnCcPq3HHvh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTN3ZkhpbER2dldlNHpQNDJ3NUNlczRldVZkZEREcnhTMFFYeG1FcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297843),
('SDVavC0Vip1r3o3gRqNIPdRiiwXYHsP41xqjiTE4', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUtIY0JDMXRoSzM1U3FZeU9Icm1tYVpJUG52NnZmZXFaVmZMU3ZwMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296510),
('sEmx0zm96UbOBhnZGAocGBicoFTicCiqedqGSwLR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajduc2ZkSmRxdkt5YXRzaldKYkQ1Qnc0dFNodGxvUGtXTWpybTdzeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295427),
('SEZYe1HyfRlBwlV6gXCpB8sA0EIvoF1LrUcmm2wu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienRKZDNwdWk5c2ZWWEZhUDNCMmN4Z0t3dGViZEI1a3JRNGdPVHZLaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298822),
('sggiBhAfta5QEXTdHTr6aAqBkZrzkdDIrpJ1WzPX', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWt6OW5pa29QY0JPUG54c1BZTTRwTGhBQmxrZ3NpY1QwNGxubHJWVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295427),
('shr1rwatqg84RKUMe5V5dRGmBo0im0ZtBgZJDbwz', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3pOc0pVdktnSlFQVVhnRnczcndnVmU0MndpMldZWEZWd0g5YXdSaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299597),
('siwoVGkxGrFumsSIRoTVzvIfMluWSxmgteiqhERT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUdjMUJjWXhHaVo0T2kwN2VsdVZvVGZmWlR6VXBrdEdxeDBYbG1uYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295383),
('SlHrs4z4C1B2P30m7tMDGi8iaO2cgVsuKxz7qRqp', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHlTcGYyWHFCTFZiY25FSFFIdFE1ZDVsTVpOcXczdm1KUk1MVkUyWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297272),
('snBidWRNHawiFWjWeJyzKadkYRH8Q9MQPpqp84nO', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmNRUWNhcHFOVVllUlRTNDRnb3pEakdFZ1h0WkN5UDhmYzU1TnQxciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297228),
('sRVteXLeNbXr5rkEwJFIkxQuXs1If3sFiQfhRQPT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkRSaFVpdXVWRGJDcnpFZ09qT3lJbDROdXdJV0I2VUxZODdHQllrOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295266),
('SS0Ffqc263Ki0wmJbmaoYYarNclCBySq8kiOFrV8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMnE2QW9xVEY1SW5TajgxOWpGQ0Y5UGZoSDBFbVF1S1FBZzRNYnNSbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299598),
('stArBKXhVx8u4eCwAiPA2sT8TSqMoII1Sb1dwTFl', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0s3djduZTJ5dklINFFMMTVaQm1zRUtqTU1WWXdMVnQ0eEVTa3hPQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHM/cGFnZT0xJnBlcl9wYWdlPTEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295390),
('stXqkhKllmJOOUDPwdLaQpKKbrDmfzvx8fintXB9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMml6ZjIzMGhKUklVRHdESzNsaDFDN2Z4VzNsaXpjeEhxMDZicWlqYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770297942),
('svIprOPijgAGYrW46pQPtAVedz0O38uzPo6aWjYZ', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEpFV1BIYTVoMnpFSmV4YVJjd0htaGRxWUlsUmFxTnZndDBhNkw3RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2V0dGluZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295059),
('SX1EiPN1UX3nWfsudhRVKZu5xt2FU4am6Q1GoVKc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVW5tSE5PNWZ4THVqY2NuWWtUZTJvQ3UzR29LaGhRektVcUE2Ykg2WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299783),
('sXZTbNw9suD3EAQ0VHcrRjUerFPCfWtozEwxz27k', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGFlUkhVejBxRVJIc2tYMUZ1QnZPT1VHUWJYeFVFb0pRdVU4d0ZTbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvb3JkZXItc3RhdHVzLWhpc3RvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295373),
('SzZHpzIsPC9M1EC3mR9isnl5CKWhdB7ceBhzxIZu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHlkcXVFenRpdVFoR29CUmF6Q0ZXYk5nUEoyS1p3NmFkN1k5YjNFdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297819),
('T3g8Ouhio9I0t7IAPdMlPOucxBe7XPa8CAXDuzTR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjV2NmJuYlZWaXptT2hMa0hERU5sUTFON290MzdqMXBBczlObjFVTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297831),
('T3HGstemQhmRkOf4lg18dvxiyGLbf4lDgdnFSkrF', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTdxRzJPQ1NxSU1kdjAza1dXTHIzdlV4S2ZhcFViT0JVcHlVeTh3ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296037),
('tfDNCDiXlH9rBtTecqLy6oHMOiCsvudTC41iIJ5m', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTQ4S0tZV1VtSE9xaXp3RTRPeDQ2Wk9ObWtvdXlIbGNvUkhxWnlscSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770293410),
('Tg3fLR10O6mNNyVzsuHgbSmnYf9dcT24Y1AymSRr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnQyR29uQ3ZGZUx2WXpUNWFrWFFMZGppVEtWcFQ2YjI2U0QxNEVWNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294306),
('tI3iz6ROOCOrpSTI9siDBRDij5wu53CwwRcO121V', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGMyTGlicnFVWmtPS0l1YXRrVmtMNmNza2JodHFzeHhSMUN4T3FHQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294337),
('TI8f7kDIbLXzR6EFcC4dW2n4FFiN8pRIsisgsqkL', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGQ4R0ZDTDdJNWhIVTNtcE5YQjJUcjFBMVBLRVY2ZHFQRDgwMkJ1aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297284),
('tmrmOcXM71b3UJxFqENcVnw6qNSMNRQY0n1OfUA6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGZHQzBQVExlbk5rRkt3YkpTMXA5RHN2bThmTU1raTI0d3hmSlNxSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295272);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('TPGIEv6vW1FzJILqkNNaWtwOXEKutGtn29oJpU0W', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnNLTXJ3dGFYVUNheUZWY0RhRmUwNmhTeGE3ZDRBMDhMUGltMXpibyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299492),
('TpuK1LfdMeTWZk94XFE5CiKR3jxaAEPtQljEBEqI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic29vdkVleGVtVzlVM254ajdJOTB6WXJBTVVBZzdpWHJITnZ2d2d2dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298971),
('tpuZg7d2xjgc8XHmNusEr0viXX8p2iUZ6rmOsLR6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2Jma2V3Q1h1NUZyOWM0U2ZITmdLNXo3b3ViSkcycHZpM0J0Vms3TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299851),
('TTPsyGPs0buI1BLydXM2fMbvRFTPweM2eQLioVES', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVB4WFBxT2xNWEdwM3ZaVXprOW9ZSVk4d29yVjUyYkdWbThWS2lnQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770300102),
('Tv4umNilIAYrYyHf9hLp8MbQUf916Kk2NxfDTVcZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0JXcDQ1VHNneXp6UlhXQ2NWaGZ1aXI0eGZJYllrZXRJYlpKdFBaYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294296),
('tWFD83bNko9koLXDDNaQmbRIczDdXbwzE7vmOxZD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0d4OFpUMDZZcHFFRDNNNFVaQml1TTNKWFZmb2E3MVVCWk9oMHpKNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299854),
('uAXgeGcB1k488IHoQqifCI0eNrmVj6IXkdMoCwe1', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2xBSWFwOFNDSXVpTWdYOHh2djhUb3R2QjRBaW42RkNqQWs3SUVZViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299854),
('UFv2kzlTE62BQACKsR0mRVBkJyOjC7Xl6UVRAO0y', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWhJREtZUWZETTZOdzRxQWsxbVB2bzlxbTNRRmoyZVdPd1RGbVRxYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295269),
('UI9lMxVUVcHYLMAOyhvhQwhODaawQMVllp9ZxDyM', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTRWNVFHOWRUVUQ5T25XNWtXa0RwTG9sNElvMFhnV3ZNTWtFcjJIZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297284),
('UilR9Ff7s0KZSjjJb5K1520PwJ3jYNjv6vpWcAh0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWtXMW9LNWJqdWZ4RU52ZWtJV0RPUEFnaVF4dVlyd2ZFdmZrVE9MayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299859),
('uJxzYN0wr6HfK3hoVWb6WePHHt5qU4vmT3UbAfr9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFJkRmpNdVJMUmEyWXJiMHpDaFBsMFJ6ZnhDcGxlSjNqSWRDUHNZUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297949),
('uKRHXg4uP6cFZtpiFJYNPEh3JqnvNuLld550AEzn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHFNemNIc0tWVjBZeFdWY3FMV3hsVm1rSEZhcW90aTRnQjBabmNaayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299751),
('UKYYGTtXrpGvC5IpjeQ3jMaz25TKrjcQCOFh6cJx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVllXUXAyVUxnTHFUbzZjUHZoRnlTWGt4ZWh0Z3prOGFmUTVYUGFGciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298794),
('uNnm59w6RH1VxaxPqp1fQnH6kx4UlAyfbGS0hyZY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTExlOXRoSTR6M1gxUTJBcUJ4SVRHcHVsdkJGMHJSWHZtVnYzOTdLRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298064),
('UOtwEPR5Bp2QNaUu49jZnrjNti9Flllryh3JkcJH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWVCcXBGT1ppZ29LZEQ4cGVqZzhzNmoyZ09oUmM3TXVkSm4yYkVEUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297829),
('Ur4fKZCOQZEp5vhpes57z8XrkPPM8kxrhd5mLl6B', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDhqMERPbUh3amVRM1NJdUNFUDFhTVVveTFxSmFYNVNkcVNqYTA2SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294300),
('URtxK6d4kvhDyQe145QinRgcaZgUw7NiWenMYmXA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFhFaWlYOGZGSFJ5WGlnTXA0ZEJVeFRGek5tR0FiRXRTc2U3ZFhWRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299815),
('urvOhZofgeKGPgS0z9rdrMj8z7FLanLIjjrakcpx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekRNYkNIMmlrU253M2dsRHlUYzRMT3dBR0ZzaUVESHdoNmEzQ0dHSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299756),
('uSXfbY207wB9LNrcu3kbrISYx4rZfzftK02bv2tb', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDM2dkFzM0NMTjJ6V0xxVzVpYU5rc2hmMG1SQ3ZGYWZKVW82TUNFbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297387),
('USywtbc576rdREq60dd0M64oJJJd6D4e8NKWFe1n', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiWkNqOFJVT3lRdFhiTVFIeERxaU4xSVpnandjQlAyUnNHUHVOUDhUaSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297839),
('ut9lH5xIOYl7vyMla7fByTeSTOYBhYUoILhWdYsg', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYXBHaEgwN1Z3SWNZRzFzaFg3RnI5SEUwS3FaVmtlVDByU0RTbE1FNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcGF5bWVudHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295358),
('UVuO0DPMFR3PfOTl1jaL67CNAueNxr17HELksenw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVlnOUFIeUg0NlhNMk9vdE1KUnBRZ1lNTjVHS3YyNlN3UXA1UmtRbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295277),
('Uw0V1usdcfl6ofu7Sp1n6By0IwbNZ9NSNf8nQlTs', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUZGeXJLZDQ4S3FUMmRFTDExczVkSVFmSWFKSGxlRXZvSkxxVndsRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2V0dGluZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295220),
('uxapS1DzWGJhPsG7UwYeR0x5FiRW3fT06OjkCEnL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlRVNlB5aWlUb0ZXYmlQbDFwZXdxU1lJQUk1bGc4NHVlRVhMU3pCcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770300101),
('UYBoMBy9xUIbSGJcEL1VxReMclA3FZd30eCJ8pBb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmpjeEV5SzQ3NjI4Tk0wdG5tNnNia2VEanlLa0V6YlQyTVhadTVPTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297935),
('uywLNmLwSl1xAjnTNnY35czhpI1OBA5hC21WbSAZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2JlOXZJMjEyU29CdzNpdVY3a2tlWXNFOTlYNDdwSVVTSjlCZVpEViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297833),
('v5EfPHcldmh14QMVL55BQzmWmegv9emBtWXEistH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0RCbjI4Vm1UTFNWUWJvUzV5VFFFS0xJVzhQaGZDY2N4OEtuWnZDeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770297833),
('vCbPNOxOxPqBo7DbINxuHKfsZB8LE4LxT3vEJL6F', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEZ4bEJkQnBnUVdOQU9DNUNpWU5PUUR5STdNQlRCM09aTXpkaGVzaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294309),
('VD4rb4WiHendfGiOdNqTDuisQ5r1NqKwCSKa3SZ5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFdpRldhb01zaUdJNU5qOVBXczBEYVFSMUx6akJRMnBaV2locW10dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298807),
('vDqhaQok4X7hVAsHOdjrmTzKugj5yLtod37wZLpL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2JHUWFlYVkydGtGbE5CanJvZHdKNE9pSk40c0NQdlVDZmdKY0hLRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770294165),
('veGHi2aUcLjF4m26rR03A2iaEAcfPcDEJjNe9GZr', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1JmSE1tSjRDUDZOQ2VXRWd1dUVtNWJsSTJRVVdIUmdQOGJudmtGMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296030),
('VfQfME7HJg1C3bU9giO0J2tHfcJpmtrxRjAkelm2', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUERhMHp3R0E5cmNEUEFEWExUajVXM3F5QnZkRGh6RnlIbDFlbFFXUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298804),
('VgEScg9z6py09TTHlLsvzwD1xnOrtDs7apgVJYOR', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDd5TEl2RWozYms3QlRNaWhjRzlBQldRUlp5Sk1ldEhqQjVvdFJ3UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296493),
('VHrLOIuINo59QHeDxGcVIKmXUjIi26gGBHnphpmV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2VGNnNVc3dqQ285STUyWjFWbHRhelFybnJ0VTFOOGFwdlpQTUNrUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295272),
('vO4ewpf3JwsNbPgGVWv9BIdZt36opMiD04vNDiJi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMm9BUlExODlNT3RBbWQ1M1g1QXRKQ2VMM0hRdmx5SWx5cm9ZQlJUUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298804),
('VpQxYQ6cvb665Sipz2ALQUZbfgHPhl4xXwR4I9F6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXVZN2xEVnZ6cEVqQnJKanNwREduaE9WdTNCVGlJOFN5T2kyaTZicSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298092),
('vsoR213y9hqoEG6CsZpFh5hzJYaBAOdmbyqgt4Kk', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSm1GUFZIRnhvNmY5MjRmNjNiQXJnRlNWRzhoREd5UDhUUllJb1lUMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298066),
('VVPVaVewuBnkimCdH5U7SB33MH5q4ypkXw28C9FT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTFtSk1VaUhSalRsYkp4Zm9lUXpiRm9LdWVCZld5OW03blgyT3Z2cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299595),
('Vw8gtOn3Q7oo50AZM7SDzkjkxBKKRxtw4foVYzM3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGdJWk1IODM5eWdKNkJSMEhwalUyWnNhYjNLMGlHRmRzV3ZRalZPTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298810),
('vzJgIz3ZnWbCBF9exc40AAozeslY5pN8rxwZFUnh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODd6djJWNUZoMm1rblN4aUllZFJGb0VrOVQwZHd2UmQ5bTZzcFZFQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295276),
('W2LIYWyEKbzwc87He7EHJWyAl6CaB3SzdskW11FV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkFpeGxRcnp0aGNQa0xjTngxdkVvcTYyOFZFSlB2bERmQld5S3Z4bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294303),
('W3yU7FiiXznqs7t1MrneKIOidl3mhmASIVe3pkcU', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzljRVEzM3FxM3c5T2F2Zm9rNEFDbTFJZ3BPUjF6NlkzTXVDQkNDSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298307),
('waTJOYIkPb9aTCtasB3XMxg5ErardSLqGrxTmHdG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlBCSW5Hc0ZLR1J2Z3dtNTRwRGtlUUpFYjJkTlBvU1dLT2wxc21QdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298099),
('WB5gvXz88Br6hMR0PH3Bz18t4Vzv07hHbLiZ9iKh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGlNNW1yOENNNDN2TGttZEQzbWE3Y25rQlVLcWcwenpScDlmQzNPYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298822),
('WBcNrzFaFKoNM8d5twFgB6hTYFRCL9ioSYm0sDSy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3VkQ0V4VjBZNU1HYUtXQmVZVkxCMWVPSFdmaTNRVTlmVUJ1VzI3TCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298823),
('wFAS08IOtHEnOSnKfIlgFvKlGKYeFuHBn7DlGecg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.109.0 Chrome/142.0.7444.265 Electron/39.3.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0pGWk9oM285Q2xtNmVFSlBkSERIZTNJc3B5WEpVdVVSTEpKY09veSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770301309),
('wGFPyiqAZoX1TNMszsHe1CFYamjt8VpyWenwUBLY', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzBDNWhKeG5SaW1yN2lOMGxUeU1sY1FBSmc3aHIwTkU3NDk0QzA4dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299693),
('WH8VdCt39yHAa8IQ9r7H9Rh1FtYQBLeUS4EFVwGN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjZqMmR4Yk16YzNaM0tXNFVmeERaaHp4ekcxNGk1R25qTHhkS0pLWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295425),
('Wi14KpI9dYhuYSzZZxQ7tiXkTeVBqNwOYLzIdMcH', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEppaFlMVmlBSEVBV0d3Zm1MdGtrQ09iTnc1YU5Ed3M0UmUzZjVRVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294350),
('WIWMo71ZHJvPkyTwcKmPtXv1w9iGuSv5c35eWoiH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjFhR2xyNmFIdEZsa0N1R3FxeEFEVFZtYmhJWUJxdmhpUDNvRWVrMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299781),
('WjYf6iupMn2eeeP7KpdkBuIbuYeTiltYil2BnXz0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSVFoY3NFTUQ0Wlg1YUxXdUZZaXd0a1ozeHdydFVRVVNHZHRaSzBKbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294289),
('wkRIryJJkXlhOZ4uqLXWwHPEm18fEbf8KdZOE0Mj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXIyWkR1eEpSNE56Z2Yyb29vclQza1Q2NHZxRUk0WDZKMG51RWQybiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299860),
('wM0irWanpLYr61vhwxpbBPcUkuhxQCTk7dm4x8tU', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1ZRSXR3R0Y2R3ZiUDVuU2lXTzFHMkpjN2c1Qmc1TUtqUVJvUXB4dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299595),
('wMFVLWBh11bd73GciMP8EtVsIBkGotcNHvGaWkZw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0R6STFjU3R4NW1iMVNBbW54WGtXdnhyQ2tBQVVaeTlYZDR0Q3p0byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770300104),
('WMszT0E2zQJde4U78D2ATf2KYAG1CLYUDtBVAEUW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGt4TGpOTEM4alZXTWpwNHhUSkpXNzBpVmx0cGZCZVZQMlg4STVRMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298082),
('wRwPBOX7vKcD4VCKkYLLwDdd7X2Ryl4JidrCNNHD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWM3aVltVGNuUWhCRlFtOG9PRmtjaDdlMTlhcVo2YU1VVmQweUtMYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295381),
('WsT0tpj6KPECu75sWAMsxUhHIBzg0AI9ZG2LlhIi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnNmajJkbjBmOUdTSzNjaEx2WkViS3p5VHNOQVAwN2ZHd2NYNW42NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297842),
('WTFTr9bTsl75fkeZNXkfx1tOUEzgJtQ2e6lCWVqQ', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnNoelNGVjROaXdlMlZiSmJiNUZGUmZGQ29pVWNuQXhON2N1RFFUayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297809),
('wUtp4X1lvoiQXLFCREMa8Ra3aaOVrdDOzdeIj9fe', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnBBMGxUS1VCOEpJV0JNNmJoZXpQeDM2TjBNdlR0bGkwRFBZMDdSbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298777),
('wV07CPWSoK8BpJg4wjKjhpvkQrUoekIxqLuZvXDi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1JTc2tTZ0lqQk9USER4bDdhdmNVWE1oNVBpOVYwcTllajBiaW9XcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295272),
('WygyrTs8fwMj56hKct0PNo2MWXR73yPc7utUB8t6', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialRWWEc4WDVnWVJYREYyUklNV1hTbWp2eWsyWTdUaDZjcHJVSEhNWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299751),
('WYJeiuNjrhWvH0T7kU3RNHiyLDQNmN5SvXO2YYzc', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXdqTU1EOVZncEtkWlA1MWRmOFFpQUxXa2taZWhrU2tyRHp6Z1pZOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299598),
('WzfmqAKvQULQgZLexadWEvJx8wYY7Uk7Oobzb7Ka', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibENvY1pOQjlKTVp3ZDBudWRKUGQxUHRyWkxNNjBqY1lkaFlUMVZhaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298941),
('x2kVpr0qqwdeeNr5UXX5hJXb0r35wWw0WaigYAGG', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmZVTjUyN0lFWGR6ZE91MGRSZGtlNTV2bE1rVXNkSUlSb3NkQ2lFWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299834),
('x9nDqaa1FSBRZlJYCPc6Wswf1VO3gyc74NgFUIKZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0w5dVRGcnVkTDhJNDBGN2pXd2tuQ2pBaUF3d1I1alVHeTlFeEhkQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2FsZS1wcm9kdWN0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299757),
('x9U62bYProfr3Nz7SF1HpYfVyhrbb2UNSIYKO06r', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVY4cTBjSVV0aXEzVkU2MWhqUmIxcWlhVUh3YmRuN0dOam9QUDZWayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770298083),
('xcsK56IqJYNsiXM3zFSKH1BtnHdC1XQV2ZY4jQdV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXNhaFFhOFpwSjZJbnR1aVh4Q2dUUUJiWUdFR21mRGhNdUNFdEs0SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297943),
('xCvrGeS3DT50oNUGCvH1zw11hB4Ia4rcdnfcRsq4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnBpOTB1Y0RFUlNOTm9xdDE4dFdTTW4yQ3ZPV3ZGRjNON3FtdHpiTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770294322),
('xftOWthtvQ0aNRn8yQDqPZARigdOcXJvvX5rXt6Y', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHZROTkwakRFZ25oeEdIVExaeWhxTnBlVkVOY1lTYkZtcjZMWGZYeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299493),
('xJFH9RcuniMoNkvpQqw7aXWimS4ikl246Q4G7szZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnlyQkRCTG9MemdpMUpEWnpVdmNTbUxEakF1aUpWaXVIeDhLSkNpTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770297942),
('xJR8ozFfS5yfwUQR82KETFHeacELcFYZ02L7A4F4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzdtUDhkM0c3aHY3RzFtZkpHNmFiQVBYbXM3RFN4UEZGMk1tUllabSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299594),
('XK0MjWQhxutQG87SgZ4Ene3f6TC5oPqkiFTpxyJS', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWdEZ29OV3A2WjRBYjEyaDVyRHNXNjJHNTd3NWszVEhldDZISFFxZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299599),
('XOnAzlMsiP6NSR4CFAhUXNii2EDjCCoYMTcfCRMt', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGFqNkp5WG1RQ01raE1iUktJMW52enNpSnZPRUlRWnpOWnpJTFRoUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770293334),
('xS6GhC38cHTswjxzekCi4IrREMh1psrAq0HI4IxZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmFEck9icVB2T3ltVUoxbDhkYk13WUVwYThoOXE1RDlVcFdBeVJ6dCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299753),
('Xv72ScjsAl1xNQfuvXq6NwaIyutXi417afjCYIRs', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjlSVnY2cE40WjBtWVVEVnJJdzl1c0ROa2lReUpVWWM5RHJSUWVQcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298809),
('xyknQqBU5TngxLbvvx3Y61dtO8qglRek1xTeUoco', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXpSd3JIeG1BZmZBRGR5Qmp6a3NSdmRjaXU0ZU51WTV6MDRldFZmeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298569),
('Y2LtwY8MRruGRWfF0ERSb8c4s2kP4Xv8GJMxGgeP', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXowaUhrOWZWTDhDalJHb2ZZSGdBNWpUNWRoaFhUSXljN25KN2tXaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297240),
('Y40FHcXm7IG9RcIFDBmD1xIUftsTFndlomKUczYV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjVWUFVzS0JCb1BuYXVGYVVlbW5WTjduenVJMDNtTk1wMkxSNDY0eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297840),
('Y5FzpnEBwUkoG9agcfbUasgy8iNa417dTzxxhJsH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzE2TEpHdFVITENoSUdoUkI5WHRsbUVBazdldzFFemJNeFlkZmFieSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297840),
('Y7gQjtQYD2lgcH8f8mzW1qa0ANNVV91vRKpaV6E8', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiam55SWtEQktGd1ljN1ExYnpiZTM5WW1hM2ZLYk1TbTlrOVdycGlYYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL3N0YXRpc3RpY3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294350),
('y7KAh60woq5716WXQd5teVjWG7BXKYuq4MDrrY9C', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkdTY01tZ21mN0N3aVEyWjN3d1B6UWFia0NPUTc5Q09KT25lQnJVeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299821),
('Y9EVvoDLXdY0Ir77xuLWyRpzrpdwK2zRUsjiFtKC', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGpyZXROQU9DSzloa1Myb2FRUndNQTBWN3FmNUlnQWhVZlFkcTVVaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296448),
('Y9VHVlaRrZe3w4l8rcWNxtVPt35wERjoVvPOABiB', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3dsdHc5VDA5SjlScGViMUkwQkMyMmFVWVJOQ3RaTHkxYUNyZnZWZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294323),
('YdbxFiZm7LopaROsDod4xBv8GseAGCOd7PL9vjRj', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzBuQVg0ZGt1Sk5OT2lGb3A2am9OT0dqdUJWbEE0VHRjUHlaUmhnMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvc2V0dGluZ3MiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294355),
('Ydzz2J4vPXRO1vE29MDMmEaculzUufFhstPd8HCC', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicENBTTJ2eVVBaVg0VURqNG9nUVltRlBkTFdEbzhCZUNFSW1QVEpzbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298819),
('YF6qN82ZK5CdxzizrJDkmDYpZadMxbos6YxL4fqW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiem5LWDlaVjljVjNZdGxtMFJmdlJPMjVtT2s2eU5tN3MzTUhTOHIwZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298064),
('YfMVPZQdnRVz88LGwhYNDkyFjCjFk9eJPItDYgCH', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkQ0aXBXOFRoeUo1R3NVczR0Q0o1azRzY25OWHh2eTdpaHVHdEQ5aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770296026),
('yjQv8LDHNilVahiAt0FWJXfxLL3mHFPdklipcABb', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUVRMktxdmZHYzNLREhxUmJlY1dud1hmNXpIQW5nUGl3emlEdWp0WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299859),
('YlaFTIwReFSuLZLdsdx7Z6jmxSOhxbGMacA37nBH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibGIwR3lZcmFIQVpTdlFLT3dSWDg5RExzVWYzcEEyWEU0anFTSmpLVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770293408),
('YmURyuivkypSFX7VJWM8W4FjDPyyGts6i2iDqPNu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjZMMFprUGtHZlNOSWVWWk9hR0xzZW44MUpsYkFzRlk3akUyWmVZZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299859),
('YMXblXMlO4w5X2or7csXZXc5GQ9gCCR3kscr9r58', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlpUcVZaUUZ0ZDQxc0QwY2xGQjN3N3NpVnBtOTFtcFFmSVM0dTBGViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297940),
('YNpWyRED9FpqitNh3tw3yo9kRsEJYBXju6q5XRWw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmdjSGdBMVU0Mkd5SmZaWldvSjVMcGY4cjM2bGhyaUNDS3lnMEhHciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295260),
('yp9H8eaMeOGIGB2u9hWdT2fgvUhL6rVo7cV3BqjF', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTExbWZvTm1XNEZvaVpEUWtWRWQxa2pmeTQ1VVcyZDRPbEVLV0JSWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298811),
('YpSUpuNzd9hBwaRY8085bxgHxBDDUOaR6sSY7b9R', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekN1NVJPdndCMkU5ZDZ6UENyaXBWSDlFU2NRZjVObWZQcmZIUGxpUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298810),
('ysFtuUIbSUSjo056A1wvqSarPoReYNxl0T3Xc3hN', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ29hTmFVNzBRVGpKSnBTajVRQXpQcXcydmFkaTkyV2VXVFY3QVVReiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzP2xpbWl0PTYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298971),
('ysnqgTX8922iJEUPyyqLqnYWtISnBAgPWSWEdW1A', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3A1Nk5OeU9BSTgzZTZ4VFoyRFJoc294SmVCcFB4UVI0SzBKVklSViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297949),
('ystPs4mWFPR23xbFrTqYDL1IJwA0zThcHQxfBEon', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUdHTFFHZHdUWkMxRWhreG4yVWdoN3FkWEtNQ1pWM2xaRldrZVVjTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298823),
('ytKFihD6SGAK6BcIn5FmvG3FdDwJawb2hJpefbdv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicDNybjlkSTdLTFZKd2gwaENpVlZxMzlGWXNSbTI0V2ttbXAwODRlQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770297941),
('yUtrcQHFiAU3LBEApbhq7cCHAhlThxBSgO45PTYf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUJwbTB4U2hpNzRUeXNTVlB4Nkw5Mlo3dnpNVXYxZFNKZjRsR3JtMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298941),
('yVdxG02svubNvOfLwOzSrP71q5PQTxeEVzgZJUGv', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYUtlWmZ6TWh2a3pnQzNKYkFJSkYwemRQZDgyd3VPOGhuaFVTRkpweSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299859),
('YZXREluFZeU18SZYdhhXGhdwbwhcqUWfLnNyOm7H', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWpyS2Nvek9KUHNWYjYwekpWMlMzQVFaMDhHRnBsR1ZlbWgyVUl6RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770299852),
('Zao7cagV3JcgI07Bx0kTN6g2cEQfDZEF9WJsOvmw', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnZ4UzVJUG1kbVBKYXZQU2NZdW56YmEzcHhZcHJXNFZndkpVT29PdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297105),
('zd5puOnh85qx0EvpT7erd9M1In6kLjVlNrC76lc7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFlRUEh0UzN2R3NncG4wVFM4RlcyNndPQ2FjQlprMExjdklneEhUciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770300102),
('zdesdjufntxwt83GgPoimSTah54ryJkFmxYsSNXp', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3BWSFpIM2ltRmRwTHgwVXdTaVJkc3J6VTJiUXprbWRzWGlCUzg3diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297095),
('Ze56Wl6z2srfpTfPMAO3x2jHuki9bpoTDmI7Iq9e', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiZkZCQzFTdlZvUGpPeEk4bjlXVXduUUE1Y0JCcXI3WGNsbWpxeVR6VCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295102),
('ZH4Da3EQW8NFfXA3QqM80rZjfq6UsfnIhCwJ9wNp', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVd6WlpwZHVXRkZaN2xPUmRUdGdlT0tyRGMzOHVMTTBaMmNuZGIzMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294303),
('zIdXZW2Z5XVHE7L3rNRKK2I7A2g9CbzABmqcrJiD', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFlRd1h4aEFrNmdHdlpzeTJQSHVCNWNtQjRQRGxxWEQ1VW1pbXU5YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299750),
('ZIwJW05PqVc1zh4h8gjvdGgtsvHP6LGOxQAdWrvn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUERFUXBuRDNZMEV4M0FHR1Qzd1VjamR0ZmpPSUE2WkNuTHlZQm9HYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299754),
('zJW3d6WJC7uLyr2fkO8ixHYBlzUpdoWTSoTxNJIq', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkJWUmRPTmZQeXgxYWZuZnV2OE9zUmVyNDRzTk5hVDlhVVQ1a2ZsNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvYmVzdC1zZWxsZXJzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770298969),
('zjWi96sDiQRGT8H3py4LgSra0hg78K5jpwkByE5D', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmdianl1SWFBT2psOEtmU2FheGQzUWdibHJIRGlZeXN4SU9iUE9OMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvZGFzaGJvYXJkL3JlcG9ydHM/ZW5kX2RhdGU9MjAyNi0wMi0wNSZzdGFydF9kYXRlPTIwMjYtMDEtMDYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770295281),
('zlBiyX3b6Xkxz9n4esf2Ds6k7U6cRWVX10u2FsbH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblU5M0l2TVdHYUx3V1Awa3NSNnVMYjdJVUczck5xMEpHZUdFenNSaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770294171),
('zm2MJWLxCkp4Dy7esGysHvMhDIgalABgZCkrPiwm', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkFZamNjY1ZKMXUyc0tqT2czTWFkRFE5YnZsRHR5UER2aHI2OVdmcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297937),
('zppygD6ISbM78mhK75mG6MkaS6KDFWuO2nrcyoWT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGMxU1podmNMamhoZGtyYjh0dmVnaEZYUm9xa0RJY3BSdTV5UmxGSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcz9saW1pdD00Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299595),
('zqsLwNQSZbMERSIo2O7KDQ27pKoVyRO9gP4ljRMi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDZ6a2RPYXlrWlZWckpzMVQwS0M2NVk3Tm43OUpsMTdYRVM4Qk1CRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvYnJhbmRzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770299833),
('ZqV2HYFwJncNXquDmex2uhVYXHW8a7MHUv49JIxv', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0lKUVdzWGx6YUU3U0F1S3dCT3BuRUJqOXNSeDFpdzM4NU9hRXBpNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvdXNlcnM/cGFnZT0xJnBlcl9wYWdlPTEwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295336),
('Zr3owS42SDWIoSnjaY8xdXQbu3Ja0acvT00vdA9S', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGR5STdJNjBsT1hzZHVPV2VjM2s0VU5KWFBRUWpEekpvdlNwWTdBNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770298306),
('zr8TjjVsM3xmrL1fluguaOHdiMQrxZdlyYHbTCMg', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmJCRm9kQnIwMEY3cFN0NGpPZ05UWEg3VFBxTzRESkh5c00zZXNtTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcmV2aWV3cz9saW1pdD0zJnNvcnQ9bGF0ZXN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770297934);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('zS62z8MpY5NGmF7iJ4Ijf46z1CYi0irkECTvGYCg', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2VvQ2R1UHM0NHdQNVY3Sm5yQWpoWVBaZXIxS2RUQUpJY1h2VTdjTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297014),
('zUKJOvWDAxzDzsT50YaHoPPxkowREcnpMLhtpEVi', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHJreHhFU3UxRFRqNm9FcFZvY2NsSkZpMTVZeW1RbGhRdzBPTHJoQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvcHJvZHVjdHMvbmV3LWFycml2YWxzP2xpbWl0PTQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770299781),
('ZW67JiWoDrEyQGQKbx2QSnLhhiksDWcWTsiABE9I', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2piZElmQWcwaHRScmUyRFdXcGFseE5hTVlqWWRHRUc3RERERzNwOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvd2lzaGxpc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1770297263),
('Zw7H1trMTEeTaY8hE9H3bBayFONpEt4xTv604CGH', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUndzNkRUR3RmWlo0eUdyc21wYzZKY2V6azRRS3lEZmw3ZUI4Z3BOMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvY2F0ZWdvcmllcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1770295427),
('zXVDFTxFY0ALTSkHdBhxY7m0b3A3F36SjC6A3Fpq', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmZxUFRiSlI3Wm5DR2NHS1BQcHlJOXl5SFJ4Z3NvN2p0TEM2NGJOayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcGkvb3JkZXItaXRlbXM/cGFnZT0xJnBlcl9wYWdlPTEwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770295371);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'string',
  `group` varchar(255) NOT NULL DEFAULT 'general',
  `description` text DEFAULT NULL,
  `is_encrypted` tinyint(1) NOT NULL DEFAULT 0,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `type`, `group`, `description`, `is_encrypted`, `updated_by`, `version`, `created_at`, `updated_at`) VALUES
(1, 'site_name', 'E-commerce', 'string', 'general', 'Website name', 0, 1, 3, '2026-02-05 06:36:59', '2026-02-05 06:41:48'),
(2, 'site_email', 'nasir93cse@gmail.com', 'string', 'general', 'Contact email', 0, 1, 3, '2026-02-05 06:36:59', '2026-02-05 06:41:48'),
(3, 'currency', 'BDT', 'string', 'general', 'Store currency', 0, 1, 3, '2026-02-05 06:36:59', '2026-02-05 06:41:48'),
(4, 'tax_rate', '15', 'integer', 'general', 'Tax percentage', 0, 1, 3, '2026-02-05 06:36:59', '2026-02-05 06:41:48'),
(5, 'free_shipping_threshold', '1000', 'integer', 'shipping', 'Free shipping minimum amount', 0, 1, 3, '2026-02-05 06:36:59', '2026-02-05 06:41:48'),
(6, 'smtp_host', 'smtp.gmail.com', 'string', 'email', 'SMTP server host', 0, 1, 3, '2026-02-05 06:36:59', '2026-02-05 06:41:48'),
(7, 'smtp_port', '587', 'string', 'email', 'SMTP server port', 0, 1, 3, '2026-02-05 06:36:59', '2026-02-05 06:41:48'),
(8, 'smtp_username', '', 'string', 'email', 'SMTP username', 0, NULL, 1, '2026-02-05 06:36:59', '2026-02-05 06:36:59'),
(9, 'smtp_password', '', 'string', 'email', 'SMTP password', 1, NULL, 1, '2026-02-05 06:36:59', '2026-02-05 06:36:59'),
(10, 'payment_gateway', 'stripe', 'string', 'payment', 'Payment gateway provider', 0, 1, 3, '2026-02-05 06:36:59', '2026-02-05 06:41:48'),
(11, 'payment_test_mode', '1', 'boolean', 'payment', 'Payment test mode enabled', 0, 1, 3, '2026-02-05 06:36:59', '2026-02-05 06:41:48'),
(12, 'logo_url', '/storage/settings/logo_1770295247.png', 'string', 'general', 'Store logo URL', 0, 1, 2, '2026-02-05 06:36:59', '2026-02-05 06:40:47'),
(13, 'favicon_url', '/storage/settings/favicon_1770295247.png', 'string', 'general', 'Favicon URL', 0, 1, 2, '2026-02-05 06:36:59', '2026-02-05 06:40:47');

-- --------------------------------------------------------

--
-- Table structure for table `settings_history`
--

CREATE TABLE `settings_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `changed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `change_type` varchar(255) NOT NULL DEFAULT 'update',
  `change_reason` text DEFAULT NULL,
  `changed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings_history`
--

INSERT INTO `settings_history` (`id`, `setting_id`, `key`, `old_value`, `new_value`, `changed_by`, `change_type`, `change_reason`, `changed_at`) VALUES
(1, 1, 'site_name', 'My E-commerce Store', 'E-commerce', 1, 'update', NULL, '2026-02-05 06:40:47'),
(2, 2, 'site_email', 'admin@example.com', 'nasir93cse@gmail.com', 1, 'update', NULL, '2026-02-05 06:40:47'),
(3, 3, 'currency', 'BDT', 'USD', 1, 'update', NULL, '2026-02-05 06:40:47'),
(4, 4, 'tax_rate', '0', '15', 1, 'update', NULL, '2026-02-05 06:40:47'),
(5, 12, 'logo_url', '', '/storage/settings/logo_1770295247.png', 1, 'update', NULL, '2026-02-05 06:40:47'),
(6, 13, 'favicon_url', '', '/storage/settings/favicon_1770295247.png', 1, 'update', NULL, '2026-02-05 06:40:47'),
(7, 3, 'currency', 'USD', 'BDT', 1, 'update', NULL, '2026-02-05 06:41:48');

-- --------------------------------------------------------

--
-- Table structure for table `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL,
  `is_free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shippings`
--

INSERT INTO `shippings` (`id`, `name`, `description`, `fee`, `is_free_shipping`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Standard Shipping', '5-7 business days delivery', 5.99, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(2, 'Express Shipping', '2-3 business days delivery', 12.99, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(3, 'Next Day Delivery', 'Overnight delivery', 24.99, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(4, 'Free Shipping', 'Free shipping on orders over $50', 0.00, 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(5, 'International Shipping', '10-15 business days for international orders', 29.99, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `is_free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `name`, `description`, `fee`, `is_free_shipping`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Standard Shipping', 'Delivers in 5–7 business days.', 100.00, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(2, 'Express Shipping', 'Delivers in 2–3 business days.', 200.00, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(3, 'Overnight Shipping', 'Delivers by next business day.', 350.00, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(4, 'Free Standard Shipping', 'Free delivery in 7–10 business days.', 0.00, 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(5, 'Local Pickup', 'Pick up from our local store.', 0.00, 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(6, 'Same Day Delivery', 'Delivery within 24 hours.', 250.00, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(7, 'International Shipping', 'Delivery within 10–15 business days.', 500.00, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(8, 'Economy Shipping', 'Cheapest shipping option.', 80.00, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(9, 'Weekend Delivery', 'Delivery available on weekends.', 150.00, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(10, 'Drone Delivery', 'Fast drone-based delivery.', 400.00, 0, '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'XS', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(2, 'S', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(3, 'M', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(4, 'L', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(5, 'XL', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(6, 'XXL', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(7, '3XL', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(8, '4XL', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(9, '28', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(10, '30', 1, '2026-01-28 06:19:30', '2026-01-28 06:19:30');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transaction_type` enum('debit','credit','refund','chargeback') NOT NULL,
  `method` enum('cod','bkash','nagad','rocket','card','bank_transfer','mobile_banking','wallet') DEFAULT NULL,
  `transaction_reference` varchar(150) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) NOT NULL,
  `status` enum('pending','success','failed','refunded') NOT NULL,
  `remarks` text DEFAULT NULL,
  `processed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `order_id`, `transaction_type`, `method`, `transaction_reference`, `amount`, `currency`, `status`, `remarks`, `processed_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 5, 2, 'debit', 'card', 'TXNVWKOZ01OXN', 63.30, 'BDT', 'failed', 'Dummy transaction record 1', '2026-01-01 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(2, 10, 34, 'credit', 'mobile_banking', 'TXN5V7PZTR4SR', 71.20, 'BDT', 'pending', 'Dummy transaction record 2', '2026-01-11 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(3, 5, 4, 'debit', 'mobile_banking', 'TXNDIPMALD4Y1', 590.80, 'BDT', 'pending', 'Dummy transaction record 3', '2026-01-23 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(4, 2, 25, 'refund', 'cod', 'TXNDBJ3XJPMDQ', 629.40, 'BDT', 'refunded', 'Dummy transaction record 4', '2025-12-30 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(5, 4, 21, 'debit', 'mobile_banking', 'TXNFRTCQZGVTQ', 962.10, 'BDT', 'pending', 'Dummy transaction record 5', '2026-01-28 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(6, 2, 1, 'chargeback', 'wallet', 'TXNONGHFOWFMX', 140.90, 'BDT', 'pending', 'Dummy transaction record 6', '2025-12-31 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(7, 6, 35, 'chargeback', 'wallet', 'TXNBMSI1BXDME', 283.80, 'BDT', 'pending', 'Dummy transaction record 7', '2025-12-31 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(8, 6, 47, 'refund', 'wallet', 'TXNZXKRZ6QY5D', 351.00, 'BDT', 'failed', 'Dummy transaction record 8', '2026-01-15 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(9, 1, 30, 'chargeback', 'card', 'TXNVMAX6C1UI4', 584.80, 'BDT', 'success', 'Dummy transaction record 9', '2026-01-17 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL),
(10, 7, 48, 'credit', 'wallet', 'TXN07I3I1GXAM', 550.20, 'BDT', 'success', 'Dummy transaction record 10', '2026-01-24 06:19:30', '2026-01-28 06:19:30', '2026-01-28 06:19:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) NOT NULL DEFAULT 'Bangladesh',
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'customer',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `profile_image`, `address`, `city`, `district`, `postal_code`, `country`, `date_of_birth`, `gender`, `notes`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mominul Islam', 'mominul@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'admin', NULL, '$2y$12$kcEVhMmtwo0z/haTUbzyDudETt9jNJ4sRPi/nX.YAbNWBn/bDrFVW', NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(2, 'Nasir Uddin', 'nasir@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'admin', NULL, '$2y$12$lHX8vweVcLhzKsau5PUcpuZG9Ly8r.vv4UqT5Xj7CWWYE7zFlDxta', NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(3, 'Shaimum Hasan', 'shaimum@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$6IwNBlKdR1HXJs4.alL7uebTe7z7vqfjbsXgwX57sjhE0XkyIiiI2', NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(4, 'Rasel Ahmed', 'rasel@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$z3BarmU97fsi7L6ay8ZvBO9YZI2uPCQeHEQ2oiqY8ytKZZonNNFHO', NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(5, 'Samiul Islam', 'samiul@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$OhwbWiYqrz5bc726y/cUC.lkjVCPbOnYfnq5R2xDCOMrrNM34IwKa', NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(6, 'Farhana Akter', 'farhana@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$.n2kA03VVRwMBZL3mYVJHeSUEot//501L8diSaPlTYd60irCeuqe2', NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(7, 'Rafi Khan', 'rafi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$1qIybXOh0wiyCKjLfuHY/.7aXocmh7Aj.sLpMkJexW5K5V5rT1.gC', NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(8, 'Tania Sultana', 'tania@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$9tQ/6DmL8fSYzRigexfMle2xOt2BEKk7fyPyI6UDt28/NeRU6jEqW', NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(9, 'Sabbir Hossain', 'sabbir@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$jqSTlkjnNCUolilP.ScPmezBdVk/94XQVRBGh4HbWd/8Q0kOmgXsK', NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(10, 'Ruhul Amin', 'ruhul@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$0LCq9.SXeq0dlS9m0/G03.hhKZC0TqsxKPz8mlaBAi5JxIVZV6wwa', NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(11, 'Test Customer', 'testcustomer@example.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$2MOniyb2z.Hre7RrGoGdlu0EJO7kcLkWRw7NlbeGnRpici3g9wAHq', NULL, '2026-02-05 02:10:24', '2026-02-05 02:10:24'),
(12, 'Farid Ahmed', 'farid@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$zQmnPvSCiGSVyrlx809IjeXphzRJgmQZiHWXu5kn514Z9tMGKYgJ.', NULL, '2026-02-05 02:17:35', '2026-02-05 02:17:35'),
(13, 'Updated Test User', 'newuser2026@example.com', '+8801712345678', NULL, '123 Test Street', 'Dhaka', NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$N7wTfadCSYaLTtvuhimGc.LhsOxFzD8NE5IWIVFDtDePpNq31NJDu', NULL, '2026-02-05 03:21:12', '2026-02-05 03:21:39'),
(14, 'Tanvir Ahmed', 'tanvir@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, NULL, NULL, 'customer', NULL, '$2y$12$sBVLtiVuLDrQ9SyvIiD4zeJVHbav4Unzx1UtdkEWEv6XPGOAB3VHe', NULL, '2026-02-05 03:29:40', '2026-02-05 03:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_device_tokens`
--

CREATE TABLE `user_device_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `token` varchar(512) NOT NULL,
  `platform` varchar(20) NOT NULL,
  `device_name` varchar(100) DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `user_id`, `product_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 4, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(2, 1, 8, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(3, 1, 5, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(4, 1, 1, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(5, 1, 8, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(6, 1, 10, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(7, 1, 7, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(8, 1, 6, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(9, 1, 4, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30'),
(10, 1, 1, NULL, '2026-01-28 06:19:30', '2026-01-28 06:19:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bangladeshi_areas`
--
ALTER TABLE `bangladeshi_areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bangladeshi_areas_district_code_unique` (`district_id`,`code`),
  ADD KEY `bangladeshi_areas_district_id_index` (`district_id`),
  ADD KEY `bangladeshi_areas_is_active_index` (`is_active`);

--
-- Indexes for table `bangladeshi_districts`
--
ALTER TABLE `bangladeshi_districts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bangladeshi_districts_division_id_code_unique` (`division_id`,`code`),
  ADD KEY `bangladeshi_districts_division_id_index` (`division_id`);

--
-- Indexes for table `bangladeshi_divisions`
--
ALTER TABLE `bangladeshi_divisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bangladeshi_divisions_name_unique` (`name`),
  ADD UNIQUE KEY `bangladeshi_divisions_code_unique` (`code`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_usages_coupon_id_foreign` (`coupon_id`),
  ADD KEY `coupon_usages_user_id_foreign` (`user_id`),
  ADD KEY `coupon_usages_order_id_foreign` (`order_id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_addresses_user_id_is_default_index` (`user_id`,`is_default`),
  ADD KEY `customer_addresses_area_id_idx` (`bangladeshi_area_id`);

--
-- Indexes for table `delivery_zones`
--
ALTER TABLE `delivery_zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_zones_zone_name_unique` (`zone_name`),
  ADD KEY `delivery_zones_is_active_index` (`is_active`),
  ADD KEY `delivery_zones_priority_index` (`priority`);

--
-- Indexes for table `delivery_zone_areas`
--
ALTER TABLE `delivery_zone_areas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_zone_areas_unique` (`delivery_zone_id`,`area_id`),
  ADD KEY `delivery_zone_areas_zone_idx` (`delivery_zone_id`),
  ADD KEY `delivery_zone_areas_area_idx` (`area_id`);

--
-- Indexes for table `delivery_zone_districts`
--
ALTER TABLE `delivery_zone_districts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_zone_districts_unique` (`delivery_zone_id`,`district_id`),
  ADD KEY `delivery_zone_districts_zone_idx` (`delivery_zone_id`),
  ADD KEY `delivery_zone_districts_district_idx` (`district_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_product_id_foreign` (`product_id`),
  ADD KEY `discounts_category_id_foreign` (`category_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_logs_product_id_foreign` (`product_id`),
  ADD KEY `inventory_logs_variant_id_foreign` (`variant_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_delivery_zone_id_idx` (`delivery_zone_id`),
  ADD KEY `orders_billing_address_id_idx` (`billing_address_id`),
  ADD KEY `orders_shipping_address_id_idx` (`shipping_address_id`),
  ADD KEY `orders_coupon_id_idx` (`coupon_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_variant_id_foreign` (`variant_id`),
  ADD KEY `order_items_category_id_idx` (`category_id`);

--
-- Indexes for table `order_shippings`
--
ALTER TABLE `order_shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_shippings_order_id_foreign` (`order_id`),
  ADD KEY `order_shippings_shipping_method_id_foreign` (`shipping_method_id`);

--
-- Indexes for table `order_status_history`
--
ALTER TABLE `order_status_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_status_history_order_id_created_at_index` (`order_id`,`created_at`),
  ADD KEY `order_status_history_new_status_index` (`new_status`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_payment_reference_unique` (`payment_reference`),
  ADD KEY `payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD UNIQUE KEY `products_barcode_unique` (`barcode`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_status_idx` (`status`),
  ADD KEY `products_is_new_idx` (`is_new`),
  ADD KEY `products_is_bestseller_idx` (`is_bestseller`),
  ADD KEY `products_is_featured_idx` (`is_featured`),
  ADD KEY `products_created_at_idx` (`created_at`),
  ADD KEY `products_base_price_idx` (`base_price`),
  ADD KEY `products_rating_idx` (`rating`),
  ADD KEY `products_sales_count_idx` (`sales_count`),
  ADD KEY `products_barcode_index` (`barcode`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_idx` (`product_id`),
  ADD KEY `product_images_is_primary_idx` (`is_primary`),
  ADD KEY `product_images_product_primary_idx` (`product_id`,`is_primary`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_variants_unique_variant` (`product_id`,`size_id`,`color`),
  ADD KEY `product_variants_size_id_foreign` (`size_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reviews_user_product_unique` (`user_id`,`product_id`),
  ADD KEY `reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`),
  ADD KEY `settings_key_group_index` (`key`,`group`),
  ADD KEY `settings_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `settings_history`
--
ALTER TABLE `settings_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_history_setting_id_changed_at_index` (`setting_id`,`changed_at`),
  ADD KEY `settings_history_changed_by_foreign` (`changed_by`);

--
-- Indexes for table `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_user_id_foreign` (`user_id`),
  ADD KEY `transactions_order_id_foreign` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_device_tokens`
--
ALTER TABLE `user_device_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_device_tokens_token_unique` (`token`),
  ADD KEY `user_device_tokens_user_id_index` (`user_id`),
  ADD KEY `user_device_tokens_platform_index` (`platform`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bangladeshi_areas`
--
ALTER TABLE `bangladeshi_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `bangladeshi_districts`
--
ALTER TABLE `bangladeshi_districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `bangladeshi_divisions`
--
ALTER TABLE `bangladeshi_divisions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `delivery_zones`
--
ALTER TABLE `delivery_zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery_zone_areas`
--
ALTER TABLE `delivery_zone_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_zone_districts`
--
ALTER TABLE `delivery_zone_districts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_shippings`
--
ALTER TABLE `order_shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_status_history`
--
ALTER TABLE `order_status_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `settings_history`
--
ALTER TABLE `settings_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_device_tokens`
--
ALTER TABLE `user_device_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bangladeshi_areas`
--
ALTER TABLE `bangladeshi_areas`
  ADD CONSTRAINT `bangladeshi_areas_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `bangladeshi_districts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bangladeshi_districts`
--
ALTER TABLE `bangladeshi_districts`
  ADD CONSTRAINT `bangladeshi_districts_division_id_foreign` FOREIGN KEY (`division_id`) REFERENCES `bangladeshi_divisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupon_usages`
--
ALTER TABLE `coupon_usages`
  ADD CONSTRAINT `coupon_usages_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_usages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_area_id_fk` FOREIGN KEY (`bangladeshi_area_id`) REFERENCES `bangladeshi_areas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `customer_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_zone_areas`
--
ALTER TABLE `delivery_zone_areas`
  ADD CONSTRAINT `delivery_zone_areas_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `bangladeshi_areas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_zone_areas_delivery_zone_id_foreign` FOREIGN KEY (`delivery_zone_id`) REFERENCES `delivery_zones` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_zone_districts`
--
ALTER TABLE `delivery_zone_districts`
  ADD CONSTRAINT `delivery_zone_districts_delivery_zone_id_foreign` FOREIGN KEY (`delivery_zone_id`) REFERENCES `delivery_zones` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_zone_districts_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `bangladeshi_districts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `discounts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `discounts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD CONSTRAINT `inventory_logs_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `inventory_logs_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_billing_address_id_fk` FOREIGN KEY (`billing_address_id`) REFERENCES `customer_addresses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_coupon_id_fk` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_delivery_zone_id_fk` FOREIGN KEY (`delivery_zone_id`) REFERENCES `delivery_zones` (`id`),
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_shipping_address_id_fk` FOREIGN KEY (`shipping_address_id`) REFERENCES `customer_addresses` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_variant_id_foreign` FOREIGN KEY (`variant_id`) REFERENCES `product_variants` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_shippings`
--
ALTER TABLE `order_shippings`
  ADD CONSTRAINT `order_shippings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_shippings_shipping_method_id_foreign` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_status_history`
--
ALTER TABLE `order_status_history`
  ADD CONSTRAINT `order_status_history_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD CONSTRAINT `product_variants_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_variants_size_id_foreign` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `settings_history`
--
ALTER TABLE `settings_history`
  ADD CONSTRAINT `settings_history_changed_by_foreign` FOREIGN KEY (`changed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `settings_history_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_device_tokens`
--
ALTER TABLE `user_device_tokens`
  ADD CONSTRAINT `user_device_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
