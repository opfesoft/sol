DELETE FROM `gossip_menu` WHERE `MenuID` = 9798 AND `TextID` = 13502;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(9798,13502);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 9798;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 29244;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,9798,13502,0,0,47,0,12212,64,0,1,0,0,'Creature ''Jesse Masters'' - Group 0: Show gossip text 13502 if quest ''Replenishing the Storehouse'' is not rewarded'),
(14,9798,13503,0,0,47,0,12212,64,0,0,0,0,'Creature ''Jesse Masters'' - Group 0: Show gossip text 13503 if quest ''Replenishing the Storehouse'' is rewarded'),

(15,9798,0,0,0,47,0,12212,64,0,0,0,0,'Creature ''Jesse Masters'' - Group 0: Show gossip option 0 if quest ''Replenishing the Storehouse'' is rewarded'),

(23,29244,40202,0,0,47,0,12216,64,0,0,0,0,'Creature ''Jesse Masters'' - Group 0: Sell ''Sizzling Grizzly Flank'' if quest ''Take Their Rear!'' is rewarded');
