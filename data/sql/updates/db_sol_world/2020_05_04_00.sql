-- DB update 2020_05_03_02 -> 2020_05_04_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_03_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_03_02 2020_05_04_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1588602616800205350'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1588602616800205350');

-- Thal'trak Proudtusk SAI: Set active on respawn
DELETE FROM `smart_scripts` WHERE `entryorguid` = 9082 AND `source_type` = 0 AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(9082,0,1,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thal''trak Proudtusk - On Respawn - Set Active On');

-- Thal'trak Proudtusk: Adjust the waypoints
DELETE FROM `waypoint_data` WHERE `id` = 68850;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(68850,1,-6686.64,-2162.67,244.195,0,300000,0,0,100,0),
(68850,2,-6698.09,-2166.71,244.144,0,0,0,0,100,0),
(68850,3,-6724.88,-2177.67,244.144,0,0,0,0,100,0),
(68850,4,-6754.51,-2188.96,244.145,0,0,0,0,100,0),
(68850,5,-6789.04,-2200.47,244.127,0,0,0,0,100,0),
(68850,6,-6836.76,-2216.8,244.144,0,0,0,0,100,0),
(68850,7,-6842.6,-2224.08,243.735,0,0,0,0,100,0),
(68850,8,-6831.41,-2224.13,244.326,0,0,0,0,100,0),
(68850,9,-6819.23,-2217.24,244.193,0,0,0,0,100,0),
(68850,10,-6779.18,-2201.85,244.142,0,0,0,0,100,0),
(68850,11,-6742.57,-2187.83,244.144,0,0,0,0,100,0),
(68850,12,-6704.67,-2180.27,244.325,0,0,0,0,100,0),
(68850,13,-6696.46,-2187.56,247.256,0,0,0,0,100,0),
(68850,14,-6675.44,-2195.12,247.47,0,0,0,0,100,0),
(68850,15,-6657.14,-2204.38,246.199,0,0,0,0,100,0),
(68850,16,-6639.98,-2211.67,244.322,0,0,0,0,100,0),
(68850,17,-6622.15,-2237.86,244.144,0,0,0,0,100,0),
(68850,18,-6609.55,-2297.66,244.144,0,0,0,0,100,0),
(68850,19,-6602.49,-2337.11,244.564,0,0,0,0,100,0),
(68850,20,-6593.68,-2338.02,244.451,0,0,0,0,100,0),
(68850,21,-6597.48,-2311.3,244.163,0,0,0,0,100,0),
(68850,22,-6608.46,-2282.16,244.144,0,0,0,0,100,0),
(68850,23,-6615.97,-2237.53,244.144,0,0,0,0,100,0),
(68850,24,-6638.14,-2204.14,244.144,0,0,0,0,100,0),
(68850,25,-6664.19,-2186.06,244.144,0,0,0,0,100,0),
(68850,26,-6689.15,-2168.01,244.145,0,0,0,0,100,0),
(68850,27,-6695.74,-2158.07,244.142,0,0,0,0,100,0),
(68850,28,-6694.34,-2153.34,244.144,0,0,0,0,100,0),
(68850,29,-6689.03,-2153.95,244.144,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
