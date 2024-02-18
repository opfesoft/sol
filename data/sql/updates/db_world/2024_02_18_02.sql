UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 57631;

DELETE FROM `creature_addon` WHERE `guid` = 57631;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `maxAggroRadius`, `auras`)
VALUES
(57631,576310,0,0,1,0,0,NULL,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 16637;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16637;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1663700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16637,0,0,0,1,0,100,0,120000,240000,120000,240000,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Welethelon - OOC - Resume WP Path After 5 Seconds'),
(16637,0,1,0,34,0,100,0,2,1,0,0,0,80,1663700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Welethelon - On WP 2 Reached - Call Timed Action List'),
(16637,0,2,0,34,0,100,0,2,3,0,0,0,80,1663700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Welethelon - On WP 4 Reached - Call Timed Action List'),

(1663700,9,0,0,0,0,100,0,1000,1000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Welethelon - On Script - Set Emote State ''STATE_USESTANDING'''),
(1663700,9,1,0,0,0,100,0,13000,13000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Welethelon - On Script - Set Emote State ''ONESHOT_NONE''');

DELETE FROM `waypoint_data` WHERE `id` = 576310;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(576310,1,9662.24,-7078.38,14.3367,4.83861,900000,0,0,0,100,0),
(576310,2,9665.08,-7073.85,14.3426,1.57528,15000,0,0,0,100,0),
(576310,3,9668.51,-7079.23,14.3343,4.70117,900000,0,0,0,100,0),
(576310,4,9665.08,-7073.85,14.3426,1.57528,15000,0,0,0,100,0);
