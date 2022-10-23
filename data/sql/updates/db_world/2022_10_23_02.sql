UPDATE `creature_template` SET `InhabitType` = 1 WHERE `entry` IN (8387,8388,8389,8394);

DELETE FROM `creature` WHERE `guid` BETWEEN 160359 AND 160363;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(160359,8387,1,0,0,1,1,0,1,1747.24,-5859.6,-90.3817,3.98543,300,0,1,0,0,0,0,0,0),
(160360,8388,1,0,0,1,1,0,1,1747.62,-5862.27,-90.9249,3.17332,300,0,1,0,0,0,0,0,0),
(160361,8389,1,0,0,1,1,0,1,1748.87,-5863.46,-90.2665,2.83088,300,0,1,0,0,0,0,0,0),
(160362,8394,1,0,0,1,1,0,0,1746.45,-5861.29,-91.4165,3.20841,300,0,1,0,0,0,0,0,0),
(160363,8478,1,0,0,1,1,0,1,1916.44,-5733.37,10.1936,4.10397,300,0,1,0,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` BETWEEN 160359 AND 160363;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(160359,0,0,0,1,0,0,'59562'),
(160360,0,0,0,1,0,0,'59562'),
(160361,0,0,0,1,0,0,'59562'),
(160362,0,0,0,0,0,0,'12508 59562'),
(160363,0,0,8,0,0,0,NULL);
