DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 38915;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(17,0,38915,0,0,31,1,3,16943,0,0,0,0,'Spell ''Mental Interference'' - Group 0: Can cast if target is ''Cyber-Rage Forgelord'''),
(17,0,38915,0,1,31,1,3,20928,0,0,0,0,'Spell ''Mental Interference'' - Group 1: Can cast if target is ''Ironspine Forgelord''');
