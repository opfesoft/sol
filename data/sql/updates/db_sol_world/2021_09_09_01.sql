-- DB update 2021_09_09_00 -> 2021_09_09_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_09_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_09_00 2021_09_09_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631168120725981919'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631168120725981919');

UPDATE `creature` SET `position_x` = 2296.62, `position_y` = -1836.79, `position_z` = 68.5864 WHERE `guid` = 34360;
UPDATE `creature` SET `position_x` = 2239.11, `position_y` = -1912.74, `position_z` = 67.723 WHERE `guid` = 34366;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
