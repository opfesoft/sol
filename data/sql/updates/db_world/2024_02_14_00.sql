UPDATE `creature_template` SET `flags_extra` = `flags_extra` | 128 WHERE `entry` = 29521;
UPDATE `creature` SET `modelid` = 0 WHERE `id` = 29521;
