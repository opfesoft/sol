-- DB update 2021_03_14_02 -> 2021_03_15_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_14_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_14_02 2021_03_15_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1615846728118459761'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1615846728118459761');

UPDATE `gameobject_template_addon` SET `flags` = 0 WHERE `entry` IN (186841,187558);

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (25249,25302);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (25249,25302) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 25307 AND `source_type` = 0 AND `id` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(25307,0,1,0,1,0,100,0,5000,5000,0,0,0,105,1,0,0,0,0,0,14,59767,187558,0,0,0,0,0,0,'Recruitment Officer Blythe - OOC - Set Flag ''GO_FLAG_IN_USE'' (Chair)'),

(25302,0,0,0,1,0,100,0,5000,5000,0,0,0,105,1,0,0,0,0,0,14,60638,186841,0,0,0,0,0,0,'Old Man Colburn - OOC - Set Flag ''GO_FLAG_IN_USE'' (Chair)'),

(25249,0,0,0,1,0,100,0,5000,5000,0,0,0,105,1,0,0,0,0,0,14,60615,186839,0,0,0,0,0,0,'Midge - OOC - Set Flag ''GO_FLAG_IN_USE'' (Chair)');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
