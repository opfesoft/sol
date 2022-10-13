UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 1073741824 WHERE `entry` IN (18966,18969);
UPDATE `smart_scripts` SET `link` = 0 WHERE `entryorguid` = -68744 AND `source_type` = 0 AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = -68744 AND `source_type` = 0 AND `id` > 1;
