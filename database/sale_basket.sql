-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 09, 2020 at 04:59 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sale_basket`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Incense Sticks', '2020-09-08 08:44:44', '2020-09-08 08:44:44'),
(2, 'Scented Oils', '2020-09-08 08:44:44', '2020-09-08 08:44:44'),
(3, 'Fragrant Room Sprays', '2020-09-08 08:45:07', '2020-09-08 08:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `id` int(11) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `symbol` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`id`, `country`, `currency`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(2, 'America', 'Dollars', 'USD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(3, 'Afghanistan', 'Afghanis', 'AFN', '؋', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(4, 'Argentina', 'Pesos', 'ARS', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(6, 'Australia', 'Dollars', 'AUD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(7, 'Azerbaijan', 'New Manats', 'AZN', 'ман', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(8, 'Bahamas', 'Dollars', 'BSD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(9, 'Barbados', 'Dollars', 'BBD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(11, 'Belgium', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(13, 'Bermuda', 'Dollars', 'BMD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(16, 'Botswana', 'Pula', 'BWP', 'P', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(17, 'Bulgaria', 'Leva', 'BGN', 'лв', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(18, 'Brazil', 'Reais', 'BRL', 'R$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(19, 'Britain (United Kingdom)', 'Pounds', 'GBP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(21, 'Cambodia', 'Riels', 'KHR', '៛', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(22, 'Canada', 'Dollars', 'CAD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(24, 'Chile', 'Pesos', 'CLP', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(26, 'Colombia', 'Pesos', 'COP', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(29, 'Cuba', 'Pesos', 'CUP', '₱', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(30, 'Cyprus', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(35, 'Egypt', 'Pounds', 'EGP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(36, 'El Salvador', 'Colones', 'SVC', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(37, 'England (United Kingdom)', 'Pounds', 'GBP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(38, 'Euro', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(40, 'Fiji', 'Dollars', 'FJD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(41, 'France', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(42, 'Ghana', 'Cedis', 'GHC', '¢', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(44, 'Greece', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(46, 'Guernsey', 'Pounds', 'GGP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(47, 'Guyana', 'Dollars', 'GYD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(48, 'Holland (Netherlands)', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(53, 'India', 'Rupees', 'INR', '₹', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(55, 'Iran', 'Rials', 'IRR', '﷼', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(56, 'Ireland', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(58, 'Israel', 'New Shekels', 'ILS', '₪', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(59, 'Italy', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(61, 'Japan', 'Yen', 'JPY', '¥', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(62, 'Jersey', 'Pounds', 'JEP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(64, 'Korea (North)', 'Won', 'KPW', '₩', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(65, 'Korea (South)', 'Won', 'KRW', '₩', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(67, 'Laos', 'Kips', 'LAK', '₭', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(69, 'Lebanon', 'Pounds', 'LBP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(70, 'Liberia', 'Dollars', 'LRD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(76, 'Malta', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(78, 'Mexico', 'Pesos', 'MXN', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(80, 'Mozambique', 'Meticais', 'MZN', 'MT', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(81, 'Namibia', 'Dollars', 'NAD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(82, 'Nepal', 'Rupees', 'NPR', '₨', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(84, 'Netherlands', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(85, 'New Zealand', 'Dollars', 'NZD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(88, 'North Korea', 'Won', 'KPW', '₩', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(89, 'Norway', 'Krone', 'NOK', 'kr', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(90, 'Oman', 'Rials', 'OMR', '﷼', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(94, 'Peru', 'Nuevos Soles', 'PEN', 'S/.', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(96, 'Poland', 'Zlotych', 'PLN', 'zł', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(97, 'Qatar', 'Rials', 'QAR', '﷼', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(98, 'Romania', 'New Lei', 'RON', 'lei', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(99, 'Russia', 'Rubles', 'RUB', 'руб', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(104, 'Singapore', 'Dollars', 'SGD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(105, 'Slovenia', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(107, 'Somalia', 'Shillings', 'SOS', 'S', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(108, 'South Africa', 'Rand', 'ZAR', 'R', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(109, 'South Korea', 'Won', 'KRW', '₩', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(110, 'Spain', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(114, 'Suriname', 'Dollars', 'SRD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(115, 'Syria', 'Pounds', 'SYP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(117, 'Thailand', 'Baht', 'THB', '฿', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(119, 'Turkey', 'Lira', 'TRY', 'TL', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(120, 'Turkey', 'Liras', 'TRL', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(124, 'United States of America', 'Dollars', 'USD', '$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(127, 'Vatican City', 'Euro', 'EUR', '€', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(129, 'Vietnam', 'Dong', 'VND', '₫', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(130, 'Yemen', 'Rials', 'YER', '﷼', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', '2020-09-09 11:06:16', '2020-09-09 11:06:16'),
(132, 'India', 'Rupees', 'INR', '₹', '2020-09-09 11:06:16', '2020-09-09 11:06:16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` text,
  `product_description` text,
  `product_price` float NOT NULL DEFAULT '0',
  `product_currency` text,
  `product_category` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_description`, `product_price`, `product_currency`, `product_category`, `created_at`, `updated_at`) VALUES
(1, 'Cycle Naivedya Sambrani with Resin, Benzoin Fragrances - Pack of 4 (12 Cups per Pack)', 'Special Sambrani Packages from the House of Cycle Brand||Burning Time :- 20 Minutes||Fragrances : This Pack is Naivedya Cup Sambrani Dhoop comes in Fragrances of Resin, Benzoin.||Contain : The package contains Naivedya Cup Sambrani Pack of 4 with 12 cup each box .Easy to use and suitable for everyone . You can also gift it to your dear ones on a special occasion to make them feel special and loved.||Naivedya Cup Sambrani Dhoop can also be used for meditation, spiritual & gifting purposes.', 289, 'INR', 1, '2020-09-08 09:08:53', '2020-09-09 10:30:40'),
(2, 'Zed Black 3 in 1 Monthly Pack Incense Sticks - Pack of 2', 'Get long Lasting Fragrance- Zed black brings you the most soothing and refreshing fragrance sticks that are ideal for your home and workplace.||The package contains incense sticks pack of 2 with approx. 200 gm sticks in each box, made of natural essential oils and woods.||Whether you are using them for meditation or spiritual purpose or just for relaxing, these will lift up your mood within a few seconds, and create an amazing atmosphere all around.||Easy to use and suitable for everyone, these incense sticks worth your time and money. You can also gift it to your dear ones on a special occasion to make them feel special and loved.||Caution: Burn these incense sticks away from children and pets. Ashes should fall on fireproof and heat resistant surface only.', 250, 'INR', 1, '2020-09-08 09:08:53', '2020-09-08 09:09:32'),
(3, 'The Aroma Factory Shahi Loban Incense Sticks Agarbatti (Bottle Pack of 100)', 'Material: Wood, Color: Multicolour||Package Contents: Exclusive Incense sticks, dhoop made with 0 percent Charcoal||Item Size: 4 cm x 4 cm x 26 cm||Item Size: 4 cm x 4 cm x 26 cm', 300, 'INR', 1, '2020-09-08 10:37:06', '2020-09-08 10:37:06'),
(4, 'Exotic Aromas Pure and Organic Essential Oil - Pack of 5 (Lavender, Lemongrass, Jasmine, Mandarin, Rose)', '100% steam distilled natural and organic, therapeutic grade essential oil for diffusers, humidifiers, sprays, home cleaning and topical absorbtion.\r\nOur essential oils are suitable for aromatherapy, massage and vaporiser, diffusion, oil burner, inhalation, body oils, perfume, candles, soaps, cleaning, home care.\r\nThe strict control standards, intelligent production lines and perfect production process ensure the production of essential oils.\r\nFor external use only. Not to be ingested', 1000, 'INR', 2, '2020-09-08 10:47:00', '2020-09-08 10:47:00'),
(5, 'FARKRAFT 5 in 1 Aroma Oil Pack for Aroma Glass Diffuser and Oil Burner Fragrance - Set of 5 (Lavender, Lemongrass, Aqua, Sandal and Jasmine 10 ml Each)', 'The wide collation of Aroma Oil available in one bunch For Aroma Diffsuer and Oil Burner (Package Contents: Lavender, Lemongrass, Aqua, Sandal and Jasmine 10 ML Each)\r\nEssential Oils Clears the Lungs and Supports Respiratory Health, help relieve stress and anxiety.\r\nDiffusing Essential Oils Supports Emotional Health\r\nDiffusing Essential Oils Repels Insects\r\nWe never recommend this oil to use on your body , these all are for aroma diffuser.', 400, 'INR', 2, '2020-09-08 10:47:00', '2020-09-08 10:47:00'),
(6, 'Naturalis Rosemary Essential Oil 30ml', 'INGREDIENTS: Rosemary oil (rosmarinus officinalis)\r\nPURITY: 100% pure and natural, not a blend of isolated components. No dilution adulteration, addition or deletion is made and no solvent is used.\r\nPROCESSING METHOD / PART: Steam Distillation / Leaves, Flowers & Buds\r\nAROMATIC NOTE: Rosemary oil’s middle note is medium in aroma and a fresh, slightly medicinal scent, with characteristically woody, camphoraceous notes.\r\nUSES - Rosemary Essential Oil is known to condition hair to make it look and feel healthy', 760, 'INR', 2, '2020-09-08 10:48:58', '2020-09-08 10:48:58'),
(7, 'Aromatique Clove Essential Oil ,Therapeutic Grade 100% Pure Clove Oil for Teeth,Hair and Skin by Aromatique (15 ML)', 'Premium quality; pure and natural; non-toxic, no additives, unfiltered and undiluted with no fillers; therapeutic grade; suitable for Vegetarians and Vegans; packaged by TCT\r\nTHERAPEUTIC GRADE AROMATIQUE \'Clove\' essential oil is extracted by steam distillation from leaves, stem and buds of the clove tree. We follow strict guidelines to protect the natural properties of the oil during extraction and packaging. Our oil is therapeutic grade for maximum potency.\r\nSAFETY WARNING: For external use only. Other than aromatherapy, dilute with a carrier oil. For topical use, rub a very small amount on the inside of your elbow area to test for any allergic reaction before use. Keep out of the reach of pets. Essential oils can be potentially toxic to pets at certain concentrations. Cats can be especially sensitive to essential oils. Avoid contact with eyes, keep out of the reach of children. If pregnant, consult with your health care provider before use.\r\n100% PURE- NEVER DILUTED Aromatique Clove essential oil is 100 percent pure. We never dilute our essential oils with preservatives or any liquid. In every bottle of Beauty AROMATIQUE Clove essential oil you will get 100% Pure Clove oil.\r\nINDULGE THE WARM AROMA Clove essential oil is renowned for its warm, spicy, aroma. When diffused for aromatherapy Clove oil creates an uplifting ambience to any home or work place. It may also purify the air by eliminating germs and impurities in the air. Few drops can be mixed with carrier oils to make a great aromatherapy massage oil', 499, 'INR', 2, '2020-09-08 10:48:58', '2020-09-08 10:48:58'),
(8, 'Airwick Freshmatic Life Scents Air-freshner Complete Kit [Machine + Summer Delights refill - 250 ml]', 'With up to 2,400 fragrant sprays per refill, 1 pack fills the room for up to 60 days (Under lab test conditions at low device setting)\r\nNot just fragrances the home but also neutralizes odours\r\nIt can be operated at 3 Fragrance Intensity settings- high, medium and low\r\nThe complete pack includes 1 gadget, 2 AA batteries and 1 refill spray\r\nPlayful and fun fragrance combining fresh white florals, sweet melon and subtle vanilla\r\nCountry of Origin: Malaysia', 550, 'INR', 3, '2020-09-08 10:53:43', '2020-09-08 10:53:43'),
(9, 'Odonil Air Freshener Blocks - 50g (Pack of 4)', 'Its special odour busters keep bathroom fresh and Fragrant.\r\nIt\'s now Available in 4 different sizes – 35g, 50g, 75g & 100g.\r\nAvailable in 4 different fragrances – Jasmine, Lavender, Orchid & Rose .\r\nOdonil Bathroom Air freshner Blocks removes mal-odours from your bathroom.\r\nIt Keeps our bathroom fragrant for 30 days', 149, 'INR', 3, '2020-09-08 10:53:43', '2020-09-08 10:53:43'),
(10, 'Godrej aer Spray, Home and Office Air Freshener - Violet Valley Bloom (240 ml)', 'Contains 1 unit of Godrej aer spray - Room freshener (240ml). Variant - Violet Valley Bloom\r\nLong lasting fragrance, that works with a simple push\r\nCan be used anywhere - Bedroom, Living Room, Workspaces & Public Spaces\r\nAvailable in 5 fragrance variants - Cool Surf Blue, Morning Misty Meadows, Fresh Lush Green, Musk After Smoke and Petal Crush Pink', 119, 'INR', 3, '2020-09-08 10:54:32', '2020-09-08 10:54:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
