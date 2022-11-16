UPDATE `creature` SET `position_x` = 7320.23, `position_y` = -5811.81, `position_z` = 11.465, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 82328;
UPDATE `creature` SET `position_x` = 7369.16, `position_y` = -5936.15, `position_z` = 15.2804, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 82367;
UPDATE `creature` SET `position_x` = 7315.08, `position_y` = -5868.18, `position_z` = 36.547, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 82486;

DELETE FROM `creature_addon` WHERE `guid` IN (82328,82367,82486);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(82328,823280,0,0,1,0,0,NULL),
(82367,823670,0,0,1,0,0,NULL),
(82486,824860,0,0,1,0,0,NULL);

DELETE FROM `waypoint_data` WHERE `id` IN (823280,823670,824860);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
-- Phantasmal Seeker
(823280,1,7320.23,-5811.81,11.465,NULL,0,0,0,0,100,0),
(823280,2,7318.07,-5817.85,12.3395,NULL,0,0,0,0,100,0),
(823280,3,7315.71,-5824.44,13.7387,NULL,0,0,0,0,100,0),
(823280,4,7314.61,-5827.51,13.6061,NULL,0,0,0,0,100,0),
(823280,5,7313.35,-5829.88,15.0217,NULL,0,0,0,0,100,0),
(823280,6,7311.99,-5832.47,15.9156,NULL,0,0,0,0,100,0),
(823280,7,7309.59,-5837.01,15.8737,NULL,0,0,0,0,100,0),
(823280,8,7305.79,-5844.23,15.8722,NULL,0,0,0,0,100,0),
(823280,9,7301.98,-5851.46,15.8722,NULL,0,0,0,0,100,0),
(823280,10,7299.15,-5856.82,15.8735,NULL,0,0,0,0,100,0),
(823280,11,7295.83,-5863.11,15.8803,NULL,0,0,0,0,100,0),
(823280,12,7292.89,-5868.68,15.8803,NULL,0,0,0,0,100,0),
(823280,13,7291.2,-5871.89,15.8828,NULL,0,0,0,0,100,0),
(823280,14,7289.84,-5874.47,14.9537,NULL,0,0,0,0,100,0),
(823280,15,7288.39,-5877.22,13.4363,NULL,0,0,0,0,100,0),
(823280,16,7282.97,-5878.11,13.5584,NULL,0,0,0,0,100,0),
(823280,17,7278.15,-5878.91,14.6337,NULL,0,0,0,0,100,0),
(823280,18,7273.42,-5879.69,14.9792,NULL,0,0,0,0,100,0),
(823280,19,7267.9,-5880.6,14.3515,NULL,0,0,0,0,100,0),
(823280,20,7263.19,-5881.38,13.887,NULL,0,0,0,0,100,0),
(823280,21,7258.12,-5882.21,15.3869,NULL,0,0,0,0,100,0),
(823280,22,7253.63,-5882.95,16.0354,NULL,0,0,0,0,100,0),
(823280,23,7247.34,-5883.99,15.338,NULL,0,0,0,0,100,0),
(823280,24,7240.08,-5885.19,14.5056,NULL,0,0,0,0,100,0),
(823280,25,7231.22,-5886.65,14.3868,NULL,0,0,0,0,100,0),
(823280,26,7221.43,-5888.27,13.8762,NULL,0,0,0,0,100,0),
(823280,27,7213.6,-5889.56,13.7161,NULL,0,0,0,0,100,0),
(823280,28,7209.17,-5890.29,13.5076,NULL,0,0,0,0,100,0),
(823280,29,7203.07,-5891.29,12.3689,NULL,0,0,0,0,100,0),
(823280,30,7195.82,-5892.49,12.4465,NULL,0,0,0,0,100,0),
(823280,31,7190.78,-5893.32,11.8635,NULL,0,0,0,0,100,0),
(823280,32,7184.91,-5894.29,11.0358,NULL,0,0,0,0,100,0),
(823280,33,7177.31,-5895.54,11.476,NULL,0,0,0,0,100,0),
(823280,34,7170.96,-5896.59,12.1492,NULL,0,0,0,0,100,0),
(823280,35,7167.25,-5894.17,11.8038,NULL,0,0,0,0,100,0),
(823280,36,7162.66,-5891.17,11.0144,NULL,0,0,0,0,100,0),
(823280,37,7157.78,-5887.97,11.1295,NULL,0,0,0,0,100,0),
(823280,38,7153.68,-5885.29,12.5352,NULL,0,0,0,0,100,0),
(823280,39,7150.26,-5883.05,13.3739,NULL,0,0,0,0,100,0),
(823280,40,7146.06,-5880.3,13.4357,NULL,0,0,0,0,100,0),
(823280,41,7140.6,-5876.73,13.4345,NULL,0,0,0,0,100,0),
(823280,42,7136.01,-5873.72,13.435,NULL,0,0,0,0,100,0),
(823280,43,7128.15,-5874.71,13.435,NULL,0,0,0,0,100,0),
(823280,44,7120.29,-5875.71,13.435,NULL,0,0,0,0,100,0),
(823280,45,7110.91,-5876.89,13.435,NULL,0,0,0,0,100,0),
(823280,46,7101.54,-5878.07,13.435,NULL,0,0,0,0,100,0),
(823280,47,7091.47,-5879.34,13.4284,NULL,0,0,0,0,100,0),
(823280,48,7082.2,-5880.51,13.4331,NULL,0,0,0,0,100,0),
(823280,49,7074.09,-5881.53,13.6767,NULL,0,0,0,0,100,0),
(823280,50,7066.69,-5882.46,14.565,NULL,0,0,0,0,100,0),
(823280,51,7065.02,-5875.9,15.1481,NULL,0,0,0,0,100,0),
(823280,52,7063,-5867.99,16.3478,NULL,0,0,0,0,100,0),
(823280,53,7061.09,-5860.48,17.6996,NULL,0,0,0,0,100,0),
(823280,54,7062.55,-5854.72,19.1025,NULL,0,0,0,0,100,0),
(823280,55,7063.89,-5849.41,20.3335,NULL,0,0,0,0,100,0),
(823280,56,7065.32,-5843.75,21.8178,NULL,0,0,0,0,100,0),
(823280,57,7070.21,-5841.03,23.1672,NULL,0,0,0,0,100,0),
(823280,58,7074.5,-5838.65,23.9035,NULL,0,0,0,0,100,0),
(823280,59,7078.34,-5836.52,24.4177,NULL,0,0,0,0,100,0),
(823280,60,7074.5,-5838.65,23.9035,NULL,0,0,0,0,100,0),
(823280,61,7070.21,-5841.03,23.1672,NULL,0,0,0,0,100,0),
(823280,62,7065.32,-5843.75,21.8178,NULL,0,0,0,0,100,0),
(823280,63,7063.89,-5849.41,20.3335,NULL,0,0,0,0,100,0),
(823280,64,7062.55,-5854.72,19.1025,NULL,0,0,0,0,100,0),
(823280,65,7061.09,-5860.48,17.6996,NULL,0,0,0,0,100,0),
(823280,66,7063,-5867.99,16.3478,NULL,0,0,0,0,100,0),
(823280,67,7065.02,-5875.9,15.1481,NULL,0,0,0,0,100,0),
(823280,68,7066.69,-5882.46,14.565,NULL,0,0,0,0,100,0),
(823280,69,7074.09,-5881.53,13.6767,NULL,0,0,0,0,100,0),
(823280,70,7082.2,-5880.51,13.4331,NULL,0,0,0,0,100,0),
(823280,71,7091.47,-5879.34,13.4284,NULL,0,0,0,0,100,0),
(823280,72,7101.54,-5878.07,13.435,NULL,0,0,0,0,100,0),
(823280,73,7110.91,-5876.89,13.435,NULL,0,0,0,0,100,0),
(823280,74,7120.29,-5875.71,13.435,NULL,0,0,0,0,100,0),
(823280,75,7128.15,-5874.71,13.435,NULL,0,0,0,0,100,0),
(823280,76,7136.01,-5873.72,13.435,NULL,0,0,0,0,100,0),
(823280,77,7140.6,-5876.73,13.4345,NULL,0,0,0,0,100,0),
(823280,78,7146.06,-5880.3,13.4357,NULL,0,0,0,0,100,0),
(823280,79,7150.26,-5883.05,13.3739,NULL,0,0,0,0,100,0),
(823280,80,7153.68,-5885.29,12.5352,NULL,0,0,0,0,100,0),
(823280,81,7157.78,-5887.97,11.1295,NULL,0,0,0,0,100,0),
(823280,82,7162.66,-5891.17,11.0144,NULL,0,0,0,0,100,0),
(823280,83,7167.25,-5894.17,11.8038,NULL,0,0,0,0,100,0),
(823280,84,7170.96,-5896.59,12.1492,NULL,0,0,0,0,100,0),
(823280,85,7177.31,-5895.54,11.476,NULL,0,0,0,0,100,0),
(823280,86,7184.91,-5894.29,11.0358,NULL,0,0,0,0,100,0),
(823280,87,7190.78,-5893.32,11.8635,NULL,0,0,0,0,100,0),
(823280,88,7195.82,-5892.49,12.4465,NULL,0,0,0,0,100,0),
(823280,89,7203.07,-5891.29,12.3689,NULL,0,0,0,0,100,0),
(823280,90,7209.17,-5890.29,13.5076,NULL,0,0,0,0,100,0),
(823280,91,7213.6,-5889.56,13.7161,NULL,0,0,0,0,100,0),
(823280,92,7221.43,-5888.27,13.8762,NULL,0,0,0,0,100,0),
(823280,93,7231.22,-5886.65,14.3868,NULL,0,0,0,0,100,0),
(823280,94,7240.08,-5885.19,14.5056,NULL,0,0,0,0,100,0),
(823280,95,7247.34,-5883.99,15.338,NULL,0,0,0,0,100,0),
(823280,96,7253.63,-5882.95,16.0354,NULL,0,0,0,0,100,0),
(823280,97,7258.12,-5882.21,15.3869,NULL,0,0,0,0,100,0),
(823280,98,7263.19,-5881.38,13.887,NULL,0,0,0,0,100,0),
(823280,99,7267.9,-5880.6,14.3515,NULL,0,0,0,0,100,0),
(823280,100,7273.42,-5879.69,14.9792,NULL,0,0,0,0,100,0),
(823280,101,7278.15,-5878.91,14.6337,NULL,0,0,0,0,100,0),
(823280,102,7282.97,-5878.11,13.5584,NULL,0,0,0,0,100,0),
(823280,103,7288.39,-5877.22,13.4363,NULL,0,0,0,0,100,0),
(823280,104,7289.84,-5874.47,14.9537,NULL,0,0,0,0,100,0),
(823280,105,7291.2,-5871.89,15.8828,NULL,0,0,0,0,100,0),
(823280,106,7292.89,-5868.68,15.8803,NULL,0,0,0,0,100,0),
(823280,107,7295.83,-5863.11,15.8803,NULL,0,0,0,0,100,0),
(823280,108,7299.15,-5856.82,15.8735,NULL,0,0,0,0,100,0),
(823280,109,7301.98,-5851.46,15.8722,NULL,0,0,0,0,100,0),
(823280,110,7305.79,-5844.23,15.8722,NULL,0,0,0,0,100,0),
(823280,111,7309.59,-5837.01,15.8737,NULL,0,0,0,0,100,0),
(823280,112,7311.99,-5832.47,15.9156,NULL,0,0,0,0,100,0),
(823280,113,7313.35,-5829.88,15.0217,NULL,0,0,0,0,100,0),
(823280,114,7314.61,-5827.51,13.6061,NULL,0,0,0,0,100,0),
(823280,115,7315.71,-5824.44,13.7387,NULL,0,0,0,0,100,0),
(823280,116,7318.07,-5817.85,12.3395,NULL,0,0,0,0,100,0),
-- Stonewing Slayer
(823670,1,7369.16,-5936.15,15.2804,NULL,0,0,0,0,100,0),
(823670,2,7364.86,-5932.56,15.3721,NULL,0,0,0,0,100,0),
(823670,3,7360.29,-5928.75,14.9976,NULL,0,0,0,0,100,0),
(823670,4,7355.46,-5924.71,14.2135,NULL,0,0,0,0,100,0),
(823670,5,7349.19,-5919.47,13.7583,NULL,0,0,0,0,100,0),
(823670,6,7343.07,-5914.36,14.8378,NULL,0,0,0,0,100,0),
(823670,7,7340.64,-5910.66,15.2528,NULL,0,0,0,0,100,0),
(823670,8,7337.11,-5905.3,15.3518,NULL,0,0,0,0,100,0),
(823670,9,7332.53,-5898.33,15.3036,NULL,0,0,0,0,100,0),
(823670,10,7327.6,-5890.82,15.0199,NULL,0,0,0,0,100,0),
(823670,11,7329.61,-5884.49,15.0421,NULL,0,0,0,0,100,0),
(823670,12,7331.69,-5877.92,14.8948,NULL,0,0,0,0,100,0),
(823670,13,7333.84,-5871.14,14.4976,NULL,0,0,0,0,100,0),
(823670,14,7335.74,-5865.13,14.3768,NULL,0,0,0,0,100,0),
(823670,15,7338.04,-5857.9,13.9306,NULL,0,0,0,0,100,0),
(823670,16,7340.39,-5850.47,14.3463,NULL,0,0,0,0,100,0),
(823670,17,7337.76,-5845.8,13.4573,NULL,0,0,0,0,100,0),
(823670,18,7334.61,-5840.21,12.4939,NULL,0,0,0,0,100,0),
(823670,19,7331.46,-5834.62,12.0372,NULL,0,0,0,0,100,0),
(823670,20,7327.68,-5827.92,12.2797,NULL,0,0,0,0,100,0),
(823670,21,7324.61,-5822.46,12.1646,NULL,0,0,0,0,100,0),
(823670,22,7319.12,-5821.35,12.841,NULL,0,0,0,0,100,0),
(823670,23,7315.46,-5820.61,12.9607,NULL,0,0,0,0,100,0),
(823670,24,7309.29,-5819.37,12.354,NULL,0,0,0,0,100,0),
(823670,25,7303.35,-5818.17,12.6496,NULL,0,0,0,0,100,0),
(823670,26,7294.32,-5816.35,12.1402,NULL,0,0,0,0,100,0),
(823670,27,7286.25,-5814.72,12.0836,NULL,0,0,0,0,100,0),
(823670,28,7281.02,-5815.12,12.3388,NULL,0,0,0,0,100,0),
(823670,29,7274.39,-5815.63,12.6116,NULL,0,0,0,0,100,0),
(823670,30,7267.65,-5816.15,12.5483,NULL,0,0,0,0,100,0),
(823670,31,7261.85,-5816.59,12.3231,NULL,0,0,0,0,100,0),
(823670,32,7259.82,-5820.79,12.7777,NULL,0,0,0,0,100,0),
(823670,33,7256.87,-5826.88,12.1175,NULL,0,0,0,0,100,0),
(823670,34,7253.07,-5834.76,12.006,NULL,0,0,0,0,100,0),
(823670,35,7250.12,-5840.85,12.3847,NULL,0,0,0,0,100,0),
(823670,36,7249.11,-5847.3,12.9676,NULL,0,0,0,0,100,0),
(823670,37,7247.91,-5854.91,13.3509,NULL,0,0,0,0,100,0),
(823670,38,7246.62,-5863.08,13.4335,NULL,0,0,0,0,100,0),
(823670,39,7245.05,-5873.11,13.4571,NULL,0,0,0,0,100,0),
(823670,40,7243.72,-5881.56,14.1981,NULL,0,0,0,0,100,0),
(823670,41,7241.14,-5887.55,15.0683,NULL,0,0,0,0,100,0),
(823670,42,7238.27,-5894.19,16.0399,NULL,0,0,0,0,100,0),
(823670,43,7235.46,-5900.72,16.7184,NULL,0,0,0,0,100,0),
(823670,44,7233.06,-5906.28,16.6541,NULL,0,0,0,0,100,0),
(823670,45,7231.08,-5910.86,16.3137,NULL,0,0,0,0,100,0),
(823670,46,7232.55,-5916.62,15.888,NULL,0,0,0,0,100,0),
(823670,47,7233.71,-5921.14,16.878,NULL,0,0,0,0,100,0),
(823670,48,7234.89,-5925.77,17.4032,NULL,0,0,0,0,100,0),
(823670,49,7235.96,-5929.95,17.7727,NULL,0,0,0,0,100,0),
(823670,50,7237.99,-5933.88,17.4528,NULL,0,0,0,0,100,0),
(823670,51,7241.53,-5940.73,17.4995,NULL,0,0,0,0,100,0),
(823670,52,7244.84,-5947.13,17.6467,NULL,0,0,0,0,100,0),
(823670,53,7245.05,-5954.82,18.0081,NULL,0,0,0,0,100,0),
(823670,54,7245.31,-5964.38,18.1121,NULL,0,0,0,0,100,0),
(823670,55,7245.57,-5973.76,18.7666,NULL,0,0,0,0,100,0),
(823670,56,7244.95,-5977.91,19.243,NULL,0,0,0,0,100,0),
(823670,57,7243.82,-5985.4,19.0409,NULL,0,0,0,0,100,0),
(823670,58,7242.97,-5991.07,19.3062,NULL,0,0,0,0,100,0),
(823670,59,7242.22,-5996.04,18.7993,NULL,0,0,0,0,100,0),
(823670,60,7241.58,-6000.33,17.9207,NULL,0,0,0,0,100,0),
(823670,61,7245.4,-6005.03,17.8059,NULL,0,0,0,0,100,0),
(823670,62,7249.45,-6010.01,18.7171,NULL,0,0,0,0,100,0),
(823670,63,7252.29,-6013.51,19.0716,NULL,0,0,0,0,100,0),
(823670,64,7257.84,-6012.16,19.4397,NULL,0,0,0,0,100,0),
(823670,65,7263.96,-6010.66,19.5075,NULL,0,0,0,0,100,0),
(823670,66,7270.08,-6009.17,19.3541,NULL,0,0,0,0,100,0),
(823670,67,7275.27,-6007.9,19.1673,NULL,0,0,0,0,100,0),
(823670,68,7281.17,-6007.16,18.8987,NULL,0,0,0,0,100,0),
(823670,69,7287.19,-6006.4,18.2729,NULL,0,0,0,0,100,0),
(823670,70,7292.27,-6005.76,17.5368,NULL,0,0,0,0,100,0),
(823670,71,7297.48,-6005.1,16.2303,NULL,0,0,0,0,100,0),
(823670,72,7303.03,-6004.41,15.2803,NULL,0,0,0,0,100,0),
(823670,73,7309.28,-6003.62,15.7232,NULL,0,0,0,0,100,0),
(823670,74,7315.88,-6002.79,16.3932,NULL,0,0,0,0,100,0),
(823670,75,7321.43,-6002.09,16.6269,NULL,0,0,0,0,100,0),
(823670,76,7326.62,-5998.71,16.2221,NULL,0,0,0,0,100,0),
(823670,77,7331.21,-5995.72,15.7376,NULL,0,0,0,0,100,0),
(823670,78,7335.81,-5992.73,14.9105,NULL,0,0,0,0,100,0),
(823670,79,7339.51,-5990.32,13.9466,NULL,0,0,0,0,100,0),
(823670,80,7341.52,-5986.37,12.5962,NULL,0,0,0,0,100,0),
(823670,81,7344.43,-5980.66,11.3682,NULL,0,0,0,0,100,0),
(823670,82,7349.09,-5978.23,11.924,NULL,0,0,0,0,100,0),
(823670,83,7354.67,-5975.31,12.7642,NULL,0,0,0,0,100,0),
(823670,84,7359.1,-5973,13.0986,NULL,0,0,0,0,100,0),
(823670,85,7360.48,-5967.94,13.366,NULL,0,0,0,0,100,0),
(823670,86,7362.05,-5962.21,13.3442,NULL,0,0,0,0,100,0),
(823670,87,7363.58,-5956.58,12.8494,NULL,0,0,0,0,100,0),
(823670,88,7365.03,-5951.28,12.7175,NULL,0,0,0,0,100,0),
(823670,89,7366.59,-5945.56,13.3602,NULL,0,0,0,0,100,0),
(823670,90,7368.04,-5940.27,14.455,NULL,0,0,0,0,100,0),
-- Stonewing Slayer
(824860,1,7315.08,-5868.18,36.547,NULL,0,0,0,0,100,0),
(824860,2,7309.01,-5869.33,36.5474,NULL,0,0,0,0,100,0),
(824860,3,7302,-5870.65,36.5444,NULL,0,0,0,0,100,0),
(824860,4,7295.25,-5867.48,36.5524,NULL,0,0,0,0,100,0),
(824860,5,7288.16,-5864.15,36.5438,NULL,0,0,0,0,100,0),
(824860,6,7285.4,-5858.22,36.5438,NULL,0,0,0,0,100,0),
(824860,7,7282.27,-5851.51,36.5536,NULL,0,0,0,0,100,0),
(824860,8,7281.89,-5844.63,36.5441,NULL,0,0,0,0,100,0),
(824860,9,7281.44,-5836.44,36.5446,NULL,0,0,0,0,100,0),
(824860,10,7287.02,-5830,36.5539,NULL,0,0,0,0,100,0),
(824860,11,7291.97,-5824.3,36.5524,NULL,0,0,0,0,100,0),
(824860,12,7301.34,-5823.1,36.5444,NULL,0,0,0,0,100,0),
(824860,13,7310.85,-5821.89,36.554,NULL,0,0,0,0,100,0),
(824860,14,7313.91,-5817.73,36.5486,NULL,0,0,0,0,100,0),
(824860,15,7311.89,-5815.78,36.5487,NULL,0,0,0,0,100,0),
(824860,16,7309,-5812.99,35.3306,NULL,0,0,0,0,100,0),
(824860,17,7306.39,-5810.47,34.5604,NULL,0,0,0,0,100,0),
(824860,18,7300.47,-5810.01,32.3206,NULL,0,0,0,0,100,0),
(824860,19,7295.12,-5809.6,30.6666,NULL,0,0,0,0,100,0),
(824860,20,7290.58,-5812.68,29.0349,NULL,0,0,0,0,100,0),
(824860,21,7287.44,-5814.81,28.1886,NULL,0,0,0,0,100,0),
(824860,22,7284.52,-5819.59,27.0972,NULL,0,0,0,0,100,0),
(824860,23,7281.48,-5824.57,26.2353,NULL,0,0,0,0,100,0),
(824860,24,7278.74,-5829.05,25.9207,NULL,0,0,0,0,100,0),
(824860,25,7277.11,-5831.73,25.9201,NULL,0,0,0,0,100,0),
(824860,26,7281.87,-5834.22,25.9201,NULL,0,0,0,0,100,0),
(824860,27,7283.62,-5835.14,25.4835,NULL,0,0,0,0,100,0),
(824860,28,7287.02,-5836.92,23.8136,NULL,0,0,0,0,100,0),
(824860,29,7292.92,-5840.01,23.8051,NULL,0,0,0,0,100,0),
(824860,30,7296.63,-5841.96,24.4819,NULL,0,0,0,0,100,0),
(824860,31,7299.42,-5843.42,25.5501,NULL,0,0,0,0,100,0),
(824860,32,7301.49,-5844.5,25.8308,NULL,0,0,0,0,100,0),
(824860,33,7308.31,-5848.08,25.8294,NULL,0,0,0,0,100,0),
(824860,34,7310.06,-5849,25.4585,NULL,0,0,0,0,100,0),
(824860,35,7314.09,-5851.11,24.0858,NULL,0,0,0,0,100,0),
(824860,36,7317.3,-5852.79,23.7974,NULL,0,0,0,0,100,0),
(824860,37,7319.9,-5854.15,23.8034,NULL,0,0,0,0,100,0),
(824860,38,7318.08,-5858.32,23.8071,NULL,0,0,0,0,100,0),
(824860,39,7316.64,-5861.64,22.1833,NULL,0,0,0,0,100,0),
(824860,40,7315.65,-5863.92,20.8671,NULL,0,0,0,0,100,0),
(824860,41,7311.76,-5865.18,19.0767,NULL,0,0,0,0,100,0),
(824860,42,7308.54,-5866.23,17.6945,NULL,0,0,0,0,100,0),
(824860,43,7303.77,-5865.76,15.8714,NULL,0,0,0,0,100,0),
(824860,44,7298.41,-5865.24,15.883,NULL,0,0,0,0,100,0),
(824860,45,7294.79,-5869.36,15.883,NULL,0,0,0,0,100,0),
(824860,46,7292.1,-5872.43,15.883,NULL,0,0,0,0,100,0),
(824860,47,7290.4,-5874.36,15.1164,NULL,0,0,0,0,100,0),
(824860,48,7288.01,-5877.09,13.4364,NULL,0,0,0,0,100,0),
(824860,49,7286.71,-5878.57,13.4377,NULL,0,0,0,0,100,0),
(824860,50,7288.2,-5884.45,13.465,NULL,0,0,0,0,100,0),
(824860,51,7289.97,-5891.46,13.8044,NULL,0,0,0,0,100,0),
(824860,52,7291.46,-5897.33,13.9692,NULL,0,0,0,0,100,0),
(824860,53,7292.55,-5901.64,14.1081,NULL,0,0,0,0,100,0),
(824860,54,7293.75,-5906.39,14.4021,NULL,0,0,0,0,100,0),
(824860,55,7295.09,-5911.71,14.7373,NULL,0,0,0,0,100,0),
(824860,56,7296.41,-5916.97,14.7967,NULL,0,0,0,0,100,0),
(824860,57,7295.17,-5921.56,15.3594,NULL,0,0,0,0,100,0),
(824860,58,7293.86,-5926.41,16.5785,NULL,0,0,0,0,100,0),
(824860,59,7292.22,-5932.49,16.6332,NULL,0,0,0,0,100,0),
(824860,60,7290.54,-5938.69,16.8451,NULL,0,0,0,0,100,0),
(824860,61,7288.8,-5945.11,16.7793,NULL,0,0,0,0,100,0),
(824860,62,7287.59,-5949.59,16.2568,NULL,0,0,0,0,100,0),
(824860,63,7286.15,-5954.93,15.7518,NULL,0,0,0,0,100,0),
(824860,64,7285.89,-5961.69,15.4773,NULL,0,0,0,0,100,0),
(824860,65,7285.68,-5966.97,15.5681,NULL,0,0,0,0,100,0),
(824860,66,7278.48,-5969.33,16.0198,NULL,0,0,0,0,100,0),
(824860,67,7270.6,-5971.91,16.8882,NULL,0,0,0,0,100,0),
(824860,68,7265.09,-5973.72,17.1392,NULL,0,0,0,0,100,0),
(824860,69,7259.42,-5971.86,17.4191,NULL,0,0,0,0,100,0),
(824860,70,7252.33,-5969.54,17.7614,NULL,0,0,0,0,100,0),
(824860,71,7246.78,-5967.73,18.0275,NULL,0,0,0,0,100,0),
(824860,72,7242.94,-5966.47,18.225,NULL,0,0,0,0,100,0),
(824860,73,7236.62,-5969.22,18.8056,NULL,0,0,0,0,100,0),
(824860,74,7229.45,-5972.33,19.3703,NULL,0,0,0,0,100,0),
(824860,75,7221.64,-5975.72,19.5704,NULL,0,0,0,0,100,0),
(824860,76,7215.32,-5978.47,19.6907,NULL,0,0,0,0,100,0),
(824860,77,7213.16,-5979.41,21.1845,NULL,0,0,0,0,100,0),
(824860,78,7209,-5980.54,23.1608,NULL,0,0,0,0,100,0),
(824860,79,7203.03,-5982.16,25.807,NULL,0,0,0,0,100,0),
(824860,80,7196.48,-5983.93,28.1151,NULL,0,0,0,0,100,0),
(824860,81,7192.21,-5985.09,29.1559,NULL,0,0,0,0,100,0),
(824860,82,7187.28,-5983.25,30.6782,NULL,0,0,0,0,100,0),
(824860,83,7183.5,-5981.84,32.1924,NULL,0,0,0,0,100,0),
(824860,84,7181.32,-5978.69,33.4226,NULL,0,0,0,0,100,0),
(824860,85,7179.69,-5974.94,35.1531,NULL,0,0,0,0,100,0),
(824860,86,7178.29,-5971.72,36.0778,NULL,0,0,0,0,100,0),
(824860,87,7179.69,-5974.94,35.1531,NULL,0,0,0,0,100,0),
(824860,88,7181.32,-5978.69,33.4226,NULL,0,0,0,0,100,0),
(824860,89,7183.5,-5981.84,32.1924,NULL,0,0,0,0,100,0),
(824860,90,7187.28,-5983.25,30.6782,NULL,0,0,0,0,100,0),
(824860,91,7192.21,-5985.09,29.1559,NULL,0,0,0,0,100,0),
(824860,92,7196.48,-5983.93,28.1151,NULL,0,0,0,0,100,0),
(824860,93,7203.03,-5982.16,25.807,NULL,0,0,0,0,100,0),
(824860,94,7209,-5980.54,23.1608,NULL,0,0,0,0,100,0),
(824860,95,7213.16,-5979.41,21.1845,NULL,0,0,0,0,100,0),
(824860,96,7215.32,-5978.47,19.6907,NULL,0,0,0,0,100,0),
(824860,97,7221.64,-5975.72,19.5704,NULL,0,0,0,0,100,0),
(824860,98,7229.45,-5972.33,19.3703,NULL,0,0,0,0,100,0),
(824860,99,7236.62,-5969.22,18.8056,NULL,0,0,0,0,100,0),
(824860,100,7242.94,-5966.47,18.225,NULL,0,0,0,0,100,0),
(824860,101,7246.78,-5967.73,18.0275,NULL,0,0,0,0,100,0),
(824860,102,7252.33,-5969.54,17.7614,NULL,0,0,0,0,100,0),
(824860,103,7259.42,-5971.86,17.4191,NULL,0,0,0,0,100,0),
(824860,104,7265.09,-5973.72,17.1392,NULL,0,0,0,0,100,0),
(824860,105,7270.6,-5971.91,16.8882,NULL,0,0,0,0,100,0),
(824860,106,7278.48,-5969.33,16.0198,NULL,0,0,0,0,100,0),
(824860,107,7285.68,-5966.97,15.5681,NULL,0,0,0,0,100,0),
(824860,108,7285.89,-5961.69,15.4773,NULL,0,0,0,0,100,0),
(824860,109,7286.15,-5954.93,15.7518,NULL,0,0,0,0,100,0),
(824860,110,7287.59,-5949.59,16.2568,NULL,0,0,0,0,100,0),
(824860,111,7288.8,-5945.11,16.7793,NULL,0,0,0,0,100,0),
(824860,112,7290.54,-5938.69,16.8451,NULL,0,0,0,0,100,0),
(824860,113,7292.22,-5932.49,16.6332,NULL,0,0,0,0,100,0),
(824860,114,7293.86,-5926.41,16.5785,NULL,0,0,0,0,100,0),
(824860,115,7295.17,-5921.56,15.3594,NULL,0,0,0,0,100,0),
(824860,116,7296.41,-5916.97,14.7967,NULL,0,0,0,0,100,0),
(824860,117,7295.09,-5911.71,14.7373,NULL,0,0,0,0,100,0),
(824860,118,7293.75,-5906.39,14.4021,NULL,0,0,0,0,100,0),
(824860,119,7292.55,-5901.64,14.1081,NULL,0,0,0,0,100,0),
(824860,120,7291.46,-5897.33,13.9692,NULL,0,0,0,0,100,0),
(824860,121,7289.97,-5891.46,13.8044,NULL,0,0,0,0,100,0),
(824860,122,7288.2,-5884.45,13.465,NULL,0,0,0,0,100,0),
(824860,123,7286.71,-5878.57,13.4377,NULL,0,0,0,0,100,0),
(824860,124,7288.01,-5877.09,13.4364,NULL,0,0,0,0,100,0),
(824860,125,7290.4,-5874.36,15.1164,NULL,0,0,0,0,100,0),
(824860,126,7292.1,-5872.43,15.883,NULL,0,0,0,0,100,0),
(824860,127,7294.79,-5869.36,15.883,NULL,0,0,0,0,100,0),
(824860,128,7298.41,-5865.24,15.883,NULL,0,0,0,0,100,0),
(824860,129,7303.77,-5865.76,15.8714,NULL,0,0,0,0,100,0),
(824860,130,7308.54,-5866.23,17.6945,NULL,0,0,0,0,100,0),
(824860,131,7311.76,-5865.18,19.0767,NULL,0,0,0,0,100,0),
(824860,132,7315.65,-5863.92,20.8671,NULL,0,0,0,0,100,0),
(824860,133,7316.64,-5861.64,22.1833,NULL,0,0,0,0,100,0),
(824860,134,7318.08,-5858.32,23.8071,NULL,0,0,0,0,100,0),
(824860,135,7319.9,-5854.15,23.8034,NULL,0,0,0,0,100,0),
(824860,136,7317.3,-5852.79,23.7974,NULL,0,0,0,0,100,0),
(824860,137,7314.09,-5851.11,24.0858,NULL,0,0,0,0,100,0),
(824860,138,7310.06,-5849,25.4585,NULL,0,0,0,0,100,0),
(824860,139,7308.31,-5848.08,25.8294,NULL,0,0,0,0,100,0),
(824860,140,7301.49,-5844.5,25.8308,NULL,0,0,0,0,100,0),
(824860,141,7299.42,-5843.42,25.5501,NULL,0,0,0,0,100,0),
(824860,142,7296.63,-5841.96,24.4819,NULL,0,0,0,0,100,0),
(824860,143,7292.92,-5840.01,23.8051,NULL,0,0,0,0,100,0),
(824860,144,7287.02,-5836.92,23.8136,NULL,0,0,0,0,100,0),
(824860,145,7283.62,-5835.14,25.4835,NULL,0,0,0,0,100,0),
(824860,146,7281.87,-5834.22,25.9201,NULL,0,0,0,0,100,0),
(824860,147,7277.11,-5831.73,25.9201,NULL,0,0,0,0,100,0),
(824860,148,7278.74,-5829.05,25.9207,NULL,0,0,0,0,100,0),
(824860,149,7281.48,-5824.57,26.2353,NULL,0,0,0,0,100,0),
(824860,150,7284.52,-5819.59,27.0972,NULL,0,0,0,0,100,0),
(824860,151,7287.44,-5814.81,28.1886,NULL,0,0,0,0,100,0),
(824860,152,7290.58,-5812.68,29.0349,NULL,0,0,0,0,100,0),
(824860,153,7295.12,-5809.6,30.6666,NULL,0,0,0,0,100,0),
(824860,154,7300.47,-5810.01,32.3206,NULL,0,0,0,0,100,0),
(824860,155,7306.39,-5810.47,34.5604,NULL,0,0,0,0,100,0),
(824860,156,7309,-5812.99,35.3306,NULL,0,0,0,0,100,0),
(824860,157,7311.89,-5815.78,36.5487,NULL,0,0,0,0,100,0),
(824860,158,7313.91,-5817.73,36.5486,NULL,0,0,0,0,100,0),
(824860,159,7310.85,-5821.89,36.554,NULL,0,0,0,0,100,0),
(824860,160,7301.34,-5823.1,36.5444,NULL,0,0,0,0,100,0),
(824860,161,7291.97,-5824.3,36.5524,NULL,0,0,0,0,100,0),
(824860,162,7287.02,-5830,36.5539,NULL,0,0,0,0,100,0),
(824860,163,7281.44,-5836.44,36.5446,NULL,0,0,0,0,100,0),
(824860,164,7281.89,-5844.63,36.5441,NULL,0,0,0,0,100,0),
(824860,165,7282.27,-5851.51,36.5536,NULL,0,0,0,0,100,0),
(824860,166,7285.4,-5858.22,36.5438,NULL,0,0,0,0,100,0),
(824860,167,7288.16,-5864.15,36.5438,NULL,0,0,0,0,100,0),
(824860,168,7295.25,-5867.48,36.5524,NULL,0,0,0,0,100,0),
(824860,169,7302,-5870.65,36.5444,NULL,0,0,0,0,100,0),
(824860,170,7309.01,-5869.33,36.5474,NULL,0,0,0,0,100,0);