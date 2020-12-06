-- DB update 2020_12_06_02 -> 2020_12_06_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_06_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_06_02 2020_12_06_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1607255280168091200'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1607255280168091200');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 78222;

DELETE FROM `creature_addon` WHERE `guid` = 78222;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(78222,782220,0,0,0,0,1,NULL);

DELETE FROM `smart_scripts` WHERE `entryorguid` = 18696 AND `source_type` = 0 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(18696,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kraator - On Respawn - Set Active On');

DELETE FROM `waypoint_data` WHERE `id` = 782220;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(782220,1,-4394.72,1864.71,157.072,0,10000,0,0,100,0),
(782220,2,-4420.21,1873.03,158.088,0,0,0,0,100,0),
(782220,3,-4443.67,1880.68,160.78,0,0,0,0,100,0),
(782220,4,-4461.79,1886.59,160.185,0,0,0,0,100,0),
(782220,5,-4474.89,1909.08,150.568,0,0,0,0,100,0),
(782220,6,-4485.58,1927.43,146.152,0,0,0,0,100,0),
(782220,7,-4480.83,1951.83,134.451,0,0,0,0,100,0),
(782220,8,-4469.55,1963.37,125.734,0,0,0,0,100,0),
(782220,9,-4459.78,1977.9,112.824,0,0,0,0,100,0),
(782220,10,-4450.53,1991.66,104.083,0,0,0,0,100,0),
(782220,11,-4469.15,1990.33,111.189,0,0,0,0,100,0),
(782220,12,-4468.9,1970.66,121.295,0,0,0,0,100,0),
(782220,13,-4475.96,1953.26,132.497,0,0,0,0,100,0),
(782220,14,-4486.36,1927.62,146.364,0,0,0,0,100,0),
(782220,15,-4470.28,1907.93,151.037,0,0,0,0,100,0),
(782220,16,-4455.82,1890.22,159.593,0,0,0,0,100,0),
(782220,17,-4440.1,1883.65,160.591,0,0,0,0,100,0),
(782220,18,-4418.25,1874.53,158.04,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
