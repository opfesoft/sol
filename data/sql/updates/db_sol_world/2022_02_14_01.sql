-- DB update 2022_02_14_00 -> 2022_02_14_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_14_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_14_00 2022_02_14_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1644874765927608398'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1644874765927608398');

DELETE FROM `gossip_menu` WHERE `MenuID` = 6102;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6102,7257);

UPDATE `quest_template_addon` SET `SpecialFlags` = 0 WHERE `ID` = 7846;

UPDATE `creature_template` SET `gossip_menu_id` = 6102, `unit_flags` = 33280, `AIName` = 'SmartAI', `flags_extra` = 66 WHERE `entry` = 14757;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 14757;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1475700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14757,0,0,0,20,0,100,0,7846,0,0,0,0,80,1475700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Torntusk - On Quest ''Recover the Key!'' Rewarded - Call Timed Action List'),
(14757,0,1,0,4,0,100,0,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Torntusk - On Aggro - Remove ''UNIT_STAND_STATE_DEAD'''),

(1475700,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Torntusk - On Script - Set Active On'),
(1475700,9,1,0,0,0,100,0,0,0,0,0,0,91,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Torntusk - On Script - Remove ''UNIT_STAND_STATE_DEAD'''),
(1475700,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Torntusk - On Script - Say Line 0'),
(1475700,9,3,0,0,0,100,0,60000,60000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Elder Torntusk - On Script - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 6102;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,6102,7257,0,0,47,0,7846,64,0,1,0,0,'Elder Torntusk - Group 0: Show gossip text 7257 if quest ''Recover the Key!'' is not rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
