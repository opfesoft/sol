UPDATE `gameobject_template_addon` SET `flags` = `flags` | 16 WHERE `entry` IN (175786,176306);

UPDATE `creature_template` SET `gossip_menu_id` = 3129 WHERE `entry` = 11016;

DELETE FROM `gossip_menu` WHERE `MenuID` IN (3129,30229);
INSERT INTO `gossip_menu` (`MenuID`, `TextID`)
VALUES
(3129,3865),
(3129,4113),
(3129,4114);

UPDATE `smart_scripts` SET `action_type` = 9 WHERE `entryorguid` = 11016 AND `source_type` = 0 AND `id` = 4;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 14 AND `SourceGroup` = 3129;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(14,3129,3865,0,0,47,0,5202,64,0,1,0,0,'Captured Arko''narin - Group 0: Show gossip menu text 3865 if quest ''A Strange Red Key'' is not rewarded'),
(14,3129,3865,0,0,47,0,5203,64,0,1,0,0,'Captured Arko''narin - Group 0: Show gossip menu text 3865 if quest ''Rescue From Jaedenar'' is not rewarded'),

(14,3129,4113,0,0,47,0,5202,64,0,0,0,0,'Captured Arko''narin - Group 0: Show gossip menu text 4113 if quest ''A Strange Red Key'' is rewarded'),
(14,3129,4113,0,0,47,0,5203,64,0,1,0,0,'Captured Arko''narin - Group 0: Show gossip menu text 4113 if quest ''Rescue From Jaedenar'' is not rewarded'),

(14,3129,4114,0,0,47,0,5203,64,0,0,0,0,'Captured Arko''narin - Group 0: Show gossip menu text 4114 if quest ''Rescue From Jaedenar'' is rewarded');
