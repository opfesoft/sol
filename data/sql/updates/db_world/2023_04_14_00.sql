DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 17014;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(17014,0,0,0,1,0,100,0,30000,300000,0,0,0,11,34842,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - OOC - Cast ''De-Materialize'' (CONDITION_NEAR_CREATURE)'),
(17014,0,1,0,0,0,100,0,5000,5000,10000,15000,0,11,34259,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - IC - Cast ''Fear'''),
(17014,0,2,3,2,0,100,1,0,10,0,0,0,11,34233,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - Between 0-10% Health - Cast ''Collapse'' (No Repeat)'),
(17014,0,3,0,61,0,100,0,0,0,0,0,0,241,500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - Linked - Set Kill Delay'),
(17014,0,4,0,8,0,100,0,34233,0,0,0,0,11,34234,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - On Spellhit ''Collapse'' - Cast ''Collapse'''),
(17014,0,5,0,8,0,100,0,34842,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Collapsing Voidwalker - On Spellhit ''De-Materialize'' - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 17014 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,17014,0,0,29,1,19681,20,0,0,0,0,'Collapsing Voidwalker - Group 0: Execute SAI ID 0 only if near creature ''Void Spawner L''');
