-- DB update 2021_12_04_02 -> 2021_12_06_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_04_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_04_02 2021_12_06_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1638747213229229459'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1638747213229229459');

UPDATE `event_scripts` SET `datalong2` = 60000, `dataint` = 3 WHERE `id` = 10561 AND `command` = 10;

UPDATE `quest_template` SET `RequiredNpcOrGo1` = -181653 WHERE `ID` = 9444;

DELETE FROM `creature_template_addon` WHERE `entry` = 17233;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(17233,0,0,33554432,1,0,0,NULL);

DELETE FROM `creature_summon_groups` WHERE `summonerId` = 17238;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(17238,0,1,4472,1039.98,-1577.66,61.437,1.75395,4,30000),
(17238,0,1,1802,1031.03,-1576.28,62.436,0.265621,4,30000),
(17238,0,2,4475,1110.66,-1742.14,61.019,2.41369,4,30000),
(17238,0,2,4475,1106.84,-1750.59,61.174,2.40976,4,30000),
(17238,0,2,4475,1111.72,-1753.4,61.459,2.75534,4,30000),
(17238,0,2,4475,1117.46,-1743.33,61,2.85351,4,30000);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17238,17253,17233);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1723800,1723801,1723802,1723803,1723300,1723301);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17238,0,0,0,19,0,100,0,9446,0,0,0,0,80,1723800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Quest ''Tomb of the Lightbringer'' Accepted - Call Timed Action List'),
(17238,0,1,0,40,0,100,0,7,0,0,0,0,80,1723801,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On WP 7 Reached - Call Timed Action List'),
(17238,0,2,3,40,0,100,0,18,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On WP 18 Reached - Say Line 2'),
(17238,0,3,0,61,0,100,0,0,0,0,0,0,107,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - Linked - Summon Creature Group 1'),
(17238,0,4,0,40,0,100,0,23,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On WP 23 Reached - Say Line 3'),
(17238,0,5,6,40,0,100,0,34,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On WP 34 Reached - Say Line 4'),
(17238,0,6,0,61,0,100,0,0,0,0,0,0,107,2,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - Linked - Summon Creature Group 2'),
(17238,0,7,0,40,0,100,0,40,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On WP 40 Reached - Say Line 5'),
(17238,0,8,0,58,0,100,0,0,17238,0,0,0,80,1723803,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On WP Path Ended - Call Timed Action List'),
(17238,0,9,0,38,0,100,0,0,1,0,0,0,80,1723802,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Data Set 0 1 - Call Timed Action List'),

(1723800,9,0,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Store Target 1 (Invoker)'),
(1723800,9,1,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Set Active On'),
(1723800,9,2,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1723800,9,3,0,0,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Set Faction ''Escortee'''),
(1723800,9,4,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Say Line 0'),
(1723800,9,5,0,0,0,100,0,5000,5000,0,0,0,53,0,17238,0,9446,50000,1,12,1,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Start WP Movement'),

(1723801,9,0,0,0,0,100,0,0,0,0,0,0,54,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Pause WP Movement'),
(1723801,9,1,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Say Line 1'),
(1723801,9,2,0,0,0,100,0,15000,15000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Say Line 6'),

(1723802,9,0,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(1723802,9,1,0,0,0,100,0,10000,10000,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Set Orientation (Stored Target 1)'),
(1723802,9,2,0,0,0,100,0,0,0,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Say Line 7'),

(1723803,9,0,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,3.44595,'Anchorite Truuen - On Script - Set Orientation'),
(1723803,9,1,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(1723803,9,2,0,0,0,100,0,0,0,0,0,0,236,10561,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Call Event Script'),
(1723803,9,3,0,0,0,100,0,1000,1000,0,0,0,45,1,1,0,0,0,0,19,17233,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Set Data 1 1 (Ghost of Uther Lightbringer)'),

(17253,0,0,0,8,0,100,0,30098,0,60000,60000,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Defile Uther''s Tomb Trigger - On Spellhit ''Defile Uther''s Tomb'' - Set Event Phase 2'),
(17253,0,1,2,1,2,100,0,5000,5000,5000,5000,0,45,2,2,0,0,0,0,19,17233,0,0,0,0,0,0,0,'Defile Uther''s Tomb Trigger - OOC - Set Data 2 2 (Phase 2) (Ghost of Uther Lightbringer)'),
(17253,0,2,0,61,2,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Defile Uther''s Tomb Trigger - Linked - Set Event Phase 0 (Phase 2)'),

(17233,0,0,0,54,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Just Summoned - Set Phase 1'),
(17233,0,1,0,38,1,100,0,1,1,0,0,0,80,1723300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Data Set 1 1 - Call Timed Action List (Phase 1)'),
(17233,0,2,0,38,1,100,0,2,2,0,0,0,80,1723301,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Data Set 2 2 - Call Timed Action List (Phase 1)'),

(1723300,9,0,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Script - Set Phase 2'),
(1723300,9,1,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Script - Say Line 0'),
(1723300,9,2,0,0,0,100,0,9000,9000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Script - Say Line 1'),
(1723300,9,3,0,0,0,100,0,3000,3000,0,0,0,45,0,1,0,0,0,0,19,17238,20,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Script - Set Data 0 1 (Anchorite Truuen)'),
(1723300,9,4,0,0,0,100,0,8000,8000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Script - Force Despawn'),

(1723301,9,0,0,0,0,100,0,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Script - Set Phase 3'),
(1723301,9,1,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Script - Say Line 4'),
(1723301,9,2,0,0,0,100,0,4000,4000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Script - Say Line 5'),
(1723301,9,3,0,0,0,100,0,10000,10000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Script - Say Line 6'),
(1723301,9,4,0,0,0,100,0,7000,7000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Script - Say Line 7'),
(1723301,9,5,0,0,0,100,0,8000,8000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther Lightbringer - On Script - Force Despawn');

DELETE FROM `waypoints` WHERE `entry` = 17238;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(17238,1,954.51,-1433.02,63.16,'Anchorite Truuen - Quest ''Tomb of the Lightbringer'''),
(17238,2,957.737,-1442.65,62.6716,NULL),
(17238,3,961.526,-1453.96,63.32,NULL),
(17238,4,970.394,-1466.55,61.16,NULL),
(17238,5,982.804,-1465.15,60.6613,NULL),
(17238,6,998.698,-1463.37,60.8687,NULL),
(17238,7,1012.36,-1461.83,61.66,NULL),
(17238,8,1022.23,-1467.61,62.6577,NULL),
(17238,9,1031.54,-1473.05,63.67,NULL),
(17238,10,1035.23,-1483.63,64.4757,NULL),
(17238,11,1038.94,-1494.24,65.18,NULL),
(17238,12,1038.84,-1505.56,65.289,NULL),
(17238,13,1038.75,-1516.18,65.08,NULL),
(17238,14,1038.17,-1526.08,64.0881,NULL),
(17238,15,1037.45,-1538.54,62.7878,NULL),
(17238,16,1036.9,-1547.9,62.11,NULL),
(17238,17,1036.3,-1562.48,62.0211,NULL),
(17238,18,1035.79,-1574.94,61.63,NULL),
(17238,19,1035.66,-1588.13,61.6458,NULL),
(17238,20,1035.52,-1601.66,61.5785,NULL),
(17238,21,1035.4,-1613.21,61.5343,NULL),
(17238,22,1035.31,-1622.29,61.67,NULL),
(17238,23,1036.18,-1633.58,61.63,NULL),
(17238,24,1037.23,-1643.8,61.0467,NULL),
(17238,25,1038.24,-1653.66,60.31,NULL),
(17238,26,1041.59,-1665.22,60.97,NULL),
(17238,27,1047.1,-1676.42,60.5012,NULL),
(17238,28,1053.48,-1689.4,60.6345,NULL),
(17238,29,1059.76,-1702.15,60.61,NULL),
(17238,30,1069.99,-1712.87,60.5892,NULL),
(17238,31,1078.54,-1721.82,60.91,NULL),
(17238,32,1087.08,-1728.52,61.0388,NULL),
(17238,33,1095.98,-1735.51,60.8395,NULL),
(17238,34,1104.23,-1741.98,60.78,NULL),
(17238,35,1115.32,-1745.96,60.8419,NULL),
(17238,36,1127.28,-1750.25,60.6753,NULL),
(17238,37,1139.14,-1754.51,60.8277,NULL),
(17238,38,1150.26,-1758.5,60.72,NULL),
(17238,39,1154.89,-1765.05,60.64,NULL),
(17238,40,1151.32,-1771.61,60.78,NULL),
(17238,41,1141.61,-1776.18,61.228,NULL),
(17238,42,1133.8,-1779.85,61.43,NULL),
(17238,43,1121.94,-1785.26,60.99,NULL),
(17238,44,1111.88,-1790.44,60.9455,NULL),
(17238,45,1101.86,-1795.6,60.86,NULL),
(17238,46,1090.51,-1799.03,61.72,NULL),
(17238,47,1080.9,-1800.23,64.2722,NULL),
(17238,48,1069.91,-1801.61,67.6143,NULL),
(17238,49,1059.25,-1802.94,70.641,NULL),
(17238,50,1048.4,-1804.3,73.75,NULL),
(17238,51,1037.7,-1806.05,75.5573,NULL),
(17238,52,1028.65,-1807.53,76.67,NULL),
(17238,53,1020.44,-1810.21,77.178,NULL),
(17238,54,1013.41,-1812.5,77.33,NULL),
(17238,55,1007.16,-1814.41,80.4874,NULL),
(17238,56,998.113,-1817.17,80.4874,NULL),
(17238,57,989.637,-1819.75,80.4874,NULL),
(17238,58,981.752,-1822.16,80.49,NULL),
(17238,59,979.19,-1820.73,80.49,NULL),
(17238,60,977.297,-1823.37,80.8017,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 453020; -- High Priest Thel'danis
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(453020,1,977.471,-1819.76,80.4872,0,0,0,0,100,0),
(453020,2,972.483,-1815.79,80.4872,0,0,0,0,100,0),
(453020,3,965.675,-1815.51,80.4872,0,0,0,0,100,0),
(453020,4,960.427,-1819.71,80.4872,0,0,0,0,100,0),
(453020,5,957.658,-1825.74,80.4872,0,0,0,0,100,0),
(453020,6,960.183,-1831.96,80.4872,0,0,0,0,100,0),
(453020,7,965.542,-1836.64,80.4872,0,0,0,0,100,0),
(453020,8,972.351,-1836.35,80.4872,0,0,0,0,100,0),
(453020,9,977.699,-1832.7,80.4872,0,0,0,0,100,0),
(453020,10,979.593,-1826.09,80.4873,0,0,0,0,100,0),
(453020,11,983.011,-1821.69,80.4872,0,0,0,0,100,0),
(453020,12,990.469,-1819.42,80.4872,0,0,0,0,100,0),
(453020,13,998.503,-1816.96,80.4872,0,0,0,0,100,0),
(453020,14,1007.11,-1814.34,80.4872,0,0,0,0,100,0),
(453020,15,1013.8,-1812.74,77.3186,0,0,0,0,100,0),
(453020,16,1023.1,-1810.52,77.0634,0,0,0,0,100,0),
(453020,17,1032.43,-1808.3,76.3006,0,0,0,0,100,0),
(453020,18,1047.24,-1804.76,74.0563,0,30000,0,0,100,0),
(453020,19,1032.43,-1808.3,76.3006,0,0,0,0,100,0),
(453020,20,1023.1,-1810.52,77.0634,0,0,0,0,100,0),
(453020,21,1013.8,-1812.74,77.3186,0,0,0,0,100,0),
(453020,22,1007.11,-1814.34,80.4872,0,0,0,0,100,0),
(453020,23,998.503,-1816.96,80.4872,0,0,0,0,100,0),
(453020,24,990.469,-1819.42,80.4872,0,0,0,0,100,0),
(453020,25,983.011,-1821.69,80.4872,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
