-- DB update 2020_06_16_00 -> 2020_06_16_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_16_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_16_00 2020_06_16_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1592302719173539271'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1592302719173539271');

-- Mogg: Sheathe melee weapon
DELETE FROM `creature_template_addon` WHERE `entry` = 14908;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(14908,0,0,0,0,0,0,'');

-- Mogg: Add melee weapon
DELETE FROM `creature_equip_template` WHERE `CreatureID` = 14908;
INSERT INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`)
VALUES
(14908,1,751,0,0,0);

-- Mogg: Ready / sheathe melee weapon; random movement at the end of the waypoint path
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (1490800,1490804) AND `source_type` = 9 AND `id` = 4;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 1490806 AND `source_type` = 9 AND `id` = 3;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(1490800,9,4,0,0,0,100,0,0,0,0,0,0,40,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mogg - On Script - Ready Melee Weapon'),
(1490804,9,4,0,0,0,100,0,0,0,0,0,0,40,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mogg - On Script - Sheathe Melee Weapon'),
(1490806,9,3,0,0,0,100,0,0,0,0,0,0,89,5,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Mogg - On Script - Start Random Movement');

UPDATE `smart_scripts` SET `event_param1` = 5000, `event_param2` = 5000 WHERE `entryorguid` = 1490806 AND `source_type` = 9 AND `id` = 2;

-- Mogg: Fix not existing link
UPDATE `smart_scripts` SET `link` = 0 WHERE `entryorguid` = 14908 AND `source_type` = 0 AND `id` = 7;

-- Swine: Enable random movement
UPDATE `creature` SET `wander_distance` = 2, `MovementType` = 1 WHERE `guid` IN (20202,20200);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
