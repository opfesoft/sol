-- DB update 2021_01_04_02 -> 2021_01_05_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_04_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_04_02 2021_01_05_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609843328396476823'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609843328396476823');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (5364,5362) AND `source_type` = 0 AND `id` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (5363,5366) AND `source_type` = 0 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5363,0,2,0,74,0,100,0,0,50,5000,5000,40,11,11014,32,0,0,0,0,7,0,0,0,0,0,0,0,0,'Northspring Roguefeather - Friendly Between 0-50% Health - Cast ''Flow of the Northspring'''),

(5366,0,2,0,74,0,100,0,0,50,5000,5000,40,11,11014,32,0,0,0,0,7,0,0,0,0,0,0,0,0,'Northspring Windcaller - Friendly Between 0-50% Health - Cast ''Flow of the Northspring'''),

(5364,0,0,0,74,0,100,0,0,50,5000,5000,40,11,11014,32,0,0,0,0,7,0,0,0,0,0,0,0,0,'Northspring Slayer - Friendly Between 0-50% Health - Cast ''Flow of the Northspring'''),

(5362,0,0,0,74,0,100,0,0,50,5000,5000,40,11,11014,32,0,0,0,0,7,0,0,0,0,0,0,0,0,'Northspring Harpy - Friendly Between 0-50% Health - Cast ''Flow of the Northspring''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
