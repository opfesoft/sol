-- DB update 2021_12_17_00 -> 2021_12_17_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_17_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_17_00 2021_12_17_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1639753040173391494'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1639753040173391494');

DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 10485;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10485,0,0,0,0,0,100,0,4000,8000,10000,20000,0,11,12021,0,0,0,0,0,5,5,0,0,0,0,0,0,0,'Risen Aberration - IC - Cast ''Fixate'''),
(10485,0,1,0,25,0,100,0,0,0,0,0,0,208,2,0,124,0,0,0,1,0,0,0,0,0,0,0,0,'Risen Aberration - On Reset - Add ''IMMUNITY_SCHOOL'' (Fire, Nature, Frost, Shadow, Arcane)');


--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;