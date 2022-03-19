-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2022 at 11:27 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bwastartup`
--

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `perks` text DEFAULT NULL,
  `backer_count` int(11) DEFAULT NULL,
  `goal_amount` int(11) DEFAULT NULL,
  `current_amount` int(11) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaigns`
--

INSERT INTO `campaigns` (`id`, `user_id`, `name`, `short_description`, `description`, `perks`, `backer_count`, `goal_amount`, `current_amount`, `slug`, `created_at`, `updated_at`) VALUES
(1, 5, 'Campaign 1', 'short_description', 'DEsc', 'perks 1,   disini 2, disini 3', 0, 150000000, 0, 'campaign-1', '2022-03-09 08:16:06', '2022-03-09 08:16:06'),
(2, 1, 'Campaign 2', 'short_description', 'DEsc', 'perks 1, disini 2, disini 3', 0, 150000000, 0, 'campaign-2', '2022-03-09 08:16:06', '2022-03-09 08:16:06'),
(3, 2, 'Campaign 3', 'short_description', 'DEsc', 'perks 1, disini 2, disini 3', 0, 150000000, 0, 'campaign-3', '2022-03-09 08:16:06', '2022-03-09 08:16:06'),
(4, 3, 'Campaign 4', 'short_description', 'DEsc', 'perks 1, disini 2, disini 3', 0, 150000000, 0, 'campaign-4', '2022-03-09 08:16:06', '2022-03-09 08:16:06'),
(5, 1, 'Penggalangan Dana Startup', 'Short', 'Longgg', 'Hadiah satu, dua, dan tiga', 0, 1000000, 0, 'penggalangan-dana-startup-s-int-1', '2022-03-10 09:13:55', '2022-03-10 09:13:55'),
(6, 1, 'Penggalangan Dana Startup', 'Short', 'Longgg', 'Hadiah satu, dua, dan tiga', 0, 1000000, 0, 'penggalangan-dana-startup-1', '2022-03-10 09:50:25', '2022-03-10 09:50:25'),
(8, 5, 'Pembangunan Masjid', 'deskripsi singkat', 'Penjelasan detail campaign', 'keuntungan satu, duam dam tiga', 0, 1000000000, 0, 'pembangunan-masjid-5', '2022-03-10 12:39:30', '2022-03-10 12:39:30'),
(9, 6, 'Pembangunan Masjid Jabung 5', 'deskripsi singkat updated5', 'Penjelasan detail campaign updated5', 'keuntungan satu, duam dam tiga, empat, lima', 0, 1200000000, 0, 'pembangunan-masjid-6', '2022-03-10 12:43:59', '2022-03-10 14:44:51');

-- --------------------------------------------------------

--
-- Table structure for table `campaign_images`
--

CREATE TABLE `campaign_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `is_primary` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campaign_images`
--

INSERT INTO `campaign_images` (`id`, `campaign_id`, `file_name`, `is_primary`, `created_at`, `updated_at`) VALUES
(1, 1, 'gambar1.jpg', 0, '2022-03-09 08:26:01', '2022-03-11 20:50:57'),
(2, 1, 'gambarori.jpg', 0, '2022-03-09 08:26:01', '2022-03-11 20:50:57'),
(3, 1, 'gambar2.jpg', 0, '2022-03-09 08:26:01', '2022-03-11 20:50:57'),
(4, 2, 'images/campaign/5-cbimage.png', 1, '2022-03-11 20:42:25', '2022-03-11 20:50:57'),
(5, 1, 'images/campaign/5-71772228_1795841960715269_2609230939133313024_n.jpg', 0, '2022-03-11 20:43:56', '2022-03-11 20:50:57'),
(6, 1, 'images/campaign/5-sejarah.png', 1, '2022-03-11 20:50:57', '2022-03-11 20:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `payment_url` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `campaign_id`, `user_id`, `amount`, `status`, `code`, `payment_url`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 100000, 'paid', NULL, '', '2022-03-12 09:38:37', '2022-03-12 09:38:37'),
(2, 2, 5, 150000, 'pending', NULL, '', '2022-03-12 09:38:37', '2022-03-12 09:38:37'),
(3, 3, 6, 550000, 'pending', NULL, '', '2022-03-12 09:38:37', '2022-03-12 09:38:37'),
(4, 3, 6, 5000000, 'pending', '', '', '2022-03-17 14:36:33', '2022-03-17 14:36:33'),
(5, 3, 6, 5000000, 'pending', '', '', '2022-03-17 14:47:24', '2022-03-17 14:47:24'),
(6, 6, 6, 30000000, 'pending', '', '', '2022-03-17 14:49:42', '2022-03-17 14:49:42'),
(7, 3, 6, 5000000, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/0997822c-4dc3-4b90-9576-f8a0387626eb', '2022-03-18 09:36:54', '2022-03-18 09:36:54'),
(8, 6, 6, 1234567, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/fe577542-f4da-41c4-8813-5b1707a45871', '2022-03-18 09:37:15', '2022-03-18 09:37:15'),
(9, 6, 6, 99999, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/47ee69a7-3cb6-46f9-9c0d-ba3a98aa4ee9', '2022-03-18 09:38:38', '2022-03-18 09:38:39'),
(10, 3, 6, 5000000, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/106cfd85-f56c-4a88-961e-450c5eaf1290', '2022-03-18 17:04:31', '2022-03-18 17:04:33'),
(11, 6, 6, 321321, 'pending', '', 'https://app.sandbox.midtrans.com/snap/v2/vtweb/5e79fd41-9921-4a76-8f48-71bb079dd2c1', '2022-03-18 17:04:37', '2022-03-18 17:04:37'),
(12, 3, 6, 5000000, 'pending', '', '', '2022-03-19 10:16:30', '2022-03-19 10:16:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `occupation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `occupation`, `email`, `password_hash`, `avatar_file_name`, `role`, `token`, `created_at`, `updated_at`) VALUES
(1, 'Rulee', 'Programmer', 'rully@gmail.com', 'qwe123', 'images/1-bukti.jpeg', 'user', NULL, '2022-02-27 20:28:40', '2022-03-08 08:51:36'),
(2, 'Yustaf', 'Tentara', 'rully@gmail.com', 'qwe123', '', 'user', NULL, '2022-02-27 20:28:40', '2022-02-27 20:28:40'),
(3, 'Test Simpan', '', '', '', '', '', NULL, '2022-03-03 08:06:20', '2022-03-03 08:06:20'),
(4, 'from service', 'IT', 'service@gmail.com', '$2a$04$V.MyUpZQYv5FrYKD/A.HbeUCTPciGEJ0T0HuY0nJh31VLwbVDLJVe', '', 'user', NULL, '2022-03-03 08:57:54', '2022-03-03 08:57:54'),
(5, 'Name dari POSTMAN', 'Pro', 'email@domain.com', '$2a$04$a.zVewiaU0SZzPYI7oiUhuhpg4dMuwOGQgevZj5AOp9/RC.UkSMki', 'images/5-bukti.jpeg', 'user', NULL, '2022-03-03 16:53:08', '2022-03-08 08:57:10'),
(6, 'Nugroho', 'Programmer', 'nugroho@domain.com', '$2a$04$tmXTn2ZyFysrQbHGuKzNLeedjCJXxg9LI53hsd3VSnOP6J5hgyMyq', '', 'user', NULL, '2022-03-04 09:04:37', '2022-03-04 09:04:37'),
(7, 'RYN', 'Programmer2', 'RYN@domain.com', '$2a$04$toUmn/W32qbGD216SD6PUu1hsuPDJ/1I41BHKEci4t8JRSmeQdome', '', 'user', NULL, '2022-03-04 09:06:47', '2022-03-04 09:06:47'),
(8, 'RYN', 'Programmer2', 'RYN@domain.com', '$2a$04$FFGOnB1fxe.bsPNrztKwrOVmcT5kAgNmNFCf4nelF.taXcxKgI3Oq', '', 'user', NULL, '2022-03-04 09:28:50', '2022-03-04 09:28:50'),
(9, 'RYN', 'Programmer2', 'RYN@domain.com', '$2a$04$tdEDz1zRYH1YftoTdIvZE.BHAdYKEnF9rx0EKUJySKN/V/niCeOou', '', 'user', NULL, '2022-03-04 09:33:48', '2022-03-04 09:33:48'),
(10, 'RYN', 'Programmer2', 'RYN@domain.com', '$2a$04$LMS3b.yAgjxdOwT/6TZkKejd8yLQn8ZMe7zDWEZVrttDsyNm3YZwa', '', 'user', NULL, '2022-03-04 09:41:29', '2022-03-04 09:41:29'),
(11, 'RYN', 'Programmer2', 'RYN@domain.com', '$2a$04$Py03acN6PL/a/eUJzdygxeRjMLb/Xja4Wy.LYCXa60TyV5EPC6ltG', '', 'user', NULL, '2022-03-04 09:41:37', '2022-03-04 09:41:37'),
(12, 'test', 'test', 'test@gmail.com', '$2a$04$hs6PVvdY.AXrAFhQ3PgdQOP1bLffWDt.1Lf5zE6f5NZAtPofebL2y', '', 'user', NULL, '2022-03-04 17:41:11', '2022-03-04 17:41:11'),
(13, 'test', 'test', 'test@gmail.com', '$2a$04$YnJZhcPLH0bL6mn49CTiwe6.6QJu/2y0l0vLEn.84eDwxV1Auhp9m', '', 'user', NULL, '2022-03-05 08:25:47', '2022-03-05 08:25:47'),
(14, '', '', '', '$2a$04$6fjqThW0yhgfnf0LgqbFa.ItjUum0hzG/hTwYC.UQuiUER5NAxwTC', '', 'user', NULL, '2022-03-07 11:58:52', '2022-03-07 11:58:52'),
(15, '', '', '', '$2a$04$3k148/xvQlcW4B96NJskleGlvyFjS6BV/j.bXxGDVECUVOrD43G4m', '', 'user', NULL, '2022-03-07 15:58:52', '2022-03-07 15:58:52'),
(16, '', '', '', '$2a$04$tP18Rh23865zaIRMJnUcA.m2Sw.I4MG6e4/qI.rolCrufv61VPFGi', '', 'user', NULL, '2022-03-07 15:59:51', '2022-03-07 15:59:51'),
(17, '', '', '', '$2a$04$UpCljvErkMER4qExsz0UfurByyqXbCflXw9Q4sdr/M2jhfF.wDbt6', '', 'user', NULL, '2022-03-07 15:59:58', '2022-03-07 15:59:58'),
(18, '', '', '', '$2a$04$zKh2kTknUemN2qRv5P/S0e8VDNK8wW6bv.3.wWScd6NYtoHFTPTRi', '', 'user', NULL, '2022-03-07 15:59:59', '2022-03-07 15:59:59'),
(19, '', '', '', '$2a$04$SJl2zVOutgyuE7YL7j5tZOxD3rw0WF.3z1jDirZmgQwM3XqOIwl0y', '', 'user', NULL, '2022-03-07 16:07:02', '2022-03-07 16:07:02'),
(20, '', '', '', '$2a$04$5KUgjPo.ayHu7/ww91KMC./lkwDTGScaPkhr13bxoSKXblmZYRsQS', '', 'user', NULL, '2022-03-07 16:09:51', '2022-03-07 16:09:51'),
(21, '', '', '', '$2a$04$goYuyXDWZiFEig0YQ//xhuPmu074y0pjHnRk8Fo8wuI2hXLQossK2', '', 'user', NULL, '2022-03-07 16:10:31', '2022-03-07 16:10:31'),
(22, '', '', '', '$2a$04$twCTzl0/J5qo2zIIltHWv.miQxkCPsE1OW8lgEKSmSPrtMGyWkr4S', '', 'user', NULL, '2022-03-07 16:11:21', '2022-03-07 16:11:21'),
(23, 'test2', 'test2', 'test2@gmail.com', '$2a$04$d4UpDUklauU1FZe8Jn2DH.ByOLUmP3oR/x6xcWRLkYIs2gKhkiFKm', '', 'user', NULL, '2022-03-07 16:12:32', '2022-03-07 16:12:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `campaign_images`
--
ALTER TABLE `campaign_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `campaign_images`
--
ALTER TABLE `campaign_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
