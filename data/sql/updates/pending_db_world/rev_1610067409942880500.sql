INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1610067409942880500');

UPDATE `creature_template` SET `flags_extra` = (`flags_extra` & ~0x00200000) | 0x40000000 WHERE `flags_extra` & 0x00200000 = 0x00200000;
