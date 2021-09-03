-- DB update 2021_09_03_02 -> 2021_09_03_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_03_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_03_02 2021_09_03_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630680327220650549'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630680327220650549');

-- Adjust position / movement
UPDATE `creature` SET `position_x` = -5795.16, `position_y` = -418.767, `position_z` = 365.019, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 240;
UPDATE `creature` SET `position_x` = -5804.62, `position_y` = -443.627, `position_z` = 365.019, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 3624;
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (296,1693,3596,3597);

-- Remove obsolete WP paths
DELETE FROM `creature_addon` WHERE `guid` IN (3557,3596);
DELETE FROM `waypoint_data` WHERE `id` IN (35570,35960);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
