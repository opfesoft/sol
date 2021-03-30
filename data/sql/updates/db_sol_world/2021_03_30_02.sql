-- DB update 2021_03_30_01 -> 2021_03_30_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_30_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_30_01 2021_03_30_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1617141307890830885'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1617141307890830885');

UPDATE `gameobject` SET `position_x` = -9893.12, `position_y` = 1447.15, `position_z` = 81.8983 WHERE `guid` = 31011;
UPDATE `gameobject` SET `position_x` = -9892.58, `position_y` = 1420.49, `position_z` = 40.9331 WHERE `guid` = 120595;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
