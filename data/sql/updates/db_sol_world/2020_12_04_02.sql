-- DB update 2020_12_04_01 -> 2020_12_04_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_04_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_04_01 2020_12_04_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607082696122871325'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607082696122871325');

DELETE FROM `pool_template` WHERE `entry` = 1021;
DELETE FROM `pool_creature` WHERE `pool_entry` = 1021;

DELETE FROM `creature` WHERE `guid` IN (134210,134211,134212,134213,134214,134215,134216,134217,134218,134219);

UPDATE `creature` SET `position_x` = -13771.4, `position_y` = -194.148, `position_z` = 23.583, `MovementType` = 2 WHERE `guid` = 49126;

DELETE FROM `creature_addon` WHERE `guid` = 49126;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(49126,491260,0,0,0,0,0,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 14491;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 14491 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14491,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kurmokk - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 491260;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(491260,1,-13771.4,-194.148,23.583,0,0,0,0,100,0),
(491260,2,-13776.6,-190.049,19.6969,0,0,0,0,100,0),
(491260,3,-13782.8,-185.235,17.1134,0,0,0,0,100,0),
(491260,4,-13788.4,-180.857,16.0621,0,0,0,0,100,0),
(491260,5,-13794.3,-176.258,15.9791,0,0,0,0,100,0),
(491260,6,-13800.7,-171.255,16.7519,0,0,0,0,100,0),
(491260,7,-13804,-166.883,17.3291,0,0,0,0,100,0),
(491260,8,-13809.2,-160.111,16.8701,0,0,0,0,100,0),
(491260,9,-13813.3,-154.731,17.0486,0,0,0,0,100,0),
(491260,10,-13819.1,-147.118,17.2666,0,0,0,0,100,0),
(491260,11,-13825.3,-138.949,17.0619,0,0,0,0,100,0),
(491260,12,-13828.2,-131.809,16.1206,0,0,0,0,100,0),
(491260,13,-13831.1,-124.572,15.1084,0,0,0,0,100,0),
(491260,14,-13833.7,-118.19,14.7812,0,0,0,0,100,0),
(491260,15,-13836.3,-111.815,14.7832,0,0,0,0,100,0),
(491260,16,-13839.2,-104.739,15.7448,0,0,0,0,100,0),
(491260,17,-13841.5,-102.365,15.1427,0,0,0,0,100,0),
(491260,18,-13844.8,-99.0449,14.3133,0,0,0,0,100,0),
(491260,19,-13847.9,-95.8738,15.2491,0,0,0,0,100,0),
(491260,20,-13851.3,-92.3913,16.438,0,0,0,0,100,0),
(491260,21,-13854.5,-89.1006,16.511,0,0,0,0,100,0),
(491260,22,-13857.6,-86.6878,16.6512,0,0,0,0,100,0),
(491260,23,-13861.5,-83.5913,18.2789,0,0,0,0,100,0),
(491260,24,-13865.6,-80.417,20.1678,0,0,0,0,100,0),
(491260,25,-13868.9,-77.753,20.9915,0,0,0,0,100,0),
(491260,26,-13873.1,-74.4802,20.5508,0,0,0,0,100,0),
(491260,27,-13876.1,-72.0979,20.5621,0,0,0,0,100,0),
(491260,28,-13880.1,-68.9872,22.9198,0,0,0,0,100,0),
(491260,29,-13881.6,-64.4338,25.0212,0,0,0,0,100,0),
(491260,30,-13883.2,-59.4403,26.269,0,0,0,0,100,0),
(491260,31,-13884.6,-54.9285,27.637,0,0,0,0,100,0),
(491260,32,-13887.4,-51.2178,28.4213,0,0,0,0,100,0),
(491260,33,-13889.8,-48.0578,30.1461,0,0,0,0,100,0),
(491260,34,-13893,-43.8751,30.715,0,0,0,0,100,0),
(491260,35,-13897.1,-38.4292,30.8359,0,0,0,0,100,0),
(491260,36,-13900.6,-33.7786,29.8016,0,0,0,0,100,0),
(491260,37,-13903.9,-29.4088,29.5113,0,0,0,0,100,0),
(491260,38,-13904.9,-24.2396,29.0149,0,0,0,0,100,0),
(491260,39,-13905.5,-20.596,29.1553,0,0,0,0,100,0),
(491260,40,-13906.7,-14.1673,28.1542,0,0,0,0,100,0),
(491260,41,-13907.9,-7.801,27.4434,0,0,0,0,100,0),
(491260,42,-13909.6,-1.97179,25.3757,0,0,0,0,100,0),
(491260,43,-13911.8,5.76907,21.7238,0,0,0,0,100,0),
(491260,44,-13913.7,12.507,19.9762,0,0,0,0,100,0),
(491260,45,-13915.3,17.9535,18.3758,0,0,0,0,100,0),
(491260,46,-13916.4,21.9989,16.6151,0,0,0,0,100,0),
(491260,47,-13917.5,25.832,15.024,0,0,0,0,100,0),
(491260,48,-13917.6,29.2531,14.283,0,0,0,0,100,0),
(491260,49,-13917.8,33.7948,15.3818,0,0,0,0,100,0),
(491260,50,-13918,39.0474,15.3134,0,0,0,0,100,0),
(491260,51,-13918.3,44.9924,15.4543,0,0,0,0,100,0),
(491260,52,-13918.5,50.2203,15.4537,0,0,0,0,100,0),
(491260,53,-13921.5,56.6727,14.5941,0,0,0,0,100,0),
(491260,54,-13924.3,62.7,14.5169,0,0,0,0,100,0),
(491260,55,-13927.3,69.0425,15.0905,0,0,0,0,100,0),
(491260,56,-13929.9,74.6447,15.9811,0,0,0,0,100,0),
(491260,57,-13932.5,80.2488,16.1549,0,0,0,0,100,0),
(491260,58,-13935.6,86.9033,15.8911,0,0,0,0,100,0),
(491260,59,-13942.3,89.6869,15.5798,0,0,0,0,100,0),
(491260,60,-13947.7,91.9461,15.7307,0,0,0,0,100,0),
(491260,61,-13953,94.1477,15.4125,0,0,0,0,100,0),
(491260,62,-13958,96.2463,15.2997,0,0,0,0,100,0),
(491260,63,-13962.9,99.1734,15.47,0,0,0,0,100,0),
(491260,64,-13967.6,101.982,15.0949,0,0,0,0,100,0),
(491260,65,-13973,105.211,14.1287,0,0,0,0,100,0),
(491260,66,-13977.5,107.883,13.9424,0,0,0,0,100,0),
(491260,67,-13981.8,111.963,14.6108,0,0,0,0,100,0),
(491260,68,-13985.8,115.708,14.8719,0,0,0,0,100,0),
(491260,69,-13989.7,119.395,14.5143,0,0,0,0,100,0),
(491260,70,-13993.2,122.754,14.436,0,0,0,0,100,0),
(491260,71,-13996.9,126.204,14.4753,0,0,0,0,100,0),
(491260,72,-13999.5,132.458,14.7252,0,0,0,0,100,0),
(491260,73,-14002.1,138.821,14.6696,0,0,0,0,100,0),
(491260,74,-14004.2,143.879,14.8059,0,0,0,0,100,0),
(491260,75,-14006,148.082,14.7422,0,0,0,0,100,0),
(491260,76,-14008,152.994,13.5225,0,0,0,0,100,0),
(491260,77,-14008.3,158.934,13.5239,0,0,0,0,100,0),
(491260,78,-14008.6,164.294,13.7182,0,0,0,0,100,0),
(491260,79,-14008.9,167.945,13.0349,0,0,0,0,100,0),
(491260,80,-14009.1,172.527,11.6973,0,0,0,0,100,0),
(491260,81,-14009.4,177.376,12.3408,0,0,0,0,100,0),
(491260,82,-14009.7,182.66,13.3531,0,0,0,0,100,0),
(491260,83,-14013.7,187.221,12.8395,0,0,0,0,100,0),
(491260,84,-14017.8,191.867,12.9104,0,0,0,0,100,0),
(491260,85,-14022.4,197.13,13.2064,0,0,0,0,100,0),
(491260,86,-14028.5,200.078,13.4085,0,0,0,0,100,0),
(491260,87,-14034.3,202.871,13.4728,0,0,0,0,100,0),
(491260,88,-14040.9,206.072,12.7928,0,0,0,0,100,0),
(491260,89,-14046.6,208.816,12.0674,0,0,0,0,100,0),
(491260,90,-14051.9,211.407,12.9216,0,0,0,0,100,0),
(491260,91,-14057,213.87,13.2311,0,0,0,0,100,0),
(491260,92,-14051.9,211.407,12.9216,0,0,0,0,100,0),
(491260,93,-14046.6,208.816,12.0674,0,0,0,0,100,0),
(491260,94,-14040.9,206.072,12.7928,0,0,0,0,100,0),
(491260,95,-14034.3,202.871,13.4728,0,0,0,0,100,0),
(491260,96,-14028.5,200.078,13.4085,0,0,0,0,100,0),
(491260,97,-14022.4,197.13,13.2064,0,0,0,0,100,0),
(491260,98,-14017.8,191.867,12.9104,0,0,0,0,100,0),
(491260,99,-14013.7,187.221,12.8395,0,0,0,0,100,0),
(491260,100,-14009.7,182.66,13.3531,0,0,0,0,100,0),
(491260,101,-14009.4,177.376,12.3408,0,0,0,0,100,0),
(491260,102,-14009.1,172.527,11.6973,0,0,0,0,100,0),
(491260,103,-14008.9,167.945,13.0349,0,0,0,0,100,0),
(491260,104,-14008.6,164.294,13.7182,0,0,0,0,100,0),
(491260,105,-14008.3,158.934,13.5239,0,0,0,0,100,0),
(491260,106,-14008,152.994,13.5225,0,0,0,0,100,0),
(491260,107,-14006,148.082,14.7422,0,0,0,0,100,0),
(491260,108,-14004.2,143.879,14.8059,0,0,0,0,100,0),
(491260,109,-14002.1,138.821,14.6696,0,0,0,0,100,0),
(491260,110,-13999.5,132.458,14.7252,0,0,0,0,100,0),
(491260,111,-13996.9,126.204,14.4753,0,0,0,0,100,0),
(491260,112,-13993.2,122.754,14.436,0,0,0,0,100,0),
(491260,113,-13989.7,119.395,14.5143,0,0,0,0,100,0),
(491260,114,-13985.8,115.708,14.8719,0,0,0,0,100,0),
(491260,115,-13981.8,111.963,14.6108,0,0,0,0,100,0),
(491260,116,-13977.5,107.883,13.9424,0,0,0,0,100,0),
(491260,117,-13973,105.211,14.1287,0,0,0,0,100,0),
(491260,118,-13967.6,101.982,15.0949,0,0,0,0,100,0),
(491260,119,-13962.9,99.1734,15.47,0,0,0,0,100,0),
(491260,120,-13958,96.2463,15.2997,0,0,0,0,100,0),
(491260,121,-13953,94.1477,15.4125,0,0,0,0,100,0),
(491260,122,-13947.7,91.9461,15.7307,0,0,0,0,100,0),
(491260,123,-13942.3,89.6869,15.5798,0,0,0,0,100,0),
(491260,124,-13935.6,86.9033,15.8911,0,0,0,0,100,0),
(491260,125,-13932.5,80.2488,16.1549,0,0,0,0,100,0),
(491260,126,-13929.9,74.6447,15.9811,0,0,0,0,100,0),
(491260,127,-13927.3,69.0425,15.0905,0,0,0,0,100,0),
(491260,128,-13924.3,62.7,14.5169,0,0,0,0,100,0),
(491260,129,-13921.5,56.6727,14.5941,0,0,0,0,100,0),
(491260,130,-13918.5,50.2203,15.4537,0,0,0,0,100,0),
(491260,131,-13918.3,44.9924,15.4543,0,0,0,0,100,0),
(491260,132,-13918,39.0474,15.3134,0,0,0,0,100,0),
(491260,133,-13917.8,33.7948,15.3818,0,0,0,0,100,0),
(491260,134,-13917.6,29.2531,14.283,0,0,0,0,100,0),
(491260,135,-13917.5,25.832,14.8072,0,0,0,0,100,0),
(491260,136,-13916.4,21.9989,16.6151,0,0,0,0,100,0),
(491260,137,-13915.3,17.9535,18.3758,0,0,0,0,100,0),
(491260,138,-13913.7,12.507,19.9762,0,0,0,0,100,0),
(491260,139,-13911.8,5.76907,21.7238,0,0,0,0,100,0),
(491260,140,-13909.6,-1.97179,25.3757,0,0,0,0,100,0),
(491260,141,-13907.9,-7.801,27.4434,0,0,0,0,100,0),
(491260,142,-13906.7,-14.1673,28.1542,0,0,0,0,100,0),
(491260,143,-13905.5,-20.596,29.1553,0,0,0,0,100,0),
(491260,144,-13904.9,-24.2396,29.0149,0,0,0,0,100,0),
(491260,145,-13903.9,-29.4088,29.5113,0,0,0,0,100,0),
(491260,146,-13900.6,-33.7786,29.8016,0,0,0,0,100,0),
(491260,147,-13897.1,-38.4292,30.8359,0,0,0,0,100,0),
(491260,148,-13893,-43.8751,30.715,0,0,0,0,100,0),
(491260,149,-13889.8,-48.0578,30.1461,0,0,0,0,100,0),
(491260,150,-13887.4,-51.2178,28.4213,0,0,0,0,100,0),
(491260,151,-13884.6,-54.9285,27.637,0,0,0,0,100,0),
(491260,152,-13883.2,-59.4403,26.269,0,0,0,0,100,0),
(491260,153,-13881.6,-64.4338,25.0212,0,0,0,0,100,0),
(491260,154,-13880.1,-68.9872,22.9198,0,0,0,0,100,0),
(491260,155,-13876.1,-72.0979,20.5621,0,0,0,0,100,0),
(491260,156,-13873.1,-74.4802,20.5508,0,0,0,0,100,0),
(491260,157,-13868.9,-77.753,20.9915,0,0,0,0,100,0),
(491260,158,-13865.6,-80.417,20.1678,0,0,0,0,100,0),
(491260,159,-13861.5,-83.5913,18.2789,0,0,0,0,100,0),
(491260,160,-13857.6,-86.6878,16.6512,0,0,0,0,100,0),
(491260,161,-13854.5,-89.1006,16.511,0,0,0,0,100,0),
(491260,162,-13851.3,-92.3913,16.438,0,0,0,0,100,0),
(491260,163,-13847.9,-95.8738,15.2491,0,0,0,0,100,0),
(491260,164,-13844.8,-99.0449,14.3133,0,0,0,0,100,0),
(491260,165,-13841.5,-102.365,15.1427,0,0,0,0,100,0),
(491260,166,-13839.2,-104.739,15.7448,0,0,0,0,100,0),
(491260,167,-13836.3,-111.815,14.7832,0,0,0,0,100,0),
(491260,168,-13833.7,-118.19,14.7812,0,0,0,0,100,0),
(491260,169,-13831.1,-124.572,15.1084,0,0,0,0,100,0),
(491260,170,-13828.2,-131.809,16.1206,0,0,0,0,100,0),
(491260,171,-13825.3,-138.949,17.0619,0,0,0,0,100,0),
(491260,172,-13819.1,-147.118,17.2666,0,0,0,0,100,0),
(491260,173,-13813.3,-154.731,17.0486,0,0,0,0,100,0),
(491260,174,-13809.2,-160.111,16.8701,0,0,0,0,100,0),
(491260,175,-13804,-166.883,17.3291,0,0,0,0,100,0),
(491260,176,-13800.7,-171.255,16.7519,0,0,0,0,100,0),
(491260,177,-13794.3,-176.258,15.9791,0,0,0,0,100,0),
(491260,178,-13788.4,-180.857,16.0621,0,0,0,0,100,0),
(491260,179,-13782.8,-185.235,17.1134,0,0,0,0,100,0),
(491260,180,-13776.6,-190.049,19.6969,0,0,0,0,100,0),
(491260,181,-13771.4,-194.148,23.583,0,0,0,0,100,0),
(491260,182,-13770.4,-200.238,24.6748,0,0,0,0,100,0),
(491260,183,-13769.5,-205.768,26.697,0,0,0,0,100,0),
(491260,184,-13768.6,-210.916,28.3924,0,0,0,0,100,0),
(491260,185,-13769.5,-205.768,26.697,0,0,0,0,100,0),
(491260,186,-13770.4,-200.238,24.6748,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
