/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `game_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_event` (
  `eventEntry` tinyint(3) unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` datetime DEFAULT '2000-01-01 08:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` datetime DEFAULT '2000-01-01 08:00:00' COMMENT 'Absolute end date, the event will never start after',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT 5184000 COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) unsigned NOT NULL DEFAULT 2592000 COMMENT 'Length in minutes of the event',
  `holiday` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT 'Client side holiday id',
  `holidayStage` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0 if normal event, 1 if world event',
  `announce` tinyint(3) unsigned NOT NULL DEFAULT 2 COMMENT '0 dont announce, 1 announce, 2 value from config',
  PRIMARY KEY (`eventEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `game_event` WRITE;
/*!40000 ALTER TABLE `game_event` DISABLE KEYS */;
INSERT INTO `game_event` VALUES
(1,'2014-06-22 00:01:00',NULL,525600,20160,341,1,'Midsummer Fire Festival',0,2),
(2,'2015-12-16 01:00:00',NULL,525600,25920,141,1,'Winter Veil',0,2),
(3,'2020-01-05 00:01:00',NULL,131040,10079,376,2,'Darkmoon Faire (Terokkar Forest)',0,2),
(4,'2014-09-07 01:01:00',NULL,131040,10079,374,2,'Darkmoon Faire (Elwynn Forest)',0,2),
(5,'2014-10-05 01:01:00',NULL,131040,10079,375,2,'Darkmoon Faire (Mulgore)',0,2),
(6,'2010-01-01 07:00:00',NULL,525600,120,0,0,'New Year\'s Eve',0,2),
(7,'2020-01-24 00:01:00',NULL,525600,20160,327,1,'Lunar Festival',0,2),
(8,'2020-02-08 00:01:00',NULL,525600,20160,423,1,'Love is in the Air',0,2),
(9,'2020-04-13 00:01:00',NULL,525600,10080,181,1,'Noblegarden',0,2),
(10,'2020-05-01 00:01:00',NULL,525600,10080,201,1,'Children\'s Week',0,2),
(11,'2020-09-29 00:01:00',NULL,525600,10080,321,1,'Harvest Festival',0,2),
(12,'2014-10-19 00:00:00',NULL,525600,20160,324,1,'Hallow\'s End',0,2),
(13,'2000-01-01 08:00:00','2000-01-01 08:00:00',525600,1,0,0,'Elemental Invasions',0,2),
(14,'2016-10-29 00:00:00',NULL,10080,1440,0,0,'Stranglethorn Fishing Extravaganza Announce',0,2),
(15,'2016-10-30 14:00:00',NULL,10080,120,301,0,'Stranglethorn Fishing Extravaganza Fishing Pools',0,2),
(16,'2007-08-05 05:00:00',NULL,180,120,0,0,'Gurubashi Arena Booty Run',0,2),
(17,'2000-01-01 08:00:00','2000-01-01 08:00:00',525600,1,0,0,'Scourge Invasion',0,2),
(18,'2010-05-07 08:00:00',NULL,60480,6240,283,1,'Call to Arms: Alterac Valley!',0,2),
(19,'2010-04-02 08:00:00',NULL,60480,6240,284,1,'Call to Arms: Warsong Gulch!',0,2),
(20,'2010-04-23 08:00:00',NULL,60480,6240,285,1,'Call to Arms: Arathi Basin!',0,2),
(21,'2010-04-30 08:00:00',NULL,60480,6240,353,1,'Call to Arms: Eye of the Storm!',0,2),
(22,'2000-01-01 08:00:00','2000-01-01 08:00:00',525600,1,0,0,'AQ War Effort',0,2),
(23,'2014-09-04 01:01:00',NULL,131040,4320,374,1,'Darkmoon Faire Building (Elwynn Forest)',0,2),
(24,'2017-09-20 01:01:00','2030-12-31 07:00:00',525600,21600,372,2,'Brewfest',0,2),
(25,'2015-07-29 21:00:00',NULL,1440,510,0,0,'Nocturnal',0,2),
(26,'2020-11-23 01:00:00',NULL,525600,10080,404,1,'Pilgrim\'s Bounty',0,2),
(27,'2008-03-24 06:00:00',NULL,86400,21600,0,0,'Edge of Madness, Gri\'lek',0,2),
(28,'2008-04-07 07:00:00',NULL,86400,21600,0,0,'Edge of Madness, Hazza\'rah',0,2),
(29,'2008-04-21 07:00:00',NULL,86400,21600,0,0,'Edge of Madness, Renataki',0,2),
(30,'2008-05-05 07:00:00',NULL,86400,21600,0,0,'Edge of Madness, Wushoolay',0,2),
(31,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,2592000,0,0,'Arena Tournament',0,2),
(32,'2007-08-03 08:00:00','2007-08-04 17:00:00',60,5,0,0,'L70ETC Concert',0,2),
(33,'2011-03-22 00:10:00',NULL,30,5,0,0,'Dalaran: Minigob',0,2),
(34,'2012-10-01 00:01:00',NULL,525600,44640,0,0,'Brew of the Month October',0,2),
(35,'2012-11-01 00:01:00',NULL,525600,43200,0,0,'Brew of the Month November',0,2),
(36,'2012-12-01 00:01:00',NULL,525600,44640,0,0,'Brew of the Month December',0,2),
(37,'2012-01-01 00:01:00',NULL,525600,44640,0,0,'Brew of the Month January',0,2),
(38,'2012-02-01 00:01:00',NULL,525600,40320,0,0,'Brew of the Month February',0,2),
(39,'2012-03-01 00:01:00',NULL,525600,44640,0,0,'Brew of the Month March',0,2),
(40,'2012-04-01 00:01:00',NULL,525600,43200,0,0,'Brew of the Month April',0,2),
(41,'2012-05-01 00:01:00',NULL,525600,44640,0,0,'Brew of the Month May',0,2),
(42,'2012-06-01 00:01:00',NULL,525600,43200,0,0,'Brew of the Month June',0,2),
(43,'2012-07-01 00:01:00',NULL,525600,44640,0,0,'Brew of the Month July',0,2),
(44,'2012-08-01 00:01:00',NULL,525600,44640,0,0,'Brew of the Month August',0,2),
(45,'2012-09-01 00:01:00',NULL,525600,44640,0,0,'Brew of the Month September',0,2),
(46,'2010-09-07 20:50:00',NULL,180,16,0,0,'L70ETC Announcement - Shattrath (World\'s End Tavern)',0,2),
(47,'2010-09-07 21:00:00',NULL,180,6,0,0,'L70ETC Performance - Shattrath (World\'s End Tavern)',0,2),
(48,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,2592000,0,0,'Wintergrasp Alliance Defence',5,2),
(49,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,2592000,0,0,'Wintergrasp Horde Defence',5,2),
(50,'2013-09-19 01:01:00',NULL,525600,1440,398,1,'Pirates\' Day',0,2),
(51,'2013-11-01 02:00:00',NULL,525600,2820,409,1,'Day of the Dead',0,2),
(52,'2015-12-25 06:00:00',NULL,525600,11700,0,0,'Winter Veil: Gifts',0,2),
(53,'2010-04-09 08:00:00',NULL,60480,6240,400,1,'Call to Arms: Strand of the Ancients!',0,2),
(54,'2010-04-16 08:00:00',NULL,60480,6240,420,1,'Call to Arms: Isle of Conquest!',0,2),
(55,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,2592000,0,0,'Arena Season 3',0,2),
(56,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,2592000,0,0,'Arena Season 4',0,2),
(57,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,2592000,0,0,'Arena Season 5',0,2),
(58,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,2592000,0,0,'Arena Season 6',0,2),
(59,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,2592000,0,0,'Arena Season 7',0,2),
(60,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,2592000,0,0,'Arena Season 8',0,2),
(61,'2010-09-07 01:00:00','2010-10-10 01:00:00',9999999,47520,0,0,'Zalazane\'s Fall',0,2),
(62,'2016-10-30 14:00:00',NULL,10080,180,0,0,'Stranglethorn Fishing Extravaganza Turn-ins',0,2),
(63,'2014-03-22 13:00:00',NULL,10080,180,0,0,'Kalu\'ak Fishing Derby Turn-ins',0,2),
(64,'2014-03-22 14:00:00',NULL,10080,60,424,0,'Kalu\'ak Fishing Derby Fishing Pools',0,2),
(65,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,2592000,0,0,'Venture Bay Alliance Defence',5,2),
(66,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,2592000,0,0,'Venture Bay Horde Defence',5,2),
(67,'2010-01-02 00:40:00',NULL,60,5,0,0,'AT Event Trigger (Tirion Speech)',0,2),
(68,'2010-01-02 00:55:00',NULL,60,5,0,0,'AT Event Trigger (Horde Event)',0,2),
(69,'2010-01-02 00:10:00',NULL,60,5,0,0,'AT Event Trigger (Alliance Event)',0,2),
(70,'2016-09-20 01:01:00',NULL,525600,4320,0,0,'Brewfest Building (Iron Forge)',0,2),
(71,'2013-01-06 01:01:00',NULL,131040,4320,375,1,'Darkmoon Faire Building (Mulgore)',0,2),
(77,'2016-11-06 01:01:00',NULL,131040,4320,376,1,'Darkmoon Faire Building (Terokkar Forest)',0,2),
(78,'2019-03-20 06:00:00',NULL,525600,262800,0,0,'Summertime',0,0),
(79,'2018-10-28 06:00:00',NULL,1440,720,0,0,'Daytime',0,0),
(85,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,60,0,0,'Stitches attacks Darkshire',0,0),
(87,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,60,0,0,'Demetria - The Scarlet Oracle',0,0),
(111,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,60,0,0,'Helcular\'s Remains attack Southshore',0,0),
(112,'2010-01-01 00:00:00',NULL,1440,60,0,0,'Hour 00',0,0),
(113,'2010-01-01 01:00:00',NULL,1440,60,0,0,'Hour 01',0,0),
(114,'2010-01-01 02:00:00',NULL,1440,60,0,0,'Hour 02',0,0),
(115,'2010-01-01 03:00:00',NULL,1440,60,0,0,'Hour 03',0,0),
(116,'2010-01-01 04:00:00',NULL,1440,60,0,0,'Hour 04',0,0),
(117,'2010-01-01 05:00:00',NULL,1440,60,0,0,'Hour 05',0,0),
(118,'2010-01-01 06:00:00',NULL,1440,60,0,0,'Hour 06',0,0),
(119,'2010-01-01 07:00:00',NULL,1440,60,0,0,'Hour 07',0,0),
(120,'2010-01-01 08:00:00',NULL,1440,60,0,0,'Hour 08',0,0),
(121,'2010-01-01 09:00:00',NULL,1440,60,0,0,'Hour 09',0,0),
(122,'2010-01-01 10:00:00',NULL,1440,60,0,0,'Hour 10',0,0),
(123,'2010-01-01 11:00:00',NULL,1440,60,0,0,'Hour 11',0,0),
(124,'2010-01-01 12:00:00',NULL,1440,60,0,0,'Hour 12',0,0),
(125,'2010-01-01 13:00:00',NULL,1440,60,0,0,'Hour 13',0,0),
(126,'2010-01-01 14:00:00',NULL,1440,60,0,0,'Hour 14',0,0),
(127,'2010-01-01 15:00:00',NULL,1440,60,0,0,'Hour 15',0,0),
(128,'2010-01-01 16:00:00',NULL,1440,60,0,0,'Hour 16',0,0),
(129,'2010-01-01 17:00:00',NULL,1440,60,0,0,'Hour 17',0,0),
(130,'2010-01-01 18:00:00',NULL,1440,60,0,0,'Hour 18',0,0),
(131,'2010-01-01 19:00:00',NULL,1440,60,0,0,'Hour 19',0,0),
(132,'2010-01-01 20:00:00',NULL,1440,60,0,0,'Hour 20',0,0),
(133,'2010-01-01 21:00:00',NULL,1440,60,0,0,'Hour 21',0,0),
(134,'2010-01-01 22:00:00',NULL,1440,60,0,0,'Hour 22',0,0),
(135,'2010-01-01 23:00:00',NULL,1440,60,0,0,'Hour 23',0,0),
(136,'2000-01-01 07:00:00','2000-01-01 07:00:00',5184000,60,0,0,'Deathblow to the Legion',0,0);
/*!40000 ALTER TABLE `game_event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

