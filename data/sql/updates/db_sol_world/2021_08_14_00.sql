-- DB update 2021_08_13_00 -> 2021_08_14_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_13_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_13_00 2021_08_14_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1628894598444588028'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1628894598444588028');

UPDATE `creature_template` SET `speed_walk` = 1, `ArmorModifier` = 3 WHERE `entry` = 2433; -- Helcular's Remains
UPDATE `creature_template` SET `faction` = 11 WHERE `entry` = 2386;                        -- Southshore Guard
UPDATE `creature_template` SET `faction` = 97 WHERE `entry` = 2434;                        -- Shadowy Assassin

DELETE FROM `creature` WHERE `guid` = 3008880;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3008880,2433,0,0,0,1,1,0,0,-740.465,-621.311,18.6696,6.20067,1,0,1,0,2,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 3008880;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(3008880,30088800,0,0,0,0,0,'');

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 1767;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 2433;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 243300;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 1767;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2433,0,0,0,11,0,100,0,0,0,0,0,0,80,243300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helcular''s Remains - On Respawn - Call Timed Action List'),
(2433,0,1,0,4,0,20,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Helcular''s Remains - On Aggro - Say Line 1'),
(2433,0,2,0,0,0,100,0,0,0,5000,5000,0,11,4950,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helcular''s Remains - IC - Cast ''Summon Helcular''s Puppets'''),
(2433,0,3,0,6,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helcular''s Remains - On Death - Set Active On'),
(2433,0,4,0,36,0,100,0,0,0,0,0,0,111,111,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helcular''s Remains - On Corpse Removed - Stop Game Event 111'),

(243300,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helcular''s Remains - On Script - Set Active On'),
(243300,9,1,0,0,0,100,0,0,0,0,0,0,102,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helcular''s Remains - On Script - Set Health Regeneration Off'),
(243300,9,2,0,0,0,100,0,0,0,0,0,0,11,3390,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helcular''s Remains - On Script - Cast ''Helcular''s Spawn'''),
(243300,9,3,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Helcular''s Remains - On Script - Say Line 0'),

(1767,1,0,0,20,0,100,0,553,0,0,0,0,112,111,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Helcular''s Grave - On Quest ''Helcular''s Revenge (Part 2)'' Rewarded - Start Game Event 111');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 2433;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,3,2433,0,0,29,1,2946,30,0,1,0,0,'Helcular''s Remains - Execute SAI only if Puppet of Helcular is not within 30y');

DELETE FROM `game_event` WHERE `eventEntry` = 111;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `holidayStage`, `description`, `world_event`, `announce`)
VALUES
(111,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,60,0,0,'Helcular''s Remains attack Southshore',0,2);

DELETE FROM `game_event_creature` WHERE `eventEntry` = 111;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`)
VALUES
(111,3008880);

DELETE FROM `waypoint_data` WHERE `id` = 30088800;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(30088800,1,-740.465,-621.311,18.6696,6.20067,10000,0,0,100,0),
(30088800,2,-742.94,-615.67,18.7129,0,0,0,0,100,0),
(30088800,3,-752.447,-609.17,16.6019,0,0,0,0,100,0),
(30088800,4,-763.641,-601.516,16.0169,0,0,0,0,100,0),
(30088800,5,-771.614,-596.065,15.3829,0,0,0,0,100,0),
(30088800,6,-782.402,-588.688,15.1523,0,0,0,0,100,0),
(30088800,7,-791.648,-582.367,15.2868,0,0,0,0,100,0),
(30088800,8,-799.258,-577.164,15.2437,0,0,0,0,100,0),
(30088800,9,-802.221,-566.857,15.3165,0,0,0,0,100,0),
(30088800,10,-805.153,-556.657,15.2644,0,0,0,0,100,0),
(30088800,11,-807.217,-549.479,15.5085,0,0,0,0,100,0),
(30088800,12,-809.476,-541.621,15.7262,0,0,0,0,100,0),
(30088800,13,-812.149,-532.322,15.1979,0,0,0,0,100,0),
(30088800,14,-814.18,-525.258,14.746,0,0,0,0,100,0),
(30088800,15,-822.801,-523.763,13.4207,0,0,0,0,100,0),
(30088800,16,-830.154,-522.489,12.411,0,0,0,0,100,0),
(30088800,17,-835.899,-521.493,11.6411,0,0,0,0,100,0),
(30088800,18,-844.584,-526.017,11.1106,0,0,0,0,100,0),
(30088800,19,-854.306,-531.081,10.0183,0,0,0,0,100,0),
(30088800,20,-864.451,-536.365,8.63114,0,0,0,0,100,0),
(30088800,21,-871.696,-540.139,8.02276,0,0,0,0,100,0),
(30088800,22,-882.32,-540.317,7.50309,0,0,0,0,100,0),
(30088800,23,-894.107,-540.516,6.87969,0,0,0,0,100,0),
(30088800,24,-902.998,-533.523,6.87969,0,0,0,0,100,0),
(30088800,25,-911.064,-527.179,6.87969,0,0,0,0,100,0),
(30088800,26,-918.123,-521.626,6.87969,0,0,0,0,100,0),
(30088800,27,-914.947,-529.531,6.87969,0,0,0,0,100,0),
(30088800,28,-911.422,-538.306,6.87969,0,0,0,0,100,0),
(30088800,29,-907.074,-549.128,6.87969,0,0,0,0,100,0),
(30088800,30,-903.637,-557.682,6.87969,0,0,0,0,100,0),
(30088800,31,-900.333,-565.905,6.87969,0,0,0,0,100,0),
(30088800,32,-897.115,-573.914,6.87969,0,0,0,0,100,0),
(30088800,33,-894.289,-580.948,6.87969,0,0,0,0,100,0),
(30088800,34,-892.68,-584.952,6.32802,0,0,0,0,100,0),
(30088800,35,-890.026,-591.558,7.36699,0,0,0,0,100,0),
(30088800,36,-883.245,-595.451,8.32894,0,0,0,0,100,0),
(30088800,37,-875.148,-600.1,10.596,0,0,0,0,100,0),
(30088800,38,-868.166,-604.108,10.8771,0,0,0,0,100,0),
(30088800,39,-860.379,-608.579,11.0844,0,0,0,0,100,0),
(30088800,40,-852.384,-613.17,11.4554,0,0,0,0,100,0),
(30088800,41,-844.522,-614.154,12.3928,0,0,0,0,100,0),
(30088800,42,-837.229,-615.067,13.9705,0,0,0,0,100,0),
(30088800,43,-831.206,-615.821,14.9121,0,0,0,0,100,0),
(30088800,44,-826.692,-616.386,14.912,0,0,0,0,100,0),
(30088800,45,-819.628,-617.271,14.1321,0,0,0,0,100,0),
(30088800,46,-812.446,-618.17,13.5438,0,0,0,0,100,0),
(30088800,47,-806.431,-618.923,14.7731,0,0,0,0,100,0),
(30088800,48,-801.104,-619.59,16.0133,0,0,0,0,100,0),
(30088800,49,-796.012,-620.228,16.3863,0,0,0,0,100,0),
(30088800,50,-790.574,-620.909,16.1296,0,0,0,0,100,0),
(30088800,51,-783.51,-621.793,15.6453,0,0,0,0,100,0),
(30088800,52,-776.202,-624.533,16.2076,0,0,0,0,100,0),
(30088800,53,-769.908,-626.68,16.8316,0,0,0,0,100,0),
(30088800,54,-766.595,-627.81,17.2781,0,0,0,0,100,0),
(30088800,55,-762.614,-625.767,17.039,0,0,0,0,100,0),
(30088800,56,-756.28,-622.516,16.3312,0,0,0,0,100,0),
(30088800,57,-748.032,-623.872,16.9073,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
