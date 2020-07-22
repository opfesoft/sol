-- DB update 2020_07_22_03 -> 2020_07_22_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_07_22_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_07_22_03 2020_07_22_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1595451543978257703'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1595451543978257703');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `unit_flags` = 768, `flags_extra` = 66, `InhabitType` = 7 WHERE `entry` = 18904;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 18904 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1890400 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18904,0,0,0,54,0,100,0,0,0,0,0,0,80,1890400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Vision of the Forgotten - On Just Summoned - Call Timed Action List'),

(1890400,9,0,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Vision of the Forgotten - On Script - Follow Invoker'),
(1890400,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Vision of the Forgotten - On Script - Say Line 0'),
(1890400,9,2,0,0,0,100,0,1000,1000,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Vision of the Forgotten - On Script - Say Line 0');

DELETE FROM `creature_text` WHERE `CreatureID` = 18904;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18904,0,0,'Turn back, mortal... This is not your battle.',15,0,100,0,0,0,16007,0,'Vision of the Forgotten'),
(18904,0,1,'You cannot stop them...',15,0,100,0,0,0,16008,0,'Vision of the Forgotten'),
(18904,0,2,'We are infinite... eternal.',15,0,100,0,0,0,16009,0,'Vision of the Forgotten'),
(18904,0,3,'They lack control... Oshu''gun calls to them...',15,0,100,0,0,0,16010,0,'Vision of the Forgotten'),
(18904,0,4,'It is a beacon. A remnant of a forgotten era.',15,0,100,0,0,0,16011,0,'Vision of the Forgotten');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
