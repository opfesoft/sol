-- DB update 2022_01_10_00 -> 2022_01_10_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_10_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_10_00 2022_01_10_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641809882336713038'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641809882336713038');

DELETE FROM `gossip_menu` WHERE `MenuID` = 3801 AND `TextID` = 4773;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(3801,4773);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 3801;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,3801,4633,0,0,47,0,5862,74,0,1,0,0,'Myranda the Hag - Group 0: Show gossip text 4633 if quest ''Scarlet Subterfuge'' is not completed, in progress or rewarded'),
(14,3801,4633,0,0,47,0,5944,8,0,1,0,0,'Myranda the Hag - Group 0: Show gossip text 4633 if quest ''In Dreams'' is not in progress'),
(14,3801,4633,0,1,47,0,5944,64,0,0,0,0,'Myranda the Hag - Group 1: Show gossip text 4633 if quest ''In Dreams'' is rewarded'),

(14,3801,4773,0,0,47,0,5862,74,0,0,0,0,'Myranda the Hag - Group 0: Show gossip text 4773 if quest ''Scarlet Subterfuge'' is completed, in progress or rewarded'),
(14,3801,4773,0,0,47,0,5944,64,0,1,0,0,'Myranda the Hag - Group 0: Show gossip text 4773 if quest ''In Dreams'' is not rewarded'),
(14,3801,4773,0,1,47,0,5944,8,0,0,0,0,'Myranda the Hag - Group 1: Show gossip text 4773 if quest ''In Dreams'' is in progress'),

(15,3801,0,0,0,47,0,5862,74,0,0,0,0,'Myranda the Hag - Group 0: Show gossip option 0 if quest ''Scarlet Subterfuge'' is completed, in progress or rewarded'),
(15,3801,0,0,0,47,0,5944,64,0,1,0,0,'Myranda the Hag - Group 0: Show gossip option 0 if quest ''In Dreams'' is not rewarded'),
(15,3801,0,0,1,47,0,5944,8,0,0,0,0,'Myranda the Hag - Group 1: Show gossip option 0 if quest ''In Dreams'' is in progress');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 11872;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 11872;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(11872,0,0,1,62,0,100,0,3801,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Myranda the Hag - On Gossip Option 0 Selected - Close Gossip'),
(11872,0,1,0,61,0,100,0,0,0,0,0,0,85,17961,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Myranda the Hag - Linked - Invoker Cast ''Scarlet Illusion''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
