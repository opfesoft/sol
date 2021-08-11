-- DB update 2021_08_11_02 -> 2021_08_11_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_11_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_11_02 2021_08_11_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1628713695736632794'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1628713695736632794');

UPDATE `creature` SET `position_x` = -7184.16, `position_y` = -881.301, `position_z` = 163.938, `orientation` = 0.763146 WHERE `guid` = 4566;
UPDATE `creature` SET `position_x` = -7384.39, `position_y` = -1007.95, `position_z` = 173.114, `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 5727;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
