-- DB update 2021_08_26_02 -> 2021_08_26_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_26_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_26_02 2021_08_26_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1629960731426241198'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1629960731426241198');

UPDATE `creature` SET `position_x` = 2441.89, `position_y` = -5325.83, `position_z` = 120.545, `wander_distance` = 10, MovementType = 1 WHERE `guid` = 36427;
UPDATE `creature` SET `position_x` = 2170.76, `position_y` = -6397.06, `position_z` = -6.2808, `wander_distance` = 10, MovementType = 1 WHERE `guid` = 36013;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
