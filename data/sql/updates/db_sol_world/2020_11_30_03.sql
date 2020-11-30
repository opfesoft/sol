-- DB update 2020_11_30_02 -> 2020_11_30_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_30_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_30_02 2020_11_30_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606771040267365515'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606771040267365515');

UPDATE `creature_template` SET `speed_walk` = 1.1 WHERE `entry` = 2453;

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 69113;

DELETE FROM `creature_addon` WHERE `guid` = 69113;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(69113,691130,0,0,0,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 2453 AND `source_type` = 0 AND `id` = 3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2453,0,3,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lo''Grosh - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 691130;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(691130,1,623.855,-675.236,152.814,0,0,0,0,100,0),
(691130,2,619.776,-675.36,152.368,0,0,0,0,100,0),
(691130,3,616.695,-675.454,151.824,0,0,0,0,100,0),
(691130,4,614.249,-679.964,152.266,0,0,0,0,100,0),
(691130,5,612.288,-683.58,153.169,0,0,0,0,100,0),
(691130,6,611.366,-689.451,153.302,0,0,0,0,100,0),
(691130,7,610.387,-695.678,152.379,0,0,0,0,100,0),
(691130,8,608.366,-700.5,151.584,0,0,0,0,100,0),
(691130,9,606.786,-704.271,151.857,0,0,0,0,100,0),
(691130,10,602.88,-708.037,151.43,0,0,0,0,100,0),
(691130,11,600.036,-710.78,151.199,0,0,0,0,100,0),
(691130,12,596.087,-712.529,149.801,0,0,0,0,100,0),
(691130,13,590.531,-714.988,149.803,0,0,0,0,100,0),
(691130,14,587.783,-716.205,149.476,0,0,0,0,100,0),
(691130,15,583.897,-719.556,149.89,0,0,0,0,100,0),
(691130,16,580.536,-722.454,150.268,0,0,0,0,100,0),
(691130,17,576.543,-725.898,150.469,0,0,0,0,100,0),
(691130,18,581.389,-721.699,150.236,0,0,0,0,100,0),
(691130,19,585.181,-718.412,149.593,0,0,0,0,100,0),
(691130,20,586.344,-717.404,149.329,0,0,0,0,100,0),
(691130,21,589.527,-715.681,149.692,0,0,0,0,100,0),
(691130,22,592.913,-713.849,149.811,0,0,0,0,100,0),
(691130,23,595.769,-712.303,149.753,0,0,0,0,100,0),
(691130,24,599.157,-710.668,150.898,0,0,0,0,100,0),
(691130,25,600.992,-709.782,151.391,0,0,0,0,100,0),
(691130,26,603.877,-706.264,151.598,0,0,0,0,100,0),
(691130,27,606.692,-702.832,151.87,0,0,0,0,100,0),
(691130,28,608.745,-700.329,151.574,0,0,0,0,100,0),
(691130,29,614.029,-696.513,152.62,0,0,0,0,100,0),
(691130,30,619.374,-695.332,153.2,0,0,0,0,100,0),
(691130,31,625.471,-693.985,153.691,0,0,0,0,100,0),
(691130,32,627.817,-691.979,154.536,0,0,0,0,100,0),
(691130,33,630.919,-689.328,154.542,0,0,0,0,100,0),
(691130,34,633.585,-687.049,155.356,0,0,0,0,100,0),
(691130,35,632.397,-682.664,154.582,0,0,0,0,100,0),
(691130,36,631.456,-679.19,154.09,0,0,0,0,100,0),
(691130,37,627.549,-677.15,153.434,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
