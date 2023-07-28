UPDATE `creature_text` SET `TextRange` = 1 WHERE `CreatureID` = 28213 AND `GroupID` = 0;
UPDATE `creature` SET `position_x` = 5108.86, `position_y` = 3969.18, `position_z` = -56.105 WHERE `guid` = 100797;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (28127,28213);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(28127,0,0,0,8,0,20,0,50979,0,12000,12000,0,45,1,1,0,0,0,0,10,100797,28213,0,0,0,0,0,0,'Softknuckle - On Spellhit ''Scared Softknuckle'' - Set Data 1 1 (Hardknuckle Matriarch)'),

(28213,0,0,1,25,0,100,0,0,0,0,0,0,18,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hardknuckle Matriarch - On Reset - Set ''UNIT_FLAG_IMMUNE_TO_PC'''),
(28213,0,1,0,61,0,100,0,0,0,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hardknuckle Matriarch - Linked - Set Visibility Off'),
(28213,0,2,3,4,0,100,0,0,0,0,0,0,11,54287,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hardknuckle Matriarch - On Aggro - Cast ''Enrage'''),
(28213,0,3,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hardknuckle Matriarch - Linked - Say Line 0'),
(28213,0,4,0,0,0,100,0,6000,10000,12000,15000,0,11,61580,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hardknuckle Matriarch - IC - Cast ''Thunderstomp'''),
(28213,0,5,6,38,0,100,0,1,1,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hardknuckle Matriarch - On Data Set 1 1 - Remove ''UNIT_FLAG_IMMUNE_TO_PC'''),
(28213,0,6,7,61,0,100,0,0,0,0,0,0,47,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hardknuckle Matriarch - Linked - Set Visibility On'),
(28213,0,7,0,61,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,21,100,0,0,0,0,0,0,0,'Hardknuckle Matriarch - Linked - Start Attack (Closest Player)'),
(28213,0,8,9,6,0,100,0,0,0,0,0,0,45,1,1,0,0,0,0,9,28214,0,50,0,0,0,0,0,'Hardknuckle Matriarch - On Just Died - Set Data 1 1 (Goregek the Gorilla Hunter)'),
(28213,0,9,0,61,0,100,0,0,0,0,0,0,41,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Hardknuckle Matriarch - Linked - Force Despawn');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 28127;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 50979;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(17,0,50979,0,0,31,1,3,28127,0,0,0,0,'Spell ''Scared Softknuckle'' - Group 0: Can cast if target is ''Softknuckle'''),
(17,0,50979,0,0,1,1,50979,0,0,1,0,0,'Spell ''Scared Softknuckle'' - Group 0: Can cast if target has no aura ''Scared Softknuckle''');
