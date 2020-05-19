-- DB update 2020_05_19_01 -> 2020_05_19_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_19_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_19_01 2020_05_19_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1589924499795142584'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1589924499795142584');

-- Brontus: Reduce walking speed
UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry` = 5827;


-- Narillasanz: Set active on respawn
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2447 AND `source_type` = 0 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2447,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Narillasanz - On Respawn - Set Active On');


-- Lethlas: Set active on respawn
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 5312;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 5312 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5312,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lethlas - On Respawn - Set Active On');


-- Axtroz: Set active on respawn
DELETE FROM `smart_scripts` WHERE `entryorguid` = 12899 AND `source_type` = 0 AND `id` = 3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(12899,0,3,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Axtroz - On Respawn - Set Active On');


-- Manaclaw: Enable random movement
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 25 WHERE `guid` = 42266;


-- Baron Charr: Set active on respawn; reduce walking speed
UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry` = 14461;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 14461 AND `source_type` = 0 AND `id` = 30;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14461,0,30,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Baron Charr - On Respawn - Set Active On');


-- Avalanchion: Set active on respawn; reduce walking speed
UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry` = 14464;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 14464 AND `source_type` = 0 AND `id` = 43;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14464,0,43,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Avalanchion - On Respawn - Set Active On');


-- Princess Tempestria: Set active on respawn; reduce walking speed
UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry` = 14457;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 14457 AND `source_type` = 0 AND `id` = 32;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14457,0,32,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Princess Tempestria - On Respawn - Set Active On');


-- The Windreaver: Set active on respawn; reduce walking speed
UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry` = 14454;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 14454 AND `source_type` = 0 AND `id` = 31;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14454,0,31,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Windreaver - On Respawn - Set Active On');


-- Spellmaw: Waypoint movement; set active on respawn
UPDATE `creature` SET `position_x` = 6244.94, `position_y` = -4445.96, `position_z` = 685.532, `orientation` = 2.60059, `MovementType` = 2 WHERE `guid` = 42265;
UPDATE `creature_addon` SET `path_id` = 422650 WHERE `guid` = 42265;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 10662 AND `source_type` = 0 AND `id` = 3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10662,0,3,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spellmaw - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 422650;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(422650,1,6244.94,-4445.96,685.532,0,0,0,0,100,5010564),
(422650,2,6233.7,-4439.07,681.161,0,0,0,0,100,5010565),
(422650,3,6217.5,-4433.79,675.291,0,0,0,0,100,5010566),
(422650,4,6201.63,-4432.04,671.769,0,0,0,0,100,5010567),
(422650,5,6186.01,-4431.6,666.71,0,0,0,0,100,5010568),
(422650,6,6174.02,-4432.4,662.288,0,0,0,0,100,5010569),
(422650,7,6160.23,-4434,660.884,0,0,0,0,100,5010570),
(422650,8,6147.4,-4435.73,661.551,0,0,0,0,100,5010571),
(422650,9,6131.54,-4438.43,661.76,0,0,0,0,100,5010572),
(422650,10,6116.49,-4441.68,662.462,0,0,0,0,100,5010573),
(422650,11,6105.77,-4444.03,667.484,0,0,0,0,100,5010574),
(422650,12,6097.3,-4444.53,674.149,0,0,0,0,100,5010575),
(422650,13,6089.59,-4442.28,681.047,0,0,0,0,100,5010576),
(422650,14,6080.1,-4437.54,688.214,0,0,0,0,100,5010577),
(422650,15,6071.23,-4433.38,693.324,0,0,0,0,100,5010578),
(422650,16,6060.97,-4429.54,696.919,0,0,0,0,100,5010579),
(422650,17,6049.45,-4427.94,699.534,0,0,0,0,100,5010580),
(422650,18,6035.65,-4429.1,701.115,0,0,0,0,100,5010581),
(422650,19,6022.48,-4431.61,704.2,0,0,0,0,100,5010582),
(422650,20,6010.99,-4437.02,705.549,0,0,0,0,100,5010583),
(422650,21,5999.66,-4443.76,705.32,0,0,0,0,100,5010584),
(422650,22,5988.63,-4453.11,706.276,0,0,0,0,100,5010585),
(422650,23,5980.32,-4464.38,705.87,0,0,0,0,100,5010586),
(422650,24,5973.5,-4477.01,705.054,0,0,0,0,100,5010587),
(422650,25,5967.59,-4491.47,706.484,0,0,0,0,100,5010588),
(422650,26,5962.21,-4506.88,710.475,0,0,0,0,100,5010589),
(422650,27,5957.35,-4521.24,712.76,0,0,0,0,100,5010590),
(422650,28,5953.09,-4537.25,714.241,0,0,0,0,100,5010591),
(422650,29,5951.49,-4546.09,714.81,0,0,0,0,100,5010592),
(422650,30,5949.9,-4558.47,713.707,0,0,0,0,100,5010593),
(422650,31,5949.91,-4571.04,714.071,0,0,0,0,100,5010594),
(422650,32,5951.46,-4582.9,715.085,0,0,0,0,100,5010595),
(422650,33,5955.55,-4593.3,715.606,0,0,0,0,100,5010596),
(422650,34,5960.9,-4600.05,715.811,0,0,0,0,100,5010597),
(422650,35,5966.35,-4604.76,715.741,0,0,0,0,100,5010598),
(422650,36,5973.96,-4608.77,714.903,0,0,0,0,100,5010599),
(422650,37,5983.35,-4611.09,713.836,0,0,0,0,100,5010600),
(422650,38,5995.85,-4614,715.986,0,0,0,0,100,5010601),
(422650,39,6007.03,-4618.68,717.425,0,0,0,0,100,5010602),
(422650,40,6020.01,-4622.88,718.807,0,0,0,0,100,5010603),
(422650,41,6034.04,-4628.93,718.74,0,0,0,0,100,5010604),
(422650,42,6046.3,-4633.46,716.102,0,0,0,0,100,5010605),
(422650,43,6058.79,-4638.02,713.985,0,0,0,0,100,5010606),
(422650,44,6071.61,-4641.99,712.432,0,0,0,0,100,5010607),
(422650,45,6085.02,-4645.11,712.573,0,0,0,0,100,5010608),
(422650,46,6098.76,-4647.77,714.144,0,0,0,0,100,5010609),
(422650,47,6111.46,-4649.56,714.237,0,0,0,0,100,5010610),
(422650,48,6121.66,-4650.73,713.008,0,0,0,0,100,5010611),
(422650,49,6130.94,-4651.69,712.421,0,0,0,0,100,5010612),
(422650,50,6141.87,-4652.65,712.982,0,0,0,0,100,5010613),
(422650,51,6153.73,-4653.69,714.792,0,0,0,0,100,5010614),
(422650,52,6165.69,-4654.85,716.673,0,0,0,0,100,5010615),
(422650,53,6178.97,-4655.13,718.399,0,0,0,0,100,5010616),
(422650,54,6185.25,-4654.69,718.614,0,0,0,0,100,5010617),
(422650,55,6193.55,-4652.01,716.881,0,0,0,0,100,5010618),
(422650,56,6202.61,-4648.92,714.945,0,0,0,0,100,5010619),
(422650,57,6212.4,-4644.32,713.609,0,0,0,0,100,5010620),
(422650,58,6221.79,-4638.22,712.972,0,0,0,0,100,5010621),
(422650,59,6229.69,-4632.42,712.849,0,0,0,0,100,5010622),
(422650,60,6237.22,-4626.71,711.342,0,0,0,0,100,5010623),
(422650,61,6243.32,-4620.15,708.162,0,0,0,0,100,5010624),
(422650,62,6247.37,-4613.88,704.273,0,0,0,0,100,5010625),
(422650,63,6251.17,-4607.46,701.772,0,0,0,0,100,5010626),
(422650,64,6254.75,-4601.3,699.006,0,0,0,0,100,5010627),
(422650,65,6257.93,-4594.82,697.707,0,0,0,0,100,5010628),
(422650,66,6259.53,-4587.9,697.036,0,0,0,0,100,5010629),
(422650,67,6258.96,-4579.07,696.852,0,0,0,0,100,5010630),
(422650,68,6255.95,-4569.03,696.209,0,0,0,0,100,5010631),
(422650,69,6252.18,-4558.36,695.239,0,0,0,0,100,5010632),
(422650,70,6248.11,-4547.06,693.901,0,0,0,0,100,5010633),
(422650,71,6244.07,-4536.61,693.39,0,0,0,0,100,5010634),
(422650,72,6240.37,-4527.29,693.373,0,0,0,0,100,5010635),
(422650,73,6238.27,-4518.32,692.48,0,0,0,0,100,5010636),
(422650,74,6237.96,-4509.35,690.554,0,0,0,0,100,5010637),
(422650,75,6239.48,-4498.63,688.4,0,0,0,0,100,5010638),
(422650,76,6242.98,-4487.26,686.922,0,0,0,0,100,5010639),
(422650,77,6246.74,-4476.96,686.94,0,0,0,0,100,5010640),
(422650,78,6249.7,-4467.62,687.37,0,0,0,0,100,5010641),
(422650,79,6250.59,-4459.77,687.324,0,0,0,0,100,5010642),
(422650,80,6249.49,-4452.9,686.744,0,0,0,0,100,5010643);


-- Azurous: Waypoint movement; set active on respawn; reduce walking speed
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 10202;
UPDATE `creature` SET `position_x` = 6622.02, `position_y` = -4919.98, `position_z` = 704.48, `orientation` = 2.01207, `MovementType` = 2 WHERE `guid` = 51890;
DELETE FROM `creature_addon` WHERE `guid` = 51890;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(51890,518900,0,0,0,0,0,'');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 10202 AND `source_type` = 0 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10202,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Azurous - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 518900;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(518900,1,6622.02,-4919.98,704.48,0,0,0,0,100,0),
(518900,2,6617.92,-4914.93,704.818,0,0,0,0,100,0),
(518900,3,6611.45,-4911.84,704.761,0,0,0,0,100,0),
(518900,4,6604.12,-4912.74,704.382,0,0,0,0,100,0),
(518900,5,6596.43,-4916.61,704.015,0,0,0,0,100,0),
(518900,6,6587.84,-4921.32,704.5,0,0,0,0,100,0),
(518900,7,6579.58,-4926.13,705.816,0,0,0,0,100,0),
(518900,8,6571.1,-4930.29,706.758,0,0,0,0,100,0),
(518900,9,6561.86,-4933.87,707.594,0,0,0,0,100,0),
(518900,10,6552.68,-4937.31,709.101,0,0,0,0,100,0),
(518900,11,6543.42,-4940.53,711.063,0,0,0,0,100,0),
(518900,12,6533.32,-4943.76,713.545,0,0,0,0,100,0),
(518900,13,6522.62,-4947.07,717.363,0,0,0,0,100,0),
(518900,14,6512.79,-4950.72,721.159,0,0,0,0,100,0),
(518900,15,6503.84,-4955.72,724.034,0,0,0,0,100,0),
(518900,16,6495.25,-4961.75,726.051,0,0,0,0,100,0),
(518900,17,6486.92,-4968.33,727.938,0,0,0,0,100,0),
(518900,18,6479.18,-4974.72,730.052,0,0,0,0,100,0),
(518900,19,6471.5,-4981.7,732.138,0,0,0,0,100,0),
(518900,20,6462.5,-4989.47,734.411,0,0,0,0,100,0),
(518900,21,6456.42,-4993.8,735.607,0,0,0,0,100,0),
(518900,22,6448.35,-4998.46,736.018,0,0,0,0,100,0),
(518900,23,6441.13,-5002.03,737.462,0,0,0,0,100,0),
(518900,24,6431.2,-5006.1,740.256,0,0,0,0,100,0),
(518900,25,6422.1,-5009.73,741.746,0,0,0,0,100,0),
(518900,26,6412.14,-5013.73,743.44,0,0,0,0,100,0),
(518900,27,6402.4,-5017.65,744.714,0,0,0,0,100,0),
(518900,28,6392.18,-5021.64,745.911,0,0,0,0,100,0),
(518900,29,6382.22,-5024.52,747.516,0,0,0,0,100,0),
(518900,30,6371.63,-5027.35,750.094,0,0,0,0,100,0),
(518900,31,6361.53,-5029.7,752.998,0,0,0,0,100,0),
(518900,32,6350.84,-5031.56,755.954,0,0,0,0,100,0),
(518900,33,6340.44,-5032.98,758.452,0,0,0,0,100,0),
(518900,34,6330.32,-5033.71,760.365,0,0,0,0,100,0),
(518900,35,6319.14,-5034.43,762.259,0,0,0,0,100,0),
(518900,36,6307.4,-5035.35,764.965,0,0,0,0,100,0),
(518900,37,6295.99,-5036.12,768.06,0,0,0,0,100,0),
(518900,38,6285.63,-5036.81,770.784,0,0,0,0,100,0),
(518900,39,6274.45,-5037.43,772.462,0,0,0,0,100,0),
(518900,40,6261.66,-5038.49,773.557,0,0,0,0,100,0),
(518900,41,6250.17,-5039.64,774.618,0,0,0,0,100,0),
(518900,42,6238.35,-5041.02,775.649,0,0,0,0,100,0),
(518900,43,6226.89,-5042.48,777.426,0,0,0,0,100,0),
(518900,44,6215.6,-5043.17,778.868,0,0,0,0,100,0),
(518900,45,6204.06,-5043.1,780.06,0,0,0,0,100,0),
(518900,46,6192.75,-5042.76,781.408,0,0,0,0,100,0),
(518900,47,6180.29,-5042.22,783.375,0,0,0,0,100,0),
(518900,48,6167.37,-5041.39,785.615,0,0,0,0,100,0),
(518900,49,6154.48,-5040.21,787.549,0,0,0,0,100,0),
(518900,50,6142.63,-5039.12,789.132,0,0,0,0,100,0),
(518900,51,6129.49,-5037.98,790.06,0,0,0,0,100,0),
(518900,52,6118.95,-5036.71,791.37,0,0,0,0,100,0),
(518900,53,6108.38,-5034.32,791.507,0,0,0,0,100,0),
(518900,54,6098.17,-5029.48,790.363,0,0,0,0,100,0),
(518900,55,6088.95,-5023.99,788.438,0,0,0,0,100,0),
(518900,56,6080.65,-5017.75,786.145,0,0,0,0,100,0),
(518900,57,6072.83,-5011.83,783.864,0,0,0,0,100,0),
(518900,58,6065.52,-5007.04,782.116,0,0,0,0,100,0),
(518900,59,6057.82,-5004.44,780.906,0,0,0,0,100,0),
(518900,60,6050.52,-5004.17,780.473,0,0,0,0,100,0),
(518900,61,6043.64,-5005.88,780.804,0,0,0,0,100,0),
(518900,62,6036.83,-5009.85,781.164,0,0,0,0,100,0),
(518900,63,6032.03,-5015.49,781.523,0,0,0,0,100,0),
(518900,64,6030.38,-5022.2,781.986,0,0,0,0,100,0),
(518900,65,6032.64,-5029.19,782.539,0,0,0,0,100,0),
(518900,66,6037.37,-5033.38,783.406,0,0,0,0,100,0),
(518900,67,6043.85,-5036.24,784.424,0,0,0,0,100,0),
(518900,68,6051.07,-5038.11,785.766,0,0,0,0,100,0),
(518900,69,6058.63,-5039.54,787.709,0,0,0,0,100,0),
(518900,70,6067.38,-5040.99,789.604,0,0,0,0,100,0),
(518900,71,6076.21,-5041.8,791.088,0,0,0,0,100,0),
(518900,72,6085.51,-5042.58,792.411,0,0,0,0,100,0),
(518900,73,6093.9,-5042.79,792.73,0,0,0,0,100,0),
(518900,74,6103.7,-5043.06,792.697,0,0,0,0,100,0),
(518900,75,6112.9,-5043.47,791.889,0,0,0,0,100,0),
(518900,76,6122.78,-5044.36,790.746,0,0,0,0,100,0),
(518900,77,6133.14,-5044.99,789.317,0,0,0,0,100,0),
(518900,78,6143.63,-5045.5,788.695,0,0,0,0,100,0),
(518900,79,6154.23,-5046.06,787.464,0,0,0,0,100,0),
(518900,80,6164.49,-5046.55,786.24,0,0,0,0,100,0),
(518900,81,6174.74,-5046.97,784.734,0,0,0,0,100,0),
(518900,82,6185.93,-5047.46,782.665,0,0,0,0,100,0),
(518900,83,6197.95,-5047.7,780.825,0,0,0,0,100,0),
(518900,84,6209.96,-5047.92,779.402,0,0,0,0,100,0),
(518900,85,6221.86,-5048.08,777.978,0,0,0,0,100,0),
(518900,86,6234.46,-5047.79,775.569,0,0,0,0,100,0),
(518900,87,6246.34,-5047.21,774.19,0,0,0,0,100,0),
(518900,88,6260.46,-5047,773.675,0,0,0,0,100,0),
(518900,89,6273.4,-5047.07,772.649,0,0,0,0,100,0),
(518900,90,6285.3,-5046.99,771.262,0,0,0,0,100,0),
(518900,91,6297.78,-5046.48,768.223,0,0,0,0,100,0),
(518900,92,6309.91,-5046.06,765.237,0,0,0,0,100,0),
(518900,93,6322.37,-5045.39,762.564,0,0,0,0,100,0),
(518900,94,6335.3,-5044.62,760.113,0,0,0,0,100,0),
(518900,95,6346.03,-5044.44,758.396,0,0,0,0,100,0),
(518900,96,6356.94,-5042.87,756.127,0,0,0,0,100,0),
(518900,97,6368.24,-5041.05,753.242,0,0,0,0,100,0),
(518900,98,6379.91,-5038.24,750.03,0,0,0,0,100,0),
(518900,99,6391.13,-5033.68,747.266,0,0,0,0,100,0),
(518900,100,6402.75,-5027.97,745.282,0,0,0,0,100,0),
(518900,101,6415.26,-5021.94,743.559,0,0,0,0,100,0),
(518900,102,6426.88,-5016.21,741.418,0,0,0,0,100,0),
(518900,103,6437.68,-5010.44,739.081,0,0,0,0,100,0),
(518900,104,6447.1,-5005.05,736.331,0,0,0,0,100,0),
(518900,105,6457.65,-4998.83,735.248,0,0,0,0,100,0),
(518900,106,6467.69,-4992.45,733.418,0,0,0,0,100,0),
(518900,107,6476.85,-4986.85,731.489,0,0,0,0,100,0),
(518900,108,6486.79,-4981.2,729.51,0,0,0,0,100,0),
(518900,109,6495.43,-4976.35,727.392,0,0,0,0,100,0),
(518900,110,6504.67,-4972.46,724.764,0,0,0,0,100,0),
(518900,111,6517.23,-4970.72,720.474,0,0,0,0,100,0),
(518900,112,6529.21,-4969.76,716.784,0,0,0,0,100,0),
(518900,113,6540.99,-4969.52,714.119,0,0,0,0,100,0),
(518900,114,6555.09,-4968.94,712.064,0,0,0,0,100,0),
(518900,115,6566.61,-4968.12,710.414,0,0,0,0,100,0),
(518900,116,6577.91,-4967.33,709.272,0,0,0,0,100,0),
(518900,117,6588.28,-4965.77,708.471,0,0,0,0,100,0),
(518900,118,6598.03,-4962.32,707.509,0,0,0,0,100,0),
(518900,119,6605.93,-4958.11,706.417,0,0,0,0,100,0),
(518900,120,6612.05,-4951.71,705.374,0,0,0,0,100,0),
(518900,121,6617.25,-4944.83,705.073,0,0,0,0,100,0),
(518900,122,6621.94,-4936,705.021,0,0,0,0,100,0),
(518900,123,6623.56,-4927.14,704.524,0,0,0,0,100,0);


-- Somnus: Waypoint movement; set active on respawn; reduce walking speed
UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 12900;
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 42880;
DELETE FROM `creature_addon` WHERE `guid` = 42880;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(42880,428800,0,0,0,0,0,'');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 12900 AND `source_type` = 0 AND `id` = 4;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(12900,0,4,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Somnus - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 428800;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(428800,1,-10444.5,-4096.17,22.577,0,0,0,0,100,0),
(428800,2,-10457.5,-4092.69,22.2047,0,0,0,0,100,0),
(428800,3,-10465.6,-4088.63,21.8262,0,0,0,0,100,0),
(428800,4,-10475.7,-4080.75,19.5537,0,0,0,0,100,0),
(428800,5,-10483,-4073.73,17.4719,0,0,0,0,100,0),
(428800,6,-10488.1,-4068.75,18.6975,0,0,0,0,100,0),
(428800,7,-10493.4,-4063.64,20.9981,0,0,0,0,100,0),
(428800,8,-10500.1,-4058.62,23.2914,0,0,0,0,100,0),
(428800,9,-10508.2,-4056.17,23.1451,0,0,0,0,100,0),
(428800,10,-10517,-4055.57,22.4885,0,0,0,0,100,0),
(428800,11,-10526.5,-4055.98,22.3989,0,0,0,0,100,0),
(428800,12,-10535.5,-4054.81,22.3014,0,0,0,0,100,0),
(428800,13,-10544.2,-4052.74,21.6886,0,0,0,0,100,0),
(428800,14,-10554.7,-4048.92,22.7021,0,0,0,0,100,0),
(428800,15,-10566,-4043.78,22.419,0,0,0,0,100,0),
(428800,16,-10574.8,-4039.64,21.3849,0,0,0,0,100,0),
(428800,17,-10583.6,-4034.71,19.0654,0,0,0,0,100,0),
(428800,18,-10592.7,-4028.42,17.375,0,0,0,0,100,0),
(428800,19,-10601.9,-4021.19,18.3756,0,0,0,0,100,0),
(428800,20,-10607.7,-4016.34,20.2391,0,0,0,0,100,0),
(428800,21,-10615.8,-4009.31,21.7556,0,0,0,0,100,0),
(428800,22,-10624.3,-4001.63,21.8219,0,0,0,0,100,0),
(428800,23,-10632.7,-3994.89,21.7024,0,0,0,0,100,0),
(428800,24,-10640.8,-3988.65,21.8239,0,0,0,0,100,0),
(428800,25,-10649.4,-3983.99,21.8291,0,0,0,0,100,0),
(428800,26,-10659.5,-3979.09,21.8387,0,0,0,0,100,0),
(428800,27,-10668.9,-3974.94,21.6786,0,0,0,0,100,0),
(428800,28,-10679.4,-3971.85,22.5443,0,0,0,0,100,0),
(428800,29,-10689.7,-3969.08,24.1892,0,0,0,0,100,0),
(428800,30,-10698.4,-3968,23.408,0,0,0,0,100,0),
(428800,31,-10707.5,-3968.11,21.6708,0,0,0,0,100,0),
(428800,32,-10717.6,-3968.13,20.6174,0,0,0,0,100,0),
(428800,33,-10726.4,-3968.42,18.333,0,0,0,0,100,0),
(428800,34,-10736.8,-3969.63,17.3743,0,0,0,0,100,0),
(428800,35,-10746.9,-3972.51,17.3743,0,0,0,0,100,0),
(428800,36,-10756.9,-3977.82,17.3748,0,0,0,0,100,0),
(428800,37,-10763,-3986.22,17.3747,0,0,0,0,100,0),
(428800,38,-10764.6,-3995.3,17.5784,0,0,0,0,100,0),
(428800,39,-10761.6,-4005.49,17.6849,0,0,0,0,100,0),
(428800,40,-10760.5,-4014.38,17.3738,0,0,0,0,100,0),
(428800,41,-10758.7,-4025.55,17.505,0,0,0,0,100,0),
(428800,42,-10756.6,-4034.3,19.6844,0,0,0,0,100,0),
(428800,43,-10754,-4045.06,22.4352,0,0,0,0,100,0),
(428800,44,-10751.7,-4054.35,22.3428,0,0,0,0,100,0),
(428800,45,-10749.3,-4063.59,20.0479,0,0,0,0,100,0),
(428800,46,-10744.8,-4072.45,18.7404,0,0,0,0,100,0),
(428800,47,-10739.6,-4083.14,17.9805,0,0,0,0,100,0),
(428800,48,-10736.2,-4092.81,18.59,0,0,0,0,100,0),
(428800,49,-10734.3,-4103.71,17.6885,0,0,0,0,100,0),
(428800,50,-10733.1,-4112.14,17.375,0,0,0,0,100,0),
(428800,51,-10730.5,-4120.13,17.375,0,0,0,0,100,0),
(428800,52,-10727.7,-4128.78,17.375,0,0,0,0,100,0),
(428800,53,-10724.8,-4137.28,18.1252,0,0,0,0,100,0),
(428800,54,-10721.2,-4146.12,19.675,0,0,0,0,100,0),
(428800,55,-10717.2,-4154.83,21.055,0,0,0,0,100,0),
(428800,56,-10712.7,-4161.23,20.3666,0,0,0,0,100,0),
(428800,57,-10706.1,-4169.02,19.7918,0,0,0,0,100,0),
(428800,58,-10699.2,-4176.04,20.9137,0,0,0,0,100,0),
(428800,59,-10691.6,-4183.27,21.4609,0,0,0,0,100,0),
(428800,60,-10683.7,-4189.05,21.9644,0,0,0,0,100,0),
(428800,61,-10675.3,-4194.91,22.6577,0,0,0,0,100,0),
(428800,62,-10664.6,-4202.48,22.1604,0,0,0,0,100,0),
(428800,63,-10655.1,-4209.05,22.6945,0,0,0,0,100,0),
(428800,64,-10646.1,-4214.9,23.4266,0,0,0,0,100,0),
(428800,65,-10637.8,-4221.7,22.4465,0,0,0,0,100,0),
(428800,66,-10630.3,-4228.86,22.5822,0,0,0,0,100,0),
(428800,67,-10622.5,-4235.32,22.2016,0,0,0,0,100,0),
(428800,68,-10612.4,-4238.89,22.1881,0,0,0,0,100,0),
(428800,69,-10603.3,-4240.55,22.0485,0,0,0,0,100,0),
(428800,70,-10590.2,-4245.76,21.764,0,0,0,0,100,0),
(428800,71,-10580.1,-4249.66,22.0328,0,0,0,0,100,0),
(428800,72,-10570.1,-4253.72,23.5658,0,0,0,0,100,0),
(428800,73,-10560,-4257.55,23.3252,0,0,0,0,100,0),
(428800,74,-10550.3,-4260.65,22.8291,0,0,0,0,100,0),
(428800,75,-10540.8,-4262.04,21.9688,0,0,0,0,100,0),
(428800,76,-10531.3,-4262.35,21.827,0,0,0,0,100,0),
(428800,77,-10523.5,-4262.24,22.5119,0,0,0,0,100,0),
(428800,78,-10515.4,-4261.69,24.0218,0,0,0,0,100,0),
(428800,79,-10506.2,-4260.61,22.4106,0,0,0,0,100,0),
(428800,80,-10495.8,-4258.82,23.5275,0,0,0,0,100,0),
(428800,81,-10486.8,-4255.58,22.5814,0,0,0,0,100,0),
(428800,82,-10478.1,-4249.31,22.4273,0,0,0,0,100,0),
(428800,83,-10470.5,-4242.72,21.8764,0,0,0,0,100,0),
(428800,84,-10461.7,-4235.44,23.0855,0,0,0,0,100,0),
(428800,85,-10455.6,-4227.85,23.0395,0,0,0,0,100,0),
(428800,86,-10449.5,-4219.11,21.1632,0,0,0,0,100,0),
(428800,87,-10444.3,-4211.12,18.9765,0,0,0,0,100,0),
(428800,88,-10439.9,-4204.76,17.6034,0,0,0,0,100,0),
(428800,89,-10435.1,-4197.35,17.3742,0,0,0,0,100,0),
(428800,90,-10430.8,-4190.41,18.5392,0,0,0,0,100,0),
(428800,91,-10426.3,-4182.79,20.6721,0,0,0,0,100,0),
(428800,92,-10421.2,-4173.87,22.5499,0,0,0,0,100,0),
(428800,93,-10417.2,-4166.86,22.9217,0,0,0,0,100,0),
(428800,94,-10414,-4157.91,21.8136,0,0,0,0,100,0),
(428800,95,-10414,-4147.19,21.9228,0,0,0,0,100,0),
(428800,96,-10416.3,-4138.42,21.9794,0,0,0,0,100,0),
(428800,97,-10420,-4130.28,23.5043,0,0,0,0,100,0),
(428800,98,-10424.7,-4122.87,24.0123,0,0,0,0,100,0),
(428800,99,-10429,-4112.19,22.1187,0,0,0,0,100,0),
(428800,100,-10435.3,-4103.29,22.7328,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
