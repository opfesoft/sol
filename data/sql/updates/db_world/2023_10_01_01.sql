UPDATE `creature_template_addon` SET `emote` = 0 WHERE `entry` = 18952;

UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 68050;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 68051;
UPDATE `creature` SET `position_x` = -172.198, `position_y` = 2398.63, `position_z` = 49.8794, `orientation` = 3.44864, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 68068;

DELETE FROM `creature_addon` WHERE `guid` IN (68051,68068);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(68051,0,0,0,1,69,0,NULL),
(68068,0,0,0,1,69,0,NULL);
