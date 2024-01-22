DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (8870,8879);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,8870,0,0,0,48,0,11221,0,0,0,0,0,'Creature ''Deathstalker Razael'' - Show gossip option 0 if objective ID 0 of quest ''Reports from the Field'' is in progress'),

(15,8879,0,0,0,48,0,11221,1,0,0,0,0,'Creature ''Dark Ranger Lyana'' - Show gossip option 0 if objective ID 1 of quest ''Reports from the Field'' is in progress');

UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` IN (23778,23998);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23778 AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23998;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23778,0,1,0,62,0,100,0,8879,0,0,0,0,85,42799,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Dark Ranger Lyana - On Gossip Option 0 Selected - Invoker Cast ''Lyana Kill Credit'' (Invoker)'),

(23998,0,0,0,62,0,100,0,8870,0,0,0,0,85,42756,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Deathstalker Razael - On Gossip Option 0 Selected - Invoker Cast ''Razael Kill Credit'' (Invoker)');
