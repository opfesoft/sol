UPDATE `gameobject_template` SET `Data2` = 60000, `Data3` = 0 WHERE `entry` IN (184418,184419,184420,184421,184422,184423,184424,184425,184426,184427,184428,184429,184430,184431,184595,185461,185462,185463,185464,185465,185466,185467);
UPDATE `gameobject_template_addon` SET `flags` = 32 WHERE `entry` IN (184595,185461,185462,185463,185464);

UPDATE `creature_template` SET `flags_extra` = `flags_extra` & ~2 WHERE `entry` IN (20888,22825,22826,22827,22828);

DELETE FROM `creature_template_addon` WHERE `entry` = 20889;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(20889,0,0,0,1,0,0,'32566');

UPDATE `creature` SET `spawntimesecs` = 60 WHERE `id` IN (20520,20889);

DELETE FROM `creature` WHERE `guid` = 3009406;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009406,20889,530,0,0,1,1,0,0,3681.98,5977.24,265.765,-2.05949,60,0,1,0,0,0,0,0,0);
