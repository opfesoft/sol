-- DB update 2021_06_29_03 -> 2021_06_29_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_29_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_29_03 2021_06_29_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624963015096105142'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624963015096105142');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 4339;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4339,0,0,1,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Brimgore - On Respawn - Set Active On'),
(4339,0,1,0,61,0,100,0,0,0,0,0,0,208,2,0,4,0,0,0,1,0,0,0,0,0,0,0,0,'Brimgore - Linked - Add Immunity Type ''IMMUNITY_SCHOOL'' Value ''SPELL_SCHOOL_MASK_FIRE'''),
(4339,0,2,0,0,0,100,0,2100,2300,10100,10300,0,11,8873,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Brimgore - IC - Cast ''Flame Breath'''),
(4339,0,3,0,2,0,100,1,0,60,0,0,0,11,27641,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Brimgore - Between 0-60% Health - Cast ''Fear'' (No Repeat)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
