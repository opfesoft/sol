-- DB update 2021_02_17_03 -> 2021_02_17_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_17_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_17_03 2021_02_17_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1613547753087932213'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1613547753087932213');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 25228;

UPDATE `creature` SET `wander_distance` = 0, `spawntimesecs` = 180 WHERE `id` = 25228;
UPDATE `creature` SET `position_x` = 2115.73, `position_y` = 5672.92, `position_z` = 33.1946, `MovementType` = 2 WHERE `guid` = 108835;
UPDATE `creature` SET `position_x` = 2133.36, `position_y` = 5633.35, `position_z` = 30.8619 WHERE `guid` = 108838;

DELETE FROM `creature_addon` WHERE `guid` = 108835;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(108835,1088350,0,0,0,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 25228;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(25228,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Risen Crypt Lord - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 1088350;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(1088350,1,2115.73,5672.92,33.1946,0,0,0,0,100,0),
(1088350,2,2120.7,5655.41,32.1433,0,0,0,0,100,0),
(1088350,3,2141.23,5631.5,31.9424,0,0,0,0,100,0),
(1088350,4,2167.52,5618.11,23.387,0,0,0,0,100,0),
(1088350,5,2179.64,5596.01,11.3201,0,0,0,0,100,0),
(1088350,6,2181.67,5582.66,7.36258,0,0,0,0,100,0),
(1088350,7,2178.9,5537.67,7.19364,0,0,0,0,100,0),
(1088350,8,2183.92,5505.79,2.23862,0,0,0,0,100,0),
(1088350,9,2182.83,5487.81,0.264839,0,0,0,0,100,0),
(1088350,10,2171.28,5462.58,1.11741,0,0,0,0,100,0),
(1088350,11,2185.11,5447.48,1.94985,0,0,0,0,100,0),
(1088350,12,2227.81,5418.39,1.6029,0,0,0,0,100,0),
(1088350,13,2246.11,5456.03,2.99984,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
