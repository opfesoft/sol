DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 9631;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,9631,13031,0,0,47,0,12249,66,0,1,0,0,'Hierophant Thayreen - Group 0: Show gossip text 13031 if quest ''Ursoc, the Bear God'' is not completed or rewarded'),
(14,9631,13032,0,0,47,0,12249,66,0,0,0,0,'Hierophant Thayreen - Group 0: Show gossip text 13032 if quest ''Ursoc, the Bear God'' is completed or rewarded');
