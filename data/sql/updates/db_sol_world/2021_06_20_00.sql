-- DB update 2021_06_19_00 -> 2021_06_20_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_19_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_19_00 2021_06_20_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624142493874884662'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624142493874884662');

-- "The Missing Diplomat", part 16: Quest can only be completed by an external event
UPDATE `quest_template_addon` SET `SpecialFlags` = 2 WHERE `ID` = 1324;

DELETE FROM `quest_details` WHERE `ID` = 1324;
INSERT INTO `quest_details` (`ID`, `Emote1`, `Emote2`, `Emote3`, `Emote4`, `EmoteDelay1`, `EmoteDelay2`, `EmoteDelay3`, `EmoteDelay4`, `VerifiedBuild`)
VALUES
(1324,5,14,0,0,0,0,0,0,12340);

-- Private Hendel: Clean up creature text
DELETE FROM `creature_text` WHERE `CreatureID` = 4966;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(4966,0,0,'%s, too injured, gives up the chase.',16,0,100,0,0,0,8224,0,'Private Hendel'),
(4966,1,0,'Please... please... Miss Proudmore. I didn''t mean to...',12,7,100,0,0,0,1759,0,'Private Hendel');

-- Private Hendel summon group
DELETE FROM `creature_summon_groups` WHERE `summonerId` = 4966;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(4966,0,1,4967,-2882.55,-3345.43,33.7722,3.39919,3,120000), -- Archmage Tervosh
(4966,0,1,4968,-2880.52,-3346.8,34.5063,3.36777,3,120000),  -- Lady Jaina Proudmoore
(4966,0,1,4965,-2881.22,-3343.22,34.1732,3.52487,3,120000); -- Pained

-- Lady Jaina Proudmoore: Add "Greetings" text to use where the Theramore introduction text is inappropriate
DELETE FROM `gossip_menu` WHERE `MenuID` = 2465 AND `TextID` = 1;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(2465,1);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 2465;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 5085;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,2465,3158,0,0,47,0,1267,64,0,0,0,0,'Lady Jaina Proudmoore - Show gossip text 3158 if quest ''The Missing Diplomat (Part 17)'' is rewarded'),
(14,2465,1,0,1,47,0,1324,74,0,0,0,0,'Lady Jaina Proudmoore - Show gossip text 1 if quest ''The Missing Diplomat (Part 16)'' is in progress, completed or rewarded'),
(14,2465,1,0,2,47,0,1267,10,0,0,0,0,'Lady Jaina Proudmoore - Show gossip text 1 if quest ''The Missing Diplomat (Part 17)'' is in progress or completed'),

(14,2465,3157,0,1,47,0,1267,64,0,1,0,0,'Lady Jaina Proudmoore - Show gossip text 3157 if quest ''The Missing Diplomat (Part 17)'' is not rewarded'),
(14,2465,3157,0,1,47,0,1324,74,0,1,0,0,'Lady Jaina Proudmoore - Show gossip text 3157 if quest ''The Missing Diplomat (Part 16)'' is not in progress, completed or rewarded'),
(14,2465,3157,0,1,47,0,1267,10,0,1,0,0,'Lady Jaina Proudmoore - Show gossip text 3157 if quest ''The Missing Diplomat (Part 17)'' is not in progress or completed'),

(15,2465,0,0,0,47,0,558,8,0,0,0,0,'Lady Jaina Proudmoore - Show gossip option 0 if quest ''Jaina''s Autograph'' is in progress'),

(22,2,5085,0,0,21,1,16,0,0,1,0,0,'Sentry Point Guard - Enable SAI if not roaming');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (4966,4967,5085,4965,4968,5184);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (4966,4967,5184,-31271,-31268,5085,4965,4968);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (496600,496601,496700,518400,518401,508500);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4966,0,0,1,11,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Respawn - Reset Emote State'),
(4966,0,1,2,61,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - Linked - Add ''GOSSIP_OPTION_QUESTGIVER'''),
(4966,0,2,3,61,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - Linked - Reset Invincibility HP'),
(4966,0,3,4,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - Linked - Set Event Phase 0'),
(4966,0,4,0,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - Linked - Set Event Phase Reset Off'),
(4966,0,5,0,19,0,100,0,1324,0,0,0,0,80,496600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Quest ''The Missing Diplomat (Part 16)'' Taken - Call Timed Action List'),
(4966,0,6,0,2,1,100,1,0,20,0,0,0,80,496601,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - Between 0-20% Health - Call Timed Action List (Event Phase 1, No Repeat)'),
(4966,0,7,8,1,1,100,1,10000,10000,0,0,0,41,0,0,0,0,0,0,10,31268,5184,1,0,0,0,0,0,'Private Hendel - OOC - Force Despawn (Theramore Sentry) (Event Phase 1, No Repeat)'),
(4966,0,8,9,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,10,31271,5184,1,0,0,0,0,0,'Private Hendel - Linked - Force Despawn (Theramore Sentry)'),
(4966,0,9,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - Linked - Force Despawn'),

(496600,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Set Active On'),
(496600,9,1,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(496600,9,2,0,0,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Set Invincibility 1 HP'),
(496600,9,3,0,0,0,100,0,0,0,0,0,0,2,168,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Set Faction 168'),
(496600,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Start Attack'),
(496600,9,5,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Store Target ID 1'),
(496600,9,6,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,10,31268,5184,1,0,0,0,0,0,'Private Hendel - On Script - Send Target ID 1 (Theramore Sentry)'),
(496600,9,7,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,10,31271,5184,1,0,0,0,0,0,'Private Hendel - On Script - Send Target ID 1 (Theramore Sentry)'),
(496600,9,8,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,31268,5184,1,0,0,0,0,0,'Private Hendel - On Script - Set Data 1 1 (Theramore Sentry)'),
(496600,9,9,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,31271,5184,1,0,0,0,0,0,'Private Hendel - On Script - Set Data 1 1 (Theramore Sentry)'),
(496600,9,10,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Set Event Phase 1'),

(496601,9,0,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Set Event Phase 0'),
(496601,9,1,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Set Home Position'),
(496601,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Say Line 0'),
(496601,9,3,0,0,0,100,0,0,0,0,0,0,27,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Stop Combat'),
(496601,9,4,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Evade'),
(496601,9,5,0,0,0,100,0,0,0,0,0,0,2,1077,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Set Faction 1077'),
(496601,9,6,0,0,0,100,0,0,0,0,0,0,17,64,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Set Emote State ''STATE_STUN'''),
(496601,9,7,0,0,0,100,0,3000,3000,0,0,0,107,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Private Hendel - On Script - Summon Creature Group 1'),
(496601,9,8,0,0,0,100,0,1000,1000,0,0,0,45,1,1,0,0,0,0,19,4967,0,0,0,0,0,0,0,'Private Hendel - On Script - Set Data 1 1 (Archmage Tervosh)'),
(496601,9,9,0,0,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,11,5184,50,0,0,0,0,0,0,'Private Hendel - On Script - Set Data 2 2 (Theramore Sentry)'),
(496601,9,10,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,19,4967,0,0,0,0,0,0,0,'Private Hendel - On Script - Set Orientation (Archmage Tervosh)'),
(496601,9,11,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,4967,0,0,0,0,0,0,0,'Private Hendel - On Script - Send Target (Archmage Tervosh)'),

(4968,0,0,0,54,0,100,0,0,0,0,0,0,11,51347,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Just Summoned - Cast ''Teleport Visual Only'''),
(4968,0,1,2,62,0,100,0,2465,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Gossip Select - Close Gossip'),
(4968,0,2,0,61,0,100,0,0,0,0,0,0,11,23122,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Lady Jaina Proudmoore - On Gossip Select - Cast ''Jaina''s Autograph'''),

(4965,0,0,0,54,0,100,0,0,0,0,0,0,11,51347,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Pained - On Just Summoned - Cast ''Teleport Visual Only'''),

(4967,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Tervosh - On Just Summoned - Set Active On'),
(4967,0,1,0,61,0,100,0,0,0,0,0,0,11,51347,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Tervosh - Linked - Cast ''Teleport Visual Only'''),
(4967,0,2,0,0,0,100,0,0,0,3000,5000,0,11,20822,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Archmage Tervosh - IC - Cast ''Frostbolt'''),
(4967,0,3,0,0,0,100,0,6000,8000,12000,14000,0,11,20823,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Archmage Tervosh - IC - Cast ''Fireball'''),
(4967,0,4,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Archmage Tervosh - Between 0-15% Health - Flee For Assist'),
(4967,0,5,6,20,0,100,0,1265,0,0,0,0,11,7120,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Archmage Tervosh - On Quest ''The Missing Diplomat (Part 14)'' Finished - Cast ''Proudmoore''s Defense'''),
(4967,0,6,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Archmage Tervosh - Linked - Say Line 0'),
(4967,0,7,0,38,0,100,0,1,1,0,0,0,80,496700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Tervosh - On Data Set 1 1 - Call Timed Action List'),

(496700,9,0,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Tervosh - On Script - Say Line 1'),
(496700,9,1,0,0,0,100,0,3000,3000,0,0,0,11,7081,0,0,0,0,0,19,4966,0,0,0,0,0,0,0,'Archmage Tervosh - On Script - Cast ''Encage'''),
(496700,9,2,0,0,0,100,0,4000,4000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Tervosh - On Script - Say Line 2'),
(496700,9,3,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,19,4966,0,0,0,0,0,0,0,'Archmage Tervosh - On Script - Say Line 1 (Private Hendel)'),
(496700,9,4,0,0,0,100,0,3000,3000,0,0,0,11,7079,0,0,0,0,0,19,4966,0,0,0,0,0,0,0,'Archmage Tervosh - On Script - Cast ''Simple Teleport Other'''),
(496700,9,5,0,0,0,100,0,2000,2000,0,0,0,41,0,0,0,0,0,0,19,4966,0,0,0,0,0,0,0,'Archmage Tervosh - On Script - Force Despawn (Private Hendel)'),
(496700,9,6,0,0,0,100,0,2000,2000,0,0,0,15,1324,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Archmage Tervosh - On Script - Complete Quest ''The Missing Diplomat (Part 16)'''),
(496700,9,7,0,0,0,100,0,1000,1000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Tervosh - On Script - Say Line 2'),
(496700,9,8,0,0,0,100,0,6000,6000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Archmage Tervosh - On Script - Say Line 3'),

(-31268,0,0,1,38,0,100,0,1,1,0,0,0,2,168,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Data Set 1 1 - Set Faction 168'),
(-31268,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Theramore Sentry - Linked - Start Attack'),
(-31268,0,2,0,38,0,100,0,2,2,0,0,0,80,518401,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Data Set 2 2 - Call Timed Action List'),
(-31268,0,3,0,40,0,100,0,4,518401,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On WP 3 Reached - Force Despawn'),

(-31271,0,0,1,38,0,100,0,1,1,0,0,0,2,168,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Data Set 1 1 - Set Faction 168'),
(-31271,0,1,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Theramore Sentry - Linked - Start Attack'),
(-31271,0,2,0,38,0,100,0,2,2,0,0,0,80,518400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Data Set 2 2 - Call Timed Action List'),
(-31271,0,3,0,40,0,100,0,2,518400,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On WP 2 Reached - Force Despawn'),

(518400,9,0,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Set Home Position'),
(518400,9,1,0,0,0,100,0,0,0,0,0,0,2,150,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Set Faction 150'),
(518400,9,2,0,0,0,100,0,0,0,0,0,0,27,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Stop Combat'),
(518400,9,3,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Evade'),
(518400,9,4,0,0,0,100,0,1000,1000,0,0,0,53,1,518400,0,0,0,2,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Start WP Movement'),
(518400,9,5,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Say Line 0'),

(518401,9,0,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Set Home Position'),
(518401,9,1,0,0,0,100,0,0,0,0,0,0,2,150,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Set Faction 150'),
(518401,9,2,0,0,0,100,0,0,0,0,0,0,27,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Stop Combat'),
(518401,9,3,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Evade'),
(518401,9,4,0,0,0,100,0,1000,1000,0,0,0,53,1,518401,0,0,0,2,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Start WP Movement'),
(518401,9,5,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Theramore Sentry - On Script - Say Line 1'),

(5085,0,0,0,25,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentry Point Guard - On Reset - Set Event Phase 1'),
(5085,0,1,0,75,1,100,0,0,4967,10,7000,0,80,508500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentry Point Guard - On ''Archmage Tervosh'' Within 10y Distance - Call Timed Action List (Event Phase 1)'),

(508500,9,0,0,1,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentry Point Guard - On Script - Set Event Phase 2'),
(508500,9,1,0,1,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,4967,10,0,0,0,0,0,0,'Sentry Point Guard - On Script - Set Orientation (Archmage Tervosh)'),
(508500,9,2,0,1,0,100,0,2000,2000,0,0,0,5,66,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentry Point Guard - On Script - Play Emote ''ONESHOT_SALUTE'''),
(508500,9,3,0,1,0,100,0,6000,6000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentry Point Guard - On Script - Reset Orientation'),
(508500,9,4,0,1,0,100,0,48000,48000,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Sentry Point Guard - On Script - Set Event Phase 1');

DELETE FROM `waypoints` WHERE `entry` IN (518400,518401);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(518400,1,-2906.15,-3345.12,31.3324,'Theramore Sentry'),
(518400,2,-2910.64,-3353.77,30.4347,NULL),
(518401,1,-2887.78,-3332.98,32.7207,'Theramore Sentry'),
(518401,2,-2897.26,-3330.35,33.442,NULL),
(518401,3,-2908.55,-3336.71,32.0493,NULL),
(518401,4,-2914.51,-3346.08,30.843,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
