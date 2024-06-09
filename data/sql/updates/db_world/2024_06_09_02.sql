DELETE FROM `creature` WHERE `guid` = 110149;
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 110158;

DELETE FROM `creature_addon` WHERE `guid` = 110158;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `addonFlags`, `maxAggroRadius`, `auras`)
VALUES
(110158,1101580,0,0,0,0,0,NULL,NULL);

DELETE FROM `waypoint_scripts` WHERE `id` = 2703201;
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`)
VALUES
(2703201,2,2,74,8,0,0,0,0,0,201208),
(2703201,18,2,74,0,0,0,0,0,0,201209);

DELETE FROM `waypoint_data` WHERE `id` = 1101580;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(1101580,1,3217.29,-701.342,167.539,0.244346,60000,0,0,0,100,0),
(1101580,2,3216.42,-695.887,167.408,2.788,20000,0,0,2703201,100,0),
(1101580,3,3217.29,-701.342,167.539,0.244346,120000,0,0,0,100,0),
(1101580,4,3219.25,-706.852,167.539,NULL,0,0,0,0,100,0),
(1101580,5,3218.24,-712.361,167.414,4.27119,20000,0,0,2703201,100,0),
(1101580,6,3219.25,-706.852,167.539,NULL,0,0,0,0,100,0);
