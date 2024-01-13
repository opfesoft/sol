UPDATE `gameobject` SET `position_x` = 8719.93, `position_y` = -6665.39, `position_z` = 70.2157, `orientation` = 2.75762, `rotation2` = 0.981627, `rotation3` = 0.190808 WHERE `guid` = 22398;

DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009226 AND 3009230;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(3009226,185965,530,0,0,1,1,2511.03,7346.34,380.742,3.58666,0,0,-0.975342,0.2207,120,255,1),
(3009227,188132,530,0,0,1,1,2209.03,4735.66,159.667,3.58666,0,0,-0.975342,0.2207,120,255,1),
(3009228,195219,1,0,0,1,1,7867.27,-2575.55,486.913,3.24635,0,0,-0.998629,0.0523532,120,255,1),
(3009229,195605,0,0,0,1,1,-8559.02,457.105,104.649,1.94604,0,0,0.82659,0.562805,120,255,1),
(3009230,195620,0,0,0,1,1,-8753.29,565.232,97.5344,2.37364,0,0,0.927183,0.374608,120,255,1);
