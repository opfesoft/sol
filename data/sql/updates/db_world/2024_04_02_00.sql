DELETE FROM `creature_addon` WHERE `guid` IN (
74244,74245,74246,74247,74248,74249,74250,74251,74252,74253,74254,74255,74256,74257,74258,
74259,74260,74261,74262,74265,74266,74267,74268,74269,74270,74271,74272,74273,32699,32700);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `maxAggroRadius`, `auras`)
VALUES
(74244,0,0,0,1,333,0,NULL,NULL),
(74245,0,0,0,1,333,0,NULL,NULL),
(74246,0,0,0,1,333,0,NULL,NULL),
(74247,0,0,0,1,333,0,NULL,NULL),
(74248,0,0,0,1,333,0,NULL,NULL),
(74249,0,0,0,1,333,0,NULL,NULL),
(74250,0,0,0,1,333,0,NULL,NULL),
(74251,0,0,0,1,333,0,NULL,NULL),
(74252,0,0,0,1,333,0,NULL,NULL),
(74253,0,0,0,1,333,0,NULL,NULL),
(74254,0,0,0,1,333,0,NULL,NULL),
(74255,0,0,0,1,333,0,NULL,NULL),
(74256,0,0,0,1,333,0,NULL,NULL),
(74257,0,0,0,1,333,0,NULL,NULL),
(74258,0,0,0,1,333,0,NULL,NULL),
(74259,0,0,0,1,333,0,NULL,NULL),
(74260,0,0,0,1,333,0,NULL,NULL),
(74261,0,0,0,1,333,0,NULL,NULL),
(74262,0,0,0,1,333,0,NULL,NULL),
(74265,0,0,0,1,333,0,NULL,NULL),
(74266,0,0,0,1,333,0,NULL,NULL),
(74267,0,0,0,1,333,0,NULL,NULL),
(74268,0,0,0,1,333,0,NULL,NULL),
(74269,0,0,0,1,333,0,NULL,NULL),
(74270,0,0,0,1,333,0,NULL,NULL),
(74271,0,0,0,1,333,0,NULL,NULL),
(74272,0,0,0,1,333,0,NULL,NULL),
(74273,0,0,0,1,333,0,NULL,NULL),
(32699,0,0,0,1,333,0,NULL,NULL),
(32700,0,0,0,1,333,0,NULL,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 21179 AND `id` = 2;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 21180 AND `id` = 3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21179,0,2,0,1,0,100,0,0,5000,5000,10000,0,10,36,38,54,0,0,0,11,21179,3,1,0,0,0,0,0,'Demon Hunter Supplicant - OOC - Play Random Emote (Demon Hunter Supplicant) (CONDITION_OBJECT_ENTRY_GUID)'),

(21180,0,3,0,1,0,100,0,0,5000,5000,10000,0,10,36,38,54,0,0,0,11,21180,3,1,0,0,0,0,0,'Demon Hunter Initiate - OOC - Play Random Emote (Demon Hunter Initiate) (CONDITION_OBJECT_ENTRY_GUID)');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 22 AND `SourceEntry` IN (21179,21180);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `Comment`)
VALUES
(22,3,21179,0,0,31,1,3,0,74274,1,0,0,'Creature ''Demon Hunter Supplicant'' - Group 0: Execute SAI ID 2 if has no GUID 74274'),
(22,3,21179,0,0,31,1,3,0,74275,1,0,0,'Creature ''Demon Hunter Supplicant'' - Group 0: Execute SAI ID 2 if has no GUID 74275'),

(22,4,21180,0,0,31,1,3,0,32699,0,0,0,'Creature ''Demon Hunter Initiate'' - Group 0: Execute SAI ID 3 if has GUID 32699'),
(22,4,21180,0,1,31,1,3,0,32700,0,0,0,'Creature ''Demon Hunter Initiate'' - Group 1: Execute SAI ID 3 if has GUID 32700');
