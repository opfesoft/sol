-- DB update 2021_06_09_00 -> 2021_06_09_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_09_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_09_00 2021_06_09_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1623274498159686453'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1623274498159686453');

DELETE FROM `creature` WHERE `id` = 18297;                                             -- Gankly Rottenfist: Remove spawns (NPC is summoned via SAI)
UPDATE `creature` SET `spawntimesecs` = 1800 WHERE `guid` = 65624;                     -- Kristen Dipswitch: Increase respawn time
UPDATE `creature_template_addon` SET `mount` = 0, `bytes2` = 0 WHERE `entry` = 18294;  -- Kristen Dipswitch: Remove mount; sheath weapon
UPDATE `creature_template_addon` SET `auras` = '' WHERE `entry` = 18297;               -- Gankly Rottenfist: Remove aura "Stealth"
UPDATE `creature_template_addon` SET `emote` = 173 WHERE `entry` = 18278;              -- Pilot Marsha: Use "STATE_WORK" instead of "STATE_WORK_SHEATHED"

-- Hemet Nesingwary: Summon group "Talbuk Stag"
DELETE FROM `creature_summon_groups` WHERE `summonerId` = 18180;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(18180,0,1,17130,-1404.01,6327.92,39.8771,5.09944,6,30000),
(18180,0,1,17130,-1414.94,6305.9,42.409,2.95209,6,30000),
(18180,0,1,17130,-1416.5,6317.92,40.0441,0.466735,6,30000);

-- Creature texts
DELETE FROM `creature_text` WHERE `CreatureID` IN (18180,18200,18218,18294,18297);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18180,0,0,'Uh oh, those stags don''t look pleased with us!',12,0,100,0,0,0,15088,0,'Hemet Nesingwary'),
(18180,1,0,'Look out, Fitz, they''re coming right for us!',12,0,100,0,0,0,15089,0,'Hemet Nesingwary'),
(18200,0,0,'%s smiles and sheathes his rifle.',16,0,100,0,0,0,15091,0,'Shado ''Fitz'' Farstrider'),
(18218,0,0,'Uh... sure thing, Gankly.  Just...<cough>... wait right there.  <Cough>  Guys?',12,0,100,0,0,0,15112,0,'Harold Lane'),
(18218,1,0,'What''s going on?!',12,0,100,0,0,0,15090,0,'Harold Lane'),
(18218,2,0,'Um... guys?',12,0,100,0,0,0,15093,0,'Harold Lane'),
(18218,3,0,'Hemet?  Fitz?',12,0,100,0,0,0,15094,0,'Harold Lane'),
(18218,4,0,'Oh good, I was beginning to worry.',12,0,100,0,0,0,15095,0,'Harold Lane'),
(18294,0,0,'Hi, Harold.  I have your skins!',12,0,100,3,0,0,15102,0,'Kristen Dipswitch'),
(18294,1,0,'Ack!  Somebody help me!',12,0,100,0,0,0,15104,0,'Kristen Dipswitch'),
(18297,0,0,'I''ll be taking those skins, tiny.',12,0,100,0,0,0,15111,0,'Gankly Rottenfist'),
(18297,1,0,'%s rifles through Kristen''s stuff and grabs her bundle of skins.',16,0,100,16,0,0,15109,0,'Gankly Rottenfist'),
(18297,2,0,'Here are my skins, Harold.  Now give me the reward!',12,0,100,396,0,0,15110,0,'Gankly Rottenfist');

-- Kristen Dipswitch: Add gossip
DELETE FROM `gossip_menu` WHERE `MenuID` = 7629 AND `TextID` = 9293;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(7629,9293);

DELETE FROM `npc_text` WHERE `ID` = 9293;
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`)
VALUES
(9293,'','Hey!  Didn''t I give you a bundle of skins before?$B$BEither way, I''m glad to be saved from the ruthless clutches of that evil Gankly Rottenfist!',15140,0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=14 AND `SourceGroup`=7629;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,7629,9293,0,0,8,0,9897,0,0,0,0,0,'Kristen Dipswitch - Show gossip text 9293 only if quest ''I''m Saved!'' is rewarded');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (18294,18297,18180,18200,18218,17130);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (18294,18297,18180,18200,18218,17130);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1829400,1829401,1829700,1829701,1818000,1820000,1820001,1821800,1713000);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18294,0,0,1,11,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - On Respawn - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(18294,0,1,2,61,0,100,0,0,0,0,0,0,43,0,14375,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - Linked - Mount Model ''Swift Red Mechanostrider'''),
(18294,0,2,3,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - Linked - Set Active On'),
(18294,0,3,0,61,0,100,0,0,0,0,0,0,53,1,18294,0,0,0,1,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - Linked - Start WP Movement'),
(18294,0,4,0,58,0,100,0,0,18294,0,0,0,80,1829400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - On WP Ended - Call Timed Action List'),
(18294,0,5,0,0,0,100,1,1000,1000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - IC - Say Line 1 (No Repeat)'),
(18294,0,6,7,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,18297,0,0,0,0,0,0,0,'Kristen Dipswitch - On Just Died - Set Data 1 1 (Gankly Rottenfist)'),
(18294,0,7,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - Linked - Set Active On'),
(18294,0,8,0,38,0,100,0,1,2,0,0,0,80,1829401,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - On Data Set 1 2 - Call Timed Action List'),
(18294,0,9,0,36,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - On Corpse Removed - Set Active On'),

(1829400,9,0,0,0,0,100,0,0,0,0,0,0,12,18297,8,0,0,0,0,8,0,0,0,0,-1463.63,6363.4,36.9237,0,'Kristen Dipswitch - On Script - Summon Creature ''Gankly Rottenfist'''),
(1829400,9,1,0,0,0,100,0,2000,2000,0,0,0,43,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - On Script - Dismount'),
(1829400,9,2,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,2.97859,'Kristen Dipswitch - On Script - Set Orientation'),
(1829400,9,3,0,0,0,100,0,1000,1000,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - On Script - Set Faction 250'),
(1829400,9,4,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - On Script - Say Line 0'),
(1829400,9,5,0,0,0,100,0,0,0,0,0,0,45,2,1,0,0,0,0,19,18180,0,0,0,0,0,0,0,'Kristen Dipswitch - On Script - Set Data 2 1 (Hemet Nesingwary)'),

(1829401,9,0,0,0,0,100,0,2000,2000,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - On Script - Set Faction 35'),
(1829401,9,1,0,0,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - On Script - Add ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(1829401,9,2,0,0,0,100,0,300000,300000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kristen Dipswitch - On Script - Force Despawn'),

(18297,0,0,1,54,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gankly Rottenfist - On Just Summoned - Add ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(18297,0,1,2,61,0,100,0,0,0,0,0,0,11,32199,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gankly Rottenfist - Linked - Cast ''Stealth'''),
(18297,0,2,0,61,0,100,0,0,0,0,0,0,53,0,18297,0,0,0,2,1,0,0,0,0,0,0,0,0,'Gankly Rottenfist - Linked - Start WP Movement'),
(18297,0,3,0,58,0,100,0,0,18297,0,0,0,80,1829700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gankly Rottenfist - On WP Ended - Call Timed Action List'),
(18297,0,4,0,38,0,100,0,1,1,0,0,0,80,1829701,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gankly Rottenfist - On Data Set 1 1 - Call Timed Action List'),
(18297,0,5,0,6,0,100,0,0,0,0,0,0,45,1,2,0,0,0,0,19,18294,0,0,0,0,0,0,0,'Gankly Rottenfist - On Just Died - Set Data 1 2 (Kristen Dipswitch)'),
(18297,0,6,0,0,0,100,0,5000,7000,11000,13000,0,11,30981,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gankly Rottenfist - IC - Cast ''Crippling Poison'''),
(18297,0,7,0,0,0,100,0,9000,11000,15000,17000,0,11,41176,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gankly Rottenfist - IC - Cast ''Shadowstep'''),
(18297,0,8,0,0,0,100,0,3000,5000,9000,11000,0,11,15581,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gankly Rottenfist - IC - Cast ''Sinister Strike'''),
(18297,0,9,0,8,0,100,0,32190,0,0,0,0,37,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gankly Rottenfist - On Spellhit ''Shoot'' - Die'),

(1829700,9,0,0,0,0,100,0,500,500,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,3.42229,'Gankly Rottenfist - On Script - Set Orientation'),
(1829700,9,1,0,0,0,100,0,500,500,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gankly Rottenfist - On Script - Say Line 0'),
(1829700,9,2,0,0,0,100,0,2000,2000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gankly Rottenfist - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1829700,9,3,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,18294,0,0,0,0,0,0,0,'Gankly Rottenfist - On Script - Start Attack (Kristen Dipswitch)'),

(1829701,9,0,0,0,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gankly Rottenfist - On Script - Add ''UNIT_FLAG_IMMUNE_TO_PC'''),
(1829701,9,1,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gankly Rottenfist - On Script - Say Line 1'),
(1829701,9,2,0,0,0,100,0,5000,5000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,3.13852,'Gankly Rottenfist - On Script - Set Orientation'),
(1829701,9,3,0,0,0,100,0,500,500,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gankly Rottenfist - On Script - Say Line 2'),
(1829701,9,4,0,0,0,100,0,5000,5000,0,0,0,1,0,0,0,0,0,0,19,18218,0,0,0,0,0,0,0,'Gankly Rottenfist - On Script - Say Line 0 (Harold Lane)'),
(1829701,9,5,0,0,0,100,0,5000,5000,0,0,0,45,1,1,0,0,0,0,19,18200,0,0,0,0,0,0,0,'Gankly Rottenfist - On Script - Set Data 1 1 (Shado ''Fitz'' Farstrider)'),
(1829701,9,6,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,18180,0,0,0,0,0,0,0,'Gankly Rottenfist - On Script - Set Data 1 1 (Hemet Nesingwary)'),

(18180,0,0,0,38,0,100,0,1,1,0,0,0,80,1820000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hemet Nesingwary - On Data Set 1 1 - Call Timed Action List'),
(18180,0,1,2,38,0,100,0,2,1,0,0,0,67,1,300000,1200000,0,0,0,1,0,0,0,0,0,0,0,0,'Hemet Nesingwary - On Data Set 2 1 - Create Timed Event 1'),
(18180,0,2,0,61,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hemet Nesingwary - Linked - Set Active On'),
(18180,0,3,0,59,0,100,0,1,0,0,0,0,80,1818000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hemet Nesingwary - On Timed Event 1 Triggered - Call Timed Action List'),
(18180,0,4,0,4,0,100,0,0,0,0,0,0,11,32168,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hemet Nesingwary - On Aggro - Cast ''Shoot'''),
(18180,0,5,0,0,0,100,0,1000,1000,2000,2000,0,11,32168,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Hemet Nesingwary - IC - Cast ''Shoot'''),
(18180,0,6,6,21,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hemet Nesingwary - On Reached Home - Set Faction 35'),
(18180,0,7,0,61,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,19,18200,0,0,0,0,0,0,0,'Hemet Nesingwary - Linked - Set Faction 35 (Shado ''Fitz'' Farstride)'),

(1818000,9,0,0,0,0,100,0,0,0,0,0,0,107,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hemet Nesingwary - On Script - Summon Creature Group'),
(1818000,9,1,0,0,0,100,0,0,0,0,0,0,45,2,1,0,0,0,0,19,18218,0,0,0,0,0,0,0,'Hemet Nesingwary - On Script - Set Data 2 1 (Harold Lane)'),
(1818000,9,2,0,0,0,100,0,12000,12000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hemet Nesingwary - On Script - Say Line 0'),
(1818000,9,3,0,0,0,100,0,0,0,0,0,0,2,495,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hemet Nesingwary - On Script - Set Faction 495'),
(1818000,9,4,0,0,0,100,0,0,0,0,0,0,2,495,0,0,0,0,0,19,18200,0,0,0,0,0,0,0,'Hemet Nesingwary - On Script - Set Faction 495 (Shado ''Fitz'' Farstride)'),
(1818000,9,5,0,0,0,100,0,2000,2000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,-1459.7,6341.46,37.2404,0,'Hemet Nesingwary - On Script - Move To Position'),
(1818000,9,6,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,5.95377,'Hemet Nesingwary - On Script - Set Orientation'),
(1818000,9,7,0,0,0,100,0,7000,7000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hemet Nesingwary - On Script - Say Line 1'),
(1818000,9,8,0,0,0,100,0,0,0,0,0,0,45,2,1,0,0,0,0,19,18200,0,0,0,0,0,0,0,'Hemet Nesingwary - On Script - Set Data 2 1 (Shado ''Fitz'' Farstrider)'),
(1818000,9,9,0,0,0,100,0,1000,1000,0,0,0,45,2,2,0,0,0,0,19,18200,0,0,0,0,0,0,0,'Hemet Nesingwary - On Script - Set Data 2 2 (Shado ''Fitz'' Farstrider)'),
(1818000,9,10,0,0,0,100,0,3000,3000,0,0,0,49,0,0,0,0,0,0,19,17130,50,0,0,0,0,0,0,'Hemet Nesingwary - On Script - Start Attack (Talbuk Stag)'),
(1818000,9,11,0,0,0,100,0,0,0,0,0,0,123,1,0,0,0,0,0,11,17130,50,1,0,0,0,0,0,'Hemet Nesingwary - On Script - Add Threat (Talbuk Stag)'),
(1818000,9,12,0,0,0,100,0,60000,60000,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hemet Nesingwary - On Script - Set Active Off'),

(18200,0,0,0,38,0,100,0,1,1,0,0,0,80,1820000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shado ''Fitz'' Farstrider - On Data Set 1 1 - Call Timed Action List'),
(18200,0,1,0,38,0,100,0,2,1,0,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,0,5.4323,'Shado ''Fitz'' Farstrider - On Data Set 2 1 - Set Orientation'),
(18200,0,2,0,38,0,100,0,2,2,0,0,0,80,1820001,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shado ''Fitz'' Farstrider - On Data Set 2 2 - Call Timed Action List'),

(1820000,9,0,0,0,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shado ''Fitz'' Farstrider - On Script - Set Faction 250'),
(1820000,9,1,0,0,0,100,0,0,0,0,0,0,11,32190,0,0,0,0,0,19,18297,0,0,0,0,0,0,0,'Shado ''Fitz'' Farstrider - On Script - Cast ''Shoot'' (Gankly Rottenfist)'),
(1820000,9,2,0,0,0,100,0,3000,3000,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shado ''Fitz'' Farstrider - On Script - Set Faction 35'),

(1820001,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shado ''Fitz'' Farstrider - On Script - Say Line 0'),
(1820001,9,1,0,0,0,100,0,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shado ''Fitz'' Farstrider - On Script - Ready Melee Weapon'),
(1820001,9,3,0,0,0,100,0,3000,3000,0,0,0,49,0,0,0,0,0,0,19,17130,50,0,0,0,0,0,0,'Shado ''Fitz'' Farstrider - On Script - Start Attack (Talbuk Stag)'),
(1820001,9,4,0,0,0,100,0,0,0,0,0,0,123,1,0,0,0,0,0,11,17130,50,1,0,0,0,0,0,'Shado ''Fitz'' Farstrider - On Script - Add Threat (Talbuk Stag)'),

(18218,0,0,0,38,0,100,0,2,1,0,0,0,80,1821800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Data Set 2 1 - Call Timed Action List'),

(1821800,9,0,0,0,0,100,0,14000,14000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Script - Say Line 1'),
(1821800,9,1,0,0,0,100,0,7000,7000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Script - Say Line 2'),
(1821800,9,2,0,0,0,100,0,7000,7000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Script - Say Line 3'),
(1821800,9,3,0,0,0,100,0,8000,8000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harold Lane - On Script - Say Line 4'),

(17130,0,0,0,0,0,100,0,6000,9000,15000,18000,0,11,32019,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Talbuk Stag - IC - Cast ''Gore'''),
(17130,0,1,0,54,0,100,0,0,0,0,0,0,80,1713000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talbuk Stag - On Just Summoned - Call Timed Action List'),

(1713000,9,0,0,0,0,100,0,0,0,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talbuk Stag - On Script - Set Faction 14'),
(1713000,9,1,0,0,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talbuk Stag - On Script - Add ''UNIT_FLAG_IMMUNE_TO_PC'''),
(1713000,9,2,0,0,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Talbuk Stag - On Script - Start Random Movement'),
(1713000,9,3,0,0,0,100,0,22000,22000,0,0,0,49,0,0,0,0,0,0,19,18180,0,0,0,0,0,0,0,'Talbuk Stag - On Script - Start Attack (Hemet Nesingwary)'),
(1713000,9,4,0,0,0,100,0,0,0,0,0,0,123,1,0,0,0,0,0,19,18180,0,0,0,0,0,0,0,'Talbuk Stag - On Script - Add Threat (Hemet Nesingwary)');

DELETE FROM `waypoints` WHERE `entry` IN (18294,18297);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(18294,1,-1249.43,6236.27,52.6698,'Kristen Dipswitch'),
(18294,2,-1252.89,6238.29,52.0455,NULL),
(18294,3,-1256.35,6240.3,51.4205,NULL),
(18294,4,-1260.68,6242.81,50.7955,NULL),
(18294,5,-1265.87,6245.83,50.1705,NULL),
(18294,6,-1270.19,6248.35,49.5503,NULL),
(18294,7,-1274.61,6258,48.6878,NULL),
(18294,8,-1279.68,6269.1,48.1845,NULL),
(18294,9,-1284.75,6280.2,47.6812,NULL),
(18294,10,-1293.44,6287.65,46.9581,NULL),
(18294,11,-1304.52,6297.14,46.5254,NULL),
(18294,12,-1310.65,6302.65,45.8879,NULL),
(18294,13,-1320.36,6310.72,45.0323,NULL),
(18294,14,-1330.12,6317.53,44.7093,NULL),
(18294,15,-1341.02,6325.13,44.3509,NULL),
(18294,16,-1355.68,6335.35,43.3028,NULL),
(18294,17,-1368.81,6344.67,42.219,NULL),
(18294,18,-1378.45,6351.53,41.2709,NULL),
(18294,19,-1386.62,6357.33,40.5069,NULL),
(18294,20,-1397.56,6356.49,39.2589,NULL),
(18294,21,-1410.82,6355.47,37.7278,NULL),
(18294,22,-1423.46,6354.5,37.7959,NULL),
(18294,23,-1433.68,6353.6,37.8278,NULL),
(18294,24,-1444.24,6352.67,37.5038,NULL),
(18294,25,-1452.59,6351.94,37.2739,NULL),
(18297,1,-1463.63,6363.4,36.9237,'Gankly Rottenfist'),
(18297,2,-1461.74,6366.47,36.445,NULL),
(18297,3,-1458.92,6368.42,36.0956,NULL),
(18297,4,-1455.34,6367.12,36.2761,NULL),
(18297,5,-1452.8,6364.54,36.6589,NULL),
(18297,6,-1450.19,6361.55,36.9106,NULL),
(18297,7,-1448.18,6358.95,37.1489,NULL),
(18297,8,-1447.03,6354.99,37.3989,NULL),
(18297,9,-1448.83,6352.42,37.3518,NULL),
(18297,10,-1451.46,6352.27,37.2739,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
