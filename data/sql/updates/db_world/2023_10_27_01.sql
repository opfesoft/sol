DELETE FROM `creature_template_addon` WHERE `entry` = 20477;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(20477,0,0,0,0,0,0,'35408');

UPDATE `smart_scripts` SET `event_param3` = 5000, `event_param4` = 9000 WHERE `source_type` = 0 AND `entryorguid` = 20477 AND `id` = 0;
