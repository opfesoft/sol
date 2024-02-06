UPDATE `creature_template` SET `npcflag` = 1 WHERE `entry` IN (29319,29327);
UPDATE `creature_template` SET `faction` = 1990 WHERE `entry` IN (33008,33007);
UPDATE `creature_template` SET `faction` = 35 WHERE `entry` IN (33011,33010);

DELETE FROM `creature_template_addon` WHERE `entry` = 33007;
UPDATE `creature_template_addon` SET `auras` = '54240' WHERE `entry` = 33008;

DELETE FROM `creature_text` WHERE `CreatureId` IN (29319,29327,33008);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(29319,0,0,'It''s an angry male!',42,0,100,0,0,473,33191,0,'Icepaw Bear'),
(29319,1,0,'It''s a female.',42,0,100,0,0,473,33192,0,'Icepaw Bear'),

(29327,0,0,'It''s an angry male!',42,0,100,0,0,643,33191,0,'Frost Leopard'),
(29327,1,0,'It''s a female.',42,0,100,0,0,643,33192,0,'Frost Leopard');

UPDATE `creature` SET `unit_flags` = `unit_flags` | 256 WHERE `guid` IN (203404,203405);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (29319,33008,33011,29327,33007,33010);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2931900,2931901,2931902,2932700,2932701,2932702);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(29319,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Respawn - Disable Event Phase Reset'),
(29319,0,1,2,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - Linked - Set Event Phase 1'),
(29319,0,2,0,61,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(29319,0,3,0,0,0,100,0,1000,1000,8000,11000,0,11,54632,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Icepaw Bear - IC - Cast ''Claws of Ice'')'),
(29319,0,4,0,8,0,100,1,62105,0,0,0,0,80,2931900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Spellhit ''To''kini''s Blowgun'' (No Repeat) - Call Timed Action List'),
(29319,0,5,0,62,0,100,0,55000,0,0,0,0,88,2931901,2931902,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Gossip Option 0 Selected - Call Random Timed Action List'),
(29319,0,6,0,1,2,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - OOC (Event Phase 2) - Force Despawn'),

(2931900,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Set Active On'),
(2931900,9,1,0,0,0,100,0,0,0,0,0,0,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Set Faction ''Ambient'''),
(2931900,9,2,0,0,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2931900,9,3,0,0,0,100,0,2000,2000,0,0,0,11,62248,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Cast ''Sleeping Sleep'''),
(2931900,9,4,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Set Event Phase 2'),

(2931901,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Say Line 0'),
(2931901,9,1,0,0,0,100,0,0,0,0,0,0,28,62248,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Remove Aura ''Sleeping Sleep'''),
(2931901,9,2,0,0,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2931901,9,3,0,0,0,100,0,0,0,0,0,0,36,33008,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Update Template ''Male Icepaw Bear'''),
(2931901,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Start Attack (Invoker)'),

(2931902,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Say Line 1'),
(2931902,9,1,0,0,0,100,0,0,0,0,0,0,28,62248,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Remove Aura ''Sleeping Sleep'''),
(2931902,9,2,0,0,0,100,0,0,0,0,0,0,33,33006,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Quest Credit ''Tails Up'' (Invoker)'),
(2931902,9,3,0,0,0,100,0,0,0,0,0,0,36,33011,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Update Template ''Female Icepaw Bear'''),
(2931902,9,4,0,0,0,100,0,0,0,0,0,0,29,3,180,0,0,0,0,7,0,0,0,0,0,0,0,0,'Icepaw Bear - On Script - Set Follow (Invoker)'),

(29327,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Respawn - Disable Event Phase Reset'),
(29327,0,1,2,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - Linked - Set Event Phase 1'),
(29327,0,2,0,61,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - Linked - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(29327,0,3,0,0,0,100,0,1000,1000,8000,11000,0,11,54668,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Frost Leopard - IC - Cast ''Rake'')'),
(29327,0,4,0,8,0,100,1,62105,0,0,0,0,80,2932700,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Spellhit ''To''kini''s Blowgun'' (No Repeat) - Call Timed Action List'),
(29327,0,5,0,62,0,100,0,54000,0,0,0,0,88,2932701,2932702,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Gossip Option 0 Selected - Call Random Timed Action List'),
(29327,0,6,0,1,2,100,0,30000,30000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - OOC (Event Phase 2) - Force Despawn'),

(2932700,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Set Active On'),
(2932700,9,1,0,0,0,100,0,0,0,0,0,0,2,190,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Set Faction ''Ambient'''),
(2932700,9,2,0,0,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2932700,9,3,0,0,0,100,0,2000,2000,0,0,0,11,62248,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Cast ''Sleeping Sleep'''),
(2932700,9,4,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Set Event Phase 2'),

(2932701,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Say Line 0'),
(2932701,9,1,0,0,0,100,0,0,0,0,0,0,28,62248,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Remove Aura ''Sleeping Sleep'''),
(2932701,9,2,0,0,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2932701,9,3,0,0,0,100,0,0,0,0,0,0,36,33007,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Update Template ''Male Frost Leopard'''),
(2932701,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Start Attack (Invoker)'),

(2932702,9,0,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Say Line 1'),
(2932702,9,1,0,0,0,100,0,0,0,0,0,0,28,62248,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Remove Aura ''Sleeping Sleep'''),
(2932702,9,2,0,0,0,100,0,0,0,0,0,0,33,33005,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Quest Credit ''Tails Up'' (Invoker)'),
(2932702,9,3,0,0,0,100,0,0,0,0,0,0,36,33010,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Update Template ''Female Frost Leopard'''),
(2932702,9,4,0,0,0,100,0,0,0,0,0,0,29,3,180,0,0,0,0,7,0,0,0,0,0,0,0,0,'Frost Leopard - On Script - Set Follow (Invoker)');
