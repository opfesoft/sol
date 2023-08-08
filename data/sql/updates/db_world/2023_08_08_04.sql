UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 51829;

DELETE FROM `creature` WHERE `guid` = 3009578;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009578,8200,1,0,0,1,1,0,1,-7195.04,-2979.69,9.05203,5.34071,43200,4,1,0,1,0,0,0,0);

DELETE FROM `pool_template` WHERE `entry` = 203352;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(203352,1,'Jin''Zallah the Sandbringer (1 out of 2)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 203352;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(51829,203352,0,'Jin''Zallah the Sandbringer - Spawn 1'),
(3009578,203352,0,'Jin''Zallah the Sandbringer - Spawn 2');
