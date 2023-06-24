DELETE FROM `creature_template_addon` WHERE `entry` IN (21729,21731);
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(21729,0,0,0,0,0,0,'37248'),
(21731,0,0,0,0,0,0,'37248');

UPDATE `creature` SET `spawntimesecs` = 180, `wander_distance` = 0, `curhealth` = 1, `MovementType` = 0 WHERE `id` = 21737;

DELETE FROM `creature` WHERE `guid` BETWEEN 3009395 AND 3009405;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(3009395,21737,530,0,0,1,1,0,0,2329.46,5670.14,264.905,0,180,0,1,0,0,0,0,0,0),
(3009396,21737,530,0,0,1,1,0,0,2289.91,5720.33,269.478,0,180,0,1,0,0,0,0,0,0),
(3009397,21737,530,0,0,1,1,0,0,2248.08,5783.57,268.823,0,180,0,1,0,0,0,0,0,0),
(3009398,21737,530,0,0,1,1,0,0,2271.49,5686.38,268.718,0,180,0,1,0,0,0,0,0,0),
(3009399,21737,530,0,0,1,1,0,0,2347.46,5768.72,272.987,0,180,0,1,0,0,0,0,0,0),
(3009400,21737,530,0,0,1,1,0,0,2369.67,5769.19,272.993,0,180,0,1,0,0,0,0,0,0),
(3009401,21737,530,0,0,1,1,0,0,2418.89,5755.89,272.987,0,180,0,1,0,0,0,0,0,0),
(3009402,21737,530,0,0,1,1,0,0,2306.78,5763.4,270.335,0,180,0,1,0,0,0,0,0,0),
(3009403,21737,530,0,0,1,1,0,0,2224.35,5702.39,273.673,0,180,0,1,0,0,0,0,0,0),
(3009404,21737,530,0,0,1,1,0,0,2339.8,5713.66,269.369,0,180,0,1,0,0,0,0,0,0),
(3009405,21737,530,0,0,1,1,0,0,2237.31,5715.39,273.665,0,180,0,1,0,0,0,0,0,0);

UPDATE `gameobject_template` SET `Data10` = 0, `Data12` = 0, `AIName` = 'SmartGameObjectAI' WHERE `entry` = 184906;
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 21737;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (21737,21729);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` = 184906;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(184906,1,0,0,70,0,100,0,2,0,0,0,0,45,1,1,0,0,0,0,19,21737,2,0,0,0,0,0,0,'Power Converter - On GO State Changed ''GO_ACTIVATED'' - Set Data 1 1 (Mini-Electromental Flavor)'),

(21737,0,0,1,38,0,100,0,1,1,0,0,0,12,21729,1,30000,0,0,0,1,0,0,0,0,0,0,0,0,'Mini-Electromental Flavor - On Data Set 1 1 - Summon Creature ''Electromental'''),
(21737,0,1,0,61,0,100,0,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mini-Electromental Flavor - Linked - Force Despawn'),

(21729,0,0,0,54,0,100,0,0,0,0,0,0,116,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Electromental - On Just Summoned - Set Corpse Delay'),
(21729,0,1,0,0,0,100,0,1000,2000,2400,3800,0,11,37273,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Electromental - IC - Cast ''Lightning Bolt'''),
(21729,0,2,0,8,0,100,0,37136,0,0,0,0,36,21731,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Electromental - On Spellhit ''Protovoltaic Magneto Collector'' - Update Template ''Encased Electromental''');
