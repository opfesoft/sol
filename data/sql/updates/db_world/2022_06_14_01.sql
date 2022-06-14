DELETE FROM `gossip_menu` WHERE `MenuID` = 3481 AND `TextID` = 4233;
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(3481,4233);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 3481;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,3481,4953,0,0,47,0,5535,64,0,0,0,0,'Loh''atu - Group 0: Show gossip menu text 4953 if quest ''Spiritual Unrest'' is rewarded'),
(14,3481,4953,0,0,47,0,5536,64,0,0,0,0,'Loh''atu - Group 0: Show gossip menu text 4953 if quest ''A Land Filled with Hatred'' is rewarded'),

(14,3481,4233,0,0,47,0,5535,64,0,1,0,0,'Loh''atu - Group 0: Show gossip menu text 4233 if quest ''Spiritual Unrest'' is not rewarded'),
(14,3481,4233,0,1,47,0,5536,64,0,1,0,0,'Loh''atu - Group 1: Show gossip menu text 4233 if quest ''A Land Filled with Hatred'' is not rewarded'),

(15,3481,0,0,0,47,0,5535,64,0,0,0,0,'Loh''atu - Group 0: Show gossip option 0 if quest ''Spiritual Unrest'' is rewarded'),
(15,3481,0,0,0,47,0,5536,64,0,0,0,0,'Loh''atu - Group 0: Show gossip option 0 if quest ''A Land Filled with Hatred'' is rewarded'),

(15,3481,1,0,0,47,0,5535,64,0,0,0,0,'Loh''atu - Group 0: Show gossip option 1 if quest ''Spiritual Unrest'' is rewarded'),
(15,3481,1,0,0,47,0,5536,64,0,0,0,0,'Loh''atu - Group 0: Show gossip option 1 if quest ''A Land Filled with Hatred'' is rewarded'),

(15,3481,2,0,0,47,0,5535,64,0,0,0,0,'Loh''atu - Group 0: Show gossip option 2 if quest ''Spiritual Unrest'' is rewarded'),
(15,3481,2,0,0,47,0,5536,64,0,0,0,0,'Loh''atu - Group 0: Show gossip option 2 if quest ''A Land Filled with Hatred'' is rewarded'),

(15,3481,3,0,0,47,0,5535,64,0,0,0,0,'Loh''atu - Group 0: Show gossip option 3 if quest ''Spiritual Unrest'' is rewarded'),
(15,3481,3,0,0,47,0,5536,64,0,0,0,0,'Loh''atu - Group 0: Show gossip option 3 if quest ''A Land Filled with Hatred'' is rewarded'),

(15,3481,4,0,0,47,0,5535,64,0,0,0,0,'Loh''atu - Group 0: Show gossip option 4 if quest ''Spiritual Unrest'' is rewarded'),
(15,3481,4,0,0,47,0,5536,64,0,0,0,0,'Loh''atu - Group 0: Show gossip option 4 if quest ''A Land Filled with Hatred'' is rewarded');
