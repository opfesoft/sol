DELETE FROM `creature` WHERE `guid` IN (23431,23434);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(23431,14222,0,0,0,1,1,0,-203.155,-308.609,157.801,0.395757,72000,10,1342,0,1,0,0,0,0),
(23434,14222,0,0,0,1,1,0,-105.383,-85.8896,139.728,1.88409,72000,10,1342,0,1,0,0,0,0);

DELETE FROM `pool_template` WHERE `entry` = 1108;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(1108,1,'Araga (1 out of 3)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 1108;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(17066,1108,0,'Araga 1'),
(23431,1108,0,'Araga 2'),
(23434,1108,0,'Araga 3');
