INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1625925059779148449');

-- Licillin
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7 WHERE `id` = 2191 AND `guid` = 52009;
-- Carnivous the Breaker
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 7  WHERE `id` = 2186 AND `guid` = 51900;

-- Correct speeds for Kregg and Licillin
UPDATE `creature_template` SET `speed_walk` = 1 WHERE `entry`IN (8203, 2191);
