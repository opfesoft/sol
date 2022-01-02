-- DB update 2021_12_31_01 -> 2022_01_02_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_31_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_31_01 2022_01_02_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641161088994442702'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641161088994442702');

UPDATE `smart_scripts` SET `event_type` = 19, `event_param1` = 3371, `event_param2` = 0, `event_param3` = 0, `event_param4` = 0, `comment` = 'Curator Thorius - On Quest ''Dwarven Justice'' Accepted - Say Line 0' WHERE `entryorguid` = 8256 AND `source_type` = 0 AND `id` = 0;
UPDATE `waypoint_data` SET `orientation` = 2.24195 WHERE `id` = 18870 AND `point` = 41;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
