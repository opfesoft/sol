-- DB update 2021_08_31_04 -> 2021_09_02_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_31_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_31_04 2021_09_02_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630564065131502024'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630564065131502024');

UPDATE `creature` SET `position_x` = 7901.31, `position_y` = -6708.41, `position_z` = 40.5276 WHERE `guid` = 82123;
UPDATE `creature` SET `position_x` = 7841.78, `position_y` = -6700.26, `position_z` = 27.3498 WHERE `guid` = 82127;
UPDATE `creature` SET `position_x` = 6480.77, `position_y` = -6441.21, `position_z` = 48.5489 WHERE `guid` = 82841;
UPDATE `creature` SET `position_x` = 6435.35, `position_y` = -6378.12, `position_z` = 41.2382, `wander_distance` = 4 WHERE `guid` = 82899;
UPDATE `creature` SET `position_x` = 6446.16, `position_y` = -6343.97, `position_z` = 41.2439, `wander_distance` = 4 WHERE `guid` = 82879;
UPDATE `creature` SET `position_x` = 6437.1, `position_y` = -6360.57, `position_z` = 41.2832, `orientation` = 5.93124 WHERE `guid` = 82871;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
