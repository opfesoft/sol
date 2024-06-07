UPDATE `creature_template` SET `modelid2` = 0, `InhabitType` = `InhabitType` | 4, `flags_extra` = `flags_extra` & ~128 WHERE `entry` = 32193;
UPDATE `creature` SET `position_x` = -14.1921, `position_y` = -0.08272, `position_z` = -11.675, `orientation` = 3.12414 WHERE `guid` = 142961;

DELETE FROM `creature_template_addon` WHERE `entry` = 32193;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `maxAggroRadius`, `auras`)
VALUES
(32193,0,0,0,0,0,1,NULL,NULL);
