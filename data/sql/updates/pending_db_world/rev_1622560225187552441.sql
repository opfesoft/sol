INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1622560225187552441');

DELETE FROM `creature_loot_template` WHERE `Entry` IN (3577, 3578) AND `Chance` = 100;
