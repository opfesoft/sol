-- DB update 2020_06_16_01 -> 2020_06_16_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_16_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_16_01 2020_06_16_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1592309345566858496'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1592309345566858496');

-- Trok SAI
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 14872;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 14872 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14872,0,0,0,1,0,100,0,10000,20000,10000,20000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Trok - Out of Combat - Say Line 0');

-- Trok: Turn running on for waypoint movement
UPDATE `waypoint_data` SET `move_type` = 1 WHERE `id` = 131780;

-- Trok: Create creature formation with Swarm of bees
DELETE FROM `creature_formations` WHERE `leaderGUID` = 13178;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
(13178,13178,0,0,0),
(13178,13589,3.1,165,0),
(13178,13588,2.2,175,0),
(13178,13587,2.4,185,0),
(13178,13586,2.7,195,0);

-- Swarm of bees: Update position, remove waypoint movement as they are now part of the creature formation; increase run speed
UPDATE `creature` SET `position_x` = 180.182, `position_y` = -2862.82, `position_z` = 93.2346, `MovementType` = 0 WHERE `guid` IN (13589,13588,13587,13586);
DELETE FROM `creature_addon` WHERE `guid` IN (13589,13588,13587,13586);
DELETE FROM `waypoint_data` WHERE `id` IN (135890,135880,135870,135860);
UPDATE `creature_template` SET `speed_run` = 1.257143 WHERE `entry` = 14894;

-- Karu SAI
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 14874;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 14874 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1487400,1487401,1487402,1487403) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14874,0,0,0,25,0,100,0,0,0,0,0,0,53,0,14874,1,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Reset - Start Waypoint'),
(14874,0,1,0,40,0,100,0,1,14874,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Waypoint 1 Reached - Say Line 0'),
(14874,0,2,0,40,0,100,0,4,14874,0,0,0,80,1487400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Waypoint 4 Reached - Run Script'),
(14874,0,3,0,40,0,100,0,13,14874,0,0,0,80,1487401,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Waypoint 13 Reached - Run Script'),
(14874,0,4,0,40,0,100,0,13,14874,0,0,0,80,1487402,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Waypoint 13 Reached - Run Script'),
(14874,0,6,0,40,0,100,0,21,14874,0,0,0,80,1487403,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Waypoint 21 Reached - Run Script'),
(14874,0,7,0,40,0,100,0,9,14874,0,0,0,1,4,5000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Waypoint 9 Reached - Say Line 4'),

(1487400,9,0,0,0,0,100,0,0,0,0,0,0,54,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Script - Pause Waypoint'),
(1487400,9,1,0,0,0,100,0,3000,3000,0,0,0,1,1,4000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Script - Say Line 1'),
(1487400,9,2,0,0,0,100,0,4000,4000,0,0,0,1,2,4000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Script - Say Line 2'),
(1487400,9,3,0,0,0,100,0,4000,4000,0,0,0,1,3,4000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Script - Say Line 3'),

(1487401,9,0,0,0,0,100,0,0,0,0,0,0,54,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Script - Pause Waypoint'),
(1487401,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,3.06878,'Karu - On Script - Set Orienation'),
(1487401,9,2,0,0,0,100,0,4000,4000,0,0,0,1,5,5000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Script - Say Line 5'),
(1487401,9,3,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,20181,10685,0,0,0,0,0,0,'Karu - On Script - Set Data 1 1'),
(1487401,9,4,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,20186,10685,0,0,0,0,0,0,'Karu - On Script - Set Data 1 1'),
(1487401,9,5,0,0,0,100,0,5000,5000,0,0,0,1,6,5000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Script - Say Line 6'),

(1487402,9,0,0,0,0,100,0,0,0,0,0,0,54,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Script - Pause Waypoint'),
(1487402,9,1,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,3.06878,'Karu - On Script - Set Orienation'),
(1487402,9,2,0,0,0,100,0,5000,5000,0,0,0,1,7,5000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Script - Say Line 7'),

(1487403,9,0,0,0,0,100,0,0,0,0,0,0,54,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Script - Pause Waypoint'),
(1487403,9,1,0,0,0,100,0,2000,2000,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Karu - On Script - Start Random Movement');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceGroup` IN (4,5) AND `SourceEntry` = 14874;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(22,4,14874,0,0,29,1,10685,30,0,0,0,0,'','Karu - Run Swine SAI only, if swine is in range'),
(22,5,14874,0,0,29,1,10685,30,0,1,0,0,'','Karu - Do not run Swine SAI, if no swine is in range');

DELETE FROM `waypoints` WHERE `entry` = 14874;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(14874,1,242.249,-2902.21,97.9634,'Karu'),
(14874,2,241.339,-2907.13,98.0129,''),
(14874,3,234.215,-2901.64,98.1816,''),
(14874,4,231.002,-2901.18,98.2032,''),
(14874,5,224.344,-2899.96,97.2719,''),
(14874,6,221.426,-2894.66,96.1361,''),
(14874,7,217.204,-2889.08,94.318,''),
(14874,8,212.104,-2882.55,92.0763,''),
(14874,9,212.402,-2876.92,92.128,''),
(14874,10,215.615,-2870.7,91.6697,''),
(14874,11,221.156,-2861.38,91.6227,''),
(14874,12,226.571,-2854.09,91.5259,''),
(14874,13,226.086,-2850.93,91.4352,''),
(14874,14,224.387,-2853.99,91.4173,''),
(14874,15,216.445,-2869.58,91.6667,''),
(14874,16,212.921,-2878.2,91.9524,''),
(14874,17,213.96,-2887.12,93.1517,''),
(14874,18,219.002,-2891.98,95.3228,''),
(14874,19,224.263,-2898.76,97.0892,''),
(14874,20,231.168,-2900.84,98.2114,''),
(14874,21,241.121,-2900.6,97.9936,'');

-- Swine SAI
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 10685;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-20181,-20186) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-20186,0,0,0,38,0,100,0,1,1,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,224.731,-2850.54,91.3375,6.0917,'Swine - On Data Set 1 1 - Move To Position'),
(-20181,0,0,0,38,0,100,0,1,1,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,224.228,-2852.2,91.3376,0.6097,'Swine - On Data Set 1 1 - Move To Position');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
