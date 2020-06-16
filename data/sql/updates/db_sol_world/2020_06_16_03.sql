-- DB update 2020_06_16_02 -> 2020_06_16_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_16_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_16_02 2020_06_16_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1592320888609416613'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1592320888609416613');

-- Okla: New position (she was too far away from the first waypoint)
UPDATE `creature` SET `position_x` = 280.125, `position_y` = -3029.01, `position_z` = 97.3502 WHERE `guid` = 13179;

-- Okla SAI: Pause waypoint movement after the path is finished
DELETE FROM `smart_scripts` WHERE `entryorguid` = 14873 AND `source_type` = 0 AND `id` = 7;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(14873,0,7,0,40,0,100,0,44,14873,0,0,0,54,60000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Okla - On Waypoint 44 Reached - Pause Waypoint');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
