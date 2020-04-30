-- DB update 2020_04_30_00 -> 2020_05_01_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_04_30_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_04_30_00 2020_05_01_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1588284256796180581'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1588284256796180581');

UPDATE `creature` SET `position_x` = 2317.9, `position_y` = 287.634, `position_z` = 37.3108, `orientation` = 3.05293, `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 31921;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
