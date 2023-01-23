DELETE FROM `pool_template` WHERE `entry` = 508;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(508,1,'Water Barrel and Food Crate8');

DELETE FROM `pool_gameobject` WHERE `pool_entry` = 508;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(33607,508,0,'Water Barrel and Food Crate - Spawn 8'),
(31401,508,0,'Water Barrel and Food Crate - Spawn 8');
