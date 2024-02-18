UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 57680;

DELETE FROM `creature_addon` WHERE `guid` = 57680;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `maxAggroRadius`, `auras`)
VALUES
(57680,576800,0,0,1,0,0,NULL,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 16691;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16691;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1669100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16691,0,0,0,1,0,100,0,120000,240000,120000,240000,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noraelath - OOC - Resume WP Path After 5 Seconds'),
(16691,0,1,0,34,0,100,0,2,1,0,0,0,80,1669100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noraelath - On WP 2 Reached - Call Timed Action List'),
(16691,0,2,0,34,0,100,0,2,3,0,0,0,80,1669100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noraelath - On WP 4 Reached - Call Timed Action List'),

(1669100,9,0,0,0,0,100,0,1000,1000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noraelath - On Script - Set Emote State ''STATE_USESTANDING'''),
(1669100,9,1,0,0,0,100,0,13000,13000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Noraelath - On Script - Set Emote State ''ONESHOT_NONE''');

DELETE FROM `waypoint_data` WHERE `id` = 576800;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(576800,1,9648.21,-7071.54,14.3092,4.22748,900000,0,0,0,100,0),
(576800,2,9651.68,-7070.56,14.3109,0.677477,15000,0,0,0,100,0),
(576800,3,9650.83,-7073.55,14.3104,3.90154,900000,0,0,0,100,0),
(576800,4,9651.68,-7070.56,14.3109,0.677477,15000,0,0,0,100,0);
