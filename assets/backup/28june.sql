-- phpMyAdmin SQL Dump
-- version 3.5.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 28, 2013 at 11:09 AM
-- Server version: 5.5.32
-- PHP Version: 5.3.26

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aryaadq79_iosleague`
--

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

CREATE TABLE IF NOT EXISTS `clubs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `captain` varchar(255) NOT NULL,
  `shots` int(11) NOT NULL,
  `shotsot` varchar(255) NOT NULL,
  `passes` int(11) NOT NULL,
  `passescp` varchar(255) NOT NULL,
  `fouls` int(11) NOT NULL,
  `ycards` int(11) NOT NULL,
  `rcards` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `clubs`
--

INSERT INTO `clubs` (`id`, `club`, `tag`, `amount`, `captain`, `shots`, `shotsot`, `passes`, `passescp`, `fouls`, `ycards`, `rcards`) VALUES
(18, 'NextGen', 'nG', 14, 'Iran', 24, '16', 454, '340', 0, 0, 0),
(20, 'Gorillas', 'Gs', 14, 'Goldeh', 17, '15', 282, '152', 1, 0, 0),
(21, 'Ball Breakers', 'BB', 18, 'Thinge', 24, '23', 402, '234', 3, 2, 0),
(22, 'Bears', 'Bears', 15, 'Seaneh', 41, '33', 361, '221', 5, 4, 0),
(23, 'Inter Soccer Stars', 'iSS', 15, 'Gunner', 8, '7', 300, '139', 3, 1, 0),
(24, 'Super 7', 'S7', 16, 'Modiga', 15, '10', 318, '146', 6, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `json`
--

CREATE TABLE IF NOT EXISTS `json` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `json`
--

INSERT INTO `json` (`id`, `name`) VALUES
(9, '2013.06.16_18h.46m.24s_ng-vs-gs_1-1.json'),
(10, '2013.06.16_21h.01m.23s_s7-vs-bears_0-4.json'),
(11, '2013.06.16_22h.18m.49s_bb-vs-iss_3-0.json'),
(12, '2013.06.23_18h.36m.16s_ng-vs-s7_5-1.json'),
(13, '2013.06.23_21h.02m.18s_bears-vs-bb_2-0.json'),
(14, '2013.06.23_22h.09m.05s_gs-vs-iss_2-2.json');

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE IF NOT EXISTS `matches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `h_team` varchar(255) NOT NULL,
  `h_goals` int(11) NOT NULL,
  `h_shots` int(11) NOT NULL,
  `h_shotsot` int(11) NOT NULL,
  `h_possession` int(11) NOT NULL,
  `h_interceptions` int(11) NOT NULL,
  `h_corners` int(11) NOT NULL,
  `h_passes` int(11) NOT NULL,
  `h_passescp` int(11) NOT NULL,
  `h_fouls` int(11) NOT NULL,
  `h_ycards` int(11) NOT NULL,
  `h_rcards` int(11) NOT NULL,
  `h_distance` int(11) NOT NULL,
  `a_team` varchar(255) NOT NULL,
  `a_goals` int(11) NOT NULL,
  `a_shots` int(11) NOT NULL,
  `a_shotsot` int(11) NOT NULL,
  `a_possession` int(11) NOT NULL,
  `a_interceptions` int(11) NOT NULL,
  `a_corners` int(11) NOT NULL,
  `a_passes` int(11) NOT NULL,
  `a_passescp` int(11) NOT NULL,
  `a_fouls` int(11) NOT NULL,
  `a_ycards` int(11) NOT NULL,
  `a_rcards` int(11) NOT NULL,
  `a_distance` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `matches`
--

INSERT INTO `matches` (`id`, `h_team`, `h_goals`, `h_shots`, `h_shotsot`, `h_possession`, `h_interceptions`, `h_corners`, `h_passes`, `h_passescp`, `h_fouls`, `h_ycards`, `h_rcards`, `h_distance`, `a_team`, `a_goals`, `a_shots`, `a_shotsot`, `a_possession`, `a_interceptions`, `a_corners`, `a_passes`, `a_passescp`, `a_fouls`, `a_ycards`, `a_rcards`, `a_distance`) VALUES
(1, 'NextGen', 1, 6, 2, 62, 51, 1, 231, 173, 0, 0, 0, 48567, 'Gorillas', 1, 9, 7, 38, 52, 2, 122, 63, 0, 0, 0, 46636),
(2, 'Super 7', 0, 9, 6, 45, 65, 1, 158, 71, 0, 0, 0, 42694, 'Bears', 4, 21, 18, 55, 82, 8, 208, 136, 3, 3, 0, 44345),
(3, 'Ball Breakers', 3, 8, 7, 57, 65, 1, 209, 121, 1, 1, 0, 44994, 'Inter Soccer Stars', 0, 1, 1, 43, 82, 4, 138, 66, 0, 0, 0, 43855),
(4, 'NextGen', 5, 18, 14, 61, 70, 5, 223, 167, 0, 0, 0, 44862, 'Super 7', 1, 6, 4, 39, 52, 2, 160, 75, 6, 6, 2, 42163),
(5, 'Bears', 2, 20, 15, 47, 68, 8, 153, 85, 2, 1, 0, 47560, 'Ball Breakers', 0, 16, 16, 53, 58, 6, 193, 113, 2, 1, 0, 46907),
(6, 'Gorillas', 2, 8, 8, 47, 83, 4, 160, 89, 1, 0, 0, 46303, 'Inter Soccer Stars', 2, 7, 6, 53, 62, 3, 162, 73, 3, 1, 0, 42402);

-- --------------------------------------------------------

--
-- Table structure for table `match_detail`
--

CREATE TABLE IF NOT EXISTS `match_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  `shotsot` varchar(255) NOT NULL,
  `passescp` varchar(255) NOT NULL,
  `distancecovered` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=143 ;

--
-- Dumping data for table `match_detail`
--

INSERT INTO `match_detail` (`id`, `match_id`, `steam_id`, `shotsot`, `passescp`, `distancecovered`) VALUES
(57, 1, 'STEAM_0:1:14849456', '100', '94', '69'),
(58, 1, 'STEAM_0:1:4259', '100', '77', '70.9'),
(59, 1, 'STEAM_0:1:13587077', '0', '65', '73.2'),
(60, 1, 'STEAM_0:0:20301667', '0', '61', '46.2'),
(61, 1, 'STEAM_0:0:16735574', '0', '73', '69.1'),
(62, 1, 'STEAM_0:0:25699948', '0', '76', '74.5'),
(63, 1, 'STEAM_0:1:10824911', '0', '88', '58.9'),
(64, 1, 'STEAM_0:1:3695202', '0', '40', '26.3'),
(65, 1, 'STEAM_0:1:375116', '0', '60', '71.5'),
(66, 1, 'STEAM_0:0:1102396', '0', '40', '69.5'),
(67, 1, 'STEAM_0:1:15187119', '0', '67', '72.1'),
(68, 1, 'STEAM_0:1:7479248', '100', '67', '77.2'),
(69, 1, 'STEAM_0:1:4460440', '100', '36', '75.3'),
(70, 1, 'STEAM_0:1:245919', '50', '56', '72.6'),
(71, 2, 'STEAM_0:0:1114060', '100', '43', '36.7'),
(72, 2, 'STEAM_0:1:4373127', '0', '33', '65.1'),
(73, 2, 'STEAM_0:0:1608509', '0', '57', '65.7'),
(74, 2, 'STEAM_0:1:318147', '0', '52', '70.5'),
(75, 2, 'STEAM_0:0:10372338', '50', '38', '71.8'),
(76, 2, 'STEAM_0:1:495762', '100', '57', '31.1'),
(77, 2, 'STEAM_0:0:10062113', '0', '27', '19.9'),
(78, 2, 'STEAM_0:0:4358091', '75', '73', '73.5'),
(79, 2, 'STEAM_0:1:5846747', '86', '61', '71.8'),
(80, 2, 'STEAM_0:0:9347196', '100', '60', '71.4'),
(81, 2, 'STEAM_0:1:10938960', '0', '77', '66.8'),
(82, 2, 'STEAM_0:1:28980011', '0', '56', '70.3'),
(83, 2, 'STEAM_0:0:34848565', '0', '50', '66.6'),
(84, 2, 'STEAM_0:1:19489062', '0', '79', '22.8'),
(85, 3, 'STEAM_0:1:1706943', '0', '81', '70.4'),
(86, 3, 'STEAM_0:0:4040405', '50', '79', '68.7'),
(87, 3, 'STEAM_0:0:31446984', '0', '46', '64.2'),
(88, 3, 'STEAM_0:1:10210350', '0', '56', '40.5'),
(89, 3, 'STEAM_0:1:4704965', '100', '23', '73.2'),
(90, 3, 'STEAM_0:1:19983526', '100', '58', '70'),
(91, 3, 'STEAM_0:0:4060750', '0', '66', '62.7'),
(92, 3, 'STEAM_0:0:4263948', '0', '41', '74.8'),
(93, 3, 'STEAM_0:0:38070080', '0', '36', '68.2'),
(94, 3, 'STEAM_0:0:31533268', '0', '63', '69.9'),
(95, 3, 'STEAM_0:1:5524635', '0', '44', '67.1'),
(96, 3, 'STEAM_0:1:25290806', '0', '57', '48.4'),
(97, 3, 'STEAM_0:1:24141346', '100', '50', '48.2'),
(98, 3, 'STEAM_0:1:3525087', '0', '60', '19.6'),
(99, 3, 'STEAM_0:1:7116806', '0', '67', '20.6'),
(100, 4, 'STEAM_0:0:21008476', '86', '68', '68.8'),
(101, 4, 'STEAM_0:1:13587077', '67', '55', '71.2'),
(102, 4, 'STEAM_0:1:11674195', '0', '83', '59.3'),
(103, 4, 'STEAM_0:1:7390716', '0', '81', '59.7'),
(104, 4, 'STEAM_0:0:16735574', '71', '79', '70.8'),
(105, 4, 'STEAM_0:1:4259', '100', '92', '63.7'),
(106, 4, 'STEAM_0:1:10824911', '0', '71', '54.6'),
(107, 4, 'STEAM_0:0:28327390', '50', '64', '69.8'),
(108, 4, 'STEAM_0:0:1630521', '100', '23', '65.5'),
(109, 4, 'STEAM_0:1:318147', '0', '45', '68.5'),
(110, 4, 'STEAM_0:0:10062113', '0', '42', '15.3'),
(111, 4, 'STEAM_0:0:856270', '0', '58', '39.1'),
(112, 4, 'STEAM_0:0:1114060', '0', '45', '68.8'),
(113, 4, 'STEAM_0:0:9330823', '100', '47', '71.3'),
(114, 5, 'STEAM_0:1:28980011', '0', '86', '50.4'),
(115, 5, 'STEAM_0:0:9347196', '100', '67', '75.8'),
(116, 5, 'STEAM_0:0:4358091', '64', '26', '75.7'),
(117, 5, 'STEAM_0:0:34848565', '100', '60', '67.4'),
(118, 5, 'STEAM_0:1:159774', '100', '50', '74.4'),
(119, 5, 'STEAM_0:1:15544025', '0', '47', '66'),
(120, 5, 'STEAM_0:1:10938960', '0', '56', '65.2'),
(121, 5, 'STEAM_0:1:10210350', '0', '55', '44.7'),
(122, 5, 'STEAM_0:1:19983526', '100', '53', '70.5'),
(123, 5, 'STEAM_0:1:1706943', '100', '53', '73.7'),
(124, 5, 'STEAM_0:0:4060750', '0', '70', '69'),
(125, 5, 'STEAM_0:0:54255', '100', '50', '72.8'),
(126, 5, 'STEAM_0:0:4040405', '100', '82', '70.8'),
(127, 5, 'STEAM_0:1:14969985', '0', '39', '67.2'),
(128, 6, 'STEAM_0:1:375116', '0', '60', '43.8'),
(129, 6, 'STEAM_0:0:12510914', '0', '62', '43.3'),
(130, 6, 'STEAM_0:1:4460440', '100', '28', '68.8'),
(131, 6, 'STEAM_0:1:3131808', '100', '57', '72.8'),
(132, 6, 'STEAM_0:0:1102396', '0', '62', '71.7'),
(133, 6, 'STEAM_0:1:3695202', '100', '60', '44.8'),
(134, 6, 'STEAM_0:1:245919', '100', '27', '22.9'),
(135, 6, 'STEAM_0:1:15187119', '0', '68', '67.3'),
(136, 6, 'STEAM_0:1:24141346', '0', '62', '31.4'),
(137, 6, 'STEAM_0:0:4190900', '0', '33', '33'),
(138, 6, 'STEAM_0:1:5524635', '0', '36', '64.8'),
(139, 6, 'STEAM_0:1:3525087', '0', '36', '15.7'),
(140, 6, 'STEAM_0:0:38070080', '0', '36', '67.6'),
(141, 6, 'STEAM_0:1:7116806', '100', '44', '73.3'),
(142, 6, 'STEAM_0:0:4263948', '100', '54', '73.7');

-- --------------------------------------------------------

--
-- Table structure for table `match_events`
--

CREATE TABLE IF NOT EXISTS `match_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `minute` int(11) NOT NULL,
  `event` varchar(255) NOT NULL,
  `period` varchar(255) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=359 ;

--
-- Dumping data for table `match_events`
--

INSERT INTO `match_events` (`id`, `match_id`, `minute`, `event`, `period`, `steam_id`) VALUES
(224, 1, 51, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10824911'),
(225, 1, 51, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10824911'),
(226, 1, 52, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10824911'),
(227, 1, 63, 'GOAL', 'SECOND HALF', 'STEAM_0:1:7479248'),
(228, 1, 67, 'MISS', 'SECOND HALF', 'STEAM_0:0:20301667'),
(229, 1, 89, 'GOAL', 'SECOND HALF', 'STEAM_0:1:14849456'),
(230, 1, 92, 'SAVE', 'SECOND HALF', 'STEAM_0:1:3695202'),
(231, 2, 2, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(232, 2, 4, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(233, 2, 4, 'MISS', 'FIRST HALF', 'STEAM_0:0:4358091'),
(234, 2, 19, 'SAVE', 'FIRST HALF', 'STEAM_0:1:19489062'),
(235, 2, 20, 'YELLOW CARD', 'FIRST HALF', 'STEAM_0:1:5846747'),
(236, 2, 21, 'MISS', 'FIRST HALF', 'STEAM_0:1:4373127'),
(237, 2, 25, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(238, 2, 25, 'GOAL', 'FIRST HALF', 'STEAM_0:1:5846747'),
(239, 2, 26, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(240, 2, 28, 'OWN GOAL', 'FIRST HALF', 'STEAM_0:1:318147'),
(241, 2, 30, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(242, 2, 30, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(243, 2, 32, 'SAVE', 'FIRST HALF', 'STEAM_0:1:19489062'),
(244, 2, 34, 'MISS', 'FIRST HALF', 'STEAM_0:0:10372338'),
(245, 2, 35, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(246, 2, 36, 'SAVE', 'FIRST HALF', 'STEAM_0:1:19489062'),
(247, 2, 39, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(248, 2, 42, 'SAVE', 'FIRST HALF', 'STEAM_0:1:19489062'),
(249, 2, 47, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(250, 2, 47, 'GOAL', 'FIRST HALF', 'STEAM_0:0:9347196'),
(251, 2, 47, 'YELLOW CARD', 'SECOND HALF', 'STEAM_0:1:10938960'),
(252, 2, 48, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(253, 2, 49, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(254, 2, 49, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(255, 2, 51, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(256, 2, 60, 'MISS', 'SECOND HALF', 'STEAM_0:0:4358091'),
(257, 2, 64, 'SAVE', 'SECOND HALF', 'STEAM_0:1:19489062'),
(258, 2, 65, 'SAVE', 'SECOND HALF', 'STEAM_0:1:19489062'),
(259, 2, 66, 'MISS', 'SECOND HALF', 'STEAM_0:1:5846747'),
(260, 2, 67, 'MISS', 'SECOND HALF', 'STEAM_0:1:495762'),
(261, 2, 73, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(262, 2, 74, 'GOAL', 'SECOND HALF', 'STEAM_0:1:5846747'),
(263, 2, 76, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(264, 2, 80, 'YELLOW CARD', 'SECOND HALF', 'STEAM_0:0:34848565'),
(265, 3, 2, 'GOAL', 'FIRST HALF', 'STEAM_0:1:19983526'),
(266, 3, 16, 'YELLOW CARD', 'FIRST HALF', 'STEAM_0:0:4060750'),
(267, 3, 43, 'SAVE', 'FIRST HALF', 'STEAM_0:1:10210350'),
(268, 3, 46, 'SAVE', 'FIRST HALF', 'STEAM_0:1:3525087'),
(269, 3, 47, 'SAVE', 'SECOND HALF', 'STEAM_0:1:3525087'),
(270, 3, 70, 'GOAL', 'SECOND HALF', 'STEAM_0:1:4704965'),
(271, 3, 80, 'SAVE', 'SECOND HALF', 'STEAM_0:1:3525087'),
(272, 3, 85, 'SAVE', 'SECOND HALF', 'STEAM_0:1:3525087'),
(273, 3, 85, 'MISS', 'SECOND HALF', 'STEAM_0:0:4040405'),
(274, 3, 90, 'GOAL', 'SECOND HALF', 'STEAM_0:0:4040405'),
(275, 4, 2, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(276, 4, 2, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(277, 4, 6, 'YELLOW CARD', 'FIRST HALF', 'STEAM_0:0:1114060'),
(278, 4, 8, 'YELLOW CARD', 'FIRST HALF', 'STEAM_0:0:28327390'),
(279, 4, 8, 'MISS', 'FIRST HALF', 'STEAM_0:0:21008476'),
(280, 4, 12, 'SAVE', 'FIRST HALF', 'STEAM_0:0:10062113'),
(281, 4, 15, 'GOAL', 'FIRST HALF', 'STEAM_0:0:16735574'),
(282, 4, 31, 'SAVE', 'FIRST HALF', 'STEAM_0:1:10824911'),
(283, 4, 34, 'YELLOW CARD', 'FIRST HALF', 'STEAM_0:0:856270'),
(284, 4, 39, 'SAVE', 'FIRST HALF', 'STEAM_0:1:10824911'),
(285, 4, 45, 'GOAL', 'FIRST HALF', 'STEAM_0:0:16735574'),
(286, 4, 51, 'GOAL', 'SECOND HALF', 'STEAM_0:0:21008476'),
(287, 4, 53, 'SECOND YELLOW', 'SECOND HALF', 'STEAM_0:0:856270'),
(288, 4, 53, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(289, 4, 58, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(290, 4, 61, 'MISS', 'SECOND HALF', 'STEAM_0:0:16735574'),
(291, 4, 69, 'GOAL', 'SECOND HALF', 'STEAM_0:0:16735574'),
(292, 4, 70, 'GOAL', 'SECOND HALF', 'STEAM_0:0:9330823'),
(293, 4, 72, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(294, 4, 72, 'GOAL', 'SECOND HALF', 'STEAM_0:0:21008476'),
(295, 4, 78, 'MISS', 'SECOND HALF', 'STEAM_0:0:28327390'),
(296, 4, 81, 'MISS', 'SECOND HALF', 'STEAM_0:0:16735574'),
(297, 4, 84, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(298, 4, 85, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(299, 4, 86, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10824911'),
(300, 4, 87, 'YELLOW CARD', 'SECOND HALF', 'STEAM_0:0:9330823'),
(301, 4, 88, 'SAVE', 'SECOND HALF', 'STEAM_0:0:10062113'),
(302, 4, 89, 'MISS', 'SECOND HALF', 'STEAM_0:1:13587077'),
(303, 4, 92, 'SECOND YELLOW', 'SECOND HALF', 'STEAM_0:0:9330823'),
(304, 4, 93, 'MISS', 'SECOND HALF', 'STEAM_0:1:318147'),
(305, 5, 1, 'MISS', 'FIRST HALF', 'STEAM_0:0:4358091'),
(306, 5, 2, 'SAVE', 'FIRST HALF', 'STEAM_0:1:28980011'),
(307, 5, 18, 'GOAL', 'FIRST HALF', 'STEAM_0:0:4358091'),
(308, 5, 20, 'MISS', 'FIRST HALF', 'STEAM_0:1:10938960'),
(309, 5, 31, 'SAVE', 'FIRST HALF', 'STEAM_0:1:28980011'),
(310, 5, 33, 'SAVE', 'FIRST HALF', 'STEAM_0:1:10210350'),
(311, 5, 36, 'SAVE', 'FIRST HALF', 'STEAM_0:1:28980011'),
(312, 5, 39, 'SAVE', 'FIRST HALF', 'STEAM_0:1:10210350'),
(313, 5, 41, 'SAVE', 'FIRST HALF', 'STEAM_0:1:10210350'),
(314, 5, 45, 'SAVE', 'FIRST HALF', 'STEAM_0:1:28980011'),
(315, 5, 46, 'GOAL', 'SECOND HALF', 'STEAM_0:0:9347196'),
(316, 5, 50, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10210350'),
(317, 5, 50, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10210350'),
(318, 5, 54, 'MISS', 'SECOND HALF', 'STEAM_0:0:4358091'),
(319, 5, 60, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(320, 5, 60, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(321, 5, 60, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(322, 5, 60, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(323, 5, 60, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(324, 5, 60, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(325, 5, 60, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(326, 5, 60, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(327, 5, 64, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(328, 5, 64, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10210350'),
(329, 5, 66, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10210350'),
(330, 5, 67, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(331, 5, 72, 'MISS', 'SECOND HALF', 'STEAM_0:0:4358091'),
(332, 5, 72, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10210350'),
(333, 5, 73, 'YELLOW CARD', 'SECOND HALF', 'STEAM_0:1:1706943'),
(334, 5, 73, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10210350'),
(335, 5, 84, 'YELLOW CARD', 'SECOND HALF', 'STEAM_0:0:9347196'),
(336, 5, 90, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10210350'),
(337, 5, 90, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10210350'),
(338, 5, 93, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(339, 5, 93, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10210350'),
(340, 5, 94, 'SAVE', 'SECOND HALF', 'STEAM_0:1:10210350'),
(341, 5, 94, 'SAVE', 'SECOND HALF', 'STEAM_0:1:28980011'),
(342, 6, 10, 'GOAL', 'FIRST HALF', 'STEAM_0:1:7116806'),
(343, 6, 29, 'SAVE', 'FIRST HALF', 'STEAM_0:1:3525087'),
(344, 6, 31, 'SAVE', 'FIRST HALF', 'STEAM_0:1:3525087'),
(345, 6, 37, 'SAVE', 'FIRST HALF', 'STEAM_0:1:375116'),
(346, 6, 49, 'GOAL', 'SECOND HALF', 'STEAM_0:1:3695202'),
(347, 6, 54, 'SAVE', 'SECOND HALF', 'STEAM_0:1:375116'),
(348, 6, 54, 'MISS', 'SECOND HALF', 'STEAM_0:1:24141346'),
(349, 6, 61, 'YELLOW CARD', 'SECOND HALF', 'STEAM_0:1:24141346'),
(350, 6, 63, 'SAVE', 'SECOND HALF', 'STEAM_0:1:3525087'),
(351, 6, 63, 'SAVE', 'SECOND HALF', 'STEAM_0:1:3525087'),
(352, 6, 64, 'SAVE', 'SECOND HALF', 'STEAM_0:1:375116'),
(353, 6, 65, 'GOAL', 'SECOND HALF', 'STEAM_0:0:4263948'),
(354, 6, 68, 'SAVE', 'SECOND HALF', 'STEAM_0:1:375116'),
(355, 6, 78, 'SAVE', 'SECOND HALF', 'STEAM_0:1:3525087'),
(356, 6, 83, 'OWN GOAL', 'SECOND HALF', 'STEAM_0:0:4263948'),
(357, 6, 89, 'SAVE', 'SECOND HALF', 'STEAM_0:1:3525087'),
(358, 6, 90, 'SAVE', 'SECOND HALF', 'STEAM_0:1:3525087');

-- --------------------------------------------------------

--
-- Table structure for table `match_positions`
--

CREATE TABLE IF NOT EXISTS `match_positions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `team` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=255 ;

--
-- Dumping data for table `match_positions`
--

INSERT INTO `match_positions` (`id`, `match_id`, `steam_id`, `position`, `team`) VALUES
(169, 1, 'STEAM_0:1:3695202', 'GK', 'away'),
(170, 1, 'STEAM_0:1:375116', 'LB', 'away'),
(171, 1, 'STEAM_0:1:14849456', 'RB', 'home'),
(172, 1, 'STEAM_0:1:4259', 'CDM', 'home'),
(173, 1, 'STEAM_0:1:13587077', 'RW', 'home'),
(174, 1, 'STEAM_0:0:20301667', 'LW', 'home'),
(175, 1, 'STEAM_0:0:16735574', 'LB', 'home'),
(176, 1, 'STEAM_0:0:1102396', 'RB', 'away'),
(177, 1, 'STEAM_0:1:15187119', 'CDM', 'away'),
(178, 1, 'STEAM_0:1:7479248', 'CAM', 'away'),
(179, 1, 'STEAM_0:1:4460440', 'LW', 'away'),
(180, 1, 'STEAM_0:0:25699948', 'CAM', 'home'),
(181, 1, 'STEAM_0:1:10824911', 'GK', 'home'),
(182, 1, 'STEAM_0:1:245919', 'RW', 'away'),
(183, 2, 'STEAM_0:0:4358091', 'LW', 'away'),
(184, 2, 'STEAM_0:0:1114060', 'LW', 'home'),
(185, 2, 'STEAM_0:1:4373127', 'LB', 'home'),
(186, 2, 'STEAM_0:1:5846747', 'CAM', 'away'),
(187, 2, 'STEAM_0:0:9347196', 'RW', 'away'),
(188, 2, 'STEAM_0:1:10938960', 'CDM', 'away'),
(189, 2, 'STEAM_0:0:1608509', 'RB', 'home'),
(190, 2, 'STEAM_0:1:318147', 'CDM', 'home'),
(191, 2, 'STEAM_0:1:28980011', 'LB', 'away'),
(192, 2, 'STEAM_0:0:34848565', 'RB', 'away'),
(193, 2, 'STEAM_0:1:19489062', 'GK', 'away'),
(194, 2, 'STEAM_0:0:10372338', 'CAM', 'home'),
(195, 2, 'STEAM_0:1:495762', 'RW', 'home'),
(196, 2, 'STEAM_0:0:10062113', 'GK', 'home'),
(197, 3, 'STEAM_0:0:4263948', 'CAM', 'away'),
(198, 3, 'STEAM_0:1:1706943', 'CDM', 'home'),
(199, 3, 'STEAM_0:0:4040405', 'CAM', 'home'),
(200, 3, 'STEAM_0:0:31446984', 'RB', 'home'),
(201, 3, 'STEAM_0:0:38070080', 'RB', 'away'),
(202, 3, 'STEAM_0:1:10210350', 'GK', 'home'),
(203, 3, 'STEAM_0:0:31533268', 'LB', 'away'),
(204, 3, 'STEAM_0:1:5524635', 'CDM', 'away'),
(205, 3, 'STEAM_0:1:4704965', 'RW', 'home'),
(206, 3, 'STEAM_0:1:25290806', 'LW', 'away'),
(207, 3, 'STEAM_0:1:19983526', 'LW', 'home'),
(208, 3, 'STEAM_0:1:24141346', 'RW', 'away'),
(209, 3, 'STEAM_0:1:3525087', 'GK', 'away'),
(210, 3, 'STEAM_0:0:4060750', 'LB', 'home'),
(211, 3, 'STEAM_0:1:7116806', 'RW', 'away'),
(212, 4, 'STEAM_0:0:21008476', 'RW', 'home'),
(213, 4, 'STEAM_0:1:13587077', 'LW', 'home'),
(214, 4, 'STEAM_0:0:28327390', 'RW', 'away'),
(215, 4, 'STEAM_0:1:11674195', 'LB', 'home'),
(216, 4, 'STEAM_0:1:7390716', 'RB', 'home'),
(217, 4, 'STEAM_0:0:16735574', 'CAM', 'home'),
(218, 4, 'STEAM_0:0:1630521', 'LW', 'away'),
(219, 4, 'STEAM_0:1:318147', 'CDM', 'away'),
(220, 4, 'STEAM_0:1:4259', 'CDM', 'home'),
(221, 4, 'STEAM_0:0:10062113', 'GK', 'away'),
(222, 4, 'STEAM_0:1:10824911', 'GK', 'home'),
(223, 4, 'STEAM_0:0:856270', 'LB', 'away'),
(224, 4, 'STEAM_0:0:1114060', 'RB', 'away'),
(225, 4, 'STEAM_0:0:9330823', 'CAM', 'away'),
(226, 5, 'STEAM_0:1:10210350', 'GK', 'away'),
(227, 5, 'STEAM_0:1:28980011', 'GK', 'home'),
(228, 5, 'STEAM_0:0:9347196', 'CAM', 'home'),
(229, 5, 'STEAM_0:0:4358091', 'RW', 'home'),
(230, 5, 'STEAM_0:1:19983526', 'RW', 'away'),
(231, 5, 'STEAM_0:0:34848565', 'RB', 'home'),
(232, 5, 'STEAM_0:1:1706943', 'CDM', 'away'),
(233, 5, 'STEAM_0:0:4060750', 'RB', 'away'),
(234, 5, 'STEAM_0:0:54255', 'LW', 'away'),
(235, 5, 'STEAM_0:0:4040405', 'CAM', 'away'),
(236, 5, 'STEAM_0:1:159774', 'LW', 'home'),
(237, 5, 'STEAM_0:1:15544025', 'LB', 'home'),
(238, 5, 'STEAM_0:1:10938960', 'CDM', 'home'),
(239, 5, 'STEAM_0:1:14969985', 'LB', 'away'),
(240, 6, 'STEAM_0:1:24141346', 'LW', 'away'),
(241, 6, 'STEAM_0:1:375116', 'GK', 'home'),
(242, 6, 'STEAM_0:0:12510914', 'RW', 'home'),
(243, 6, 'STEAM_0:1:4460440', 'CAM', 'home'),
(244, 6, 'STEAM_0:0:4190900', 'LB', 'away'),
(245, 6, 'STEAM_0:1:3131808', 'RB', 'home'),
(246, 6, 'STEAM_0:0:1102396', 'LB', 'home'),
(247, 6, 'STEAM_0:1:3695202', 'LW', 'home'),
(248, 6, 'STEAM_0:1:245919', 'RW', 'home'),
(249, 6, 'STEAM_0:1:5524635', 'CDM', 'away'),
(250, 6, 'STEAM_0:1:3525087', 'GK', 'away'),
(251, 6, 'STEAM_0:1:15187119', 'CDM', 'home'),
(252, 6, 'STEAM_0:0:38070080', 'RB', 'away'),
(253, 6, 'STEAM_0:1:7116806', 'RW', 'away'),
(254, 6, 'STEAM_0:0:4263948', 'CAM', 'away');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `image` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `date_created`, `image`, `text`, `author`, `url`, `active`) VALUES
(3, 'IOS League #1 announced!', '2013-05-01 12:03:31', 'uploads/images/post-1.jpg', '<p>New league incoming. This time with original teams(iSS, BB etc). It''s early days but I can tell some details about what IOS League #1 will have.</p>\r\n<p>Useful IRC Channels (QuakeNet)<br />-#ios.league<br />-#ios.cup<br />-#ios.dev<br />-#ioss.mix</p>\r\n<p>The ''important'' details</p>\r\n<p>-Start date will be Sunday 16 June and the last games will be played Sunday 18 August. (Cup final 21 August)<br />-League games to be played on Sunday''s between 17:00 and 22:00 (Europe/Amsterdam)<br />-Cup included! Probably on Wednesdays between 17:00 and 22:00. Cup final will be played Wednesday 21 August.<br />-7v7 (duh)<br />-ioss_7v7iran_v12 and probably Gunner''s map as well if he fixes the transparent post/nets<br />-If we have 2 or more maps the home team decides the map they play on.<br />-Expecting 6 teams to participate (I figure out what to do if we don''t reach 6 somehow someway)<br />-Each team must have a minimum of 12 players and maximum 18.<br />-10 games to be played (teams face each other twice)<br />-Transferwindow (after sign-up you can only leave or able to play for another team when the transferwindow is ''open'')<br />-Rules more strict. (harder punishments as well, points can be deducted)<br />-5 yellow cards or direct red will have consequences (1 game ban)<br />-More to add. Keep an eye on this topic ;)</p>\r\n<p>The ''less important info'' but maybe good to know</p>\r\n<p>-Player profile. (something like this: http://www.nba.com/playerfile/kobe_bryant/)<br />-Faster way to update stats and news articles.<br />-Live stream and SourceTV (need help on this of course)<br />-More ''useful'' interviews than before. (need also help on this)<br />-New way of deciding Man of the Match + Weekly awards (AND ALSO HELP ON THIS ONE. all that drama before ;D)<br />-Maybe that players are able to login/register but don''t expect much on this for Season #1 (so probably not but I do my best)<br />-Only ''useful'' stats will be counted. (so things like offside and slide tackles will not be counted)<br />-Rating players per game? (I don''t like it but it has been suggested by some)<br />-More to add.</p>', 'Iran', 'ios-league-1-announced', 1),
(4, 'Sign-up!', '2013-05-20 15:28:29', 'uploads/images/post-1.jpg', '<p>\r\n	NextGen, Gorillas and Ball Breakers have signed so far.</p>\r\n<p>\r\n	You can sign-up in this topic:&nbsp;<a href="http://iosmod.co.uk/forum/viewtopic.php?f=8&amp;t=6567" target="_blank">http://iosmod.co.uk/forum/viewtopic.php?f=8&amp;t=6567</a></p>\r\n<p>\r\n	<strong>Team name:<br />\r\n	Team tag:<br />\r\n	Team captain(s):<br />\r\n	Roster list:<br />\r\n	Logo&#39;s:<br />\r\n	Kits:</strong></p>\r\n<p style="color: red;">\r\n	<var>-Logo&#39;s 3 different sizes. (150x150, 50x50 and 25x25)<br />\r\n	-Home kit must NOT clash with the Away kit. (shirt, short, socks)<br />\r\n	-Kits and Logo&#39;s will be required. But you can still sign-up without logo/kits if you don&#39;t have one.</var></p>\r\n<p>\r\n	<strong>Sign-up deadline is Sunday 2 June.</strong></p>\r\n<p>\r\n	&nbsp;</p>', 'Iran', 'news2', 1),
(5, 'Schedules realesed!', '2013-05-25 17:44:12', 'uploads/images/post-1.jpg', '<p>\r\n	All teams have signed up! (iSS will sign-up for sure).</p>\r\n<p>\r\n	So the schedules are released. Link: <a href="http://www.ios-league.com/schedules">http://www.ios-league.com/schedules</a></p>\r\n<p>\r\n	Also the Cup dates/times are released. Link: <a href="http://www.ios-league.com/cup">http://www.ios-league.com/cup</a></p>\r\n<p>\r\n	The league will start off with NextGen against Gorillas, followed by Super 7 vs Bears and as last the 2 oldest and running teams of IOS, Ball Breakers vs Inter Soccer Stars.</p>\r\n<p>\r\n	Last 2 Matchweek times are unknown. Depends on how the rankings will develop thtoughout the season. Maybe there will be matches running at the same time. If not all!</p>\r\n<p>\r\n	A poll will be published with questions like &#39;who are the favorites, underdogs, topscorer, assist leader, best newcomer, and so on.&#39;</p>', 'Iran', 'news3', 1),
(6, 'Ready to start!', '2013-06-12 10:19:40', 'uploads/images/post-1.jpg', '<p>\r\n	4 more days and before the first games!</p>\r\n<p>\r\n	Honestly I have to say that the &#39;preparation&#39; for the league has been the most uninteresting since I came in IOS. Maybe it has to do with exams and co. As long the matches will be played ;)</p>\r\n<p>\r\n	The first games are as followed:</p>\r\n<p>\r\n	NextGen - Gorillas (18:00 CEST)</p>\r\n<p>\r\n	Super 7 - Bears (19:30 CEST)</p>\r\n<p>\r\n	Ball Breakers - Inter Soccer Superstars (21:00 CEST)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	We will post more articles and interviews later on. Bit too much busy at the moment.</p>\r\n<p>\r\n	Also a Poll incoming! (probably tomorrow)</p>', 'Iran', 'news4', 1),
(8, 'Poll results #1', '2013-06-15 09:56:06', 'uploads/images/post-1.jpg', '<p>\r\n	Here are the first results of the Poll #1! I want to thank all 51 players who participcated.</p>\r\n<p>\r\n	<strong>Votes: 51</strong></p>\r\n<p>\r\n	<strong>Which team is the #1 favorite for the championship?</strong></p>\r\n<p>\r\n	1. NextGen (80,39%)</p>\r\n<p>\r\n	2. Inter Soccer Stars (5,88%)</p>\r\n<p>\r\n	2. Ball Breakers (5,88%)</p>\r\n<p>\r\n	4. Bears (3,92%)</p>\r\n<p>\r\n	4. Gorillas (3,92%)</p>\r\n<p>\r\n	6. Super 7 (0%)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong>Which team are the biggest underdog in the league?</strong></p>\r\n<p>\r\n	1. Super 7 (68,63%)</p>\r\n<p>\r\n	2. Inter Soccer Stars (19,61%)</p>\r\n<p>\r\n	3. Ball Breakers (3,92%)</p>\r\n<p>\r\n	3. Bears (3,92%)</p>\r\n<p>\r\n	3. Gorillas (3,92%)</p>\r\n<p>\r\n	6. NextGen (0%)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong>Topscorer</strong></p>\r\n<p>\r\n	1. Iran (37,25%)</p>\r\n<p>\r\n	2. Kirby (29,41%)</p>\r\n<p>\r\n	3. Termi (11,76%)</p>\r\n<p>\r\n	4. Lua (9,80%)</p>\r\n<p>\r\n	5. Seaneh (1,96%)</p>\r\n<p>\r\n	5. Walsh (1,96%)</p>\r\n<p>\r\n	5. Ailton (1,96%)</p>\r\n<p>\r\n	5. CARLEETOS (1,96%)</p>\r\n<p>\r\n	5. Km (1,96%)</p>\r\n<p>\r\n	5. Gunner (1,96%)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong>Assist leader</strong></p>\r\n<p>\r\n	1. Termi (19,61%)</p>\r\n<p>\r\n	2. Iran (17,65%)</p>\r\n<p>\r\n	3. Night-Fire (15,69%)</p>\r\n<p>\r\n	4. Km (13,73%)</p>\r\n<p>\r\n	5. CARLEETOS (7,84%)</p>\r\n<p>\r\n	6. Lua (3,92%)</p>\r\n<p>\r\n	6. Walsh (3,92%)</p>\r\n<p>\r\n	6. XaviT (3,92%)</p>\r\n<p>\r\n	6. Zapdos (3,92%)</p>\r\n<p>\r\n	10. Gunner (1,96%)</p>\r\n<p>\r\n	10. DBD (1,96%)</p>\r\n<p>\r\n	10. Nuri (1,96%)</p>\r\n<p>\r\n	10. Rahmstein (1,96%)</p>\r\n<p>\r\n	10. Tet (1,96%)</p>', 'Iran', 'news5', 1),
(9, 'IOS League #1 staff', '2013-06-15 15:50:15', 'uploads/images/post-1.jpg', '<p>\r\n	As we have no real name for the league the current league will be just named &#39;IOS League #1&#39;. It might change later ;)</p>\r\n<p>\r\n	The current staff is as followed:</p>\r\n<p>\r\n	Organiser:</p>\r\n<p>\r\n	Iran</p>\r\n<p>\r\n	Servers:</p>\r\n<p>\r\n	Orius</p>\r\n<p>\r\n	Match Admins:</p>\r\n<p>\r\n	Gunner<br />\r\n	Gold<br />\r\n	Kobe<br />\r\n	DBD<br />\r\n	Roq</p>\r\n<p>\r\n	Streaming:</p>\r\n<p>\r\n	Rhino<br />\r\n	Kirby<br />\r\n	Writers:</p>\r\n<p>\r\n	Gold<br />\r\n	DBD<br />\r\n	Tet</p>\r\n<p>\r\n	Interviews:</p>\r\n<p>\r\n	DBD<br />\r\n	Tet</p>\r\n<p>\r\n	Judging panel:</p>\r\n<p>\r\n	Gunner<br />\r\n	Roq<br />\r\n	JB3<br />\r\n	Flame</p>', 'Iran', 'news6', 1),
(10, 'IOS IRC Channels moved!', '2013-06-16 00:15:36', 'uploads/images/post-1.jpg', '<p>\r\n	2 IOS IRC Channels (QuakeNet) are getting moved!</p>\r\n<p>\r\n	#ios.mix will replace #ioss.mix</p>\r\n<p>\r\n	#ios.street will replace #ioss.street</p>\r\n<p>\r\n	The main reason for this change is that we want IRC channels to be named &#39;ios&#39; instead of &#39;ioss&#39; with 2 &#39;s&#39;. This will prevent confusion for potential new players.</p>\r\n<p>\r\n	Process will take a while but we believe that all players from #ioss.mix and #ioss.street will be in the new channels in about 1 week.</p>\r\n<p>\r\n	For more information how to use IRC <a href=\\"\\\\\\">read this</a>.</p>', 'Iran', 'news7', 1),
(12, 'Short update on the league', '2013-06-17 18:18:18', 'uploads/images/post-1.jpg', '<p>\r\n	Hey guys!</p>\r\n<p>\r\n	First 3 games have been played! Outside the first game (NextGen vs Gorillas) it went all pretty smooth!</p>\r\n<p>\r\n	The game NextGen vs Gorillas had some weird issues with SourceTV. At half-time Iran client crashed but couldn&#39;t join back in the server because the server was &#39;&#39;full&#39;. Kaiser tried to kick the Source TV but that made the server crash. Due all that 1 part of the stats I had to do by &#39;hand&#39;. This problem seems fixed by changing of 1 command.</p>\r\n<p>\r\n	Bears and Ball Breakers did what they should do and that was to get 3 points. Gorillas surprised the favourites NextGen by taking a point away. Too much pressure for NextGen? After being voted 80% of 51 players to win it all. Time will tell.</p>\r\n<p>\r\n	As you see the league site still ain&#39;t finished yet. If it was finished I already could let other people make articles and other things on the website. But I had problems to fix those &#39;stats&#39; issue and stats is the #1 priority to be fixed before the league games started. Now I slowly work on to let other members of the staff have access to this database ;).</p>\r\n<p>\r\n	&nbsp;</p>', 'Iran', 'news 8', 1),
(13, 'Weekly awards - Matchweek 1', '2013-06-20 17:34:59', 'uploads/images/post-1.jpg', '<p>Here are the awards for Matchweek 1!</p>\r\n<p>Man of the Match (NextGen 1-1 Gorillas) - <strong>CARLEETOS </strong></p>\r\n<p>Marked arguably nG''s biggest threat out of the game, a very solid defensive display.<strong><br /></strong></p>\r\n<p>Man of the Match (Super 7 0-4 Bears) - <strong>Drogba</strong></p>\r\n<p>Despite conceeding 4 goals, Bears could have been in double figures if Drogba hadn''t pulled off some incredible saves.<strong><br /></strong></p>\r\n<p>Man of the Match (Ball Breakers 3-0 Inter Soccer Stars) - <strong>Deluxe</strong></p>\r\n<p>Scored an important goal as well as making some key passes and runs. Was a constant threat to the defensive approach of iSS, and kept them on their toes throughout<strong>.<br /></strong></p>\r\n<p>Goal of the Week - <a href="http://www.youtube.com/watch?v=BisPgkwu8MU#t=6m28s"><strong>Kirby</strong> (0-1 vs Super 7)</a></p>\r\n<p>Blasted the ball into the top corner from outside the box. Despite Drogba having a fantastic game, there was no chance of him saving that.</p>\r\n<p>Team of the Week - <strong>GK:Drogba LB:Shagwa RB:Alaba CDM:CARLEETOS LW:Sean RW:Nuri CAM:Kirby</strong></p>\r\n<p>Congratz to you all!</p>', 'Iran', 'weekly-awards-matchweek-1', 1),
(28, 'Team profile: Gorillas', '2013-06-23 14:26:57', 'assets/img/teams/gs.png', '<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Over the next few days there will be a series of te</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>am reviews including an interview with each team captain to preview the upcoming le</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>ague.</strong></span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><img title="Team profile: Gorillas" src="/uploads/images/gstrans150_3.png" alt="" width="150" height="130" /></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Firstly, we take a look at the Gorillas, prev</span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">io</span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">usly k</span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">nown as Gorillas in</span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> the Mist. Gorillasâ€™ as a team has evolved from the first day or its creation to a serious competitive team with an almighty strike force and defence. They play direct football that causes defences troubled through the superior aerial ability of Gorillas.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">In previous tournaments such as the Gold Cupâ€™s I &amp; II, Gorillas have had heartbreak losing in the semi-finals on both occasions, so I stopped by the Gorillas home for a bowl of Sugar-Puffs and to see their spectacular view from their penthouse over the Shrewsbury forest to talk to the team captain â€“ </span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Gold.</strong></span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">With the new league on our doorstep, have you </span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">and Gorillas been doing some pre-season matches and what''s the attitude in the team towards Sundayâ€™s</span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> first league game?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Gold</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> - Well, we just had the Gold Cup last week which was a good warm-up towards the league as it was some proper competitive matches so it was nice to get a few games in from that, even if we did go out in the semi-finals. I think our first game is going to be against NextGen, so that will be a tough first game so I think we should go into the game thinking we''ve got a good chance as anything can happen.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> Did you think Gorillas performanc</span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">e in the Gold Cup reflected the ability of your current squad?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Gold - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Honestly, I think it did. Righ</span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">t now we''re not in a position to be fighting for first place simply due to the fact we havenâ€™t got a quality goalkeeper. This means Iâ€™ve got to play myself or someone who isnâ€™t as experienced in the role which let us down in the cup. However even without that we still managed to get into the semi-finals which is respectable enough but if we can get a quality goalkeeper in I think we''ve got the ability to challenge.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> With every team captain their number one priority is winning the league but on a personal level, what do you expect from your team in this league?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Gold -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> I think that our team has a chance of doing well this season, I think realistically people will be expecting Bears/nG and BB to be fighting for the first place but i feel we''ve got the quality to join in that hunt as well and be competitive throughout the season.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">From your current squad available to you during this period until the next transfer window, who of your players do you think plays a key role in your team?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Gold - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">I think everyone in my team has the ability to step in and do the job if need be, however I think our best players at the moment are Walsh and Carleetos. Walsh on his day can cause anyone problems and Carleetos is the ultimate all-rounder where no matter where you play him heâ€™s going to perform well</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Gold -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> We''ve also got a other players like Rhino, who although recently hasnâ€™t been exceptional when heâ€™s on form he''ll get you goals</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> With your upcoming game against NextGen on Sunday, clearly they have a very strong squad - but if you could have any player from their team - who</span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> would it be and why?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Gold - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">I think Iâ€™d go with Termiii heâ€™s still fairly new but heâ€™s quickly becoming one of the better wingers in the game as was proved in the Gold Cup last weekend</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> Finally, as a matter of interest because youâ€™re the captain of the team - can you give us a taste of the motivational speeches you perform before big matches?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Gold -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> Win or you''re not getting paid.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><img style="float: left;" title="Team profile: Gorillas" src="/uploads/images/grls2_1.png" alt="" width="299" height="408" /></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Times New Roman,serif;"><span style="font-size: medium;">The recent arrival of Carleetos from rivals Bears has caused a stir in both camps and reports that it was an undisclosed fee of a mathematical set and a sloth. He is an outstanding playmaker, he currently has 7 assist from the previous Gold Cupâ€™s which makes him ranked joint second. The Swedish winger is going to be a big asset and hopes that he is the final piece of the puzzle for Gorillasâ€™ shot as silverware. Other players such as JB3, MonkeyClone, h0w and tet all bring experience to the table. The youth system in Gorillas is yet to make an impression on the scene but Robi, Hexo and Maaby have all made a name for themselves by coming through to potentially be quality stars.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Times New Roman,serif;"><span style="font-size: medium;">The main worry for Gorillas is the obvious lack of a talented goalkeeper which is restricting them back from being there best. Once Gorillas tick, it takes a lot to stop them. There first game is away to NextGen at 18:00 CEST on Sunday.</span></span></p>', 'DBD', 'team-profile-gorillas', 1),
(29, 'Team profile: Bears', '2013-06-23 14:30:43', 'assets/img/teams/bears.png', '<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Over the next few days there will be a series of team reviews including an interview with each team captain to preview the upcoming league.</strong></span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong><img title="Team profile: Bears" src="/uploads/images/bearstrans150_1.png" alt="" width="150" height="150" /></strong></span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">To our second team out of the six, Bears have emerged since the start of the new development of International Online Soccer. Bears are quickly becoming a deadly force with a very strong attacking line-up. They possess the quality and efficiency that sometimes lacks in other teams, be assured that if you make a mistake they will make you pay for it. Bears play a passing game using a lot of width around there wingers. They have the ability to adapt to different styles if it is necessary. </span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Since my visit to the home of Gorillas, the super-rich team of Bears brought me to their summer pre-season training camp in Madagascar. They flew me first-class without any hassle while the supply of Irish whiskey was always welcome. I arrived quite drunk at the Bears HQ as I was escorted by two women in bikinis straight to the spa where I was happily met by the team leader </span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Sean.</strong></span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Bears are a solid outfit, have you and your team been gaining momentum and confidence coming up to Bears first league game against Super 7?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Sean - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">We were really struggling when the league was first announced, half of our team was inactive but now we''ve got a couple of new guys in and we''re playing games, it''s starting to feel good again</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Sean -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> I think by the time the league comes around we''ll be back to our best</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">As far as pre-season is concerned, Bears have won the first Gold Cup is fantastic style but failed to defend their cup by graciously bowing out at the semi-finals, as this had an effect on the team?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Sean</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> - I don''t think so, we knew the second cup was going to be a struggle and we were trying to bed in the newer players such as Hunkii and Alaba, which I think we''ve done quite well</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Sean - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">They''ve now had a taste of competitive IOS and should be prepared for the league if called upon</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Your squad has a high quality standard of players in all positions; for you personally which players are key to your chances of winning the league?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Sean - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">I think Kirby is quite an obvious choice there due to the amount he scores, Roq and NightFire are both an important part of how we play as well, but it is very hard for me to pick out individuals for praise, I think everyone plays off each other really well.</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Personally I think Bears have one of the strongest attacking three but if you could have any three players in the league, who would they be and why?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Sean - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Iâ€™d take Iran, because I''m not sure who wouldn''t take him, heâ€™s so good in every position. I''d also take Kaim because I''m a big fan of his, and I think I''d have to go for someone like Xavit as well</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> What would you consider to be Bears style of playing football? iSS have been branded as </span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><em>â€˜anti-footballâ€™</em></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> with their counter attacking ability, is there a distinctive way that Bears play?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Sean-</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> I think when we''re on form we''ve got a really good passing style of play. We can play from the back which is useful, but at the same time we don''t try to just force it through the middle all the time. Kirby is great in the air so it gives us another option from the wing</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> Close sources to me say that you play motivational music for the team; can you tell us one of your favourite songs to get the lads going?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Sean -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> The song that really gets my team moving is "And We Danced" by Macklemore. They can really relate to it. </span></span><a href="http://tinyurl.com/6duuw4c"><span style="font-family: Verdana,serif;"><span style="font-size: small;"><strong>http://tinyurl.com/6duuw4c</strong></span></span></a></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="color: #000000;"><span style="font-family: Verdana,serif;"><span style="font-size: small;"><em><img style="float: left;" title="Team profile: Bears" src="/uploads/images/bears.png" alt="" width="299" height="427" />Â </em><br /></span></span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-size: small; font-family: Tahoma, serif; line-height: 150%;">Bears have a very good chance of winning the league. If they play to their potential they can certainly beat any team. Iâ€™ve highlighted Kirby as the key player that can win them this league â€“ although it is a team game â€“ but he will be under huge pressure to perform which he always does. Kirby goal scoring has been impeccable scoring 10 goals in the previous two Gold cups making him the deadliest poacher in the game.</span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Kirby needs to be supplied with ball after ball. This will crucial in successfully beating every team and they have the quality to do just that. Ginix, Sean and NightFire will be the platform out wide for Kirby and can beat any defender on their day. Roq, Skum, Grandie, Sudders have the defence presence to keep out even the best attackers. Fonzik needs to show why he is the best goalkeeper, clean sheet are a priority this season and with this defence he has a very good chance.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Bears have started to bring through their new young players and already Alaba is making a name for himself as a great defender. He has had the experience of playing the past Gold Cup II which give these new players a chance to play at a higher level than usual. Watch this space.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Bears need to click, if they donâ€™t get it right on the day theyâ€™ll be in trouble â€“ I regard this team highly and believe they are strong contenders. This whiskey is getting to me. Bears first game is away to Super 7 at 19:30 CEST on Sunday.</span></span></p>', 'DBD', 'team-profile-bears', 1),
(30, 'Team profile: NextGen', '2013-06-23 14:34:30', 'assets/img/teams/ng.png', '<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Over the next few days there will be a series of team reviews including an interview with each team captain to preview the upcoming league.</strong></span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong><img title="Team profile: NextGen" src="/uploads/images/ngtrans150_1.png" alt="" width="150" height="150" /></strong></span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Next up on our list is the review of NextGen. This team has to be the most exciting revolution in recent IOS history. The uses of tactics and footballing philosophies have been more and more implemented into the recent development of IOS and NextGen have been the first team to start this new trend of â€˜Tiki Takaâ€™ style â€“ which is holding possession of the ball. The idea is that if the other team donâ€™t have the ball, they canâ€™t score. This squad of young new players are becoming a major hit with the IOS community.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">With the mountains of whiskey that I consumed with the Bearsâ€™ Boys, it was time for me to jump on my boat and set sail around the world. I was soon running low on beverages that I had to make an emergency stop at Catalonia where I sat drinking non-alcoholic drinks (for once) in the streets of Barcelona when I saw this figure down the road walking towards me. He had a big grin on his face â€“ only for me to realise as he got closer than in-fact is what just his moustache that made him look like he was smiling. I took this time to order myself some dry roasted nuts and to have a chat with NextGenâ€™s captain â€“ </span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Iran.</strong></span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">The league is only a few days away, are you and NextGen prepared for the first major competition since 2007 Summer Cup?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Iran - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Yes we are ready to rock and roll! About time that IOS has a league since the Summer Cup of 2007. Bit ridiculous that it took that long but it is what it is.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> For you to be leading such a talented group of players, what would it mean to you and your team to win this league?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Iran -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> Well according to the poll we are by far the #1 favourite to win it all. That requires expectations and it''s up to us to fulfil it.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> In the history of IOS, footballing tactics and philosophies have never been so important. What is the philosophy that youâ€™re trying to teach your players in the way that you play football?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Iran -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> We''re a team that pass the ball a lot and keep possession. Today it is better known as ''Tiki Taka'' of FC Barcelona. Originally it was Ajax in the 70s who started it (Total Football). Some love to watch our game but there are others that find it boring. The opponent can''t score if our team has the ball. In the old IOS (beta 4, beta 1) it was nearly impossible to play like that but in â€˜IOS Devâ€™ it seems to work pretty well.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">It is clear that you take pride in your ''new players'' by giving them a chance to play in bigger games unlike other teams. From all the players that have recently joined which of them have stood out the most for you and why?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Iran -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> I don''t really have any pride I just don''t think many ''old skool'' IOS players would really fit in the style I want to play with NextGen. So I am willing to give new players a chance. It worked out pretty well. I have to say that the ''new'' players have a small advantage to adapt in the new IOS because the game changed so drastically that many players are on the same level. The best newcomer is by far Termi. It''s not even close. </span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Iran â€“ </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Potentially he is one of the best IOS players. Yes you heard it here.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">For your opening game against ''Gorillas'', are you aiming to play experience over youth? </span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Iran -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> I don''t look at that. Just the best 7 will play. No matter if they played IOS since 2003 or 2013.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> Finally, who''s the longest in the showers after games?</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Iran - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Km and ChouPo ;)</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><em><img style="float: left;" title="Team profile: NextGen" src="/uploads/images/ng.png" alt="" width="299" height="425" />Kits created by Termi pictured on the left</em></span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">NextGen have such a strong squad that itâ€™s hard for me to pick out a key player. Iran would be everybodyâ€™s obvious choice but there not a one-man team. Iâ€™ve highlighted both Xavit and Flame because of just their incredible composure in big games. I think theyâ€™ll determine the difference between winning and losing. They have the ability to pick out any player in the most awkward of situations, there vision is second to none and there range of passing is amazing at times. Iran and co. can score from any situation but NextGen canâ€™t underestimate other teams attacking power. Both Flame and Xavit will determine by how much they win and obviously creating fluidity in there â€˜Tiki Takaâ€™ philosophy.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">The two wingers have a part to play; Km and Zapdos havenâ€™t shown their full potential in recent competitions. Give them an inch of space to shoot and 9 times out of 10 theyâ€™ll score. You just better hope they donâ€™t. The most exciting player recently to grab the headlines is Termi. Keep an eye for this guy who is quickly becoming one of the most deadly strikers in IOS. </span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">The pressure is on NextGen to back up there style of playing and to win the league, by no means is it going to be a stroll in the park for them. NextGenâ€™s first game is the opening game of the league against Gorillas 18:00 (CEST)</span></span></p>', 'DBD', 'team-profile-nextgen', 1);
INSERT INTO `news` (`id`, `title`, `date_created`, `image`, `text`, `author`, `url`, `active`) VALUES
(32, 'Team profile: Inter Soccer Stars', '2013-06-23 14:39:30', 'assets/img/teams/iss.png', '<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>Over the next few days there will be a series of team reviews including an interview with each team captain to preview the upcoming league.</strong></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong><img title="Team profile: Inter Soccer Stars" src="/uploads/images/isstrans150_3.png" alt="" width="150" height="150" /></strong></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;">Weâ€™ve reached the half way stage in our series of reviews. We move onto quite a legendary clan. International Soccer Superstars was established in 2006 and have since grown into such a respected team. Many of the great players originated from iSS. They have always attained the best players around and todayâ€™s current squad is no exception. iSS historically played for each other and played for fun but this new crop of players have added another dimension to their game. They still play for fun and for each other, but they are eager for the win more and more. There hunger for success is what makes them such a great team and keeps this team ticking over year after year.</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;">My stay in Barcelona consisted of women, vodka and the occasional Russian roulette. Letâ€™s say Iâ€™m not that welcome back anytime soon. I received a mysterious phone call from an unknown number telling me to travel to the East Coast of America. On my arrival I was met by a few pizza delivery boys at the airport and brought me to Manhattan. I had a tuxedo fitted and arrived at this amazing poker venue. After endless hours of playing, it was heads-up with another fellow. He shook himself down and ordered an â€˜Old Fashionedâ€™, took off his shades. </span><span style="font-family: Tahoma,serif;"><strong>Gunner</strong></span><span style="font-family: Tahoma,serif;"> had arrived. I took this time to grab a drink with the iSS captain and to have a quick chat.</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>DBD -</strong></span><span style="font-family: Tahoma,serif;"> Firstly, do you think your team is prepared for the upcoming league game on Sunday? Whatâ€™s the attitude been like in the squad?</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>Gunner - </strong></span><span style="font-family: Tahoma,serif;">Yeah Iâ€™d say we are prepared. The gold cup was a great warm-up and although we didnâ€™t win it I thought it was a good learning experience. The attitude in the squad has been great and Iâ€™d say this is one of the best groups of players Iâ€™ve ever had</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>DBD -</strong></span><span style="font-family: Tahoma,serif;"> IOS has (in my opinion) evolved as a game considerably. Do you think the use of tactics and playing styles have been more prominent in the current era. </span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>Gunner -</strong></span><span style="font-family: Tahoma,serif;"> Tactics are more prevalent now since the switch to 7-a-side from 6-a-side. There wasnâ€™t really much you could do with 6v6 but with 7-a-side thereâ€™s an extra man and Iâ€™ve found thatâ€™s made a lot of difference and allows for a bit more variety</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>Gunner -</strong></span><span style="font-family: Tahoma,serif;"> The more players you have on the pitch the less focus there is on individual skill</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>DBD -</strong></span><span style="font-family: Tahoma,serif;"> Year after year, you amaze me by building team after team out of nothing. How this this group of players that you have rank among the other teams youâ€™ve built?</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>Gunner -</strong></span><span style="font-family: Tahoma,serif;"> In terms of attitude this is the absolute best squad Iâ€™ve ever had, itâ€™s not just that though theyâ€™re intelligent players and they know how to win a football match. Iâ€™ve had teams full of good players with bad attitudes in the past and its fun for a little while but once the novelty of winning wears off your left with a bunch of sh*ts you canâ€™t stand.</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>DBD -</strong></span><span style="font-family: Tahoma,serif;"> Some people within the footballing world of IOS have claimed that iSS are â€˜anti-footballâ€™ because of the counter-attacking tactics you use. Do you think itâ€™s right for them to say things like this or are you trying to grind out the win in most occasions?</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>Gunner - </strong></span><span style="font-family: Tahoma,serif;">Itâ€™s stupid, thereâ€™s no right or wrong way to play football. This isnâ€™t just a problem with the IOS community though; itâ€™s a problem with football and football media in general. Defensive solidarity is frowned upon and construed as negative and this is piped into peoples brains by the sports channels and its cultivating a generation of footballers (virtual footy turbo-gamers in this case) who throw a tantrum whenever they donâ€™t get their own way. Everybody is supposed to stand still while they mince around the field like â€˜Billy Elliotâ€™. Greece didnâ€™t win euro 2004 by fluke. They played a system that suited their players, adapted to their opponents and proved that if you work as a unit anything is possible. Football is about more than just attacking. Instead of sending out 7 players and hoping for the best, we actually put some thought into things and for some reason that makes us the baddies. Completely backwards.</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>DBD -</strong></span><span style="font-family: Tahoma,serif;"> I know that IOS is a team game and you really thrive of teamwork in iSS but if there is one player in your squad that is able to make iSS excel in the league, who would it be?</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>Gunner -</strong></span><span style="font-family: Tahoma,serif;"> I think Burni, he is the most naturally gifted player on the game.</span></p>\r\n<p><span style="font-family: Tahoma,serif;"><strong>DBD - </strong></span><span style="font-family: Tahoma,serif;">iSS will face Ball Breakers on Sunday evening â€“ if you could take one of their players from their squad, who would it be?</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>Gunner -</strong></span><span style="font-family: Tahoma,serif;"> I think Chalkeh or Pauer, the rest of the squad is pretty grim.</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>DBD -</strong></span><span style="font-family: Tahoma,serif;"> Since 2006, you''ve had many kits. But can you remembe</span><span style="font-family: Tahoma, serif;">r the ugliest kit that you ever seen in IOS?</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><strong>Gunner - </strong></span><span style="font-family: Tahoma,serif;">The PLB[D] kit was probably the most distressing, it was like being descended upon by a weathered battenburg.</span></p>\r\n<p style="margin-bottom: 0cm;">Â </p>\r\n<p style="margin-bottom: 0cm;">Kits created by Gunner pictured below</p>\r\n<p style="margin-bottom: 0cm;"><br /><img style="float: left;" title="Team profile: Inter Soccer Stars" src="/uploads/images/iss.png" alt="" width="299" height="415" /><span style="font-family: Tahoma,serif;">iSS have a great players and potentially some superb stars. Iâ€™ve noted that iSS defence at times is amazing and a huge amount of that credit is down to their goalkeeper â€“ Burni. The only term that comes to mind when even when I was a youngster was just â€˜Wallâ€™. He reminds me of both old k</span></p>\r\n<p><span style="font-family: Tahoma, serif;">eepers that went into retirement many years ago, Procura and Neuromancer whom both would effectively win their team the game by frustrating the opponents. Burni brings the same level that they brought. If Burni is on top form, itâ€™s going to be hard to beat iSS.</span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;">The counter-attacking ideaâ€™s leave iSS with two centre defensive midfielders that close down any space that the opponent has. Ailton and Lua have the job of being the guys to counter and score. On their day, theyâ€™ll give you a horrid time. The new introductions of Kaim, yvus and Destran have given iSS more variety and have strengthened their squad. </span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;">iSS will be everybodyâ€™s bogey team â€“ just because itâ€™s going to be bloody hard to score against them. They kick off on Sunday against Ball Breakers at 19:30 (CEST)</span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;">Â </p>\r\n<p style="margin-bottom: 0cm;">Â </p>', 'DBD', 'team-profile-inter-soccer-stars', 1),
(33, 'Weekly awards - Matchweek 2', '2013-06-24 01:42:06', 'uploads/images/post-1.jpg', '<p>Here are the awards for Matchweek 2!</p>\r\n<p>Man of the Match (NextGen 5-1 Super 7) - <strong>ChouPo</strong></p>\r\n<p><em>Ran riot in the game with 3 goals and an assist. Was a threat throughout the game and his contribution reflected on the scoreline</em><strong><br /></strong></p>\r\n<p>Man of the Match (Bears 2-0 Ball Breakers) - <strong>Fonzik</strong></p>\r\n<p>Kept a clean sheet and made some match winning saves. Game could have been much tighter if he wasn''t between the posts.<strong><br /></strong></p>\r\n<p>Man of the Match (Gorillas 2-2 Inter Soccer Stars) - <strong>Gunner</strong></p>\r\n<p>Gunner - Helped out his defence with a great defensive display, as well as grabbing himself a goal at the other end of the pitch.</p>\r\n<p>Goal of the Week - <a href="http://www.youtube.com/watch?v=di-nMdwU__4#t=11m48s"><strong>ChouPo</strong> (2-0 vs Super 7)</a></p>\r\n<p>Team of the Week - <strong>GK:Fonzik LB:Realms RB:Alaba CDM:Roq LW:Termi RW:Sean CAM:ChouPo</strong></p>\r\n<p>Found himself acres of space before lobbing Drogba gracefully from a tight angle<strong><br /></strong></p>\r\n<p>Congratz to you all!</p>', 'Iran', 'weekly-awards-matchweek-2', 1),
(34, 'Matchweek 2 Roundup', '2013-06-24 02:14:22', 'uploads/images/post-1.jpg', '<p dir="ltr">The second weekend of the IOS League has now been completed and there was a little bit of movement as far as the table is concerned with NextGen moving up one place from 3rd to 2nd after their 5 - 1 over super 7. We also saw Ball Breakers move down in the opposite direction to 3rd place after their 2 - 0 defeat at the hands of bears who are now sitting at the top of the table after two victories in a row with 6 points. Gorillas, International Soccer Superstars and Super 7 all stayed in their respective positions after week 2.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr"><strong>NextGen 5 - 1 Super 7</strong></p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">The first game of the day saw league favorites NextGen host the underdogs of the league: Super7. The game started as many expected with NextGen seeing the majority of the ball up until the 15th minute when Flame brought the ball out of the defence and played a ball to Termii on the wing who saw the run of Choupo through the middle and played a fantastic ball. Choupo confidently sidestepped the keeper and slotted it into the back of the net.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">After this the game settled down as both teams tried to settle into their rhythm after the opening goal with not much happening until the 39th minute, when Drog played a long ball forward for Simao to head it past Flame, the ball bounced perfectly for the volley which Simao took; the effort was confidently handled by Hiei. The 2nd goal of the game came at the death of the first half in the 45th minute. After a scramble on the edge of the box which saw Neuromancer attempt a tackle only for choupo to chip it over the defender, then go for a cheeky curling lob which left the keeper for dead and made the game 2-0.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">The 3rd goal of the game came on the 51st minute when Termii had the ball on the left wing as he played a good ball into choupo, who tried to dribble it past the 2 defenders only to lose out. Luckily it bounced off the s7 goalkeeper allowing him to pick out Xedem to finish it past the 2 defenders on the line making it 3-0. Things went from bad to worse for super7 after Neuromancer got sent off for his second bookable offense of the game only moments later after the restart. The resulting foul gave the Home team a penalty which fell to the interim captain Flame, only for him to miraculously miss as Drog made a fantastic save.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">NextGen made the game 4-0 in the 68th minute when they brought home a beautifully worked short corner which choupo slotted home to secure his hattrick. Super7 answered immediately after the break though as rage found himself down the right wing on a counter attack where he played a good ball into the middle for SImao who powered it into the back of the net from outside the area. It was too little too late though as again only moment after this goal NextGen made the game 5 - 1 only 2 minutes after Simao scored his first goal of the season Xedem scored what could potentially be a goal of the week contender with a fantastic curling shot from outside the area into the near post straight past the keeper.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">The game then continued with little of note happening in the last 30 minutes besides Simao getting his second yellow of the game in the 92nd minute as super7 lost their discipline. NextGen claimed their first win of the season and they did it in style scoring Â 5 past a lacklustre Super7 team. Whereas Super7 lost their 2nd game in as many matches, they go into their game against iSS hoping they can break their run of form and come out with a victory..</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr"><strong>Bears 2 - 0 Ball Breakers</strong></p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">The second game of the day saw current league leaders Bears host Ball Breakers in a game that would decide who would go top of the league at the end of the weekend. One of the big absences of the game was that of Kirby who was not even on the bench as his goal threat is unmatched and may have been sorely missed by bears.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">The game started slowly with both teams feeling each other out until the 18th minute when Seaneh broke the deadlock with a powerful header into the back of the net. The goal came after a fantastic cross in from Night-Fire who played a floating ball into the box as Seaneh peeled away from DBD and met the ball mid-flight, re-directing it straight past Hpayer. A good header from a player who is not typical known for his heading ability. 1-0 to Bears.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">Both of the keepers saw a lot of the ball this game as they both made save after save for their teams with Hpayer making a total of 13 saves and Fonzik making 16 saves overall. This was a game which saw a lot of chances being created, but not a lot of them being finished off.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">The second and final goal of the game came in the 46th minute after another headed goal, this time from Night-Fire as Seaneh returned the favour. Seaneh played a good ball into the box from the corner as Night-Fire found some space in front of the defender and finished it past DBD who came off the line.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">The only other thing of note would be what can only be described as a rugby scrum in the 60th minute as a group of 9 players from both team all charged into a big ball and tried to get the ball inside the 6 yard box.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">An all out attack game from both teams that brought out good performances from the two keepers howevers Bears where more clinical in their finishing and that is ultimatly what resulted in the win. Bears are sitting comfortable on 6 points at the moment as they head into their next game against NextGen. While BB may be wondering how they werenâ€™t able to get anything out of this game they have a lot of positives to take with them going into their next game against Gorillas.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr"><strong>Gorillas 2 - 2 International Soccer Superstars</strong></p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">The final game of the day saw International Soccer Superstars visit the home of the Gorillas. iSS came off of a 2-0 defeat to BB from the week before as Gorillas came into the match wondering how they were not able to grab all 3 points nG as they scored at the death to secure the draw. Both teams went into this game hoping to grab their first win of the season.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">The game started in disaster for Gorillas who went down 1-0 early on after a clearance from Fuzz found its way to Lua after he lost his marker and was on on one win the Goldeh. The iSS striker slotted the ball in the top corner as it came off the crossbar and went into the net. The first half went by very with not much happening as the score was 1-0 when both teams went in at the half.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">The 2nd goal of the game came in the 48th minute when Seven|up was brought down in the iSS box resulting in a penalty. Seven|up confidently stepped up and finished it to bring the score level at 1-1.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">iSSs second goal came in the 65th minute when Gunner fired in a shot from outside of the area after the ball was cleared by the Gorillas defence. The shot fooled the Gorillas goalkeeper and went past him to bring the game to 2-1. Later in the game however Gunner went from iSS hero to villain as he scored an inexplicable own goal in the 83rd minute as he tried to clear a cross inside the area only for the ball to richochet off the back of his leg and over his keeper. The score leveled out at 2-2.</p>\r\n<p><strong>Â </strong></p>\r\n<p dir="ltr">Both teams came out the game disappointed with only a point as both of them felt they could perhaps have won it for them with the amount of chances they both posed. This game means that both of these teams have yet to win in the new IOS League and they will want to change that soon.</p>\r\n<p>Â </p>', 'Goldeh', 'matchweek-2-roundup', 1),
(35, 'Team profile: Super 7', '2013-06-26 02:34:14', 'assets/img/teams/s7.png', '<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Over the next few days there will be a series of team reviews including an interview with each team captain to preview the upcoming league.</strong></span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong><img title="Team profile: Super 7" src="/uploads/images/s7trans150.png" alt="" width="150" height="150" /></strong></span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Our review continues with Super 7, the penultimate review. Previously known as Super 6, due to the change of format in IOS has taken from being a 6-a-side to a 7-a-side football match. This team represents much of the old guard of IOS, priding themselves of experience and determination regardless of what happens â€“ most of all I see a team that enjoys playing just for the â€˜craicâ€™ and the sheer love of the game. Teams will face S7 and automatically think that itâ€™s going to be an easy ride but itâ€™s actually not. Donâ€™t underestimate S7 because they are efficient if you donâ€™t take your chances and will punish you. They have a very strong defence in my opinion when they work together.</span></span></p>\r\n<p style="margin-bottom: 0cm; line-height: 150%;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">My poker tournament left me broke â€“ only enough money to get a big yellow taxi. Reminded me so much of this song that I hate so f**king much </span></span><a href="http://tinyurl.com/ycwhafb"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>http://tinyurl.com/ycwhafb</strong></span></span></a><span style="color: #fff;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>.</strong> All my misery eventually got me deported back to Ireland only for my flight to have an emergency landing in the Atlantic Ocean. I woke up on this magical island and had to make myself a raft with no help from the internet. There was a surprising amount of whiskey and kebab crates on the island. Soon this tribe emerged, 7 of the oddest people youâ€™d see. One man stepped forward and starting smelling me. He picked up a rock and handed it to me and said â€œI am Mod-i-gaâ€. I had a quick chat with Modiga as the Super7 team were actually apparently training for a soap opera. </span></span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> So weâ€™ve played two games so far in the league. How do you think your team has played and whatâ€™s the attitude of the players now?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Modiga -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> Well it''s obviously been a little bit of a struggle in the games, but we know that. We know we don''t have the best set of players for now but we like to just give it our all. Last game was difficult because with the clock ticking on, we only had five players online but we got the team out there and gave it a go. We''re showing glimpses but for now it''s all a bit of a working progress.</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> We chatted last week before the first game and it had to be delayed because s7 were low on players, are you going to try to bring in more free agents or players in the transfer window?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Modiga -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> Well we do actually have quite a lot of active players getting back into the game. The team became a bit inactive when I was inactive but now we''re back and we have the likes of Tsub now playing again which is great. But we are always looking for players as any player worth trying should be tried.</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">We see more and more new players becoming regular starters for other teams and your squad possess a lot of old school players; do you think thatâ€™s a bad thing these days because of the way IOS has developed?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Modiga</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> - Possibly but I would guess it''s been more down to me being inactive the last month or so. I''ve been talking to a few players recently about joining the squad and there''s also an element that a few months ago s6 (as it was then) lost a lot of key players and we had to rebuild the team from scratch almost.</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> What style of football are s7 trying to implement compared to the tactics of iSS and others. Whatâ€™s your view on the use of tactics in the game now since this has become a welcoming new area of interest?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Modiga -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> Well at the moment we have a lot to work on because we''re coming out of games with low possession and low pass completion. I would love us to implement a fast moving passing system and we do have the players to get that going with practise. I love that tactics are being used in the game now; we need the different styles for it work as a football game. We could go into each game with a strategy of 4 behind the ball and 2 up top but that''s no fun but I would not argue the case of any other team playing that way. In time we might have a strategy going that really works for us but we all know that this season is a work in progress for us.</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> Personally, I''m a big fan of s7 because of the characters that they have on and off the field. You recently drafted Doc is as another goalkeeper but I do think that s7 need two or three more players to start challenging for the league. If you could pick any two players from the league, who would they be and why?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Modiga - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">It is enjoyable because we play just for the hell of it and laugh over the micâ€™s in league games when Wilmots scores lovely own goals. But if I could have two players, I would want players to have a character, who will have a laugh over the mic and not rage at every mistake that happens. My first pick would be Sean, because he was a key member with s6 and have always enjoyed playing alongside him. </span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Modiga -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> My second choice would probably be Xedem, just to see the interactions between him and Niang (also because he can score a goal or two). Of course if we had those two I would probably have to watch the game from the bench.</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> There have been complications at the s7 camp â€“ talks with your player Simao have had reports that he has left the club yet he played and scored in your previous game. Is he backing and if he goes who are you going to replace him with?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Modiga -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> Simao thankfully came into the team yesterday because for different reasons (all understandable reasons), players couldn''t get on after saying they would the day before. He left due to complications but I felt that after coming in for us (and scoring a goal) that he could come back if he wanted. He has agreed to do so, so is now back in our squad. Although it doesn''t seem it, we are all actually quite active now with the likes of Drog playing two games, Neuro playing yesterday and Tsub now back. Those three had been recommended by Iran to not be put in the match roster but I am glad to have them in my squad.</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>DBD -</strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;"> If you were to bring your team on an activity day, where would you bring them and who would get lost?</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><strong>Modiga - </strong></span></span><span style="font-family: Tahoma,serif;"><span style="font-size: small;">We would obviously go white water rafting just to make sure Niang gets thrown off at some point. Wilmots and Luisa would probably jump off together to get each other wet (not that way you disgustingly minded person) while Orius will be trying to sell servers to guys on boats we go past. And yes we would be going past other boats, because we''re the best team in the game! (as long as you''re ordering the column on disciplinary record)</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;">Super 7 have a tough league ahead of them but are growing week by week. Iâ€™ve focused on Modiga as their key player and captain, if he can steer the team to safety without any crew members jumping ship then itâ€™s a good result as far as they are concerned. I think he brings experience, incentive and knowledge of IOS to s7 style which is good. Their key players right now are Wilmots, Orius and Drog, keep that defence solid is their priority as well as two emerging talents of Simu and Simao. If Simao stays at s7 (which I hope he does) they have kept a quality striker who fits perfectly there.</span></span></p>\r\n<p style="margin-bottom: 0cm;"><span style="font-family: Tahoma,serif;"><span style="font-size: small;"><img title="Team profile: Super 7" src="/uploads/images/s7.png" alt="" width="194" height="358" /></span></span></p>\r\n<p style="margin-bottom: 0cm;">Â </p>\r\n<p style="margin-bottom: 0cm;">Â </p>', 'DBD', 'team-profile-super-7', 1);

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `club_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pos` varchar(255) NOT NULL,
  `steam_id` varchar(255) NOT NULL,
  `steam_id64` varchar(255) NOT NULL,
  `nation` varchar(255) NOT NULL,
  `games` int(11) NOT NULL,
  `goals` int(11) NOT NULL,
  `assists` int(11) NOT NULL,
  `shots` int(11) NOT NULL,
  `shotsot` int(11) NOT NULL,
  `passes` int(11) NOT NULL,
  `passescp` int(11) NOT NULL,
  `interceptions` int(11) NOT NULL,
  `saves` int(11) NOT NULL,
  `fouls` int(11) NOT NULL,
  `foulssuf` int(11) NOT NULL,
  `ycards` int(11) NOT NULL,
  `rcards` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=237 ;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `club_id`, `name`, `pos`, `steam_id`, `steam_id64`, `nation`, `games`, `goals`, `assists`, `shots`, `shotsot`, `passes`, `passescp`, `interceptions`, `saves`, `fouls`, `foulssuf`, `ycards`, `rcards`) VALUES
(120, 18, 'Iran', 'Allrounder', 'STEAM_0:0:25699948', '76561198011665624', 'europe/ned.png', 1, 0, 0, 1, 0, 29, 22, 5, 0, 0, 0, 0, 0),
(121, 18, 'Flame', 'Allrounder', 'STEAM_0:1:4259', '76561197960274247', 'other/gbr.png', 2, 0, 1, 2, 2, 83, 70, 34, 0, 0, 0, 0, 0),
(122, 18, 'Termi', 'Winger', 'STEAM_0:1:13587077', '76561197987439883', 'europe/ger.png', 2, 0, 2, 3, 2, 95, 57, 5, 0, 0, 1, 0, 0),
(123, 18, 'ChouPo', 'Allrounder', 'STEAM_0:0:16735574', '76561197993736876', 'europe/ger.png', 2, 3, 1, 7, 5, 61, 46, 19, 0, 0, 2, 0, 0),
(124, 18, 'Zapdos', 'Winger', 'STEAM_0:0:6789707', '76561197973845142', 'europe/isr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(125, 18, 'Km', 'Winger', 'STEAM_0:0:3829635', '76561197967924998', 'europe/den.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(126, 18, 'Xedem', 'Allrounder', 'STEAM_0:0:21008476', '76561198002282680', 'europe/den.png', 1, 2, 1, 7, 6, 38, 26, 8, 0, 0, 1, 0, 0),
(127, 18, 'XaviT', 'Allrounder', 'STEAM_0:1:7390716', '76561197975047161', 'europe/esp.png', 1, 0, 0, 0, 0, 32, 26, 12, 0, 0, 1, 0, 0),
(128, 18, 'Kobe', 'Keeper', 'STEAM_0:0:20301667', '76561198000869062', 'europe/bel.png', 1, 0, 0, 1, 0, 18, 11, 2, 0, 0, 0, 0, 0),
(129, 18, 'Shagwa', 'Defense', 'STEAM_0:1:14849456', '76561197989964641', 'other/gbr.png', 1, 1, 0, 1, 1, 31, 29, 12, 0, 0, 0, 0, 0),
(130, 18, 'LagHack', 'Defense', 'STEAM_0:0:449236', '76561197961164200', 'namerica/usa.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(132, 18, 'Hiei', 'Keeper', 'STEAM_0:1:10824911', '76561197981915551', 'europe/esp.png', 2, 0, 0, 0, 0, 33, 26, 7, 9, 0, 0, 0, 0),
(133, 18, 'Realms', 'Defense', 'STEAM_0:1:11674195', '76561197983614119', 'europe/ger.png', 1, 0, 0, 0, 0, 29, 24, 17, 0, 0, 1, 0, 0),
(134, 18, 'MeanMachine', 'Allrounder', 'STEAM_0:1:1975079', '76561197964215887', 'namerica/usa.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(148, 20, 'Goldeh', 'Defense', 'STEAM_0:1:375116', '76561197961015961', 'other/gbr.png', 2, 0, 0, 0, 0, 25, 15, 23, 4, 0, 0, 0, 0),
(149, 20, 'Rhino', 'Attack', 'STEAM_0:1:4460440', '76561197969186609', 'other/gbr.png', 2, 0, 0, 2, 2, 53, 17, 5, 0, 0, 0, 0, 0),
(150, 20, 'Walsh', 'Winger', 'STEAM_0:1:7479248', '76561197975224225', 'other/gbr.png', 1, 1, 0, 2, 2, 18, 12, 8, 0, 0, 0, 0, 0),
(151, 20, 'h0w', 'Allrounder', 'STEAM_0:1:338617', '76561197960942963', 'namerica/usa.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(152, 20, 'JB3', 'Defense', 'STEAM_0:1:3131808', '76561197966529345', 'other/gbr.png', 1, 0, 0, 1, 1, 21, 12, 15, 0, 0, 0, 0, 0),
(153, 20, 'Seven|Up', 'Attack', 'STEAM_0:1:3695202', '76561197967656133', 'europe/ned.png', 2, 1, 1, 2, 2, 20, 10, 6, 1, 0, 1, 0, 0),
(154, 20, 'CARLEETOS', 'Allrounder', 'STEAM_0:1:15187119', '76561197990639967', 'europe/swe.png', 2, 0, 0, 0, 0, 52, 35, 35, 0, 0, 2, 0, 0),
(155, 20, 'Tet', 'Defense', 'STEAM_0:0:1102396', '76561197962470520', 'other/gbr.png', 2, 0, 0, 0, 0, 44, 24, 25, 0, 1, 0, 0, 0),
(156, 20, 'Robi', 'Allrounder', 'STEAM_0:0:12510914', '76561197985287556', 'europe/por.png', 1, 0, 0, 0, 0, 13, 8, 6, 0, 0, 0, 0, 0),
(157, 20, 'Hexo', 'Winger', 'STEAM_0:0:8176435', '76561197976618598', 'europe/den.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(158, 20, 'Cuppatea', 'Keeper', 'STEAM_0:0:53790991', '76561198067847710', 'other/gbr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(159, 20, 'Monkeyclone', 'Winger', 'STEAM_0:1:245919', '76561197960757567', 'other/gbr.png', 2, 0, 1, 5, 4, 29, 13, 9, 0, 0, 0, 0, 0),
(160, 20, 'Maaby', 'Allrounder', 'STEAM_0:1:16309560', '76561197992884849', 'europe/nor.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(161, 21, 'Thinge', 'Winger', 'STEAM_0:0:54255', '76561197960374238', 'other/gbr.png', 1, 0, 0, 8, 8, 18, 9, 3, 0, 0, 0, 0, 0),
(162, 21, 'Chalkeh', 'Defense', 'STEAM_0:0:693598', '76561197961652924', 'other/gbr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(163, 21, 'Marsi', 'Defense', 'STEAM_0:1:1706943', '76561197963679615', 'europe/svn.png', 2, 0, 0, 3, 3, 66, 45, 34, 0, 1, 0, 1, 0),
(164, 21, 'Pauer', 'Allrounder', 'STEAM_0:0:1549547', '76561197963364822', 'europe/ger.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(165, 21, 'Rahmstein', 'Winger', 'STEAM_0:1:4704965', '76561197969675659', 'europe/ger.png', 1, 1, 0, 2, 2, 39, 9, 2, 0, 0, 0, 0, 0),
(166, 21, 'DBD', 'Allrounder', 'STEAM_0:1:14969985', '76561197990205699', 'other/gbr.png', 1, 0, 0, 0, 0, 28, 11, 13, 0, 0, 0, 0, 0),
(167, 21, 'Hpayer', 'Keeper', 'STEAM_0:1:10210350', '76561197980686429', 'europe/aut.png', 2, 0, 0, 0, 0, 29, 16, 10, 14, 0, 0, 0, 0),
(168, 21, 'Salix', 'Defense', 'STEAM_0:1:3007736', '76561197966281201', 'europe/fra.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(169, 21, 'Romdi', 'Allrounder', 'STEAM_0:0:31446984', '76561198023159696', 'europe/ger.png', 1, 0, 0, 0, 0, 37, 17, 10, 0, 0, 0, 0, 0),
(170, 21, 'Denneh', 'Defense', 'STEAM_0:0:4060750', '76561197968387228', 'europe/ned.png', 2, 0, 0, 0, 0, 84, 57, 39, 0, 2, 1, 1, 0),
(171, 21, 'Nuri', 'Winger', 'STEAM_0:1:19983526', '76561198000232781', 'europe/ned.png', 2, 1, 0, 6, 6, 44, 24, 1, 0, 0, 1, 0, 0),
(172, 21, 'Kaka22', 'Defense', 'STEAM_0:1:2560612', '76561197965386953', 'europe/ger.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(173, 21, 'Deluxe', 'Attack', 'STEAM_0:0:4040405', '76561197968346538', 'europe/ger.png', 2, 1, 0, 5, 4, 57, 46, 11, 0, 0, 0, 0, 0),
(174, 21, 'Kajia', 'Defense', 'STEAM_0:1:695537', '76561197961656803', 'other/gbr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(175, 21, 'Filip', 'Keeper', 'STEAM_0:0:36885', '76561197960339498', 'europe/esp.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(176, 21, 'Katsuo', 'Defense', 'STEAM_0:1:1546674', '76561197963359077', 'europe/fra.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(177, 21, 'Quincy', 'Attack', 'STEAM_0:0:4968025', '76561197970201778', 'asia/chn.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(178, 21, 'Saddeh', 'Attack', 'STEAM_0:1:920838', '76561197962107405', 'other/gbr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(179, 22, 'Seaneh', 'Winger', 'STEAM_0:0:4358091', '76561197968981910', 'other/gbr.png', 2, 1, 2, 19, 13, 53, 28, 5, 0, 0, 0, 0, 0),
(180, 22, 'Night-Fire', 'Winger', 'STEAM_0:0:9347196', '76561197978960120', 'europe/bel.png', 2, 2, 1, 8, 8, 57, 36, 15, 0, 2, 1, 1, 0),
(181, 22, 'Ginixx', 'Attack', 'STEAM_0:1:128662', '76561197960523053', 'europe/ned.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(182, 22, 'Kirby', 'Attack', 'STEAM_0:1:5846747', '76561197971959223', 'other/gbr.png', 1, 2, 1, 7, 6, 44, 27, 9, 0, 1, 0, 1, 0),
(183, 22, 'TopCat', 'Defense', 'STEAM_0:0:3151265', '76561197966568258', 'other/gbr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(184, 22, 'Skum', 'Defense', 'STEAM_0:1:3280605', '76561197966826939', 'europe/esp.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(185, 22, 'Sudders', 'Defense', 'STEAM_0:1:153410', '76561197960572549', 'other/gbr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(186, 22, 'Grandie', 'Allrounder', 'STEAM_0:1:159774', '76561197960585277', 'europe/fin.png', 1, 0, 1, 5, 5, 28, 14, 5, 0, 0, 1, 0, 0),
(187, 22, 'Roq', 'Defense', 'STEAM_0:1:10938960', '76561197982143649', 'europe/ger.png', 2, 0, 0, 1, 0, 70, 48, 49, 0, 1, 0, 1, 0),
(188, 22, 'RvdV', 'Defense', 'STEAM_0:0:5049921', '76561197970365570', 'europe/ger.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(189, 22, 'Fonzik', 'Keeper', 'STEAM_0:1:28980011', '76561198018225751', 'europe/den.png', 2, 0, 0, 0, 0, 48, 33, 29, 16, 0, 0, 0, 0),
(190, 22, 'Diakun', 'Keeper', 'STEAM_0:1:22036119', '76561198004337967', 'other/gbr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200, 24, 'Modiga', 'Attack', 'STEAM_0:0:1114060', '76561197962493848', 'other/gbr.png', 2, 0, 0, 2, 2, 29, 13, 10, 0, 1, 1, 1, 0),
(201, 24, 'Orius', 'Allrounder', 'STEAM_0:0:1608509', '76561197963482746', 'europe/ned.png', 1, 0, 0, 0, 0, 30, 17, 20, 0, 0, 1, 0, 0),
(202, 24, 'Wilmots', 'Defense', 'STEAM_0:1:318147', '76561197960902023', 'europe/bel.png', 2, 0, 0, 1, 0, 56, 27, 33, 0, 0, 1, 0, 0),
(203, 24, 'Luisa', 'Winger', 'STEAM_0:1:495762', '76561197961257253', 'europe/esp.png', 1, 0, 0, 1, 1, 14, 8, 1, 0, 0, 0, 0, 0),
(204, 24, 'Rage', 'Winger', 'STEAM_0:0:1630521', '76561197963526770', 'europe/ger.png', 1, 0, 1, 1, 1, 13, 3, 2, 0, 0, 0, 0, 0),
(205, 24, 'Fluke', 'Keeper', 'STEAM_0:1:3194644', '76561197966655017', 'other/gbr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(206, 24, 'Ashley', 'Winger', 'STEAM_0:0:10372338', '76561197981010404', 'other/gbr.png', 1, 0, 0, 2, 1, 16, 6, 6, 0, 0, 0, 0, 0),
(207, 24, 'Simu', 'Winger', 'STEAM_0:0:28327390', '76561198016920508', 'europe/aut.png', 1, 0, 0, 2, 1, 25, 16, 2, 0, 1, 0, 1, 0),
(208, 24, 'Daap', 'Defense', 'STEAM_0:1:4373127', '76561197969011983', 'europe/den.png', 1, 0, 0, 1, 0, 30, 10, 15, 0, 0, 0, 0, 0),
(209, 24, 'Simao', 'Winger', 'STEAM_0:0:9330823', '76561197978927374', 'namerica/usa.png', 1, 1, 0, 2, 2, 34, 16, 10, 0, 2, 0, 2, 1),
(210, 24, 'Niang', 'Allrounder', 'STEAM_0:0:609181', '76561197961484090', 'europe/fra.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(211, 24, 'Khaledinho', 'Winger', 'STEAM_0:0:46719805', '76561198053705338', 'africa/egy.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(212, 23, 'Gunner', 'Allrounder', 'STEAM_0:0:4263948', '76561197968793624', 'other/gbr.png', 2, 1, 0, 2, 2, 69, 33, 31, 0, 0, 0, 0, 0),
(213, 23, 'Burni', 'Keeper', 'STEAM_0:1:3525087', '76561197967315903', 'europe/fin.png', 2, 0, 0, 0, 0, 24, 11, 13, 11, 0, 0, 0, 0),
(214, 23, 'Ailton', 'Winger', 'STEAM_0:1:24141346', '76561198008548421', 'europe/ger.png', 2, 0, 0, 1, 1, 25, 14, 0, 0, 0, 1, 0, 0),
(215, 23, 'Destran', 'Defense', 'STEAM_0:0:31533268', '76561198023332264', 'europe/esp.png', 1, 0, 0, 0, 0, 16, 10, 14, 0, 0, 0, 0, 0),
(216, 23, 'EltonJohn', 'Defense', 'STEAM_0:0:686966', '76561197961639660', 'other/gbr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(217, 23, 'Fuzz', 'Defense', 'STEAM_0:0:4190900', '76561197968647528', 'other/gbr.png', 1, 0, 1, 0, 0, 12, 4, 8, 0, 0, 0, 0, 0),
(218, 23, 'GaMs', 'Defense', 'STEAM_0:1:27049702', '76561198014365133', 'europe/esp.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(219, 23, 'Greggles', 'Keeper', 'STEAM_0:0:19170329', '76561197998606386', 'other/gbr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(221, 23, 'Kaim', 'Keeper', 'STEAM_0:0:38070080', '76561198036405888', 'europe/esp.png', 2, 0, 0, 0, 0, 44, 16, 25, 0, 0, 0, 0, 0),
(222, 23, 'Larsson', 'Defense', 'STEAM_0:1:5524635', '76561197971314999', 'europe/ger.png', 2, 0, 0, 0, 0, 38, 16, 37, 0, 0, 0, 0, 0),
(223, 23, 'Lua', 'Winger', 'STEAM_0:1:7116806', '76561197974499341', 'other/gbr.png', 2, 1, 0, 3, 3, 38, 18, 6, 0, 1, 1, 0, 0),
(224, 23, 'Moses', 'Winger', 'STEAM_0:1:2371785', '76561197965009299', 'namerica/usa.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(225, 23, 'Ryaninho', 'Defense', 'STEAM_0:1:1547208', '76561197963360145', 'namerica/usa.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(226, 23, 'Yvus', 'Defense', 'STEAM_0:1:121871', '76561197960509471', 'europe/bel.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(227, 23, 'Zlatan', 'Winger', 'STEAM_0:0:29491899', '76561198019249526', 'europe/swe.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(228, 24, 'Neuromancer', 'Defense', 'STEAM_0:0:856270', '76561197961978268', 'other/gbr.png', 1, 0, 0, 0, 0, 12, 7, 5, 0, 2, 0, 2, 1),
(229, 24, 'Drogba', 'Keeper', 'STEAM_0:0:10062113', '76561197980389954', 'europe/fra.png', 2, 0, 0, 0, 0, 41, 14, 10, 24, 0, 0, 0, 0),
(230, 24, 'Tsubasa', 'Defense', 'STEAM_0:0:5573542', '76561197971412812', 'europe/ger.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(231, 20, 'Earneh', 'Defense', 'STEAM_0:0:18027624', '76561197996320976', 'other/gbr.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(232, 22, 'Alaba', 'Defense', 'STEAM_0:0:34848565', '76561198029962858', 'europe/ger.png', 2, 0, 1, 1, 1, 30, 16, 26, 0, 1, 0, 1, 0),
(233, 22, 'Hunkii', 'Keeper', 'STEAM_0:1:19489062', '76561197999243853', 'europe/fra.png', 1, 0, 0, 0, 0, 14, 11, 2, 6, 0, 0, 0, 0),
(234, 23, 'Paw', 'Winger', 'STEAM_0:1:25290806', '76561198010847341', 'europe/esp.png', 1, 0, 0, 0, 0, 7, 4, 3, 0, 0, 0, 0, 0),
(235, 24, 'Doc', 'Keeper', 'STEAM_0:0:8592105', '76561197977449938', 'europe/swe.png', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(236, 22, 'St.Rolex', 'Defense', 'STEAM_0:1:15544025', '76561197991353779', 'europe/rus.png', 1, 0, 0, 0, 0, 17, 8, 10, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `polls`
--

CREATE TABLE IF NOT EXISTS `polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` varchar(255) NOT NULL,
  `q1` text NOT NULL,
  `q2` text NOT NULL,
  `q3` text NOT NULL,
  `q4` text NOT NULL,
  `ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;

--
-- Dumping data for table `polls`
--

INSERT INTO `polls` (`id`, `player`, `q1`, `q2`, `q3`, `q4`, `ip`) VALUES
(1, 'Iran', 'nG', 's7', 'Kirby', 'Termi', '77.248.25.223'),
(2, 'Flame', 'nG', 's7', 'Kirby', 'Termi', '82.42.223.211'),
(3, 'ChouPo', 'nG', 'iSS', 'Termi', 'Termi', '178.3.7.228'),
(4, 'Goldeh', 'nG', 'iSS', 'Kirby', 'Walsh', '77.97.88.190'),
(5, 'Wilmots', 'Bears', 's7', 'Kirby', 'Night-Fire', '81.241.30.201'),
(6, 'Maaby', 'nG', 'Gs', 'Kirby', 'Iran', '31.45.38.103'),
(7, 'Burni', 'nG', 'Bears', 'Iran', 'CARLEETOS', '87.100.170.151'),
(8, 'Walsh', 'nG', 's7', 'Lua', 'Km', '81.106.37.172'),
(9, 'XaviT', 'nG', 's7', 'Iran', 'Km', '89.29.214.55'),
(10, 'Tet', 'iSS', 's7', 'Iran', 'CARLEETOS', '82.8.27.154'),
(11, 'DBD', 'BB', 'iSS', 'Lua', 'Night-Fire', '109.77.235.174'),
(12, 'Lua', 'nG', 's7', 'Iran', 'Gunner', '31.51.7.154'),
(13, 'Simao', 'Gs', 's7', 'Gunner', 'Lua', '24.218.99.232'),
(14, 'CARLEETOS', 'nG', 's7', 'Iran', 'Termi', '85.24.236.149'),
(15, 'Zapdos', 'nG', 's7', 'Iran', 'Km', '79.177.67.70'),
(16, 'Orius', 'BB', 's7', 'Km', 'Rahmstein', '213.125.120.150'),
(17, 'Yvus', 'nG', 's7', 'Kirby', 'Termi', '87.64.7.63'),
(18, 'Simu', 'nG', 's7', 'Iran', 'DBD', '88.117.8.53'),
(19, 'Robi', 'nG', 's7', 'Walsh', 'Iran', '95.94.229.170'),
(20, 'h0w', 'Gs', 's7', 'CARLEETOS', 'Tet', '72.89.138.28'),
(21, 'Hexo', 'nG', 'Bears', 'Lua', 'Walsh', '87.49.33.61'),
(22, 'Monkeyclone', 'nG', 's7', 'Kirby', 'Night-Fire', '90.201.211.184'),
(23, 'Seven|Up', 'nG', 's7', 'Iran', 'XaviT', '77.175.93.46'),
(24, 'Realms', 'nG', 's7', 'Termi', 'Iran', '84.128.237.14'),
(25, 'Luisa', 'nG', 's7', 'Kirby', 'XaviT', '62.43.63.49'),
(26, 'Drogba', 'nG', 's7', 'Seaneh', 'Night-Fire', '109.209.191.114'),
(27, 'Ailton', 'nG', 'iSS', 'Iran', 'Km', '93.196.213.135'),
(28, 'Km', 'nG', 's7', 'Iran', 'Termi', '95.166.74.252'),
(29, 'Kobe', 'nG', 'iSS', 'Iran', 'Zapdos', '83.101.2.117'),
(30, 'Seaneh', 'Bears', 's7', 'Kirby', 'Night-Fire', '62.25.109.198'),
(31, 'Deluxe', 'nG', 'iSS', 'Iran', 'Night-Fire', '91.56.161.247'),
(32, 'Diakun', 'BB', 's7', 'Kirby', 'CARLEETOS', '86.13.198.98'),
(33, 'Kaim', 'nG', 'iSS', 'Lua', 'Iran', '62.43.91.162'),
(34, 'Romdi', 'nG', 's7', 'Iran', 'Iran', '77.190.1.179'),
(35, 'Daap', 'nG', 'iSS', 'Ailton', 'Km', '84.238.111.134'),
(36, 'Hiei', 'nG', 's7', 'Termi', 'Iran', '84.123.147.90'),
(37, 'Rhino', 'nG', 'Gs', 'Iran', 'Termi', '86.150.49.132'),
(38, 'Destran', 'iSS', 's7', 'Termi', 'Zapdos', '185.13.202.236'),
(39, 'Pauer', 'iSS', 's7', 'Iran', 'CARLEETOS', '87.161.165.129'),
(40, 'Kirby', 'nG', 's7', 'Termi', 'Night-Fire', '86.178.87.73'),
(41, 'Grandie', 'nG', 's7', 'Kirby', 'Iran', '88.148.191.155'),
(42, 'Marsi', 'nG', 'iSS', 'Iran', 'Iran', '89.212.98.35'),
(43, 'Roq', 'nG', 's7', 'Kirby', 'Night-Fire', '84.160.13.232'),
(44, 'LagHack', 'nG', 'BB', 'Lua', 'Nuri', '99.112.67.50'),
(45, 'Night-Fire', 'nG', 's7', 'Kirby', 'Termi', '87.67.77.15'),
(46, 'Termi', 'nG', 's7', 'Iran', 'Iran', '93.129.249.191'),
(47, 'Shagwa', 'nG', 's7', 'Iran', 'Termi', '82.12.185.59'),
(48, 'Alaba', 'nG', 's7', 'Iran', 'Km', '94.220.193.242'),
(49, 'Hpayer', 'nG', 'BB', 'Kirby', 'Km', '178.190.238.211'),
(50, 'MeanMachine', 'nG', 's7', 'Termi', 'Termi', '66.31.127.248'),
(51, 'Gunner', 'nG', 'iSS', 'Kirby', 'Lua', '94.172.50.80');

-- --------------------------------------------------------

--
-- Table structure for table `punishments`
--

CREATE TABLE IF NOT EXISTS `punishments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `team` varchar(255) NOT NULL,
  `punishment` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE IF NOT EXISTS `schedules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stage` varchar(255) NOT NULL,
  `match` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hometeam` varchar(255) NOT NULL,
  `score` varchar(255) NOT NULL,
  `awayteam` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `admin` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `stage`, `match`, `date`, `hometeam`, `score`, `awayteam`, `time`, `admin`) VALUES
(12, 'Matchweek 1', '/match/1', '2013-06-16', 'NextGen', '1-1', 'Gorillas', '18:00', 'Gunner'),
(13, 'Matchweek 1', '/match/2', '2013-06-16', 'Super 7', '0-4', 'Bears', '20:30', 'DBD'),
(14, 'Matchweek 1', '/match/3', '2013-06-16', 'Ball Breakers', '3-0', 'Inter Soccer Stars', '21:30', 'Goldeh'),
(15, 'Matchweek 2', '/match/4', '2013-06-23', 'NextGen', '5-1', 'Super 7', '18:00', 'DBD'),
(16, 'Matchweek 2', '/match/5', '2013-06-23', 'Bears', '2-0', 'Ball Breakers', '20:30', 'Kobe'),
(17, 'Matchweek 2', '/match/6', '2013-06-23', 'Gorillas', '2-2', 'Inter Soccer Stars', '21:30', 'Roq'),
(18, 'Matchweek 3', '/match/7', '2013-06-30', 'Ball Breakers', '-', 'Gorillas', '18:00', 'Gunner'),
(19, 'Matchweek 3', '/match/8', '2013-06-30', 'Inter Soccer Stars', '-', 'Super 7', '19:30', 'Kobe'),
(20, 'Matchweek 3', '/match/9', '2013-06-30', 'Bears', '-', 'NextGen', '21:00', 'Goldeh'),
(21, 'Matchweek 4', '/match/10', '2013-07-07', 'Super 7', '-', 'Gorillas', '18:00', '-'),
(22, 'Matchweek 4', '/match/11', '2013-07-07', 'Inter Soccer Stars', '-', 'Bears', '19:30', '-'),
(23, 'Matchweek 4', '/match/12', '2013-07-07', 'NextGen', '-', 'Ball Breakers', '21:00', '-'),
(24, 'Matchweek 5', '/match/13', '2013-07-14', 'Ball Breakers', '-', 'Super 7', '18:00', '-'),
(25, 'Matchweek 5', '/match/14', '2013-07-14', 'NextGen', '-', 'Inter Soccer Stars', '19:30', '-'),
(26, 'Matchweek 5', '/match/15', '2013-07-14', 'Gorillas', '-', 'Bears', '21:00', '-'),
(27, 'Matchweek 6', '/match/16', '2013-07-21', 'Inter Soccer Stars', '-', 'Ball Breakers', '18:00', '-'),
(28, 'Matchweek 6', '/match/17', '2013-07-21', 'Gorillas', '-', 'NextGen', '19:30', '-'),
(29, 'Matchweek 6', '/match/18', '2013-07-21', 'Bears', '-', 'Super 7', '21:00', '-'),
(30, 'Matchweek 7', '/match/21', '2013-07-28', 'Super 7', '-', 'NextGen', '18:00', '-'),
(31, 'Matchweek 7', '/match/22', '2013-07-28', 'Inter Soccer Stars', '-', 'Gorillas', '19:30', '-'),
(32, 'Matchweek 7', '/match/23', '2013-07-28', 'Ball Breakers', '-', 'Bears', '21:00', '-'),
(33, 'Matchweek 8', '/match/24', '2013-08-04', 'Super 7', '-', 'Inter Soccer Stars', '18:00', '-'),
(34, 'Matchweek 8', '/match/25', '2013-08-04', 'NextGen', '-', 'Bears', '19:30', '-'),
(35, 'Matchweek 8', '/match/26', '2013-08-04', 'Gorillas', '-', 'Ball Breakers', '21:00', '-'),
(36, 'Matchweek 9', '/match/29', '2013-08-11', 'Gorillas', '-', 'Super 7', 'TBA', '-'),
(37, 'Matchweek 9', '/match/30', '2013-08-11', 'Ball Breakers', '-', 'NextGen', 'TBA', '-'),
(38, 'Matchweek 9', '/match/31', '2013-08-11', 'Bears', '-', 'Inter Soccer Stars', 'TBA', '-'),
(39, 'Matchweek 10', '/match/32', '2013-08-18', 'Bears', '-', 'Gorillas', 'TBA', '-'),
(40, 'Matchweek 10', '/match/33', '2013-08-18', 'Super 7', '-', 'Ball Breakers', 'TBA', '-'),
(41, 'Matchweek 10', '/match/34', '2013-08-18', 'Inter Soccer Stars', '-', 'NextGen', 'TBA', '-'),
(42, 'Quarter Final', '/match/19', '2013-07-24', '#3 Seed', '-', '#6 Seed', '20:30', '-'),
(43, 'Quarter Final', '/match/20', '2013-07-24', '#4 Seed', '-', '#5 Seed', '22:00', '-'),
(44, 'Semi Final', '/match/27', '2013-08-07', '#1 Seed', '-', '#3 or #6 Seed', '20:30', '-'),
(45, 'Semi Final', '/match/28', '2013-08-07', '#2 Seed', '-', '#4 or #5 Seed', '22:00', '-'),
(46, 'Final', '/match/35', '2013-08-21', 'Winner of #1/#3/#6 Seed', '-', 'Winner of #2/#4/#5 Seed', '21:00', '-');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE IF NOT EXISTS `slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `title`, `text`, `image`) VALUES
(18, 'Ball Breakers 18:00 Gorillas', 'BB and Gs trying to recover from their dissappointing games in Matchwee k2.', 'uploads/slides/slider-1.jpg'),
(19, 'Inter Soccer Stars 19:30 Super 7', 'iSS and S7 trying to get their first win of the season.', 'uploads/slides/slider-2.jpg'),
(20, 'Bears 21:00 NextGen', 'Bears going for the 3rd win in a row and create a gap to the rest of the teams.', 'uploads/slides/slider-3.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `standings`
--

CREATE TABLE IF NOT EXISTS `standings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL,
  `club` varchar(255) NOT NULL,
  `tag` varchar(255) NOT NULL,
  `games` int(11) NOT NULL,
  `won` int(11) NOT NULL,
  `draw` int(11) NOT NULL,
  `loss` int(11) NOT NULL,
  `goalsfor` int(11) NOT NULL,
  `goalsagainst` int(11) NOT NULL,
  `goaldifference` varchar(255) NOT NULL,
  `points` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `standings`
--

INSERT INTO `standings` (`id`, `position`, `club`, `tag`, `games`, `won`, `draw`, `loss`, `goalsfor`, `goalsagainst`, `goaldifference`, `points`) VALUES
(1, 2, 'NextGen', 'nG', 2, 1, 1, 0, 6, 2, '+4', 4),
(2, 5, 'Inter Soccer Stars', 'iSS', 2, 0, 1, 1, 2, 5, '-3', 1),
(3, 6, 'Super 7', 's7', 2, 0, 0, 2, 1, 9, '-8', 0),
(4, 1, 'Bears', 'Bears', 2, 2, 0, 0, 6, 0, '+6', 6),
(5, 3, 'Ball Breakers', 'BB', 2, 1, 0, 1, 3, 2, '+1', 3),
(6, 4, 'Gorillas', 'Gs', 2, 0, 2, 0, 3, 3, '0', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `password_salt` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  `admin` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password_hash`, `password_salt`, `active`, `admin`) VALUES
(5, 'Aryan', '5711', 'aryan5711@yahoo.com', '833d3bcebab2327f5d7eb42fbd314872e177ed9b', '~G!iL>@5', 1, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
