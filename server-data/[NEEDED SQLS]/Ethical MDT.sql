-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.16-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ethical
CREATE DATABASE IF NOT EXISTS `ethical` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ethical`;

-- Dumping structure for table ethical.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;

-- Dumping data for table ethical.fine_types: ~112 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
INSERT INTO `fine_types` (`id`, `label`, `amount`, `jailtime`, `category`) VALUES
	(1, 'Capital Murder', 100000, 999, 0),
	(2, 'First Degree Murder', 100000, 400, 0),
	(3, 'Aggravated First Degree Murder', 100000, 500, 0),
	(4, 'Second Degree Murder', 100000, 100, 0),
	(5, 'Aggravated Second Degree Murder', 100000, 200, 0),
	(6, 'Attempted Murder', 5000, 30, 0),
	(7, 'Aggravated Attempted Murder', 5000, 60, 0),
	(8, 'Involuntary Manslaughter', 20000, 40, 0),
	(9, 'Local Murder', 1500, 20, 0),
	(10, 'Voluntary Manslaughter', 20000, 60, 0),
	(11, 'Vehicular Manslaughter', 20000, 40, 0),
	(12, 'Robbery', 1000, 20, 0),
	(13, 'Store Robbery', 1500, 25, 0),
	(14, 'Attempted Robbery', 1000, 20, 0),
	(15, 'Robbery of Federal Reserve (Pacific Bank)', 7500, 40, 0),
	(16, 'Bank Robbery (Regular banks)', 5000, 25, 0),
	(17, 'Successful Prison Break', 15000, 100, 0),
	(18, 'Attempted Prison Break', 7500, 50, 0),
	(19, 'Criminal Coercion', 1000, 15, 0),
	(20, 'Aggravated Criminal Coercion', 2000, 20, 0),
	(21, 'Kidnapping / Hostage Taking', 3000, 20, 0),
	(22, 'Aggravated Kidnapping / Hostage Taking', 5000, 40, 0),
	(23, 'Embezzlement', 3500, 50, 0),
	(24, 'RICO', 0, 999, 0),
	(25, 'Criminal Profiteering/Organized Crime', 0, 999, 0),
	(26, 'Criminal Threats', 500, 5, 0),
	(27, 'Terroristic Threat', 1500, 10, 0),
	(28, 'Arson', 3750, 8, 0),
	(29, 'Burglary', 2500, 20, 0),
	(30, 'Breaking and Entering', 1500, 8, 0),
	(31, 'Attempted Commission of a Felony Crime', 0, 0, 0),
	(32, 'Obstruction of Justice', 1500, 10, 0),
	(33, 'False Impersonation of a Lawyer or Government Official / State Official', 5000, 40, 0),
	(34, 'Weapon Stockpilling', 7500, 24, 0),
	(35, 'Weapons Trafficking', 6000, 35, 0),
	(36, 'Possession of a Class 3 Firearm', 6000, 34, 0),
	(37, 'Prohibited Persons with a Firearm', 4500, 60, 0),
	(38, 'Possession of a Class 2 Firearm', 3750, 25, 0),
	(39, 'Possession of a Class 1 Firearm', 2000, 14, 0),
	(40, 'Possession of Explosives', 2000, 24, 0),
	(41, 'Unlawful Discharge of a Firearm', 1125, 6, 0),
	(42, 'Brandishing Firearm', 1200, 6, 0),
	(43, 'Illegal Ammunition', 375, 5, 0),
	(44, 'Stealing a Gov. Vehicle', 5000, 25, 0),
	(45, 'Grand Theft Auto (GTA)', 2000, 15, 0),
	(46, 'Joyriding', 1200, 10, 0),
	(47, 'Hit and Run', 1500, 10, 0),
	(48, ' Aggravated Hit and Run', 3000, 20, 0),
	(49, 'Driving Under the Influence', 1500, 10, 0),
	(50, 'Reckless Evading Arrest', 1200, 20, 0),
	(51, 'Organizing an illegal event', 2500, 18, 0),
	(52, 'Reckless Endangerment', 1500, 15, 0),
	(53, 'Reckless Driving', 1200, 10, 0),
	(54, 'Operating a Motor Vehicle Without a License Plate', 2500, 10, 0),
	(55, 'Possession/Instillation of illegal car parts', 2500, 15, 0),
	(56, 'CDS Schedule 1/2 Drug Distribution/ Intent to Distribute', 2000, 25, 0),
	(57, 'Drug Cultivation and Manufacturing', 6000, 35, 0),
	(58, 'Drug Possession', 30, 18, 0),
	(59, 'CDS Schedule 1 Drug Possession', 750, 8, 0),
	(60, 'Unlawful Consumption', 375, 12, 0),
	(61, 'Bribery', 3500, 18, 0),
	(62, 'Possession of Dirty Money', 2700, 15, 0),
	(63, 'Extortion', 3375, 12, 0),
	(64, 'Money Laundering', 5000, 15, 0),
	(65, 'Tampering With Evidence', 2500, 15, 0),
	(66, 'Corruption', 0, 120, 0),
	(67, 'Contempt of Court', 1100, 15, 0),
	(68, 'Violation of Probation', 800, 10, 0),
	(69, 'Possession of Contraband', 1500, 10, 0),
	(70, 'Assault', 1200, 10, 0),
	(71, 'Aggravated Assault', 1125, 10, 0),
	(72, 'Battery', 1500, 12, 0),
	(73, 'Aggravated Battery', 1500, 15, 0),
	(74, 'Possession of Stolen Goods', 2600, 10, 0),
	(75, 'Stalking', 3750, 14, 0),
	(76, 'Evading Arrest', 1500, 10, 0),
	(77, 'Resisting Arrest', 1500, 15, 0),
	(78, 'Fleeing and Eluding', 1300, 10, 0),
	(79, 'Aiding and Abetting', 0, 0, 0),
	(80, 'Trespassing on Government Property', 1500, 10, 0),
	(81, 'Prostitution', 3000, 10, 0),
	(82, 'Failure to Identify', 1000, 0, 0),
	(83, 'False Report', 800, 5, 0),
	(84, 'Criminal Negligence', 1500, 10, 0),
	(85, 'Tresspassing', 800, 10, 0),
	(86, 'Illegal Gambling', 3800, 10, 0),
	(87, 'Disorderly Conduct', 800, 10, 0),
	(88, 'Ticket | Obstructing Traffic', 250, 0, 0),
	(89, 'Ticket | Excessive Speeding 3', 1000, 0, 0),
	(90, 'Ticket | Excessive Speeding 2', 750, 0, 0),
	(91, 'Ticket | Excessive Speeding 1', 500, 0, 0),
	(92, 'Ticket | Illegal Lane Change', 250, 0, 0),
	(93, 'Ticket | Aggresive Driving', 250, 0, 0),
	(94, 'Ticket | Failure to Yield to an Emergency Vehicle', 250, 0, 0),
	(95, 'Ticket | Illegal Window Tint', 850, 0, 0),
	(96, 'Ticket | Unlawful Solicitation', 500, 0, 0),
	(97, 'Ticket | Failure to Stop', 500, 0, 0),
	(98, 'Ticket | Operation of a Non-Street Legal Vehicle', 500, 0, 0),
	(99, 'Ticket | Operating a Motor Vehicle Without a license', 500, 0, 0),
	(100, 'Ticket | Illegal Parking', 500, 0, 0),
	(101, 'Ticket | Excessive Vehicle Noise', 100, 0, 0),
	(102, 'Ticket | Driving without Proper Use of Headlights', 250, 0, 0),
	(103, 'Ticket | Illegal U-Turn', 100, 0, 0),
	(104, 'Ticket | Mutual Combat', 1200, 0, 0),
	(105, 'Ticket | Loitering', 750, 0, 0),
	(106, 'Ticket | Public Intoxication', 750, 0, 0),
	(107, 'Ticket | Indecent Exposure', 1000, 0, 0),
	(108, 'Ticket | Failure to Yield', 200, 0, 0),
	(109, 'Ticket | Solicitation', 75, 0, 0),
	(110, 'Ticket | Verbal Harassment ', 750, 0, 0),
	(111, 'Ticket | Larcency', 500, 0, 0),
	(112, 'Ticket | Disturbing the Peace', 250, 0, 0);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table ethical.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `officer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ethical.mdt_reports: ~2 rows (approximately)
/*!40000 ALTER TABLE `mdt_reports` DISABLE KEYS */;
INSERT INTO `mdt_reports` (`id`, `cid`, `title`, `incident`, `charges`, `officer`, `name`, `date`, `jailtime`) VALUES
	(1, 61, 'Warrant', 'Burglar', '12', 'white', 'wingz', '12-10-1991', 1),
	(2, 62, 'Test', 'test', '{"Store Robbery":1}', NULL, 'white wingz', '03-15-2021 01:31:30', 1),
	(3, 3, 'Murder', 'dumb ass', '{"Aggravated First Degree Murder":1,"Aggravated Second Degree Murder":1,"Aggravated Attempted Murder":1,"Second Degree Murder":1,"Attempted Murder":1,"Involuntary Manslaughter":1,"Capital Murder":1}', NULL, 'Noah Jamerson', '03-15-2021 01:32:48', 30);
/*!40000 ALTER TABLE `mdt_reports` ENABLE KEYS */;

-- Dumping structure for table ethical.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `officer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ethical.mdt_warrants: ~0 rows (approximately)
/*!40000 ALTER TABLE `mdt_warrants` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_warrants` ENABLE KEYS */;

-- Dumping structure for table ethical.user_convictions
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ethical.user_convictions: ~9 rows (approximately)
/*!40000 ALTER TABLE `user_convictions` DISABLE KEYS */;
INSERT INTO `user_convictions` (`id`, `cid`, `offense`, `count`) VALUES
	(1, 62, 'Burglar', 1),
	(2, 62, 'Store Robbery', 1),
	(3, 3, 'Aggravated First Degree Murder', 1),
	(4, 3, 'Aggravated Attempted Murder', 1),
	(5, 3, 'Aggravated Second Degree Murder', 1),
	(6, 3, 'Second Degree Murder', 1),
	(7, 3, 'Attempted Murder', 1),
	(8, 3, 'Capital Murder', 1),
	(9, 3, 'Involuntary Manslaughter', 1);
/*!40000 ALTER TABLE `user_convictions` ENABLE KEYS */;

-- Dumping structure for table ethical.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `identifier` text NOT NULL,
  `drivers` int(11) NOT NULL DEFAULT 1,
  `business` int(11) NOT NULL DEFAULT 0,
  `weapon` int(11) NOT NULL DEFAULT 0,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `house` int(11) NOT NULL DEFAULT 1,
  `bar` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table ethical.user_licenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
INSERT INTO `user_licenses` (`identifier`, `drivers`, `business`, `weapon`, `id`, `cid`, `house`, `bar`) VALUES
	('steam:11000010aa15521', 1, 0, 0, 1, 62, 1, 0);
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for table ethical.user_mdt
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table ethical.user_mdt: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_mdt` DISABLE KEYS */;
INSERT INTO `user_mdt` (`id`, `cid`, `notes`, `mugshot_url`) VALUES
	(1, 62, 'This is note in mdt', NULL);
/*!40000 ALTER TABLE `user_mdt` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
