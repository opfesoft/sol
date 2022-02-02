-- DB update 2022_02_02_02 -> 2022_02_02_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_02_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_02_02 2022_02_02_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1643825924290599304'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1643825924290599304');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 467;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(467,0,0,1,19,0,100,0,155,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Defias Traitor - On Accepted Quest ''The Defias Brotherhood'' - Store Target ID 1 (Invoker)'),
(467,0,1,2,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Defias Traitor - Linked - Set Active On'),
(467,0,2,3,61,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Defias Traitor - Linked - Set Faction ''Escortee'''),
(467,0,3,4,61,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Defias Traitor - Linked - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(467,0,4,5,61,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'The Defias Traitor - Linked - Say Line 0'),
(467,0,5,0,61,0,100,0,0,0,0,0,0,53,1,467,0,155,6000,1,7,0,0,0,0,0,0,0,0,'The Defias Traitor - Linked - Start WP Movement'),
(467,0,6,0,40,0,100,0,84,467,0,0,0,59,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Defias Traitor - On WP Reached 84 - Set Run Off'),
(467,0,7,0,40,0,100,0,85,467,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'The Defias Traitor - On WP Reached 85 - Say Line 1'),
(467,0,8,0,58,0,100,0,0,467,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'The Defias Traitor - On WP Path Ended - Say Line 2'),
(467,0,9,0,4,0,50,0,0,0,0,0,0,1,3,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'The Defias Traitor - On Aggro - Say Line 3'),
(467,0,10,0,6,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Defias Traitor - On Death - Set Active On');

DELETE FROM `waypoints` WHERE `entry` = 467;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(467,1,-10508.4,1068,55.0275,'The Defias Traitor - Quest ''The Defias Brotherhood'''),
(467,2,-10518.3,1074.84,53.9682,NULL),
(467,3,-10534.8,1081.92,49.8917,NULL),
(467,4,-10546.5,1084.88,47.9817,NULL),
(467,5,-10555.3,1084.45,45.7584,NULL),
(467,6,-10566.6,1083.53,42.0973,NULL),
(467,7,-10575.8,1082.34,39.4774,NULL),
(467,8,-10585.7,1081.08,37.7763,NULL),
(467,9,-10600.1,1078.19,36.238,NULL),
(467,10,-10608.7,1076.08,35.8855,NULL),
(467,11,-10621.3,1073,35.4075,NULL),
(467,12,-10630.1,1066.26,34.107,NULL),
(467,13,-10638.1,1060.18,33.6195,NULL),
(467,14,-10646.4,1050.32,33.3151,NULL),
(467,15,-10655.9,1038.99,33.4831,NULL),
(467,16,-10664.7,1030.54,32.7066,NULL),
(467,17,-10674,1031.24,32.5984,NULL),
(467,18,-10690.2,1032.47,32.5858,NULL),
(467,19,-10708.7,1033.86,33.3284,NULL),
(467,20,-10717.1,1030.95,33.4683,NULL),
(467,21,-10727.7,1027.25,33.2895,NULL),
(467,22,-10738.2,1023.57,33.4183,NULL),
(467,23,-10746.5,1020.67,33.4536,NULL),
(467,24,-10754.4,1017.93,32.799,NULL),
(467,25,-10764.1,1017.95,32.1255,NULL),
(467,26,-10775.4,1017.97,32.5604,NULL),
(467,27,-10787.8,1017.99,32.8712,NULL),
(467,28,-10802.3,1018.01,32.1647,NULL),
(467,29,-10813.2,1014.79,32.6117,NULL),
(467,30,-10822.2,1012.11,32.7818,NULL),
(467,31,-10832.6,1009.04,32.7136,NULL),
(467,32,-10842,1008.34,32.5959,NULL),
(467,33,-10853.3,1007.5,31.9846,NULL),
(467,34,-10866.6,1006.51,31.7149,NULL),
(467,35,-10880,1005.1,32.8458,NULL),
(467,36,-10892.5,1001.32,34.471,NULL),
(467,37,-10898.6,999.437,35.4861,NULL),
(467,38,-10906.1,997.11,36.1563,NULL),
(467,39,-10913.7,999.527,35.5964,NULL),
(467,40,-10922.3,1002.23,35.7477,NULL),
(467,41,-10926.9,1009.11,36.3984,NULL),
(467,42,-10930.7,1014.87,36.7964,NULL),
(467,43,-10936.3,1023.38,36.528,NULL),
(467,44,-10935.5,1031.35,36.7749,NULL),
(467,45,-10934.4,1042.33,36.4191,NULL),
(467,46,-10933.3,1052.61,35.8577,NULL),
(467,47,-10935.6,1061.03,36.2309,NULL),
(467,48,-10938.2,1070.27,36.4081,NULL),
(467,49,-10940.2,1077.66,36.4969,NULL),
(467,50,-10945.2,1084.12,36.5228,NULL),
(467,51,-10950.4,1090.77,36.7402,NULL),
(467,52,-10957.1,1099.33,36.836,NULL),
(467,53,-10956.9,1107.92,36.7005,NULL),
(467,54,-10956.5,1119.9,36.7399,NULL),
(467,55,-10952,1128.04,37.0162,NULL),
(467,56,-10945.7,1139.31,37.3832,NULL),
(467,57,-10939.3,1150.75,37.4259,NULL),
(467,58,-10935.4,1159.07,37.6559,NULL),
(467,59,-10930.5,1169.35,37.63,NULL),
(467,60,-10926.2,1178.55,37.2896,NULL),
(467,61,-10921,1189.55,36.8486,NULL),
(467,62,-10915.1,1202.09,36.5504,NULL),
(467,63,-10911.6,1210.52,35.8364,NULL),
(467,64,-10907.5,1220.53,34.8447,NULL),
(467,65,-10902.6,1232.65,34.0824,NULL),
(467,66,-10898.8,1241.87,33.5049,NULL),
(467,67,-10895.6,1249.74,33.335,NULL),
(467,68,-10892.6,1257.03,33.3723,NULL),
(467,69,-10892.5,1266.4,33.393,NULL),
(467,70,-10892.3,1277.07,33.4019,NULL),
(467,71,-10892.2,1288.21,33.6794,NULL),
(467,72,-10892,1297.12,34.4829,NULL),
(467,73,-10891.9,1306.66,35.4547,NULL),
(467,74,-10893.8,1316,36.3293,NULL),
(467,75,-10896.2,1327.86,37.7758,NULL),
(467,76,-10898.7,1337.93,38.5133,NULL),
(467,77,-10901.2,1348.5,38.9051,NULL),
(467,78,-10903.7,1358.57,39.6625,NULL),
(467,79,-10906,1368.05,40.9153,NULL),
(467,80,-10908.4,1380.13,41.9365,NULL),
(467,81,-10910.2,1389.33,42.6227,NULL),
(467,82,-10911.7,1397.63,43.0738,NULL),
(467,83,-10913.3,1406.25,43.0483,NULL),
(467,84,-10915.4,1417.72,42.9351,NULL),
(467,85,-10926.4,1421.18,43.0429,NULL),
(467,86,-10939.3,1421.46,43.1791,NULL),
(467,87,-10952.3,1421.74,43.4082,NULL),
(467,88,-10967.5,1416.06,43.0919,NULL),
(467,89,-10980,1411.38,42.79,NULL),
(467,90,-10993.2,1415.99,43.0589,NULL),
(467,91,-11006.1,1420.47,43.2663,NULL),
(467,92,-11010.4,1428.57,43.007,NULL),
(467,93,-11016.2,1439.57,43.0407,NULL),
(467,94,-11022,1450.59,43.09,NULL),
(467,95,-11022.9,1461.38,42.9602,NULL),
(467,96,-11023.8,1472.37,43.0689,NULL),
(467,97,-11024.7,1483.12,43.0752,NULL),
(467,98,-11025.4,1491.59,43.1586,NULL),
(467,99,-11030.6,1499.77,43.2,NULL),
(467,100,-11036.1,1508.32,43.2026,NULL),
(467,101,-11043,1513.49,43.1969,NULL),
(467,102,-11051.7,1520.01,43.1839,NULL),
(467,103,-11060.7,1526.72,43.1961,NULL),
(467,104,-11072.8,1527.77,43.2039,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
