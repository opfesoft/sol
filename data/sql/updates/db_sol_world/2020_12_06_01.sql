-- DB update 2020_12_06_00 -> 2020_12_06_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_06_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_06_00 2020_12_06_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607214055220941763'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607214055220941763');

UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 18694;

UPDATE `creature` SET `position_x` = -3012.44, `position_y` = 465.409, `position_z` = 2.45321, `MovementType` = 2 WHERE `guid` = 1007;

DELETE FROM `creature_addon` WHERE `guid` = 1007;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(1007,10070,0,0,0,0,0,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 18694;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 18694 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18694,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collidus the Warp-Watcher - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 10070;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(10070,1,-3012.44,465.409,2.45321,0,0,0,0,100,0),
(10070,2,-3008.62,496.659,1.40886,0,0,0,0,100,0),
(10070,3,-3003.42,539.168,-0.0117798,0,0,0,0,100,0),
(10070,4,-2955.49,553.912,-0.97469,0,0,0,0,100,0),
(10070,5,-2918.7,565.23,-1.71384,0,0,0,0,100,0),
(10070,6,-2864.65,581.857,-2.79972,0,0,0,0,100,0),
(10070,7,-2800.57,601.571,-4.08719,0,0,0,0,100,0),
(10070,8,-2782.42,649.586,-2.78798,0,0,0,0,100,0),
(10070,9,-2766.96,690.498,-1.68095,0,0,0,0,100,0),
(10070,10,-2749.44,736.876,-0.42602,0,0,0,0,100,0),
(10070,11,-2736.54,771.008,0.49752,0,0,0,0,100,0),
(10070,12,-2722.24,808.839,1.52117,0,0,0,0,100,0),
(10070,13,-2702.3,861.623,2.94942,0,0,0,0,100,0),
(10070,14,-2738.91,918.335,5.5427,0,0,0,0,100,0),
(10070,15,-2758.19,948.187,6.9077,0,0,0,0,100,0),
(10070,16,-2794.23,1004.01,9.4604,0,0,0,0,100,0),
(10070,17,-2817.22,1040.38,10.9341,0,0,0,0,100,0),
(10070,18,-2794.23,1004.01,9.4604,0,0,0,0,100,0),
(10070,19,-2758.19,948.187,6.9077,0,0,0,0,100,0),
(10070,20,-2738.91,918.335,5.5427,0,0,0,0,100,0),
(10070,21,-2702.3,861.623,2.94942,0,0,0,0,100,0),
(10070,22,-2722.24,808.839,1.52117,0,0,0,0,100,0),
(10070,23,-2736.54,771.008,0.49752,0,0,0,0,100,0),
(10070,24,-2749.44,736.876,-0.42602,0,0,0,0,100,0),
(10070,25,-2766.96,690.498,-1.68095,0,0,0,0,100,0),
(10070,26,-2782.42,649.586,-2.78798,0,0,0,0,100,0),
(10070,27,-2800.57,601.571,-4.08719,0,0,0,0,100,0),
(10070,28,-2864.65,581.857,-2.79972,0,0,0,0,100,0),
(10070,29,-2918.7,565.23,-1.71384,0,0,0,0,100,0),
(10070,30,-2955.49,553.912,-0.97469,0,0,0,0,100,0),
(10070,31,-3003.42,539.168,-0.0117798,0,0,0,0,100,0),
(10070,32,-3008.62,496.659,1.40886,0,0,0,0,100,0),
(10070,33,-3012.44,465.409,2.45321,0,0,0,0,100,0),
(10070,34,-3015.84,437.631,3.38151,0,0,0,0,100,0),
(10070,35,-3008.08,369.755,4.39504,0,0,0,0,100,0),
(10070,36,-3002.12,317.601,5.17381,0,0,0,0,100,0),
(10070,37,-2990.52,216.213,6.6877,0,0,0,0,100,0),
(10070,38,-2984.76,165.832,7.44,0,0,0,0,100,0),
(10070,39,-2979.06,116.042,8.1835,0,0,0,0,100,0),
(10070,40,-2984.76,165.832,7.44,0,0,0,0,100,0),
(10070,41,-2990.52,216.213,6.6877,0,0,0,0,100,0),
(10070,42,-3002.12,317.601,5.17381,0,0,0,0,100,0),
(10070,43,-3008.08,369.755,4.39504,0,0,0,0,100,0),
(10070,44,-3015.84,437.631,3.38151,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
