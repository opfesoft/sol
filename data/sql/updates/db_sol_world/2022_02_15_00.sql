-- DB update 2022_02_14_02 -> 2022_02_15_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_14_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_14_02 2022_02_15_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1644880946893956284'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1644880946893956284');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 3386;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3386,0,0,0,0,0,100,0,0,0,3400,4800,0,11,9734,64,0,0,0,0,2,0,0,0,0,0,0,0,0,'Theramore Preserver - IC - Cast ''Holy Smite'''),
(3386,0,1,0,74,0,100,0,25,60,15000,21000,40,11,6074,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Theramore Preserver - On Friendly Between 25-60% Health - Cast ''Renew'''),
(3386,0,2,0,74,0,100,0,0,25,12000,18000,40,11,2052,0,0,0,0,0,7,0,0,0,0,0,0,0,0,'Theramore Preserver - On Friendly Between 0-25% Health - Cast ''Lesser Heal'''),
(3386,0,3,0,2,0,100,1,0,15,0,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'Theramore Preserver - Between 0-15% Health - Flee For Assist (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
