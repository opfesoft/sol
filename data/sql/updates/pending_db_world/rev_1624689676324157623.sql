INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1624689676324157623');

-- Removes Civilian flag from Nazzivus Summoners
UPDATE `creature_template` SET `flags_extra` = `flags_extra`&~(2) WHERE `entry` = 17524;

-- Set MovementType to 1 for spawn 86538 to match all other Nazzivus Summoners
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 86538;
