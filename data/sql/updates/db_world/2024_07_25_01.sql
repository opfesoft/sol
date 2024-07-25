DELETE FROM `reference_loot_template` WHERE `Entry` IN (60126,12903);
INSERT INTO `reference_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(60126,21929,0,1.5,0,1,1,1,1,NULL),
(60126,23077,0,1.5,0,1,1,1,1,NULL),
(60126,23079,0,1.5,0,1,1,1,1,NULL),
(60126,23107,0,1.5,0,1,1,1,1,NULL),
(60126,23112,0,1.5,0,1,1,1,1,NULL),
(60126,23117,0,1.5,0,1,1,1,1,NULL),
(60126,12361,0,15,0,1,1,1,1,NULL),
(60126,12364,0,15,0,1,1,1,1,NULL),
(60126,12799,0,15,0,1,1,1,1,NULL),
(60126,12800,0,15,0,1,1,1,1,NULL),
(60126,7910,0,31,0,1,1,1,1,NULL),

(12903,32227,0,8,0,1,1,1,1,NULL),
(12903,32228,0,8,0,1,1,1,1,NULL),
(12903,32229,0,8,0,1,1,1,1,NULL),
(12903,32230,0,8,0,1,1,1,1,NULL),
(12903,32231,0,8,0,1,1,1,1,NULL),
(12903,32249,0,8,0,1,1,1,1,NULL),
(12903,23436,0,4,0,1,1,1,1,NULL),
(12903,23437,0,4,0,1,1,1,1,NULL),
(12903,23438,0,4,0,1,1,1,1,NULL),
(12903,23439,0,4,0,1,1,1,1,NULL),
(12903,23440,0,4,0,1,1,1,1,NULL),
(12903,23441,0,4,0,1,1,1,1,NULL),
(12903,34907,0,28,0,1,1,1,1,NULL);

DELETE FROM `prospecting_loot_template` WHERE `Entry` = 10620;
INSERT INTO `prospecting_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES
(10620,1,60126,100,0,1,0,1,1,NULL),
(10620,2,60126,30,0,1,0,1,1,NULL);

DELETE FROM `gameobject_loot_template` WHERE `Entry` = 26862;
INSERT INTO `gameobject_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`)
VALUES

(26862,1,12903,100,0,1,0,1,1,NULL),
(26862,2,12903,30,0,1,0,1,1,NULL);
