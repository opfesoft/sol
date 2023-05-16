UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` IN (23373,18019);
UPDATE `creature_template` SET `AIName` = 'SmartAI', `ScriptName` = '' WHERE `entry` = 18197;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 18197;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18197,0,0,0,62,0,100,0,7585,0,0,0,0,56,24573,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Elder Kuruti - On Gossip Option 0 Selected - Add Item ''Elder Kuruti''s Response'' (Invoker)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 15 AND `SourceGroup` IN (8692,7582);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(15,8692,0,0,0,5,0,942,128,0,0,0,0,'Creature ''Mortog Steamhead'' - Group 0: Show gossip option 0 if exalted with Cenarion Expedition'),

(15,7582,0,0,0,47,0,9803,8,0,0,0,0,'Creature ''Elder Kuruti'' - Group 0: Show gossip option 0 if quest ''Messenger to the Feralfen'' is in progress'),
(15,7582,0,0,0,2,0,24573,1,1,1,0,0,'Creature ''Elder Kuruti'' - Group 0: Show gossip option 0 if item ''Elder Kuruti''s Response'' is not in the inventory or in the bank');
