DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009351 AND 3009352;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(3009351,179119,469,0,0,1,1,-7579.63,-912.661,428.384,3.75246,0,0,-0.953716,0.300708,7200,255,1),
(3009352,179120,469,0,0,1,1,-7592.78,-921.296,428.426,3.75246,0,0,-0.953716,0.300708,7200,255,1);
