-- DB update 2021_12_01_00 -> 2021_12_01_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_12_01_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_12_01_00 2021_12_01_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1638392465054479459'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1638392465054479459');

UPDATE `creature_template` SET `skinloot` = 0 WHERE `entry` = 11521;

UPDATE `gameobject_template` SET `AIName` = 'SmartGameObjectAI' WHERE `entry` IN (176751,176752);
DELETE FROM `smart_scripts` WHERE `source_type` = 1 AND `entryorguid` IN (176751,176752);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(176751,1,0,0,70,0,60,0,2,0,0,0,0,85,17960,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kodo Bones - On Gameobject State Changed - Invoker Cast ''Kodo Bones Trap'''),
(176752,1,0,0,70,0,60,0,2,0,0,0,0,85,17960,2,0,0,0,0,7,0,0,0,0,0,0,0,0,'Kodo Bones - On Gameobject State Changed - Invoker Cast ''Kodo Bones Trap''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
