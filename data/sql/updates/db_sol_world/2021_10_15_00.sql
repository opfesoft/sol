-- DB update 2021_10_14_01 -> 2021_10_15_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_14_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_14_01 2021_10_15_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634251593104245913'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634251593104245913');

DELETE FROM `gameobject` WHERE `id` = 179828;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3008988,179828,0,0,0,1,1,-6569.39,-1335.83,210.199,2.33874,0,0,0,1,30,255,1,0),
(3008989,179828,0,0,0,1,1,-6527.64,-1340.23,212.095,1.83259,0,0,0,1,30,255,1,0),
(3008990,179828,0,0,0,1,1,-6518.91,-1364.86,210.541,5.65487,0,0,0,1,30,255,1,0),
(3008991,179828,0,0,0,1,1,-6572.96,-1327.58,212.095,3.56047,0,0,0,1,30,255,1,0),
(3008992,179828,0,0,0,1,1,-6570.39,-1332.69,212.095,5.37562,0,0,0,1,30,255,1,0),
(3008993,179828,0,0,0,1,1,-6547.68,-1325.57,212.376,2.75761,0,0,0,1,30,255,1,0),
(3008994,179828,0,0,0,1,1,-6575.96,-1323.57,210.144,4.29351,0,0,0,1,30,255,1,0),
(3008995,179828,0,0,0,1,1,-6552.55,-1317.99,212.64,4.93928,0,0,0,1,30,255,1,0),
(3008996,179828,0,0,0,1,1,-6576.94,-1319.12,210.249,6.03884,0,0,0,1,30,255,1,0),
(3008997,179828,0,0,0,1,1,-6551.49,-1318.46,210.419,0.698131,0,0,0,1,30,255,1,0),
(3008998,179828,0,0,0,1,1,-6528.67,-1339.02,210.124,2.67035,0,0,0,1,30,255,1,0),
(3008999,179828,0,0,0,1,1,-6543.81,-1358.71,210.544,3.75246,0,0,0,1,30,255,1,0),
(3009000,179828,0,0,0,1,1,-6554.68,-1351.74,212.682,2.14675,0,0,0,1,30,255,1,0),
(3009001,179828,0,0,0,1,1,-6562.07,-1344.44,212.619,1.25664,0,0,0,1,30,255,1,0),
(3009002,179828,0,0,0,1,1,-6554.33,-1313.8,210.26,5.28835,0,0,0,1,30,255,1,0),
(3009003,179828,0,0,0,1,1,-6543.61,-1329.85,212.564,5.39307,0,0,0,1,30,255,1,0),
(3009004,179828,0,0,0,1,1,-6544.77,-1329.61,210.26,5.3058,0,0,0,1,30,255,1,0),
(3009005,179828,0,0,0,1,1,-6551.14,-1354.85,210.421,4.36332,0,0,0,1,30,255,1,0),
(3009006,179828,0,0,0,1,1,-6550.27,-1321.75,210.433,5.44543,0,0,0,1,30,255,1,0),
(3009007,179828,0,0,0,1,1,-6518.33,-1342.21,212.095,4.99164,0,0,0,1,30,255,1,0),
(3009008,179828,0,0,0,1,1,-6558.36,-1347.93,210.26,3.35105,0,0,0,1,30,255,1,0),
(3009009,179828,0,0,0,1,1,-6531.65,-1337.63,210.18,4.39823,0,0,0,1,30,255,1,0),
(3009010,179828,0,0,0,1,1,-6508.78,-1365.26,212.859,0.645772,0,0,0,1,30,255,1,0),
(3009011,179828,0,0,0,1,1,-6528.76,-1363.6,212.657,2.61799,0,0,0,1,30,255,1,0);

DELETE FROM `pool_template` WHERE `entry` = 763;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(763,8,'Searing Gorge Dark Iron Pillow Spawns (8 out of 24)');

DELETE FROM `pool_gameobject` WHERE `pool_entry` = 763;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(3008988,763,0,'Searing Gorge Dark Iron Pillow Spawn 1'),
(3008989,763,0,'Searing Gorge Dark Iron Pillow Spawn 2'),
(3008990,763,0,'Searing Gorge Dark Iron Pillow Spawn 3'),
(3008991,763,0,'Searing Gorge Dark Iron Pillow Spawn 4'),
(3008992,763,0,'Searing Gorge Dark Iron Pillow Spawn 5'),
(3008993,763,0,'Searing Gorge Dark Iron Pillow Spawn 6'),
(3008994,763,0,'Searing Gorge Dark Iron Pillow Spawn 7'),
(3008995,763,0,'Searing Gorge Dark Iron Pillow Spawn 8'),
(3008996,763,0,'Searing Gorge Dark Iron Pillow Spawn 9'),
(3008997,763,0,'Searing Gorge Dark Iron Pillow Spawn 10'),
(3008998,763,0,'Searing Gorge Dark Iron Pillow Spawn 11'),
(3008999,763,0,'Searing Gorge Dark Iron Pillow Spawn 12'),
(3009000,763,0,'Searing Gorge Dark Iron Pillow Spawn 13'),
(3009001,763,0,'Searing Gorge Dark Iron Pillow Spawn 14'),
(3009002,763,0,'Searing Gorge Dark Iron Pillow Spawn 15'),
(3009003,763,0,'Searing Gorge Dark Iron Pillow Spawn 16'),
(3009004,763,0,'Searing Gorge Dark Iron Pillow Spawn 17'),
(3009005,763,0,'Searing Gorge Dark Iron Pillow Spawn 18'),
(3009006,763,0,'Searing Gorge Dark Iron Pillow Spawn 19'),
(3009007,763,0,'Searing Gorge Dark Iron Pillow Spawn 20'),
(3009008,763,0,'Searing Gorge Dark Iron Pillow Spawn 21'),
(3009009,763,0,'Searing Gorge Dark Iron Pillow Spawn 22'),
(3009010,763,0,'Searing Gorge Dark Iron Pillow Spawn 23'),
(3009011,763,0,'Searing Gorge Dark Iron Pillow Spawn 24');

DELETE FROM `creature_text` WHERE `CreatureId` IN (14635,14636);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(14635,0,0,'Our pillas! Someone has stolen our pillas!',14,0,100,0,0,0,9799,0,'Sleepy Dark Iron Worker'),
(14635,1,0,'We''ll not let this act of madness go unpunished!',14,0,100,0,0,0,9800,0,'Sleepy Dark Iron Worker'),
(14636,0,0,'Thieves! Scallywags! Rapscallions! Come face me gigantic pillas!',14,0,100,0,0,0,9810,0,'Chambermaid Pillaclencher');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (14635,14636);
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 179828;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (14635,14636);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 179828;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` BETWEEN 1463500 AND 1463509;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14635,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron - On Just Summoned - Set Active On'),
(14635,0,1,0,61,0,100,0,0,0,0,0,0,88,1463500,1463509,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron - Linked - Call Random Ranged Action List'),
(14635,0,2,0,38,0,100,1,1,1,0,0,0,1,0,5000,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron - On Data Set 1 1 - Say Line 0 (No Repeat)'),
(14635,0,3,0,52,0,100,0,0,14635,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron - On Text Over - Say Line 1'),

(1463500,9,0,0,0,0,100,0,0,0,0,0,0,53,0,1463500,1,0,0,2,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron Worker - On Script - Start WP Movement'),
(1463501,9,0,0,0,0,100,0,0,0,0,0,0,53,0,1463501,1,0,0,2,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron Worker - On Script - Start WP Movement'),
(1463502,9,0,0,0,0,100,0,0,0,0,0,0,53,0,1463502,1,0,0,2,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron Worker - On Script - Start WP Movement'),
(1463503,9,0,0,0,0,100,0,0,0,0,0,0,53,0,1463503,1,0,0,2,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron Worker - On Script - Start WP Movement'),
(1463504,9,0,0,0,0,100,0,0,0,0,0,0,53,0,1463504,1,0,0,2,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron Worker - On Script - Start WP Movement'),
(1463505,9,0,0,0,0,100,0,0,0,0,0,0,53,0,1463505,1,0,0,2,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron Worker - On Script - Start WP Movement'),
(1463506,9,0,0,0,0,100,0,0,0,0,0,0,53,0,1463506,1,0,0,2,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron Worker - On Script - Start WP Movement'),
(1463507,9,0,0,0,0,100,0,0,0,0,0,0,53,0,1463507,1,0,0,2,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron Worker - On Script - Start WP Movement'),
(1463508,9,0,0,0,0,100,0,0,0,0,0,0,53,0,1463508,1,0,0,2,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron Worker - On Script - Start WP Movement'),
(1463509,9,0,0,0,0,100,0,0,0,0,0,0,53,0,1463509,1,0,0,2,1,0,0,0,0,0,0,0,0,'Sleepy Dark Iron Worker - On Script - Start WP Movement'),

(14636,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chambermaid Pillaclencher - On Just Summoned - Set Active On'),
(14636,0,1,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chambermaid Pillaclencher - Linked - Say Line 0'),
(14636,0,2,0,6,0,100,0,0,0,0,0,0,11,23408,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Chambermaid Pillaclencher - On Death - Cast ''Drop Pillow DND'''),
(14636,0,3,0,9,0,100,0,0,40,3000,15000,0,11,23416,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chambermaid Pillaclencher - Within 0-40 Range - Cast ''Pillow Fight'''),
(14636,0,4,0,0,0,100,0,5000,9000,15000,18000,0,11,23417,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Chambermaid Pillaclencher - IC - Cast ''Smother'''),

(179828,1,0,0,70,1,100,0,3,0,0,0,0,12,14636,1,1800000,0,0,0,8,0,0,0,0,-6539.3,-1347.27,208.986,2.60054,'Dark Iron Pillow - On State Changed - Summon ''Chambermaid Pillaclencher'' (Phase 1)'),
(179828,1,1,2,70,2,100,0,3,0,0,0,0,12,14635,1,1800000,0,0,0,8,0,0,0,0,-6577.97,-1289.04,208.826,2.60054,'Dark Iron Pillow - On State Changed - Summon ''Sleepy Dark Iron Worker'' (Phase 2)'),
(179828,1,2,3,61,0,100,0,0,0,0,0,0,12,14635,1,1800000,0,0,0,8,0,0,0,0,-6580.84,-1290.89,208.826,2.44346,'Dark Iron Pillow - Linked - Summon ''Sleepy Dark Iron Worker'''),
(179828,1,3,4,61,0,100,0,0,0,0,0,0,12,14635,1,1800000,0,0,0,8,0,0,0,0,-6575.2,-1287.64,208.826,4.53786,'Dark Iron Pillow - Linked - Summon ''Sleepy Dark Iron Worker'''),
(179828,1,4,5,61,0,100,0,0,0,0,0,0,12,14635,1,1800000,0,0,0,8,0,0,0,0,-6573.95,-1291.89,208.826,0.0349066,'Dark Iron Pillow - Linked - Summon ''Sleepy Dark Iron Worker'''),
(179828,1,5,6,61,0,100,0,0,0,0,0,0,12,14635,1,1800000,0,0,0,8,0,0,0,0,-6576.88,-1295.08,208.826,5.46288,'Dark Iron Pillow - Linked - Summon ''Sleepy Dark Iron Worker'''),
(179828,1,6,7,61,0,100,0,0,0,0,0,0,12,14635,1,1800000,0,0,0,8,0,0,0,0,-6582.04,-1287.82,208.826,4.4855,'Dark Iron Pillow - Linked - Summon ''Sleepy Dark Iron Worker'''),
(179828,1,7,8,61,0,100,0,0,0,0,0,0,12,14635,1,1800000,0,0,0,8,0,0,0,0,-6577.63,-1285.87,208.826,4.57276,'Dark Iron Pillow - Linked - Summon ''Sleepy Dark Iron Worker'''),
(179828,1,8,9,61,0,100,0,0,0,0,0,0,12,14635,1,1800000,0,0,0,8,0,0,0,0,-6582.85,-1293.73,208.826,1.67552,'Dark Iron Pillow - Linked - Summon ''Sleepy Dark Iron Worker'''),
(179828,1,9,10,61,0,100,0,0,0,0,0,0,12,14635,1,1800000,0,0,0,8,0,0,0,0,-6571.29,-1286.36,208.826,4.11898,'Dark Iron Pillow - Linked - Summon ''Sleepy Dark Iron Worker'''),
(179828,1,10,11,61,0,100,0,0,0,0,0,0,12,14635,1,1800000,0,0,0,8,0,0,0,0,-6580.44,-1285.85,208.826,4.45059,'Dark Iron Pillow - Linked - Summon ''Sleepy Dark Iron Worker'''),
(179828,1,11,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,14635,0,0,0,0,0,0,0,'Dark Iron Pillow - Linked - Set Data 1 1 (Sleepy Dark Iron Worker)'),
(179828,1,12,0,64,0,100,0,2,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Pillow - On Gossip Hello - Set Phase 1'),
(179828,1,13,0,64,0,100,0,2,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Pillow - On Gossip Hello - Set Phase 2');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 179828 AND `SourceId` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,13,179828,1,0,2,0,18943,19,0,0,0,0,'Dark Iron Pillow - Group 0: Execute SAI only if the player has 19 Dark Iron Pillows'),
(22,13,179828,1,0,2,0,18943,20,0,1,0,0,'Dark Iron Pillow - Group 0: Execute SAI only if the player doesn''t have 20 Dark Iron Pillows'),
(22,13,179828,1,0,29,1,14636,100,0,1,0,0,'Dark Iron Pillow - Group 0: Execute SAI only if not near ''Chambermaid Pillaclencher'''),

(22,14,179828,1,0,2,0,18943,11,0,0,0,0,'Dark Iron Pillow - Group 0: Execute SAI only if the player has 11 Dark Iron Pillows'),
(22,14,179828,1,0,2,0,18943,12,0,1,0,0,'Dark Iron Pillow - Group 0: Execute SAI only if the player doesn''t have 12 Dark Iron Pillows'),
(22,14,179828,1,0,29,1,14635,100,0,1,0,0,'Dark Iron Pillow - Group 0: Execute SAI only if not near ''Sleepy Dark Iron Worker''');

-- Fix looting "Chambermaid Pillaclencher's Pillow" (the item itself starts the quest)
UPDATE `gameobject_loot_template` SET `QuestRequired` = 0 WHERE `Entry` = 16841;

DELETE FROM `waypoints` WHERE `entry` BETWEEN 1463500 AND 1463509;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(1463500,1,-6571.01,-1310.01,208.686,'Dark Iron Worker - Path 1'),
(1463500,2,-6565.9,-1330.04,208.774,NULL),
(1463500,3,-6554.73,-1341.21,208.932,NULL),
(1463500,4,-6527.23,-1350.97,208.907,NULL),
(1463500,5,-6500.68,-1352.37,209.145,NULL),
(1463500,6,-6492.33,-1352.68,212.1,NULL),
(1463500,7,-6477.65,-1353.51,212.107,NULL),
(1463500,8,-6492.33,-1352.68,212.1,NULL),
(1463500,9,-6500.68,-1352.37,209.145,NULL),
(1463500,10,-6521.47,-1347.69,208.866,NULL),
(1463500,11,-6551.05,-1343.47,208.944,NULL),
(1463500,12,-6565.92,-1328.37,208.779,NULL),

(1463501,1,-6568.69,-1306.02,208.616,'Dark Iron Worker - Path 2'),
(1463501,2,-6560.79,-1322.42,208.862,NULL),
(1463501,3,-6553.94,-1341.82,208.946,NULL),
(1463501,4,-6526.74,-1351.1,208.914,NULL),
(1463501,5,-6500.3,-1348.17,209.272,NULL),
(1463501,6,-6492.14,-1350.14,212.107,NULL),
(1463501,7,-6480.37,-1352.99,212.107,NULL),
(1463501,8,-6492.52,-1351.46,212.107,NULL),
(1463501,9,-6500.38,-1350.48,209.217,NULL),
(1463501,10,-6523.57,-1350.01,208.911,NULL),
(1463501,11,-6551.08,-1340.64,208.945,NULL),
(1463501,12,-6564.98,-1329.96,208.785,NULL),

(1463502,1,-6566.57,-1311.09,208.814,'Dark Iron Worker - Path 3'),
(1463502,2,-6565.01,-1323.49,208.805,NULL),
(1463502,3,-6554.39,-1334.81,208.936,NULL),
(1463502,4,-6519.73,-1349.07,208.906,NULL),
(1463502,5,-6500.46,-1347.24,209.275,NULL),
(1463502,6,-6492.77,-1347.09,212.107,NULL),
(1463502,7,-6476.91,-1346.77,212.107,NULL),
(1463502,8,-6492.4,-1351.54,212.107,NULL),
(1463502,9,-6500.32,-1353.97,209.15,NULL),
(1463502,10,-6525.72,-1355.94,209.031,NULL),
(1463502,11,-6555.21,-1343.24,208.924,NULL),
(1463502,12,-6556.97,-1326.98,208.893,NULL),

(1463503,1,-6570.05,-1306.44,208.599,'Dark Iron Worker - Path 4'),
(1463503,2,-6565.88,-1325.34,208.788,NULL),
(1463503,3,-6546.48,-1337.35,208.86,NULL),
(1463503,4,-6523.84,-1349.33,208.894,NULL),
(1463503,5,-6499.86,-1350.94,209.262,NULL),
(1463503,6,-6492.17,-1351.45,212.107,NULL),
(1463503,7,-6479.97,-1353.76,212.1,NULL),
(1463503,8,-6491.93,-1354.91,212.1,NULL),
(1463503,9,-6499.97,-1354.3,209.181,NULL),
(1463503,10,-6519.3,-1352.83,208.997,NULL),
(1463503,11,-6545.53,-1339.51,208.841,NULL),
(1463503,12,-6563.64,-1327.15,208.81,NULL),

(1463504,1,-6569.32,-1303.39,208.743,'Dark Iron Worker - Path 5'),
(1463504,2,-6559.3,-1327.23,208.864,NULL),
(1463504,3,-6550.54,-1343.35,208.935,NULL),
(1463504,4,-6526.89,-1355.23,209.007,NULL),
(1463504,5,-6499.73,-1351.43,209.266,NULL),
(1463504,6,-6491.85,-1350.49,212.107,NULL),
(1463504,7,-6477.18,-1348.72,212.107,NULL),
(1463504,8,-6492.93,-1348.36,212.107,NULL),
(1463504,9,-6500.51,-1349.81,209.217,NULL),
(1463504,10,-6523.31,-1354.16,209.008,NULL),
(1463504,11,-6553.1,-1339,208.959,NULL),
(1463504,12,-6557.23,-1328.21,208.887,NULL),

(1463505,1,-6564.52,-1308.97,208.86,'Dark Iron Worker - Path 6'),
(1463505,2,-6560.33,-1328.83,208.846,NULL),
(1463505,3,-6550.13,-1338.94,208.928,NULL),
(1463505,4,-6520.88,-1347.87,208.873,NULL),
(1463505,5,-6499.51,-1353.75,209.24,NULL),
(1463505,6,-6491.53,-1354.98,212.107,NULL),
(1463505,7,-6478,-1347.03,212.107,NULL),
(1463505,8,-6492.59,-1350.58,212.107,NULL),
(1463505,9,-6500.19,-1352.42,209.196,NULL),
(1463505,10,-6525.09,-1353.6,208.983,NULL),
(1463505,11,-6549.43,-1334.96,208.917,NULL),
(1463505,12,-6564.78,-1322.71,208.815,NULL),

(1463506,1,-6569.81,-1302.34,208.743,'Dark Iron Worker - Path 7'),
(1463506,2,-6566.72,-1324.22,208.78,NULL),
(1463506,3,-6552.36,-1342.93,208.969,NULL),
(1463506,4,-6528.49,-1349.84,208.872,NULL),
(1463506,5,-6499.8,-1352.5,209.235,NULL),
(1463506,6,-6491.78,-1353.25,212.107,NULL),
(1463506,7,-6481.95,-1350.36,212.107,NULL),
(1463506,8,-6492.34,-1351.99,212.107,NULL),
(1463506,9,-6500.19,-1353.23,209.18,NULL),
(1463506,10,-6527.13,-1355.97,209.022,NULL),
(1463506,11,-6548.8,-1335.09,208.905,NULL),
(1463506,12,-6560.04,-1325.01,208.861,NULL),

(1463507,1,-6567.03,-1309.58,208.793,'Dark Iron Worker - Path 8'),
(1463507,2,-6559,-1328.47,208.864,NULL),
(1463507,3,-6551.75,-1338.33,208.959,NULL),
(1463507,4,-6522.69,-1353.94,209.007,NULL),
(1463507,5,-6499.7,-1353.9,209.217,NULL),
(1463507,6,-6491.54,-1353.89,212.107,NULL),
(1463507,7,-6481.68,-1351.74,212.107,NULL),
(1463507,8,-6492.13,-1352.95,212.107,NULL),
(1463507,9,-6500.27,-1352.24,209.192,NULL),
(1463507,10,-6526.63,-1349.93,208.888,NULL),
(1463507,11,-6546.77,-1337.66,208.865,NULL),
(1463507,12,-6566.42,-1325.94,208.779,NULL),

(1463508,1,-6566.35,-1310.61,208.818,'Dark Iron Worker - Path 9'),
(1463508,2,-6558.86,-1329.27,208.863,NULL),
(1463508,3,-6552.16,-1335.98,208.968,NULL),
(1463508,4,-6520.94,-1348.59,208.89,NULL),
(1463508,5,-6499.77,-1353.32,209.221,NULL),
(1463508,6,-6491.34,-1355.2,212.107,NULL),
(1463508,7,-6484.48,-1350.91,212.107,NULL),
(1463508,8,-6492.32,-1352.12,212.107,NULL),
(1463508,9,-6500.23,-1350.82,209.225,NULL),
(1463508,10,-6520.12,-1347.55,208.869,NULL),
(1463508,11,-6546.5,-1337.46,208.861,NULL),
(1463508,12,-6563.04,-1329.6,208.811,NULL),

(1463509,1,-6569.6,-1301.85,208.743,'Dark Iron Worker - Path 10'),
(1463509,2,-6562.01,-1327.36,208.83,NULL),
(1463509,3,-6545.53,-1341.85,208.853,NULL),
(1463509,4,-6523.89,-1353.44,208.988,NULL),
(1463509,5,-6499.69,-1351.78,209.262,NULL),
(1463509,6,-6492,-1351.4,212.107,NULL),
(1463509,7,-6478.66,-1350.74,212.107,NULL),
(1463509,8,-6491.88,-1354.59,212.107,NULL),
(1463509,9,-6499.9,-1353.22,209.21,NULL),
(1463509,10,-6521.96,-1349.44,208.905,NULL),
(1463509,11,-6553.02,-1340.34,208.961,NULL),
(1463509,12,-6559.26,-1325.82,208.868,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
