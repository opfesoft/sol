-- Fix rotation for the rune near Explorers' League Outpost
UPDATE `gameobject` SET `rotation0` = -0.0263157, `rotation1` = 0.0369759, `rotation2` = 0.998969, `rotation3` = 0.00100662 WHERE `guid` = 65654;
DELETE FROM `gameobject_addon` WHERE `guid` = 65654;
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(65654,0,0,1);

-- Fix model ID for Iron Dwarf Relic spawn near Explorers' League Outpost
UPDATE `creature` SET `modelid` = 17856 WHERE `guid` = 49220;

-- The Iron Rune Construct Taxi destroys itself after reaching its destination, no need to manually remove the aura "Ride Vehicle Hardcoded"
DELETE FROM `spell_scripts` WHERE `id` = 44688 AND `command` = 14;

UPDATE `creature` SET `wander_distance` = 30, `MovementType` = 1 WHERE `guid` IN (108717,108625,108708);

DELETE FROM `creature_summon_groups` WHERE `summonerId` = 24845;
INSERT INTO `creature_summon_groups` (`summonerId`, `summonerType`, `groupId`, `entry`, `position_x`, `position_y`, `position_z`, `orientation`, `summonType`, `summonTime`)
VALUES
(24845,0,1,24846,306.099,-5706.15,102.435,4.96977,8,0),
(24845,0,1,24846,311.025,-5702.8,101.935,5.18722,8,0),
(24845,0,1,24846,309.754,-5703.16,102.071,5.18722,8,0),
(24845,0,1,24846,308.223,-5703.8,102.232,5.18722,8,0),
(24845,0,1,24846,307.044,-5704.32,102.356,5.18722,8,0),
(24845,0,1,24846,304.169,-5706.84,102.697,5.18722,8,0),
(24845,0,1,24846,303.13,-5707.28,102.978,5.18722,8,0),
(24845,0,1,24846,297.246,-5726.82,96.2681,0.347607,8,0),
(24845,0,1,24846,292.82,-5726.04,96.5843,0.347607,8,0),
(24845,0,1,24846,292.562,-5728.57,96.5857,0.347607,8,0),
(24845,0,1,24846,292.15,-5727.42,96.5874,0.347607,8,0),
(24845,0,1,24846,294.578,-5730.09,96.2958,0.347607,8,0),
(24845,0,1,24846,296.196,-5730.17,96.0082,0.347607,8,0),
(24845,0,1,24846,297.603,-5730.79,95.6955,0.347607,8,0),
(24845,0,1,24846,299.397,-5729.56,95.7274,0.347607,8,0),
(24845,0,1,24847,315.101,-5723.06,96.2541,3.05433,8,0);

UPDATE `smart_scripts` SET `link` = 16 WHERE `entryorguid` = 24825 AND `source_type` = 0 AND `id` BETWEEN 8 AND 13;
UPDATE `smart_scripts` SET `link` = 15 WHERE `entryorguid` = 24825 AND `source_type` = 0 AND `id` = 14;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 24720;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 24825 AND `id` IN (15,16);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (24271,23672,23673,23675,24845,24718,24717,24720);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2427100,2427101,2427102,2367200,2367201,2367202,2367300,2367301,2367302,2367500,2367501,2367502,2484500,2471800,2471801,2471802);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(24271,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Respawn - Set Active On (CONDITION_OBJECT_ENTRY_GUID)'),
(24271,0,1,0,10,0,20,0,1,9,60000,60000,0,80,2427100,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - OOC LoS - Call Timed Action List (CONDITION_OBJECT_ENTRY_GUID)'),
(24271,0,2,3,25,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Reset - Remove Timed Event 1'),
(24271,0,3,0,61,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - Linked - Set Root Off'),
(24271,0,4,0,8,1,100,0,44609,0,0,0,0,80,2427101,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Spellhit ''Bluff'' - Call Timed Action List (Event Phase 1)'),
(24271,0,5,0,0,0,100,0,5000,5000,7000,10000,0,11,49729,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Iron Rune Golem - IC - Cast ''Rune Punch'''),
(24271,0,6,0,1,0,100,0,120000,240000,120000,240000,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - OOC - Say Line 3'),
(24271,0,7,0,59,0,100,0,1,0,0,0,0,80,2427102,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Timed Event 1 Triggered - Call Timed Action List'),

(2427100,9,0,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Set Event Phase 1'),
(2427100,9,1,0,0,0,100,0,0,0,0,0,0,67,1,10000,10000,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Create Timed Event 1'),
(2427100,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Say Line 0'),
(2427100,9,3,0,0,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Set Root On'),
(2427100,9,4,0,0,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,19,24825,20,0,0,0,0,0,0,'Iron Rune Golem - On Script - Set Orientation (Iron Rune Construct)'),

(2427101,9,0,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Remove Timed Event 1'),
(2427101,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,24825,20,0,0,0,0,0,0,'Iron Rune Golem - On Script - Say Line 0 (Iron Rune Construct)'),
(2427101,9,2,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Say Line 1'),
(2427101,9,3,0,0,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Set Root Off'),
(2427101,9,4,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Set Event Phase 0'),
(2427101,9,5,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Evade'),

(2427102,9,0,0,0,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Set Root Off'),
(2427102,9,1,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Say Line 2'),
(2427102,9,2,0,0,0,100,0,1000,1000,0,0,0,28,44643,0,0,0,0,0,18,50,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Remove Aura ''Reputation and Language'' (Nearby Players)'),
(2427102,9,3,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Golem - On Script - Set Event Phase 0'),

(23672,0,0,0,10,0,20,0,1,9,60000,60000,0,80,2367200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - OOC LoS - Call Timed Action List (CONDITION_OBJECT_ENTRY_GUID)'),
(23672,0,1,2,25,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Reset - Remove Timed Event 1'),
(23672,0,2,0,61,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - Linked - Set Root Off'),
(23672,0,3,0,8,1,100,0,44609,0,0,0,0,80,2367201,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Spellhit ''Bluff'' - Call Timed Action List (Event Phase 1)'),
(23672,0,4,0,0,0,100,0,5000,5000,5000,8000,0,11,49749,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Iron Rune Worker - IC - Cast ''Piercing Blow'''),
(23672,0,5,0,59,0,100,0,1,0,0,0,0,80,2367202,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Timed Event 1 Triggered - Call Timed Action List'),

(2367200,9,0,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Set Event Phase 1'),
(2367200,9,1,0,0,0,100,0,0,0,0,0,0,67,1,10000,10000,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Create Timed Event 1'),
(2367200,9,2,0,0,0,100,0,0,0,0,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Set Emote State ''ONESHOT_NONE'''),
(2367200,9,3,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Say Line 0'),
(2367200,9,4,0,0,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Set Root On'),
(2367200,9,5,0,0,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,19,24825,20,0,0,0,0,0,0,'Iron Rune Worker - On Script - Set Orientation (Iron Rune Construct)'),

(2367201,9,0,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Remove Timed Event 1'),
(2367201,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,24825,20,0,0,0,0,0,0,'Iron Rune Worker - On Script - Say Line 0 (Iron Rune Construct)'),
(2367201,9,2,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Say Line 1'),
(2367201,9,3,0,0,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Set Root Off'),
(2367201,9,4,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Set Event Phase 0'),
(2367201,9,5,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Evade'),

(2367202,9,0,0,0,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Set Root Off'),
(2367202,9,1,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Say Line 2'),
(2367202,9,2,0,0,0,100,0,1000,1000,0,0,0,28,44643,0,0,0,0,0,18,50,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Remove Aura ''Reputation and Language'' (Nearby Players)'),
(2367202,9,3,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Worker - On Script - Set Event Phase 0'),

(23673,0,0,0,10,0,20,0,1,9,60000,60000,0,80,2367300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - OOC LoS - Call Timed Action List (CONDITION_OBJECT_ENTRY_GUID)'),
(23673,0,1,2,25,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Reset - Remove Timed Event 1'),
(23673,0,2,0,61,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - Linked - Set Root Off'),
(23673,0,3,0,8,1,100,0,44609,0,0,0,0,80,2367301,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Spellhit ''Bluff'' - Call Timed Action List (Event Phase 1)'),
(23673,0,4,0,0,0,100,0,5000,10000,20000,40000,0,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - IC - Cast ''Demoralizing Shout'''),
(23673,0,5,0,4,0,100,0,0,0,0,0,0,11,49758,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Aggro - Cast ''Charge'''),
(23673,0,6,0,59,0,100,0,1,0,0,0,0,80,2367302,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Timed Event 1 Triggered - Call Timed Action List'),

(2367300,9,0,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Set Event Phase 1'),
(2367300,9,1,0,0,0,100,0,0,0,0,0,0,67,1,10000,10000,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Create Timed Event 1'),
(2367300,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Say Line 0'),
(2367300,9,3,0,0,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Set Root On'),
(2367300,9,4,0,0,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,19,24825,20,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Set Orientation (Iron Rune Construct)'),

(2367301,9,0,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Remove Timed Event 1'),
(2367301,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,24825,20,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Say Line 0 (Iron Rune Construct)'),
(2367301,9,2,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Say Line 1'),
(2367301,9,3,0,0,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Set Root Off'),
(2367301,9,4,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Set Event Phase 0'),
(2367301,9,5,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Evade'),

(2367302,9,0,0,0,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Set Root Off'),
(2367302,9,1,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Say Line 2'),
(2367302,9,2,0,0,0,100,0,1000,1000,0,0,0,28,44643,0,0,0,0,0,18,50,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Remove Aura ''Reputation and Language'' (Nearby Playera)'),
(2367302,9,3,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Steelguard - On Script - Set Event Phase 0'),

(23675,0,0,0,10,0,20,0,1,9,60000,60000,0,80,2367500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - OOC LoS - Call Timed Action List (CONDITION_OBJECT_ENTRY_GUID)'),
(23675,0,1,2,25,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Reset - Remove Timed Event 1'),
(23675,0,2,0,61,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - Linked - Set Root Off'),
(23675,0,3,0,8,1,100,0,44609,0,0,0,0,80,2367501,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Spellhit ''Bluff'' - Call Timed Action List (Event Phase 1)'),
(23675,0,4,0,0,0,100,0,5000,5000,7000,10000,0,11,49753,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - IC - Cast ''Rune of Destruction'''),
(23675,0,5,0,59,0,100,0,1,0,0,0,0,80,2367502,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Timed Event 1 Triggered - Call Timed Action List'),

(2367500,9,0,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Set Event Phase 1'),
(2367500,9,1,0,0,0,100,0,0,0,0,0,0,67,1,10000,10000,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Create Timed Event 1'),
(2367500,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Say Line 0'),
(2367500,9,3,0,0,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Set Root On'),
(2367500,9,4,0,0,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,19,24825,20,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Set Orientation (Iron Rune Construct)'),

(2367501,9,0,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Remove Timed Event 1'),
(2367501,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,24825,20,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Say Line 0 (Iron Rune Construct)'),
(2367501,9,2,0,0,0,100,0,6000,6000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Say Line 1'),
(2367501,9,3,0,0,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Set Root Off'),
(2367501,9,4,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Set Event Phase 0'),
(2367501,9,5,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Evade'),

(2367502,9,0,0,0,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Set Root Off'),
(2367502,9,1,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Say Line 2'),
(2367502,9,2,0,0,0,100,0,1000,1000,0,0,0,28,44643,0,0,0,0,0,18,50,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Remove Aura ''Reputation and Language'' (Nearby Playera)'),
(2367502,9,3,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Runemaster - On Script - Set Event Phase 0'),

(24845,0,0,0,10,0,100,0,1,20,180000,180000,0,80,2484500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Baelgun''s Event Generator (Cave) - OOC LoS - Call Timed Action List (CONDITION_OBJECT_ENTRY_GUID)'),

(2484500,9,0,0,0,0,100,0,0,0,0,0,0,107,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Baelgun''s Event Generator (Cave) - On Script - Summon Creature Group 1'),
(2484500,9,1,0,0,0,100,0,70000,70000,0,0,0,41,0,0,0,0,0,0,11,24846,40,0,0,0,0,0,0,'Baelgun''s Event Generator (Cave) - On Script - Force Despawn (Iron Dwarf)'),

(24718,0,0,0,10,0,100,0,1,5,60000,60000,0,80,2471800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - OOC LoS - Call Timed Action List (CONDITION_OBJECT_ENTRY_GUID)'),
(24718,0,1,2,25,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Reset - Remove Timed Event 1'),
(24718,0,2,0,61,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - Linked - Set Root Off'),
(24718,0,3,0,8,1,100,0,44562,0,0,0,0,80,2471801,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Spellhit ''Bluff'' - Call Timed Action List (Event Phase 1)'),
(24718,0,4,0,59,0,100,0,1,0,0,0,0,80,2471802,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Timed Event 1 Triggered - Call Timed Action List'),

(2471800,9,0,0,0,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Script - Set Event Phase 1'),
(2471800,9,1,0,0,0,100,0,0,0,0,0,0,67,1,10000,10000,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Script - Create Timed Event 1'),
(2471800,9,2,0,0,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Script - Say Line 1'),
(2471800,9,3,0,0,0,100,0,0,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Script - Set Root On'),
(2471800,9,4,0,0,0,100,0,0,0,0,0,0,66,1,0,0,0,0,0,19,24823,20,0,0,0,0,0,0,'Lebronski - On Script - Set Orientation (Iron Rune Construct)'),

(2471801,9,0,0,0,0,100,0,0,0,0,0,0,74,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Script - Remove Timed Event 1'),
(2471801,9,1,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,19,24823,20,0,0,0,0,0,0,'Lebronski - On Script - Say Line 0 (Iron Rune Construct)'),
(2471801,9,2,0,0,0,100,0,9000,9000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Script - Say Line 1'),
(2471801,9,3,0,0,0,100,0,0,0,0,0,0,80,2482300,0,0,0,0,0,19,24823,20,0,0,0,0,0,0,'Lebronski - On Script - Call Timed Action List (Iron Rune Construct)'),
(2471801,9,4,0,0,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Script - Set Root Off'),
(2471801,9,5,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Script - Set Event Phase 0'),
(2471801,9,6,0,0,0,100,0,0,0,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Script - Evade'),

(2471802,9,0,0,0,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Script - Set Root Off'),
(2471802,9,1,0,0,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lebronski - On Script - Set Event Phase 0'),

(24717,0,0,0,1,0,100,0,5000,5000,0,0,0,105,1,0,0,0,0,0,14,65345,186925,0,0,0,0,0,0,'Stanwad - OOC - Set Flag ''GO_FLAG_IN_USE'' (Bench)'),

(24720,0,0,0,1,0,100,0,5000,5000,0,0,0,105,1,0,0,0,0,0,14,65348,186926,0,0,0,0,0,0,'Needlemeyer - OOC - Set Flag ''GO_FLAG_IN_USE'' (Bench)'),

(24825,0,15,0,61,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Construct - Linked - Set Fly Off'),
(24825,0,16,0,61,0,100,0,0,0,0,0,0,60,1,0,1,0,0,0,1,0,0,0,0,0,0,0,0,'Iron Rune Construct - Linked - Set Fly On');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (24271,23672,23673,23675,24845,24718);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13,17) AND `SourceEntry` IN (44550,44610);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,24271,0,0,31,1,3,0,115426,0,0,0,'Iron Rune Golem - Group 0: Execute SAI ID 0 only if has GUID 115426'),
(22,2,24271,0,0,31,0,3,24825,0,0,0,0,'Iron Rune Golem - Group 0: Execute SAI ID 1 only if invoker is ''Iron Rune Construct'''),
(22,1,23672,0,0,31,0,3,24825,0,0,0,0,'Iron Rune Worker - Group 0: Execute SAI ID 0 only if invoker is ''Iron Rune Construct'''),
(22,1,23673,0,0,31,0,3,24825,0,0,0,0,'Iron Rune Steelguard - Group 0: Execute SAI ID 0 only if invoker is ''Iron Rune Construct'''),
(22,1,23675,0,0,31,0,3,24825,0,0,0,0,'Iron Rune Runemaster - Group 0: Execute SAI ID 0 only if invoker is ''Iron Rune Construct'''),
(22,1,24845,0,0,31,0,3,24825,0,0,0,0,'Baelgun''s Event Generator (Cave) - Group 0: Execute SAI ID 0 only if invoker is ''Iron Rune Construct'''),
(22,1,24718,0,0,31,0,3,24823,0,0,0,0,'Lebronski - Group 0: Execute SAI ID 0 only if invoker is ''Iron Rune Construct'''),

(13,1,44550,0,0,31,0,3,24820,0,0,0,0,'Spell ''Collect Data'' - Group 0: Implicit target creature ''Iron Dwarf Relic'''),
(17,0,44550,0,0,29,0,24820,5,0,0,0,0,'Spell ''Collect Data'' - Group 0: Can cast only if nearby creature ''Iron Dwarf Relic'''),

(13,1,44610,0,0,31,0,3,24824,0,0,0,0,'Spell ''Collect Data'' - Group 0: Implicit target creature ''Iron Dwarf Relic'''),
(17,0,44610,0,0,29,0,24824,5,0,0,0,0,'Spell ''Collect Data'' - Group 0: Can cast only if nearby creature ''Iron Dwarf Relic''');
