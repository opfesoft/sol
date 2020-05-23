-- DB update 2020_05_23_01 -> 2020_05_24_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_23_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_23_01 2020_05_24_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1590276361591416453'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1590276361591416453');

CREATE TABLE `acore_string_locale`
(
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(4) NOT NULL,
  `content` text,
  PRIMARY KEY (`entry`,`locale`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`) SELECT `entry`, 'koKR', `content_loc1` FROM `acore_string` WHERE `content_loc1` IS NOT NULL AND LENGTH(`content_loc1`) > 0;
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`) SELECT `entry`, 'frFR', `content_loc2` FROM `acore_string` WHERE `content_loc2` IS NOT NULL AND LENGTH(`content_loc2`) > 0;
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`) SELECT `entry`, 'deDE', `content_loc3` FROM `acore_string` WHERE `content_loc3` IS NOT NULL AND LENGTH(`content_loc3`) > 0;
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`) SELECT `entry`, 'zhCN', `content_loc4` FROM `acore_string` WHERE `content_loc4` IS NOT NULL AND LENGTH(`content_loc4`) > 0;
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`) SELECT `entry`, 'zhTW', `content_loc5` FROM `acore_string` WHERE `content_loc5` IS NOT NULL AND LENGTH(`content_loc5`) > 0;
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`) SELECT `entry`, 'esES', `content_loc6` FROM `acore_string` WHERE `content_loc6` IS NOT NULL AND LENGTH(`content_loc6`) > 0;
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`) SELECT `entry`, 'esMX', `content_loc7` FROM `acore_string` WHERE `content_loc7` IS NOT NULL AND LENGTH(`content_loc7`) > 0;
INSERT INTO `acore_string_locale` (`entry`, `locale`, `content`) SELECT `entry`, 'ruRU', `content_loc8` FROM `acore_string` WHERE `content_loc8` IS NOT NULL AND LENGTH(`content_loc8`) > 0;

ALTER TABLE `acore_string`
DROP COLUMN `content_loc1`, -- koKR
DROP COLUMN `content_loc2`, -- frFR
DROP COLUMN `content_loc3`, -- deDE
DROP COLUMN `content_loc4`, -- zhCN
DROP COLUMN `content_loc5`, -- zhTW
DROP COLUMN `content_loc6`, -- esES
DROP COLUMN `content_loc7`, -- esMX
DROP COLUMN `content_loc8`; -- ruRU

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
