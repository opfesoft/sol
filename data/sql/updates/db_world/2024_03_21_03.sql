DELETE FROM `gameobject` WHERE `guid` IN (3009299,3009300);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(3009299,177213,429,0,0,1,1,10.5911,-154.998,-2.69379,3.14159,0,0,-1,0,7200,255,1),
(3009300,179550,429,0,0,1,1,83.2552,630.546,-24.6315,5.64614,0,0,-0.313164,0.949699,7200,255,1);
