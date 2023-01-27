UPDATE `creature_template` SET `npcflag` = `npcflag` | 1 WHERE `entry` = 24956;
DELETE FROM `creature_addon` WHERE `guid` = 203125;
DELETE FROM `waypoint_data` WHERE `id` = 2031250;
UPDATE `creature` SET `position_x` = 115.362, `position_y` = -3700.37, `position_z` = 0.934316, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 203125;
