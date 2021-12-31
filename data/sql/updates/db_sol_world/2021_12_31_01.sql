-- DB update 2021_12_31_00 -> 2021_12_31_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_31_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_31_00 2021_12_31_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1640975129230090878'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1640975129230090878');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (26171,26185);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (-101136,26171,26185);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2618500;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-101136,0,0,0,11,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thassarian - On Respawn - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(-101136,0,1,0,1,0,100,0,1000,1000,1000,1000,0,11,46685,32,0,0,0,0,10,101732,26173,0,0,0,0,0,0,'Thassarian - OOC - Cast ''Borean Tundra - Quest - Thassarian Flay'' (Tanathal)'),

(26171,0,0,0,25,0,100,0,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'High Deathpriest Isidorus - On Reset - Set ''UNIT_STAND_STATE_KNEEL'''),

(26185,0,0,0,25,0,100,0,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lurid - On Reset - Set React State ''Defensive'''),
(26185,0,1,0,1,0,100,0,30000,70000,170000,200000,0,80,2618500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lurid - OOC - Call Timed Action List'),
(26185,0,2,0,4,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Lurid - On Aggro - Say Line 1'),

(2618500,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lurid - On Script - Say Line 0'),
(2618500,9,1,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,10,101355,26171,0,0,0,0,0,0,'Lurid - On Script - Say Line 0 (High Deathpriest Isidorus)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 46685;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,46685,0,0,31,0,3,26173,0,0,0,0,'Spell ''Borean Tundra - Quest - Thassarian Flay'' - Group 0: Implicit Target ''Tanathal''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
