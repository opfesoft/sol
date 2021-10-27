-- DB update 2021_10_27_00 -> 2021_10_27_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_27_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_27_00 2021_10_27_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635365876819123295'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635365876819123295');

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 7729;
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` = 7729;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(7729,0,0,1,54,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spirit of Kirith - On Just Summoned - Set Active On'),
(7729,0,1,0,61,0,100,0,0,0,0,0,0,41,120000,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Spirit of Kirith - Linked - Force Despawn');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
