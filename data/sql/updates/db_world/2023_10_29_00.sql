DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (13,17) AND `SourceEntry` = 30988;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(13,1,30988,0,0,31,0,3,17701,0,0,0,0,'Spell ''Place Draenei Banner'' - Group 0: Implicit target creature ''Lord Xiz'''),
(17,0,30988,0,0,29,0,17701,5,1,0,0,0,'Spell ''Place Draenei Banner'' - Group 0: Can cast if near dead creature ''Lord Xiz''');
