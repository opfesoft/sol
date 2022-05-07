UPDATE `smart_scripts` SET `id` = 1 WHERE `entryorguid` = 19455 AND `source_type` = 0 AND `id` = 5 AND `link` = 6;
UPDATE `smart_scripts` SET `target_o` = 2.41624 WHERE `entryorguid` = 19455 AND `source_type` = 0 AND `id` = 12;
UPDATE `smart_scripts` SET `id` = 10 WHERE `entryorguid` = 23899 AND `source_type` = 0 AND `id` = 1 AND `link` = 0;
UPDATE `smart_scripts` SET `id` = 6 WHERE `entryorguid` = 32236 AND `source_type` = 0 AND `id` = 0 AND `link` = 0;
UPDATE `smart_scripts` SET `link` = 8 WHERE `entryorguid` = 184312 AND `source_type` = 1 AND `id` = 7 AND `link` = 0;
UPDATE `smart_scripts` SET `id` = 8 WHERE `entryorguid` = 184312 AND `source_type` = 1 AND `id` = 0 AND `link` = 0;

ALTER TABLE `smart_scripts` DROP PRIMARY KEY, ADD PRIMARY KEY(`entryorguid`,`source_type`,`id`);
