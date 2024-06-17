UPDATE `gameobject_loot_template` SET `MaxCount` = 6 WHERE `Entry` = 22070 AND `Item` IN (22573,22574);
UPDATE `gameobject_loot_template` SET `MaxCount` = 4 WHERE `Entry` = 22070 AND `Item` = 32464;
UPDATE `item_loot_template` SET `Chance` = 60, `MaxCount` = 3 WHERE `Entry` = 32724 AND `Item` = 32728;
UPDATE `item_loot_template` SET `Chance` = 10 WHERE `Entry` = 32724 AND `Item` = 32727;
UPDATE `item_loot_template` SET `Chance` = 2 WHERE `Entry` = 32724 AND `Item` = 32726;
UPDATE `item_loot_template` SET `Chance` = 5 WHERE `Entry` = 32724 AND `Item` IN (32464,32468,32470);
UPDATE `creature_loot_template` SET `Chance` = 50 WHERE `Item` = 32427 AND `Entry` IN (23169,23264,23267,23269,23285,23286,23290,23305,23324,23326,23501);
UPDATE `creature_loot_template` SET `Chance` = 100 WHERE `Item` = 32502 AND `Entry` IN (21305,21408,21462,21864,21878,21879,21901,23020);
UPDATE `creature_loot_template` SET `Chance` = 1 WHERE `Item` = 32506 AND `Entry` IN (23169,23264,23285,23286,23290,23305,23324,23326,23501);

DELETE FROM `gameobject_loot_template` WHERE `Entry` = 22070 AND `Item` = 32506;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(22070,32506,0,1,0,1,0,1,1,NULL);

DELETE FROM `item_loot_template` WHERE `Entry` = 32724 AND `Item` IN (32506,32725);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(32724,32506,0,1,0,1,0,1,1,NULL),
(32724,32725,0,10,0,1,0,1,1,NULL);
