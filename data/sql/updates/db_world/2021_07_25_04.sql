-- DB update 2021_07_25_03 -> 2021_07_25_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_07_25_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_07_25_03 2021_07_25_04 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1626810503477176700'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1626810503477176700');

UPDATE `graveyard_zone` SET `Faction`=67 WHERE `Id`=97 AND `GhostZone`=209;
UPDATE `graveyard_zone` SET `Faction`=469 WHERE `Id`=149 AND `GhostZone`=209;

DELETE FROM `graveyard_zone` WHERE `ID`=1256 AND `GhostZone`=209;
INSERT INTO `graveyard_zone` (`ID`, `GhostZone`, `Faction`, `Comment`) VALUES
(1256,209,0,'Silverpine Forest, South GY - Silverpine Forest');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
