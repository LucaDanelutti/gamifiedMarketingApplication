# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: aws3.remote.lucadanelutti.it (MySQL 5.7.32)
# Database: marketing_application
# Generation Time: 2021-01-29 18:30:49 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table login_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_logs`;

CREATE TABLE `login_logs` (
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(11) unsigned NOT NULL,
  `compilation_requested` tinyint(1) NOT NULL,
  `compilation_completed` tinyint(1) NOT NULL,
  PRIMARY KEY (`timestamp`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `login_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table offensive_words
# ------------------------------------------------------------

DROP TABLE IF EXISTS `offensive_words`;

CREATE TABLE `offensive_words` (
  `word` varchar(16) NOT NULL DEFAULT '',
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table product_reviews
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_reviews`;

CREATE TABLE `product_reviews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(11) unsigned NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  CONSTRAINT `product_reviews_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table questionnaires
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questionnaires`;

CREATE TABLE `questionnaires` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `image` blob NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table questions_marketing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions_marketing`;

CREATE TABLE `questions_marketing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int(11) unsigned NOT NULL,
  `question` varchar(256) NOT NULL DEFAULT '',
  `type` enum('BOOL','STRING','NUMBER','RATING') NOT NULL DEFAULT 'STRING',
  PRIMARY KEY (`id`),
  KEY `questionnaire_id` (`questionnaire_id`),
  CONSTRAINT `questions_marketing_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table questions_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions_stats`;

CREATE TABLE `questions_stats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(256) NOT NULL DEFAULT '',
  `type` enum('BOOL','STRING','NUMBER','RATING') NOT NULL DEFAULT 'STRING',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table replies_marketing
# ------------------------------------------------------------

DROP TABLE IF EXISTS `replies_marketing`;

CREATE TABLE `replies_marketing` (
  `questions_marketing_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`questions_marketing_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `replies_marketing_ibfk_1` FOREIGN KEY (`questions_marketing_id`) REFERENCES `questions_marketing` (`id`),
  CONSTRAINT `replies_marketing_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table replies_stats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `replies_stats`;

CREATE TABLE `replies_stats` (
  `questionnaire_id` int(11) unsigned NOT NULL,
  `question_stats_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`questionnaire_id`,`question_stats_id`,`user_id`),
  KEY `question_stats_id` (`question_stats_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `replies_stats_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`),
  CONSTRAINT `replies_stats_ibfk_2` FOREIGN KEY (`question_stats_id`) REFERENCES `questions_stats` (`id`),
  CONSTRAINT `replies_stats_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table scores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `scores`;

CREATE TABLE `scores` (
  `questionnaire_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`questionnaire_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`questionnaire_id`) REFERENCES `questionnaires` (`id`),
  CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(32) NOT NULL DEFAULT '',
  `banned` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `password`, `email`, `banned`)
VALUES
	(1,'user1','user','example@example.com',0),
	(2,'user2','user','example@example.com',0);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
