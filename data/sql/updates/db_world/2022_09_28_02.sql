--
DELETE FROM `creature_loot_template` WHERE `item` = 6083 AND `entry` IN (4649,4651,4661);
/* Gelkis Rumblers have no other loot */
UPDATE `creature_template` SET `lootid` = 0 WHERE `entry` = 4661;
