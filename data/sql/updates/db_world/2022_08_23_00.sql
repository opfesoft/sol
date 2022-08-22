DELETE FROM `creature_text` WHERE `CreatureId` IN (25416,25418);
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(25416,0,0,'Who dares?!',12,0,100,0,0,0,24675,0,'Simmer'),
(25416,0,1,'I will turn your bones to ash!',12,0,100,0,0,0,24676,0,'Simmer'),
(25416,0,2,'You will be consumed!',12,0,100,0,0,0,24677,0,'Simmer'),
(25416,0,3,'There is no escape from my rise!',12,0,100,0,0,0,24678,0,'Simmer'),
(25416,1,0,'STOP!',12,0,100,0,0,0,24666,0,'Simmer'),
(25416,2,0,'Tell Imperean that I will consider a cessation of hostilities. But first, Churn must stop his watery intrusions upon my rise!',12,0,100,0,0,0,24667,0,'Simmer'),
(25416,3,0,'I grow bored with you. Begone!',12,0,100,0,0,0,24668,0,'Simmer'),

(25418,0,0,'I will crush you under the weight of my waves!',12,0,100,0,0,0,24679,0,'Churn'),
(25418,0,1,'You dare come into my pool?!',12,0,100,0,0,0,24680,0,'Churn'),
(25418,0,2,'Your death will not be pleasant!',12,0,100,0,0,0,24681,0,'Churn'),
(25418,0,3,'Your corpse will feed my fish.',12,0,100,0,0,0,24682,0,'Churn'),
(25418,1,0,'WAIT... NO MORE!',12,0,100,0,0,0,24669,0,'Churn'),
(25418,2,0,'I... submit. As long as Simmer agrees to stop boiling my pool, I agree to an armistice.',12,0,100,0,0,0,24670,0,'Churn'),
(25418,3,0,'Now, remove yourself from my presence. You would be wise not to come within sight of me again.',12,0,100,0,0,0,24671,0,'Churn');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (25416,25418);
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` IN (2541600,2541800);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(25416,0,0,0,11,0,100,0,0,0,0,0,0,117,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Simmer - On Respawn - Enable Evade'),
(25416,0,1,0,4,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Simmer - On Aggro - Say Line 0'),
(25416,0,2,0,11,0,100,0,0,0,0,0,0,42,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Simmer - On Respawn - Set Invincibility HP 1%'),
(25416,0,3,0,0,0,100,0,2300,5300,8000,9900,0,11,50207,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Simmer - IC - Cast ''Boiling Blood'''),
(25416,0,4,0,2,0,100,1,0,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Simmer - Between 0-1% Health - Set Event Phase 1'),
(25416,0,5,0,32,1,100,1,1,100000,0,0,0,80,2541600,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Simmer - Damaged - Call Timed Action List (CONDITION_QUESTSTATE) (No Repeat) (Event Phase 1)'),
(25416,0,6,0,32,1,100,1,1,100000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Simmer - Damaged - Force Despawn (CONDITION_QUESTSTATE) (No Repeat) (Event Phase 1)'),

(2541600,9,0,0,0,0,100,0,0,0,0,0,0,117,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Simmer - On Script - Disable Evade'),
(2541600,9,1,0,0,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Simmer - On Script - Set Faction ''Friendly'''),
(2541600,9,2,0,0,0,100,0,0,0,0,0,0,27,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Simmer - On Script - Stop Attack'),
(2541600,9,3,0,0,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Simmer - On Script - Say Line 1'),
(2541600,9,4,0,0,0,100,0,0,0,0,0,0,85,45599,0,0,0,0,0,24,0,0,0,0,0,0,0,0,'Simmer - On Script - Invoker Cast ''Boiling Point: Simmer Kill Credit'''),
(2541600,9,5,0,0,0,100,0,5000,5000,0,0,0,1,2,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Simmer - On Script - Say Line 2'),
(2541600,9,6,0,0,0,100,0,8000,8000,0,0,0,1,3,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Simmer - On Script - Say Line 3'),
(2541600,9,7,0,0,0,100,0,3000,3000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Simmer - On Script - Force Despawn'),

(25418,0,0,0,11,0,100,0,0,0,0,0,0,117,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Churn - On Respawn - Enable Evade'),
(25418,0,1,0,4,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Churn - On Aggro - Say Line 0'),
(25418,0,2,0,11,0,100,0,0,0,0,0,0,42,0,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Churn - On Aggro - Set Invincibility HP 1%'),
(25418,0,3,0,0,0,100,0,2300,5300,8000,9900,0,11,50206,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Churn - IC - Cast ''Scalding Steam'''),
(25418,0,4,0,2,0,100,1,0,1,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Churn - Between 0-1% Health - Set Event Phase 1'),
(25418,0,5,0,32,1,100,1,1,100000,0,0,0,80,2541800,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Churn - Damaged - Call Timed Action List (CONDITION_QUESTSTATE) (No Repeat) (Event Phase 1)'),
(25418,0,6,0,32,1,100,1,1,100000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Churn - Damaged - Force Despawn (CONDITION_QUESTSTATE) (No Repeat) (Event Phase 1)'),

(2541800,9,0,0,0,0,100,0,0,0,0,0,0,117,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Churn - On Script - Disable Evade'),
(2541800,9,1,0,0,0,100,0,0,0,0,0,0,2,35,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Churn - On Script - Set Faction ''Friendly'''),
(2541800,9,2,0,0,0,100,0,0,0,0,0,0,27,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Churn - On Script - Stop Attack'),
(2541800,9,3,0,0,0,100,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Churn - On Script - Say Line 1'),
(2541800,9,4,0,0,0,100,0,0,0,0,0,0,85,45598,0,0,0,0,0,24,0,0,0,0,0,0,0,0,'Churn - On Script - Invoker Cast ''Boiling Point: Churn Kill Credit'''),
(2541800,9,5,0,0,0,100,0,5000,5000,0,0,0,1,2,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Churn - On Script - Say Line 2'),
(2541800,9,6,0,0,0,100,0,6000,6000,0,0,0,1,3,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Churn - On Script - Say Line 3'),
(2541800,9,7,0,0,0,100,0,6000,6000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Churn - On Script - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (25416,25418);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,6,25416,0,0,47,0,11627,10,0,0,0,0,'Simmer - Group 0: Execute SAI ID 5 only if quest ''Boiling Point'' is completed or in progress'),
(22,7,25416,0,0,47,0,11627,10,0,1,0,0,'Simmer - Group 0: Execute SAI ID 6 only if quest ''Boiling Point'' is not completed or in progress'),

(22,6,25418,0,0,47,0,11627,10,0,0,0,0,'Churn - Group 0: Execute SAI ID 5 only if quest ''Boiling Point'' is completed or in progress'),
(22,7,25418,0,0,47,0,11627,10,0,1,0,0,'Churn - Group 0: Execute SAI ID 6 only if quest ''Boiling Point'' is not completed or in progress');
