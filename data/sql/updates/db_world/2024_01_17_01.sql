DELETE FROM `creature_loot_template` WHERE `Entry` IN (16530,20864,21301) AND `Item` = 22903;
DELETE FROM `reference_loot_template` WHERE `Entry` = 24093 AND `Item` = 22903;
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(24093,22903,0,0,0,1,1,1,1,NULL);
