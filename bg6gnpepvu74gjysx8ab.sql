-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: bg6gnpepvu74gjysx8ab-mysql.services.clever-cloud.com:3306
-- Generation Time: Feb 09, 2023 at 12:14 AM
-- Server version: 8.0.22-13
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bg6gnpepvu74gjysx8ab`
--

-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE `Order` (
  `id` int UNSIGNED NOT NULL,
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_postcode` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Order`
--

INSERT INTO `Order` (`id`, `customer_first_name`, `customer_last_name`, `customer_address`, `customer_postcode`, `customer_city`, `customer_email`, `customer_phone`, `order_total`) VALUES
(1, 'Test', 'Testson', 'testgatan', '72496', 'testville', 'test@test123.com', '', 52),
(2, 'Test', 'Testson', 'testgatan', '72496', 'testville', 'test@test123.com', '', 52);

-- --------------------------------------------------------

--
-- Table structure for table `OrderItem`
--

CREATE TABLE `OrderItem` (
  `id` int UNSIGNED NOT NULL,
  `product_id` int UNSIGNED NOT NULL,
  `qty` int UNSIGNED NOT NULL,
  `item_price` int UNSIGNED NOT NULL,
  `item_total` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `OrderItem`
--

INSERT INTO `OrderItem` (`id`, `product_id`, `qty`, `item_price`, `item_total`, `order_id`) VALUES
(1, 1, 3, 12, 36, 1),
(2, 2, 2, 8, 16, 1),
(3, 1, 3, 12, 36, 2),
(4, 2, 2, 8, 16, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int UNSIGNED NOT NULL,
  `images` json NOT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_quantity` int UNSIGNED NOT NULL,
  `on_sale` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`id`, `name`, `description`, `price`, `images`, `stock_status`, `stock_quantity`, `on_sale`) VALUES
(1, 'Gott & Blandat Giants', '<p>En mix av lakrits och gelé med fruktsmak</p>\n<p>Innehållsförteckning: Socker, glukossirap, glukos-fruktossirap, stärkelse, VETEMJÖL, melass, syra (citronsyra), fuktighetsbevarande medel (sorbitoler, glycerol), lakritsextrakt, salt, vegetabiliska oljor (kokos, palm), aromer, färgämnen (E153, E120, E100, E141), ytbehandlingsmedel (bivax), stabiliseringsmedel (E471).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 12, '{\"large\": \"https://www.bortakvall.se//storage/products/1997509.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/1997509-300x300.png\"}', 'instock', 5, 0),
(2, 'Banana Bubs', '<p>Banan/gräddkola</p>\n<p>Innehållsförteckning: Glukos-fruktossirap, socker, majsstärkelse, vatten, surhetsreglerande medel (äppelsyra, natriumcitrat), potatisprotein, aromämnen, färgämnen: (E150d, E100), kokosolja, ytbehandlingsmedel (karnaubavax).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"https://www.bortakvall.se/storage/products/156622.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/156622-300x300.png\"}', 'instock', 8, 0),
(3, 'Banana Splits', '<p>Fyllig vitchoklad med smak av kola krispig banan.</p>\n<p>Innehållsförteckning: Socker, kakaosmör, torkad banan, HELMJÖLKSPULVER, mjölksocker(LAKTOS), SKUMMJÖLKSPULVER, emulgeringsmedel E322 (SOJALECITIN), naturliga aromer, ytbehandlingsmedel (E414, E904).</p>\n<p>Kan innehålla spår av MANDEL, NÖTTER och VETE.</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"https://www.bortakvall.se/storage/products/3827741.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/3827741-300x300.png\"}', 'instock', 6, 0),
(4, 'Ananas', '<p>Ananas</p>\n<p>Innehållsförteckning: Glukosirap, socker, majsstärkelse, gelatin, syror: citronsyra, aromämnen, vegetabiliska oljor (kokosnöt, palmkärna), glansmedel: bivax, carnaubavax, färger: E100, E133.</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 9, '{\"large\": \"https://www.bortakvall.se/storage/products/2147890-1.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/2147890-1-300x300.png\"}', 'outofstock', 0, 0),
(5, 'Bubs Cool Cola Skalle', '<p>Sur cola</p>\n<p>Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d).</p>\n<p><em>Alla priser är per skopa.</em></p>\n', 8, '{\"large\": \"https://www.bortakvall.se/storage/products/1595204.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `applied_steps_count`) VALUES
('588d0aaf-2d76-490b-8b0b-f2b5f99662d1', 'fdfebda0f16b9a2921bcecfce3095f397da0413384c2713500ca94c604e83929', '2023-02-09 00:04:32.492', '20230208234517_final_schema', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `OrderItem`
--
ALTER TABLE `OrderItem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OrderItem_product_id_fkey` (`product_id`),
  ADD KEY `OrderItem_order_id_fkey` (`order_id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Order`
--
ALTER TABLE `Order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `OrderItem`
--
ALTER TABLE `OrderItem`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `OrderItem`
--
ALTER TABLE `OrderItem`
  ADD CONSTRAINT `OrderItem_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `OrderItem_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
