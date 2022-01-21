-- DB update 2022_01_13_01 -> 2022_01_21_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_13_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_13_01 2022_01_21_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1642718981325437347'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1642718981325437347');

DROP TABLE IF EXISTS `creature_guid_chance`;

CREATE TABLE `creature_guid_chance`
(
  `id` mediumint(8) unsigned NOT NULL,
  `guid` int(10) unsigned NOT NULL,
  `chance` float NOT NULL,
  PRIMARY KEY (`id`,`guid`),
  CONSTRAINT `creature_guid_chance_unique` UNIQUE (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
