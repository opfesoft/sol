-- DB update 2022_04_22_00 -> 2022_04_22_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_22_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_22_00 2022_04_22_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1650658899500354576'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1650658899500354576');

UPDATE `creature` SET `MovementType` = 0 WHERE `guid` = 30649;
UPDATE `creature_addon` SET `bytes2` = 1 WHERE `guid` = 30649;

DELETE FROM `creature_text` WHERE `CreatureId` = 23896;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(23896,0,0,'You might wanna stand back. Fish guttin'' is a dirty job.',12,7,100,15,0,0,22392,0,'"Dirty" Michael Crowe');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 23896;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23896;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23896,0,0,0,1,0,100,0,180000,360000,180000,360000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Dirty" Michael Crowe - OOC - Say Line 0');

DELETE FROM `waypoint_scripts` WHERE `id` = 23;
DELETE FROM `waypoint_data` WHERE `id` = 306490;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
