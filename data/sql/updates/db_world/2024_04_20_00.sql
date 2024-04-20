DELETE FROM `creature` WHERE `guid` = 3009688;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`)
VALUES
(3009688,950,0,0,0,1,1,0,1,-10904.5,-3625.72,15.5116,5.80634,300,10,1,0,1,0,0,0);

UPDATE `creature` SET `modelid` = 0, `wander_distance` = 10, `curhealth` = 1, `MovementType` = 1 WHERE `guid` = 43596;

DELETE FROM `pool_template` WHERE `entry` = 203354;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(203354,1,'Swamp Talker (1 out of 2)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 203354;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(43596,203354,0,'Swamp Talker - Spawn 1'),
(3009688,203354,0,'Swamp Talker - Spawn 2');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 950;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 950;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(950,0,0,0,0,0,100,0,1000,3000,15000,20000,0,11,9636,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Swamp Talker - IC - Cast ''Summon Swamp Spirit'''),
(950,0,1,0,2,0,100,0,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Swamp Talker - Between 0-15% Health - Flee For Assist'),
(950,0,2,0,1,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,232,6932,1,0,0,0,0,0,0,'Swamp Talker - OOC - Force Despawn Minion ''Swamp Spirit''');
