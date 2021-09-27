-- DB update 2021_09_27_02 -> 2021_09_27_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_27_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_27_02 2021_09_27_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632777557413339079'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632777557413339079');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (-56600,-137666);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-56600,0,0,0,34,0,100,0,2,1,0,0,0,80,1482300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On WP 2 Reached - Call Timed Action List'),
(-56600,0,1,0,34,0,100,0,2,7,0,0,0,80,1482302,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On WP 8 Reached - Call Timed Action List'),
(-56600,0,2,0,34,0,100,0,2,14,0,0,0,80,1482300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On WP 15 Reached - Call Timed Action List'),

(-137666,0,0,0,34,0,100,0,2,6,0,0,0,80,1482302,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On WP 7 Reached - Call Timed Action List'),
(-137666,0,1,0,34,0,100,0,2,17,0,0,0,80,1482300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On WP 18 Reached - Call Timed Action List'),
(-137666,0,2,0,34,0,100,0,2,24,0,0,0,80,1482300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silas Darkmoon - On WP 25 Reached - Call Timed Action List');

UPDATE `waypoint_data` SET `delay` = 300000 WHERE `id` = 1376660 AND `point` = 7;

DELETE FROM `waypoint_data` WHERE `id` = 566000;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(566000,1,-9557.07,83.7086,58.8816,0,0,0,0,100,0),
(566000,2,-9544.87,83.2385,60.6677,0,300000,0,0,100,0),
(566000,3,-9557.07,83.7086,58.8816,0,0,0,0,100,0),
(566000,4,-9554.57,88.8444,58.9045,0,0,0,0,100,0),
(566000,5,-9551.84,94.4594,58.8821,0,0,0,0,100,0),
(566000,6,-9545.32,93.8408,58.9446,0,0,0,0,100,0),
(566000,7,-9543.54,99.0075,58.9917,0,0,0,0,100,0),
(566000,8,-9544.02,104.622,59.3071,0,300000,0,0,100,0),
(566000,9,-9543.54,99.0075,58.9917,0,0,0,0,100,0),
(566000,10,-9540.44,93.3775,58.8911,0,0,0,0,100,0),
(566000,11,-9535.49,88.6063,58.887,0,0,0,0,100,0),
(566000,12,-9531.96,85.2087,58.882,0,0,0,0,100,0),
(566000,13,-9525.74,83.6098,58.882,0,0,0,0,100,0),
(566000,14,-9520.09,82.1573,59.2373,0,0,0,0,100,0),
(566000,15,-9516.13,81.1389,59.6036,0,300000,0,0,100,0),
(566000,16,-9525.01,79.8039,58.8824,0,0,0,0,100,0),
(566000,17,-9535.05,78.2951,58.8824,0,0,0,0,100,0),
(566000,18,-9544.4,76.8904,58.9542,0,0,0,0,100,0),
(566000,19,-9551.91,75.7614,58.8821,0,0,0,0,100,0),
(566000,20,-9557.07,83.7086,58.8816,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
