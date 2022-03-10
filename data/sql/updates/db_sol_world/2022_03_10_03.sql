-- DB update 2022_03_10_02 -> 2022_03_10_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_10_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_10_02 2022_03_10_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1646952209239112331'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1646952209239112331');

UPDATE `creature` SET `position_x` = -4760.69, `position_y` = -3437.45, `position_z` = 291.931, `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 8208;
UPDATE `creature` SET `position_x` = -4767.19, `position_y` = -3418.27, `position_z` = 289.357, `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 8211;
UPDATE `creature` SET `position_x` = -4798.29, `position_y` = -3473.54, `position_z` = 291.608, `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 8284;
UPDATE `creature` SET `position_x` = -4793.51, `position_y` = -3438.65, `position_z` = 288.749, `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 8329;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
