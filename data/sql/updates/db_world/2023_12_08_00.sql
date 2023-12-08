DELETE FROM `spell_target_position` WHERE `ID` IN (34830,34857);
DELETE FROM `areatrigger_involvedrelation` WHERE `id` IN (4473,4475);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (34830,34857);
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`)
VALUES
(34830,'spell_triangulation_point'),
(34857,'spell_triangulation_point');

UPDATE `creature` SET `position_x` = 3923.06, `position_y` = 3873.36, `position_z` = 180.752 WHERE `guid` = 1976583;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (20086,20114);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (20086,20114);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20086,0,0,0,60,0,100,0,2000,2000,2000,2000,0,15,10269,0,0,0,0,0,18,10,0,0,0,0,0,0,0,'Netherstorm Triangulation Point One Trigger - On Update - Quest Credit ''Triangulation Point One'' (CONDITION_AURA)'),

(20114,0,0,0,60,0,100,0,2000,2000,2000,2000,0,15,10275,0,0,0,0,0,18,10,0,0,0,0,0,0,0,'Netherstorm Triangulation Point Two Trigger - On Update - Quest Credit ''Triangulation Point Two'' (CONDITION_AURA)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 151 AND `SourceEntry` IN (20086,20114) AND `SourceId` = 0;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(151,1,20086,0,0,1,0,34830,1,0,0,0,0,'Creature ''Netherstorm Triangulation Point One Trigger'' - Group 0: Execute SAI ID 0 only for targets which have aura ''Triangulation Point One'''),

(151,1,20114,0,0,1,0,34857,1,0,0,0,0,'Creature ''Netherstorm Triangulation Point Two Trigger'' - Group 0: Execute SAI ID 0 only for targets which have aura ''Triangulation Point Two''');
