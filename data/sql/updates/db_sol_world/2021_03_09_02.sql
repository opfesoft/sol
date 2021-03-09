-- DB update 2021_03_09_01 -> 2021_03_09_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_09_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_09_01 2021_03_09_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1615275015161138618'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1615275015161138618');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 107705;

DELETE FROM `creature_addon` WHERE `guid` = 107705;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(107705,1077050,0,0,0,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 27009 AND `source_type` = 0 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27009,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drakegore - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 1077050;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(1077050,1,4186.18,-165.666,68.7412,1.99105,30000,0,0,100,0),
(1077050,2,4171.17,-164.431,66.6551,0,0,0,0,100,0),
(1077050,3,4148.62,-162.48,63.6278,0,0,0,0,100,0),
(1077050,4,4127.82,-160.679,60.6067,0,0,0,0,100,0),
(1077050,5,4109.57,-159.1,58.796,0,0,0,0,100,0),
(1077050,6,4084.81,-156.957,56.1479,0,0,0,0,100,0),
(1077050,7,4063.04,-159.535,55.4773,0,0,0,0,100,0),
(1077050,8,4035.64,-162.779,54.874,0,0,0,0,100,0),
(1077050,9,4006.1,-166.277,55.1057,0,0,0,0,100,0),
(1077050,10,3989.96,-175.93,55.0111,0,0,0,0,100,0),
(1077050,11,3972.14,-186.587,54.9999,2.39647,30000,0,0,100,0),
(1077050,12,3989.96,-175.93,55.0111,0,0,0,0,100,0),
(1077050,13,4006.1,-166.277,55.1057,0,0,0,0,100,0),
(1077050,14,4035.64,-162.779,54.874,0,0,0,0,100,0),
(1077050,15,4063.04,-159.535,55.4773,0,0,0,0,100,0),
(1077050,16,4084.81,-156.957,56.1479,0,0,0,0,100,0),
(1077050,17,4109.57,-159.1,58.796,0,0,0,0,100,0),
(1077050,18,4127.82,-160.679,60.6067,0,0,0,0,100,0),
(1077050,19,4148.62,-162.48,63.6278,0,0,0,0,100,0),
(1077050,20,4171.17,-164.431,66.6551,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
