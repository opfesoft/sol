-- DB update 2022_02_15_01 -> 2022_02_15_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_02_15_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_02_15_01 2022_02_15_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1644957434513819652'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1644957434513819652');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 8836;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 8836;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(8836,0,0,0,0,0,100,257,0,270000,0,0,0,11,23060,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Battle Chicken - IC - Cast ''Battle Squawk'' (No Repeat, No Reset)'),
(8836,0,1,0,0,0,100,257,0,80000,0,0,0,11,13168,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Battle Chicken - IC - Cast ''Chicken Fury'' (No Repeat, No Reset)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;