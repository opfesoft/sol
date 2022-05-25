DELETE FROM `creature_id_chance` WHERE `guid` = 44422;
INSERT INTO `creature_id_chance` (`guid`, `id`, `chance`)
VALUES
(44422,10374,70);

UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `id` IN (10374,10375);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (10374,10375,10376);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10374,0,0,0,6,0,100,2,0,0,0,0,0,11,16103,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spire Spider - On Death - Cast ''Summon Spire Spiderling'''),
(10374,0,1,0,0,0,100,2,15000,15000,15000,15000,0,11,16104,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Spire Spider - IC - Cast ''Crystallize'''),

(10375,0,0,1,54,0,100,0,0,0,0,0,0,211,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spire Spiderling - On Just Summoned - Disable Event Phase Reset'),
(10375,0,1,2,61,0,100,0,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spire Spiderling - Linked - Set Event Phase 1'),
(10375,0,2,0,61,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spire Spiderling - Linked - Enable Random Movement'),
(10375,0,3,0,1,1,100,0,60000,60000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spire Spiderling - OOC - Force Despawn (Event Phase 1)'),

(10376,0,0,0,4,0,100,0,0,0,0,0,0,11,16416,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal Fang - On Aggro - Cast ''Summon Spire Spiderling'''),
(10376,0,1,0,6,0,100,0,0,0,0,0,0,11,16416,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crystal Fang - On Death - Cast ''Summon Spire Spiderling''');
