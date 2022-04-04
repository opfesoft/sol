-- DB update 2022_04_03_01 -> 2022_04_04_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_03_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_03_01 2022_04_04_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1649052543811029516'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1649052543811029516');

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (5481,5482);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(5481,0,0,'Rokaro, I have lost the Drakefire Amulet. Could another be created?',9014,1,1,0,0,0,0,'',0,0),
(5482,0,0,'Haleh, I have lost the Drakefire Amulet. Could you fashion another?',9016,1,1,0,0,0,0,'',0,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 10182;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (10182,10929);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10182,0,0,1,62,0,100,0,5481,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Rokaro - On Gossip Option 0 Selected - Close Gossip'),
(10182,0,1,0,61,0,100,0,0,0,0,0,0,56,16309,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Rokaro - Linked - Create ''Drakefire Amulet'' (Invoker)'),

(10929,0,0,0,19,0,100,0,5162,0,0,0,0,85,17168,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Haleh - On Quest ''Wrath of the Blue Flight'' Accepted - Invoker Cast ''Haleh''s Will'''),
(10929,0,1,2,62,0,100,0,5482,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Haleh - On Gossip Option 0 Selected - Close Gossip'),
(10929,0,2,0,61,0,100,0,0,0,0,0,0,56,16309,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Haleh - Linked - Create ''Drakefire Amulet'' (Invoker)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (5481,5482);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,5481,0,0,0,47,0,6602,64,0,0,0,0,'Rokaro - Group 0: Show gossip option 0 if quest ''Blood of the Black Dragon Champion'' is rewarded'),
(15,5481,0,0,0,2,0,16309,1,1,1,0,0,'Rokaro - Group 0: Show gossip option 0 if the item ''Drakefire Amulet'' is not in the inventory or in the bank'),

(15,5482,0,0,0,47,0,6502,64,0,0,0,0,'Haleh - Group 0: Show gossip option 0 if quest ''Drakefire Amulet'' is rewarded'),
(15,5482,0,0,0,2,0,16309,1,1,1,0,0,'Haleh - Group 0: Show gossip option 0 if the item ''Drakefire Amulet'' is not in the inventory or in the bank');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
