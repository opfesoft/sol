DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (28636,28639);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2863900;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 190695;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(190695,1,0,1,64,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Heb''Jin''s Drum - On Gossip Hello - Store Target 1 (Invoker)'),
(190695,1,1,2,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,28639,0,0,0,0,0,0,0,'Heb''Jin''s Drum - Linked - Send Target 1 (Heb''Jin''s Bat)'),
(190695,1,2,3,61,0,100,0,0,0,0,0,0,100,1,0,0,0,0,0,19,28636,0,0,0,0,0,0,0,'Heb''Jin''s Drum - Linked - Send Target 1 (Heb''Jin)'),
(190695,1,3,0,61,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,19,28639,0,0,0,0,0,0,0,'Heb''Jin''s Drum - Linked - Set Data 1 1 (Heb''Jin''s Bat)'),

(28636,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin - On Respawn - Disable Event Phase Reset'),
(28636,0,1,2,61,0,100,0,0,0,0,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin - Linked - Set Event Phase 0'),
(28636,0,2,3,61,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin - Linked - Set Flag ''UNIT_FLAG_IMMUNE_TO_PC'''),
(28636,0,3,0,61,0,100,0,0,0,0,0,0,116,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin - Linked - Set Corpse Delay'),
(28636,0,4,0,0,0,100,0,5000,5000,15000,15000,0,11,12734,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin - IC - Cast ''Ground Smash'''),
(28636,0,5,0,0,0,100,0,2000,2000,13000,13000,0,11,15548,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin - IC - Cast ''Thunderclap'''),
(28636,0,6,0,13,0,100,0,6000,21000,0,0,0,11,12555,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Heb''Jin - On Victim Casting - Cast ''Pummel'''),
(28636,0,7,0,38,0,100,0,1,1,0,0,0,1,1,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Heb''Jin - On Data Set 1 1 - Say Line 1 (Stored Target 1)'),
(28636,0,8,9,38,0,100,0,2,2,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin - On Data Set 2 2 - Say Line 2'),
(28636,0,9,10,61,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin - Linked - Set Home Position'),
(28636,0,10,11,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin - Linked - Set Event Phase 1'),
(28636,0,11,12,61,0,100,0,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin - Linked - Remove Flag ''UNIT_FLAG_IMMUNE_TO_PC'''),
(28636,0,12,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Heb''Jin - Linked - Start Attack (Stored Target 1)'),
(28636,0,13,0,1,1,100,0,5000,5000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin - OOC - Force Despawn (Event Phase 1)'),

(28639,0,0,1,11,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Respawn - Disable Event Phase Reset'),
(28639,0,1,2,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - Linked - Set Event Phase 1'),
(28639,0,2,3,61,0,100,0,0,0,0,0,0,18,258,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - Linked - Set Flag ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_NON_ATTACKABLE'''),
(28639,0,3,4,61,0,100,0,0,0,0,0,0,103,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - Linked - Set Root Off'),
(28639,0,4,0,61,0,100,0,0,0,0,0,0,116,10,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - Linked - Set Corpse Delay'),
(28639,0,5,6,38,1,100,0,1,1,0,0,0,22,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Data Set 1 1 - Set Event Phase 2 (Event Phase 1) (CONDITION_NEAR_CREATURE)'),
(28639,0,6,0,61,0,100,0,0,0,0,0,0,80,2863900,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - Linked - Call Timed Action List'),
(28639,0,7,0,60,4,100,0,5000,5000,5000,5000,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Update - Force Despawn (Event Phase 3) (CONDITION_NEAR_CREATURE)'),
(28639,0,8,9,8,0,100,0,52151,0,0,0,0,103,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Spellhit ''Bat Net'' - Set Root On'),
(28639,0,9,0,61,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - Linked - Set Home Position'),

(2863900,9,0,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Script - Set Active On'),
(2863900,9,1,0,0,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,19,28636,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Script - Set Active On (Heb''Jin)'),
(2863900,9,2,0,0,0,100,0,500,500,0,0,0,1,0,0,0,0,0,0,19,28636,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Script - Say Line 0 (Heb''Jin)'),
(2863900,9,3,0,0,0,100,0,4500,4500,0,0,0,45,1,1,0,0,0,0,19,28636,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Script - Set Data 1 1 (Heb''Jin)'),
(2863900,9,4,0,0,0,100,0,1000,1000,0,0,0,86,46598,0,19,28636,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Script - Cross Cast ''Ride Vehicle Hardcoded'' (Heb''Jin)'),
(2863900,9,5,0,0,0,100,0,2000,2000,0,0,0,69,0,0,0,0,0,0,8,0,0,0,0,5926,-3813,363,0,'Heb''Jin''s Bat - On Script - Move To Position'),
(2863900,9,6,0,0,0,100,0,10000,10000,0,0,0,45,2,2,0,0,0,0,19,28636,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Script - Set Data 2 2 (Heb''Jin)'),
(2863900,9,7,0,0,0,100,0,2000,2000,0,0,0,28,46598,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Script - Remove Aura ''Ride Vehicle Hardcoded'''),
(2863900,9,8,0,0,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Script - Set Home Position'),
(2863900,9,9,0,0,0,100,0,0,0,0,0,0,19,258,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Script - Remove Flag ''UNIT_FLAG_IMMUNE_TO_PC'' & ''UNIT_FLAG_NON_ATTACKABLE'''),
(2863900,9,10,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Script - Start Attack (Stored Target 1)'),
(2863900,9,11,0,0,0,100,0,0,0,0,0,0,22,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Heb''Jin''s Bat - On Script - Set Event Phase 3');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 28639 AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,6,28639,0,0,29,1,28636,20,0,0,0,0,'Heb''Jin''s Bat - Group 0: Execute SAI ID 5 only if near creature ''Heb''Jin'''),
(22,8,28639,0,0,29,1,28636,20,0,1,0,0,'Heb''Jin''s Bat - Group 0: Execute SAI ID 7 only if not near creature ''Heb''Jin''');
