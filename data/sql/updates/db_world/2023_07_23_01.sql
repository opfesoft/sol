DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 1 AND `SourceGroup` IN (21382,21383,21492,21637,21809,21810,22308) AND `SourceEntry` = 31121;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(1,21382,31121,0,0,47,0,10722,74,0,0,0,0,'Creature ''Wyrmcult Zealot'' - Allow looting ''Costume Scraps'' if quest ''Meeting at the Blackwing Coven'' is in progress, completed or rewarded'),
(1,21383,31121,0,0,47,0,10722,74,0,0,0,0,'Creature ''Wyrmcult Acolyte'' - Allow looting ''Costume Scraps'' if quest ''Meeting at the Blackwing Coven'' is in progress, completed or rewarded'),
(1,21492,31121,0,0,47,0,10722,74,0,0,0,0,'Creature ''Wyrmcult Blessed'' - Allow looting ''Costume Scraps'' if quest ''Meeting at the Blackwing Coven'' is in progress, completed or rewarded'),
(1,21637,31121,0,0,47,0,10722,74,0,0,0,0,'Creature ''Wyrmcult Scout'' - Allow looting ''Costume Scraps'' if quest ''Meeting at the Blackwing Coven'' is in progress, completed or rewarded'),
(1,21809,31121,0,0,47,0,10722,74,0,0,0,0,'Creature ''Wyrmcult Poacher'' - Allow looting ''Costume Scraps'' if quest ''Meeting at the Blackwing Coven'' is in progress, completed or rewarded'),
(1,21810,31121,0,0,47,0,10722,74,0,0,0,0,'Creature ''Wyrmcult Hewer'' - Allow looting ''Costume Scraps'' if quest ''Meeting at the Blackwing Coven'' is in progress, completed or rewarded'),
(1,22308,31121,0,0,47,0,10722,74,0,0,0,0,'Creature ''Wyrmcult Hunter'' - Allow looting ''Costume Scraps'' if quest ''Meeting at the Blackwing Coven'' is in progress, completed or rewarded');
