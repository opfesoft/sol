UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 57668;

DELETE FROM `creature_addon` WHERE `guid` = 57668;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `maxAggroRadius`, `auras`)
VALUES
(57668,576680,0,0,1,0,0,NULL,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 16678;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16678;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1667800;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16678,0,0,0,1,0,100,0,120000,240000,120000,240000,0,239,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rahein - OOC - Resume WP Path After 5 Seconds'),
(16678,0,1,0,34,0,100,0,2,1,0,0,0,80,1667800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rahein - On WP 2 Reached - Call Timed Action List'),
(16678,0,2,0,34,0,100,0,2,3,0,0,0,80,1667800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rahein - On WP 4 Reached - Call Timed Action List'),
(16678,0,3,0,34,0,100,0,2,5,0,0,0,80,1667800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rahein - On WP 6 Reached - Call Timed Action List'),

(1667800,9,0,0,0,0,100,0,1000,1000,0,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rahein - On Script - Set Emote State ''STATE_USESTANDING'''),
(1667800,9,1,0,0,0,100,0,13000,13000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rahein - On Script - Set Emote State ''ONESHOT_NONE''');

DELETE FROM `waypoint_data` WHERE `id` = 576680;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(576680,1,9630.69,-7032.97,15.2687,4.7088,900000,0,0,0,100,0),
(576680,2,9636.05,-7031.66,15.2693,0.683633,15000,0,0,0,100,0),
(576680,3,9630.69,-7032.97,15.2687,4.7088,900000,0,0,0,100,0),
(576680,4,9630.66,-7032.19,15.2686,1.65753,15000,0,0,0,100,0),
(576680,5,9630.69,-7032.97,15.2687,4.7088,900000,0,0,0,100,0),
(576680,6,9627.83,-7031.5,15.2695,2.69818,15000,0,0,0,100,0);
