-- DB update 2021_10_12_00 -> 2021_10_13_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_12_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_12_00 2021_10_13_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634076720674814458'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634076720674814458');

UPDATE `creature` SET `MovementType` = 2 WHERE `guid` = 45454;
UPDATE `creature_addon` SET `path_id` = 454540 WHERE `guid` = 45454;

DELETE FROM `waypoint_data` WHERE `id` = 454540;
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`)
VALUES
(454540,1,1863.7,-1572.83,59.113,0,0,0,0,100,0),
(454540,2,1867.86,-1584.11,59.4041,0,0,0,0,100,0),
(454540,3,1872.16,-1595.76,59.65,0,0,0,0,100,0),
(454540,4,1884.42,-1598.08,59.2479,0,0,0,0,100,0),
(454540,5,1895.83,-1600.24,59.34,0,0,0,0,100,0),
(454540,6,1899.7,-1589.71,59.1999,0,0,0,0,100,0),
(454540,7,1903.93,-1578.21,59.6323,0,0,0,0,100,0),
(454540,8,1907.64,-1568.13,59.97,0,0,0,0,100,0),
(454540,9,1902.71,-1559.19,59.3094,0,0,0,0,100,0),
(454540,10,1897.06,-1548.94,58.8148,0,0,0,0,100,0),
(454540,11,1892.17,-1540.07,58.89,0,0,0,0,100,0),
(454540,12,1881.72,-1542.37,58.8573,0,0,0,0,100,0),
(454540,13,1871.1,-1544.71,58.9936,0,0,0,0,100,0),
(454540,14,1862.14,-1546.68,59.077,0,0,0,0,100,0),
(454540,15,1857.42,-1555.13,59.128,0,0,0,0,100,0),
(454540,16,1860.56,-1563.97,59.212,0,0,0,0,100,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;