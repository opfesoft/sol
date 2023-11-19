DELETE FROM `gossip_menu` WHERE `MenuID` = 7311 AND `TextID` = 8679;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(7311,8679);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 7311;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,7311,8679,0,0,16,0,128,0,0,0,0,0,'Creature ''Paelarin'' - Group 0: Show gossip text 8679 if player is Troll'),
(14,7311,8678,0,0,16,0,128,0,0,1,0,0,'Creature ''Paelarin'' - Group 0: Show gossip text 8678 if player is not Troll'),

(15,7311,0,0,0,16,0,128,0,0,1,0,0,'Creature ''Paelarin'' - Group 0: Show gossip option 0 if player is not Troll');
