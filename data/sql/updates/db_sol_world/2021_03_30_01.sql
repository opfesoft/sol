-- DB update 2021_03_30_00 -> 2021_03_30_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_30_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_30_00 2021_03_30_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1617140823659694194'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1617140823659694194');

UPDATE `creature` SET `position_x` = -4184.5, `position_y` = -2911.29, `position_z` = 12.6575, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 9417;
UPDATE `creature` SET `position_x` = -4130.33, `position_y` = -2867.48, `position_z` = 12.2767, `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 9418;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
