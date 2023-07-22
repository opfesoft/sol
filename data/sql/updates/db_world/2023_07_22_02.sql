UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 28879;
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 115429;
DELETE FROM `creature_addon` WHERE `guid` = 115429;
DELETE FROM `waypoint_data` WHERE `id` = 1154290;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 28879;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 28879;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28879,0,0,0,11,0,100,0,0,0,0,0,0,53,1,28879,1,0,0,2,1,0,0,0,0,0,0,0,0,'Shalewing - On Respawn - Start WP Movement');

DELETE FROM `waypoints` WHERE `entry` = 28879;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(28879,1,6182.11,-1990.78,433.975,'Shalewing'),
(28879,2,6201.41,-2000.76,425.125,NULL),
(28879,3,6209,-2021.65,426.005,NULL),
(28879,4,6191.33,-2043.42,431.616,NULL),
(28879,5,6172.32,-2047.75,423.978,NULL),
(28879,6,6159.71,-2039.77,423.978,NULL),
(28879,7,6151.03,-2030.29,423.978,NULL),
(28879,8,6148.25,-2012.32,427.644,NULL),
(28879,9,6160.55,-1991.35,423.978,NULL);
