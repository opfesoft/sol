UPDATE `creature_template_addon` SET `auras` = '32732' WHERE `entry` = 16929;
DELETE FROM `creature_addon` WHERE `guid` = 58785;

UPDATE `smart_scripts` SET `event_param2` = 60 WHERE `source_type` = 0 AND `entryorguid` = 16927 AND `id` = 0;
UPDATE `smart_scripts` SET `event_param2` = 60 WHERE `source_type` = 0 AND `entryorguid` = 16929 AND `id` = 1;
UPDATE `smart_scripts` SET `event_param1` = 5000, `event_param2` = 15000, `event_param3` = 5000, `event_param4` = 9000 WHERE `source_type` = 0 AND `entryorguid` = 16929 AND `id` = 0;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 16927 AND `id` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(16927,0,9,0,2,0,100,0,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stonescythe Whelp - Between 0-15% Health - Flee For Assist');
