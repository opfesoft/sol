-- DB update 2020_04_16_01 -> 2020_04_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_04_16_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_04_16_01 2020_04_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1587153567174736072'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1587153567174736072');

UPDATE `creature` SET `position_x` = -3537.4, `position_y` = 2705.64, `position_z` = 95.1718, `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 51692;
UPDATE `creature` SET `position_x` = -3558.26, `position_y` = 2639.88, `position_z` = 87.5591, `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 51697;
UPDATE `creature` SET `position_x` = -3257.82, `position_y` = 2755.02, `position_z` = 65.6081, `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 51699;
UPDATE `creature` SET `position_x` = -3435.14, `position_y` = 2857.25, `position_z` = 85.0829, `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 51704;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
