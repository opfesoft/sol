DELETE FROM `creature_loot_template` WHERE `Entry` = 1675 AND `Item` IN (118,159,2589,2834,4604,24073,24100,24720,24730,44007);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(1675,118,0,3,0,1,0,1,1,NULL),
(1675,159,0,4,0,1,2,1,1,NULL),
(1675,2589,0,33,0,1,0,1,2,NULL),
(1675,2834,0,40,1,1,0,1,1,NULL),
(1675,4604,0,8,0,1,2,1,1,NULL),
(1675,24073,24073,30,0,1,1,1,1,NULL),
(1675,24100,24100,5,0,1,1,1,1,NULL),
(1675,24720,24720,1,0,1,1,1,1,NULL),
(1675,24730,24730,1,0,1,1,1,1,NULL),
(1675,44007,44007,0.5,0,1,1,1,1,NULL);
