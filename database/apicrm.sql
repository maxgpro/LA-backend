-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 08, 2022 at 08:01 PM
-- Server version: 8.0.24
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apicrm`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `countLeads` (IN `p1` DATE, IN `p2` DATE)   BEGIN
SELECT
	users.id,
    users.firstname,
    users.lastname,
    COUNT(*) AS CountLeads,
    COUNT(IF(leads.isQualityLead='1', 1, null)) as CountQualityLeads,
    COUNT(IF(leads.isQualityLead='1' AND leads.is_add_sale='1', 1, null)) as CountQualityAssSaleLeads,
    COUNT(IF(leads.isQualityLead='0', 1, null)) as CountNotQualityLeads,
    COUNT(IF(leads.isQualityLead='0' AND leads.is_add_sale='1', 1, null)) as CountNotQualityAssSaleLeads
FROM
    leads
LEFT JOIN users ON(users.id = leads.user_id)
WHERE leads.created_at >= p1 AND leads.created_at <= p2  AND leads.status_id = '3'
GROUP BY users.id, users.firstname, users.lastname;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` bigint UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_create` int NOT NULL DEFAULT '1',
  `is_processed` tinyint(1) NOT NULL DEFAULT '0',
  `isQualityLead` tinyint(1) NOT NULL DEFAULT '0',
  `is_express_delivery` tinyint(1) NOT NULL DEFAULT '0',
  `is_add_sale` tinyint(1) NOT NULL DEFAULT '0',
  `source_id` bigint UNSIGNED DEFAULT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `status_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `phone`, `link`, `count_create`, `is_processed`, `isQualityLead`, `is_express_delivery`, `is_add_sale`, `source_id`, `unit_id`, `user_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, '123456789', 'https://vclock.com/stopwatch/#start=2022-07-26T14:36:09.828', 1, 0, 0, 0, 0, 1, 1, 17, 2, NULL, '2022-07-26 22:58:57'),
(2, NULL, 'https://vclock.com/stopwatch/#start=2022-07-26T14:36:09.828', 1, 0, 0, 0, 0, 1, 1, 1, 2, '2022-07-25 18:44:13', '2022-07-26 22:57:55'),
(3, '1234567890', NULL, 1, 0, 0, 0, 0, 1, 1, 1, 3, '2022-07-25 18:45:09', '2022-07-25 18:45:09'),
(4, '1234567890', 'https://vclock.com/stopwatch/#start=2022-07-26T14:36:09.828', 1, 0, 0, 0, 0, 1, 1, 1, 3, '2022-07-25 18:46:28', '2022-07-25 18:46:28'),
(5, '1234567890', 'https://vclock.com/stopwatch/#start=2022-07-26T14:36:09.828', 1, 0, 0, 0, 0, 1, 1, 1, 1, '2022-07-25 18:46:41', '2022-07-25 18:46:41'),
(6, '1234567890', 'https://vclock.com/stopwatch/#start=2022-07-26T14:36:09.828', 6, 0, 1, 0, 0, 2, 2, 1, 3, '2022-07-25 18:49:17', '2022-07-27 14:27:08'),
(7, '1234567890', 'https://vclock.com/stopwatch/#start=2022-07-26T14:36:09.828', 1, 0, 0, 0, 0, 1, 1, 1, 1, '2022-07-25 18:49:44', '2022-07-25 18:49:44'),
(8, '1234567890', 'https://vclock.com/stopwatch/#start=2022-07-26T14:36:09.828', 1, 0, 0, 0, 0, 1, 1, 1, 1, '2022-07-25 18:49:52', '2022-07-25 18:49:52'),
(9, NULL, 'https://vclock.com/stopwatch/#start=2022-07-26T14:36:09.828', 1, 0, 0, 0, 0, 1, 1, 1, 1, '2022-07-25 19:01:30', '2022-07-25 19:01:30'),
(10, '1234567890', NULL, 1, 0, 0, 0, 0, 1, 1, 1, 1, '2022-07-25 19:01:35', '2022-07-25 19:01:35'),
(11, '1234567890', NULL, 1, 0, 1, 0, 0, 1, 1, 17, 3, '2022-07-26 14:17:26', '2022-07-26 14:17:26'),
(12, '1234567890', NULL, 1, 0, 0, 0, 0, 1, 1, 1, 1, '2022-07-26 22:35:29', '2022-07-26 22:35:29'),
(13, '1234567890', NULL, 1, 0, 0, 0, 0, 1, 1, 1, 1, '2022-07-26 22:39:21', '2022-07-26 22:39:21');

-- --------------------------------------------------------

--
-- Table structure for table `lead_comments`
--

CREATE TABLE `lead_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `lead_id` bigint UNSIGNED DEFAULT NULL,
  `status_id` bigint UNSIGNED DEFAULT NULL,
  `comment_value` text COLLATE utf8mb4_unicode_ci,
  `is_event` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_comments`
--

INSERT INTO `lead_comments` (`id`, `text`, `user_id`, `lead_id`, `status_id`, `comment_value`, `is_event`, `created_at`, `updated_at`) VALUES
(1, 'Автор <strong>admin admin</strong> создал лид со статусом Новые заявки', 1, 11, 1, NULL, 1, '2022-07-26 14:17:26', '2022-07-26 14:17:26'),
(2, 'Пользователь <strong>admin admin</strong> оставил комментарий Привет Рудольф!', 1, 11, 1, 'Привет Рудольф!', 0, '2022-07-26 14:17:26', '2022-07-26 14:17:26'),
(3, 'Автор <strong>admin admin</strong> создал лид со статусом Новые заявки', 1, 12, 1, NULL, 1, '2022-07-26 22:35:29', '2022-07-26 22:35:29'),
(4, 'Пользователь <strong>admin admin</strong> оставил комментарий Привет Рудольф!', 1, 12, 1, 'Привет Рудольф!', 0, '2022-07-26 22:35:29', '2022-07-26 22:35:29'),
(5, 'Автор <strong>admin admin</strong> создал лид со статусом Новые заявки', 1, 13, 1, NULL, 1, '2022-07-26 22:39:21', '2022-07-26 22:39:21'),
(6, 'Пользователь <strong>admin admin</strong> оставил комментарий Привет Рудольф!', 1, 13, 1, 'Привет Рудольф!', 0, '2022-07-26 22:39:21', '2022-07-26 22:39:21'),
(7, 'Пользователь <strong>admin admin</strong> оставил комментарий Herllo', 1, 1, 1, 'Herllo', 0, '2022-07-26 22:55:03', '2022-07-26 22:55:03'),
(8, 'Пользователь <strong>admin admin</strong> оставил комментарий Herllo', 1, 2, 1, 'Herllo', 0, '2022-07-26 22:56:39', '2022-07-26 22:56:39'),
(9, 'Пользователь <strong>admin admin</strong> изменил статус лида В работе', 1, 2, 2, NULL, 1, '2022-07-26 22:57:55', '2022-07-26 22:57:55'),
(10, 'Пользователь <strong>admin admin</strong> оставил комментарий Herllo', 1, 2, 2, 'Herllo', 0, '2022-07-26 22:57:55', '2022-07-26 22:57:55'),
(11, 'Пользователь <strong>admin admin</strong> изменил статус лида В работе', 1, 1, 2, NULL, 1, '2022-07-26 22:58:57', '2022-07-26 22:58:57'),
(12, 'Пользователь admin admin оставил комментарий Привет Рудольф!', 1, 6, 1, 'Привет Рудольф!', 0, '2022-07-27 00:21:11', '2022-07-27 00:21:11'),
(13, 'Автор admin admin создал лид  со статусом Новые заявки', 1, 6, 1, 'Привет Рудольф!', 1, '2022-07-27 00:21:11', '2022-07-27 00:21:11'),
(14, 'Пользователь admin admin оставил комментарий Привет Рудольф!', 1, 6, 1, 'Привет Рудольф!', 0, '2022-07-27 00:22:12', '2022-07-27 00:22:12'),
(15, 'Автор admin admin создал лид  со статусом Новые заявки', 1, 6, 1, 'Привет Рудольф!', 1, '2022-07-27 00:22:12', '2022-07-27 00:22:12'),
(16, 'Пользователь admin admin оставил комментарий Привет Рудольф!', 1, 6, 1, 'Привет Рудольф!', 0, '2022-07-27 00:22:28', '2022-07-27 00:22:28'),
(17, 'Автор admin admin создал лид  со статусом Новые заявки', 1, 6, 1, 'Привет Рудольф!', 1, '2022-07-27 00:22:28', '2022-07-27 00:22:28'),
(18, 'Пользователь admin admin оставил комментарий Привет Рудольф!', 1, 6, 1, 'Привет Рудольф!', 0, '2022-07-27 00:23:26', '2022-07-27 00:23:26'),
(19, 'Автор admin admin создал лид  со статусом Новые заявки', 1, 6, 1, 'Привет Рудольф!', 1, '2022-07-27 00:23:26', '2022-07-27 00:23:26'),
(20, 'Пользователь admin admin оставил комментарий Привет Рудольф!22', 1, 6, 1, 'Привет Рудольф!22', 0, '2022-07-27 00:24:50', '2022-07-27 00:24:50'),
(21, 'Пользователь admin admin изменил источник на Viber', 1, 6, 1, NULL, 1, '2022-07-27 00:24:50', '2022-07-27 00:24:50'),
(22, 'Пользователь admin admin изменил подразделение на Shop 2', 1, 6, 1, NULL, 1, '2022-07-27 00:24:50', '2022-07-27 00:24:50'),
(23, 'Автор admin admin создал лид  со статусом Новые заявки', 1, 6, 1, 'Привет Рудольф!22', 1, '2022-07-27 00:24:50', '2022-07-27 00:24:50');

-- --------------------------------------------------------

--
-- Table structure for table `lead_status`
--

CREATE TABLE `lead_status` (
  `id` bigint UNSIGNED NOT NULL,
  `lead_id` bigint UNSIGNED DEFAULT NULL,
  `status_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_status`
--

INSERT INTO `lead_status` (`id`, `lead_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 11, 1, NULL, NULL),
(2, 12, 1, NULL, NULL),
(3, 13, 1, NULL, NULL),
(4, 2, 2, NULL, NULL),
(5, 1, 2, NULL, NULL),
(6, 6, 1, NULL, NULL),
(7, 6, 1, NULL, NULL),
(8, 6, 1, NULL, NULL),
(9, 6, 1, NULL, NULL),
(10, 6, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int NOT NULL DEFAULT '100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `title`, `path`, `parent`, `type`, `sort_order`, `created_at`, `updated_at`) VALUES
(3, 'Dashboard', 'dashboards.index', 0, 'admin', 100, NULL, NULL),
(4, 'Pages', 'pages.index', 0, 'admin', 100, NULL, NULL),
(5, 'Roles', 'roles.index', 0, 'admin', 100, NULL, NULL),
(6, 'Permissions', 'permissions.index', 0, 'admin', 100, NULL, NULL),
(7, 'Users', 'users.index', 0, 'admin', 100, NULL, NULL),
(8, 'Dashboard', '/', 0, 'front', 100, NULL, NULL),
(9, 'Form', 'form', 0, 'front', 100, NULL, NULL),
(10, 'Users', 'users', 0, 'front', 100, NULL, NULL),
(11, 'Sources', 'sources', 0, 'front', 100, NULL, NULL),
(12, 'Units', 'units', 0, 'front', 100, NULL, NULL),
(13, 'Lead Archive', 'archives', 0, 'front', 100, NULL, NULL),
(14, 'Analitics', 'analitics', 0, 'front', 100, NULL, NULL),
(15, 'Tasks', 'tasks', 0, 'front', 100, NULL, NULL),
(16, 'Task Archive', 'task_archives', 0, 'front', 100, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_06_10_203819_create_users_table', 2),
(11, '2022_06_28_000842_create_menus_table', 3),
(12, '2022_06_30_012652_create_roles_table', 4),
(13, '2022_06_30_013934_create_permissions', 4),
(14, '2022_07_01_005047_create_role_permissions', 4),
(17, '2022_07_20_010630_add_permission_menu_table', 5),
(18, '2022_07_25_040900_create_sources_table', 6),
(22, '2022_07_26_005737_create_units_table', 7),
(23, '2022_07_26_005751_create_statuses_table', 7),
(24, '2022_07_26_006726_create_leads_table', 7),
(25, '2022_07_26_014602_create_lead_comments_table', 8),
(26, '2022_07_27_010554_create_lead_status_table', 9),
(28, '2022_07_28_055336_create_analytics_table', 10),
(29, '2022_07_31_235940_create_tasks_table', 11),
(30, '2022_08_01_000524_create_task_status_table', 11),
(31, '2022_08_02_012837_create_task_comments_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
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
('82fb3000209ed1844a24370fd1da71de0b7cf3f5cba31be3fd0ba2974e411533a9538c6d97e73917', 1, 1, 'Personal Access Token', '[]', 0, '2022-06-20 15:13:16', '2022-06-20 15:13:16', '2023-06-21 02:13:16'),
('92dbeda16c63adc141cb4755a51e86f9a11199286247d9371b3e459d47fc219b6d974da9785d4df3', 1, 1, 'Personal Access Token', '[]', 0, '2022-06-28 20:13:29', '2022-06-28 20:13:29', '2023-06-29 07:13:29');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
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
(1, NULL, 'Laravel Personal Access Client', 'BBGjXmLdV54S2zdgX33JMbVshA63CAR1kgkSN7BB', NULL, 'http://localhost', 1, 0, 0, '2022-04-12 11:56:44', '2022-04-12 11:56:44'),
(2, NULL, 'Laravel Password Grant Client', 'GsfFdLu49HtQ14cOeBqgQZsK2pii5zvOgfkdf2Po', 'users', 'http://localhost', 0, 1, 0, '2022-04-12 11:56:44', '2022-04-12 11:56:44');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-04-12 11:56:44', '2022-04-12 11:56:44');

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
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int UNSIGNED NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `alias`, `title`, `created_at`, `updated_at`) VALUES
(1, 'SUPER_ADMINISTRATOR', 'Super Administrator', NULL, NULL),
(5, 'ROLES_ACCESS', 'Roles Access', NULL, NULL),
(6, 'USER_ACCESS', 'User Access', NULL, NULL),
(7, 'SOURCE_ACCESS', 'Source Access', NULL, NULL),
(8, 'LEADS_ACCESS', 'Leads Access', NULL, NULL),
(9, 'LEADS_CREATE', 'Leads Create', NULL, NULL),
(10, 'LEADS_EDIT', 'Leads Edit', NULL, NULL),
(11, 'DASHBOARD_ACCESS', 'Dashboard Access', NULL, NULL),
(12, 'LEADS_COMMENT_ACCESS', 'Leads Comment Access', NULL, NULL),
(13, 'ANALYTICS_ACCESS', 'Analytics Access', NULL, NULL),
(14, 'TASK_ACCESS', 'Task Access', NULL, NULL),
(15, 'TASK_CREATE', 'Task Create', NULL, NULL),
(16, 'TASK_EDIT', 'Task Edit', NULL, NULL),
(17, 'TASKS_COMMENT_VIEW', 'Task Comments View', NULL, NULL),
(18, 'TASKS_COMMENT_CREATE', 'Task Comments Create', NULL, NULL),
(19, 'TASKS_COMMENT_EDIT', 'Task Comments Edit', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_menu`
--

CREATE TABLE `permission_menu` (
  `permission_id` int UNSIGNED NOT NULL,
  `menu_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_menu`
--

INSERT INTO `permission_menu` (`permission_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 5, NULL, NULL),
(1, 6, NULL, NULL),
(1, 9, NULL, NULL),
(1, 12, NULL, NULL),
(1, 7, NULL, NULL),
(6, 7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int UNSIGNED NOT NULL,
  `role_id` int UNSIGNED NOT NULL,
  `permission_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(9, 1, 1, NULL, NULL),
(10, 1, 5, NULL, NULL),
(11, 4, 1, NULL, NULL),
(14, 1, 7, NULL, NULL),
(15, 1, 12, NULL, NULL),
(16, 1, 15, NULL, NULL),
(17, 1, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int UNSIGNED NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `alias`, `title`, `created_at`, `updated_at`) VALUES
(1, 'SUPER_ADMINISTRATOR', 'Super Administrator', '2022-07-06 17:02:30', '2022-07-06 17:20:10'),
(4, 'MANAGER', 'Manager', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `role_id` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `user_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(8, 17, 4, NULL, NULL),
(9, 18, 4, NULL, NULL),
(10, 21, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sources`
--

CREATE TABLE `sources` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sources`
--

INSERT INTO `sources` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'instagram', NULL, NULL),
(2, 'Viber', NULL, NULL),
(3, 'Site', NULL, NULL),
(4, 'Phone', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ru` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `title`, `title_ru`, `created_at`, `updated_at`) VALUES
(1, 'new', 'Новые заявки', NULL, NULL),
(2, 'process', 'В работе', NULL, NULL),
(3, 'done', 'Выполнено', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint UNSIGNED NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` bigint UNSIGNED DEFAULT NULL,
  `unit_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `responsible_id` bigint UNSIGNED DEFAULT NULL,
  `status_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `phone`, `link`, `source_id`, `unit_id`, `user_id`, `responsible_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, '1234567890', 'https://ya.ru/', 1, 1, 1, 1, 1, '2022-07-31 17:45:50', '2022-08-01 15:24:39'),
(2, '1234567890', 'https://ya.ru/', 1, 1, 1, 17, 3, '2022-07-29 17:46:49', '2022-08-01 15:27:15'),
(3, '1234567890', 'https://ya.ru/', 2, 1, 1, 1, 1, '2022-07-31 17:47:09', '2022-07-31 17:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `task_comments`
--

CREATE TABLE `task_comments` (
  `id` bigint UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `task_id` bigint UNSIGNED DEFAULT NULL,
  `status_id` bigint UNSIGNED DEFAULT NULL,
  `comment_value` text COLLATE utf8mb4_unicode_ci,
  `is_event` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_comments`
--

INSERT INTO `task_comments` (`id`, `text`, `user_id`, `task_id`, `status_id`, `comment_value`, `is_event`, `created_at`, `updated_at`) VALUES
(1, 'Пользователь <strong>admin admin</strong> изменил <strong>статус</strong> на Выполнено', 1, 1, 3, NULL, 1, '2022-08-01 15:22:20', '2022-08-01 15:22:20'),
(2, 'Пользователь <strong>admin admin</strong> оставил <strong>комментарий</strong> New Task Comment 01', 1, 1, 3, 'New Task Comment 01', 0, '2022-08-01 15:22:20', '2022-08-01 15:22:20'),
(3, 'Пользователь <strong>admin admin</strong> оставил <strong>комментарий</strong> New Task Comment 01', 1, 1, 3, 'New Task Comment 01', 0, '2022-08-01 15:22:23', '2022-08-01 15:22:23'),
(4, 'Пользователь <strong>admin admin</strong> изменил <strong>статус</strong> на Новые заявки', 1, 1, 1, NULL, 1, '2022-08-01 15:24:39', '2022-08-01 15:24:39'),
(5, 'Пользователь <strong>admin admin</strong> оставил <strong>комментарий</strong> New Task Comment 01', 1, 1, 1, 'New Task Comment 01', 0, '2022-08-01 15:24:39', '2022-08-01 15:24:39'),
(6, 'Пользователь <strong>admin admin</strong> изменил <strong>статус</strong> на Выполнено', 1, 1, 3, NULL, 1, '2022-08-01 15:25:19', '2022-08-01 15:25:19'),
(7, 'Пользователь <strong>admin admin</strong> изменил <strong>статус</strong> на Выполнено', 1, 1, 3, NULL, 1, '2022-08-01 15:25:59', '2022-08-01 15:25:59'),
(8, 'Пользователь <strong>admin admin</strong> оставил <strong>комментарий</strong> New Task Comment 02', 1, 2, 3, 'New Task Comment 02', 0, '2022-08-01 15:27:15', '2022-08-01 15:27:15');

-- --------------------------------------------------------

--
-- Table structure for table `task_status`
--

CREATE TABLE `task_status` (
  `id` bigint UNSIGNED NOT NULL,
  `task_id` bigint UNSIGNED DEFAULT NULL,
  `status_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_status`
--

INSERT INTO `task_status` (`id`, `task_id`, `status_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 1, 3, NULL, NULL),
(5, 1, 1, NULL, NULL),
(6, 1, 3, NULL, NULL),
(7, 1, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Shop 1', NULL, NULL),
(2, 'Shop 2', NULL, NULL),
(3, 'Shop 3', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `phone`, `password`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', 'admin@admin.com', '111111111111', '$2y$10$2tlSilHOhLx4ZMpDnQJHXO5wjFwG0ht998QXETnOZqrOKwGEJcOby', '1', NULL, NULL),
(17, 'Manager', 'Manager', 'manager@test.com', '1234567890', '$2y$10$zDVZYP9R2zPy2Ke2FqsALOc7aEW8XUrQpoA1peImv.Pmz1x1CZy3i', '1', '2022-07-24 13:44:57', '2022-08-02 00:16:18'),
(18, 'Maksim22', 'Gutin', 'wargix32bita@gmail.com', '+79644556565', '$2y$10$b0jdySZIvVpMCIJq39o/LO2KNgkl0IGaqi.wugWbKjMPrh3W2J81S', '1', '2022-08-02 00:01:19', '2022-08-02 00:16:01'),
(21, 'Maksim2', 'Gutin', 'admin2@admin.com', '+380665257242', '$2y$10$w1N8Lm/odLEDj4.Gm9BiouyqaTSTt3yiB7xctjz9DN.w2uhtgxdDu', '1', '2022-08-02 00:12:57', '2022-08-02 00:12:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_source_id_foreign` (`source_id`),
  ADD KEY `leads_unit_id_foreign` (`unit_id`),
  ADD KEY `leads_user_id_foreign` (`user_id`),
  ADD KEY `leads_status_id_foreign` (`status_id`);

--
-- Indexes for table `lead_comments`
--
ALTER TABLE `lead_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_comments_user_id_foreign` (`user_id`),
  ADD KEY `lead_comments_lead_id_foreign` (`lead_id`),
  ADD KEY `lead_comments_status_id_foreign` (`status_id`);

--
-- Indexes for table `lead_status`
--
ALTER TABLE `lead_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_status_lead_id_foreign` (`lead_id`),
  ADD KEY `lead_status_status_id_foreign` (`status_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_menu`
--
ALTER TABLE `permission_menu`
  ADD KEY `permission_menu_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_menu_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `sources`
--
ALTER TABLE `sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_source_id_foreign` (`source_id`),
  ADD KEY `tasks_unit_id_foreign` (`unit_id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`),
  ADD KEY `tasks_responsible_id_foreign` (`responsible_id`),
  ADD KEY `tasks_status_id_foreign` (`status_id`);

--
-- Indexes for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comments_task_id_foreign` (`task_id`),
  ADD KEY `task_comments_status_id_foreign` (`status_id`),
  ADD KEY `task_comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `task_status`
--
ALTER TABLE `task_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_status_task_id_foreign` (`task_id`),
  ADD KEY `task_status_status_id_foreign` (`status_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `lead_comments`
--
ALTER TABLE `lead_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `lead_status`
--
ALTER TABLE `lead_status`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sources`
--
ALTER TABLE `sources`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `task_status`
--
ALTER TABLE `task_status`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `sources` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leads_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leads_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_comments`
--
ALTER TABLE `lead_comments`
  ADD CONSTRAINT `lead_comments_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `lead_comments_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `lead_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `lead_status`
--
ALTER TABLE `lead_status`
  ADD CONSTRAINT `lead_status_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`),
  ADD CONSTRAINT `lead_status_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`);

--
-- Constraints for table `permission_menu`
--
ALTER TABLE `permission_menu`
  ADD CONSTRAINT `permission_menu_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_menu_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_responsible_id_foreign` FOREIGN KEY (`responsible_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `tasks_source_id_foreign` FOREIGN KEY (`source_id`) REFERENCES `sources` (`id`),
  ADD CONSTRAINT `tasks_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `tasks_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD CONSTRAINT `task_comments_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `task_comments_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`),
  ADD CONSTRAINT `task_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `task_status`
--
ALTER TABLE `task_status`
  ADD CONSTRAINT `task_status_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  ADD CONSTRAINT `task_status_task_id_foreign` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
