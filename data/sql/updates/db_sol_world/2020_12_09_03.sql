-- DB update 2020_12_09_02 -> 2020_12_09_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_09_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_09_02 2020_12_09_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607470952917964876'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607470952917964876');

UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 6118;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 6118;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 6118 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6118,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Varo''then''s Ghost - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 21890;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(21890,1,2833.14,-3948.19,97.0343,0,20000,0,0,100,0),
(21890,2,2845.57,-3952.57,96.1312,0,0,0,0,100,0),
(21890,3,2856,-3956.25,98.7139,0,0,0,0,100,0),
(21890,4,2870.24,-3963.52,102.877,0,0,0,0,100,0),
(21890,5,2885,-3971.05,109.062,0,0,0,0,100,0),
(21890,6,2897.45,-3977.4,114.84,0,0,0,0,100,0),
(21890,7,2905.29,-3983.86,117.835,0,0,0,0,100,0),
(21890,8,2913.13,-3990.32,120.61,0,0,0,0,100,0),
(21890,9,2907.61,-3998.98,125.322,0,0,0,0,100,0),
(21890,10,2903.33,-4005.69,128.919,0,0,0,0,100,0),
(21890,11,2900.06,-4014.41,132.943,0,0,0,0,100,0),
(21890,12,2890.58,-4017.31,137.143,0,0,0,0,100,0),
(21890,13,2885.06,-4018.63,137.15,0,0,0,0,100,0),
(21890,14,2872.11,-4021.72,136.752,0,0,0,0,100,0),
(21890,15,2862.93,-4023.92,138.69,0,0,0,0,100,0),
(21890,16,2852.33,-4026.45,140.535,0,0,0,0,100,0),
(21890,17,2845.83,-4022.84,141.618,0,20000,0,0,100,0),
(21890,18,2852.4,-4026.69,140.51,0,0,0,0,100,0),
(21890,19,2861.58,-4024.46,138.832,0,0,0,0,100,0),
(21890,20,2874.17,-4021.4,136.352,0,0,0,0,100,0),
(21890,21,2886.64,-4018.37,137.412,0,0,0,0,100,0),
(21890,22,2892.16,-4017.03,136.836,0,0,0,0,100,0),
(21890,23,2900.09,-4013.06,132.449,0,0,0,0,100,0),
(21890,24,2903.15,-4005.66,128.982,0,0,0,0,100,0),
(21890,25,2908.14,-3997.77,124.678,0,0,0,0,100,0),
(21890,26,2912.81,-3990.39,120.658,0,0,0,0,100,0),
(21890,27,2904.49,-3983.24,117.562,0,0,0,0,100,0),
(21890,28,2897.19,-3976.98,114.624,0,0,0,0,100,0),
(21890,29,2886.44,-3971.61,109.728,0,0,0,0,100,0),
(21890,30,2871.82,-3964.32,103.359,0,0,0,0,100,0),
(21890,31,2855.45,-3956.15,98.5593,0,0,0,0,100,0),
(21890,32,2844.47,-3951.28,95.9604,0,0,0,0,100,0),
(21890,33,2837.11,-3948.01,97.774,0,0,0,0,100,0),
(21890,34,2833.78,-3946.53,97.5501,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
