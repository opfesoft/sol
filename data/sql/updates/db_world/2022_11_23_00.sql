UPDATE `creature_template` SET `type_flags` = `type_flags` | 134217728 WHERE `entry` = 3443;
UPDATE `quest_template_addon` SET `RequiredSkillPoints` = 15 WHERE `id` = 862;

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 23 AND `SourceGroup` = 3443;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(23,3443,0,0,0,7,0,185,15,0,0,0,0,'Grub - Group 0: Vendor only available if skill ''Cooking'' is >=15'),
(23,3443,0,0,0,47,0,862,64,0,0,0,0,'Grub - Group 0: Vendor only available if quest ''Dig Rat Stew'' is rewarded');
