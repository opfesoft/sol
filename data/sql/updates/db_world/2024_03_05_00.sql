DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009239 AND 3009241;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(3009239,194466,530,0,0,1,1,-1737.48,5632.61,128.97,0,0,0,0,1,120,255,1),
(3009240,194467,530,0,0,1,1,-1745.25,5646.84,128.023,5.5676,0,0,-0.350207,0.936672,120,255,1),
(3009241,194468,530,0,0,1,1,-1747.67,5648.66,128.023,4.04917,0,0,-0.898793,0.438373,120,255,1);
