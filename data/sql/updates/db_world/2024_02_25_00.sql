UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 256 | 512 WHERE `entry` = 21838;
UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 2 | 256 WHERE `entry` = 23377;

DELETE FROM `creature_template_addon` WHERE `entry` = 21838;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(21838,0,0,0,1,0,0,'41408');

UPDATE `creature` SET `position_x` = -3806.3, `position_y` = 3490.06, `position_z` = 287.113 WHERE `guid` = 75536;
UPDATE `creature` SET `position_x` = -3807.99, `position_y` = 3519.5, `position_z` = 286.652 WHERE `guid` = 75538;
UPDATE `creature` SET `position_x` = -3779.52, `position_y` = 3526.1, `position_z` = 286.621 WHERE `guid` = 75537;

DELETE FROM `creature` WHERE `guid` BETWEEN 3009681 AND 3009683;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(3009681,23377,530,0,0,1,1,0,0,-3712.53,3514.54,325.551,3.2779,-1,0,1,0,2,0,0,0),
(3009682,23377,530,0,0,1,1,0,0,-3712.06,3510.39,319.951,3.2779,-1,0,1,0,0,0,0,0),
(3009683,23377,530,0,0,1,1,0,0,-3712.9,3517.81,319.951,3.2779,-1,0,1,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 3009681;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `maxAggroRadius`, `auras`)
VALUES
(3009681,30096810,21152,0,1,0,0,NULL,NULL);

DELETE FROM `creature_formations` WHERE `leaderGUID` = 3009681;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`)
VALUES
(3009681,3009681,0,0,0),
(3009681,3009682,5,315,0),
(3009681,3009683,5,45,0);

DELETE FROM `creature_text` WHERE `CreatureId` IN (21838,23377);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(21838,0,0,'Who calls me to this world?  The stars are not yet aligned... my powers fail me!  You will pay for this!',12,0,100,0,0,0,21639,0,'Terokk'),
(21838,1,0,'Show me what you''re made of, $n!',14,0,100,0,0,0,21327,0,'Terokk'),
(21838,2,0,'Kwa! You cannot kill me, I am immortal!',14,0,100,0,0,0,24020,0,'Terokk'),
(21838,3,0,'%s becomes enraged as his shield shatters.',41,0,100,0,0,0,21328,0,'Terokk'),

(23377,0,0,'Enemy sighted!  Fall into formation and prepare for bombing maneuvers!',14,0,100,0,0,0,21439,0,'Skyguard Ace'),
(23377,1,0,'Quickly! Use the flames and support the ground troops. Its ancient magic should cleanse Terokk''s shield.',14,0,100,0,0,0,24021,0,'Skyguard Ace'),
(23377,2,0,'They did it!  Enemy down!  Return to base!',14,0,100,0,0,0,21437,0,'Skyguard Ace');

DELETE FROM `gossip_menu_option` WHERE `MenuID` = 8687 AND `OptionID` = 1;
UPDATE `event_scripts` SET `datalong2` = 30000 WHERE `id` = 15014;

DELETE FROM `spell_linked_spell` WHERE `spell_trigger` = -40733;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`)
VALUES
(-40733,28747,0,'Divine Shield - Cast ''Frenzy'' On Expiration');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 23277;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21838,23377,-3009681,23277);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 185928;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2183800,2183801,2337700,2327700);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(185928,1,0,1,62,0,100,0,8687,0,0,0,0,85,41004,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ancient Skull Pile - On Option 0 Selected - Invoker Cast ''Summon Terokk'' (Invoker)'),
(185928,1,1,2,61,0,100,0,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Ancient Skull Pile - Linked - Close Gossip (Invoker)'),
(185928,1,2,0,61,0,100,0,0,0,0,0,0,233,900,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ancient Skull Pile - Linked - Despawn GO'),

(21838,0,0,0,11,0,100,0,0,0,0,0,0,80,2183800,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - On Respawn - Call Timed Action List'),
(21838,0,1,0,4,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - On Aggro - Set Event Phase 1'),
(21838,0,2,0,0,0,100,0,4000,7000,15000,20000,0,11,40721,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Terokk - IC - Cast ''Shadow Bolt Volley'''),
(21838,0,3,0,0,0,100,0,6000,9000,7000,9000,0,11,15284,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Terokk - IC - Cast ''Cleave'''),
(21838,0,4,0,0,1,100,0,30000,40000,30000,40000,0,80,2183801,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - IC (Event Phase 1) - Call Timed Action List'),
(21838,0,5,0,31,0,100,0,40726,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Terokk - On Target Hit By Spell ''Chosen One'' - Say Line 1'),
(21838,0,6,0,2,0,100,0,0,80,0,0,0,70,0,0,0,0,0,0,11,23377,100,0,0,0,0,0,0,'Terokk - Between 0-80% Health - Respawn Target (Skyguard Ace)'),
(21838,0,7,8,2,0,100,0,0,25,0,0,0,11,40733,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - Between 0-25% Health - Cast ''Divine Shield'''),
(21838,0,8,9,61,0,100,0,0,0,0,0,0,42,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - Linked - Remove Invincibility HP Level'),
(21838,0,9,10,61,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - Linked - Set Event Phase 2'),
(21838,0,10,11,61,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - Linked - Say Line 2'),
(21838,0,11,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,3009681,0,0,0,0,0,0,0,'Terokk - Linked - Set Data 1 1 (Skyguard Ace)'),
(21838,0,12,0,23,0,100,0,40657,1,1000,1000,0,28,40733,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - On Has Aura ''Ancient Flames'' - Remove Aura ''Divine Shield'''),
(21838,0,13,0,23,0,100,1,28747,1,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - On Has Aura ''Frenzy'' (No Repeat) - Say Line 3'),
(21838,0,14,0,0,2,100,0,5000,10000,5000,10000,0,11,40733,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - IC (Event Phase 2) - Cast ''Divine Shield'''),
(21838,0,15,0,6,0,100,0,0,0,0,0,0,45,3,3,0,0,0,0,10,3009681,0,0,0,0,0,0,0,'Terokk - On Death - Set Data 3 3 (Skyguard Ace)'),
(21838,0,16,17,7,0,100,0,0,0,0,0,0,45,4,4,0,0,0,0,10,3009681,0,0,0,0,0,0,0,'Terokk - On Evade - Set Data 4 4 (Skyguard Ace)'),
(21838,0,17,18,61,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - Linked - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(21838,0,18,0,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - Linked - Force Despawn'),

(2183800,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - On Script - Set Active On'),
(2183800,9,1,0,0,0,100,0,0,0,0,0,0,42,0,25,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - On Script - Set Invincibility HP Level'),
(2183800,9,2,0,0,0,100,0,0,0,0,0,0,11,24240,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - On Script - Cast ''Spawn - Red Lightning'''),
(2183800,9,3,0,0,0,100,0,2000,2000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - On Script - Say Line 0'),
(2183800,9,4,0,0,0,100,0,8000,8000,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terokk - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(2183800,9,5,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Terokk - On Script - Start Attack (Summoner)'),

(2183801,9,0,0,0,0,100,0,0,0,0,0,0,11,40726,0,0,0,0,0,5,0,0,0,0,0,0,0,0,'Terokk - On Script - Cast ''Chosen One'''),
(2183801,9,1,0,0,0,100,0,500,500,0,0,0,11,40722,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Terokk - On Script - Cast ''Will of the Arakkoa God'''),

(-3009681,0,0,1,11,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Ace - On Respawn - Set React State ''Passive'''),
(-3009681,0,1,2,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Ace - Linked - Disable Event Phase Reset'),
(-3009681,0,2,3,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Ace - Linked - Set Event Phase 0'),
(-3009681,0,3,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Ace - Linked - Say Line 0'),
(-3009681,0,4,5,38,0,100,0,1,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Ace - On Data Set 1 1 - Set Event Phase 1'),
(-3009681,0,5,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Ace - Linked - Say Line 1'),
(-3009681,0,6,0,60,1,100,0,10000,15000,30000,40000,0,11,40655,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Ace - On Update (Event Phase 1) - Cast ''Skyguard Flare'''),
(-3009681,0,7,0,38,0,100,0,2,2,0,0,0,11,40657,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Skyguard Ace - On Data Set 2 2 - Cast ''Ancient Flames'' (Invoker)'),
(-3009681,0,8,9,38,0,100,0,3,3,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Ace - On Data Set 3 3 - Say Line 2'),
(-3009681,0,9,10,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,11,23377,20,1,0,0,0,0,0,'Skyguard Ace - Linked - Force Despawn (Skyguard Ace)'),
(-3009681,0,10,0,61,0,100,0,0,0,0,0,0,41,5000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Ace - Linked - Force Despawn'),
(-3009681,0,11,10,38,0,100,0,4,4,0,0,0,41,5000,0,0,0,0,0,11,23377,20,1,0,0,0,0,0,'Skyguard Ace - On Data Set 4 4 - Force Despawn (Skyguard Ace)'),

(23377,0,0,0,11,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Ace - On Respawn - Set React State ''Passive'''),

(23277,0,0,0,54,0,100,0,0,0,0,0,0,80,2327700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Target - On Just Summoned - Call Timed Action List'),

(2327700,9,0,0,0,0,100,0,12000,18000,0,0,0,45,2,2,0,0,0,0,10,3009681,0,0,1,0,0,0,0,'Skyguard Target - On Script - Set Data 2 2 (Skyguard Ace)'),
(2327700,9,1,0,0,0,100,0,2000,2000,0,0,0,28,40656,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Target - On Script - Remove Aura ''Skyguard Flare'''),
(2327700,9,2,0,0,0,100,0,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Skyguard Target - On Script - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 23377;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 8687;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 40722;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,8687,0,0,0,2,0,32720,1,0,0,0,0,'GO ''Ancient Skull Pile'' - Group 0: Show gossip option 0 if item ''Time-Lost Offering'' (Count: 1) is in the inventory'),
(13,3,40722,0,0,1,0,40726,0,0,1,0,0,'Spell ''Will of the Arakkoa God'' - Group 0: Implicit target without aura ''Chosen One''');

DELETE FROM `waypoint_data` WHERE `id` = 30096810;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(30096810,1,-3774.55,3514.51,325.551,NULL,0,0,0,0,100,0),
(30096810,2,-3779.63,3502.11,325.551,NULL,0,0,0,0,100,0),
(30096810,3,-3794.88,3497.48,325.551,NULL,0,0,0,0,100,0),
(30096810,4,-3806.32,3502.22,325.551,NULL,0,0,0,0,100,0),
(30096810,5,-3808.63,3515.7,325.551,NULL,0,0,0,0,100,0),
(30096810,6,-3799.24,3530.29,325.551,NULL,0,0,0,0,100,0),
(30096810,7,-3783.6,3524.59,325.551,NULL,0,0,0,0,100,0);
