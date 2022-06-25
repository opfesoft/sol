-- Membership Card Renewal (actually doesn't matter, as those quests were removed in patch 3.1.0)
UPDATE `quest_template` SET `RewardMoney` = -20000 WHERE `ID` IN (3644,3645,3646,3647);

-- Ally of the Netherwing
UPDATE `quest_template` SET `RewardChoiceItemID1` = 31492, `RewardChoiceItemID2` = 31491, `RewardChoiceItemID3` = 31490, `RewardChoiceItemID4` = 31494, `RewardChoiceItemID5` = 31493, `RewardChoiceItemQuantity1` = 1, `RewardChoiceItemQuantity2` = 1, `RewardChoiceItemQuantity3` = 1, `RewardChoiceItemQuantity4` = 1, `RewardChoiceItemQuantity5` = 1 WHERE `ID` = 10870;

-- He Will Walk The Earth...
UPDATE `quest_template` SET `RewardChoiceItemID1` = 25574, `RewardChoiceItemID2` = 25575, `RewardChoiceItemID3` = 25576, `RewardChoiceItemQuantity1` = 1, `RewardChoiceItemQuantity2` = 1, `RewardChoiceItemQuantity3` = 1 WHERE `ID` = 9866;

-- Nolkai's Words: Reward via quest template, not SAI
UPDATE `quest_template` SET `RewardItem1` = 23846, `RewardAmount1` = 1 WHERE `ID` = 9561;
UPDATE `gameobject_template` SET `AIName` = '' WHERE `entry` = 181758;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 181758 AND `source_type` = 1;
