-- DB update 2021_10_07_03 -> 2021_10_07_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_07_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_07_03 2021_10_07_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633617053033203198'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633617053033203198');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 200145;

DELETE FROM `creature_addon` WHERE `guid` = 200145;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(200145,2001450,0,0,0,0,0,NULL);

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 14232 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14232,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dart - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 2001450;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(2001450,1,-2714.64,-3489.85,34.646,0,0,0,0,100,0),
(2001450,2,-2715.9,-3500.64,34.7136,0,0,0,0,100,0),
(2001450,3,-2717.93,-3517.92,34.7221,0,0,0,0,100,0),
(2001450,4,-2719.64,-3532.51,34.06,0,0,0,0,100,0),
(2001450,5,-2713.4,-3541.08,34.1676,0,0,0,0,100,0),
(2001450,6,-2706.71,-3550.28,34.34,0,0,0,0,100,0),
(2001450,7,-2697.93,-3556.23,34.8861,0,0,0,0,100,0),
(2001450,8,-2688.8,-3562.42,35.34,0,0,0,0,100,0),
(2001450,9,-2681.99,-3557.88,34.7752,0,0,0,0,100,0),
(2001450,10,-2673.83,-3552.45,33.7903,0,0,0,0,100,0),
(2001450,11,-2664.38,-3546.15,33.94,0,0,0,0,100,0),
(2001450,12,-2663.23,-3538.46,34.0585,0,0,0,0,100,0),
(2001450,13,-2661.59,-3527.58,33.9361,0,0,0,0,100,0),
(2001450,14,-2660.2,-3518.28,34.2331,0,0,0,0,100,0),
(2001450,15,-2658.67,-3508.08,34.2477,0,0,0,0,100,0),
(2001450,16,-2657.34,-3499.2,34.2896,0,0,0,0,100,0),
(2001450,17,-2655.72,-3488.43,32.074,0,0,0,0,100,0),
(2001450,18,-2654.23,-3478.49,32.2862,0,0,0,0,100,0),
(2001450,19,-2652.7,-3468.27,33.8168,0,0,0,0,100,0),
(2001450,20,-2651.11,-3457.66,34.61,0,0,0,0,100,0),
(2001450,21,-2658.61,-3458.1,35.0759,0,0,0,0,100,0),
(2001450,22,-2667.85,-3458.65,35.5721,0,0,0,0,100,0),
(2001450,23,-2676.15,-3459.14,35.703,0,0,0,0,100,0),
(2001450,24,-2684.85,-3459.66,34.5997,0,0,0,0,100,0),
(2001450,25,-2694.37,-3460.22,34.09,0,0,0,0,100,0),
(2001450,26,-2699.14,-3467.2,34.2057,0,0,0,0,100,0),
(2001450,27,-2704.37,-3474.83,34.5298,0,0,0,0,100,0),
(2001450,28,-2710.65,-3484.01,34.9417,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
