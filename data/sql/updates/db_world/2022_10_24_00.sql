UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 15661;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 15661;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(15661,0,0,0,1,0,100,0,5000,5000,5000,5000,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Baby Shark - OOC - Kill Unit (CONDITION_IN_WATER)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 15661;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,15661,0,0,40,1,0,0,0,1,0,0,'Baby Shark - Group 0: Execute SAI ID 0 only if not in water');
