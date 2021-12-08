-- DB update 2021_12_08_02 -> 2021_12_08_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_08_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_08_02 2021_12_08_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1639001913572134160'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1639001913572134160');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 11701;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 11701;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(11701,0,0,0,20,0,100,0,13906,0,0,0,0,41,0,34320,0,0,0,0,7,0,0,0,0,0,0,0,0,'Mor''vek - On Quest ''They Grow Up So Fast'' Rewarded - Force Despawn Minion ''Venomhide Hatchling'' (Invoker)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
