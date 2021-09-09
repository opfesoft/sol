-- DB update 2021_09_09_01 -> 2021_09_09_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_09_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_09_01 2021_09_09_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631178304787981924'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631178304787981924');

UPDATE `creature` SET `position_x` = -10642.8, `position_y` = 1016.66, `position_z` = 31.4811, `orientation` = 0.741738, `MovementType` = 2 WHERE `guid` = 89532;
UPDATE `creature_addon` SET `path_id` = 895320 WHERE `guid` = 89532;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 869;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 869;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(869,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Protector Dorana - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 895320;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(895320,1,-10642.8,1016.66,31.4811,0.741738,60000,0,0,100,0),
(895320,2,-10632,1009.12,32.1684,0,0,0,0,100,0),
(895320,3,-10620.2,1000.85,32.8801,0,0,0,0,100,0),
(895320,4,-10610.5,996.077,34.2161,0,0,0,0,100,0),
(895320,5,-10601.7,991.739,35.4284,0,0,0,0,100,0),
(895320,6,-10594,987.937,36.7941,0,0,0,0,100,0),
(895320,7,-10585.6,984.456,37.6443,0,0,0,0,100,0),
(895320,8,-10575.4,980.221,38.9405,0,0,0,0,100,0),
(895320,9,-10564.6,975.733,40.5664,0,0,0,0,100,0),
(895320,10,-10557.4,972.63,41.0279,0,0,0,0,100,0),
(895320,11,-10549.7,969.253,41.3034,0,0,0,0,100,0),
(895320,12,-10541.2,965.588,41.407,0,0,0,0,100,0),
(895320,13,-10532.9,961.984,40.8852,0,0,0,0,100,0),
(895320,14,-10524.6,959.609,40.9335,0,0,0,0,100,0),
(895320,15,-10517.3,957.537,40.9914,0,0,0,0,100,0),
(895320,16,-10508.3,954.966,40.3803,0,0,0,0,100,0),
(895320,17,-10500.2,952.64,39.433,0,0,0,0,100,0),
(895320,18,-10490.9,952.968,38.5107,0,0,0,0,100,0),
(895320,19,-10478.9,953.39,36.8993,0,0,0,0,100,0),
(895320,20,-10466.9,953.813,35.847,0,0,0,0,100,0),
(895320,21,-10457.9,961.33,35.1838,0,0,0,0,100,0),
(895320,22,-10449.9,967.982,35.0737,0,0,0,0,100,0),
(895320,23,-10441.4,975.081,35.1998,0,0,0,0,100,0),
(895320,24,-10433.2,981.964,34.5816,0,0,0,0,100,0),
(895320,25,-10420.9,988.853,33.0478,0,0,0,0,100,0),
(895320,26,-10410.5,994.716,32.1237,0,0,0,0,100,0),
(895320,27,-10400.4,992.543,31.5692,0,0,0,0,100,0),
(895320,28,-10393.4,988.177,31.3571,0,0,0,0,100,0),
(895320,29,-10386.8,984.074,31.1056,0,0,0,0,100,0),
(895320,30,-10376,982.155,31.1197,0,0,0,0,100,0),
(895320,31,-10367.4,980.618,31.1309,0,0,0,0,100,0),
(895320,32,-10357.1,980.059,31.1307,0,0,0,0,100,0),
(895320,33,-10343.9,979.346,31.1307,0,0,0,0,100,0),
(895320,34,-10333.5,978.783,31.1299,0,0,0,0,100,0),
(895320,35,-10324.7,975.298,31.1299,0,0,0,0,100,0),
(895320,36,-10311.4,970.046,31.1289,0,0,0,0,100,0),
(895320,37,-10300.2,965.637,31.129,0,0,0,0,100,0),
(895320,38,-10285.6,964.09,31.1306,0,0,0,0,100,0),
(895320,39,-10273.9,970.693,31.1277,0,0,0,0,100,0),
(895320,40,-10267.6,983.352,31.2727,0,0,0,0,100,0),
(895320,41,-10260.9,989.903,31.2724,0,0,0,0,100,0),
(895320,42,-10245.8,993.465,31.13,0,0,0,0,100,0),
(895320,43,-10234,996.264,31.4918,0,0,0,0,100,0),
(895320,44,-10224.1,995.295,32.2243,0,0,0,0,100,0),
(895320,45,-10215.9,994.502,32.4147,0,0,0,0,100,0),
(895320,46,-10207.1,991.623,32.5941,0,0,0,0,100,0),
(895320,47,-10200.1,989.352,32.7851,0,0,0,0,100,0),
(895320,48,-10190,984.9,33.6852,0,0,0,0,100,0),
(895320,49,-10183.1,985.437,34.4174,0,0,0,0,100,0),
(895320,50,-10174.3,986.128,34.3987,0,0,0,0,100,0),
(895320,51,-10166.8,986.717,34.0541,0,0,0,0,100,0),
(895320,52,-10157,987.878,33.9786,0,0,0,0,100,0),
(895320,53,-10144.6,989.343,34.8514,0,0,0,0,100,0),
(895320,54,-10133.5,990.649,36.0486,0,0,0,0,100,0),
(895320,55,-10124.4,990.366,37.4363,0,0,0,0,100,0),
(895320,56,-10116.7,990.127,37.9858,0,0,0,0,100,0),
(895320,57,-10107.9,994.984,38.2314,0,0,0,0,100,0),
(895320,58,-10100.2,999.191,37.4609,0,60000,0,0,100,0),
(895320,59,-10107.9,994.984,38.2314,0,0,0,0,100,0),
(895320,60,-10116.7,990.127,37.9858,0,0,0,0,100,0),
(895320,61,-10124.4,990.366,37.4363,0,0,0,0,100,0),
(895320,62,-10133.5,990.649,36.0486,0,0,0,0,100,0),
(895320,63,-10144.6,989.343,34.8514,0,0,0,0,100,0),
(895320,64,-10157,987.878,33.9786,0,0,0,0,100,0),
(895320,65,-10166.8,986.717,34.0541,0,0,0,0,100,0),
(895320,66,-10174.3,986.128,34.3987,0,0,0,0,100,0),
(895320,67,-10183.1,985.437,34.4174,0,0,0,0,100,0),
(895320,68,-10190,984.9,33.6852,0,0,0,0,100,0),
(895320,69,-10200.1,989.352,32.7851,0,0,0,0,100,0),
(895320,70,-10207.1,991.623,32.5941,0,0,0,0,100,0),
(895320,71,-10215.9,994.502,32.4147,0,0,0,0,100,0),
(895320,72,-10224.1,995.295,32.2243,0,0,0,0,100,0),
(895320,73,-10234,996.264,31.4918,0,0,0,0,100,0),
(895320,74,-10245.8,993.465,31.13,0,0,0,0,100,0),
(895320,75,-10260.9,989.903,31.2724,0,0,0,0,100,0),
(895320,76,-10267.6,983.352,31.2727,0,0,0,0,100,0),
(895320,77,-10273.9,970.693,31.1277,0,0,0,0,100,0),
(895320,78,-10285.6,964.09,31.1302,0,0,0,0,100,0),
(895320,79,-10300.2,965.637,31.129,0,0,0,0,100,0),
(895320,80,-10311.4,970.046,31.1289,0,0,0,0,100,0),
(895320,81,-10324.7,975.298,31.1299,0,0,0,0,100,0),
(895320,82,-10333.5,978.783,31.1299,0,0,0,0,100,0),
(895320,83,-10343.9,979.346,31.1307,0,0,0,0,100,0),
(895320,84,-10357.1,980.059,31.1307,0,0,0,0,100,0),
(895320,85,-10367.4,980.618,31.1309,0,0,0,0,100,0),
(895320,86,-10376,982.155,31.1197,0,0,0,0,100,0),
(895320,87,-10386.8,984.074,31.1056,0,0,0,0,100,0),
(895320,88,-10393.4,988.177,31.3571,0,0,0,0,100,0),
(895320,89,-10400.4,992.543,31.5692,0,0,0,0,100,0),
(895320,90,-10410.5,994.716,32.1237,0,0,0,0,100,0),
(895320,91,-10420.9,988.853,33.0478,0,0,0,0,100,0),
(895320,92,-10433.2,981.964,34.5816,0,0,0,0,100,0),
(895320,93,-10441.4,975.081,35.1998,0,0,0,0,100,0),
(895320,94,-10449.9,967.982,35.0737,0,0,0,0,100,0),
(895320,95,-10457.9,961.33,35.1838,0,0,0,0,100,0),
(895320,96,-10466.9,953.813,35.847,0,0,0,0,100,0),
(895320,97,-10478.9,953.39,36.8993,0,0,0,0,100,0),
(895320,98,-10490.9,952.968,38.5107,0,0,0,0,100,0),
(895320,99,-10500.2,952.64,39.433,0,0,0,0,100,0),
(895320,100,-10508.3,954.966,40.3803,0,0,0,0,100,0),
(895320,101,-10517.3,957.537,40.9914,0,0,0,0,100,0),
(895320,102,-10524.6,959.609,40.9335,0,0,0,0,100,0),
(895320,103,-10532.9,961.984,40.8852,0,0,0,0,100,0),
(895320,104,-10541.2,965.588,41.407,0,0,0,0,100,0),
(895320,105,-10549.7,969.253,41.3034,0,0,0,0,100,0),
(895320,106,-10557.4,972.63,41.0279,0,0,0,0,100,0),
(895320,107,-10564.6,975.733,40.5664,0,0,0,0,100,0),
(895320,108,-10575.4,980.221,38.9405,0,0,0,0,100,0),
(895320,109,-10585.6,984.456,37.6443,0,0,0,0,100,0),
(895320,110,-10594,987.937,36.7941,0,0,0,0,100,0),
(895320,111,-10601.7,991.739,35.4284,0,0,0,0,100,0),
(895320,112,-10610.5,996.077,34.2161,0,0,0,0,100,0),
(895320,113,-10620.2,1000.85,32.8801,0,0,0,0,100,0),
(895320,114,-10632,1009.12,32.1684,0,0,0,0,100,0),
(895320,115,-10647.5,1012.37,31.7345,4.1111,60000,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
