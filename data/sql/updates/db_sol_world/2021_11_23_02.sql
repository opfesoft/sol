-- DB update 2021_11_23_01 -> 2021_11_23_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_23_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_23_01 2021_11_23_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637682926765416888'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637682926765416888');

UPDATE `gameobject` SET `spawntimesecs` = 100 WHERE `guid` IN (10104,10108,10120,10127); -- Dark Iron
UPDATE `gameobject` SET `spawntimesecs` = -1 WHERE `guid` = 10106; -- Singed Letter

-- Dorius Stonetender: Remove obsolete creature text (this is actually meant for the Dark Iron GOs)
DELETE FROM `creature_text` WHERE `CreatureID` = 8284 AND `GroupID` = 7;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 8337;
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` IN (147516,147517);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (8284,8337,8338);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (147516,147517);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (828400,828401,828402,828403,828404,828405,833800,14751700);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8284,0,0,1,11,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Spawn - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(8284,0,1,0,61,0,100,0,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Spawn - Add ''UNIT_STAND_STATE_DEAD'''),
(8284,0,2,3,19,0,100,0,3367,0,0,0,0,53,0,828400,0,0,0,1,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Quest ''Suntara Stones'' Accepted - Start WP Movement'),
(8284,0,3,4,61,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(8284,0,4,5,61,0,100,0,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - Linked - Remove ''UNIT_STAND_STATE_DEAD'''),
(8284,0,5,6,61,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Dorius Stonetender - Linked - Store Target ID 1 (Invoker)'),
(8284,0,6,7,61,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - Linked - Set Faction ''Escortee'''),
(8284,0,7,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - Linked - Set Active On'),
(8284,0,8,0,58,0,100,0,0,828400,0,0,0,80,828400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On WP Path Ended - Call Timed Action List'),
(8284,0,9,0,58,0,100,0,0,828401,0,0,0,80,828401,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On WP Path Ended - Call Timed Action List'),
(8284,0,10,0,58,0,100,0,0,828402,0,0,0,80,828402,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On WP Path Ended - Call Timed Action List'),
(8284,0,11,0,58,0,100,0,0,828403,0,0,0,80,828403,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On WP Path Ended - Call Timed Action List'),
(8284,0,12,0,58,0,100,0,0,828404,0,0,0,80,828404,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On WP Path Ended - Call Timed Action List'),
(8284,0,13,0,38,0,100,0,1,1,0,0,0,80,828405,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Data Set 1 1 - Call Timed Action List'),
(8284,0,14,0,4,0,50,0,0,0,0,0,0,1,8,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Aggro - Say Line 8'),
(8284,0,15,16,6,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Death - Set Active On'),
(8284,0,16,0,61,0,100,0,0,0,0,0,0,6,3367,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Dorius Stonetender - Linked - Fail Quest ''Suntara Stones'''),

(828400,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Say Line 0'),
(828400,9,1,0,0,0,100,0,500,500,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Add ''UNIT_STAND_STATE_KNEEL'''),
(828400,9,2,0,0,0,100,0,10000,10000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(828400,9,3,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,15,147516,50,0,0,0,0,0,0,'Dorius Stonetender - On Script - Set Data 2 2 (Dark Iron)'),
(828400,9,4,0,0,0,100,0,0,0,0,0,0,53,0,828401,0,0,0,1,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Start WP Movement'),

(828401,9,0,0,0,0,100,0,500,500,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Add ''UNIT_STAND_STATE_KNEEL'''),
(828401,9,1,0,0,0,100,0,2000,2000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(828401,9,2,0,0,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Say Line 1'),
(828401,9,3,0,0,0,100,0,10000,10000,0,0,0,1,9,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Say Line 9'),
(828401,9,4,0,0,0,100,0,0,0,0,0,0,53,0,828402,0,0,0,1,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Start WP Movement'),

(828402,9,0,0,0,0,100,0,0,0,0,0,0,1,2,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Say Line 2'),
(828402,9,1,0,0,0,100,0,500,500,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Add ''UNIT_STAND_STATE_KNEEL'''),
(828402,9,2,0,0,0,100,0,10000,10000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(828402,9,3,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,15,147517,50,0,0,0,0,0,0,'Dorius Stonetender - On Script - Set Data 2 2 (Dark Iron)'),
(828402,9,4,0,0,0,100,0,0,0,0,0,0,53,0,828403,0,0,0,1,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Start WP Movement'),

(828403,9,0,0,0,0,100,0,0,0,0,0,0,1,3,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Say Line 3'),
(828403,9,1,0,0,0,100,0,4000,4000,0,0,0,53,1,828404,0,0,0,1,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Start WP Movement'),

(828404,9,0,0,0,0,100,0,0,0,0,0,0,1,4,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Say Line 4'),
(828404,9,1,0,0,0,100,0,4000,4000,0,0,0,12,8338,8,0,0,0,0,8,0,0,0,0,-6370.26,-1974.93,256.79,3.55,'Dorius Stonetender - On Script - Summon Creature ''Dark Iron Marksman'''),

(828405,9,0,0,0,0,100,0,0,0,0,0,0,1,5,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Say Line 5'),
(828405,9,1,0,0,0,100,0,0,0,0,0,0,11,12218,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Cast ''Man Down!'''),
(828405,9,2,0,0,0,100,0,0,0,0,0,0,90,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Add ''UNIT_STAND_STATE_DEAD'''),
(828405,9,3,0,0,0,100,0,0,0,0,0,0,70,60,0,0,0,0,0,20,175704,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Respawn Target (Singed Letter)'),
(828405,9,4,0,0,0,100,0,0,0,0,0,0,15,3367,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Reward Quest ''Suntara Stones'''),
(828405,9,5,0,0,0,100,0,2000,2000,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Say Line 6'),
(828405,9,6,0,0,0,100,0,1000,1000,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dorius Stonetender - On Script - Die'),

(8337,0,0,0,54,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,8284,70,0,0,0,0,0,0,'Dark Iron Steelshifter - On Just Summoned - Start attack (Dorius Stonetender)'),
(8337,0,1,0,4,0,50,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Steelshifter - On Aggro - Say Line 0'),

(8338,0,0,0,54,0,100,0,0,0,0,0,0,80,833800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Marksman - On Just Summoned - Call Timed Action List'),

(833800,9,0,0,0,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Marksman - On Script - Add ''UNIT_FLAG_IMMUNE_TO_PC'''),
(833800,9,1,0,0,0,100,0,1500,1500,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Marksman - On Script - Say Line 0'),
(833800,9,2,0,0,0,100,0,0,0,0,0,0,11,12198,0,0,0,0,0,19,8284,50,0,0,0,0,0,0,'Dark Iron Marksman - On Script - Cast ''Marksman Hit'' (Dorius Stonetender)'),
(833800,9,3,0,0,0,100,0,2000,2000,0,0,0,45,1,1,0,0,0,0,19,8284,50,0,0,0,0,0,0,'Dark Iron Marksman - On Script - Set Data 1 1 (Dorius Stonetender)'),
(833800,9,4,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Marksman - On Script - Force Despawn'),

(147516,1,0,0,38,0,100,0,2,2,0,0,0,80,14751700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron - On Data Set 2 2 - Call Timed Action List'),

(147517,1,0,0,38,0,100,0,2,2,0,0,0,80,14751700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron - On Data Set 2 2 - Call Timed Action List'),

(14751700,9,0,0,0,0,100,0,0,0,0,0,0,234,4362,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron - On Script - Custom Talk'),
(14751700,9,1,0,0,0,100,0,0,0,0,0,0,202,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron - On Script - Set ''GO_STATE_ACTIVE_ALTERNATIVE'''),
(14751700,9,2,0,0,0,100,0,0,0,0,0,0,11,12168,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron - On Script - Cast ''Dark Iron Steelshifter Surprise'''),
(14751700,9,3,0,0,0,100,0,1000,1000,0,0,0,233,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron - On Script - Despawn GO');

DELETE FROM `waypoints` WHERE `entry` IN (828400,828401,828402,828403,828404);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(828400,1,-7005.02,-1742.09,234.09,'Dorius Stonetender - Quest ''Suntara Stones'' - Part 1'),
(828400,2,-7007.01,-1730.48,234.09,NULL),
(828400,3,-7004.89,-1726.5,234.25,NULL),
(828400,4,-7000.51,-1727.69,235.47,NULL),
(828400,5,-6994.75,-1732.64,238.098,NULL),
(828400,6,-6989.39,-1737.25,240.65,NULL),
(828400,7,-6983.26,-1737.29,241.794,NULL),
(828400,8,-6976.65,-1737.33,241.83,NULL),
(828400,9,-6965.8,-1739.68,241.878,NULL),
(828400,10,-6954.92,-1742.04,241.66,NULL),
(828400,11,-6948.78,-1738.65,241.652,NULL),
(828400,12,-6942.03,-1734.93,240.744,NULL),
(828400,13,-6933.73,-1730.35,241.7,NULL),
(828400,14,-6932.65,-1724.87,242.497,NULL),
(828400,15,-6931.64,-1719.75,242.27,NULL),
(828400,16,-6928.87,-1719.03,242.719,NULL),
(828400,17,-6919.29,-1716.52,241.551,NULL),
(828400,18,-6909.71,-1714.02,241.26,NULL),
(828400,19,-6901.1,-1721.39,242.818,NULL),
(828400,20,-6898.56,-1723.56,243.11,NULL),
(828400,21,-6895.2,-1724.56,242.46,NULL),
(828400,22,-6888.61,-1726.51,240.561,NULL),
(828400,23,-6883.09,-1728.15,241,NULL),
(828400,24,-6881.14,-1732.98,241.354,NULL),
(828400,25,-6879.24,-1737.66,242.25,NULL),
(828400,26,-6875.63,-1738.84,244,NULL),
(828400,27,-6871.45,-1742.66,246.4,NULL),
(828400,28,-6868.03,-1745.78,248.92,NULL),
(828400,29,-6865.56,-1747.4,250.42,NULL),
(828400,30,-6861.85,-1747.82,251.476,NULL),
(828400,31,-6857.7,-1748.29,251.52,NULL),

(828401,1,-6853.29,-1745.18,251.52,'Dorius Stonetender - Quest ''Suntara Stones'' - Part 2'),
(828401,2,-6857.63,-1738.76,251.52,NULL),
(828401,3,-6861.59,-1732.91,251.66,NULL),
(828401,4,-6860,-1723.85,252.05,NULL),
(828401,5,-6857.88,-1715.04,251.52,NULL),
(828401,6,-6855.1,-1708.52,251.415,NULL),
(828401,7,-6850.99,-1698.89,250.48,NULL),
(828401,8,-6844.31,-1691.23,251.331,NULL),
(828401,9,-6837.04,-1682.89,251.52,NULL),
(828401,10,-6830.43,-1675.3,251.52,NULL),
(828401,11,-6823.89,-1674.95,251.614,NULL),
(828401,12,-6818.79,-1674.68,251.31,NULL),
(828401,13,-6814.35,-1671.13,250.31,NULL),

(828402,1,-6811.93,-1675.89,249.87,'Dorius Stonetender - Quest ''Suntara Stones'' - Part 3'),
(828402,2,-6809.37,-1680.91,250.1,NULL),
(828402,3,-6807.95,-1683.62,251.018,NULL),
(828402,4,-6804.7,-1689.85,254.998,NULL),
(828402,5,-6801.58,-1695.83,258.82,NULL),
(828402,6,-6797.69,-1698.67,259.55,NULL),
(828402,7,-6790.76,-1703.73,259.55,NULL),
(828402,8,-6785.76,-1709.72,259.55,NULL),
(828402,9,-6781.22,-1715.15,259.55,NULL),
(828402,10,-6778.56,-1727.06,259.55,NULL),
(828402,11,-6777.79,-1735.92,259.56,NULL),
(828402,12,-6777.09,-1744.06,259.54,NULL),
(828402,13,-6776.61,-1749.51,259.54,NULL),
(828402,14,-6776.15,-1754.65,258.857,NULL),
(828402,15,-6775.59,-1761.05,257.5,NULL),
(828402,16,-6776.5,-1770.93,256.893,NULL),
(828402,17,-6777.4,-1780.64,256.85,NULL),

(828403,1,-6776.03,-1781.77,256.85,'Dorius Stonetender - Quest ''Suntara Stones'' - Part 4'),
(828403,2,-6766.15,-1788.56,256.85,NULL),
(828403,3,-6756.99,-1794.86,256.653,NULL),
(828403,4,-6749.83,-1799.79,255.908,NULL),
(828403,5,-6739.25,-1807.07,254.279,NULL),
(828403,6,-6728.56,-1814.42,253.44,NULL),
(828403,7,-6717.32,-1814.47,252.226,NULL),
(828403,8,-6709.04,-1814.5,251.379,NULL),
(828403,9,-6700.18,-1814.54,250.46,NULL),
(828403,10,-6689.56,-1817.72,249.641,NULL),
(828403,11,-6677.81,-1821.25,250.28,NULL),

(828404,1,-6673.72,-1828.2,249.423,'Dorius Stonetender - Quest ''Suntara Stones'' - Part 5'),
(828404,2,-6670.02,-1834.51,248.048,NULL),
(828404,3,-6665.29,-1842.56,246.406,NULL),
(828404,4,-6660.63,-1850.5,245.99,NULL),
(828404,5,-6657.73,-1855.43,245.563,NULL),
(828404,6,-6653.74,-1862.22,244.949,NULL),
(828404,7,-6649.15,-1870.05,244.144,NULL),
(828404,8,-6645.23,-1876.71,244.144,NULL),
(828404,9,-6640.54,-1884.7,244.27,NULL),
(828404,10,-6635.42,-1890.66,244.144,NULL),
(828404,11,-6629.23,-1897.86,244.18,NULL),
(828404,12,-6623.66,-1904.33,244.538,NULL),
(828404,13,-6616.7,-1912.43,244.589,NULL),
(828404,14,-6612.79,-1916.98,244.15,NULL),
(828404,15,-6602.59,-1918.37,244.15,NULL),
(828404,16,-6591.34,-1919.9,244.15,NULL),
(828404,17,-6579.3,-1921.54,244.15,NULL),
(828404,18,-6569.94,-1922.81,244.16,NULL),
(828404,19,-6561.35,-1927.44,244.193,NULL),
(828404,20,-6553.24,-1931.81,244.153,NULL),
(828404,21,-6546.3,-1935.55,244.152,NULL),
(828404,22,-6540.13,-1938.87,244.15,NULL),
(828404,23,-6529.91,-1942.9,244.15,NULL),
(828404,24,-6520.9,-1946.45,244.15,NULL),
(828404,25,-6512.48,-1951.14,244.15,NULL),
(828404,26,-6504.9,-1955.36,244.15,NULL),
(828404,27,-6494.06,-1960.28,244.15,NULL),
(828404,28,-6483.21,-1965.2,244.24,NULL),
(828404,29,-6471.1,-1968.55,244.27,NULL),
(828404,30,-6461.85,-1972.48,244.364,NULL),
(828404,31,-6451.37,-1976.94,244.45,NULL),
(828404,32,-6442.16,-1976.4,244.697,NULL),
(828404,33,-6432.85,-1975.86,245.502,NULL),
(828404,34,-6424.18,-1975.36,246.679,NULL),
(828404,35,-6414.9,-1974.82,247.851,NULL),
(828404,36,-6405.94,-1974.3,248.94,NULL),
(828404,37,-6400.82,-1975.98,248.501,NULL),
(828404,38,-6395.49,-1977.74,247.89,NULL),
(828404,39,-6389.2,-1978.71,247.48,NULL),
(828404,40,-6388.39,-1983.85,246.72,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
