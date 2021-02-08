-- DB update 2021_02_08_00 -> 2021_02_08_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_02_08_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_02_08_00 2021_02_08_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1612807780478037143'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1612807780478037143');

DELETE FROM `smart_scripts` WHERE `entryorguid` = 25773 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2577300 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(25773,0,0,0,54,0,100,0,0,0,0,0,0,80,2577300,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fizzcrank Survivor - On Just Summoned - Call Timed Action List'),

(2577300,9,0,0,0,0,100,0,0,0,0,0,0,18,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fizzcrank Survivor - On Script - Set ''UNIT_FLAG_NON_ATTACKABLE'''),
(2577300,9,1,0,0,0,100,0,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fizzcrank Survivor - On Script - Set React State ''Passive'''),
(2577300,9,2,0,0,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,21,50,0,0,0,0,0,0,0,'Fizzcrank Survivor - On Script - Say Line 0'),
(2577300,9,3,0,0,0,100,0,5000,5000,0,0,0,11,41232,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fizzcrank Survivor - On Script - Cast ''Teleport Visual Only'''),
(2577300,9,4,0,0,0,100,0,2000,2000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fizzcrank Survivor - On Script - Force Despawn');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
