DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 24018;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 24014 AND `id` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(24018,0,0,0,1,0,100,1,1000,1000,1000,1000,0,11,43151,4096,0,0,0,0,10,95036,0,0,0,0,0,0,0,'Necro Overlord Mezhen - OOC - Cast ''Necrolord: Purple Beam'''),
(24018,0,1,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Necro Overlord Mezhen - On Aggro - Say Line 0'),
(24018,0,2,0,0,0,100,0,3000,7000,10000,20000,0,11,32862,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Necro Overlord Mezhen - IC - Cast ''Drain Soul'''),
(24018,0,3,0,0,0,100,0,8000,11000,15000,20000,0,11,43559,0,0,0,0,0,11,24014,30,2,0,0,0,0,0,'Necro Overlord Mezhen - IC - Cast ''Raise Dead'' (Necrolord)'),
(24018,0,4,0,1,0,100,0,5000,5000,0,0,0,41,0,0,0,0,0,0,232,24344,0,0,0,0,0,0,0,'Necro Overlord Mezhen - OOC - Force Despawn (Minion ''Gjalerbron Skeleton'')'),

(24014,0,9,0,8,0,100,0,43559,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Necrolord - On Spellhit ''Raise Dead'' - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13,17) AND `SourceEntry` = 43559;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,43559,0,0,31,0,3,24014,0,0,0,0,'Spell ''Raise Dead'' - Group 0: Implicit target creature ''Necrolord'''),
(13,1,43559,0,0,154,0,0,0,0,0,0,0,'Spell ''Raise Dead'' - Group 0: Implicit target has to be corpse'),
(17,0,43559,0,0,29,0,24014,30,2,0,0,0,'Spell ''Raise Dead'' - Group 0: Can cast if nearby creature ''Necrolord'' (corpse)');
