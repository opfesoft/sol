/*
Darnassus Temple of the Moon Moonwell spell focus objects
*/

DELETE FROM `gameobject` WHERE `guid` IN (2135451,2135452,2135453,2135454);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(2135451,177281,1,0,0,1,1,9637.86,2524.03,1330,0,0,0,0,0,300,0,1,0),
(2135452,177281,1,0,0,1,1,9629.63,2524.03,1330,0,0,0,0,0,300,0,1,0),
(2135453,177281,1,0,0,1,1,9634.05,2519.87,1330,0,0,0,0,0,300,0,1,0),
(2135454,177281,1,0,0,1,1,9633.71,2528.07,1330,0,0,0,0,0,300,0,1,0);
