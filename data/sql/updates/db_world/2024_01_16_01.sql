DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 29857 AND `SourceEntry` = 55460;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 17 AND `SourceEntry` = 54997;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(18,29857,55460,0,0,47,0,12910,10,0,0,0,0,'Spellclick ''Ride Frostbite'' (Frostbite) - Group 0: Can cast if quest ''Sniffing Out the Perpetrator (Horde)'' is in progress or completed'),
(17,0,54997,0,0,31,1,3,29696,0,0,0,0,'Spell ''Cast Net'' - Group 0: Can cast if target is ''Stormforged Pursuer''');
