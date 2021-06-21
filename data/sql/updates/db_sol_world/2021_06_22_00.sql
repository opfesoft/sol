-- DB update 2021_06_21_06 -> 2021_06_22_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_21_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_21_06 2021_06_22_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624313274383680478'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624313274383680478');

DELETE FROM `gossip_menu` WHERE `MenuID` = 5852;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(5852,7014);

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 5851;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(5851,0,0,'Chief Bloodhoof, this may sound like an odd request... but I have a young ward who is quite shy.  You are a hero to him, and he asked me to get your hoofprint.',9670,1,1,5852,0,0,0,'',0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 5851;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,5851,0,0,0,47,0,925,8,0,0,0,0,'Cairne Bloodhoof - Show gossip option 0 if quest ''Cairne''s Hoofprint'' is in progress');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 3057;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3057;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3057,0,0,1,62,0,100,0,5851,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Cairne Bloodhoof - On Gossip Select - Close Gossip'),
(3057,0,1,0,61,0,100,0,0,0,0,0,0,11,23123,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Cairne Bloodhoof - On Gossip Select - Cast ''Cairne''s Hoofprint'''),
(3057,0,2,0,0,0,100,0,28000,32000,23000,27000,0,11,16636,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Cairne Bloodhoof - IC - Cast ''Berserker Charge'''),
(3057,0,3,0,0,0,100,0,4000,6000,6000,8000,0,11,16044,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cairne Bloodhoof - IC - Cast ''Cleave'''),
(3057,0,4,0,0,0,100,0,8000,12000,13000,17000,0,11,16856,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cairne Bloodhoof - IC - Cast ''Mortal Strike'''),
(3057,0,5,0,0,0,100,0,13000,17000,13000,17000,0,11,23931,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Cairne Bloodhoof - IC - Cast ''Thunderclap'''),
(3057,0,6,0,0,0,100,0,8000,12000,18000,22000,0,11,22916,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Cairne Bloodhoof - IC - Cast ''Uppercut''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
