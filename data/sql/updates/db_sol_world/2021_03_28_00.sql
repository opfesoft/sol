-- DB update 2021_03_27_01 -> 2021_03_28_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_27_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_27_01 2021_03_28_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1616938202511206843'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1616938202511206843');

UPDATE `creature` SET `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 44611;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 1657 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1657,0,0,0,0,0,100,0,1000,3000,35000,40000,0,11,3148,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Devlin Agamand - IC - Cast ''Head Crack'''),
(1657,0,1,0,4,0,100,0,0,0,0,0,0,1,0,0,1,0,0,0,7,0,0,0,0,0,0,0,0,'Devlin Agamand - On Aggro - Say Line 0'),
(1657,0,2,0,1,0,100,0,20000,40000,20000,40000,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Devlin Agamand - OOC - Say Line 1');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
