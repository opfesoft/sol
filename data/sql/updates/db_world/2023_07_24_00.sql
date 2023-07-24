DELETE FROM `gossip_menu` WHERE `MenuID` = 7162 AND `TextID` = 8432;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(7162,8432);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 7162;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,7162,8431,0,0,47,0,9152,64,0,1,0,0,'Creature ''Rathis Tomber'' - Group 0: Show gossip text 8431 if quest ''Tomber''s Supplies'' is not rewarded'),
(14,7162,8432,0,0,47,0,9152,64,0,0,0,0,'Creature ''Rathis Tomber'' - Group 0: Show gossip text 8432 if quest ''Tomber''s Supplies'' is rewarded'),

(15,7162,0,0,0,8,0,9152,0,0,0,0,0,'Creature ''Rathis Tomber'' - Show gossip option 0 if quest ''Tomber''s Supplies'' is rewarded');
