-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2024 at 02:47 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `faruk`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `user_id`, `fullname`, `address`, `email`, `phone`, `city`, `state`, `zipcode`, `created_at`, `updated_at`) VALUES
(1, 2, 'test office', '55, rampura , dhaka, bangladesh', 'test@gmail.com', '4364747855', 'dhaka', 'rampura', '1412', '2024-05-21 00:02:01', '2024-05-21 00:02:01');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Fashion', '/storage/uploads/sqbYOabh1TqLF82K78L0Y7d0Vem7ddlKNWL6Tkrn.jpg', '2024-05-21 00:00:32', '2024-05-21 00:00:32');

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
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `product_id`, `url`, `created_at`, `updated_at`) VALUES
(1, 1, '/storage/uploads/jL3VKiaD0becRrm7QkxSN5UFM1956mPuBkUS8jXD.png', NULL, NULL),
(2, 1, '/storage/uploads/UGwXNCWMwrn6SPAECLiycm2tKSsk1S5Dv0UUmWtn.jpg', NULL, NULL),
(3, 1, '/storage/uploads/iG9Jr9jA5XjSQIiWQnvQDYTMb7a6GIaqypqkdbzH.jpg', NULL, NULL),
(4, 1, '/storage/uploads/I6eNEcVHOs3SUFBqXPNZOH6hWytvizP7auYaerBA.webp', NULL, NULL),
(5, 1, '/storage/uploads/ivS58KiEAwbMtRspuEIbCwilgd0PUx1v6xiJhXG5.jpg', NULL, NULL),
(6, 2, '/storage/uploads/4UuuZFJIij3CJ1WTmDRI8LdfEo6hCIRKL2O2db6r.jpg', NULL, NULL),
(7, 2, '/storage/uploads/OrGMpPLuYZxQPEeB0vmKIrQ2eJU8OeMg5YiTJfre.jpg', NULL, NULL);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_04_27_052548_create_categories_table', 1),
(6, '2024_04_28_091457_create_products_table', 1),
(7, '2024_04_28_091528_create_images_table', 1),
(8, '2024_05_04_063812_create_posts_table', 1),
(9, '2024_05_18_113449_create_addresses_table', 1),
(10, '2024_05_19_084128_create_orders_table', 1),
(11, '2024_05_19_091400_create_order_details_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `order_id`, `price`, `order_date`, `created_at`, `updated_at`) VALUES
(2, 2, 1, 'WnOwcD50S', 600, '2024-05-21', '2024-05-21 00:19:33', '2024-05-21 00:19:33'),
(3, 2, 1, 'XjDdcTX50', 600, '2024-05-21', '2024-05-21 00:20:12', '2024-05-21 00:20:12'),
(4, 2, 1, 'nzHQaxTbz', 600, '2024-05-21', '2024-05-21 02:34:13', '2024-05-21 02:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_charge` int(11) NOT NULL DEFAULT 0,
  `payment_method` varchar(255) DEFAULT 'cod',
  `payment_status` enum('pending','paid','due','cancel') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `delivery_charge`, `payment_method`, `payment_status`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 0, 'cod', 'pending', '2024-05-21 02:34:13', '2024-05-21 02:34:13');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'admin@gmail.com', 'e39cfc36b6892e3de5c18a764517b881d4a2b943a43bf0a05c44df5c25936d42', '[\"*\"]', NULL, NULL, '2024-05-21 00:00:18', '2024-05-21 00:00:18'),
(2, 'App\\Models\\User', 2, 'user@gmail.com', '24687d29ef36256f555c4817bd60aa112593b4382a18267b2d4488d4fd272a4e', '[\"*\"]', NULL, NULL, '2024-05-21 00:01:36', '2024-05-21 00:01:36'),
(3, 'App\\Models\\User', 1, 'admin@gmail.com', '59c00e21ea0b4a15221e49aed664dae0dc968df05da5c18332b9c58121e68c25', '[\"*\"]', NULL, NULL, '2024-05-21 02:42:23', '2024-05-21 02:42:23'),
(4, 'App\\Models\\User', 2, 'user@gmail.com', '61ec38f384fb55f8c0b99465421f09c298f1c6b0ff5494f05636ec0cdcd40fcd', '[\"*\"]', NULL, NULL, '2024-05-21 03:09:30', '2024-05-21 03:09:30'),
(5, 'App\\Models\\User', 1, 'admin@gmail.com', '26eccebd1f4faac33fa915c9496bf51ea7e624643bce636c272b9538690912a9', '[\"*\"]', NULL, NULL, '2024-05-21 03:17:34', '2024-05-21 03:17:34'),
(6, 'App\\Models\\User', 2, 'user@gmail.com', '07f048130a6e5dd5812159cb7502bdd30774c2326639db755c8cd14d7efe8c0c', '[\"*\"]', NULL, NULL, '2024-05-21 03:18:20', '2024-05-21 03:18:20'),
(7, 'App\\Models\\User', 1, 'admin@gmail.com', 'e932b733e0429e0da769103e6cff70e72c9012d21e8aade27363e4e15f0683f0', '[\"*\"]', NULL, NULL, '2024-05-21 03:49:50', '2024-05-21 03:49:50'),
(8, 'App\\Models\\User', 1, 'admin@gmail.com', '9a7a508b561648b096a5ed0b6fd5810360beb827e8f36be81fc6094ae8588a5f', '[\"*\"]', NULL, NULL, '2024-05-23 00:50:26', '2024-05-23 00:50:26'),
(9, 'App\\Models\\User', 1, 'admin@gmail.com', 'e8ad58952d96379b3649ac1cf40262791a0b3348f06058e05e5069f4d90c835d', '[\"*\"]', NULL, NULL, '2024-05-23 05:16:13', '2024-05-23 05:16:13'),
(10, 'App\\Models\\User', 1, 'admin@gmail.com', '95fcd772cfe1d11b7459a7c6dcf0eef18226c5831604dc4642c1bb514b17c5b8', '[\"*\"]', NULL, NULL, '2024-05-23 05:16:15', '2024-05-23 05:16:15');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `image`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, '/storage/uploads/BioLc2saNkIBVXyzzp5kV7yf4Nq5q0nDwEBjFEPN.jpg', 'Recusandae omnis consequatur asperiores.', 'Recusandae omnis consequatur asperiores.Recusandae omnis consequatur asperiores.Recusandae omnis consequatur asperiores.Recusandae omnis consequatur asperiores.Recusandae omnis consequatur asperiores.Recusandae omnis consequatur asperiores.', '2024-05-21 00:01:28', '2024-05-21 00:01:28');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `usa_price` varchar(255) NOT NULL,
  `bdt_price` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `description`, `usa_price`, `bdt_price`, `created_at`, `updated_at`) VALUES
(1, 1, 'T-Shirt', 'wehresr thehntajehr erhnj edhserdujt4resyh rehyte haered', '5.99', '600', '2024-05-21 00:01:15', '2024-05-21 00:01:15'),
(2, 1, 'Travel By air', 'kjlksjl kjlakdjl lkasj lkjsld osid lskjosidjof', '1500', '1000', '2024-05-23 01:35:53', '2024-05-23 01:35:53');

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
  `type` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '2024-05-21 00:00:00', '$2y$12$UkhqJ2T6Y4hCnf8tcZ5IT.JTkm3wGmugfiu0awLSddQgvWzN3sH7a', 1, 'amAbda3V5H', '2024-05-20 18:00:00', '2024-05-21 00:00:00'),
(2, 'User', 'user@gmail.com', '2024-05-21 00:00:00', '$2y$12$MN3pMuQzddAZWCGcVEcHGOOs8FiwjCLPoIvKrwTol.uU9ppD1SoFK', 0, 'J47Osi0Dt4', '2024-05-20 18:00:00', '2024-05-21 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_user_id_foreign` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_id_unique` (`order_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_address_id_foreign` (`address_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_app\models\order_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_address_id_foreign` FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_app\models\order_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
