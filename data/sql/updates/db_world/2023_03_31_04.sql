UPDATE `creature_template` SET `AIName` = 'SmartAI', `InhabitType` = `InhabitType` | 4 WHERE `entry` = 19382;

DELETE FROM `creature` WHERE `guid` BETWEEN 3009355 AND 3009361;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009355,19382,530,0,0,1,1,0,0,-4108.75,2120.99,165.498,5.35342,300,0,6986,0,0,0,0,0,0),
(3009356,19382,530,0,0,1,1,0,0,-4051.94,2241.56,162.544,0.216896,300,0,6986,0,0,0,0,0,0),
(3009357,19382,530,0,0,1,1,0,0,-3899.48,2238.93,153.799,6.19141,300,0,6986,0,0,0,0,0,0),
(3009358,19382,530,0,0,1,1,0,0,-3949.48,2304.36,171.654,6.06812,300,0,6986,0,0,0,0,0,0),
(3009359,19382,530,0,0,1,1,0,0,-3900.47,2224.45,151.84,0.100661,300,0,6986,0,0,0,0,0,0),
(3009360,19382,530,0,0,1,1,0,0,-3999.39,2088.57,154.241,4.72118,300,0,6986,0,0,0,0,0,0),
(3009361,19382,530,0,0,1,1,0,0,-4076.25,2220.12,152.366,5.04713,300,0,6986,0,0,0,0,0,0);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` BETWEEN -3009361 AND -3009355;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-3009355,0,0,0,11,0,100,0,0,0,0,0,0,53,1,1938200,1,0,0,0,1,0,0,0,0,0,0,0,0,'Wildhammer Gryphon Rider - On Respawn - Start WP Movement'),
(-3009356,0,0,0,11,0,100,0,0,0,0,0,0,53,1,1938201,1,0,0,0,1,0,0,0,0,0,0,0,0,'Wildhammer Gryphon Rider - On Respawn - Start WP Movement'),
(-3009357,0,0,0,11,0,100,0,0,0,0,0,0,53,1,1938202,1,0,0,0,1,0,0,0,0,0,0,0,0,'Wildhammer Gryphon Rider - On Respawn - Start WP Movement'),
(-3009358,0,0,0,11,0,100,0,0,0,0,0,0,53,1,1938203,1,0,0,0,1,0,0,0,0,0,0,0,0,'Wildhammer Gryphon Rider - On Respawn - Start WP Movement'),
(-3009359,0,0,0,11,0,100,0,0,0,0,0,0,53,1,1938204,1,0,0,0,1,0,0,0,0,0,0,0,0,'Wildhammer Gryphon Rider - On Respawn - Start WP Movement'),
(-3009360,0,0,0,11,0,100,0,0,0,0,0,0,53,1,1938205,1,0,0,0,1,0,0,0,0,0,0,0,0,'Wildhammer Gryphon Rider - On Respawn - Start WP Movement'),
(-3009361,0,0,0,11,0,100,0,0,0,0,0,0,53,1,1938206,1,0,0,0,1,0,0,0,0,0,0,0,0,'Wildhammer Gryphon Rider - On Respawn - Start WP Movement');

DELETE FROM `waypoints` WHERE `entry` BETWEEN 1938200 AND 1938206;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(1938200,1,-4108.75,2120.99,165.498,'Wildhammer Gryphon Rider GUID 3009355'),
(1938200,2,-4099.19,2100.11,159.642,NULL),
(1938200,3,-4043.58,2116.84,149.879,NULL),
(1938200,4,-3984.91,2130.74,144.929,NULL),
(1938200,5,-3904.38,2138.36,134.802,NULL),
(1938200,6,-3878.68,2156.17,130.807,NULL),
(1938200,7,-3861.03,2178.32,133.881,NULL),
(1938200,8,-3864.98,2235.6,145.941,NULL),
(1938200,9,-3908.54,2253.61,151.858,NULL),
(1938200,10,-3960.79,2246.79,157.82,NULL),
(1938200,11,-4009.92,2224.95,164.005,NULL),
(1938200,12,-4060.04,2180.75,163.157,NULL),

(1938201,1,-4051.94,2241.56,162.544,'Wildhammer Gryphon Rider GUID 3009356'),
(1938201,2,-3997.56,2253.14,158.921,NULL),
(1938201,3,-3925.54,2219.22,155.111,NULL),
(1938201,4,-3854.31,2156.6,134.7,NULL),
(1938201,5,-3818.04,2075.42,128.011,NULL),
(1938201,6,-3834.16,2048.48,128.009,NULL),
(1938201,7,-3880.47,2038.16,123.718,NULL),
(1938201,8,-3925.97,2044.73,123.344,NULL),
(1938201,9,-3974.4,2054.21,134.021,NULL),
(1938201,10,-4013.86,2083.46,146.103,NULL),
(1938201,11,-4031.3,2131.46,154.554,NULL),
(1938201,12,-4054.6,2206.02,161.32,NULL),

(1938202,1,-3899.48,2238.93,153.799,'Wildhammer Gryphon Rider GUID 3009357'),
(1938202,2,-3857.09,2225.5,139.343,NULL),
(1938202,3,-3849.71,2185.97,122.181,NULL),
(1938202,4,-3852.46,2144.69,125.701,NULL),
(1938202,5,-3859.27,2102.81,130.463,NULL),
(1938202,6,-3890.33,2069.91,135.302,NULL),
(1938202,7,-3959.81,2086.18,157.318,NULL),
(1938202,8,-4040.09,2124.8,171.418,NULL),
(1938202,9,-4072.57,2169.26,165.294,NULL),
(1938202,10,-4064.99,2207.03,168.235,NULL),
(1938202,11,-4004.62,2224.87,164.896,NULL),
(1938202,12,-3928.63,2232.41,162.067,NULL),

(1938203,1,-3949.48,2304.36,171.654,'Wildhammer Gryphon Rider GUID 3009358'),
(1938203,2,-3881.05,2279.63,154.421,NULL),
(1938203,3,-3857.98,2258.32,135.208,NULL),
(1938203,4,-3840.02,2223.93,121.701,NULL),
(1938203,5,-3839.27,2183.51,122.92,NULL),
(1938203,6,-3862.96,2152.95,124.671,NULL),
(1938203,7,-3864.79,2109.73,130.412,NULL),
(1938203,8,-3883.63,2073.73,128.885,NULL),
(1938203,9,-3935.96,2049.97,127.05,NULL),
(1938203,10,-3987.81,2020.87,129.134,NULL),
(1938203,11,-4009.99,2053.36,132.873,NULL),
(1938203,12,-4040.82,2096.28,158.469,NULL),
(1938203,13,-4031.14,2157.85,162.339,NULL),
(1938203,14,-4017.71,2217.55,168.982,NULL),
(1938203,15,-3992.56,2266.98,173.162,NULL),

(1938204,1,-3900.47,2224.45,151.84,'Wildhammer Gryphon Rider GUID 3009359'),
(1938204,2,-3869.76,2227.03,145.231,NULL),
(1938204,3,-3854.2,2205.04,137.46,NULL),
(1938204,4,-3844.81,2150.86,126.133,NULL),
(1938204,5,-3844.5,2111.13,123.73,NULL),
(1938204,6,-3845.52,2056.38,123.894,NULL),
(1938204,7,-3884.24,2038.94,120.657,NULL),
(1938204,8,-3937.46,2039.53,128.187,NULL),
(1938204,9,-3979.93,2042.14,130.443,NULL),
(1938204,10,-4006.04,2045.1,134.086,NULL),
(1938204,11,-4029.41,2088.36,144.849,NULL),
(1938204,12,-4032.27,2129.1,151.644,NULL),
(1938204,13,-4046.06,2167.97,159.199,NULL),
(1938204,14,-3997.94,2182.24,147.777,NULL),
(1938204,15,-3945.65,2182.34,153.491,NULL),
(1938204,16,-3917.84,2209.25,151.136,NULL),

(1938205,1,-3999.39,2088.57,154.241,'Wildhammer Gryphon Rider GUID 3009360'),
(1938205,2,-3996.4,2025.73,131.159,NULL),
(1938205,3,-3980.67,1984.63,126.931,NULL),
(1938205,4,-3949.4,1961.52,120.325,NULL),
(1938205,5,-3912.93,1976.07,122.084,NULL),
(1938205,6,-3881.71,2029.34,126.014,NULL),
(1938205,7,-3868.52,2086.93,126.512,NULL),
(1938205,8,-3884.25,2110.46,129.245,NULL),
(1938205,9,-3928.8,2132.42,137.384,NULL),
(1938205,10,-3974.01,2138.49,141.452,NULL),
(1938205,11,-3987.24,2120.74,150.055,NULL),

(1938206,1,-4076.25,2220.12,152.366,'Wildhammer Gryphon Rider GUID 3009361'),
(1938206,2,-4055.83,2173.18,151.895,NULL),
(1938206,3,-4030.75,2118.7,150.714,NULL),
(1938206,4,-4013.47,2072.27,139.418,NULL),
(1938206,5,-3996.36,2020.97,126.096,NULL),
(1938206,6,-3975.46,1984.79,122.488,NULL),
(1938206,7,-3938.71,1972.51,121.056,NULL),
(1938206,8,-3910.65,1995.43,123.188,NULL),
(1938206,9,-3890.18,2041.82,125.367,NULL),
(1938206,10,-3875.63,2074.2,135.303,NULL),
(1938206,11,-3885.37,2108.05,141.323,NULL),
(1938206,12,-3907.97,2156.71,142.056,NULL),
(1938206,13,-3918.51,2202.87,151.002,NULL),
(1938206,14,-3948.5,2232.25,150.484,NULL),
(1938206,15,-3994.83,2256.08,151.702,NULL),
(1938206,16,-4048.14,2253.56,158.818,NULL);
