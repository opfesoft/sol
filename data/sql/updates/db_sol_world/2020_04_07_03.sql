-- DB update 2020_04_07_02 -> 2020_04_07_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_04_07_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_04_07_02 2020_04_07_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1586272538397758666'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1586272538397758666');

UPDATE `gameobject` SET `position_x` = -1293.98, `position_y` = 2377.79, `position_z` = 80.9, `orientation` = 5.00077 WHERE `guid` = 11965;
UPDATE `gameobject` SET `position_x` = -1294.24, `position_y` = 2376.92, `position_z` = 81.3958 WHERE `guid` = 26038;
UPDATE `gameobject` SET `position_x` = -1294.38, `position_y` = 2376.92, `position_z` = 81.0 WHERE `guid` = 26039;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
