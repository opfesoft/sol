DELETE FROM `item_loot_template` WHERE `Entry` IN (16882,16883,16884,16885,29569,43575) AND `Item` IN (24231,24232,24281,24282,27729);
DELETE FROM `reference_loot_template` WHERE `Entry` = 60125;
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(60125,24231,0,70,0,1,1,2,3,NULL),
(60125,24232,0,8,0,1,1,2,2,NULL),
(60125,24281,0,8,0,1,1,1,1,NULL),
(60125,24282,0,8,0,1,1,1,1,NULL),
(60125,27729,0,6,0,1,1,1,1,NULL);

DELETE FROM `item_loot_template` WHERE `Entry` IN (16882,16883,16884,16885,29569,43575) AND `Reference` = 60125;
DELETE FROM `item_loot_template` WHERE `Entry` = 29569 AND `Item` IN (31331,34622);
INSERT INTO `item_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(16882,1,60125,50,0,1,0,1,1,NULL),
(16883,1,60125,50,0,1,0,1,1,NULL),
(16884,1,60125,50,0,1,0,1,1,NULL),
(16885,1,60125,50,0,1,0,1,1,NULL),
(29569,1,60125,50,0,1,0,1,1,NULL),
(43575,1,60125,50,0,1,0,1,1,NULL),

(29569,31331,0,0.05,0,1,0,1,1,NULL),
(29569,34622,0,0.1,0,1,0,1,1,NULL);
