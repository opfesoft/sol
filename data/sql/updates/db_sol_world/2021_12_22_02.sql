-- DB update 2021_12_22_01 -> 2021_12_22_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_22_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_22_01 2021_12_22_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1640199524565250620'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1640199524565250620');

UPDATE `creature` SET `position_x` = 3297.45, `position_y` = -3081.86, `position_z` = 158.756, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 86295; -- Stitched Horror
UPDATE `creature` SET `position_x` = 3310.97, `position_y` = -3063.84, `position_z` = 153.58 WHERE `guid` = 69692; -- Putrid Gargoyle
UPDATE `creature` SET `position_x` = 3222.21, `position_y` = -3013.84, `position_z` = 127.808, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 84786; -- Cannibal Ghoul

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
