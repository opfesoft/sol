UPDATE `creature_loot_template` SET `Chance` = 50 WHERE `Entry` IN (1815,1816,5274,7443,7444,7445,8956,8957,8958,10806,14344) AND `Item` = 35562;

DELETE FROM `creature_loot_template` WHERE `Entry` = 7446 AND `Item` = 35562;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(7446,35562,0,50,0,1,0,1,1,NULL);
