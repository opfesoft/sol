UPDATE `creature` SET `position_x` = -2864.9, `position_y` = -1103.2, `position_z` = 88.3932, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 24875;
UPDATE `creature` SET `position_x` = -2922.72, `position_y` = -1327.38, `position_z` = 87.6739 WHERE `guid` = 24871;
UPDATE `creature` SET `position_x` = -2939.46, `position_y` = -1266.73, `position_z` = 72.2045, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 24913;
UPDATE `creature` SET `position_x` = -3150.8, `position_y` = -1105.22, `position_z` = 77.7069, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 24901;
UPDATE `creature` SET `position_x` = -2966.63, `position_y` = -1166.78, `position_z` = 59.9851 WHERE `guid` = 24905;
UPDATE `creature` SET `position_x` = -2961.71, `position_y` = -1011.22, `position_z` = 56.1042 WHERE `guid` = 24906;
UPDATE `creature` SET `position_x` = -3119.29, `position_y` = -1024.01, `position_z` = 50.4956 WHERE `guid` = 24904;
UPDATE `creature` SET `position_x` = -3190.22, `position_y` = -999.308, `position_z` = 93.2584, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 24870;
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 24912;
UPDATE `creature` SET `position_x` = -2914.34, `position_y` = -1338.66, `position_z` = 87.3399, `orientation` = 1.19466 WHERE `guid` = 24919;
UPDATE `creature` SET `position_x` = -2937.01, `position_y` = -1344.24, `position_z` = 87.3399, `orientation` = 4.50511 WHERE `guid` = 24918;

UPDATE `creature_addon` SET `path_id` = 248750 WHERE `guid` = 24875;
UPDATE `creature_addon` SET `path_id` = 249130 WHERE `guid` = 24913;
UPDATE `creature_addon` SET `path_id` = 249010 WHERE `guid` = 24901;
UPDATE `creature_addon` SET `path_id` = 248700 WHERE `guid` = 24870;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 2952;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 2952;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2952,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bristleback Quilboar - On Respawn - Set Active On ');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 2952;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,2952,0,0,31,1,3,0,24913,0,0,0,'Bristleback Quilboar - Group 0: Execute SAI ID 0 only if has GUID 24913'),
(22,1,2952,0,1,31,1,3,0,24906,0,0,0,'Bristleback Quilboar - Group 1: Execute SAI ID 0 only if has GUID 24906');

DELETE FROM `waypoint_data` WHERE `id` IN (248750,248710,249130,249010,249050,249060,249040,248700);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(248750,1,-2864.9,-1103.2,88.3932,NULL,0,0,0,0,100,0),
(248750,2,-2860.76,-1100.58,88.8974,NULL,0,0,0,0,100,0),
(248750,3,-2856.91,-1098.14,89.4655,NULL,0,0,0,0,100,0),
(248750,4,-2854.69,-1094.99,88.0062,NULL,0,0,0,0,100,0),
(248750,5,-2852.68,-1092.12,85.2319,NULL,0,0,0,0,100,0),
(248750,6,-2850.39,-1088.87,81.1806,NULL,0,0,0,0,100,0),
(248750,7,-2847.98,-1085.44,78.3298,NULL,0,0,0,0,100,0),
(248750,8,-2845.02,-1081.23,77.8781,NULL,0,0,0,0,100,0),
(248750,9,-2841.94,-1076.85,76.7727,NULL,0,0,0,0,100,0),
(248750,10,-2839.07,-1072.76,75.366,NULL,0,0,0,0,100,0),
(248750,11,-2837.12,-1068.13,72.4702,NULL,0,0,0,0,100,0),
(248750,12,-2835.45,-1064.16,70.3932,NULL,0,0,0,0,100,0),
(248750,13,-2836.61,-1057.64,68.6473,NULL,0,0,0,0,100,0),
(248750,14,-2839.87,-1053.67,66.1897,NULL,0,0,0,0,100,0),
(248750,15,-2844.45,-1048.1,61.7566,NULL,0,0,0,0,100,0),
(248750,16,-2849.05,-1042.5,57.6463,NULL,0,0,0,0,100,0),
(248750,17,-2855.85,-1041.36,55.4814,NULL,0,0,0,0,100,0),
(248750,18,-2862.16,-1040.31,54.7271,NULL,0,0,0,0,100,0),
(248750,19,-2867.75,-1043.47,54.5062,NULL,0,0,0,0,100,0),
(248750,20,-2874.13,-1047.08,54.8978,NULL,0,0,0,0,100,0),
(248750,21,-2879.61,-1050.19,54.8047,NULL,0,0,0,0,100,0),
(248750,22,-2882.9,-1053.66,54.66,NULL,0,0,0,0,100,0),
(248750,23,-2885.48,-1056.4,54.5608,NULL,0,0,0,0,100,0),
(248750,24,-2882.9,-1053.66,54.66,NULL,0,0,0,0,100,0),
(248750,25,-2879.61,-1050.19,54.8047,NULL,0,0,0,0,100,0),
(248750,26,-2874.13,-1047.08,54.8978,NULL,0,0,0,0,100,0),
(248750,27,-2867.75,-1043.47,54.5062,NULL,0,0,0,0,100,0),
(248750,28,-2862.16,-1040.31,54.7271,NULL,0,0,0,0,100,0),
(248750,29,-2855.85,-1041.36,55.4814,NULL,0,0,0,0,100,0),
(248750,30,-2849.05,-1042.5,57.6463,NULL,0,0,0,0,100,0),
(248750,31,-2844.45,-1048.1,61.7566,NULL,0,0,0,0,100,0),
(248750,32,-2839.87,-1053.67,66.1897,NULL,0,0,0,0,100,0),
(248750,33,-2836.61,-1057.64,68.6473,NULL,0,0,0,0,100,0),
(248750,34,-2835.45,-1064.16,70.3932,NULL,0,0,0,0,100,0),
(248750,35,-2837.12,-1068.13,72.4702,NULL,0,0,0,0,100,0),
(248750,36,-2839.07,-1072.76,75.366,NULL,0,0,0,0,100,0),
(248750,37,-2841.94,-1076.85,76.7727,NULL,0,0,0,0,100,0),
(248750,38,-2845.02,-1081.23,77.8781,NULL,0,0,0,0,100,0),
(248750,39,-2847.98,-1085.44,78.3298,NULL,0,0,0,0,100,0),
(248750,40,-2850.39,-1088.87,81.1806,NULL,0,0,0,0,100,0),
(248750,41,-2852.68,-1092.12,85.2319,NULL,0,0,0,0,100,0),
(248750,42,-2854.69,-1094.99,88.0062,NULL,0,0,0,0,100,0),
(248750,43,-2856.91,-1098.14,89.4655,NULL,0,0,0,0,100,0),
(248750,44,-2860.76,-1100.58,88.8974,NULL,0,0,0,0,100,0),

(248710,1,-2922.72,-1327.38,87.674,NULL,0,0,0,0,100,0),
(248710,2,-2928.53,-1327.01,88.4051,NULL,0,0,0,0,100,0),
(248710,3,-2934.34,-1326.64,88.5546,NULL,0,0,0,0,100,0),
(248710,4,-2940.96,-1326.21,88.14,NULL,0,0,0,0,100,0),
(248710,5,-2946.49,-1325.85,87.7488,NULL,0,0,0,0,100,0),
(248710,6,-2950.45,-1325.15,87.236,NULL,0,0,0,0,100,0),
(248710,7,-2955.16,-1324.32,85.9247,NULL,0,0,0,0,100,0),
(248710,8,-2961.24,-1323.24,83.4417,NULL,0,0,0,0,100,0),
(248710,9,-2968.2,-1322,81.027,NULL,0,0,0,0,100,0),
(248710,10,-2972.32,-1316.64,78.6247,NULL,0,0,0,0,100,0),
(248710,11,-2975.94,-1311.93,76.5329,NULL,0,0,0,0,100,0),
(248710,12,-2979.99,-1306.65,74.5908,NULL,0,0,0,0,100,0),
(248710,13,-2983.54,-1302.04,72.7087,NULL,0,0,0,0,100,0),
(248710,14,-2982.57,-1295.46,72.2047,NULL,0,0,0,0,100,0),
(248710,15,-2981.34,-1287.13,72.2047,NULL,0,0,0,0,100,0),
(248710,16,-2980.21,-1279.45,72.2045,NULL,0,0,0,0,100,0),
(248710,17,-2981.34,-1287.13,72.2047,NULL,0,0,0,0,100,0),
(248710,18,-2982.57,-1295.46,72.2047,NULL,0,0,0,0,100,0),
(248710,19,-2983.54,-1302.04,72.7087,NULL,0,0,0,0,100,0),
(248710,20,-2979.99,-1306.65,74.5908,NULL,0,0,0,0,100,0),
(248710,21,-2975.94,-1311.93,76.5329,NULL,0,0,0,0,100,0),
(248710,22,-2972.32,-1316.64,78.6247,NULL,0,0,0,0,100,0),
(248710,23,-2968.2,-1322,81.027,NULL,0,0,0,0,100,0),
(248710,24,-2961.24,-1323.24,83.4417,NULL,0,0,0,0,100,0),
(248710,25,-2955.16,-1324.32,85.9247,NULL,0,0,0,0,100,0),
(248710,26,-2950.45,-1325.15,87.236,NULL,0,0,0,0,100,0),
(248710,27,-2946.49,-1325.85,87.7488,NULL,0,0,0,0,100,0),
(248710,28,-2940.96,-1326.21,88.14,NULL,0,0,0,0,100,0),
(248710,29,-2934.34,-1326.64,88.5546,NULL,0,0,0,0,100,0),
(248710,30,-2928.53,-1327.01,88.4051,NULL,0,0,0,0,100,0),

(249130,1,-2939.46,-1266.73,72.2045,NULL,0,0,0,0,100,0),
(249130,2,-2941.99,-1260.57,72.2045,NULL,0,0,0,0,100,0),
(249130,3,-2944.94,-1253.39,72.2005,NULL,0,0,0,0,100,0),
(249130,4,-2948.67,-1249.87,70.942,NULL,0,0,0,0,100,0),
(249130,5,-2952.58,-1246.18,69.1763,NULL,0,0,0,0,100,0),
(249130,6,-2955.72,-1243.21,67.2514,NULL,0,0,0,0,100,0),
(249130,7,-2959.27,-1239.86,64.9502,NULL,0,0,0,0,100,0),
(249130,8,-2963.07,-1239.27,65.0852,NULL,0,0,0,0,100,0),
(249130,9,-2968.38,-1238.44,65.1272,NULL,0,0,0,0,100,0),
(249130,10,-2974.14,-1237.55,64.5556,NULL,0,0,0,0,100,0),
(249130,11,-2981.28,-1236.43,64.3124,NULL,0,0,0,0,100,0),
(249130,12,-2988.43,-1235.32,64.399,NULL,0,0,0,0,100,0),
(249130,13,-2994.07,-1234.44,65.1872,NULL,0,0,0,0,100,0),
(249130,14,-3000.61,-1233.43,66.2842,NULL,0,0,0,0,100,0),
(249130,15,-3009.6,-1232.03,67.1932,NULL,0,0,0,0,100,0),
(249130,16,-3017.46,-1230.81,69.0507,NULL,0,0,0,0,100,0),
(249130,17,-3022.87,-1229.35,70.5804,NULL,0,0,0,0,100,0),
(249130,18,-3030.53,-1227.3,72.9936,NULL,0,0,0,0,100,0),
(249130,19,-3036.37,-1225.73,74.7248,NULL,0,0,0,0,100,0),
(249130,20,-3043.82,-1223.74,76.6465,NULL,0,0,0,0,100,0),
(249130,21,-3051.7,-1221.62,78.7251,NULL,0,0,0,0,100,0),
(249130,22,-3058.8,-1219.72,80.9489,NULL,0,0,0,0,100,0),
(249130,23,-3063.98,-1218.33,82.6992,NULL,0,0,0,0,100,0),
(249130,24,-3070.29,-1216.63,84.8016,NULL,0,0,0,0,100,0),
(249130,25,-3073.54,-1215.76,85.5357,NULL,0,0,0,0,100,0),
(249130,26,-3076.26,-1214.39,86.1047,NULL,0,0,0,0,100,0),
(249130,27,-3080.21,-1212.4,86.4171,NULL,0,0,0,0,100,0),
(249130,28,-3085.62,-1209.66,86.3377,NULL,0,0,0,0,100,0),
(249130,29,-3088.47,-1208.22,85.5211,NULL,0,0,0,0,100,0),
(249130,30,-3085.62,-1209.66,86.3377,NULL,0,0,0,0,100,0),
(249130,31,-3080.21,-1212.4,86.4171,NULL,0,0,0,0,100,0),
(249130,32,-3076.26,-1214.39,86.1047,NULL,0,0,0,0,100,0),
(249130,33,-3073.54,-1215.76,85.5357,NULL,0,0,0,0,100,0),
(249130,34,-3070.29,-1216.63,84.8016,NULL,0,0,0,0,100,0),
(249130,35,-3063.98,-1218.33,82.6992,NULL,0,0,0,0,100,0),
(249130,36,-3058.8,-1219.72,80.9489,NULL,0,0,0,0,100,0),
(249130,37,-3051.7,-1221.62,78.7251,NULL,0,0,0,0,100,0),
(249130,38,-3043.82,-1223.74,76.6465,NULL,0,0,0,0,100,0),
(249130,39,-3036.37,-1225.73,74.7248,NULL,0,0,0,0,100,0),
(249130,40,-3030.53,-1227.3,72.9936,NULL,0,0,0,0,100,0),
(249130,41,-3022.87,-1229.35,70.5804,NULL,0,0,0,0,100,0),
(249130,42,-3017.46,-1230.81,69.0507,NULL,0,0,0,0,100,0),
(249130,43,-3009.6,-1232.03,67.1932,NULL,0,0,0,0,100,0),
(249130,44,-3000.61,-1233.43,66.2842,NULL,0,0,0,0,100,0),
(249130,45,-2994.07,-1234.44,65.1872,NULL,0,0,0,0,100,0),
(249130,46,-2988.43,-1235.32,64.399,NULL,0,0,0,0,100,0),
(249130,47,-2981.28,-1236.43,64.3124,NULL,0,0,0,0,100,0),
(249130,48,-2974.14,-1237.55,64.5556,NULL,0,0,0,0,100,0),
(249130,49,-2968.38,-1238.44,65.1272,NULL,0,0,0,0,100,0),
(249130,50,-2963.07,-1239.27,65.0852,NULL,0,0,0,0,100,0),
(249130,51,-2959.27,-1239.86,64.9502,NULL,0,0,0,0,100,0),
(249130,52,-2955.72,-1243.21,67.2514,NULL,0,0,0,0,100,0),
(249130,53,-2952.58,-1246.18,69.1763,NULL,0,0,0,0,100,0),
(249130,54,-2948.67,-1249.87,70.942,NULL,0,0,0,0,100,0),
(249130,55,-2944.94,-1253.39,72.2005,NULL,0,0,0,0,100,0),
(249130,56,-2941.99,-1260.57,72.2045,NULL,0,0,0,0,100,0),

(249010,1,-3150.8,-1105.22,77.7069,NULL,0,0,0,0,100,0),
(249010,2,-3148.46,-1112.58,80.085,NULL,0,0,0,0,100,0),
(249010,3,-3147.06,-1117,81.4706,NULL,0,0,0,0,100,0),
(249010,4,-3144.43,-1121.27,82.2762,NULL,0,0,0,0,100,0),
(249010,5,-3141.91,-1125.33,83.444,NULL,0,0,0,0,100,0),
(249010,6,-3138.59,-1130.71,85.513,NULL,0,0,0,0,100,0),
(249010,7,-3136.88,-1133.48,86.2201,NULL,0,0,0,0,100,0),
(249010,8,-3133.06,-1137.65,85.5526,NULL,0,0,0,0,100,0),
(249010,9,-3128.97,-1142.12,83.2878,NULL,0,0,0,0,100,0),
(249010,10,-3124.79,-1146.69,80.481,NULL,0,0,0,0,100,0),
(249010,11,-3120.78,-1151.08,78.5907,NULL,0,0,0,0,100,0),
(249010,12,-3117.58,-1154.57,77.6772,NULL,0,0,0,0,100,0),
(249010,13,-3111.51,-1155.75,76.3618,NULL,0,0,0,0,100,0),
(249010,14,-3105.06,-1157.01,75.6511,NULL,0,0,0,0,100,0),
(249010,15,-3101.2,-1155.47,74.6484,NULL,0,0,0,0,100,0),
(249010,16,-3096.32,-1153.52,72.7927,NULL,0,0,0,0,100,0),
(249010,17,-3089.83,-1150.93,70.3937,NULL,0,0,0,0,100,0),
(249010,18,-3083.45,-1148.39,68.3633,NULL,0,0,0,0,100,0),
(249010,19,-3084.35,-1142.98,69.7034,NULL,0,0,0,0,100,0),
(249010,20,-3085.61,-1135.43,73.7658,NULL,0,0,0,0,100,0),
(249010,21,-3086.44,-1130.49,75.1144,NULL,0,0,0,0,100,0),
(249010,22,-3087.22,-1125.78,75.8918,NULL,0,0,0,0,100,0),
(249010,23,-3088.41,-1118.65,76.6932,NULL,0,0,0,0,100,0),
(249010,24,-3089.57,-1111.69,76.6578,NULL,0,0,0,0,100,0),
(249010,25,-3087.32,-1105.81,75.9582,NULL,0,0,0,0,100,0),
(249010,26,-3085.03,-1099.82,74.9303,NULL,0,0,0,0,100,0),
(249010,27,-3083.15,-1094.92,74.8528,NULL,0,0,0,0,100,0),
(249010,28,-3085.03,-1099.82,74.9303,NULL,0,0,0,0,100,0),
(249010,29,-3087.32,-1105.81,75.9582,NULL,0,0,0,0,100,0),
(249010,30,-3089.57,-1111.69,76.6578,NULL,0,0,0,0,100,0),
(249010,31,-3088.41,-1118.65,76.6932,NULL,0,0,0,0,100,0),
(249010,32,-3087.22,-1125.78,75.8918,NULL,0,0,0,0,100,0),
(249010,33,-3086.44,-1130.49,75.1144,NULL,0,0,0,0,100,0),
(249010,34,-3085.61,-1135.43,73.7658,NULL,0,0,0,0,100,0),
(249010,35,-3084.35,-1142.98,69.7034,NULL,0,0,0,0,100,0),
(249010,36,-3083.45,-1148.39,68.3633,NULL,0,0,0,0,100,0),
(249010,37,-3089.83,-1150.93,70.3937,NULL,0,0,0,0,100,0),
(249010,38,-3096.32,-1153.52,72.7927,NULL,0,0,0,0,100,0),
(249010,39,-3101.2,-1155.47,74.6484,NULL,0,0,0,0,100,0),
(249010,40,-3105.06,-1157.01,75.6511,NULL,0,0,0,0,100,0),
(249010,41,-3111.51,-1155.75,76.3618,NULL,0,0,0,0,100,0),
(249010,42,-3117.58,-1154.57,77.6772,NULL,0,0,0,0,100,0),
(249010,43,-3120.78,-1151.08,78.5907,NULL,0,0,0,0,100,0),
(249010,44,-3124.79,-1146.69,80.481,NULL,0,0,0,0,100,0),
(249010,45,-3128.97,-1142.12,83.2878,NULL,0,0,0,0,100,0),
(249010,46,-3133.06,-1137.65,85.5526,NULL,0,0,0,0,100,0),
(249010,47,-3136.88,-1133.48,86.2201,NULL,0,0,0,0,100,0),
(249010,48,-3138.59,-1130.71,85.513,NULL,0,0,0,0,100,0),
(249010,49,-3141.91,-1125.33,83.444,NULL,0,0,0,0,100,0),
(249010,50,-3144.43,-1121.27,82.2762,NULL,0,0,0,0,100,0),
(249010,51,-3147.06,-1117,81.4706,NULL,0,0,0,0,100,0),
(249010,52,-3148.46,-1112.58,80.085,NULL,0,0,0,0,100,0),

(249050,1,-2966.63,-1166.78,59.9851,NULL,0,0,0,0,100,0),
(249050,2,-2970.72,-1163.92,59.8698,NULL,0,0,0,0,100,0),
(249050,3,-2975.22,-1160.78,59.4004,NULL,0,0,0,0,100,0),
(249050,4,-2979.6,-1157.72,58.8996,NULL,0,0,0,0,100,0),
(249050,5,-2986.11,-1159.59,58.8438,NULL,0,0,0,0,100,0),
(249050,6,-2993.39,-1161.69,59.3159,NULL,0,0,0,0,100,0),
(249050,7,-2999.68,-1163.49,59.5801,NULL,0,0,0,0,100,0),
(249050,8,-3006.51,-1165.46,59.486,NULL,0,0,0,0,100,0),
(249050,9,-3013.8,-1167.55,59.9571,NULL,0,0,0,0,100,0),
(249050,10,-3018.72,-1168.97,60.8071,NULL,0,0,0,0,100,0),
(249050,11,-3023.59,-1170.37,61.4485,NULL,0,0,0,0,100,0),
(249050,12,-3029.89,-1170.45,61.9224,NULL,0,0,0,0,100,0),
(249050,13,-3037.12,-1170.55,62.6985,NULL,0,0,0,0,100,0),
(249050,14,-3044.69,-1170.65,63.6046,NULL,0,0,0,0,100,0),
(249050,15,-3050.29,-1165.03,63.5649,NULL,0,0,0,0,100,0),
(249050,16,-3056.1,-1159.19,63.7142,NULL,0,0,0,0,100,0),
(249050,17,-3056.95,-1154.42,63.8425,NULL,0,0,0,0,100,0),
(249050,18,-3058.24,-1147.19,63.0673,NULL,0,0,0,0,100,0),
(249050,19,-3059.58,-1139.68,62.4035,NULL,0,0,0,0,100,0),
(249050,20,-3056.99,-1133.57,61.8424,NULL,0,0,0,0,100,0),
(249050,21,-3054.85,-1128.52,60.9906,NULL,0,0,0,0,100,0),
(249050,22,-3052.03,-1121.85,59.4318,NULL,0,0,0,0,100,0),
(249050,23,-3049.44,-1115.73,58.1135,NULL,0,0,0,0,100,0),
(249050,24,-3046.48,-1108.75,56.7597,NULL,0,0,0,0,100,0),
(249050,25,-3043.39,-1101.45,55.0071,NULL,0,0,0,0,100,0),
(249050,26,-3040.48,-1094.57,54.0979,NULL,0,0,0,0,100,0),
(249050,27,-3037.65,-1087.9,53.486,NULL,0,0,0,0,100,0),
(249050,28,-3034.77,-1081.09,52.8879,NULL,0,0,0,0,100,0),
(249050,29,-3035.34,-1075.88,52.2556,NULL,0,0,0,0,100,0),
(249050,30,-3036.12,-1068.69,50.7571,NULL,0,0,0,0,100,0),
(249050,31,-3037,-1060.68,49.7245,NULL,0,0,0,0,100,0),
(249050,32,-3037.83,-1053.03,49.2103,NULL,0,0,0,0,100,0),
(249050,33,-3038.62,-1045.77,49.1123,NULL,0,0,0,0,100,0),
(249050,34,-3044.61,-1044.83,49.1123,NULL,0,0,0,0,100,0),
(249050,35,-3051.75,-1043.7,49.1123,NULL,0,0,0,0,100,0),
(249050,36,-3059.93,-1042.41,49.1123,NULL,0,0,0,0,100,0),
(249050,37,-3069.84,-1040.85,49.1123,NULL,0,0,0,0,100,0),
(249050,38,-3080.2,-1039.22,49.1123,NULL,0,0,0,0,100,0),
(249050,39,-3089.53,-1037.75,49.3923,NULL,0,0,0,0,100,0),
(249050,40,-3100.02,-1036.09,49.8939,NULL,0,0,0,0,100,0),
(249050,41,-3108.43,-1034.77,49.919,NULL,0,0,0,0,100,0),
(249050,42,-3115.56,-1033.64,49.7501,NULL,0,0,0,0,100,0),
(249050,43,-3114.04,-1038.45,50.1151,NULL,0,0,0,0,100,0),
(249050,44,-3112.15,-1044.46,52.3189,NULL,0,0,0,0,100,0),
(249050,45,-3110.5,-1049.69,54.7152,NULL,0,0,0,0,100,0),
(249050,46,-3108.37,-1056.47,57.3563,NULL,0,0,0,0,100,0),
(249050,47,-3105.99,-1064.03,60.1283,NULL,0,0,0,0,100,0),
(249050,48,-3103.92,-1070.59,62.1912,NULL,0,0,0,0,100,0),
(249050,49,-3102.59,-1074.82,63.5021,NULL,0,0,0,0,100,0),
(249050,50,-3101.05,-1079.72,66.3465,NULL,0,0,0,0,100,0),
(249050,51,-3099.29,-1085.29,69.0104,NULL,0,0,0,0,100,0),
(249050,52,-3097.58,-1090.74,70.9276,NULL,0,0,0,0,100,0),
(249050,53,-3095.97,-1095.86,72.6115,NULL,0,0,0,0,100,0),
(249050,54,-3094.48,-1100.59,74.3966,NULL,0,0,0,0,100,0),
(249050,55,-3094.44,-1105.71,75.6876,NULL,0,0,0,0,100,0),
(249050,56,-3094.39,-1111.66,76.6548,NULL,0,0,0,0,100,0),
(249050,57,-3094.35,-1117.14,77.3697,NULL,0,0,0,0,100,0),
(249050,58,-3094.3,-1122.81,77.4384,NULL,0,0,0,0,100,0),
(249050,59,-3091.27,-1126.96,77.0518,NULL,0,0,0,0,100,0),
(249050,60,-3088.23,-1131.1,75.6881,NULL,0,0,0,0,100,0),
(249050,61,-3085.41,-1134.95,73.7675,NULL,0,0,0,0,100,0),
(249050,62,-3082.37,-1139.09,70.1544,NULL,0,0,0,0,100,0),
(249050,63,-3079.4,-1143.14,67.1669,NULL,0,0,0,0,100,0),
(249050,64,-3075.72,-1148.17,65.7634,NULL,0,0,0,0,100,0),
(249050,65,-3070.32,-1153.5,66.3536,NULL,0,0,0,0,100,0),
(249050,66,-3065.85,-1157.92,66.3525,NULL,0,0,0,0,100,0),
(249050,67,-3062.28,-1160.07,65.5722,NULL,0,0,0,0,100,0),
(249050,68,-3057.58,-1162.9,64.2773,NULL,0,0,0,0,100,0),
(249050,69,-3050.48,-1167.17,63.8276,NULL,0,0,0,0,100,0),
(249050,70,-3044.69,-1170.65,63.6046,NULL,0,0,0,0,100,0),
(249050,71,-3037.12,-1170.55,62.6985,NULL,0,0,0,0,100,0),
(249050,72,-3029.89,-1170.45,61.9224,NULL,0,0,0,0,100,0),
(249050,73,-3023.59,-1170.37,61.4485,NULL,0,0,0,0,100,0),
(249050,74,-3018.72,-1168.97,60.8071,NULL,0,0,0,0,100,0),
(249050,75,-3013.8,-1167.55,59.9571,NULL,0,0,0,0,100,0),
(249050,76,-3006.51,-1165.46,59.486,NULL,0,0,0,0,100,0),
(249050,77,-2999.68,-1163.49,59.5801,NULL,0,0,0,0,100,0),
(249050,78,-2993.39,-1161.69,59.3159,NULL,0,0,0,0,100,0),
(249050,79,-2986.11,-1159.59,58.8438,NULL,0,0,0,0,100,0),
(249050,80,-2979.6,-1157.72,58.8996,NULL,0,0,0,0,100,0),
(249050,81,-2975.22,-1160.78,59.4004,NULL,0,0,0,0,100,0),
(249050,82,-2970.72,-1163.92,59.8698,NULL,0,0,0,0,100,0),

(249060,1,-2961.71,-1011.22,56.1042,NULL,0,0,0,0,100,0),
(249060,2,-2965.52,-1013.49,55.6283,NULL,0,0,0,0,100,0),
(249060,3,-2972.14,-1017.42,54.6977,NULL,0,0,0,0,100,0),
(249060,4,-2977.33,-1020.49,55.1358,NULL,0,0,0,0,100,0),
(249060,5,-2981.95,-1023.23,55.1227,NULL,0,0,0,0,100,0),
(249060,6,-2987.65,-1026.61,54.3077,NULL,0,0,0,0,100,0),
(249060,7,-2993.35,-1027.82,53.9952,NULL,0,0,0,0,100,0),
(249060,8,-2999.24,-1029.06,54.2998,NULL,0,0,0,0,100,0),
(249060,9,-3004.6,-1030.19,54.2509,NULL,0,0,0,0,100,0),
(249060,10,-3008.5,-1031.01,53.9272,NULL,0,0,0,0,100,0),
(249060,11,-3012.97,-1033.02,53.1727,NULL,0,0,0,0,100,0),
(249060,12,-3017.85,-1035.22,51.8888,NULL,0,0,0,0,100,0),
(249060,13,-3022.32,-1037.23,50.3298,NULL,0,0,0,0,100,0),
(249060,14,-3026.79,-1039.24,49.3721,NULL,0,0,0,0,100,0),
(249060,15,-3035.39,-1043.11,49.1111,NULL,0,0,0,0,100,0),
(249060,16,-3042.27,-1041.25,49.1111,NULL,0,0,0,0,100,0),
(249060,17,-3049.93,-1039.18,49.1111,NULL,0,0,0,0,100,0),
(249060,18,-3059.62,-1036.56,49.1119,NULL,0,0,0,0,100,0),
(249060,19,-3069.11,-1033.99,49.2538,NULL,0,0,0,0,100,0),
(249060,20,-3076.46,-1033.72,49.3187,NULL,0,0,0,0,100,0),
(249060,21,-3085.9,-1033.36,49.378,NULL,0,0,0,0,100,0),
(249060,22,-3094.06,-1033.05,49.8587,NULL,0,0,0,0,100,0),
(249060,23,-3101.87,-1032.76,50.1385,NULL,0,0,0,0,100,0),
(249060,24,-3107.84,-1032.54,50.2409,NULL,0,0,0,0,100,0),
(249060,25,-3114.07,-1037.06,49.7748,NULL,0,0,0,0,100,0),
(249060,26,-3118.88,-1040.55,51.0962,NULL,0,0,0,0,100,0),
(249060,27,-3122.75,-1043.36,52.1621,NULL,0,0,0,0,100,0),
(249060,28,-3126.9,-1046.37,52.9013,NULL,0,0,0,0,100,0),
(249060,29,-3131.81,-1049.93,53.2362,NULL,0,0,0,0,100,0),
(249060,30,-3137.85,-1054.32,53.5268,NULL,0,0,0,0,100,0),
(249060,31,-3143.24,-1058.23,55.5199,NULL,0,0,0,0,100,0),
(249060,32,-3147.11,-1061.04,57.0276,NULL,0,0,0,0,100,0),
(249060,33,-3151.08,-1063.92,58.0836,NULL,0,0,0,0,100,0),
(249060,34,-3154.76,-1066.59,58.5145,NULL,0,0,0,0,100,0),
(249060,35,-3158.63,-1069.4,58.321,NULL,0,0,0,0,100,0),
(249060,36,-3162.59,-1072.28,58.9452,NULL,0,0,0,0,100,0),
(249060,37,-3166.18,-1074.88,60.9097,NULL,0,0,0,0,100,0),
(249060,38,-3169.66,-1077.41,62.8178,NULL,0,0,0,0,100,0),
(249060,39,-3173.86,-1077.33,64.0863,NULL,0,0,0,0,100,0),
(249060,40,-3179.35,-1077.23,65.385,NULL,0,0,0,0,100,0),
(249060,41,-3184.83,-1077.13,66.1849,NULL,0,0,0,0,100,0),
(249060,42,-3190.67,-1077.02,66.9932,NULL,0,0,0,0,100,0),
(249060,43,-3196.38,-1076.91,69.9194,NULL,0,0,0,0,100,0),
(249060,44,-3200.25,-1076.84,72.6998,NULL,0,0,0,0,100,0),
(249060,45,-3204.91,-1076.75,75.463,NULL,0,0,0,0,100,0),
(249060,46,-3209.81,-1076.66,78.2453,NULL,0,0,0,0,100,0),
(249060,47,-3215.29,-1076.56,81.2962,NULL,0,0,0,0,100,0),
(249060,48,-3221.13,-1076.45,85.021,NULL,0,0,0,0,100,0),
(249060,49,-3226.14,-1076.36,88.7119,NULL,0,0,0,0,100,0),
(249060,50,-3230.8,-1076.27,92.2095,NULL,0,0,0,0,100,0),
(249060,51,-3235,-1076.19,95.2607,NULL,0,0,0,0,100,0),
(249060,52,-3238.54,-1076.13,97.7179,NULL,0,0,0,0,100,0),
(249060,53,-3242.76,-1073.87,100.276,NULL,0,0,0,0,100,0),
(249060,54,-3247.28,-1071.46,103.199,NULL,0,0,0,0,100,0),
(249060,55,-3251.91,-1068.98,106.353,NULL,0,0,0,0,100,0),
(249060,56,-3256.54,-1066.51,109.078,NULL,0,0,0,0,100,0),
(249060,57,-3259.5,-1063.19,110.596,NULL,0,0,0,0,100,0),
(249060,58,-3263.07,-1059.18,112.177,NULL,0,0,0,0,100,0),
(249060,59,-3267.5,-1054.21,113.792,NULL,0,0,0,0,100,0),
(249060,60,-3271.14,-1050.14,114.144,NULL,0,0,0,0,100,0),
(249060,61,-3267.5,-1054.21,113.792,NULL,0,0,0,0,100,0),
(249060,62,-3263.07,-1059.18,112.177,NULL,0,0,0,0,100,0),
(249060,63,-3259.5,-1063.19,110.596,NULL,0,0,0,0,100,0),
(249060,64,-3256.54,-1066.51,109.078,NULL,0,0,0,0,100,0),
(249060,65,-3251.91,-1068.98,106.353,NULL,0,0,0,0,100,0),
(249060,66,-3247.28,-1071.46,103.199,NULL,0,0,0,0,100,0),
(249060,67,-3242.76,-1073.87,100.276,NULL,0,0,0,0,100,0),
(249060,68,-3238.54,-1076.13,97.7179,NULL,0,0,0,0,100,0),
(249060,69,-3235,-1076.19,95.2607,NULL,0,0,0,0,100,0),
(249060,70,-3230.8,-1076.27,92.2095,NULL,0,0,0,0,100,0),
(249060,71,-3226.14,-1076.36,88.7119,NULL,0,0,0,0,100,0),
(249060,72,-3221.13,-1076.45,85.021,NULL,0,0,0,0,100,0),
(249060,73,-3215.29,-1076.56,81.2962,NULL,0,0,0,0,100,0),
(249060,74,-3209.81,-1076.66,78.2453,NULL,0,0,0,0,100,0),
(249060,75,-3204.91,-1076.75,75.463,NULL,0,0,0,0,100,0),
(249060,76,-3200.25,-1076.84,72.6998,NULL,0,0,0,0,100,0),
(249060,77,-3196.38,-1076.91,69.9194,NULL,0,0,0,0,100,0),
(249060,78,-3190.67,-1077.02,66.9932,NULL,0,0,0,0,100,0),
(249060,79,-3184.83,-1077.13,66.1849,NULL,0,0,0,0,100,0),
(249060,80,-3179.35,-1077.23,65.385,NULL,0,0,0,0,100,0),
(249060,81,-3173.86,-1077.33,64.0863,NULL,0,0,0,0,100,0),
(249060,82,-3169.66,-1077.41,62.8178,NULL,0,0,0,0,100,0),
(249060,83,-3166.18,-1074.88,60.9097,NULL,0,0,0,0,100,0),
(249060,84,-3162.59,-1072.28,58.9452,NULL,0,0,0,0,100,0),
(249060,85,-3158.63,-1069.4,58.321,NULL,0,0,0,0,100,0),
(249060,86,-3154.76,-1066.59,58.5145,NULL,0,0,0,0,100,0),
(249060,87,-3151.08,-1063.92,58.0836,NULL,0,0,0,0,100,0),
(249060,88,-3147.11,-1061.04,57.0276,NULL,0,0,0,0,100,0),
(249060,89,-3143.24,-1058.23,55.5199,NULL,0,0,0,0,100,0),
(249060,90,-3137.85,-1054.32,53.5268,NULL,0,0,0,0,100,0),
(249060,91,-3131.81,-1049.93,53.2362,NULL,0,0,0,0,100,0),
(249060,92,-3126.9,-1046.37,52.9013,NULL,0,0,0,0,100,0),
(249060,93,-3122.75,-1043.36,52.1621,NULL,0,0,0,0,100,0),
(249060,94,-3118.88,-1040.55,51.0962,NULL,0,0,0,0,100,0),
(249060,95,-3114.07,-1037.06,49.7748,NULL,0,0,0,0,100,0),
(249060,96,-3107.84,-1032.54,50.2409,NULL,0,0,0,0,100,0),
(249060,97,-3101.87,-1032.76,50.1385,NULL,0,0,0,0,100,0),
(249060,98,-3094.06,-1033.05,49.8587,NULL,0,0,0,0,100,0),
(249060,99,-3085.9,-1033.36,49.378,NULL,0,0,0,0,100,0),
(249060,100,-3076.46,-1033.72,49.3187,NULL,0,0,0,0,100,0),
(249060,101,-3069.11,-1033.99,49.2538,NULL,0,0,0,0,100,0),
(249060,102,-3059.62,-1036.56,49.1119,NULL,0,0,0,0,100,0),
(249060,103,-3049.93,-1039.18,49.1111,NULL,0,0,0,0,100,0),
(249060,104,-3042.27,-1041.25,49.1111,NULL,0,0,0,0,100,0),
(249060,105,-3035.39,-1043.11,49.1111,NULL,0,0,0,0,100,0),
(249060,106,-3026.79,-1039.24,49.3721,NULL,0,0,0,0,100,0),
(249060,107,-3022.32,-1037.23,50.3298,NULL,0,0,0,0,100,0),
(249060,108,-3017.85,-1035.22,51.8888,NULL,0,0,0,0,100,0),
(249060,109,-3012.97,-1033.02,53.1727,NULL,0,0,0,0,100,0),
(249060,110,-3008.5,-1031.01,53.9272,NULL,0,0,0,0,100,0),
(249060,111,-3004.6,-1030.19,54.2509,NULL,0,0,0,0,100,0),
(249060,112,-2999.24,-1029.06,54.2998,NULL,0,0,0,0,100,0),
(249060,113,-2993.35,-1027.82,53.9952,NULL,0,0,0,0,100,0),
(249060,114,-2987.65,-1026.61,54.3077,NULL,0,0,0,0,100,0),
(249060,115,-2981.95,-1023.23,55.1227,NULL,0,0,0,0,100,0),
(249060,116,-2977.33,-1020.49,55.1358,NULL,0,0,0,0,100,0),
(249060,117,-2972.14,-1017.42,54.6977,NULL,0,0,0,0,100,0),
(249060,118,-2965.52,-1013.49,55.6283,NULL,0,0,0,0,100,0),

(249040,1,-3119.29,-1024.01,50.4956,NULL,0,0,0,0,100,0),
(249040,2,-3123.79,-1019.65,50.4785,NULL,0,0,0,0,100,0),
(249040,3,-3125.3,-1018.19,51.2435,NULL,0,0,0,0,100,0),
(249040,4,-3129.41,-1014.21,51.4827,NULL,0,0,0,0,100,0),
(249040,5,-3133.63,-1010.14,51.2909,NULL,0,0,0,0,100,0),
(249040,6,-3138.32,-1007.11,49.8446,NULL,0,0,0,0,100,0),
(249040,7,-3141.75,-1004.9,49.9033,NULL,0,0,0,0,100,0),
(249040,8,-3145.19,-1002.69,50.6527,NULL,0,0,0,0,100,0),
(249040,9,-3148.54,-1000.53,50.8472,NULL,0,0,0,0,100,0),
(249040,10,-3151.05,-996.883,50.8384,NULL,0,0,0,0,100,0),
(249040,11,-3155.09,-991.022,49.8552,NULL,0,0,0,0,100,0),
(249040,12,-3158.86,-985.556,49.6734,NULL,0,0,0,0,100,0),
(249040,13,-3159.79,-980.033,50.2608,NULL,0,0,0,0,100,0),
(249040,14,-3160.82,-973.812,50.957,NULL,0,0,0,0,100,0),
(249040,15,-3161.99,-966.867,51.3463,NULL,0,0,0,0,100,0),
(249040,16,-3165.17,-963.133,50.1772,NULL,0,0,0,0,100,0),
(249040,17,-3168.5,-959.229,49.3372,NULL,0,0,0,0,100,0),
(249040,18,-3172.13,-954.973,50.0055,NULL,0,0,0,0,100,0),
(249040,19,-3175.23,-951.335,50.4285,NULL,0,0,0,0,100,0),
(249040,20,-3178.65,-947.329,50.098,NULL,0,0,0,0,100,0),
(249040,21,-3181.75,-943.691,51.3669,NULL,0,0,0,0,100,0),
(249040,22,-3186.97,-937.571,51.4642,NULL,0,0,0,0,100,0),
(249040,23,-3191.37,-932.408,52.4554,NULL,0,0,0,0,100,0),
(249040,24,-3186.97,-937.571,51.4642,NULL,0,0,0,0,100,0),
(249040,25,-3181.75,-943.691,51.3669,NULL,0,0,0,0,100,0),
(249040,26,-3178.65,-947.329,50.098,NULL,0,0,0,0,100,0),
(249040,27,-3175.23,-951.335,50.4285,NULL,0,0,0,0,100,0),
(249040,28,-3172.13,-954.973,50.0055,NULL,0,0,0,0,100,0),
(249040,29,-3168.5,-959.229,49.3372,NULL,0,0,0,0,100,0),
(249040,30,-3165.17,-963.133,50.1772,NULL,0,0,0,0,100,0),
(249040,31,-3161.99,-966.867,51.3463,NULL,0,0,0,0,100,0),
(249040,32,-3160.82,-973.812,50.957,NULL,0,0,0,0,100,0),
(249040,33,-3159.79,-980.033,50.2608,NULL,0,0,0,0,100,0),
(249040,34,-3158.86,-985.556,49.6734,NULL,0,0,0,0,100,0),
(249040,35,-3155.09,-991.022,49.8552,NULL,0,0,0,0,100,0),
(249040,36,-3151.05,-996.883,50.8384,NULL,0,0,0,0,100,0),
(249040,37,-3148.54,-1000.53,50.8472,NULL,0,0,0,0,100,0),
(249040,38,-3145.19,-1002.69,50.6527,NULL,0,0,0,0,100,0),
(249040,39,-3141.75,-1004.9,49.9033,NULL,0,0,0,0,100,0),
(249040,40,-3138.32,-1007.11,49.8446,NULL,0,0,0,0,100,0),
(249040,41,-3133.63,-1010.14,51.2909,NULL,0,0,0,0,100,0),
(249040,42,-3129.41,-1014.21,51.4827,NULL,0,0,0,0,100,0),
(249040,43,-3125.3,-1018.19,51.2435,NULL,0,0,0,0,100,0),
(249040,44,-3123.79,-1019.65,50.4785,NULL,0,0,0,0,100,0),

(248700,1,-3190.22,-999.308,93.2584,2.00362,10000,0,0,0,100,0),
(248700,2,-3183.41,-997.185,93.233,NULL,0,0,0,0,100,0),
(248700,3,-3174.73,-994.475,93.1381,NULL,0,0,0,0,100,0),
(248700,4,-3168.52,-992.537,93.2186,NULL,0,0,0,0,100,0),
(248700,5,-3162.27,-988.482,93.2311,NULL,0,0,0,0,100,0),
(248700,6,-3155.42,-984.043,93.1025,NULL,0,0,0,0,100,0),
(248700,7,-3149.72,-980.35,93.2617,NULL,0,0,0,0,100,0),
(248700,8,-3147.17,-973.576,93.2617,NULL,0,0,0,0,100,0),
(248700,9,-3144.29,-965.938,93.4081,NULL,0,0,0,0,100,0),
(248700,10,-3141.83,-959.411,93.2638,2.03111,10000,0,0,0,100,0),
(248700,11,-3133.51,-960.504,93.2968,NULL,0,0,0,0,100,0),
(248700,12,-3124.6,-961.672,93.3012,NULL,0,0,0,0,100,0),
(248700,13,-3117.5,-962.605,93.3051,NULL,0,0,0,0,100,0),
(248700,14,-3111.72,-963.363,93.4482,NULL,0,0,0,0,100,0),
(248700,15,-3107.33,-963.939,93.4164,NULL,0,0,0,0,100,0),
(248700,16,-3101.56,-959.8,93.6136,NULL,0,0,0,0,100,0),
(248700,17,-3097.31,-956.76,93.597,NULL,0,0,0,0,100,0),
(248700,18,-3090.96,-952.211,93.4172,NULL,0,0,0,0,100,0),
(248700,19,-3083.66,-946.98,93.2913,NULL,0,0,0,0,100,0),
(248700,20,-3076.74,-942.019,93.2596,NULL,0,0,0,0,100,0),
(248700,21,-3070.66,-937.668,93.2633,NULL,0,0,0,0,100,0),
(248700,22,-3071.42,-929.422,93.3011,NULL,0,0,0,0,100,0),
(248700,23,-3072.3,-919.781,93.2632,NULL,0,0,0,0,100,0),
(248700,24,-3073.05,-911.602,93.2665,1.76408,10000,0,0,0,100,0),
(248700,25,-3072.3,-919.781,93.2632,NULL,0,0,0,0,100,0),
(248700,26,-3071.42,-929.422,93.3011,NULL,0,0,0,0,100,0),
(248700,27,-3070.66,-937.668,93.2633,NULL,0,0,0,0,100,0),
(248700,28,-3076.74,-942.019,93.2596,NULL,0,0,0,0,100,0),
(248700,29,-3083.66,-946.98,93.2913,NULL,0,0,0,0,100,0),
(248700,30,-3090.96,-952.211,93.4172,NULL,0,0,0,0,100,0),
(248700,31,-3097.31,-956.76,93.597,NULL,0,0,0,0,100,0),
(248700,32,-3101.56,-959.8,93.6136,NULL,0,0,0,0,100,0),
(248700,33,-3107.33,-963.939,93.4164,NULL,0,0,0,0,100,0),
(248700,34,-3111.72,-963.363,93.4482,NULL,0,0,0,0,100,0),
(248700,35,-3117.5,-962.605,93.3051,NULL,0,0,0,0,100,0),
(248700,36,-3124.6,-961.672,93.3012,NULL,0,0,0,0,100,0),
(248700,37,-3133.51,-960.504,93.2968,NULL,0,0,0,0,100,0),
(248700,38,-3141.83,-959.411,93.2638,2.03111,10000,0,0,0,100,0),
(248700,39,-3144.29,-965.938,93.4081,NULL,0,0,0,0,100,0),
(248700,40,-3147.17,-973.576,93.2617,NULL,0,0,0,0,100,0),
(248700,41,-3149.72,-980.35,93.2617,NULL,0,0,0,0,100,0),
(248700,42,-3155.42,-984.043,93.1025,NULL,0,0,0,0,100,0),
(248700,43,-3162.27,-988.482,93.2311,NULL,0,0,0,0,100,0),
(248700,44,-3168.52,-992.537,93.2186,NULL,0,0,0,0,100,0),
(248700,45,-3174.73,-994.475,93.1381,NULL,0,0,0,0,100,0),
(248700,46,-3183.41,-997.185,93.233,NULL,0,0,0,0,100,0);