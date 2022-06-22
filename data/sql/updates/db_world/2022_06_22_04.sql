UPDATE `quest_template` SET `RewardNextQuest` = 0 WHERE `ID` IN (12553,12583,12606);
UPDATE `quest_template_addon` SET `PrevQuestID` = 12598, `NextQuestID` = 0, `ExclusiveGroup` = 0 WHERE `ID` IN (12552,12553,12606);
UPDATE `quest_template_addon` SET `PrevQuestID` = 12583 WHERE `ID` = 12555;
UPDATE `quest_template_addon` SET `PrevQuestID` = 12553, `NextQuestID` = 0, `ExclusiveGroup` = 0 WHERE `ID` = 12583;
UPDATE `quest_template_addon` SET `PrevQuestID` = 12552 WHERE `ID` = 12584;
