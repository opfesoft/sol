UPDATE `gameobject` SET `position_x` = 2356.87, `position_y` = 7293.82, `position_z` = 365.957, `orientation` = 4.18007, `rotation2` = -0.868198, `rotation3` = 0.496217 WHERE `guid` = 24779;

DELETE FROM `gameobject` WHERE `guid` BETWEEN 3009353 AND 3009357;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(3009353,105173,1,0,0,1,1,2900.79,2465.59,138.23,0.750425,0,0,0.36647,0.93043,120,255,1),
(3009354,186174,530,0,0,1,1,-1374.56,9706.98,205.306,3.14159,0,0,-1,0,120,255,1),
(3009355,186175,530,0,0,1,1,-1456.97,9855.9,200.637,3.15033,0,0,-0.99999,0.00436732,120,255,1),
(3009356,186176,530,0,0,1,1,-1547.62,9744.4,202.452,0.0698117,0,0,0.0348988,0.999391,120,255,1),
(3009357,186178,530,0,0,1,1,-1374.64,9581.06,205.552,0.881392,0,0,0.426569,0.904455,120,255,1);
