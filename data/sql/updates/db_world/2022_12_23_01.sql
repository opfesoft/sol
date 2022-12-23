UPDATE `gameobject_template` SET `AIName` = '' WHERE `entry` = 375;
UPDATE `gameobject` SET `spawntimesecs` = 120 WHERE `id` = 375;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 375 AND `source_type` = 1;

DELETE FROM `pool_template` WHERE `entry` = 203347;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(203347,19,'Tirisfal Pumpkin (19 out of 39)');

DELETE FROM `pool_gameobject` WHERE `pool_entry` = 203347;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(45042,203347,0,'Tirisfal Pumpkin Node 1'),
(45043,203347,0,'Tirisfal Pumpkin Node 2'),
(45157,203347,0,'Tirisfal Pumpkin Node 3'),
(45194,203347,0,'Tirisfal Pumpkin Node 4'),
(45195,203347,0,'Tirisfal Pumpkin Node 5'),
(45196,203347,0,'Tirisfal Pumpkin Node 6'),
(45197,203347,0,'Tirisfal Pumpkin Node 7'),
(45198,203347,0,'Tirisfal Pumpkin Node 8'),
(45200,203347,0,'Tirisfal Pumpkin Node 9'),
(45201,203347,0,'Tirisfal Pumpkin Node 10'),
(3008763,203347,0,'Tirisfal Pumpkin Node 11'),
(3008764,203347,0,'Tirisfal Pumpkin Node 12'),
(3008765,203347,0,'Tirisfal Pumpkin Node 13'),
(3008766,203347,0,'Tirisfal Pumpkin Node 14'),
(3008767,203347,0,'Tirisfal Pumpkin Node 15'),
(3008768,203347,0,'Tirisfal Pumpkin Node 16'),
(3008769,203347,0,'Tirisfal Pumpkin Node 17'),
(3008770,203347,0,'Tirisfal Pumpkin Node 18'),
(3008771,203347,0,'Tirisfal Pumpkin Node 19'),
(3008772,203347,0,'Tirisfal Pumpkin Node 20'),
(3008773,203347,0,'Tirisfal Pumpkin Node 21'),
(3008774,203347,0,'Tirisfal Pumpkin Node 22'),
(3008775,203347,0,'Tirisfal Pumpkin Node 23'),
(3008776,203347,0,'Tirisfal Pumpkin Node 24'),
(3008777,203347,0,'Tirisfal Pumpkin Node 25'),
(3008778,203347,0,'Tirisfal Pumpkin Node 26'),
(3008779,203347,0,'Tirisfal Pumpkin Node 27'),
(3008780,203347,0,'Tirisfal Pumpkin Node 28'),
(3008781,203347,0,'Tirisfal Pumpkin Node 29'),
(3008782,203347,0,'Tirisfal Pumpkin Node 30'),
(3008783,203347,0,'Tirisfal Pumpkin Node 31'),
(3008784,203347,0,'Tirisfal Pumpkin Node 32'),
(3008785,203347,0,'Tirisfal Pumpkin Node 33'),
(3008786,203347,0,'Tirisfal Pumpkin Node 34'),
(3008787,203347,0,'Tirisfal Pumpkin Node 35'),
(3008788,203347,0,'Tirisfal Pumpkin Node 36'),
(3008789,203347,0,'Tirisfal Pumpkin Node 37'),
(3008790,203347,0,'Tirisfal Pumpkin Node 38'),
(3008791,203347,0,'Tirisfal Pumpkin Node 39');
