-- DB update 2022_02_21_01 -> 2022_02_21_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_21_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_21_01 2022_02_21_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645469007037110962'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645469007037110962');

-- Cleanup old entries
DELETE FROM `gossip_menu_option` WHERE `MenuId` = 30228;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 30228;

UPDATE `creature_template` SET `gossip_menu_id` = 57006, `npcflag` = 3 WHERE `entry` = 16033;
DELETE FROM `gossip_menu` WHERE `MenuID` BETWEEN 57006 AND 57019;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(57006,50002),
(57006,50009),
(57007,50003),
(57008,50004),
(57009,50005),
(57010,50006),
(57011,50007),
(57012,50008),
(57014,50010),
(57015,50011),
(57016,50012),
(57017,50013),
(57018,50014),
(57019,50015);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16033;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16033,0,0,0,62,0,100,0,57015,1,0,0,0,11,27544,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bodley - On Gossip Select - Cast ''Create Replacement Left Piece of Lord Valthalak''s Amulet'''),
(16033,0,1,0,62,0,100,0,57015,0,0,0,0,11,27542,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bodley - On Gossip Select - Cast ''Create Replacement Top Piece of Lord Valthalak''s Amulet'''),
(16033,0,2,0,62,0,100,0,57018,0,0,0,0,11,27566,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bodley - On Gossip Select - Cast ''Create Replacement Lord Valthalak''s Brazier of Beckoning'''),
(16033,0,3,0,62,0,100,0,57006,0,0,0,0,11,27537,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bodley - On Gossip Select - Cast ''Create Replacement Lord Valthalak''s Amulet''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (57006,57015);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 57006;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,57006,50009,0,0,47,0,8997,64,0,0,0,0,'Bodley - Group 0: Show gossip text 50009 if quest ''Back to the Beginning'' (Alliance) is rewarded'),
(14,57006,50009,0,1,47,0,8998,64,0,0,0,0,'Bodley - Group 1: Show gossip text 50009 if quest ''Back to the Beginning'' (Horde) is rewarded'),
(14,57006,50002,0,0,47,0,8997,64,0,1,0,0,'Bodley - Group 0: Show gossip text 50002 if quest ''Back to the Beginning'' (Alliance) is not rewarded'),
(14,57006,50002,0,1,47,0,8998,64,0,1,0,0,'Bodley - Group 1: Show gossip text 50002 if quest ''Back to the Beginning'' (Horde) is not rewarded'),

(15,57006,0,0,0,2,0,22048,1,1,1,0,0,'Bodley - Group 0: Show gossip option 0 if the item ''Lord Valthalak''s Amulet'' is not in the inventory or in the bank'),
(15,57006,0,0,0,47,0,8994,64,0,0,0,0,'Bodley - Group 0: Show gossip option 0 if quest ''Final Preparations'' is rewarded'),
(15,57006,0,0,0,47,0,8995,64,0,1,0,0,'Bodley - Group 0: Show gossip option 0 if quest ''Mea Culpa, Lord Valthalak'' is not rewarded'),

(15,57006,1,0,0,2,0,21984,1,1,1,0,0,'Bodley - Group 0: Show gossip option 1 if the item ''Left Piece of Lord Valthalak''s Amulet'' is not in the inventory or in the bank'),
(15,57006,1,0,0,47,0,8966,64,0,0,0,0,'Bodley - Group 0: Show gossip option 1 if quest ''The Left Piece of Lord Valthalak''s Amulet'' (Warrior, Mage) is rewarded'),
(15,57006,1,0,0,47,0,8995,64,0,1,0,0,'Bodley - Group 0: Show gossip option 1 if quest ''Mea Culpa, Lord Valthalak'' is not rewarded'),
(15,57006,1,0,1,2,0,21984,1,1,1,0,0,'Bodley - Group 1: Show gossip option 1 if the item ''Left Piece of Lord Valthalak''s Amulet'' is not in the inventory or in the bank'),
(15,57006,1,0,1,47,0,8967,64,0,0,0,0,'Bodley - Group 1: Show gossip option 1 if quest ''The Left Piece of Lord Valthalak''s Amulet'' (Warlock, Druid) is rewarded'),
(15,57006,1,0,1,47,0,8995,64,0,1,0,0,'Bodley - Group 1: Show gossip option 1 if quest ''Mea Culpa, Lord Valthalak'' is not rewarded'),
(15,57006,1,0,2,2,0,21984,1,1,1,0,0,'Bodley - Group 2: Show gossip option 1 if the item ''Left Piece of Lord Valthalak''s Amulet'' is not in the inventory or in the bank'),
(15,57006,1,0,2,47,0,8968,64,0,0,0,0,'Bodley - Group 2: Show gossip option 1 if quest ''The Left Piece of Lord Valthalak''s Amulet'' (Hunter, Rogue) is rewarded'),
(15,57006,1,0,2,47,0,8995,64,0,1,0,0,'Bodley - Group 2: Show gossip option 1 if quest ''Mea Culpa, Lord Valthalak'' is not rewarded'),
(15,57006,1,0,3,2,0,21984,1,1,1,0,0,'Bodley - Group 3: Show gossip option 1 if the item ''Left Piece of Lord Valthalak''s Amulet'' is not in the inventory or in the bank'),
(15,57006,1,0,3,47,0,8969,64,0,0,0,0,'Bodley - Group 3: Show gossip option 1 if quest ''The Left Piece of Lord Valthalak''s Amulet'' (Paladin, Priest) is rewarded'),
(15,57006,1,0,3,47,0,8995,64,0,1,0,0,'Bodley - Group 3: Show gossip option 1 if quest ''Mea Culpa, Lord Valthalak'' is not rewarded'),
(15,57006,1,0,4,2,0,22047,1,1,1,0,0,'Bodley - Group 4: Show gossip option 1 if the item ''Top Piece of Lord Valthalak''s Amulet'' is not in the inventory or in the bank'),
(15,57006,1,0,4,47,0,8995,64,0,1,0,0,'Bodley - Group 4: Show gossip option 1 if quest ''Mea Culpa, Lord Valthalak'' is not rewarded'),
(15,57006,1,0,4,47,0,9015,64,0,0,0,0,'Bodley - Group 4: Show gossip option 1 if quest ''The Challenge'' is rewarded'),

(15,57006,2,0,0,2,0,22056,1,1,1,0,0,'Bodley - Group 0: Show gossip option 2 if the item ''Brazier of Beckoning'' is not in the inventory or in the bank'),
(15,57006,2,0,0,47,0,8995,64,0,0,0,0,'Bodley - Group 0: Show gossip option 2 if quest ''Mea Culpa, Lord Valthalak'' is rewarded'),
(15,57006,2,0,0,47,0,8996,64,0,1,0,0,'Bodley - Group 0: Show gossip option 2 if quest ''Return to Bodley'' is not rewarded'),

(15,57015,0,0,0,2,0,22047,1,1,1,0,0,'Bodley - Group 0: Show gossip option 0 if the item ''Top Piece of Lord Valthalak''s Amulet'' is not in the inventory or in the bank'),
(15,57015,0,0,0,47,0,8995,64,0,1,0,0,'Bodley - Group 0: Show gossip option 0 if quest ''Mea Culpa, Lord Valthalak'' is not rewarded'),
(15,57015,0,0,0,47,0,9015,64,0,0,0,0,'Bodley - Group 0: Show gossip option 0 if quest ''The Challenge'' is rewarded'),

(15,57015,1,0,0,2,0,21984,1,1,1,0,0,'Bodley - Group 0: Show gossip option 1 if the item ''Left Piece of Lord Valthalak''s Amulet'' is not in the inventory or in the bank'),
(15,57015,1,0,0,47,0,8966,64,0,0,0,0,'Bodley - Group 0: Show gossip option 1 if quest ''The Left Piece of Lord Valthalak''s Amulet'' (Warrior, Mage) is rewarded'),
(15,57015,1,0,0,47,0,8995,64,0,1,0,0,'Bodley - Group 0: Show gossip option 1 if quest ''Mea Culpa, Lord Valthalak'' is not rewarded'),
(15,57015,1,0,1,2,0,21984,1,1,1,0,0,'Bodley - Group 1: Show gossip option 1 if the item ''Left Piece of Lord Valthalak''s Amulet'' is not in the inventory or in the bank'),
(15,57015,1,0,1,47,0,8967,64,0,0,0,0,'Bodley - Group 1: Show gossip option 1 if quest ''The Left Piece of Lord Valthalak''s Amulet'' (Warlock, Druid) is rewarded'),
(15,57015,1,0,1,47,0,8995,64,0,1,0,0,'Bodley - Group 1: Show gossip option 1 if quest ''Mea Culpa, Lord Valthalak'' is not rewarded'),
(15,57015,1,0,2,2,0,21984,1,1,1,0,0,'Bodley - Group 2: Show gossip option 1 if the item ''Left Piece of Lord Valthalak''s Amulet'' is not in the inventory or in the bank'),
(15,57015,1,0,2,47,0,8968,64,0,0,0,0,'Bodley - Group 2: Show gossip option 1 if quest ''The Left Piece of Lord Valthalak''s Amulet'' (Hunter, Rogue) is rewarded'),
(15,57015,1,0,2,47,0,8995,64,0,1,0,0,'Bodley - Group 2: Show gossip option 1 if quest ''Mea Culpa, Lord Valthalak'' is not rewarded'),
(15,57015,1,0,3,2,0,21984,1,1,1,0,0,'Bodley - Group 3: Show gossip option 1 if the item ''Left Piece of Lord Valthalak''s Amulet'' is not in the inventory or in the bank'),
(15,57015,1,0,3,47,0,8969,64,0,0,0,0,'Bodley - Group 3: Show gossip option 1 if quest ''The Left Piece of Lord Valthalak''s Amulet'' (Paladin, Priest) is rewarded'),
(15,57015,1,0,3,47,0,8995,64,0,1,0,0,'Bodley - Group 3: Show gossip option 1 if quest ''Mea Culpa, Lord Valthalak'' is not rewarded');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
