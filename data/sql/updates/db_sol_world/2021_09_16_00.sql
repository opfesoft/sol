-- DB update 2021_09_15_04 -> 2021_09_16_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_15_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_15_04 2021_09_16_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631788234725617010'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631788234725617010');

UPDATE `event_scripts` SET `datalong2` = 60000, `dataint` = 4 WHERE `id` = 15406 AND `command` = 10;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 23789;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23789;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2378900,2378901);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23789,0,0,0,54,0,100,0,0,0,0,0,0,80,2378900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Smolderwing - On Just Summoned - Call Timed Action List'),
(23789,0,1,0,34,0,100,0,0,1,0,0,0,80,2378901,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Smolderwing - On Reached Point 1 - Call Timed Action List'),

(2378900,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Smolderwing - On Script - Set Active On'),
(2378900,9,1,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Smolderwing - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2378900,9,2,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Smolderwing - On Script - Say Line 0'),
(2378900,9,3,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Smolderwing - On Script - Say Line 1'),
(2378900,9,4,0,0,0,100,0,3000,3000,0,0,0,69,1,0,0,1,0,0,20,186335,100,0,0,0,0,0,0,'Smolderwing - On Script - Move To Pos (Stonemaul Banner)'),

(2378901,9,0,0,0,0,100,0,0,0,0,0,0,11,42433,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Smolderwing - On Script - Cast ''Smolderwing Fire Breath'''),
(2378901,9,1,0,0,0,100,0,3000,3000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Smolderwing - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2378901,9,2,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,20,0,0,0,0,0,0,0,'Smolderwing - On Script - Attack Closest Player');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `ConditionTypeOrReference` = 31 AND `SourceEntry` = 42433;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,2,42433,0,0,31,0,5,186335,0,0,0,0,'Smolderwing Fire Breath - Implicit Target ''Stonemaul Banner''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
