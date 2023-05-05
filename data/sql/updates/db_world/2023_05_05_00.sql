UPDATE `creature_template` SET `npcflag` = `npcflag` & ~2 WHERE `entry` = 2683;

DELETE FROM `creature` WHERE `guid` = 87022;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(87022,2683,0,0,0,1,1,0,1,-4923.1,725.529,253.1,6.21499,300,0,1,0,0,0,0,0,0);
