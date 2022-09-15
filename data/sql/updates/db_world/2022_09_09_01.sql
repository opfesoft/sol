UPDATE `creature` SET `position_x` = 8746.17, `position_y` = -5997.96, `position_z` = 7.12695 WHERE `guid` = 56772;
UPDATE `creature` SET `position_x` = 8790.31, `position_y` = -6193.66, `position_z` = 7.73485, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 56759;
UPDATE `creature` SET `position_x` = 8718.25, `position_y` = -6103.35, `position_z` = 20.1502, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 55709;
UPDATE `creature` SET `position_x` = 8775.43, `position_y` = -6100.34, `position_z` = 72.9447, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 55716;
UPDATE `creature` SET `position_x` = 8801.93, `position_y` = -6091.14, `position_z` = 4.74149, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 56758;
UPDATE `creature` SET `position_x` = 8793.07, `position_y` = -5898.53, `position_z` = 11.0351, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 56770;

DELETE FROM `creature_addon` WHERE `guid` IN (56759,55709,55716,56758,56770);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(56759,567590,0,0,1,0,0,NULL),
(55709,557090,0,0,1,0,0,NULL),
(55716,557160,0,0,1,0,0,NULL),
(56758,567580,0,0,1,0,0,NULL),
(56770,567700,0,0,1,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16162;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16162,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wretched Hooligan - On Respawn - Set Active On (CONDITION_OBJECT_ENTRY_GUID)'),
(16162,0,1,0,0,0,100,0,8800,13700,9900,19500,0,11,29098,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wretched Hooligan - IC - Cast ''Bitter Withdrawal'''),
(16162,0,2,0,0,0,100,0,9900,12900,11900,17500,0,11,14873,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wretched Hooligan - IC - Cast ''Sinister Strike''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 16162;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,16162,0,0,31,1,3,0,56758,0,0,0,'Wretched Hooligan - Group 0: Execute SAI ID 0 only if has GUID 56758'),
(22,1,16162,0,1,31,1,3,0,56770,0,0,0,'Wretched Hooligan - Group 1: Execute SAI ID 0 only if has GUID 56770');

DELETE FROM `waypoint_data` WHERE `id` IN (567590,557090,557160,567580,567700);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
-- Wretched Hooligan
(567590,1,8790.31,-6193.66,7.73485,NULL,0,0,0,0,100,0),
(567590,2,8779.78,-6192.29,7.89445,NULL,0,0,0,0,100,0),
(567590,3,8770.89,-6191.13,7.89487,NULL,0,0,0,0,100,0),
(567590,4,8766.63,-6182.45,6.75683,NULL,0,0,0,0,100,0),
(567590,5,8762.53,-6174.08,6.52732,NULL,0,0,0,0,100,0),
(567590,6,8764.54,-6166.52,6.08854,NULL,0,0,0,0,100,0),
(567590,7,8767.07,-6157.05,5.54038,NULL,0,0,0,0,100,0),
(567590,8,8769.13,-6149.3,5.15793,NULL,0,0,0,0,100,0),
(567590,9,8777.39,-6139.94,4.45034,NULL,0,0,0,0,100,0),
(567590,10,8785.45,-6130.82,4.75285,NULL,0,0,0,0,100,0),
(567590,11,8795.04,-6124.59,4.74213,NULL,0,0,0,0,100,0),
(567590,12,8803.58,-6119.04,4.72727,NULL,0,0,0,0,100,0),
(567590,13,8804.47,-6110.1,4.72727,NULL,0,0,0,0,100,0),
(567590,14,8805.41,-6100.76,4.72593,NULL,0,0,0,0,100,0),
(567590,15,8804.47,-6110.1,4.72727,NULL,0,0,0,0,100,0),
(567590,16,8803.58,-6119.04,4.72727,NULL,0,0,0,0,100,0),
(567590,17,8795.04,-6124.59,4.74213,NULL,0,0,0,0,100,0),
(567590,18,8785.45,-6130.82,4.75285,NULL,0,0,0,0,100,0),
(567590,19,8777.39,-6139.94,4.45034,NULL,0,0,0,0,100,0),
(567590,20,8769.13,-6149.3,5.15793,NULL,0,0,0,0,100,0),
(567590,21,8767.07,-6157.05,5.54038,NULL,0,0,0,0,100,0),
(567590,22,8764.54,-6166.52,6.08854,NULL,0,0,0,0,100,0),
(567590,23,8762.53,-6174.08,6.52732,NULL,0,0,0,0,100,0),
(567590,24,8766.63,-6182.45,6.75683,NULL,0,0,0,0,100,0),
(567590,25,8770.89,-6191.13,7.89487,NULL,0,0,0,0,100,0),
(567590,26,8779.78,-6192.29,7.89445,NULL,0,0,0,0,100,0),
(567590,27,8790.31,-6193.66,7.73485,NULL,0,0,0,0,100,0),
(567590,28,8799.87,-6195.12,7.25776,NULL,0,0,0,0,100,0),
(567590,29,8811.72,-6196.94,6.86914,NULL,0,0,0,0,100,0),
(567590,30,8821.07,-6198.37,6.86914,NULL,0,0,0,0,100,0),
(567590,31,8811.72,-6196.94,6.86914,NULL,0,0,0,0,100,0),
(567590,32,8799.87,-6195.12,7.25776,NULL,0,0,0,0,100,0),
-- Wretched Thug
(557090,1,8718.25,-6103.35,20.1502,NULL,0,0,0,0,100,0),
(557090,2,8728.75,-6103.37,20.135,NULL,0,0,0,0,100,0),
(557090,3,8740.15,-6103.39,20.0461,NULL,0,0,0,0,100,0),
(557090,4,8751,-6106.61,20.0546,NULL,0,0,0,0,100,0),
(557090,5,8761.04,-6109.58,20.0448,NULL,0,0,0,0,100,0),
(557090,6,8770.79,-6105.69,20.0448,NULL,0,0,0,0,100,0),
(557090,7,8780.48,-6101.82,20.0448,NULL,0,0,0,0,100,0),
(557090,8,8789.08,-6101.23,20.2631,NULL,0,0,0,0,100,0),
(557090,9,8796.97,-6100.68,19.9918,NULL,0,0,0,0,100,0),
(557090,10,8794.66,-6107.78,20.4416,NULL,0,0,0,0,100,0),
(557090,11,8793.11,-6112.56,20.4977,4.50038,5000,0,0,0,100,0),
(557090,12,8793.07,-6102.52,20.2138,NULL,0,0,0,0,100,0),
(557090,13,8793.04,-6095,20.3142,NULL,0,0,0,0,100,0),
(557090,14,8787.9,-6084.79,21.3798,NULL,0,0,0,0,100,0),
(557090,15,8783.77,-6076.58,23.0932,NULL,0,0,0,0,100,0),
(557090,16,8778.62,-6073.83,25.3167,NULL,0,0,0,0,100,0),
(557090,17,8772.81,-6070.73,27.5286,NULL,0,0,0,0,100,0),
(557090,18,8764.3,-6070.68,31.8283,NULL,0,0,0,0,100,0),
(557090,19,8755.79,-6070.63,35.4588,NULL,0,0,0,0,100,0),
(557090,20,8747.81,-6072.53,39.5425,NULL,0,0,0,0,100,0),
(557090,21,8741.8,-6076.36,42.3673,NULL,0,0,0,0,100,0),
(557090,22,8736.91,-6079.48,45.0185,NULL,0,0,0,0,100,0),
(557090,23,8732.63,-6085.93,46.9326,NULL,0,0,0,0,100,0),
(557090,24,8729.06,-6091.32,48.9398,NULL,0,0,0,0,100,0),
(557090,25,8727.41,-6101.33,49.1015,NULL,0,0,0,0,100,0),
(557090,26,8729.06,-6091.32,48.9398,NULL,0,0,0,0,100,0),
(557090,27,8732.63,-6085.93,46.9326,NULL,0,0,0,0,100,0),
(557090,28,8736.91,-6079.48,45.0185,NULL,0,0,0,0,100,0),
(557090,29,8741.8,-6076.36,42.3673,NULL,0,0,0,0,100,0),
(557090,30,8747.81,-6072.53,39.5425,NULL,0,0,0,0,100,0),
(557090,31,8755.79,-6070.63,35.4588,NULL,0,0,0,0,100,0),
(557090,32,8764.3,-6070.68,31.8283,NULL,0,0,0,0,100,0),
(557090,33,8772.81,-6070.73,27.5286,NULL,0,0,0,0,100,0),
(557090,34,8778.62,-6073.83,25.3167,NULL,0,0,0,0,100,0),
(557090,35,8783.77,-6076.58,23.0932,NULL,0,0,0,0,100,0),
(557090,36,8787.9,-6084.79,21.3798,NULL,0,0,0,0,100,0),
(557090,37,8793.04,-6095,20.3142,NULL,0,0,0,0,100,0),
(557090,38,8789.08,-6101.23,20.2631,NULL,0,0,0,0,100,0),
(557090,39,8780.48,-6101.82,20.0448,NULL,0,0,0,0,100,0),
(557090,40,8770.79,-6105.69,20.0448,NULL,0,0,0,0,100,0),
(557090,41,8761.04,-6109.58,20.0448,NULL,0,0,0,0,100,0),
(557090,42,8751,-6106.61,20.0546,NULL,0,0,0,0,100,0),
(557090,43,8740.15,-6103.39,20.0461,NULL,0,0,0,0,100,0),
(557090,44,8728.75,-6103.37,20.135,NULL,0,0,0,0,100,0),
(557090,45,8718.25,-6103.35,20.1502,NULL,0,0,0,0,100,0),
(557090,46,8712.76,-6103.27,20.1487,NULL,0,0,0,0,100,0),
(557090,47,8709.32,-6103.21,18.8089,NULL,0,0,0,0,100,0),
(557090,48,8704.56,-6103.14,16.7851,NULL,0,0,0,0,100,0),
(557090,49,8701.07,-6103.09,16.7624,NULL,0,0,0,0,100,0),
(557090,50,8704.56,-6103.14,16.7851,NULL,0,0,0,0,100,0),
(557090,51,8709.32,-6103.21,18.8089,NULL,0,0,0,0,100,0),
(557090,52,8712.76,-6103.27,20.1487,NULL,0,0,0,0,100,0),
-- Wretched Thug
(557160,1,8775.43,-6100.34,72.9447,NULL,0,0,0,0,100,0),
(557160,2,8767.18,-6088.45,72.907,NULL,0,0,0,0,100,0),
(557160,3,8756.08,-6086.23,72.9515,NULL,0,0,0,0,100,0),
(557160,4,8746.54,-6092.94,72.9445,NULL,0,0,0,0,100,0),
(557160,5,8739.96,-6101.01,72.5704,NULL,0,0,0,0,100,0),
(557160,6,8739.29,-6106.15,72.2339,NULL,0,0,0,0,100,0),
(557160,7,8741.18,-6109.98,71.9362,NULL,0,0,0,0,100,0),
(557160,8,8743.73,-6115.14,70.1116,NULL,0,0,0,0,100,0),
(557160,9,8751.77,-6121.09,65.8816,NULL,0,0,0,0,100,0),
(557160,10,8759.72,-6124.35,61.4093,NULL,0,0,0,0,100,0),
(557160,11,8769.29,-6122.84,56.4363,NULL,0,0,0,0,100,0),
(557160,12,8776.36,-6117.56,52.6051,NULL,0,0,0,0,100,0),
(557160,13,8782.85,-6110.85,49.9702,NULL,0,0,0,0,100,0),
(557160,14,8784.83,-6101.67,49.2937,NULL,0,0,0,0,100,0),
(557160,15,8774.62,-6099.69,48.852,NULL,0,0,0,0,100,0),
(557160,16,8767.44,-6091.57,48.8797,NULL,0,0,0,0,100,0),
(557160,17,8752.72,-6089.39,48.8797,NULL,0,0,0,0,100,0),
(557160,18,8747.17,-6099.95,48.8797,NULL,0,0,0,0,100,0),
(557160,19,8732.91,-6102.68,49.083,NULL,0,0,0,0,100,0),
(557160,20,8728.81,-6112.85,48.9887,NULL,5000,0,0,0,100,0),
(557160,21,8732.91,-6102.68,49.083,NULL,0,0,0,0,100,0),
(557160,22,8747.17,-6099.95,48.8797,NULL,0,0,0,0,100,0),
(557160,23,8752.72,-6089.39,48.8797,NULL,0,0,0,0,100,0),
(557160,24,8767.39,-6091.57,48.8797,NULL,0,0,0,0,100,0),
(557160,25,8774.62,-6099.69,48.852,NULL,0,0,0,0,100,0),
(557160,26,8784.83,-6101.67,49.2937,NULL,0,0,0,0,100,0),
(557160,27,8782.85,-6110.85,49.9702,NULL,0,0,0,0,100,0),
(557160,28,8776.36,-6117.56,52.6051,NULL,0,0,0,0,100,0),
(557160,29,8769.29,-6122.84,56.4363,NULL,0,0,0,0,100,0),
(557160,30,8759.72,-6124.35,61.4093,NULL,0,0,0,0,100,0),
(557160,31,8751.77,-6121.09,65.8816,NULL,0,0,0,0,100,0),
(557160,32,8743.73,-6115.14,70.1116,NULL,0,0,0,0,100,0),
(557160,33,8741.18,-6109.98,71.9362,NULL,0,0,0,0,100,0),
(557160,34,8739.29,-6106.15,72.2339,NULL,0,0,0,0,100,0),
(557160,35,8739.96,-6101.01,72.5704,NULL,0,0,0,0,100,0),
(557160,36,8746.54,-6092.94,72.9445,NULL,0,0,0,0,100,0),
(557160,37,8756.08,-6086.23,72.9515,NULL,0,0,0,0,100,0),
(557160,38,8767.18,-6088.45,72.907,NULL,0,0,0,0,100,0),
-- Wretched Hooligan
(567580,1,8801.93,-6091.14,4.74149,NULL,0,0,0,0,100,0),
(567580,2,8794.43,-6082.45,4.75628,NULL,0,0,0,0,100,0),
(567580,3,8787.72,-6074.67,4.75635,NULL,0,0,0,0,100,0),
(567580,4,8782.35,-6068.44,4.75346,NULL,0,0,0,0,100,0),
(567580,5,8774.43,-6058.49,4.73026,NULL,0,0,0,0,100,0),
(567580,6,8768.59,-6051.16,4.72647,NULL,0,0,0,0,100,0),
(567580,7,8763.15,-6039.67,4.72646,NULL,0,0,0,0,100,0),
(567580,8,8758.57,-6030.01,4.74024,NULL,0,0,0,0,100,0),
(567580,9,8753.7,-6025.84,5.83625,NULL,0,0,0,0,100,0),
(567580,10,8748.2,-6021.14,6.52313,NULL,0,0,0,0,100,0),
(567580,11,8742.4,-6016.18,7.03515,NULL,0,0,0,0,100,0),
(567580,12,8734.77,-6009.65,7.5747,NULL,0,0,0,0,100,0),
(567580,13,8731.55,-6016.78,7.5747,NULL,0,0,0,0,100,0),
(567580,14,8727.47,-6025.82,7.70007,NULL,0,0,0,0,100,0),
(567580,15,8724.2,-6033.05,8.26153,NULL,0,0,0,0,100,0),
(567580,16,8722.36,-6042.31,9.29567,NULL,0,0,0,0,100,0),
(567580,17,8719.9,-6054.66,11.0003,NULL,0,0,0,0,100,0),
(567580,18,8717.83,-6065.09,12.0883,NULL,0,0,0,0,100,0),
(567580,19,8712.08,-6073.46,13.5967,NULL,0,0,0,0,100,0),
(567580,20,8705.74,-6082.69,15.2931,NULL,0,0,0,0,100,0),
(567580,21,8700.47,-6090.36,16.3977,NULL,0,0,0,0,100,0),
(567580,22,8695,-6098.35,16.873,NULL,0,0,0,0,100,0),
(567580,23,8689.88,-6105.83,17.3158,NULL,0,0,0,0,100,0),
(567580,24,8688.88,-6116.02,17.43,NULL,0,0,0,0,100,0),
(567580,25,8697.53,-6123.5,16.0638,NULL,0,0,0,0,100,0),
(567580,26,8705.7,-6130.57,15.0612,NULL,0,0,0,0,100,0),
(567580,27,8712.46,-6135.94,14.5277,NULL,0,0,0,0,100,0),
(567580,28,8718.67,-6140.87,14.3755,NULL,0,0,0,0,100,0),
(567580,29,8723.67,-6144.84,14.5014,NULL,0,0,0,0,100,0),
(567580,30,8730.74,-6146.33,15.2421,NULL,0,0,0,0,100,0),
(567580,31,8736.56,-6147.56,15.4104,NULL,0,0,0,0,100,0),
(567580,32,8742.84,-6148.88,14.4786,NULL,0,0,0,0,100,0),
(567580,33,8748.78,-6150.13,12.7055,NULL,0,0,0,0,100,0),
(567580,34,8752.89,-6148.48,11.3228,NULL,0,0,0,0,100,0),
(567580,35,8758.74,-6146.14,8.49849,NULL,0,0,0,0,100,0),
(567580,36,8764.69,-6143.76,5.08778,NULL,0,0,0,0,100,0),
(567580,37,8777.31,-6138.7,4.51601,NULL,0,0,0,0,100,0),
(567580,38,8787.47,-6131.87,4.74316,NULL,0,0,0,0,100,0),
(567580,39,8798.16,-6124.69,4.73009,NULL,0,0,0,0,100,0),
(567580,40,8800.57,-6117.13,4.73884,NULL,0,0,0,0,100,0),
(567580,41,8803.16,-6109.01,4.73463,NULL,0,0,0,0,100,0),
(567580,42,8802.5,-6099.47,4.73537,NULL,0,0,0,0,100,0),
-- Wretched Hooligan
(567700,1,8793.07,-5898.53,11.0351,NULL,0,0,0,0,100,0),
(567700,2,8789.29,-5900.37,11.0351,NULL,0,0,0,0,100,0),
(567700,3,8781.31,-5904.24,9.7303,NULL,0,0,0,0,100,0),
(567700,4,8770.51,-5909.48,7.97931,NULL,0,0,0,0,100,0),
(567700,5,8762.26,-5913.49,7.8951,NULL,0,0,0,0,100,0),
(567700,6,8756.74,-5918.34,7.8951,NULL,0,0,0,0,100,0),
(567700,7,8757.26,-5929.41,7.31966,NULL,0,0,0,0,100,0),
(567700,8,8757.76,-5940.24,6.51819,NULL,0,0,0,0,100,0),
(567700,9,8758.45,-5954.87,5.89754,NULL,0,0,0,0,100,0),
(567700,10,8758.98,-5966.32,5.41575,NULL,0,0,0,0,100,0),
(567700,11,8759.73,-5977.14,5.33315,NULL,0,0,0,0,100,0),
(567700,12,8760.36,-5986.34,5.23571,NULL,0,0,0,0,100,0),
(567700,13,8760.92,-5994.37,5.10297,NULL,0,0,0,0,100,0),
(567700,14,8760.81,-6008.38,4.78989,NULL,0,0,0,0,100,0),
(567700,15,8760.72,-6020.2,4.73644,NULL,0,0,0,0,100,0),
(567700,16,8761.03,-6033.97,4.72416,NULL,0,0,0,0,100,0),
(567700,17,8761.3,-6046.21,4.73194,NULL,0,0,0,0,100,0),
(567700,18,8771.85,-6055.42,4.72695,NULL,0,0,0,0,100,0),
(567700,19,8781.26,-6063.63,4.73866,NULL,0,0,0,0,100,0),
(567700,20,8787.7,-6072.36,4.75144,NULL,0,0,0,0,100,0),
(567700,21,8795.52,-6082.96,4.75475,NULL,0,0,0,0,100,0),
(567700,22,8802.36,-6092.24,4.73964,NULL,0,0,0,0,100,0),
(567700,23,8795.52,-6082.96,4.75475,NULL,0,0,0,0,100,0),
(567700,24,8787.7,-6072.36,4.75144,NULL,0,0,0,0,100,0),
(567700,25,8781.26,-6063.63,4.73866,NULL,0,0,0,0,100,0),
(567700,26,8771.85,-6055.42,4.72695,NULL,0,0,0,0,100,0),
(567700,27,8761.3,-6046.21,4.73194,NULL,0,0,0,0,100,0),
(567700,28,8761.03,-6033.97,4.72416,NULL,0,0,0,0,100,0),
(567700,29,8760.72,-6020.2,4.73644,NULL,0,0,0,0,100,0),
(567700,30,8760.81,-6008.38,4.78989,NULL,0,0,0,0,100,0),
(567700,31,8760.92,-5994.37,5.10297,NULL,0,0,0,0,100,0),
(567700,32,8760.36,-5986.34,5.23571,NULL,0,0,0,0,100,0),
(567700,33,8759.73,-5977.14,5.33315,NULL,0,0,0,0,100,0),
(567700,34,8758.98,-5966.32,5.41575,NULL,0,0,0,0,100,0),
(567700,35,8758.45,-5954.87,5.89754,NULL,0,0,0,0,100,0),
(567700,36,8757.76,-5940.24,6.51819,NULL,0,0,0,0,100,0),
(567700,37,8757.26,-5929.41,7.31966,NULL,0,0,0,0,100,0),
(567700,38,8756.74,-5918.34,7.8951,NULL,0,0,0,0,100,0),
(567700,39,8762.26,-5913.49,7.8951,NULL,0,0,0,0,100,0),
(567700,40,8770.51,-5909.48,7.97931,NULL,0,0,0,0,100,0),
(567700,41,8781.31,-5904.24,9.7303,NULL,0,0,0,0,100,0),
(567700,42,8789.29,-5900.37,11.0351,NULL,0,0,0,0,100,0);