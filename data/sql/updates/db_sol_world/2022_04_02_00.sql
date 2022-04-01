-- DB update 2022_04_01_05 -> 2022_04_02_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_01_05';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_01_05 2022_04_02_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648855228564053459'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648855228564053459');

UPDATE `creature` SET `position_x` = -9507.03, `position_y` = -1275.85, `position_z` = 44.1562, `wander_distance` = 8, `MovementType` = 1 WHERE `guid` = 86156;
UPDATE `creature` SET `position_x` = -9504, `position_y` = -1286, `position_z` = 43.067, `wander_distance` = 8, `MovementType` = 1 WHERE `guid` = 86157;
UPDATE `creature` SET `position_x` = -9497, `position_y` = -1274, `position_z` = 43.456, `wander_distance` = 8, `MovementType` = 1 WHERE `guid` = 86158;
UPDATE `creature` SET `position_x` = -9511.31, `position_y` = -1285.64, `position_z` = 44.1448, `wander_distance` = 8, `MovementType` = 1 WHERE `guid` = 86159;
UPDATE `creature` SET `position_x` = -9511.99, `position_y` = -1272.53, `position_z` = 43.669, `wander_distance` = 8, `MovementType` = 1 WHERE `guid` = 86354;

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (798,799,800,801,802);
DELETE FROM `smart_scripts` WHERE `source_type` = 0 AND `entryorguid` IN (798,799,800,801,802);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(798,0,0,0,11,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Solomon - On Respawn - Set Run On'),
(799,0,0,0,11,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kevin - On Respawn - Set Run On'),
(800,0,0,0,11,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Kyle - On Respawn - Set Run On'),
(801,0,0,0,11,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Eric - On Respawn - Set Run On'),
(802,0,0,0,11,0,100,0,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Jay - On Respawn - Set Run On');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
