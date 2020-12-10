-- DB update 2020_12_10_00 -> 2020_12_10_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_10_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_10_00 2020_12_10_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607582805046601852'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607582805046601852');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 8304 AND `source_type` = 0 AND `id` = 3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8304,0,3,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Dreadscorn - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 39020;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(39020,1,-11447.9,-2646.15,24.1283,0,0,0,0,100,0),
(39020,2,-11443,-2638.18,29.0591,0,0,0,0,100,0),
(39020,3,-11437.3,-2628.84,35.6544,0,0,0,0,100,0),
(39020,4,-11431.4,-2619.3,41.8949,0,0,0,0,100,0),
(39020,5,-11425.5,-2613.94,45.8779,0,0,0,0,100,0),
(39020,6,-11418.8,-2607.8,50.7441,0,0,0,0,100,0),
(39020,7,-11412.3,-2601.82,54.8862,0,0,0,0,100,0),
(39020,8,-11403.5,-2593.79,60.3834,0,0,0,0,100,0),
(39020,9,-11394.6,-2585.65,65.7053,0,0,0,0,100,0),
(39020,10,-11387.5,-2580.29,69.6009,0,0,0,0,100,0),
(39020,11,-11378.9,-2573.73,74.0507,0,0,0,0,100,0),
(39020,12,-11369.8,-2566.83,77.7953,0,0,0,0,100,0),
(39020,13,-11378.9,-2573.73,74.0507,0,0,0,0,100,0),
(39020,14,-11387.5,-2580.29,69.6009,0,0,0,0,100,0),
(39020,15,-11394.6,-2585.65,65.7053,0,0,0,0,100,0),
(39020,16,-11403.5,-2593.79,60.3834,0,0,0,0,100,0),
(39020,17,-11412.3,-2601.82,54.8862,0,0,0,0,100,0),
(39020,18,-11418.8,-2607.8,50.7441,0,0,0,0,100,0),
(39020,19,-11425.5,-2613.94,45.8779,0,0,0,0,100,0),
(39020,20,-11431.4,-2619.3,41.8949,0,0,0,0,100,0),
(39020,21,-11437.3,-2628.84,35.6544,0,0,0,0,100,0),
(39020,22,-11443,-2638.18,29.0591,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
