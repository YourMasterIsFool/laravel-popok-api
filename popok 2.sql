-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 07, 2023 at 03:00 PM
-- Server version: 5.7.34
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `popok`
--

-- --------------------------------------------------------

--
-- Table structure for table `article_models`
--

CREATE TABLE `article_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reader` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_models`
--

INSERT INTO `article_models` (`id`, `title`, `description`, `file_path`, `user_id`, `created_at`, `updated_at`, `reader`) VALUES
(8, 'tutorial kerajinan popok', 'kerajinan popok pada dasarnya sebuah kerajinan yg memakai popok untuk mengurangi sampah popok', '/storage/c706bf6f-c105-458f-a99b-7692b7ae2adf.png', 1, '2023-10-25 07:44:12', '2023-10-25 07:44:12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `donasis`
--

CREATE TABLE `donasis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date_donasi` date DEFAULT NULL,
  `google_coordinate` text COLLATE utf8mb4_unicode_ci,
  `alamat_donasi` text COLLATE utf8mb4_unicode_ci,
  `jumlah_donasi` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donasis`
--

INSERT INTO `donasis` (`id`, `user_id`, `date_donasi`, `google_coordinate`, `alamat_donasi`, `jumlah_donasi`, `created_at`, `updated_at`, `status_id`, `latitude`, `longitude`) VALUES
(1, 2, '2023-10-28', NULL, 'test alamat', 20000, '2023-10-09 23:27:48', '2023-10-11 08:02:42', 2, NULL, NULL),
(2, 2, '2023-10-31', NULL, 'edit  donasi ya bang', 10000, '2023-10-10 00:17:24', '2023-10-25 09:14:37', 2, '-8.24', '114.37'),
(3, 2, '2023-10-28', NULL, 'tambah alamat coba edit', 10000, '2023-10-10 01:50:11', '2023-10-10 01:55:20', NULL, NULL, NULL),
(4, 2, '2023-10-28', NULL, 'blog g1 ya do blog g1', 2000, '2023-10-10 02:20:48', '2023-10-14 06:25:18', 1, NULL, NULL),
(5, 2, '2023-10-28', NULL, 'test edit lokasiii yaaa', 2000000, '2023-10-10 02:21:31', '2023-10-11 15:53:31', 4, NULL, NULL),
(7, 2, '2023-10-31', NULL, 'test lengkap si', 100000, '2023-10-10 02:24:09', '2023-10-19 11:47:39', 3, NULL, NULL),
(8, 1, '2023-10-31', NULL, NULL, 100, '2023-10-11 04:12:28', '2023-10-25 08:06:59', 1, NULL, NULL),
(11, 2, '2023-10-28', NULL, 'cobaaa dehhh', 20000, '2023-10-11 07:57:38', '2023-10-11 15:52:23', 1, '-8.24', '114.37'),
(15, 2, '2023-10-31', NULL, 'hahayyy', 20000, '2023-10-20 01:06:03', '2023-10-20 01:06:03', 0, '-8.24', '114.37'),
(16, 2, '2023-10-31', NULL, 'coba create donasi', 2000, '2023-10-20 01:06:39', '2023-10-20 01:06:39', 0, '-8.24', '114.37'),
(17, 2, '2023-10-31', NULL, 'test lokasi', 20000, '2023-10-20 01:12:05', '2023-10-20 01:12:05', 0, '-8.2434128', '114.3711342'),
(18, 2, '2023-10-31', NULL, 'alamat lengkap', 1000, '2023-10-25 09:22:20', '2023-10-25 09:22:20', 0, '-8.2434135', '114.371136');

-- --------------------------------------------------------

--
-- Table structure for table `donasi_statuses`
--

CREATE TABLE `donasi_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `donasi_statuses`
--

INSERT INTO `donasi_statuses` (`id`, `status`, `code`, `created_at`, `updated_at`) VALUES
(4, 'menunggu di approve admin', 0, NULL, NULL),
(5, 'diajukan ke kurir', 1, NULL, NULL),
(6, 'kurir menuju lokasi', 2, NULL, NULL),
(7, 'ditolak admin', 3, NULL, NULL),
(8, 'kurir telah mengambil donasi', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hint_question_models`
--

CREATE TABLE `hint_question_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hint_question_models`
--

INSERT INTO `hint_question_models` (`id`, `code`, `question`, `created_at`, `updated_at`) VALUES
(1, 1, 'Siapa nama ibu kamu?', '2023-10-18 20:39:08', '2023-10-18 20:39:08'),
(2, 2, 'Siapa nama hewan peliharaan kamu?', '2023-10-18 20:39:08', '2023-10-18 20:39:08'),
(3, 3, 'Kenangan paling berkesan?', '2023-10-18 20:39:08', '2023-10-18 20:39:08');

-- --------------------------------------------------------

--
-- Table structure for table `kurir_statuses`
--

CREATE TABLE `kurir_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kurir_statuses`
--

INSERT INTO `kurir_statuses` (`id`, `status`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Diambil Kurir', 1, '2023-10-18 05:43:20', '2023-10-18 05:43:20'),
(2, 'Diantar kurir ke tujuan', 2, '2023-10-18 05:43:20', '2023-10-18 05:43:20'),
(3, 'Paket telah diterima', 2, '2023-10-18 05:43:20', '2023-10-18 05:43:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(12, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(13, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(14, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(15, '2016_06_01_000004_create_oauth_clients_table', 1),
(16, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(17, '2019_08_19_000000_create_failed_jobs_table', 1),
(18, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(19, '2023_09_19_164022_create_roles_table', 2),
(20, '2023_09_19_164129_alter_table_add_role_id_in_users_table', 3),
(21, '2023_09_19_170449_adding_role_code_in_roles_table', 4),
(24, '2023_09_21_182824_create_statuses_table', 7),
(25, '2023_10_04_103530_create_pelatihans_table', 8),
(26, '2023_09_21_182512_create_products_table', 9),
(28, '2023_10_08_122315_create_article_models_table', 10),
(29, '2023_09_21_182058_create_donasis_table', 11),
(34, '2023_10_10_033459_create_donasi_statuses_table', 12),
(35, '2023_10_10_034423_alter_table_add_foregin_key_status_in_donasis_table', 13),
(36, '2023_10_10_055603_alter_table_remove_foreign_key_role_id_in_users_table', 14),
(37, '2023_10_11_144104_alter_table_add_lattitude_and_longtitude', 15),
(38, '2023_10_12_115451_alter_table_add_reader_in_article_models_table', 16),
(40, '2023_10_18_123738_create_kurir_statuses_table', 18),
(41, '2023_10_18_124352_create_status_pembayarans_table', 19),
(45, '2023_10_18_151015_alter_table_add_phone_number_alamat_and_jenis_kelamin', 21),
(47, '2023_10_18_151451_alter_table_change_column_almnt_to_alamant_in_users_table', 22),
(48, '2023_10_19_032637_create_hint_question_models_table', 22),
(49, '2023_10_19_083316_alter_table_add_hint_password_in_table', 23),
(50, '2023_10_20_080800_alter_table_change_latitude_and_longtitude_to_string', 24),
(51, '2023_10_20_091242_alter_table_add_stock_in_product_models_table', 25),
(53, '2023_10_08_113323_create_order_models_table', 27),
(54, '2023_10_18_123534_alter_table_order_add_column_order_status_type_and_kurir_status', 28),
(55, '2023_10_18_125728_alter_table_set_default_value_order_status_and_kurir_status', 29),
(56, '2023_10_20_132714_alter_table_add_longitude_and_latitude_in_order_models_table', 30),
(57, '2023_10_22_191052_create_pelatihan_customer_models_table', 31);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('029a7e304e0abecfb9a996ed43d6e852e0c63dd28b0387329bbb6e9c3dd0bb0adebde155cf5e1164', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 23:09:31', '2023-09-27 23:09:31', '2024-09-28 06:09:31'),
('02e91556194dea0ae300d8626f7b3c9a97aff2991cf5993e28976714a489777d1def710902ead9d9', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:56', '2023-09-27 21:36:56', '2024-09-28 04:36:56'),
('03e60f28a15e0efe5cea22c0e135947e4cea8f06b614903bf4cb521b1e5963aa641966cc096dd17a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:29:02', '2023-09-27 21:29:02', '2024-09-28 04:29:02'),
('041d95524e9b0db30659d36c5c26987b319f2da7d21b5fb8b3af0e1a08be7b4b3df1979a908d731b', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:18:17', '2023-09-27 21:18:17', '2024-09-28 04:18:17'),
('049ff3d32c6648fe0598ab6dfbdd8a04421997eba7e93b697ba2e199088123dd5c46761baf255ec9', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-14 23:27:13', '2023-10-14 23:27:13', '2024-04-15 06:27:13'),
('05cb6d4cb42c186815181de2b456d6ec3abdae11d6652d844a103c46ee02458de40ca1fb50b3a431', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-28 01:19:29', '2023-09-28 01:19:29', '2024-09-28 08:19:29'),
('074c7dd46738d65d36dddab2de58d7b4e4ba592de0587ac7a731087c8b37c14d071454cfd30f5d27', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 00:14:49', '2023-10-22 00:15:13', '2024-04-22 07:14:49'),
('0835002528ba7deeff8d0256413b517f63e22022bc6c554ae64de136e9aa2d8ca6f6cb2e2eb8bbee', 11, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-25 08:41:04', '2023-10-25 08:44:44', '2024-04-25 15:41:04'),
('0aead773df2c262dbf57dd88c70a57dd870797f2c71291a654bd79c46cb649e42108f76d5a95e1ca', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-05 02:57:53', '2023-10-05 02:57:58', '2024-04-05 09:57:53'),
('0e6defbcdf6fc26d449855b39ccb192bd268b424117f77340d426e785805928c7355cb029fba48b4', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-30 19:03:21', '2023-09-30 19:03:21', '2024-10-01 02:03:21'),
('1068d122dd6e8add99b6019c695cd26db83d7b5b549da7a511c11f2ad5464d39bb98eeedda837419', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:18', '2023-09-27 21:36:18', '2024-09-28 04:36:18'),
('109480a53c02644277124aa98e95c61066d04e4b1c11dd3866649f20c1afb5dd68ccecb6ea267258', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 23:05:59', '2023-09-27 23:05:59', '2024-09-28 06:05:59'),
('114066b07a31598dc42e24a484f5e133282303de44b59d09baf96df136f90f344304922fcdef6ecb', 5, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 14:28:50', '2023-10-22 14:29:21', '2024-04-22 21:28:50'),
('13099cb5385316e9a783ec68a57c25960114ce4a22b00ecfe43934ebedcbf0ec55e94849d4b55144', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:19:25', '2023-09-27 21:19:25', '2024-09-28 04:19:25'),
('145e222a0797e667bb58b30eb613ef3a9a759f22be7a37c791ca0ed13e043d39706bba194a577e62', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-27 10:00:14', '2023-10-27 10:00:14', '2024-04-27 17:00:14'),
('15bb16ba7f596421e266a73dfea1b1402dc8595efeab356b11aaca25f26068e90c22024fb8c1d1a0', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-14 23:11:03', '2023-10-14 23:16:28', '2024-04-15 06:11:03'),
('1632c9f88e0b924e42a23dbba3c47c6982b816f01b3e4b6af5d01d6364d1b1d7932f170a795d9dad', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-25 06:56:49', '2023-10-25 06:56:49', '2024-04-25 13:56:49'),
('16572e9e963b95432c520ca182e76a0d5ac117f102199f4a4697e8cacefa5555e734e3367232c73f', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:19:05', '2023-09-27 21:19:05', '2024-09-28 04:19:05'),
('169af0e69007370895bd134cbaf7c7a4e6b62da017c52c9581365951c55bbe6e3b09cc886e83371c', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:32', '2023-09-27 21:36:32', '2024-09-28 04:36:32'),
('1744d8be67a549dbb9613a50987ac889476a66f01ee53e4743de5a0d742e2799ec61efc849ecbc6b', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-27 10:09:45', '2023-10-27 10:09:45', '2024-04-27 17:09:45'),
('18382cbaef8e87f890123bf0e001b0c377961b6094282c8e81272079f8f69ff7ed5d97f5a06e6e0d', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 00:27:11', '2023-10-22 03:15:51', '2024-04-22 07:27:11'),
('18be51d8e963b10f22fd3bd5033b36d9e4717870dfd0b697bb7b63605f4f933da8e06e3fa506676d', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 03:20:58', '2023-10-22 03:25:52', '2024-04-22 10:20:58'),
('190ff47e9c7a5d67d2ec71f51b58a726ce58174f1a1e5a7dd99e2cee53de45db4bdcdd3ac3a84b28', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:37:41', '2023-09-27 21:37:41', '2024-09-28 04:37:41'),
('1a44640e763dae80539599e6affd5c69abc8350c3982e4c787b636d88561486488238a7fcee5b6f2', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-01 05:54:27', '2023-10-01 05:54:27', '2024-04-01 12:54:27'),
('1bb2fd20f7d2c572099181832a68affa12a0ca0861948cdf60d0bbd3bce9d5406c8733ef8a967a29', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:37:52', '2023-09-27 21:37:52', '2024-09-28 04:37:52'),
('1ccf877a1a1a5a8f0fc0aac477988a333a419c50496295138f3c0b08c36ed8f4e7d12f96e8431ece', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-05 02:56:52', '2023-10-05 02:57:08', '2024-04-05 09:56:52'),
('1ef45f9f8d31c142a38bd3edd31baa28ba16aa80e7c81bd31ed0ba50cfed5eca142945e3b7bfc90a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-25 08:49:02', '2023-10-25 09:08:14', '2024-04-25 15:49:02'),
('2470fc1ae048f6a742c91c316f2ddb70b540f517c4c12e755c2ec9bd8e69517f5600f27ac5f213b6', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-21 02:26:22', '2023-10-21 04:06:26', '2024-04-21 09:26:22'),
('24e16f155b640f2a0380dbf0c2e5f814aa3f1b68c86dcb2202d73de467ddf78ba196cf9861acf3f9', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-24 13:58:29', '2023-10-24 14:04:02', '2024-04-24 20:58:29'),
('250d9d5fa79bace8a87a435a03556e7d314ee7bd4679f0b9121a87ec53d24d23e22ecae05b00eadc', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:35:20', '2023-09-27 21:35:20', '2024-09-28 04:35:20'),
('26a41bba94d5ee896cef29305d875618f238c111b34ee2cb860ab32be30b628d52466a6ebfc7149e', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-23 23:52:27', '2023-10-23 23:52:27', '2024-04-24 06:52:27'),
('2773886c599590e64b6a44c5023eae57ebf0fc419f031ca6d2315db1e55b578bf3b80305a5a52036', 11, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-25 06:53:44', '2023-10-25 06:56:25', '2024-04-25 13:53:44'),
('2910a63578c1935f6aa2eccbc7d0f0b28b15a55009554d36c195d9432aa0f85a2a050a50e4898716', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:57', '2023-09-27 21:36:57', '2024-09-28 04:36:57'),
('2ace722ee856f49f068dc94a542d0731d42f05302d2daec5a78782990d95da8c3a6c2675e0bb91d3', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:34:40', '2023-09-27 21:34:40', '2024-09-28 04:34:40'),
('2b6e7cb24ad642232ab97f08e8f62ba606cc26e5c2d1730f064d95c1da090bbca5090e829189d18a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:56', '2023-09-27 21:36:56', '2024-09-28 04:36:56'),
('2b8d52f1a72cc0746ded10636b334869fc23aaaf663b3820b3f043ee263468a982545ac8a3b890e0', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-21 04:07:13', '2023-10-21 04:07:38', '2024-04-21 11:07:13'),
('2c29fbcf6afa08186e4976b994764cb97fba48fff12f6041e3d513816e9dff19f98bb84f81761230', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:34:52', '2023-09-27 21:34:52', '2024-09-28 04:34:52'),
('2e0f38314af41c60fe2ed682b4730b9c2e762e60e1d30c82cd0f3ce08259f99671e6261a3d7375da', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 14:21:36', '2023-10-22 14:25:42', '2024-04-22 21:21:36'),
('2ecd8604c3f4399ade484f013150b8f72e9d685ef2b0dbfca8cf95cbfdb38347947a0ba39513f3d1', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-11 06:53:05', '2023-10-23 23:54:06', '2024-04-11 13:53:05'),
('311686ca519ce1ad4f7ab5c062d80aa8db1479dda95bd280643c85b799ec0c12fc161cd1df043029', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 10:31:11', '2023-10-24 10:31:11', '2024-04-24 17:31:11'),
('3144db1dee20c7d1de0db2ee409e20f72c01deabe31cd0fa61665541b73d1416cdcac14659c19633', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:35:44', '2023-09-27 21:35:45', '2024-09-28 04:35:44'),
('318ce3ae47eb7f01160f179128039c8ab82d3fc67f48c3ea40ad102b37c4f9899a1f0b7eb9873af3', 11, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-25 09:31:46', '2023-10-25 09:31:46', '2024-04-25 16:31:46'),
('32909b870b8fa7c298da19b3d196c90eeea1fa61ad9b1780f26cf9e53727c71158ed5683417dddf4', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:57', '2023-09-27 21:36:57', '2024-09-28 04:36:57'),
('32e536dc79568818a8b81d196e4fb25068d1507d3f66a71b8578c9ae7e5f6ed9545494d6182dfd3d', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-14 06:00:53', '2023-10-14 06:25:38', '2024-04-14 13:00:53'),
('393911dd22c21fc6a61194068dace04bb2a21b125b246272451ea117bf3973e5b41d54e80a73ad89', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 03:16:09', '2023-10-22 03:18:58', '2024-04-22 10:16:09'),
('3b2e9e537becc106204552852d22e9011cdf0f19d4b9c7efa177f076b048f2008bcbc8720cce8347', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:37:41', '2023-09-27 21:37:41', '2024-09-28 04:37:41'),
('3eb9c5baa1dc681da96f8f172bbc995fe2849de8a2b7f9808e6b2803de7ed4441671cfc2be65e4d2', 11, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-29 10:12:53', '2023-10-29 10:19:57', '2024-04-29 17:12:53'),
('3f8b537b75ab242e6a1c1ca043d82f2029de3e8de5ab5d28c89168578f5aa92a7fc38a607552dbc5', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-20 03:02:43', '2023-10-20 03:42:12', '2024-04-20 10:02:43'),
('401798944a0544d181d0cd54aacda820381a7019ea1aa50da21005b30e8dbe21fa4359f8d86a07c0', 11, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-29 07:49:38', '2023-10-29 08:13:30', '2024-04-29 14:49:38'),
('4054696b86aa49bc61442995c1fe2f2fbb37f21e575e57acc27aa99d74797ea158f9504d31bf4a07', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-28 00:58:47', '2023-09-28 00:58:47', '2024-09-28 07:58:47'),
('407d5b51b96f7044355afb7ff73c5b6a4c0cd0f44b916d9da86ce822fd8d13c15e3c18fda7c57c2f', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-25 08:45:04', '2023-10-25 08:45:04', '2024-04-25 15:45:04'),
('41b0abfba517f165ed993af05518e36435e18ce098b308e993233c20b03a72db6f157104dc277c45', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-09-28 01:12:19', '2023-10-05 02:31:48', '2024-09-28 08:12:19'),
('4445adfdfbff036847b603525922a200f266b2a77853ec64e2b84b85f10cc674265b214f91aad5e9', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-05 03:09:35', '2023-10-05 03:09:50', '2024-04-05 10:09:35'),
('4459fba01bb948b1ee9426112ad06cbd44ccd9fc6a3b760c4577164380b511f36ff54e0a90aabcd0', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-20 02:36:05', '2023-10-20 03:02:29', '2024-04-20 09:36:05'),
('44cef527aa7ad4e23bf87109562768526375409b2a354cb7d2d7a68dc48cf4f45e9aae1858e73ae7', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-30 19:57:05', '2023-09-30 19:57:05', '2024-10-01 02:57:05'),
('44d5608fc84446e0995bde0d361f10edffcc81c34a0e5caf0bd33df17e353875249c3c2e047d1c64', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-28 01:28:13', '2023-09-28 01:28:13', '2024-09-28 08:28:13'),
('45653e8a6899d4ecb5f537d4d98b4a731c94203411fc477c5121fb9fd7ce31cc2f71f53b8f7d36eb', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:34:49', '2023-09-27 21:34:49', '2024-09-28 04:34:49'),
('4570ccbc6be1535726c35b24fcf9d4242b6c3d8892d8494c72cd86ac28eb5c45ecc9fa76af3a8e52', 11, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-29 10:23:42', '2023-10-29 10:23:42', '2024-04-29 17:23:42'),
('4658c37d32515254cde318a6916703e914840ed02c83453ad75baacfb4885efd70c87e9064d4b665', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-01 06:08:42', '2023-10-09 22:29:01', '2024-04-01 13:08:42'),
('48b93f7cfc3255d95bf397f7f8fb16ea1cfa93391233275f97da5678627ce61f7aa493811891a292', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-14 23:08:40', '2023-10-14 23:10:49', '2024-04-15 06:08:40'),
('4d78dfa5f0219497714aa413e9090250b2304b7decdc4bfdf82c76cb27abc5776be28312d28243f4', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:35:19', '2023-09-27 21:35:19', '2024-09-28 04:35:19'),
('4d7eda9de8167211d7198cf0cae3f9353fc77d712bce7d5406b05cc1c1cb95951035c4916cdd8e74', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 12:18:46', '2023-10-22 14:21:23', '2024-04-22 19:18:46'),
('4ed71489e7f5e777aa8f6bb465fc040fb6c0d98d49cca138539880a019e1bf3eec793e20539df6dd', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:28:08', '2023-09-27 21:28:08', '2024-09-28 04:28:08'),
('4f39f0e1847a5070e4472372d8c7ce0016377102aa9b9a15e4b5dc38c128b9805708d1aaea7c9d26', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-05 02:52:22', '2023-10-05 02:52:55', '2024-04-05 09:52:22'),
('53051b9f6bab9cb1e762583e2d22f5a862f4effc428d457765320cab3b6ce0e3114d02fd9998db56', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-09 22:42:35', '2023-10-09 23:19:37', '2024-04-10 05:42:35'),
('5440865d4a609aa093f9f3fe0e19dd61ab9497e0ca6bf76131a7a0b0f1811abac2eb7f330443d8fe', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-20 02:35:20', '2023-10-20 02:35:36', '2024-04-20 09:35:20'),
('5580236e352bdb8d0f4e8bd77462d10c70365eb9de79e8a64a1d669cbc7cfa6ede6692dfa399555e', 11, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-29 08:33:18', '2023-10-29 08:33:27', '2024-04-29 15:33:18'),
('5881102a96e5cc92a033c0c481d67252b2707586db0e66525aa19557a177c891734c2ee07de59f9b', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-24 11:54:35', '2023-10-24 12:12:16', '2024-04-24 18:54:35'),
('58cc6aa1a0656c120cda578acd13cca688cbe4c27c686a84ebb8de6333394f950c48ddd0110b5d7a', 8, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-24 02:14:29', '2023-10-24 02:37:16', '2024-04-24 09:14:29'),
('5afd65c634ce1b39486597f46c310cc30a146c3e95f12986a01f77d37550aa39f188501155e289a6', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 10:45:15', '2023-10-24 10:45:15', '2024-04-24 17:45:15'),
('5b0366d9ca47f34ef555534f4bb3bbb598649fc8677e55fbd4730b2f11aedf5de17afdf47edd6e2b', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-10 02:25:14', '2023-10-11 02:34:19', '2024-04-10 09:25:14'),
('5b8f3163eb3c6b9cc72d4bd767fc49cf63dda004b44fd7b4c6e0cfc4283244aedfd06b74ba365b21', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 23:09:58', '2023-09-27 23:09:58', '2024-09-28 06:09:58'),
('5cdf8cb84e8eff176de2a2a60f2ec41be0c317724c9aa0348d7fa580756d4ef1eac79cabb8ee9b00', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:32', '2023-09-27 21:36:32', '2024-09-28 04:36:32'),
('5e740f4c36cf0eeef2c8ca5bf0e7e1fc49e9e82c638a360f5638cfd887b389cd277cbaf880577b1c', 3, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-11 15:52:50', '2023-10-14 05:46:54', '2024-04-11 22:52:50'),
('5e7f5d7faac6f2ef262fa657863b7467836039cfe5b2576eea4c8109dd7074e23f2ca76937b9dc8a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:35:48', '2023-09-27 21:35:48', '2024-09-28 04:35:48'),
('6176d415c9c831051b7144e8910b2bd983355391db4f5515f90c01bee1b9bdc0ba42f54210607b8c', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-10 00:24:38', '2023-10-10 00:24:38', '2024-04-10 07:24:38'),
('6200ce21bd7fa7e03f3f0a20cf87247cb97ae5ea1c06649be450bcec73c6d148490d9e8a6e4cc630', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:16', '2023-09-27 21:36:16', '2024-09-28 04:36:16'),
('62f0a05830305c0e0836ac5f66ccdf6ad28d23483190545b5a1ac3a02e85c39ed42b5fc2f6252ffa', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:37:01', '2023-09-27 21:37:01', '2024-09-28 04:37:01'),
('65ae9dd02e1e6474ac4c438fbfd476ea30e3859b28fe204d98e3827906a50c4c9b9642f566ee8735', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-22 13:39:25', '2023-10-22 13:39:25', '2024-04-22 20:39:25'),
('66244ca7f641d2f8b6fb065b3a8568533aac20516ee18391a0186bf4ee635bc49d3a74f7b505f23d', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-01 05:53:27', '2023-10-01 05:53:27', '2024-04-01 12:53:27'),
('66d00b40d8f30fdc6788b5d7d48bb7741db92111151e310a042406758273c67d2604c1101e507dea', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-01 06:03:24', '2023-10-01 06:03:24', '2024-04-01 13:03:24'),
('679f182e75f6d06b2e409b15d1e5067dc6b96633b11e90a025eda6e76a15d14d08ec73a41478a584', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-18 05:55:02', '2023-10-18 06:08:10', '2024-04-18 12:55:02'),
('686d6fd63e7d2bdf53a7db9606e04cac2b338924354665bfdc262a1e0427fc8a812f207c45d6bda4', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 03:26:07', '2023-10-22 03:26:46', '2024-04-22 10:26:07'),
('6c308baa42a6663f6a150b590cf265b763476c81529381f8e7544496ec7290c750800713a49a36df', 4, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-11 05:58:51', '2023-10-11 06:52:49', '2024-04-11 12:58:51'),
('6ca55a83c555addeeb31203ec3d8da30f8731f4910477662fca6429ccddd5c83cb8d539e6e02ec50', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:37:35', '2023-09-27 21:37:35', '2024-09-28 04:37:35'),
('6f3fbf5989d071da1e1d1dfaa58cc8f1a523411da097ea0a90efe11f7a30093bd94ffe231c7daa05', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-19 09:45:36', '2023-10-20 00:22:25', '2024-04-19 16:45:36'),
('71a3aab719641396922b93cedaf37a37f8a0b7fecdf130071cff68cecccf155e1705c65e22cf3c99', 11, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-27 09:51:23', '2023-10-27 09:51:23', '2024-04-27 16:51:23'),
('734069c3f2e39379ab6fd4f4353241140c1d0ac2e699a1d4e80acb3ee55545e5c682028e3b23b389', 3, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-25 09:09:54', '2023-10-25 09:19:10', '2024-04-25 16:09:54'),
('74d6fb83d9edeba43ca8a5cae5d6de96e7dc4173b956a1a12d266813d2726584afb4af3843a28d0c', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:34:29', '2023-09-27 21:34:29', '2024-09-28 04:34:29'),
('753f3c55794f7ca9a2faf517d4c836036be80d1c950c3dfea03c76a405dd1fa3eef7f5b0c2e17b34', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:33:28', '2023-09-27 21:33:28', '2024-09-28 04:33:28'),
('75e0a68f5a6627920d3b4e6f611e4daafeb0c5a008a26ecbfada85558ba25c78407f2bdddad3df7c', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-05 02:58:43', '2023-10-05 02:58:45', '2024-04-05 09:58:43'),
('779dabfd549ba4bc8a7be71c8e1dcf0c1793ad42a7d5d4f65b2c8eac41aa7fc2f1fe34b68fbdd8dd', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:59', '2023-09-27 21:36:59', '2024-09-28 04:36:59'),
('7887422b1d45a5e99be92c4e4d2aea14bb52402a9f192c1b5e53ea32415971f45c1730b696f3913a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-29 10:06:00', '2023-10-29 10:12:01', '2024-04-29 17:06:00'),
('7a7ad3043e4fea101d1db4b684f2942658530fa578d58698b3e0c967eca23e022f55d37f0bcee7e1', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-05 02:54:35', '2023-10-05 02:56:05', '2024-04-05 09:54:35'),
('7eaa702df422fc0cad9f8bec1496328598486915f0d3a9cc2cee363f40b61ad15cf8f704e41defde', 11, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-27 09:59:46', '2023-10-27 10:00:05', '2024-04-27 16:59:46'),
('7edd0c7c7efa2c9a206ec63b70355a439c520a6353ec787330c93b01a6932190e072aa13bb73bbe0', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-27 10:22:56', '2023-10-27 10:22:56', '2024-04-27 17:22:56'),
('80bcef1396a6ae10b2e57fd0d699238ae84ab0c4a913191f87a0779fef0485aa7b68839c206a8aed', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 14:26:15', '2023-10-22 14:26:38', '2024-04-22 21:26:15'),
('81db54256045efd6d17e6692725565e46838df2d3154586ae210153d3f1f9691df6614fc42799611', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-25 09:21:29', '2023-10-25 09:28:42', '2024-04-25 16:21:29'),
('82d415cb769d1b58f9852be0cf864b132c4dfd6eb2cadc92336febda7c96b8fceada4633096620aa', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 03:19:08', '2023-10-22 03:19:42', '2024-04-22 10:19:08'),
('844ff84a93d5838a2ba944f11524571421eb6532528702ee07923f5d330129f3b04deca1ac0c8723', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 12:15:03', '2023-10-24 12:15:03', '2024-04-24 19:15:03'),
('84c2b473cde502fb47ce6d654ae6e82c76cd42f940a66d12a34f46b766c0a760c6721247c6930ab3', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-24 11:46:58', '2023-10-24 11:54:23', '2024-04-24 18:46:58'),
('86e4b7f2cde08dec8d76f286e8099a4191bb12b4364d94b6c64be4ad7adc380ca73c12059ecfb8ac', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:28:57', '2023-09-27 21:28:57', '2024-09-28 04:28:57'),
('87fc0b62620dc3bc82e5cf59952c7dcad63a46361a1b0ec4cb80bc43fa6b16e27b444ff36e7e2389', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:37:37', '2023-09-27 21:37:37', '2024-09-28 04:37:37'),
('886a95a059bf2f39698d5d74feab6061fc0b6092e164c1f4a9318c95672aeabdcce7c1837fb10b14', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-27 10:11:05', '2023-10-27 10:11:05', '2024-04-27 17:11:05'),
('8af74909b37f8deac63af51af96fa7c40c04c524390f5d64a7611cc17df3862ab86419784dd0f0cb', 11, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-25 09:20:48', '2023-10-25 09:21:15', '2024-04-25 16:20:48'),
('8c810af6159805cce31475cb4872e90d6e64f13962866226246814802413b271573e29599c069fa2', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:19:51', '2023-09-27 21:19:51', '2024-09-28 04:19:51'),
('8fb210fd4082c464d84b67772aa75f5d9c23085f74d6528c3bbbdf2a450d4270d4a14c2ff9426360', 3, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-20 03:42:25', '2023-10-20 06:11:52', '2024-04-20 10:42:25'),
('9187a9b0b0635032a88e1a62f0c13c82c06bbef80fbde091fec51586969dd1612f3414bf4880f3de', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 13:57:27', '2023-10-24 13:57:27', '2024-04-24 20:57:27'),
('92d7b68897acf06bc260a2ff2304abaeed202bf7c4e7d5b689429518b46b0b139b2b3e0686be8b4a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-24 14:05:05', '2023-10-24 14:05:36', '2024-04-24 21:05:05'),
('954aed43a4bf0684b6f27704767e34888077d99492289fc24884c0a22da4f2ff50ba997f29c645bd', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-29 08:13:45', '2023-10-29 08:29:25', '2024-04-29 15:13:45'),
('95b60653418d7d651213cd3454ae3d5240b9b3f0d8d1c6d06a2e5ac63d2b4a6b9ac2a24b7d201b1b', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 03:26:56', '2023-10-22 03:46:39', '2024-04-22 10:26:56'),
('95bcac0109892a0c6f6de671ae2a8cbf67f7fbad22ef65baa4f3e4ab00578eb503168d978c17ee2a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 11:09:54', '2023-10-24 11:09:54', '2024-04-24 18:09:54'),
('95cba2a940ad85185c1e5c4a45ddd34a16e31c16cac5521b88abdb301155b38d05bdfdcb9228d20b', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-25 07:43:01', '2023-10-25 08:40:38', '2024-04-25 14:43:01'),
('960b169faccbf09eccd520fed637d55e8984b3962f2453e0d03e63941a4fe0dc66c151d1fa4c310c', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-18 06:08:24', '2023-10-18 20:54:46', '2024-04-18 13:08:24'),
('99bc8d57329584420c0352f19f7fcf26561c526eae657be7dbcb2923f182a15e1cfb879229bcb09b', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-14 23:27:11', '2023-10-14 23:27:11', '2024-04-15 06:27:11'),
('9c60ead6595f4d203ddd85fafd6b6035f07b4c3c7d1124ee1b8e003de41e84935cbc4ec56e07a7d6', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-27 10:11:52', '2023-10-27 10:11:52', '2024-04-27 17:11:52'),
('9dde7d69550c2a43a90c27d2fc6765f135a64a19092ddaf3bcc4eec0617945a78401abd578f0347b', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-07 23:06:08', '2023-10-07 23:06:08', '2024-04-08 06:06:08'),
('9e71722d75122132909c264df3c4a21a606315c51f1432f9243434632de928e854983355d1b12e5a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:37:00', '2023-09-27 21:37:00', '2024-09-28 04:37:00'),
('9e7d4f8a2573930240fda9d30bc1121cf6282e27dc70672a9d5cb0424978b5260d7be466ccdb34aa', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 12:12:32', '2023-10-24 12:12:32', '2024-04-24 19:12:32'),
('9f647084a90fdca1342c9ab5d0908f4f87d7206bdea6278c0475b9271259509fcf7faefd057c44e2', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-11 15:51:24', '2023-10-11 15:52:32', '2024-04-11 22:51:24'),
('9fec8f4d927c9cf6aea69b925d79808fb51cd6ac6b02868fc9c06930ef24a7660fd9afcd5b289337', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 13:41:35', '2023-10-24 13:41:35', '2024-04-24 20:41:35'),
('a0c870e23e03b2f536dcf00e308c533a2b92cc707355429ef593c03bdf1f0a21df3c06db4e84de56', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-22 04:04:58', '2023-10-22 04:04:58', '2024-04-22 11:04:58'),
('a3a5778fe874860676d14c26023a718265cc6e2a288d3ee12c1601f39c2131158819421734d761d0', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-11 02:34:30', '2023-10-11 05:58:42', '2024-04-11 09:34:30'),
('a78a1547916c7c28602215ad326e232eeb8588a1c0972372d84f0119c4eb642ea5b6f5702056b02a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:57', '2023-09-27 21:36:57', '2024-09-28 04:36:57'),
('a7da41c53f8fb3cfe6a4f93343abc8e8fa380475d5a14edfd9777a85aa62f0abe50135159c48cbe7', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:35:23', '2023-09-27 21:35:23', '2024-09-28 04:35:23'),
('a9b0422be4a1ba48603892e165bf19f94509625524b57ca5447e237a3ea3c4cfb7b8a839936b5b2a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:56', '2023-09-27 21:36:56', '2024-09-28 04:36:56'),
('aa0782f885147ce0f4d090fee4fbc70928bdc617320de28d1283253f85e180889b29954db3c6148f', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-28 01:14:30', '2023-09-28 01:14:30', '2024-09-28 08:14:30'),
('aaf59b7efc6e1883a4c08ead8d86300b31097808738e9de18ff3db53a0c7231285c0d4f5c3dd1855', 3, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-29 08:29:39', '2023-10-29 08:33:07', '2024-04-29 15:29:39'),
('ab84942503f4ee10473f26acf1ac9570f929fd3333f5fda628984e7ea55853af32afd707cef22c4c', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-11 07:14:07', '2023-10-11 08:02:15', '2024-04-11 14:14:07'),
('abe47e64f59402e4109692d9809886e41203b06be89afd7f790ca4666f5332f5210eb40e77952725', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 11:16:15', '2023-10-24 11:16:15', '2024-04-24 18:16:15'),
('ac6c2b59fd1249d4f802137b04c3ad22b4d130e62fac91bd3e054d5dfc447400174abdffe72c63cb', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 02:38:15', '2023-10-24 02:38:15', '2024-04-24 09:38:15'),
('b076fe7cf5730815f4ca88aca116d381b5a4aebac2a2e3f646b8d0eb5ded47db573a4f977ffdab74', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-06 05:31:02', '2023-10-06 05:31:02', '2024-04-06 12:31:02'),
('b0c587ed1ee6f490b6faa963f20d6510bd7c25b6c6d018357e9c315e4ee5ee9a1b90866c29cecf22', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-27 10:14:39', '2023-10-27 10:22:31', '2024-04-27 17:14:39'),
('b26f11ef4da74212b1158d9dde8d42ce39a34fcf7f5307dde16cdba6be3163f1d9feba54b58a7296', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-14 23:16:45', '2023-10-14 23:26:57', '2024-04-15 06:16:45'),
('b34041d03994bde03a05306a37801c6cd5b8ef7fef918923894686433309746527c46bffea7a5bc9', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-29 07:48:16', '2023-10-29 07:49:24', '2024-04-29 14:48:16'),
('b349f1a94eecdd103a1ae59b9ca93bf995cbe37577e8933e1fed4761f16a1e1c4201f2a7584f1709', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:56', '2023-09-27 21:36:56', '2024-09-28 04:36:56'),
('b3e506cc882704246daba13b1f901ddc5a4be2c017b1729ee998b265836812a20eb3b3e39cb8a97e', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 14:29:41', '2023-10-22 14:35:30', '2024-04-22 21:29:41'),
('b83798febd86745a40a6ea1853eeba3a3cf750098ae9a92c09ad63fbbae33fdc3de86c2739b6e374', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-28 01:25:47', '2023-09-28 01:25:47', '2024-09-28 08:25:47'),
('b99226faf8dd5b01519ac0af78b16aef33bb2263aee98d426c21e81cd8a82388c5398ded7f89274a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:37:38', '2023-09-27 21:37:38', '2024-09-28 04:37:38'),
('ba46fe053129cca6884b45f30fe90e639c25c77df012f045dcd94f00c25f934a11b80356311a8426', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-10 02:15:52', '2023-10-10 02:25:05', '2024-04-10 09:15:52'),
('bc567c4acb0d8263ef09090daaf4dd56dcff5a51d526300a5ff8706594dae1a4a04c0a558b5c15f9', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-09 23:24:28', '2023-10-18 05:54:46', '2024-04-10 06:24:28'),
('bcd910cb32f783a3b2dd66314765cc7b392918680f6241b9ee8166dbccc02f1fb6777736100e0080', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-14 08:47:18', '2023-10-14 10:29:20', '2024-04-14 15:47:18'),
('bdfd90b5422abcdaaf8247dff1697976c204ba80ff1a3ef8f788aeefd5913ea9b4dd066f9c324d41', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:28:03', '2023-09-27 21:28:03', '2024-09-28 04:28:03'),
('be3894ee39f4a98dc7566bd4ef4cd968815aa2af8ec11037fbd8e6be66a859edd39fddc6e66dde9a', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 11:22:10', '2023-10-24 11:22:10', '2024-04-24 18:22:10'),
('c0a6ddb012201d8379767786d6628f56aab1a540c4e85fd0186b2f7ec6d2925a4c07ee77e5a69fd0', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-09 23:20:20', '2023-10-09 23:23:29', '2024-04-10 06:20:20'),
('c7b82225b0151f94c88ca2539c50d17026e34346adf925b4de87194a722c072fe2bca1cde1872c50', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:33:42', '2023-09-27 21:33:42', '2024-09-28 04:33:42'),
('c9314c40f451eb1d3fa5d06583fd2597d9b62c61ef1e145f6f17fdac2527e5df89bf87631677c808', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-05 03:10:02', '2023-10-06 01:00:16', '2024-04-05 10:10:02'),
('c9a9d42cdc13f34da9c765b4e9d5c7d481d1322ae184c6076e6f1f54da59e5c67e0ad1f68e5d7d35', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 11:23:31', '2023-10-24 11:23:31', '2024-04-24 18:23:31'),
('c9bb08159b849ab9c9ad179a50d4f41c72dae6d5d2b175cdf19624b5314a9b9d7503ed5d37fd60da', 11, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-29 08:50:18', '2023-10-29 10:05:01', '2024-04-29 15:50:18'),
('ce580be9a7820d00ded29e12f32a802abb8a8b638cec163e4a9cfe5058d6e505c1d89dc149101a80', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-01 06:04:09', '2023-10-01 06:04:09', '2024-04-01 13:04:09'),
('cf69ed721152dc8bd192552733f9db05ae5a0a47ac237b29c83f9404e093091e17568c7cd39ce492', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:22', '2023-09-27 21:36:22', '2024-09-28 04:36:22'),
('d05b91c0b7a55657d9caf59c822626a37c0b7d300500b33b67a6210653ecf8db2b8a8c3578cf2e82', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-11 04:21:03', '2023-10-11 04:21:03', '2024-04-11 11:21:03'),
('d25510f95a5959d08c44c8c466eb9aa92ac7140565d0abcf6ac98783e2687d3493c3fd7b4fcc2ab9', 3, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-11 08:02:24', '2023-10-11 15:51:00', '2024-04-11 15:02:24'),
('d706bdbcbab1e3160f049042d34182da08aa133231d3294f744a22b0982941b4431d3ec93f6ecd66', 3, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-21 04:08:29', '2023-10-21 10:54:32', '2024-04-21 11:08:29'),
('d7a41fe35a87e97c719fb6d6ae3cf6c0a7bc968ab8fa089d61730c97cdf4e66a387288df76a4e8a4', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-20 06:12:19', '2023-10-21 02:26:03', '2024-04-20 13:12:19'),
('d918262d7aa1348923e4886651c7d01fc07ec00e882e0cb9222082550715d2c94d19020693ddc28e', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-09 23:23:49', '2023-10-09 23:24:17', '2024-04-10 06:23:49'),
('dafb4ce68f82d996119069214217528d99ffbf12b5803d98848fc43ec0adb66a218ed8ab67c912d6', 8, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-24 02:37:42', '2023-10-24 02:37:59', '2024-04-24 09:37:42'),
('db73ae5a915d47ba8a49bbd51f56d4fea1be436ea5b51d698164ee1913fa59e8435b5a6d069c071c', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:37:37', '2023-09-27 21:37:37', '2024-09-28 04:37:37'),
('dc51d4a1283af7dbfae880e54e94caa5dbc02022866761f59c2509d1fd6eb22ea59b8e784dc77a52', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-24 13:43:06', '2023-10-24 13:57:56', '2024-04-24 20:43:06'),
('dc66c906d9a3f8c9c67827ce448ba64765a43e976b4a729131fb02ec334265b75dea25358b790b85', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:28:11', '2023-09-27 21:28:11', '2024-09-28 04:28:11'),
('de572396d1e7b9501220cb39fc380b7b3215727460e585928ef85510951740e0b1bd843aa59938fb', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-06 01:00:35', '2023-10-06 01:00:35', '2024-04-06 08:00:35'),
('e15eee05f3cfc429f984128eb54c673d7bcba462f2bcbbf300b7fb8af4177a461159434ccfdaae43', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:37:41', '2023-09-27 21:37:41', '2024-09-28 04:37:41'),
('e1821044bdf5ef27be522532e30f28dac4e04951e24aeb1b9187f403f79d2e0649d92b33965f8b0e', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-30 18:47:06', '2023-09-30 18:47:06', '2024-10-01 01:47:06'),
('e185a9be242c6af71dc9194fd6c96e9d49221442a63815dff81a66901da1fc88ee1ad248c04153dc', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-05 02:59:05', '2023-10-05 02:59:08', '2024-04-05 09:59:05'),
('e3549df856a9e53595bfc83823f14402ab3450ab3b6475fa9fd8abed6fedd054a51ed44fd7af6901', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:57', '2023-09-27 21:36:57', '2024-09-28 04:36:57'),
('e3a45e518e16c1be6d38fb366e7d36bd7f69d391715af191b1f2c7616c5bec7e8290910194e714b0', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:36:52', '2023-09-27 21:36:52', '2024-09-28 04:36:52'),
('e556b087ff92b8a8c29c91e2c0a02d78a594a9a0d35dc6a194f9e80a0617b6d4b1692867a756baef', 3, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 04:09:03', '2023-10-22 12:10:20', '2024-04-22 11:09:03'),
('e6a42da2b7472e5d97ee007b3ec6deb89c9fd02c1e55e9c0b2b92b22609654207d0ee581d05a1275', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 10:31:01', '2023-10-24 10:31:01', '2024-04-24 17:31:01'),
('e7e7e53d1256025d6ec6d5df4d571015ab7bb25ab23cd67125e7585f42d6087fe1a36d022f20f3e5', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:35:36', '2023-09-27 21:35:36', '2024-09-28 04:35:36'),
('e9f48c765688e1a6471ff4c6b64367b0029601f86d2c3268239d60e9d42e1a2228f2d13f034bfb67', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-11 03:45:46', '2023-10-11 03:45:46', '2024-04-11 10:45:46'),
('ea7b7fa0871687a93ead0f55e9ebdcae19b358c28059637b50473b2096e5587a4810c0ec6892b3cd', 3, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-29 08:33:40', '2023-10-29 08:39:09', '2024-04-29 15:33:40'),
('eafcedf9a74ffb249410f92d0b9773c2976039d4d468538f6835a785bd503cf0d69c6a7a026529d0', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-24 14:05:50', '2023-10-24 14:05:50', '2024-04-24 21:05:50'),
('ebc0d6226ce70973071dc4d52b76bdbf44970453a1aa54da391bfc918b76c3bcf16cd99673ecf43c', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-27 21:28:58', '2023-09-27 21:28:58', '2024-09-28 04:28:58'),
('ec51f74ebfebebedbb3bce7869920d58b4843d1ff73523dcd3127b9fd1d63be30596364802ee82e0', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-01 06:00:20', '2023-10-01 06:00:20', '2024-04-01 13:00:20'),
('ed33e01c5e0f0d547c09cb4ccaa921791ae5ad99dd9d3fc0f900c2a844bc880fa7d3e298b811162e', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-28 00:36:38', '2023-09-28 00:36:38', '2024-09-28 07:36:38'),
('f06292dc507aa17cc0ac34719a4da01789b435016bf93928dd69301f39981836e96a723aedaa038f', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 04:04:59', '2023-10-22 04:08:34', '2024-04-22 11:04:59'),
('f155e6323af0ce94e9d7c2a700e6cb2943e8dd9b25c73aaea6cd613c8addfb69e6170b712cec4dc6', 3, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-20 00:22:44', '2023-10-20 00:31:45', '2024-04-20 07:22:44'),
('f2129d84044a9c2159f600f3c0ac93588e75d8ca25bd21cee11fdde9873b9c7bba613edf72edc7a7', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-05 02:59:30', '2023-10-05 03:09:24', '2024-04-05 09:59:30'),
('f238720556d3fc84f909dc512e16ae99ccf02e92a64f19eca1fd7499e0243699e54decc9e21c237e', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-10-27 10:13:22', '2023-10-27 10:13:22', '2024-04-27 17:13:22'),
('f30fa69f29726b1c2489eb87f1c4f6af9fc09ff2fab3e5a4c1c4cb2f050256ca77c8194d16d1ce96', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 03:46:55', '2023-10-22 04:04:02', '2024-04-22 10:46:55'),
('f32e880ee209d82310155040ef4948b60b34ed432b8b4c9419ac2185e60486ebc246269f380a90bd', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-20 00:31:57', '2023-10-20 02:22:15', '2024-04-20 07:31:57'),
('f715ee3f17023cc4b64ec68adf5b607bb2ec7647264bd69c5d46d56bb0eb56f3eba4964e44425ce2', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-29 10:22:14', '2023-10-29 10:23:33', '2024-04-29 17:22:14'),
('f966aea34ef464b6c8c24a1917599a2ed61b4838735269810451d73ef04782c2d16dbe1aa6876247', 2, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 00:07:54', '2023-10-22 00:08:16', '2024-04-22 07:07:54'),
('f97b8b2e986d23d4c70232cd5e389fa89fc5cd52cff785a7827c9aa5e6d17bbd72f3729f891c61ca', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 04:04:21', '2023-10-22 04:04:47', '2024-04-22 11:04:21'),
('fa589cde519327b05f2eb66e44e53d49ed6630849d7626d64322603d4b3254bfeeb8f84b423b3264', 7, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 00:26:00', '2023-10-22 00:27:01', '2024-04-22 07:26:00'),
('fc24df6aa0a3a8c816988bf82932cb02b33d8282b5ce0c8a6c002733bd8baef4d6931f63112928b9', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-22 14:26:54', '2023-10-22 14:27:26', '2024-04-22 21:26:54'),
('fcb648657be6c2e4f7b026d66b4f7c83559e84d41db33462535d04c18d4ec7ee7234a037cc5f98c3', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 0, '2023-09-28 01:30:18', '2023-09-28 01:30:18', '2024-09-28 08:30:18'),
('fe0bc6a3a576dfc7f4d597b314f0eb771ae6a073d05e1e7e8197a28bc4bfeeabca1157fc4eda8be5', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-29 08:39:55', '2023-10-29 08:49:42', '2024-04-29 15:39:55'),
('fff3b654e3f0335d099793f1fedc913227ebdda522ae512259712a3bf9c7a2cdf3e5427b1b2e46cf', 1, '9a2c03b7-0530-4a16-9e11-612af04ed365', 'accessToken', '[]', 1, '2023-10-14 10:29:35', '2023-10-14 23:08:14', '2024-04-14 17:29:35');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('9a2bf0eb-ce3f-4993-a440-cb132d90fe92', NULL, 'Laravel Personal Access Client', 'rAE7Kf9zOibUGoZZdsY8YkQEo8bgBpApkm7kEkmw', NULL, 'http://localhost', 1, 0, 0, '2023-09-19 07:52:42', '2023-09-19 07:52:42'),
('9a2bf0eb-d12d-4a07-b78d-413296b05650', NULL, 'Laravel Password Grant Client', 'dfF2fkVF4yNqP35Uuka72Y8IYKFRKJFVeRBjDfG4', 'users', 'http://localhost', 0, 1, 0, '2023-09-19 07:52:42', '2023-09-19 07:52:42'),
('9a2c03b7-0530-4a16-9e11-612af04ed365', NULL, 'Laravel Personal Access Client', 'NEbbxWGKCkMmejFOT5Yo9zj6yqzrqcqGeLWPZISq', NULL, 'http://localhost', 1, 0, 0, '2023-09-19 08:45:15', '2023-09-19 08:45:15'),
('9a2c03b7-17dc-4ab3-ad76-e30bc0f09107', NULL, 'Laravel Password Grant Client', 'oyP14PFX4crABZ2D8faUM3jiEL9sM6OrBXVNAlr8', 'users', 'http://localhost', 0, 1, 0, '2023-09-19 08:45:15', '2023-09-19 08:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '9a2bf0eb-ce3f-4993-a440-cb132d90fe92', '2023-09-19 07:52:42', '2023-09-19 07:52:42'),
(2, '9a2c03b7-0530-4a16-9e11-612af04ed365', '2023-09-19 08:45:15', '2023-09-19 08:45:15');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_models`
--

CREATE TABLE `order_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_status` int(11) DEFAULT '1',
  `kurir_status` int(11) DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_models`
--

INSERT INTO `order_models` (`id`, `alamat`, `quantity`, `price`, `product_id`, `customer_id`, `created_at`, `updated_at`, `order_status`, `kurir_status`, `latitude`, `longitude`) VALUES
(5, 'contoh jalan', 8, 15000, 14, 11, '2023-10-25 08:44:32', '2023-10-25 08:44:32', 1, NULL, '-8.2434035', '114.3711559'),
(6, 'test', 4, 200000, 15, 11, '2023-10-25 09:33:51', '2023-10-25 09:33:51', 1, NULL, '-8.2434016', '114.3711599'),
(7, 'jl', 2, 15000, 14, 2, '2023-10-27 10:05:28', '2023-10-27 10:05:28', 1, NULL, '37.785834', '-122.406417');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelatihans`
--

CREATE TABLE `pelatihans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `judul_pelatihan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_pelatihan` date NOT NULL,
  `lokasi_pelatihan` text COLLATE utf8mb4_unicode_ci,
  `deskripsi` text COLLATE utf8mb4_unicode_ci,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelatihans`
--

INSERT INTO `pelatihans` (`id`, `judul_pelatihan`, `tanggal_pelatihan`, `lokasi_pelatihan`, `deskripsi`, `created_by`, `created_at`, `updated_at`) VALUES
(10, 'Pelatihan mengelola popok', '2023-10-31', 'Jalan kepiting no 101, kelurahan sobo, kabupaten banyuwangi', 'Pelatihan ini yang dilaksanakan untuk mengajari dalam Hal pengelolaan popok secara bail dan benar', 1, '2023-10-29 10:07:46', '2023-10-29 10:07:46'),
(11, 'Pelatihan mengubah popok menjadi pot bunga', '2023-10-31', 'Gedung 404 Politeknik Negeri Banyuwangi', 'Pelatihan membuat popok agar bisa menjadi barang Berguna seperti contoh membuat popok menjadi barang pot bunga', 1, '2023-10-29 10:23:23', '2023-10-29 10:23:23');

-- --------------------------------------------------------

--
-- Table structure for table `pelatihan_customer_models`
--

CREATE TABLE `pelatihan_customer_models` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `pelatihan_id` bigint(20) NOT NULL,
  `acc` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pelatihan_customer_models`
--

INSERT INTO `pelatihan_customer_models` (`id`, `customer_id`, `pelatihan_id`, `acc`, `created_at`, `updated_at`) VALUES
(1, 2, 4, 1, '2023-10-22 13:03:58', '2023-10-22 14:14:44'),
(2, 2, 1, 1, '2023-10-22 13:05:02', '2023-10-22 14:19:24'),
(3, 2, 2, 1, '2023-10-22 14:19:41', '2023-10-22 14:25:16'),
(4, 2, 3, 2, '2023-10-22 14:20:11', '2023-10-22 14:20:13'),
(5, 2, 5, 1, '2023-10-22 14:26:19', '2023-10-22 14:27:04'),
(6, 5, 1, 2, '2023-10-22 14:29:03', '2023-10-22 14:30:47'),
(7, 5, 2, 2, '2023-10-22 14:29:06', '2023-10-22 14:29:50'),
(8, 5, 3, 2, '2023-10-22 14:29:09', '2023-10-22 14:33:21'),
(9, 5, 4, 1, '2023-10-22 14:29:13', '2023-10-22 14:32:18'),
(10, 8, 1, 2, '2023-10-24 02:14:50', '2023-10-24 02:39:22'),
(11, 8, 2, 1, '2023-10-24 02:37:01', '2023-10-24 02:39:32'),
(12, 2, 7, NULL, '2023-10-24 14:12:20', '2023-10-24 14:12:20'),
(13, 2, 8, NULL, '2023-10-27 10:19:13', '2023-10-27 10:19:13'),
(14, 11, 11, NULL, '2023-10-29 10:23:46', '2023-10-29 10:23:46');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'MyApp', 'd20a37e29f0fe217d39178b67b721fc3491592363f53b487e6fadee3eae3357a', '[\"*\"]', NULL, NULL, '2023-09-27 21:12:10', '2023-09-27 21:12:10'),
(2, 'App\\Models\\User', 1, 'MyApp', '122b39223aaeff984458e78a9fa76a1fb3842c00c8dfa6eddb39ccae10f841cb', '[\"*\"]', NULL, NULL, '2023-09-27 21:16:08', '2023-09-27 21:16:08'),
(3, 'App\\Models\\User', 1, 'accessToken', '1135fcf6845c5029b2d424b58ee14fb4a11ac0dd430b76fa14e5a18662a4c242', '[\"*\"]', NULL, NULL, '2023-09-27 21:17:02', '2023-09-27 21:17:02');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` text COLLATE utf8mb4_unicode_ci,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stok` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `file_path`, `product_title`, `product_description`, `product_price`, `created_at`, `updated_at`, `stok`) VALUES
(14, 1, '/storage/8f4fc134-22dc-4790-aec0-27a54c20ecb5.png', 'kerajinan popok', 'sebuah kerajinan dari popok bekas yg digunakan sebagai hiasan pot ruangannn', 15000, '2023-10-25 06:58:35', '2023-10-25 06:58:35', 1),
(15, 1, '/storage/e665712b-d938-46cd-9bca-a905af4d33f1.png', 'test kerajinan popook', 'sebuah kerajinan dari popok bekass', 200000, '2023-10-25 07:09:58', '2023-10-25 07:09:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`, `code`) VALUES
(1, 'admin', '2023-09-19 09:48:16', '2023-09-19 09:48:16', 1),
(2, 'kurir', '2023-09-19 09:48:25', '2023-09-19 09:48:25', 2),
(3, 'user', '2023-09-19 09:48:32', '2023-09-19 09:48:32', 3);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `status_pembayarans`
--

CREATE TABLE `status_pembayarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `status_pembayarans`
--

INSERT INTO `status_pembayarans` (`id`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Belum Dibayar', '2023-10-18 06:04:55', '2023-10-18 06:04:55'),
(2, 2, 'Sudah Dibayar', '2023-10-18 06:04:55', '2023-10-18 06:04:55'),
(3, 3, 'Dijemput kurir', '2023-10-21 03:32:11', '2023-10-21 03:32:11'),
(4, 4, 'Diantar kurir', '2023-10-21 03:32:11', '2023-10-21 03:32:11'),
(5, 5, 'Order Selesai', '2023-10-21 03:32:11', '2023-10-21 03:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `phone_number` text COLLATE utf8mb4_unicode_ci,
  `alamat` text COLLATE utf8mb4_unicode_ci,
  `jenis_kelamin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `question_answer` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role_id`, `phone_number`, `alamat`, `jenis_kelamin`, `question_id`, `question_answer`) VALUES
(1, 'Admin', 'velandaaden77@gmail.com', NULL, '$2y$10$sGfBl/H.VVK.L6Mqr60T2uS1HNSEYwu6gcAKd7mW7JFkJlMwfsY6W', NULL, '2023-09-19 09:59:20', '2023-10-29 08:21:09', 1, '081353838410', 'Jalan Ilan Belanak Blog G1 Kelurahan Sobo', NULL, NULL, NULL),
(2, 'Test User', 'test@gmail.com', NULL, '$2y$10$iZiDxUQaE5OoOumFao.TpuyX5iC459an3Nx5vExVB1jBxOnl5kWnC', NULL, '2023-09-19 10:23:01', '2023-10-22 03:26:37', 3, '081353838410', 'just alamayy bwangggg', NULL, NULL, NULL),
(3, 'kurir@gmail.com', 'kurir@gmail.com', NULL, '$2y$10$7nhAQ3Z62GQBmsHisKlRL.EXb5szesKGEag8/VGWJyoPFRfgPBley', NULL, '2023-10-11 05:36:26', '2023-10-11 05:36:26', 2, NULL, NULL, NULL, NULL, NULL),
(4, 'kurir verrandy', 'kurir2@gmail.com', NULL, '$2y$10$3s/hpY3aigziDOO.MhSx5uDpsJOM5pGWp7aHowrnAgbuwxf9ofA9i', NULL, '2023-10-11 05:58:04', '2023-10-11 05:58:04', 2, NULL, NULL, NULL, NULL, NULL),
(5, 'verr', 'test2@gmail.com', NULL, '$2y$10$Vfuzrcq7GO2z1EDVQ8y1UeN3pnezt9AtPvwVgMRC4uhjnxrdkZOEy', NULL, '2023-10-22 00:17:03', '2023-10-22 00:17:03', 3, NULL, NULL, NULL, 3, 'just hint'),
(6, 'verr', 'test1@gmail.com', NULL, '$2y$10$a15NyByhhcraqC5Hvlwxu.t6Tzgjmnel069dCQMKn0WydCEcdP6bG', NULL, '2023-10-22 00:25:07', '2023-10-22 00:25:07', 3, NULL, NULL, NULL, 3, 'just hint'),
(7, 'verraaaaa', 'verr1@gmail.com', NULL, '$2y$10$GvXRNZekt/Z6G1c/5yt4sepqaYNuVx7crNRtVcljt.UJdfRlGVx7q', NULL, '2023-10-22 00:25:41', '2023-10-22 00:25:41', 3, NULL, NULL, NULL, 3, 'just hint'),
(8, 'Verrandy Bang chuakss', 'testhint@gmail.com', NULL, '$2y$10$18ar2Q.7QObDA7IfBud9uu4HIrwaR6dgl3mmUslXlUFBORkEQly36', NULL, '2023-10-24 01:45:12', '2023-10-24 02:37:49', 3, '08028310938', 'jl', 'Laki Laki', 2, 'kucing'),
(10, 'testing123', 'testkurir@gmail.com', NULL, '$2y$10$SDOF8opjxB5xBrpngxKSv.sff5877pjm8/bqat.LRUnE9IgJkVpDe', NULL, '2023-10-24 11:23:52', '2023-10-24 11:23:52', 2, '081232972387', NULL, NULL, NULL, NULL),
(11, 'Muhammad Amir', 'testdemo@gmail.com', NULL, '$2y$10$Qakmx5DDgf1j0Qt1aDy3KuSTlHyAFvOsOmGr/5/nHYC5xfX0LdVCK', NULL, '2023-10-25 06:48:26', '2023-10-29 08:50:52', 3, '089231313', 'Jalan Kepiting no or 101, kelurahan sobo kecamatan banyuwangi', 'Laki Laki', 2, 'kucing');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article_models`
--
ALTER TABLE `article_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_models_user_id_foreign` (`user_id`);

--
-- Indexes for table `donasis`
--
ALTER TABLE `donasis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `donasis_user_id_foreign` (`user_id`);

--
-- Indexes for table `donasi_statuses`
--
ALTER TABLE `donasi_statuses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `donasi_statuses_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `hint_question_models`
--
ALTER TABLE `hint_question_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kurir_statuses`
--
ALTER TABLE `kurir_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `order_models`
--
ALTER TABLE `order_models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_models_product_id_foreign` (`product_id`),
  ADD KEY `order_models_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pelatihans`
--
ALTER TABLE `pelatihans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pelatihans_created_by_foreign` (`created_by`);

--
-- Indexes for table `pelatihan_customer_models`
--
ALTER TABLE `pelatihan_customer_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `status_pembayarans`
--
ALTER TABLE `status_pembayarans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article_models`
--
ALTER TABLE `article_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `donasis`
--
ALTER TABLE `donasis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `donasi_statuses`
--
ALTER TABLE `donasi_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hint_question_models`
--
ALTER TABLE `hint_question_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kurir_statuses`
--
ALTER TABLE `kurir_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_models`
--
ALTER TABLE `order_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pelatihans`
--
ALTER TABLE `pelatihans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pelatihan_customer_models`
--
ALTER TABLE `pelatihan_customer_models`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `status_pembayarans`
--
ALTER TABLE `status_pembayarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article_models`
--
ALTER TABLE `article_models`
  ADD CONSTRAINT `article_models_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `donasis`
--
ALTER TABLE `donasis`
  ADD CONSTRAINT `donasis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_models`
--
ALTER TABLE `order_models`
  ADD CONSTRAINT `order_models_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_models_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pelatihans`
--
ALTER TABLE `pelatihans`
  ADD CONSTRAINT `pelatihans_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
