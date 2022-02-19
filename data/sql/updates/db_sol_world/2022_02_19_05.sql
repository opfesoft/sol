-- DB update 2022_02_19_04 -> 2022_02_19_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_19_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_19_04 2022_02_19_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1645309669315109855'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1645309669315109855');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 68009;

DELETE FROM `creature_addon` WHERE `guid` = 68009;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(68009,680090,0,0,1,0,0,NULL);

DELETE FROM `waypoint_scripts` WHERE `id` IN (6800901,6800902,6800903);
INSERT INTO `waypoint_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `guid`)
VALUES
(6800901,2,1,16,0,0,0,0,0,0,201195),

(6800902,2,1,69,1,0,0,0,0,0,201196),
(6800902,10,1,0,1,0,0,0,0,0,201197),

(6800903,1,0,0,0,16099,0,0,0,0,201198),
(6800903,1,1,6,0,0,0,0,0,0,201199),
(6800903,7,0,0,0,16100,0,0,0,0,201200),
(6800903,7,1,1,0,0,0,0,0,0,201201);

DELETE FROM `waypoint_data` WHERE `id` = 680090;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `pathfinding`, `action`, `action_chance`, `wpguid`)
VALUES
(680090,1,9311.08,-6546.26,34.7247,6.27657,6000,0,0,6800901,100,0),
(680090,2,9305.1,-6541.02,34.7545,2.05505,6000,0,0,6800901,100,0),
(680090,3,9301.6,-6547.75,34.6299,0,0,0,0,0,100,0),
(680090,4,9300,-6554.64,34.6096,5.04835,12000,0,0,6800902,100,0),
(680090,5,9304.6,-6550.46,34.6354,0,0,0,0,0,100,0),
(680090,6,9311.54,-6549.82,34.7399,3.00197,14000,0,0,6800903,100,0),
(680090,7,9309.14,-6555.41,34.6998,2.49582,175000,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
