-- DB update 2020_12_01_03 -> 2020_12_02_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_01_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_01_03 2020_12_02_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606866748481492845'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606866748481492845');

UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 8217;

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 82469;

DELETE FROM `creature_addon` WHERE `guid` = 82469;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(82469,824690,0,0,0,0,0,NULL);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 8217;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 8217 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8217,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mith''rethis the Enchanter - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 824690;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(824690,1,-524.191,-4036.51,215.86,0,0,0,0,100,0),
(824690,2,-520.995,-4044.78,216.117,0,0,0,0,100,0),
(824690,3,-517.333,-4054.25,216.023,0,0,0,0,100,0),
(824690,4,-522.858,-4064.92,215.862,0,0,0,0,100,0),
(824690,5,-528.477,-4075.78,215.853,0,0,0,0,100,0),
(824690,6,-530.916,-4084.3,215.575,0,0,0,0,100,0),
(824690,7,-539.399,-4085,215.627,0,0,0,0,100,0),
(824690,8,-546.605,-4085.6,215.86,0,0,0,0,100,0),
(824690,9,-553.478,-4085.75,221.057,0,0,0,0,100,0),
(824690,10,-558.864,-4085.86,225.49,0,0,0,0,100,0),
(824690,11,-564.315,-4085.87,229.775,0,0,0,0,100,0),
(824690,12,-570.652,-4085.87,234.629,0,0,0,0,100,0),
(824690,13,-577.637,-4085.69,240.019,0,0,0,0,100,0),
(824690,14,-582.151,-4085.57,238.351,0,0,0,0,100,0),
(824690,15,-593.878,-4085.89,238.362,0,0,0,0,100,0),
(824690,16,-600.394,-4079.77,238.352,0,0,0,0,100,0),
(824690,17,-608.979,-4071.7,238.352,0,0,0,0,100,0),
(824690,18,-616.638,-4064.5,238.217,0,0,0,0,100,0),
(824690,19,-616.73,-4056.46,238.248,0,0,0,0,100,0),
(824690,20,-616.833,-4047.42,238.046,0,0,0,0,100,0),
(824690,21,-625.399,-4045.67,237.955,0,0,0,0,100,0),
(824690,22,-634.431,-4043.82,238.059,0,0,0,0,100,0),
(824690,23,-644.944,-4041.67,238.196,0,0,0,0,100,0),
(824690,24,-652.808,-4040.06,238.274,0,0,0,0,100,0),
(824690,25,-658.673,-4034.9,238.101,0,0,0,0,100,0),
(824690,26,-665.94,-4028.5,238.349,0,0,0,0,100,0),
(824690,27,-672.615,-4022.63,238.229,0,0,0,0,100,0),
(824690,28,-676.225,-4016.49,238.145,0,0,0,0,100,0),
(824690,29,-672.621,-4011.21,238.248,0,0,0,0,100,0),
(824690,30,-664.151,-4010.24,238.159,0,0,0,0,100,0),
(824690,31,-661.409,-4016.3,238.002,0,0,0,0,100,0),
(824690,32,-658.328,-4023.1,238.336,0,0,0,0,100,0),
(824690,33,-655.342,-4029.7,238.255,0,0,0,0,100,0),
(824690,34,-649.69,-4034.22,238.303,0,0,0,0,100,0),
(824690,35,-643.857,-4038.89,238.293,0,0,0,0,100,0),
(824690,36,-637.653,-4043.85,238.07,0,0,0,0,100,0),
(824690,37,-631.005,-4043.67,238.043,0,0,0,0,100,0),
(824690,38,-624.501,-4043.49,238.073,0,0,0,0,100,0),
(824690,39,-620.894,-4037.62,237.967,0,0,0,0,100,0),
(824690,40,-617.972,-4032.87,237.873,0,0,0,0,100,0),
(824690,41,-617.964,-4025.87,237.971,0,0,0,0,100,0),
(824690,42,-617.952,-4015.26,237.989,0,0,0,0,100,0),
(824690,43,-617.939,-4004.64,238.107,0,0,0,0,100,0),
(824690,44,-617.929,-3995.55,238.35,0,0,0,0,100,0),
(824690,45,-617.919,-3987.27,238.35,0,0,0,0,100,0),
(824690,46,-617.911,-3980.06,238.482,0,0,0,0,100,0),
(824690,47,-614.387,-3971.55,238.356,0,0,0,0,100,0),
(824690,48,-611.216,-3963.89,238.351,0,0,0,0,100,0),
(824690,49,-603.295,-3958.96,238.351,0,0,0,0,100,0),
(824690,50,-593.592,-3952.91,238.256,0,0,0,0,100,0),
(824690,51,-584.578,-3947.3,238.33,0,0,0,0,100,0),
(824690,52,-576.955,-3942.55,238.542,0,0,0,0,100,0),
(824690,53,-570.672,-3938.64,238.326,0,0,0,0,100,0),
(824690,54,-568.836,-3931.76,237.925,0,0,0,0,100,0),
(824690,55,-562.8,-3935.31,238.188,0,0,0,0,100,0),
(824690,56,-556.458,-3939.03,237.937,0,0,0,0,100,0),
(824690,57,-546.922,-3939.73,238.297,0,0,0,0,100,0),
(824690,58,-537.875,-3940.39,238.764,0,0,0,0,100,0),
(824690,59,-544.51,-3942.95,238.548,0,0,0,0,100,0),
(824690,60,-552.994,-3946.22,237.714,0,0,0,0,100,0),
(824690,61,-561.374,-3949.45,238.48,0,0,0,0,100,0),
(824690,62,-566.704,-3951.51,238.427,0,0,0,0,100,0),
(824690,63,-575.342,-3948.27,238.377,0,0,0,0,100,0),
(824690,64,-585.389,-3944.5,238.405,0,0,0,0,100,0),
(824690,65,-593.589,-3941.42,238.339,0,0,0,0,100,0),
(824690,66,-603.964,-3937.53,238.094,0,0,0,0,100,0),
(824690,67,-613.806,-3933.84,238.346,0,0,0,0,100,0),
(824690,68,-620.501,-3938.32,238.463,0,0,0,0,100,0),
(824690,69,-619.525,-3947.14,238.417,0,0,0,0,100,0),
(824690,70,-618.187,-3959.21,238.351,0,0,0,0,100,0),
(824690,71,-616.96,-3970.3,238.351,0,0,0,0,100,0),
(824690,72,-617.121,-3977.76,238.477,0,0,0,0,100,0),
(824690,73,-617.293,-3985.7,238.368,0,0,0,0,100,0),
(824690,74,-617.474,-3994.09,238.352,0,0,0,0,100,0),
(824690,75,-617.656,-4002.49,238.196,0,0,0,0,100,0),
(824690,76,-617.888,-4013.22,237.96,0,0,0,0,100,0),
(824690,77,-618.1,-4023.04,237.988,0,0,0,0,100,0),
(824690,78,-617.847,-4035.06,237.734,0,0,0,0,100,0),
(824690,79,-617.606,-4046.49,238.081,0,0,0,0,100,0),
(824690,80,-617.327,-4059.77,238.279,0,0,0,0,100,0),
(824690,81,-624.179,-4061.62,238.351,0,0,0,0,100,0),
(824690,82,-627.005,-4061.7,238.351,0,0,0,0,100,0),
(824690,83,-632.647,-4061.86,242.868,0,0,0,0,100,0),
(824690,84,-638.711,-4062.04,247.263,0,0,0,0,100,0),
(824690,85,-632.647,-4061.86,242.868,0,0,0,0,100,0),
(824690,86,-627.005,-4061.7,238.351,0,0,0,0,100,0),
(824690,87,-618.277,-4063.46,238.307,0,0,0,0,100,0),
(824690,88,-614.326,-4068.37,238.185,0,0,0,0,100,0),
(824690,89,-608.181,-4076,238.351,0,0,0,0,100,0),
(824690,90,-602.99,-4082.45,238.351,0,0,0,0,100,0),
(824690,91,-602.197,-4091.63,238.412,0,0,0,0,100,0),
(824690,92,-601.102,-4104.3,238.593,0,0,0,0,100,0),
(824690,93,-600.118,-4115.69,238.504,0,0,0,0,100,0),
(824690,94,-603.457,-4123.65,238.511,0,0,0,0,100,0),
(824690,95,-606.889,-4131.83,238.428,0,0,0,0,100,0),
(824690,96,-610.419,-4140.24,238.351,0,0,0,0,100,0),
(824690,97,-604.516,-4150.56,238.368,0,0,0,0,100,0),
(824690,98,-599.085,-4160.05,238.431,0,0,0,0,100,0),
(824690,99,-593.493,-4164.29,238.355,0,0,0,0,100,0),
(824690,100,-587.6,-4160.74,238.352,0,0,0,0,100,0),
(824690,101,-590.742,-4149.03,238.386,0,0,0,0,100,0),
(824690,102,-593.862,-4137.4,238.387,0,0,0,0,100,0),
(824690,103,-601.512,-4133.65,238.387,0,0,0,0,100,0),
(824690,104,-616.749,-4126.18,238.423,0,0,0,0,100,0),
(824690,105,-629.492,-4119.94,238.351,0,0,0,0,100,0),
(824690,106,-636.05,-4113.63,238.456,0,0,0,0,100,0),
(824690,107,-642.951,-4106.99,238.504,0,0,0,0,100,0),
(824690,108,-633.05,-4102.85,238.352,0,0,0,0,100,0),
(824690,109,-622.29,-4098.36,238.873,0,0,0,0,100,0),
(824690,110,-612.091,-4094.09,238.503,0,0,0,0,100,0),
(824690,111,-601.648,-4089.73,238.38,0,0,0,0,100,0),
(824690,112,-591.144,-4085.34,238.368,0,0,0,0,100,0),
(824690,113,-582.151,-4085.57,238.351,0,0,0,0,100,0),
(824690,114,-577.637,-4085.69,240.019,0,0,0,0,100,0),
(824690,115,-570.652,-4085.87,234.629,0,0,0,0,100,0),
(824690,116,-564.315,-4085.87,229.775,0,0,0,0,100,0),
(824690,117,-558.864,-4085.86,225.49,0,0,0,0,100,0),
(824690,118,-553.478,-4085.75,221.057,0,0,0,0,100,0),
(824690,119,-546.605,-4085.6,215.86,0,0,0,0,100,0),
(824690,120,-532.116,-4085.08,215.547,0,0,0,0,100,0),
(824690,121,-529.232,-4073.31,215.856,0,0,0,0,100,0),
(824690,122,-534.159,-4063.64,216.094,0,0,0,0,100,0),
(824690,123,-539.105,-4053.94,216.756,0,0,0,0,100,0),
(824690,124,-534.926,-4044.06,216.292,0,0,0,0,100,0),
(824690,125,-531.195,-4035.23,215.861,0,0,0,0,100,0),
(824690,126,-524.871,-4028.53,215.861,0,0,0,0,100,0),
(824690,127,-514.86,-4017.93,215.861,0,0,0,0,100,0),
(824690,128,-505.494,-4008.01,215.944,0,0,0,0,100,0),
(824690,129,-511.084,-4014.74,215.856,0,0,0,0,100,0),
(824690,130,-518.313,-4023.45,215.86,0,0,0,0,100,0),
(824690,131,-524.022,-4030.32,215.86,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
