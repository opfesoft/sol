DELETE FROM `creature_text` WHERE `CreatureId` = 17282;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(17282,0,0,'We''re never going to fire one of these, are we?',12,1,100,0,0,0,19346,0,'Falcon Watch Ranger'),
(17282,0,1,'Do we even have ammunition for these?',12,1,100,0,0,0,19347,0,'Falcon Watch Ranger'),
(17282,0,2,'What, exactly, are we ever going to fire these at?',12,1,100,0,0,0,19348,0,'Falcon Watch Ranger'),
(17282,1,0,'I wonder how far this would launch that white cat...',12,1,100,0,0,0,19349,0,'Falcon Watch Ranger');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 17282;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17282;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17282,0,0,0,9,0,100,0,5,30,2000,3000,1,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Falcon Watch Ranger - Within 5-30 Range - Cast ''Shoot'''),
(17282,0,1,0,2,0,100,0,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falcon Watch Ranger - Between 0-15% Health - Flee For Assist'),
(17282,0,2,0,1,0,100,0,180000,360000,180000,360000,0,244,1,3,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falcon Watch Ranger - OOC - Trigger Random Timed Event (CONDITION_OBJECT_ENTRY_GUID)'),
(17282,0,3,0,1,0,100,0,180000,360000,180000,360000,0,244,1,1,2,4,4,0,1,0,0,0,0,0,0,0,0,'Falcon Watch Ranger - OOC - Trigger Random Timed Event (CONDITION_OBJECT_ENTRY_GUID)'),
(17282,0,4,0,59,0,100,0,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falcon Watch Ranger - On Timed Event 1 Triggered - Say Line 0'),
(17282,0,5,0,59,0,100,0,2,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Falcon Watch Ranger - On Timed Event 1 Triggered - Say Line 1'),
(17282,0,6,0,59,0,100,0,3,0,0,0,0,1,0,0,0,0,0,0,10,62080,0,0,0,0,0,0,0,'Falcon Watch Ranger - On Timed Event 2 Triggered - Say Line 0 (Falcon Watch Ranger)'),
(17282,0,7,0,59,0,100,0,4,0,0,0,0,1,0,0,0,0,0,0,10,62074,0,0,0,0,0,0,0,'Falcon Watch Ranger - On Timed Event 3 Triggered - Say Line 0 (Falcon Watch Ranger)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 17282;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,3,17282,0,0,31,1,3,0,62073,0,0,0,'Creature ''Falcon Watch Ranger'' - Group 0: Execute SAI ID 2 if has GUID 62073'),
(22,4,17282,0,0,31,1,3,0,62075,0,0,0,'Creature ''Falcon Watch Ranger'' - Group 0: Execute SAI ID 3 if has GUID 62075');
