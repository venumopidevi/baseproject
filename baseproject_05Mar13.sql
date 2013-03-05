-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 05, 2013 at 07:51 PM
-- Server version: 5.5.29
-- PHP Version: 5.3.10-1ubuntu3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `baseproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `AuthAssignment`
--

CREATE TABLE IF NOT EXISTS `AuthAssignment` (
  `itemname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `userid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AuthAssignment`
--

INSERT INTO `AuthAssignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('Admin', '1', NULL, 'N;'),
('Member', '16', '', 'N;'),
('op_common_modules_users_controllers_index_edit', '16', '', 'N;'),
('op_common_modules_users_controllers_index_logout', '16', '', 'N;'),
('op_common_modules_users_controllers_index_viewuser', '16', '', 'N;'),
('task_frontend_modules_forum_controllers_forum', '16', '', 'N;'),
('task_frontend_modules_forum_controllers_post', '16', '', 'N;'),
('task_frontend_modules_forum_controllers_thread', '16', '', 'N;'),
('task_frontend_modules_forum_controllers_user', '16', '', 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `AuthItem`
--

CREATE TABLE IF NOT EXISTS `AuthItem` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AuthItem`
--

INSERT INTO `AuthItem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('Admin', 2, 'Site Admin', '', 'N;'),
('Author', 2, 'Author', '', 'N;'),
('Editor', 2, 'Editor', '', 'N;'),
('Guest', 2, 'Site Guest', '', 'N;'),
('Member', 2, 'Site Member', '', 'N;'),
('op_application_modules_language_controllers_index_index', 0, 'op_application_modules_language_controllers_index_index', '', 'N;'),
('op_backend_controllers_site_contact', 0, 'op_backend_controllers_site_contact', '', 'N;'),
('op_backend_controllers_site_error', 0, 'op_backend_controllers_site_error', '', 'N;'),
('op_backend_controllers_site_index', 0, 'op_backend_controllers_site_index', '', 'N;'),
('op_backend_controllers_site_login', 0, 'op_backend_controllers_site_login', '', 'N;'),
('op_backend_controllers_site_logout', 0, 'op_backend_controllers_site_logout', '', 'N;'),
('op_common_modules_users_controllers_index_adduser', 0, 'op_common_modules_users_controllers_index_adduser', '', 'N;'),
('op_common_modules_users_controllers_index_delete', 0, 'op_common_modules_users_controllers_index_delete', '', 'N;'),
('op_common_modules_users_controllers_index_edit', 0, 'op_common_modules_users_controllers_index_edit', '', 'N;'),
('op_common_modules_users_controllers_index_index', 0, 'op_common_modules_users_controllers_index_index', '', 'N;'),
('op_common_modules_users_controllers_index_logout', 0, 'op_common_modules_users_controllers_index_logout', '', 'N;'),
('op_common_modules_users_controllers_index_viewuser', 0, 'op_common_modules_users_controllers_index_viewuser', '', 'N;'),
('op_common_modules_users_controllers_login_captcha', 0, 'Captcha', '', 'N;'),
('op_common_modules_users_controllers_login_facebooklogin', 0, 'op_common_modules_users_controllers_login_facebooklogin', '', 'N;'),
('op_common_modules_users_controllers_login_index', 0, 'op_common_modules_users_controllers_login_index', '', 'N;'),
('op_common_modules_users_controllers_login_lostpassword', 0, 'op_common_modules_users_controllers_login_lostpassword', '', 'N;'),
('op_common_modules_users_controllers_login_reset', 0, 'op_common_modules_users_controllers_login_reset', '', 'N;'),
('op_common_modules_users_controllers_register_captcha', 0, 'Register Captcha', '', 'N;'),
('op_common_modules_users_controllers_register_index', 0, 'op_common_modules_users_controllers_register_index', '', 'N;'),
('op_common_modules_users_controllers_roles_addauthitem', 0, 'op_common_modules_users_controllers_roles_addauthitem', '', 'N;'),
('op_common_modules_users_controllers_roles_batch', 0, 'op_common_modules_users_controllers_roles_batch', '', 'N;'),
('op_common_modules_users_controllers_roles_editauthitem', 0, 'op_common_modules_users_controllers_roles_editauthitem', '', 'N;'),
('op_common_modules_users_controllers_roles_index', 0, 'op_common_modules_users_controllers_roles_index', '', 'N;'),
('op_common_modules_users_controllers_roles_viewauthitem', 0, 'op_common_modules_users_controllers_roles_viewauthitem', '', 'N;'),
('op_frontend_controllers_site_aboutus', 0, 'op_frontend_controllers_site_aboutus', '', 'N;'),
('op_frontend_controllers_site_contact', 0, 'op_frontend_controllers_site_contact', '', 'N;'),
('op_frontend_controllers_site_error', 0, 'op_frontend_controllers_site_error', '', 'N;'),
('op_frontend_controllers_site_index', 0, 'op_frontend_controllers_site_index', '', 'N;'),
('op_frontend_controllers_site_login', 0, 'op_frontend_controllers_site_login', '', 'N;'),
('op_frontend_controllers_site_logout', 0, 'op_frontend_controllers_site_logout', '', 'N;'),
('op_frontend_modules_forum_controllers_forum_create', 0, 'op_frontend_modules_forum_controllers_forum_create', '', 'N;'),
('op_frontend_modules_forum_controllers_forum_delete', 0, 'op_frontend_modules_forum_controllers_forum_delete', '', 'N;'),
('op_frontend_modules_forum_controllers_forum_index', 0, 'op_frontend_modules_forum_controllers_forum_index', '', 'N;'),
('op_frontend_modules_forum_controllers_forum_update', 0, 'op_frontend_modules_forum_controllers_forum_update', '', 'N;'),
('op_frontend_modules_forum_controllers_forum_view', 0, 'op_frontend_modules_forum_controllers_forum_view', '', 'N;'),
('op_frontend_modules_forum_controllers_post_delete', 0, 'op_frontend_modules_forum_controllers_post_delete', '', 'N;'),
('op_frontend_modules_forum_controllers_post_update', 0, 'op_frontend_modules_forum_controllers_post_update', '', 'N;'),
('op_frontend_modules_forum_controllers_thread_create', 0, 'op_frontend_modules_forum_controllers_thread_create', '', 'N;'),
('op_frontend_modules_forum_controllers_thread_delete', 0, 'op_frontend_modules_forum_controllers_thread_delete', '', 'N;'),
('op_frontend_modules_forum_controllers_thread_newreply', 0, 'op_frontend_modules_forum_controllers_thread_newreply', '', 'N;'),
('op_frontend_modules_forum_controllers_thread_update', 0, 'op_frontend_modules_forum_controllers_thread_update', '', 'N;'),
('op_frontend_modules_forum_controllers_thread_view', 0, 'op_frontend_modules_forum_controllers_thread_view', '', 'N;'),
('op_frontend_modules_forum_controllers_user_view', 0, 'op_frontend_modules_forum_controllers_user_view', '', 'N;'),
('Superadmin', 2, 'Super Admin', '', 'N;'),
('task_application_modules_language_controllers_index', 1, 'task_application_modules_language_controllers_index', '', 'N;'),
('task_backend_controllers_site', 1, 'task_backend_controllers_site', '', 'N;'),
('task_common_modules_users_controllers_index', 1, 'task_common_modules_users_controllers_index', '', 'N;'),
('task_common_modules_users_controllers_login', 1, 'task_common_modules_users_controllers_login', '', 'N;'),
('task_common_modules_users_controllers_register', 1, 'task_common_modules_users_controllers_register', '', 'N;'),
('task_common_modules_users_controllers_roles', 1, 'task_common_modules_users_controllers_roles', '', 'N;'),
('task_frontend_controllers_site', 1, 'task_frontend_controllers_site', '', 'N;'),
('task_frontend_modules_forum_controllers_forum', 1, 'task_frontend_modules_forum_controllers_forum', '', 'N;'),
('task_frontend_modules_forum_controllers_post', 1, 'task_frontend_modules_forum_controllers_post', '', 'N;'),
('task_frontend_modules_forum_controllers_thread', 1, 'task_frontend_modules_forum_controllers_thread', '', 'N;'),
('task_frontend_modules_forum_controllers_user', 1, 'task_frontend_modules_forum_controllers_user', '', 'N;'),
('task_roles', 1, 'Task Manage User Roles', '', 'N;');

-- --------------------------------------------------------

--
-- Table structure for table `AuthItemChild`
--

CREATE TABLE IF NOT EXISTS `AuthItemChild` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AuthItemChild`
--

INSERT INTO `AuthItemChild` (`parent`, `child`) VALUES
('task_application_modules_language_controllers_index', 'op_application_modules_language_controllers_index_index'),
('task_backend_controllers_site', 'op_backend_controllers_site_contact'),
('task_backend_controllers_site', 'op_backend_controllers_site_error'),
('task_backend_controllers_site', 'op_backend_controllers_site_index'),
('task_backend_controllers_site', 'op_backend_controllers_site_login'),
('task_backend_controllers_site', 'op_backend_controllers_site_logout'),
('task_common_modules_users_controllers_index', 'op_common_modules_users_controllers_index_adduser'),
('task_common_modules_users_controllers_index', 'op_common_modules_users_controllers_index_delete'),
('Member', 'op_common_modules_users_controllers_index_edit'),
('task_common_modules_users_controllers_index', 'op_common_modules_users_controllers_index_edit'),
('task_common_modules_users_controllers_index', 'op_common_modules_users_controllers_index_index'),
('Member', 'op_common_modules_users_controllers_index_logout'),
('task_common_modules_users_controllers_index', 'op_common_modules_users_controllers_index_logout'),
('Member', 'op_common_modules_users_controllers_index_viewuser'),
('task_common_modules_users_controllers_index', 'op_common_modules_users_controllers_index_viewuser'),
('Guest', 'op_common_modules_users_controllers_login_captcha'),
('Guest', 'op_common_modules_users_controllers_login_facebooklogin'),
('task_common_modules_users_controllers_login', 'op_common_modules_users_controllers_login_facebooklogin'),
('Guest', 'op_common_modules_users_controllers_login_index'),
('task_common_modules_users_controllers_login', 'op_common_modules_users_controllers_login_index'),
('Guest', 'op_common_modules_users_controllers_login_lostpassword'),
('task_common_modules_users_controllers_login', 'op_common_modules_users_controllers_login_lostpassword'),
('Guest', 'op_common_modules_users_controllers_login_reset'),
('task_common_modules_users_controllers_login', 'op_common_modules_users_controllers_login_reset'),
('Guest', 'op_common_modules_users_controllers_register_captcha'),
('Guest', 'op_common_modules_users_controllers_register_index'),
('task_common_modules_users_controllers_register', 'op_common_modules_users_controllers_register_index'),
('task_common_modules_users_controllers_roles', 'op_common_modules_users_controllers_roles_addauthitem'),
('task_common_modules_users_controllers_roles', 'op_common_modules_users_controllers_roles_batch'),
('task_common_modules_users_controllers_roles', 'op_common_modules_users_controllers_roles_editauthitem'),
('task_common_modules_users_controllers_roles', 'op_common_modules_users_controllers_roles_index'),
('task_common_modules_users_controllers_roles', 'op_common_modules_users_controllers_roles_viewauthitem'),
('Guest', 'op_frontend_controllers_site_aboutus'),
('task_frontend_controllers_site', 'op_frontend_controllers_site_aboutus'),
('Guest', 'op_frontend_controllers_site_contact'),
('task_frontend_controllers_site', 'op_frontend_controllers_site_contact'),
('Guest', 'op_frontend_controllers_site_error'),
('task_frontend_controllers_site', 'op_frontend_controllers_site_error'),
('Guest', 'op_frontend_controllers_site_index'),
('task_frontend_controllers_site', 'op_frontend_controllers_site_index'),
('task_frontend_controllers_site', 'op_frontend_controllers_site_login'),
('task_frontend_controllers_site', 'op_frontend_controllers_site_logout'),
('task_frontend_modules_forum_controllers_forum', 'op_frontend_modules_forum_controllers_forum_create'),
('task_frontend_modules_forum_controllers_forum', 'op_frontend_modules_forum_controllers_forum_delete'),
('task_frontend_modules_forum_controllers_forum', 'op_frontend_modules_forum_controllers_forum_index'),
('task_frontend_modules_forum_controllers_forum', 'op_frontend_modules_forum_controllers_forum_update'),
('task_frontend_modules_forum_controllers_forum', 'op_frontend_modules_forum_controllers_forum_view'),
('task_frontend_modules_forum_controllers_post', 'op_frontend_modules_forum_controllers_post_delete'),
('task_frontend_modules_forum_controllers_post', 'op_frontend_modules_forum_controllers_post_update'),
('task_frontend_modules_forum_controllers_thread', 'op_frontend_modules_forum_controllers_thread_create'),
('task_frontend_modules_forum_controllers_thread', 'op_frontend_modules_forum_controllers_thread_delete'),
('task_frontend_modules_forum_controllers_thread', 'op_frontend_modules_forum_controllers_thread_newreply'),
('task_frontend_modules_forum_controllers_thread', 'op_frontend_modules_forum_controllers_thread_update'),
('task_frontend_modules_forum_controllers_thread', 'op_frontend_modules_forum_controllers_thread_view'),
('task_frontend_modules_forum_controllers_user', 'op_frontend_modules_forum_controllers_user_view'),
('Admin', 'task_application_modules_language_controllers_index'),
('Admin', 'task_backend_controllers_site'),
('Admin', 'task_common_modules_users_controllers_index'),
('Admin', 'task_common_modules_users_controllers_login'),
('Admin', 'task_common_modules_users_controllers_register'),
('Admin', 'task_common_modules_users_controllers_roles'),
('Admin', 'task_frontend_controllers_site'),
('Admin', 'task_frontend_modules_forum_controllers_forum'),
('Member', 'task_frontend_modules_forum_controllers_forum'),
('Admin', 'task_frontend_modules_forum_controllers_post'),
('Member', 'task_frontend_modules_forum_controllers_post'),
('Admin', 'task_frontend_modules_forum_controllers_thread'),
('Member', 'task_frontend_modules_forum_controllers_thread'),
('Admin', 'task_frontend_modules_forum_controllers_user'),
('Member', 'task_frontend_modules_forum_controllers_user'),
('Admin', 'task_roles');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE IF NOT EXISTS `cache` (
  `id` char(128) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `value` longblob,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`id`, `expire`, `value`) VALUES
('61ab893617cfba5837f5c98ec2c87223', 1446183009, 0x613a323a7b693a303b4f3a31373a22434d7973716c5461626c65536368656d61223a393a7b733a31303a22736368656d614e616d65223b4e3b733a343a226e616d65223b733a343a2275736572223b733a373a227261774e616d65223b733a363a22607573657260223b733a31303a227072696d6172794b6579223b733a323a226964223b733a31323a2273657175656e63654e616d65223b733a303a22223b733a31313a22666f726569676e4b657973223b613a303a7b7d733a373a22636f6c756d6e73223b613a31353a7b733a323a226964223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a323a226964223b733a373a227261774e616d65223b733a343a2260696460223b733a393a22616c6c6f774e756c6c223b623a303b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a313b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a313b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a383a22757365726e616d65223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a383a22757365726e616d65223b733a373a227261774e616d65223b733a31303a2260757365726e616d6560223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31313a227661726368617228343529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a34353b733a393a22707265636973696f6e223b693a34353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a383a2270617373776f7264223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a383a2270617373776f7264223b733a373a227261774e616d65223b733a31303a226070617373776f726460223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31323a22766172636861722832353529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a3235353b733a393a22707265636973696f6e223b693a3235353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a343a2273616c74223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a343a2273616c74223b733a373a227261774e616d65223b733a363a226073616c7460223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31323a22766172636861722832353529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a3235353b733a393a22707265636973696f6e223b693a3235353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31373a2270617373776f72645f7374726174656779223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31373a2270617373776f72645f7374726174656779223b733a373a227261774e616d65223b733a31393a226070617373776f72645f737472617465677960223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31313a227661726368617228353029223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a35303b733a393a22707265636973696f6e223b693a35303b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a32313a2272657175697265735f6e65775f70617373776f7264223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a32313a2272657175697265735f6e65775f70617373776f7264223b733a373a227261774e616d65223b733a32333a226072657175697265735f6e65775f70617373776f726460223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31303a2274696e79696e74283129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a313b733a393a22707265636973696f6e223b693a313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a353a22656d61696c223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a353a22656d61696c223b733a373a227261774e616d65223b733a373a2260656d61696c60223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31323a22766172636861722832353529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a3235353b733a393a22707265636973696f6e223b693a3235353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31343a226c6f67696e5f617474656d707473223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31343a226c6f67696e5f617474656d707473223b733a373a227261774e616d65223b733a31363a22606c6f67696e5f617474656d70747360223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31303a226c6f67696e5f74696d65223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31303a226c6f67696e5f74696d65223b733a373a227261774e616d65223b733a31323a22606c6f67696e5f74696d6560223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a383a226c6f67696e5f6970223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a383a226c6f67696e5f6970223b733a373a227261774e616d65223b733a31303a22606c6f67696e5f697060223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31313a227661726368617228333229223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a33323b733a393a22707265636973696f6e223b693a33323b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31343a2276616c69646174696f6e5f6b6579223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31343a2276616c69646174696f6e5f6b6579223b733a373a227261774e616d65223b733a31363a226076616c69646174696f6e5f6b657960223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a31323a22766172636861722832353529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a3235353b733a393a22707265636973696f6e223b693a3235353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a393a226372656174655f6964223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a393a226372656174655f6964223b733a373a227261774e616d65223b733a31313a22606372656174655f696460223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31313a226372656174655f74696d65223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31313a226372656174655f74696d65223b733a373a227261774e616d65223b733a31333a22606372656174655f74696d6560223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a393a227570646174655f6964223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a393a227570646174655f6964223b733a373a227261774e616d65223b733a31313a22607570646174655f696460223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31313a227570646174655f74696d65223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31313a227570646174655f74696d65223b733a373a227261774e616d65223b733a31333a22607570646174655f74696d6560223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d7d733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d693a313b4e3b7d),
('f7525e945b4b53083b7c9bd8811cc16f', 1446197882, 0x613a323a7b693a303b4f3a31373a22434d7973716c5461626c65536368656d61223a393a7b733a31303a22736368656d614e616d65223b4e3b733a343a226e616d65223b733a31333a2274626c5f6d6967726174696f6e223b733a373a227261774e616d65223b733a31353a226074626c5f6d6967726174696f6e60223b733a31303a227072696d6172794b6579223b733a373a2276657273696f6e223b733a31323a2273657175656e63654e616d65223b4e3b733a31313a22666f726569676e4b657973223b613a303a7b7d733a373a22636f6c756d6e73223b613a323a7b733a373a2276657273696f6e223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a373a2276657273696f6e223b733a373a227261774e616d65223b733a393a226076657273696f6e60223b733a393a22616c6c6f774e756c6c223b623a303b733a363a22646254797065223b733a31323a22766172636861722832353529223b733a343a2274797065223b733a363a22737472696e67223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a3235353b733a393a22707265636973696f6e223b693a3235353b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a313b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d733a31303a226170706c795f74696d65223b4f3a31383a22434d7973716c436f6c756d6e536368656d61223a31343a7b733a343a226e616d65223b733a31303a226170706c795f74696d65223b733a373a227261774e616d65223b733a31323a22606170706c795f74696d6560223b733a393a22616c6c6f774e756c6c223b623a313b733a363a22646254797065223b733a373a22696e7428313129223b733a343a2274797065223b733a373a22696e7465676572223b733a31323a2264656661756c7456616c7565223b4e3b733a343a2273697a65223b693a31313b733a393a22707265636973696f6e223b693a31313b733a353a227363616c65223b4e3b733a31323a2269735072696d6172794b6579223b623a303b733a31323a226973466f726569676e4b6579223b623a303b733a31333a226175746f496e6372656d656e74223b623a303b733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d7d733a31343a220043436f6d706f6e656e74005f65223b4e3b733a31343a220043436f6d706f6e656e74005f6d223b4e3b7d693a313b4e3b7d);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `owner_name` varchar(50) NOT NULL,
  `owner_id` int(12) NOT NULL,
  `comment_id` int(12) NOT NULL AUTO_INCREMENT,
  `parent_comment_id` int(12) DEFAULT NULL,
  `creator_id` int(12) DEFAULT NULL,
  `user_name` varchar(128) DEFAULT NULL,
  `user_email` varchar(128) DEFAULT NULL,
  `comment_text` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `owner_name` (`owner_name`,`owner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`owner_name`, `owner_id`, `comment_id`, `parent_comment_id`, `creator_id`, `user_name`, `user_email`, `comment_text`, `create_time`, `update_time`, `status`) VALUES
('comment', 1, 1, 1, 1, 'admin', 'admin@gmail.com', 'comment text', 1, 1, 1),
('Comment', 110, 2, 0, NULL, 'admin', 'admin@gmail.com', 'admin comment text', 1361020478, NULL, 0),
('Comment', 110, 3, 0, NULL, 'admin', 'admin@gmail.com', 'admin comment text', 1361020482, NULL, 0),
('Comment', 110, 4, 0, NULL, 'admin', 'admin@gmail.com', 'admin comment text', 1361020483, NULL, 0),
('Comment', 110, 5, 0, NULL, 'admin', 'admin@gmail.com', 'admin comment text', 1361020483, NULL, 0),
('Comment', 110, 6, 0, NULL, 'admin', 'admin@gmail.com', 'admin comment text', 1361020483, NULL, 0),
('Comment', 110, 7, 0, NULL, 'admin', 'admin@gmail.com', 'admin comment text', 1361020483, NULL, 0),
('Comment', 110, 8, 0, NULL, 'admin', 'admin@gmail.com', 'admin comment text', 1361020484, NULL, 0),
('Comment', 110, 9, 0, NULL, 'admin', 'admin@gmail.com', 'admin comment text', 1361020489, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_page`
--

CREATE TABLE IF NOT EXISTS `dashboard_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `weight` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_portlet`
--

CREATE TABLE IF NOT EXISTS `dashboard_portlet` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dashboard` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned DEFAULT NULL,
  `settings` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE IF NOT EXISTS `faq` (
  `faq_id` int(8) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) DEFAULT NULL,
  `answer` text,
  `order_no` smallint(4) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT NULL,
  PRIMARY KEY (`faq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE IF NOT EXISTS `forum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(120) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL,
  `is_locked` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_forum_forum` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `forum`
--

INSERT INTO `forum` (`id`, `parent_id`, `title`, `description`, `listorder`, `is_locked`) VALUES
(1, NULL, 'Announcements', 'Announcements', 0, 1),
(2, 1, 'New releases', 'Announcements about new releases', 10, 0),
(3, NULL, 'Support', '', 20, 0),
(4, 3, 'Installation and configuration', 'ProblemsProblems with installation and/or configuration, incompatibility issues, etc.', 10, 0),
(5, 3, 'Bugs', 'Things not working at all, or not as they should', 20, 0),
(6, 3, 'Missing features', 'Fetures you think should be included in a future release', 30, 0),
(7, 6, 'missing', 'custom', 2, 0),
(8, NULL, 'venu', 'venu', 11, 0),
(9, NULL, 'missing', 'test', 11, 1),
(10, NULL, 'new forum test', 'new forum test', 13, 0);

-- --------------------------------------------------------

--
-- Table structure for table `forumuser`
--

CREATE TABLE IF NOT EXISTS `forumuser` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `signature` text,
  `firstseen` int(10) unsigned NOT NULL,
  `lastseen` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `siteid` (`siteid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `forumuser`
--

INSERT INTO `forumuser` (`id`, `siteid`, `name`, `signature`, `firstseen`, `lastseen`) VALUES
(1, 'admin', 'admin', NULL, 0, 0),
(2, 'demo', 'demo', NULL, 0, 0),
(3, '1', 'angel', NULL, 1360937566, 1362396557),
(4, '14', 'peter', NULL, 1361274846, 1361274846),
(5, '15', 'jhony', NULL, 1361276879, 1361277309);

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `language_code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `language_image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `language_primary` enum('Yes','No') CHARACTER SET utf8 DEFAULT NULL,
  `language_status` enum('Active','Inactive') CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=20 ;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_id`, `language_title`, `language_code`, `language_image`, `language_primary`, `language_status`) VALUES
(6, 'English', 'en', 'lang_en.jpg', 'Yes', 'Active'),
(10, 'Gujarati', 'gu', 'lang_gu.jpg', 'No', 'Active'),
(11, 'Russian', 'ru', 'lang_ru.jpg', 'No', 'Active'),
(12, 'Hindi', 'hi', 'lang_hi.jpg', 'No', 'Active'),
(14, 'Urdu', 'ur', 'lang_ur.jpg', 'No', 'Active'),
(15, 'English', 'en', 'lang_en.png', 'Yes', 'Active'),
(16, 'हिन्दी', 'hi', 'lang_hi.gif', 'No', 'Active'),
(18, 'русский', 'ru', 'lang_ru.png', 'No', 'Active'),
(19, 'Korean', 'kr', 'lang_kr.jpg', 'No', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `Message`
--

CREATE TABLE IF NOT EXISTS `Message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(16) NOT NULL DEFAULT '',
  `translation` text,
  PRIMARY KEY (`id`,`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `Message`
--

INSERT INTO `Message` (`id`, `language`, `translation`) VALUES
(1, 'hi', 'छिपे हुए दिमाग'),
(1, 'kr', 'Hidden Brains'),
(1, 'ru', 'Скрытые Мозги'),
(2, 'hi', 'प्रशासन'),
(2, 'kr', 'Admin'),
(2, 'ru', 'Админ'),
(3, 'hi', 'घर'),
(3, 'kr', 'Home'),
(3, 'ru', 'дома'),
(4, 'hi', 'के बारे में'),
(4, 'kr', 'About'),
(4, 'ru', 'о'),
(5, 'hi', 'संपर्क'),
(5, 'kr', 'Contact'),
(5, 'ru', 'связаться'),
(6, 'hi', 'लॉगिन'),
(6, 'kr', 'Login'),
(6, 'ru', 'Войти'),
(7, 'hi', 'यह सूचकांक पृष्ठ है ...'),
(7, 'kr', 'This is index Page...'),
(7, 'ru', 'Это индекс почте ...'),
(8, 'hi', 'यह हमारे बारे में पृष्ठ ...'),
(8, 'kr', 'This is About Us Page...'),
(8, 'ru', 'Это страница О нас ...');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(10) unsigned NOT NULL,
  `thread_id` int(10) unsigned NOT NULL,
  `editor_id` int(10) unsigned DEFAULT NULL,
  `content` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_author` (`author_id`),
  KEY `FK_post_editor` (`editor_id`),
  KEY `FK_post_thread` (`thread_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Session`
--

CREATE TABLE IF NOT EXISTS `Session` (
  `id` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Session`
--

INSERT INTO `Session` (`id`, `expire`, `data`) VALUES
('0858ger1nrppbhvlg11euhlb26', 1362406502, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a343a226e757461223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a343a22736f7173223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a313b),
('0n1qn7r438000oagnq3to18667', 1362394133, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a333a226f696c223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('242l02ife8sh4p1pviea01g2e2', 1361975598, ''),
('2nihm81pls9ldpgi45p01k7rn4', 1362202829, 0x5969692e4343617074636861416374696f6e2e32646164353530322e75736572732f6c6f67696e2e636170746368617c733a333a22766363223b5969692e4343617074636861416374696f6e2e32646164353530322e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b5969692e4343617074636861416374696f6e2e32646164353530322e736974652e636170746368617c733a373a22686f6d756b6274223b5969692e4343617074636861416374696f6e2e32646164353530322e736974652e63617074636861636f756e747c693a313b),
('2ov27383k8u2g31p9et6r11h52', 1362053930, 0x5969692e4343617074636861416374696f6e2e39366564663137302e75736572732f6c6f67696e2e636170746368617c733a343a22796a6961223b5969692e4343617074636861416374696f6e2e39366564663137302e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('4tdkrm2bnvk0hb0059o6rvkfr5', 1362393320, 0x7573657273657373696f6e5f5f5f72657475726e55726c7c733a33323a222f6261736570726f6a6563742f666f72756d2f666f72756d2f6372656174652f223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a343a22636f7a61223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('561at8h399ml3bvi1ar889eua6', 1362407359, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a333a22697762223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('5ukt2h7kl486m4s3920lg7jr03', 1362487632, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a343a2275756765223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a333b),
('5veosu840sffl52d4u0b5dcq16', 1362490458, ''),
('6giptktc2c8j9trvepjhepva20', 1362486370, ''),
('6rfgvamj0ifbiqb68lhq1nb0l5', 1362208362, ''),
('83cfnkkenk8267lqd4k7445uj4', 1362492099, ''),
('891sck226pk2d079vj8d3lgcs3', 1362490442, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a333a22766f6a223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a323b7573657273657373696f6e5f5f5f69647c733a323a223133223b7573657273657373696f6e5f5f5f6e616d657c733a31323a2273616d61737340612e636f6d223b7573657273657373696f6e5f6e616d657c733a363a2273616d617373223b7573657273657373696f6e5f757365726e616d657c733a363a2273616d617373223b7573657273657373696f6e5f73656f6e616d657c733a363a2273616d617373223b7573657273657373696f6e5f656d61696c7c733a31323a2273616d61737340612e636f6d223b7573657273657373696f6e5f726f6c657c733a363a224d656d626572223b7573657273657373696f6e5f697341646d696e7c623a303b7573657273657373696f6e5f5f5f7374617465737c613a363a7b733a343a226e616d65223b623a313b733a383a22757365726e616d65223b623a313b733a373a2273656f6e616d65223b623a313b733a353a22656d61696c223b623a313b733a343a22726f6c65223b623a313b733a373a22697341646d696e223b623a313b7d),
('96tgp3fsl9p6huf28u7bb4b427', 1362492204, ''),
('9o2f5irobft4uknlkprtfl7se0', 1361966817, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a343a2276617761223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a333b5969692e4343617074636861416374696f6e2e39366564663137302e75736572732f6c6f67696e2e636170746368617c733a343a2263666e65223b5969692e4343617074636861416374696f6e2e39366564663137302e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('cdmdj6l03o3f1g63v0ogh0r834', 1362406651, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a363a22676974647861223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a313b),
('cs98bt27khkbgedf47dnvpgd26', 1362491394, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a333a2278616c223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a323b7573657273657373696f6e5f5f5f69647c733a323a223135223b7573657273657373696f6e5f5f5f6e616d657c733a31303a226865406d616e2e636f6d223b7573657273657373696f6e5f6e616d657c733a353a2268656d616e223b7573657273657373696f6e5f757365726e616d657c733a353a2268656d616e223b7573657273657373696f6e5f73656f6e616d657c733a353a2268656d616e223b7573657273657373696f6e5f656d61696c7c733a31303a226865406d616e2e636f6d223b7573657273657373696f6e5f726f6c657c733a363a224d656d626572223b7573657273657373696f6e5f697341646d696e7c623a303b7573657273657373696f6e5f5f5f7374617465737c613a363a7b733a343a226e616d65223b623a313b733a383a22757365726e616d65223b623a313b733a373a2273656f6e616d65223b623a313b733a353a22656d61696c223b623a313b733a343a22726f6c65223b623a313b733a373a22697341646d696e223b623a313b7d),
('d9aum215h1hq2q88uajrgj58a2', 1362492403, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a343a227972756f223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a323b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a333a22766f6b223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a323b7573657273657373696f6e5f5f5f69647c733a323a223136223b7573657273657373696f6e5f5f5f6e616d657c733a31333a2276656e75406d61696c2e636f6d223b7573657273657373696f6e5f6e616d657c733a343a2276656e75223b7573657273657373696f6e5f757365726e616d657c733a343a2276656e75223b7573657273657373696f6e5f73656f6e616d657c733a343a2276656e75223b7573657273657373696f6e5f656d61696c7c733a31333a2276656e75406d61696c2e636f6d223b7573657273657373696f6e5f726f6c657c733a363a224d656d626572223b7573657273657373696f6e5f697341646d696e7c623a303b7573657273657373696f6e5f5f5f7374617465737c613a363a7b733a343a226e616d65223b623a313b733a383a22757365726e616d65223b623a313b733a373a2273656f6e616d65223b623a313b733a353a22656d61696c223b623a313b733a343a22726f6c65223b623a313b733a373a22697341646d696e223b623a313b7d7573657273657373696f6e5f5969692e43576562557365722e666c6173682e6572726f727c733a32333a22436f756c64206e6f742066696e6420746861742049442e223b7573657273657373696f6e5f5969692e43576562557365722e666c617368636f756e746572737c613a313a7b733a353a226572726f72223b693a313b7d),
('eo30ld4hr9ekkn5jd5cgknld51', 1362491348, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a343a227961796f223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a323b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a333a226d7779223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a323b7573657273657373696f6e5f5f5f69647c733a323a223135223b7573657273657373696f6e5f5f5f6e616d657c733a31303a226865406d616e2e636f6d223b7573657273657373696f6e5f6e616d657c733a353a2268656d616e223b7573657273657373696f6e5f757365726e616d657c733a353a2268656d616e223b7573657273657373696f6e5f73656f6e616d657c733a353a2268656d616e223b7573657273657373696f6e5f656d61696c7c733a31303a226865406d616e2e636f6d223b7573657273657373696f6e5f726f6c657c733a363a224d656d626572223b7573657273657373696f6e5f697341646d696e7c623a303b7573657273657373696f6e5f5f5f7374617465737c613a363a7b733a343a226e616d65223b623a313b733a383a22757365726e616d65223b623a313b733a373a2273656f6e616d65223b623a313b733a353a22656d61696c223b623a313b733a343a22726f6c65223b623a313b733a373a22697341646d696e223b623a313b7d),
('epr3k4e7qkm5743pvgvtr80ju1', 1362208183, ''),
('f5n2fl7g50afkf7racl6j5h7k5', 1362490313, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a373a226169786d647577223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('fgvk2fqhjsv4jp00esh35ek3p3', 1362406570, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a353a2273756d6570223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a313b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a373a227369646f6a6e74223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('fnbrdhreqfsgumjvvfb8piur97', 1362491191, ''),
('ghk8ijdemo5khhgu8i9jl5gvh5', 1362229162, ''),
('h8i9huauoenhf0m1gdamde0nd6', 1362491004, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a333a22686f76223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('inu22qgtbnhsblnagfmn4gec06', 1361967631, 0x5969692e4343617074636861416374696f6e2e37663439643434362e736974652e636170746368617c733a363a22666163616b6d223b5969692e4343617074636861416374696f6e2e37663439643434362e736974652e63617074636861636f756e747c693a313b6769695f5f72657475726e55726c7c733a32343a222f6261736570726f6a6563742f6261636b656e642f676969223b6769695f5f69647c733a353a227969696572223b6769695f5f6e616d657c733a353a227969696572223b6769695f5f7374617465737c613a303a7b7d5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a343a226a757865223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a333b736573736f696e707265666978636f6d6d6f6e5f5f69647c733a313a2231223b736573736f696e707265666978636f6d6d6f6e5f5f6e616d657c733a31373a2261646d696e40636f6d70616e792e636f6d223b736573736f696e707265666978636f6d6d6f6e6e616d657c733a31333a2241646d696e6973747261746f72223b736573736f696e707265666978636f6d6d6f6e757365726e616d657c733a31333a2241646d696e6973747261746f72223b736573736f696e707265666978636f6d6d6f6e73656f6e616d657c733a31333a2261646d696e6973747261746f72223b736573736f696e707265666978636f6d6d6f6e656d61696c7c733a31373a2261646d696e40636f6d70616e792e636f6d223b736573736f696e707265666978636f6d6d6f6e726f6c657c733a353a2241646d696e223b736573736f696e707265666978636f6d6d6f6e697341646d696e7c623a313b736573736f696e707265666978636f6d6d6f6e5f5f7374617465737c613a363a7b733a343a226e616d65223b623a313b733a383a22757365726e616d65223b623a313b733a373a2273656f6e616d65223b623a313b733a353a22656d61696c223b623a313b733a343a22726f6c65223b623a313b733a373a22697341646d696e223b623a313b7d),
('jaumc5ppchlgtg8adau9moc4l4', 1362406898, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a343a22796f6269223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a313b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a373a226e6c74656a6666223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('jb9gurncmh7tfgvd32bfaqh0c7', 1362487400, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a343a22746f6b6f223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a323b),
('jsolr3eeggdic5euevvc14hto6', 1362387545, ''),
('k1kal6ompitbl19dtcm4ik31a5', 1362477177, ''),
('kihf7qksgdlovef3anfuhbnmm1', 1362408069, ''),
('o3daultg0jnp3q3gt7goi145o1', 1362492091, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a353a227667766576223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a323b7573657273657373696f6e5f5f5f69647c733a313a2231223b7573657273657373696f6e5f5f5f6e616d657c733a31373a2261646d696e40636f6d70616e792e636f6d223b7573657273657373696f6e5f6e616d657c733a31333a2241646d696e6973747261746f72223b7573657273657373696f6e5f757365726e616d657c733a31333a2241646d696e6973747261746f72223b7573657273657373696f6e5f73656f6e616d657c733a31333a2261646d696e6973747261746f72223b7573657273657373696f6e5f656d61696c7c733a31373a2261646d696e40636f6d70616e792e636f6d223b7573657273657373696f6e5f726f6c657c733a353a2241646d696e223b7573657273657373696f6e5f697341646d696e7c623a313b7573657273657373696f6e5f5f5f7374617465737c613a363a7b733a343a226e616d65223b623a313b733a383a22757365726e616d65223b623a313b733a373a2273656f6e616d65223b623a313b733a353a22656d61696c223b623a313b733a343a22726f6c65223b623a313b733a373a22697341646d696e223b623a313b7d),
('pt57mui7kou0bhagdobql6s7u7', 1362208121, ''),
('q8b10ju4rehabmvuohrql3crj6', 1362484121, ''),
('q99phuc1lm210lvrn8jledhd83', 1362491180, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a363a22746574656861223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a323b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a343a2275696c69223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a323b7573657273657373696f6e5f5f5f69647c733a323a223134223b7573657273657373696f6e5f5f5f6e616d657c733a31313a226d7940757365722e636f6d223b7573657273657373696f6e5f6e616d657c733a363a226d7975736572223b7573657273657373696f6e5f757365726e616d657c733a363a226d7975736572223b7573657273657373696f6e5f73656f6e616d657c733a363a226d7975736572223b7573657273657373696f6e5f656d61696c7c733a31313a226d7940757365722e636f6d223b7573657273657373696f6e5f726f6c657c733a363a224d656d626572223b7573657273657373696f6e5f697341646d696e7c623a303b7573657273657373696f6e5f5f5f7374617465737c613a363a7b733a343a226e616d65223b623a313b733a383a22757365726e616d65223b623a313b733a373a2273656f6e616d65223b623a313b733a353a22656d61696c223b623a313b733a343a22726f6c65223b623a313b733a373a22697341646d696e223b623a313b7d),
('r7h7r328kjm77lldl8o2adqfk4', 1362225393, ''),
('tiojgq7e4fqk57s9ql9kbqgt75', 1362406311, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a333a2271656e223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a313b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a363a226d6667656675223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('tj99268r985s6cvcuunaedg2f4', 1362405973, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a353a226d63706974223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a313b4b4346494e4445527c613a333a7b733a383a2264697361626c6564223b623a303b733a393a2275706c6f616455524c223b733a33393a222f6261736570726f6a6563742f6261636b656e642f7777772f656469746f7275706c6f6164732f223b733a393a2275706c6f6164446972223b733a34373a222f7661722f7777772f6261736570726f6a6563742f6261636b656e642f7777772f656469746f7275706c6f6164732f223b7d5969692e4343617074636861416374696f6e2e39373866303834622e75736572732f72656769737465722e636170746368617c733a343a2274757765223b5969692e4343617074636861416374696f6e2e39373866303834622e75736572732f72656769737465722e63617074636861636f756e747c693a313b5969692e4343617074636861416374696f6e2e39373866303834622e75736572732f6c6f67696e2e636170746368617c733a373a2263697a656c7564223b5969692e4343617074636861416374696f6e2e39373866303834622e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('tshu8i03h94sutjqi58bf272k2', 1362406767, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e636170746368617c733a353a227a666a7572223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f72656769737465722e63617074636861636f756e747c693a313b),
('ui7sk5djepsobk4auoqvm4vp73', 1362396769, 0x5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e636170746368617c733a363a226a6972737970223b5969692e4343617074636861416374696f6e2e37663439643434362e75736572732f6c6f67696e2e63617074636861636f756e747c693a323b5969692e4343617074636861416374696f6e2e37663439643434362e736974652e636170746368617c733a363a22796f74756769223b5969692e4343617074636861416374696f6e2e37663439643434362e736974652e63617074636861636f756e747c693a313b7573657273657373696f6e5f5f5f69647c733a313a2231223b7573657273657373696f6e5f5f5f6e616d657c733a31373a2261646d696e40636f6d70616e792e636f6d223b7573657273657373696f6e5f6e616d657c733a31333a2241646d696e6973747261746f72223b7573657273657373696f6e5f757365726e616d657c733a31333a2241646d696e6973747261746f72223b7573657273657373696f6e5f73656f6e616d657c733a31333a2261646d696e6973747261746f72223b7573657273657373696f6e5f656d61696c7c733a31373a2261646d696e40636f6d70616e792e636f6d223b7573657273657373696f6e5f726f6c657c733a353a2241646d696e223b7573657273657373696f6e5f697341646d696e7c623a313b7573657273657373696f6e5f5f5f7374617465737c613a363a7b733a343a226e616d65223b623a313b733a383a22757365726e616d65223b623a313b733a373a2273656f6e616d65223b623a313b733a353a22656d61696c223b623a313b733a343a22726f6c65223b623a313b733a373a22697341646d696e223b623a313b7d7573657273657373696f6e5f666f72756d757365725f69647c733a313a2233223b),
('vtkk0thdv6lhol3unc3p2daeg4', 1362030385, 0x5969692e4343617074636861416374696f6e2e39366564663137302e75736572732f6c6f67696e2e636170746368617c733a353a227972627570223b5969692e4343617074636861416374696f6e2e39366564663137302e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b),
('vtneost9nn7eorrui6ntjd5ld1', 1362030625, 0x5969692e4343617074636861416374696f6e2e39366564663137302e75736572732f6c6f67696e2e636170746368617c733a333a226b726a223b5969692e4343617074636861416374696f6e2e39366564663137302e75736572732f6c6f67696e2e63617074636861636f756e747c693a313b);

-- --------------------------------------------------------

--
-- Table structure for table `SourceMessage`
--

CREATE TABLE IF NOT EXISTS `SourceMessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(32) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `SourceMessage`
--

INSERT INTO `SourceMessage` (`id`, `category`, `message`) VALUES
(1, 'global', 'Hidden Brains'),
(2, 'global', 'Admin'),
(3, 'global', 'Home'),
(4, 'global', 'About'),
(5, 'global', 'Contact'),
(6, 'global', 'Login'),
(7, 'global', 'This is index Page...'),
(8, 'global', 'This is About Us Page...');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comments`
--

CREATE TABLE IF NOT EXISTS `tbl_comments` (
  `owner_name` varchar(50) NOT NULL,
  `owner_id` int(12) NOT NULL,
  `comment_id` int(12) NOT NULL AUTO_INCREMENT,
  `parent_comment_id` int(12) DEFAULT NULL,
  `creator_id` int(12) DEFAULT NULL,
  `user_name` varchar(128) DEFAULT NULL,
  `user_email` varchar(128) DEFAULT NULL,
  `comment_text` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_id`),
  KEY `owner_name` (`owner_name`,`owner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migration`
--

CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_migration`
--

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1359783009),
('m120805_131754_user_table_migration', 1359783012);

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE IF NOT EXISTS `thread` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `forum_id` int(10) unsigned NOT NULL,
  `subject` varchar(120) NOT NULL,
  `is_sticky` tinyint(1) unsigned NOT NULL,
  `is_locked` tinyint(1) unsigned NOT NULL,
  `view_count` bigint(20) unsigned NOT NULL,
  `created` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_thread_forum` (`forum_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `thread`
--

INSERT INTO `thread` (`id`, `forum_id`, `subject`, `is_sticky`, `is_locked`, `view_count`, `created`) VALUES
(1, 2, 'First release', 1, 1, 34, 0),
(2, 5, 'Subject is allowed to be blank when creating a new thread', 0, 0, 4, 0),
(3, 5, 'Post date is not set', 0, 1, 16, 0),
(4, 5, 'Forum view does not show correct last post', 0, 1, 10, 1349540563),
(5, 6, 'User signatures', 0, 0, 1, 1349570366),
(6, 6, 'BB Code', 0, 0, 3, 1349570413),
(7, 5, 'Attachments', 0, 0, 21, 1349578699),
(8, 8, 'hello', 0, 0, 2, 1361277871),
(9, 10, 'politics', 0, 0, 2, 1361278415);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(155) NOT NULL DEFAULT '',
  `seoname` varchar(250) NOT NULL DEFAULT '',
  `email` varchar(155) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `joined` int(10) NOT NULL DEFAULT '0',
  `passwordreset` char(40) DEFAULT NULL,
  `data` text,
  `role` char(30) NOT NULL DEFAULT '',
  `ipaddress` char(30) NOT NULL DEFAULT '',
  `fbuid` int(10) NOT NULL DEFAULT '0',
  `fbtoken` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `seoname`, `email`, `password`, `joined`, `passwordreset`, `data`, `role`, `ipaddress`, `fbuid`, `fbtoken`) VALUES
(1, 'Administrator', 'administrator', 'admin@company.com', '1ea6e931749f195b7606790f6172ce0e52f102cc', 1361436249, NULL, NULL, 'Admin', '127.0.0.1', 0, ''),
(16, 'venu', 'venu', 'venu@mail.com', '0260eacea82bf85821d2a9bf053cdcfcbc4b0549', 1362492071, NULL, NULL, 'Member', '127.0.0.1', 0, '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AuthAssignment`
--
ALTER TABLE `AuthAssignment`
  ADD CONSTRAINT `AuthAssignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `AuthItemChild`
--
ALTER TABLE `AuthItemChild`
  ADD CONSTRAINT `AuthItemChild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `AuthItemChild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `FK_forum_forum` FOREIGN KEY (`parent_id`) REFERENCES `forum` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_post_author` FOREIGN KEY (`author_id`) REFERENCES `forumuser` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_post_editor` FOREIGN KEY (`editor_id`) REFERENCES `forumuser` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_post_thread` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `FK_thread_forum` FOREIGN KEY (`forum_id`) REFERENCES `forum` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
