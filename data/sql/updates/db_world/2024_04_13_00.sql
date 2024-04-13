UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `guid` IN (4203,4204);
UPDATE `creature` SET `position_x` = -10499, `position_y` = -1160.5, `position_z` = 28.0865, `orientation` = 1.70857 WHERE `guid` = 4192;

UPDATE `creature_addon` SET `bytes2` = 1 WHERE `guid` IN (4230,5965,4185,5941);
UPDATE `creature_addon` SET `path_id` = 42030 WHERE `guid` = 4203;
UPDATE `creature_addon` SET `path_id` = 42040 WHERE `guid` = 4204;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 272;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 272;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 27200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(272,0,0,0,34,0,100,0,2,2,0,0,0,80,27200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chef Grual - On WP 3 Reached - Call Timed Action List'),
(272,0,1,0,34,0,100,0,2,4,0,0,0,80,27200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chef Grual - On WP 5 Reached - Call Timed Action List'),

(27200,9,0,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chef Grual - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(27200,9,1,0,0,0,100,0,7000,7000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chef Grual - On Script - Remove ''UNIT_STAND_STATE_KNEEL''');

DELETE FROM `waypoint_data` WHERE `id` IN (42300,59410,42030,42040,41920);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
-- Chef Grual
(41920,1,-10499,-1160.5,28.0865,NULL,0,0,0,0,100,0),
(41920,2,-10499.3,-1157.98,28.0865,1.68921,90000,0,0,0,100,0),
(41920,3,-10494.7,-1160.11,28.3771,0.097992,10000,0,0,0,100,0),
(41920,4,-10499.3,-1157.98,28.0865,1.68921,90000,0,0,0,100,0),
(41920,5,-10498.8,-1161.3,28.0865,4.85156,10000,0,0,0,100,0),
(41920,6,-10499.3,-1157.98,28.0865,1.68921,90000,0,0,0,100,0),
(41920,7,-10503.1,-1161.18,28.087,NULL,0,0,0,0,100,0),
(41920,8,-10508.2,-1162.02,28.0995,NULL,0,0,0,0,100,0),
(41920,9,-10509.7,-1160.2,28.0995,NULL,6000,0,0,0,100,0),
(41920,10,-10508.2,-1162.02,28.0995,NULL,0,0,0,0,100,0),
(41920,11,-10503.1,-1161.18,28.087,NULL,0,0,0,0,100,0),
-- Avette Fellwood
(42040,1,-10517.2,-1138.53,26.2808,0.00819,60000,0,0,0,100,0),
(42040,2,-10519.9,-1141.91,26.7052,NULL,0,0,0,0,100,0),
(42040,3,-10522.4,-1145.08,27.7095,1.6184,60000,0,0,0,100,0),
(42040,4,-10519.9,-1141.91,26.7037,NULL,0,0,0,0,100,0),
-- Mabel Solaj
(42030,1,-10523.2,-1170.43,27.4773,4.89115,60000,0,0,0,100,0),
(42030,2,-10524.3,-1164.62,27.4766,NULL,0,0,0,0,100,0),
(42030,3,-10527.3,-1164.84,27.5275,NULL,0,0,0,0,100,0),
(42030,4,-10529.1,-1164.97,28.1042,NULL,0,0,0,0,100,0),
(42030,5,-10531.1,-1165.12,28.1042,NULL,0,0,0,0,100,0),
(42030,6,-10531.9,-1156.81,28.1037,4.86947,60000,0,0,0,100,0),
(42030,7,-10531.1,-1165.12,28.1042,NULL,0,0,0,0,100,0),
(42030,8,-10529.1,-1164.97,28.1042,NULL,0,0,0,0,100,0),
(42030,9,-10527.3,-1164.84,27.5275,NULL,0,0,0,0,100,0),
(42030,10,-10524.3,-1164.62,27.4766,NULL,0,0,0,0,100,0),
-- Watcher Jordan
(59410,1,-10611.1,-1181.46,28.4454,NULL,2000,0,0,0,100,0),
(59410,2,-10617.8,-1183.22,28.5542,NULL,0,0,0,0,100,0),
(59410,3,-10623.7,-1184.8,28.8543,NULL,0,0,0,0,100,0),
(59410,4,-10630.1,-1186.48,29.0138,NULL,0,0,0,0,100,0),
(59410,5,-10636.9,-1188.3,28.7447,NULL,0,0,0,0,100,0),
(59410,6,-10643.5,-1190.03,28.5336,NULL,0,0,0,0,100,0),
(59410,7,-10649.3,-1191.58,28.5744,NULL,0,0,0,0,100,0),
(59410,8,-10657,-1193.62,28.4789,NULL,0,0,0,0,100,0),
(59410,9,-10663.1,-1192.72,28.2104,NULL,0,0,0,0,100,0),
(59410,10,-10670.2,-1191.69,27.8279,NULL,0,0,0,0,100,0),
(59410,11,-10677.2,-1190.65,27.4854,NULL,0,0,0,0,100,0),
(59410,12,-10684.6,-1189.57,27.3391,NULL,0,0,0,0,100,0),
(59410,13,-10689.7,-1186.33,27.1975,NULL,0,0,0,0,100,0),
(59410,14,-10695.3,-1182.85,26.7807,NULL,0,0,0,0,100,0),
(59410,15,-10701.2,-1179.13,26.5259,NULL,0,0,0,0,100,0),
(59410,16,-10707.2,-1175.34,26.4398,NULL,0,0,0,0,100,0),
(59410,17,-10713.8,-1171.18,26.6217,NULL,0,0,0,0,100,0),
(59410,18,-10720.1,-1167.2,26.504,NULL,0,0,0,0,100,0),
(59410,19,-10726.5,-1163.22,26.7243,NULL,0,0,0,0,100,0),
(59410,20,-10731.8,-1159.86,26.9488,NULL,0,0,0,0,100,0),
(59410,21,-10737.1,-1156.5,26.5973,NULL,0,0,0,0,100,0),
(59410,22,-10742.8,-1152.9,26.4428,NULL,0,0,0,0,100,0),
(59410,23,-10748,-1149.67,26.7551,NULL,0,0,0,0,100,0),
(59410,24,-10753.1,-1146.43,26.8454,NULL,0,0,0,0,100,0),
(59410,25,-10758.1,-1143.26,26.9714,NULL,0,0,0,0,100,0),
(59410,26,-10762.9,-1140.28,27.0673,NULL,0,0,0,0,100,0),
(59410,27,-10766.3,-1134.96,27.2876,NULL,0,0,0,0,100,0),
(59410,28,-10770.1,-1128.95,27.9946,NULL,0,0,0,0,100,0),
(59410,29,-10773.9,-1122.84,28.9884,NULL,0,0,0,0,100,0),
(59410,30,-10777.9,-1116.55,29.7637,NULL,0,0,0,0,100,0),
(59410,31,-10779.2,-1111.21,30.6643,NULL,0,0,0,0,100,0),
(59410,32,-10780.9,-1104.07,32.0128,NULL,0,0,0,0,100,0),
(59410,33,-10782.5,-1097.14,33.3376,NULL,0,0,0,0,100,0),
(59410,34,-10784.3,-1089.88,34.5818,NULL,0,0,0,0,100,0),
(59410,35,-10786,-1082.62,35.9698,NULL,0,0,0,0,100,0),
(59410,36,-10787.8,-1075.01,37.638,NULL,0,0,0,0,100,0),
(59410,37,-10789.5,-1067.8,39.1386,NULL,2000,0,0,0,100,0),
(59410,38,-10787.8,-1075.01,37.638,NULL,0,0,0,0,100,0),
(59410,39,-10786,-1082.62,35.9698,NULL,0,0,0,0,100,0),
(59410,40,-10784.3,-1089.88,34.5818,NULL,0,0,0,0,100,0),
(59410,41,-10782.5,-1097.14,33.3376,NULL,0,0,0,0,100,0),
(59410,42,-10780.9,-1104.07,32.0128,NULL,0,0,0,0,100,0),
(59410,43,-10779.2,-1111.21,30.6643,NULL,0,0,0,0,100,0),
(59410,44,-10777.9,-1116.55,29.7637,NULL,0,0,0,0,100,0),
(59410,45,-10773.9,-1122.84,28.9884,NULL,0,0,0,0,100,0),
(59410,46,-10770.1,-1128.95,27.9946,NULL,0,0,0,0,100,0),
(59410,47,-10766.3,-1134.96,27.2876,NULL,0,0,0,0,100,0),
(59410,48,-10762.9,-1140.28,27.0673,NULL,0,0,0,0,100,0),
(59410,49,-10758.1,-1143.26,26.9714,NULL,0,0,0,0,100,0),
(59410,50,-10753.1,-1146.43,26.8454,NULL,0,0,0,0,100,0),
(59410,51,-10748,-1149.67,26.7551,NULL,0,0,0,0,100,0),
(59410,52,-10742.8,-1152.9,26.4428,NULL,0,0,0,0,100,0),
(59410,53,-10737.1,-1156.5,26.5973,NULL,0,0,0,0,100,0),
(59410,54,-10731.8,-1159.86,26.9488,NULL,0,0,0,0,100,0),
(59410,55,-10726.5,-1163.22,26.7243,NULL,0,0,0,0,100,0),
(59410,56,-10720.1,-1167.2,26.504,NULL,0,0,0,0,100,0),
(59410,57,-10713.8,-1171.18,26.6217,NULL,0,0,0,0,100,0),
(59410,58,-10707.2,-1175.34,26.4398,NULL,0,0,0,0,100,0),
(59410,59,-10701.2,-1179.13,26.5259,NULL,0,0,0,0,100,0),
(59410,60,-10695.3,-1182.85,26.7807,NULL,0,0,0,0,100,0),
(59410,61,-10689.7,-1186.33,27.1975,NULL,0,0,0,0,100,0),
(59410,62,-10684.6,-1189.57,27.3391,NULL,0,0,0,0,100,0),
(59410,63,-10677.2,-1190.65,27.4854,NULL,0,0,0,0,100,0),
(59410,64,-10670.2,-1191.69,27.8279,NULL,0,0,0,0,100,0),
(59410,65,-10663.1,-1192.72,28.2104,NULL,0,0,0,0,100,0),
(59410,66,-10657,-1193.62,28.4789,NULL,0,0,0,0,100,0),
(59410,67,-10649.3,-1191.58,28.5744,NULL,0,0,0,0,100,0),
(59410,68,-10643.5,-1190.03,28.5336,NULL,0,0,0,0,100,0),
(59410,69,-10636.9,-1188.3,28.7447,NULL,0,0,0,0,100,0),
(59410,70,-10630.1,-1186.48,29.0138,NULL,0,0,0,0,100,0),
(59410,71,-10623.7,-1184.8,28.8543,NULL,0,0,0,0,100,0),
(59410,72,-10617.8,-1183.22,28.5542,NULL,0,0,0,0,100,0),
-- Watcher Backus
(42300,1,-10320.5,-1125.69,21.69,NULL,0,0,0,0,100,0),
(42300,2,-10316.3,-1130.54,21.9608,NULL,0,0,0,0,100,0),
(42300,3,-10311.8,-1135.73,22.1486,NULL,0,0,0,0,100,0),
(42300,4,-10306.2,-1142.15,22.521,NULL,0,0,0,0,100,0),
(42300,5,-10301.8,-1147.21,22.7717,NULL,2000,0,0,0,100,0),
(42300,6,-10306.2,-1142.15,22.521,NULL,0,0,0,0,100,0),
(42300,7,-10311.8,-1135.73,22.1486,NULL,0,0,0,0,100,0),
(42300,8,-10316.3,-1130.54,21.9608,NULL,0,0,0,0,100,0),
(42300,9,-10320.5,-1125.69,21.69,NULL,0,0,0,0,100,0),
(42300,10,-10325.6,-1123.87,21.7883,NULL,0,0,0,0,100,0),
(42300,11,-10331.6,-1121.71,21.8334,NULL,0,0,0,0,100,0),
(42300,12,-10337.5,-1119.58,21.6119,NULL,0,0,0,0,100,0),
(42300,13,-10343.6,-1117.41,21.4012,NULL,0,0,0,0,100,0),
(42300,14,-10350,-1115.08,21.4067,NULL,0,0,0,0,100,0),
(42300,15,-10355.6,-1114.76,21.3945,NULL,0,0,0,0,100,0),
(42300,16,-10362.6,-1114.35,21.1169,NULL,0,0,0,0,100,0),
(42300,17,-10369.6,-1113.94,21.0181,NULL,0,0,0,0,100,0),
(42300,18,-10376,-1113.57,21.2048,NULL,0,0,0,0,100,0),
(42300,19,-10382,-1114.61,21.5628,NULL,0,0,0,0,100,0),
(42300,20,-10387.5,-1115.58,22.0812,NULL,0,0,0,0,100,0),
(42300,21,-10393,-1116.55,22.5005,NULL,0,0,0,0,100,0),
(42300,22,-10398,-1119.28,22.6266,NULL,0,0,0,0,100,0),
(42300,23,-10403.7,-1122.36,22.8602,NULL,0,0,0,0,100,0),
(42300,24,-10409,-1125.26,23.0062,NULL,0,0,0,0,100,0),
(42300,25,-10411.8,-1130.1,23.5814,NULL,0,0,0,0,100,0),
(42300,26,-10415.4,-1136.24,24.209,NULL,0,0,0,0,100,0),
(42300,27,-10418.7,-1141.78,25.1714,NULL,0,0,0,0,100,0),
(42300,28,-10421,-1145.8,26.031,NULL,0,0,0,0,100,0),
(42300,29,-10424.2,-1151.23,26.3349,NULL,0,0,0,0,100,0),
(42300,30,-10427,-1156.06,27.024,NULL,0,0,0,0,100,0),
(42300,31,-10429.7,-1160.7,27.4545,NULL,0,0,0,0,100,0),
(42300,32,-10434,-1163.77,27.8261,NULL,0,0,0,0,100,0),
(42300,33,-10439.4,-1167.66,27.8224,NULL,0,0,0,0,100,0),
(42300,34,-10443.9,-1170.94,27.9075,NULL,0,0,0,0,100,0),
(42300,35,-10449.2,-1173.19,27.8778,NULL,0,0,0,0,100,0),
(42300,36,-10455,-1175.68,27.5486,NULL,0,0,0,0,100,0),
(42300,37,-10460.5,-1178.07,27.4706,NULL,0,0,0,0,100,0),
(42300,38,-10464.9,-1179.96,27.5567,NULL,0,0,0,0,100,0),
(42300,39,-10470.5,-1180.71,27.6378,NULL,0,0,0,0,100,0),
(42300,40,-10477.2,-1181.63,27.6385,NULL,0,0,0,0,100,0),
(42300,41,-10484.1,-1182.58,27.7889,NULL,0,0,0,0,100,0),
(42300,42,-10491.4,-1183.57,27.6715,NULL,0,0,0,0,100,0),
(42300,43,-10498,-1184.47,27.9718,NULL,0,0,0,0,100,0),
(42300,44,-10503.5,-1185.22,28.0944,NULL,0,0,0,0,100,0),
(42300,45,-10509.2,-1186,28.1384,NULL,0,0,0,0,100,0),
(42300,46,-10513.9,-1186.64,28.1043,NULL,2000,0,0,0,100,0),
(42300,47,-10509.2,-1186,28.1384,NULL,0,0,0,0,100,0),
(42300,48,-10503.5,-1185.22,28.0944,NULL,0,0,0,0,100,0),
(42300,49,-10498,-1184.47,27.9718,NULL,0,0,0,0,100,0),
(42300,50,-10491.4,-1183.57,27.6715,NULL,0,0,0,0,100,0),
(42300,51,-10484.1,-1182.58,27.7889,NULL,0,0,0,0,100,0),
(42300,52,-10477.2,-1181.63,27.6385,NULL,0,0,0,0,100,0),
(42300,53,-10470.5,-1180.71,27.6378,NULL,0,0,0,0,100,0),
(42300,54,-10464.9,-1179.96,27.5567,NULL,0,0,0,0,100,0),
(42300,55,-10460.5,-1178.07,27.4706,NULL,0,0,0,0,100,0),
(42300,56,-10455,-1175.68,27.5486,NULL,0,0,0,0,100,0),
(42300,57,-10449.2,-1173.19,27.8778,NULL,0,0,0,0,100,0),
(42300,58,-10443.9,-1170.94,27.9075,NULL,0,0,0,0,100,0),
(42300,59,-10439.4,-1167.66,27.8224,NULL,0,0,0,0,100,0),
(42300,60,-10434,-1163.77,27.8261,NULL,0,0,0,0,100,0),
(42300,61,-10429.7,-1160.7,27.4545,NULL,0,0,0,0,100,0),
(42300,62,-10427,-1156.06,27.024,NULL,0,0,0,0,100,0),
(42300,63,-10424.2,-1151.23,26.3349,NULL,0,0,0,0,100,0),
(42300,64,-10421,-1145.8,26.031,NULL,0,0,0,0,100,0),
(42300,65,-10418.7,-1141.78,25.1714,NULL,0,0,0,0,100,0),
(42300,66,-10415.4,-1136.24,24.209,NULL,0,0,0,0,100,0),
(42300,67,-10411.8,-1130.1,23.5814,NULL,0,0,0,0,100,0),
(42300,68,-10409,-1125.26,23.0062,NULL,0,0,0,0,100,0),
(42300,69,-10403.7,-1122.36,22.8602,NULL,0,0,0,0,100,0),
(42300,70,-10398,-1119.28,22.6266,NULL,0,0,0,0,100,0),
(42300,71,-10393,-1116.55,22.5005,NULL,0,0,0,0,100,0),
(42300,72,-10387.5,-1115.58,22.0812,NULL,0,0,0,0,100,0),
(42300,73,-10382,-1114.61,21.5628,NULL,0,0,0,0,100,0),
(42300,74,-10376,-1113.57,21.2048,NULL,0,0,0,0,100,0),
(42300,75,-10369.6,-1113.94,21.0181,NULL,0,0,0,0,100,0),
(42300,76,-10362.6,-1114.35,21.1169,NULL,0,0,0,0,100,0),
(42300,77,-10355.6,-1114.76,21.3945,NULL,0,0,0,0,100,0),
(42300,78,-10350,-1115.08,21.4067,NULL,0,0,0,0,100,0),
(42300,79,-10343.6,-1117.41,21.4012,NULL,0,0,0,0,100,0),
(42300,80,-10337.5,-1119.58,21.6119,NULL,0,0,0,0,100,0),
(42300,81,-10331.6,-1121.71,21.8334,NULL,0,0,0,0,100,0),
(42300,82,-10325.6,-1123.87,21.7883,NULL,0,0,0,0,100,0);
