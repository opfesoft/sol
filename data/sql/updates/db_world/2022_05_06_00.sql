UPDATE `creature` SET `position_x` = 259.29, `position_y` = -5771, `position_z` = 178.306 WHERE `guid` = 97994;
UPDATE `creature` SET `position_x` = 270.523, `position_y` = -5737.74, `position_z` = 260.133 WHERE `guid` = 98000;
UPDATE `creature` SET `position_x` = 336.165, `position_y` = -5875.25, `position_z` = 267.354 WHERE `guid` = 98001;
UPDATE `creature` SET `position_x` = 171.087, `position_y` = -5709.16, `position_z` = 286.189 WHERE `guid` = 97999;
UPDATE `creature` SET `position_x` = 186.653, `position_y` = -5719.2, `position_z` = 144.623, `orientation` = 2.39058 WHERE `guid` = 107048;
UPDATE `creature` SET `position_x` = 246.752, `position_y` = -5722.45, `position_z` = 206.172, `orientation` = 5.25104 WHERE `guid` = 107051;
UPDATE `creature` SET `position_x` = 205.538, `position_y` = -5705.5, `position_z` = 193.164, `orientation` = 5.84934 WHERE `guid` = 107216;
UPDATE `creature` SET `position_x` = 339.499, `position_y` = -5877.33, `position_z` = 267.322, `orientation` = 0.33585 WHERE `guid` = 107245;
UPDATE `creature` SET `position_x` = 162.626, `position_y` = -5695.73, `position_z` = 285.334, `orientation` = 1.32466 WHERE `guid` = 107078;
UPDATE `creature` SET `position_x` = 188.619, `position_y` = -5726.9, `position_z` = 100.818, `orientation` = 1.99618 WHERE `guid` = 107047;
UPDATE `creature` SET `position_x` = 130.485, `position_y` = -5746.84, `position_z` = 40.4932, `orientation` = 2.29462 WHERE `guid` = 107073;
UPDATE `creature` SET `position_x` = 350.018, `position_y` = -5764.63, `position_z` = 269.443, `orientation` = 1.35261 WHERE `guid` = 107053;
UPDATE `creature` SET `position_x` = 316.576, `position_y` = -5696.68, `position_z` = 318.778, `orientation` = 0.990101 WHERE `guid` = 107160;
UPDATE `creature` SET `position_x` = 364.322, `position_y` = -5783.43, `position_z` = 277.78, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 107163;
UPDATE `creature` SET `orientation` = 0.972977 WHERE `guid` = 107150;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (107062,107061,107057,107044,107035,107056,107063,107223,107142,107144,107060);
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (107039,107244,98014,106036,116543,116544,108464,116542,108465);
UPDATE `creature` SET `wander_distance` = 20, `MovementType` = 1 WHERE `guid` IN (115459,98006);
UPDATE `creature_addon` SET `emote` = 233 WHERE `guid` IN (107048,107079,107080,107072,107058,107062,107076,107073,107056,107081,107057,107053,107063);
UPDATE `creature_addon` SET `emote` = 375 WHERE `guid` IN (107149,107150,107153,107154,107160,107165,107166);

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 115451;
DELETE FROM `creature_addon` WHERE `guid` = 115451;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(115451,1154510,0,0,0,0,0,NULL);

DELETE FROM `waypoint_data` WHERE `id` IN (1154050,1154060,1154260,1154460,1154500,1154580,1154600,1154510);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(1154050,1,255.141,-5819.03,69.6983,0,0,0,0,0,100,0),
(1154050,2,247.184,-5817.94,69.6989,0,0,0,0,0,100,0),
(1154050,3,239.118,-5816.83,69.6989,0,0,0,0,0,100,0),
(1154050,4,228.39,-5815.35,69.6989,0,0,0,0,0,100,0),
(1154050,5,219.965,-5814.2,69.6989,0,0,0,0,0,100,0),
(1154050,6,211.65,-5813.05,69.6989,0,0,0,0,0,100,0),
(1154050,7,211.482,-5810.65,70.3195,0,0,0,0,0,100,0),
(1154050,8,211.257,-5802.02,70.5956,0,0,0,0,0,100,0),
(1154050,9,211.865,-5797.76,67.4488,0,0,0,0,0,100,0),
(1154050,10,212.491,-5793.36,64.3769,0,0,0,0,0,100,0),
(1154050,11,213.039,-5789.52,64.377,0,0,0,0,0,100,0),
(1154050,12,219.433,-5790.09,64.377,0,0,0,0,0,100,0),
(1154050,13,227.039,-5790.77,64.378,0,0,0,0,0,100,0),
(1154050,14,236.061,-5791.33,64.4297,0,0,0,0,0,100,0),
(1154050,15,240.285,-5793.81,66.016,0,0,0,0,0,100,0),
(1154050,16,244.561,-5796.33,67.1818,0,0,0,0,0,100,0),
(1154050,17,247.089,-5802.76,69.9366,0,0,0,0,0,100,0),
(1154050,18,249.096,-5807.86,72.486,0,0,0,0,0,100,0),
(1154050,19,251.173,-5813.14,75.7372,0,0,0,0,0,100,0),
(1154050,20,255.66,-5817.72,79.0637,0,0,0,0,0,100,0),
(1154050,21,263.606,-5823.49,84.1135,0,0,0,0,0,100,0),
(1154050,22,262.688,-5832.52,84.1041,0,0,0,0,0,100,0),
(1154050,23,261.768,-5841.57,83.7043,0,0,0,0,0,100,0),
(1154050,24,260.943,-5849.69,82.956,0,0,0,0,0,100,0),
(1154050,25,260.011,-5858.86,82.9053,0,0,0,0,0,100,0),
(1154050,26,259.244,-5866.41,82.9347,0,0,0,0,0,100,0),
(1154050,27,260.011,-5858.86,82.9053,0,0,0,0,0,100,0),
(1154050,28,260.943,-5849.69,82.956,0,0,0,0,0,100,0),
(1154050,29,261.768,-5841.57,83.7043,0,0,0,0,0,100,0),
(1154050,30,262.688,-5832.52,84.1041,0,0,0,0,0,100,0),
(1154050,31,263.606,-5823.49,84.1135,0,0,0,0,0,100,0),
(1154050,32,255.66,-5817.72,79.0637,0,0,0,0,0,100,0),
(1154050,33,251.173,-5813.14,75.7372,0,0,0,0,0,100,0),
(1154050,34,249.096,-5807.86,72.486,0,0,0,0,0,100,0),
(1154050,35,247.089,-5802.76,69.9366,0,0,0,0,0,100,0),
(1154050,36,244.561,-5796.33,67.1818,0,0,0,0,0,100,0),
(1154050,37,240.285,-5793.81,66.016,0,0,0,0,0,100,0),
(1154050,38,236.061,-5791.33,64.4297,0,0,0,0,0,100,0),
(1154050,39,227.039,-5790.77,64.378,0,0,0,0,0,100,0),
(1154050,40,219.433,-5790.09,64.377,0,0,0,0,0,100,0),
(1154050,41,213.039,-5789.52,64.377,0,0,0,0,0,100,0),
(1154050,42,212.491,-5793.36,64.3769,0,0,0,0,0,100,0),
(1154050,43,211.865,-5797.76,67.4488,0,0,0,0,0,100,0),
(1154050,44,211.257,-5802.02,70.5956,0,0,0,0,0,100,0),
(1154050,45,211.482,-5810.65,70.3195,0,0,0,0,0,100,0),
(1154050,46,211.65,-5813.05,69.6989,0,0,0,0,0,100,0),
(1154050,47,219.965,-5814.2,69.6989,0,0,0,0,0,100,0),
(1154050,48,228.39,-5815.35,69.6989,0,0,0,0,0,100,0),
(1154050,49,239.118,-5816.83,69.6989,0,0,0,0,0,100,0),
(1154050,50,247.184,-5817.94,69.6989,0,0,0,0,0,100,0),
(1154050,51,255.141,-5819.03,69.6983,0,0,0,0,0,100,0),
(1154050,52,254.06,-5827.02,66.0413,0,0,0,0,0,100,0),
(1154050,53,252.857,-5835.92,61.8573,0,0,0,0,0,100,0),
(1154050,54,253.678,-5843.35,58.655,0,0,0,0,0,100,0),
(1154050,55,254.65,-5852.13,56.3351,0,0,0,0,0,100,0),
(1154050,56,253.678,-5843.35,58.655,0,0,0,0,0,100,0),
(1154050,57,252.857,-5835.92,61.8573,0,0,0,0,0,100,0),
(1154050,58,254.06,-5827.02,66.0413,0,0,0,0,0,100,0),

(1154060,1,227.701,-5716.31,194.62,0,0,0,0,0,100,0),
(1154060,2,225.305,-5720.45,193.139,0,0,0,0,0,100,0),
(1154060,3,221.117,-5727.68,193.069,0,0,0,0,0,100,0),
(1154060,4,223.5,-5729.56,193.58,0,0,0,0,0,100,0),
(1154060,5,228.351,-5733.39,193.619,0,0,0,0,0,100,0),
(1154060,6,233.015,-5737.08,194.222,0,0,0,0,0,100,0),
(1154060,7,237.591,-5740.69,194.361,0,0,0,0,0,100,0),
(1154060,8,242.698,-5744.72,194.453,0,0,0,0,0,100,0),
(1154060,9,247.11,-5748.21,194.453,0,0,0,0,0,100,0),
(1154060,10,251.088,-5751.36,194.768,0,0,0,0,0,100,0),
(1154060,11,255.054,-5753.83,192.908,0,0,0,0,0,100,0),
(1154060,12,258.327,-5755.87,191.469,0,0,0,0,0,100,0),
(1154060,13,264.383,-5759.65,191.925,0,0,0,0,0,100,0),
(1154060,14,272.276,-5764.57,191.22,0,0,0,0,0,100,0),
(1154060,15,279.285,-5768.68,191.431,0,0,0,0,0,100,0),
(1154060,16,283.128,-5771.4,192.817,0,0,0,0,0,100,0),
(1154060,17,287.222,-5774.3,194.012,0,0,0,0,0,100,0),
(1154060,18,292.174,-5777.81,194.558,0,0,0,0,0,100,0),
(1154060,19,295.795,-5780.38,194.683,0,0,0,0,0,100,0),
(1154060,20,300.301,-5780.72,195.921,0,0,0,0,0,100,0),
(1154060,21,305.071,-5781.08,196.949,0,0,0,0,0,100,0),
(1154060,22,307.047,-5781.22,197.184,0,0,0,0,0,100,0),
(1154060,23,306.109,-5784.2,197.352,0,0,0,0,0,100,0),
(1154060,24,303.749,-5787.39,201.036,0,0,0,0,0,100,0),
(1154060,25,301.376,-5790.6,204.546,0,0,0,0,0,100,0),
(1154060,26,298.745,-5794.16,204.401,0,0,0,0,0,100,0),
(1154060,27,301.376,-5790.6,204.546,0,0,0,0,0,100,0),
(1154060,28,303.749,-5787.39,201.036,0,0,0,0,0,100,0),
(1154060,29,306.109,-5784.2,197.352,0,0,0,0,0,100,0),
(1154060,30,307.047,-5781.22,197.184,0,0,0,0,0,100,0),
(1154060,31,305.071,-5781.08,196.949,0,0,0,0,0,100,0),
(1154060,32,300.301,-5780.72,195.921,0,0,0,0,0,100,0),
(1154060,33,295.795,-5780.38,194.683,0,0,0,0,0,100,0),
(1154060,34,292.174,-5777.81,194.558,0,0,0,0,0,100,0),
(1154060,35,287.222,-5774.3,194.012,0,0,0,0,0,100,0),
(1154060,36,283.128,-5771.4,192.817,0,0,0,0,0,100,0),
(1154060,37,279.285,-5768.68,191.431,0,0,0,0,0,100,0),
(1154060,38,272.276,-5764.57,191.22,0,0,0,0,0,100,0),
(1154060,39,264.383,-5759.65,191.925,0,0,0,0,0,100,0),
(1154060,40,258.327,-5755.87,191.469,0,0,0,0,0,100,0),
(1154060,41,255.054,-5753.83,192.908,0,0,0,0,0,100,0),
(1154060,42,251.088,-5751.36,194.768,0,0,0,0,0,100,0),
(1154060,43,247.11,-5748.21,194.453,0,0,0,0,0,100,0),
(1154060,44,242.698,-5744.72,194.453,0,0,0,0,0,100,0),
(1154060,45,237.591,-5740.69,194.361,0,0,0,0,0,100,0),
(1154060,46,233.015,-5737.08,194.222,0,0,0,0,0,100,0),
(1154060,47,228.351,-5733.39,193.619,0,0,0,0,0,100,0),
(1154060,48,223.5,-5729.56,193.58,0,0,0,0,0,100,0),
(1154060,49,221.117,-5727.68,193.069,0,0,0,0,0,100,0),
(1154060,50,225.305,-5720.45,193.139,0,0,0,0,0,100,0),
(1154060,51,227.701,-5716.31,194.62,0,0,0,0,0,100,0),
(1154060,52,223.663,-5713.04,194.114,0,0,0,0,0,100,0),
(1154060,53,218.595,-5708.93,193.807,0,0,0,0,0,100,0),
(1154060,54,213.028,-5704.42,193.165,0,0,0,0,0,100,0),
(1154060,55,206,-5701.89,193.165,0,0,0,0,0,100,0),
(1154060,56,200.274,-5699.83,193.165,0,0,0,0,0,100,0),
(1154060,57,193.074,-5701.72,193.163,0,0,0,0,0,100,0),
(1154060,58,187.543,-5703.18,193.157,0,0,0,0,0,100,0),
(1154060,59,181.579,-5704.75,192.987,0,0,0,0,0,100,0),
(1154060,60,177.186,-5705.32,190.408,0,0,0,0,0,100,0),
(1154060,61,173.005,-5705.88,187.957,0,0,0,0,0,100,0),
(1154060,62,172.82,-5707.89,187.762,0,0,0,0,0,100,0),
(1154060,63,176.869,-5709.69,187.703,0,0,0,0,0,100,0),
(1154060,64,177.136,-5712.01,188.131,0,0,0,0,0,100,0),
(1154060,65,171.012,-5712.68,187.49,0,0,0,0,0,100,0),
(1154060,66,166.135,-5713.21,188.703,0,0,0,0,0,100,0),
(1154060,67,160.375,-5712.31,189.187,0,0,0,0,0,100,0),
(1154060,68,166.135,-5713.21,188.703,0,0,0,0,0,100,0),
(1154060,69,171.012,-5712.68,187.49,0,0,0,0,0,100,0),
(1154060,70,177.136,-5712.01,188.131,0,0,0,0,0,100,0),
(1154060,71,176.869,-5709.69,187.703,0,0,0,0,0,100,0),
(1154060,72,172.82,-5707.89,187.762,0,0,0,0,0,100,0),
(1154060,73,173.005,-5705.88,187.957,0,0,0,0,0,100,0),
(1154060,74,177.186,-5705.32,190.408,0,0,0,0,0,100,0),
(1154060,75,181.579,-5704.75,192.987,0,0,0,0,0,100,0),
(1154060,76,187.543,-5703.18,193.157,0,0,0,0,0,100,0),
(1154060,77,193.074,-5701.72,193.163,0,0,0,0,0,100,0),
(1154060,78,200.274,-5699.83,193.165,0,0,0,0,0,100,0),
(1154060,79,206,-5701.89,193.165,0,0,0,0,0,100,0),
(1154060,80,213.028,-5704.42,193.165,0,0,0,0,0,100,0),
(1154060,81,218.595,-5708.93,193.807,0,0,0,0,0,100,0),
(1154060,82,223.663,-5713.04,194.114,0,0,0,0,0,100,0),

(1154260,1,239.707,-5681.22,129.533,0,0,0,0,0,100,0),
(1154260,2,248.049,-5683.21,127.012,0,0,0,0,0,100,0),
(1154260,3,252.229,-5684.2,124.873,0,0,0,0,0,100,0),
(1154260,4,255.752,-5689.28,120.353,0,0,0,0,0,100,0),
(1154260,5,259.41,-5694.55,116.942,0,0,0,0,0,100,0),
(1154260,6,263.001,-5699.73,113.631,0,0,0,0,0,100,0),
(1154260,7,266.923,-5705.38,113.175,0,0,0,0,0,100,0),
(1154260,8,270.672,-5708.76,110.89,0,0,0,0,0,100,0),
(1154260,9,273.945,-5711.71,110.808,0,0,0,0,0,100,0),
(1154260,10,279.309,-5710.55,110.059,0,0,0,0,0,100,0),
(1154260,11,285.809,-5709.15,108.85,0,0,0,0,0,100,0),
(1154260,12,292.877,-5707.62,106.617,0,0,0,0,0,100,0),
(1154260,13,299.144,-5706.26,104.432,0,0,0,0,0,100,0),
(1154260,14,304.799,-5705.04,102.666,0,0,0,0,0,100,0),
(1154260,15,306.611,-5709.35,102.039,0,0,0,0,0,100,0),
(1154260,16,308.35,-5713.49,99.2557,0,0,0,0,0,100,0),
(1154260,17,309.075,-5715.21,98.7001,0,0,0,0,0,100,0),
(1154260,18,305.435,-5718.3,97.4061,0,0,0,0,0,100,0),
(1154260,19,302.675,-5720.64,96.4789,0,0,0,0,0,100,0),
(1154260,20,297.427,-5725.09,96.2077,0,0,0,0,0,100,0),
(1154260,21,292.622,-5729.16,96.6075,0,0,0,0,0,100,0),
(1154260,22,288.426,-5732.72,96.4299,0,0,0,0,0,100,0),
(1154260,23,286.524,-5738.08,95.4088,0,0,0,0,0,100,0),
(1154260,24,284.161,-5744.73,93.7448,0,0,0,0,0,100,0),
(1154260,25,287.077,-5752.23,90.825,0,0,0,0,0,100,0),
(1154260,26,289.781,-5759.19,88.2659,0,0,0,0,0,100,0),
(1154260,27,293.035,-5767.56,86.31,0,0,0,0,0,100,0),
(1154260,28,295.951,-5775.06,84.5561,0,0,0,0,0,100,0),
(1154260,29,298.7,-5782.13,82.8795,0,0,0,0,0,100,0),
(1154260,30,301.279,-5788.77,81.8775,0,0,0,0,0,100,0),
(1154260,31,304.066,-5795.94,81.999,0,0,0,0,0,100,0),
(1154260,32,307.023,-5803.55,82.0786,0,0,0,0,0,100,0),
(1154260,33,309.524,-5809.98,82.0956,0,0,0,0,0,100,0),
(1154260,34,307.524,-5815.85,82.3364,0,0,0,0,0,100,0),
(1154260,35,305.119,-5822.91,82.7159,0,0,0,0,0,100,0),
(1154260,36,302.216,-5831.44,83.1905,0,0,0,0,0,100,0),
(1154260,37,296.742,-5832.94,83.3957,0,0,0,0,0,100,0),
(1154260,38,290.445,-5834.67,83.6151,0,0,0,0,0,100,0),
(1154260,39,281.387,-5837.16,84.3057,0,0,0,0,0,100,0),
(1154260,40,290.445,-5834.67,83.6151,0,0,0,0,0,100,0),
(1154260,41,296.742,-5832.94,83.3957,0,0,0,0,0,100,0),
(1154260,42,302.216,-5831.44,83.1905,0,0,0,0,0,100,0),
(1154260,43,305.119,-5822.91,82.7159,0,0,0,0,0,100,0),
(1154260,44,307.524,-5815.85,82.3364,0,0,0,0,0,100,0),
(1154260,45,309.524,-5809.98,82.0956,0,0,0,0,0,100,0),
(1154260,46,307.023,-5803.55,82.0786,0,0,0,0,0,100,0),
(1154260,47,304.066,-5795.94,81.999,0,0,0,0,0,100,0),
(1154260,48,301.279,-5788.77,81.8775,0,0,0,0,0,100,0),
(1154260,49,298.7,-5782.13,82.8795,0,0,0,0,0,100,0),
(1154260,50,295.951,-5775.06,84.5561,0,0,0,0,0,100,0),
(1154260,51,293.035,-5767.56,86.31,0,0,0,0,0,100,0),
(1154260,52,289.781,-5759.19,88.2659,0,0,0,0,0,100,0),
(1154260,53,287.077,-5752.23,90.825,0,0,0,0,0,100,0),
(1154260,54,284.161,-5744.73,93.7448,0,0,0,0,0,100,0),
(1154260,55,286.524,-5738.08,95.4088,0,0,0,0,0,100,0),
(1154260,56,288.426,-5732.72,96.4299,0,0,0,0,0,100,0),
(1154260,57,292.622,-5729.16,96.6075,0,0,0,0,0,100,0),
(1154260,58,297.427,-5725.09,96.2077,0,0,0,0,0,100,0),
(1154260,59,302.675,-5720.64,96.4789,0,0,0,0,0,100,0),
(1154260,60,305.435,-5718.3,97.4061,0,0,0,0,0,100,0),
(1154260,61,309.075,-5715.21,98.7001,0,0,0,0,0,100,0),
(1154260,62,308.35,-5713.49,99.2557,0,0,0,0,0,100,0),
(1154260,63,306.611,-5709.35,102.039,0,0,0,0,0,100,0),
(1154260,64,304.799,-5705.04,102.666,0,0,0,0,0,100,0),
(1154260,65,299.144,-5706.26,104.432,0,0,0,0,0,100,0),
(1154260,66,292.877,-5707.62,106.617,0,0,0,0,0,100,0),
(1154260,67,285.809,-5709.15,108.85,0,0,0,0,0,100,0),
(1154260,68,279.309,-5710.55,110.059,0,0,0,0,0,100,0),
(1154260,69,273.945,-5711.71,110.808,0,0,0,0,0,100,0),
(1154260,70,270.672,-5708.76,110.89,0,0,0,0,0,100,0),
(1154260,71,266.923,-5705.38,113.175,0,0,0,0,0,100,0),
(1154260,72,263.001,-5699.73,113.631,0,0,0,0,0,100,0),
(1154260,73,259.41,-5694.55,116.942,0,0,0,0,0,100,0),
(1154260,74,255.752,-5689.28,120.353,0,0,0,0,0,100,0),
(1154260,75,252.229,-5684.2,124.873,0,0,0,0,0,100,0),
(1154260,76,248.049,-5683.21,127.012,0,0,0,0,0,100,0),

(1154460,1,334.004,-5775.9,266.461,0,0,0,0,0,100,0),
(1154460,2,328.382,-5769.5,266.589,0,0,0,0,0,100,0),
(1154460,3,324.028,-5764.54,266.761,0,0,0,0,0,100,0),
(1154460,4,318.794,-5758.58,266.441,0,0,0,0,0,100,0),
(1154460,5,314.326,-5753.5,266.941,0,0,0,0,0,100,0),
(1154460,6,309.397,-5747.89,267.671,0,0,0,0,0,100,0),
(1154460,7,304.088,-5741.84,268.725,0,0,0,0,0,100,0),
(1154460,8,300.206,-5736.16,270.61,0,0,0,0,0,100,0),
(1154460,9,296.787,-5731.15,273.742,0,0,0,0,0,100,0),
(1154460,10,293.563,-5726.42,276.969,0,0,0,0,0,100,0),
(1154460,11,290.595,-5722.08,279.229,0,0,0,0,0,100,0),
(1154460,12,287.133,-5719.71,279.872,0,0,0,0,0,100,0),
(1154460,13,281.839,-5716.09,280.048,0,0,0,0,0,100,0),
(1154460,14,276.738,-5712.61,280.429,0,0,0,0,0,100,0),
(1154460,15,269.554,-5707.7,281.278,0,0,0,0,0,100,0),
(1154460,16,261.29,-5707.16,281.853,0,0,0,0,0,100,0),
(1154460,17,255.706,-5706.8,281.77,0,0,0,0,0,100,0),
(1154460,18,250.438,-5704.91,282.371,0,0,0,0,0,100,0),
(1154460,19,245.384,-5703.1,282.936,0,0,0,0,0,100,0),
(1154460,20,238.241,-5700.54,283.727,0,0,0,0,0,100,0),
(1154460,21,231.209,-5698.02,284.506,0,0,0,0,0,100,0),
(1154460,22,224.178,-5695.5,285.285,0,0,0,0,0,100,0),
(1154460,23,216.271,-5692.67,286.161,0,0,0,0,0,100,0),
(1154460,24,209.425,-5690.22,286.919,0,0,0,0,0,100,0),
(1154460,25,205.227,-5694.27,286.545,0,0,0,0,0,100,0),
(1154460,26,200.949,-5698.41,286.545,0,0,0,0,0,100,0),
(1154460,27,197.837,-5701.41,286.546,0,0,0,0,0,100,0),
(1154460,28,190.853,-5701.77,286.546,0,0,0,0,0,100,0),
(1154460,29,180.593,-5702.3,286.545,0,0,0,0,0,100,0),
(1154460,30,173.748,-5702.65,286.189,0,0,0,0,0,100,0),
(1154460,31,167.08,-5702.99,286.189,0,0,0,0,0,100,0),
(1154460,32,159.762,-5703.37,285.308,0,0,0,0,0,100,0),
(1154460,33,153.744,-5703.68,285.515,0,0,0,0,0,100,0),
(1154460,34,150.003,-5703.87,285.78,0,0,0,0,0,100,0),
(1154460,35,153.744,-5703.68,285.515,0,0,0,0,0,100,0),
(1154460,36,159.762,-5703.37,285.308,0,0,0,0,0,100,0),
(1154460,37,167.08,-5702.99,286.189,0,0,0,0,0,100,0),
(1154460,38,173.748,-5702.65,286.189,0,0,0,0,0,100,0),
(1154460,39,180.593,-5702.3,286.545,0,0,0,0,0,100,0),
(1154460,40,190.853,-5701.77,286.546,0,0,0,0,0,100,0),
(1154460,41,197.837,-5701.41,286.546,0,0,0,0,0,100,0),
(1154460,42,200.949,-5698.41,286.545,0,0,0,0,0,100,0),
(1154460,43,205.227,-5694.27,286.545,0,0,0,0,0,100,0),
(1154460,44,209.425,-5690.22,286.919,0,0,0,0,0,100,0),
(1154460,45,216.271,-5692.67,286.161,0,0,0,0,0,100,0),
(1154460,46,224.178,-5695.5,285.285,0,0,0,0,0,100,0),
(1154460,47,231.209,-5698.02,284.506,0,0,0,0,0,100,0),
(1154460,48,238.241,-5700.54,283.727,0,0,0,0,0,100,0),
(1154460,49,245.384,-5703.1,282.936,0,0,0,0,0,100,0),
(1154460,50,250.438,-5704.91,282.371,0,0,0,0,0,100,0),
(1154460,51,255.706,-5706.8,281.77,0,0,0,0,0,100,0),
(1154460,52,261.29,-5707.16,281.853,0,0,0,0,0,100,0),
(1154460,53,269.554,-5707.7,281.278,0,0,0,0,0,100,0),
(1154460,54,276.738,-5712.61,280.429,0,0,0,0,0,100,0),
(1154460,55,281.839,-5716.09,280.048,0,0,0,0,0,100,0),
(1154460,56,287.133,-5719.71,279.872,0,0,0,0,0,100,0),
(1154460,57,290.595,-5722.08,279.229,0,0,0,0,0,100,0),
(1154460,58,293.563,-5726.42,276.969,0,0,0,0,0,100,0),
(1154460,59,296.787,-5731.15,273.742,0,0,0,0,0,100,0),
(1154460,60,300.206,-5736.16,270.61,0,0,0,0,0,100,0),
(1154460,61,304.088,-5741.84,268.725,0,0,0,0,0,100,0),
(1154460,62,309.397,-5747.89,267.671,0,0,0,0,0,100,0),
(1154460,63,314.326,-5753.5,266.941,0,0,0,0,0,100,0),
(1154460,64,318.794,-5758.58,266.441,0,0,0,0,0,100,0),
(1154460,65,324.028,-5764.54,266.761,0,0,0,0,0,100,0),
(1154460,66,328.382,-5769.5,266.589,0,0,0,0,0,100,0),

(1154500,1,137.86,-5750.37,36.8629,0,0,0,0,0,100,0),
(1154500,2,141.746,-5754.26,32.2991,0,0,0,0,0,100,0),
(1154500,3,146.11,-5758.62,27.5517,0,0,0,0,0,100,0),
(1154500,4,141.746,-5754.26,32.2991,0,0,0,0,0,100,0),
(1154500,5,137.86,-5750.37,36.8629,0,0,0,0,0,100,0),
(1154500,6,133.098,-5748.78,38.9654,0,0,0,0,0,100,0),
(1154500,7,129.32,-5749.98,39.2478,0,0,0,0,0,100,0),
(1154500,8,124.886,-5755.94,38.4459,0,0,0,0,0,100,0),
(1154500,9,120.154,-5762.3,38.4459,0,0,0,0,0,100,0),
(1154500,10,116.187,-5767.62,38.4459,0,0,0,0,0,100,0),
(1154500,11,112.354,-5772.77,38.4104,0,0,0,0,0,100,0),
(1154500,12,108.181,-5773.62,34.337,0,0,0,0,0,100,0),
(1154500,13,103.503,-5774.57,29.8515,0,0,0,0,0,100,0),
(1154500,14,101.212,-5775.04,29.8515,0,0,0,0,0,100,0),
(1154500,15,100.441,-5769.25,29.8515,0,0,0,0,0,100,0),
(1154500,16,99.6831,-5763.55,29.8515,0,0,0,0,0,100,0),
(1154500,17,96.5451,-5763.66,30.1089,0,0,0,0,0,100,0),
(1154500,18,92.0188,-5764.65,25.6772,0,0,0,0,0,100,0),
(1154500,19,87.2312,-5765.69,21.3688,0,0,0,0,0,100,0),
(1154500,20,85.9938,-5770.51,21.3685,0,0,0,0,0,100,0),
(1154500,21,91.5919,-5772.79,21.3685,0,0,0,0,0,100,0),
(1154500,22,96.3017,-5771.69,18.1456,0,0,0,0,0,100,0),
(1154500,23,101.748,-5770.42,14.6998,0,0,0,0,0,100,0),
(1154500,24,105.845,-5769.46,14.6998,0,0,0,0,0,100,0),
(1154500,25,101.748,-5770.42,14.6998,0,0,0,0,0,100,0),
(1154500,26,96.3017,-5771.69,18.1456,0,0,0,0,0,100,0),
(1154500,27,91.5919,-5772.79,21.3685,0,0,0,0,0,100,0),
(1154500,28,85.9938,-5770.51,21.3685,0,0,0,0,0,100,0),
(1154500,29,87.2312,-5765.69,21.3688,0,0,0,0,0,100,0),
(1154500,30,92.0188,-5764.65,25.6772,0,0,0,0,0,100,0),
(1154500,31,96.5451,-5763.66,30.1089,0,0,0,0,0,100,0),
(1154500,32,99.6831,-5763.55,29.8515,0,0,0,0,0,100,0),
(1154500,33,100.441,-5769.25,29.8515,0,0,0,0,0,100,0),
(1154500,34,101.212,-5775.04,29.8515,0,0,0,0,0,100,0),
(1154500,35,103.503,-5774.57,29.8515,0,0,0,0,0,100,0),
(1154500,36,108.181,-5773.62,34.337,0,0,0,0,0,100,0),
(1154500,37,112.354,-5772.77,38.4104,0,0,0,0,0,100,0),
(1154500,38,116.187,-5767.62,38.4459,0,0,0,0,0,100,0),
(1154500,39,120.154,-5762.3,38.4459,0,0,0,0,0,100,0),
(1154500,40,124.886,-5755.94,38.4459,0,0,0,0,0,100,0),
(1154500,41,129.32,-5749.98,39.2478,0,0,0,0,0,100,0),
(1154500,42,133.098,-5748.78,38.9654,0,0,0,0,0,100,0),

(1154580,1,219.961,-5839.25,16.6031,0,0,0,0,0,100,0),
(1154580,2,218.018,-5834.35,16.5763,0,0,0,0,0,100,0),
(1154580,3,216.212,-5829.8,16.5534,0,0,0,0,0,100,0),
(1154580,4,214.707,-5826,19.4045,0,0,0,0,0,100,0),
(1154580,5,213.04,-5821.8,22.2509,0,0,0,0,0,100,0),
(1154580,6,211.151,-5817.04,22.2644,0,0,0,0,0,100,0),
(1154580,7,209.552,-5813.01,22.2691,0,0,0,0,0,100,0),
(1154580,8,207.326,-5807.39,26.1998,0,0,0,0,0,100,0),
(1154580,9,205.234,-5802.12,29.9836,0,0,0,0,0,100,0),
(1154580,10,207.111,-5799,29.9496,0,0,0,0,0,100,0),
(1154580,11,210.214,-5800.86,29.9367,0,0,0,0,0,100,0),
(1154580,12,214.817,-5803.61,29.6791,0,0,0,0,0,100,0),
(1154580,13,218.527,-5805.82,29.6207,0,0,0,0,0,100,0),
(1154580,14,223.665,-5804.27,29.4721,0,0,0,0,0,100,0),
(1154580,15,228.563,-5802.79,29.775,0,0,0,0,0,100,0),
(1154580,16,230.774,-5805.84,29.891,0,0,0,0,0,100,0),
(1154580,17,232.471,-5811.3,32.8542,0,0,0,0,0,100,0),
(1154580,18,233.819,-5815.64,35.2748,0,0,0,0,0,100,0),
(1154580,19,236.618,-5820.6,38.6546,0,0,0,0,0,100,0),
(1154580,20,239.248,-5825.26,41.7811,0,0,0,0,0,100,0),
(1154580,21,238.083,-5828.34,41.1015,0,0,0,0,0,100,0),
(1154580,22,242.92,-5829.64,41.1306,0,0,0,0,0,100,0),
(1154580,23,245.497,-5832.6,40.7709,0,0,0,0,0,100,0),
(1154580,24,244.59,-5835.2,39.7971,0,0,0,0,0,100,0),
(1154580,25,242.895,-5840.05,36.5784,0,0,0,0,0,100,0),
(1154580,26,240.434,-5847.09,32.0734,0,0,0,0,0,100,0),
(1154580,27,238.574,-5852.41,28.9808,0,0,0,0,0,100,0),
(1154580,28,234.713,-5855.8,25.9076,0,0,0,0,0,100,0),
(1154580,29,229.978,-5859.96,21.2822,0,0,0,0,0,100,0),
(1154580,30,225.624,-5863.78,17.1971,0,0,0,0,0,100,0),
(1154580,31,220.332,-5862.51,16.4022,0,0,0,0,0,100,0),
(1154580,32,220.69,-5857.2,13.8102,0,0,0,0,0,100,0),
(1154580,33,220.949,-5853.36,12.9533,0,0,0,0,0,100,0),
(1154580,34,221.222,-5849.3,13.3037,0,0,0,0,0,100,0),
(1154580,35,221.351,-5845.8,12.5645,0,0,0,0,0,100,0),
(1154580,36,220.601,-5842.27,14.6624,0,0,0,0,0,100,0),

(1154600,1,287.632,-5792.93,191.851,0,0,0,0,0,100,0),
(1154600,2,284.201,-5789.59,189.446,0,0,0,0,0,100,0),
(1154600,3,280.681,-5786.16,187.186,0,0,0,0,0,100,0),
(1154600,4,276.247,-5781.85,187.186,0,0,0,0,0,100,0),
(1154600,5,272.065,-5777.77,187.214,0,0,0,0,0,100,0),
(1154600,6,268.208,-5774.56,182.492,0,0,0,0,0,100,0),
(1154600,7,264.529,-5771.5,178.306,0,0,0,0,0,100,0),
(1154600,8,260.414,-5768.07,178.306,0,0,0,0,0,100,0),
(1154600,9,256.814,-5765.08,178.497,0,0,0,0,0,100,0),
(1154600,10,252.979,-5761.66,173.642,0,0,0,0,0,100,0),
(1154600,11,249.592,-5758.64,170.003,0,0,0,0,0,100,0),
(1154600,12,247.57,-5753.42,170.003,0,0,0,0,0,100,0),
(1154600,13,245.771,-5748.77,170.205,0,0,0,0,0,100,0),
(1154600,14,241.85,-5745.1,165.12,0,0,0,0,0,100,0),
(1154600,15,238.716,-5742.17,161.611,0,0,0,0,0,100,0),
(1154600,16,235.522,-5736.88,161.611,0,0,0,0,0,100,0),
(1154600,17,232.613,-5732.06,161.784,0,0,0,0,0,100,0),
(1154600,18,227.769,-5730.77,157.124,0,0,0,0,0,100,0),
(1154600,19,223.298,-5729.59,153.194,0,0,0,0,0,100,0),
(1154600,20,218.578,-5730.35,153.194,0,0,0,0,0,100,0),
(1154600,21,213.024,-5731.25,153.376,0,0,0,0,0,100,0),
(1154600,22,208.502,-5730.12,148.986,0,0,0,0,0,100,0),
(1154600,23,203.737,-5728.93,144.871,0,0,0,0,0,100,0),
(1154600,24,195.644,-5725.04,144.769,0,0,0,0,0,100,0),
(1154600,25,189.326,-5722,144.394,0,0,0,0,0,100,0),
(1154600,26,195.644,-5725.04,144.769,0,0,0,0,0,100,0),
(1154600,27,203.737,-5728.93,144.871,0,0,0,0,0,100,0),
(1154600,28,208.502,-5730.12,148.986,0,0,0,0,0,100,0),
(1154600,29,213.024,-5731.25,153.376,0,0,0,0,0,100,0),
(1154600,30,218.578,-5730.35,153.194,0,0,0,0,0,100,0),
(1154600,31,223.298,-5729.59,153.194,0,0,0,0,0,100,0),
(1154600,32,227.769,-5730.77,157.124,0,0,0,0,0,100,0),
(1154600,33,232.613,-5732.06,161.784,0,0,0,0,0,100,0),
(1154600,34,235.522,-5736.88,161.611,0,0,0,0,0,100,0),
(1154600,35,238.716,-5742.17,161.611,0,0,0,0,0,100,0),
(1154600,36,241.85,-5745.1,165.12,0,0,0,0,0,100,0),
(1154600,37,245.771,-5748.77,170.205,0,0,0,0,0,100,0),
(1154600,38,247.57,-5753.42,170.003,0,0,0,0,0,100,0),
(1154600,39,249.592,-5758.64,170.003,0,0,0,0,0,100,0),
(1154600,40,252.979,-5761.66,173.642,0,0,0,0,0,100,0),
(1154600,41,256.814,-5765.08,178.497,0,0,0,0,0,100,0),
(1154600,42,260.414,-5768.07,178.306,0,0,0,0,0,100,0),
(1154600,43,264.529,-5771.5,178.306,0,0,0,0,0,100,0),
(1154600,44,268.208,-5774.56,182.492,0,0,0,0,0,100,0),
(1154600,45,272.065,-5777.77,187.214,0,0,0,0,0,100,0),
(1154600,46,276.247,-5781.85,187.186,0,0,0,0,0,100,0),
(1154600,47,280.681,-5786.16,187.186,0,0,0,0,0,100,0),
(1154600,48,284.201,-5789.59,189.446,0,0,0,0,0,100,0),
(1154600,49,287.632,-5792.93,191.851,0,0,0,0,0,100,0),
(1154600,50,289.982,-5799.52,192.583,0,0,0,0,0,100,0),
(1154600,51,291.479,-5803.73,192.856,0,0,0,0,0,100,0),
(1154600,52,293.434,-5809.21,192.335,0,0,0,0,0,100,0),
(1154600,53,295.144,-5814.01,191.668,0,0,0,0,0,100,0),
(1154600,54,298.962,-5818.57,191.343,0,0,0,0,0,100,0),
(1154600,55,302.48,-5822.78,191.336,0,0,0,0,0,100,0),
(1154600,56,305.624,-5826.54,193.334,0,0,0,0,0,100,0),
(1154600,57,307.819,-5829.16,194.957,0,0,0,0,0,100,0),
(1154600,58,305.624,-5826.54,193.334,0,0,0,0,0,100,0),
(1154600,59,302.48,-5822.78,191.336,0,0,0,0,0,100,0),
(1154600,60,298.962,-5818.57,191.343,0,0,0,0,0,100,0),
(1154600,61,295.144,-5814.01,191.668,0,0,0,0,0,100,0),
(1154600,62,293.434,-5809.21,192.335,0,0,0,0,0,100,0),
(1154600,63,291.479,-5803.73,192.856,0,0,0,0,0,100,0),
(1154600,64,289.982,-5799.52,192.583,0,0,0,0,0,100,0),

(1154510,1,167.49,-5770.76,41.971,0,0,0,0,0,100,0),
(1154510,2,170.974,-5776.44,38.1417,0,0,0,0,0,100,0),
(1154510,3,171.269,-5782.94,38.1801,0,0,0,0,0,100,0),
(1154510,4,167.689,-5785.35,35.0351,0,0,0,0,0,100,0),
(1154510,5,164.016,-5787.83,32.2143,0,0,0,0,0,100,0),
(1154510,6,161.31,-5789.66,32.2105,0,0,0,0,0,100,0),
(1154510,7,158.858,-5785.69,32.3255,0,0,0,0,0,100,0),
(1154510,8,156.221,-5781.42,28.9997,0,0,0,0,0,100,0),
(1154510,9,153.655,-5777.26,26.0525,0,0,0,0,0,100,0),
(1154510,10,144.799,-5777.48,25.7535,0,0,0,0,0,100,0),
(1154510,11,136.713,-5784.28,25.6858,0,0,0,0,0,100,0),
(1154510,12,144.799,-5777.48,25.7535,0,0,0,0,0,100,0),
(1154510,13,153.655,-5777.26,26.0525,0,0,0,0,0,100,0),
(1154510,14,156.221,-5781.42,28.9997,0,0,0,0,0,100,0),
(1154510,15,158.858,-5785.69,32.3255,0,0,0,0,0,100,0),
(1154510,16,161.31,-5789.66,32.2105,0,0,0,0,0,100,0),
(1154510,17,164.016,-5787.83,32.2143,0,0,0,0,0,100,0),
(1154510,18,167.689,-5785.35,35.0351,0,0,0,0,0,100,0),
(1154510,19,171.269,-5782.94,38.1801,0,0,0,0,0,100,0),
(1154510,20,179.086,-5784.61,37.9518,0,0,0,0,0,100,0),
(1154510,21,182.376,-5790.25,38.5175,0,0,0,0,0,100,0),
(1154510,22,190.197,-5792.97,38.5262,0,0,0,0,0,100,0),
(1154510,23,198.815,-5788.56,38.6782,0,0,0,0,0,100,0),
(1154510,24,206.209,-5784.77,38.6791,0,0,0,0,0,100,0),
(1154510,25,210.085,-5789.45,38.6796,0,0,0,0,0,100,0),
(1154510,26,212.457,-5792.31,38.1622,0,0,0,0,0,100,0),
(1154510,27,218.386,-5789.57,38.1622,0,0,0,0,0,100,0),
(1154510,28,222.825,-5787.52,38.5493,0,0,0,0,0,100,0),
(1154510,29,229.098,-5787.02,38.5493,0,0,0,0,0,100,0),
(1154510,30,222.825,-5787.52,38.5493,0,0,0,0,0,100,0),
(1154510,31,218.386,-5789.57,38.1622,0,0,0,0,0,100,0),
(1154510,32,212.457,-5792.31,38.1622,0,0,0,0,0,100,0),
(1154510,33,210.085,-5789.45,38.6796,0,0,0,0,0,100,0),
(1154510,34,206.209,-5784.77,38.6791,0,0,0,0,0,100,0),
(1154510,35,198.815,-5788.56,38.6782,0,0,0,0,0,100,0),
(1154510,36,190.197,-5792.97,38.5262,0,0,0,0,0,100,0),
(1154510,37,182.376,-5790.25,38.5175,0,0,0,0,0,100,0),
(1154510,38,179.086,-5784.61,37.9518,0,0,0,0,0,100,0),
(1154510,39,170.974,-5776.44,38.1417,0,0,0,0,0,100,0);