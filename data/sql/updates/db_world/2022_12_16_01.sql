DELETE FROM `gameobject` WHERE `guid` = 92053;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(92053,195218,1,0,0,1,1,8008.74,-2668.05,512.064,2.75761,0,0,0.981627,0.190812,120,255,1,0);

UPDATE `creature` SET `position_x` = 8008.88, `position_y` = -2666.03, `position_z` = 512.1 WHERE `guid` = 42416;
