UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 119572;
DELETE FROM `creature_addon` WHERE `guid` = 119572;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(119572,1195720,0,0,0,0,0,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 23802;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23802;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2380200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23802,0,0,0,34,0,100,0,2,3,0,0,0,80,2380200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wink Sprinklesprankle - On WP 4 Reached - Call Timed Action List'),
(23802,0,1,0,34,0,100,0,2,7,0,0,0,80,2380200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wink Sprinklesprankle - On WP 8 Reached - Call Timed Action List'),
(23802,0,2,0,34,0,100,0,2,12,0,0,0,80,2380200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wink Sprinklesprankle - On WP 13 Reached - Call Timed Action List'),

(2380200,9,0,0,0,0,100,0,2000,2000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wink Sprinklesprankle - On Script - Set Emote State ''STATE_USESTANDING'''),
(2380200,9,1,0,0,0,100,0,26000,26000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wink Sprinklesprankle - On Script - Set Emote State ''ONESHOT_NONE''');

DELETE FROM `waypoint_data` WHERE `id` = 1195720;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(1195720,1,594.392,-4928.27,17.8834,NULL,0,0,0,0,100,0),
(1195720,2,598.232,-4927.23,17.8835,NULL,0,0,0,0,100,0),
(1195720,3,604.329,-4926.59,17.8837,0.151637,30000,0,0,0,100,0),
(1195720,4,603.536,-4919.52,17.8837,NULL,30000,0,0,0,100,0),
(1195720,5,599.513,-4925.6,17.8837,NULL,0,0,0,0,100,0),
(1195720,6,591.432,-4928.39,17.8834,NULL,0,0,0,0,100,0),
(1195720,7,589.487,-4928.74,18.6776,NULL,0,0,0,0,100,0),
(1195720,8,584.939,-4926.43,18.6761,NULL,30000,0,0,0,100,0),
(1195720,9,580.731,-4928.98,18.6763,4.86256,60000,0,0,0,100,0),
(1195720,10,582.361,-4935.06,18.6719,NULL,0,0,0,0,100,0),
(1195720,11,584.455,-4942.88,18.6714,2.84966,60000,0,0,0,100,0),
(1195720,12,592.069,-4942.78,18.6746,NULL,0,0,0,0,100,0),
(1195720,13,590.218,-4936.2,18.6732,4.13772,30000,0,0,0,100,0),
(1195720,14,588.086,-4930.55,18.6718,NULL,0,0,0,0,100,0),
(1195720,15,589.807,-4929.9,18.678,NULL,0,0,0,0,100,0),
(1195720,16,591.326,-4929.33,17.9085,NULL,0,0,0,0,100,0);
