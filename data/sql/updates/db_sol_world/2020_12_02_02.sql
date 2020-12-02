-- DB update 2020_12_02_01 -> 2020_12_02_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_02_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_02_01 2020_12_02_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606906851816513399'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606906851816513399');

UPDATE `creature` SET `position_x` = 8028.81, `position_y` = -3947.21, `position_z` = 687.148, `MovementType` = 2 WHERE `guid` = 51892;

DELETE FROM `creature_addon` WHERE `guid` = 51892;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(51892,518920,0,0,0,0,0,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 10200;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 10200 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10200,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Rak''shiri - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 518920;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(518920,1,8028.81,-3947.21,687.148,0,0,0,0,100,0),
(518920,2,8037.27,-3942.65,687.148,0,0,0,0,100,0),
(518920,3,8046.58,-3938.14,687.148,0,0,0,0,100,0),
(518920,4,8052.15,-3930.23,687.148,0,0,0,0,100,0),
(518920,5,8053.36,-3919.33,687.148,0,0,0,0,100,0),
(518920,6,8042.46,-3905.25,687.148,0,0,0,0,100,0),
(518920,7,8036.6,-3897.28,687.148,0,0,0,0,100,0),
(518920,8,8026.45,-3889.37,687.148,0,0,0,0,100,0),
(518920,9,8018.81,-3883.73,687.148,0,0,0,0,100,0),
(518920,10,8010.6,-3876.31,687.148,0,0,0,0,100,0),
(518920,11,8000.86,-3872.12,687.148,0,0,0,0,100,0),
(518920,12,7992.01,-3874.47,687.148,0,0,0,0,100,0),
(518920,13,7985.67,-3879.9,687.148,0,0,0,0,100,0),
(518920,14,7980.29,-3887.23,687.148,0,0,0,0,100,0),
(518920,15,7982.96,-3899.09,687.148,0,0,0,0,100,0),
(518920,16,7988.21,-3905.68,687.148,0,0,0,0,100,0),
(518920,17,8000.71,-3905.21,687.148,0,0,0,0,100,0),
(518920,18,8007.1,-3908.7,687.148,0,0,0,0,100,0),
(518920,19,8012.04,-3917.68,687.148,0,0,0,0,100,0),
(518920,20,8013.97,-3929.08,687.148,0,0,0,0,100,0),
(518920,21,8014.29,-3941.99,687.148,0,0,0,0,100,0),
(518920,22,8018.94,-3946.64,687.148,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
