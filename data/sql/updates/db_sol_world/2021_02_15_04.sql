-- DB update 2021_02_15_03 -> 2021_02_15_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_15_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_15_03 2021_02_15_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1613413599250040491'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1613413599250040491');

DELETE FROM `script_waypoint` WHERE `entry` = 17238;
UPDATE `creature_template` SET `ScriptName` = '', `AIName` = 'SmartAI' WHERE `entry` IN (17238,17233);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (17238,17233);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1723800,1723801,1723802,1723300);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17238,0,0,0,19,0,100,0,9446,0,0,0,0,80,1723800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Quest ''Tomb of the Lightbringer'' Taken - Call Timed Action List'),
(17238,0,1,2,40,0,100,0,4,0,0,0,0,54,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On WP 4 Reached - Pause WP Movement'),
(17238,0,2,0,61,0,100,0,0,0,0,0,0,80,1723801,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - Linked - Call Timed Action List'),
(17238,0,3,4,40,0,100,0,9,0,0,0,0,12,4472,3,60000,1,0,0,8,0,0,0,0,1039.98,-1577.66,61.437,1.75395,'Anchorite Truuen - On WP 9 Reached - Summon Creature ''Haunting Vision'''),
(17238,0,4,5,61,0,100,0,0,0,0,0,0,12,1802,3,60000,1,0,0,8,0,0,0,0,1031.03,-1576.28,62.436,0.265621,'Anchorite Truuen - Linked - Summon Creature ''Hungering Wraith'''),
(17238,0,5,0,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - Linked - Say Line 2'),
(17238,0,6,0,40,0,100,0,11,0,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On WP 11 Reached - Say Line 3'),
(17238,0,7,8,40,0,100,0,16,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On WP 16 Reached - Say Line 4'),
(17238,0,8,9,61,0,100,0,0,0,0,0,0,12,4475,3,60000,1,0,0,8,0,0,0,0,1110.66,-1742.14,61.019,2.41369,'Anchorite Truuen - Linked - Summon Creature ''Blighted Zombie'''),
(17238,0,9,10,61,0,100,0,0,0,0,0,0,12,4475,3,60000,1,0,0,8,0,0,0,0,1106.84,-1750.59,61.174,2.40976,'Anchorite Truuen - Linked - Summon Creature ''Blighted Zombie'''),
(17238,0,10,11,61,0,100,0,0,0,0,0,0,12,4475,3,60000,1,0,0,8,0,0,0,0,1111.72,-1753.4,61.459,2.75534,'Anchorite Truuen - Linked - Summon Creature ''Blighted Zombie'''),
(17238,0,11,0,61,0,100,0,0,0,0,0,0,12,4475,3,60000,1,0,0,8,0,0,0,0,1117.46,-1743.33,61,2.85351,'Anchorite Truuen - Linked - Summon Creature ''Blighted Zombie'''),
(17238,0,12,0,40,0,100,0,19,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On WP 19 Reached - Say Line 5'),
(17238,0,13,14,40,0,100,0,31,0,0,0,0,12,17233,3,60000,0,0,0,8,0,0,0,0,971.801,-1825.1,84,0.29408,'Anchorite Truuen - On WP 31 Reached - Summon Creature ''Ghost of Uther Lightbringer'''),
(17238,0,14,0,61,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - Linked - Set ''UNIT_STAND_STATE_KNEEL'''),
(17238,0,15,0,38,0,100,0,0,1,0,0,0,80,1723802,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Data Set 0 1 - Call Timed Action List'),

(1723800,9,0,0,0,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Remove NPC Flags'),
(1723800,9,1,0,0,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Set Faction 250'),
(1723800,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Say Line 0'),
(1723800,9,3,0,0,0,100,0,5000,5000,0,0,0,53,0,17238,0,9446,45000,1,17,0,30,0,0,0,0,0,0,'Anchorite Truuen - On Script - Start WP Movement'),

(1723801,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Say Line 1'),
(1723801,9,1,0,0,0,100,0,15000,15000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Say Line 6'),

(1723802,9,0,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(1723802,9,1,0,0,0,100,0,10000,10000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Say Line 7'),
(1723802,9,2,0,0,0,100,0,12000,12000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Truuen - On Script - Force Despawn'),

(17233,0,0,0,54,0,100,0,0,0,0,0,0,80,1723300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther - On Just Summoned - Call Timed Action List'),

(1723300,9,0,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther - On Script - Say Line 0'),
(1723300,9,1,0,0,0,100,0,9000,9000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther - On Script - Say Line 1'),
(1723300,9,2,0,0,0,100,0,3000,3000,0,0,0,45,0,1,0,0,0,0,19,17238,20,0,0,0,0,0,0,'Ghost of Uther - On Script - Set Data 0 1 (Anchorite Truuen)'),
(1723300,9,3,0,0,0,100,0,8000,8000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ghost of Uther - On Script - Force Despawn');

DELETE FROM `waypoints` WHERE `entry` = 17238;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(17238,1,954.51,-1433.02,63.16,'Anchorite Truuen - Quest ''Tomb of the Lightbringer'''),
(17238,2,961.526,-1453.96,63.32,''),
(17238,3,970.394,-1466.55,61.16,''),
(17238,4,1012.36,-1461.83,61.66,''),
(17238,5,1031.54,-1473.05,63.67,''),
(17238,6,1038.94,-1494.24,65.18,''),
(17238,7,1038.75,-1516.18,65.08,''),
(17238,8,1036.9,-1547.9,62.11,''),
(17238,9,1035.79,-1574.94,61.63,''),
(17238,10,1035.31,-1622.29,61.67,''),
(17238,11,1036.18,-1633.58,61.63,''),
(17238,12,1038.24,-1653.66,60.31,''),
(17238,13,1041.59,-1665.22,60.97,''),
(17238,14,1059.76,-1702.15,60.61,''),
(17238,15,1078.54,-1721.82,60.91,''),
(17238,16,1104.23,-1741.98,60.78,''),
(17238,17,1150.26,-1758.5,60.72,''),
(17238,18,1154.89,-1765.05,60.64,''),
(17238,19,1151.32,-1771.61,60.78,''),
(17238,20,1133.8,-1779.85,61.43,''),
(17238,21,1121.94,-1785.26,60.99,''),
(17238,22,1101.86,-1795.6,60.86,''),
(17238,23,1090.51,-1799.03,61.72,''),
(17238,24,1048.4,-1804.3,73.75,''),
(17238,25,1028.65,-1807.53,76.67,''),
(17238,26,1013.41,-1812.5,77.33,''),
(17238,27,1007.34,-1814.35,80.49,''),
(17238,28,981.752,-1822.16,80.49,''),
(17238,29,979.19,-1820.73,80.49,''),
(17238,30,977.863,-1823.19,80.49,''),
(17238,31,976.08,-1823.75,81.03,'');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
