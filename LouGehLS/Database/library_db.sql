-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2020 at 02:33 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `b.copy`
--

CREATE TABLE `b.copy` (
  `cpy_no` varchar(10) NOT NULL,
  `ISBN` varchar(8) DEFAULT NULL,
  `shelfx` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `b.copy`
--

INSERT INTO `b.copy` (`cpy_no`, `ISBN`, `shelfx`) VALUES
('001', 'AB1', 'shelf1e'),
('002', 'AB1', 'shelf1e'),
('003', 'AB1', 'shelf1e'),
('004', 'AB1', 'shelf1e'),
('005', 'AB2', 'shelf2e'),
('006', 'AB2', 'shelf2e'),
('007', 'AB2', 'shelf2e'),
('008', 'AB3', 'shelf3e'),
('009', 'AB3', 'shelf3e');

-- --------------------------------------------------------

--
-- Table structure for table `b.returned`
--

CREATE TABLE `b.returned` (
  `rdr_no` int(11) NOT NULL,
  `cpy_no` varchar(10) DEFAULT NULL,
  `rtrn_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `b.returned`
--

INSERT INTO `b.returned` (`rdr_no`, `cpy_no`, `rtrn_date`) VALUES
(2, '005', '2020-06-27');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ISBN` varchar(8) NOT NULL,
  `pub_year` int(4) DEFAULT NULL,
  `b_title` varchar(100) DEFAULT NULL,
  `b_author` varchar(100) DEFAULT NULL,
  `no_pages` int(10) DEFAULT NULL,
  `cat_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`ISBN`, `pub_year`, `b_title`, `b_author`, `no_pages`, `cat_name`) VALUES
('AB1', 2006, 'Life of Pi', 'Yann Martel', 450, 'Adventure'),
('AB2', 1998, 'To Kill a Mockingbird', 'Harper Lee', 500, 'Classics'),
('AB3', 2015, 'Watchmen', 'DComics', 1200, 'Comic');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_name`) VALUES
('Adventure'),
('Classics'),
('Comic');

-- --------------------------------------------------------

--
-- Table structure for table `publish`
--

CREATE TABLE `publish` (
  `b_title` varchar(100) NOT NULL,
  `p_name` varchar(100) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publish`
--

INSERT INTO `publish` (`b_title`, `p_name`, `location`) VALUES
('Life of Pi', 'Interna', 'General Santos City'),
('To Kill a Mockingbird', 'Jackrez', 'General Santos City'),
('Watchmen', 'Maximus', 'General Santos City');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `fam_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `b_date` date DEFAULT NULL,
  `rdr_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`fam_name`, `first_name`, `city`, `b_date`, `rdr_no`) VALUES
('Frost', 'Jack', 'Gensan', '1989-12-27', 1),
('Maximus', 'Max', 'Calumpang', '1997-06-11', 2),
('Leaf', 'Freaz', 'Quilans', '2001-01-02', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `b.copy`
--
ALTER TABLE `b.copy`
  ADD PRIMARY KEY (`cpy_no`),
  ADD KEY `b.copy_ibfk_1` (`ISBN`);

--
-- Indexes for table `b.returned`
--
ALTER TABLE `b.returned`
  ADD KEY `rdr_no` (`rdr_no`),
  ADD KEY `cpy_no` (`cpy_no`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`),
  ADD KEY `books_ibfk_1` (`cat_name`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_name`);

--
-- Indexes for table `publish`
--
ALTER TABLE `publish`
  ADD PRIMARY KEY (`b_title`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`rdr_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `rdr_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `b.copy`
--
ALTER TABLE `b.copy`
  ADD CONSTRAINT `b.copy_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `books` (`ISBN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `b.returned`
--
ALTER TABLE `b.returned`
  ADD CONSTRAINT `b.returned_ibfk_1` FOREIGN KEY (`rdr_no`) REFERENCES `user` (`rdr_no`),
  ADD CONSTRAINT `b.returned_ibfk_2` FOREIGN KEY (`cpy_no`) REFERENCES `b.copy` (`cpy_no`);

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`cat_name`) REFERENCES `category` (`cat_name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
