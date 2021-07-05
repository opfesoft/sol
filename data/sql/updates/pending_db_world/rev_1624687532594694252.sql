INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1624687532594694252');

-- Removes quest requirement from Belamoore's Research Journal junk drop
UPDATE `creature_loot_template` SET `QuestRequired` = 0 WHERE `Item` = 3711;
