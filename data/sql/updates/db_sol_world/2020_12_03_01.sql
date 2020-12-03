-- DB update 2020_12_03_00 -> 2020_12_03_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_03_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_03_00 2020_12_03_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606978287648733959'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606978287648733959');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 15973;
UPDATE `creature_addon` SET `path_id` = 159730 WHERE `guid` = 15973;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 14278;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 14278 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14278,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ro''Bark - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 159730;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(159730,1,-879.45,-1032.25,30.3596,0,0,0,0,100,0),
(159730,2,-890.181,-1036.17,30.3491,0,0,0,0,100,0),
(159730,3,-899.749,-1039.66,30.3481,0,0,0,0,100,0),
(159730,4,-907.457,-1041.53,30.3481,0,0,0,0,100,0),
(159730,5,-915.845,-1043.56,30.3481,0,0,0,0,100,0),
(159730,6,-925.451,-1045.89,30.4729,0,0,0,0,100,0),
(159730,7,-932.184,-1039.1,30.3565,0,0,0,0,100,0),
(159730,8,-939.006,-1032.22,30.3487,0,0,0,0,100,0),
(159730,9,-947.223,-1023.94,30.3487,0,0,0,0,100,0),
(159730,10,-956.185,-1014.9,30.7775,0,0,0,0,100,0),
(159730,11,-955.982,-1010.76,30.5943,0,0,0,0,100,0),
(159730,12,-955.578,-1002.49,30.3479,0,0,0,0,100,0),
(159730,13,-955.11,-992.931,30.3669,0,0,0,0,100,0),
(159730,14,-954.624,-983.011,30.4729,0,0,0,0,100,0),
(159730,15,-948.939,-973.491,30.3479,0,0,0,0,100,0),
(159730,16,-943.662,-964.655,30.4531,0,0,0,0,100,0),
(159730,17,-937.856,-960.148,30.348,0,0,0,0,100,0),
(159730,18,-929.976,-954.033,30.4687,0,0,0,0,100,0),
(159730,19,-925.365,-950.454,31.1797,0,0,0,0,100,0),
(159730,20,-922.421,-948.169,31.4945,0,0,0,0,100,0),
(159730,21,-917.251,-951.114,31.8765,0,0,0,0,100,0),
(159730,22,-911.776,-954.231,30.8511,0,0,0,0,100,0),
(159730,23,-906.807,-957.061,30.4073,0,0,0,0,100,0),
(159730,24,-901.652,-959.997,30.3695,0,0,0,0,100,0),
(159730,25,-895.031,-963.929,30.3462,0,0,0,0,100,0),
(159730,26,-887.604,-968.339,30.3462,0,0,0,0,100,0),
(159730,27,-879.94,-972.891,30.4711,0,0,0,0,100,0),
(159730,28,-877.04,-980.273,30.3478,0,0,0,0,100,0),
(159730,29,-873.541,-989.179,30.3478,0,0,0,0,100,0),
(159730,30,-869.37,-999.796,30.4711,0,0,0,0,100,0),
(159730,31,-872.175,-1008.83,30.3479,0,0,0,0,100,0),
(159730,32,-874.874,-1017.52,30.3479,0,0,0,0,100,0),
(159730,33,-877.229,-1025.1,30.3479,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
