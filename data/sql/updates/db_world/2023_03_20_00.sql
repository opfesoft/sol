-- Remove old custom creature IDs
DELETE FROM `creature_template` WHERE `entry` IN (
61021, -- Adyen the Lightwarden
50004, -- Adyen Trigger
50002, -- Exarch Orelis
50001  -- Anchorite Karja
);
DELETE FROM `creature_equip_template` WHERE `CreatureID` IN (50001,50002,61021);
DELETE FROM `creature_text` WHERE `creatureid` = 61021;
DELETE FROM `creature` WHERE `id` = 50004;

-- Remove CREATURE_FLAG_EXTRA_CIVILIAN, add IMMUNE_TO_PLAYERS
UPDATE `creature_template` SET `flags_extra` = `flags_extra` & ~2, `unit_flags` = `unit_flags` | 256 WHERE `entry` IN (19466,19467,18538,18537);

-- Remove old waypoints
DELETE FROM `waypoint_data` WHERE `id` IN (
610210, -- ADYEN_PATH_ID
500010, -- KARJA_PATH_ID
500020, -- ORELIS_PATH_ID
207940, -- KAYLAAN_PATH_ID1
207941, -- KAYLAAN_PATH_ID2
500050  -- ISHANAH_PATH_ID
);

DELETE FROM `creature_text` WHERE `CreatureId` = 18537 AND `GroupID` > 5;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(18537,6,0,'We''re here for you, lost brother.  It is custom to offer you a chance to repent before you are destroyed.  We offer you this chance, as the naaru''s law commands.',12,0,100,0,0,0,18389,0,'Adyen the Lightwarden - Deathblow to the Legion'),
(18537,7,0,'We may be few, Socrethar, but our faith is strong.  Something you will never understand.  Now that custom has been served, prepare to meet your end.',12,0,100,0,0,0,18391,0,'Adyen the Lightwarden - Deathblow to the Legion'),
(18537,8,0,'How... how could you?!',12,0,100,0,0,0,18393,0,'Adyen the Lightwarden - Deathblow to the Legion'),
(18537,9,0,'Socrethar is clouding your mind, Kaylaan!  You do not mean these words!  I remember training you when you were but a youngling.  Your will was strong even then!',12,0,100,0,0,0,18397,0,'Adyen the Lightwarden - Deathblow to the Legion');

-- Anchorite Karja
UPDATE `creature_template_addon` SET `bytes1` = 0, `bytes2` = 1 WHERE `entry` = 19467;
DELETE FROM `creature_addon` WHERE `guid` = 69727;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(69727,0,0,6,1,0,0,NULL);

-- Socrethar
UPDATE `creature` SET `orientation` = 3.89208 WHERE `guid` = 71631;

DELETE FROM `creature` WHERE `guid` BETWEEN 3009314 AND 3009318;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009314,18537,530,0,0,1,1,0,1,4805.8,3774.11,210.617,5.55015,3600,0,1,0,0,0,0,0,0),
(3009315,19466,530,0,0,1,1,0,1,4804.81,3775.56,210.617,5.53269,3600,0,1,0,0,0,0,0,0),
(3009316,19467,530,0,0,1,1,0,1,4803.64,3773.84,210.618,5.60251,3600,0,1,0,0,0,0,0,0),
(3009317,20794,530,0,0,1,1,0,1,4950.15,3887.85,212.302,4.57013,-1,0,1,0,0,0,0,0,0),
(3009318,18538,530,0,0,1,1,0,1,4866.2,3799.02,199.058,0.468058,-1,0,1,0,0,0,0,0,0);

DELETE FROM `game_event` WHERE `eventEntry` = 136;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `holidayStage`, `description`, `world_event`, `announce`)
VALUES
(136,'2000-01-01 07:00:00','2000-01-01 07:00:00',5184000,60,0,0,'Deathblow to the Legion',0,0);

DELETE FROM `game_event_creature` WHERE `eventEntry` = 136;
INSERT INTO `game_event_creature` (`eventEntry`, `guid`)
VALUES
(136,3009314),
(136,3009315),
(136,3009316),
(136,3009317),
(136,3009318);

-- Slain Sha'tar Vindicator: Remove wrong gossip menu ID
UPDATE `creature_template` SET `gossip_menu_id` = 0 WHERE `entry` = 21859;

-- Adyen the Lightwarden
DELETE FROM `gossip_menu` WHERE `MenuID` = 8117 AND `TextID` = 10210;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(8117,10210);

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 8117;
INSERT INTO `gossip_menu_option` (`MenuID`, `OptionID`, `OptionIcon`, `OptionText`, `OptionBroadcastTextID`, `OptionType`, `OptionNpcFlag`, `ActionMenuID`, `ActionPoiID`, `BoxCoded`, `BoxMoney`, `BoxText`, `BoxBroadcastTextID`, `VerifiedBuild`)
VALUES
(8117,0,0,'I''m ready, Adyen.',18591,1,1,0,0,0,0,'',0,0);

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (18538,19467,20132,20794);
UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` = 184604;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (-3009314,-3009315,-3009316,-3009317,-3009318,20132,-69725);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 184604;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (1853700,1946601,1946700,2013200,2013201,2013202,2013203,2079400,2079401,2079402,2079403,1853800,1853801);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(184604,1,0,0,54,0,100,0,0,0,0,0,0,112,136,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Portal to Socrethar''s Seat - On Just Summoned - Start Game Event ''Deathblow to the Legion'' (CONDITION_QUESTSTATE)'),

(-3009314,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - On Respawn - Set Active On'),
(-3009314,0,1,2,61,0,100,0,0,0,0,0,0,67,1,900000,900000,0,0,0,1,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - Linked - Create Timed Event 1'),
(-3009314,0,2,3,61,0,100,0,0,0,0,0,0,70,0,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - Linked - Disable Save Respawn Time'),
(-3009314,0,3,0,61,0,100,0,0,0,0,0,0,81,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - Linked - Set ''GOSSIP_OPTION_GOSSIP'''),
(-3009314,0,4,0,62,0,100,0,8117,0,0,0,0,80,1853700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - On Gossip Option 0 Selected - Call Timed Action List'),
(-3009314,0,5,6,34,0,100,0,2,22,0,0,0,45,1,1,0,0,0,0,10,71631,20132,1,0,0,0,0,0,'Adyen the Lightwarden - On WP 23 Reached - Set Data 1 1 (Socrethar)'),
(-3009314,0,6,7,61,0,100,0,0,0,0,0,0,238,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - Linked - Unload WP Path'),
(-3009314,0,7,8,61,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,19466,0,0,0,0,0,0,0,'Adyen the Lightwarden - Linked - Set Data 2 2 (Exarch Orelis)'),
(-3009314,0,8,0,61,0,100,0,0,0,0,0,0,45,2,2,0,0,0,0,19,19467,0,0,0,0,0,0,0,'Adyen the Lightwarden - Linked - Set Data 2 2 (Anchorite Karja)'),
(-3009314,0,9,0,0,0,100,0,0,3500,2000,7500,0,11,14518,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - IC - Cast ''Crusader Strike'''),
(-3009314,0,10,0,0,0,100,0,15000,40000,20000,60000,0,11,13005,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - IC - Cast ''Hammer of Justice'''),
(-3009314,0,11,0,59,0,100,0,1,0,0,0,0,111,136,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - On Timed Event 1 Triggered - Stop Game Event ''Deathblow to the Legion'''),

(1853700,9,0,0,0,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - On Script - Close Gossip'),
(1853700,9,1,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - On Script - Remove Timed Event 1'),
(1853700,9,2,0,0,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,16,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - On Script - Store Targetlist 1 (Invoker Party)'),
(1853700,9,3,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,19466,0,0,0,0,0,0,0,'Adyen the Lightwarden - On Script - Set Data 1 1 (Exarch Orelis)'),
(1853700,9,4,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,19467,0,0,0,0,0,0,0,'Adyen the Lightwarden - On Script - Set Data 1 1 (Anchorite Karja)'),
(1853700,9,5,0,0,0,100,0,0,0,0,0,0,83,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - On Script - Remove ''GOSSIP_OPTION_GOSSIP'''),
(1853700,9,6,0,0,0,100,0,0,0,0,0,0,2,495,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - On Script - Set Faction ''Escortee'''),
(1853700,9,7,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,10,71631,20132,1,0,0,0,0,0,'Adyen the Lightwarden - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'' (Socrethar)'),
(1853700,9,8,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,10,71631,20132,1,0,0,0,0,0,'Adyen the Lightwarden - On Script - Set Active On (Socrethar)'),
(1853700,9,9,0,0,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,10,71631,20132,1,0,0,0,0,0,'Adyen the Lightwarden - On Script - Send Targetlist 1 (Socrethar)'),
(1853700,9,10,0,0,0,100,0,0,0,0,0,0,238,30093140,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Adyen the Lightwarden - On Script - Load WP Path'),

(-3009315,0,0,0,11,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Exarch Orelis - On Respawn - Set ''GOSSIP_OPTION_NONE'''),
(-3009315,0,1,0,38,0,100,0,1,1,0,0,0,80,1946601,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Exarch Orelis - On Data Set 1 1 - Call Timed Action List'),
(-3009315,0,2,0,38,0,100,0,2,2,0,0,0,237,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Exarch Orelis - On Data Set 2 2 - Leave Creature Formation'),
(-3009315,0,3,0,0,0,100,0,0,3500,15000,21000,0,11,29426,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Exarch Orelis - IC - Cast ''Heroic Strike'''),
(-3009315,0,4,0,0,0,100,0,10000,15000,30000,30000,0,11,16509,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Exarch Orelis - IC - Cast ''Rend'''),
(-3009315,0,5,0,0,0,100,0,7500,21000,20000,45000,0,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Exarch Orelis - IC - Cast ''Demoralizing Shout'''),

(1946601,9,0,0,0,0,100,0,0,0,0,0,0,2,495,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Exarch Orelis - On Script - Set Faction ''Escortee'''),
(1946601,9,1,0,0,0,100,0,0,0,0,0,0,237,2,0,0,0,0,0,7,0,0,0,0,0,0,3,335,'Exarch Orelis - On Script - Create Creature Formation (Invoker)'),
(1946601,9,2,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Exarch Orelis - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),

(-3009316,0,0,0,11,0,100,0,0,0,0,0,0,81,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Karja - On Respawn - Set ''GOSSIP_OPTION_NONE'''),
(-3009316,0,1,0,38,0,100,0,1,1,0,0,0,80,1946700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Karja - On Data Set 1 1 - Call Timed Action List'),
(-3009316,0,2,0,38,0,100,0,2,2,0,0,0,237,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Karja - On Data Set 2 2 - Leave Creature Formation'),
(-3009316,0,3,0,0,0,100,0,3500,10000,7500,15000,0,11,9734,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Anchorite Karja - IC - Cast ''Holy Smite'''),
(-3009316,0,4,0,14,0,100,0,4000,40,15000,30000,0,11,35096,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Anchorite Karja - Friendly At 4000 Health - Cast ''Greater Heal'''),

(1946700,9,0,0,0,0,100,0,0,0,0,0,0,2,495,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Karja - On Script - Set Faction ''Escortee'''),
(1946700,9,1,0,0,0,100,0,0,0,0,0,0,237,2,0,0,0,0,0,7,0,0,0,0,0,0,3,25,'Anchorite Karja - On Script - Create Creature Formation (Invoker)'),
(1946700,9,2,0,0,0,100,0,0,0,0,0,0,19,512,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Karja - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_NPC'''),

(20132,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Respawn - Disable Event Phase Reset'),
(20132,0,1,2,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - Linked - Set Event Phase 0'),
(20132,0,2,0,61,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - Linked - Set Corpse Delay'),
(20132,0,3,0,38,0,100,0,1,1,0,0,0,80,2013200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Data Set 1 1 - Call Timed Action List'),
(20132,0,4,0,38,0,100,0,2,2,0,0,0,11,35596,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Data Set 2 2 - Cast ''Power of the Legion'''),
(20132,0,5,0,38,0,100,0,3,3,0,0,0,66,0,0,0,0,0,0,19,18538,0,0,0,0,0,0,0,'Socrethar - On Data Set 3 3 - Set Orientation (Ishanah)'),
(20132,0,6,0,38,0,100,0,4,4,0,0,0,80,2013201,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Data Set 4 4 - Call Timed Action List'),
(20132,0,7,0,38,0,100,0,5,5,0,0,0,80,2013202,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Data Set 5 5 - Call Timed Action List'),
(20132,0,8,9,6,0,100,0,0,0,0,0,0,11,35762,3,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Death - Cast ''Socrethar Quest Credit'''),
(20132,0,9,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,18538,0,0,0,0,0,0,0,'Socrethar - Linked - Set Data 1 1 (Ishanah)'),
(20132,0,10,0,0,0,100,0,0,0,3600,3600,0,11,37539,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - IC - Cast ''Nether Protection'''),
(20132,0,11,0,0,0,100,0,2500,7500,15000,25000,0,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Socrethar - IC - Cast ''Cleave'''),
(20132,0,12,0,0,0,100,0,10000,15000,40000,60000,0,11,37538,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - IC - Cast ''Anti-Magic Shield'''),
(20132,0,13,0,0,0,100,0,17000,24000,10000,35000,0,11,28448,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - IC - Cast ''Shadow Bolt Volley'''),
(20132,0,14,0,0,0,100,0,30000,40000,30000,40000,0,11,37540,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Socrethar - IC - Cast ''Fireball Barrage'''),
(20132,0,15,0,0,0,100,0,30000,45000,35000,50000,0,11,37537,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Socrethar - IC - Cast ''Backlash'''),
(20132,0,16,0,69,0,100,0,136,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Game Event ''Deathblow to the Legion'' Ended - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(20132,0,17,0,7,1,100,0,0,0,0,0,0,80,2013203,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Evade (Event Phase 1) - Call Timed Action List'),

(2013200,9,0,0,0,0,100,0,0,0,0,0,0,1,6,0,0,0,0,0,19,18537,0,0,0,0,0,0,0,'Socrethar - On Script - Say Line 6 (Adyen the Lightwarden)'),
(2013200,9,1,0,0,0,100,0,9000,9000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Script - Say Line 0'),
(2013200,9,2,0,0,0,100,0,5000,5000,0,0,0,1,7,0,0,0,0,0,19,18537,0,0,0,0,0,0,0,'Socrethar - On Script - Say Line 7 (Adyen the Lightwarden)'),
(2013200,9,3,0,0,0,100,0,4000,4000,0,0,0,70,0,0,0,0,0,0,10,3009317,20794,0,0,0,0,0,0,'Socrethar - On Script - Respawn Target (Kaylaan the Lost)'),
(2013200,9,4,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Script - Say Line 1'),

(2013201,9,0,0,0,0,100,0,0,0,0,0,0,11,35598,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Script - Cast ''Wrath of Socrethar'''),
(2013201,9,1,0,0,0,100,0,7000,7000,0,0,0,45,3,3,0,0,0,0,19,20794,0,0,0,0,0,0,0,'Socrethar - On Script - Set Data 3 3 (Kaylaan the Lost)'),

(2013202,9,0,0,0,0,100,0,0,0,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Script - Say Line 5'),
(2013202,9,1,0,0,0,100,0,6000,6000,0,0,0,11,35600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Script - Cast ''Wrath of Socrethar'''),
(2013202,9,2,0,0,0,100,0,4000,4000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2013202,9,3,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Script - Set Event Phase 1'),
(2013202,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,19,18538,0,0,0,0,0,0,0,'Socrethar - On Script - Start Attack (Ishanah)'),

(2013203,9,0,0,0,0,100,0,60000,60000,0,0,0,111,136,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Script - Stop Game Event ''Deathblow to the Legion'''),
(2013203,9,1,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Script - Set Event Phase 0'),
(2013203,9,2,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Socrethar - On Script - Set Active Off'),

(-3009317,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Respawn - Set Active On'),
(-3009317,0,1,2,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - Linked - Disable Event Phase Reset'),
(-3009317,0,2,3,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - Linked - Set Event Phase 0'),
(-3009317,0,3,0,61,0,100,0,0,0,0,0,0,53,0,2079400,0,0,0,2,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - Linked - Start WP Movement'),
(-3009317,0,4,0,58,0,100,0,0,2079400,0,0,0,80,2079400,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On WP Path Ended - Call Timed Action List'),
(-3009317,0,5,0,2,0,100,1,0,1,0,0,0,80,2079401,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - Between 0-1% Health - Call Timed Action List (No Repeat)'),
(-3009317,0,6,0,38,0,100,0,1,1,0,0,0,66,0,0,0,0,0,0,19,18538,0,0,0,0,0,0,0,'Kaylaan the Lost - On Data Set 1 1 - Set Orientation (Ishanah)'),
(-3009317,0,7,0,38,0,100,0,2,2,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Data Set 2 2 - Set ''UNIT_STAND_STATE_KNEEL'''),
(-3009317,0,8,0,38,0,100,0,3,3,0,0,0,80,2079402,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Data Set 3 3 - Call Timed Action List'),
(-3009317,0,9,0,8,0,100,0,35600,0,0,0,0,11,29266,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Spellhit ''Wrath of Socrethar'' - Cast ''Permanent Feign Death'''),
(-3009317,0,10,0,0,0,100,0,2500,7500,3500,8500,0,11,37552,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kaylaan the Lost - IC - Cast ''Burning Light'''),
(-3009317,0,11,0,0,0,100,0,8000,12000,12000,21000,0,11,37553,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Kaylaan the Lost - IC - Cast ''Consecration'''),
(-3009317,0,12,0,7,1,100,0,0,0,0,0,0,80,2079403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Evade (Event Phase 1) - Call Timed Action List'),

(2079400,9,0,0,0,0,100,0,1000,1000,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Set ''UNIT_STAND_STATE_KNEEL'''),
(2079400,9,1,0,0,0,100,0,0,0,0,0,0,1,8,0,0,0,0,0,19,18537,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Say Line 8 (Adyen the Lightwarden)'),
(2079400,9,2,0,0,0,100,0,3000,3000,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(2079400,9,3,0,0,0,100,0,2000,2000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,4940.22,3847.43,211.499,0,'Kaylaan the Lost - On Script - Move To Point 1'),
(2079400,9,4,0,0,0,100,0,2000,2000,0,0,0,66,0,0,0,0,0,0,19,18537,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Set Orientation (Adyen the Lightwarden)'),
(2079400,9,5,0,0,0,100,0,4000,4000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Say Line 0'),
(2079400,9,6,0,0,0,100,0,10000,10000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Say Line 1'),
(2079400,9,7,0,0,0,100,0,8000,8000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Say Line 2'),
(2079400,9,8,0,0,0,100,0,6000,6000,0,0,0,1,9,0,0,0,0,0,19,18537,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Say Line 9 (Adyen the Lightwarden)'),
(2079400,9,9,0,0,0,100,0,8000,8000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Say Line 3'),
(2079400,9,10,0,0,0,100,0,6000,6000,0,0,0,45,2,2,0,0,0,0,19,20132,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Set Data 2 2 (Socrethar)'),
(2079400,9,11,0,0,0,100,0,4000,4000,0,0,0,2,14,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Set Faction ''Monster'''),
(2079400,9,12,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,4939.07,3853.03,211.501,4.34944,'Kaylaan the Lost - On Script - Set Home Position'),
(2079400,9,13,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,19,20132,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Say Line 2 (Socrethar)'),
(2079400,9,14,0,0,0,100,0,0,0,0,0,0,42,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Set Invincibility HP 1'),
(2079400,9,15,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Set Event Phase 1'),
(2079400,9,16,0,0,0,100,0,100,100,0,0,0,49,0,0,0,0,0,0,19,18537,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Start Attack (Adyen the Lightwarden)'),

(2079401,9,0,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Set Phase 0'),
(2079401,9,1,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2079401,9,2,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Evade'),
(2079401,9,3,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,19,20132,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Say Line 3 (Socrethar)'),
(2079401,9,4,0,0,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,3009318,18538,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Respawn Target (Ishanah)'),
(2079401,9,5,0,0,0,100,0,4000,4000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Say Line 4'),

(2079402,9,0,0,0,0,100,0,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Say Line 6'),
(2079402,9,1,0,0,0,100,0,0,0,0,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Remove ''UNIT_STAND_STATE_KNEEL'''),
(2079402,9,2,0,0,0,100,0,0,0,0,0,0,28,35596,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Remove Aura ''Power of the Legion'''),
(2079402,9,3,0,0,0,100,0,0,0,0,0,0,53,1,2079401,0,0,0,2,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Start WP Movement'),
(2079402,9,4,0,0,0,100,0,6000,6000,0,0,0,2,290,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Set Faction ''Escortee'''),
(2079402,9,5,0,0,0,100,0,4000,4000,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Say Line 7'),
(2079402,9,6,0,0,0,100,0,0,0,0,0,0,11,13874,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Cast ''Divine Shield'''),
(2079402,9,7,0,0,0,100,0,1000,1000,0,0,0,11,35599,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Cast ''Resurrection'''),
(2079402,9,8,0,0,0,100,0,6000,6000,0,0,0,45,5,5,0,0,0,0,19,20132,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Set Data 5 5 (Socrethar)'),

(2079403,9,0,0,0,0,100,0,60000,60000,0,0,0,111,136,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaylaan the Lost - On Script - Stop Game Event ''Deathblow to the Legion'''),

(-3009318,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - On Respawn - Set Active On'),
(-3009318,0,1,2,61,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - Linked - Remove ''GOSSIP_OPTION_GOSSIP'' & ''GOSSIP_OPTION_QUESTGIVER'''),
(-3009318,0,2,3,61,0,100,0,0,0,0,0,0,2,250,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - Linked - Set Faction ''Escortee'''),
(-3009318,0,3,0,61,0,100,0,0,0,0,0,0,53,1,1853800,0,0,0,2,1,0,0,0,0,0,0,0,0,'Ishanah - Linked - Start WP Movement'),
(-3009318,0,4,0,58,0,100,0,0,1853800,0,0,0,80,1853800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - On WP Path Ended - Call Timed Action List'),
(-3009318,0,5,0,8,0,100,0,35598,0,0,0,0,11,29266,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - On Spellhit ''Wrath of Socrethar'' - Cast ''Permanent Feign Death'''),
(-3009318,0,6,0,8,0,100,0,35599,0,0,0,0,28,29266,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - On Spellhit ''Resurrection'' - Remove Aura ''Permanent Feign Death'''),
(-3009318,0,7,0,38,0,100,0,1,1,0,0,0,80,1853801,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - On Data Set 1 1 - Call Timed Action List'),
(-3009318,0,8,0,4,0,100,0,0,0,0,0,0,39,50,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - On Aggro - Call For Help'),
(-3009318,0,9,0,0,0,100,0,0,3500,2500,7500,0,11,15238,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ishanah - IC - Cast ''Holy Smite'''),
(-3009318,0,10,0,14,0,100,0,5000,40,30000,60000,0,11,35096,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ishanah - Friendly At 5000 Health - Cast ''Greater Heal'''),
(-3009318,0,11,0,14,0,100,0,3000,40,45000,75000,0,11,22187,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ishanah - Friendly At 3000 Health - Cast ''Power Word: Shield'''),

(1853800,9,0,0,0,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,20794,0,0,0,0,0,0,0,'Ishanah - On Script - Set Data 1 1 (Kaylaan)'),
(1853800,9,1,0,0,0,100,0,0,0,0,0,0,45,3,3,0,0,0,0,19,20132,0,0,0,0,0,0,0,'Ishanah - On Script - Set Data 3 3 (Socrethar)'),
(1853800,9,2,0,0,0,100,0,1000,1000,0,0,0,66,0,0,0,0,0,0,19,20132,0,0,0,0,0,0,0,'Ishanah - On Script - Set Orientation (Socrethar)'),
(1853800,9,3,0,0,0,100,0,0,0,0,0,0,1,5,0,0,0,0,0,19,20794,0,0,0,0,0,0,0,'Ishanah - On Script - Say Line 5 (Kaylaan)'),
(1853800,9,4,0,0,0,100,0,5000,5000,0,0,0,45,2,2,0,0,0,0,19,20794,0,0,0,0,0,0,0,'Ishanah - On Script - Set Data 2 2 (Kaylaan)'),
(1853800,9,5,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - On Script - Say Line 0'),
(1853800,9,6,0,0,0,100,0,3000,3000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - On Script - Say Line 1'),
(1853800,9,7,0,0,0,100,0,7000,7000,0,0,0,1,4,0,0,0,0,0,19,20132,0,0,0,0,0,0,0,'Ishanah - On Script - Say Line 4 (Socrethar)'),
(1853800,9,8,0,0,0,100,0,4000,4000,0,0,0,45,4,4,0,0,0,0,19,20132,0,0,0,0,0,0,0,'Ishanah - On Script - Set Data 4 4 (Socrethar)'),

(1853801,9,0,0,0,0,100,0,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - On Script - Add ''GOSSIP_OPTION_QUESTGIVER'''),
(1853801,9,1,0,0,0,100,0,120000,120000,0,0,0,111,136,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ishanah - On Script - Stop Game Event ''Deathblow to the Legion'''),

(-69725,0,0,0,1,0,100,0,0,30000,180000,240000,0,80,1946600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Exarch Orelis - OOC - Call Timed Action List');

DELETE FROM `waypoints` WHERE `entry` IN (2079400,2079401,1853800);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(2079400,1,4950.15,3887.85,212.302,'Kaylaan the Lost'),
(2079400,2,4949.42,3884.41,212.337,NULL),
(2079400,3,4948.37,3879.49,212.035,NULL),
(2079400,4,4946.88,3872.51,211.498,NULL),
(2079400,5,4942.59,3862.04,211.595,NULL),
(2079400,6,4939.23,3853.85,211.493,NULL),
(2079400,7,4941.73,3852.19,211.471,NULL),

(2079401,1,4939.07,3853.03,211.501,'Kaylaan the Lost'),
(2079401,2,4942.52,3844.24,211.504,NULL),
(2079401,3,4945.5,3836.67,211.467,NULL),
(2079401,4,4939.1,3833.58,211.47,NULL),

(1853800,1,4866.2,3799.02,199.058,'Ishanah'),
(1853800,2,4872.57,3802.21,198.974,NULL),
(1853800,3,4879.14,3805.51,198.972,NULL),
(1853800,4,4885.85,3808.87,198.971,NULL),
(1853800,5,4890.25,3811.73,202.741,NULL),
(1853800,6,4894.75,3814.66,205.702,NULL),
(1853800,7,4898.95,3817.4,208.378,NULL),
(1853800,8,4903.07,3820.08,209.938,NULL),
(1853800,9,4907.6,3823.02,211.488,NULL),
(1853800,10,4915.96,3825.17,211.508,NULL),
(1853800,11,4924.32,3827.31,211.495,NULL),
(1853800,12,4932.91,3829.52,211.467,NULL),
(1853800,13,4937.06,3832.6,211.466,NULL);

DELETE FROM `waypoint_data` WHERE `id` = 30093140;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(30093140,1,4805.8,3774.11,210.534,NULL,0,0,0,0,100,0),
(30093140,2,4813.04,3771.53,210.534,NULL,0,0,0,0,100,0),
(30093140,3,4819.2,3769.35,210.482,NULL,0,0,0,0,100,0),
(30093140,4,4824.33,3770.89,209.846,NULL,0,0,0,0,100,0),
(30093140,5,4829.5,3772.44,208.879,NULL,0,0,0,0,100,0),
(30093140,6,4836.76,3774.62,207.521,NULL,0,0,0,0,100,0),
(30093140,7,4842.37,3776.31,206.426,NULL,0,0,0,0,100,0),
(30093140,8,4846.35,3779.18,204.837,NULL,0,0,0,0,100,0),
(30093140,9,4852.11,3783.34,202.172,NULL,0,0,0,0,100,0),
(30093140,10,4857.22,3787.02,200.406,NULL,0,0,0,0,100,0),
(30093140,11,4862.26,3793.89,199.323,NULL,0,0,0,0,100,0),
(30093140,12,4866.68,3799.91,199.031,NULL,0,0,0,0,100,0),
(30093140,13,4872.54,3802.66,198.971,NULL,0,0,0,0,100,0),
(30093140,14,4880.36,3806.32,198.971,NULL,0,0,0,0,100,0),
(30093140,15,4885.94,3808.94,198.972,NULL,0,0,0,0,100,0),
(30093140,16,4890.26,3811.72,202.745,NULL,0,0,0,0,100,0),
(30093140,17,4895.36,3815.01,206.093,NULL,0,0,0,0,100,0),
(30093140,18,4898.7,3817.17,208.269,NULL,0,0,0,0,100,0),
(30093140,19,4903.7,3820.39,210.161,NULL,0,0,0,0,100,0),
(30093140,20,4907.65,3822.95,211.487,NULL,0,0,0,0,100,0),
(30093140,21,4913.54,3826.74,211.5,NULL,0,0,0,0,100,0),
(30093140,22,4920.1,3830.98,211.507,NULL,0,0,0,0,100,0),
(30093140,23,4926.22,3834.93,211.493,NULL,60000,0,0,0,100,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 184604 AND `SourceId` = 1;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 8117;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (19,20) AND `SourceEntry` IN (10021,10420,10421,10554);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (35598,35599,35600);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,184604,1,0,47,0,10409,8,0,0,0,0,'GO ''Portal to Socrethar''s Seat'' - Group 0: Execute SAI ID 0 if quest ''Deathblow to the Legion'' is in progress'),

(14,8117,10051,0,0,23,1,3742,0,0,1,0,0,'Creature ''Adyen the Lightwarden'' - Group 0: Show gossip text 10051 if not in area ''Socrethar''s Seat'''),
(14,8117,10210,0,0,23,1,3742,0,0,0,0,0,'Creature ''Adyen the Lightwarden'' - Group 0: Show gossip text 10210 if in area ''Socrethar''s Seat'''),

(15,8117,0,0,0,47,0,10409,8,0,0,0,0,'Creature ''Adyen the Lightwarden'' - Group 0: Show gossip option 0 if quest ''Deathblow to the Legion'' is in progress'),
(15,8117,0,0,0,23,1,3742,0,0,0,0,0,'Creature ''Adyen the Lightwarden'' - Group 0: Show gossip option 0 if in area ''Socrethar''s Seat'''),
(15,8117,0,0,0,29,1,20132,200,0,0,0,0,'Creature ''Adyen the Lightwarden'' - Group 0: Show gossip option 0 if near creature ''Socrethar'' (alive)'),

(19,0,10021,0,0,23,0,3742,0,0,1,0,0,'Quest ''Restoring the Light'' - Group 0: Can accept the quest if not in area ''Socrethar''s Seat'''),
(20,0,10021,0,0,23,0,3742,0,0,1,0,0,'Quest ''Restoring the Light'' - Group 0: Show quest mark if not in area ''Socrethar''s Seat'''),

(19,0,10420,0,0,23,0,3742,0,0,1,0,0,'Quest ''A Cleansing Light'' - Group 0: Can accept the quest if not in area ''Socrethar''s Seat'''),
(20,0,10420,0,0,23,0,3742,0,0,1,0,0,'Quest ''A Cleansing Light'' - Group 0: Show quest mark if not in area ''Socrethar''s Seat'''),

(19,0,10421,0,0,23,0,3742,0,0,1,0,0,'Quest ''Fel Armaments'' - Group 0: Can accept the quest if not in area ''Socrethar''s Seat'''),
(20,0,10421,0,0,23,0,3742,0,0,1,0,0,'Quest ''Fel Armaments'' - Group 0: Show quest mark if not in area ''Socrethar''s Seat'''),

(19,0,10554,0,0,23,0,3742,0,0,1,0,0,'Quest ''Ishanah'' - Group 0: Can accept the quest if not in area ''Socrethar''s Seat'''),
(20,0,10554,0,0,23,0,3742,0,0,1,0,0,'Quest ''Ishanah'' - Group 0: Show quest mark if not in area ''Socrethar''s Seat'''),

(13,1,35598,0,0,31,0,3,18538,0,0,0,0,'Spell ''Wrath of Socrethar'' - Group 0: Implicit target creature ''Ishanah'''),
(13,1,35599,0,0,31,0,3,18538,0,0,0,0,'Spell ''Resurrection'' - Group 0: Implicit target creature ''Ishanah'''),
(13,1,35600,0,0,31,0,3,20794,0,0,0,0,'Spell ''Wrath of Socrethar'' - Group 0: Implicit target creature ''Kaylaan the Lost''');
