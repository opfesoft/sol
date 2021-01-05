-- DB update 2021_01_05_05 -> 2021_01_05_06
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_05_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_05_05 2021_01_05_06 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609860158178838901'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609860158178838901');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (4248,4124,4249,4154,4158,9377);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (4248,4124,4249,4154,4158,9377) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4248,0,0,0,0,0,100,0,1700,2400,9800,12600,0,11,3604,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Pesterhide Hyena - IC - Cast ''Tendon Rip'''),

(4124,0,0,0,0,0,100,0,2100,3700,12700,13400,0,11,24331,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Needles Cougar - IC - Cast ''Rake'''),

(4249,0,0,0,2,0,100,1,0,30,0,0,0,11,6576,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Pesterhide Snarler - Between 0-30% Health - Cast ''Intimidating Growl'' (No Repeat)'),

(4154,0,0,0,12,0,100,1,0,20,0,0,0,11,7160,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Salt Flats Scavenger - Target Between 0-20% Health - Cast ''Execute'' (No Repeat)'),

(4158,0,0,0,12,0,100,1,0,20,0,0,0,11,7160,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Salt Flats Vulture - Target Between 0-20% Health - Cast ''Execute'' (No Repeat)'),

(9377,0,0,0,0,0,100,0,1700,2300,8700,9200,0,11,10093,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Swirling Vortex - IC - Cast ''Harsh Winds''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
