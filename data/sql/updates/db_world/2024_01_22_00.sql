UPDATE `gameobject_template` SET `ScriptName` = '' WHERE `entry` = 188458;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup` = 9426;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,9426,12669,0,0,47,0,12007,66,0,1,0,0,'GO ''Seer of Zeb''Halak'' - Group 0: Show gossip text 12669 if quest ''Sacrifices Must be Made'' is not completed or rewarded'),
(14,9426,12670,0,0,47,0,12007,66,0,0,0,0,'GO ''Seer of Zeb''Halak'' - Group 0: Show gossip text 12670 if quest ''Sacrifices Must be Made'' is completed or rewarded'),

(15,9426,0,0,0,47,0,12007,8,0,0,0,0,'GO ''Seer of Zeb''Halak'' - Show gossip option 0 if quest ''Sacrifices Must be Made'' is in progress');
