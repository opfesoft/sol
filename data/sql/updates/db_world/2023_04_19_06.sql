--
-- Remove Roughshod Pikes from any creature
DELETE FROM `creature_loot_template` WHERE `Item` = 12533 AND `Entry` IN (415,9045,9097,9098,9199,9257,9258,9416);
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=415;
