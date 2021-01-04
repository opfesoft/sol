-- DB update 2021_01_04_01 -> 2021_01_04_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_04_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_04_01 2021_01_04_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1609784102146393583'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1609784102146393583');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (6506,6560,6556,6514,6521);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (6506,6560,6556,6514,6521) AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6506,0,0,0,4,0,100,0,0,0,0,0,0,11,6268,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravasaur Runner - On Aggro - Cast ''Rushing Charge'''),
(6506,0,1,0,0,0,100,0,1700,2400,8400,9800,0,11,3391,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Ravasaur Runner - IC - Cast ''Thrash'''),

(6560,0,0,0,2,0,100,1,0,60,0,0,0,11,5810,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Stone Guardian - Between 0-60% Health - Cast ''Stone Skin'' (No Repeat)'),

(6556,0,0,0,2,0,100,1,0,80,0,0,0,11,14130,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Muculent Ooze - Between 0-80% Health - Cast ''Muculent Fever'' (No Repeat)'),

(6514,0,0,0,2,0,100,1,0,60,0,0,0,11,12555,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Un''Goro Gorilla - Between 0-60% Health - Cast ''Pummel'' (No Repeat)'),

(6521,0,0,0,4,0,100,0,0,0,0,0,0,11,11350,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Living Blaze - On Aggro - Cast ''Fire Shield''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
