UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` IN (85770,85782,85803,85888,85893,85915,85930);
UPDATE `creature` SET `position_x` = 7054.72, `position_y` = -7515.06, `position_z` = 45.7389, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 85892;
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 85769;
UPDATE `creature` SET `id` = 16346 WHERE `guid` IN (85867,85835);
UPDATE `creature` SET `position_x` = 6542.07, `position_y` = -7417.91, `position_z` = 67.2151, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 85922;
UPDATE `creature` SET `position_x` = 6843.5, `position_y` = -7409.59, `position_z` = 46.3682, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 85846;
UPDATE `creature` SET `position_x` = 6653.06, `position_y` = -7404.97, `position_z` = 70.6575, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 85899;

DELETE FROM `creature_addon` WHERE `guid` IN (85892,85769,85922,85846,85899);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(85892,858920,0,0,1,0,0,NULL),
(85769,857690,0,0,1,0,0,NULL),
(85922,859220,0,0,1,0,0,NULL),
(85846,858460,0,0,1,0,0,NULL),
(85899,858990,0,0,1,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16345 AND `id` = 3;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16348 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16345,0,3,0,17,0,100,0,16348,0,0,0,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Shadowpine Catlord - On Summoned Unit ''Ghostclaw Lynx'' - Set Data 1 1 (Invoker)'),

(16348,0,2,0,38,0,100,0,1,1,0,0,0,237,2,0,0,0,0,0,7,0,0,0,0,0,0,2,45,'Ghostclaw Lynx - On Data Set 1 1 - Create Creature Formation (Invoker)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 16345;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,4,16345,0,0,31,1,3,0,85769,0,0,0,'Shadowpine Catlord - Group 0: Execute SAI ID 3 only if has GUID 85769'),
(22,4,16345,0,1,31,1,3,0,85846,0,0,0,'Shadowpine Catlord - Group 1: Execute SAI ID 3 only if has GUID 85846');

DELETE FROM `gameobject` WHERE `guid` BETWEEN 9666 AND 9687;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(9666,181326,530,0,0,1,1,6772.44,-7350.59,48.9617,3.14159,0,0,-1,0,120,255,1,0),
(9667,181327,530,0,0,1,1,6610.27,-7352.76,54.1082,3.14159,0,0,-1,0,120,255,1,0),
(9668,181329,530,0,0,1,1,7150.19,-7558.53,47.9448,3.14159,0,0,-1,0,120,255,1,0),
(9669,184793,530,0,0,1,1,7159.62,-7589.27,48.7491,4.2237,0,0,-0.857167,0.515038,120,255,1,0),
(9670,184793,530,0,0,1,1,7182.41,-7573.78,49.2193,3.26377,0,0,-0.998135,0.0610518,120,255,1,0),
(9671,184793,530,0,0,1,1,7128.07,-7585.13,48.8118,3.45576,0,0,-0.987688,0.156436,120,255,1,0),
(9672,184793,530,0,0,1,1,7058.67,-7545.73,45.8779,3.78737,0,0,-0.948323,0.317306,120,255,1,0),
(9673,184793,530,0,0,1,1,7027.02,-7547.91,45.5196,3.80482,0,0,-0.945518,0.325568,120,255,1,0),
(9674,184793,530,0,0,1,1,6997.95,-7519,56.4784,1.25664,0,0,0.587785,0.809017,120,255,1,0),
(9675,184793,530,0,0,1,1,7004.18,-7543.31,48.8435,5.51524,0,0,-0.374606,0.927184,120,255,1,0),
(9676,184793,530,0,0,1,1,6987.94,-7527.76,61.7815,5.74214,0,0,-0.267238,0.963631,120,255,1,0),
(9677,184793,530,0,0,1,1,6996.27,-7547.4,48.8435,5.00909,0,0,-0.594823,0.803857,120,255,1,0),
(9678,184793,530,0,0,1,1,6701.37,-7323.05,55.5933,2.63544,0,0,0.968147,0.250381,120,255,1,0),
(9679,184793,530,0,0,1,1,6698.16,-7318.41,55.5933,5.77704,0,0,-0.25038,0.968148,120,255,1,0),
(9680,184793,530,0,0,1,1,6660.86,-7392.01,70.4737,5.06146,0,0,-0.573576,0.819152,120,255,1,0),
(9681,184793,530,0,0,1,1,6652.18,-7409.4,65.2256,5.53269,0,0,-0.366501,0.930418,120,255,1,0),
(9682,184793,530,0,0,1,1,6645.67,-7273.37,54.9746,1.39626,0,0,0.642787,0.766045,120,255,1,0),
(9683,184793,530,0,0,1,1,6647.09,-7404.21,57.5551,3.68265,0,0,-0.96363,0.267241,120,255,1,0),
(9684,184793,530,0,0,1,1,6603.86,-7301.56,55.2014,2.87979,0,0,0.991445,0.130528,120,255,1,0),
(9685,184793,530,0,0,1,1,6524.57,-7412.94,69.1011,3.59538,0,0,-0.97437,0.224951,120,255,1,0),
(9686,184793,530,0,0,1,1,6505.11,-7441.94,85.9752,5.41052,0,0,-0.422618,0.906308,120,255,1,0),
(9687,184793,530,0,0,1,1,6719.64,-7438.47,51.3599,4.34587,0,0,-0.824126,0.566406,120,255,1,0);

DELETE FROM `waypoint_data` WHERE `id` IN (858920,857690,859220,858460,858990);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
-- Shadowpine Hexxer
(858920,1,7054.72,-7515.06,45.7389,NULL,0,0,0,0,100,0),
(858920,2,7056.03,-7508.06,46.3062,NULL,0,0,0,0,100,0),
(858920,3,7057.41,-7500.72,46.7315,NULL,0,0,0,0,100,0),
(858920,4,7058.7,-7493.84,47.2398,NULL,0,0,0,0,100,0),
(858920,5,7060.1,-7486.39,47.8036,NULL,0,0,0,0,100,0),
(858920,6,7061.14,-7480.87,47.7032,NULL,0,0,0,0,100,0),
(858920,7,7065.93,-7478.7,47.8542,NULL,0,0,0,0,100,0),
(858920,8,7072.83,-7475.57,47.7682,NULL,0,0,0,0,100,0),
(858920,9,7077.7,-7473.37,48.0955,NULL,0,0,0,0,100,0),
(858920,10,7081.84,-7471.49,48.1096,NULL,0,0,0,0,100,0),
(858920,11,7086.89,-7469.2,47.8453,NULL,0,0,0,0,100,0),
(858920,12,7093.87,-7471.13,47.7069,NULL,0,0,0,0,100,0),
(858920,13,7100.73,-7473.03,47.6833,NULL,0,0,0,0,100,0),
(858920,14,7107.58,-7474.93,47.6802,NULL,0,0,0,0,100,0),
(858920,15,7114.67,-7476.89,47.7883,NULL,0,0,0,0,100,0),
(858920,16,7120.25,-7478.43,47.9007,NULL,0,0,0,0,100,0),
(858920,17,7126.23,-7481.06,47.6987,NULL,0,0,0,0,100,0),
(858920,18,7133.38,-7484.2,47.6987,NULL,0,0,0,0,100,0),
(858920,19,7140.44,-7487.3,47.6987,NULL,0,0,0,0,100,0),
(858920,20,7145.13,-7489.36,48.1035,NULL,0,0,0,0,100,0),
(858920,21,7147.47,-7490.39,48.7424,NULL,0,0,0,0,100,0),
(858920,22,7150.03,-7491.51,48.9808,NULL,0,0,0,0,100,0),
(858920,23,7153.98,-7493.25,48.6271,NULL,0,0,0,0,100,0),
(858920,24,7158.03,-7495.03,48.4976,NULL,0,0,0,0,100,0),
(858920,25,7163.71,-7498.03,48.8081,NULL,0,0,0,0,100,0),
(858920,26,7169.49,-7501.08,49.4916,NULL,0,0,0,0,100,0),
(858920,27,7176.4,-7504.72,49.9577,NULL,0,0,0,0,100,0),
(858920,28,7183.48,-7508.46,50.3392,NULL,0,0,0,0,100,0),
(858920,29,7186.4,-7514.04,49.8958,NULL,0,0,0,0,100,0),
(858920,30,7189.48,-7519.94,49.3539,NULL,0,0,0,0,100,0),
(858920,31,7193.09,-7526.86,48.4589,NULL,0,0,0,0,100,0),
(858920,32,7190.5,-7532.47,48.1683,NULL,0,0,0,0,100,0),
(858920,33,7188.16,-7537.56,48.989,NULL,0,0,0,0,100,0),
(858920,34,7185.37,-7543.6,49.1639,NULL,0,0,0,0,100,0),
(858920,35,7182.28,-7550.3,49.3927,NULL,0,0,0,0,100,0),
(858920,36,7178.34,-7550.64,49.762,NULL,0,0,0,0,100,0),
(858920,37,7173.11,-7551.1,49.8484,NULL,0,0,0,0,100,0),
(858920,38,7168,-7551.55,49.427,NULL,0,0,0,0,100,0),
(858920,39,7162.07,-7552.07,48.8204,NULL,0,0,0,0,100,0),
(858920,40,7156.02,-7552.6,48.0774,NULL,0,0,0,0,100,0),
(858920,41,7149.92,-7553.13,47.9069,NULL,0,0,0,0,100,0),
(858920,42,7144.05,-7550.52,47.9544,NULL,0,0,0,0,100,0),
(858920,43,7138.94,-7548.25,48.2947,NULL,0,0,0,0,100,0),
(858920,44,7134.25,-7546.17,48.2794,NULL,0,0,0,0,100,0),
(858920,45,7128.81,-7543.76,47.8843,NULL,0,0,0,0,100,0),
(858920,46,7123.23,-7541.28,47.6985,NULL,0,0,0,0,100,0),
(858920,47,7119.14,-7535.6,47.6985,NULL,0,0,0,0,100,0),
(858920,48,7115.26,-7530.21,47.7058,NULL,0,0,0,0,100,0),
(858920,49,7111.72,-7525.29,48.1395,NULL,0,0,0,0,100,0),
(858920,50,7107.78,-7519.82,47.9019,NULL,0,0,0,0,100,0),
(858920,51,7101.97,-7520.37,47.7487,NULL,0,0,0,0,100,0),
(858920,52,7096.16,-7520.91,47.8149,NULL,0,0,0,0,100,0),
(858920,53,7090.37,-7521.46,48.1413,NULL,0,0,0,0,100,0),
(858920,54,7084.67,-7522,48.0493,NULL,0,0,0,0,100,0),
(858920,55,7078.57,-7522.57,47.5847,NULL,0,0,0,0,100,0),
(858920,56,7073.56,-7520.99,47.1796,NULL,0,0,0,0,100,0),
(858920,57,7067.54,-7519.1,46.8598,NULL,0,0,0,0,100,0),
(858920,58,7061.2,-7517.1,46.2909,NULL,0,0,0,0,100,0),
-- Shadowpine Catlord
(857690,1,6986.81,-7540,61.7625,NULL,0,0,2,0,100,0),
(857690,2,6984.1,-7545.14,61.7662,NULL,0,0,2,0,100,0),
(857690,3,6985.8,-7548.52,61.688,NULL,0,0,2,0,100,0),
(857690,4,6990.44,-7551.35,59.2675,NULL,0,0,2,0,100,0),
(857690,5,6995.74,-7551.88,56.3188,NULL,0,0,2,0,100,0),
(857690,6,6996.62,-7547.95,56.5471,NULL,0,0,2,0,100,0),
(857690,7,6997.96,-7541.98,56.448,NULL,0,0,2,0,100,0),
(857690,8,6999.04,-7537.12,56.0345,NULL,0,0,2,0,100,0),
(857690,9,7001.03,-7534.1,53.8607,NULL,0,0,2,0,100,0),
(857690,10,7000.63,-7530.8,51.4574,NULL,0,0,2,0,100,0),
(857690,11,7000.26,-7527.72,48.844,NULL,0,0,2,0,100,0),
(857690,12,6994.42,-7522.54,48.8438,NULL,0,0,2,0,100,0),
(857690,13,6988.92,-7517.65,48.8438,NULL,0,0,2,0,100,0),
(857690,14,6986.98,-7511.38,48.8323,NULL,0,0,2,0,100,0),
(857690,15,6985.22,-7505.7,48.8323,NULL,0,0,2,0,100,0),
(857690,16,6983.36,-7499.84,45.871,NULL,0,0,2,0,100,0),
(857690,17,6981.14,-7493.33,45.7273,NULL,0,0,2,0,100,0),
(857690,18,6979.07,-7487.26,46.241,NULL,0,0,2,0,100,0),
(857690,19,6977.1,-7481.5,46.4628,NULL,0,0,2,0,100,0),
(857690,20,6976.13,-7478.64,47.3662,NULL,0,0,2,0,100,0),
(857690,21,6974.96,-7475.22,47.5138,NULL,0,0,2,0,100,0),
(857690,22,6973.38,-7470.58,47.0698,NULL,0,0,2,0,100,0),
(857690,23,6972.02,-7466.6,47.0474,NULL,0,0,2,0,100,0),
(857690,24,6973.96,-7461.59,47.0555,NULL,0,0,2,0,100,0),
(857690,25,6976.1,-7456.04,46.7505,NULL,0,0,2,0,100,0),
(857690,26,6978.2,-7450.6,46.9675,NULL,0,0,2,0,100,0),
(857690,27,6979.92,-7446.15,47.061,NULL,0,0,2,0,100,0),
(857690,28,6981.92,-7440.97,47.2279,NULL,0,0,2,0,100,0),
(857690,29,6979.92,-7446.15,47.061,NULL,0,0,2,0,100,0),
(857690,30,6978.2,-7450.6,46.9675,NULL,0,0,2,0,100,0),
(857690,31,6976.1,-7456.04,46.7505,NULL,0,0,2,0,100,0),
(857690,32,6973.96,-7461.59,47.0555,NULL,0,0,2,0,100,0),
(857690,33,6972.02,-7466.6,47.0474,NULL,0,0,2,0,100,0),
(857690,34,6973.38,-7470.58,47.0698,NULL,0,0,2,0,100,0),
(857690,35,6974.96,-7475.22,47.5138,NULL,0,0,2,0,100,0),
(857690,36,6976.13,-7478.64,47.3662,NULL,0,0,2,0,100,0),
(857690,37,6977.1,-7481.5,46.4628,NULL,0,0,2,0,100,0),
(857690,38,6983.02,-7484.81,46.5237,NULL,0,0,2,0,100,0),
(857690,39,6989.01,-7488.17,46.3998,NULL,0,0,2,0,100,0),
(857690,40,6995.62,-7491.87,46.6285,NULL,0,0,2,0,100,0),
(857690,41,7002.14,-7495.52,46.4514,NULL,0,0,2,0,100,0),
(857690,42,7009.06,-7499.39,45.5757,NULL,0,0,2,0,100,0),
(857690,43,7015.36,-7502.92,45.7167,NULL,0,0,2,0,100,0),
(857690,44,7021.04,-7506.11,45.7232,NULL,0,0,2,0,100,0),
(857690,45,7026.64,-7509.25,45.8662,NULL,0,0,2,0,100,0),
(857690,46,7032.53,-7512.55,45.8871,NULL,0,0,2,0,100,0),
(857690,47,7039.05,-7516.2,46.2547,NULL,0,0,2,0,100,0),
(857690,48,7044.76,-7519.4,46.0846,NULL,0,0,2,0,100,0),
(857690,49,7049.26,-7521.92,45.4896,NULL,0,0,2,0,100,0),
(857690,50,7044.76,-7519.4,46.0846,NULL,0,0,2,0,100,0),
(857690,51,7039.05,-7516.2,46.2547,NULL,0,0,2,0,100,0),
(857690,52,7032.53,-7512.55,45.8871,NULL,0,0,2,0,100,0),
(857690,53,7026.64,-7509.25,45.8662,NULL,0,0,2,0,100,0),
(857690,54,7021.04,-7506.11,45.7232,NULL,0,0,2,0,100,0),
(857690,55,7015.36,-7502.92,45.7167,NULL,0,0,2,0,100,0),
(857690,56,7009.06,-7499.39,45.5757,NULL,0,0,2,0,100,0),
(857690,57,7002.14,-7495.52,46.4514,NULL,0,0,2,0,100,0),
(857690,58,6995.62,-7491.87,46.6285,NULL,0,0,2,0,100,0),
(857690,59,6989.01,-7488.17,46.3998,NULL,0,0,2,0,100,0),
(857690,60,6983.02,-7484.81,46.5237,NULL,0,0,2,0,100,0),
(857690,61,6977.1,-7481.5,46.4628,NULL,0,0,2,0,100,0),
(857690,62,6976.13,-7478.64,47.3662,NULL,0,0,2,0,100,0),
(857690,63,6974.96,-7475.22,47.5138,NULL,0,0,2,0,100,0),
(857690,64,6973.38,-7470.58,47.0698,NULL,0,0,2,0,100,0),
(857690,65,6972.02,-7466.6,47.0474,NULL,0,0,2,0,100,0),
(857690,66,6973.96,-7461.59,47.0555,NULL,0,0,2,0,100,0),
(857690,67,6976.1,-7456.04,46.7505,NULL,0,0,2,0,100,0),
(857690,68,6978.2,-7450.6,46.9675,NULL,0,0,2,0,100,0),
(857690,69,6979.92,-7446.15,47.061,NULL,0,0,2,0,100,0),
(857690,70,6981.92,-7440.97,47.2279,NULL,0,0,2,0,100,0),
(857690,71,6979.92,-7446.15,47.061,NULL,0,0,2,0,100,0),
(857690,72,6978.2,-7450.6,46.9675,NULL,0,0,2,0,100,0),
(857690,73,6976.1,-7456.04,46.7505,NULL,0,0,2,0,100,0),
(857690,74,6973.96,-7461.59,47.0555,NULL,0,0,2,0,100,0),
(857690,75,6972.02,-7466.6,47.0474,NULL,0,0,2,0,100,0),
(857690,76,6973.38,-7470.58,47.0698,NULL,0,0,2,0,100,0),
(857690,77,6974.96,-7475.22,47.5138,NULL,0,0,2,0,100,0),
(857690,78,6976.13,-7478.64,47.3662,NULL,0,0,2,0,100,0),
(857690,79,6977.1,-7481.5,46.4628,NULL,0,0,2,0,100,0),
(857690,80,6979.07,-7487.26,46.241,NULL,0,0,2,0,100,0),
(857690,81,6981.14,-7493.33,45.7273,NULL,0,0,2,0,100,0),
(857690,82,6983.36,-7499.84,45.871,NULL,0,0,2,0,100,0),
(857690,83,6985.22,-7505.7,48.8323,NULL,0,0,2,0,100,0),
(857690,84,6986.98,-7511.38,48.8323,NULL,0,0,2,0,100,0),
(857690,85,6988.92,-7517.65,48.8438,NULL,0,0,2,0,100,0),
(857690,86,6994.42,-7522.54,48.8438,NULL,0,0,2,0,100,0),
(857690,87,7000.26,-7527.72,48.844,NULL,0,0,2,0,100,0),
(857690,88,7000.63,-7530.8,51.4574,NULL,0,0,2,0,100,0),
(857690,89,7001.03,-7534.1,53.8607,NULL,0,0,2,0,100,0),
(857690,90,6999.04,-7537.12,56.0345,NULL,0,0,2,0,100,0),
(857690,91,6997.96,-7541.98,56.448,NULL,0,0,2,0,100,0),
(857690,92,6996.62,-7547.95,56.5471,NULL,0,0,2,0,100,0),
(857690,93,6995.74,-7551.88,56.3188,NULL,0,0,2,0,100,0),
(857690,94,6990.44,-7551.35,59.2675,NULL,0,0,2,0,100,0),
(857690,95,6985.8,-7548.52,61.688,NULL,0,0,2,0,100,0),
(857690,96,6984.1,-7545.14,61.7662,NULL,0,0,2,0,100,0),
-- Shadowpine Hexxer
(859220,1,6542.07,-7417.91,67.2151,NULL,0,0,0,0,100,0),
(859220,2,6545.78,-7413.56,66.209,NULL,0,0,0,0,100,0),
(859220,3,6550.32,-7408.24,64.7217,NULL,0,0,0,0,100,0),
(859220,4,6555.25,-7402.47,63.109,NULL,0,0,0,0,100,0),
(859220,5,6560.85,-7395.9,61.4644,NULL,0,0,0,0,100,0),
(859220,6,6565.7,-7390.22,60.493,NULL,0,0,0,0,100,0),
(859220,7,6569.76,-7385.46,59.5232,NULL,0,0,0,0,100,0),
(859220,8,6574.3,-7380.14,58.4036,NULL,0,0,0,0,100,0),
(859220,9,6578.92,-7374.73,57.8931,NULL,0,0,0,0,100,0),
(859220,10,6584.47,-7368.22,56.6029,NULL,0,0,0,0,100,0),
(859220,11,6588.9,-7363.03,55.5066,NULL,0,0,0,0,100,0),
(859220,12,6593.37,-7357.79,54.9127,NULL,0,0,0,0,100,0),
(859220,13,6597.46,-7353,54.3109,NULL,0,0,0,0,100,0),
(859220,14,6601.7,-7348.03,54.0958,NULL,0,0,0,0,100,0),
(859220,15,6606.47,-7342.43,53.8908,NULL,0,0,0,0,100,0),
(859220,16,6611.24,-7336.84,53.8461,NULL,0,0,0,0,100,0),
(859220,17,6616.68,-7339.25,53.492,NULL,0,0,0,0,100,0),
(859220,18,6622.22,-7341.71,54.104,NULL,0,0,0,0,100,0),
(859220,19,6626.7,-7343.7,54.4286,NULL,0,0,0,0,100,0),
(859220,20,6630.86,-7345.55,54.0975,NULL,0,0,0,0,100,0),
(859220,21,6635.98,-7347.82,53.6182,NULL,0,0,0,0,100,0),
(859220,22,6642.27,-7350.61,53.3945,NULL,0,0,0,0,100,0),
(859220,23,6648.56,-7353.41,53.7083,NULL,0,0,0,0,100,0),
(859220,24,6654.63,-7356.1,54.4156,NULL,0,0,0,0,100,0),
(859220,25,6660.39,-7358.66,54.9983,NULL,0,0,0,0,100,0),
(859220,26,6667.74,-7361.92,55.4481,NULL,0,0,0,0,100,0),
(859220,27,6672.01,-7363.82,55.3641,NULL,0,0,0,0,100,0),
(859220,28,6677.03,-7366.05,54.7625,NULL,0,0,0,0,100,0),
(859220,29,6682.19,-7368.34,53.9613,NULL,0,0,0,0,100,0),
(859220,30,6689.04,-7368.97,53.3083,NULL,0,0,0,0,100,0),
(859220,31,6696.47,-7369.65,53.0299,NULL,0,0,0,0,100,0),
(859220,32,6703.27,-7370.28,52.9944,NULL,0,0,0,0,100,0),
(859220,33,6708.35,-7375.1,52.5382,NULL,0,0,0,0,100,0),
(859220,34,6713.34,-7379.83,52.103,NULL,0,0,0,0,100,0),
(859220,35,6718.58,-7384.8,52.0771,NULL,0,0,0,0,100,0),
(859220,36,6723.01,-7388.99,51.9274,NULL,0,0,0,0,100,0),
(859220,37,6728.93,-7394.61,51.5186,NULL,0,0,0,0,100,0),
(859220,38,6734.86,-7400.23,51.2393,NULL,0,0,0,0,100,0),
(859220,39,6740.19,-7405.29,51.3777,NULL,0,0,0,0,100,0),
(859220,40,6747.13,-7411.87,50.8724,NULL,0,0,0,0,100,0),
(859220,41,6753.04,-7417.47,51.4471,NULL,0,0,0,0,100,0),
(859220,42,6747.13,-7411.87,50.8724,NULL,0,0,0,0,100,0),
(859220,43,6740.19,-7405.29,51.3777,NULL,0,0,0,0,100,0),
(859220,44,6734.86,-7400.23,51.2393,NULL,0,0,0,0,100,0),
(859220,45,6728.93,-7394.61,51.5186,NULL,0,0,0,0,100,0),
(859220,46,6723.01,-7388.99,51.9274,NULL,0,0,0,0,100,0),
(859220,47,6718.58,-7384.8,52.0771,NULL,0,0,0,0,100,0),
(859220,48,6713.34,-7379.83,52.103,NULL,0,0,0,0,100,0),
(859220,49,6708.35,-7375.1,52.5382,NULL,0,0,0,0,100,0),
(859220,50,6703.27,-7370.28,52.9944,NULL,0,0,0,0,100,0),
(859220,51,6696.47,-7369.65,53.0299,NULL,0,0,0,0,100,0),
(859220,52,6689.04,-7368.97,53.3083,NULL,0,0,0,0,100,0),
(859220,53,6682.19,-7368.34,53.9613,NULL,0,0,0,0,100,0),
(859220,54,6677.03,-7366.05,54.7625,NULL,0,0,0,0,100,0),
(859220,55,6672.01,-7363.82,55.3641,NULL,0,0,0,0,100,0),
(859220,56,6667.74,-7361.92,55.4481,NULL,0,0,0,0,100,0),
(859220,57,6660.39,-7358.66,54.9983,NULL,0,0,0,0,100,0),
(859220,58,6654.63,-7356.1,54.4156,NULL,0,0,0,0,100,0),
(859220,59,6648.56,-7353.41,53.7083,NULL,0,0,0,0,100,0),
(859220,60,6642.27,-7350.61,53.3945,NULL,0,0,0,0,100,0),
(859220,61,6635.98,-7347.82,53.6182,NULL,0,0,0,0,100,0),
(859220,62,6630.86,-7345.55,54.0975,NULL,0,0,0,0,100,0),
(859220,63,6626.7,-7343.7,54.4286,NULL,0,0,0,0,100,0),
(859220,64,6622.22,-7341.71,54.104,NULL,0,0,0,0,100,0),
(859220,65,6616.68,-7339.25,53.492,NULL,0,0,0,0,100,0),
(859220,66,6611.24,-7336.84,53.8461,NULL,0,0,0,0,100,0),
(859220,67,6606.47,-7342.43,53.8908,NULL,0,0,0,0,100,0),
(859220,68,6601.7,-7348.03,54.0958,NULL,0,0,0,0,100,0),
(859220,69,6597.46,-7353,54.3109,NULL,0,0,0,0,100,0),
(859220,70,6593.37,-7357.79,54.9127,NULL,0,0,0,0,100,0),
(859220,71,6588.9,-7363.03,55.5066,NULL,0,0,0,0,100,0),
(859220,72,6584.47,-7368.22,56.6029,NULL,0,0,0,0,100,0),
(859220,73,6578.92,-7374.73,57.8931,NULL,0,0,0,0,100,0),
(859220,74,6574.3,-7380.14,58.4036,NULL,0,0,0,0,100,0),
(859220,75,6569.76,-7385.46,59.5232,NULL,0,0,0,0,100,0),
(859220,76,6565.7,-7390.22,60.493,NULL,0,0,0,0,100,0),
(859220,77,6560.85,-7395.9,61.4644,NULL,0,0,0,0,100,0),
(859220,78,6555.25,-7402.47,63.109,NULL,0,0,0,0,100,0),
(859220,79,6550.32,-7408.24,64.7217,NULL,0,0,0,0,100,0),
(859220,80,6545.78,-7413.56,66.209,NULL,0,0,0,0,100,0),
-- Shadowpine Catlord
(858460,1,6843.5,-7409.59,46.3682,NULL,0,0,2,0,100,0),
(858460,2,6835.63,-7408.95,46.4029,NULL,0,0,2,0,100,0),
(858460,3,6828.25,-7408.35,46.5264,NULL,0,0,2,0,100,0),
(858460,4,6821.39,-7407.79,47.3458,NULL,0,0,2,0,100,0),
(858460,5,6817.65,-7407.48,47.9899,NULL,0,0,2,0,100,0),
(858460,6,6812.62,-7404.53,47.9538,NULL,0,0,2,0,100,0),
(858460,7,6806.08,-7400.7,47.6817,NULL,0,0,2,0,100,0),
(858460,8,6797.93,-7395.91,47.6821,NULL,0,0,2,0,100,0),
(858460,9,6790.03,-7391.28,47.8406,NULL,0,0,2,0,100,0),
(858460,10,6785.98,-7386.12,48.0594,NULL,0,0,2,0,100,0),
(858460,11,6781.96,-7380.99,48.5874,NULL,0,0,2,0,100,0),
(858460,12,6778.43,-7376.5,49.0266,NULL,0,0,2,0,100,0),
(858460,13,6776.65,-7366.97,49.1375,NULL,0,0,2,0,100,0),
(858460,14,6775.29,-7359.67,49.1835,NULL,0,0,2,0,100,0),
(858460,15,6771.23,-7358.71,49.6951,NULL,0,0,2,0,100,0),
(858460,16,6767.14,-7357.74,49.8437,NULL,0,0,2,0,100,0),
(858460,17,6764.17,-7357.03,49.3714,NULL,0,0,2,0,100,0),
(858460,18,6760.45,-7356.15,48.7624,NULL,0,0,2,0,100,0),
(858460,19,6757.5,-7359.85,49.2927,NULL,0,0,2,0,100,0),
(858460,20,6754.58,-7363.49,50.4197,NULL,0,0,2,0,100,0),
(858460,21,6752.62,-7365.95,51.1177,NULL,0,0,2,0,100,0),
(858460,22,6750.43,-7368.69,51.3204,NULL,0,0,2,0,100,0),
(858460,23,6746.79,-7373.24,51.3667,NULL,0,0,2,0,100,0),
(858460,24,6741.43,-7379.96,51.1868,NULL,0,0,2,0,100,0),
(858460,25,6736.91,-7385.61,51.4314,NULL,0,0,2,0,100,0),
(858460,26,6730.19,-7390.65,51.5972,NULL,0,0,2,0,100,0),
(858460,27,6722.53,-7396.38,51.5587,NULL,0,0,2,0,100,0),
(858460,28,6713.93,-7402.82,51.3531,NULL,0,0,2,0,100,0),
(858460,29,6706.39,-7408.47,51.1816,NULL,0,0,2,0,100,0),
(858460,30,6713.93,-7402.82,51.3531,NULL,0,0,2,0,100,0),
(858460,31,6722.53,-7396.38,51.5587,NULL,0,0,2,0,100,0),
(858460,32,6730.19,-7390.65,51.5972,NULL,0,0,2,0,100,0),
(858460,33,6736.91,-7385.61,51.4314,NULL,0,0,2,0,100,0),
(858460,34,6741.43,-7379.96,51.1868,NULL,0,0,2,0,100,0),
(858460,35,6746.79,-7373.24,51.3667,NULL,0,0,2,0,100,0),
(858460,36,6750.43,-7368.69,51.3204,NULL,0,0,2,0,100,0),
(858460,37,6752.62,-7365.95,51.1177,NULL,0,0,2,0,100,0),
(858460,38,6754.58,-7363.49,50.4197,NULL,0,0,2,0,100,0),
(858460,39,6757.5,-7359.85,49.2927,NULL,0,0,2,0,100,0),
(858460,40,6760.45,-7356.15,48.7624,NULL,0,0,2,0,100,0),
(858460,41,6764.17,-7357.03,49.3714,NULL,0,0,2,0,100,0),
(858460,42,6767.14,-7357.74,49.8437,NULL,0,0,2,0,100,0),
(858460,43,6771.23,-7358.71,49.6951,NULL,0,0,2,0,100,0),
(858460,44,6775.29,-7359.67,49.1835,NULL,0,0,2,0,100,0),
(858460,45,6776.65,-7366.97,49.1375,NULL,0,0,2,0,100,0),
(858460,46,6778.43,-7376.5,49.0266,NULL,0,0,2,0,100,0),
(858460,47,6781.96,-7380.99,48.5874,NULL,0,0,2,0,100,0),
(858460,48,6785.98,-7386.12,48.0594,NULL,0,0,2,0,100,0),
(858460,49,6790.03,-7391.28,47.8406,NULL,0,0,2,0,100,0),
(858460,50,6797.93,-7395.91,47.6821,NULL,0,0,2,0,100,0),
(858460,51,6806.08,-7400.7,47.6817,NULL,0,0,2,0,100,0),
(858460,52,6812.62,-7404.53,47.9538,NULL,0,0,2,0,100,0),
(858460,53,6817.65,-7407.48,47.9899,NULL,0,0,2,0,100,0),
(858460,54,6821.39,-7407.79,47.3458,NULL,0,0,2,0,100,0),
(858460,55,6828.25,-7408.35,46.5264,NULL,0,0,2,0,100,0),
(858460,56,6835.63,-7408.95,46.4029,NULL,0,0,2,0,100,0),
-- Shadowpine Hexxer
(858990,1,6653.06,-7404.97,70.6575,NULL,0,0,0,0,100,0),
(858990,2,6652.66,-7398.83,70.5699,NULL,0,0,0,0,100,0),
(858990,3,6652.22,-7392.04,70.4748,NULL,0,0,0,0,100,0),
(858990,4,6648.29,-7390.26,70.474,NULL,0,0,0,0,100,0),
(858990,5,6645.21,-7388.86,70.5358,NULL,0,0,0,0,100,0),
(858990,6,6643.41,-7393.5,70.5205,NULL,0,0,0,0,100,0),
(858990,7,6642.38,-7396.16,69.2755,NULL,0,0,0,0,100,0),
(858990,8,6641.34,-7398.83,68.0017,NULL,0,0,0,0,100,0),
(858990,9,6641.91,-7401.46,66.7614,NULL,0,0,0,0,100,0),
(858990,10,6642.55,-7404.43,65.0514,NULL,0,0,0,0,100,0),
(858990,11,6647.12,-7407.22,65.0898,NULL,0,0,0,0,100,0),
(858990,12,6652.74,-7404.15,65.1693,NULL,0,0,0,0,100,0),
(858990,13,6656.35,-7402.17,64.9943,NULL,0,0,0,0,100,0),
(858990,14,6657.67,-7404.79,64.8243,NULL,0,0,0,0,100,0),
(858990,15,6658.72,-7406.88,63.9503,NULL,0,0,0,0,100,0),
(858990,16,6661.38,-7406.53,62.5594,NULL,0,0,0,0,100,0),
(858990,17,6664.73,-7406.09,60.282,NULL,0,0,0,0,100,0),
(858990,18,6668.66,-7405.57,57.5565,NULL,0,0,0,0,100,0),
(858990,19,6670.71,-7400.87,57.5549,NULL,0,0,0,0,100,0),
(858990,20,6672.62,-7396.48,57.5549,NULL,0,0,0,0,100,0),
(858990,21,6674.52,-7392.12,57.5556,NULL,0,0,0,0,100,0),
(858990,22,6679.02,-7389.9,57.554,NULL,0,0,0,0,100,0),
(858990,23,6683.05,-7387.93,57.544,NULL,0,0,0,0,100,0),
(858990,24,6686.88,-7386.04,57.544,NULL,0,0,0,0,100,0),
(858990,25,6689.61,-7384.04,55.7826,NULL,0,0,0,0,100,0),
(858990,26,6692.26,-7382.1,53.6069,NULL,0,0,0,0,100,0),
(858990,27,6696.68,-7378.86,52.8238,NULL,0,0,0,0,100,0),
(858990,28,6701.16,-7375.58,52.7348,NULL,0,0,0,0,100,0),
(858990,29,6702.86,-7370.25,52.9946,NULL,0,0,0,0,100,0),
(858990,30,6704.56,-7364.92,53.1367,NULL,0,0,0,0,100,0),
(858990,31,6706.76,-7358.03,53.1509,NULL,0,0,0,0,100,0),
(858990,32,6708.89,-7351.36,52.9651,NULL,0,0,0,0,100,0),
(858990,33,6711.51,-7343.14,52.7249,NULL,0,0,0,0,100,0),
(858990,34,6713.96,-7335.45,52.791,NULL,0,0,0,0,100,0),
(858990,35,6712.58,-7330.51,53.311,NULL,0,0,0,0,100,0),
(858990,36,6711.27,-7325.79,53.8238,NULL,0,0,0,0,100,0),
(858990,37,6710.11,-7321.63,53.8569,NULL,0,0,0,0,100,0),
(858990,38,6708.76,-7316.79,53.786,NULL,0,0,0,0,100,0),
(858990,39,6707.51,-7312.29,53.4134,NULL,0,0,0,0,100,0),
(858990,40,6706.45,-7308.47,52.7976,NULL,0,0,0,0,100,0),
(858990,41,6705.33,-7304.46,51.1744,NULL,0,0,0,0,100,0),
(858990,42,6700.73,-7305.75,51.6956,NULL,0,0,0,0,100,0),
(858990,43,6695.79,-7307.15,52.3664,NULL,0,0,0,0,100,0),
(858990,44,6690.74,-7308.57,52.2366,NULL,0,0,0,0,100,0),
(858990,45,6685.13,-7310.15,52.1694,NULL,0,0,0,0,100,0),
(858990,46,6679.29,-7311.8,52.2088,NULL,0,0,0,0,100,0),
(858990,47,6672.55,-7313.69,52.174,NULL,0,0,0,0,100,0),
(858990,48,6667.7,-7315.06,52.1524,NULL,0,0,0,0,100,0),
(858990,49,6665.59,-7321.85,52.1491,NULL,0,0,0,0,100,0),
(858990,50,6663.61,-7328.2,52.1491,NULL,0,0,0,0,100,0),
(858990,51,6661.4,-7335.33,52.1553,NULL,0,0,0,0,100,0),
(858990,52,6659.77,-7340.56,52.5836,NULL,0,0,0,0,100,0),
(858990,53,6658.11,-7345.91,53.2537,NULL,0,0,0,0,100,0),
(858990,54,6656.71,-7350.4,53.7458,NULL,0,0,0,0,100,0),
(858990,55,6659.7,-7353.45,54.4174,NULL,0,0,0,0,100,0),
(858990,56,6662.48,-7356.28,54.7895,NULL,0,0,0,0,100,0),
(858990,57,6665.42,-7359.28,55.2932,NULL,0,0,0,0,100,0),
(858990,58,6668.27,-7362.2,55.4508,NULL,0,0,0,0,100,0),
(858990,59,6671.56,-7365.55,55.1414,NULL,0,0,0,0,100,0),
(858990,60,6675.54,-7366.9,54.7704,NULL,0,0,0,0,100,0),
(858990,61,6680.51,-7368.58,54.1401,NULL,0,0,0,0,100,0),
(858990,62,6685.15,-7370.16,53.61,NULL,0,0,0,0,100,0),
(858990,63,6690.79,-7372.07,53.1595,NULL,0,0,0,0,100,0),
(858990,64,6696.09,-7373.86,52.9522,NULL,0,0,0,0,100,0),
(858990,65,6701.16,-7375.58,52.7348,NULL,0,0,0,0,100,0),
(858990,66,6696.68,-7378.86,52.8238,NULL,0,0,0,0,100,0),
(858990,67,6692.26,-7382.1,53.6069,NULL,0,0,0,0,100,0),
(858990,68,6689.61,-7384.04,55.7826,NULL,0,0,0,0,100,0),
(858990,69,6686.88,-7386.04,57.544,NULL,0,0,0,0,100,0),
(858990,70,6683.05,-7387.93,57.544,NULL,0,0,0,0,100,0),
(858990,71,6679.02,-7389.9,57.554,NULL,0,0,0,0,100,0),
(858990,72,6674.52,-7392.12,57.5556,NULL,0,0,0,0,100,0),
(858990,73,6672.62,-7396.48,57.5549,NULL,0,0,0,0,100,0),
(858990,74,6670.71,-7400.87,57.5549,NULL,0,0,0,0,100,0),
(858990,75,6668.66,-7405.57,57.5565,NULL,0,0,0,0,100,0),
(858990,76,6664.73,-7406.09,60.282,NULL,0,0,0,0,100,0),
(858990,77,6661.38,-7406.53,62.5594,NULL,0,0,0,0,100,0),
(858990,78,6658.72,-7406.88,63.9503,NULL,0,0,0,0,100,0),
(858990,79,6657.67,-7404.79,64.8243,NULL,0,0,0,0,100,0),
(858990,80,6656.35,-7402.17,64.9943,NULL,0,0,0,0,100,0),
(858990,81,6652.74,-7404.15,65.1693,NULL,0,0,0,0,100,0),
(858990,82,6647.12,-7407.22,65.0898,NULL,0,0,0,0,100,0),
(858990,83,6642.55,-7404.43,65.0514,NULL,0,0,0,0,100,0),
(858990,84,6641.91,-7401.46,66.7614,NULL,0,0,0,0,100,0),
(858990,85,6641.34,-7398.83,68.0017,NULL,0,0,0,0,100,0),
(858990,86,6642.38,-7396.16,69.2755,NULL,0,0,0,0,100,0),
(858990,87,6643.41,-7393.5,70.5205,NULL,0,0,0,0,100,0),
(858990,88,6648.29,-7390.26,70.474,NULL,0,0,0,0,100,0),
(858990,89,6655.34,-7388.64,70.474,NULL,0,0,0,0,100,0),
(858990,90,6662.75,-7386.94,70.4736,NULL,0,0,0,0,100,0),
(858990,91,6667.61,-7388.58,70.5183,NULL,0,0,0,0,100,0),
(858990,92,6672.84,-7390.35,70.5859,NULL,0,0,0,0,100,0),
(858990,93,6673.76,-7396.11,70.5707,NULL,0,0,0,0,100,0),
(858990,94,6674.76,-7402.3,70.4919,NULL,0,0,0,0,100,0),
(858990,95,6670.54,-7405.6,70.519,NULL,0,0,0,0,100,0),
(858990,96,6665.35,-7409.67,70.4741,NULL,0,0,0,0,100,0),
(858990,97,6659.47,-7407.42,70.5107,NULL,0,0,0,0,100,0);