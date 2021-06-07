INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1622263128329617917');

-- Remove Scarlet Gauntlets / Scarlet Wristguard from RLTs
DELETE FROM `reference_loot_template` WHERE `Item` IN (10331,10333);
