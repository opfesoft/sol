UPDATE `smart_scripts` SET `action_param2` = 0 WHERE `entryorguid` = 17395 AND `source_type` = 0 AND `id` BETWEEN 2 AND 5;
UPDATE `smart_scripts` SET `event_flags` = `event_flags` & ~1, `event_param3` = 35000, `event_param4` = 45000 WHERE `entryorguid` = 17395 AND `source_type` = 0 AND `id` BETWEEN 2 AND 3;
