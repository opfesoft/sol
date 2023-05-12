UPDATE `creature` SET `position_x` = 3639.35, `position_y` = 1907.23, `position_z` = 117.966, `spawntimesecs` = 900, `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 1975937;
UPDATE `creature` SET `position_x` = 3759.79, `position_y` = 1703.21, `position_z` = 147.393, `spawntimesecs` = 900, `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 1975943;
UPDATE `creature` SET `position_x` = 3897.02, `position_y` = 1643.36, `position_z` = 125.598, `spawntimesecs` = 900, `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 1975947;
UPDATE `creature` SET `spawntimesecs` = 900, `wander_distance` = 10, `MovementType` = 1 WHERE `guid` IN (1975938,1975939,1975940,1975941,1975942,1975944,1975945,1975946,1975948,1975949,1975950,1975951,1975952,1975953,1975954,1975955,1975956,1975957);

DELETE FROM `pool_template` WHERE `entry` = 203349;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(203349,1,'Ethereum Jailor (1 out of 21');

DELETE FROM `pool_creature` WHERE `pool_entry` = 203349;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(1975937,203349,0,'Ethereum Jailor - Spawn 1'),
(1975938,203349,0,'Ethereum Jailor - Spawn 2'),
(1975939,203349,0,'Ethereum Jailor - Spawn 3'),
(1975940,203349,0,'Ethereum Jailor - Spawn 4'),
(1975941,203349,0,'Ethereum Jailor - Spawn 5'),
(1975942,203349,0,'Ethereum Jailor - Spawn 6'),
(1975943,203349,0,'Ethereum Jailor - Spawn 7'),
(1975944,203349,0,'Ethereum Jailor - Spawn 8'),
(1975945,203349,0,'Ethereum Jailor - Spawn 9'),
(1975946,203349,0,'Ethereum Jailor - Spawn 10'),
(1975947,203349,0,'Ethereum Jailor - Spawn 11'),
(1975948,203349,0,'Ethereum Jailor - Spawn 12'),
(1975949,203349,0,'Ethereum Jailor - Spawn 13'),
(1975950,203349,0,'Ethereum Jailor - Spawn 14'),
(1975951,203349,0,'Ethereum Jailor - Spawn 15'),
(1975952,203349,0,'Ethereum Jailor - Spawn 16'),
(1975953,203349,0,'Ethereum Jailor - Spawn 17'),
(1975954,203349,0,'Ethereum Jailor - Spawn 18'),
(1975955,203349,0,'Ethereum Jailor - Spawn 19'),
(1975956,203349,0,'Ethereum Jailor - Spawn 20'),
(1975957,203349,0,'Ethereum Jailor - Spawn 21');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 23008;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(23008,0,0,0,0,0,100,0,4000,5000,9000,17000,0,11,36513,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ethereum Jailor - IC - Cast ''Intangible Presence''');
