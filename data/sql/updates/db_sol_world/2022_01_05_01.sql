-- DB update 2022_01_05_00 -> 2022_01_05_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_01_05_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_01_05_00 2022_01_05_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1641423093177319592'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1641423093177319592');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (2338,2339);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2338,0,0,0,4,0,30,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Twilight Disciple - On Aggro - Say Line 0'),
(2338,0,1,0,2,0,100,1,0,90,0,0,0,11,6074,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twilight Disciple - Between 0-90% health - Cast ''Renew'' (No Repeat)'),
(2338,0,2,0,2,0,100,1,0,30,0,0,0,11,2054,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Twilight Disciple - Between 0-30% health - Cast ''Heal'' (No Repeat)'),
(2338,0,3,0,6,0,30,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Twilight Disciple - On Death - Say Line 1'),

(2339,0,0,0,4,0,30,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Twilight Thug - On Aggro - Say Line 0'),
(2339,0,1,0,0,0,100,0,2000,12000,35000,45000,0,11,6713,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Twilight Thug - IC - Cast ''Disarm'''),
(2339,0,2,0,6,0,30,0,0,0,0,0,0,1,1,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Twilight Thug - On Death - Say Line 1');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
