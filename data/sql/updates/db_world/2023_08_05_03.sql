DELETE FROM `reference_loot_template` WHERE `Item` = 18337 AND `Entry` = 24033;
DELETE FROM `creature_loot_template` WHERE `Item` = 18337 AND `Entry` IN (11480,11483,11484,14399);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(11480,18337,0,0.7,0,1,0,1,1,NULL),
(11483,18337,0,0.7,0,1,0,1,1,NULL),
(11484,18337,0,0.7,0,1,0,1,1,NULL),
(14399,18337,0,0.7,0,1,0,1,1,NULL);
