-- DB update 2020_04_24_01 -> 2020_04_25_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_04_24_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_04_24_01 2020_04_25_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1587769469378918834'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1587769469378918834');

-- Shattered Hand Berserker SAI: Fix talk target
UPDATE `smart_scripts` SET `target_type` = 1 WHERE `entryorguid` = 16878 AND `source_type` = 0 AND `id` = 4;

-- Anchorite Relic SAI: Activate self and set time until reset to 5 minutes (will vanish then)
UPDATE `gameobject_template` SET `data3` = 300000, `AIName` = 'SmartGameObjectAI' WHERE `entry` = 185298;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 185298 AND `source_type` = 1;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(185298,1,0,0,1,0,100,1,0,0,0,0,0,9,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Relic - OOC - Activate GO (No Repeat)');

-- Fel Spirit SAI: Talk on aggro
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 22454;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 22454 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22454,0,0,0,4,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fel Spirit - On Aggro - Say Line 0');

-- Anchorite Relic Bunny SAI: Jump to nearest Anchorite Relic to fix the laser beams (spell "Anchorite Contrition")
DELETE FROM `smart_scripts` WHERE `entryorguid` = 22444 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(22444,0,0,0,60,0,100,0,500,500,6000,6000,0,11,39184,2,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Relic Bunny - On Update - Cast ''Anchorite Contrition'''),
(22444,0,1,2,11,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Relic Bunny - On Respawn - Disable Melee'),
(22444,0,2,3,61,0,100,0,0,0,0,0,0,21,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Anchorite Relic Bunny - Linked - Disable Combat Movement'),
(22444,0,3,0,61,0,100,0,0,0,0,0,0,97,10,10,1,0,0,0,15,185298,2,0,0,0,0,0,0,'Anchorite Relic Bunny - Linked - Jump To Nearest ''Anchorite Relic''');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
