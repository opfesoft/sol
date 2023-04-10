DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 6685;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,6685,13062,0,0,12,0,50,0,0,0,0,0,'Creature ''Baron Revilgaz'' - Group 0: Show gossip text 13062 if event ''Pirates'' Day'' is active'),
(14,6685,7965,0,0,12,0,50,0,0,1,0,0,'Creature ''Baron Revilgaz'' - Group 0: Show gossip text 7965 if event ''Pirates'' Day'' is not active');
