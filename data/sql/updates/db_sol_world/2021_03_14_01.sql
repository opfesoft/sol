-- DB update 2021_03_14_00 -> 2021_03_14_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_14_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_14_00 2021_03_14_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1615736164788937435'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1615736164788937435');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 11748;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 11748 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(11748,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Samantha Swifthoof - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 21290;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(21290,1,-11342.8,-399.472,65.9448,0,0,0,0,100,0),
(21290,2,-11350.1,-387.888,65.6808,0,0,0,0,100,0),
(21290,3,-11366.8,-365.911,65.9342,0,0,0,0,100,0),
(21290,4,-11372,-347.739,65.8675,0,0,0,0,100,0),
(21290,5,-11374.3,-339.946,65.4704,0,0,0,0,100,0),
(21290,6,-11379.3,-326.72,65.2922,0,0,0,0,100,0),
(21290,7,-11381.9,-316.653,64.9029,0,0,0,0,100,0),
(21290,8,-11386.7,-302.295,62.6157,0,0,0,0,100,0),
(21290,9,-11390,-292.707,60.2624,0,0,0,0,100,0),
(21290,10,-11402,-287.823,57.409,0,0,0,0,100,0),
(21290,11,-11415.1,-286.143,54.105,0,0,0,0,100,0),
(21290,12,-11437,-288.164,47.2963,0,0,0,0,100,0),
(21290,13,-11457.2,-289.167,41.14,0,0,0,0,100,0),
(21290,14,-11476.3,-290.119,36.4005,0,0,0,0,100,0),
(21290,15,-11492.2,-302.507,35.7033,0,0,0,0,100,0),
(21290,16,-11508.6,-315.607,35.8047,0,0,0,0,100,0),
(21290,17,-11522.3,-326.53,35.7372,0,0,0,0,100,0),
(21290,18,-11536.2,-324.024,35.7384,0,0,0,0,100,0),
(21290,19,-11549.5,-321.622,35.6663,0,0,0,0,100,0),
(21290,20,-11562.3,-310.883,35.6663,0,0,0,0,100,0),
(21290,21,-11577,-298.484,35.6663,0,0,0,0,100,0),
(21290,22,-11591.1,-287.225,35.6714,0,0,0,0,100,0),
(21290,23,-11609.1,-276.25,39.1716,0,0,0,0,100,0),
(21290,24,-11616.1,-271.829,40.7594,0,0,0,0,100,0),
(21290,25,-11619.3,-269.823,41.1617,0,0,0,0,100,0),
(21290,26,-11625.7,-265.763,36.8771,0,0,0,0,100,0),
(21290,27,-11636.4,-259.011,32.0537,0,0,0,0,100,0),
(21290,28,-11645.5,-253.215,30.3419,0,0,0,0,100,0),
(21290,29,-11656.9,-246.148,30.6684,0,0,0,0,100,0),
(21290,30,-11669.4,-238.409,34.4752,0,0,0,0,100,0),
(21290,31,-11680.8,-231.335,41.2052,0,0,0,0,100,0),
(21290,32,-11684.2,-229.148,40.7473,0,0,0,0,100,0),
(21290,33,-11696.3,-221.432,39.5557,0,0,0,0,100,0),
(21290,34,-11711,-207.216,39.5628,0,0,0,0,100,0),
(21290,35,-11723.6,-194.954,39.5552,0,0,0,0,100,0),
(21290,36,-11732,-181.014,39.5563,0,0,0,0,100,0),
(21290,37,-11733.4,-178.619,40.682,0,0,0,0,100,0),
(21290,38,-11737.5,-171.768,42.2494,0,0,0,0,100,0),
(21290,39,-11739.6,-168.239,42.692,0,0,0,0,100,0),
(21290,40,-11743.3,-161.62,38.4711,0,0,0,0,100,0),
(21290,41,-11749.1,-151.343,33.9564,0,0,0,0,100,0),
(21290,42,-11754.5,-141.702,32.0015,0,0,0,0,100,0),
(21290,43,-11760.1,-131.625,31.8705,0,0,0,0,100,0),
(21290,44,-11765.7,-121.661,33.7696,0,0,0,0,100,0),
(21290,45,-11770.9,-112.5,37.7111,0,0,0,0,100,0),
(21290,46,-11775.2,-104.821,42.6637,0,0,0,0,100,0),
(21290,47,-11776.9,-100.929,42.1584,0,0,0,0,100,0),
(21290,48,-11780.2,-93.6573,40.6836,0,0,0,0,100,0),
(21290,49,-11790.9,-69.6337,39.7265,0,0,0,0,100,0),
(21290,50,-11801.9,-60.8243,39.7265,0,0,0,0,100,0),
(21290,51,-11810.9,-53.6653,39.7267,0,0,0,0,100,0),
(21290,52,-11825.3,-44.9769,39.7421,0,0,0,0,100,0),
(21290,53,-11846.7,-44.0004,39.7259,0,0,0,0,100,0),
(21290,54,-11866.3,-43.1095,39.7271,0,0,0,0,100,0),
(21290,55,-11894.9,-44.414,39.7271,0,0,0,0,100,0),
(21290,56,-11922.9,-60.5052,39.7271,0,0,0,0,100,0),
(21290,57,-11926,-62.5322,40.5885,0,0,0,0,100,0),
(21290,58,-11932.9,-66.9619,42.1826,0,0,0,0,100,0),
(21290,59,-11935.9,-68.9497,42.5722,0,0,0,0,100,0),
(21290,60,-11941.6,-72.9211,38.706,0,0,0,0,100,0),
(21290,61,-11949.3,-78.253,34.6533,0,0,0,0,100,0),
(21290,62,-11958.6,-84.7128,31.9719,0,0,0,0,100,0),
(21290,63,-11968.7,-91.6718,31.7196,0,0,0,0,100,0),
(21290,64,-11978.9,-98.6945,33.6167,0,0,0,0,100,0),
(21290,65,-11988.2,-105.125,37.6596,0,0,0,0,100,0),
(21290,66,-11995.6,-110.281,42.625,0,0,0,0,100,0),
(21290,67,-11999.2,-112.532,42.1499,0,0,0,0,100,0),
(21290,68,-12006.1,-116.908,40.586,0,0,0,0,100,0),
(21290,69,-12012.8,-121.169,39.6298,0,0,0,0,100,0),
(21290,70,-12030.1,-122.79,39.6298,0,0,0,0,100,0),
(21290,71,-12048.6,-124.522,39.6298,0,0,0,0,100,0),
(21290,72,-12058.7,-126.339,39.5309,0,0,0,0,100,0),
(21290,73,-12077.2,-129.666,37.6848,0,0,0,0,100,0),
(21290,74,-12100.7,-151.126,33.3102,0,0,0,0,100,0),
(21290,75,-12119.6,-174.656,30.3481,0,0,0,0,100,0),
(21290,76,-12124.1,-185.839,30.3481,0,0,0,0,100,0),
(21290,77,-12130,-200.638,30.3481,0,0,0,0,100,0),
(21290,78,-12147.9,-226.931,30.3481,0,0,0,0,100,0),
(21290,79,-12161.1,-246.361,30.3481,0,0,0,0,100,0),
(21290,80,-12168.7,-264.911,30.3481,0,0,0,0,100,0),
(21290,81,-12176,-282.54,30.3481,0,0,0,0,100,0),
(21290,82,-12175.6,-304.27,30.968,0,0,0,0,100,0),
(21290,83,-12175.4,-310.578,32.1244,0,0,0,0,100,0),
(21290,84,-12175.3,-314.58,32.4973,0,0,0,0,100,0),
(21290,85,-12173.5,-323.174,27.3505,0,0,0,0,100,0),
(21290,86,-12170.7,-336.3,22.9495,0,0,0,0,100,0),
(21290,87,-12167.9,-349.581,21.4895,0,0,0,0,100,0),
(21290,88,-12165.8,-359.515,22.1616,0,0,0,0,100,0),
(21290,89,-12163,-372.88,26.1164,0,0,0,0,100,0),
(21290,90,-12160.3,-385.792,32.4904,0,0,0,0,100,0),
(21290,91,-12159.8,-389.275,32.1132,0,0,0,0,100,0),
(21290,92,-12158.6,-397.498,30.5281,0,0,0,0,100,0),
(21290,93,-12160.8,-416.276,30.348,0,0,0,0,100,0),
(21290,94,-12162.9,-434.938,30.3476,0,0,0,0,100,0),
(21290,95,-12171.7,-448.895,30.3214,0,0,0,0,100,0),
(21290,96,-12180.2,-462.304,29.0753,0,0,0,0,100,0),
(21290,97,-12191.8,-481.119,29.1744,0,0,0,0,100,0),
(21290,98,-12200.7,-497.667,29.0009,0,0,0,0,100,0),
(21290,99,-12209.7,-514.418,28.7973,0,0,0,0,100,0),
(21290,100,-12218.7,-531.165,28.8696,0,0,0,0,100,0),
(21290,101,-12230.6,-543.062,28.8871,0,0,0,0,100,0),
(21290,102,-12244.4,-556.819,28.7682,0,0,0,0,100,0),
(21290,103,-12257.7,-570.036,28.7232,0,0,0,0,100,0),
(21290,104,-12281.1,-577.439,28.7293,0,0,0,0,100,0),
(21290,105,-12299.5,-582.206,28.6947,0,0,0,0,100,0),
(21290,106,-12311.1,-582.375,26.9412,0,0,0,0,100,0),
(21290,107,-12329.3,-582.641,23.9455,0,0,0,0,100,0),
(21290,108,-12347.3,-582.905,20.9047,0,0,0,0,100,0),
(21290,109,-12360.4,-582.275,18.7575,0,0,0,0,100,0),
(21290,110,-12379.7,-581.342,15.49,0,0,0,0,100,0),
(21290,111,-12394.2,-578.539,12.94,0,0,0,0,100,0),
(21290,112,-12410.5,-575.406,10.9275,0,0,0,0,100,0),
(21290,113,-12422.7,-564.321,10.1371,0,0,0,0,100,0),
(21290,114,-12435.6,-552.514,10.1167,0,0,0,0,100,0),
(21290,115,-12439.9,-532.55,10.1184,0,0,0,0,100,0),
(21290,116,-12444.3,-511.989,10.1008,0,0,0,0,100,0),
(21290,117,-12445.7,-496.538,10.1301,0,0,0,0,100,0),
(21290,118,-12446.9,-484.113,10.1208,0,0,0,0,100,0),
(21290,119,-12448.3,-469.347,10.1025,0,0,0,0,100,0),
(21290,120,-12453.5,-451.989,10.1606,0,0,0,0,100,0),
(21290,121,-12458.1,-436.594,10.0998,0,0,0,0,100,0),
(21290,122,-12465.8,-424.066,10.2373,0,0,0,0,100,0),
(21290,123,-12473.3,-411.839,10.1455,0,0,0,0,100,0),
(21290,124,-12489.2,-401.461,10.3396,0,0,0,0,100,0),
(21290,125,-12503.7,-391.995,10.1087,0,0,0,0,100,0),
(21290,126,-12518,-389.211,10.2388,0,0,0,0,100,0),
(21290,127,-12534.4,-386.025,10.2011,0,0,0,0,100,0),
(21290,128,-12554.3,-382.151,10.1179,0,0,0,0,100,0),
(21290,129,-12577.9,-380.029,10.1072,0,0,0,0,100,0),
(21290,130,-12593.4,-379.356,10.1014,0,0,0,0,100,0),
(21290,131,-12605.6,-378.826,10.0992,0,0,0,0,100,0),
(21290,132,-12621.7,-377.972,10.1004,0,0,0,0,100,0),
(21290,133,-12637.9,-377.112,10.1001,0,0,0,0,100,0),
(21290,134,-12654.8,-376.214,10.0998,0,0,0,0,100,0),
(21290,135,-12671,-376.255,10.1021,0,0,0,0,100,0),
(21290,136,-12683.1,-376.285,10.1123,0,0,0,0,100,0),
(21290,137,-12705.8,-376.428,10.0993,0,0,0,0,100,0),
(21290,138,-12727.9,-376.566,10.0992,0,0,0,0,100,0),
(21290,139,-12746.2,-374.353,10.1375,0,0,0,0,100,0),
(21290,140,-12762,-372.443,10.0997,0,0,0,0,100,0),
(21290,141,-12777.6,-359.443,10.1332,0,0,0,0,100,0),
(21290,142,-12793.1,-346.526,10.0992,0,0,0,0,100,0),
(21290,143,-12805.2,-327.929,10.1022,0,0,0,0,100,0),
(21290,144,-12817.2,-309.346,10.0997,0,0,0,0,100,0),
(21290,145,-12827.4,-300.476,9.79393,0,0,0,0,100,0),
(21290,146,-12838.2,-291.134,8.50106,0,0,0,0,100,0),
(21290,147,-12848.5,-285.198,7.38786,0,0,0,0,100,0),
(21290,148,-12860,-278.516,5.4692,0,0,0,0,100,0),
(21290,149,-12871.5,-271.156,5.12156,0,0,0,0,100,0),
(21290,150,-12880.2,-265.584,3.75469,0,0,0,0,100,0),
(21290,151,-12888.9,-258.538,2.37217,0,0,0,0,100,0),
(21290,152,-12896.3,-252.553,0.831888,0,0,0,0,100,0),
(21290,153,-12909.9,-245.922,-2.21975,0,0,0,0,100,0),
(21290,154,-12922.1,-253.767,-4.36108,0,0,0,0,100,0),
(21290,155,-12938.3,-246.644,-6.34898,0,0,0,0,100,0),
(21290,156,-12948.2,-243.358,-8.51097,0,0,0,0,100,0),
(21290,157,-12961.7,-238.845,-8.71482,0,0,0,0,100,0),
(21290,158,-12970,-236.079,-9.20577,0,0,0,0,100,0),
(21290,159,-12980.3,-232.003,-9.9536,0,0,0,0,100,0),
(21290,160,-12994,-226.591,-12.0913,0,0,0,0,100,0),
(21290,161,-13011.9,-221.16,-11.9737,0,0,0,0,100,0),
(21290,162,-13026.6,-216.677,-9.87399,0,0,0,0,100,0),
(21290,163,-13034.9,-214.17,-10.8769,0,0,0,0,100,0),
(21290,164,-13050.6,-210.062,-10.0472,0,0,0,0,100,0),
(21290,165,-13059.3,-207.781,-10.9561,0,0,0,0,100,0),
(21290,166,-13073.4,-203.194,-10.8791,0,0,0,0,100,0),
(21290,167,-13089.8,-197.853,-8.67146,0,0,0,0,100,0),
(21290,168,-13105.2,-192.821,-7.17396,0,0,0,0,100,0),
(21290,169,-13122.6,-187.164,-5.0111,0,0,0,0,100,0),
(21290,170,-13138.8,-183.673,-2.81047,0,0,0,0,100,0),
(21290,171,-13153.9,-180.417,0.031227,0,0,0,0,100,0),
(21290,172,-13167.7,-177.364,3.02085,0,0,0,0,100,0),
(21290,173,-13180.4,-174.547,6.65286,0,0,0,0,100,0),
(21290,174,-13191.8,-171.017,9.4418,0,0,0,0,100,0),
(21290,175,-13201.7,-167.923,11.7859,0,0,0,0,100,0),
(21290,176,-13212.3,-153.443,14.5396,0,0,0,0,100,0),
(21290,177,-13216.9,-147.232,15.2408,0,0,0,0,100,0),
(21290,178,-13234.1,-139.691,16.2935,0,0,0,0,100,0),
(21290,179,-13241.9,-136.272,17.869,0,0,0,0,100,0),
(21290,180,-13245.9,-134.524,18.0734,0,0,0,0,100,0),
(21290,181,-13247.4,-112.908,19.5326,0,0,0,0,100,0),
(21290,182,-13248.3,-100.856,19.7499,0,0,0,0,100,0),
(21290,183,-13248.3,-82.0471,19.8108,0,0,0,0,100,0),
(21290,184,-13248.2,-56.4675,19.8116,0,0,0,0,100,0),
(21290,185,-13249.4,-40.4552,19.8023,0,0,0,0,100,0),
(21290,186,-13250.7,-23.2487,19.8121,0,0,0,0,100,0),
(21290,187,-13251.9,-7.23683,19.8095,0,0,0,0,100,0),
(21290,188,-13264.8,4.40259,19.8113,0,0,0,0,100,0),
(21290,189,-13277.3,15.6484,19.8118,0,0,0,0,100,0),
(21290,190,-13295,31.5753,20.6548,0,0,0,0,100,0),
(21290,191,-13300.6,36.6434,21.1509,0,0,0,0,100,0),
(21290,192,-13312.7,51.7871,21.3992,0,0,0,0,100,0),
(21290,193,-13323.9,65.8414,22.2441,0,0,0,0,100,0),
(21290,194,-13334.5,79.196,23.0293,0,0,0,0,100,0),
(21290,195,-13352,80.2472,23.6911,0,0,0,0,100,0),
(21290,196,-13373.2,81.523,23.8855,0,0,0,0,100,0),
(21290,197,-13385.6,82.2722,24.1573,0,0,0,0,100,0),
(21290,198,-13411.1,85.4,24.9424,0,0,0,0,100,0),
(21290,199,-13424.2,87.0127,25.429,0,0,0,0,100,0),
(21290,200,-13443.6,87.1513,26.5441,0,0,0,0,100,0),
(21290,201,-13474.5,87.3727,28.5738,0,0,0,0,100,0),
(21290,202,-13496,86.7702,28.7479,0,0,0,0,100,0),
(21290,203,-13513.6,86.275,28.757,0,0,0,0,100,0),
(21290,204,-13524.7,86.4542,28.6163,0,0,0,0,100,0),
(21290,205,-13547.3,86.8205,28.7303,0,0,0,0,100,0),
(21290,206,-13564.6,87.1008,28.6771,0,0,0,0,100,0),
(21290,207,-13580.7,87.6582,27.9989,0,0,0,0,100,0),
(21290,208,-13600.4,88.3411,27.1627,0,0,0,0,100,0),
(21290,209,-13617.4,88.1692,26.3721,0,0,0,0,100,0),
(21290,210,-13638.8,87.9535,25.351,0,0,0,0,100,0),
(21290,211,-13649.1,98.0488,24.4147,0,0,0,0,100,0),
(21290,212,-13660.1,108.779,22.8779,0,0,0,0,100,0),
(21290,213,-13677.5,119.787,21.5496,0,0,0,0,100,0),
(21290,214,-13694.6,121.195,22.6906,0,0,0,0,100,0),
(21290,215,-13708.8,122.366,23.8307,0,0,0,0,100,0),
(21290,216,-13715.1,127.316,23.8642,0,0,0,0,100,0),
(21290,217,-13733.2,141.371,22.6976,0,0,0,0,100,0),
(21290,218,-13748.1,153,22.4817,0,0,0,0,100,0),
(21290,219,-13757.2,170.938,24.2516,0,0,0,0,100,0),
(21290,220,-13762,180.328,23.6689,0,0,0,0,100,0),
(21290,221,-13779.1,195.009,22.0156,0,0,0,0,100,0),
(21290,222,-13798.2,211.467,20.0725,0,0,0,0,100,0),
(21290,223,-13813.8,223.81,18.9215,0,0,0,0,100,0),
(21290,224,-13823.7,235.943,18.6833,0,0,0,0,100,0),
(21290,225,-13831.1,245.109,18.6141,0,0,0,0,100,0),
(21290,226,-13844.5,247.026,18.5906,0,0,0,0,100,0),
(21290,227,-13864.2,249.856,18.3161,0,0,0,0,100,0),
(21290,228,-13882.3,252.442,18.1198,0,0,0,0,100,0),
(21290,229,-13905.1,256.339,18.2796,0,0,0,0,100,0),
(21290,230,-13918.3,273.709,18.6322,0,0,0,0,100,0),
(21290,231,-13926.3,284.26,18.609,0,0,0,0,100,0),
(21290,232,-13945.3,283.539,18.632,0,0,0,0,100,0),
(21290,233,-13963.6,282.844,18.6333,0,0,0,0,100,0),
(21290,234,-13982.3,282.135,18.6329,0,0,0,0,100,0),
(21290,235,-13997.5,281.079,18.6262,0,0,0,0,100,0),
(21290,236,-14011.9,280.083,18.6231,0,0,0,0,100,0),
(21290,237,-14030,274.991,18.664,0,0,0,0,100,0),
(21290,238,-14042.5,271.065,18.6363,0,0,0,0,100,0),
(21290,239,-14055.7,266.896,18.5768,0,0,0,0,100,0),
(21290,240,-14076.5,259.37,17.4885,0,0,0,0,100,0),
(21290,241,-14097.7,255.217,16.601,0,0,0,0,100,0),
(21290,242,-14118.8,252.48,15.5245,0,0,0,0,100,0),
(21290,243,-14137.8,249.356,14.8144,0,0,0,0,100,0),
(21290,244,-14155.4,246.546,14.853,0,0,0,0,100,0),
(21290,245,-14171.7,243.95,15.5147,0,0,0,0,100,0),
(21290,246,-14178.8,243.615,15.4907,0,0,0,0,100,0),
(21290,247,-14197.8,242.721,16.2727,0,0,0,0,100,0),
(21290,248,-14207.9,242.246,18.4777,0,0,0,0,100,0),
(21290,249,-14219.4,244.841,20.9807,0,0,0,0,100,0),
(21290,250,-14232.5,254.112,23.5155,0,0,0,0,100,0),
(21290,251,-14238,266.712,25.3587,0,0,0,0,100,0),
(21290,252,-14243.4,278.871,26.7718,0,0,0,0,100,0),
(21290,253,-14245.2,292.04,27.0371,0,0,0,0,100,0),
(21290,254,-14246.6,302.815,27.0753,0,0,0,0,100,0),
(21290,255,-14245.2,289.001,26.9921,0,0,0,0,100,0),
(21290,256,-14244,276.94,26.6768,0,0,0,0,100,0),
(21290,257,-14243,267.501,25.8897,0,0,0,0,100,0),
(21290,258,-14235.7,255.944,24.0527,0,0,0,0,100,0),
(21290,259,-14229.9,246.656,22.7762,0,0,0,0,100,0),
(21290,260,-14216,244.449,20.2712,0,0,0,0,100,0),
(21290,261,-14205.6,242.807,18.0401,0,0,0,0,100,0),
(21290,262,-14195.5,241.211,15.9545,0,0,0,0,100,0),
(21290,263,-14182.6,242.641,15.4243,0,0,0,0,100,0),
(21290,264,-14166.4,244.446,15.548,0,0,0,0,100,0),
(21290,265,-14153.4,245.89,14.7801,0,0,0,0,100,0),
(21290,266,-14135.2,248.766,14.8183,0,0,0,0,100,0),
(21290,267,-14119.9,251.184,15.444,0,0,0,0,100,0),
(21290,268,-14106.2,253.145,16.2711,0,0,0,0,100,0),
(21290,269,-14095.2,254.717,16.6872,0,0,0,0,100,0),
(21290,270,-14084.9,256.2,17.1813,0,0,0,0,100,0),
(21290,271,-14071.6,260.203,17.7463,0,0,0,0,100,0),
(21290,272,-14055,265.214,18.6337,0,0,0,0,100,0),
(21290,273,-14042.9,268.847,18.6319,0,0,0,0,100,0),
(21290,274,-14025.2,274.369,18.6177,0,0,0,0,100,0),
(21290,275,-14009.6,279.227,18.6276,0,0,0,0,100,0),
(21290,276,-13991.3,281.047,18.5995,0,0,0,0,100,0),
(21290,277,-13977,282.462,18.6337,0,0,0,0,100,0),
(21290,278,-13960.8,283.029,18.6296,0,0,0,0,100,0),
(21290,279,-13948.5,283.459,18.6304,0,0,0,0,100,0),
(21290,280,-13936.8,283.591,18.5954,0,0,0,0,100,0),
(21290,281,-13928.3,283.688,18.6233,0,0,0,0,100,0),
(21290,282,-13917.5,271.004,18.6075,0,0,0,0,100,0),
(21290,283,-13906.2,257.815,18.3109,0,0,0,0,100,0),
(21290,284,-13884.5,253.226,18.1452,0,0,0,0,100,0),
(21290,285,-13866.5,249.41,18.3602,0,0,0,0,100,0),
(21290,286,-13842.1,244.242,18.6111,0,0,0,0,100,0),
(21290,287,-13825.4,240.715,18.6428,0,0,0,0,100,0),
(21290,288,-13813,227.946,18.853,0,0,0,0,100,0),
(21290,289,-13796.7,211.121,20.1472,0,0,0,0,100,0),
(21290,290,-13779.9,193.834,22.0527,0,0,0,0,100,0),
(21290,291,-13766.7,180.334,23.4925,0,0,0,0,100,0),
(21290,292,-13757.9,171.385,24.2771,0,0,0,0,100,0),
(21290,293,-13753.4,164.461,23.6789,0,0,0,0,100,0),
(21290,294,-13745.2,151.956,22.2972,0,0,0,0,100,0),
(21290,295,-13738.9,142.307,22.6564,0,0,0,0,100,0),
(21290,296,-13727.8,134.746,23.2109,0,0,0,0,100,0),
(21290,297,-13717.6,127.757,23.8876,0,0,0,0,100,0),
(21290,298,-13708.4,121.504,23.8781,0,0,0,0,100,0),
(21290,299,-13686.3,118.576,22.1964,0,0,0,0,100,0),
(21290,300,-13669.5,116.347,21.7565,0,0,0,0,100,0),
(21290,301,-13659.9,107.14,23.0213,0,0,0,0,100,0),
(21290,302,-13647.8,95.5106,24.6757,0,0,0,0,100,0),
(21290,303,-13638,86.1316,25.3586,0,0,0,0,100,0),
(21290,304,-13619.8,85.9781,26.2254,0,0,0,0,100,0),
(21290,305,-13599.5,85.8066,27.2359,0,0,0,0,100,0),
(21290,306,-13586,85.6924,27.8987,0,0,0,0,100,0),
(21290,307,-13571.6,85.515,28.4676,0,0,0,0,100,0),
(21290,308,-13555.1,85.3104,28.705,0,0,0,0,100,0),
(21290,309,-13541.1,85.1376,28.7386,0,0,0,0,100,0),
(21290,310,-13523.8,85.2338,28.7246,0,0,0,0,100,0),
(21290,311,-13503.9,85.345,28.7475,0,0,0,0,100,0),
(21290,312,-13489.4,85.4257,28.762,0,0,0,0,100,0),
(21290,313,-13473.1,85.572,28.5053,0,0,0,0,100,0),
(21290,314,-13444.4,86.1576,26.5735,0,0,0,0,100,0),
(21290,315,-13413.7,86.7834,25.2208,0,0,0,0,100,0),
(21290,316,-13396,82.8559,24.5227,0,0,0,0,100,0),
(21290,317,-13380.4,79.3939,24.1321,0,0,0,0,100,0),
(21290,318,-13371.1,77.3347,24.0415,0,0,0,0,100,0),
(21290,319,-13355.5,77.2557,23.9233,0,0,0,0,100,0),
(21290,320,-13340.5,77.1802,23.3431,0,0,0,0,100,0),
(21290,321,-13324,77.0966,22.288,0,0,0,0,100,0),
(21290,322,-13320.5,60.9161,22.0185,0,0,0,0,100,0),
(21290,323,-13317.1,45.48,21.1973,0,0,0,0,100,0),
(21290,324,-13304.7,32.6786,21.2178,0,0,0,0,100,0),
(21290,325,-13297.3,25.0944,20.4766,0,0,0,0,100,0),
(21290,326,-13284.9,16.9994,19.8867,0,0,0,0,100,0),
(21290,327,-13270.1,7.37487,19.8126,0,0,0,0,100,0),
(21290,328,-13255.6,-2.10071,19.8131,0,0,0,0,100,0),
(21290,329,-13252.2,-16.2935,19.7959,0,0,0,0,100,0),
(21290,330,-13248.4,-32.3987,19.8059,0,0,0,0,100,0),
(21290,331,-13248.2,-44.297,19.8075,0,0,0,0,100,0),
(21290,332,-13247.9,-63.3134,19.8098,0,0,0,0,100,0),
(21290,333,-13247.6,-80.3262,19.8086,0,0,0,0,100,0),
(21290,334,-13248.1,-97.4674,19.7627,0,0,0,0,100,0),
(21290,335,-13248.7,-114.68,19.4444,0,0,0,0,100,0),
(21290,336,-13249.3,-133.488,18.1057,0,0,0,0,100,0),
(21290,337,-13241.6,-137.03,17.8227,0,0,0,0,100,0),
(21290,338,-13228.9,-142.88,15.6729,0,0,0,0,100,0),
(21290,339,-13216.9,-148.384,15.2668,0,0,0,0,100,0),
(21290,340,-13212.7,-150.304,14.6245,0,0,0,0,100,0),
(21290,341,-13210.7,-153.355,14.4604,0,0,0,0,100,0),
(21290,342,-13207.3,-158.542,13.6708,0,0,0,0,100,0),
(21290,343,-13200.4,-168.921,11.4561,0,0,0,0,100,0),
(21290,344,-13188.7,-172.806,8.85901,0,0,0,0,100,0),
(21290,345,-13175.3,-177.276,5.06607,0,0,0,0,100,0),
(21290,346,-13159.7,-182.481,1.16178,0,0,0,0,100,0),
(21290,347,-13145,-183.628,-1.92805,0,0,0,0,100,0),
(21290,348,-13131.3,-184.703,-3.75369,0,0,0,0,100,0),
(21290,349,-13119.6,-188.702,-5.55908,0,0,0,0,100,0),
(21290,350,-13106.1,-193.311,-7.16317,0,0,0,0,100,0),
(21290,351,-13093.2,-197.73,-8.23883,0,0,0,0,100,0),
(21290,352,-13087.9,-199.557,-9.07981,0,0,0,0,100,0),
(21290,353,-13075.3,-203.891,-10.9197,0,0,0,0,100,0),
(21290,354,-13061.5,-208.637,-11.1411,0,0,0,0,100,0),
(21290,355,-13049,-212.953,-10.5996,0,0,0,0,100,0),
(21290,356,-13029.1,-210.42,-10.2832,0,0,0,0,100,0),
(21290,357,-13021.1,-214.519,-10.7574,0,0,0,0,100,0),
(21290,358,-13010.2,-220.071,-12.167,0,0,0,0,100,0),
(21290,359,-13002.3,-224.167,-12.0029,0,0,0,0,100,0),
(21290,360,-12987.2,-232.034,-11.4228,0,0,0,0,100,0),
(21290,361,-12982,-234.76,-10.4677,0,0,0,0,100,0),
(21290,362,-12976,-237.876,-9.70942,0,0,0,0,100,0),
(21290,363,-12964.3,-239.919,-8.84411,0,0,0,0,100,0),
(21290,364,-12942.2,-243.757,-7.75031,0,0,0,0,100,0),
(21290,365,-12936.3,-246.542,-6.20202,0,0,0,0,100,0),
(21290,366,-12921.1,-253.697,-4.23042,0,0,0,0,100,0),
(21290,367,-12910.7,-250.6,-2.46008,0,0,0,0,100,0),
(21290,368,-12901.9,-247.975,-0.615275,0,0,0,0,100,0),
(21290,369,-12895.1,-252.897,1.10549,0,0,0,0,100,0),
(21290,370,-12886.9,-258.84,2.67734,0,0,0,0,100,0),
(21290,371,-12878,-265.267,4.15534,0,0,0,0,100,0),
(21290,372,-12870.5,-270.672,5.33466,0,0,0,0,100,0),
(21290,373,-12858.7,-279.207,5.58552,0,0,0,0,100,0),
(21290,374,-12850.7,-284.955,7.16503,0,0,0,0,100,0),
(21290,375,-12838.8,-293.025,8.69532,0,0,0,0,100,0),
(21290,376,-12830.6,-298.608,9.45063,0,0,0,0,100,0),
(21290,377,-12824.3,-302.898,10.0835,0,0,0,0,100,0),
(21290,378,-12817.7,-312.196,10.1459,0,0,0,0,100,0),
(21290,379,-12804.3,-330.955,10.0994,0,0,0,0,100,0),
(21290,380,-12790.1,-350.809,10.1,0,0,0,0,100,0),
(21290,381,-12778.5,-357.864,10.1844,0,0,0,0,100,0),
(21290,382,-12759.6,-369.414,10.3154,0,0,0,0,100,0),
(21290,383,-12748.6,-376.148,10.1075,0,0,0,0,100,0),
(21290,384,-12736.8,-376.368,10.0993,0,0,0,0,100,0),
(21290,385,-12720.7,-376.67,10.0993,0,0,0,0,100,0),
(21290,386,-12708.5,-376.898,10.1018,0,0,0,0,100,0),
(21290,387,-12697.7,-377.1,10.1008,0,0,0,0,100,0),
(21290,388,-12685.3,-376.918,10.1013,0,0,0,0,100,0),
(21290,389,-12671.7,-376.717,10.1005,0,0,0,0,100,0),
(21290,390,-12657.8,-376.513,10.0995,0,0,0,0,100,0),
(21290,391,-12646.2,-377.233,10.1116,0,0,0,0,100,0),
(21290,392,-12634.3,-377.967,10.0995,0,0,0,0,100,0),
(21290,393,-12619.3,-378.895,10.1002,0,0,0,0,100,0),
(21290,394,-12606,-379.714,10.1032,0,0,0,0,100,0),
(21290,395,-12594.8,-380.458,10.1183,0,0,0,0,100,0),
(21290,396,-12576.7,-381.666,10.1438,0,0,0,0,100,0),
(21290,397,-12558.9,-382.849,10.1013,0,0,0,0,100,0),
(21290,398,-12547.9,-383.942,10.1194,0,0,0,0,100,0),
(21290,399,-12535.8,-385.137,10.1332,0,0,0,0,100,0),
(21290,400,-12518,-386.904,10.104,0,0,0,0,100,0),
(21290,401,-12508.2,-391.765,10.1361,0,0,0,0,100,0),
(21290,402,-12497.5,-397.046,10.3469,0,0,0,0,100,0),
(21290,403,-12488,-401.771,10.2822,0,0,0,0,100,0),
(21290,404,-12481.5,-409.406,10.4729,0,0,0,0,100,0),
(21290,405,-12470.9,-421.853,10.6639,0,0,0,0,100,0),
(21290,406,-12460.5,-434.046,10.1848,0,0,0,0,100,0),
(21290,407,-12456.9,-444.271,10.136,0,0,0,0,100,0),
(21290,408,-12452.1,-457.681,10.2214,0,0,0,0,100,0),
(21290,409,-12448.3,-468.408,10.0996,0,0,0,0,100,0),
(21290,410,-12447.4,-478.157,10.1764,0,0,0,0,100,0),
(21290,411,-12446.1,-491.284,10.1027,0,0,0,0,100,0),
(21290,412,-12444.2,-510.447,10.0995,0,0,0,0,100,0),
(21290,413,-12442,-533.79,10.0995,0,0,0,0,100,0),
(21290,414,-12436.5,-542.299,10.1062,0,0,0,0,100,0),
(21290,415,-12427.6,-556.009,10.3122,0,0,0,0,100,0),
(21290,416,-12420.6,-566.733,10.1372,0,0,0,0,100,0),
(21290,417,-12406.7,-575.609,11.1249,0,0,0,0,100,0),
(21290,418,-12394.1,-583.713,13.0634,0,0,0,0,100,0),
(21290,419,-12383.5,-583.946,14.8795,0,0,0,0,100,0),
(21290,420,-12372.6,-584.187,16.7007,0,0,0,0,100,0),
(21290,421,-12360.3,-584.457,18.7827,0,0,0,0,100,0),
(21290,422,-12338.6,-585.294,22.4444,0,0,0,0,100,0),
(21290,423,-12329.1,-585.278,24.0382,0,0,0,0,100,0),
(21290,424,-12315.6,-585.254,26.2275,0,0,0,0,100,0),
(21290,425,-12301.3,-585.229,28.5788,0,0,0,0,100,0),
(21290,426,-12287.4,-580.875,28.7456,0,0,0,0,100,0),
(21290,427,-12272.4,-576.187,28.7405,0,0,0,0,100,0),
(21290,428,-12259,-570.743,28.7281,0,0,0,0,100,0),
(21290,429,-12243.8,-564.558,28.9022,0,0,0,0,100,0),
(21290,430,-12236.4,-555.511,28.7681,0,0,0,0,100,0),
(21290,431,-12225.2,-541.671,28.8696,0,0,0,0,100,0),
(21290,432,-12215.4,-529.694,28.8704,0,0,0,0,100,0),
(21290,433,-12208.1,-515.362,28.8764,0,0,0,0,100,0),
(21290,434,-12201,-501.442,29.1902,0,0,0,0,100,0),
(21290,435,-12195,-489.766,29.1655,0,0,0,0,100,0),
(21290,436,-12188.7,-479.107,29.1292,0,0,0,0,100,0),
(21290,437,-12180.3,-464.739,29.117,0,0,0,0,100,0),
(21290,438,-12171.4,-449.661,30.297,0,0,0,0,100,0),
(21290,439,-12164.8,-438.399,30.3462,0,0,0,0,100,0),
(21290,440,-12158.2,-427.262,30.3465,0,0,0,0,100,0),
(21290,441,-12158.2,-414.074,30.3474,0,0,0,0,100,0),
(21290,442,-12158.1,-397.037,30.5263,0,0,0,0,100,0),
(21290,443,-12159.6,-389.135,32.1228,0,0,0,0,100,0),
(21290,444,-12160.4,-385.148,32.5761,0,0,0,0,100,0),
(21290,445,-12163.1,-371.424,25.5333,0,0,0,0,100,0),
(21290,446,-12165.8,-357.76,22.0276,0,0,0,0,100,0),
(21290,447,-12168,-346.906,21.5988,0,0,0,0,100,0),
(21290,448,-12170.5,-334.907,23.2157,0,0,0,0,100,0),
(21290,449,-12173.2,-321.872,28.0806,0,0,0,0,100,0),
(21290,450,-12174.8,-314.108,32.5091,0,0,0,0,100,0),
(21290,451,-12174.9,-310.262,32.1043,0,0,0,0,100,0),
(21290,452,-12175.3,-302.919,30.9322,0,0,0,0,100,0),
(21290,453,-12175.8,-290.113,30.3479,0,0,0,0,100,0),
(21290,454,-12173.1,-280.821,30.3479,0,0,0,0,100,0),
(21290,455,-12169.5,-268.844,30.3479,0,0,0,0,100,0),
(21290,456,-12166.2,-257.583,30.3479,0,0,0,0,100,0),
(21290,457,-12160.4,-247.747,30.3479,0,0,0,0,100,0),
(21290,458,-12153.1,-235.496,30.3479,0,0,0,0,100,0),
(21290,459,-12146.3,-223.979,30.3479,0,0,0,0,100,0),
(21290,460,-12139,-211.513,30.3479,0,0,0,0,100,0),
(21290,461,-12131.8,-199.371,30.3479,0,0,0,0,100,0),
(21290,462,-12123.3,-186.664,30.3473,0,0,0,0,100,0),
(21290,463,-12116.2,-176.092,30.3473,0,0,0,0,100,0),
(21290,464,-12107.3,-162.812,31.6872,0,0,0,0,100,0),
(21290,465,-12101.5,-154.073,32.9557,0,0,0,0,100,0),
(21290,466,-12092.3,-146.343,34.4972,0,0,0,0,100,0),
(21290,467,-12080.6,-136.509,36.5729,0,0,0,0,100,0),
(21290,468,-12067.3,-125.318,38.837,0,0,0,0,100,0),
(21290,469,-12057,-125.482,39.5804,0,0,0,0,100,0),
(21290,470,-12042.5,-125.715,39.629,0,0,0,0,100,0),
(21290,471,-12028,-125.946,39.6302,0,0,0,0,100,0),
(21290,472,-12015,-119.696,39.6302,0,0,0,0,100,0),
(21290,473,-12006.2,-115.508,40.587,0,0,0,0,100,0),
(21290,474,-11999.3,-112.185,42.1644,0,0,0,0,100,0),
(21290,475,-11995.5,-110.37,42.6937,0,0,0,0,100,0),
(21290,476,-11987,-104.663,37.1481,0,0,0,0,100,0),
(21290,477,-11977.6,-98.4336,33.3495,0,0,0,0,100,0),
(21290,478,-11969.7,-93.1146,31.8519,0,0,0,0,100,0),
(21290,479,-11957.1,-84.4346,32.2449,0,0,0,0,100,0),
(21290,480,-11948,-78.1329,35.059,0,0,0,0,100,0),
(21290,481,-11940.9,-73.2263,38.9793,0,0,0,0,100,0),
(21290,482,-11935.3,-69.3518,42.5398,0,0,0,0,100,0),
(21290,483,-11932.4,-67.3883,42.162,0,0,0,0,100,0),
(21290,484,-11925.4,-62.6935,40.5868,0,0,0,0,100,0),
(21290,485,-11917.6,-57.4744,39.7268,0,0,0,0,100,0),
(21290,486,-11909.5,-51.9821,39.7269,0,0,0,0,100,0),
(21290,487,-11898.2,-49.5316,39.7269,0,0,0,0,100,0),
(21290,488,-11884.8,-46.6099,39.7266,0,0,0,0,100,0),
(21290,489,-11870.5,-43.5094,39.7267,0,0,0,0,100,0),
(21290,490,-11860.1,-44.1945,39.7267,0,0,0,0,100,0),
(21290,491,-11846.3,-45.111,39.7267,0,0,0,0,100,0),
(21290,492,-11832.7,-46.0094,39.7267,0,0,0,0,100,0),
(21290,493,-11819.4,-50.8158,39.7252,0,0,0,0,100,0),
(21290,494,-11804.7,-56.1466,39.7245,0,0,0,0,100,0),
(21290,495,-11796.1,-68.9424,39.7245,0,0,0,0,100,0),
(21290,496,-11785.8,-84.3702,39.7261,0,0,0,0,100,0),
(21290,497,-11780.6,-94.1878,40.6825,0,0,0,0,100,0),
(21290,498,-11776.9,-101.315,42.2411,0,0,0,0,100,0),
(21290,499,-11774.9,-105.138,42.67,0,0,0,0,100,0),
(21290,500,-11770.2,-113.552,36.9645,0,0,0,0,100,0),
(21290,501,-11765.1,-122.496,33.5596,0,0,0,0,100,0),
(21290,502,-11759.1,-133.145,31.795,0,0,0,0,100,0),
(21290,503,-11754.1,-142.377,32.0619,0,0,0,0,100,0),
(21290,504,-11748.6,-152.532,34.2553,0,0,0,0,100,0),
(21290,505,-11743.2,-162.484,38.9424,0,0,0,0,100,0),
(21290,506,-11739.8,-168.75,42.6547,0,0,0,0,100,0),
(21290,507,-11737.7,-172.129,42.2288,0,0,0,0,100,0),
(21290,508,-11733.4,-179.295,40.6716,0,0,0,0,100,0),
(21290,509,-11725.3,-192.539,39.5561,0,0,0,0,100,0),
(21290,510,-11717,-206.032,39.556,0,0,0,0,100,0),
(21290,511,-11707.1,-212.988,39.5563,0,0,0,0,100,0),
(21290,512,-11695.2,-221.365,39.5569,0,0,0,0,100,0),
(21290,513,-11684.3,-229.009,40.7366,0,0,0,0,100,0),
(21290,514,-11680.6,-231.558,41.1691,0,0,0,0,100,0),
(21290,515,-11668.8,-239.253,34.0883,0,0,0,0,100,0),
(21290,516,-11657.6,-246.533,30.7026,0,0,0,0,100,0),
(21290,517,-11646.9,-253.251,30.292,0,0,0,0,100,0),
(21290,518,-11638,-258.845,31.7412,0,0,0,0,100,0),
(21290,519,-11627.1,-265.746,36.1535,0,0,0,0,100,0),
(21290,520,-11619.6,-270.49,41.1487,0,0,0,0,100,0),
(21290,521,-11616.3,-272.596,40.7351,0,0,0,0,100,0),
(21290,522,-11609.2,-277.225,39.1722,0,0,0,0,100,0),
(21290,523,-11596.6,-285.443,36.0951,0,0,0,0,100,0),
(21290,524,-11585.1,-292.947,35.6661,0,0,0,0,100,0),
(21290,525,-11575.8,-300.522,35.6661,0,0,0,0,100,0),
(21290,526,-11561.5,-312.139,35.6661,0,0,0,0,100,0),
(21290,527,-11543.3,-326.881,35.6664,0,0,0,0,100,0),
(21290,528,-11530.9,-323.601,35.864,0,0,0,0,100,0),
(21290,529,-11519.5,-320.586,35.8302,0,0,0,0,100,0),
(21290,530,-11508.7,-317.722,35.7519,0,0,0,0,100,0),
(21290,531,-11496.5,-306.73,35.7143,0,0,0,0,100,0),
(21290,532,-11485.8,-297.036,35.8662,0,0,0,0,100,0),
(21290,533,-11473.1,-291.177,36.7594,0,0,0,0,100,0),
(21290,534,-11461.5,-290.153,40.0686,0,0,0,0,100,0),
(21290,535,-11447.6,-288.938,43.776,0,0,0,0,100,0),
(21290,536,-11436,-287.917,47.6079,0,0,0,0,100,0),
(21290,537,-11419.9,-287.553,52.6161,0,0,0,0,100,0),
(21290,538,-11408.6,-287.63,55.783,0,0,0,0,100,0),
(21290,539,-11393,-287.735,58.9945,0,0,0,0,100,0),
(21290,540,-11388,-300.8,62.2796,0,0,0,0,100,0),
(21290,541,-11384.2,-310.594,63.7066,0,0,0,0,100,0),
(21290,542,-11382.3,-316.876,64.9469,0,0,0,0,100,0),
(21290,543,-11379.6,-325.488,65.2625,0,0,0,0,100,0),
(21290,544,-11376,-337.341,65.7049,0,0,0,0,100,0),
(21290,545,-11371.2,-348.528,65.8346,0,0,0,0,100,0),
(21290,546,-11363.4,-366.761,66.2308,0,0,0,0,100,0),
(21290,547,-11356.8,-382.294,65.026,0,0,0,0,100,0),
(21290,548,-11350.3,-390.26,65.7929,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
