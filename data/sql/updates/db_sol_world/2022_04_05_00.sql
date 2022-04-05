-- DB update 2022_04_04_02 -> 2022_04_05_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_04_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_04_02 2022_04_05_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1649141167304598673'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1649141167304598673');

UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (81159,81160,81164,81172,81171,81170,81176,81299,81294,81311,81320,81161,81162,81166,81167,81173,81165);
UPDATE `creature` SET `position_x` = -9155.16, `position_y` = -1082.84, `position_z` = 71.1583, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 81175;
UPDATE `creature` SET `position_x` = -9117.46, `position_y` = -1092.89, `position_z` = 73.0502, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 81174;
UPDATE `creature` SET `position_x` = -9097.79, `position_y` = -1069.14, `position_z` = 73.5837, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 81168;
UPDATE `creature` SET `position_x` = -9168.99, `position_y` = -1032.09, `position_z` = 70.9733, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 81169;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
