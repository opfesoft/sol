UPDATE `creature_template` SET `lootid` = 0 WHERE `entry` IN (17917,20627);
DELETE FROM `creature_loot_template` WHERE `Entry` = 17917 AND `Item` = 13926;
