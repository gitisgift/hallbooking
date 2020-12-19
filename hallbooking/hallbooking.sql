-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 14, 2020 at 12:23 AM
-- Server version: 8.0.22-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hallbooking`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add hall', 7, 'add_hall'),
(26, 'Can change hall', 7, 'change_hall'),
(27, 'Can delete hall', 7, 'delete_hall'),
(28, 'Can view hall', 7, 'view_hall'),
(29, 'Can add book hall', 8, 'add_bookhall'),
(30, 'Can change book hall', 8, 'change_bookhall'),
(31, 'Can delete book hall', 8, 'delete_bookhall'),
(32, 'Can view book hall', 8, 'view_bookhall'),
(33, 'Can add booked', 9, 'add_booked'),
(34, 'Can change booked', 9, 'change_booked'),
(35, 'Can delete booked', 9, 'delete_booked'),
(36, 'Can view booked', 9, 'view_booked'),
(37, 'Can add book hall request', 10, 'add_bookhallrequest'),
(38, 'Can change book hall request', 10, 'change_bookhallrequest'),
(39, 'Can delete book hall request', 10, 'delete_bookhallrequest'),
(40, 'Can view book hall request', 10, 'view_bookhallrequest');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$V52n9LCX1M48$36ODzXjj6JLyVSKIpMjA2KjqV/R2i3BZAqrjLxhO7mk=', NULL, 1, 'root', '', '', '', 1, 1, '2020-12-12 19:41:14.665961');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'hall', 'booked'),
(8, 'hall', 'bookhall'),
(10, 'hall', 'bookhallrequest'),
(7, 'hall', 'hall'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-12-11 18:29:40.901618'),
(2, 'auth', '0001_initial', '2020-12-11 18:29:41.017481'),
(3, 'admin', '0001_initial', '2020-12-11 18:29:41.295941'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-12-11 18:29:41.373007'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-12-11 18:29:41.386190'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-12-11 18:29:41.456259'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-12-11 18:29:41.502356'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-12-11 18:29:41.550716'),
(9, 'auth', '0004_alter_user_username_opts', '2020-12-11 18:29:41.560212'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-12-11 18:29:41.599582'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-12-11 18:29:41.603863'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-12-11 18:29:41.616974'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-12-11 18:29:41.666881'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-12-11 18:29:41.710402'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-12-11 18:29:41.753775'),
(16, 'auth', '0011_update_proxy_permissions', '2020-12-11 18:29:41.763371'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2020-12-11 18:29:41.817111'),
(18, 'sessions', '0001_initial', '2020-12-11 18:29:41.842734'),
(19, 'hall', '0001_initial', '2020-12-12 18:34:07.747346'),
(20, 'hall', '0002_auto_20201212_1902', '2020-12-12 19:03:00.242158'),
(21, 'hall', '0003_remove_hall_is_booked', '2020-12-12 19:05:23.657971'),
(22, 'hall', '0004_bookhallrequest_found_hall', '2020-12-12 19:19:28.592427'),
(23, 'hall', '0005_auto_20201213_0119', '2020-12-12 19:49:50.342277'),
(24, 'hall', '0006_auto_20201212_2038', '2020-12-12 20:38:59.059177'),
(25, 'hall', '0007_auto_20201213_0829', '2020-12-13 08:29:56.551024'),
(26, 'hall', '0008_auto_20201213_1107', '2020-12-13 11:07:05.882412'),
(27, 'hall', '0009_auto_20201213_1657', '2020-12-13 16:57:55.084524');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hall_booked`
--

CREATE TABLE `hall_booked` (
  `id` int NOT NULL,
  `hall_id` int NOT NULL,
  `hallrequest_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hall_booked`
--

INSERT INTO `hall_booked` (`id`, `hall_id`, `hallrequest_id`) VALUES
(10, 3, 33),
(11, 3, 42),
(12, 4, 42),
(13, 5, 42),
(14, 6, 43),
(15, 3, 44),
(16, 4, 44),
(17, 5, 44),
(59, 3, 44),
(60, 4, 44),
(61, 5, 44),
(62, 6, 44),
(63, 3, 52),
(64, 4, 52),
(65, 5, 52),
(66, 6, 52);

-- --------------------------------------------------------

--
-- Table structure for table `hall_bookhallrequest`
--

CREATE TABLE `hall_bookhallrequest` (
  `id` int NOT NULL,
  `total_capacity_needed` varchar(20) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `request_confirmed_by_user` tinyint(1) NOT NULL,
  `is_alloted` tinyint(1) NOT NULL,
  `booked_by_id` int NOT NULL,
  `suggested_hall_id` int DEFAULT NULL,
  `hall_q` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hall_bookhallrequest`
--

INSERT INTO `hall_bookhallrequest` (`id`, `total_capacity_needed`, `start_date`, `end_date`, `request_confirmed_by_user`, `is_alloted`, `booked_by_id`, `suggested_hall_id`, `hall_q`) VALUES
(33, '140', '2020-12-13 12:56:00.000000', '2020-12-14 23:59:00.000000', 0, 1, 1, 3, 1),
(42, '200', '2020-12-15 00:01:00.000000', '2020-12-15 11:59:00.000000', 0, 1, 1, 3, 3),
(43, '200', '2020-12-15 00:01:00.000000', '2020-12-15 11:59:00.000000', 0, 1, 1, 6, 3),
(44, '200', '2020-12-15 13:01:00.000000', '2020-12-15 15:59:00.000000', 0, 1, 1, 3, 3),
(45, '200', '2020-12-15 12:01:00.000000', '2020-12-15 15:59:00.000000', 0, 0, 1, NULL, 3),
(46, '200', '2020-12-15 12:01:00.000000', '2020-12-15 15:59:00.000000', 0, 0, 1, NULL, 3),
(47, '200', '2020-12-15 12:01:00.000000', '2020-12-15 15:59:00.000000', 0, 0, 1, NULL, 3),
(48, '200', '2020-12-15 12:01:00.000000', '2020-12-15 15:59:00.000000', 0, 0, 1, NULL, 3),
(49, '200', '2020-12-15 12:01:00.000000', '2020-12-15 15:59:00.000000', 0, 0, 1, NULL, 3),
(50, '200', '2020-12-15 14:01:00.000000', '2020-12-15 15:59:00.000000', 0, 0, 1, NULL, 3),
(51, '200', '2020-12-15 15:59:00.000000', '2020-12-15 16:59:00.000000', 0, 0, 1, NULL, 3),
(52, '200', '2020-12-15 16:00:00.000000', '2020-12-15 16:59:00.000000', 0, 1, 1, 3, 3),
(53, '200', '2020-12-15 15:59:00.000000', '2020-12-15 16:59:00.000000', 0, 1, 1, NULL, 3),
(54, '200', '2020-12-15 15:59:00.000000', '2020-12-15 16:59:00.000000', 0, 0, 1, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `hall_hall`
--

CREATE TABLE `hall_hall` (
  `id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `capacity` int NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hall_hall`
--

INSERT INTO `hall_hall` (`id`, `name`, `capacity`, `is_active`) VALUES
(1, 'A', 50, 1),
(2, 'B', 100, 1),
(3, 'C', 200, 1),
(4, 'D', 350, 1),
(5, 'E', 500, 1),
(6, 'F', 1000, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `hall_booked`
--
ALTER TABLE `hall_booked`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hall_booked_hall_id_cd07ebcf_fk_hall_hall_id` (`hall_id`),
  ADD KEY `hall_booked_hallrequest_id_d572b919` (`hallrequest_id`);

--
-- Indexes for table `hall_bookhallrequest`
--
ALTER TABLE `hall_bookhallrequest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hall_bookhallrequest_booked_by_id_93fb5d73_fk_auth_user_id` (`booked_by_id`),
  ADD KEY `hall_bookhallrequest_suggested_hall_id_cc4d4189_fk_hall_hall_id` (`suggested_hall_id`);

--
-- Indexes for table `hall_hall`
--
ALTER TABLE `hall_hall`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `hall_booked`
--
ALTER TABLE `hall_booked`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `hall_bookhallrequest`
--
ALTER TABLE `hall_bookhallrequest`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `hall_hall`
--
ALTER TABLE `hall_hall`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `hall_booked`
--
ALTER TABLE `hall_booked`
  ADD CONSTRAINT `hall_booked_hall_id_cd07ebcf_fk_hall_hall_id` FOREIGN KEY (`hall_id`) REFERENCES `hall_hall` (`id`),
  ADD CONSTRAINT `hall_booked_hallrequest_id_d572b919_fk_hall_bookhallrequest_id` FOREIGN KEY (`hallrequest_id`) REFERENCES `hall_bookhallrequest` (`id`);

--
-- Constraints for table `hall_bookhallrequest`
--
ALTER TABLE `hall_bookhallrequest`
  ADD CONSTRAINT `hall_bookhallrequest_booked_by_id_93fb5d73_fk_auth_user_id` FOREIGN KEY (`booked_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `hall_bookhallrequest_suggested_hall_id_cc4d4189_fk_hall_hall_id` FOREIGN KEY (`suggested_hall_id`) REFERENCES `hall_hall` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
