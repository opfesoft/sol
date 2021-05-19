-- DB update 2021_05_19_00 -> 2021_05_19_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_19_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_19_00 2021_05_19_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1621406223211894597'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1621406223211894597');

UPDATE `creature` SET `position_x` = 1415.85, `position_y` = -3315.36, `position_z` = 168.379, `wander_distance` = 3 WHERE `guid` = 119556;
UPDATE `creature` SET `position_x` = 1420.57, `position_y` = -3294.66, `position_z` = 168.643, `wander_distance` = 7 WHERE `guid` = 105797;
UPDATE `creature` SET `position_x` = 1446.22, `position_y` = -3314.38, `position_z` = 168.816, `wander_distance` = 4 WHERE `guid` = 119565;
UPDATE `creature` SET `position_x` = 1340.04, `position_y` = -3266.80, `position_z` = 175.263 WHERE `guid` = 119536;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (105730,105731);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
