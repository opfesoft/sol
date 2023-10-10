UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 57656;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 16666;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16666;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1666600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16666,0,0,0,1,0,100,0,120000,240000,120000,240000,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feledis - OOC - Resume WP Path After 5 Seconds'),
(16666,0,1,0,34,0,100,0,2,3,0,0,0,80,1666600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feledis - On WP 4 Reached - Call Timed Action List'),
(16666,0,2,0,34,0,100,0,2,4,0,0,0,80,1666600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feledis - On WP 5 Reached - Call Timed Action List'),

(1666600,9,0,0,0,0,100,0,1000,1000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feledis - On Script - Set Emote State ''STATE_USESTANDING'''),
(1666600,9,1,0,0,0,100,0,13000,13000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Feledis - On Script - Set Emote State ''ONESHOT_NONE''');

DELETE FROM `waypoint_data` WHERE `id` = 576560;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(576560,1,9644.87,-7037.51,15.2466,4.28557,900000,0,0,0,100,0),
(576560,2,9649.43,-7038.28,15.2469,NULL,0,0,0,0,100,0),
(576560,3,9650.63,-7033.73,15.2669,NULL,0,0,0,0,100,0),
(576560,4,9647.03,-7033.26,15.2674,4.34054,15000,0,0,0,100,0),
(576560,5,9648.98,-7029.66,15.2674,1.07514,15000,0,0,0,100,0),
(576560,6,9650.63,-7033.73,15.2669,NULL,0,0,0,0,100,0),
(576560,7,9649.43,-7038.28,15.2469,NULL,0,0,0,0,100,0);
