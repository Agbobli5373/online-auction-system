-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2023 at 01:07 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auction_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(4) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', 'Admin1234');

-- --------------------------------------------------------

--
-- Table structure for table `auction`
--

CREATE TABLE `auction` (
  `a_id` int(8) NOT NULL,
  `p_id` varchar(40) NOT NULL,
  `start_time` datetime NOT NULL DEFAULT current_timestamp(),
  `end_time` datetime NOT NULL,
  `current_bid` int(10) NOT NULL,
  `wining_bidder` int(8) NOT NULL,
  `auction_status` enum('active','close') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bid_id` int(8) NOT NULL,
  `a_id` int(8) NOT NULL,
  `p_id` varchar(40) NOT NULL,
  `u_id` int(8) NOT NULL,
  `bid_amount` int(10) NOT NULL,
  `bid_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `complaint_id` int(8) NOT NULL,
  `complaint_description` text NOT NULL,
  `u_id` int(8) NOT NULL,
  `status` enum('accepted','declined','pending','completed') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Table structure for table `item_category`
--

CREATE TABLE `item_category` (
  `c_id` int(8) NOT NULL,
  `category_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_category`
--

INSERT INTO `item_category` (`c_id`, `category_name`) VALUES
(5, 'Electronics'),
(6, 'Bikes'),
(7, 'Mobile & Tablets'),
(8, 'Furniture'),
(9, 'Books, Sports & Hobbies'),
(10, 'Laptops & Computers'),
(11, 'Vehicles');

-- --------------------------------------------------------

--
-- Table structure for table `item_subcategory`
--

CREATE TABLE `item_subcategory` (
  `c_id` int(8) NOT NULL,
  `subcategory_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_subcategory`
--

INSERT INTO `item_subcategory` (`c_id`, `subcategory_name`) VALUES
(10, 'Hard Disk, Printers & Monitors'),
(11, 'Commercial & other Vehicles'),
(6, 'Bicycle'),
(10, 'Laptops'),
(5, 'TV'),
(5, 'Camera'),
(8, 'Sofa & Dining'),
(10, 'Computers'),
(9, 'Books'),
(8, 'Beds & Wardrobes'),
(9, 'Gym & Fittness'),
(7, 'Tablets'),
(7, 'Smartphones'),
(8, 'Tables'),
(7, 'Mobile & Tablets Asscessories'),
(5, 'Fridge');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `p_id` varchar(40) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_desc` text NOT NULL,
  `category` int(8) NOT NULL,
  `subcategory` varchar(40) NOT NULL,
  `price` int(10) NOT NULL,
  `googlepay_ss` longblob DEFAULT NULL,
  `confirm` enum('done','pending','recieved','cod') NOT NULL DEFAULT 'pending',
  `paid_amount` int(10) NOT NULL,
  `owner` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `product_imgs`
--

CREATE TABLE `product_imgs` (
  `p_id` varchar(40) NOT NULL,
  `product_imgs` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `contact_no` bigint(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(300) NOT NULL,
  `account_status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0="Blocked",1="Active"',
  `otp` varchar(100) NOT NULL,
  `verification` enum('Verified','Unverified') NOT NULL DEFAULT 'Unverified'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `users_imgs`
--

CREATE TABLE `users_imgs` (
  `u_id` int(8) NOT NULL,
  `profile_pic` longblob NOT NULL,
  `qrcode_pic` longblob DEFAULT NULL,
  `verify` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_imgs`
--
--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`a_id`),
  ADD KEY `pid_fk` (`p_id`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bid_id`),
  ADD KEY `aid_fk` (`a_id`),
  ADD KEY `pidfk` (`p_id`),
  ADD KEY `uid_fk` (`u_id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `uid` (`u_id`);

--
-- Indexes for table `item_category`
--
ALTER TABLE `item_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `item_subcategory`
--
ALTER TABLE `item_subcategory`
  ADD KEY `subcategory` (`c_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `cid_fk` (`category`),
  ADD KEY `uidfk` (`owner`);

--
-- Indexes for table `product_imgs`
--
ALTER TABLE `product_imgs`
  ADD KEY `productid_fk` (`p_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_imgs`
--
ALTER TABLE `users_imgs`
  ADD KEY `u_id_fk` (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auction`
--
ALTER TABLE `auction`
  MODIFY `a_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bid_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `complaint_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `item_category`
--
ALTER TABLE `item_category`
  MODIFY `c_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auction`
--
ALTER TABLE `auction`
  ADD CONSTRAINT `pid_fk` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `aid_fk` FOREIGN KEY (`a_id`) REFERENCES `auction` (`a_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pidfk` FOREIGN KEY (`p_id`) REFERENCES `products` (`p_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `uid_fk` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `uid` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_subcategory`
--
ALTER TABLE `item_subcategory`
  ADD CONSTRAINT `subcategory` FOREIGN KEY (`c_id`) REFERENCES `item_category` (`c_id`) ON DELETE NO ACTION;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `cid_fk` FOREIGN KEY (`category`) REFERENCES `item_category` (`c_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `uidfk` FOREIGN KEY (`owner`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_imgs`
--
ALTER TABLE `users_imgs`
  ADD CONSTRAINT `u_id_fk` FOREIGN KEY (`u_id`) REFERENCES `users` (`u_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
