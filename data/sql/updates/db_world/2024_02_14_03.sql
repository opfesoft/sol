UPDATE `creature_template` SET `speed_walk` = 1.4, `speed_run` = 9/7 WHERE `entry` = 27542;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 27542;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(27542,0,0,0,9,0,100,0,0,40,3000,5000,0,11,49241,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Ruby Watcher - Within 0-40 Range - Cast ''Ruby Blast''');
