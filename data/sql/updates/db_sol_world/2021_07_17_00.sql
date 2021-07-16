-- DB update 2021_07_15_02 -> 2021_07_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_07_15_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_07_15_02 2021_07_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1626477996734194086'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1626477996734194086');

UPDATE `gameobject` SET `position_x` = -689.165, `position_y` = 154.637, `position_z` = 19.5637  WHERE `guid` = 75523;
UPDATE `gameobject` SET `position_x` = -689.423, `position_y` = 168.738, `position_z` = 18.0591  WHERE `guid` IN (75314,75315,75316);
UPDATE `creature_addon` SET `emote` = 233 WHERE `guid` = 15588;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
