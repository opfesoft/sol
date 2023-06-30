DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` = 8062;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,8062,0,0,0,29,1,20518,10,0,1,0,0,'GO ''Ethereal Teleport Pad'' - Group 0: Show gossip option 0 if not near creature ''Image of Wind Trader Marid'''),
(15,8062,0,0,0,47,0,10270,66,0,0,0,0,'GO ''Ethereal Teleport Pad'' - Group 0: Show gossip option 0 if quest ''A Not-So-Modest Proposal'' is completed or rewarded'),
(15,8062,0,0,0,47,0,10271,64,0,1,0,0,'GO ''Ethereal Teleport Pad'' - Group 0: Show gossip option 0 if quest ''Getting Down to Business'' is not rewarded');
