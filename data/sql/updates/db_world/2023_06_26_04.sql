UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 512 WHERE `entry` = 21767;
UPDATE `event_scripts` SET `datalong2` = 60000, `dataint` = 1 WHERE `id` = 14029;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 21767;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 2176700;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(21767,0,0,1,54,0,100,0,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Harbinger of the Raven - On Just Summoned - Store Targetlist 1 (Invoker)'),
(21767,0,1,2,61,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,12,1,0,0,0,0,0,0,0,'Harbinger of the Raven - Linked - Say Line 0'),
(21767,0,2,0,61,0,100,0,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,0,3211,5348.21,146.53,0,'Harbinger of the Raven - Linked - Move To Point 1'),
(21767,0,3,0,34,0,100,0,8,0,0,0,0,80,2176700,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harbinger of the Raven - On Point 1 Reached - Call Timed Action List'),
(21767,0,4,5,7,0,100,0,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harbinger of the Raven - On Evade - Force Despawn'),
(21767,0,5,0,61,0,100,0,0,0,0,0,0,60,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harbinger of the Raven - Linked - Set Fly On'),

(2176700,9,0,0,0,0,100,0,0,0,0,0,0,11,37446,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harbinger of the Raven - On Script - Cast ''Ruuan''ok Oracle Transformation'''),
(2176700,9,1,0,0,0,100,0,0,0,0,0,0,60,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harbinger of the Raven - On Script - Set Fly Off'),
(2176700,9,2,0,0,0,100,0,0,0,0,0,0,2,954,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harbinger of the Raven - On Script - Set Faction ''Demon'''),
(2176700,9,3,0,0,0,100,0,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Harbinger of the Raven - On Script - Set React State ''Aggressive'''),
(2176700,9,4,0,0,0,100,0,0,0,0,0,0,49,0,0,0,0,0,0,12,1,0,0,0,0,0,0,0,'Harbinger of the Raven - On Script - Start Attack (Stored Targetlist 1)');
