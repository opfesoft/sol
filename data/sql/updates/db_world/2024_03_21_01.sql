UPDATE `creature` SET `position_x` = -740.538, `position_y` = -525.298, `position_z` = 21.9343, `orientation` = 3.95779, `wander_distance` = 0, `MovementType` = 2 WHERE `guid` = 2054680;

DELETE FROM `creature_addon` WHERE `guid` = 2054680;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `maxAggroRadius`, `auras`)
VALUES
(2054680,20546800,0,0,1,0,0,NULL,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 2435;
DELETE FROM `smart_scripts` WHERE `source_type` = 9 AND `entryorguid` = 243500;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2435,0,0,0,34,0,100,0,2,22,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southshore Crier - On WP 23 Reached - Say Line 0'),
(2435,0,1,0,34,0,100,0,2,25,0,0,0,80,243500,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southshore Crier - On WP 26 Reached - Call Timed Action List'),

(243500,9,0,0,0,0,100,0,5000,5000,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southshore Crier - On Script - Say Line 1'),
(243500,9,1,0,0,0,100,0,5000,5000,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southshore Crier - On Script - Say Line 2'),
(243500,9,2,0,0,0,100,0,8000,8000,0,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southshore Crier - On Script - Say Line 3'),
(243500,9,3,0,0,0,100,0,5000,5000,0,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southshore Crier - On Script - Say Line 4'),
(243500,9,4,0,0,0,100,0,2000,2000,0,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southshore Crier - On Script - Say Line 5'),
(243500,9,5,0,0,0,100,0,0,0,0,0,0,12,2434,1,60000,0,0,0,8,0,0,0,0,-780.091,-530.876,20.6933,0.205787,'Southshore Crier - On Script - Summon Creature ''Shadowy Assassin'''),
(243500,9,6,0,0,0,100,0,0,0,0,0,0,12,2434,1,60000,0,0,0,8,0,0,0,0,-793.784,-572.726,16.0755,5.45041,'Southshore Crier - On Script - Summon Creature ''Shadowy Assassin'''),
(243500,9,7,0,0,0,100,0,0,0,0,0,0,12,2434,1,60000,0,0,0,8,0,0,0,0,-851.03,-518.154,12.1464,2.4638,'Southshore Crier - On Script - Summon Creature ''Shadowy Assassin'''),
(243500,9,8,0,0,0,100,0,0,0,0,0,0,12,2434,1,60000,0,0,0,8,0,0,0,0,-830.229,-530.124,13.6917,5.62034,'Southshore Crier - On Script - Summon Creature ''Shadowy Assassin'''),
(243500,9,9,0,0,0,100,0,0,0,0,0,0,12,2434,1,60000,0,0,0,8,0,0,0,0,-859.667,-544.376,10.1443,1.15192,'Southshore Crier - On Script - Summon Creature ''Shadowy Assassin'''),
(243500,9,10,0,0,0,100,0,0,0,0,0,0,12,2434,1,60000,0,0,0,8,0,0,0,0,-805.857,-479.744,15.871,5.60839,'Southshore Crier - On Script - Summon Creature ''Shadowy Assassin'''),
(243500,9,11,0,0,0,100,0,0,0,0,0,0,12,2434,1,60000,0,0,0,8,0,0,0,0,-887.816,-545.123,7.04742,0.609322,'Southshore Crier - On Script - Summon Creature ''Shadowy Assassin'''),
(243500,9,12,0,0,0,100,0,0,0,0,0,0,12,2434,1,60000,0,0,0,8,0,0,0,0,-893.224,-590.699,7.4458,1.06091,'Southshore Crier - On Script - Summon Creature ''Shadowy Assassin'''),
(243500,9,13,0,0,0,100,0,0,0,0,0,0,51,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Southshore Crier - On Script - Die');

DELETE FROM `waypoint_data` WHERE `id` = 20546800;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(20546800,1,-740.538,-525.298,21.9343,NULL,0,1,0,0,100,0),
(20546800,2,-743.257,-528.19,21.5507,NULL,0,1,0,0,100,0),
(20546800,3,-745.743,-530.834,21.0126,NULL,0,1,0,0,100,0),
(20546800,4,-746.866,-534.149,20.5144,NULL,0,1,0,0,100,0),
(20546800,5,-748.361,-538.565,19.6792,NULL,0,1,0,0,100,0),
(20546800,6,-749.782,-542.761,19.0294,NULL,0,1,0,0,100,0),
(20546800,7,-751.132,-546.746,18.8604,NULL,0,1,0,0,100,0),
(20546800,8,-756.716,-546.325,18.4158,NULL,0,1,0,0,100,0),
(20546800,9,-762.063,-545.922,18.0451,NULL,0,1,0,0,100,0),
(20546800,10,-767.068,-545.545,17.8345,NULL,0,1,0,0,100,0),
(20546800,11,-772.652,-545.125,17.805,NULL,0,1,0,0,100,0),
(20546800,12,-777.07,-544.792,17.993,NULL,0,1,0,0,100,0),
(20546800,13,-780.472,-542.988,18.162,NULL,0,1,0,0,100,0),
(20546800,14,-784.387,-540.912,17.9953,NULL,0,1,0,0,100,0),
(20546800,15,-788.202,-538.889,17.6461,NULL,0,1,0,0,100,0),
(20546800,16,-792.841,-536.43,17.0119,NULL,0,1,0,0,100,0),
(20546800,17,-797.275,-534.078,16.5131,NULL,0,1,0,0,100,0),
(20546800,18,-801.604,-531.783,16.1242,NULL,0,1,0,0,100,0),
(20546800,19,-806.453,-529.212,15.721,NULL,0,1,0,0,100,0),
(20546800,20,-810.676,-526.973,15.2777,NULL,0,1,0,0,100,0),
(20546800,21,-815.42,-524.457,14.5312,NULL,0,1,0,0,100,0),
(20546800,22,-819.988,-523.49,13.7861,NULL,0,1,0,0,100,0),
(20546800,23,-825.007,-522.427,13.0779,NULL,0,1,0,0,100,0),
(20546800,24,-830.26,-521.314,12.3518,NULL,0,1,0,0,100,0),
(20546800,25,-835.346,-523.034,11.6852,NULL,0,1,0,0,100,0),
(20546800,26,-840.92,-524.92,11.2506,NULL,900000,1,0,0,100,0);
