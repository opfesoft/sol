-- DB update 2021_08_31_02 -> 2021_08_31_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_31_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_31_02 2021_08_31_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630420388487854430'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630420388487854430');

UPDATE `creature_template_addon` SET `bytes1` = 0 WHERE `entry` = 6035;

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 6035;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(6035,0,0,0,67,0,100,0,5000,5000,0,0,0,11,7159,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Razorfen Stalker - On Behind Target - Cast ''Backstab'''),
(6035,0,1,0,1,0,100,0,1000,1000,1000,1000,0,11,22766,32,0,0,0,0,1,0,0,0,0,0,0,0,0,'Razorfen Stalker - OOC - Cast ''Sneak''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;