-- DB update 2022_03_30_02 -> 2022_03_30_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_30_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_30_02 2022_03_30_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648632992566266295'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648632992566266295');

UPDATE `creature_template` SET `gossip_menu_id` = 1061, `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 7918;

DELETE FROM `gossip_menu` WHERE `MenuID` IN (1061,1062,1063,1064,1065,1066);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(1061,1674),
(1062,1676),
(1063,1675),
(1064,1677),
(1065,1678),
(1066,1679);

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (1061,1062,1063,1064,1065,1066);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(1061,0,0,'What function do you serve?',4054,1,3,1062,0,0,0,'',0,-1),
(1062,0,0,'What are the Plates of Uldum?',4056,1,3,1063,0,0,0,'',0,-1),
(1063,0,0,'Where are the Plates of Uldum?',4057,1,3,1064,0,0,0,'',0,-1),
(1064,0,0,'Excuse me? We''ve been "rescheduled for visitation"? What does that mean?!',4058,1,3,1065,0,0,0,'',0,-1),
(1065,0,0,'So... what''s inside Uldum?',4059,1,3,1066,0,0,0,'',0,-1),
(1066,0,0,'I will return when I have the Plates of Uldum.',4060,1,3,0,0,0,0,'',0,-1);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 7918;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7918,0,0,1,54,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone Watcher of Norgannon - On Just Summoned - Say Line 0'),
(7918,0,1,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone Watcher of Norgannon - Linked - Set Active On'),
(7918,0,2,3,62,0,100,0,1066,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Stone Watcher of Norgannon - On Gossip Option 0 Selected - Close Gossip'),
(7918,0,3,4,61,0,100,0,0,0,0,0,0,15,2954,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Stone Watcher of Norgannon - Linked - Quest Credit ''The Stone Watcher'''),
(7918,0,4,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone Watcher of Norgannon - Linked - Say Line 1');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 1061;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,1061,0,0,0,47,0,2954,8,0,0,0,0,'Stone Watcher of Norgannon - Group 0: Show gossip option 0 if quest ''The Stone Watcher'' is in progress');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
