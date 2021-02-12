-- DB update 2021_02_12_01 -> 2021_02_12_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_12_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_12_01 2021_02_12_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1613169027058874919'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1613169027058874919');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 21208;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,21208,718,0,0,47,0,2078,8,0,1,0,0,'The Threshwackonator 4100 - Show gossip text 718 if quest ''Gyromast''s Revenge'' is not in progress'),
(14,21208,758,0,0,47,0,2078,8,0,0,0,0,'The Threshwackonator 4100 - Show gossip text 758 if quest ''Gyromast''s Revenge'' is in progress'),
(15,21208,0,0,0,47,0,2078,8,0,0,0,0,'The Threshwackonator 4100 - Show gossip option 0 if quest ''Gyromast''s Revenge'' is in progress');

DELETE FROM `gossip_menu` WHERE `MenuID` = 21208 AND `TextID` = 758;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(21208,758);

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 21208 AND `OptionID` = 0;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(21208,0,0,'Turn the key to start the machine.',2703,1,1,0,0,0,0,'',0,0);

UPDATE `creature_template` SET `unit_flags` = 512, `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 6669;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6669;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (666900,666901);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6669,0,0,0,62,0,100,0,21208,0,0,0,0,80,666900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Gossip Option 0 Selected - Call Timed Action List'),
(6669,0,1,0,75,1,100,1,36625,0,10,0,0,80,666901,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Distance To Creature ''Gelkak Gyromast'' - Call Timed Action List (No Repeat, Phase 1)'),
(6669,0,2,0,7,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Evade - Force Despawn'),

(666900,9,0,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Script - Set Event Phase 1'),
(666900,9,1,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Script - Store Target'),
(666900,9,2,0,0,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Script - Close Gossip'),
(666900,9,3,0,0,0,100,0,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Script - Remove NPC Flag ''Gossip'''),
(666900,9,4,0,0,0,100,0,500,500,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Script - Say Line 0'),
(666900,9,5,0,0,0,100,0,1000,1000,0,0,0,29,2,180,0,0,0,0,12,1,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Script - Start Follow Stored Target'),

(666901,9,0,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Script - Stop Follow'),
(666901,9,1,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Script - Set Home Position'),
(666901,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,10,36625,6667,0,0,0,0,0,0,'The Threshwackonator 4100 - On Script - Say Line 0 (Gelkak Gyromast)'),
(666901,9,3,0,0,0,100,0,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Script - Set Faction 14'),
(666901,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'The Threshwackonator 4100 - On Script - Start Attacking');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
