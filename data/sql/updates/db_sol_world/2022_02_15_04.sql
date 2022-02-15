-- DB update 2022_02_15_03 -> 2022_02_15_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_15_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_15_03 2022_02_15_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1644962539610260666'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1644962539610260666');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 16014;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16014;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16014,0,0,2,62,0,100,0,7083,0,0,0,0,85,27754,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mux Manascrambler - On Gossip Option 0 Selected - Invoker Cast ''Create Extra-Dimensional Ghost Revealer'''),
(16014,0,1,2,62,0,100,0,7083,1,0,0,0,85,27752,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mux Manascrambler - On Gossip Option 1 Selected - Invoker Cast ''Create Ectoplasmic Distiller'''),
(16014,0,2,0,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mux Manascrambler - Linked - Close Gossip');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 7083;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,7083,0,0,0,2,0,22115,1,1,1,0,0,'Mux Manascrambler - Group 0: Show gossip option 0 if the player does not have the item ''Extra-Dimensional Ghost Revealer'' in the inventory or in the bank'),
(15,7083,0,0,0,47,0,8978,64,0,0,0,0,'Mux Manascrambler - Group 0: Show gossip option 0 if quest ''Return to Mokvar'' is rewarded'),

(15,7083,0,0,1,2,0,22115,1,1,1,0,0,'Mux Manascrambler - Group 1: Show gossip option 0 if the player does not have the item ''Extra-Dimensional Ghost Revealer'' in the inventory or in the bank'),
(15,7083,0,0,1,47,0,8977,64,0,0,0,0,'Mux Manascrambler - Group 1: Show gossip option 0 if quest ''Return to Deliana'' is rewarded'),

(15,7083,1,0,0,2,0,21946,1,1,1,0,0,'Mux Manascrambler - Group 0: Show gossip option 1 if the player does not have the item ''Ectoplasmic Distiller'' in the inventory or in the bank'),
(15,7083,1,0,0,47,0,8924,8,0,0,0,0,'Mux Manascrambler - Group 0: Show gossip option 1 if quest ''Hunting for Ectoplasm'' is in progress');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
