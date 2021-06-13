INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1623095488531317400');

UPDATE `skinning_loot_template` 
SET `GroupId` = 1 
WHERE `entry` IN (4328, 4329, 4331, 4334);
