/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `spell_required`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spell_required` (
  `spell_id` mediumint(8) NOT NULL DEFAULT 0,
  `req_spell` mediumint(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`spell_id`,`req_spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=FIXED COMMENT='Spell Additinal Data';
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `spell_required` WRITE;
/*!40000 ALTER TABLE `spell_required` DISABLE KEYS */;
INSERT INTO `spell_required`
VALUES
(16689,339),
(16810,1062),
(16811,5195),
(16812,5196),
(16813,9852),
(17329,9853),
(23161,5784),
(23161,33391),
(23214,13819),
(23214,33391),
(25782,19838),
(25894,19854),
(25899,20911),
(25916,25291),
(25918,25290),
(27009,26989),
(27141,27140),
(27143,27142),
(27681,14752),
(34767,33391),
(34767,34769),
(48933,48931),
(48934,48932),
(48937,48935),
(48938,48936),
(53312,53308);
/*!40000 ALTER TABLE `spell_required` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

