UPDATE `creature_template_addon` SET `bytes1` = 3 WHERE `entry` = 17046;

UPDATE `creature` SET `position_x` = -649.861, `position_y` = 4141.91, `position_z` = 64.4801, `orientation` = 1.45607, `MovementType` = 2 WHERE `guid` = 59416;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` IN (62071,62078);

DELETE FROM `creature_addon` WHERE `guid` = 59416;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `maxAggroRadius`, `auras`)
VALUES
(59416,594160,0,0,1,0,0,NULL,NULL);

DELETE FROM `creature_text` WHERE `CreatureId` = 17015 AND `GroupID` = 4;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17015,4,0,'Another pilgrim has arrived! Bring water quickly, or we may lose her!',12,1,100,0,0,0,13388,0,'Taleris Dawngazer');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17015;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17015;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1701500,1701501);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17015,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Respawn - Disable Event Phase Reset'),
(17015,0,1,0,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - Linked - Set Event Phase 0'),
(17015,0,2,0,34,0,100,0,2,10,0,0,0,80,1701500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On WP 11 Reached - Call Timed Action List'),
(17015,0,3,0,34,0,100,0,2,21,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On WP 22 Reached - Set Event Phase 1'),
(17015,0,4,0,34,0,100,0,2,22,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On WP 23 Reached - Set Event Phase 0'),
(17015,0,5,0,38,1,100,0,1,1,0,0,0,80,1701501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Data Set 1 1 (Event Phase 1) - Call Timed Action List'),

(1701500,9,0,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Remove NPC Flags'),
(1701500,9,1,0,0,0,100,0,0,0,0,0,0,83,0,0,0,0,0,0,19,17046,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Remove NPC Flags (Pilgrim Gal''ressa)'),
(1701500,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Say Line 0'),
(1701500,9,3,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,19,17046,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Say Line 0 (Pilgrim Gal''ressa)'),
(1701500,9,4,0,0,0,100,0,0,0,0,0,0,91,3,0,0,0,0,0,19,17046,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Remove ''UNIT_STAND_STATE_SLEEP'' (Pilgrim Gal''ressa)'),
(1701500,9,5,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,19,17046,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Say Line 1 (Pilgrim Gal''ressa)'),
(1701500,9,6,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Say Line 1'),
(1701500,9,7,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,19,17046,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Say Line 2 (Pilgrim Gal''ressa)'),
(1701500,9,8,0,0,0,100,0,8000,8000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Say Line 2'),
(1701500,9,9,0,0,0,100,0,6000,6000,0,0,0,1,3,0,0,0,0,0,19,17046,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Say Line 3 (Pilgrim Gal''ressa)'),
(1701500,9,10,0,0,0,100,0,6000,6000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Say Line 3'),
(1701500,9,11,0,0,0,100,0,0,0,0,0,0,90,3,0,0,0,0,0,19,17046,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Set ''UNIT_STAND_STATE_SLEEP'' (Pilgrim Gal''ressa)'),
(1701500,9,12,0,0,0,100,0,0,0,0,0,0,82,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Restore NPC Flags'),
(1701500,9,13,0,0,0,100,0,0,0,0,0,0,82,0,0,0,0,0,0,19,17046,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Restore NPC Flags (Pilgrim Gal''ressa)'),

(1701501,9,0,0,0,0,100,0,0,0,0,0,0,239,600000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Resume WP Path After 600 Seconds'),
(1701501,9,1,0,0,0,100,0,3000,3000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(1701501,9,2,0,0,0,100,0,2000,2000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Say Line 4'),
(1701501,9,3,0,0,0,100,0,4000,4000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Taleris Dawngazer - On Script - Remove ''UNIT_STAND_STATE_KNEEL''');

UPDATE `script_waypoint` SET `location_x` = -655.212, `location_y` = 4145.1, `location_z` = 64.21 WHERE `entry` = 16993 AND `pointid` = 100;
UPDATE `script_waypoint` SET `location_x` = -653.214, `location_y` = 4141.68, `location_z` = 64.4521 WHERE `entry` = 16993 AND `pointid` = 101;
UPDATE `script_waypoint` SET `location_x` = -651.063, `location_y` = 4138, `location_z` = 64.5814 WHERE `entry` = 16993 AND `pointid` = 102;

DELETE FROM `waypoint_data` WHERE `id` = 594160;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(594160,1,-649.861,4141.91,64.4801,NULL,0,0,0,0,100,0),
(594160,2,-649.301,4146.77,64.2694,NULL,0,0,0,0,100,0),
(594160,3,-648.924,4150.05,64.1244,NULL,0,0,0,0,100,0),
(594160,4,-649.956,4153.28,64.3423,NULL,0,0,0,0,100,0),
(594160,5,-651.059,4156.72,65.1442,NULL,0,0,0,0,100,0),
(594160,6,-652.234,4160.4,66.0731,NULL,0,0,0,0,100,0),
(594160,7,-651.134,4163.84,66.9717,NULL,0,0,0,0,100,0),
(594160,8,-650.067,4167.17,67.6834,NULL,0,0,0,0,100,0),
(594160,9,-648.892,4170.84,68.1915,NULL,0,0,0,0,100,0),
(594160,10,-647.968,4173.73,68.3824,NULL,0,0,0,0,100,0),
(594160,11,-646.951,4176.91,68.4971,1.47672,47000,0,0,0,100,0),
(594160,12,-647.968,4173.73,68.3824,NULL,0,0,0,0,100,0),
(594160,13,-648.892,4170.84,68.1915,NULL,0,0,0,0,100,0),
(594160,14,-650.067,4167.17,67.6834,NULL,0,0,0,0,100,0),
(594160,15,-651.134,4163.84,66.9717,NULL,0,0,0,0,100,0),
(594160,16,-652.234,4160.4,66.0731,NULL,0,0,0,0,100,0),
(594160,17,-651.059,4156.72,65.1442,NULL,0,0,0,0,100,0),
(594160,18,-649.956,4153.28,64.3423,NULL,0,0,0,0,100,0),
(594160,19,-648.924,4150.05,64.1244,NULL,0,0,0,0,100,0),
(594160,20,-649.301,4146.77,64.2694,NULL,0,0,0,0,100,0),
(594160,21,-649.861,4141.91,64.4801,NULL,0,0,0,0,100,0),
(594160,22,-650.434,4136.92,64.6203,2.09901,600000,0,0,0,100,0),
(594160,23,-650.434,4136.92,64.6203,2.09901,1000,0,0,0,100,0);
