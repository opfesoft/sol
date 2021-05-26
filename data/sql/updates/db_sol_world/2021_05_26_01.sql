-- DB update 2021_05_26_00 -> 2021_05_26_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_26_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_26_00 2021_05_26_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1622064961356603406'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1622064961356603406');

UPDATE `creature_template` SET `faction` = 7 WHERE `entry` = 412;                                   -- Stitches: Set neutral monster faction
UPDATE `creature_template` SET `faction` = 53 WHERE `entry` IN (494,495,826,827,885,886,999,8310);  -- Watcher: Use faction 53 instead of 11
UPDATE `creature_template` SET `faction` = 56 WHERE `entry` IN (576,2142,11040);                    -- Watcher: Use faction 56 instead of 12
UPDATE `creature_template` SET `DamageModifier` = 4 WHERE `entry` IN (1203,1204);                   -- Watcher Sarys, Watcher Corwin: Increase damage

-- Remove UNIT_FLAG_IMMUNE_TO_NPC & CREATURE_FLAG_EXTRA_CIVILIAN (otherwise Stitches cannot attack them):
UPDATE `creature_template` SET `unit_flags` = `unit_flags` & ~512, `flags_extra` = `flags_extra` & ~2 WHERE `entry` IN (
264,    -- Commander Althea Ebonlocke
576,    -- Watcher Ladimore
888,    -- Watcher Dodds
2142,   -- Watcher Callahan
11040); -- Watcher Brownell

DELETE FROM `creature` WHERE `guid` IN (299999,300000,300001,300002,300003,300004,300005,300006,6127,6133);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(299999,1436,0,0,0,1,1,0,1,-10584.2,-1174.31,28.662,0,3600,0,1,0,0,0,0,0,0),      -- Watcher Cutford
(300000,412,0,0,0,1,1,0,0,-10290.2,72.7811,38.8811,4.8015,1,0,1,0,0,0,0,0,0),     -- Stitches
(300001,28987,0,0,0,1,1,0,1,-10895.8,-381.028,40.125,2.669,3600,0,1,0,0,0,0,0,0), -- Watcher Blomberg
(300002,1001,0,0,0,1,1,0,1,-10912,-388,40.632,0.812,3600,0,1,0,0,0,0,0,0),        -- Watcher Hutchins
(300003,1098,0,0,0,1,1,0,1,-10776.7,-975.54,56.4,1.915,3600,0,1,0,0,0,0,0,0),     -- Watcher Merant
(300004,1099,0,0,0,1,1,0,1,-10777.7,-975.9,56.09,1.915,3600,0,1,0,0,0,0,0,0),     -- Watcher Gelwin
(300005,1100,0,0,0,1,1,0,1,-10775.7,-975.187,56.72,1.915,3600,0,1,0,0,0,0,0,0),   -- Watcher Selkin
(300006,1101,0,0,0,1,1,0,1,-10778.6,-976.131,55.73,1.915,3600,0,1,0,0,0,0,0,0),   -- Watcher Thayer
(6127,1203,0,0,0,1,1,0,1,-10531.8,-1155.32,28.102,4.723,3600,0,1,0,0,0,0,0,0),    -- Watcher Sarys
(6133,1204,0,0,0,1,1,0,1,-10585.8,-1158.41,30.059,4.059,3600,0,1,0,0,0,0,0,0);    -- Watcher Corwin
/*
Remark concerning GUIDs 6127 & 6133:
- Previous creature ID was 10038 (Night Watch Guard, level 65)
- On retail those NPCs were spawned only if a Horde player attacks the town. They should not have a permanent spawn point.
*/

-- Update position / orientation for some of the Watchers
UPDATE `creature` SET `position_x` = -10558.4,`position_y` = -1242.58,`position_z` = 30.2119,`orientation` = 4.9233 WHERE `guid` = 4180;   -- Watcher Jan
UPDATE `creature` SET `position_x` = -10629.4,`position_y` = -1156.63,`position_z` = 26.0944,`orientation` = 3.6647 WHERE `guid` = 4244;   -- Watcher Mocarski
UPDATE `creature` SET `position_x` = -10552.771,`position_y` = -1235.21,`position_z` = 28.572,`orientation` = 4.24204 WHERE `guid` = 4247; -- Watcher Petras
UPDATE `creature` SET `position_x` = -10583.7,`position_y` = -1184.22,`position_z` = 27.2057,`orientation` = 2.8019 WHERE `guid` = 5960;   -- Watcher Frazier
UPDATE `creature` SET `position_x` = -10611.14,`position_y` = -1181.46,`position_z` = 28.446,`orientation` = 3.43 WHERE `guid` = 5941;     -- Watcher Jordan
UPDATE `creature` SET `orientation` = 4.09 WHERE `guid` = 4181;                                                                            -- Watcher Keller

-- Watcher Petras: Enable WP movement
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 4247;
UPDATE `creature_addon` SET `path_id` = 42470 WHERE `guid` = 4247;

DELETE FROM `creature_addon` WHERE `guid` IN (299999,300000,300001,300002,300003,300004,300005,300006,6127,6133);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(299999,0,0,0,0,0,0,NULL),
(300000,0,0,0,0,0,1,NULL),
(300001,0,0,0,4097,0,0,NULL),
(300002,0,0,0,4097,0,0,NULL),
(300003,0,0,0,4097,0,0,NULL),
(300004,0,0,0,4097,0,0,NULL),
(300005,0,0,0,4097,0,0,NULL),
(300006,0,0,0,4097,0,0,NULL),
(6127,0,0,0,4097,0,0,NULL),
(6133,0,0,0,4097,0,0,NULL);

-- SAI
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (264,468,1436,499,1001,28987,1098,1099,1100,1101,2470,888,1203,1204,887,840);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (412,263,264,468,1436,499,1001,28987,1098,1099,1100,1101,2470,888,1203,1204,887,840);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (41200,49900,26300,26301,26400,88800,247000,143600);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(412,0,0,0,0,0,100,0,6900,12100,3500,11300,0,11,3106,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Stitches - IC - Cast ''Aura of Rot'''),
(412,0,1,2,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stitches - On Respawn - Set Active On'),
(412,0,2,0,61,0,100,0,0,0,0,0,0,53,0,412,0,0,0,2,1,0,0,0,0,0,0,0,0,'Stitches - Linked - Start WP Movement'),
(412,0,3,4,40,0,100,0,50,412,0,0,0,2,93,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stitches - On WP 50 Reached - Set Faction 93'),
(412,0,4,5,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,10,4185,468,1,0,0,0,0,0,'Stitches - Linked - Say Line 0 (Town Crier)'),
(412,0,5,6,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,5938,499,1,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Paige)'),
(412,0,6,7,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,5937,888,1,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Dodds)'),
(412,0,7,8,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,300002,1001,1,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Hutchins)'),
(412,0,8,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,300001,28987,1,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Blomberg)'),
(412,0,9,10,40,0,100,0,73,412,0,0,0,1,1,0,0,0,0,0,10,4185,468,1,0,0,0,0,0,'Stitches - On WP 73 Reached - Say Line 1 (Town Crier)'),
(412,0,10,11,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,300003,1098,1,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Merant)'),
(412,0,11,12,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,300004,1099,1,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Gelwin)'),
(412,0,12,13,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,300006,1101,1,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Thayer)'),
(412,0,13,14,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,300005,1100,1,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Selkin)'),
(412,0,14,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,1436,0,0,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Cutford)'),
(412,0,15,16,40,0,100,0,107,412,0,0,0,1,2,0,0,0,0,0,10,4185,468,1,0,0,0,0,0,'Stitches - On WP 107 Reached - Say Line 2 (Town Crier)'),
(412,0,16,17,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,5960,2470,1,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Frazier)'),
(412,0,17,18,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,6133,1204,1,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Corwin)'),
(412,0,18,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,6127,1203,1,0,0,0,0,0,'Stitches - Linked - Set Data 1 1 (Watcher Sarys)'),
(412,0,19,0,40,0,100,0,136,412,0,0,0,1,3,0,0,0,0,0,10,4185,468,1,0,0,0,0,0,'Stitches - On WP 136 Reached - Say Line 3 (Town Crier)'),
(412,0,20,21,6,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stitches - On Death - Set Active On'),
(412,0,21,0,61,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,10,4185,468,1,0,0,0,0,0,'Stitches - Linked - Say Line 4 (Town Crier)'),
(412,0,22,0,36,0,100,0,0,0,0,0,0,111,85,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stitches - On Corpse Removed - Stop Game Event 85'),
(412,0,23,0,58,0,100,0,0,412,0,0,0,80,41200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stitches - On WP Path Ended - Call Timed Action List'),
(412,0,24,0,1,0,100,0,80000,90000,90000,120000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stitches - OOC - Say Line 0'),

(41200,9,0,0,0,0,100,0,60000,60000,0,0,0,111,85,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stitches - On Script - Stop Game Event 85'),

-- Night Watch Camp NPCs
(499,0,0,0,11,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Paige - On Respawn - Set Emote State ''ONESHOT_NONE'''),
(499,0,1,2,38,0,100,0,1,1,0,0,0,53,1,499,0,0,0,2,1,0,0,0,0,0,0,0,0,'Watcher Paige - On Data Set 1 1 - Start WP Movement'),
(499,0,2,0,61,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Paige - Linked - Set Emote State ''STATE_READY1H'''),
(499,0,3,0,69,0,100,0,85,0,0,0,0,80,49900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Paige - On Game Event 85 Ended - Call Timed Action List'),

(49900,9,0,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Paige - On Script - Set Emote State ''ONESHOT_NONE'''),
(49900,9,1,0,0,0,100,0,0,0,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Paige - On Script - Reset Home Position'),
(49900,9,2,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Paige - On Script - Evade'),

(888,0,0,0,11,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Dodds - On Respawn - Set Emote State ''ONESHOT_NONE'''),
(888,0,1,0,25,0,100,0,0,0,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Dodds - On Reset - Add NPC Flags ''Gossip'' & ''Quest Giver'''),
(888,0,2,3,38,0,100,0,1,1,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Dodds - On Data Set 1 1 - Remove NPC Flags ''Gossip'' & ''Quest Giver'''),
(888,0,3,4,61,0,100,0,0,0,0,0,0,53,1,888,0,0,0,2,1,0,0,0,0,0,0,0,0,'Watcher Dodds - Linked - Start WP Movement'),
(888,0,4,0,61,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Dodds - Linked - Set Emote State ''STATE_READY1H'''),
(888,0,5,0,69,0,100,0,85,0,0,0,0,80,88800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Dodds - On Game Event 85 Ended - Call Timed Action List'),

(88800,9,0,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Dodds - On Script - Set Emote State ''ONESHOT_NONE'''),
(88800,9,1,0,0,0,100,0,0,0,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Dodds - On Script - Reset Home Position'),
(88800,9,2,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Dodds - On Script - Evade'),

(1001,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Hutchins - On Respawn - Set Active On'),
(1001,0,1,0,61,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Hutchins - Linked - Set Emote State ''ONESHOT_NONE'''),
(1001,0,2,3,38,0,100,0,1,1,0,0,0,53,1,1001,0,0,0,2,1,0,0,0,0,0,0,0,0,'Watcher Hutchins - On Data Set 1 1 - Start WP Movement'),
(1001,0,3,0,61,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Hutchins - Linked - Set Emote State ''STATE_READY1H'''),

(28987,0,0,0,11,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Blomberg - On Respawn - Set Emote State ''ONESHOT_NONE'''),
(28987,0,1,2,38,0,100,0,1,1,0,0,0,53,1,28987,0,0,0,2,1,0,0,0,0,0,0,0,0,'Watcher Blomberg - On Data Set 1 1 - Start WP Movement'),
(28987,0,2,0,61,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Blomberg - Linked - Set Emote State ''STATE_READY1H'''),

-- The Rotting Orchard Crossroads NPCs
(1098,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Merant - On Respawn - Set Active On'),
(1098,0,1,0,61,0,100,0,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Merant - Linked - Set Visibility Off'),
(1098,0,2,3,38,0,100,0,1,1,0,0,0,53,1,1098,0,0,0,2,1,0,0,0,0,0,0,0,0,'Watcher Merant - On Data Set 1 1 - Start WP Movement'),
(1098,0,3,4,61,0,100,0,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Merant - Linked - Set Visibility On'),
(1098,0,4,0,61,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Merant - Linked - Set Emote State ''STATE_READY1H'''),

(1099,0,0,0,11,0,100,0,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Gelwin - On Respawn - Set Visibility Off'),
(1099,0,1,2,38,0,100,0,1,1,0,0,0,53,1,1099,0,0,0,2,1,0,0,0,0,0,0,0,0,'Watcher Gelwin - On Data Set 1 1 - Start WP Movement'),
(1099,0,2,3,61,0,100,0,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Gelwin - Linked - Set Visibility On'),
(1099,0,3,0,61,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Gelwin - Linked - Set Emote State ''STATE_READY1H'''),

(1100,0,0,0,11,0,100,0,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Selkin - On Respawn - Set Visibility Off'),
(1100,0,1,2,38,0,100,0,1,1,0,0,0,53,1,1100,0,0,0,2,1,0,0,0,0,0,0,0,0,'Watcher Selkin - On Data Set 1 1 - Start WP Movement'),
(1100,0,2,3,61,0,100,0,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Selkin - Linked - Set Visibility On'),
(1100,0,3,0,61,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Selkin - Linked - Set Emote State ''STATE_READY1H'''),

(1101,0,0,0,11,0,100,0,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Thayer - On Respawn - Set Visibility Off'),
(1101,0,1,2,38,0,100,0,1,1,0,0,0,53,1,1101,0,0,0,2,1,0,0,0,0,0,0,0,0,'Watcher Thayer - On Data Set 1 1 - Start WP Movement'),
(1101,0,2,3,61,0,100,0,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Thayer - Linked - Set Visibility On'),
(1101,0,3,0,61,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Thayer - Linked - Set Emote State ''STATE_READY1H'''),

-- Darkshire NPCs
(263,0,0,0,25,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Reset - Set Event Phase 1'),
(263,0,1,0,1,1,100,0,20000,30000,110000,130000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - OOC - Say Line 0 (Phase 1)'),
(263,0,2,3,20,0,100,0,252,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Quest ''Translation to Ello'' Finished - Store Target (Invoker)'),
(263,0,3,0,61,0,100,0,0,0,0,0,0,112,85,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - Linked - Start Game Event 85'),
(263,0,4,0,38,0,100,0,1,1,0,0,0,80,26300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Data Set 1 1 - Call Timed Action List'),
(263,0,5,6,68,0,100,0,85,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Game Event 85 Started - Set Active On'),
(263,0,6,0,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - Linked - Set Event Phase 0'),
(263,0,7,8,69,0,100,0,85,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Game Event 85 Ended - Set Active Off'),
(263,0,8,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - Linked - Set Event Phase 1'),

(26300,9,0,0,0,0,100,0,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Script - Remove NPC Flag ''Quest Giver'''),
(26300,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,1436,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Script - Set Orientation (Watcher Cutford)'),
(26300,9,2,0,0,0,100,0,1000,1000,0,0,0,1,1,0,0,0,0,0,19,1436,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Script - Say Line 1 (Watcher Cutford)'),
(26300,9,3,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,19,1436,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Script - Say Line 2 (Watcher Cutford)'),
(26300,9,4,0,0,0,100,0,6000,6000,0,0,0,1,3,0,0,0,0,0,19,1436,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Script - Say Line 3 (Watcher Cutford)'),
(26300,9,5,0,0,0,100,0,5000,5000,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Script - Say Line 1'),
(26300,9,6,0,0,0,100,0,6000,6000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Script - Say Line 2'),
(26300,9,7,0,0,0,100,0,7000,7000,0,0,0,1,4,0,0,0,0,0,19,1436,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Script - Say Line 4 (Watcher Cutford)'),
(26300,9,8,0,0,0,100,0,3000,3000,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Script - Reset Orientation'),
(26300,9,9,0,0,0,100,0,1000,1000,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lord Ello Ebonlocke - On Script - Add NPC Flag ''Quest Giver'''),

(264,0,0,0,25,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Reset - Set Event Phase 1'),
(264,0,1,0,1,1,100,0,1000,15000,150000,180000,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - OOC - Say Line 0 (Phase 1)'),
(264,0,2,0,38,0,100,0,1,1,0,0,0,80,26400,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Data Set 1 1 - Call Timed Action List'),
(264,0,3,4,38,0,100,0,1,2,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Data Set 1 2 - Say Line 2'),
(264,0,4,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,10,300000,412,1,0,0,0,0,0,'Commander Althea Ebonlocke - Linked - Start Attack (Stitches)'),
(264,0,5,6,68,0,100,0,85,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Game Event 85 Started - Set Active On'),
(264,0,6,0,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - Linked - Set Event Phase 0'),
(264,0,7,8,69,0,100,0,85,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Game Event 85 Ended - Set Active Off'),
(264,0,8,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - Linked - Set Event Phase 1'),

(26400,9,0,0,0,0,100,0,0,0,0,0,0,83,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Script - Remove NPC Flags ''Gossip'' & ''Quest Giver'''),
(26400,9,1,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,19,1436,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Script - Set Orientation (Watcher Cutford)'),
(26400,9,2,0,0,0,100,0,1000,1000,0,0,0,1,5,0,0,0,0,0,19,1436,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Script - Say Line 5 (Watcher Cutford)'),
(26400,9,3,0,0,0,100,0,8000,8000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Script - Say Line 1'),
(26400,9,4,0,0,0,100,0,8000,8000,0,0,0,1,6,0,0,0,0,0,19,1436,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Script - Say Line 6 (Watcher Cutford)'),
(26400,9,5,0,0,0,100,0,6000,6000,0,0,0,1,0,0,0,0,0,0,19,1436,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Script - Say Line 0 (Watcher Cutford)'),
(26400,9,6,0,0,0,100,0,0,0,0,0,0,66,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Script - Reset Orientation'),
(26400,9,7,0,0,0,100,0,1000,1000,0,0,0,82,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Commander Althea Ebonlocke - On Script - Add NPC Flags ''Gossip'' & ''Quest Giver'''),

(1436,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - On Respawn - Set Active On'),
(1436,0,1,0,61,0,100,0,0,0,0,0,0,53,1,1436,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - Linked - Start WP Movement'),
(1436,0,2,0,40,0,100,0,1,1436,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - On WP 1 Reached - Say Line 0'),
(1436,0,3,4,40,0,100,0,14,1436,0,0,0,54,34000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - On WP 14 Reached - Pause WP Movement'),
(1436,0,4,5,61,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,19,263,0,0,0,0,0,0,0,'Watcher Cutford - Linked - Set Orientation (Lord Ello Ebonlocke)'),
(1436,0,5,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,263,0,0,0,0,0,0,0,'Watcher Cutford - Linked - Set Data 1 1 (Lord Ello Ebonlocke)'),
(1436,0,6,7,40,0,100,0,25,1436,0,0,0,54,21000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - On WP 25 Reached - Pause WP Movement'),
(1436,0,7,8,61,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,19,264,0,0,0,0,0,0,0,'Watcher Cutford - Linked - Set Orientation (Commander Althea Ebonlocke)'),
(1436,0,8,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,264,0,0,0,0,0,0,0,'Watcher Cutford - Linked - Set Data 1 1 (Commander Althea Ebonlocke)'),
(1436,0,9,0,40,0,100,0,26,1436,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - On WP 26 Reached - Ready Melee Weapon'),
(1436,0,10,0,69,0,100,0,85,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - On Game Event 85 Ended - Force Despawn'),
(1436,0,11,0,40,0,100,0,53,1436,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - On WP 53 Reached - Say Line 7'),
(1436,0,12,0,40,0,100,0,85,1436,0,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - On WP 85 Reached - Say Line 7'),
(1436,0,13,0,40,0,100,0,92,1436,0,0,0,66,1,0,0,0,0,0,8,0,0,0,0,0,0,0,0,'Watcher Cutford - On WP 92 Reached - Set Orientation'),
(1436,0,14,0,38,0,100,0,1,1,0,0,0,80,143600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - On Data Set 1 1 - Call Timed Action List'),

(143600,9,0,0,0,0,100,0,0,0,0,0,0,41,4000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - On Script - Force Despawn'),
(143600,9,1,0,0,0,100,0,0,0,0,0,0,11,8218,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Cutford - On Script - Cast Spell ''Sneak'''),
(143600,9,2,0,0,0,100,0,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,-10912.1,-391.524,41.0131,0,'Watcher Cutford - On Script - Move To Position'),

(468,0,0,0,68,0,100,0,85,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Town Crier - On Game Event 85 Started - Set Active On'),
(468,0,1,0,69,0,100,0,85,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Town Crier - On Game Event 85 Ended - Set Active Off'),

(2470,0,0,0,11,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Frazier - On Respawn - Set Emote State ''ONESHOT_NONE'''),
(2470,0,1,2,38,0,100,0,1,1,0,0,0,53,1,2470,0,0,0,2,1,0,0,0,0,0,0,0,0,'Watcher Frazier - On Data Set 1 1 - Start WP Movement'),
(2470,0,2,0,61,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Frazier - Linked - Set Emote State ''STATE_READY1H'''),
(2470,0,3,0,69,0,100,0,85,0,0,0,0,80,247000,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Frazier - On Game Event 85 Ended - Call Timed Action List'),

(247000,9,0,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Frazier - On Script - Set Emote State ''ONESHOT_NONE'''),
(247000,9,1,0,0,0,100,0,0,0,0,0,0,101,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Frazier - On Script - Reset Home Position'),
(247000,9,2,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Frazier - On Script - Evade'),

(1204,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Corwin - On Respawn - Set Active On'),
(1204,0,1,2,61,0,100,0,0,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,-10290.2,72.7811,0,0,'Watcher Corwin - Linked - Load Grid (Stitches Position)'),
(1204,0,2,3,61,0,100,0,0,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,-10895.8,-381.028,0,0,'Watcher Corwin - Linked - Load Grid (Watcher Blomberg Position)'),
(1204,0,3,4,61,0,100,0,0,0,0,0,0,215,0,0,0,0,0,0,8,0,0,0,0,-10776.7,-975.54,0,0,'Watcher Corwin - Linked - Load Grid (Watcher Merant Position)'),
(1204,0,4,0,61,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Corwin - Linked - Set Emote State ''ONESHOT_NONE'''),
(1204,0,5,6,38,0,100,0,1,1,0,0,0,53,1,1204,0,0,0,2,1,0,0,0,0,0,0,0,0,'Watcher Corwin - On Data Set 1 1 - Start WP Movement'),
(1204,0,6,0,61,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Corwin - Linked - Set Emote State ''STATE_READY1H'''),

(1203,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Sarys - On Respawn - Set Active On'),
(1203,0,1,0,61,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Sarys - Linked - Set Emote State ''ONESHOT_NONE'''),
(1203,0,2,3,38,0,100,0,1,1,0,0,0,53,1,1203,0,0,0,2,1,0,0,0,0,0,0,0,0,'Watcher Sarys - On Data Set 1 1 - Start WP Movement'),
(1203,0,3,0,61,0,100,0,0,0,0,0,0,17,333,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Sarys - Linked - Set Emote State ''STATE_READY1H'''),
(1203,0,4,0,4,0,100,0,0,0,0,0,0,45,1,2,0,0,0,0,10,4194,264,1,0,0,0,0,0,'Watcher Sarys - On Aggro - Set Data 1 2 (Commander Althea Ebonlocke)'),

(887,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Jordan - On Respawn - Set Active On'),

(840,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Watcher Backus - On Respawn - Set Active On');

DELETE FROM `creature_text` WHERE `CreatureID` IN (412,468,1436);
DELETE FROM `creature_text` WHERE `CreatureID` IN (263,264) AND `GroupID` > 0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(412,0,0,'ROARRRRR!!',14,0,100,0,0,0,278,2,'Stitches'),
(412,0,1,'DARKSHIRE... I HUNGER!!',14,0,100,0,0,0,277,2,'Stitches'),

(468,0,0,'Rouse and to arms, citizens of Darkshire! An abomination of the undead approaches along the road!',14,7,100,22,0,0,89,2,'Town Crier'),
(468,1,0,'The abomination has overrun the Night Watch camp! Quickly, we must intercept it before it reaches town!',14,7,100,22,0,0,90,2,'Town Crier'),
(468,2,0,'It isn''t enough! Defenders, gather in the center of town. Together we will stand against the undead monster!',14,7,100,22,0,0,91,2,'Town Crier'),
(468,3,0,'The abomination has come! Forward!',14,7,100,22,0,0,92,2,'Town Crier'),
(468,4,0,'The beast is slain! All''s well in Darkshire!',14,7,100,22,0,0,93,2,'Town Crier'),

(263,1,0,'This is grim news, and I fear it is linked to the dealings $n had with the Embalmer.',12,7,100,1,0,0,270,0,'Lord Ello Ebonlocke'),
(263,2,0,'Watcher, inform Althea that a dire threat is marshalling against our town.  We must prepare!',12,7,100,25,0,0,271,0,'Lord Ello Ebonlocke'),

(264,1,0,'This doesn''t bode well.  Send scouts to gather more intelligence, and stay on alert.',12,7,100,1,0,0,273,0,'Commander Althea'),
(264,2,0,'It''ll take more than a rotting corpse to stop us!',12,7,100,1,0,0,107,0,'Commander Althea'),

(1436,0,0,'Make Way!  Make Way!',14,7,100,0,0,0,549,1,'Watcher Cutford'),
(1436,1,0,'Lord Mayor!  Our scouts report strange activity to the west.',12,7,100,5,0,0,265,0,'Watcher Cutford'),
(1436,1,1,'Mayor Ello!  Our graveyard scouts return with ominous reports...',12,7,100,5,0,0,266,0,'Watcher Cutford'),
(1436,2,0,'Hideous bellows and growls are heard coming from that old hermit''s shack!',12,7,100,1,0,0,267,0,'Watcher Cutford'),
(1436,3,0,'Wolves head this way, as if fleeing from... something.',12,7,100,1,0,0,268,0,'Watcher Cutford'),
(1436,4,0,'Yes, Lord Mayor.',12,7,100,66,0,0,269,0,'Watcher Cutford'),
(1436,5,0,'Althea, there are reports of strange happenings at the graveyard.  Ello believes it portends an attack on Darkshire.',12,7,100,1,0,0,272,0,'Watcher Cutford'),
(1436,6,0,'Yes, commander!',12,7,100,66,0,0,275,0,'Watcher Cutford'),
(1436,7,0,'Beware!  Beware!  A threat lurks in the wild!  Night Watchers, be on the alert!',14,7,100,0,0,0,276,2,'Watcher Cutford');

DELETE FROM `game_event` WHERE `eventEntry` = 85;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `holidayStage`, `description`, `world_event`, `announce`)
VALUES
(85,'2000-01-01 08:00:00','2000-01-01 08:00:00',5184000,60,0,0,'Stitches attacks Darkshire',0,2);

DELETE FROM `game_event_creature` WHERE `eventEntry` IN (85,-85);
INSERT INTO `game_event_creature` (`eventEntry`, `guid`)
VALUES
(85,6127),
(85,6133),
(85,299999),
(85,300000),
(85,300001),
(85,300002),
(85,300003),
(85,300004),
(85,300005),
(85,300006),
(-85,5941);

DELETE FROM `waypoint_data` WHERE `id` IN (59410,42470,42300,42110);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
-- Watcher Jordan
(59410,1,-10611.1,-1181.46,28.446,0,0,0,0,100,0),
(59410,2,-10623,-1184.54,28.819,0,0,0,0,100,0),
(59410,3,-10633.9,-1187.7,28.9248,0,0,0,0,100,0),
(59410,4,-10641.6,-1189.92,28.5594,0,0,0,0,100,0),
(59410,5,-10652.6,-1191.57,28.4971,0,0,0,0,100,0),
(59410,6,-10662.5,-1193.06,28.2884,0,0,0,0,100,0),
(59410,7,-10672.7,-1191.72,27.7145,0,0,0,0,100,0),
(59410,8,-10682.3,-1190.45,27.2793,0,0,0,0,100,0),
(59410,9,-10691.1,-1186.17,27.199,0,0,0,0,100,0),
(59410,10,-10705.3,-1179.29,26.3723,0,0,0,0,100,0),
(59410,11,-10717.1,-1171.61,26.5824,0,0,0,0,100,0),
(59410,12,-10730.5,-1162.9,26.9042,0,0,0,0,100,0),
(59410,13,-10738,-1158.02,26.4475,0,0,0,0,100,0),
(59410,14,-10751.5,-1147.98,26.8572,0,0,0,0,100,0),
(59410,15,-10763.6,-1138.91,27.0977,0,0,0,0,100,0),
(59410,16,-10772.2,-1126.03,28.5148,0,0,0,0,100,0),
(59410,17,-10781.2,-1112.66,30.3863,0,0,0,0,100,0),
(59410,18,-10783.3,-1095.07,33.6488,0,0,0,0,100,0),
(59410,19,-10787.8,-1074.49,37.7652,0,0,0,0,100,0),
(59410,20,-10789.5,-1067.8,39.138,0,0,0,0,100,0),
(59410,21,-10787.8,-1074.49,37.7652,0,0,0,0,100,0),
(59410,22,-10783.3,-1095.07,33.6488,0,0,0,0,100,0),
(59410,23,-10781.2,-1112.66,30.3863,0,0,0,0,100,0),
(59410,24,-10772.2,-1126.03,28.5148,0,0,0,0,100,0),
(59410,25,-10763.6,-1138.91,27.0977,0,0,0,0,100,0),
(59410,26,-10751.5,-1147.98,26.8572,0,0,0,0,100,0),
(59410,27,-10738,-1158.02,26.4475,0,0,0,0,100,0),
(59410,28,-10730.5,-1162.9,26.9042,0,0,0,0,100,0),
(59410,29,-10717.1,-1171.61,26.5824,0,0,0,0,100,0),
(59410,30,-10705.3,-1179.29,26.3723,0,0,0,0,100,0),
(59410,31,-10691.1,-1186.17,27.199,0,0,0,0,100,0),
(59410,32,-10682.3,-1190.45,27.2793,0,0,0,0,100,0),
(59410,33,-10672.7,-1191.72,27.7145,0,0,0,0,100,0),
(59410,34,-10662.5,-1193.06,28.2884,0,0,0,0,100,0),
(59410,35,-10652.6,-1191.57,28.4971,0,0,0,0,100,0),
(59410,36,-10641.6,-1189.92,28.5594,0,0,0,0,100,0),
(59410,37,-10633.9,-1187.7,28.9248,0,0,0,0,100,0),
(59410,38,-10623,-1184.54,28.819,0,0,0,0,100,0),
-- Watcher Petras
(42470,1,-10552.8,-1235.21,28.572,0,0,0,0,100,0),
(42470,2,-10551,-1259.55,33.033,0,0,0,0,100,0),
(42470,3,-10547.2,-1270.14,34.751,0,0,0,0,100,0),
(42470,4,-10537.1,-1278.2,37.51,0,0,0,0,100,0),
(42470,5,-10532.4,-1282.53,38.812,0,0,0,0,100,0),
(42470,6,-10531,-1285.52,39.327,0,0,0,0,100,0),
(42470,7,-10532,-1303.83,41.6253,0,0,0,0,100,0),
(42470,8,-10541.8,-1327.91,45.989,0,0,0,0,100,0),
(42470,9,-10532,-1303.83,41.6253,0,0,0,0,100,0),
(42470,10,-10531,-1285.52,39.327,0,0,0,0,100,0),
(42470,11,-10532.4,-1282.53,38.812,0,0,0,0,100,0),
(42470,12,-10537.1,-1278.2,37.51,0,0,0,0,100,0),
(42470,13,-10547.2,-1270.14,34.751,0,0,0,0,100,0),
(42470,14,-10551,-1259.55,33.033,0,0,0,0,100,0),
-- Watcher Backus
(42300,1,-10320.5,-1125.69,21.69,0,0,0,0,100,0),
(42300,2,-10311.7,-1135.86,22.1581,0,0,0,0,100,0),
(42300,3,-10301.8,-1147.21,22.7721,0,0,0,0,100,0),
(42300,4,-10311.7,-1135.86,22.1581,0,0,0,0,100,0),
(42300,5,-10325.6,-1125.19,21.7355,0,0,0,0,100,0),
(42300,6,-10335.7,-1121.47,21.6755,0,0,0,0,100,0),
(42300,7,-10351.3,-1116.63,21.4411,0,0,0,0,100,0),
(42300,8,-10371.7,-1115.97,21.1268,0,0,0,0,100,0),
(42300,9,-10386.6,-1115.48,21.9835,0,0,0,0,100,0),
(42300,10,-10396.4,-1120.41,22.5156,0,0,0,0,100,0),
(42300,11,-10407.2,-1125.88,23.0746,0,0,0,0,100,0),
(42300,12,-10419.4,-1145.39,25.8,0,0,0,0,100,0),
(42300,13,-10427.5,-1158.15,27.155,0,0,0,0,100,0),
(42300,14,-10436.8,-1165.43,27.917,0,0,0,0,100,0),
(42300,15,-10444.6,-1171.5,27.8846,0,0,0,0,100,0),
(42300,16,-10460.6,-1179.07,27.5147,0,0,0,0,100,0),
(42300,17,-10474.8,-1181.09,27.6579,0,0,0,0,100,0),
(42300,18,-10487.6,-1182.9,27.7035,0,0,0,0,100,0),
(42300,19,-10504.4,-1185.29,28.114,0,0,0,0,100,0),
(42300,20,-10513.9,-1186.64,28.1049,0,0,0,0,100,0),
(42300,21,-10507.1,-1185.92,28.184,0,0,0,0,100,0),
(42300,22,-10497.3,-1184.89,27.9228,0,0,0,0,100,0),
(42300,23,-10481.8,-1183.25,27.7043,0,0,0,0,100,0),
(42300,24,-10468.1,-1181.8,27.6681,0,0,0,0,100,0),
(42300,25,-10449.9,-1173.75,27.8627,0,0,0,0,100,0),
(42300,26,-10435.8,-1167.49,27.911,0,0,0,0,100,0),
(42300,27,-10431,-1161.61,27.5817,0,0,0,0,100,0),
(42300,28,-10426.4,-1155.93,26.9116,0,0,0,0,100,0),
(42300,29,-10420,-1146.01,25.8935,0,0,0,0,100,0),
(42300,30,-10412.3,-1133.93,23.7468,0,0,0,0,100,0),
(42300,31,-10406.2,-1124.49,22.9748,0,0,0,0,100,0),
(42300,32,-10398.6,-1121.21,22.6173,0,0,0,0,100,0),
(42300,33,-10388.2,-1116.7,22.1216,0,0,0,0,100,0),
(42300,34,-10378.8,-1115.91,21.2811,0,0,0,0,100,0),
(42300,35,-10365.9,-1114.85,21.0819,0,0,0,0,100,0),
(42300,36,-10354,-1115.68,21.3907,0,0,0,0,100,0),
(42300,37,-10337.9,-1120.49,21.6016,0,0,0,0,100,0),
-- Watcher Ladimore
(42110,1,-10581.6,-1172.89,28.4936,0,0,0,0,100,0),
(42110,2,-10581.6,-1178.96,28.4466,0,0,0,0,100,0),
(42110,3,-10573.6,-1185.8,27.9936,0,0,0,0,100,0),
(42110,4,-10570,-1191.73,27.8686,0,0,0,0,100,0),
(42110,5,-10569.2,-1199.18,27.7436,0,0,0,0,100,0),
(42110,6,-10561.4,-1202.03,27.8185,0,0,0,0,100,0),
(42110,7,-10554,-1204.76,27.7435,0,0,0,0,100,0),
(42110,8,-10551.3,-1205.73,27.5662,0,0,0,0,100,0),
(42110,9,-10549.3,-1192.89,27.6623,0,0,0,0,100,0),
(42110,10,-10544.2,-1192.9,27.8501,0,0,0,0,100,0),
(42110,11,-10535.2,-1192.91,27.6623,0,0,0,0,100,0),
(42110,12,-10540.1,-1186.83,28.0255,0,0,0,0,100,0),
(42110,13,-10546.2,-1179.32,28.1623,0,0,0,0,100,0),
(42110,14,-10546.9,-1174.58,28.3083,0,0,0,0,100,0),
(42110,15,-10547.9,-1167.96,27.7873,0,0,0,0,100,0),
(42110,16,-10551.8,-1161.45,27.8954,0,0,0,0,100,0),
(42110,17,-10555.2,-1155.66,28.0346,0,0,0,0,100,0),
(42110,18,-10566.6,-1156.68,27.5666,0,0,0,0,100,0),
(42110,19,-10577.5,-1165.16,28.1497,0,0,0,0,100,0);

DELETE FROM `waypoints` WHERE entry IN (412,1436,499,888,1001,28987,1098,1099,1100,1101,1203,1204,2470);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`)
VALUES
(412,1,-10290.1,73.7148,38.849,'Stitches'),
(412,2,-10290.4,81.547,38.7702,NULL),
(412,3,-10283.2,86.6661,38.7694,NULL),
(412,4,-10271.1,83.5772,39.1122,NULL),
(412,5,-10266,76.0585,39.4047,NULL),
(412,6,-10272.4,65.7703,39.524,NULL),
(412,7,-10283.4,59.1681,40.6902,NULL),
(412,8,-10300.2,45.8306,47.3053,NULL),
(412,9,-10315.3,45.1015,48.0097,NULL),
(412,10,-10324.4,38.7441,47.3935,NULL),
(412,11,-10330.6,24.392,50.9516,NULL),
(412,12,-10335.3,13.4164,50.1259,NULL),
(412,13,-10344.3,1.10614,51.0853,NULL),
(412,14,-10354.6,-13.0266,47.1154,NULL),
(412,15,-10365.9,-19.4335,48.0317,NULL),
(412,16,-10382.1,-28.6698,49.396,NULL),
(412,17,-10401,-30.8108,48.1353,NULL),
(412,18,-10413.7,-28.9031,48.6217,NULL),
(412,19,-10436.4,-34.2376,46.5064,NULL),
(412,20,-10447.7,-35.8702,47.5463,NULL),
(412,21,-10458,-37.3508,48.3924,NULL),
(412,22,-10468.7,-38.8985,48.7035,NULL),
(412,23,-10477.4,-40.4946,48.2918,NULL),
(412,24,-10500.2,-44.6662,45.882,NULL),
(412,25,-10517.5,-42.2932,44.3094,NULL),
(412,26,-10531.3,-40.416,43.7332,NULL),
(412,27,-10540.2,-39.1852,42.8946,NULL),
(412,28,-10551,-37.6206,40.7144,NULL),
(412,29,-10568,-35.1434,37.2048,NULL),
(412,30,-10583.8,-37.2702,37.4855,NULL),
(412,31,-10598,-46.372,36.0715,NULL),
(412,32,-10606.3,-51.7202,36.0713,NULL),
(412,33,-10629.2,-64.211,32.6163,NULL),
(412,34,-10645.9,-73.4561,32.7337,NULL),
(412,35,-10657.6,-77.3723,33.5963,NULL),
(412,36,-10669.6,-81.3788,35.4789,NULL),
(412,37,-10674.9,-83.1297,35.6958,NULL),
(412,38,-10687.6,-85.57,34.1549,NULL),
(412,39,-10697.3,-87.9471,36.5699,NULL),
(412,40,-10702.8,-89.2772,37.9242,NULL),
(412,41,-10709.2,-95.1712,38.0464,NULL),
(412,42,-10725.6,-101.348,34.5892,NULL),
(412,43,-10737.4,-100.186,35.5394,NULL),
(412,44,-10748,-99.1517,38.2323,NULL),
(412,45,-10754.6,-95.7509,38.9659,NULL),
(412,46,-10759.9,-93.0657,38.5876,NULL),
(412,47,-10774.9,-89.8001,34.8007,NULL),
(412,48,-10781.9,-88.2454,34.724,NULL),
(412,49,-10788.6,-86.7376,33.4988,NULL),
(412,50,-10802.7,-88.6347,29.0679,NULL),
(412,51,-10811.5,-97.1736,29.2451,NULL),
(412,52,-10816.7,-109.908,29.8234,NULL),
(412,53,-10821.4,-121.335,30.142,NULL),
(412,54,-10824.8,-130.533,31.5683,NULL),
(412,55,-10827.9,-140.065,32.0003,NULL),
(412,56,-10830.6,-148.284,31.7985,NULL),
(412,57,-10834.9,-162.949,33.7225,NULL),
(412,58,-10841,-184.623,34.3425,NULL),
(412,59,-10843.3,-193.104,35.8227,NULL),
(412,60,-10846.2,-205.01,36.8275,NULL),
(412,61,-10848.7,-215.175,37.7986,NULL),
(412,62,-10851.1,-231.899,38.7768,NULL),
(412,63,-10853.9,-246.217,38.5709,NULL),
(412,64,-10857.4,-264.019,38.0974,NULL),
(412,65,-10860.7,-274.471,38.3247,NULL),
(412,66,-10866.6,-293.454,37.9429,NULL),
(412,67,-10872.3,-307.236,38.3254,NULL),
(412,68,-10882.9,-332.562,37.9688,NULL),
(412,69,-10889.9,-345.999,39.4149,NULL),
(412,70,-10900,-365.26,39.4542,NULL),
(412,71,-10903.3,-388.393,40.8779,NULL),
(412,72,-10904.9,-416.938,42.0424,NULL),
(412,73,-10905.7,-431.964,42.7237,NULL),
(412,74,-10906.6,-444.304,44.0636,NULL),
(412,75,-10908.3,-466.431,47.368,NULL),
(412,76,-10909.8,-489.879,50.066,NULL),
(412,77,-10910.4,-497.977,51.2526,NULL),
(412,78,-10911.2,-510.492,52.0594,NULL),
(412,79,-10912.4,-517.513,53.0989,NULL),
(412,80,-10913.7,-525.57,53.8201,NULL),
(412,81,-10916.4,-538.038,54.1693,NULL),
(412,82,-10921.8,-552.092,53.9585,NULL),
(412,83,-10929.1,-571.261,54.1827,NULL),
(412,84,-10936.5,-581.62,53.8887,NULL),
(412,85,-10947.2,-594.068,55.0797,NULL),
(412,86,-10951.7,-599.17,55.3021,NULL),
(412,87,-10954.8,-609.43,55.275,NULL),
(412,88,-10957.9,-619.554,55.0689,NULL),
(412,89,-10958.8,-637.183,55.2047,NULL),
(412,90,-10954.3,-652.46,55.4423,NULL),
(412,91,-10946.1,-663.049,55.6282,NULL),
(412,92,-10940,-670.897,55.7822,NULL),
(412,93,-10931.8,-681.568,55.3955,NULL),
(412,94,-10924.7,-695.393,55.756,NULL),
(412,95,-10917.7,-709.087,55.767,NULL),
(412,96,-10910.2,-721.735,54.8587,NULL),
(412,97,-10902.9,-734.1,55.1313,NULL),
(412,98,-10895,-742.496,55.4435,NULL),
(412,99,-10882.5,-755.633,55.6838,NULL),
(412,100,-10862.5,-776.147,55.9868,NULL),
(412,101,-10851.1,-787.76,56.1885,NULL),
(412,102,-10841.4,-803.388,56.3321,NULL),
(412,103,-10831.9,-818.655,56.2795,NULL),
(412,104,-10825.2,-833.223,55.5758,NULL),
(412,105,-10820.8,-843.769,55.9204,NULL),
(412,106,-10813.4,-861.306,55.912,NULL),
(412,107,-10809.1,-871.662,56.0751,NULL),
(412,108,-10804.7,-886.059,55.7563,NULL),
(412,109,-10800.1,-901.361,56.0433,NULL),
(412,110,-10796.7,-912.719,55.8731,NULL),
(412,111,-10796.4,-923.796,55.7874,NULL),
(412,112,-10796.1,-934.562,56.2303,NULL),
(412,113,-10800.5,-949.721,56.5614,NULL),
(412,114,-10807.1,-969.027,56.2941,NULL),
(412,115,-10806.9,-981.271,55.3882,NULL),
(412,116,-10806.8,-992.166,53.8349,NULL),
(412,117,-10805.6,-1012.55,50.6304,NULL),
(412,118,-10804.6,-1030.41,47.0768,NULL),
(412,119,-10801.3,-1047.26,44.0233,NULL),
(412,120,-10795.6,-1058.76,41.5714,NULL),
(412,121,-10787.8,-1074.49,37.7652,NULL),
(412,122,-10782.8,-1099.54,33.0874,NULL),
(412,123,-10781.2,-1112.66,30.3863,NULL),
(412,124,-10774.8,-1122.15,29.1451,NULL),
(412,125,-10763.6,-1138.91,27.0977,NULL),
(412,126,-10749.6,-1149.38,26.7906,NULL),
(412,127,-10738,-1158.02,26.4475,NULL),
(412,128,-10729.5,-1163.52,26.9023,NULL),
(412,129,-10718,-1171.02,26.5977,NULL),
(412,130,-10705.3,-1179.29,26.3723,NULL),
(412,131,-10692,-1185.73,27.1435,NULL),
(412,132,-10682.3,-1190.45,27.2793,NULL),
(412,133,-10673.5,-1191.61,27.685,NULL),
(412,134,-10659.8,-1192.65,28.4229,NULL),
(412,135,-10641.6,-1189.92,28.5594,NULL),
(412,136,-10628.2,-1186.23,29.0125,NULL),
(412,137,-10615.7,-1182.78,28.5022,NULL),
(412,138,-10607.4,-1181.2,28.3199,NULL),
(412,139,-10586.8,-1177.32,28.3931,NULL),
(412,140,-10578.6,-1179.04,28.4354,NULL),
(412,141,-10566.7,-1189.27,27.8756,NULL),
(412,142,-10557,-1192.38,28.0606,NULL),
(412,143,-10550.4,-1185.71,27.8428,NULL),
(412,144,-10554.4,-1167.97,27.5984,NULL),

(1436,1,-10584.2,-1174.31,28.662,'Watcher Cutford'),
(1436,2,-10557.4,-1149.16,28.033,NULL),
(1436,3,-10557.5,-1146.89,28.034,NULL),
(1436,4,-10558.3,-1141.23,30.0683,NULL),
(1436,5,-10559.6,-1132.51,30.067,NULL),
(1436,6,-10565,-1124.78,30.067,NULL),
(1436,7,-10569.2,-1125.4,29.2035,NULL),
(1436,8,-10575,-1125.57,29.167,NULL),
(1436,9,-10576.6,-1111.12,30.07,NULL),
(1436,10,-10572.9,-1107.8,30.069,NULL),
(1436,11,-10558.3,-1105.98,30.069,NULL),
(1436,12,-10556,-1106.37,31.0298,NULL),
(1436,13,-10555,-1106.46,31.429,NULL),
(1436,14,-10553.4,-1106.64,31.428,NULL),
(1436,15,-10558.3,-1105.98,30.069,NULL),
(1436,16,-10572.8,-1107,30.071,NULL),
(1436,17,-10576.6,-1111.12,30.07,NULL),
(1436,18,-10575.7,-1116.16,30.0691,NULL),
(1436,19,-10575.8,-1121.12,29.9733,NULL),
(1436,20,-10575,-1125.57,29.167,NULL),
(1436,21,-10565,-1124.78,30.067,NULL),
(1436,22,-10559.6,-1132.51,30.067,NULL),
(1436,23,-10558.3,-1141.23,30.0683,NULL),
(1436,24,-10557.5,-1146.89,28.034,NULL),
(1436,25,-10559.3,-1151.77,28.034,NULL),
(1436,26,-10568.3,-1154.32,27.412,NULL),
(1436,27,-10576,-1164.76,28.0734,NULL),
(1436,28,-10582.2,-1173.28,28.53,NULL),
(1436,29,-10594,-1176.26,28.4963,NULL),
(1436,30,-10623,-1183.54,28.819,NULL),
(1436,31,-10632.9,-1186.41,28.9188,NULL),
(1436,32,-10641.6,-1188.92,28.5594,NULL),
(1436,33,-10649.9,-1190.17,28.5826,NULL),
(1436,34,-10662.5,-1192.06,28.2884,NULL),
(1436,35,-10683.7,-1188.63,27.3739,NULL),
(1436,36,-10705.3,-1176.29,26.3723,NULL),
(1436,37,-10713.3,-1171.2,26.63,NULL),
(1436,38,-10730,-1160.57,26.9356,NULL),
(1436,39,-10738,-1155.52,26.4475,NULL),
(1436,40,-10752.1,-1146.74,26.8615,NULL),
(1436,41,-10764.6,-1138.91,27.0977,NULL),
(1436,42,-10773.4,-1124.17,28.7783,NULL),
(1436,43,-10780.2,-1112.66,30.3863,NULL),
(1436,44,-10782.3,-1095.07,33.6488,NULL),
(1436,45,-10786.8,-1074.49,37.7652,NULL),
(1436,46,-10795.6,-1057.91,41.7506,NULL),
(1436,47,-10801.3,-1047.26,44.0233,NULL),
(1436,48,-10804.6,-1030.41,47.0768,NULL),
(1436,49,-10805.6,-1012.7,50.6,NULL),
(1436,50,-10806.8,-992.166,53.8349,NULL),
(1436,51,-10807,-979.567,55.4841,NULL),
(1436,52,-10807.1,-969.027,56.2941,NULL),
(1436,53,-10800.5,-949.721,56.5614,NULL),
(1436,54,-10796.1,-934.562,56.2303,NULL),
(1436,55,-10796.7,-912.719,55.8731,NULL),
(1436,56,-10798.8,-905.632,56.1289,NULL),
(1436,57,-10803.6,-889.521,55.7262,NULL),
(1436,58,-10809.2,-871.455,56.0694,NULL),
(1436,59,-10819.1,-847.791,55.9233,NULL),
(1436,60,-10825.2,-833.223,55.5758,NULL),
(1436,61,-10831.9,-818.655,56.2795,NULL),
(1436,62,-10852.5,-786.292,56.3472,NULL),
(1436,63,-10878.3,-760.091,55.5638,NULL),
(1436,64,-10884.2,-753.903,55.6938,NULL),
(1436,65,-10895.4,-742.047,55.4654,NULL),
(1436,66,-10902.9,-734.1,55.1313,NULL),
(1436,67,-10909.3,-723.483,54.78,NULL),
(1436,68,-10916.9,-710.733,55.6988,NULL),
(1436,69,-10924.5,-695.787,55.7602,NULL),
(1436,70,-10928.6,-685.71,55.4651,NULL),
(1436,71,-10940.3,-670.568,55.7888,NULL),
(1436,72,-10953.6,-653.376,55.5108,NULL),
(1436,73,-10958.8,-637.183,55.2047,NULL),
(1436,74,-10957.9,-619.554,55.0689,NULL),
(1436,75,-10953.2,-606.122,55.3254,NULL),
(1436,76,-10950.1,-597.371,55.177,NULL),
(1436,77,-10936.5,-581.62,53.8887,NULL),
(1436,78,-10929.7,-570.19,54.1522,NULL),
(1436,79,-10923.4,-555.198,53.9686,NULL),
(1436,80,-10915.6,-536.089,54.0556,NULL),
(1436,81,-10913.5,-523.79,53.7866,NULL),
(1436,82,-10911.2,-510.492,52.0594,NULL),
(1436,83,-10910.4,-497.801,51.2322,NULL),
(1436,84,-10908.8,-474.289,47.9397,NULL),
(1436,85,-10908.2,-464.339,47.0685,NULL),
(1436,86,-10906.5,-442.234,43.8508,NULL),
(1436,87,-10905.7,-431.964,42.7237,NULL),
(1436,88,-10905,-415.64,41.9113,NULL),
(1436,89,-10904.1,-393.833,41.0451,NULL),
(1436,90,-10912.1,-391.524,41.0131,NULL),
(1436,91,-10924.5,-387.895,39.7191,NULL),
(1436,92,-10931.5,-385.877,40.085,NULL),

(499,1,-10907.6,-387.349,40.778,'Watcher Paige'),
(499,2,-10901.8,-376.94,40.07,NULL),

(888,1,-10907.6,-387.349,40.778,'Watcher Dodds'),
(888,2,-10900.6,-373.55,39.92,NULL),

(1001,1,-10912,-388,40.632,'Watcher Hutchins'),
(1001,2,-10905.4,-382.46,40.407,NULL),
(1001,3,-10902.4,-374.68,39.9529,NULL),

(28987,1,-10895.8,-381.028,40.125,'Watcher Blomberg'),
(28987,2,-10901.9,-380.05,40.123,NULL),
(28987,3,-10900.4,-375.921,40.0489,NULL),

(1098,1,-10776.7,-975.54,56.4,'Watcher Merant'),
(1098,2,-10805.7,-878.18,55.87,NULL),
(1098,3,-10827.3,-828.594,55.547,NULL),

(1099,1,-10777.7,-975.9,56.09,'Watcher Gelwin'),
(1099,2,-10807,-878.849,55.75,NULL),
(1099,3,-10827.6,-831.325,55.638,NULL),

(1100,1,-10775.7,-975.187,56.72,'Watcher Selkin'),
(1100,2,-10804.8,-877.659,55.896,NULL),
(1100,3,-10825.6,-830.715,55.539,NULL),

(1101,1,-10778.6,-976.131,55.73,'Watcher Thayer'),
(1101,2,-10808.8,-879.42,55.75,NULL),
(1101,3,-10829.4,-829.255,55.609,NULL),

(1203,1,-10531.2,-1166.31,28.102,'Watcher Sarys'),
(1203,2,-10535.7,-1167.24,28.102,NULL),
(1203,3,-10536.2,-1159.28,28.088,NULL),
(1203,4,-10564.8,-1161.14,27.475,NULL),
(1203,5,-10577.8,-1174.57,28.353,NULL),
(1203,6,-10592.2,-1175.16,28.566,NULL),

(1204,1,-10585.9,-1164.04,30.017,'Watcher Corwin'),
(1204,2,-10580.4,-1170.46,28.386,NULL),
(1204,3,-10581.1,-1173.57,28.497,NULL),
(1204,4,-10594.1,-1176.72,28.432,NULL),

(2470,1,-10583.7,-1184.22,27.2057,'Watcher Frazier'),
(2470,2,-10585.4,-1176.74,28.505,NULL),
(2470,3,-10591.6,-1177.67,28.381,NULL);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
