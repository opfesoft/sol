DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 9750;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,9750,13375,0,0,47,0,12671,64,0,1,0,0,'Creature ''Pilot Vic'' - Group 0: Show gossip text 13375 if quest ''Reconnaissance Flight'' is not rewarded'),
(14,9750,13376,0,0,47,0,12671,64,0,0,0,0,'Creature ''Pilot Vic'' - Group 0: Show gossip text 13376 if quest ''Reconnaissance Flight'' is rewarded');
