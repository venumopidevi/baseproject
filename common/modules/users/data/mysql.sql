-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 19, 2013 at 02:29 PM
-- Server version: 5.5.29
-- PHP Version: 5.3.10-1ubuntu3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `clevertech`
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
('Admin', '1', '', 'N;'),
('Author', '1', '', 'N;'),
('Author', '2', '', 'N;'),
('Editor', '1', '', 'N;'),
('Editor', '2', NULL, 'N;'),
('Guest', '1', '', 'N;'),
('Member', '1', '', 'N;'),
('Member', '13', '', 'N;'),
('op_roles_add_auth', '1', '', 'N;'),
('op_roles_add_authchild', '1', '', 'N;'),
('op_roles_add_authchild', '2', '', 'N;'),
('op_roles_delete_auth', '1', '', 'N;'),
('op_roles_delete_auth', '13', '', 'N;'),
('op_roles_edit_auth', '1', '', 'N;'),
('Superadmin', '1', '', 'N;'),
('task_roles', '1', '', 'N;'),
('task_roles', '13', '', 'N;'),
('task_roles', '2', '', 'N;');

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
('op_roles_add_auth', 0, 'Roles: Add Auth Items', '', 'N;'),
('op_roles_add_authchild', 0, 'Roles: Add Auth Items Childs', '', 'N;'),
('op_roles_delete_auth', 0, 'Roles: Delete Auth Items', '', 'N;'),
('op_roles_edit_auth', 0, 'Roles: Edit Auth Items', '', 'N;'),
('Superadmin', 2, 'Super Admin', '', 'N;'),
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
('task_roles', 'op_roles_add_auth'),
('task_roles', 'op_roles_add_authchild'),
('task_roles', 'op_roles_delete_auth'),
('task_roles', 'op_roles_edit_auth');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `seoname`, `email`, `password`, `joined`, `passwordreset`, `data`, `role`, `ipaddress`, `fbuid`, `fbtoken`) VALUES
(12, 'venu', 'venu', 'v1@m.com', '0b929ecbf0a18386247d8d297e0a633417185afc', 1361205869, NULL, NULL, 'Member', '127.0.0.1', 0, ''),
(13, 'dinesh', 'dinesh', 'd@d.com', '972fafda0ecdedbf6e48b4061e7bb4b2da5196a3', 1361263998, NULL, NULL, 'Member', '127.0.0.1', 0, '');

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

