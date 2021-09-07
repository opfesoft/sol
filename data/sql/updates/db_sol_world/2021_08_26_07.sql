-- DB update 2021_08_26_06 -> 2021_08_26_07
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_26_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_26_06 2021_08_26_07 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630008629967604547'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630008629967604547');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 8907;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 8907;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8907,0,0,0,0,0,100,0,1000,1000,6000,9000,0,11,15575,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wrath Hammer Construct - IC - Cast ''Flame Cannon'''),
(8907,0,1,0,0,0,100,0,5000,15000,5000,15000,0,11,10966,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Wrath Hammer Construct - IC - ''Uppercut''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;