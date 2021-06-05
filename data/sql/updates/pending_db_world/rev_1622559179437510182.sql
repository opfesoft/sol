INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1622559179437510182');

UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (16025, 16027);
