-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2022 at 06:47 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alms`
--

-- --------------------------------------------------------

--
-- Table structure for table `agri_amenities`
--

CREATE TABLE `agri_amenities` (
  `AmenitiesID` int(11) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Land_area` bigint(20) NOT NULL,
  `Soil_type` varchar(30) NOT NULL,
  `Amount` bigint(20) NOT NULL,
  `water_sources` varchar(50) NOT NULL,
  `suitable_crop` varchar(50) NOT NULL,
  `weather` varchar(30) NOT NULL,
  `protection_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agri_amenities`
--

INSERT INTO `agri_amenities` (`AmenitiesID`, `Address`, `Land_area`, `Soil_type`, `Amount`, `water_sources`, `suitable_crop`, `weather`, `protection_type`) VALUES
(17, 'Shivammoga 577204', 12, 'Clay', 56000, 'Pond', 'Wheat', 'Dry', 'Fenced'),
(18, 'Sagara 577401', 15, 'Sandy', 89000, 'Well', 'Sugarcane', 'Cold', 'Barbed'),
(19, 'Davangere 577002', 24, 'Swamp', 98000, 'River', 'Wheat', 'Dry', 'Fenced'),
(20, 'Chickmagaluru 577101', 80, 'Black', 600001, 'Tubewell', 'Coffee', 'Clowdy', 'NONE'),
(21, 'shimoga 577201', 100, 'sandy', -15, 'pond', 'paddy,wheat', 'mixed', 'fenced');

-- --------------------------------------------------------

--
-- Table structure for table `agri_amenities_contains`
--

CREATE TABLE `agri_amenities_contains` (
  `id` bigint(20) NOT NULL,
  `amenities_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `agri_amenities_containss`
--

CREATE TABLE `agri_amenities_containss` (
  `id` bigint(20) NOT NULL,
  `amenities_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agri_amenities_containss`
--

INSERT INTO `agri_amenities_containss` (`id`, `amenities_id`, `seller_id`) VALUES
(17, 17, 13),
(18, 18, 13),
(19, 19, 13),
(20, 20, 13),
(21, 21, 17);

-- --------------------------------------------------------

--
-- Table structure for table `agri_broker`
--

CREATE TABLE `agri_broker` (
  `BrokerID` int(11) NOT NULL,
  `Brname` varchar(50) NOT NULL,
  `Brphone_number` bigint(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agri_broker`
--

INSERT INTO `agri_broker` (`BrokerID`, `Brname`, `Brphone_number`, `password`, `address`) VALUES
(14, 'Sanath Goutham', 6360868897, '81dc9bdb52d04dc20036dbd8313ed055', 'sanathgoutham@gmail.com'),
(15, 'Shreyas R Adiga', 7892415414, '81dc9bdb52d04dc20036dbd8313ed055', 'sradigu@gmail.com'),
(16, 'Suhas S A', 8088525112, '81dc9bdb52d04dc20036dbd8313ed055', 'suhassa71@gmail.com'),
(17, 'Niranjan Gowda', 9743560706, '81dc9bdb52d04dc20036dbd8313ed055', 'Niranjan@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `agri_broker_helps`
--

CREATE TABLE `agri_broker_helps` (
  `id` bigint(20) NOT NULL,
  `broker_id` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agri_broker_helps`
--

INSERT INTO `agri_broker_helps` (`id`, `broker_id`, `buyer_id`) VALUES
(18, 16, 11);

-- --------------------------------------------------------

--
-- Table structure for table `agri_buyer`
--

CREATE TABLE `agri_buyer` (
  `BuyerID` int(11) NOT NULL,
  `Bname` varchar(50) NOT NULL,
  `Baddress` varchar(254) NOT NULL,
  `Bphone_number` bigint(20) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agri_buyer`
--

INSERT INTO `agri_buyer` (`BuyerID`, `Bname`, `Baddress`, `Bphone_number`, `password`) VALUES
(11, 'Sanath Goutham', 'sanathgoutham@gmail.com', 6360868897, '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `agri_land`
--

CREATE TABLE `agri_land` (
  `LandID` int(11) NOT NULL,
  `buys_id` int(11) NOT NULL,
  `owns_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `agri_seller`
--

CREATE TABLE `agri_seller` (
  `SellerID` int(11) NOT NULL,
  `Sname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `Saddress` varchar(254) NOT NULL,
  `Sphone_number` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `agri_seller`
--

INSERT INTO `agri_seller` (`SellerID`, `Sname`, `password`, `Saddress`, `Sphone_number`) VALUES
(13, 'Sanath Goutham', '81dc9bdb52d04dc20036dbd8313ed055', 'sanathgoutham@gmail.com', 6360868897),
(14, 'Shreyas R Adiga', '81dc9bdb52d04dc20036dbd8313ed055', 'sradigu@gmail.com', 7892415414),
(15, 'Sanath Goutham', '81dc9bdb52d04dc20036dbd8313ed055', 'sanathgoutham@gmail.com', 8088525112),
(16, 'Sanath Goutham', '81dc9bdb52d04dc20036dbd8313ed055', 'sanathgoutham@gmail.com', 8088525112),
(17, 'suhas', '559e3ea609b545a204248a19d87ccfe4', 'suhassa@gmail.com', 8088525112),
(18, 'suhas', '559e3ea609b545a204248a19d87ccfe4', 'suhassa@gmail.com', 8088525112),
(19, 'suhas', '559e3ea609b545a204248a19d87ccfe4', 'suhassa@gmail.com', 8088525112);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(25, 'Can add buyer', 7, 'add_buyer'),
(26, 'Can change buyer', 7, 'change_buyer'),
(27, 'Can delete buyer', 7, 'delete_buyer'),
(28, 'Can view buyer', 7, 'view_buyer'),
(29, 'Can add seller', 8, 'add_seller'),
(30, 'Can change seller', 8, 'change_seller'),
(31, 'Can delete seller', 8, 'delete_seller'),
(32, 'Can view seller', 8, 'view_seller'),
(33, 'Can add land', 9, 'add_land'),
(34, 'Can change land', 9, 'change_land'),
(35, 'Can delete land', 9, 'delete_land'),
(36, 'Can view land', 9, 'view_land'),
(37, 'Can add broker', 10, 'add_broker'),
(38, 'Can change broker', 10, 'change_broker'),
(39, 'Can delete broker', 10, 'delete_broker'),
(40, 'Can view broker', 10, 'view_broker'),
(41, 'Can add amenities', 11, 'add_amenities'),
(42, 'Can change amenities', 11, 'change_amenities'),
(43, 'Can delete amenities', 11, 'delete_amenities'),
(44, 'Can view amenities', 11, 'view_amenities');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$z0ekJ50FWAfTe31HAccvwO$RuaodCuggglpVjAs1R4yFwP1E+5JHTD5vjs/Ago1hIc=', '2022-03-30 05:27:22.062458', 1, 'shreyas', '', '', 'sradigu@gmail.com', 1, 1, '2022-03-30 05:26:49.191094');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(11, 'agri', 'amenities'),
(10, 'agri', 'broker'),
(7, 'agri', 'buyer'),
(9, 'agri', 'land'),
(8, 'agri', 'seller'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-01-26 08:20:46.351355'),
(2, 'auth', '0001_initial', '2022-01-26 08:20:46.835793'),
(3, 'admin', '0001_initial', '2022-01-26 08:20:46.935858'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-01-26 08:20:46.951878'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-01-26 08:20:46.963869'),
(6, 'agri', '0001_initial', '2022-01-26 08:20:47.488021'),
(7, 'contenttypes', '0002_remove_content_type_name', '2022-01-26 08:20:47.560040'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-01-26 08:20:47.632043'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-01-26 08:20:47.660067'),
(10, 'auth', '0004_alter_user_username_opts', '2022-01-26 08:20:47.676072'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-01-26 08:20:47.736071'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-01-26 08:20:47.740072'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-01-26 08:20:47.752075'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-01-26 08:20:47.780083'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-01-26 08:20:47.808109'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-01-26 08:20:47.836116'),
(17, 'auth', '0011_update_proxy_permissions', '2022-01-26 08:20:47.856103'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-01-26 08:20:47.884111'),
(19, 'sessions', '0001_initial', '2022-01-26 08:20:47.928138');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('y0w9xr42tffydnhw8wye9wb4i80jkvo3', '.eJxVjDsOwjAQBe_iGllZbPyhpOcM1np3gwPIluKkQtwdIqWA9s3Me6mE61LS2mVOE6uzAnX43TLSQ-oG-I711jS1usxT1puid9r1tbE8L7v7d1Cwl28dCYWJkXg0CCSClB1IdOiCOXpDw8kCS_SBMwRiiOgHa2wEg9aMQb0_Lfk4vQ:1nZQra:nwKc63c8QrepRmfotuJ5sw0-F7Y2UAJqbvXi_WuGrZs', '2022-04-13 05:27:22.070458');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agri_amenities`
--
ALTER TABLE `agri_amenities`
  ADD PRIMARY KEY (`AmenitiesID`);

--
-- Indexes for table `agri_amenities_contains`
--
ALTER TABLE `agri_amenities_contains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agri_amenities_contains_amenities_id_buyer_id_d9a37019_uniq` (`amenities_id`,`buyer_id`),
  ADD KEY `agri_amenities_contains_buyer_id_a7786056_fk_agri_buyer_BuyerID` (`buyer_id`);

--
-- Indexes for table `agri_amenities_containss`
--
ALTER TABLE `agri_amenities_containss`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agri_amenities_containss_amenities_id_seller_id_29f0fd98_uniq` (`amenities_id`,`seller_id`),
  ADD KEY `agri_amenities_conta_seller_id_74a7e570_fk_agri_sell` (`seller_id`);

--
-- Indexes for table `agri_broker`
--
ALTER TABLE `agri_broker`
  ADD PRIMARY KEY (`BrokerID`);

--
-- Indexes for table `agri_broker_helps`
--
ALTER TABLE `agri_broker_helps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `agri_broker_helps_broker_id_buyer_id_01d8a4c3_uniq` (`broker_id`,`buyer_id`),
  ADD KEY `agri_broker_helps_buyer_id_342415fa_fk_agri_buyer_BuyerID` (`buyer_id`);

--
-- Indexes for table `agri_buyer`
--
ALTER TABLE `agri_buyer`
  ADD PRIMARY KEY (`BuyerID`);

--
-- Indexes for table `agri_land`
--
ALTER TABLE `agri_land`
  ADD PRIMARY KEY (`LandID`),
  ADD KEY `agri_land_buys_id_84fa8155_fk_agri_buyer_BuyerID` (`buys_id`),
  ADD KEY `agri_land_owns_id_233dd6d1_fk_agri_seller_SellerID` (`owns_id`);

--
-- Indexes for table `agri_seller`
--
ALTER TABLE `agri_seller`
  ADD PRIMARY KEY (`SellerID`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agri_amenities`
--
ALTER TABLE `agri_amenities`
  MODIFY `AmenitiesID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `agri_amenities_contains`
--
ALTER TABLE `agri_amenities_contains`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `agri_amenities_containss`
--
ALTER TABLE `agri_amenities_containss`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `agri_broker`
--
ALTER TABLE `agri_broker`
  MODIFY `BrokerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `agri_broker_helps`
--
ALTER TABLE `agri_broker_helps`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `agri_buyer`
--
ALTER TABLE `agri_buyer`
  MODIFY `BuyerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `agri_land`
--
ALTER TABLE `agri_land`
  MODIFY `LandID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agri_seller`
--
ALTER TABLE `agri_seller`
  MODIFY `SellerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agri_amenities_contains`
--
ALTER TABLE `agri_amenities_contains`
  ADD CONSTRAINT `agri_amenities_conta_amenities_id_e9374ede_fk_agri_amen` FOREIGN KEY (`amenities_id`) REFERENCES `agri_amenities` (`AmenitiesID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agri_amenities_contains_buyer_id_a7786056_fk_agri_buyer_BuyerID` FOREIGN KEY (`buyer_id`) REFERENCES `agri_buyer` (`BuyerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `agri_amenities_containss`
--
ALTER TABLE `agri_amenities_containss`
  ADD CONSTRAINT `agri_amenities_conta_amenities_id_9bc9f77e_fk_agri_amen` FOREIGN KEY (`amenities_id`) REFERENCES `agri_amenities` (`AmenitiesID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agri_amenities_conta_seller_id_74a7e570_fk_agri_sell` FOREIGN KEY (`seller_id`) REFERENCES `agri_seller` (`SellerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `agri_broker_helps`
--
ALTER TABLE `agri_broker_helps`
  ADD CONSTRAINT `agri_broker_helps_broker_id_f26d3395_fk_agri_broker_BrokerID` FOREIGN KEY (`broker_id`) REFERENCES `agri_broker` (`BrokerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agri_broker_helps_buyer_id_342415fa_fk_agri_buyer_BuyerID` FOREIGN KEY (`buyer_id`) REFERENCES `agri_buyer` (`BuyerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `agri_land`
--
ALTER TABLE `agri_land`
  ADD CONSTRAINT `agri_land_buys_id_84fa8155_fk_agri_buyer_BuyerID` FOREIGN KEY (`buys_id`) REFERENCES `agri_buyer` (`BuyerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `agri_land_owns_id_233dd6d1_fk_agri_seller_SellerID` FOREIGN KEY (`owns_id`) REFERENCES `agri_seller` (`SellerID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
