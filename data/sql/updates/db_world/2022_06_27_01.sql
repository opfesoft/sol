-- Burning Skimmer: Remove obsolete spawns
DELETE FROM `creature` WHERE `id` = 28369;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 28369;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (28352,28369);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2835200,2836900);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28352,0,0,0,11,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Respawn - Set Event Phase 1'),
(28352,0,1,0,8,1,100,0,51381,0,0,0,0,80,2835200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Spellhit ''Toss Grenade'' - Call Timed Action List (Event Phase 1)'),
(28352,0,2,0,59,0,100,0,1,0,0,0,0,12,28369,3,15000,0,0,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Timed Event 1 Triggered - Summon Creature ''Burning Skimmer'''),

(2835200,9,0,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Script - Set Event Phase 0'),
(2835200,9,1,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Script - Set Active On'),
(2835200,9,2,0,0,0,100,0,0,0,0,0,0,33,28352,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Script - Quest Credit ''Troll Patrol: Throwing Down'''),
(2835200,9,3,0,0,0,100,0,2000,2000,0,0,0,11,44762,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Script - Cast ''Camera Shake - Med'''),
(2835200,9,4,0,0,0,100,0,2000,2000,0,0,0,75,56118,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Script - Add Aura ''Smolder Smoke'''),
(2835200,9,5,0,0,0,100,0,0,0,0,0,0,67,1,2000,5000,2000,5000,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Script - Create Timed Event 1'),
(2835200,9,6,0,0,0,100,0,30000,30000,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Script - Remove Timed Event 1'),
(2835200,9,7,0,0,0,100,0,144000,144000,0,0,0,28,56118,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Script - Remove Aura ''Smolder Smoke'''),
(2835200,9,8,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Script - Set Event Phase 1'),
(2835200,9,9,0,0,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Nethurbian Crater KC Bunny - On Script - Set Active Off'),

(28369,0,0,0,54,0,100,0,0,0,0,0,0,80,2836900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Burning Skimmer - On Just Summoned - Call Timed Action List'),

(2836900,9,0,0,0,0,100,0,0,0,0,0,0,75,40148,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Burning Skimmer - On Script - Add Aura ''Immolation'''),
(2836900,9,1,0,0,0,100,0,0,0,0,0,0,122,10000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Burning Skimmer - On Script - Flee'),
(2836900,9,2,0,0,0,100,0,10000,10000,0,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Burning Skimmer - On Script - Kill Unit');
