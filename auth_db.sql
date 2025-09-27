-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2025 at 06:54 PM
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
-- Database: `auth_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`user_id`, `product_id`, `quantity`) VALUES
(1, 1, 2),
(1, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Books'),
(3, 'Laptops'),
(2, 'Phones');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `old_price` decimal(10,2) NOT NULL,
  `new_price` decimal(10,2) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `old_price`, `new_price`, `image_path`, `created_at`) VALUES
(1, 'How to Share an Egg : A True Story of Hunger, Love, and Plenty', 1, 17.00, 14.00, 'books-1.jpg', '2025-09-27 11:15:42'),
(2, 'Penitence : A Novel', 1, 21.19, 18.89, 'books-2.jpg', '2025-09-27 11:15:42'),
(3, 'The Owl Who Came for Christmas', 1, 10.25, 9.45, 'books-3.jpg', '2025-09-27 11:15:42'),
(4, 'Cobweb', 1, 19.99, 17.99, 'books-4.jpg', '2025-09-27 11:15:42'),
(5, 'Heart of Darkness : \'As Powerful a Condemnation of Imperialism as Has Ever Been Written\'', 1, 13.87, 12.27, 'books-5.jpg', '2025-09-27 11:15:42'),
(6, 'The Crucible', 1, 40.77, 39.27, 'books-6.jpg', '2025-09-27 11:15:42'),
(7, 'Harry Potter and the Chamber of Secrets', 1, 29.99, 20.91, 'books-7.jpg', '2025-09-27 11:15:42'),
(8, 'The Alchemist', 1, 17.99, 14.42, 'books-8.jpg', '2025-09-27 11:15:42'),
(9, 'The Hound of the Baskervilles', 1, 16.18, 13.68, 'books-9.jpg', '2025-09-27 11:15:42'),
(10, 'The War of the Worlds', 1, 14.29, 12.79, 'books-10.jpg', '2025-09-27 11:15:42'),
(11, 'Long Shadows', 1, 29.00, 19.88, 'books-11.jpg', '2025-09-27 11:15:42'),
(12, 'Dream Town', 1, 29.00, 19.48, 'books-12.jpg', '2025-09-27 11:15:42'),
(13, 'Apple - iPhone 15 128GB (Unlocked) - Black', 2, 729.99, 679.99, 'phones-13.webp', '2025-09-27 11:15:42'),
(14, 'Google - Pixel 9a 128GB (Unlocked) - Obsidian', 2, 549.99, 499.19, 'phones-14.webp', '2025-09-27 11:15:42'),
(15, 'Samsung - Galaxy A16 5G 128GB (Unlocked) - Blue Black', 2, 239.99, 199.99, 'phones-15.webp', '2025-09-27 11:15:42'),
(16, 'Samsung - Galaxy S24 FE 128GB (Unlocked) - Gray', 2, 699.99, 649.99, 'phones-16.webp', '2025-09-27 11:15:42'),
(17, 'Google - Pixel 9 128GB (Unlocked) - Obsidian', 2, 829.99, 799.00, 'phones-17.webp', '2025-09-27 11:15:42'),
(18, 'Nokia - C300 32GB (Unlocked) - Blue', 2, 139.99, 109.99, 'phones-18.webp', '2025-09-27 11:15:42'),
(19, 'Samsung - Galaxy S25 Ultra 256GB (Unlocked) - Titanium Black', 2, 1299.99, 1049.99, 'phones-19.webp', '2025-09-27 11:15:42'),
(20, 'Samsung - Galaxy Z Fold7 256GB (Unlocked) - Blue Shadow', 2, 2399.99, 1999.99, 'phones-20.webp', '2025-09-27 11:15:42'),
(21, 'Tracfone - Motorola moto g play 2024 64GB Prepaid - Blue', 2, 39.99, 29.99, 'phones-21.webp', '2025-09-27 11:15:42'),
(22, 'Samsung - Galaxy Z Flip7 FE 128GB (Unlocked) - White', 2, 919.99, 899.99, 'phones-22.webp', '2025-09-27 11:15:42'),
(23, 'Samsung - Galaxy S22 Ultra 5G 256GB - Phantom Black', 2, 799.99, 675.49, 'phones-23.webp', '2025-09-27 11:15:42'),
(24, 'Apple - Refurbished - Excellent iPhone 12 Mini 5G 128GB (Unlocked) - Red', 2, 269.99, 229.99, 'phones-24.webp', '2025-09-27 11:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Kishar', 'deathgrin_964@live.com', '$2b$10$cMpue4Wtbr6JzOJBWk5freOwVcCXQtvHuu6BH/NWIquJbzYQ9saJS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
