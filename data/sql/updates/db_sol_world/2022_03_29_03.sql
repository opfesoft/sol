-- DB update 2022_03_29_02 -> 2022_03_29_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_03_29_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_03_29_02 2022_03_29_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648562519465909727'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648562519465909727');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 37068;
UPDATE `creature_addon` SET `path_id` = 370680 WHERE `guid` = 37068;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3662;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3662,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Delmanis the Hated - On Respawn - Set Active On'),
(3662,0,1,0,0,0,100,0,0,0,2400,3800,0,11,20792,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Delmanis the Hated - IC - Cast ''Frostbolt'''),
(3662,0,2,0,0,0,100,0,6000,10000,12000,16000,0,11,7101,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Delmanis the Hated - IC - Cast ''Flame Blast'''),
(3662,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Delmanis the Hated - Between 0-15% Health - Flee For Assist (No Repeat)');

DELETE FROM `waypoint_scripts` WHERE `id` = 3706800;
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`)
VALUES
(3706800,1,35,1,5,0,0,0,0,0,201202),
(3706800,20,35,2,0,370680,0,0,0,0,201203);

DELETE FROM `waypoint_data` WHERE `id` = 370680;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(370680,1,7137.83,-820.707,60.1049,0,1000,0,0,0,100,0),
(370680,2,7138.54,-812.917,62.8996,0,0,0,0,0,100,0),
(370680,3,7138.77,-805.157,65.0443,0,0,0,0,0,100,0),
(370680,4,7139.04,-795.683,67.1005,0,0,0,0,0,100,0),
(370680,5,7139.28,-787.291,67.7066,0,0,0,0,0,100,0),
(370680,6,7131.93,-780.942,67.05,2.17092,5000,0,0,0,100,0),
(370680,7,7131.11,-788.217,68.1151,0,0,0,0,0,100,0),
(370680,8,7132.32,-799.054,67.1113,0,0,0,0,0,100,0),
(370680,9,7133.39,-809.255,64.2871,0,0,0,0,0,100,0),
(370680,10,7132.99,-817.393,61.7717,0,0,0,0,0,100,0),
(370680,11,7132.59,-825.363,60.0344,0,0,0,0,0,100,0),
(370680,12,7136.05,-835.608,60.2555,0,0,0,0,0,100,0),
(370680,13,7141.51,-835.671,59.0147,0,0,0,0,0,100,0),
(370680,14,7145.68,-835.719,57.7378,0,0,0,0,0,100,0),
(370680,15,7154.45,-830.982,54.7349,0,0,0,0,0,100,0),
(370680,16,7161.33,-830.657,52.376,0,0,0,0,0,100,0),
(370680,17,7169.19,-830.285,49.7336,0,0,0,0,0,100,0),
(370680,18,7177.84,-833.738,47.2131,0,0,0,0,0,100,0),
(370680,19,7188.62,-836.942,44.0173,0,0,0,0,0,100,0),
(370680,20,7195.45,-832.049,41.0543,0,0,0,0,0,100,0),
(370680,21,7198.31,-820.495,38.7834,0,0,0,0,0,100,0),
(370680,22,7195.53,-810.478,39.7596,0,0,0,0,0,100,0),
(370680,23,7193.9,-797.967,38.5927,0,0,0,0,0,100,0),
(370680,24,7188.47,-794.707,40.1813,0,0,0,0,0,100,0),
(370680,25,7176.38,-793.998,44.9891,0,0,0,0,0,100,0),
(370680,26,7170.93,-787.923,48.9574,0,0,0,0,0,100,0),
(370680,27,7169.4,-780.831,51.9083,0,0,0,0,0,100,0),
(370680,28,7167.99,-774.225,54.3313,0,0,0,0,0,100,0),
(370680,29,7163.88,-768.924,55.6487,0,0,0,0,0,100,0),
(370680,30,7163.06,-765.578,55.6767,0,0,0,0,0,100,0),
(370680,31,7161.04,-757.403,53.8204,0,0,0,0,0,100,0),
(370680,32,7154.14,-751.67,53.0025,0,0,0,0,0,100,0),
(370680,33,7145.89,-753.856,52.489,0,0,0,0,0,100,0),
(370680,34,7147.18,-762.293,52.8511,0,0,0,0,0,100,0),
(370680,35,7153.66,-766.552,54.1751,0,0,0,0,0,100,0),
(370680,36,7159.63,-770.47,55.6996,0,0,0,0,0,100,0),
(370680,37,7166.4,-774.916,54.2708,0,0,0,0,0,100,0),
(370680,38,7168.09,-781.494,52.1185,0,0,0,0,0,100,0),
(370680,39,7170.04,-789.136,49.0222,0,0,0,0,0,100,0),
(370680,40,7179.69,-794.86,43.225,0,0,0,0,0,100,0),
(370680,41,7184.87,-794.862,41.3665,0,0,0,0,0,100,0),
(370680,42,7192.23,-794.865,38.9953,0,0,0,0,0,100,0),
(370680,43,7197.34,-805.055,38.3295,0,0,0,0,0,100,0),
(370680,44,7196.9,-810.659,39.1492,0,0,0,0,0,100,0),
(370680,45,7196.08,-821.155,39.5764,0,0,0,0,0,100,0),
(370680,46,7195.45,-829.248,40.8052,0,0,0,0,0,100,0),
(370680,47,7186.57,-837.96,44.7865,0,0,0,0,0,100,0),
(370680,48,7181.37,-841.687,46.5358,0,0,0,0,0,100,0),
(370680,49,7175.43,-845.945,48.1643,0,0,0,0,0,100,0),
(370680,50,7166.09,-849.539,50.3808,0,0,0,0,0,100,0),
(370680,51,7158.55,-840.936,52.9495,0,0,0,0,0,100,0),
(370680,52,7152.62,-833.033,55.3397,0,0,0,0,0,100,0),
(370680,53,7144.03,-830.309,57.3466,0,0,0,0,0,100,0),
(370680,54,7137.15,-828.13,58.7481,0,25000,0,0,3706800,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
