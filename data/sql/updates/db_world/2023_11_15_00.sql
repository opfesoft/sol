DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = -18587;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(-18587,0,0,0,1,0,100,0,1000,1000,1000,1000,0,11,42491,34,0,0,0,0,1,0,0,0,0,0,0,0,0,'Zeppelin Power Core - OOC - Cast ''Energized Periodic''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 13 AND `SourceEntry` IN (42490,42492);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,42490,0,0,31,0,4,0,0,0,0,0,'Spell ''Energized!'' - Group 0: Implicit target players'),
(13,1,42490,0,0,47,0,11174,10,0,0,0,0,'Spell ''Energized!'' - Group 0: Implicit target players if quest ''Corrosion Prevention'' is in progress or completed'),
(13,1,42490,0,1,31,0,3,23832,0,0,0,0,'Spell ''Energized!'' - Group 1: Implicit target creature ''Zeppelin Power Core''');
