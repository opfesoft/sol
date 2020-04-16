-- DB update 2020_04_16_00 -> 2020_04_16_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_04_16_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_04_16_00 2020_04_16_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1587071561277240263'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1587071561277240263');

-- Horde Runners: Create formation for Haren Swifthoof and clean up obsolete waypoint data
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` IN (9204,9205);
DELETE FROM `creature_addon` WHERE `guid` IN (9204,9205);
DELETE FROM `waypoint_data` WHERE `id` IN (92040,92050);
DELETE FROM `creature_formations` WHERE `leaderGUID` = 9203;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`)
VALUES
(9203,9204,3,180,515,0,0), -- Gradok          (creature ID 2477)
(9203,9205,3,90,515,0,0),  -- Thragomm        (creature ID 2478)
(9203,9203,0,0,515,0,0);   -- Haren Swifthoof (creature ID 7170)

-- Haren Swifthoof SAI: Set active
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 2478;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2478 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2478,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Haren Swifthoof - On Respawn - Set Active On');

-- Bingles Blastenheimer: Set immune to NPC (or else he gets killed by the Horde Runners)
UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 512 WHERE `entry` = 6577;


-- Alliance Outrunners: Clean up obsolete waypoint data and update formation group AI
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` IN (15169,15246,17433);
UPDATE `creature_addon` SET `path_id` = 0 WHERE `guid` IN (15169,15246,17433);
DELETE FROM `waypoint_data` WHERE `id` IN (151690,152460,174330);
UPDATE `creature_formations` SET `groupAI` = 515 WHERE `leaderGUID` = 15145;

-- Aean Swiftriver SAI: Set active
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 5797;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 5797 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(5797,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Aean Swiftriver - On Respawn - Set Active On');


-- Crimson Courier: Create formation and clean up obsolete waypoint data
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` IN (92288,92289,92290,92291);
DELETE FROM `creature_addon` WHERE `guid` IN (92288,92289,92290,92291);
DELETE FROM `waypoint_data` WHERE `id` IN (922880,922890,922900,922910);
DELETE FROM `creature_formations` WHERE `leaderGUID` = 92287;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`)
VALUES
(92287,92291,3,0,515,0,0),
(92287,92290,3,180,515,0,0),
(92287,92288,3,90,515,0,0),
(92287,92289,3,270,515,0,0),
(92287,92287,0,0,515,0,0);

-- Crimson Courier SAI: Set active
DELETE FROM `smart_scripts` WHERE `entryorguid` = 12337 AND `source_type` = 0 AND `id` = 8;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(12337,0,8,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Crimson Courier - On Respawn - Set Active On');


-- Gordo SAI: Set active
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 10666;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 10666 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(10666,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gordo - On Respawn - Set Active On');


-- Gann Stonespire SAI: Set active
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 3341;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 3341 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(3341,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Gann Stonespire - On Respawn - Set Active On');


-- Steelsnap: Clean up obsolete waypoint data and update formation group AI
DELETE FROM `creature_addon` WHERE `guid` IN (21660,21661);
DELETE FROM `waypoint_data` WHERE `id` IN (216600,216610);
DELETE FROM `creature_formations` WHERE `leaderGUID` = 21698;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`)
VALUES
(21698,21660,3,90,515,0,0),
(21698,21661,5,180,515,0,0),
(21698,21698,0,0,515,0,0);

-- Steelsnap SAI: Set active
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 4548;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 4548 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(4548,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Steelsnap - On Respawn - Set Active On');


-- Boss Tho'grun: Create formation and clean up obsolete waypoint data
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` IN (6973,6974,6975,6989,7210);
DELETE FROM `creature_addon` WHERE `guid` IN (6973,6974,6975,6989,7210);
DELETE FROM `waypoint_data` WHERE `id` IN (69730,69740,69750,69890,72100);
DELETE FROM `creature_formations` WHERE `leaderGUID` = 7209;
INSERT INTO `creature_formations` (`leaderGUID`, `memberGUID`, `dist`, `angle`, `groupAI`, `point_1`, `point_2`)
VALUES
(7209,6973,5,250,515,0,0),
(7209,6974,5,310,515,0,0),
(7209,6975,5,50,515,0,0),
(7209,6989,5,110,515,0,0),
(7209,7210,5,150,515,0,0),
(7209,7209,0,0,515,0,0);

-- Boss Tho'grun SAI: Set active
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` = 2944;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2944 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2944,0,0,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Boss Tho''grun - On Respawn - Set Active On');


-- Lieutenant Valorcall: Update formation group AI
UPDATE `creature_formations` SET `groupAI` = 515 WHERE `leaderGUID` = 14572;

-- Lieutenant Valorcall SAI: Set active
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2612 AND `source_type` = 0 AND `id` = 3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2612,0,3,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Lieutenant Valorcall - On Respawn - Set Active On');


-- Fozruk: Clean up obsolete waypoint data and update formation group AI
UPDATE `creature` SET `MovementType` = 0 WHERE `guid` IN (14515,14516,14517);
UPDATE `creature_addon` SET `path_id` = 0 WHERE `guid` IN (14515,14516,14517);
UPDATE `creature_formations` SET `groupAI` = 515 WHERE `leaderGUID` = 14514;

-- Fozruk SAI: Set active
DELETE FROM `smart_scripts` WHERE `entryorguid` = 2611 AND `source_type` = 0 AND `id` = 2;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(2611,0,2,0,11,0,100,0,0,0,0,0,0,48,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Fozruk - On Respawn - Set Active On');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
