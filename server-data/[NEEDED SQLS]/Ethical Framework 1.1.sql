-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.18-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for ethical
CREATE DATABASE IF NOT EXISTS `ethical` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `ethical`;

-- Dumping structure for table ethical.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL DEFAULT 'John',
  `last_name` varchar(50) NOT NULL DEFAULT 'Doe',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dob` varchar(50) DEFAULT 'NULL',
  `cash` int(9) DEFAULT 500,
  `bank` int(9) NOT NULL DEFAULT 5000,
  `phone_number` bigint(20) NOT NULL DEFAULT 0,
  `story` text NOT NULL,
  `new` int(1) NOT NULL DEFAULT 1,
  `deleted` int(11) NOT NULL DEFAULT 0,
  `gender` int(1) NOT NULL DEFAULT 0,
  `jail_time` int(11) NOT NULL DEFAULT 0,
  `dirty_money` int(11) NOT NULL DEFAULT 0,
  `gang_type` int(11) NOT NULL DEFAULT 0,
  `jail_time_mobster` int(11) unsigned zerofill NOT NULL DEFAULT 00000000000,
  `judge_type` int(11) NOT NULL DEFAULT 0,
  `iswjob` int(11) NOT NULL DEFAULT 0,
  `metaData` varchar(1520) DEFAULT '{}',
  `stress_level` int(11) DEFAULT 0,
  `bones` mediumtext DEFAULT NULL,
  `emotes` varchar(4160) DEFAULT '{}',
  `paycheck` int(11) DEFAULT 0,
  `stocks` mediumtext DEFAULT NULL,
  `rehab` int(12) DEFAULT 0,
  `meta` text DEFAULT NULL,
  `dna` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.characters_cars
CREATE TABLE IF NOT EXISTS `characters_cars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `purchase_price` float DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `data` text NOT NULL,
  `vehicle_state` text DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `name` varchar(50) DEFAULT NULL,
  `engine_damage` bigint(19) DEFAULT 1000,
  `body_damage` bigint(20) DEFAULT 1000,
  `degredation` longtext DEFAULT NULL,
  `current_garage` varchar(50) DEFAULT NULL,
  `server_number` varchar(50) DEFAULT NULL,
  `financed` int(11) DEFAULT 0,
  `last_payment` int(11) DEFAULT 0,
  `phone_number` text DEFAULT NULL,
  `coords` varchar(255) DEFAULT NULL,
  `license_plate` varchar(255) NOT NULL DEFAULT '',
  `harness` varchar(50) DEFAULT '',
  `payments_left` int(3) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.characters_clothes
CREATE TABLE IF NOT EXISTS `characters_clothes` (
  `cid` int(11) DEFAULT NULL,
  `assExist` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.characters_weapons
CREATE TABLE IF NOT EXISTS `characters_weapons` (
  `id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `ammo` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.character_current
CREATE TABLE IF NOT EXISTS `character_current` (
  `cid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `drawables` mediumtext DEFAULT NULL,
  `props` mediumtext DEFAULT NULL,
  `drawtextures` mediumtext DEFAULT NULL,
  `proptextures` mediumtext DEFAULT NULL,
  `assExists` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.character_face
CREATE TABLE IF NOT EXISTS `character_face` (
  `cid` int(11) DEFAULT NULL,
  `hairColor` mediumtext DEFAULT NULL,
  `headBlend` mediumtext DEFAULT NULL,
  `headOverlay` mediumtext DEFAULT NULL,
  `headStructure` mediumtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.character_outfits
CREATE TABLE IF NOT EXISTS `character_outfits` (
  `cid` int(11) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `slot` int(11) DEFAULT NULL,
  `drawables` text DEFAULT NULL,
  `props` text DEFAULT NULL,
  `drawtextures` text DEFAULT NULL,
  `proptextures` text DEFAULT NULL,
  `hairColor` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.character_passes
CREATE TABLE IF NOT EXISTS `character_passes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT 1,
  `name` text NOT NULL,
  `giver` text NOT NULL,
  `pass_type` text NOT NULL,
  `business_name` text NOT NULL,
  `bank` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.contracts
CREATE TABLE IF NOT EXISTS `contracts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` int(11) DEFAULT 0,
  `reciever` int(11) DEFAULT 0,
  `amount` int(11) DEFAULT 0,
  `info` text DEFAULT NULL,
  `paid` varchar(255) DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.delivery_job
CREATE TABLE IF NOT EXISTS `delivery_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` float DEFAULT NULL,
  `jobType` varchar(50) DEFAULT NULL,
  `dropAmount` int(2) DEFAULT NULL,
  `pickup` varchar(255) DEFAULT NULL,
  `drop` varchar(255) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table ethical.dispatch_code
CREATE TABLE IF NOT EXISTS `dispatch_code` (
  `id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `display_code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_important` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `playsound` varchar(255) DEFAULT NULL,
  `soundname` varchar(255) DEFAULT NULL,
  `blip_color` varchar(255) DEFAULT NULL,
  `is_police` varchar(255) DEFAULT NULL,
  `is_ems` varchar(255) DEFAULT NULL,
  `is_news` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.dispatch_log
CREATE TABLE IF NOT EXISTS `dispatch_log` (
  `dispatch_id` varchar(255) DEFAULT NULL,
  `cid` varchar(255) DEFAULT NULL,
  `first_street` varchar(255) DEFAULT NULL,
  `second_street` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `event_id` varchar(255) DEFAULT NULL,
  `origin_x` varchar(255) DEFAULT NULL,
  `origin_y` varchar(255) DEFAULT NULL,
  `origin_z` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.dispatch_vehicle
CREATE TABLE IF NOT EXISTS `dispatch_vehicle` (
  `id` int(11) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `first_color` varchar(255) DEFAULT NULL,
  `second_color` varchar(255) DEFAULT NULL,
  `plate` varchar(255) DEFAULT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `event_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.driving_tests
CREATE TABLE IF NOT EXISTS `driving_tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `icid` int(11) DEFAULT NULL,
  `instructor` varchar(255) DEFAULT NULL,
  `timestamp` text DEFAULT NULL,
  `points` varchar(255) DEFAULT '0',
  `passed` varchar(255) DEFAULT 'false',
  `results` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.exploiters
CREATE TABLE IF NOT EXISTS `exploiters` (
  `type` text DEFAULT NULL,
  `log` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `steam_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.general_variables
CREATE TABLE IF NOT EXISTS `general_variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.group_banking
CREATE TABLE IF NOT EXISTS `group_banking` (
  `group_type` mediumtext DEFAULT NULL,
  `bank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.hospital_patients
CREATE TABLE IF NOT EXISTS `hospital_patients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `illness` text NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.houses
CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(11) NOT NULL DEFAULT 0,
  `cid` int(11) NOT NULL DEFAULT 0,
  `model` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `furniture` text DEFAULT NULL,
  `mykeys` text NOT NULL,
  `house_name` varchar(255) DEFAULT NULL,
  `house_id` int(11) NOT NULL DEFAULT 0,
  `roomType` varchar(50) DEFAULT NULL,
  `days` int(30) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.jobs_whitelist
CREATE TABLE IF NOT EXISTS `jobs_whitelist` (
  `id` int(11) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `job` varchar(50) DEFAULT 'unemployed',
  `rank` int(11) DEFAULT 0,
  `callsign` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `type` text DEFAULT NULL,
  `log` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  `steam_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table ethical.mech_materials
CREATE TABLE IF NOT EXISTS `mech_materials` (
  `garage` text DEFAULT NULL,
  `Scrap` int(11) DEFAULT 0,
  `Plastic` int(11) DEFAULT 0,
  `Glass` int(11) DEFAULT 0,
  `Steel` int(11) DEFAULT 0,
  `Aluminium` int(11) DEFAULT 0,
  `Rubber` int(11) DEFAULT 0,
  `Copper` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.modded_cars
CREATE TABLE IF NOT EXISTS `modded_cars` (
  `id` int(11) DEFAULT NULL,
  `license_plate` varchar(255) DEFAULT NULL,
  `Extractors` varchar(255) DEFAULT '{}',
  `Filter` varchar(255) DEFAULT '{}',
  `Suspension` varchar(255) DEFAULT '{}',
  `Rollbars` varchar(255) DEFAULT '{}',
  `Bored` varchar(255) DEFAULT '{}',
  `Carbon` varchar(255) DEFAULT '{}',
  `LFront` varchar(255) DEFAULT '{}',
  `RFront` varchar(255) DEFAULT '{}',
  `LBack` varchar(255) DEFAULT '{}',
  `RBack` varchar(255) DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.phone_yp
CREATE TABLE IF NOT EXISTS `phone_yp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `job` varchar(500) DEFAULT NULL,
  `phonenumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.playerstattoos
CREATE TABLE IF NOT EXISTS `playerstattoos` (
  `identifier` int(11) DEFAULT NULL,
  `tattoos` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.racing_tracks
CREATE TABLE IF NOT EXISTS `racing_tracks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkPoints` text DEFAULT NULL,
  `track_names` text DEFAULT NULL,
  `creator` text DEFAULT NULL,
  `distance` text DEFAULT NULL,
  `races` text DEFAULT NULL,
  `fastest_car` text DEFAULT NULL,
  `fastest_name` text DEFAULT NULL,
  `fastest_lap` int(11) DEFAULT NULL,
  `fastest_sprint` int(11) DEFAULT NULL,
  `fastest_sprint_name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.secondary_jobs
CREATE TABLE IF NOT EXISTS `secondary_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.stash
CREATE TABLE IF NOT EXISTS `stash` (
  `owner_cid` int(11) DEFAULT NULL,
  `admin` int(11) DEFAULT NULL,
  `x` int(122) DEFAULT NULL,
  `y` int(122) DEFAULT NULL,
  `z` int(122) DEFAULT NULL,
  `g_x` int(122) DEFAULT NULL,
  `g_y` int(122) DEFAULT NULL,
  `g_z` int(122) DEFAULT NULL,
  `owner_pin` int(11) DEFAULT NULL,
  `guest_pin` int(11) DEFAULT NULL,
  `useGarage` int(11) DEFAULT NULL,
  `tier` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.tweets
CREATE TABLE IF NOT EXISTS `tweets` (
  `handle` longtext NOT NULL,
  `message` varchar(500) NOT NULL,
  `time` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hex_id` varchar(100) DEFAULT NULL,
  `steam_id` varchar(50) DEFAULT NULL,
  `community_id` varchar(100) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Uknown',
  `ip` varchar(50) NOT NULL DEFAULT 'Uknown',
  `rank` varchar(50) NOT NULL DEFAULT 'user',
  `date_created` timestamp NOT NULL DEFAULT current_timestamp(),
  `controls` text DEFAULT NULL,
  `settings` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.users_whitelist
CREATE TABLE IF NOT EXISTS `users_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steam_id` varchar(50) DEFAULT NULL,
  `power` int(11) NOT NULL DEFAULT 0,
  `admin_name` text NOT NULL,
  `user_name` text NOT NULL,
  `user_ip` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.user_appertement
CREATE TABLE IF NOT EXISTS `user_appertement` (
  `room` int(11) NOT NULL AUTO_INCREMENT,
  `roomType` int(1) DEFAULT NULL,
  `cid` mediumtext NOT NULL,
  `mykeys` varchar(50) NOT NULL DEFAULT '[]',
  `ilness` mediumtext NOT NULL,
  `isImprisoned` mediumtext NOT NULL,
  `isClothesSpawn` mediumtext NOT NULL,
  `cash` int(11) DEFAULT 0,
  PRIMARY KEY (`room`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.user_bans
CREATE TABLE IF NOT EXISTS `user_bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT 'Unknown',
  `ip` varchar(255) NOT NULL,
  `steam_id` varchar(100) NOT NULL,
  `license` varchar(255) NOT NULL,
  `bandate` int(11) NOT NULL,
  `unbandate` int(11) NOT NULL,
  `length` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL DEFAULT 'No Reason',
  `removed` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.user_boat
CREATE TABLE IF NOT EXISTS `user_boat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT '{}',
  `boat_name` varchar(255) DEFAULT '{}',
  `boat_model` varchar(255) DEFAULT '{}',
  `boat_price` varchar(255) DEFAULT '{}',
  `boat_plate` varchar(255) DEFAULT '{}',
  `boat_state` varchar(255) DEFAULT '{}',
  `boat_colorprimary` varchar(255) DEFAULT '{}',
  `boat_colorsecondary` varchar(255) DEFAULT '{}',
  `boat_pearlescentcolor` varchar(255) DEFAULT '{}',
  `boat_wheelcolor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.user_contacts
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `identifier` varchar(40) NOT NULL,
  `name` longtext NOT NULL,
  `number` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.user_controls
CREATE TABLE IF NOT EXISTS `user_controls` (
  `hex_id` varchar(255) NOT NULL DEFAULT '',
  `controls` varchar(255) DEFAULT '{}',
  PRIMARY KEY (`hex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.user_convictions
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.user_inventory
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `information` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `slot` int(11) NOT NULL,
  `dropped` tinyint(4) NOT NULL DEFAULT 0,
  `creationDate` bigint(20) NOT NULL DEFAULT 0,
  `quality` int(11) DEFAULT 100,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table ethical.user_inventory2
CREATE TABLE IF NOT EXISTS `user_inventory2` (
  `item_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `information` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `slot` int(11) NOT NULL,
  `dropped` tinyint(4) NOT NULL DEFAULT 0,
  `creationDate` bigint(20) NOT NULL DEFAULT 0,
  `quality` int(11) DEFAULT 100,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5687 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table ethical.user_mdt
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.user_messages
CREATE TABLE IF NOT EXISTS `user_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7517 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table ethical.user_settings
CREATE TABLE IF NOT EXISTS `user_settings` (
  `hex_id` varchar(255) NOT NULL DEFAULT '',
  `settings` varchar(255) DEFAULT '{}',
  PRIMARY KEY (`hex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.vehicle_display
CREATE TABLE IF NOT EXISTS `vehicle_display` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(60) COLLATE utf8mb4_turkish_ci NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_turkish_ci NOT NULL,
  `commission` int(11) NOT NULL DEFAULT 10,
  `baseprice` int(11) NOT NULL DEFAULT 25,
  `price` int(11) DEFAULT 25000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Data exporting was unselected.

-- Dumping structure for table ethical.vehicle_mdt
CREATE TABLE IF NOT EXISTS `vehicle_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `stolen` bit(1) DEFAULT b'0',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.vip_list
CREATE TABLE IF NOT EXISTS `vip_list` (
  `id` int(11) DEFAULT NULL,
  `steamid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.weapon_serials
CREATE TABLE IF NOT EXISTS `weapon_serials` (
  `owner` text NOT NULL,
  `serial` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.websites
CREATE TABLE IF NOT EXISTS `websites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) DEFAULT 0,
  `name` varchar(50) DEFAULT '',
  `keywords` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.weed
CREATE TABLE IF NOT EXISTS `weed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` int(11) DEFAULT 0,
  `y` int(11) DEFAULT 0,
  `z` int(11) DEFAULT 0,
  `growth` int(11) DEFAULT 0,
  `type` varchar(50) DEFAULT NULL,
  `time` longtext DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table ethical.weed_plants
CREATE TABLE IF NOT EXISTS `weed_plants` (
  `id` int(11) DEFAULT 0,
  `coords` varchar(500) DEFAULT '',
  `seed` varchar(255) DEFAULT NULL,
  `growth` varchar(50) DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical._character_crypto_wallet
CREATE TABLE IF NOT EXISTS `_character_crypto_wallet` (
  `id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical._vehicle
CREATE TABLE IF NOT EXISTS `_vehicle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(11) unsigned NOT NULL,
  `vin` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL,
  `plate` varchar(50) NOT NULL DEFAULT '',
  `model` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL,
  `garage` varchar(59) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `appearance` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  `damage` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `degredation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.__banking_logs
CREATE TABLE IF NOT EXISTS `__banking_logs` (
  `cid` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `reason` longtext NOT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `business` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table ethical.__housedata
CREATE TABLE IF NOT EXISTS `__housedata` (
  `cid` int(11) NOT NULL,
  `house_id` int(11) DEFAULT NULL,
  `house_model` int(11) DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `upfront` int(11) DEFAULT NULL,
  `housename` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `garages` longtext COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `furniture` longtext COLLATE utf8mb4_bin NOT NULL DEFAULT '{}',
  `status` mediumtext COLLATE utf8mb4_bin NOT NULL DEFAULT 'locked',
  `force_locked` mediumtext COLLATE utf8mb4_bin NOT NULL DEFAULT 'unlocked',
  `due` int(11) NOT NULL,
  `overall` int(11) NOT NULL,
  `payments` int(11) NOT NULL,
  `days` int(11) NOT NULL,
  `can_pay` mediumtext COLLATE utf8mb4_bin NOT NULL DEFAULT 'true'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table ethical.__housekeys
CREATE TABLE IF NOT EXISTS `__housekeys` (
  `cid` int(11) DEFAULT NULL,
  `house_id` int(11) DEFAULT NULL,
  `house_model` int(11) DEFAULT NULL,
  `housename` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `name` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `garages` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.
-- Dumping structure for table ethical.__motels
CREATE TABLE IF NOT EXISTS `__motels` (
  `cid` int(11) DEFAULT NULL,
  `roomType` int(11) DEFAULT NULL,
  `roomNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table ethical.__motels: ~0 rows (approximately)
DELETE FROM `__motels`;
/*!40000 ALTER TABLE `__motels` DISABLE KEYS */;
/*!40000 ALTER TABLE `__motels` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;


-- Dumping structure for table ethical.__motels
CREATE TABLE IF NOT EXISTS `__housing` (
  `cid` int(11) DEFAULT NULL,
  `roomType` int(11) DEFAULT NULL,
  `roomNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table ethical.__motels: ~0 rows (approximately)
DELETE FROM `__housing`;
/*!40000 ALTER TABLE `__motels` DISABLE KEYS */;
/*!40000 ALTER TABLE `__motels` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
