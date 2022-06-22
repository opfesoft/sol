UPDATE `quest_template` SET `RewardNextQuest` = 0 WHERE `ID` = 11160;
UPDATE `quest_template` SET `RewardNextQuest` = 11161 WHERE `ID` = 11158;
DELETE FROM `quest_template_addon` WHERE `ID` = 11158;
UPDATE `quest_template_addon` SET `NextQuestID` = 0, `ExclusiveGroup` = 0 WHERE `ID` IN (11160,11161);
