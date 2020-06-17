-- DB update 2020_06_16_04 -> 2020_06_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_16_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_16_04 2020_06_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1592352370003409360'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1592352370003409360');

-- Update gossip IDs
UPDATE `creature_template` SET `gossip_menu_id` = 1702 WHERE `entry` = 6548; -- Magus Tirth
UPDATE `creature_template` SET `gossip_menu_id` = 434 WHERE `entry` = 4419;  -- Race Master Kronkrider
UPDATE `creature_template` SET `gossip_menu_id` = 231 WHERE `entry` = 6626;  -- "Plucky" Johnson
UPDATE `creature_template` SET `gossip_menu_id` = 280 WHERE `entry` = 4429;  -- Goblin Pit Crewman
UPDATE `creature_template` SET `gossip_menu_id` = 282 WHERE `entry` = 4430;  -- Gnome Pit Crewman
UPDATE `creature_template` SET `gossip_menu_id` = 0 WHERE `entry` = 13000;   -- Gnome Engineer: Remove wrong gossip

DELETE FROM `gossip_menu` WHERE `MenuID` IN (231,232,281,283,433,1702);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(231,720),
(231,739),
(232,738),
(281,779),
(283,781),
(433,930),
(1702,2354);

DELETE FROM `gossip_menu_option` WHERE `MenuID` IN (21211,21212,21217,280,282,434);
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(280,0,0,'Where is Tirth''s assistant?',2769,1,1,281,0,0,0,'',0,0),
(282,0,0,'Where is Tirth''s assistant?',2779,1,1,283,0,0,0,'',0,0),
(434,0,0,'Where is Tirth''s assistant?',2779,1,1,433,0,0,0,'',0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (280,282,434);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 231;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 6626;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
VALUES
(15,280,0,0,0,9,0,1950,0,0,0,0,0,'','Show gossip option if quest ''Get the Scoop'' is taken'),
(15,282,0,0,0,9,0,1950,0,0,0,0,0,'','Show gossip option if quest ''Get the Scoop'' is taken'),
(15,434,0,0,0,9,0,1950,0,0,0,0,0,'','Show gossip option if quest ''Get the Scoop'' is taken'),
(15,231,0,0,0,9,0,1950,0,0,0,0,0,'','Show gossip option if quest ''Get the Scoop'' is taken'),
(14,231,739,0,0,9,0,1950,0,0,1,0,0,'','Show gossip text 739 if quest ''Get the Scoop'' is not taken'),
(22,1,6626,0,0,1,1,9192,0,0,1,0,0,'','"Plucky" Johnson - Run SAI only if aura ''"Plucky" Resumes Human Form'' is not present'),
(22,2,6626,0,0,1,1,9192,0,0,1,0,0,'','"Plucky" Johnson - Run SAI only if aura ''"Plucky" Resumes Human Form'' is not present');

-- "Plucky" Johnson SAI
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 6626;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 6626 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (662600,662601) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6626,0,0,0,22,0,100,0,22,0,0,0,0,80,662600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Plucky" Johnson - On Received Emote ''Chicken'' - Run Script'),
(6626,0,1,2,22,0,100,0,7,0,0,0,0,11,9192,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Plucky" Johnson - On Received Emote ''Beckon'' - Cast ''"Plucky" Resumes Human Form'''),
(6626,0,2,3,61,0,100,0,0,0,0,0,0,82,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Plucky" Johnson - Linked - Add NPC Flag Gossip'),
(6626,0,3,0,61,0,100,0,0,0,0,0,0,69,1,0,0,1,0,0,7,0,0,0,0,0,0,0,0,'"Plucky" Johnson - Linked - Move To Invoker'),
(6626,0,4,0,62,0,100,0,231,0,0,0,0,15,1950,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'"Plucky" Johnson - On Gossip Option 0 Selected - Complete Quest ''Get the Scoop'''),
(6626,0,5,6,23,0,100,0,9192,0,1000,1000,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Plucky" Johnson - On Has No Aura ''"Plucky" Resumes Human Form'' - Set NPC Flag 0'),
(6626,0,6,0,61,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Plucky" Johnson - Linked - Evade'),

(662600,9,0,0,0,0,100,0,0,0,0,0,0,11,9192,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Plucky" Johnson - On Script - Cast ''"Plucky" Resumes Human Form'''),
(662600,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'"Plucky" Johnson - On Script - Set Orientation'),
(662600,9,2,0,0,0,100,0,1000,1000,0,0,0,5,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Plucky" Johnson - On Script - Play Emote ''Wave'''),
(662600,9,3,0,0,0,100,0,3500,3500,0,0,0,28,9192,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'"Plucky" Johnson - On Script - Remove Aura ''"Plucky" Resumes Human Form''');

-- Goblin Pit Crewman: New position
UPDATE `creature` SET `position_x` = -6189.15, `position_y` = -3951.81, `position_z` = -58.7494 WHERE `guid` = 21553;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
