-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2021 at 12:52 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `showroom`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `CUST_ID` int(11) NOT NULL,
  `FNAME` char(20) DEFAULT NULL,
  `MNAME` char(20) DEFAULT NULL,
  `LNAME` char(20) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `ADHAAR_NO` varchar(20) DEFAULT NULL,
  `DLICENCE` varchar(20) DEFAULT NULL,
  `PAN_NO` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `GENDER` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_details`
--

INSERT INTO `customer_details` (`CUST_ID`, `FNAME`, `MNAME`, `LNAME`, `ADDRESS`, `PHONE`, `ADHAAR_NO`, `DLICENCE`, `PAN_NO`, `EMAIL`, `GENDER`) VALUES
(1, 'MANTHAN', 'RAMACHANDRA', 'YADAV', '301,PANVELKAR VILLOGIYA,MAULI CHOWK,BADLAPUR(E)', '9876543210', '987654322345', '564365', 'MNO987654556', 'manthan1234@gmail.com', 'MALE'),
(2, 'yogesh', 'suresh', 'mhatre', '103,mohan plam,shivaji chowk,thane(w)', '9867453242', '678912345674', '123456', 'Jk3453746658', 'yogesh456@gmail.com', 'MALE'),
(3, 'nikhil', 'nivrutti', 'wane', 'kharabadi', '9158611071', '8295957982982', 'D768765275', 'AFFF772785', 'nikhil@gmail.com', 'MALE');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_details`
--

CREATE TABLE `invoice_details` (
  `invoice_no` int(11) DEFAULT NULL,
  `booking_date` varchar(20) DEFAULT NULL,
  `delivery_date` varchar(20) DEFAULT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `full_name` char(40) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `v_no` int(11) DEFAULT NULL,
  `v_model` varchar(20) DEFAULT NULL,
  `v_name` varchar(30) DEFAULT NULL,
  `v_manu` varchar(30) DEFAULT NULL,
  `engine_no` varchar(20) DEFAULT NULL,
  `chasis_no` varchar(20) DEFAULT NULL,
  `RCBOOK_NO` varchar(20) DEFAULT NULL,
  `engine_cap` varchar(10) DEFAULT NULL,
  `colors` varchar(20) DEFAULT NULL,
  `free_services` int(11) DEFAULT NULL,
  `payment_mode` varchar(10) DEFAULT NULL,
  `bank_name` varchar(40) DEFAULT NULL,
  `bank_ifcs_code` varchar(40) DEFAULT NULL,
  `cheque_date` varchar(40) DEFAULT NULL,
  `cheque_no` varchar(40) DEFAULT NULL,
  `price` varchar(20) DEFAULT NULL,
  `first_installment` varchar(10) DEFAULT NULL,
  `second_installment` varchar(10) DEFAULT NULL,
  `third_installment` varchar(10) DEFAULT NULL,
  `CGST` varchar(10) DEFAULT NULL,
  `SGST` varchar(10) DEFAULT NULL,
  `balance` varchar(10) DEFAULT NULL,
  `grand_total` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_details`
--

INSERT INTO `invoice_details` (`invoice_no`, `booking_date`, `delivery_date`, `cust_id`, `full_name`, `address`, `v_no`, `v_model`, `v_name`, `v_manu`, `engine_no`, `chasis_no`, `RCBOOK_NO`, `engine_cap`, `colors`, `free_services`, `payment_mode`, `bank_name`, `bank_ifcs_code`, `cheque_date`, `cheque_no`, `price`, `first_installment`, `second_installment`, `third_installment`, `CGST`, `SGST`, `balance`, `grand_total`) VALUES
(1, '15/9/2019', '25/9/2019', 1, 'MANTHAN RAMACHANDRA YADAV', '301,PANVELKAR VILLOGIYA,MAULI CHOWK,BADLAPUR(E)', 35, 'HONDA', 'NAVI', 'HONDA', '102EFDCVF', 'WER34VHJKGI', 'HGB98JK', '110', 'RED', 3, 'CHEQUE', 'SBI,KALYAN(W)', 'SBI123456', '15/9/2019', '432567', '47428', '20000', '20000', '0', '4268.52', '4268.52', '35965.04', '55965.04'),
(2, '7/6/2019', '9/6/2019', 2, 'yogesh suresh mhatre', '103,mohan plam,shivaji chowk,thane(w)', 7, 'BAJAJ', 'PLATINA 100', 'BAJAJ', '78GSFHKIYBN', 'FDSH43GDFHJ', 'GH5475L', '100', 'BLACK', 5, 'CHEQUE', 'AXIS BANK,KALYAN(W)', 'AXIS85445', '7/6/2019', '45327', '48500', '48500', '5000', '0', '4365', '4365', '3730', '57230'),
(3, 'null', 'null', 3, 'nikhil nivrutti wane', 'kharabadi', 1, 'BAJAJ', 'AVENGER STREET 220', 'BAJAJ', 'null', 'null', 'null', '220', 'BLACK', 5, 'null', 'null', 'null', 'null', 'null', '100000', '10000', '0', '0', '9000', '9000', 'NaN', '118000');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `USERNAME` varchar(20) DEFAULT NULL,
  `PASSWORD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`USERNAME`, `PASSWORD`) VALUES
('kartik', 'kartik');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_details`
--

CREATE TABLE `vehicle_details` (
  `VEHICLE_NO` int(11) NOT NULL,
  `V_MODEL` varchar(20) DEFAULT NULL,
  `V_NAME` varchar(30) DEFAULT NULL,
  `V_MANU` varchar(50) DEFAULT NULL,
  `ENGINE_CAP` varchar(10) DEFAULT NULL,
  `WHEEL_TYPE` varchar(10) DEFAULT NULL,
  `WEIGHT` varchar(10) DEFAULT NULL,
  `BHPOWER` varchar(10) DEFAULT NULL,
  `BREAKE_TYPE` varchar(20) DEFAULT NULL,
  `FUEL_CAP` varchar(10) DEFAULT NULL,
  `BATTERY` varchar(10) DEFAULT NULL,
  `MILEAGE` varchar(10) DEFAULT NULL,
  `COLORS` varchar(50) DEFAULT NULL,
  `PRICE` varchar(10) DEFAULT NULL,
  `FREE_SERVICES` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_details`
--

INSERT INTO `vehicle_details` (`VEHICLE_NO`, `V_MODEL`, `V_NAME`, `V_MANU`, `ENGINE_CAP`, `WHEEL_TYPE`, `WEIGHT`, `BHPOWER`, `BREAKE_TYPE`, `FUEL_CAP`, `BATTERY`, `MILEAGE`, `COLORS`, `PRICE`, `FREE_SERVICES`) VALUES
(1, 'BAJAJ', 'AVENGER STREET 220', 'BAJAJ', '220', 'ALLOY', '130 KG', '220', 'SINGLE DISK', '18', '230', '35', 'BLACK', '100000', 5),
(2, 'BAJAJ', 'CT 100', 'BAJAJ', '100', 'ALLOY', '85 KG', '100', 'AUTOTRUMP', '12', '230', '90', 'RED', '41000', 5),
(3, 'BAJAJ', 'DISCOVER 100', 'BAJAJ', '100', 'ALLOY', '98 KG', '100', 'AUTOTRUMP', '14', '230', '85', 'RED', '72000', 5),
(4, 'BAJAJ', 'DISCOVER 125', 'BAJAJ', '125', 'ALLOY', '110 KG', '125', 'SINGLE DISK', '13', '230', '85', 'RED', '62252', 5),
(5, 'BAJAJ', 'DISCOVER 150', 'BAJAJ', '150', 'ALLOY', '130 KG', '150', 'SINGLE DISK', '13', '230', '65', 'GREEN', '80000', 5),
(6, 'BAJAJ', 'DOMINAR 400', 'BAJAJ', '400', 'ALLOY', '150 KG', '400', 'DOUBLE DISK', '18', '260', '25', 'BLACK', '180000', 3),
(7, 'BAJAJ', 'PLATINA 100', 'BAJAJ', '100', 'ALLOY', '90 KG', '100', 'AUTOTRUMP', '10', '230', '110', 'BLACK', '48500', 5),
(8, 'BAJAJ', 'PLATINA 110', 'BAJAJ', '110', 'ALLOY', '95 KG', '110', 'AUTOTRUMP', '10', '230', '95', 'BLUE', '50515', 5),
(9, 'BAJAJ', 'PULSAR 150', 'BAJAJ', '150', 'ALLOY', '150 KG', '150', 'DOUBLE DISK', '18', '260', '35', 'RED', '98000', 3),
(10, 'BAJAJ', 'PULSAR 180F', 'BAJAJ', '180', 'ALLOY', '120 KG', '180', 'DOUBLE DISK', '18', '230', '30', 'RED', '95290', 3),
(11, 'BAJAJ', 'PULSAR 220F', 'BAJAJ', '220', 'ALLOY', '130 KG', '220', 'DOUBLE DISK', '18', '230', '25', 'WHITE', '100000', 3),
(12, 'BAJAJ', 'PULSAR NS160', 'BAJAJ', '160', 'ALLOY', '130 KG', '160', 'SINGLE DISK', '18', '230', '30', 'BLACK', '93000', 3),
(13, 'BAJAJ', 'PULSAR RS200', 'BAJAJ', '200', 'ALLOY', '120 KG', '200', 'DOUBLE DISK', '18', '230', '30', 'RED AND WHITE', '140000', 3),
(14, 'BAJAJ', 'AVENGER CRUISE 220', 'BAJAJ', '220', 'SPOKE', '100 KG', '220', 'DOUBLE DISK', '13', '230', '50', 'BLACK', '100000', 5),
(15, 'HERO', 'ACHIEVER', 'HERO', '150', 'ALLOY', '110 KG', '150', 'SINGLE DISK', '13', '230', '60', 'RED', '69550', 3),
(16, 'HERO', 'GLAMOUR', 'HERO', '125', 'ALLOY', '100 KG', '125', 'SINGLE DISK', '13', '230', '65', 'RED', '69950', 3),
(17, 'HERO', 'HF DELUXE', 'HERO', '110', 'ALLOY', '90 KG', '110', 'AUTOTRUMP', '10', '230', '70', 'RED', '49625', 3),
(18, 'HERO', 'KARIZMA ZMR', 'HERO', '200', 'ALLOY', '120 KG', '200', 'DOUBLE DISK', '18', '230', '60', 'WHITE', '100000', 3),
(19, 'HERO', 'PASSION PRO', 'HERO', '110', 'ALLOY', '110 KG', '110', 'SINGLE DISK', '13', '230', '65', 'RED', '56425', 3),
(20, 'HERO', 'PASSION XPRO', 'HERO', '110', 'ALLOY', '100 KG', '110', 'SINGLE DISK', '13', '230', '65', 'BLACK', '59250', 3),
(21, 'HERO', 'SPLENDOR PLUS', 'HERO', '125', 'ALLOY', '110 KG', '125', 'AUTOTRUMP', '10', '230', '60', 'BLACK', '55600', 3),
(22, 'HERO', 'SUPER SPLENDOR', 'HERO', '125', 'ALLOY', '120 KG', '125', 'AUTOTRUMP', '13', '230', '50', 'BLUE', '60250', 3),
(23, 'HERO', 'XPULSE 200', 'HERO', '200', 'SPOKE', '110 KG', '200', 'DOUBLE DISK', '13', '230', '50', 'WHITE', '100000', 3),
(24, 'HERO', 'XTREME 200R', 'HERO', '200', 'ALLOY', '100 KG', '200', 'DOUBLE DISK', '18', '230', '50', 'RED', '91900', 3),
(25, 'HERO', 'XTREME 200S', 'HERO', '200', 'ALLOY', '120 KG', '200', 'SINGLE DISK', '18', '230', '50', 'RED', '98400', 3),
(26, 'HERO', 'XTREME SPORT', 'HERO', '125', 'ALLOY', '120 KG', '125', 'SINGLE DISK', '13', '230', '55', 'RED', '69550', 3),
(27, 'HONDA', 'SHINE', 'HONDA', '125', 'ALLOY', '120 KG', '125', 'SINGLE DISK', '13', '230', '60', 'GREAY', '63927', 3),
(28, 'HONDA', 'CB HORNET', 'HONDA', '160', 'ALLOY', '130 KG', '160', 'DOUBLE DISK', '18', '230', '55', 'GREEN', '95078', 3),
(29, 'HONDA', 'CB UNICORN 150', 'HONDA', '150', 'ALLOY', '150 KG', '150', 'SINGLE DISK', '18', '230', '60', 'BLACK', '80000', 3),
(30, 'HONDA', 'SHINE SP', 'HONDA', '125', 'ALLOY', '120 KG', '125', 'SINGLE DISK', '13', '230', '65', 'GREEN', '68938', 3),
(31, 'HONDA', 'CBR 250R', 'HONDA', '250', 'ALLOY', '150 KG', '250', 'DOUBLE DISK', '18', '230', '30', 'RED', '195000', 3),
(32, 'HONDA', 'LIVO', 'HONDA', '110', 'ALLOY', '90 KG', '110', 'SINGLE DISK', '10', '230', '55', 'BLUE', '60627', 3),
(33, 'HONDA', 'CB UNICORN 160', 'HONDA', '160', 'ALLOY', '120 KG', '160', 'SINGLE DISK', '18', '230', '60', 'BLACK', '78332', 3),
(34, 'HONDA', 'DREAM YUGA', 'HONDA', '110', 'ALLOY', '100 KG', '110', 'AUTOTRUMP', '13', '230', '60', 'BLACK', '55512', 3),
(35, 'HONDA', 'NAVI', 'HONDA', '110', 'ALLOY', '70 KG', '110', 'AUTOTRUMP', '10', '230', '60', 'RED', '47428', 3),
(36, 'HONDA', 'CD 110 DREAM', 'HONDA', '110', 'ALLOY', '90 KG', '110', 'AUTOTRUMP', '10', '230', '65', 'BALCK', '51847', 3),
(37, 'HONDA', 'CBR 650R', 'HONDA', '650', 'ALLOY', '150 KG', '650', 'DOUBLE DISK', '18', '230', '30', 'RED', '770000', 3),
(38, 'HONDA', 'DREAM NEO', 'HONDA', '110', 'ALLOY', '90 KG', '110', 'AUTOTRUMP', '10', '230', '65', 'BLACK', '52908', 3),
(39, 'TVS', 'APACHE RTR 160', 'TVS', '160', 'ALLOY', '120 KG', '160', 'DOUBLE DISK', '18', '230', '60', 'WHITE', '88652', 3),
(40, 'TVS', 'APACHE RR 310', 'TVS', '310', 'ALLOY', '160 KG', '310', 'DOUBLE DISK', '18', '230', '30', 'RED', '227000', 3),
(41, 'TVS', 'APACHE RTR 180', 'TVS', '180', 'ALLOY', '120 KG', '180', 'DOUBLE DISK', '18', '230', '50', 'WHITE', '91291', 3),
(42, 'TVS', 'TVS SPORT', 'TVS', '110', 'ALLOY', '90 KG', '110', 'AUTOTRUMP', '10', '230', '90', 'WHITE', '49491', 3),
(43, 'TVS', 'TVS XL100', 'TVS', '100', 'null', 'SPOKE', '100', 'AUTOTRUMP', '8', '230', '60', 'RED', '39814', 3),
(44, 'TVS', 'RADEON', 'TVS', '110', 'ALLOY', '90 KG', '110', 'AUTOTRUMP', '10', '230', '80', 'WHITE', '50820', 3),
(45, 'TVS', 'STAR CITY PLUS', 'TVS', '125', 'ALLOY', '110 KG', '125', 'AUTOTRUMP', '13', '230', '70', 'RED', '55300', 3),
(46, 'TVS', 'VICTOR', 'TVS', '110', 'ALLOY', '100 KG', '110', 'SINGLE DISK', '13', '230', '70', 'BLUE', '57662', 3),
(47, 'RE', 'CLASSIC 350', 'RE', '350', 'SPOKE', '200 KG', '350', 'SINGLE DISK', '18', '260', '40', 'GREAY', '163000', 2),
(48, 'RE', 'BULLET 350', 'RE', '350', 'SPOKE', '250 KG', '350', 'AUTOTRUMP', '18', '260', '35', 'BLACK', '135000', 2),
(49, 'RE', 'HIMALAYAN', 'RE', '500', 'SPOKE', '150 KG', '500', 'DOUBLE DISK', '13', '230', '50', 'WHITE', '182000', 2),
(50, 'RE', 'CLASSIC 500', 'RE', '500', 'SPOKE', '200 KG', '500', 'SINGLE DISK', '18', '260', '45', 'BLACK', '216000', 2),
(51, 'RE', 'BULLET 500', 'RE', '500', 'SPOKE', '180 KG', '500', 'SINGLE DISK', '13', '230', '40', 'BLACK', '188000', 2),
(52, 'RE', 'THUNDERBIRD 500', 'RE', '500', 'SPOKE', '1.60 KG', '500', 'SINGLE DISK', '13', '230', '45', 'BLACK', '214000', 2),
(53, 'KTM', 'DUKE 200', 'KTM', '200', 'ALLOY', '90 KG', '200', 'DOUBLE DISK', '13', '230', '35', 'ORENGE', '162000', 3),
(54, 'KTM', 'DUKE 125', 'KTM', '125', 'ALLOY', '90 KG', '125', 'DOUBLE DISK', '13', '230', '30', 'WHITE ', '130000', 3),
(55, 'KTM', 'RC 200', 'KTM', '200', 'ALLOY', '130 KG', '200', 'DOUBLE DISK', '13', '230', '35', 'BLACK', '190000', 2),
(56, 'KTM', 'DUKE 250', 'KTM', '250', 'ALLOY', '110 KG', '250', 'DOUBLE DISK', '13', '230', '20', 'WHITE', '197000', 2),
(57, 'KTM', 'RC 125', 'KTM', '125', 'ALLOY', '120 KG', '125', 'DOUBLE DISK', '13', '230', '28', 'WHITE', '147000', 2),
(58, 'YAMAHA', 'R 15', 'YAMAHA', '200', 'ALLOY', '140 KG', '200', 'DOUBLE DISK', '18', '230', '30', 'RED', '142000', 3),
(59, 'YAMAHA', 'YAMAHA FZ', 'YAMAHA', '150', 'ALLOY', '110 KG', '150', 'SINGLE DISK', '18', '230', '50', 'SKY', '96180', 3),
(60, 'YAMAHA', 'YAMAHA FZ FI', 'YAMAHA', '200', 'ALLOY', '130 KG', '200', 'DOUBLE DISK', '13', '230', '40', 'BLUE', '98180', 3),
(61, 'YAMAHA', 'YAMAHA SZ', 'YAMAHA', '150', 'ALLOY', '120 KG', '150', 'SINGLE DISK', '13', '230', '50', 'BLACK', '70653', 3),
(62, 'YAMAHA', 'FAZER', 'YAMAHA', '250', 'ALLOY', '150 KG', '250', 'DOUBLE DISK', '18', '230', '30', 'GREAY', '144000', 3),
(63, 'YAMAHA', 'SALUTO', 'YAMAHA', '125', 'ALLOY', '100 KG', '125', 'AUTOTRUMP', '13', '230', '50', 'RED', '61580', 3),
(64, 'KAWASAKI', 'NINJA 300', 'KAWASAKI', '300', 'ALLOY', '130 KG', '300', 'DOUBLE DISK', '23', '230', '20', 'GREEN', '298000', 2),
(65, 'KAWASAKI', 'NINJA H2', 'KAWASAKI', '1000', 'ALLOY', '160 KG', '1000', 'TRIPLE DISK', '23', '260', '15', 'GREAY', '7580000', 2),
(66, 'KAWASAKI', 'NINJA 650', 'KAWASAKI', '650', 'ALLOY', '120 KG', '650', 'DOUBLE DISK', '18', '230', '20', 'WHITE', '599000', 2),
(67, 'KAWASAKI', 'NINJA 400', 'KAWASAKI', '400', 'ALLOY', '130 KG', '400', 'DOUBLE DISK', '23', '260', '15', 'GREEN', '499000', 2),
(68, 'KAWASAKI', 'NINJA 1000', 'KAWASAKI', '1000', 'ALLOY', '160 KG', '1000', 'TRIPLE DISK', '23', '260', '12', 'BLACK', '1029000', 2),
(69, 'KAWASAKI', 'VULCAN S', 'KAWASAKI', '650', 'ALLOY', '200 KG', '650', 'DOUBLE DISK', '18', '260', '20', 'BLACK', '560000', 2),
(70, 'KAWASAKI', 'KAWASAKI W800', 'KAWASAKI', '800', 'SPOKE', '170 KG', '800', 'DOUBLE DISK', '18', '230', '25', 'WHITE', '800000', 2),
(71, 'SUZUKI', 'GIXXER 250', 'SUZUKI', '250', 'ALLOY', '140 KG', '250', 'DOUBLE DISK', '18', '230', '40', 'GREAY', '159000', 3),
(72, 'SUZUKI', 'HAYABUSA', 'SUZUKI', '1300', 'ALLOY', '180 KG', '1300', 'TRIPLE DISK', '23', '260', '15', 'WHITE', '1374000', 3),
(73, 'SUZUKI', 'GIXXER SF 250', 'SUZUKI', '250', 'ALLOY', '160 KG', '250', 'DOUBLE DISK', '23', '260', '20', 'WHITE', '110000', 3),
(74, 'SUZUKI', 'INTRUDER', 'SUZUKI', '150', 'ALLOY', '140 KG', '150', 'DOUBLE DISK', '18', '230', '50', 'BLACK', '100000', 3),
(75, 'SUZUKI', 'V STROM 1000', 'SUZUKI', '1000', 'ALLOY', '130 KG', '1000', 'TRIPLE DISK', '18', '230', '10', 'RED', '1345000', 3),
(76, 'BAJAJ', 'PULSAR NS200', 'BAJAJ', '200', 'ALLOY', '110 KG', '200', 'DISK', '18', '230', '30', 'RED', '100000', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer_details`
--
ALTER TABLE `customer_details`
  ADD PRIMARY KEY (`CUST_ID`);

--
-- Indexes for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
  ADD PRIMARY KEY (`VEHICLE_NO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
