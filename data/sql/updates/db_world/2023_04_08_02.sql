DELETE FROM `gameobject_queststarter` WHERE `quest` = 2954 AND `id` = 142343;
INSERT INTO `gameobject_queststarter` (`id`, `quest`)
VALUES
(142343,2954);

DELETE FROM `creature_queststarter` WHERE `quest` = 2954;

DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 142343;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 14234300;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(142343,1,0,0,20,0,100,0,2946,0,0,0,0,80,14234300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Uldum Pedestal - On Quest ''Seeing What Happens (Alliance)'' Rewarded - Call Timed Action List'),
(142343,1,1,0,20,0,100,0,2966,0,0,0,0,80,14234300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Uldum Pedestal - On Quest ''Seeing What Happens (Horde)'' Rewarded - Call Timed Action List'),
(142343,1,2,0,19,0,100,0,2954,0,0,0,0,80,14234300,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Uldum Pedestal - On Quest ''The Stone Watcher'' Accepted - Call Timed Action List'),

(14234300,9,0,0,1,0,100,0,2000,2000,0,0,0,12,7918,1,300000,0,0,0,8,0,0,0,0,-9619,-2815,10.8947,0.43,'Uldum Pedestal - On Script - Summon Creature ''Stone Watcher of Norgannon''');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` = 14234300 AND `SourceId` = 9;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,1,14234300,9,0,29,1,7918,10,0,1,0,0,'GO ''Uldum Pedestal'' - Group 0: Execute SAI ID 0 if not near creature ''Stone Watcher of Norgannon''');
