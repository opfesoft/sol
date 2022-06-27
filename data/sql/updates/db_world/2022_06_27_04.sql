DELETE FROM `creature_template_addon` WHERE `entry` = 2624;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(2624,0,0,0,1,0,0,'6523');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 2624;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 2624;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2624,0,0,0,54,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gazban - Just Summoned - Say Line 0'),
(2624,0,1,0,0,0,100,0,6000,12000,7000,15000,0,11,5403,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gazban - IC - Cast ''Crash of Waves'''),
(2624,0,2,3,2,0,100,1,0,30,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gazban - On Health Between 0-30% - Say Line 1 (No Repeat)'),
(2624,0,3,4,61,0,100,0,0,0,0,0,0,11,5402,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gazban - Linked - Cast ''Gazban Transform'''),
(2624,0,4,0,61,0,100,0,0,0,0,0,0,11,5404,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gazban - Linked - Cast ''Gazban Water Form''');
