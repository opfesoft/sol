INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1618275651812886000');

UPDATE `quest_template` SET `RewardMoney` = 900 WHERE `ID` IN (13479, 13480, 13502, 13503);
UPDATE `quest_template` SET `RewardMoney` = 5, `RewardXPDifficulty` = 1, `RewardBonusMoney` = 13200 WHERE `ID` = 13483;
UPDATE `quest_template` SET `RewardMoney` = 5 WHERE `ID` = 13484;
