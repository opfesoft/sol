UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `id` IN (25880,24613);
UPDATE `creature` SET `position_x` = 4080.69, `position_y` = 5461.74, `position_z` = 31.7082, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 109124;
DELETE FROM `creature_addon` WHERE `guid` = 98229;

DELETE FROM `creature_loot_template` WHERE `Entry` = 25802 AND `Item` = 35234;

DELETE FROM `creature_text` WHERE `CreatureId` = 25802;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(25802,0,0,'You challenge Kaw, destroyer of mammoths? Then face me and feel my thunder!',14,0,100,22,0,0,25071,0,'Kaw the Mammoth Destroyer'),
(25802,1,0,'Kaw''s halberd breaks in two and falls to the ground!',41,0,100,0,0,930,25087,0,'Kaw the Mammoth Destroyer');

DELETE FROM `areatrigger_scripts` WHERE `entry` = 4896;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`)
VALUES
(4896,'SmartTrigger');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 25743 AND `id` > 2;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (25802,25881);
DELETE FROM `smart_scripts` WHERE `source_type` = 2 AND `entryorguid` = 4896;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2580200,2588100);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(25743,0,3,0,27,0,100,0,0,0,0,0,0,212,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wooly Mammoth Bull - On Passenger Boarded - Stop Motion'),
(25743,0,4,0,28,0,100,0,0,0,0,0,0,41,1000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Wooly Mammoth Bull - On Passenger Removed - Force Despawn'),

(4896,2,0,0,46,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,10,114932,25802,0,0,0,0,0,0,'Areatrigger - On Trigger - Set Data 1 1 (Kaw the Mammoth Destroyer)'),

(25802,0,0,1,11,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - On Respawn - Set ''UNIT_FLAG_IMMUNE_TO_PC'''),
(25802,0,1,2,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - Linked - Disable Event Phase Reset'),
(25802,0,2,3,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - Linked - Set Event Phase 1'),
(25802,0,3,4,61,0,100,0,0,0,0,0,0,48,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - Linked - Set Active Off'),
(25802,0,4,0,61,0,100,0,0,0,0,0,0,70,0,0,0,0,0,0,10,98229,25881,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - Linked - Respawn Target (Moria)'),
(25802,0,5,0,38,1,100,1,1,1,0,0,0,80,2580200,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - On Data Set 1 1 (Event Phase 1, No Repeat) - Call Timed Action List'),
(25802,0,6,0,34,0,100,0,8,1,0,0,0,11,46598,2,0,0,0,0,10,98229,25881,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - On Reached Point 1 - Cast ''Ride Vehicle Hardcoded'''),
(25802,0,7,8,6,0,100,0,0,0,0,0,0,11,46310,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - On Death - Cast ''Drop War Halberd'''),
(25802,0,8,0,61,0,100,1,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - Linked - Say Line 1'),

(2580200,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - On Script - Set Active On'),
(2580200,9,1,0,0,0,100,0,0,0,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - On Script - Set Event Phase 2'),
(2580200,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - On Script - Say Line 0'),
(2580200,9,3,0,0,0,100,0,3000,3000,0,0,0,5,53,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kaw the Mammoth Destroyer - On Script - Play Emote ''ONESHOT_BATTLEROAR'''),
(2580200,9,4,0,0,0,100,0,3000,3000,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,3973.97,5477.62,35.616,0,'Kaw the Mammoth Destroyer - On Script - Move To Position'),

(25881,0,0,1,11,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moria - On Respawn - Set ''UNIT_FLAG_IMMUNE_TO_PC'''),
(25881,0,1,2,61,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moria - Linked - Disable Event Phase Reset'),
(25881,0,2,0,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moria - Linked - Set Event Phase 1'),
(25881,0,3,0,27,0,100,0,0,0,0,0,0,80,2588100,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moria - On Passenger Boarded - Call Timed Action List'),
(25881,0,4,6,1,2,100,0,60000,60000,0,0,0,41,1500,0,0,0,0,0,10,114932,25802,0,0,0,0,0,0,'Moria - OOC (Event Phase 2) - Force Despawn (Kaw the Mammoth Destroyer)'),
(25881,0,5,6,21,0,100,0,0,0,0,0,0,41,1500,0,0,0,0,0,10,114932,25802,0,0,0,0,0,0,'Moria - On Reached Home - Force Despawn (Kaw the Mammoth Destroyer)'),
(25881,0,6,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moria - Linked - Force Despawn'),

(2588100,9,0,0,0,0,100,0,2000,2000,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moria - On Script - Set Event Phase 2'),
(2588100,9,1,0,0,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,10,114932,25802,0,0,0,0,0,0,'Moria - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'' (Kaw the Mammoth Destroyer)'),
(2588100,9,2,0,0,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Moria - On Script - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(2588100,9,3,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,0,'Moria - On Script - Start Attack (Closest Player)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 4896 AND `SourceId` = 2;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,4896,2,0,47,0,11879,8,0,0,0,0,'Areatrigger - Group 0: Execute SAI ID 0 if quest ''Kaw the Mammoth Destroyer'' is in progress'),
(22,1,4896,2,0,1,0,46260,1,0,0,0,0,'Areatrigger - Group 0: Execute SAI ID 0 only if has aura ''Riding Wooly Mammoth Bull''');
