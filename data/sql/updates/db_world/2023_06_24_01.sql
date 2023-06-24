UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (67506,67515,67514,67508,67507);

DELETE FROM `waypoint_data` WHERE `id` IN (675110,675090);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
-- Voidshrieker
(675110,1,4103.67,2008.72,230.75,NULL,0,0,0,0,100,0),
(675110,2,4107.17,2003.2,228.967,NULL,0,0,0,0,100,0),
(675110,3,4111.29,1996.69,227.076,NULL,0,0,0,0,100,0),
(675110,4,4115.29,1990.39,225.296,NULL,0,0,0,0,100,0),
(675110,5,4119.22,1984.19,223.518,NULL,0,0,0,0,100,0),
(675110,6,4122.63,1978.81,222.39,NULL,0,0,0,0,100,0),
(675110,7,4126.82,1972.2,221.448,NULL,0,0,0,0,100,0),
(675110,8,4130.09,1967.05,221.342,NULL,0,0,0,0,100,0),
(675110,9,4136.12,1970.12,219.834,NULL,0,0,0,0,100,0),
(675110,10,4143.72,1973.98,217.534,NULL,0,0,0,0,100,0),
(675110,11,4150.48,1977.41,215.106,NULL,0,0,0,0,100,0),
(675110,12,4156.51,1980.48,212.826,NULL,0,0,0,0,100,0),
(675110,13,4162.5,1983.52,210.271,NULL,0,0,0,0,100,0),
(675110,14,4167.16,1989.05,207.42,NULL,0,0,0,0,100,0),
(675110,15,4172.13,1994.93,204.106,NULL,0,0,0,0,100,0),
(675110,16,4177.09,2000.82,199.926,NULL,0,0,0,0,100,0),
(675110,17,4182.88,2007.67,194.426,NULL,0,0,0,0,100,0),
(675110,18,4183.37,2013.72,190.923,NULL,0,0,0,0,100,0),
(675110,19,4183.95,2020.93,186.706,NULL,0,0,0,0,100,0),
(675110,20,4184.73,2030.58,181.918,NULL,0,0,0,0,100,0),
(675110,21,4185.45,2039.4,178.376,NULL,0,0,0,0,100,0),
(675110,22,4182.86,2045.52,175.678,NULL,0,0,0,0,100,0),
(675110,23,4180.18,2051.86,172.802,NULL,0,0,0,0,100,0),
(675110,24,4177.68,2057.78,169.891,NULL,0,0,0,0,100,0),
(675110,25,4175.09,2063.9,166.786,NULL,0,0,0,0,100,0),
(675110,26,4177.68,2057.78,169.891,NULL,0,0,0,0,100,0),
(675110,27,4180.18,2051.86,172.802,NULL,0,0,0,0,100,0),
(675110,28,4182.86,2045.52,175.678,NULL,0,0,0,0,100,0),
(675110,29,4185.45,2039.4,178.376,NULL,0,0,0,0,100,0),
(675110,30,4184.73,2030.58,181.918,NULL,0,0,0,0,100,0),
(675110,31,4183.95,2020.93,186.706,NULL,0,0,0,0,100,0),
(675110,32,4183.37,2013.72,190.923,NULL,0,0,0,0,100,0),
(675110,33,4182.88,2007.67,194.426,NULL,0,0,0,0,100,0),
(675110,34,4177.09,2000.82,199.926,NULL,0,0,0,0,100,0),
(675110,35,4172.13,1994.93,204.106,NULL,0,0,0,0,100,0),
(675110,36,4167.16,1989.05,207.42,NULL,0,0,0,0,100,0),
(675110,37,4162.5,1983.52,210.271,NULL,0,0,0,0,100,0),
(675110,38,4156.51,1980.48,212.826,NULL,0,0,0,0,100,0),
(675110,39,4150.48,1977.41,215.106,NULL,0,0,0,0,100,0),
(675110,40,4143.72,1973.98,217.534,NULL,0,0,0,0,100,0),
(675110,41,4136.12,1970.12,219.834,NULL,0,0,0,0,100,0),
(675110,42,4130.09,1967.05,221.342,NULL,0,0,0,0,100,0),
(675110,43,4126.82,1972.2,221.448,NULL,0,0,0,0,100,0),
(675110,44,4122.63,1978.81,222.39,NULL,0,0,0,0,100,0),
(675110,45,4119.22,1984.19,223.518,NULL,0,0,0,0,100,0),
(675110,46,4115.29,1990.39,225.296,NULL,0,0,0,0,100,0),
(675110,47,4111.29,1996.69,227.076,NULL,0,0,0,0,100,0),
(675110,48,4107.17,2003.2,228.967,NULL,0,0,0,0,100,0),
(675110,49,4103.67,2008.72,230.75,NULL,0,0,0,0,100,0),
(675110,50,4099.61,2015.13,232.975,NULL,0,0,0,0,100,0),
(675110,51,4094.36,2023.41,235.578,NULL,0,0,0,0,100,0),
(675110,52,4089.74,2030.7,237.681,NULL,0,0,0,0,100,0),
(675110,53,4083.55,2035.85,239.944,NULL,0,0,0,0,100,0),
(675110,54,4076.64,2041.6,242.662,NULL,0,0,0,0,100,0),
(675110,55,4069.2,2047.79,245.561,NULL,0,0,0,0,100,0),
(675110,56,4062.83,2053.09,248.207,NULL,0,0,0,0,100,0),
(675110,57,4057.54,2057.5,250.428,NULL,0,0,0,0,100,0),
(675110,58,4051.62,2062.43,252.025,NULL,0,0,0,0,100,0),
(675110,59,4045.42,2067.59,253.381,NULL,0,0,0,0,100,0),
(675110,60,4038.52,2073.33,254.125,NULL,0,0,0,0,100,0),
(675110,61,4032.05,2078.72,254.482,NULL,0,0,0,0,100,0),
(675110,62,4026.06,2083.18,254.32,NULL,0,0,0,0,100,0),
(675110,63,4019.7,2087.91,254.212,NULL,0,0,0,0,100,0),
(675110,64,4012.97,2092.92,254.212,NULL,0,0,0,0,100,0),
(675110,65,4019.7,2087.91,254.212,NULL,0,0,0,0,100,0),
(675110,66,4026.06,2083.18,254.32,NULL,0,0,0,0,100,0),
(675110,67,4032.05,2078.72,254.482,NULL,0,0,0,0,100,0),
(675110,68,4038.52,2073.33,254.125,NULL,0,0,0,0,100,0),
(675110,69,4045.42,2067.59,253.381,NULL,0,0,0,0,100,0),
(675110,70,4051.62,2062.43,252.025,NULL,0,0,0,0,100,0),
(675110,71,4057.54,2057.5,250.428,NULL,0,0,0,0,100,0),
(675110,72,4062.83,2053.09,248.207,NULL,0,0,0,0,100,0),
(675110,73,4069.2,2047.79,245.561,NULL,0,0,0,0,100,0),
(675110,74,4076.64,2041.6,242.662,NULL,0,0,0,0,100,0),
(675110,75,4083.55,2035.85,239.944,NULL,0,0,0,0,100,0),
(675110,76,4089.74,2030.7,237.681,NULL,0,0,0,0,100,0),
(675110,77,4094.36,2023.41,235.578,NULL,0,0,0,0,100,0),
(675110,78,4099.61,2015.13,232.975,NULL,0,0,0,0,100,0),
-- Voidshrieker
(675090,1,3798.83,1750.28,178.753,NULL,0,0,0,0,100,0),
(675090,2,3804.94,1751.2,181.265,NULL,0,0,0,0,100,0),
(675090,3,3811.28,1752.15,184.254,NULL,0,0,0,0,100,0),
(675090,4,3818.2,1753.18,188.211,NULL,0,0,0,0,100,0),
(675090,5,3825.93,1754.34,192.843,NULL,0,0,0,0,100,0),
(675090,6,3832.51,1755.33,196.926,NULL,0,0,0,0,100,0),
(675090,7,3838.74,1756.26,200.712,NULL,0,0,0,0,100,0),
(675090,8,3846.13,1757.37,204.656,NULL,0,0,0,0,100,0),
(675090,9,3853.17,1758.43,207.841,NULL,0,0,0,0,100,0),
(675090,10,3859.19,1759.33,210.526,NULL,0,0,0,0,100,0),
(675090,11,3863.87,1760.03,212.379,NULL,0,0,0,0,100,0),
(675090,12,3868.7,1764.09,214.593,NULL,0,0,0,0,100,0),
(675090,13,3874.32,1768.82,216.914,NULL,0,0,0,0,100,0),
(675090,14,3880.03,1773.63,219.407,NULL,0,0,0,0,100,0),
(675090,15,3887.18,1779.64,222.092,NULL,0,0,0,0,100,0),
(675090,16,3893.78,1785.19,224.119,NULL,0,0,0,0,100,0),
(675090,17,3896.85,1790.82,225.258,NULL,0,0,0,0,100,0),
(675090,18,3900.38,1797.27,226.041,NULL,0,0,0,0,100,0),
(675090,19,3903.79,1803.53,226.43,NULL,0,0,0,0,100,0),
(675090,20,3907.35,1810.06,227.429,NULL,0,0,0,0,100,0),
(675090,21,3903.69,1816.96,228.67,NULL,0,0,0,0,100,0),
(675090,22,3900.41,1823.15,231.022,NULL,0,0,0,0,100,0),
(675090,23,3896.8,1829.96,232.792,NULL,0,0,0,0,100,0),
(675090,24,3893.69,1835.83,234.792,NULL,0,0,0,0,100,0),
(675090,25,3890.19,1842.43,237.281,NULL,0,0,0,0,100,0),
(675090,26,3887.01,1848.43,239.38,NULL,0,0,0,0,100,0),
(675090,27,3887.52,1853.54,241.396,NULL,0,0,0,0,100,0),
(675090,28,3888.05,1858.88,243.654,NULL,0,0,0,0,100,0),
(675090,29,3891.68,1864.32,246.417,NULL,0,0,0,0,100,0),
(675090,30,3895.18,1869.56,248.942,NULL,0,0,0,0,100,0),
(675090,31,3898.36,1874.32,250.945,NULL,0,0,0,0,100,0),
(675090,32,3901.32,1878.75,252.111,NULL,0,0,0,0,100,0),
(675090,33,3897.76,1883.95,252.623,NULL,0,0,0,0,100,0),
(675090,34,3893.81,1889.73,253.105,NULL,0,0,0,0,100,0),
(675090,35,3889.99,1895.32,253.467,NULL,0,0,0,0,100,0),
(675090,36,3886.83,1899.94,253.505,NULL,0,0,0,0,100,0),
(675090,37,3884.05,1904,253.702,NULL,0,0,0,0,100,0),
(675090,38,3882.95,1911.65,254.013,NULL,0,0,0,0,100,0),
(675090,39,3882.04,1917.95,254.207,NULL,0,0,0,0,100,0),
(675090,40,3882.95,1911.65,254.013,NULL,0,0,0,0,100,0),
(675090,41,3884.05,1904,253.702,NULL,0,0,0,0,100,0),
(675090,42,3886.83,1899.94,253.505,NULL,0,0,0,0,100,0),
(675090,43,3889.99,1895.32,253.467,NULL,0,0,0,0,100,0),
(675090,44,3893.81,1889.73,253.105,NULL,0,0,0,0,100,0),
(675090,45,3897.76,1883.95,252.623,NULL,0,0,0,0,100,0),
(675090,46,3901.32,1878.75,252.111,NULL,0,0,0,0,100,0),
(675090,47,3898.36,1874.32,250.945,NULL,0,0,0,0,100,0),
(675090,48,3895.18,1869.56,248.942,NULL,0,0,0,0,100,0),
(675090,49,3891.68,1864.32,246.417,NULL,0,0,0,0,100,0),
(675090,50,3888.05,1858.88,243.654,NULL,0,0,0,0,100,0),
(675090,51,3887.52,1853.54,241.396,NULL,0,0,0,0,100,0),
(675090,52,3887.01,1848.43,239.38,NULL,0,0,0,0,100,0),
(675090,53,3890.19,1842.43,237.281,NULL,0,0,0,0,100,0),
(675090,54,3893.69,1835.83,234.792,NULL,0,0,0,0,100,0),
(675090,55,3896.8,1829.96,232.792,NULL,0,0,0,0,100,0),
(675090,56,3900.41,1823.15,231.022,NULL,0,0,0,0,100,0),
(675090,57,3903.69,1816.96,228.67,NULL,0,0,0,0,100,0),
(675090,58,3907.35,1810.06,227.429,NULL,0,0,0,0,100,0),
(675090,59,3903.79,1803.53,226.43,NULL,0,0,0,0,100,0),
(675090,60,3900.38,1797.27,226.041,NULL,0,0,0,0,100,0),
(675090,61,3896.85,1790.82,225.258,NULL,0,0,0,0,100,0),
(675090,62,3893.78,1785.19,224.119,NULL,0,0,0,0,100,0),
(675090,63,3887.18,1779.64,222.092,NULL,0,0,0,0,100,0),
(675090,64,3880.03,1773.63,219.407,NULL,0,0,0,0,100,0),
(675090,65,3874.32,1768.82,216.914,NULL,0,0,0,0,100,0),
(675090,66,3868.7,1764.09,214.593,NULL,0,0,0,0,100,0),
(675090,67,3863.87,1760.03,212.379,NULL,0,0,0,0,100,0),
(675090,68,3859.19,1759.33,210.526,NULL,0,0,0,0,100,0),
(675090,69,3853.17,1758.43,207.841,NULL,0,0,0,0,100,0),
(675090,70,3846.13,1757.37,204.656,NULL,0,0,0,0,100,0),
(675090,71,3838.74,1756.26,200.712,NULL,0,0,0,0,100,0),
(675090,72,3832.51,1755.33,196.926,NULL,0,0,0,0,100,0),
(675090,73,3825.93,1754.34,192.843,NULL,0,0,0,0,100,0),
(675090,74,3818.2,1753.18,188.211,NULL,0,0,0,0,100,0),
(675090,75,3811.28,1752.15,184.254,NULL,0,0,0,0,100,0),
(675090,76,3804.94,1751.2,181.265,NULL,0,0,0,0,100,0);
