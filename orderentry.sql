-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2020 at 08:18 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orderentry`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` double NOT NULL,
  `cat_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`) VALUES
(0, 'Tidak Berkategori'),
(1, 'Kopi Arabika'),
(2, 'Kopi Robusta'),
(3, 'Kopi Luwak'),
(4, 'Kopi Pahit'),
(5, 'Kopi Santai');

-- --------------------------------------------------------

--
-- Table structure for table `orderitems`
--

CREATE TABLE `orderitems` (
  `order_num` int(11) DEFAULT NULL,
  `prod_name` varchar(120) DEFAULT NULL,
  `prod_id` varchar(30) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `prod_price` double NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitems`
--

INSERT INTO `orderitems` (`order_num`, `prod_name`, `prod_id`, `quantity`, `prod_price`, `id_user`) VALUES
(1, 'Bergendal', '3', 1, 15000, 1),
(2, 'Arabika Colo', '2', 1, 14000, 1),
(2, 'Robusta Leluhur', '4', 1, 12000, 1),
(3, 'Arabika Colo', '2', 3, 14000, 1),
(3, 'Robusta Colo', '1', 2, 20000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_num` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_num`, `order_date`, `id_user`) VALUES
(1, '2020-04-10', 1),
(2, '2020-04-10', 1),
(3, '2020-04-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `productnotes`
--

CREATE TABLE `productnotes` (
  `note_id` char(9) DEFAULT NULL,
  `prod_id` varchar(30) DEFAULT NULL,
  `note_date` date DEFAULT NULL,
  `note_text` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(16) NOT NULL,
  `vend_id` char(11) NOT NULL,
  `prod_name` varchar(32) NOT NULL,
  `prod_price` int(11) NOT NULL,
  `prod_desc` text,
  `prod_img` varchar(120) DEFAULT 'default.jpg',
  `cat_id` int(10) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `vend_id`, `prod_name`, `prod_price`, `prod_desc`, `prod_img`, `cat_id`, `stock`) VALUES
(1, 'A001', 'Robusta Colo', 20000, 'Kopi robusta, merupakan keturunan dari beberapa jenis spesies kopi. Mengenai kualitas dari buah kopi, faktanya ini lebih rendah dibandingkan dengan kopi Arabika dan juga Liberika. Kopi jenis ini menguasai sekitar 30% pasar dunia.', '1.png', 2, 12),
(2, 'A001', 'Arabika Colo', 14000, 'Kopi jenis ini tumbuh pada daerah dengan ketinggian 700-1700 mdpl. Suhu yang dimiliki adalah 16-20 °C. Yang perlu diketahui mengenai jenis kopi ini adalah mengenai aspek kepekaan terhadap jenis penyakit karat daun atau lebih dikenal dengan HV atau Hemileia Vastatrix. Ini terutama bila ditanam pada daerah yang memiliki elevasi kurang dari 700 mdpl.', '2.png', 1, 10),
(3, 'A001', 'Bergendal', 15000, 'Kopi Bergendal adalah varietas kopi arabika dari kebun petani di Bener Meriah Provinsi Aceh. Bergendal sendiri terkenal setelah dinamai oleh Belanda. Menurut cerita petani sekitar, di tempat inilah Belanda menanam kopi pertama kali di Indonesia.', '3.png', 1, 7),
(4, 'A001', 'Robusta Leluhur', 12000, 'Kopi robusta, merupakan keturunan dari beberapa jenis spesies kopi. Mengenai kualitas dari buah kopi, faktanya ini lebih rendah dibandingkan dengan kopi Arabika dan juga Liberika. Kopi jenis ini menguasai sekitar 30% pasar dunia.', '4.png', 2, 8),
(5, 'A001', 'Papandayan', 15000, 'Sesuai dengan namanya, kopi ini muncul dari Gunung Papandayan. Kopi asal Garut ini sudah mendunia dengan kopi Arabica dengan Indikasi Geografis (IG) Gunung Papandayan. Kopi yang berasal dari IG Papandayan berada di tiga kecamatan, yaitu Cisurupan, Cikajang dan Pamulihan. Proses pembudidayaannya mengacu pada elevasi pegunungan di atas 1.000 MDPL.', '5.png', 5, 5),
(6, 'A001', 'Kepahiang', 18000, 'Kopi Baru', '6.png', 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `j_kel` varchar(11) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `uname` varchar(32) NOT NULL,
  `pw` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `email`, `alamat`, `j_kel`, `nohp`, `uname`, `pw`) VALUES
(1, 'Noor Faizin', 'faiz.jetak@gmail.com', 'Jetak Kedungdowo Rt01/05 kec.Kaliwungu, kab.Kudus, Jawa Tengah', 'Laki - Laki', '089504468800', 'noorfaizin', '9d4d4ab0dfdb72a54b895d78b90b09c7');

-- --------------------------------------------------------

--
-- Table structure for table `users_admin`
--

CREATE TABLE `users_admin` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_admin`
--

INSERT INTO `users_admin` (`id_user`, `nama`, `email`, `username`, `password`) VALUES
(1, 'Noor Faizin', 'faiz.jetak@gmail.com', 'noorfaizin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `vend_id` char(12) DEFAULT NULL,
  `vend_name` varchar(75) DEFAULT NULL,
  `vend_address` varchar(90) DEFAULT NULL,
  `vend_city` varchar(60) DEFAULT NULL,
  `vend_state` varchar(15) DEFAULT NULL,
  `vend_zip` varchar(21) DEFAULT NULL,
  `vend_country` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`,`email`,`uname`);

--
-- Indexes for table `users_admin`
--
ALTER TABLE `users_admin`
  ADD PRIMARY KEY (`id_user`,`email`,`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users_admin`
--
ALTER TABLE `users_admin`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
