UPDATE `creature_template` SET `gossip_menu_id` = 5812 WHERE `entry` = 14348;

DELETE FROM `gossip_menu` WHERE `MenuID` IN (5812,5813,5814,5815,5816);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(5812,6985),
(5813,6986),
(5814,6987),
(5815,6988),
(5816,6989);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 5812;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,5812,0,0,0,47,0,7786,1,0,1,0,0,'Earthcaller Franzahl - Group 0: Show gossip option 0 if quest ''Thunderaan the Windseeker'' is taken'),
(15,5812,0,0,1,2,0,18563,1,1,0,0,0,'Earthcaller Franzahl - Group 1: Show gossip option 0 if item ''Bindings of the Windseeker (Left)'' is in the inventory or in the bank'),
(15,5812,0,0,2,2,0,18564,1,1,0,0,0,'Earthcaller Franzahl - Group 2: Show gossip option 0 if item ''Bindings of the Windseeker (Right)'' is in the inventory or in the bank');
