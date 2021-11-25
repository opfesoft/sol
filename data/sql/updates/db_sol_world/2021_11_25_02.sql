-- DB update 2021_11_25_01 -> 2021_11_25_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_25_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_25_01 2021_11_25_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637879016888926920'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637879016888926920');

DELETE FROM `gossip_menu` WHERE `MenuID` = 50001;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(50001,50001);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 5502;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,5502,6553,0,0,47,0,1046,64,0,1,0,0,'Raene Wolfrunner - Group 0: Show gossip text 6553 if quest ''Raene''s Cleansing, part 11'' is not rewarded'),
(14,5502,6555,0,0,47,0,1046,64,0,0,0,0,'Raene Wolfrunner - Group 0: Show gossip text 6555 if quest ''Raene''s Cleansing, part 11'' is rewarded'),
(15,5502,0,0,0,47,0,1029,64,0,0,0,0,'Raene Wolfrunner - Group 0: Show gossip option 0 if the quest ''Raene''s Cleansing, part 8'' is rewarded'),
(15,5502,0,0,0,2,0,5462,1,1,1,0,0,'Raene Wolfrunner - Group 0: Show gossip option 0 if the player does not have the item ''Dartol''s Rod of Transformation'' in the inventory or in the bank');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3691;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3691,0,0,0,9,0,100,0,5,30,2300,3900,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Raene Wolfrunner - Within 5-30 Range - Cast ''Shoot'''),
(3691,0,1,0,9,0,100,0,5,30,9000,13000,1,11,21390,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Raene Wolfrunner - Within 5-30 Range - Cast ''Multi-Shot'''),
(3691,0,2,0,9,0,100,0,5,30,12000,16000,1,11,15495,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Raene Wolfrunner - Within 5-30 Range - Cast ''Explosive Shot'''),
(3691,0,3,0,0,0,100,0,18000,25000,60000,70000,0,11,22908,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Raene Wolfrunner - IC - Cast ''Volley'''),
(3691,0,4,0,9,0,100,0,0,20,11000,13000,0,11,6533,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Raene Wolfrunner - Within 0-20 Range - Cast ''Net'''),
(3691,0,5,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Raene Wolfrunner - Between 0-15% Health - Flee For Assist (No Repeat)'),
(3691,0,6,0,62,0,100,0,5502,0,0,0,0,11,22227,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Raene Wolfrunner - On Gossip Select - Cast spell ''Create Dartol''s Rod''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
