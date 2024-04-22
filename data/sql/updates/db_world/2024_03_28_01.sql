UPDATE `gameobject` SET `position_z` = 3.21256 WHERE `guid` = 1407;

DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009311 AND 3009320 OR `guid` = 23648;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(3009311,181734,543,0,0,3,1,-1166.27,1453.71,68.5183,1.05222,0,0,0.502175,0.864766,7200,255,1),
(3009312,181736,543,0,0,3,1,-1218.09,1441.2,68.6415,2.49796,0,0,0.948662,0.316292,7200,255,1),
(3009313,181737,543,0,0,3,1,-1143.07,1508.32,68.5893,1.41679,0,0,0.650617,0.759406,7200,255,1),
(3009314,181787,530,0,0,1,1,-4507.17,-11618.3,11.3223,3.14159,0,0,-1,0,120,255,1),
(3009315,181870,530,0,0,1,1,-1217.26,-11454.5,0.583626,5.68444,0,0,-0.294923,0.955521,120,255,1),
(3009316,181887,530,0,0,1,1,-2518.31,-12292.8,13.7125,1.5708,0,0,0.707107,0.707107,120,255,1),
(3009317,182535,530,0,0,1,1,379.323,8175.64,22.9266,2.43473,0,0,0.93819,0.346119,120,255,1),
(3009318,182536,530,0,0,1,1,388.842,8134.62,23.6064,2.93214,0,0,0.994521,0.104536,120,255,1),
(3009319,182537,530,0,0,1,1,522.635,8401.99,21.0981,3.25271,0,0,-0.998457,0.0555311,120,255,1),
(3009320,185129,530,0,0,1,1,-3728.71,464.655,104.2,3.11529,0.00855398,-0.0132017,0.999788,0.0132625,120,255,1);