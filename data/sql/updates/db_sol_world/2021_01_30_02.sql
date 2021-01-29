-- DB update 2021_01_30_01 -> 2021_01_30_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_30_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_30_01 2021_01_30_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1611963865991336247'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1611963865991336247');

DELETE FROM `creature` WHERE `id` = 25220;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (24959,25220,25307);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (-107575,25220,25307,25317);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2522000,2522001);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-107575,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Generic Quest Trigger - LAB - On Respawn - Set Active'),
(-107575,0,1,0,1,0,100,0,0,0,22000,22000,0,12,25220,8,0,0,0,0,8,0,0,0,0,2248.09,5185.42,11.449,1.06339,'Generic Quest Trigger - LAB - OOC - Summon ''Civilian Recruit'''),

(25220,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On Just Summoned - Set Active On'),
(25220,0,1,0,61,0,100,0,0,0,0,0,0,53,0,2522000,0,0,1,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - Linked - Start WP Movement'),
(25220,0,2,0,40,0,100,0,3,2522000,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On WP 3 Reached - Pause WP Movement'),
(25220,0,3,0,40,0,100,0,4,2522000,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On WP 4 Reached - Pause WP Movement'),
(25220,0,4,0,40,0,100,0,5,2522000,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On WP 5 Reached - Pause WP Movement'),
(25220,0,5,0,40,0,100,0,6,2522000,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On WP 6 Reached - Pause WP Movement'),
(25220,0,6,0,40,0,100,0,7,2522000,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On WP 7 Reached - Pause WP Movement'),
(25220,0,7,0,40,0,100,0,8,2522000,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On WP 8 Reached - Pause WP Movement'),
(25220,0,8,0,40,0,100,0,9,2522000,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On WP 9 Reached - Pause WP Movement'),
(25220,0,9,0,40,0,100,0,10,2522000,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On WP 10 Reached - Pause WP Movement'),
(25220,0,10,0,40,0,100,0,11,2522000,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On WP 11 Reached - Pause WP Movement'),
(25220,0,11,12,40,0,100,0,12,2522000,0,0,0,54,20000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On WP 12 Reached - Pause WP Movement'),
(25220,0,12,0,61,0,100,0,12,2522000,0,0,0,87,2522000,2522001,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - Linked - Call Random Action List'),

(25307,0,0,0,19,0,100,0,11672,0,0,0,0,1,0,0,0,0,0,0,19,25317,0,0,0,0,0,0,0,'Recruitment Officer Blythe - On Quest Accepted ''Enlistment Day'' - Say Line 0 (Civilian Recruit)'),

(2522000,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,25222,0,0,0,0,0,0,0,'Civilian Recruit - On Script - Say Line 0 (Recruitment Officer Carven)'),
(2522000,9,1,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On Script - Say Line 0'),
(2522000,9,2,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,19,25222,0,0,0,0,0,0,0,'Civilian Recruit - On Script - Say Line 1 (Recruitment Officer Carven)'),
(2522000,9,3,0,0,0,100,0,6000,6000,0,0,0,65,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On Script - Resume WP Movement'),
(2522000,9,4,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,19,25222,0,0,0,0,0,0,0,'Civilian Recruit - On Script - Say Line 3 (Recruitment Officer Carven)'),

(2522001,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,25222,0,0,0,0,0,0,0,'Civilian Recruit - On Script - Say Line 0 (Recruitment Officer Carven)'),
(2522001,9,1,0,0,0,100,0,3000,3000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On Script - Say Line 0'),
(2522001,9,2,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,19,25222,0,0,0,0,0,0,0,'Civilian Recruit - On Script - Say Line 2 (Recruitment Officer Carven)'),
(2522001,9,3,0,0,0,100,0,0,0,0,0,0,71,0,0,2178,143,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On Script - Equip Slot 1 & 2'),
(2522001,9,4,0,0,0,100,0,6000,6000,0,0,0,53,0,2522001,0,0,1,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On Script - Start WP Movement'),
(2522001,9,5,0,0,0,100,0,4000,4000,0,0,0,1,3,0,0,0,0,0,19,25222,0,0,0,0,0,0,0,'Civilian Recruit - On Script - Say Line 3 (Recruitment Officer Carven)'),

(25317,0,0,0,11,0,100,0,0,0,0,0,0,71,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Civilian Recruit - On Respawn - Remove Equip');

DELETE FROM `waypoints` WHERE `entry` IN (2522000,2522001);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(2522000,1,2253.64,5195.47,11.4006,'Civilian Recruit - Path to the civilian liaison'),
(2522000,2,2254.1,5196.36,11.4006,''),
(2522000,3,2277.82,5238.72,11.451,''),
(2522000,4,2279.22,5241.41,11.451,''),
(2522000,5,2280.84,5244.22,11.4572,''),
(2522000,6,2282.6,5245.74,11.3635,''),
(2522000,7,2284.87,5246.3,11.451,''),
(2522000,8,2287.47,5245.93,11.451,''),
(2522000,9,2289.47,5244.9,11.451,''),
(2522000,10,2291.77,5243.93,11.451,''),
(2522000,11,2294.13,5242.71,11.451,''),
(2522000,12,2296.28,5241.78,11.401,''),
(2522000,13,2303.02,5253.31,11.5058,''),
(2522000,14,2308.73,5256.93,11.5058,''),
(2522000,15,2320.83,5259.26,11.2558,''),

(2522001,1,2296.56,5246.85,11.404,'Civilian Recruit - Path to the barracks'),
(2522001,2,2292.45,5254.65,11.388,''),
(2522001,3,2285.2,5253.81,11.234,''),
(2522001,4,2277.2,5253.5,11.276,''),
(2522001,5,2269.23,5256.37,7.161,''),
(2522001,6,2261.54,5259.82,7.163,''),
(2522001,7,2258.66,5260.92,7.359,''),
(2522001,8,2252,5263.71,11.654,''),
(2522001,9,2242.16,5267.34,11.658,''),
(2522001,10,2234.74,5269.07,7.347,''),
(2522001,11,2224.12,5274.07,7.163,''),
(2522001,12,2216.15,5276.91,11.278,''),
(2522001,13,2214.97,5278.05,11.281,''),
(2522001,14,2213.54,5282.75,10.813,''),
(2522001,15,2214.52,5288.73,10.604,''),
(2522001,16,2212.03,5291.22,10.618,''),
(2522001,17,2205.3,5292.44,15.717,''),
(2522001,18,2197.44,5295.87,22.238,''),
(2522001,19,2194.67,5296.06,21.897,''),
(2522001,20,2192.11,5293.87,22.002,''),
(2522001,21,2188.32,5286.67,22.058,''),
(2522001,22,2184.88,5284.93,22.058,''),
(2522001,23,2182.7,5284.85,22.058,''),
(2522001,24,2178.03,5285.95,24.625,''),
(2522001,25,2169.74,5289.78,24.665,''),
(2522001,26,2163.19,5290.49,24.665,''),
(2522001,27,2158.47,5291.99,24.665,'');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
