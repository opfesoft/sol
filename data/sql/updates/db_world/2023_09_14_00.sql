UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 28739;
DELETE FROM `creature` WHERE `id` = 28745;

DELETE FROM `creature_template_addon` WHERE `entry` = 28745;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(28745,0,0,0,0,0,0,'52060');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (28745,28603);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (28739,28745,28603);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2873900;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28739,0,0,0,8,0,100,0,52227,0,0,0,0,80,2873900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blight Cauldron Bunny 00 - On Spellhit ''Dilute Blight Cauldron'' - Call Timed Action List'),
(28739,0,1,0,1,0,100,0,30000,30000,30000,30000,0,28,52231,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blight Cauldron Bunny 00 - OOC - Remove Aura ''Cauldron Diluted Effect'''),
(28739,0,2,0,59,0,50,0,1,0,0,0,0,12,28745,1,60000,0,10,25,1,0,0,0,0,0,0,0,0,'Blight Cauldron Bunny 00 - On Timed Event 1 Triggered - Summon Creature ''Alarmed Blightguard'''),

(2873900,9,0,0,0,0,100,0,0,0,0,0,0,11,52228,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Blight Cauldron Bunny 00 - On Script - Cast ''Kill Credit'''),
(2873900,9,1,0,0,0,100,0,0,0,0,0,0,11,52231,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blight Cauldron Bunny 00 - On Script - Cast ''Cauldron Diluted Effect'''),
(2873900,9,2,0,0,0,100,0,5000,10000,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blight Cauldron Bunny 00 - On Script - Trigger Timed Event 1'),
(2873900,9,3,0,0,0,100,0,0,0,0,0,0,73,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Blight Cauldron Bunny 00 - On Script - Trigger Timed Event 1'),

(28745,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alarmed Blightguard - On Just Summoned - Set Active On'),
(28745,0,1,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Alarmed Blightguard - Linked - Start Random Movement'),
(28745,0,2,0,0,0,100,0,2000,2000,2000,2000,0,28,51966,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Alarmed Blightguard - IC - Remove Aura ''Scourge Disguise'''),

(28603,0,0,0,0,0,100,0,2000,2000,2000,2000,0,28,51966,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Blightguard - IC - Remove Aura ''Scourge Disguise''');
