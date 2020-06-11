-- DB update 2020_06_11_01 -> 2020_06_12_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_11_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_11_01 2020_06_12_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1591915628639656181'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1591915628639656181');

-- Infinite Timebreaker: Use spell "Infinite Timebreaker: Attack" instead of the normal attack as the model doesn't have an appropriate attack animation
DELETE FROM `smart_scripts` WHERE `entryorguid` = 32186 AND `source_type` = 0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(32186,0,0,0,11,0,100,0,0,0,0,0,0,20,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infinite Timebreaker - On Respawn - Disable Auto Attack'),
(32186,0,1,0,0,0,100,0,2000,2000,2000,2000,0,11,5433,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Infinite Timebreaker - IC - Cast ''Infinite Timebreaker: Attack'''),
(32186,0,2,0,0,0,100,0,7000,12000,14000,23000,0,11,60074,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infinite Timebreaker - IC - Cast ''Time Stop'''),
(32186,0,3,0,2,0,100,0,0,30,10000,14000,0,11,60075,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Infinite Timebreaker - Between 0-30% Health - Cast ''Enrage''');

-- Bronze Dragonshrine Sands Spell Focus: Increase range to cover the whole area
UPDATE `gameobject_template` SET `Data1` = 200 WHERE `entry` = 190202;

-- Respawn dragons after 30 seconds
UPDATE `creature` SET `spawntimesecs` = 30 WHERE `id` IN (26277,32180,32186,32185);

-- Increase wander distance for the bronze dragons
UPDATE `creature` SET `wander_distance` = 30 WHERE `id` IN (26277,32180);

-- Add new Bronze Shrine Warden
DELETE FROM `creature` WHERE `guid` = 111427;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(111427,26277,571,0,0,1,1,27811,0,4139.1,-449.024,158.799,5.27138,30,30,0,53550,0,1,0,0,0,0);

-- Cleanup creature addon
DELETE FROM `creature_template_addon` WHERE `entry` IN (26277,32180,32186,32185);
DELETE FROM `creature_addon` WHERE `guid` IN (111427,111429,112956,112957,112958,112959,112960,112961,113432,113434,113435,113436,113438,113509,113510);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(111427,0,0,50331648,0,0,1,'4368'),
(111429,0,0,50331648,0,0,1,'4368'),
(112956,0,0,50331648,0,0,1,'4368'),
(112957,1129570,0,50331648,0,0,1,'4368'),
(112958,0,0,50331648,0,0,1,'4368'),
(112959,0,0,50331648,0,0,1,'4368'),
(112960,0,0,50331648,0,0,1,'4368'),
(112961,0,0,50331648,0,0,1,'4368'),
(113432,0,0,50331648,0,0,1,'4368'),
(113434,0,0,50331648,0,0,1,'4368'),
(113435,0,0,50331648,0,0,1,'4368'),
(113436,1134360,0,50331648,0,0,1,'4368'),
(113438,1134380,0,50331648,0,0,1,'4368'),
(113509,0,0,50331648,0,0,1,'4368'),
(113510,0,0,50331648,0,0,1,'4368');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
