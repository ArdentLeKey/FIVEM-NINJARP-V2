-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.4.8-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour essentialmode
DROP DATABASE IF EXISTS `essentialmode`;
CREATE DATABASE IF NOT EXISTS `essentialmode` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin */;
USE `essentialmode`;

-- Listage de la structure de la table essentialmode. items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Listage des données de la table essentialmode.items : ~2 rows (environ)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`, `libelle`) VALUES
	(1, 'Eau'),
	(2, 'Pain');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `job_id` int(11) NOT NULL,
  `job_name` varchar(40) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT 500
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table essentialmode.jobs : ~2 rows (environ)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`job_id`, `job_name`, `salary`) VALUES
	(1, 'Chomeur', 300),
	(2, 'Police', 300),
	(3, 'Ambulancier', 300);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. medics
DROP TABLE IF EXISTS `medics`;
CREATE TABLE IF NOT EXISTS `medics` (
  `license` varchar(50) DEFAULT NULL,
  `rank` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table essentialmode.medics : ~1 rows (environ)
/*!40000 ALTER TABLE `medics` DISABLE KEYS */;
INSERT INTO `medics` (`license`, `rank`) VALUES
	('license:3f200ce0f1988f700dcff93d9070e35100f6e9c4', 1);
/*!40000 ALTER TABLE `medics` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. outfits
DROP TABLE IF EXISTS `outfits`;
CREATE TABLE IF NOT EXISTS `outfits` (
  `license` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `skin` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT 'mp_m_freemode_01',
  `skinTone` int(11) NOT NULL DEFAULT 0,
  `Dad` int(11) NOT NULL DEFAULT 0,
  `Mum` int(11) NOT NULL DEFAULT 0,
  `hairId` int(11) NOT NULL DEFAULT 0,
  `cheveuxCouleur` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table essentialmode.outfits : 1 rows
/*!40000 ALTER TABLE `outfits` DISABLE KEYS */;
INSERT INTO `outfits` (`license`, `skin`, `skinTone`, `Dad`, `Mum`, `hairId`, `cheveuxCouleur`) VALUES
	('license:3f200ce0f1988f700dcff93d9070e35100f6e9c4', 'mp_m_freemode_01', 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `outfits` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. phone_app_chat
DROP TABLE IF EXISTS `phone_app_chat`;
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Listage des données de la table essentialmode.phone_app_chat : ~0 rows (environ)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. phone_calls
DROP TABLE IF EXISTS `phone_calls`;
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Listage des données de la table essentialmode.phone_calls : ~11 rows (environ)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
INSERT INTO `phone_calls` (`id`, `owner`, `num`, `incoming`, `time`, `accepts`) VALUES
	(1, '273-0914', 'police', 1, '2019-10-21 18:31:46', 0),
	(2, '273-0914', 'police', 1, '2019-10-21 18:37:36', 0),
	(3, '273-0914', 'police', 1, '2019-10-21 18:37:53', 0),
	(4, '273-0914', 'zz', 1, '2019-10-21 21:26:24', 0),
	(5, '273-0914', '911', 1, '2019-10-21 21:26:30', 0),
	(6, '273-0914', 'zzzzz', 1, '2019-10-21 21:33:01', 0),
	(7, '273-0914', '911', 1, '2019-10-21 21:35:36', 0),
	(8, '273-0914', 'medic', 1, '2019-10-21 21:40:01', 0),
	(9, '273-0914', '911', 1, '2019-10-21 21:40:41', 0),
	(10, '273-0914', '912', 1, '2019-10-21 21:48:46', 0),
	(11, '273-0914', '912', 1, '2019-10-21 22:02:06', 0);
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. phone_messages
DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Listage des données de la table essentialmode.phone_messages : 1 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
INSERT INTO `phone_messages` (`id`, `transmitter`, `receiver`, `message`, `time`, `isRead`, `owner`) VALUES
	(1, 'police', '273-0914', 'salut, j\'aurais besoin d\'aide svp', '2019-10-21 18:33:26', 1, 1);
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. phone_users_contacts
DROP TABLE IF EXISTS `phone_users_contacts`;
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table essentialmode.phone_users_contacts : 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. police
DROP TABLE IF EXISTS `police`;
CREATE TABLE IF NOT EXISTS `police` (
  `license` varchar(50) DEFAULT NULL,
  `rank` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Listage des données de la table essentialmode.police : ~1 rows (environ)
/*!40000 ALTER TABLE `police` DISABLE KEYS */;
INSERT INTO `police` (`license`, `rank`) VALUES
	('license:3f200ce0f1988f700dcff93d9070e35100f6e9c4', 1);
/*!40000 ALTER TABLE `police` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. twitter_accounts
DROP TABLE IF EXISTS `twitter_accounts`;
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table essentialmode.twitter_accounts : ~0 rows (environ)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. twitter_likes
DROP TABLE IF EXISTS `twitter_likes`;
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table essentialmode.twitter_likes : ~0 rows (environ)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. twitter_tweets
DROP TABLE IF EXISTS `twitter_tweets`;
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table essentialmode.twitter_tweets : ~0 rows (environ)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `isFirstConnection` int(11) DEFAULT 1,
  `job` int(11) DEFAULT 1,
  `nom` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `prenom` varchar(128) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `taille` int(10) unsigned NOT NULL DEFAULT 0,
  `lastpos` varchar(255) COLLATE utf8mb4_bin DEFAULT '{-1279.22, -3397.74, 13.9401}',
  `serverid` int(11) NOT NULL DEFAULT 0,
  `age` int(120) NOT NULL DEFAULT 0,
  `isDead` int(11) NOT NULL DEFAULT 0,
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Listage des données de la table essentialmode.users : ~1 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`license`, `money`, `bank`, `permission_level`, `group`, `isFirstConnection`, `job`, `nom`, `prenom`, `taille`, `lastpos`, `serverid`, `age`, `isDead`, `phone_number`) VALUES
	('license:3f200ce0f1988f700dcff93d9070e35100f6e9c4', 500, 15000, 0, 'user', 0, 3, 'Ninja', 'zz', 55, '{381.05792236328, -607.63177490234,  28.910066604614}', 1, 5, 0, '273-0914');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. user_appartement
DROP TABLE IF EXISTS `user_appartement`;
CREATE TABLE IF NOT EXISTS `user_appartement` (
  `license` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0,
  `isInside` int(11) DEFAULT 0,
  `limit` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Listage des données de la table essentialmode.user_appartement : 0 rows
/*!40000 ALTER TABLE `user_appartement` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_appartement` ENABLE KEYS */;

-- Listage de la structure de la table essentialmode. user_inventory
DROP TABLE IF EXISTS `user_inventory`;
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `license` varchar(255) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`license`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `user_inventory_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Listage des données de la table essentialmode.user_inventory : ~0 rows (environ)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
