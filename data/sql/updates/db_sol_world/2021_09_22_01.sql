-- DB update 2021_09_22_00 -> 2021_09_22_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_22_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_22_00 2021_09_22_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1632306529411085679'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1632306529411085679');

DELETE FROM `creature` WHERE `guid` IN (84864,3008889,3008890,3008891,3008892,3008893,3008894,3008895,3008896,3008897,3008898);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(84864,14867,530,0,0,1,1,0,0,-2310.31,5212.88,-9.98761,1.64769,120,0,1,0,0,0,0,0,0),
(3008889,14867,530,0,0,1,1,0,0,-2244.59,5248.61,-9.97494,4.80106,120,0,1,0,0,0,0,0,0),
(3008890,14867,530,0,0,1,1,0,0,-2273.03,5193.63,-9.38084,5.31157,120,0,1,0,0,0,0,0,0),
(3008891,14867,530,0,0,1,1,0,0,-2271.15,5291.57,-9.92492,2.83757,120,0,1,0,0,0,0,0,0),
(3008892,14867,0,0,0,1,1,0,0,-9528.81,66.6172,58.928,1.29075,120,0,1,0,0,0,0,0,0),
(3008893,14867,0,0,0,1,1,0,0,-9596.71,71.2999,62.5665,0.0812239,120,0,1,0,0,0,0,0,0),
(3008894,14867,0,0,0,1,1,0,0,-9609.46,26.2825,62.3034,3.70034,120,0,1,0,0,0,0,0,0),
(3008895,14867,0,0,0,1,1,0,0,-9562.9,-10.1839,62.1654,0.303491,120,0,1,0,0,0,0,0,0),
(3008896,14867,1,0,0,1,1,0,0,-1562.41,204.512,-2.97095,4.63997,120,0,1,0,0,0,0,0,0),
(3008897,14867,1,0,0,1,1,0,0,-1447.43,130.59,-3.45895,4.85596,120,0,1,0,0,0,0,0,0),
(3008898,14867,1,0,0,1,1,0,0,-1450.76,249.923,-2.52542,2.6804,120,0,1,0,0,0,0,0,0);

DELETE FROM `game_event_creature` WHERE `guid` IN (84864,137682);

DELETE FROM `pool_template` WHERE `entry` IN (203341,203342,203343);
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(203341,1,'Jubjub (1 out 4) Darkmoon Faire (Terokkar Forest)'),
(203342,1,'Jubjub (1 out 4) Darkmoon Faire (Elwynn Forest)'),
(203343,1,'Jubjub (1 out 4) Darkmoon Faire (Mulgore)');

DELETE FROM `game_event_pool` WHERE `pool_entry` IN (203341,203342,203343);
INSERT INTO `game_event_pool` (`eventEntry`, `pool_entry`)
VALUES
(3,203341),
(4,203342),
(5,203343);

DELETE FROM `pool_creature` WHERE `pool_entry` IN (203341,203342,203343);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(84864,203341,0,'Jubjub - Darkmoon Faire (Terokkar Forest) - Spawn 1'),
(3008889,203341,0,'Jubjub - Darkmoon Faire (Terokkar Forest) - Spawn 2'),
(3008890,203341,0,'Jubjub - Darkmoon Faire (Terokkar Forest) - Spawn 3'),
(3008891,203341,0,'Jubjub - Darkmoon Faire (Terokkar Forest) - Spawn 4'),
(3008892,203342,0,'Jubjub - Darkmoon Faire (Elwynn Forest) - Spawn 1'),
(3008893,203342,0,'Jubjub - Darkmoon Faire (Elwynn Forest) - Spawn 2'),
(3008894,203342,0,'Jubjub - Darkmoon Faire (Elwynn Forest) - Spawn 3'),
(3008895,203342,0,'Jubjub - Darkmoon Faire (Elwynn Forest) - Spawn 4'),
(137682,203343,0,'Jubjub - Darkmoon Faire (Mulgore) - Spawn 1'),
(3008896,203343,0,'Jubjub - Darkmoon Faire (Mulgore) - Spawn 2'),
(3008897,203343,0,'Jubjub - Darkmoon Faire (Mulgore) - Spawn 3'),
(3008898,203343,0,'Jubjub - Darkmoon Faire (Mulgore) - Spawn 4');

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = 23853;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
(23853,23852,0,'Jubling Cooldown');

DELETE FROM `npc_text` WHERE `ID` = 7401; -- The ID already exists but contained only empty texts and is not used anywhere
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `BroadcastTextID0`, `lang0`, `Probability0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `BroadcastTextID1`, `lang1`, `Probability1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `BroadcastTextID2`, `lang2`, `Probability2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `BroadcastTextID3`, `lang3`, `Probability3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `BroadcastTextID4`, `lang4`, `Probability4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `BroadcastTextID5`, `lang5`, `Probability5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `BroadcastTextID6`, `lang6`, `Probability6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `BroadcastTextID7`, `lang7`, `Probability7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`, `VerifiedBuild`)
VALUES
(7401,'','I''m so happy that Jubjub returned!  I only hope that I don''t run out of Dark Iron ale soon, or I fear my pet frog might once again escape!',10169,0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,0,0);

DELETE FROM `gossip_menu` WHERE `MenuID` = 6227;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(6227,7400),
(6227,7401);

DELETE FROM `creature_text` WHERE `CreatureId` IN (14871,14867,14878,15429);
DELETE FROM `creature_text` WHERE `GroupID` = 1 AND `CreatureId` IN (9545,9547,9554);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(14871,0,0,'Hi Jubjub.  I missed you!',12,0,100,0,0,0,10170,0,'Morja'),
(14871,1,0,'Jubjub?  Where are you, Jubjub?  Oh no!  Where did you go this time!',12,0,100,0,0,0,10171,0,'Morja'),
(14867,0,0,'%s guzzles down the ale!',16,0,100,0,0,0,10167,0,'Jubjub'),
(14878,0,0,'%s guzzles down the ale!',16,0,100,0,0,0,10167,0,'Jubling'),
(15429,0,0,'%s guzzles down the ale!',16,0,100,0,0,0,10167,0,'Disgusting Oozeling'),
(9545,1,0,'%s guzzles down the ale!',16,0,100,0,0,0,10167,0,'Grim Patron'),
(9547,1,0,'%s guzzles down the ale!',16,0,100,0,0,0,10167,0,'Guzzling Patron'),
(9554,1,0,'%s guzzles down the ale!',16,0,100,0,0,0,10167,0,'Hammered Patron');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (14871,14867,14878,15429);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (14871,14867,14878,15429);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 165578;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (954500,954700,955400,1542900,1487800,1486700);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(165578,1,0,0,63,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Ale TRAP - On Just Created - Set Phase 1'),
(165578,1,1,0,60,1,100,0,1000,5000,1000,5000,0,45,1,4,0,0,0,0,19,9545,5,0,0,0,0,0,0,'Dark Iron Ale TRAP - On Update - Set Data 1 4 (Grim Patron) (Phase 1)'),
(165578,1,2,0,60,1,100,0,1000,5000,1000,5000,0,45,1,4,0,0,0,0,19,9547,5,0,0,0,0,0,0,'Dark Iron Ale TRAP - On Update - Set Data 1 4 (Guzzling Patron) (Phase 1)'),
(165578,1,3,0,60,1,100,0,1000,5000,1000,5000,0,45,1,4,0,0,0,0,19,9554,5,0,0,0,0,0,0,'Dark Iron Ale TRAP - On Update - Set Data 1 4 (Hammered Patron) (Phase 1)'),
(165578,1,4,0,60,1,100,0,1000,5000,1000,5000,0,45,1,4,0,0,0,0,19,14867,20,0,0,0,0,0,0,'Dark Iron Ale TRAP - On Update - Set Data 1 4 (Jubjub) (Phase 1)'),
(165578,1,5,0,60,1,100,0,1000,5000,1000,5000,0,45,1,4,0,0,0,0,19,14878,20,0,0,0,0,0,0,'Dark Iron Ale TRAP - On Update - Set Data 1 4 (Jubling) (Phase 1)'),
(165578,1,6,0,60,1,100,0,1000,5000,1000,5000,0,45,1,4,0,0,0,0,19,15429,20,0,0,0,0,0,0,'Dark Iron Ale TRAP - On Update - Set Data 1 4 (Disgusting Oozeling) (Phase 1)'),
(165578,1,7,0,38,0,100,0,1,1,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dark Iron Ale TRAP - On Data Set 1 1 - Set Phase 2'),

(954500,9,0,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,20,165578,10,0,0,0,0,0,0,'Grim Patron - On Script - Delete GO ''Dark Iron Ale TRAP'''),
(954500,9,1,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grim Patron - On Script - Say Line 1'),
(954500,9,2,0,0,0,100,0,0,0,0,0,0,11,50631,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grim Patron - On Script - Cast ''Dark Iron Brewer Drinks'''),
(954500,9,3,0,0,0,100,0,2000,2000,0,0,0,11,50651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grim Patron - On Script - Cast ''Dark Iron Brewer is Swaggering'''),
(954500,9,4,0,0,0,100,0,7000,7000,0,0,0,28,50651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Grim Patron - On Script - Remove Aura ''Dark Iron Brewer is Swaggering'''),

(954700,9,0,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,20,165578,10,0,0,0,0,0,0,'Guzzling Patron - On Script - Delete GO ''Dark Iron Ale TRAP'''),
(954700,9,1,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guzzling Patron - On Script - Say Line 1'),
(954700,9,2,0,0,0,100,0,0,0,0,0,0,11,50631,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guzzling Patron - On Script - Cast ''Dark Iron Brewer Drinks'''),
(954700,9,3,0,0,0,100,0,2000,2000,0,0,0,11,50651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guzzling Patron - On Script - Cast ''Dark Iron Brewer is Swaggering'''),
(954700,9,4,0,0,0,100,0,7000,7000,0,0,0,28,50651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Guzzling Patron - On Script - Remove Aura ''Dark Iron Brewer is Swaggering'''),

(955400,9,0,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,20,165578,10,0,0,0,0,0,0,'Hammered Patron - On Script - Delete GO ''Dark Iron Ale TRAP'''),
(955400,9,1,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hammered Patron - On Script - Say Line 1'),
(955400,9,2,0,0,0,100,0,0,0,0,0,0,11,50631,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hammered Patron - On Script - Cast ''Dark Iron Brewer Drinks'''),
(955400,9,3,0,0,0,100,0,2000,2000,0,0,0,11,50651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hammered Patron - On Script - Cast ''Dark Iron Brewer is Swaggering'''),
(955400,9,4,0,0,0,100,0,7000,7000,0,0,0,28,50651,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hammered Patron - On Script - Remove Aura ''Dark Iron Brewer is Swaggering'''),

(15429,0,0,1,38,0,100,0,1,4,0,0,0,64,1,0,0,0,0,0,20,165578,25,0,0,0,0,0,0,'Disgusting Oozeling - On Data Set 1 4 - Store Target (Dark Iron Ale TRAP)'),
(15429,0,1,2,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,12,1,0,0,0,0,0,0,0,'Disgusting Oozeling - Linked - Set Data 1 1 (Stored Target)'),
(15429,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Disgusting Oozeling - Linked - Move To Position (Stored Target)'),
(15429,0,3,0,34,0,100,0,8,1,0,0,0,80,1542900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disgusting Oozeling - On Point 1 Reached - Call Timed Action List'),

(1542900,9,0,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Disgusting Oozeling - On Script - Delete GO (Stored Target)'),
(1542900,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disgusting Oozeling - On Script - Say Line 0'),
(1542900,9,2,0,0,0,100,0,2000,2000,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Disgusting Oozeling - On Script - Evade'),

(14878,0,0,1,38,0,100,0,1,4,0,0,0,64,1,0,0,0,0,0,20,165578,25,0,0,0,0,0,0,'Jubling - On Data Set 1 4 - Store Target (Dark Iron Ale TRAP)'),
(14878,0,1,2,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,12,1,0,0,0,0,0,0,0,'Jubling - Linked - Set Data 1 1 (Stored Target)'),
(14878,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Jubling - Linked - Move To Position (Stored Target)'),
(14878,0,3,0,34,0,100,0,8,1,0,0,0,80,1487800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jubling - On Point 1 Reached - Call Timed Action List'),

(1487800,9,0,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Jubling - On Script - Delete GO (Stored Target)'),
(1487800,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jubling - On Script - Say Line 0'),
(1487800,9,2,0,0,0,100,0,2000,2000,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jubling - On Script - Evade'),

(14871,0,0,0,11,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morja - On Respawn - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(14871,0,1,0,1,0,100,0,5000,5000,5000,5000,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morja - OOC - Add ''GOSSIP_OPTION_QUESTGIVER'''),
(14871,0,2,0,1,0,100,0,5000,5000,5000,5000,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morja - OOC - Remove ''GOSSIP_OPTION_QUESTGIVER'''),
(14871,0,3,4,38,0,100,0,1,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Morja - On Data Set 1 1 - Say Line 0'),
(14871,0,4,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,11,14867,5,0,0,0,0,0,0,'Morja - Linked - Set Data 1 1 (Jubjub)'),

(14867,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jubjub - On Respawn - Disable Event Phase Reset'),
(14867,0,1,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jubjub - Linked - Set Phase 1'),
(14867,0,2,3,38,1,100,0,1,4,0,0,0,64,1,0,0,0,0,0,20,165578,25,0,0,0,0,0,0,'Jubjub - On Data Set 1 4 - Store Target (Dark Iron Ale TRAP) (Phase 1)'),
(14867,0,3,4,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,12,1,0,0,0,0,0,0,0,'Jubjub - Linked - Set Data 1 1 (Stored Target)'),
(14867,0,4,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Jubjub - Linked - Move To Position (Stored Target)'),
(14867,0,5,6,34,0,100,0,8,1,0,0,0,41,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Jubjub - On Point 1 Reached - Delete GO (Stored Target)'),
(14867,0,6,7,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jubjub - Linked - Say Line 0'),
(14867,0,7,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,11,14871,5,0,0,0,0,0,0,'Jubjub - Linked - Set Data 1 1 (Morja)'),
(14867,0,8,0,38,0,100,0,1,1,0,0,0,80,1486700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jubjub - On Data Set 1 1 - Call Timed Action List'),

(1486700,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jubjub - On Script - Set Active On'),
(1486700,9,1,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jubjub - On Script - Set Phase 2'),
(1486700,9,2,0,0,0,100,0,110000,110000,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jubjub - On Script - Enable Random Movement'),
(1486700,9,3,0,0,0,100,0,10000,10000,0,0,0,1,1,0,0,0,0,0,11,14871,5,0,0,0,0,0,0,'Jubjub - On Script - Say Line 1 (Morja)'),
(1486700,9,4,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jubjub - On Script - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 14871;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 6227;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,2,14871,0,0,29,1,14867,5,0,0,0,0,'Morja - Execute SAI only if near ''Jubjub'''),
(22,3,14871,0,0,29,1,14867,5,0,1,0,0,'Morja - Execute SAI only if not near ''Jubjub'''),
(14,6227,7401,0,0,29,1,14867,5,0,0,0,0,'Morja - Show gossip text 7401 if near ''Jubjub'''),
(14,6227,7400,0,0,29,1,14867,5,0,1,0,0,'Morja - Show gossip text 7400 if not near ''Jubjub''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
