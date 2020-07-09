-- DB update 2020_07_09_01 -> 2020_07_09_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_07_09_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_07_09_01 2020_07_09_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1594276788726389601'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1594276788726389601');

-- Lady Moongazer SAI
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 2184;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2184 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2184,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lady Moongazer - On Respawn - Set Active On'),
(2184,0,1,0,0,0,100,0,1500,2000,3100,3500,0,11,6660,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Moongazer - In Combat - Cast Shoot'),
(2184,0,2,0,9,0,100,0,0,20,8000,11000,0,11,6533,1,0,0,0,0,2,0,0,0,0,0,0,0,0,'Lady Moongazer - Within 0-20 Range - Cast Net');

-- Lady Moongazer: Waypoint movement
UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 37730;
UPDATE `creature_addon` SET `path_id` = 377300 WHERE `guid` = 37730;
DELETE FROM `waypoint_data` WHERE `id` = 377300;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(377300,1,5664.94,126.206,32.2577,0,0,0,0,100,0),
(377300,2,5665.71,114.36,33.9244,0,0,0,0,100,0),
(377300,3,5667.83,101.112,34.2326,0,0,0,0,100,0),
(377300,4,5672.32,89.7686,32.8337,0,0,0,0,100,0),
(377300,5,5677.36,83.7037,31.2958,0,0,0,0,100,0),
(377300,6,5682.31,80.7648,30.5507,0,0,0,0,100,0),
(377300,7,5687.51,81.0091,30.5231,0,0,0,0,100,0),
(377300,8,5693.51,85.1712,30.9232,0,0,0,0,100,0),
(377300,9,5701.99,92.4892,31.5656,0,0,0,0,100,0),
(377300,10,5709.2,98.7697,31.7233,0,0,0,0,100,0),
(377300,11,5717.97,106.966,31.655,0,0,0,0,100,0),
(377300,12,5727.33,117.522,31.9814,0,0,0,0,100,0),
(377300,13,5735.26,127.459,31.7193,0,0,0,0,100,0),
(377300,14,5741.74,137.828,31.4726,0,0,0,0,100,0),
(377300,15,5746.04,149.143,32.0558,0,0,0,0,100,0),
(377300,16,5748.44,161.263,32.6686,0,0,0,0,100,0),
(377300,17,5748.95,174.083,32.5618,0,0,0,0,100,0),
(377300,18,5749.23,187.605,31.1043,0,0,0,0,100,0),
(377300,19,5746.08,198.532,30.0098,0,0,0,0,100,0),
(377300,20,5739.88,205.109,29.2572,0,0,0,0,100,0),
(377300,21,5730.17,207.247,28.1638,0,0,0,0,100,0),
(377300,22,5717.3,206.008,27.1385,0,0,0,0,100,0),
(377300,23,5707.59,203.486,26.5445,0,0,0,0,100,0),
(377300,24,5700.13,198.62,26.3088,0,0,0,0,100,0),
(377300,25,5694.58,189.775,26.6816,0,0,0,0,100,0),
(377300,26,5689.56,178.095,27.7833,0,0,0,0,100,0),
(377300,27,5684.98,166.615,28.8389,0,0,0,0,100,0),
(377300,28,5680.21,155.075,29.4717,0,0,0,0,100,0),
(377300,29,5675.08,144.719,30.1315,0,0,0,0,100,0),
(377300,30,5669.33,133.901,31.2384,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
