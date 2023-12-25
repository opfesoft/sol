DELETE FROM `spell_script_names` WHERE `spell_id` = 23019;

DELETE FROM `creature_text` WHERE `CreatureId` = 12396;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(12396,0,0,'A sacrifice will be due if I am ever called upon, mortal...',12,8,100,0,0,0,9590,0,'Doomguard Commander');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 12396;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 1239600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(12396,0,0,0,11,0,100,0,0,0,0,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomguard Commander - On Respawn - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(12396,0,1,0,0,0,100,0,5000,8000,18000,24000,0,11,16005,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Doomguard Commander - IC - Cast ''Rain of Fire'''),
(12396,0,2,0,0,0,100,0,12000,15000,20000,25000,0,11,16727,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Doomguard Commander - IC - Cast ''War Stomp'''),
(12396,0,3,0,0,0,100,0,2000,4000,25000,32000,0,11,20812,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Doomguard Commander - IC - Cast ''Cripple'''),
(12396,0,4,0,0,0,100,0,7000,14000,17000,22000,0,11,15090,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Doomguard Commander - IC - Cast ''Dispel Magic'''),
(12396,0,5,0,8,0,100,0,23019,0,0,0,0,80,1239600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomguard Commander - On Spellhit ''Crystal Prison Dummy DND'' - Call Timed Action List'),

(1239600,9,0,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomguard Commander - On Script - Set Home Position'),
(1239600,9,1,0,0,0,100,0,0,0,0,0,0,89,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomguard Commander - On Script - Disable Random Movement'),
(1239600,9,2,0,0,0,100,0,0,0,0,0,0,18,768,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomguard Commander - On Script - Set ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_IMMUNE_TO_NPC'''),
(1239600,9,3,0,0,0,100,0,1000,1000,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomguard Commander - On Script - Say Line 0'),
(1239600,9,4,0,0,0,100,0,0,0,0,0,0,11,23020,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomguard Commander - On Script - Cast ''Crystal Imprisonment'''),
(1239600,9,5,0,0,0,100,0,2000,2000,0,0,0,11,23022,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomguard Commander - On Script - Cast ''Crystal Prison Conjure DND'''),
(1239600,9,6,0,0,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Doomguard Commander - On Script - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 23015;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(17,0,23015,0,0,31,1,3,12396,0,0,173,0,'Spell ''Crystal Prison'' - Group 0: Can cast if target is ''Doomguard Commander''');
