-- DB update 2021_09_21_00 -> 2021_09_21_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_09_21_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_09_21_00 2021_09_21_01 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1631973253175864827'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1631973253175864827');

-- Slightly changes the position of two mining Nodes, so that the whole Node is visible
UPDATE `gameobject` SET `position_z` = -277 WHERE `id` = 123848 AND `guid` = 15462;
UPDATE `gameobject` SET `position_z` = -233 WHERE `id` = 123309 AND `guid` = 15423;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
