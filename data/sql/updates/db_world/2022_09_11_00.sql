UPDATE `creature` SET `position_x` = 7951.26, `position_y` = -7549.04, `position_z` = 144.659, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 81891;
UPDATE `creature` SET `position_x` = 7924.51, `position_y` = -7585.26, `position_z` = 145.404, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 82038;
UPDATE `creature` SET `position_x` = 7939.31, `position_y` = -7570.18, `position_z` = 145.086, `MovementType` = 2 WHERE `guid` = 82035;

DELETE FROM `creature_addon` WHERE `guid` = 82035;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(82035,820350,0,0,4098,0,0,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 16217;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16217;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1621700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16217,0,0,0,1,0,100,0,2000,20000,120000,180000,0,80,1621700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lieutenant Tomathren - OOC - Call Timed Actionlist'),

(1621700,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lieutenant Tomathren - On Script - Say Line 0'),
(1621700,9,1,0,0,0,100,0,8000,8000,0,0,0,1,0,0,0,0,0,0,19,16219,0,0,0,0,0,0,0,'Lieutenant Tomathren - On Script - Say Line 0 (Ranger Valanna)');

DELETE FROM `waypoint_data` WHERE `id` = 820350;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(820350,1,7939.31,-7570.18,145.086,NULL,0,0,0,0,100,0),
(820350,2,7936.69,-7573.08,144.986,NULL,0,0,0,0,100,0),
(820350,3,7933.51,-7571.93,145.587,NULL,0,0,0,0,100,0),
(820350,4,7932.49,-7568.67,145.682,NULL,0,0,0,0,100,0),
(820350,5,7935.13,-7565.32,145.547,NULL,0,0,0,0,100,0),
(820350,6,7938.38,-7566.49,145.521,NULL,0,0,0,0,100,0);
