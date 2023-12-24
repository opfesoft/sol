DELETE FROM `gameobject` WHERE `guid` IN (12165,12167,12174);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
(12165,2086,0,0,0,1,1,-14678.3,500.529,2.43889,1.65806,-0,-0,-0.737276,-0.675591,180,100,1),
(12167,2086,0,0,0,1,1,-14703.8,451.066,0.649918,2.77507,0,0,0.983254,0.182238,180,100,1),
(12174,2086,0,0,0,1,1,-14607.7,332.715,3.69033,1.83259,0,0,0.793353,0.608762,180,100,1);

DELETE FROM `pool_template` WHERE `entry` = 203353;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(203353,1,'Bloodsail Charts (1 out of 4)');

DELETE FROM `pool_gameobject` WHERE `pool_entry` = 203353;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(12154,203353,0,'Bloodsail Charts - Spawn 1'),
(12165,203353,0,'Bloodsail Charts - Spawn 2'),
(12167,203353,0,'Bloodsail Charts - Spawn 3'),
(12174,203353,0,'Bloodsail Charts - Spawn 4');
