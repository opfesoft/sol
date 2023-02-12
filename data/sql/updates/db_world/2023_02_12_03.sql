UPDATE `creature_template_addon` SET `auras` = NULL WHERE `entry` = 20673;

UPDATE `creature_addon` SET `auras` = NULL WHERE `guid` IN (
46075,46076,46077,46078,46079,46080,46081,46082,46083,46084,46085,46086,46087,46088,46089,46090,
46091,46092,46093,46094,46096,46097,46098,46099,46100,46101,46102,46103,46104,46105,46106,46107,
46108,46109,46110,46111,46112,46113,46114,46115,46116,46117,46118,46119,46120,46121,46122,46123,
46124,46125,46126,46127,72974);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 20673 AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(20673,0,1,0,1,0,100,0,0,0,1000,1000,0,11,19514,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Swiftwing Shredder - OOC - Cast ''Lightning Shield''');
