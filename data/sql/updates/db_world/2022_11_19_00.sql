DELETE FROM `creature` WHERE `guid` IN (27587,27588,27589,27590,27591,27592,27593,27594,27595,27596,27597,27598,27599,27600);
DELETE FROM `creature_addon` WHERE `guid` IN (27587,27588,27589,27590,27591,27592,27593,27594,27595,27596,27597,27598,27599,27600);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (4651,4661);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4651,0,0,0,25,0,100,0,0,0,0,0,0,11,9653,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gelkis Earthcaller - On Reset - Cast ''Summon Gelkis Rumbler'''),
(4651,0,1,0,0,0,100,0,0,1000,3000,3500,0,11,20815,32,0,0,0,0,2,0,0,0,0,0,0,0,0,'Gelkis Earthcaller - IC - Cast ''Fireball'''),
(4651,0,2,0,2,0,100,1,0,10,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gelkis Earthcaller - Between 0-10% Health - Flee For Assist (No Repeat)'),
(4651,0,3,0,17,0,100,0,4661,0,0,0,0,45,1,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Gelkis Earthcaller - On Summoned Unit ''Gelkis Rumbler'' - Set Data 1 1 (Invoker) (CONDITION_OBJECT_ENTRY_GUID)'),

(4661,0,0,0,38,0,100,0,1,1,0,0,0,237,2,0,0,0,0,0,7,0,0,0,0,0,0,3,45,'Gelkis Rumbler - On Data Set 1 1 - Create Creature Formation (Invoker)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 4651;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,4,4651,0,0,31,1,3,0,27259,0,0,0,'Gelkis Earthcaller - Group 0: Execute SAI ID 3 only if has GUID 27259');
