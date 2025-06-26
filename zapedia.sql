-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2025 at 03:23 PM
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
-- Database: `zapedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `provider` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `provider`, `image`, `price`, `description`, `stock`) VALUES
(1, 'Netflix', 'Zapedia', 'gambar/netflix.png', '50000', 'Langganan 1 bulan Netflix Premium', 0),
(2, 'Spotify', 'Zapedia', 'gambar/spotify.png', '30000', 'Akun Spotify Individual Premium', 18),
(3, 'YouTube Premium', 'Zapedia', 'gambar/youtube.png', '45000', 'YouTube Premium bebas iklan', 18),
(4, 'Canva Premium', 'Zapedia', 'gambar/canva.png', '25000', 'Canva Premium akses 1 bulan', 28),
(5, 'Bstation', 'Zapedia', 'gambar/bstation.jpeg', '20000', 'Akun premium Bstation 1 bulan', 16);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `tanggal` datetime DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'pending',
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `user`, `product_id`, `quantity`, `tanggal`, `status`, `total_harga`) VALUES
(56, 'falentino', 1, 1, '2025-06-20 15:13:17', 'selesai', 0),
(57, 'falentino', 1, -1, '2025-06-20 15:15:06', 'selesai', 0),
(58, 'zuton', 1, 1, '2025-06-26 07:47:40', 'pending', 0),
(59, 'zuton', 2, 1, '2025-06-26 07:47:50', 'selesai', 0),
(60, 'zuton', 1, 1, '2025-06-26 02:48:22', 'pending', 0),
(61, 'zuton', 2, 1, '2025-06-26 02:48:22', 'pending', 0),
(62, 'zuton', 1, 1, '2025-06-26 02:50:36', 'pending', 0),
(63, 'zuton', 2, 1, '2025-06-26 02:50:36', 'pending', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ulasan`
--

CREATE TABLE `ulasan` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `komentar` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaksi_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ulasan`
--

INSERT INTO `ulasan` (`id`, `product_id`, `user_id`, `rating`, `komentar`, `created_at`, `transaksi_id`) VALUES
(26, 1, 11, 5, 'mantapp', '2025-06-20 06:49:44', 50),
(27, 1, 11, 5, 'top1', '2025-06-20 06:50:08', 51),
(28, 1, 12, 5, 'gokil', '2025-06-20 06:53:12', 55),
(29, 1, 13, 5, 'mantappp', '2025-06-20 08:13:52', 56),
(30, 1, 13, 5, '1', '2025-06-20 08:15:32', 57),
(31, 2, 4, 5, 'mantapppp', '2025-06-26 00:51:05', 59);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`) VALUES
(1, 'bunadimarvel50@gmail.com', 'marvel', '$2y$10$t8KSkprissXc7zM55VZEn.ioNlzzZftSSGtCXe8W7h59HJU7KFNhO'),
(2, 'marveljbunadi@gmail.com', 'mpell', '$2y$10$nG2L74VeixBAraixr3dtZObsxu7bOSiaXtdwfnj3NEiD6vbSpFWc6'),
(3, 'marveljbunadi@gmail.com', 'marvel', '$2y$10$M.sK89FX5sxfRk74owUFVe8Nmjw7NAeuQYRmlVem/corAXXHubRle'),
(4, 'bunadimarvel@gmail.com', 'zuton', '$2y$10$27q9DHM3Hzz0GbEvMI.H/upfMEQK3QjHUgzgihChnSEfCLN82HhPS'),
(5, 'bunadimarvel50@gmail.com', 'marvel7', '$2y$10$RQMldZDXTimmDlAQ/Gmbbe3MqfhAmr3EEqtZQT9Ftgdz5UV9aY/82'),
(7, 'bunadimarvel50@gmail.com', 'marpel', '$2y$10$XFCJLdUsk.O3RL5nODr.6OOUqT1moBzpAvRm5O.KnfOTme..mhTxG'),
(8, 'marveljbunadi@gmail.com', 'asep', '$2y$10$HSK3SxnsU9wjJXYtP0Klm.O3H3b5SSHCgGq2n2IlfKx0Z/29kFYRy'),
(9, 'marveljbunadi@gmail.com', 'asep', '$2y$10$VOCdyIxAAg41En3V94LD8O9XqYkWTWY1.3DnCRKDmRuoth3Hq8mS2'),
(10, 'bunadimarvel50@gmail.com', 'marvel', '$2y$10$S5C5RwC.1cw.mPETdYkvsOOqaNc2D2PkowgJwKKEIZn2/eotz7V4u'),
(11, 'bunadimarvel@gmail.com', 'asepp', '$2y$10$8ImSKbclX8.5obJRK96FZujYeZ0VpVEslVtys83odhvExQpGshGXu'),
(12, 'mamanracing@gmail.com', 'maman', '$2y$10$EkAxOx.VfSSEUNHPc8T8tOXFFysHWhnGQh0jdM9MQBOvJ0t5CG.li'),
(13, 'felentino@gmail.com', 'falentino', '$2y$10$1h2rw7uv7gl95cp80Kh/5./MwSVDJjljjt91.XcBZczMMkad/5qPu'),
(14, 'bunadimarvel50@gmail.com', 'mavel', '$2y$10$0ByWSeTIcbkum8VImCAB/OsypAfyVghp7QYVLK9MZCrxgntHHulSa'),
(15, 'falentino@gmail.com', 'falentino', '$2y$10$dwf7K2WincHomDJJCAlSDeXjbupQCD29PzhjiBfgpcFEouTclKDpK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `ulasan`
--
ALTER TABLE `ulasan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `ulasan`
--
ALTER TABLE `ulasan`
  ADD CONSTRAINT `ulasan_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ulasan_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
