-- DB update 2020_12_09_05 -> 2020_12_09_06
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_09_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_09_05 2020_12_09_06 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607513599500596032'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607513599500596032');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 8210;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 8210 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8210,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razortalon - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 936050;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(936050,1,302.499,-3001.24,114.891,0,0,0,0,100,0),
(936050,2,284.724,-3002.84,115.028,0,0,0,0,100,0),
(936050,3,269.604,-3002.81,114.286,0,0,0,0,100,0),
(936050,4,253.449,-3002.13,113.566,0,0,0,0,100,0),
(936050,5,239.902,-3007.39,116.154,0,0,0,0,100,0),
(936050,6,231.773,-3014.23,121.145,0,0,0,0,100,0),
(936050,7,222.762,-3020.69,124.599,0,0,0,0,100,0),
(936050,8,215.753,-3024.16,125.577,0,0,0,0,100,0),
(936050,9,206.196,-3028.88,125.689,0,0,0,0,100,0),
(936050,10,194.389,-3022.46,124.355,0,0,0,0,100,0),
(936050,11,185.689,-3017.37,124.854,0,0,0,0,100,0),
(936050,12,177.947,-3012.35,125.62,0,0,0,0,100,0),
(936050,13,170.213,-3007.34,125.589,0,0,0,0,100,0),
(936050,14,161.965,-2999.76,125.749,0,0,0,0,100,0),
(936050,15,157.858,-2995.99,125.609,0,0,0,0,100,0),
(936050,16,157.717,-2987,121.802,0,0,0,0,100,0),
(936050,17,157.569,-2977.52,118.321,0,0,0,0,100,0),
(936050,18,160.928,-2964.51,116.64,0,0,0,0,100,0),
(936050,19,172.869,-2958.37,115.508,0,0,0,0,100,0),
(936050,20,186.341,-2958.89,114.623,0,0,0,0,100,0),
(936050,21,198.721,-2959.33,112.861,0,0,0,0,100,0),
(936050,22,218.119,-2957.14,108.615,0,0,0,0,100,0),
(936050,23,233.963,-2948.74,106.353,0,0,0,0,100,0),
(936050,24,247.439,-2941.91,107.389,0,0,0,0,100,0),
(936050,25,262.228,-2936.62,105.766,0,0,0,0,100,0),
(936050,26,277.839,-2937.33,109.117,0,0,0,0,100,0),
(936050,27,290.42,-2947.34,111.106,0,0,0,0,100,0),
(936050,28,296.423,-2954.64,112.963,0,0,0,0,100,0),
(936050,29,301.813,-2961.19,114.065,0,0,0,0,100,0),
(936050,30,301.895,-2970.64,114.191,0,0,0,0,100,0),
(936050,31,301.853,-2986.35,112.836,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
