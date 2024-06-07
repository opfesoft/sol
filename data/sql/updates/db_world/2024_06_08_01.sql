UPDATE `creature_template` SET `unit_flags` = 256 | 512, `dynamicflags` = 0 WHERE `entry` IN (27219,27400);
UPDATE `creature` SET `modelid` = 0, `position_x` = 2876.3, `position_y` = -282.95, `orientation` = 1.95687 WHERE `guid` = 103288;
UPDATE `creature_addon` SET `addonFlags` = `addonFlags` | 2 WHERE `guid` = 97212;
UPDATE `creature_addon` SET `addonFlags` = `addonFlags` | 2, `auras` = '29266' WHERE `guid` = 97213;
UPDATE `creature_addon` SET `addonFlags` = `addonFlags` | 2, `auras` = '29266 42726' WHERE `guid` = 103288;
