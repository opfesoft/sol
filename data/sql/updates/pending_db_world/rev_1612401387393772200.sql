INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1612401387393772200');

-- Removing Dupe Veins across lower parts of STV
DELETE FROM `gameobject` WHERE `guid` IN (12189, 64095, 15430);
