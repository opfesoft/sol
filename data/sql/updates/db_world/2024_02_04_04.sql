DELETE FROM `areatrigger_scripts` WHERE `entry` = 4984;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`)
VALUES
(4984,'SmartTrigger');

UPDATE `creature_addon` SET `maxAggroRadius` = 7 WHERE `guid` IN (102214,106120);

DELETE FROM `smart_scripts` WHERE `source_type` = 2 AND `entryorguid` = 4984;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27246;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2724600;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4984,2,0,0,46,0,100,0,4984,0,0,0,0,45,1,1,0,0,0,0,19,27246,0,0,0,0,0,0,0,'Areatrigger (New Hearthglen) - On Trigger - Set Data 1 1 (Bishop Street)'),

(27246,0,0,0,38,0,100,0,1,1,60000,60000,0,80,2724600,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bishop Street - On Data Set 1 1 - Call Timed Action List'),
(27246,0,1,0,4,0,100,0,0,0,0,0,0,1,2,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Bishop Street - On Aggro - Say Line 2'),
(27246,0,2,0,0,0,100,0,0,0,3400,4800,0,11,20820,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Bishop Street - IC - Cast ''Holy Smite'''),
(27246,0,3,0,0,0,100,0,12000,16000,45000,55000,0,11,11974,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bishop Street - IC - Cast ''Power Word: Shield'''),

(2724600,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bishop Street - On Script - Say Line 0'),
(2724600,9,1,0,0,0,100,0,4000,4000,0,0,0,11,48183,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bishop Street - On Script - Cast ''Blessing of the Light'''),
(2724600,9,2,0,0,0,100,0,4000,4000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Bishop Street - On Script - Say Line 1');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 4984 AND `SourceId` = 2;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` = 48183;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,4984,2,0,47,0,12254,8,0,0,0,0,'Areatrigger (New Hearthglen) - Group 0: Execute SAI ID 0 if quest ''Without a Prayer'' is in progress'),

(13,1,48183,0,0,31,0,3,27203,0,0,0,0,'Spell ''Blessing of the Light'' - Group 0: Implicit target creature ''Onslaught Footman''');
