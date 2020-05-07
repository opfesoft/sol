-- DB update 2020_05_06_00 -> 2020_05_07_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_05_06_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_05_06_00 2020_05_07_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1588856008883435191'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1588856008883435191');

-- Washte Pawne: Enable random movement
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 25 WHERE `id` = 3472;

-- Owatanka & Lakota'mani SAI: Set active on respawn
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 3474;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 3473 AND `source_type` = 0 AND `id` = 1;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 3474 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3473,0,1,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Owatanka - On Respawn - Set Active On'),
(3474,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lakota''mani - On Respawn - Set Active On');

-- Silithid Harvester: Enable random movement
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 10 WHERE `id` = 3253;

-- Silithid Harvester SAI: Use appropriate spells
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 3253;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 3253 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3253,0,0,0,0,0,100,0,1000,3000,8000,12000,0,11,7278,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Silithid Harvester - In Combat - Cast ''Summon Harvester Swarm'''),
(3253,0,1,0,2,0,100,0,0,30,5000,5000,0,11,7277,0,0,0,0,0,11,5409,10,1,0,0,0,0,0,'Silithid Harvester - Between 0-30% Health - Cast ''Harvest Swarm''');

-- Silithid Grub: Enable random movement
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 5 WHERE `id` = 3251;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
