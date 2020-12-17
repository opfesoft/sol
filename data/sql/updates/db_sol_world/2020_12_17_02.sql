-- DB update 2020_12_17_01 -> 2020_12_17_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_17_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_17_01 2020_12_17_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608189160068052640'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608189160068052640');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 32879;
UPDATE `creature_addon` SET `path_id` = 328790 WHERE `guid` = 32879;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 10642 AND `source_type` = 0 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10642,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eck''alom - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 328790;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(328790,1,1980.5,-1342.54,83.3086,0,0,0,0,100,0),
(328790,2,1989.18,-1333.57,84.1117,0,0,0,0,100,0),
(328790,3,2001.25,-1302.73,85.0512,0,0,0,0,100,0),
(328790,4,1990.63,-1258.05,75.9004,0,0,0,0,100,0),
(328790,5,1998.44,-1213.31,78.7975,0,0,0,0,100,0),
(328790,6,2029.29,-1142.32,86.6556,0,0,0,0,100,0),
(328790,7,2035.54,-1058.24,86.2447,0,0,0,0,100,0),
(328790,8,1993.96,-971.86,82.2094,0,0,0,0,100,0),
(328790,9,1923.5,-998.879,80.6322,0,0,0,0,100,0),
(328790,10,1898.56,-1083.72,66.7534,0,0,0,0,100,0),
(328790,11,1917.77,-1164.03,83.2634,0,0,0,0,100,0),
(328790,12,1908.31,-1233.14,77.0729,0,0,0,0,100,0),
(328790,13,1864.12,-1290.1,85.1784,0,0,0,0,100,0),
(328790,14,1889.14,-1315.92,84.6296,0,0,0,0,100,0),
(328790,15,1883.43,-1332.2,88.2021,0,0,0,0,100,0),
(328790,16,1893.15,-1343.25,88.2021,0,0,0,0,100,0),
(328790,17,1908.58,-1338.54,88.2021,0,0,0,0,100,0),
(328790,18,1924.08,-1351.77,88.2594,0,0,0,0,100,0),
(328790,19,1944.09,-1345.26,88.2298,0,0,0,0,100,0),
(328790,20,1958.57,-1332.65,85.0142,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
