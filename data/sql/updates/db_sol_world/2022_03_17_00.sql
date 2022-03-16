-- DB update 2022_03_12_02 -> 2022_03_17_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_12_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_12_02 2022_03_17_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1647471842063151408'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1647471842063151408');

-- Apply "Finish the Gronn: Ogre Force Reaction" if quest "Into the Soulgrinder" is rewarded
UPDATE `spell_dbc` SET `AttributesEx` = `AttributesEx` | 32, `AttributesEx2` = 1, `AttributesEx3` = 1048576, `RangeIndex` = 13, `Effect1` = 6, `Effect2` = 6,
`EffectDieSides1` = 1, `EffectDieSides2` = 1, `EffectBasePoints1` = 2, `EffectBasePoints2` = 2, `EffectImplicitTargetA1` = 1, `EffectImplicitTargetA2` = 1,
`EffectApplyAuraName1` = 139, `EffectApplyAuraName2` = 139, `EffectMiscValue1` = 929, `EffectMiscValue2` = 1001, `DmgMultiplier1` = 1, `DmgMultiplier2` = 1, `SchoolMask` = 0 WHERE `Id` = 39960;

DELETE FROM `spell_area` WHERE `spell` = 39960;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`, `quest_start_status`, `quest_end_status`)
VALUES
(39960,3522,11000,0,0,0,2,1,64,11);

-- Remove obsolete auras
UPDATE `creature_addon` SET `auras` = NULL WHERE `guid` IN (71150,71370);

-- Ogres sitting
DELETE FROM `creature_addon` WHERE `guid` IN (77756,78692);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(77756,0,0,1,0,0,0,NULL),
(78692,0,0,1,0,0,0,NULL);

DELETE FROM `creature_text` WHERE `CreatureId` IN (19995,19998,20334,21296,20731) AND `GroupID` IN (4,5);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(19995,4,0,'Ohh, look! Bloodmaul Brew! Mmmm...',12,0,100,16,0,0,18170,0,'Bladespire Brute - Bloodmaul Brutebane Brew'),
(19995,4,1,'Bloodmaul Brew? Me favorite!',12,0,100,16,0,0,18171,0,'Bladespire Brute - Bloodmaul Brutebane Brew'),
(19995,4,2,'Mmm. Me thirsty!',12,0,100,16,0,0,18172,0,'Bladespire Brute - Bloodmaul Brutebane Brew'),
(19995,4,3,'Wut''s dis?',12,0,100,16,0,0,18173,0,'Bladespire Brute - Bloodmaul Brutebane Brew'),
(19995,5,0,'Uh oh...',12,0,100,92,0,0,18182,0,'Bladespire Brute - Bloodmaul Brutebane Brew'),
(19995,5,1,'Ugh... Me not feel so guud.',12,0,100,92,0,0,18197,0,'Bladespire Brute - Bloodmaul Brutebane Brew'),

(19998,4,0,'Ohh, look! Bloodmaul Brew! Mmmm...',12,0,100,16,0,0,18170,0,'Bladespire Shaman - Bloodmaul Brutebane Brew'),
(19998,4,1,'Bloodmaul Brew? Me favorite!',12,0,100,16,0,0,18171,0,'Bladespire Shaman - Bloodmaul Brutebane Brew'),
(19998,4,2,'Mmm. Me thirsty!',12,0,100,16,0,0,18172,0,'Bladespire Shaman - Bloodmaul Brutebane Brew'),
(19998,4,3,'Wut''s dis?',12,0,100,16,0,0,18173,0,'Bladespire Shaman - Bloodmaul Brutebane Brew'),
(19998,5,0,'Uh oh...',12,0,100,92,0,0,18182,0,'Bladespire Shaman - Bloodmaul Brutebane Brew'),
(19998,5,1,'Ugh... Me not feel so guud.',12,0,100,92,0,0,18197,0,'Bladespire Shaman - Bloodmaul Brutebane Brew'),

(20334,4,0,'Ohh, look! Bloodmaul Brew! Mmmm...',12,0,100,16,0,0,18170,0,'Bladespire Cook - Bloodmaul Brutebane Brew'),
(20334,4,1,'Bloodmaul Brew? Me favorite!',12,0,100,16,0,0,18171,0,'Bladespire Cook - Bloodmaul Brutebane Brew'),
(20334,4,2,'Mmm. Me thirsty!',12,0,100,16,0,0,18172,0,'Bladespire Cook - Bloodmaul Brutebane Brew'),
(20334,4,3,'Wut''s dis?',12,0,100,16,0,0,18173,0,'Bladespire Cook - Bloodmaul Brutebane Brew'),
(20334,5,0,'Uh oh...',12,0,100,92,0,0,18182,0,'Bladespire Cook - Bloodmaul Brutebane Brew'),
(20334,5,1,'Ugh... Me not feel so guud.',12,0,100,92,0,0,18197,0,'Bladespire Cook - Bloodmaul Brutebane Brew'),

(21296,4,0,'Ohh, look! Bloodmaul Brew! Mmmm...',12,0,100,16,0,0,18170,0,'Bladespire Champion - Bloodmaul Brutebane Brew'),
(21296,4,1,'Bloodmaul Brew? Me favorite!',12,0,100,16,0,0,18171,0,'Bladespire Champion - Bloodmaul Brutebane Brew'),
(21296,4,2,'Mmm. Me thirsty!',12,0,100,16,0,0,18172,0,'Bladespire Champion - Bloodmaul Brutebane Brew'),
(21296,4,3,'Wut''s dis?',12,0,100,16,0,0,18173,0,'Bladespire Champion - Bloodmaul Brutebane Brew'),
(21296,5,0,'Uh oh...',12,0,100,92,0,0,18182,0,'Bladespire Champion - Bloodmaul Brutebane Brew'),
(21296,5,1,'Ugh... Me not feel so guud.',12,0,100,92,0,0,18197,0,'Bladespire Champion - Bloodmaul Brutebane Brew'),

(20731,4,0,'Ohh, look! Bloodmaul Brew! Mmmm...',12,0,100,16,0,0,18170,0,'Droggam - Bloodmaul Brutebane Brew'),
(20731,4,1,'Bloodmaul Brew? Me favorite!',12,0,100,16,0,0,18171,0,'Droggam - Bloodmaul Brutebane Brew'),
(20731,4,2,'Mmm. Me thirsty!',12,0,100,16,0,0,18172,0,'Droggam - Bloodmaul Brutebane Brew'),
(20731,4,3,'Wut''s dis?',12,0,100,16,0,0,18173,0,'Droggam - Bloodmaul Brutebane Brew'),
(20731,5,0,'Uh oh...',12,0,100,92,0,0,18182,0,'Droggam - Bloodmaul Brutebane Brew'),
(20731,5,1,'Ugh... Me not feel so guud.',12,0,100,92,0,0,18197,0,'Droggam - Bloodmaul Brutebane Brew');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21241,19995,19996,19997,19998,20334,20756,20765,20766,20768,21296,20731,19948,19952,19957,19992,19993,19994,20095,21238,-77757,22160,22384,19956);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1999500,1999501);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21241,0,0,1,54,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Brutebane Stout Trigger - On Just Summoned - Store Target 1 (Invoker)'),
(21241,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Brutebane Stout Trigger - Linked - Set Event Phase 1'),
(21241,0,2,3,38,0,100,0,1,1,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Brutebane Stout Trigger - On Data Set 1 1 - Set Event Phase 2'),
(21241,0,3,0,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Brutebane Stout Trigger - Linked - Send Target 1 (Invoker)'),
(21241,0,4,0,60,1,100,0,1000,5000,0,0,0,45,1,1,0,0,0,0,19,19995,40,0,0,0,0,0,0,'Bloodmaul Brutebane Stout Trigger - On Update - Set Data 1 1 (Bladespire Brute) (Event Phase 1)'),
(21241,0,5,0,60,1,100,0,1000,5000,0,0,0,45,1,1,0,0,0,0,19,19998,40,0,0,0,0,0,0,'Bloodmaul Brutebane Stout Trigger - On Update - Set Data 1 1 (Bladespire Shaman) (Event Phase 1)'),
(21241,0,6,0,60,1,100,0,1000,5000,0,0,0,45,1,1,0,0,0,0,19,20334,40,0,0,0,0,0,0,'Bloodmaul Brutebane Stout Trigger - On Update - Set Data 1 1 (Bladespire Cook) (Event Phase 1)'),
(21241,0,7,0,60,1,100,0,1000,5000,0,0,0,45,1,1,0,0,0,0,19,21296,40,0,0,0,0,0,0,'Bloodmaul Brutebane Stout Trigger - On Update - Set Data 1 1 (Bladespire Champion) (Event Phase 1)'),
(21241,0,8,0,60,1,100,0,1000,5000,0,0,0,45,1,1,0,0,0,0,19,20731,40,0,0,0,0,0,0,'Bloodmaul Brutebane Stout Trigger - On Update - Set Data 1 1 (Droggam) (Event Phase 1)'),

(19995,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Brute - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(19995,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Brute - On Aggro - Say Line 0'),
(19995,0,2,0,0,0,100,0,9000,12000,8000,18000,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Brute - IC - Cast ''Cleave'''),
(19995,0,3,4,75,1,100,0,0,21241,5,5000,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Creature Within 5y Distance - Set Event Phase 2 (Phase 1)'),
(19995,0,4,0,61,0,100,0,0,0,0,0,0,80,1999500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - Linked - Call Timed Action List'),
(19995,0,5,6,38,0,100,256,1,1,60000,60000,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Brute - On Data Set 1 1 - Set Data 1 1 (Invoker) (No Reset)'),
(19995,0,6,0,61,0,100,0,0,0,0,0,0,80,1999501,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Data Set 1 1 - Call Timed Action List'),
(19995,0,7,8,59,0,100,0,1,0,0,0,0,124,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Timed Event 1 Triggered - Unload Equipment'),
(19995,0,8,0,61,0,100,0,0,0,0,0,0,124,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - Linked - Load Equipment 1'),

(1999500,9,0,0,0,0,100,0,0,0,0,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Play Emote ''ONESHOT_KNEEL'''),
(1999500,9,1,0,0,0,100,0,2000,2000,0,0,0,41,0,0,0,0,0,0,20,184315,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Delete GO (Bloodmaul Brew)'),
(1999500,9,2,0,0,0,100,0,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Ready Melee Weapon'),
(1999500,9,3,0,0,0,100,0,0,0,0,0,0,71,0,0,2703,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Equip Mug'),
(1999500,9,4,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Say Line 4'),
(1999500,9,5,0,0,0,100,0,0,0,0,0,0,67,1,14000,14000,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Create Timed Event 1'),
(1999500,9,6,0,0,0,100,0,2000,2000,0,0,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Play Emote ''ONESHOT_EAT_NOSHEATHE'''),
(1999500,9,7,0,0,0,100,0,4000,4000,0,0,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Play Emote ''ONESHOT_EAT_NOSHEATHE'''),
(1999500,9,8,0,0,0,100,0,4000,4000,0,0,0,5,92,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Play Emote ''ONESHOT_EAT_NOSHEATHE'''),
(1999500,9,9,0,0,0,100,0,4000,4000,0,0,0,11,35240,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Cast ''Bloodmaul Intoxication'''),
(1999500,9,10,0,0,0,100,0,0,0,0,0,0,17,93,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Set Emote State ''STATE_STUN_NOSHEATHE'''),
(1999500,9,11,0,0,0,100,0,0,0,0,0,0,11,36421,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Cast ''Bloodmaul Brutebane Brew Kill Credit'' (Stored Target 1)'),
(1999500,9,12,0,0,0,100,0,0,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Say Line 5'),
(1999500,9,13,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Stop Follow'),
(1999500,9,14,0,0,0,100,0,25000,25000,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Set Emote State ''ONESHOT_NONE'''),
(1999500,9,15,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Set Event Phase 0'),
(1999500,9,16,0,0,0,100,0,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Set React State ''Aggressive'''),
(1999500,9,17,0,0,0,100,0,10000,10000,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Evade'),

(1999501,9,0,0,0,0,100,0,0,0,0,0,0,8,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Set React State ''Defensive'''),
(1999501,9,1,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Set Event Phase 1'),
(1999501,9,2,0,0,0,100,0,0,0,0,0,0,29,0,0,0,0,0,0,19,21241,0,0,0,0,0,0,0,'Bladespire Brute - On Script - Follow (Bloodmaul Brutebane Stout Trigger)'),

(19998,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Shaman - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(19998,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Shaman - On Aggro - Say Line 0'),
(19998,0,2,0,1,0,100,0,1000,1000,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Shaman - OOC - Cast ''Lightning Shield'''),
(19998,0,3,0,0,0,100,0,2000,4000,8000,12000,0,11,26098,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Shaman - IC - Cast ''Lightning Bolt'''),
(19998,0,4,5,75,1,100,0,0,21241,5,5000,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Shaman - On Creature Within 5y Distance - Set Event Phase 2 (Phase 1)'),
(19998,0,5,0,61,0,100,0,0,0,0,0,0,80,1999500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Shaman - Linked - Call Timed Action List'),
(19998,0,6,7,38,0,100,256,1,1,60000,60000,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Shaman - On Data Set 1 1 - Set Data 1 1 (Invoker) (No Reset)'),
(19998,0,7,0,61,0,100,0,0,0,0,0,0,80,1999501,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Shaman - On Data Set 1 1 - Call Timed Action List'),
(19998,0,8,9,59,0,100,0,1,0,0,0,0,124,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Shaman - On Timed Event 1 Triggered - Unload Equipment'),
(19998,0,9,0,61,0,100,0,0,0,0,0,0,124,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Shaman - Linked - Load Equipment 1'),

(20334,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Cook - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(20334,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Cook - On Aggro - Say Line 0'),
(20334,0,2,0,0,0,100,0,15000,20000,15000,20000,0,11,37597,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Cook - IC - Cast ''Meat Slap'''),
(20334,0,3,0,0,0,100,0,15000,20000,15000,20000,0,11,37596,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Cook - IC - Cast ''Tenderize'''),
(20334,0,4,5,75,1,100,0,0,21241,5,5000,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Cook - On Creature Within 5y Distance - Set Event Phase 2 (Phase 1)'),
(20334,0,5,0,61,0,100,0,0,0,0,0,0,80,1999500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Cook - Linked - Call Timed Action List'),
(20334,0,6,7,38,0,100,256,1,1,60000,60000,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Cook - On Data Set 1 1 - Set Data 1 1 (Invoker) (No Reset)'),
(20334,0,7,0,61,0,100,0,0,0,0,0,0,80,1999501,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Cook - On Data Set 1 1 - Call Timed Action List'),
(20334,0,8,9,59,0,100,0,1,0,0,0,0,124,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Cook - On Timed Event 1 Triggered - Unload Equipment'),
(20334,0,9,0,61,0,100,0,0,0,0,0,0,124,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Cook - Linked - Load Equipment 1'),

(21296,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Champion - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(21296,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Champion - On Aggro - Say Line 0'),
(21296,0,2,0,0,0,100,0,10000,14000,11000,22000,0,11,8078,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Champion - IC - Cast ''Thunderclap'''),
(21296,0,3,0,9,0,100,0,5,10,2000,2000,0,11,37777,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Champion - Within 5-10 Range - Cast ''Mighty Charge'''),
(21296,0,4,5,75,1,100,0,0,21241,5,5000,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Champion - On Creature Within 5y Distance - Set Event Phase 2 (Phase 1)'),
(21296,0,5,0,61,0,100,0,0,0,0,0,0,80,1999500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Champion - Linked - Call Timed Action List'),
(21296,0,6,7,38,0,100,256,1,1,60000,60000,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Champion - On Data Set 1 1 - Set Data 1 1 (Invoker) (No Reset)'),
(21296,0,7,0,61,0,100,0,0,0,0,0,0,80,1999501,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Champion - On Data Set 1 1 - Call Timed Action List'),
(21296,0,8,9,59,0,100,0,1,0,0,0,0,124,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Champion - On Timed Event 1 Triggered - Unload Equipment'),
(21296,0,9,0,61,0,100,0,0,0,0,0,0,124,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Champion - Linked - Load Equipment 1'),

(20731,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Droggam - OOC - Cast ''Frost Armor'''),
(20731,0,1,0,0,0,100,0,500,1000,8500,9000,0,11,9053,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Droggam - IC - Cast ''Fireball'''),
(20731,0,2,0,2,0,100,1,0,30,0,0,0,11,11831,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Droggam - Between 0-30% Health - Cast ''Frost Nova'' (No Repeat)'),
(20731,0,3,4,75,1,100,0,0,21241,5,5000,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Droggam - On Creature Within 5y Distance - Set Event Phase 2 (Phase 1)'),
(20731,0,4,0,61,0,100,0,0,0,0,0,0,80,1999500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Droggam - Linked - Call Timed Action List'),
(20731,0,5,6,38,0,100,256,1,1,60000,60000,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Droggam - On Data Set 1 1 - Set Data 1 1 (Invoker) (No Reset)'),
(20731,0,6,0,61,0,100,0,0,0,0,0,0,80,1999501,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Droggam - On Data Set 1 1 - Call Timed Action List'),
(20731,0,7,8,59,0,100,0,1,0,0,0,0,124,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Droggam - On Timed Event 1 Triggered - Unload Equipment'),
(20731,0,8,0,61,0,100,0,0,0,0,0,0,124,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Droggam - Linked - Load Equipment 1'),

(19996,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Battlemage - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(19996,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Battlemage - On Aggro - Say Line 0'),
(19996,0,2,0,1,0,100,0,1000,1000,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Battlemage - OOC - Cast ''Lightning Shield'''),
(19996,0,3,0,0,0,100,0,8000,16000,8000,16000,0,11,16102,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Battlemage - IC - Cast ''Flamestrike'''),
(19996,0,4,0,0,0,100,0,6000,9000,17000,17000,0,11,37599,0,0,0,0,0,26,10,0,0,0,0,0,0,0,'Bladespire Battlemage - IC - Cast ''Bloodlust'''),

(19997,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Enforcer - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(19997,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Enforcer - On Aggro - Say Line 0'),
(19997,0,2,0,0,0,100,0,10000,14000,11000,22000,0,11,8078,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Enforcer - IC - Cast ''Thunderclap'''),
(19997,0,3,4,2,0,100,1,0,30,35000,45000,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Enforcer - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),
(19997,0,4,0,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Enforcer - Linked - Say Line 2'),

(20756,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Chef - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(20756,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Chef - On Aggro - Say Line 0'),
(20756,0,2,0,0,0,100,0,15000,20000,15000,20000,0,11,37597,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Chef - IC - Cast ''Meat Slap'''),
(20756,0,3,0,0,0,100,0,15000,20000,15000,20000,0,11,37596,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Chef - IC - Cast ''Tenderize'''),

(20765,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Crusher - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(20765,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Crusher - On Aggro - Say Line 0'),
(20765,0,2,0,0,0,100,0,3000,5000,10000,20000,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bladespire Crusher - IC - Cast ''Cleave'''),
(20765,0,3,4,2,0,100,1,0,30,35000,45000,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Crusher - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),
(20765,0,4,0,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Crusher - Linked - Say Line 2'),

(20766,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Mystic - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(20766,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Mystic - On Aggro - Say Line 0'),
(20766,0,2,0,1,0,100,0,1000,1000,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bladespire Mystic - OOC - Cast ''Lightning Shield'''),
(20766,0,3,0,0,0,100,0,6000,9000,17000,17000,0,11,37599,0,0,0,0,0,26,10,0,0,0,0,0,0,0,'Bladespire Battlemage - IC - Cast ''Bloodlust'''),
(20766,0,4,0,74,0,100,0,0,60,15000,18000,40,11,11986,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Bladespire Mystic - On Friendly Between 0-60% Health - Cast ''Healing Wave'''),

(20768,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Gnosh Brognat - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(20768,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Gnosh Brognat - On Aggro - Say Line 0'),
(20768,0,2,0,0,0,100,0,15000,20000,15000,20000,0,11,37597,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gnosh Brognat - IC - Cast ''Meat Slap'''),
(20768,0,3,0,0,0,100,0,15000,20000,15000,20000,0,11,37596,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gnosh Brognat - IC - Cast ''Tenderize'''),

(19948,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Skirmisher - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(19948,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Skirmisher - On Aggro - Say Line 0'),
(19948,0,2,0,4,0,100,0,0,0,0,0,0,11,34932,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Skirmisher - On Aggro - Cast ''Bloodmaul Buzz'''),
(19948,0,3,0,13,0,100,0,10000,15000,0,0,0,11,34802,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmaul Skirmisher - On Victim Casting - Cast ''Kick'''),
(19948,0,4,0,2,0,100,1,0,30,0,0,0,11,37786,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Skirmisher - Between 0-30% Health - Cast ''Bloodmaul Rage'' (No Repeat)'),

(19952,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Geomancer - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(19952,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Geomancer - On Aggro - Say Line 0'),
(19952,0,2,0,1,0,100,0,1000,1000,1000,1000,0,11,12544,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Geomancer - OOC - Cast ''Frost Armor'''),
(19952,0,3,0,0,0,100,0,0,0,2400,3800,0,11,9053,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmaul Geomancer - IC - Cast ''Fireball'''),

(19957,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Brewmaster - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(19957,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Brewmaster - On Aggro - Say Line 0'),
(19957,0,2,0,0,0,85,0,6000,6000,30000,35000,0,11,37591,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmaul Brewmaster - IC - Cast ''Drunken Haze'''),

(19992,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Shaman - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(19992,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Shaman - On Aggro - Say Line 0'),
(19992,0,2,0,1,0,100,0,1000,1000,1000,1000,0,11,12550,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Shaman - OOC - Cast ''Lightning Shield'''),
(19992,0,3,0,0,0,50,0,6000,6000,50000,50000,0,11,15038,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Shaman - IC - Cast ''Scorching Totem'''),
(19992,0,4,0,0,0,100,0,12000,12000,45000,45000,0,11,15869,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Shaman - IC - Cast ''Superior Healing Ward'''),

(19993,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Mauler - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(19993,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Mauler - On Aggro - Say Line 0'),
(19993,0,2,0,2,0,100,1,0,30,0,0,0,11,37786,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Mauler - Between 0-30% Health - Cast ''Bloodmaul Rage'' (No Repeat)'),

(19994,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Warlock - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(19994,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Warlock - On Aggro - Say Line 0'),
(19994,0,2,0,25,0,100,0,0,0,0,0,0,11,11939,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Warlock - On Reset - Cast ''Summon Imp'''),
(19994,0,3,0,1,0,100,0,1000,1000,1000,1000,0,11,13787,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Warlock - OOC - Cast ''Demon Armor'''),
(19994,0,4,0,0,0,100,0,0,0,2400,3800,0,11,20825,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmaul Warlock - IC - Cast ''Shadow Bolt'''),
(19994,0,5,0,2,0,100,1,0,20,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Warlock - Between 0-20% Health - Flee For Assisst'),

(20095,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Grimnok Battleborn - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(20095,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Grimnok Battleborn - On Aggro - Say text 0'),
(20095,0,2,0,0,0,100,0,6000,10000,6000,10000,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Grimnok Battleborn - IC - Cast ''Cleave'''),
(20095,0,3,0,2,0,100,1,0,30,0,0,0,11,37786,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimnok Battleborn - Between 0-30% Health - Cast ''Bloodmaul Rage'' (No Repeat)'),
(20095,0,4,0,1,0,100,0,120000,120000,180000,180000,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grimnok Battleborn - OOC - Say Line 2'),

(21238,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Drudger - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(21238,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Drudger - On Aggro - Say Line 0'),
(21238,0,2,0,0,0,100,0,9000,9000,30000,30000,0,11,35918,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmaul Drudger - IC - Cast ''Puncture Armor'''),
(21238,0,3,4,2,0,100,1,0,30,35000,45000,0,11,8599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Drudger - Between 0-30% Health - Cast ''Enrage'' (No Repeat)'),
(21238,0,4,0,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Drudger - Linked - Say Line 2'),

(22160,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Taskmaster - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(22160,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Taskmaster - On Aggro - Say Line 0'),
(22160,0,2,0,2,0,100,1,0,30,0,0,0,11,37786,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Taskmaster - Between 0-30% Health - Cast ''Bloodmaul Rage'' (No Repeat)'),

(22384,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Soothsayer - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(22384,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Soothsayer - On Aggro - Say Line 0'),
(22384,0,2,0,1,0,100,0,1000,1000,1000,1000,0,11,13787,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Soothsayer - OOC - Cast ''Demon Armor'''),
(22384,0,3,0,25,0,100,0,0,0,0,0,0,11,11939,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Soothsayer - On Reset - Cast ''Summon Imp'''),
(22384,0,4,0,0,0,100,0,0,0,2400,3800,0,11,20825,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bloodmaul Soothsayer - IC - Cast ''Shadow Bolt'''),
(22384,0,5,0,2,0,100,1,0,20,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Soothsayer - Between 0-20% Health - Flee For Assist'),

(19956,0,0,0,6,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Lookout - On Death - Say Line 1 (CONDITION_SOURCE_TYPE_SMART_EVENT)'),
(19956,0,1,0,4,0,35,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bloodmaul Lookout - On Aggro - Say Line 0'),
(19956,0,2,0,2,0,100,1,0,30,0,0,0,11,37786,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloodmaul Lookout - Between 0-30% Health - Cast ''Bloodmaul Rage'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
