-- DB update 2021_06_27_01 -> 2021_06_27_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_27_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_27_01 2021_06_27_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624746033475877410'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624746033475877410');

-- Clean up duplicate spawns
DELETE FROM `gameobject` WHERE `guid` IN (
13545, 13546, 13548, 13550, 13552, 13555, 13557, 13558, 13559, 13562, 13564, 13567, 13570, 13571, 13573, 13574,
13575, 13577, 13578, 13579, 13580, 13581, 13584, 13585, 13586, 13589, 13590, 13595, 13599, 13600, 13605, 13619,
13675, 13684, 13687, 13689, 13696, 13702, 13821, 14008, 14187, 14200, 14201, 14302, 14446, 14450, 14452, 14455,
14456, 14459, 14462, 14463, 14464, 14486, 14487, 30894, 31974, 31975, 31976, 32017, 33549, 63421, 63422, 63423,
63424, 63427, 63431, 65122, 65123);

-- Update Barrens Silverleaf
UPDATE `gameobject` SET `id` = 3725, `spawntimesecs` = 900 WHERE `guid` IN (
462, 473, 482, 484, 488, 489, 507, 520, 532, 533, 542, 562, 585, 589, 593, 604,
605, 606, 620, 630, 632, 650, 659, 671, 681, 689, 696, 700, 705, 723, 729, 730,
731, 775, 782, 785, 795, 812, 824, 847, 852, 878, 879, 892, 904, 905, 906, 907,
908, 909, 910, 913, 918, 927, 928, 935, 945, 946, 947, 950, 983, 994, 998, 1002,
1004, 1011, 1013, 1026, 1034, 1039, 1040, 1051, 1078, 1082, 1085, 1086, 1087, 1089, 1100, 1106,
1107, 1130, 1131, 1138, 1146, 1166, 1168, 1169, 1170, 1193, 1218, 1234, 1255, 1258, 13572, 13576,
13582, 13583, 13587, 13588, 13591, 32011, 86356);

-- Update Barrens Peacebloom
UPDATE `gameobject` SET `id` = 3724, `spawntimesecs` = 900 WHERE `guid` IN (
1346, 1355, 1372, 1373, 1375, 1376, 1395, 1398, 1404, 1410, 1411, 1412, 1413, 1414, 1419, 1429,
1434, 1440, 1459, 1464, 1470, 1471, 1475, 1480, 1481, 1485, 1490, 1505, 1506, 1509, 1511, 1512,
1513, 1514, 1522, 1524, 1528, 1536, 1538, 1539, 1544, 1550, 1559, 1560, 1563, 1567, 1573, 1575,
1584, 1592, 1594, 1606, 1622, 1630, 1633, 1634, 1642, 1644, 1649, 1661, 1662, 1663, 1665, 1667,
1668, 1677, 1693, 1702, 1704, 1714, 1730, 1737, 1742, 13547, 13549, 13551, 13553, 13554, 13556, 13560,
13561, 13563, 13565, 13566, 13568, 86351, 86352, 86353, 86354, 86355, 87484);

-- Update Barrens Earthroot
UPDATE `gameobject` SET `id` = 3726, `spawntimesecs` = 900 WHERE `guid` IN (
1755, 1756, 1757, 1759, 1761, 1764, 1765, 1767, 1776, 1779, 1781, 1782, 1783, 1787, 1792, 1793,
1796, 1797, 1798, 1802, 1804, 1807, 1808, 1809, 1813, 1814, 1815, 1816, 1823, 1830, 1833, 1837,
1842, 1843, 1844, 1845, 1846, 1852, 1853, 1854, 1855, 1856, 1857, 1859, 1861, 1864, 1866, 1868,
1896, 1897, 1898, 1899, 1900, 1901, 1902, 1903, 1905, 1907, 1908, 1911, 1913, 1917, 1918, 1919,
1920, 1921, 1925, 1926, 1928, 1930, 1931, 1932, 1934, 1935, 1936, 1942, 1943, 1944, 1945, 1946,
1950, 1957, 1958, 1959, 1960, 1961, 1963, 1965, 1967, 1968, 1972, 1975, 1977, 1978, 1979, 1980,
1983, 1984, 1986, 1987, 1988, 1989, 1990, 1991, 1992, 1995, 1997, 1998, 1999, 2003, 2004, 2005,
2006, 2007, 2009, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2028, 2029, 2030, 2040, 2041,
2050, 2060, 2061, 2062, 2063, 2064, 2066, 2067, 2068, 2069, 2071, 2072, 2078, 2079, 2080, 13597,
13598, 13601, 13602, 13620, 13622, 13624, 13628, 13629, 13639, 13673, 13674, 32519, 63425, 63426, 63428, 86357,
86358, 86359, 86360, 86361, 86362, 87283);

-- Update Barrens Mageroyal
UPDATE `gameobject` SET `id` = 3727, `spawntimesecs` = 900 WHERE `guid` IN (
2082, 2084, 2085, 2088, 2089, 2091, 2092, 2094, 2095, 2098, 2099, 2103, 2104, 2106, 2107, 2108,
2109, 2122, 2123, 2125, 2128, 2130, 2135, 2136, 2138, 2139, 2141, 2142, 2143, 2144, 2145, 2146,
2147, 2151, 2152, 2153, 2154, 2156, 2159, 2160, 2161, 2162, 2165, 2166, 2168, 2170, 2171, 2174,
2176, 2177, 2178, 2179, 2180, 2181, 2182, 2183, 2186, 2188, 2191, 2192, 2193, 2194, 2196, 2198,
2199, 2200, 2201, 2202, 2203, 2204, 2205, 2206, 2207, 2209, 2211, 2212, 2213, 2219, 2220, 2222,
2223, 2225, 2226, 2227, 2228, 2229, 2230, 2231, 2232, 2233, 2234, 2245, 2246, 2247, 2253, 2257,
2258, 2259, 2261, 2262, 2263, 2264, 2267, 2268, 2270, 2271, 2272, 2274, 2277, 2280, 2281, 2285,
2287, 2289, 2290, 2291, 2292, 2293, 2296, 2297, 2304, 2308, 2310, 2311, 2312, 2313, 2314, 2315,
2317, 2318, 2328, 2333, 2334, 2337, 2339, 2340, 2341, 2343, 2344, 2345, 2347, 2348, 2349, 2350,
2351, 2355, 2358, 2361, 2362, 2363, 2364, 2369, 2375, 2377, 2378, 2382, 2383, 2384, 2385, 2386,
2387, 2388, 2389, 2390, 2391, 2392, 2393, 2395, 2397, 2400, 2401, 2405, 2406, 2419, 2423, 2424,
2426, 2427, 2429, 2430, 2433, 2434, 2436, 2445, 2446, 2447, 2450, 2455, 2461, 2462, 2463, 2464,
2470, 2471, 2472, 2475, 2482, 2483, 2486, 2487, 2488, 2489, 2492, 2494, 2495, 2496, 2501, 2503,
2504, 2506, 2507, 2508, 2509, 2512, 2513, 2515, 2520, 2522, 2523, 2528, 2534, 2535, 2536, 2537,
2538, 2539, 13685, 13686, 13688, 13690, 13691, 13692, 13693, 13694, 13695, 13697, 13698, 13699, 13700, 13701,
13820, 13969, 14184, 35024, 65121, 86363, 86364, 86365, 87284, 87285, 87286, 87287, 87288, 87289);

-- Update Barrens Briarthorn
UPDATE `gameobject` SET `id` = 3729, `spawntimesecs` = 900 WHERE `guid` IN (
2542, 2549, 2551, 2554, 2559, 2562, 2564, 2565, 2567, 2569, 2574, 2590, 2591, 2599, 2610, 2611,
2615, 2620, 2621, 2625, 2634, 2643, 2644, 2646, 2648, 2652, 2659, 2667, 2668, 2677, 2678, 2691,
2695, 2699, 2716, 2717, 2719, 2722, 2723, 2724, 2725, 2728, 2729, 2732, 2737, 2743, 2747, 2751,
2754, 2756, 2758, 2760, 2762, 2763, 2766, 2767, 2770, 2772, 2781, 2783, 2789, 2807, 2814, 2817,
2822, 2824, 2825, 2826, 2835, 2836, 2857, 2859, 2865, 2880, 2881, 2883, 2884, 2885, 2886, 2887,
2893, 2898, 2902, 2905, 2906, 2907, 14199, 14202, 14203, 14204, 14236, 14297, 14298, 14301, 14451, 14453,
14454, 14457, 14458, 14460, 14467, 14468, 30205, 30889, 31978, 32014, 32015, 33557, 63429, 63430, 86366, 86367,
86368, 86369, 86370, 86371, 86372, 86373, 86374, 86375, 86376, 86377, 87290, 87291, 87292);

-- Update Barrens Bruiseweed
UPDATE `gameobject` SET `id` = 3730, `spawntimesecs` = 1800 WHERE `guid` IN (
2928, 2930, 2950, 2951, 2952, 2954, 2955, 2971, 3006, 3015, 3028, 3032, 3047, 3049, 3056, 3058,
3098, 3099, 3100, 3101, 3102, 3103, 3104, 3105, 3106, 3107, 3134, 3135, 3143, 3157, 3201, 3226,
3245, 3260, 3261, 3262, 3270, 3271, 3272, 3274, 3275, 3276, 3303, 3328, 3329, 3342, 3350, 3351,
3352, 3361, 3368, 3375, 3376, 3406, 3409, 3410, 3451, 3452, 3453, 3455, 3458, 3464, 3465, 3469,
3478, 3494, 3495, 3496, 3497, 3498, 3505, 3524, 3538, 3549, 3558, 3574, 3575, 3579, 3591, 3595,
3621, 3667, 3692, 3693, 3694, 3703, 3708, 3734, 3735, 3736, 3739, 3793, 3812, 3813, 3827, 3852,
3854, 3862, 14470, 14471, 14472, 14473, 14474, 14475, 14476, 14477, 14478, 14479, 14480, 14481, 14482, 14485,
14488, 14489, 33553, 86378, 86379, 86380, 86381, 87293, 87294, 87295, 87296);

-- Remove Root Sample from the normal herbs
DELETE FROM `gameobject_loot_template` WHERE `Entry` IN (1414,1415,1416,1417,1419) AND `Item` = 5056;
DELETE FROM `gameobject_questitem` WHERE `GameObjectEntry` IN (1617,1618,1619,1620,1622);

-- Adjust min/max count of the Barrens herbs to match the normal herbs
UPDATE `gameobject_loot_template` SET `MinCount` = 1, `MaxCount` = 3 WHERE `Entry` IN (2511,2512,2513,2514,2515,2516) AND `Item` IN (765,785,2447,2449,2450,2453);

DELETE FROM `gameobject_loot_template` WHERE `Entry` IN (2514,2515) AND `Item` = 2452;
DELETE FROM `gameobject_loot_template` WHERE `Entry` = 2515 AND `Item` = 5056;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(2514,2452,0,20,0,1,0,1,2,NULL),  -- Add Swiftthistle loot to Barrens Mageroyal
(2515,2452,0,40,0,1,0,1,2,NULL),  -- Add Swiftthistle loot to Barrens Briarthorn
(2515,5056,0,100,1,1,0,1,1,NULL); -- Add Swiftthistle loot to Barrens Briarthorn

-- Add missing herbs to the appropriate pools
DELETE FROM `pool_gameobject` WHERE `guid` IN (
2094, 13547, 13549, 13551, 13553, 13554, 13556, 13560, 13561, 13563, 13565, 13566, 13568, 13572, 13576, 13582,
13583, 13587, 13588, 13591, 13597, 13598, 13601, 13602, 13620, 13622, 13624, 13628, 13629, 13639, 13673, 13674,
13685, 13686, 13688, 13690, 13691, 13692, 13693, 13694, 13695, 13697, 13698, 13699, 13700, 13701, 13820, 13969,
14184, 14199, 14202, 14203, 14204, 14236, 14297, 14298, 14301, 14451, 14453, 14454, 14457, 14458, 14460, 14467,
14468, 14470, 14471, 14472, 14473, 14474, 14475, 14476, 14477, 14478, 14479, 14480, 14481, 14482, 14485, 14488,
14489, 30205, 30889, 31978, 32011, 32014, 32015, 32519, 33553, 33557, 35024, 63425, 63426, 63428, 63429, 63430,
65121, 86351, 86352, 86353, 86354, 86355, 86356, 86357, 86358, 86359, 86360, 86361, 86362, 86363, 86364, 86365,
86366, 86367, 86368, 86369, 86370, 86371, 86372, 86373, 86374, 86375, 86376, 86377, 86378, 86379, 86380, 86381,
87283, 87284, 87285, 87286, 87287, 87288, 87289, 87290, 87291, 87292, 87293, 87294, 87295, 87296, 87484);
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(13624,800,0,'Earthroot,Zone 17,Area 359'),
(13639,800,0,'Earthroot,Zone 17,Area 1702'),
(13700,800,0,'Mageroyal,Zone 17,Area 1702'),
(14297,800,0,'Briarthorn,Zone 17,Area 381'),
(14451,800,0,'Briarthorn,Zone 17,Area 359'),
(14474,800,0,'Bruiseweed,Zone 17,Area 381'),
(14480,800,0,'Bruiseweed,Zone 17,Area 359'),
(14485,800,0,'Bruiseweed,Zone 17,Area 384'),
(63425,800,0,'Earthroot,Zone 17,Area 1702'),
(63426,800,0,'Earthroot,Zone 17,Area 1702'),
(63429,800,0,'Briarthorn,Zone 17,Area 1702'),
(86357,800,0,'Earthroot,Zone 17,Area 359'),
(86360,800,0,'Earthroot,Zone 17,Area 359'),
(86374,800,0,'Briarthorn,Zone 17,Area 1702'),
(86379,800,0,'Bruiseweed,Zone 17,Area 359'),
(87293,800,0,'Bruiseweed,Zone 17,Area 359'),
(87294,800,0,'Bruiseweed,Zone 17,Area 359'),
(87296,800,0,'Bruiseweed,Zone 17,Area 384'),

(13554,801,0,'Peacebloom,Zone 17,Area 17'),
(13556,801,0,'Peacebloom,Zone 17,Area 17'),
(13560,801,0,'Peacebloom,Zone 17,Area 17'),
(13561,801,0,'Peacebloom,Zone 17,Area 17'),
(13565,801,0,'Peacebloom,Zone 17,Area 17'),
(13566,801,0,'Peacebloom,Zone 17,Area 17'),
(13568,801,0,'Peacebloom,Zone 17,Area 17'),
(13572,801,0,'Silverleaf,Zone 17,Area 17'),
(13576,801,0,'Silverleaf,Zone 17,Area 17'),
(13587,801,0,'Silverleaf,Zone 17,Area 17'),
(13588,801,0,'Silverleaf,Zone 17,Area 17'),
(13591,801,0,'Silverleaf,Zone 17,Area 17'),
(13597,801,0,'Earthroot,Zone 17,Area 17'),
(13598,801,0,'Earthroot,Zone 17,Area 17'),
(13620,801,0,'Earthroot,Zone 17,Area 17'),
(13622,801,0,'Earthroot,Zone 17,Area 17'),
(13628,801,0,'Earthroot,Zone 17,Area 17'),
(13629,801,0,'Earthroot,Zone 17,Area 17'),
(13673,801,0,'Earthroot,Zone 17,Area 17'),
(13674,801,0,'Earthroot,Zone 17,Area 17'),
(13685,801,0,'Mageroyal,Zone 17,Area 17'),
(13686,801,0,'Mageroyal,Zone 17,Area 17'),
(13688,801,0,'Mageroyal,Zone 17,Area 17'),
(13690,801,0,'Mageroyal,Zone 17,Area 17'),
(13692,801,0,'Mageroyal,Zone 17,Area 17'),
(13697,801,0,'Mageroyal,Zone 17,Area 17'),
(13698,801,0,'Mageroyal,Zone 17,Area 17'),
(14184,801,0,'Mageroyal,Zone 17,Area 17'),
(14203,801,0,'Briarthorn,Zone 17,Area 17'),
(14298,801,0,'Briarthorn,Zone 17,Area 17'),
(14454,801,0,'Briarthorn,Zone 17,Area 17'),
(14468,801,0,'Briarthorn,Zone 17,Area 17'),
(14472,801,0,'Bruiseweed,Zone 17,Area 17'),
(14476,801,0,'Bruiseweed,Zone 17,Area 17'),
(14482,801,0,'Bruiseweed,Zone 17,Area 17'),
(30205,801,0,'Briarthorn,Zone 17,Area 17'),
(31978,801,0,'Briarthorn,Zone 17,Area 17'),
(32519,801,0,'Earthroot,Zone 17,Area 17'),
(33553,801,0,'Bruiseweed,Zone 17,Area 17'),
(35024,801,0,'Mageroyal,Zone 17,Area 17'),
(63428,801,0,'Earthroot,Zone 17,Area 17'),
(63430,801,0,'Briarthorn,Zone 17,Area 17'),
(86351,801,0,'Peacebloom,Zone 17,Area 17'),
(86353,801,0,'Peacebloom,Zone 17,Area 17'),
(86354,801,0,'Peacebloom,Zone 17,Area 17'),
(86355,801,0,'Peacebloom,Zone 17,Area 17'),
(86356,801,0,'Silverleaf,Zone 17,Area 17'),
(86358,801,0,'Earthroot,Zone 17,Area 17'),
(86359,801,0,'Earthroot,Zone 17,Area 17'),
(86361,801,0,'Earthroot,Zone 17,Area 17'),
(86362,801,0,'Earthroot,Zone 17,Area 17'),
(86365,801,0,'Mageroyal,Zone 17,Area 17'),
(86368,801,0,'Briarthorn,Zone 17,Area 17'),
(86369,801,0,'Briarthorn,Zone 17,Area 17'),
(86372,801,0,'Briarthorn,Zone 17,Area 17'),
(86375,801,0,'Briarthorn,Zone 17,Area 17'),
(86376,801,0,'Briarthorn,Zone 17,Area 17'),
(86377,801,0,'Briarthorn,Zone 17,Area 17'),
(86380,801,0,'Bruiseweed,Zone 17,Area 17'),
(86381,801,0,'Bruiseweed,Zone 17,Area 17'),
(87287,801,0,'Mageroyal,Zone 17,Area 17'),
(87289,801,0,'Mageroyal,Zone 17,Area 17'),
(87292,801,0,'Briarthorn,Zone 17,Area 17'),
(87484,801,0,'Peacebloom,Zone 17,Area 17'),

(13582,802,0,'Silverleaf,Zone 17,Area 383'),
(13601,802,0,'Earthroot,Zone 17,Area 383'),
(13602,802,0,'Earthroot,Zone 17,Area 383'),
(14301,802,0,'Briarthorn,Zone 17,Area 383'),
(14453,802,0,'Briarthorn,Zone 17,Area 383'),
(14457,802,0,'Briarthorn,Zone 17,Area 383'),
(14481,802,0,'Bruiseweed,Zone 17,Area 383'),

(14475,803,0,'Bruiseweed,Zone 17,Area 385'),
(33557,803,0,'Briarthorn,Zone 17,Area 385'),

(2094,805,0,'Mageroyal,Zone 17,Area 387'),
(13583,805,0,'Silverleaf,Zone 17,Area 387'),
(32011,805,0,'Silverleaf,Zone 17,Area 387'),

(13691,806,0,'Mageroyal,Zone 17,Area 388'),
(87290,806,0,'Briarthorn,Zone 17,Area 388'),

(13693,807,0,'Mageroyal,Zone 17,Area 390'),
(13820,807,0,'Mageroyal,Zone 17,Area 390'),
(14204,807,0,'Briarthorn,Zone 17,Area 390'),
(14471,807,0,'Bruiseweed,Zone 17,Area 390'),
(14477,807,0,'Bruiseweed,Zone 17,Area 390'),
(14488,807,0,'Bruiseweed,Zone 17,Area 390'),
(14489,807,0,'Bruiseweed,Zone 17,Area 390'),
(32015,807,0,'Briarthorn,Zone 17,Area 390'),
(86378,807,0,'Bruiseweed,Zone 17,Area 390'),

(13553,808,0,'Peacebloom,Zone 17,Area 391'),
(14236,808,0,'Briarthorn,Zone 17,Area 391'),
(30889,808,0,'Briarthorn,Zone 17,Area 391'),

(13549,809,0,'Peacebloom,Zone 17,Area 1156'),
(13563,809,0,'Peacebloom,Zone 17,Area 1156'),
(13969,809,0,'Mageroyal,Zone 17,Area 1156'),
(14202,809,0,'Briarthorn,Zone 17,Area 1156'),
(14458,809,0,'Briarthorn,Zone 17,Area 1156'),
(32014,809,0,'Briarthorn,Zone 17,Area 1156'),
(65121,809,0,'Mageroyal,Zone 17,Area 1156'),
(86352,809,0,'Peacebloom,Zone 17,Area 1156'),
(86363,809,0,'Mageroyal,Zone 17,Area 1156'),
(86364,809,0,'Mageroyal,Zone 17,Area 1156'),
(86367,809,0,'Briarthorn,Zone 17,Area 1156'),
(86370,809,0,'Briarthorn,Zone 17,Area 1156'),
(86371,809,0,'Briarthorn,Zone 17,Area 1156'),
(86373,809,0,'Briarthorn,Zone 17,Area 1156'),
(87284,809,0,'Mageroyal,Zone 17,Area 1156'),
(87286,809,0,'Mageroyal,Zone 17,Area 1156'),

(14470,810,0,'Bruiseweed,Zone 17,Area 1698'),
(86366,810,0,'Briarthorn,Zone 17,Area 1698'),

(14199,811,0,'Briarthorn,Zone 17,Area 1699'),

(13547,812,0,'Peacebloom,Zone 17,Area 1700'),
(13551,812,0,'Peacebloom,Zone 17,Area 1700'),
(13694,812,0,'Mageroyal,Zone 17,Area 1700'),
(13699,812,0,'Mageroyal,Zone 17,Area 1700'),
(13701,812,0,'Mageroyal,Zone 17,Area 1700'),
(14479,812,0,'Bruiseweed,Zone 17,Area 1700'),
(87288,812,0,'Mageroyal,Zone 17,Area 1700'),

(13695,813,0,'Mageroyal,Zone 17,Area 1701'),
(14460,813,0,'Briarthorn,Zone 17,Area 1701'),
(14467,813,0,'Briarthorn,Zone 17,Area 1701'),
(14473,813,0,'Bruiseweed,Zone 17,Area 1701'),
(14478,813,0,'Bruiseweed,Zone 17,Area 1701'),
(87283,813,0,'Earthroot,Zone 17,Area 1701'),
(87285,813,0,'Mageroyal,Zone 17,Area 1701'),
(87291,813,0,'Briarthorn,Zone 17,Area 1701'),
(87295,813,0,'Bruiseweed,Zone 17,Area 1701');

-- Update pool template comments
UPDATE `pool_template` SET `description` = 'Master Zone 17 Leftover Areas (18 out of 106 nodes)' WHERE `entry` = 800;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 17 (60 out of 369 nodes)' WHERE `entry` = 801;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 383 (8 out of 48 nodes)' WHERE `entry` = 802;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 385 (4 out of 21 nodes)' WHERE `entry` = 803;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 386 (3 out of 15 nodes)' WHERE `entry` = 804;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 387 (10 out of 57 nodes)' WHERE `entry` = 805;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 388 (4 out of 23 nodes)' WHERE `entry` = 806;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 390 (8 out of 48 nodes)' WHERE `entry` = 807;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 391 (17 out of 89 nodes)' WHERE `entry` = 808;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 1156 (18 out of 108 nodes)' WHERE `entry` = 809;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 1698 (4 out of 22 nodes)' WHERE `entry` = 810;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 1699 (4 out of 22 nodes)' WHERE `entry` = 811;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 1700 (6 out of 35 nodes)' WHERE `entry` = 812;
UPDATE `pool_template` SET `description` = 'Master Zone 17 Area 1701 (8 out of 48 nodes)' WHERE `entry` = 813;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
