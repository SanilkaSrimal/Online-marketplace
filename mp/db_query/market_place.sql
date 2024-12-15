-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2024 at 05:18 AM
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
-- Database: `market_place`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`, `updated_at`) VALUES
(22, 1, 5, 1, '2024-12-12 16:57:03'),
(23, 1, 9, 1, '2024-12-12 17:06:47');

-- --------------------------------------------------------

--
-- Table structure for table `maincategories`
--

CREATE TABLE `maincategories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maincategories`
--

INSERT INTO `maincategories` (`id`, `name`, `created_at`) VALUES
(2, 'Electronics', '2024-12-11 11:08:15'),
(3, 'Fashion', '2024-12-11 11:43:35'),
(6, 'Instruments', '2024-12-11 12:28:33'),
(7, 'Domestic', '2024-12-11 12:39:25'),
(8, 'Toys', '2024-12-12 16:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `quantity` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `created_at`, `quantity`, `product_id`) VALUES
(12, 3, 999.00, '2024-12-12 17:39:04', 1, 1),
(13, 3, 999.00, '2024-12-12 17:39:49', 1, 1),
(14, 3, 999.00, '2024-12-12 17:45:47', 1, 1),
(15, 3, 999.00, '2024-12-12 17:49:10', 1, 1),
(16, 3, 400.00, '2024-12-12 17:53:22', 1, 8),
(17, 3, 50.00, '2024-12-12 18:03:53', 1, 7),
(18, 3, 50.00, '2024-12-12 18:04:04', 1, 7),
(19, 1, 60.00, '2024-12-12 22:22:35', 1, 5),
(20, 1, 699.00, '2024-12-12 22:23:43', 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `subcategory_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `category_id`, `subcategory_id`) VALUES
(1, 'I phone 16 pro', 'Latest Iphone 16 pro 256GB', 999.00, 'iphone.jpg', 2, 2),
(2, 'T shirt', 'comfortable cotton t shirt', 30.00, 'tshirt.jpg', 3, 3),
(3, 'Fender bass guitar', 'fender bass ', 990.00, 'fender-american-professional-ii.jpg', 6, 5),
(4, 'Plant', 'plastic plant', 30.00, 'kentia-palm-tree-grey-pots-600nw.jpg', 7, 6),
(5, 'fish tank', '10 ltr fish bowl', 60.00, '635a53d1161068291647e736-betta-f.jpg', 7, 7),
(6, 'Nike Air Max 2023', 'comfortable nike shoe pair', 199.00, '-original-imah65w8nzgjz6xn.jpg', 3, 8),
(7, 'Stand Fan', 'Ahawal brand eke Fan ', 50.00, 'KSF-0118-BLACK.jpg', 7, 9),
(8, 'Asus Note book 14x', 'slim laptop by Asus', 400.00, 'microsoft-surface-laptop-138-tou.jpg', 2, 4),
(9, 'Sauvage perfume', 'Dior sauvage perfume ', 500.00, 'sauvage_homepage_tile_684x684_b8.jpg', 3, 10),
(10, 'Samsung S24 Ultra', 'Samsung S24 Ultra flagship mobile', 699.00, 'SMPHS928BC12256GBBLK 2.jpg', 2, 2),
(11, 'Nike Air Max 2017', 'Nike Air Max 2017 edition. Black and gray', 499.00, '666-500x500.jpg', 3, 8),
(12, 'Apple watch Ultra', 'Apple watch Ultra sport watch', 599.00, '10451-002_720X720.jpg', 2, 11),
(13, 'toy', 'car', 1200.00, '51RnmUGWpxL.jpg', 8, 12);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `review` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `main_category_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name`, `main_category_id`, `created_at`) VALUES
(2, 'smart phones', 2, '2024-12-11 11:15:17'),
(3, 'clothes', 3, '2024-12-11 12:27:28'),
(4, 'laptops', 2, '2024-12-11 12:27:41'),
(5, 'guitars', 6, '2024-12-11 12:29:14'),
(6, 'Plants', 7, '2024-12-11 12:39:43'),
(7, 'fish tank', 7, '2024-12-11 12:42:14'),
(8, 'Shoes', 3, '2024-12-11 12:52:14'),
(9, 'furnitures', 7, '2024-12-11 13:26:47'),
(10, 'Cosmatics', 3, '2024-12-12 03:37:55'),
(11, 'Smart watches', 2, '2024-12-12 03:53:26'),
(12, 'cars', 8, '2024-12-12 16:47:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `user_type` enum('buyer','seller','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `user_type`) VALUES

(2, 'themiya', '$2y$10$iUDkTLAVEea3EXw2QAvKjOr7fAyVfJwpIRdaXcxVMCjEOUGF1ByVW', 'sanilkasrimal02@gmail.com', 'seller'),
(3, 'randew', '$2y$10$6XbzA717iedKJ.iyYOv9A.kqQAxTRCWp4SSNTXW27zvtqj.z6LOBe', 'sanilkasrimal03@gmail.com', 'buyer'),
(4, 'Amara', '$2y$10$.8knkKOhfW/fzHd/3FMcmuUrCSDphuR3tqJb3M.ke.8GdQX72jL9G', 'sanilkasrimal04@gmail.com', 'buyer'),
(5, 'kamal', '$2y$10$XxVoal8fV0Fv9hLraOyd6e974LsnERDltuW8bHIS0A8kwMWjf7BVe', 'sanilkasrimal010@gmail.com', 'buyer'),
(6, 'nimal', '$2y$10$X8XWl7e7g/ZEr5tpChqF.e41Hzmg80Hqa040Rfxzl.mNDhcza6Y6G', 'sanilkasrimal041@gmail.com', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `maincategories`
--
ALTER TABLE `maincategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `subcategory_id` (`subcategory_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `main_category_id` (`main_category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `maincategories`
--
ALTER TABLE `maincategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `maincategories` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_ibfk_1` FOREIGN KEY (`main_category_id`) REFERENCES `maincategories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
