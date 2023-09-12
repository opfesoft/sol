DELETE FROM `spell_script_names` WHERE `spell_id` = 52602;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(52602,'spell_summon_caster_back_z_offset_20');

UPDATE `creature` SET `position_x` = 6315.84, `position_y` = -2254.04, `position_z` = 259.786 WHERE `guid` = 112184;
UPDATE `creature` SET `position_x` = 6352.74, `position_y` = -2187.95, `position_z` = 267.607 WHERE `guid` = 112183;

DELETE FROM `creature_text` WHERE `CreatureId` = 28873;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(28873,0,0,'We gunna drive all da scourge outta Zul''Drak, mon - startin'' with you!',12,0,100,53,0,0,28997,0,'Drakkari Chieftain'),
(28873,0,1,'Die, nasty scourge!',12,0,100,53,0,0,28995,0,'Drakkari Chieftain'),
(28873,0,2,'I come to avenge my bruddas, mon!',12,0,100,53,0,0,28994,0,'Drakkari Chieftain'),
(28873,0,3,'Now you gunna die, mon!',12,0,100,53,0,0,28993,0,'Drakkari Chieftain'),
(28873,1,0,'Aaah....',12,0,100,0,0,0,28999,0,'Drakkari Chieftain'),
(28873,1,1,'Ooof!',12,0,100,0,0,0,29000,0,'Drakkari Chieftain'),
(28873,1,2,'Owww!',12,0,100,0,0,0,29001,0,'Drakkari Chieftain'),
(28873,1,3,'Wha?!...',12,0,100,0,0,0,28998,0,'Drakkari Chieftain');

UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` | 67108864 WHERE `entry` = 28843;
UPDATE `creature_template_addon` SET `bytes1` = 50331648 WHERE `entry` = 28875;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 28873;
UPDATE `creature_template` SET `AIName` = 'SmartAI', `HoverHeight` = 5, `InhabitType` = 4 WHERE `entry` = 28875;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (28843,28844,28873,28875);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2884400,2887300,2887500,2887501);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28843,0,0,1,11,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloated Abomination - On Respawn - Set Corpse Delay'),
(28843,0,1,2,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloated Abomination - Linked - Disable Event Phase Reset'),
(28843,0,2,0,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloated Abomination - Linked - Set Event Phase 0'),
(28843,0,3,0,23,0,100,0,52488,1,1000,1000,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloated Abomination - On Has Aura ''Charm Bloated Abomination'' - Set Event Phase 1'),
(28843,0,4,5,23,1,100,0,52488,0,1000,1000,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloated Abomination - On Has No Aura ''Charm Bloated Abomination'' (Event Phase 1) - Set Event Phase 0'),
(28843,0,5,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bloated Abomination - Linked - Force Despawn'),

(28844,0,0,0,11,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drakkari Skullcrusher - On Respawn - Set Corpse Delay'),

(28873,0,0,0,54,0,100,0,0,0,0,0,0,80,2887300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drakkari Chieftain - On Just Summoned - Call Timed Action List'),
(28873,0,1,2,8,0,100,0,52613,0,0,0,0,11,46957,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drakkari Chieftain - On Spellhit ''Ice Boulder'' - Cast ''Cosmetic - Stun (Permanent)'''),
(28873,0,2,0,61,0,100,0,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drakkari Chieftain - Linked - Say Line 1'),

(2887300,9,0,0,0,0,100,0,0,0,0,0,0,69,0,0,0,3,0,0,23,0,0,0,0,0,0,0,0,'Drakkari Chieftain - On Script - Move To Point 0 (Summoner)'),
(2887300,9,1,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drakkari Chieftain - On Script - Say Line 0'),
(2887300,9,2,0,0,0,100,0,3000,3000,0,0,0,11,52602,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Drakkari Chieftain - On Script - Cast ''Summon Gargoyle'''),

(28875,0,0,0,54,0,100,0,0,0,0,0,0,80,2887500,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shalewing - On Just Summoned - Call Timed Action List'),
(28875,0,1,0,34,0,100,0,8,1,0,0,0,86,46598,0,23,0,0,0,1,0,0,0,0,0,0,0,0,'Shalewing - On Point 1 Reached - Cross Cast ''Ride Vehicle Hardcoded'''),
(28875,0,2,0,27,0,100,0,0,0,0,0,0,80,2887501,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shalewing - On Passenger Boarded - Call Timed Action List'),

(2887500,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shalewing - On Script - Set Active On'),
(2887500,9,1,0,0,0,100,0,1000,1000,0,0,0,11,52613,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Shalewing - On Script - Cast ''Ice Boulder'' (Summoner)'),
(2887500,9,2,0,0,0,100,0,1000,1000,0,0,0,69,1,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Shalewing - On Script - Move To Point 1'),

(2887501,9,0,0,0,0,100,0,0,0,0,0,0,28,46957,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Shalewing - On Script - Remove Aura ''Cosmetic - Stun (Permanent)'' (Summoner)'),
(2887501,9,1,0,0,0,100,0,0,0,0,0,0,41,20000,0,0,0,0,0,23,0,0,0,0,0,0,0,0,'Shalewing - On Script - Force Despawn (Summoner)'),
(2887501,9,2,0,0,0,100,0,0,0,0,0,0,41,20500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Shalewing - On Script - Force Despawn'),
(2887501,9,3,0,0,0,100,0,2000,2000,0,0,0,69,2,0,0,0,0,0,8,0,0,0,0,6279.06,-2144.08,395.522,0,'Shalewing - On Script - Move To Point 2');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 52497;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,3,52497,0,0,31,0,3,28844,0,0,0,0,'Spell ''Flatulate'' - Group 0: Implicit target creature ''Drakkari Skullcrusher''');
