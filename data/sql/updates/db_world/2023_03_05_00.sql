UPDATE `creature` SET `MovementType` = 2 WHERE `guid` IN (73970,73976);
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (73967,73968,73971,73974,73975,73978,73979,73980);
UPDATE `creature` SET `position_x` = -2928.06, `position_y` = 1703.12, `position_z` = 66.2636, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 73969;
UPDATE `creature` SET `position_x` = -3219.74, `position_y` = 1754.85, `position_z` = 88.4464, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 73966;
UPDATE `creature` SET `position_x` = -2782.52, `position_y` = 1522.94, `position_z` = 6.23104, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 73972;
UPDATE `creature` SET `position_x` = -2778.36, `position_y` = 1470.54, `position_z` = 6.20633, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 73973;
UPDATE `creature` SET `position_x` = -2954.99, `position_y` = 1333.99, `position_z` = 6.25872, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 73977;

DELETE FROM `creature_addon` WHERE `guid` IN (73970,73976);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(73970,739700,0,0,1,0,0,NULL),
(73976,739760,0,0,1,0,0,NULL);

DELETE FROM `waypoint_data` WHERE `id` IN (739700,739760);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(739700,1,-2950.92,1718.03,66.2349,NULL,0,0,0,0,100,0),
(739700,2,-2949.55,1727.26,66.1959,NULL,0,0,0,0,100,0),
(739700,3,-2948.18,1736.5,66.1258,NULL,0,0,0,0,100,0),
(739700,4,-2946.96,1744.69,66.1784,NULL,0,0,0,0,100,0),
(739700,5,-2945.89,1751.96,66.3954,NULL,0,0,0,0,100,0),
(739700,6,-2946.96,1744.69,66.1784,NULL,0,0,0,0,100,0),
(739700,7,-2948.18,1736.5,66.1258,NULL,0,0,0,0,100,0),
(739700,8,-2949.55,1727.26,66.1959,NULL,0,0,0,0,100,0),
(739700,9,-2950.92,1718.03,66.2349,NULL,0,0,0,0,100,0),
(739700,10,-2956.08,1713.74,66.1579,NULL,0,0,0,0,100,0),
(739700,11,-2963.53,1707.56,66.3054,NULL,0,0,0,0,100,0),
(739700,12,-2969.36,1702.72,66.3066,NULL,0,0,0,0,100,0),
(739700,13,-2963.53,1707.56,66.3054,NULL,0,0,0,0,100,0),
(739700,14,-2956.08,1713.74,66.1579,NULL,0,0,0,0,100,0),

(739760,1,-2878.59,1414.53,6.13106,NULL,0,0,0,0,100,0),
(739760,2,-2872.15,1420.29,6.21358,NULL,0,0,0,0,100,0),
(739760,3,-2865.98,1425.81,6.08632,NULL,0,0,0,0,100,0),
(739760,4,-2857.72,1433.21,6.3127,NULL,0,0,0,0,100,0),
(739760,5,-2861.42,1439.15,6.26515,NULL,0,0,0,0,100,0),
(739760,6,-2866.17,1446.77,6.23837,NULL,0,0,0,0,100,0),
(739760,7,-2869.43,1452.01,6.08804,NULL,0,0,0,0,100,0),
(739760,8,-2872.63,1457.16,6.11891,NULL,0,0,0,0,100,0),
(739760,9,-2865.45,1459.56,6.09995,NULL,0,0,0,0,100,0),
(739760,10,-2857.04,1462.37,6.00644,NULL,0,0,0,0,100,0),
(739760,11,-2848.64,1465.18,6.03987,NULL,0,0,0,0,100,0),
(739760,12,-2840.22,1467.99,6.13379,NULL,0,0,0,0,100,0),
(739760,13,-2833.03,1470.39,6.33682,NULL,0,0,0,0,100,0),
(739760,14,-2825.06,1473.05,6.37151,NULL,0,0,0,0,100,0),
(739760,15,-2814.11,1476.7,6.39716,NULL,0,0,0,0,100,0),
(739760,16,-2808.4,1483.65,6.3027,NULL,0,0,0,0,100,0),
(739760,17,-2802.47,1490.85,6.0729,NULL,0,0,0,0,100,0),
(739760,18,-2796.39,1498.24,6.25284,NULL,0,0,0,0,100,0),
(739760,19,-2790.39,1505.54,6.28082,NULL,0,0,0,0,100,0),
(739760,20,-2784.39,1512.83,6.37943,NULL,0,0,0,0,100,0),
(739760,21,-2778.69,1519.77,6.35318,NULL,0,0,0,0,100,0),
(739760,22,-2774.02,1525.45,6.34952,NULL,0,0,0,0,100,0),
(739760,23,-2769.94,1517.44,6.38659,NULL,0,0,0,0,100,0),
(739760,24,-2765.39,1508.5,6.08448,NULL,0,0,0,0,100,0),
(739760,25,-2760.99,1499.86,5.79108,NULL,0,0,0,0,100,0),
(739760,26,-2756.55,1491.14,5.98796,NULL,0,0,0,0,100,0),
(739760,27,-2752.16,1482.5,5.94653,NULL,0,0,0,0,100,0),
(739760,28,-2759.26,1478.47,6.13299,NULL,0,0,0,0,100,0),
(739760,29,-2768.08,1473.46,6.08789,NULL,0,0,0,0,100,0),
(739760,30,-2777.22,1468.28,6.18933,NULL,0,0,0,0,100,0),
(739760,31,-2787.46,1462.47,6.10005,NULL,0,0,0,0,100,0),
(739760,32,-2797.81,1456.59,6.22919,NULL,0,0,0,0,100,0),
(739760,33,-2808.26,1450.66,5.87257,NULL,0,0,0,0,100,0),
(739760,34,-2817.8,1445.25,5.6142,NULL,0,0,0,0,100,0),
(739760,35,-2827.13,1439.95,5.83093,NULL,0,0,0,0,100,0),
(739760,36,-2837.27,1434.2,6.22528,NULL,0,0,0,0,100,0),
(739760,37,-2847.62,1428.32,6.18754,NULL,0,0,0,0,100,0),
(739760,38,-2858.58,1422.11,6.0925,NULL,0,0,0,0,100,0),
(739760,39,-2868.42,1416.52,6.19518,NULL,0,0,0,0,100,0),
(739760,40,-2878.16,1410.99,6.13584,NULL,0,0,0,0,100,0),
(739760,41,-2886.68,1406.16,6.24185,NULL,0,0,0,0,100,0),
(739760,42,-2895.2,1401.32,6.10529,NULL,0,0,0,0,100,0),
(739760,43,-2899.87,1398.67,6.14955,NULL,0,0,0,0,100,0),
(739760,44,-2895.01,1402.3,6.12726,NULL,0,0,0,0,100,0),
(739760,45,-2885.56,1409.34,6.11098,NULL,0,0,0,0,100,0);