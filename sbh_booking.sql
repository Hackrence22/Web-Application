-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 19, 2025 at 08:34 AM
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
-- Database: `sbh_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activity_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `performed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `boarding_house_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`activity_id`, `type`, `description`, `performed_by`, `boarding_house_id`, `created_at`, `updated_at`) VALUES
(1, 'boarding_house_created', 'Added new boarding house Clarence Boarding House', 1, NULL, '2024-12-07 20:04:50', '2024-12-07 20:04:50'),
(2, 'room_created', 'Added new room Single Bed to Clarence Boarding House', 1, NULL, '2024-12-07 20:06:23', '2024-12-07 20:06:23'),
(3, 'boarding_house_added', 'Added new boarding house: Daisy Boarding House', 3, 2, '2024-12-07 20:08:17', '2024-12-07 20:08:17'),
(4, 'room_created', 'Added new room Triple Bed to Clarence Boarding House', 1, NULL, '2024-12-10 23:52:30', '2024-12-10 23:52:30'),
(5, 'room_updated', 'Updated room Single bed', 3, 2, '2024-12-10 23:55:38', '2024-12-10 23:55:38'),
(6, 'room_updated', 'Updated room Single bed', 3, 2, '2024-12-10 23:56:10', '2024-12-10 23:56:10'),
(7, 'room_updated', 'Updated room Double Bed in Daisy Boarding House', 3, NULL, '2024-12-11 01:54:35', '2024-12-11 01:54:35'),
(8, 'room_updated', 'Updated room Single Bed in Clarence Boarding House', 1, NULL, '2024-12-11 01:54:46', '2024-12-11 01:54:46'),
(9, 'room_created', 'Added new room Double Bed to Clarence Boarding House', 1, NULL, '2024-12-11 01:57:17', '2024-12-11 01:57:17');

-- --------------------------------------------------------

--
-- Table structure for table `boarding_houses`
--

CREATE TABLE `boarding_houses` (
  `boarding_house_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `landlord_name` varchar(255) NOT NULL,
  `landlord_phone` varchar(255) NOT NULL,
  `bh_images` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `boarding_houses`
--

INSERT INTO `boarding_houses` (`boarding_house_id`, `name`, `description`, `address`, `landlord_name`, `landlord_phone`, `bh_images`, `user_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Clarence Boarding House', 'Clean environment with free water and electricity.', 'Brgy. San juan, Purok 6 Kaimo R. St. Surigao City.', 'Clarence Angelo D. Lisondra', '09460721827', 'boarding-houses/sBlOkJU5yqkKRnuWT1JMCuhEUdqldBz7wMKFlguV.jpg', 1, 1, 1, '2024-12-07 20:04:50', '2024-12-07 20:04:50'),
(2, 'Daisy Boarding House', 'Free water and electricity and clean environment.', 'Brgy. Diaz, Anao-aon San Francisco', 'Daisy C. Tadlas', '09568312024', 'boarding-houses/ntXMhWxr3zZBJYWoimS6tgWEu5XPKrEzcjEX4snY.jpg', 3, 3, 3, '2024-12-07 20:08:17', '2024-12-07 20:08:17');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `status` enum('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `user_id`, `room_id`, `check_in_date`, `check_out_date`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 4, '2024-12-18', '2024-12-19', 'confirmed', '2024-12-17 17:53:27', '2024-12-17 17:55:23'),
(2, 6, 7, '2024-12-18', '2024-12-19', 'pending', '2024-12-17 18:15:15', '2024-12-17 18:15:15');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, '0001_01_01_000001_create_boarding_houses_table', 1),
(3, '0001_01_01_000002_create_rooms_table', 1),
(4, '0001_01_01_000003_create_reviews_table', 1),
(5, '0001_01_01_000004_create_bookings_table', 1),
(6, '0001_01_01_000005_create_payment_qr_codes_table', 1),
(7, '0001_01_01_000006_create_payments_table', 1),
(8, '0001_01_01_000007_create_cache_table', 1),
(9, '0001_01_01_000008_create_jobs_table', 1),
(10, '2024_11_30_082708_create_activities_table', 1),
(11, '2024_xx_xx_create_notifications_table', 1),
(12, '2024_xx_xx_create_support_requests_table', 1),
(13, '2024_12_07_083254_create_review_reports_table', 2),
(14, '2024_12_07_164828_add_receipt_fields_to_notifications_table', 3),
(15, '[new_timestamp]_add_receipt_fields_to_notifications_table', 3),
(16, '2024_12_08_042027_add_attachment_path_to_notifications_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `has_attachment` tinyint(1) NOT NULL DEFAULT 0,
  `attachment_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `type`, `message`, `link`, `read`, `created_at`, `updated_at`, `has_attachment`, `attachment_type`) VALUES
(1, 4, 'booking', 'Your booking request for Single Bed has been submitted and is pending approval.', '/user/view-booking/4', 0, '2024-12-07 20:11:20', '2024-12-07 20:11:20', 0, NULL),
(2, 2, 'booking', 'Your booking request for Single Bed has been submitted and is pending approval.', '/user/view-booking/5', 1, '2024-12-07 20:17:52', '2024-12-07 21:01:53', 0, NULL),
(3, 2, 'booking', 'Your booking request for Single Bed has been submitted and is pending approval.', '/user/view-booking/1', 1, '2024-12-07 20:35:34', '2024-12-07 21:01:53', 0, NULL),
(4, 1, 'payment', 'New payment received for Booking #1. Amount: ₱2800.00', '/admin/payments', 0, '2024-12-07 20:54:41', '2024-12-07 20:54:41', 0, NULL),
(5, 2, 'payment', 'Payment of ₱2800.00 for booking #1 has been submitted successfully.', '/user/view-booking/1', 1, '2024-12-07 20:54:41', '2024-12-07 21:01:53', 0, NULL),
(6, 4, 'booking', 'Your booking request for Double Bed has been submitted and is pending approval.', '/user/view-booking/2', 0, '2024-12-07 20:56:12', '2024-12-07 20:56:12', 0, NULL),
(7, 1, 'payment', 'New payment received for Booking #2. Amount: ₱4200.00', '/admin/payments', 0, '2024-12-07 20:56:30', '2024-12-07 20:56:30', 0, NULL),
(8, 4, 'payment', 'Payment of ₱4200.00 for booking #2 has been submitted successfully.', '/user/view-booking/2', 0, '2024-12-07 20:56:30', '2024-12-07 20:56:30', 0, NULL),
(9, 2, 'payment', 'Your payment of ₱2800 for booking #1 has been confirmed. Status: Completed', '/user/view-booking/1', 1, '2024-12-07 20:57:39', '2024-12-07 21:01:53', 0, NULL),
(10, 2, 'booking', 'Your booking #1 has been confirmed.', '/user/bookings', 1, '2024-12-07 20:58:00', '2024-12-07 21:01:53', 0, NULL),
(11, 4, 'booking', 'Your booking for Double Bed has been confirmed.', '/user/bookings', 0, '2024-12-07 20:58:56', '2024-12-07 20:58:56', 0, NULL),
(12, 1, 'payment', 'New payment received for Booking #1. Amount: ₱2800.00', '/admin/payments', 0, '2024-12-07 21:03:01', '2024-12-07 21:03:01', 0, NULL),
(13, 2, 'payment', 'Payment of ₱2800.00 for booking #1 has been submitted successfully.', '/user/view-booking/1', 0, '2024-12-07 21:03:01', '2024-12-07 21:03:01', 0, NULL),
(14, 1, 'payment', 'New payment received for Booking #2. Amount: ₱4200.00', '/admin/payments', 0, '2024-12-07 21:03:59', '2024-12-07 21:03:59', 0, NULL),
(15, 4, 'payment', 'Payment of ₱4200.00 for booking #2 has been submitted successfully.', '/user/view-booking/2', 0, '2024-12-07 21:03:59', '2024-12-07 21:03:59', 0, NULL),
(16, 2, 'payment', 'Your payment of ₱2800 for booking #1 has been confirmed. Status: Completed', '/user/view-booking/1', 0, '2024-12-07 21:04:29', '2024-12-07 21:04:29', 0, NULL),
(17, 2, 'payment', 'Your payment receipt is ready for download', '/storage/receipts/receipt_1_1733634270.pdf', 1, '2024-12-07 21:04:30', '2024-12-07 21:04:55', 1, 'receipt'),
(18, 4, 'payment', 'Your payment receipt is ready for download', '/storage/receipts/receipt_2_1733634327.pdf', 0, '2024-12-07 21:05:27', '2024-12-07 21:05:27', 1, 'receipt'),
(19, 2, 'booking', 'Your booking request for Single Bed has been submitted and is pending approval.', '/user/view-booking/3', 0, '2024-12-07 21:51:17', '2024-12-07 21:51:17', 0, NULL),
(20, 4, 'payment', 'Your payment receipt is ready for download', '/storage/receipts/receipt_2_1733728378.pdf', 0, '2024-12-08 23:12:58', '2024-12-08 23:12:58', 1, 'receipt'),
(21, 4, 'payment', 'Your payment receipt is ready for download', '/storage/receipts/receipt_2_1733904125.pdf', 0, '2024-12-11 00:02:06', '2024-12-11 00:02:06', 1, 'receipt'),
(22, 4, 'payment', 'Your payment receipt is ready for download', '/storage/receipts/receipt_2_1733904126.pdf', 0, '2024-12-11 00:02:07', '2024-12-11 00:02:07', 1, 'receipt'),
(23, 2, 'booking', 'Your booking request for Double Bed has been submitted and is pending approval.', '/user/view-booking/4', 0, '2024-12-11 00:34:53', '2024-12-11 00:34:53', 0, NULL),
(24, 1, 'payment', 'New payment received for Booking #4. Amount: ₱4200.00', '/admin/payments', 0, '2024-12-11 00:35:29', '2024-12-11 00:35:29', 0, NULL),
(25, 2, 'payment', 'Payment of ₱4200.00 for booking #4 has been submitted successfully.', '/user/view-booking/4', 0, '2024-12-11 00:35:29', '2024-12-11 00:35:29', 0, NULL),
(26, 4, 'booking', 'Your booking request for Double Bed has been submitted and is pending approval.', '/user/view-booking/5', 0, '2024-12-11 00:37:30', '2024-12-11 00:37:30', 0, NULL),
(27, 4, 'booking', 'Your booking for Double Bed has been confirmed.', '/user/bookings', 0, '2024-12-11 00:38:57', '2024-12-11 00:38:57', 0, NULL),
(28, 2, 'booking', 'Your booking for Double Bed has been confirmed.', '/user/bookings', 0, '2024-12-11 00:39:02', '2024-12-11 00:39:02', 0, NULL),
(29, 2, 'payment', 'Your payment receipt is ready for download', '/storage/receipts/receipt_3_1733906361.pdf', 0, '2024-12-11 00:39:21', '2024-12-11 00:39:21', 1, 'receipt'),
(30, 6, 'booking', 'Your booking request for Double Bed has been submitted and is pending approval.', '/user/view-booking/1', 0, '2024-12-17 17:53:27', '2024-12-17 17:53:27', 0, NULL),
(31, 6, 'booking', 'Your booking #1 has been confirmed.', '/user/bookings', 0, '2024-12-17 17:55:23', '2024-12-17 17:55:23', 0, NULL),
(32, 1, 'payment', 'New payment received for Booking #1. Amount: ₱4200.00', '/admin/payments', 0, '2024-12-17 17:56:27', '2024-12-17 17:56:27', 0, NULL),
(33, 6, 'payment', 'Payment of ₱4200.00 for booking #1 has been submitted successfully.', '/user/view-booking/1', 0, '2024-12-17 17:56:28', '2024-12-17 17:56:28', 0, NULL),
(34, 6, 'payment', 'Your payment of ₱4200 for booking #1 has been confirmed. Status: Completed', '/user/view-booking/1', 0, '2024-12-17 17:57:05', '2024-12-17 17:57:05', 0, NULL),
(35, 6, 'payment', 'Your payment receipt is ready for download', '/storage/receipts/receipt_1_1734487029.pdf', 1, '2024-12-17 17:57:15', '2024-12-17 17:57:29', 1, 'receipt'),
(36, 6, 'booking', 'Your booking request for Triple Bed has been submitted and is pending approval.', '/user/view-booking/2', 0, '2024-12-17 18:15:15', '2024-12-17 18:15:15', 0, NULL);

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
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','gcash_qr','paymaya_qr') NOT NULL DEFAULT 'cash',
  `payment_proof` varchar(255) DEFAULT NULL,
  `qr_image_path` varchar(255) DEFAULT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `booking_id`, `status`, `amount`, `payment_method`, `payment_proof`, `qr_image_path`, `reference_number`, `created_at`, `updated_at`) VALUES
(1, 1, 'completed', 4200.00, 'cash', NULL, NULL, NULL, '2024-12-17 17:56:27', '2024-12-17 17:57:05');

-- --------------------------------------------------------

--
-- Table structure for table `payment_qr_codes`
--

CREATE TABLE `payment_qr_codes` (
  `qr_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `qr_image` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `boarding_house_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_qr_codes`
--

INSERT INTO `payment_qr_codes` (`qr_id`, `payment_type`, `qr_image`, `account_name`, `boarding_house_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'gcash', 'qr-codes/r2hnBSpAEfqe2ZqXqAUaW6oWUjiJUSYTtS6yx9o3.jpg', 'Clarence Angelo D. Lisondra', 1, 1, '2024-12-07 20:14:52', '2024-12-07 20:14:52'),
(2, 'paymaya', 'qr-codes/mfZqSgy7eumNpqunETwcl0zoFjYZhFCbw3dnslXT.jpg', 'Clarence Angelo D. Lisondra', 1, 1, '2024-12-07 20:15:13', '2024-12-07 20:15:13'),
(3, 'gcash', 'qr-codes/TOe93YXgiZAyvpC8OJNbneAO4GIuFGENHuOS7j0p.jpg', 'Daisy C. Tadlas', 2, 3, '2024-12-07 20:17:00', '2024-12-07 20:17:00'),
(4, 'paymaya', 'qr-codes/EljC4CGuburowlXVagN6Iskqc7kUIHovDQoPMW0o.jpg', 'Daisy C. Tadlas', 2, 3, '2024-12-07 20:17:14', '2024-12-07 20:17:14');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `boarding_house_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rating` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `boarding_house_id` bigint(20) UNSIGNED NOT NULL,
  `room_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `bed_quantity` int(11) NOT NULL,
  `room_images` varchar(255) DEFAULT NULL,
  `status` enum('available','occupied','maintenance') NOT NULL DEFAULT 'available',
  `map_link` text DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `updated_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `boarding_house_id`, `room_name`, `price`, `bed_quantity`, `room_images`, `status`, `map_link`, `user_id`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(3, 1, 'Single Bed', 2800.00, 1, 'room-images/BQBHJ4mpDoIPg5ZTktSKli5ardAWL0ngCsc4VXfD.jpg', 'available', 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d695.0374106587624!2d125.4864072252456!3d9.789292465296029!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zOcKwNDcnMjEuNyJOIDEyNcKwMjknMTEuMyJF!5e0!3m2!1sen!2sph!4v1732864713472!5m2!1sen!2sph', 1, 1, 1, '2024-12-07 20:06:23', '2024-12-11 01:54:46'),
(4, 2, 'Double Bed', 4200.00, 2, 'room-images/kNZdz6pagzbEVoExhmLuY6TPmmady2OjPDa2jqIt.jpg', 'occupied', 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d982.9976228675852!2d125.41573657145581!3d9.766871257735392!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zOcKwNDYnMDAuNiJOIDEyNcKwMjQnNTcuMSJF!5e0!3m2!1sen!2sph!4v1732635729436!5m2!1sen!2sph', 3, 3, 1, '2024-12-07 20:09:08', '2024-12-17 17:55:23'),
(5, 1, 'Triple Bed', 5200.00, 3, 'room-images/QcUZYZ4yyb3hwbRGOLGbNpTAo9DEhgteT6do0BZq.jpg', 'available', 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d695.0374106587624!2d125.4864072252456!3d9.789292465296029!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zOcKwNDcnMjEuNyJOIDEyNcKwMjknMTEuMyJF!5e0!3m2!1sen!2sph!4v1732864713472!5m2!1sen!2sph', 1, 1, 1, '2024-12-10 23:52:30', '2024-12-10 23:52:30'),
(6, 2, 'Single bed', 1800.00, 1, 'room-images/rNmjETHS2xOeAieCH1jKpTYsJbu6NNq52C8A1kjz.jpg', 'available', 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d982.9976228675852!2d125.41573657145581!3d9.766871257735392!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zOcKwNDYnMDAuNiJOIDEyNcKwMjQnNTcuMSJF!5e0!3m2!1sen!2sph!4v1732635729436!5m2!1sen!2sph', 3, 3, 3, '2024-12-10 23:54:56', '2024-12-10 23:56:10'),
(7, 2, 'Triple Bed', 5000.00, 3, 'room-images/Fp0kYsDpfdjE5YlPINXnTJVufjtpKsOxvrtekUTc.jpg', 'available', 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d982.9976228675852!2d125.41573657145581!3d9.766871257735392!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zOcKwNDYnMDAuNiJOIDEyNcKwMjQnNTcuMSJF!5e0!3m2!1sen!2sph!4v1732635729436!5m2!1sen!2sph', 3, 3, 3, '2024-12-10 23:56:46', '2024-12-10 23:56:46'),
(8, 1, 'Double Bed', 3000.00, 2, 'room-images/uilVQtv5TMNRjoMMPTR02CsftwrN07j1euFOR3xO.jpg', 'available', 'https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d695.0374106587624!2d125.4864072252456!3d9.789292465296029!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zOcKwNDcnMjEuNyJOIDEyNcKwMjknMTEuMyJF!5e0!3m2!1sen!2sph!4v1732864713472!5m2!1sen!2sph', 1, 1, 1, '2024-12-11 01:57:17', '2024-12-11 01:57:17');

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
('2L9X8C1ee8T04Xg7zQ00m7j6bmh8zPgo8bqxASYr', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVHdvdjNoNllEWGVYQldMSW9hQkJCcnF4RmdKb1dNRHlZZlRBYlJVNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hc3NldHMvanMvaW5kZXgudW1kLkJYenA3Um1lLmpzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1739350117),
('efesl2959wNcfcyC0JhhXjfQITrciy0rafNmCesR', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMUVyODlaUHBkMTFmSnUwZnM2b1J4cU44SnMzaTZaVndBTUdNNFRZcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739950413),
('Ewvd5ZkpDCgZf69D4A4rNyHSGOH1M8ZZ9NX4zE57', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkRPR096T0VsQW9VcUZPa0dVUkMyVkdnSXNvRThHRzUzT204aXBQZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739950266),
('nsv0fmpm9J26wWUSvlcIcRZPv6v9Uorrk92pYCXV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG9XbW9QRzVVYU91OXJlejFxb2NRUzJOczc4Z0k5R3o3djlScDFMWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739949497),
('U7gTIiaUPomNSV06ZPYwpkaGymO3TkghXmSmOr0A', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1EzVW5saVgwWkU4eDFLMDF1cFlhYXBNM3l2RXpVUk91TGlrd09jdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1739349112);

-- --------------------------------------------------------

--
-- Table structure for table `support_requests`
--

CREATE TABLE `support_requests` (
  `support_id` bigint(20) UNSIGNED NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `priority` enum('low','medium','high') NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `status` enum('pending','in_progress','resolved') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `userType` enum('admin','landlord','user') NOT NULL DEFAULT 'user',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `phone_number`, `profile_picture`, `birthdate`, `gender`, `userType`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Clarence Angelo D. Lisondra', 'adminlisondra@gmail.com', '$2y$12$UFvRjRLVRySBeFYLiLd.Y.fDPoMYSDcAboSDZi.E0JwaquhyGEbe.', '09460721827', 'profile-pictures/w5S7GqXcuhVxtx7Q8tyukIcGZWGmjtiIMsfGKn5C.jpg', '2003-11-11', 'male', 'admin', NULL, NULL, '2024-12-05 23:38:39', '2024-12-07 05:37:02', NULL, NULL),
(2, 'Clark Louis D. Lisondra', 'lisondra@gmail.com', '$2y$12$OgmMUomVhLVcn9W10J5AGOetyQsGSw5DweFHL9XL9cgFLaipTGbMa', '09814210408', 'profile-pictures/tcmK9uP8eBbsh9TaWwNXwoKNwJSsVRRaPj2yj9GC.jpg', '2005-06-21', 'male', 'user', NULL, NULL, '2024-12-05 23:40:03', '2024-12-06 01:51:48', 1, 1),
(3, 'Daisy C. Tadlas', 'landlordtadlas@gmail.com', '$2y$12$D2JbgnSfUrLMjiOeCTtgmOlzDIdVxWfObLqOO1A9jJTl.oRXIqjxm', '09468312024', 'profile-pictures/CoSjBeBVQ5V6mFjp99Jd03BZguy9WEFQIzzRSeod.jpg', '2005-07-18', 'female', 'landlord', NULL, NULL, '2024-12-05 23:59:31', '2024-12-06 02:09:09', 1, 1),
(4, 'Clark E. Lisondra', 'lisondra1@gmail.com', '$2y$12$T1AAE/0axtKH.JTO33oweumyJhT5AzlBn1UTQkGMgeJ5ruJUnxXYi', '09503683350', 'profile-pictures/dPR9793eGPI9kNq6pLBlLjRE0Xvunx6ib6XYfV0w.jpg', '1976-09-01', 'male', 'user', NULL, NULL, '2024-12-06 20:43:33', '2024-12-06 20:44:37', NULL, NULL),
(5, 'Ivann M. Mendoza', 'adminmendoza@gmail.com', '$2y$12$mbJPSDSjzYaVUC2MAkgwn.d0jHkR8phKyYKQdmIGYURJjW.x0VPC2', '09504359152', 'profile-pictures/pPAVCkR03GlUF1wRtBIo1AXrPBKYl5PRDZOz2IDw.jpg', '2004-08-08', 'male', 'admin', NULL, NULL, '2024-12-10 23:58:36', '2024-12-11 00:00:35', NULL, NULL),
(6, 'Clarence Angelo D. Lisondra', 'lisondra2@gmail.com', '$2y$12$Hkiq6HNcDmSe5Kjkr.7x9OqPxIivMFBwD0GK28MBgqbk8ZQXGQA66', NULL, NULL, NULL, NULL, 'user', NULL, NULL, '2024-12-17 17:51:06', '2024-12-17 17:51:06', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `activities_performed_by_foreign` (`performed_by`),
  ADD KEY `activities_boarding_house_id_foreign` (`boarding_house_id`);

--
-- Indexes for table `boarding_houses`
--
ALTER TABLE `boarding_houses`
  ADD PRIMARY KEY (`boarding_house_id`),
  ADD KEY `boarding_houses_user_id_foreign` (`user_id`),
  ADD KEY `boarding_houses_created_by_foreign` (`created_by`),
  ADD KEY `boarding_houses_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`),
  ADD KEY `bookings_room_id_foreign` (`room_id`);

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
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

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
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payments_booking_id_foreign` (`booking_id`);

--
-- Indexes for table `payment_qr_codes`
--
ALTER TABLE `payment_qr_codes`
  ADD PRIMARY KEY (`qr_id`),
  ADD KEY `payment_qr_codes_boarding_house_id_foreign` (`boarding_house_id`),
  ADD KEY `payment_qr_codes_created_by_foreign` (`created_by`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_boarding_house_id_foreign` (`boarding_house_id`),
  ADD KEY `reviews_room_id_foreign` (`room_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `rooms_boarding_house_id_foreign` (`boarding_house_id`),
  ADD KEY `rooms_user_id_foreign` (`user_id`),
  ADD KEY `rooms_created_by_foreign` (`created_by`),
  ADD KEY `rooms_updated_by_foreign` (`updated_by`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `support_requests`
--
ALTER TABLE `support_requests`
  ADD PRIMARY KEY (`support_id`),
  ADD KEY `support_requests_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_created_by_foreign` (`created_by`),
  ADD KEY `users_updated_by_foreign` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `boarding_houses`
--
ALTER TABLE `boarding_houses`
  MODIFY `boarding_house_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_qr_codes`
--
ALTER TABLE `payment_qr_codes`
  MODIFY `qr_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `support_requests`
--
ALTER TABLE `support_requests`
  MODIFY `support_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`boarding_house_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `activities_performed_by_foreign` FOREIGN KEY (`performed_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `boarding_houses`
--
ALTER TABLE `boarding_houses`
  ADD CONSTRAINT `boarding_houses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `boarding_houses_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `boarding_houses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_booking_id_foreign` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_qr_codes`
--
ALTER TABLE `payment_qr_codes`
  ADD CONSTRAINT `payment_qr_codes_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`boarding_house_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_qr_codes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`boarding_house_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_boarding_house_id_foreign` FOREIGN KEY (`boarding_house_id`) REFERENCES `boarding_houses` (`boarding_house_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rooms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `rooms_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `rooms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `support_requests`
--
ALTER TABLE `support_requests`
  ADD CONSTRAINT `support_requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `users_updated_by_foreign` FOREIGN KEY (`updated_by`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
