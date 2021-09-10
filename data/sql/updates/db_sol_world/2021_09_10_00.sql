-- DB update 2021_09_09_06 -> 2021_09_10_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_09_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_09_06 2021_09_10_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631269607941784231'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631269607941784231');

UPDATE `creature_text` SET `Language` = 7 WHERE `CreatureID` = 23941;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 23941;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23941;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2394100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23941,0,0,0,11,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gavis Greyshield - On Respawn - Set Invincibility HP Level 1'),
(23941,0,1,0,2,0,100,1,0,25,0,0,0,80,2394100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gavis Greyshield - Between 0-25% Health - Call Timed Action List (No Repeat)'),

(2394100,9,0,0,0,0,100,0,0,0,0,0,0,11,42660,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gavis Greyshield - On Script - Cast ''Gavis Greyshield Credit'''),
(2394100,9,1,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gavis Greyshield - On Script - Set Home Position'),
(2394100,9,2,0,0,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gavis Greyshield - On Script - Set Faction ''Friendly'''),
(2394100,9,3,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gavis Greyshield - On Script - Say Line 0'),
(2394100,9,4,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gavis Greyshield - On Script - Say Line 1'),
(2394100,9,5,0,0,0,100,0,10000,10000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gavis Greyshield - On Script - Force Despawn');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
