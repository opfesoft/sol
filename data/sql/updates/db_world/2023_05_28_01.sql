UPDATE `gameobject_template` SET `Data2` = 300000, `Data3` = 0 WHERE `entry` = 185512;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 22920;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 22920;
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 185512;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 18551200;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(185512,1,0,0,70,0,100,0,2,0,0,0,0,80,18551200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stasis Chamber Alpha - On GO State Changed ''GO_ACTIVATED'' - Call Timed Action List'),

(18551200,9,0,0,0,0,100,0,1000,1000,0,0,0,12,22920,1,300000,2,0,0,8,0,0,0,0,3989.02,6071.37,266.41,3.72,'Stasis Chamber Alpha - On Script - Summon Creature ''Thuk the Defiant'''),

(22920,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thuk the Defiant - On Just Summoned - Set Active On'),
(22920,0,1,2,61,0,100,0,0,0,0,0,0,116,60,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thuk the Defiant - Linked - Set Corpse Delay'),
(22920,0,2,0,61,0,100,0,0,0,0,0,0,101,0,0,0,0,0,0,8,0,0,0,0,3974.03,6061.7,266.512,3.71505,'Thuk the Defiant - Linked - Set Home Position'),
(22920,0,3,0,1,0,100,1,1000,1000,0,0,0,24,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Thuk the Defiant - OOC - Evade (No Repeat)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 185512 AND `SourceId` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,185512,1,0,29,0,22920,100,0,1,0,0,'GO ''Stasis Chamber Alpha'' - Group 0: Execute SAI ID 0 only if not nearby creature ''Thuk the Defiant''');
