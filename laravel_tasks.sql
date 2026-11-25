-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 25, 2026 at 08:12 AM
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
-- Database: `laravel_tasks`
--

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
('project-tasks-cache-1ea67492b69bf42760caf4afcea467f1', 'i:2;', 1795590480),
('project-tasks-cache-1ea67492b69bf42760caf4afcea467f1:timer', 'i:1795590480;', 1795590480),
('project-tasks-cache-356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1795590534),
('project-tasks-cache-356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1795590534;', 1795590534),
('project-tasks-cache-5c785c036466adea360111aa28563bfd556b5fba', 'i:2;', 1795590458),
('project-tasks-cache-5c785c036466adea360111aa28563bfd556b5fba:timer', 'i:1795590458;', 1795590458),
('project-tasks-cache-boost:mcp:database-schema:mysql::1:0:0:0', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:16:{s:5:\"cache\";a:3:{s:3:\"key\";s:12:\"varchar(255)\";s:5:\"value\";s:10:\"mediumtext\";s:10:\"expiration\";s:7:\"int(11)\";}s:11:\"cache_locks\";a:3:{s:3:\"key\";s:12:\"varchar(255)\";s:5:\"owner\";s:12:\"varchar(255)\";s:10:\"expiration\";s:7:\"int(11)\";}s:11:\"failed_jobs\";a:7:{s:2:\"id\";s:19:\"bigint(20) unsigned\";s:4:\"uuid\";s:12:\"varchar(255)\";s:10:\"connection\";s:4:\"text\";s:5:\"queue\";s:4:\"text\";s:7:\"payload\";s:8:\"longtext\";s:9:\"exception\";s:8:\"longtext\";s:9:\"failed_at\";s:9:\"timestamp\";}s:4:\"jobs\";a:7:{s:2:\"id\";s:19:\"bigint(20) unsigned\";s:5:\"queue\";s:12:\"varchar(255)\";s:7:\"payload\";s:8:\"longtext\";s:8:\"attempts\";s:19:\"tinyint(3) unsigned\";s:11:\"reserved_at\";s:16:\"int(10) unsigned\";s:12:\"available_at\";s:16:\"int(10) unsigned\";s:10:\"created_at\";s:16:\"int(10) unsigned\";}s:11:\"job_batches\";a:10:{s:2:\"id\";s:12:\"varchar(255)\";s:4:\"name\";s:12:\"varchar(255)\";s:10:\"total_jobs\";s:7:\"int(11)\";s:12:\"pending_jobs\";s:7:\"int(11)\";s:11:\"failed_jobs\";s:7:\"int(11)\";s:14:\"failed_job_ids\";s:8:\"longtext\";s:7:\"options\";s:10:\"mediumtext\";s:12:\"cancelled_at\";s:7:\"int(11)\";s:10:\"created_at\";s:7:\"int(11)\";s:11:\"finished_at\";s:7:\"int(11)\";}s:7:\"members\";a:15:{s:2:\"id\";s:19:\"bigint(20) unsigned\";s:17:\"membership_number\";s:12:\"varchar(255)\";s:10:\"first_name\";s:12:\"varchar(255)\";s:9:\"last_name\";s:12:\"varchar(255)\";s:5:\"email\";s:12:\"varchar(255)\";s:5:\"phone\";s:12:\"varchar(255)\";s:7:\"address\";s:4:\"text\";s:22:\"membership_category_id\";s:19:\"bigint(20) unsigned\";s:19:\"membership_level_id\";s:19:\"bigint(20) unsigned\";s:9:\"starts_at\";s:4:\"date\";s:10:\"expires_at\";s:4:\"date\";s:6:\"status\";s:49:\"enum(\'active\',\'inactive\',\'pending\',\'deactivated\')\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";s:5:\"notes\";s:4:\"text\";}s:23:\"membership_applications\";a:13:{s:2:\"id\";s:19:\"bigint(20) unsigned\";s:22:\"membership_category_id\";s:19:\"bigint(20) unsigned\";s:12:\"reference_no\";s:12:\"varchar(255)\";s:9:\"full_name\";s:12:\"varchar(150)\";s:5:\"email\";s:12:\"varchar(255)\";s:5:\"phone\";s:11:\"varchar(30)\";s:7:\"address\";s:12:\"varchar(255)\";s:8:\"latitude\";s:13:\"decimal(10,7)\";s:9:\"longitude\";s:13:\"decimal(10,7)\";s:6:\"status\";s:12:\"varchar(255)\";s:20:\"verification_sent_at\";s:9:\"timestamp\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";}s:21:\"membership_categories\";a:7:{s:2:\"id\";s:19:\"bigint(20) unsigned\";s:4:\"name\";s:12:\"varchar(255)\";s:4:\"slug\";s:12:\"varchar(255)\";s:11:\"description\";s:4:\"text\";s:9:\"is_active\";s:10:\"tinyint(1)\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";}s:17:\"membership_levels\";a:9:{s:2:\"id\";s:19:\"bigint(20) unsigned\";s:22:\"membership_category_id\";s:19:\"bigint(20) unsigned\";s:4:\"name\";s:12:\"varchar(255)\";s:3:\"fee\";s:13:\"decimal(10,2)\";s:13:\"validity_days\";s:16:\"int(10) unsigned\";s:8:\"benefits\";s:4:\"text\";s:9:\"is_active\";s:10:\"tinyint(1)\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";}s:23:\"membership_transactions\";a:8:{s:2:\"id\";s:19:\"bigint(20) unsigned\";s:9:\"member_id\";s:19:\"bigint(20) unsigned\";s:16:\"transaction_code\";s:12:\"varchar(255)\";s:4:\"type\";s:12:\"varchar(255)\";s:6:\"amount\";s:13:\"decimal(10,2)\";s:6:\"status\";s:12:\"varchar(255)\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";}s:10:\"migrations\";a:3:{s:2:\"id\";s:16:\"int(10) unsigned\";s:9:\"migration\";s:12:\"varchar(255)\";s:5:\"batch\";s:7:\"int(11)\";}s:21:\"password_reset_tokens\";a:3:{s:5:\"email\";s:12:\"varchar(255)\";s:5:\"token\";s:12:\"varchar(255)\";s:10:\"created_at\";s:9:\"timestamp\";}s:8:\"payments\";a:9:{s:2:\"id\";s:19:\"bigint(20) unsigned\";s:9:\"member_id\";s:19:\"bigint(20) unsigned\";s:25:\"membership_transaction_id\";s:19:\"bigint(20) unsigned\";s:6:\"amount\";s:13:\"decimal(10,2)\";s:14:\"payment_method\";s:12:\"varchar(255)\";s:16:\"reference_number\";s:12:\"varchar(255)\";s:6:\"status\";s:12:\"varchar(255)\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";}s:8:\"sessions\";a:6:{s:2:\"id\";s:12:\"varchar(255)\";s:7:\"user_id\";s:19:\"bigint(20) unsigned\";s:10:\"ip_address\";s:11:\"varchar(45)\";s:10:\"user_agent\";s:4:\"text\";s:7:\"payload\";s:8:\"longtext\";s:13:\"last_activity\";s:7:\"int(11)\";}s:5:\"tasks\";a:6:{s:2:\"id\";s:19:\"bigint(20) unsigned\";s:10:\"task_title\";s:12:\"varchar(255)\";s:11:\"description\";s:4:\"text\";s:9:\"completed\";s:10:\"tinyint(1)\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";}s:5:\"users\";a:10:{s:2:\"id\";s:19:\"bigint(20) unsigned\";s:4:\"name\";s:12:\"varchar(255)\";s:5:\"email\";s:12:\"varchar(255)\";s:17:\"email_verified_at\";s:9:\"timestamp\";s:8:\"password\";s:12:\"varchar(255)\";s:14:\"remember_token\";s:12:\"varchar(100)\";s:10:\"created_at\";s:9:\"timestamp\";s:10:\"updated_at\";s:9:\"timestamp\";s:4:\"role\";s:12:\"varchar(255)\";s:9:\"member_id\";s:19:\"bigint(20) unsigned\";}}}', 1795589554),
('project-tasks-cache-boost:mcp:database-schema:mysql:member:0:0:0:0', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:4:{s:7:\"members\";a:5:{s:7:\"columns\";a:14:{s:2:\"id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:17:\"membership_number\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:10:\"first_name\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:9:\"last_name\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:5:\"email\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:5:\"phone\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:7:\"address\";a:1:{s:4:\"type\";s:4:\"text\";}s:22:\"membership_category_id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:19:\"membership_level_id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:9:\"starts_at\";a:1:{s:4:\"type\";s:4:\"date\";}s:10:\"expires_at\";a:1:{s:4:\"type\";s:4:\"date\";}s:6:\"status\";a:1:{s:4:\"type\";s:49:\"enum(\'active\',\'inactive\',\'pending\',\'deactivated\')\";}s:10:\"created_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:10:\"updated_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}}s:7:\"indexes\";a:3:{s:38:\"members_membership_category_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:35:\"members_membership_level_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:19:\"membership_level_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:2:{i:0;a:7:{s:4:\"name\";s:38:\"members_membership_category_id_foreign\";s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:21:\"membership_categories\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}i:1;a:7:{s:4:\"name\";s:35:\"members_membership_level_id_foreign\";s:7:\"columns\";a:1:{i:0;s:19:\"membership_level_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:17:\"membership_levels\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}s:21:\"membership_categories\";a:5:{s:7:\"columns\";a:7:{s:2:\"id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:4:\"name\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:4:\"slug\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:11:\"description\";a:1:{s:4:\"type\";s:4:\"text\";}s:9:\"is_active\";a:1:{s:4:\"type\";s:10:\"tinyint(1)\";}s:10:\"created_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:10:\"updated_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}}s:7:\"indexes\";a:2:{s:33:\"membership_categories_slug_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:4:\"slug\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:0:{}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}s:17:\"membership_levels\";a:5:{s:7:\"columns\";a:9:{s:2:\"id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:22:\"membership_category_id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:4:\"name\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:3:\"fee\";a:1:{s:4:\"type\";s:13:\"decimal(10,2)\";}s:13:\"validity_days\";a:1:{s:4:\"type\";s:16:\"int(10) unsigned\";}s:8:\"benefits\";a:1:{s:4:\"type\";s:4:\"text\";}s:9:\"is_active\";a:1:{s:4:\"type\";s:10:\"tinyint(1)\";}s:10:\"created_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:10:\"updated_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}}s:7:\"indexes\";a:2:{s:48:\"membership_levels_membership_category_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:1:{i:0;a:7:{s:4:\"name\";s:48:\"membership_levels_membership_category_id_foreign\";s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:21:\"membership_categories\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}s:23:\"membership_transactions\";a:5:{s:7:\"columns\";a:8:{s:2:\"id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:9:\"member_id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:16:\"transaction_code\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:4:\"type\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:6:\"amount\";a:1:{s:4:\"type\";s:13:\"decimal(10,2)\";}s:6:\"status\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:10:\"created_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:10:\"updated_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}}s:7:\"indexes\";a:3:{s:41:\"membership_transactions_member_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:47:\"membership_transactions_transaction_code_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:16:\"transaction_code\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:1:{i:0;a:7:{s:4:\"name\";s:41:\"membership_transactions_member_id_foreign\";s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:7:\"members\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}', 1795493625),
('project-tasks-cache-boost:mcp:database-schema:mysql:members:0:0:0:0', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:4:{s:7:\"members\";a:5:{s:7:\"columns\";a:15:{s:2:\"id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:17:\"membership_number\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:10:\"first_name\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:9:\"last_name\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:5:\"email\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:5:\"phone\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:7:\"address\";a:1:{s:4:\"type\";s:4:\"text\";}s:22:\"membership_category_id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:19:\"membership_level_id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:9:\"starts_at\";a:1:{s:4:\"type\";s:4:\"date\";}s:10:\"expires_at\";a:1:{s:4:\"type\";s:4:\"date\";}s:6:\"status\";a:1:{s:4:\"type\";s:49:\"enum(\'active\',\'inactive\',\'pending\',\'deactivated\')\";}s:10:\"created_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:10:\"updated_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:5:\"notes\";a:1:{s:4:\"type\";s:4:\"text\";}}s:7:\"indexes\";a:3:{s:38:\"members_membership_category_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:35:\"members_membership_level_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:19:\"membership_level_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:2:{i:0;a:7:{s:4:\"name\";s:38:\"members_membership_category_id_foreign\";s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:21:\"membership_categories\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}i:1;a:7:{s:4:\"name\";s:35:\"members_membership_level_id_foreign\";s:7:\"columns\";a:1:{i:0;s:19:\"membership_level_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:17:\"membership_levels\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}s:21:\"membership_categories\";a:5:{s:7:\"columns\";a:7:{s:2:\"id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:4:\"name\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:4:\"slug\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:11:\"description\";a:1:{s:4:\"type\";s:4:\"text\";}s:9:\"is_active\";a:1:{s:4:\"type\";s:10:\"tinyint(1)\";}s:10:\"created_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:10:\"updated_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}}s:7:\"indexes\";a:2:{s:33:\"membership_categories_slug_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:4:\"slug\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:0:{}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}s:17:\"membership_levels\";a:5:{s:7:\"columns\";a:9:{s:2:\"id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:22:\"membership_category_id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:4:\"name\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:3:\"fee\";a:1:{s:4:\"type\";s:13:\"decimal(10,2)\";}s:13:\"validity_days\";a:1:{s:4:\"type\";s:16:\"int(10) unsigned\";}s:8:\"benefits\";a:1:{s:4:\"type\";s:4:\"text\";}s:9:\"is_active\";a:1:{s:4:\"type\";s:10:\"tinyint(1)\";}s:10:\"created_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:10:\"updated_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}}s:7:\"indexes\";a:2:{s:48:\"membership_levels_membership_category_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:1:{i:0;a:7:{s:4:\"name\";s:48:\"membership_levels_membership_category_id_foreign\";s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:21:\"membership_categories\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}s:23:\"membership_transactions\";a:5:{s:7:\"columns\";a:8:{s:2:\"id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:9:\"member_id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:16:\"transaction_code\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:4:\"type\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:6:\"amount\";a:1:{s:4:\"type\";s:13:\"decimal(10,2)\";}s:6:\"status\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:10:\"created_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:10:\"updated_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}}s:7:\"indexes\";a:3:{s:41:\"membership_transactions_member_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:47:\"membership_transactions_transaction_code_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:16:\"transaction_code\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:1:{i:0;a:7:{s:4:\"name\";s:41:\"membership_transactions_member_id_foreign\";s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:7:\"members\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}', 1795494144),
('project-tasks-cache-boost:mcp:database-schema:mysql:membership_applications:0:0:0:1', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:23:\"membership_applications\";a:5:{s:7:\"columns\";a:15:{s:2:\"id\";a:4:{s:4:\"type\";s:19:\"bigint(20) unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:22:\"membership_category_id\";a:4:{s:4:\"type\";s:19:\"bigint(20) unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:12:\"reference_no\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:9:\"full_name\";a:4:{s:4:\"type\";s:12:\"varchar(150)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:5:\"email\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:5:\"phone\";a:4:{s:4:\"type\";s:11:\"varchar(30)\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:7:\"address\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:8:\"latitude\";a:4:{s:4:\"type\";s:13:\"decimal(10,7)\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:9:\"longitude\";a:4:{s:4:\"type\";s:13:\"decimal(10,7)\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:6:\"status\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";s:9:\"\'pending\'\";s:14:\"auto_increment\";b:0;}s:20:\"verification_sent_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:7:\"user_id\";a:4:{s:4:\"type\";s:19:\"bigint(20) unsigned\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:11:\"reviewed_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:4:{s:54:\"membership_applications_membership_category_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:43:\"membership_applications_reference_no_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:12:\"reference_no\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:38:\"membership_applications_user_id_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:2:{i:0;a:7:{s:4:\"name\";s:54:\"membership_applications_membership_category_id_foreign\";s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:21:\"membership_categories\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:8:\"restrict\";}i:1;a:7:{s:4:\"name\";s:39:\"membership_applications_user_id_foreign\";s:7:\"columns\";a:1:{i:0;s:7:\"user_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:5:\"users\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:8:\"set null\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}', 1795589659),
('project-tasks-cache-boost:mcp:database-schema:mysql:membership_levels:0:0:0:1', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:17:\"membership_levels\";a:5:{s:7:\"columns\";a:9:{s:2:\"id\";a:4:{s:4:\"type\";s:19:\"bigint(20) unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:22:\"membership_category_id\";a:4:{s:4:\"type\";s:19:\"bigint(20) unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:4:\"name\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:3:\"fee\";a:4:{s:4:\"type\";s:13:\"decimal(10,2)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:13:\"validity_days\";a:4:{s:4:\"type\";s:16:\"int(10) unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:8:\"benefits\";a:4:{s:4:\"type\";s:4:\"text\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:9:\"is_active\";a:4:{s:4:\"type\";s:10:\"tinyint(1)\";s:8:\"nullable\";b:0;s:7:\"default\";s:1:\"1\";s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:2:{s:48:\"membership_levels_membership_category_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:1:{i:0;a:7:{s:4:\"name\";s:48:\"membership_levels_membership_category_id_foreign\";s:7:\"columns\";a:1:{i:0;s:22:\"membership_category_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:21:\"membership_categories\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}', 1795588761),
('project-tasks-cache-boost:mcp:database-schema:mysql:membership_transaction:0:0:0:0', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:23:\"membership_transactions\";a:5:{s:7:\"columns\";a:8:{s:2:\"id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:9:\"member_id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:16:\"transaction_code\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:4:\"type\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:6:\"amount\";a:1:{s:4:\"type\";s:13:\"decimal(10,2)\";}s:6:\"status\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:10:\"created_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:10:\"updated_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}}s:7:\"indexes\";a:3:{s:41:\"membership_transactions_member_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:47:\"membership_transactions_transaction_code_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:16:\"transaction_code\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:1:{i:0;a:7:{s:4:\"name\";s:41:\"membership_transactions_member_id_foreign\";s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:7:\"members\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}', 1795493429),
('project-tasks-cache-boost:mcp:database-schema:mysql:membership_transactions:0:0:0:1', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:23:\"membership_transactions\";a:5:{s:7:\"columns\";a:8:{s:2:\"id\";a:4:{s:4:\"type\";s:19:\"bigint(20) unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:9:\"member_id\";a:4:{s:4:\"type\";s:19:\"bigint(20) unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:16:\"transaction_code\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:4:\"type\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:6:\"amount\";a:4:{s:4:\"type\";s:13:\"decimal(10,2)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:6:\"status\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:3:{s:41:\"membership_transactions_member_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:47:\"membership_transactions_transaction_code_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:16:\"transaction_code\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:1:{i:0;a:7:{s:4:\"name\";s:41:\"membership_transactions_member_id_foreign\";s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:7:\"members\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}', 1795588760),
('project-tasks-cache-boost:mcp:database-schema:mysql:payment:0:0:0:0', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:8:\"payments\";a:5:{s:7:\"columns\";a:9:{s:2:\"id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:9:\"member_id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:25:\"membership_transaction_id\";a:1:{s:4:\"type\";s:19:\"bigint(20) unsigned\";}s:6:\"amount\";a:1:{s:4:\"type\";s:13:\"decimal(10,2)\";}s:14:\"payment_method\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:16:\"reference_number\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:6:\"status\";a:1:{s:4:\"type\";s:12:\"varchar(255)\";}s:10:\"created_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}s:10:\"updated_at\";a:1:{s:4:\"type\";s:9:\"timestamp\";}}s:7:\"indexes\";a:3:{s:42:\"payments_membership_transaction_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:25:\"membership_transaction_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:26:\"payments_member_id_foreign\";a:4:{s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:0;s:10:\"is_primary\";b:0;}s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}}s:12:\"foreign_keys\";a:2:{i:0;a:7:{s:4:\"name\";s:42:\"payments_membership_transaction_id_foreign\";s:7:\"columns\";a:1:{i:0;s:25:\"membership_transaction_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:23:\"membership_transactions\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}i:1;a:7:{s:4:\"name\";s:26:\"payments_member_id_foreign\";s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:7:\"members\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:7:\"cascade\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}', 1795493428),
('project-tasks-cache-boost:mcp:database-schema:mysql:users:0:0:0:1', 'a:2:{s:6:\"engine\";s:5:\"mysql\";s:6:\"tables\";a:1:{s:5:\"users\";a:5:{s:7:\"columns\";a:11:{s:2:\"id\";a:4:{s:4:\"type\";s:19:\"bigint(20) unsigned\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:1;}s:4:\"name\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:5:\"email\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:17:\"email_verified_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:8:\"password\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";N;s:14:\"auto_increment\";b:0;}s:14:\"remember_token\";a:4:{s:4:\"type\";s:12:\"varchar(100)\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:10:\"created_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:10:\"updated_at\";a:4:{s:4:\"type\";s:9:\"timestamp\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:4:\"role\";a:4:{s:4:\"type\";s:12:\"varchar(255)\";s:8:\"nullable\";b:0;s:7:\"default\";s:8:\"\'member\'\";s:14:\"auto_increment\";b:0;}s:9:\"member_id\";a:4:{s:4:\"type\";s:19:\"bigint(20) unsigned\";s:8:\"nullable\";b:1;s:7:\"default\";s:4:\"NULL\";s:14:\"auto_increment\";b:0;}s:9:\"is_active\";a:4:{s:4:\"type\";s:10:\"tinyint(1)\";s:8:\"nullable\";b:0;s:7:\"default\";s:1:\"1\";s:14:\"auto_increment\";b:0;}}s:7:\"indexes\";a:3:{s:7:\"primary\";a:4:{s:7:\"columns\";a:1:{i:0;s:2:\"id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:1;}s:18:\"users_email_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:5:\"email\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}s:22:\"users_member_id_unique\";a:4:{s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:4:\"type\";s:5:\"btree\";s:9:\"is_unique\";b:1;s:10:\"is_primary\";b:0;}}s:12:\"foreign_keys\";a:1:{i:0;a:7:{s:4:\"name\";s:23:\"users_member_id_foreign\";s:7:\"columns\";a:1:{i:0;s:9:\"member_id\";}s:14:\"foreign_schema\";s:13:\"laravel_tasks\";s:13:\"foreign_table\";s:7:\"members\";s:15:\"foreign_columns\";a:1:{i:0;s:2:\"id\";}s:9:\"on_update\";s:8:\"restrict\";s:9:\"on_delete\";s:8:\"set null\";}}s:8:\"triggers\";a:0:{}s:17:\"check_constraints\";a:0:{}}}}', 1795589659),
('project-tasks-cache-c525a5357e97fef8d3db25841c86da1a', 'i:1;', 1795588505),
('project-tasks-cache-c525a5357e97fef8d3db25841c86da1a:timer', 'i:1795588505;', 1795588505),
('project-tasks-cache-illuminate:queue:restart', 'i:1795585661;', 2110945661),
('project-tasks-cache-openweather:14.5886686:120.9816170', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:120.9804;s:3:\"lat\";d:14.5904;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:802;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:16:\"scattered clouds\";s:4:\"icon\";s:3:\"03d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:32.03;s:10:\"feels_like\";d:36.55;s:8:\"temp_min\";d:29.52;s:8:\"temp_max\";d:32.03;s:8:\"pressure\";i:1010;s:8:\"humidity\";i:58;s:9:\"sea_level\";i:1010;s:10:\"grnd_level\";i:1012;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:4.12;s:3:\"deg\";i:110;}s:6:\"clouds\";a:1:{s:3:\"all\";i:40;}s:2:\"dt\";i:1795588742;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:8160;s:7:\"country\";s:2:\"PH\";s:7:\"sunrise\";i:1795557717;s:6:\"sunset\";i:1795598655;}s:8:\"timezone\";i:28800;s:2:\"id\";i:7521311;s:4:\"name\";s:23:\"National Capital Region\";s:3:\"cod\";i:200;}', 1795590031),
('project-tasks-cache-openweather:14.5909486:120.9826684', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:120.9783;s:3:\"lat\";d:14.5949;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:801;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:10:\"few clouds\";s:4:\"icon\";s:3:\"02d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:32.02;s:10:\"feels_like\";d:37.74;s:8:\"temp_min\";d:32.02;s:8:\"temp_max\";d:32.3;s:8:\"pressure\";i:1011;s:8:\"humidity\";i:62;s:9:\"sea_level\";i:1011;s:10:\"grnd_level\";i:1013;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:4.63;s:3:\"deg\";i:90;}s:6:\"clouds\";a:1:{s:3:\"all\";i:20;}s:2:\"dt\";i:1795583068;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:8160;s:7:\"country\";s:2:\"PH\";s:7:\"sunrise\";i:1795557718;s:6:\"sunset\";i:1795598655;}s:8:\"timezone\";i:28800;s:2:\"id\";i:7521311;s:4:\"name\";s:23:\"National Capital Region\";s:3:\"cod\";i:200;}', 1795584029),
('project-tasks-cache-openweather:14.5911708:120.9828186', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:120.9775;s:3:\"lat\";d:14.5887;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:802;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:16:\"scattered clouds\";s:4:\"icon\";s:3:\"03d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:32.03;s:10:\"feels_like\";d:36.55;s:8:\"temp_min\";d:30.08;s:8:\"temp_max\";d:32.03;s:8:\"pressure\";i:1010;s:8:\"humidity\";i:58;s:9:\"sea_level\";i:1010;s:10:\"grnd_level\";i:1013;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:4.12;s:3:\"deg\";i:110;}s:6:\"clouds\";a:1:{s:3:\"all\";i:40;}s:2:\"dt\";i:1795587330;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:8160;s:7:\"country\";s:2:\"PH\";s:7:\"sunrise\";i:1795557718;s:6:\"sunset\";i:1795598656;}s:8:\"timezone\";i:28800;s:2:\"id\";i:7521311;s:4:\"name\";s:23:\"National Capital Region\";s:3:\"cod\";i:200;}', 1795588454),
('project-tasks-cache-openweather:14.5959946:120.9839988', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:120.984;s:3:\"lat\";d:14.596;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:803;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:13:\"broken clouds\";s:4:\"icon\";s:3:\"04d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:32.86;s:10:\"feels_like\";d:39.86;s:8:\"temp_min\";d:32.86;s:8:\"temp_max\";d:32.86;s:8:\"pressure\";i:1011;s:8:\"humidity\";i:64;s:9:\"sea_level\";i:1011;s:10:\"grnd_level\";i:1013;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:3:{s:5:\"speed\";d:7.15;s:3:\"deg\";i:100;s:4:\"gust\";d:8.87;}s:6:\"clouds\";a:1:{s:3:\"all\";i:62;}s:2:\"dt\";i:1795584517;s:3:\"sys\";a:5:{s:4:\"type\";i:2;s:2:\"id\";i:2005706;s:7:\"country\";s:2:\"PH\";s:7:\"sunrise\";i:1795557717;s:6:\"sunset\";i:1795598654;}s:8:\"timezone\";i:28800;s:2:\"id\";i:1701668;s:4:\"name\";s:6:\"Manila\";s:3:\"cod\";i:200;}', 1795585145),
('project-tasks-cache-openweather:14.5966529:120.9847069', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:120.9842;s:3:\"lat\";d:14.5995;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:803;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:13:\"broken clouds\";s:4:\"icon\";s:3:\"04d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";d:31.17;s:10:\"feels_like\";d:38.17;s:8:\"temp_min\";d:31.17;s:8:\"temp_max\";d:31.17;s:8:\"pressure\";i:1011;s:8:\"humidity\";i:71;s:9:\"sea_level\";i:1011;s:10:\"grnd_level\";i:1013;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:3:{s:5:\"speed\";d:6.91;s:3:\"deg\";i:97;s:4:\"gust\";d:8.67;}s:6:\"clouds\";a:1:{s:3:\"all\";i:55;}s:2:\"dt\";i:1795586603;s:3:\"sys\";a:5:{s:4:\"type\";i:2;s:2:\"id\";i:2005706;s:7:\"country\";s:2:\"PH\";s:7:\"sunrise\";i:1795557717;s:6:\"sunset\";i:1795598653;}s:8:\"timezone\";i:28800;s:2:\"id\";i:1701668;s:4:\"name\";s:6:\"Manila\";s:3:\"cod\";i:200;}', 1795587510),
('project-tasks-cache-openweather:14.5994345:120.9840471', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:120.9842;s:3:\"lat\";d:14.5995;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:802;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:16:\"scattered clouds\";s:4:\"icon\";s:3:\"03d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";i:32;s:10:\"feels_like\";d:36.48;s:8:\"temp_min\";d:30.06;s:8:\"temp_max\";i:32;s:8:\"pressure\";i:1011;s:8:\"humidity\";i:58;s:9:\"sea_level\";i:1011;s:10:\"grnd_level\";i:1013;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:4.12;s:3:\"deg\";i:110;}s:6:\"clouds\";a:1:{s:3:\"all\";i:40;}s:2:\"dt\";i:1795587003;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:8160;s:7:\"country\";s:2:\"PH\";s:7:\"sunrise\";i:1795557717;s:6:\"sunset\";i:1795598653;}s:8:\"timezone\";i:28800;s:2:\"id\";i:1701668;s:4:\"name\";s:6:\"Manila\";s:3:\"cod\";i:200;}', 1795587855),
('project-tasks-cache-openweather:14.5995000:120.9842000', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:120.9842;s:3:\"lat\";d:14.5995;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:802;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:16:\"scattered clouds\";s:4:\"icon\";s:3:\"03d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";i:32;s:10:\"feels_like\";d:36.48;s:8:\"temp_min\";d:30.62;s:8:\"temp_max\";i:32;s:8:\"pressure\";i:1010;s:8:\"humidity\";i:58;s:9:\"sea_level\";i:1010;s:10:\"grnd_level\";i:1013;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:4.12;s:3:\"deg\";i:110;}s:6:\"clouds\";a:1:{s:3:\"all\";i:40;}s:2:\"dt\";i:1795590203;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:8160;s:7:\"country\";s:2:\"PH\";s:7:\"sunrise\";i:1795557717;s:6:\"sunset\";i:1795598653;}s:8:\"timezone\";i:28800;s:2:\"id\";i:1688216;s:4:\"name\";s:10:\"Santa Cruz\";s:3:\"cod\";i:200;}', 1795590921),
('project-tasks-cache-openweather:14.6005009:120.9837627', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:120.9833;s:3:\"lat\";d:14.6;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:802;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:16:\"scattered clouds\";s:4:\"icon\";s:3:\"03d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";i:29;s:10:\"feels_like\";d:33.49;s:8:\"temp_min\";i:29;s:8:\"temp_max\";d:30.06;s:8:\"pressure\";i:1013;s:8:\"humidity\";i:74;s:9:\"sea_level\";i:1013;s:10:\"grnd_level\";i:1016;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:2.06;s:3:\"deg\";i:70;}s:6:\"clouds\";a:1:{s:3:\"all\";i:40;}s:2:\"dt\";i:1795575056;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:8160;s:7:\"country\";s:2:\"PH\";s:7:\"sunrise\";i:1795557717;s:6:\"sunset\";i:1795598653;}s:8:\"timezone\";i:28800;s:2:\"id\";i:1701668;s:4:\"name\";s:6:\"Manila\";s:3:\"cod\";i:200;}', 1795575868),
('project-tasks-cache-openweather:14.6037123:120.9837198', 'a:13:{s:5:\"coord\";a:2:{s:3:\"lon\";d:120.9833;s:3:\"lat\";d:14.6;}s:7:\"weather\";a:1:{i:0;a:4:{s:2:\"id\";i:802;s:4:\"main\";s:6:\"Clouds\";s:11:\"description\";s:16:\"scattered clouds\";s:4:\"icon\";s:3:\"03d\";}}s:4:\"base\";s:8:\"stations\";s:4:\"main\";a:8:{s:4:\"temp\";i:29;s:10:\"feels_like\";d:33.49;s:8:\"temp_min\";i:29;s:8:\"temp_max\";d:30.06;s:8:\"pressure\";i:1013;s:8:\"humidity\";i:74;s:9:\"sea_level\";i:1013;s:10:\"grnd_level\";i:1016;}s:10:\"visibility\";i:10000;s:4:\"wind\";a:2:{s:5:\"speed\";d:2.06;s:3:\"deg\";i:70;}s:6:\"clouds\";a:1:{s:3:\"all\";i:40;}s:2:\"dt\";i:1795575056;s:3:\"sys\";a:5:{s:4:\"type\";i:1;s:2:\"id\";i:8160;s:7:\"country\";s:2:\"PH\";s:7:\"sunrise\";i:1795557717;s:6:\"sunset\";i:1795598653;}s:8:\"timezone\";i:28800;s:2:\"id\";i:1701668;s:4:\"name\";s:6:\"Manila\";s:3:\"cod\";i:200;}', 1795575865);
INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('project-tasks-cache-roster:project:v3:e27b6e78b5800f799757a226c9f54414', 'O:26:\"Laravel\\Roster\\ProjectScan\":8:{s:8:\"basePath\";s:28:\"D:\\xampp\\htdocs\\laravelproj\\\";s:3:\"php\";O:35:\"Laravel\\Roster\\Ecosystems\\Ecosystem\":2:{s:9:\"\0*\0byName\";a:131:{s:10:\"brick/math\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"brick/math\";s:10:\"\0*\0version\";s:6:\"0.14.8\";s:9:\"\0*\0source\";E:43:\"Laravel\\Roster\\Enums\\PackageSource:Composer\";s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:45:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\brick\\math\";}s:31:\"carbonphp/carbon-doctrine-types\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:31:\"carbonphp/carbon-doctrine-types\";s:10:\"\0*\0version\";s:5:\"3.2.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\carbonphp\\carbon-doctrine-types\";}s:23:\"dflydev/dot-access-data\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"dflydev/dot-access-data\";s:10:\"\0*\0version\";s:5:\"3.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\dflydev\\dot-access-data\";}s:18:\"doctrine/inflector\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:18:\"doctrine/inflector\";s:10:\"\0*\0version\";s:5:\"2.1.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:53:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\doctrine\\inflector\";}s:14:\"doctrine/lexer\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"doctrine/lexer\";s:10:\"\0*\0version\";s:5:\"3.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:49:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\doctrine\\lexer\";}s:29:\"dragonmantank/cron-expression\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:29:\"dragonmantank/cron-expression\";s:10:\"\0*\0version\";s:5:\"3.6.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\dragonmantank\\cron-expression\";}s:23:\"egulias/email-validator\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"egulias/email-validator\";s:10:\"\0*\0version\";s:5:\"4.0.4\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\egulias\\email-validator\";}s:18:\"fruitcake/php-cors\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:18:\"fruitcake/php-cors\";s:10:\"\0*\0version\";s:5:\"1.4.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:53:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\fruitcake\\php-cors\";}s:27:\"graham-campbell/result-type\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:27:\"graham-campbell/result-type\";s:10:\"\0*\0version\";s:5:\"1.2.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\graham-campbell\\result-type\";}s:17:\"guzzlehttp/guzzle\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"guzzlehttp/guzzle\";s:10:\"\0*\0version\";s:6:\"7.16.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:52:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\guzzlehttp\\guzzle\";}s:19:\"guzzlehttp/promises\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"guzzlehttp/promises\";s:10:\"\0*\0version\";s:5:\"2.6.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:54:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\guzzlehttp\\promises\";}s:15:\"guzzlehttp/psr7\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"guzzlehttp/psr7\";s:10:\"\0*\0version\";s:6:\"2.13.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:50:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\guzzlehttp\\psr7\";}s:23:\"guzzlehttp/uri-template\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"guzzlehttp/uri-template\";s:10:\"\0*\0version\";s:6:\"1.0.11\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\guzzlehttp\\uri-template\";}s:17:\"laravel/framework\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"laravel/framework\";s:10:\"\0*\0version\";s:7:\"12.70.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^12.0\";s:7:\"\0*\0path\";s:52:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\laravel\\framework\";}s:15:\"laravel/prompts\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"laravel/prompts\";s:10:\"\0*\0version\";s:6:\"0.3.26\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:50:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\laravel\\prompts\";}s:28:\"laravel/serializable-closure\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:28:\"laravel/serializable-closure\";s:10:\"\0*\0version\";s:5:\"2.1.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\laravel\\serializable-closure\";}s:14:\"laravel/tinker\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"laravel/tinker\";s:10:\"\0*\0version\";s:6:\"2.11.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:7:\"^2.10.1\";s:7:\"\0*\0path\";s:49:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\laravel\\tinker\";}s:17:\"league/commonmark\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"league/commonmark\";s:10:\"\0*\0version\";s:6:\"2.10.4\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:52:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\league\\commonmark\";}s:13:\"league/config\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"league/config\";s:10:\"\0*\0version\";s:5:\"1.2.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:48:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\league\\config\";}s:16:\"league/flysystem\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"league/flysystem\";s:10:\"\0*\0version\";s:6:\"3.36.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:51:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\league\\flysystem\";}s:22:\"league/flysystem-local\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"league/flysystem-local\";s:10:\"\0*\0version\";s:6:\"3.35.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\league\\flysystem-local\";}s:26:\"league/mime-type-detection\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:26:\"league/mime-type-detection\";s:10:\"\0*\0version\";s:6:\"1.17.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\league\\mime-type-detection\";}s:10:\"league/uri\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:10:\"league/uri\";s:10:\"\0*\0version\";s:5:\"7.9.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:45:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\league\\uri\";}s:21:\"league/uri-interfaces\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"league/uri-interfaces\";s:10:\"\0*\0version\";s:5:\"7.9.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:56:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\league\\uri-interfaces\";}s:15:\"monolog/monolog\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"monolog/monolog\";s:10:\"\0*\0version\";s:6:\"3.12.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:50:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\monolog\\monolog\";}s:13:\"nesbot/carbon\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"nesbot/carbon\";s:10:\"\0*\0version\";s:6:\"3.15.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:48:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\nesbot\\carbon\";}s:12:\"nette/schema\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"nette/schema\";s:10:\"\0*\0version\";s:5:\"1.4.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:47:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\nette\\schema\";}s:11:\"nette/utils\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"nette/utils\";s:10:\"\0*\0version\";s:5:\"4.1.6\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:46:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\nette\\utils\";}s:16:\"nikic/php-parser\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"nikic/php-parser\";s:10:\"\0*\0version\";s:5:\"5.9.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:51:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\nikic\\php-parser\";}s:19:\"nunomaduro/termwind\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"nunomaduro/termwind\";s:10:\"\0*\0version\";s:5:\"2.4.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:54:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\nunomaduro\\termwind\";}s:19:\"phpoption/phpoption\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"phpoption/phpoption\";s:10:\"\0*\0version\";s:6:\"1.10.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:54:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phpoption\\phpoption\";}s:9:\"psr/clock\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"psr/clock\";s:10:\"\0*\0version\";s:5:\"1.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:44:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\psr\\clock\";}s:13:\"psr/container\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"psr/container\";s:10:\"\0*\0version\";s:5:\"2.0.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:48:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\psr\\container\";}s:20:\"psr/event-dispatcher\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"psr/event-dispatcher\";s:10:\"\0*\0version\";s:5:\"1.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:55:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\psr\\event-dispatcher\";}s:15:\"psr/http-client\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"psr/http-client\";s:10:\"\0*\0version\";s:5:\"1.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:50:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\psr\\http-client\";}s:16:\"psr/http-factory\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"psr/http-factory\";s:10:\"\0*\0version\";s:5:\"1.1.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:51:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\psr\\http-factory\";}s:16:\"psr/http-message\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"psr/http-message\";s:10:\"\0*\0version\";s:3:\"2.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:51:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\psr\\http-message\";}s:7:\"psr/log\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:7:\"psr/log\";s:10:\"\0*\0version\";s:5:\"3.0.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:42:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\psr\\log\";}s:16:\"psr/simple-cache\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"psr/simple-cache\";s:10:\"\0*\0version\";s:5:\"3.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:51:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\psr\\simple-cache\";}s:9:\"psy/psysh\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:9:\"psy/psysh\";s:10:\"\0*\0version\";s:7:\"0.12.24\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:44:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\psy\\psysh\";}s:23:\"ralouphie/getallheaders\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"ralouphie/getallheaders\";s:10:\"\0*\0version\";s:5:\"3.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\ralouphie\\getallheaders\";}s:17:\"ramsey/collection\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"ramsey/collection\";s:10:\"\0*\0version\";s:5:\"2.1.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:52:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\ramsey\\collection\";}s:11:\"ramsey/uuid\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"ramsey/uuid\";s:10:\"\0*\0version\";s:5:\"4.9.4\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:46:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\ramsey\\uuid\";}s:13:\"symfony/clock\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"symfony/clock\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:48:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\clock\";}s:15:\"symfony/console\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"symfony/console\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:50:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\console\";}s:20:\"symfony/css-selector\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"symfony/css-selector\";s:10:\"\0*\0version\";s:6:\"7.4.18\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:55:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\css-selector\";}s:29:\"symfony/deprecation-contracts\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:29:\"symfony/deprecation-contracts\";s:10:\"\0*\0version\";s:5:\"3.7.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\deprecation-contracts\";}s:21:\"symfony/error-handler\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"symfony/error-handler\";s:10:\"\0*\0version\";s:6:\"7.4.20\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:56:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\error-handler\";}s:24:\"symfony/event-dispatcher\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:24:\"symfony/event-dispatcher\";s:10:\"\0*\0version\";s:6:\"7.4.17\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:59:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\event-dispatcher\";}s:34:\"symfony/event-dispatcher-contracts\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:34:\"symfony/event-dispatcher-contracts\";s:10:\"\0*\0version\";s:5:\"3.7.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\event-dispatcher-contracts\";}s:14:\"symfony/finder\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"symfony/finder\";s:10:\"\0*\0version\";s:6:\"7.4.20\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:49:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\finder\";}s:23:\"symfony/http-foundation\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"symfony/http-foundation\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\http-foundation\";}s:19:\"symfony/http-kernel\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"symfony/http-kernel\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:54:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\http-kernel\";}s:14:\"symfony/mailer\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"symfony/mailer\";s:10:\"\0*\0version\";s:6:\"7.4.19\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:49:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\mailer\";}s:12:\"symfony/mime\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"symfony/mime\";s:10:\"\0*\0version\";s:6:\"7.4.19\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:47:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\mime\";}s:22:\"symfony/polyfill-ctype\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-ctype\";s:10:\"\0*\0version\";s:6:\"1.37.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\polyfill-ctype\";}s:30:\"symfony/polyfill-intl-grapheme\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:30:\"symfony/polyfill-intl-grapheme\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\polyfill-intl-grapheme\";}s:25:\"symfony/polyfill-intl-idn\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"symfony/polyfill-intl-idn\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\polyfill-intl-idn\";}s:32:\"symfony/polyfill-intl-normalizer\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:32:\"symfony/polyfill-intl-normalizer\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:67:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\polyfill-intl-normalizer\";}s:25:\"symfony/polyfill-mbstring\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"symfony/polyfill-mbstring\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\polyfill-mbstring\";}s:22:\"symfony/polyfill-php80\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-php80\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\polyfill-php80\";}s:22:\"symfony/polyfill-php83\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-php83\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\polyfill-php83\";}s:22:\"symfony/polyfill-php84\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-php84\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\polyfill-php84\";}s:22:\"symfony/polyfill-php85\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"symfony/polyfill-php85\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\polyfill-php85\";}s:21:\"symfony/polyfill-time\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"symfony/polyfill-time\";s:10:\"\0*\0version\";s:6:\"1.42.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:56:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\polyfill-time\";}s:21:\"symfony/polyfill-uuid\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"symfony/polyfill-uuid\";s:10:\"\0*\0version\";s:6:\"1.43.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:56:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\polyfill-uuid\";}s:15:\"symfony/process\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"symfony/process\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:50:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\process\";}s:15:\"symfony/routing\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"symfony/routing\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:50:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\routing\";}s:25:\"symfony/service-contracts\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"symfony/service-contracts\";s:10:\"\0*\0version\";s:5:\"3.7.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\service-contracts\";}s:14:\"symfony/string\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"symfony/string\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:49:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\string\";}s:19:\"symfony/translation\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"symfony/translation\";s:10:\"\0*\0version\";s:6:\"7.4.17\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:54:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\translation\";}s:29:\"symfony/translation-contracts\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:29:\"symfony/translation-contracts\";s:10:\"\0*\0version\";s:5:\"3.7.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:64:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\translation-contracts\";}s:11:\"symfony/uid\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"symfony/uid\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:46:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\uid\";}s:18:\"symfony/var-dumper\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:18:\"symfony/var-dumper\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:53:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\var-dumper\";}s:33:\"tijsverkoyen/css-to-inline-styles\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:33:\"tijsverkoyen/css-to-inline-styles\";s:10:\"\0*\0version\";s:5:\"2.4.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:68:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\tijsverkoyen\\css-to-inline-styles\";}s:16:\"vlucas/phpdotenv\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"vlucas/phpdotenv\";s:10:\"\0*\0version\";s:5:\"5.8.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:51:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\vlucas\\phpdotenv\";}s:19:\"voku/portable-ascii\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"voku/portable-ascii\";s:10:\"\0*\0version\";s:5:\"2.1.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:0;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:54:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\voku\\portable-ascii\";}s:17:\"brianium/paratest\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"brianium/paratest\";s:10:\"\0*\0version\";s:5:\"7.8.6\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:52:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\brianium\\paratest\";}s:15:\"composer/semver\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"composer/semver\";s:10:\"\0*\0version\";s:5:\"3.5.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:50:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\composer\\semver\";}s:21:\"doctrine/deprecations\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"doctrine/deprecations\";s:10:\"\0*\0version\";s:5:\"1.1.6\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:56:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\doctrine\\deprecations\";}s:14:\"fakerphp/faker\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"fakerphp/faker\";s:10:\"\0*\0version\";s:6:\"1.24.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.23\";s:7:\"\0*\0path\";s:49:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\fakerphp\\faker\";}s:22:\"fidry/cpu-core-counter\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"fidry/cpu-core-counter\";s:10:\"\0*\0version\";s:5:\"1.4.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\fidry\\cpu-core-counter\";}s:11:\"filp/whoops\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"filp/whoops\";s:10:\"\0*\0version\";s:6:\"2.18.7\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:46:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\filp\\whoops\";}s:21:\"hamcrest/hamcrest-php\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"hamcrest/hamcrest-php\";s:10:\"\0*\0version\";s:5:\"3.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:56:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\hamcrest\\hamcrest-php\";}s:30:\"jean85/pretty-package-versions\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:30:\"jean85/pretty-package-versions\";s:10:\"\0*\0version\";s:5:\"2.1.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:65:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\jean85\\pretty-package-versions\";}s:13:\"laravel/boost\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:13:\"laravel/boost\";s:10:\"\0*\0version\";s:6:\"2.10.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^2.2\";s:7:\"\0*\0path\";s:48:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\laravel\\boost\";}s:11:\"laravel/mcp\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"laravel/mcp\";s:10:\"\0*\0version\";s:5:\"1.1.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:46:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\laravel\\mcp\";}s:12:\"laravel/pail\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"laravel/pail\";s:10:\"\0*\0version\";s:5:\"1.2.7\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^1.2.2\";s:7:\"\0*\0path\";s:47:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\laravel\\pail\";}s:12:\"laravel/pint\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"laravel/pint\";s:10:\"\0*\0version\";s:6:\"1.30.4\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.24\";s:7:\"\0*\0path\";s:47:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\laravel\\pint\";}s:14:\"laravel/roster\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"laravel/roster\";s:10:\"\0*\0version\";s:5:\"1.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:49:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\laravel\\roster\";}s:12:\"laravel/sail\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"laravel/sail\";s:10:\"\0*\0version\";s:6:\"1.69.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:5:\"^1.41\";s:7:\"\0*\0path\";s:47:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\laravel\\sail\";}s:15:\"mockery/mockery\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"mockery/mockery\";s:10:\"\0*\0version\";s:6:\"1.6.15\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^1.6\";s:7:\"\0*\0path\";s:50:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\mockery\\mockery\";}s:17:\"myclabs/deep-copy\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"myclabs/deep-copy\";s:10:\"\0*\0version\";s:6:\"1.14.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:52:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\myclabs\\deep-copy\";}s:20:\"nunomaduro/collision\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"nunomaduro/collision\";s:10:\"\0*\0version\";s:5:\"8.9.5\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^8.6\";s:7:\"\0*\0path\";s:55:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\nunomaduro\\collision\";}s:12:\"pestphp/pest\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"pestphp/pest\";s:10:\"\0*\0version\";s:5:\"3.8.7\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^3.8\";s:7:\"\0*\0path\";s:47:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\pestphp\\pest\";}s:19:\"pestphp/pest-plugin\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"pestphp/pest-plugin\";s:10:\"\0*\0version\";s:5:\"3.0.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:54:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\pestphp\\pest-plugin\";}s:24:\"pestphp/pest-plugin-arch\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:24:\"pestphp/pest-plugin-arch\";s:10:\"\0*\0version\";s:5:\"3.1.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:59:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\pestphp\\pest-plugin-arch\";}s:27:\"pestphp/pest-plugin-laravel\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:27:\"pestphp/pest-plugin-laravel\";s:10:\"\0*\0version\";s:5:\"3.2.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:4:\"^3.2\";s:7:\"\0*\0path\";s:62:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\pestphp\\pest-plugin-laravel\";}s:26:\"pestphp/pest-plugin-mutate\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:26:\"pestphp/pest-plugin-mutate\";s:10:\"\0*\0version\";s:5:\"3.0.5\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\pestphp\\pest-plugin-mutate\";}s:16:\"phar-io/manifest\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"phar-io/manifest\";s:10:\"\0*\0version\";s:5:\"2.0.4\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:51:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phar-io\\manifest\";}s:15:\"phar-io/version\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"phar-io/version\";s:10:\"\0*\0version\";s:5:\"3.2.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:50:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phar-io\\version\";}s:31:\"phpdocumentor/reflection-common\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:31:\"phpdocumentor/reflection-common\";s:10:\"\0*\0version\";s:5:\"2.2.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:66:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phpdocumentor\\reflection-common\";}s:33:\"phpdocumentor/reflection-docblock\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:33:\"phpdocumentor/reflection-docblock\";s:10:\"\0*\0version\";s:5:\"6.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:68:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phpdocumentor\\reflection-docblock\";}s:27:\"phpdocumentor/type-resolver\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:27:\"phpdocumentor/type-resolver\";s:10:\"\0*\0version\";s:5:\"2.1.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phpdocumentor\\type-resolver\";}s:21:\"phpstan/phpdoc-parser\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"phpstan/phpdoc-parser\";s:10:\"\0*\0version\";s:5:\"2.3.8\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:56:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phpstan\\phpdoc-parser\";}s:25:\"phpunit/php-code-coverage\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"phpunit/php-code-coverage\";s:10:\"\0*\0version\";s:7:\"11.0.12\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phpunit\\php-code-coverage\";}s:25:\"phpunit/php-file-iterator\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"phpunit/php-file-iterator\";s:10:\"\0*\0version\";s:5:\"5.1.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phpunit\\php-file-iterator\";}s:19:\"phpunit/php-invoker\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"phpunit/php-invoker\";s:10:\"\0*\0version\";s:5:\"5.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:54:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phpunit\\php-invoker\";}s:25:\"phpunit/php-text-template\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:25:\"phpunit/php-text-template\";s:10:\"\0*\0version\";s:5:\"4.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:60:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phpunit\\php-text-template\";}s:17:\"phpunit/php-timer\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"phpunit/php-timer\";s:10:\"\0*\0version\";s:5:\"7.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:52:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phpunit\\php-timer\";}s:15:\"phpunit/phpunit\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:15:\"phpunit/phpunit\";s:10:\"\0*\0version\";s:7:\"11.5.56\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:50:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\phpunit\\phpunit\";}s:20:\"sebastian/cli-parser\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"sebastian/cli-parser\";s:10:\"\0*\0version\";s:5:\"3.0.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:55:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\cli-parser\";}s:19:\"sebastian/code-unit\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"sebastian/code-unit\";s:10:\"\0*\0version\";s:5:\"3.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:54:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\code-unit\";}s:34:\"sebastian/code-unit-reverse-lookup\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:34:\"sebastian/code-unit-reverse-lookup\";s:10:\"\0*\0version\";s:5:\"4.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:69:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\code-unit-reverse-lookup\";}s:20:\"sebastian/comparator\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"sebastian/comparator\";s:10:\"\0*\0version\";s:5:\"6.3.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:55:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\comparator\";}s:20:\"sebastian/complexity\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:20:\"sebastian/complexity\";s:10:\"\0*\0version\";s:5:\"4.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:55:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\complexity\";}s:14:\"sebastian/diff\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"sebastian/diff\";s:10:\"\0*\0version\";s:5:\"6.0.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:49:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\diff\";}s:21:\"sebastian/environment\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:21:\"sebastian/environment\";s:10:\"\0*\0version\";s:5:\"7.2.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:56:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\environment\";}s:18:\"sebastian/exporter\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:18:\"sebastian/exporter\";s:10:\"\0*\0version\";s:5:\"6.3.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:53:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\exporter\";}s:22:\"sebastian/global-state\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:22:\"sebastian/global-state\";s:10:\"\0*\0version\";s:5:\"7.0.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:57:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\global-state\";}s:23:\"sebastian/lines-of-code\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:23:\"sebastian/lines-of-code\";s:10:\"\0*\0version\";s:5:\"3.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:58:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\lines-of-code\";}s:27:\"sebastian/object-enumerator\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:27:\"sebastian/object-enumerator\";s:10:\"\0*\0version\";s:5:\"6.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\object-enumerator\";}s:26:\"sebastian/object-reflector\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:26:\"sebastian/object-reflector\";s:10:\"\0*\0version\";s:5:\"4.0.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:61:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\object-reflector\";}s:27:\"sebastian/recursion-context\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:27:\"sebastian/recursion-context\";s:10:\"\0*\0version\";s:5:\"6.0.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:62:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\recursion-context\";}s:14:\"sebastian/type\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:14:\"sebastian/type\";s:10:\"\0*\0version\";s:5:\"5.1.3\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:49:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\type\";}s:17:\"sebastian/version\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"sebastian/version\";s:10:\"\0*\0version\";s:5:\"5.0.2\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:52:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\sebastian\\version\";}s:28:\"staabm/side-effects-detector\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:28:\"staabm/side-effects-detector\";s:10:\"\0*\0version\";s:5:\"1.0.5\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:63:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\staabm\\side-effects-detector\";}s:12:\"symfony/yaml\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"symfony/yaml\";s:10:\"\0*\0version\";s:6:\"7.4.21\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:47:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\symfony\\yaml\";}s:35:\"ta-tikoma/phpunit-architecture-test\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:35:\"ta-tikoma/phpunit-architecture-test\";s:10:\"\0*\0version\";s:5:\"0.8.7\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:70:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\ta-tikoma\\phpunit-architecture-test\";}s:17:\"theseer/tokenizer\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"theseer/tokenizer\";s:10:\"\0*\0version\";s:5:\"1.3.1\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:52:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\theseer\\tokenizer\";}s:16:\"webmozart/assert\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:16:\"webmozart/assert\";s:10:\"\0*\0version\";s:5:\"2.5.0\";s:9:\"\0*\0source\";r:8;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:0;s:13:\"\0*\0constraint\";s:0:\"\";s:7:\"\0*\0path\";s:51:\"D:\\xampp\\htdocs\\laravelproj\\vendor\\webmozart\\assert\";}}s:11:\"\0*\0packages\";O:32:\"Laravel\\Roster\\PackageCollection\":2:{s:8:\"\0*\0items\";a:131:{i:0;r:5;i:1;r:13;i:2;r:21;i:3;r:29;i:4;r:37;i:5;r:45;i:6;r:53;i:7;r:61;i:8;r:69;i:9;r:77;i:10;r:85;i:11;r:93;i:12;r:101;i:13;r:109;i:14;r:117;i:15;r:125;i:16;r:133;i:17;r:141;i:18;r:149;i:19;r:157;i:20;r:165;i:21;r:173;i:22;r:181;i:23;r:189;i:24;r:197;i:25;r:205;i:26;r:213;i:27;r:221;i:28;r:229;i:29;r:237;i:30;r:245;i:31;r:253;i:32;r:261;i:33;r:269;i:34;r:277;i:35;r:285;i:36;r:293;i:37;r:301;i:38;r:309;i:39;r:317;i:40;r:325;i:41;r:333;i:42;r:341;i:43;r:349;i:44;r:357;i:45;r:365;i:46;r:373;i:47;r:381;i:48;r:389;i:49;r:397;i:50;r:405;i:51;r:413;i:52;r:421;i:53;r:429;i:54;r:437;i:55;r:445;i:56;r:453;i:57;r:461;i:58;r:469;i:59;r:477;i:60;r:485;i:61;r:493;i:62;r:501;i:63;r:509;i:64;r:517;i:65;r:525;i:66;r:533;i:67;r:541;i:68;r:549;i:69;r:557;i:70;r:565;i:71;r:573;i:72;r:581;i:73;r:589;i:74;r:597;i:75;r:605;i:76;r:613;i:77;r:621;i:78;r:629;i:79;r:637;i:80;r:645;i:81;r:653;i:82;r:661;i:83;r:669;i:84;r:677;i:85;r:685;i:86;r:693;i:87;r:701;i:88;r:709;i:89;r:717;i:90;r:725;i:91;r:733;i:92;r:741;i:93;r:749;i:94;r:757;i:95;r:765;i:96;r:773;i:97;r:781;i:98;r:789;i:99;r:797;i:100;r:805;i:101;r:813;i:102;r:821;i:103;r:829;i:104;r:837;i:105;r:845;i:106;r:853;i:107;r:861;i:108;r:869;i:109;r:877;i:110;r:885;i:111;r:893;i:112;r:901;i:113;r:909;i:114;r:917;i:115;r:925;i:116;r:933;i:117;r:941;i:118;r:949;i:119;r:957;i:120;r:965;i:121;r:973;i:122;r:981;i:123;r:989;i:124;r:997;i:125;r:1005;i:126;r:1013;i:127;r:1021;i:128;r:1029;i:129;r:1037;i:130;r:1045;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}}s:2:\"js\";O:37:\"Laravel\\Roster\\Ecosystems\\JsEcosystem\":3:{s:9:\"\0*\0byName\";a:6:{s:17:\"@tailwindcss/vite\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:17:\"@tailwindcss/vite\";s:10:\"\0*\0version\";s:5:\"4.0.0\";s:9:\"\0*\0source\";E:38:\"Laravel\\Roster\\Enums\\PackageSource:Npm\";s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^4.0.0\";s:7:\"\0*\0path\";s:58:\"D:\\xampp\\htdocs\\laravelproj\\node_modules\\@tailwindcss\\vite\";}s:5:\"axios\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:5:\"axios\";s:10:\"\0*\0version\";s:6:\"1.11.0\";s:9:\"\0*\0source\";r:1192;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:7:\"^1.11.0\";s:7:\"\0*\0path\";s:46:\"D:\\xampp\\htdocs\\laravelproj\\node_modules\\axios\";}s:12:\"concurrently\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:12:\"concurrently\";s:10:\"\0*\0version\";s:5:\"9.0.1\";s:9:\"\0*\0source\";r:1192;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^9.0.1\";s:7:\"\0*\0path\";s:53:\"D:\\xampp\\htdocs\\laravelproj\\node_modules\\concurrently\";}s:19:\"laravel-vite-plugin\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:19:\"laravel-vite-plugin\";s:10:\"\0*\0version\";s:5:\"2.0.0\";s:9:\"\0*\0source\";r:1192;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^2.0.0\";s:7:\"\0*\0path\";s:60:\"D:\\xampp\\htdocs\\laravelproj\\node_modules\\laravel-vite-plugin\";}s:11:\"tailwindcss\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:11:\"tailwindcss\";s:10:\"\0*\0version\";s:5:\"4.0.0\";s:9:\"\0*\0source\";r:1192;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^4.0.0\";s:7:\"\0*\0path\";s:52:\"D:\\xampp\\htdocs\\laravelproj\\node_modules\\tailwindcss\";}s:4:\"vite\";O:22:\"Laravel\\Roster\\Package\":7:{s:7:\"\0*\0name\";s:4:\"vite\";s:10:\"\0*\0version\";s:5:\"7.0.7\";s:9:\"\0*\0source\";r:1192;s:6:\"\0*\0dev\";b:1;s:9:\"\0*\0direct\";b:1;s:13:\"\0*\0constraint\";s:6:\"^7.0.7\";s:7:\"\0*\0path\";s:45:\"D:\\xampp\\htdocs\\laravelproj\\node_modules\\vite\";}}s:11:\"\0*\0packages\";O:32:\"Laravel\\Roster\\PackageCollection\":2:{s:8:\"\0*\0items\";a:6:{i:0;r:1189;i:1;r:1197;i:2;r:1205;i:3;r:1213;i:4;r:1221;i:5;r:1229;}s:28:\"\0*\0escapeWhenCastingToString\";b:0;}s:17:\"\0*\0packageManager\";N;}s:6:\"stacks\";O:30:\"Laravel\\Roster\\Support\\EnumSet\":1:{s:8:\"\0*\0cases\";a:1:{i:0;E:32:\"Laravel\\Roster\\Enums\\Stack:Blade\";}}s:21:\"browserTestFrameworks\";O:30:\"Laravel\\Roster\\Support\\EnumSet\":1:{s:8:\"\0*\0cases\";a:0:{}}s:9:\"frontends\";O:30:\"Laravel\\Roster\\Support\\EnumSet\":1:{s:8:\"\0*\0cases\";a:0:{}}s:6:\"agents\";O:30:\"Laravel\\Roster\\Support\\EnumSet\":1:{s:8:\"\0*\0cases\";a:1:{i:0;E:32:\"Laravel\\Roster\\Enums\\Agent:Codex\";}}s:7:\"editors\";O:30:\"Laravel\\Roster\\Support\\EnumSet\":1:{s:8:\"\0*\0cases\";a:1:{i:0;E:34:\"Laravel\\Roster\\Enums\\Editor:VsCode\";}}}', 1795592775);

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
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `membership_number` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `membership_category_id` bigint(20) UNSIGNED NOT NULL,
  `membership_level_id` bigint(20) UNSIGNED NOT NULL,
  `starts_at` date DEFAULT NULL,
  `expires_at` date DEFAULT NULL,
  `status` enum('active','inactive','pending','deactivated') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `membership_number`, `first_name`, `last_name`, `email`, `phone`, `address`, `membership_category_id`, `membership_level_id`, `starts_at`, `expires_at`, `status`, `created_at`, `updated_at`, `notes`) VALUES
(1, 'MEM-202611-CZVRXC', 'John', 'Doe', 'johndoe@gmail.com', '123', '123', 1, 1, '2026-11-24', '2028-11-23', 'active', '2026-11-23 20:44:43', '2026-11-24 17:22:04', NULL),
(2, 'MEM-202611-XFIJ6G', 'Vhea', 'Tatad', 'tatadvhea@gmail.com', '123456689', '123 Where St.', 1, 4, NULL, NULL, 'pending', '2026-11-24 22:56:17', '2026-11-24 22:56:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `membership_applications`
--

CREATE TABLE `membership_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `membership_category_id` bigint(20) UNSIGNED NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `verification_sent_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviewed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `membership_applications`
--

INSERT INTO `membership_applications` (`id`, `membership_category_id`, `reference_no`, `full_name`, `email`, `phone`, `address`, `latitude`, `longitude`, `status`, `verification_sent_at`, `created_at`, `updated_at`, `user_id`, `reviewed_at`) VALUES
(1, 4, 'MEM-ICCPSRMPSF', 'John Doe', 'admin@gmail.com', '123456789', '123 Street', 14.5909486, 120.9826684, 'pending', '2026-11-24 21:10:34', '2026-11-24 21:10:34', '2026-11-24 21:10:34', NULL, NULL),
(2, 4, 'MEM-TE6K8CTBVO', 'Vhea Tatad', 'tatadvhea@gmail.com', '123456789', '123 Where St.', 14.5959946, 120.9839988, 'pending', '2026-11-24 21:29:07', '2026-11-24 21:29:07', '2026-11-24 21:29:07', NULL, NULL),
(3, 1, 'MEM-EP5AP1ZGYK', 'Vhea Tatad', 'tatadvhea@gmail.com', '123456789', '123 Where St.', 14.5966529, 120.9847069, 'pending', '2026-11-24 22:08:31', '2026-11-24 22:08:31', '2026-11-24 22:08:31', NULL, NULL),
(4, 1, 'MEM-NTYYZJVSH3', 'Vhea Tatad', 'tatadvhea@gmail.com', '123456789', '123 Where St.', 14.5994345, 120.9840471, 'pending', '2026-11-24 22:14:16', '2026-11-24 22:14:16', '2026-11-24 22:14:16', NULL, NULL),
(5, 1, 'MEM-U9Q4ZJCGNN', 'Vhea Tatad', 'tatadvhea@gmail.com', '123456789', '123 Where St.', 14.5911708, 120.9828186, 'pending', '2026-11-24 22:24:15', '2026-11-24 22:24:15', '2026-11-24 22:24:15', NULL, NULL),
(7, 1, 'MEM-ALKBQ9INBM', 'Vhea Tatad', 'tatadvhea@gmail.com', '123456689', '123 Where St.', 14.5886686, 120.9816170, 'approved', '2026-11-24 22:54:19', '2026-11-24 22:54:19', '2026-11-24 22:56:17', 2, '2026-11-24 22:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `membership_categories`
--

CREATE TABLE `membership_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `membership_categories`
--

INSERT INTO `membership_categories` (`id`, `name`, `slug`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Student', 'student', 'Student membership', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(2, 'Regular', 'regular', 'Regular membership', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(3, 'Senior Citizen', 'senior-citizen', 'Senior Citizen membership', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(4, 'Corporate', 'corporate', 'Corporate membership', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(5, 'Standard', 'standard', 'Standard membership', 1, '2026-11-24 11:43:56', '2026-11-24 11:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `membership_levels`
--

CREATE TABLE `membership_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `membership_category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `validity_days` int(10) UNSIGNED NOT NULL,
  `benefits` text DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `membership_levels`
--

INSERT INTO `membership_levels` (`id`, `membership_category_id`, `name`, `fee`, `validity_days`, `benefits`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Basic', 0.00, 365, 'Basic access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(2, 1, 'Silver', 600.00, 365, 'Silver access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(3, 1, 'Gold', 150.00, 365, 'Gold access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(4, 1, 'Platinum', 350.00, 365, 'Platinum access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(5, 2, 'Basic', 0.00, 365, 'Basic access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(6, 2, 'Silver', 600.00, 365, 'Silver access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(7, 2, 'Gold', 150.00, 365, 'Gold access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(8, 2, 'Platinum', 350.00, 365, 'Platinum access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(9, 3, 'Basic', 0.00, 365, 'Basic access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(10, 3, 'Silver', 600.00, 365, 'Silver access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(11, 3, 'Gold', 150.00, 365, 'Gold access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(12, 3, 'Platinum', 350.00, 365, 'Platinum access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(13, 4, 'Basic', 0.00, 365, 'Basic access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(14, 4, 'Silver', 600.00, 365, 'Silver access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(15, 4, 'Gold', 150.00, 365, 'Gold access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(16, 4, 'Platinum', 350.00, 365, 'Platinum access and benefits', 1, '2026-11-23 20:17:40', '2026-11-23 20:17:40'),
(17, 5, 'Basic', 0.00, 365, 'Basic access and benefits', 1, '2026-11-24 11:43:56', '2026-11-24 11:43:56'),
(18, 5, 'Silver', 600.00, 365, 'Silver access and benefits', 1, '2026-11-24 11:43:56', '2026-11-24 11:43:56'),
(19, 5, 'Gold', 150.00, 365, 'Gold access and benefits', 1, '2026-11-24 11:43:56', '2026-11-24 11:43:56'),
(20, 5, 'Platinum', 350.00, 365, 'Platinum access and benefits', 1, '2026-11-24 11:43:56', '2026-11-24 11:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `membership_transactions`
--

CREATE TABLE `membership_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `membership_transactions`
--

INSERT INTO `membership_transactions` (`id`, `member_id`, `transaction_code`, `type`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'TXN-20261125-RUX5APQB', 'renewal', 200.00, 'paid', '2026-11-24 17:21:09', '2026-11-24 22:56:56'),
(2, 2, 'TXN-20261125-MWQPR1LP', 'application', 350.00, 'paid', '2026-11-24 22:56:17', '2026-11-24 22:57:25');

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
(4, '2026_10_27_152907_create_tasks_table', 1),
(5, '2026_11_24_033657_create_membership_categories_table', 2),
(6, '2026_11_24_033657_create_membership_levels_table', 2),
(7, '2026_11_24_033658_create_members_table', 2),
(8, '2026_11_24_040944_create_membership_transactions_table', 3),
(9, '2026_11_24_040944_create_payments_table', 3),
(10, '2026_11_24_041948_add_notes_to_members_table', 4),
(11, '2026_11_25_023708_create_membership_applications_table', 5),
(12, '2026_11_25_030112_add_role_and_member_id_to_users_table', 6),
(13, '2026_11_25_063909_add_is_active_to_users_table', 7),
(14, '2026_11_25_063910_add_user_id_and_reviewed_at_to_membership_applications_table', 7);

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
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `membership_transaction_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `member_id`, `membership_transaction_id`, `amount`, `payment_method`, `reference_number`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 200.00, 'cash', 'PAY-20261125-HI0ZQBUM', 'paid', '2026-11-24 17:21:52', '2026-11-24 17:21:52'),
(2, 2, 2, 350.00, 'gcash', 'PAY-20261125-O3ZNGNDJ', 'paid', '2026-11-24 22:58:23', '2026-11-24 22:58:23');

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
('FlTNXNnve6GSqAfNZtpTbEWC5K7oHpejSGc6naad', NULL, '127.0.0.1', 'curl/8.22.0', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMGw0OUJESnczQ0R0TWVaSHhncWJxcGhWM1hoTFZKUzBabVZ4NzdtNSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1795590247),
('G7zqwWkHhI36Tx5IBtdo1kT7AhGU6P5YNwI9RDaT', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZmtUOGlsd2cxOVVWUXhYQVhpUXFWb1Z1TWZFS3J3M3ZCWHI3eVBrQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hY2NvdW50cyI7czo1OiJyb3V0ZSI7czoxNDoiYWNjb3VudHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiIwOTk4MzZjMWE0Yjg5OTgwN2RjMTg3MmZhYmYxYjUwOWM5YWFmYWFhNWE4N2M0N2JmNWZmMjE5ZjEzZGQxNjFkIjt9', 1795590486),
('v7xc7CwVKj7bDBDiuseFlXLE6NwVcpYcmhL5wiOO', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.147.0 Chrome/150.0.7871.250 Electron/43.8.9 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNTRDRk5JNUNiTjFoR2JDQWNrUWJzSDYyY3F3Q2ZvczZxckNneVVDbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hY2NvdW50IjtzOjU6InJvdXRlIjtzOjEyOiJhY2NvdW50LnNob3ciO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjY0OiJhZmQzZTQzNDgyZTljMTkyMDBiODM2NGNlMWIzY2UyNDE0NWQ4OTk3YzE2YzVjN2YwYWQ2NzIxZDQ2YzczZmVmIjt9', 1795590238),
('Y2GDGtafO0GSpdCfuP4k7VLLylzqrPKN8DsooL2g', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.147.0 Chrome/150.0.7871.250 Electron/43.8.9 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibDZpYTljVVdaMUdlSWFlSWtVdTlRY3RuZTZhSG1xa3NPWld5SzV0ZSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC90cmFuc2FjdGlvbnMiO3M6NToicm91dGUiO3M6MTg6InRyYW5zYWN0aW9ucy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6ImFmZDNlNDM0ODJlOWMxOTIwMGI4MzY0Y2UxYjNjZTI0MTQ1ZDg5OTdjMTZjNWM3ZjBhZDY3MjFkNDZjNzNmZWYiO30=', 1795590458);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `task_title`, `description`, `completed`, `created_at`, `updated_at`) VALUES
(1, 'Task 1', 'This is Task 1', 0, '2026-11-23 19:48:40', '2026-11-23 19:48:40');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'member',
  `member_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`, `member_id`, `is_active`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$n4V8lEadIcMMy4SVu3ezIO0aL.PFU.yC85e/BPcHGyhz0hchwI1eu', NULL, '2026-11-24 21:22:54', '2026-11-24 21:22:54', 'admin', NULL, 1),
(2, 'Vhea Tatad', 'tatadvhea@gmail.com', NULL, '$2y$12$Qsff8.Udj8i8ae7MF8198OHiwCJwnbudqtoJ/g4z3hnbm6Lp64cEa', NULL, '2026-11-24 22:54:19', '2026-11-24 22:56:17', 'member', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

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
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `members_membership_category_id_foreign` (`membership_category_id`),
  ADD KEY `members_membership_level_id_foreign` (`membership_level_id`);

--
-- Indexes for table `membership_applications`
--
ALTER TABLE `membership_applications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `membership_applications_reference_no_unique` (`reference_no`),
  ADD UNIQUE KEY `membership_applications_user_id_unique` (`user_id`),
  ADD KEY `membership_applications_membership_category_id_foreign` (`membership_category_id`);

--
-- Indexes for table `membership_categories`
--
ALTER TABLE `membership_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `membership_categories_slug_unique` (`slug`);

--
-- Indexes for table `membership_levels`
--
ALTER TABLE `membership_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `membership_levels_membership_category_id_foreign` (`membership_category_id`);

--
-- Indexes for table `membership_transactions`
--
ALTER TABLE `membership_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `membership_transactions_transaction_code_unique` (`transaction_code`),
  ADD KEY `membership_transactions_member_id_foreign` (`member_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `payments_member_id_foreign` (`member_id`),
  ADD KEY `payments_membership_transaction_id_foreign` (`membership_transaction_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_member_id_unique` (`member_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `membership_applications`
--
ALTER TABLE `membership_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `membership_categories`
--
ALTER TABLE `membership_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `membership_levels`
--
ALTER TABLE `membership_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `membership_transactions`
--
ALTER TABLE `membership_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_membership_category_id_foreign` FOREIGN KEY (`membership_category_id`) REFERENCES `membership_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `members_membership_level_id_foreign` FOREIGN KEY (`membership_level_id`) REFERENCES `membership_levels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `membership_applications`
--
ALTER TABLE `membership_applications`
  ADD CONSTRAINT `membership_applications_membership_category_id_foreign` FOREIGN KEY (`membership_category_id`) REFERENCES `membership_categories` (`id`),
  ADD CONSTRAINT `membership_applications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `membership_levels`
--
ALTER TABLE `membership_levels`
  ADD CONSTRAINT `membership_levels_membership_category_id_foreign` FOREIGN KEY (`membership_category_id`) REFERENCES `membership_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `membership_transactions`
--
ALTER TABLE `membership_transactions`
  ADD CONSTRAINT `membership_transactions_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_membership_transaction_id_foreign` FOREIGN KEY (`membership_transaction_id`) REFERENCES `membership_transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
