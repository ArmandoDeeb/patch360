-- -------------------------------------------------------------
-- TablePlus 5.3.8(500)
--
-- https://tableplus.com/
--
-- Database: patch360
-- Generation Time: 2023-07-30 20:07:25.5060
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_primary_contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_primary_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_primary_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organisations` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_registration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_last_logged_in` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `notification_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recipient_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `patches`;
CREATE TABLE `patches` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_released` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `slas`;
CREATE TABLE `slas` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `websites`;
CREATE TABLE `websites` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cms` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patch_version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patch_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `accounts` (`id`, `company_name`, `company_address`, `company_website`, `company_primary_contact`, `company_primary_phone`, `company_primary_email`, `created_at`, `updated_at`) VALUES
(1, 'Better health', '4 Fitzroy Lane', 'health.vic.gov.au', 'Beau Zlatkovic', '130060624', 'better.health@gov.au', '2023-07-27 09:25:55', '2023-07-27 09:25:55');

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(2, NULL, 1, 'Category 2', 'category-2', '2023-07-24 09:40:47', '2023-07-24 09:40:47');

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'url', 'text', 'Url', 0, 1, 1, 1, 1, 1, '{}', 3),
(59, 7, 'cms', 'text', 'Cms', 0, 1, 1, 1, 1, 1, '{}', 4),
(60, 7, 'patch_version', 'text', 'Patch Version', 0, 1, 1, 1, 1, 1, '{}', 5),
(61, 7, 'patch_status', 'text', 'Patch Status', 0, 1, 1, 1, 1, 1, '{}', 6),
(62, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 7),
(63, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(64, 27, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(65, 27, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(66, 27, 'type', 'text', 'Type', 0, 1, 1, 1, 1, 1, '{}', 3),
(67, 27, 'date_released', 'text', 'Date Released', 0, 1, 1, 1, 1, 1, '{}', 4),
(68, 29, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(69, 29, 'name', 'text', 'Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(70, 29, 'version', 'text', 'Version', 0, 1, 1, 1, 1, 1, '{}', 3),
(71, 29, 'cms', 'text', 'Cms', 0, 1, 1, 1, 1, 1, '{}', 4),
(72, 29, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 5),
(73, 29, 'last_updated', 'timestamp', 'Last Updated', 0, 1, 1, 1, 1, 1, '{}', 6),
(74, 32, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(75, 32, 'company_name', 'text', 'Company Name', 0, 1, 1, 1, 1, 1, '{}', 2),
(76, 32, 'company_address', 'text', 'Company Address', 0, 1, 1, 1, 1, 1, '{}', 3),
(77, 32, 'company_website', 'text', 'Company Website', 0, 1, 1, 1, 1, 1, '{}', 4),
(78, 32, 'company_primary_contact', 'text', 'Company Primary Contact', 0, 1, 1, 1, 1, 1, '{}', 5),
(79, 32, 'company_primary_phone', 'text', 'Company Primary Phone', 0, 1, 1, 1, 1, 1, '{}', 6),
(80, 32, 'company_primary_email', 'text', 'Company Primary Email', 0, 1, 1, 1, 1, 1, '{}', 7),
(89, 37, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(90, 37, 'notification_message', 'text', 'Notification Message', 0, 1, 1, 1, 1, 1, '{}', 2),
(91, 37, 'notification_time', 'text', 'Notification Time', 0, 1, 1, 1, 1, 1, '{}', 3),
(92, 37, 'recipient_email', 'text', 'Recipient Email', 0, 1, 1, 1, 1, 1, '{}', 4),
(93, 37, 'recipient_mobile', 'text', 'Recipient Mobile', 0, 1, 1, 1, 1, 1, '{}', 5),
(94, 37, 'sender', 'text', 'Sender', 0, 1, 1, 1, 1, 1, '{}', 6),
(95, 37, 'channel', 'text', 'Channel', 0, 1, 1, 1, 1, 1, '{}', 7);

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(7, 'websites', 'websites', 'Website Register', 'Websites', NULL, 'App\\Models\\Website', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-07-24 09:55:55', '2023-07-27 02:53:13'),
(27, 'patches', 'patches', 'Patch', 'Patches', NULL, 'App\\Models\\Patch', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-07-27 07:39:28', '2023-07-27 07:39:28'),
(29, 'modules', 'modules', 'Module', 'Modules', NULL, 'App\\Models\\Module', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-07-27 07:49:04', '2023-07-27 07:49:04'),
(32, 'accounts', 'accounts', 'Account', 'Accounts', NULL, 'App\\Models\\Account', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-07-27 08:00:40', '2023-07-27 08:00:40'),
(37, 'notifications', 'notifications', 'Notification', 'Notifications', NULL, 'App\\Models\\Notification', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-07-27 09:34:35', '2023-07-27 09:34:35'),
(39, 'slas', 'slas', 'Sla', 'Slas', NULL, 'App\\Models\\Sla', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2023-07-30 09:16:54', '2023-07-30 09:16:54');

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-07-24 09:40:47', '2023-07-27 09:02:50', 'voyager.dashboard', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 5, '2023-07-24 09:40:47', '2023-07-27 09:02:50', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 8, '2023-07-24 09:40:47', '2023-07-27 09:34:50', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2023-07-24 09:40:47', '2023-07-27 09:34:50', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2023-07-24 09:40:47', '2023-07-24 09:57:00', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2023-07-24 09:40:47', '2023-07-24 09:57:00', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2023-07-24 09:40:47', '2023-07-24 09:57:00', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2023-07-24 09:40:47', '2023-07-24 09:57:00', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 10, '2023-07-24 09:40:47', '2023-07-27 09:34:50', 'voyager.settings.index', NULL),
(14, 1, 'Websites Register', '', '_self', 'voyager-laptop', '#ca3f3f', NULL, 2, '2023-07-24 09:55:55', '2023-07-27 09:02:50', 'voyager.websites.index', 'null'),
(17, 1, 'Patches Register', '', '_self', 'voyager-plug', '#000000', NULL, 4, '2023-07-27 07:39:28', '2023-07-27 09:02:50', 'voyager.patches.index', 'null'),
(18, 1, 'Modules Register', '', '_self', 'voyager-plug', '#000000', NULL, 3, '2023-07-27 07:49:04', '2023-07-27 09:02:50', 'voyager.modules.index', 'null'),
(19, 1, 'Accounts Register', '', '_self', 'voyager-news', '#000000', NULL, 6, '2023-07-27 08:00:40', '2023-07-27 09:02:50', 'voyager.accounts.index', 'null'),
(23, 1, 'Notifications Register', '', '_self', 'voyager-chat', '#000000', NULL, 7, '2023-07-27 09:34:35', '2023-07-27 09:35:46', 'voyager.notifications.index', 'null'),
(25, 1, 'Slas', '', '_self', NULL, NULL, NULL, 11, '2023-07-30 09:16:54', '2023-07-30 09:16:54', 'voyager.slas.index', NULL);

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-07-24 09:40:47', '2023-07-24 09:40:47');

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_01_01_000000_create_pages_table', 1),
(6, '2016_01_01_000000_create_posts_table', 1),
(7, '2016_02_15_204651_create_categories_table', 1),
(8, '2016_05_19_173453_create_menu_table', 1),
(9, '2016_10_21_190000_create_roles_table', 1),
(10, '2016_10_21_190000_create_settings_table', 1),
(11, '2016_11_30_135954_create_permission_table', 1),
(12, '2016_11_30_141208_create_permission_role_table', 1),
(13, '2016_12_26_201236_data_types__add__server_side', 1),
(14, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(15, '2017_01_14_005015_create_translations_table', 1),
(16, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(17, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(18, '2017_04_11_000000_alter_post_nullable_fields_table', 1),
(19, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(20, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(21, '2017_08_05_000000_add_group_to_settings_table', 1),
(22, '2017_11_26_013050_add_user_role_relationship', 1),
(23, '2017_11_26_015000_create_user_roles_table', 1),
(24, '2018_03_11_000000_add_user_settings', 1),
(25, '2018_03_14_000000_add_details_to_data_types_table', 1),
(26, '2018_03_16_000000_make_settings_value_nullable', 1),
(27, '2019_08_19_000000_create_failed_jobs_table', 1),
(28, '2019_12_14_000001_create_personal_access_tokens_table', 1);

INSERT INTO `modules` (`id`, `name`, `version`, `cms`, `description`, `last_updated`, `created_at`, `updated_at`) VALUES
(1, 'Drupal', '8.2.1', 'Drupal Core', 'feature update', '2023-07-27 19:20:00', '2023-07-27 09:20:13', '2023-07-27 09:20:13');

INSERT INTO `notifications` (`id`, `notification_message`, `notification_time`, `recipient_email`, `recipient_mobile`, `sender`, `channel`, `created_at`, `updated_at`) VALUES
(1, 'Your patch has been successfully applied', '11th July at 4:30PM', 'Beau.Zlatkovic@gmail.com', '0468743922', 'Ivan.grynenko@gmail.com', 'Email', '2023-07-27 09:40:10', '2023-07-27 09:40:10');

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2023-07-24 09:40:47', '2023-07-24 09:40:47');

INSERT INTO `patches` (`id`, `name`, `type`, `date_released`, `created_at`, `updated_at`) VALUES
(1, 'Scroll bar fix', 'bug fix', '5/4/22', '2023-07-27 09:22:39', '2023-07-27 09:22:39');

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1);

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(2, 'browse_bread', NULL, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(3, 'browse_database', NULL, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(4, 'browse_media', NULL, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(5, 'browse_compass', NULL, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(6, 'browse_menus', 'menus', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(7, 'read_menus', 'menus', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(8, 'edit_menus', 'menus', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(9, 'add_menus', 'menus', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(10, 'delete_menus', 'menus', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(11, 'browse_roles', 'roles', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(12, 'read_roles', 'roles', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(13, 'edit_roles', 'roles', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(14, 'add_roles', 'roles', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(15, 'delete_roles', 'roles', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(16, 'browse_users', 'users', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(17, 'read_users', 'users', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(18, 'edit_users', 'users', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(19, 'add_users', 'users', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(20, 'delete_users', 'users', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(21, 'browse_settings', 'settings', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(22, 'read_settings', 'settings', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(23, 'edit_settings', 'settings', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(24, 'add_settings', 'settings', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(25, 'delete_settings', 'settings', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(26, 'browse_categories', 'categories', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(27, 'read_categories', 'categories', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(28, 'edit_categories', 'categories', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(29, 'add_categories', 'categories', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(30, 'delete_categories', 'categories', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(31, 'browse_posts', 'posts', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(32, 'read_posts', 'posts', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(33, 'edit_posts', 'posts', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(34, 'add_posts', 'posts', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(35, 'delete_posts', 'posts', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(36, 'browse_pages', 'pages', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(37, 'read_pages', 'pages', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(38, 'edit_pages', 'pages', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(39, 'add_pages', 'pages', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(40, 'delete_pages', 'pages', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(41, 'browse_websites', 'websites', '2023-07-24 09:55:55', '2023-07-24 09:55:55'),
(42, 'read_websites', 'websites', '2023-07-24 09:55:55', '2023-07-24 09:55:55'),
(43, 'edit_websites', 'websites', '2023-07-24 09:55:55', '2023-07-24 09:55:55'),
(44, 'add_websites', 'websites', '2023-07-24 09:55:55', '2023-07-24 09:55:55'),
(45, 'delete_websites', 'websites', '2023-07-24 09:55:55', '2023-07-24 09:55:55'),
(46, 'browse_patches', 'patches', '2023-07-27 07:39:28', '2023-07-27 07:39:28'),
(47, 'read_patches', 'patches', '2023-07-27 07:39:28', '2023-07-27 07:39:28'),
(48, 'edit_patches', 'patches', '2023-07-27 07:39:28', '2023-07-27 07:39:28'),
(49, 'add_patches', 'patches', '2023-07-27 07:39:28', '2023-07-27 07:39:28'),
(50, 'delete_patches', 'patches', '2023-07-27 07:39:28', '2023-07-27 07:39:28'),
(51, 'browse_modules', 'modules', '2023-07-27 07:49:04', '2023-07-27 07:49:04'),
(52, 'read_modules', 'modules', '2023-07-27 07:49:04', '2023-07-27 07:49:04'),
(53, 'edit_modules', 'modules', '2023-07-27 07:49:04', '2023-07-27 07:49:04'),
(54, 'add_modules', 'modules', '2023-07-27 07:49:04', '2023-07-27 07:49:04'),
(55, 'delete_modules', 'modules', '2023-07-27 07:49:04', '2023-07-27 07:49:04'),
(56, 'browse_accounts', 'accounts', '2023-07-27 08:00:40', '2023-07-27 08:00:40'),
(57, 'read_accounts', 'accounts', '2023-07-27 08:00:40', '2023-07-27 08:00:40'),
(58, 'edit_accounts', 'accounts', '2023-07-27 08:00:40', '2023-07-27 08:00:40'),
(59, 'add_accounts', 'accounts', '2023-07-27 08:00:40', '2023-07-27 08:00:40'),
(60, 'delete_accounts', 'accounts', '2023-07-27 08:00:40', '2023-07-27 08:00:40'),
(76, 'browse_notifications', 'notifications', '2023-07-27 09:34:35', '2023-07-27 09:34:35'),
(77, 'read_notifications', 'notifications', '2023-07-27 09:34:35', '2023-07-27 09:34:35'),
(78, 'edit_notifications', 'notifications', '2023-07-27 09:34:35', '2023-07-27 09:34:35'),
(79, 'add_notifications', 'notifications', '2023-07-27 09:34:35', '2023-07-27 09:34:35'),
(80, 'delete_notifications', 'notifications', '2023-07-27 09:34:35', '2023-07-27 09:34:35'),
(86, 'browse_slas', 'slas', '2023-07-30 09:16:54', '2023-07-30 09:16:54'),
(87, 'read_slas', 'slas', '2023-07-30 09:16:54', '2023-07-30 09:16:54'),
(88, 'edit_slas', 'slas', '2023-07-30 09:16:54', '2023-07-30 09:16:54'),
(89, 'add_slas', 'slas', '2023-07-30 09:16:54', '2023-07-30 09:16:54'),
(90, 'delete_slas', 'slas', '2023-07-30 09:16:54', '2023-07-30 09:16:54');

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2023-07-24 09:40:47', '2023-07-24 09:40:47');

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(2, 'user', 'Normal User', '2023-07-24 09:40:47', '2023-07-24 09:40:47');

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Patch360', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/July2023/Wvfp59nQzp0On3OFfhiq.jpeg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Patch360', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Patch360. A patch monitoring tool that tracks and implements the releases of patches.', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/July2023/xtXn4xTds71QRJA73zJ1.jpg', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2023-07-24 09:40:47', '2023-07-24 09:40:47'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2023-07-24 09:40:47', '2023-07-24 09:40:47');

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Armando', 'admin@admin.com', 'users/July2023/xwYzTAMsIXUzVciVwGaj.jpg', NULL, '$2y$10$yzWNiiqyieM4covWDi8Ie.YuRgUxNt7Gy.UtxGC5ap63acQIRd.N2', 'iMudeevybOSvvwHcQVcxztFTp9u3nqG2CBQYimsdtvf8V16HY1dVRE8eoCpZ', '{\"locale\":\"en\"}', '2023-07-24 09:40:47', '2023-07-27 08:35:51');

INSERT INTO `websites` (`id`, `name`, `url`, `cms`, `patch_version`, `patch_status`, `created_at`, `updated_at`) VALUES
(1, 'Victorian Department of Health', 'health.gov.au', 'Drupal', '7.9.6', 'Up to date', '2023-07-24 10:01:00', '2023-07-27 10:28:32');



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;