-- DB update 2021_01_26_01 -> 2021_01_26_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_01_26_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_01_26_01 2021_01_26_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1611667448351482641'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1611667448351482641');

-- Val'kyr Battle-maiden: Level range 59-60
UPDATE `creature_template` SET `maxlevel` = 60 WHERE `entry` = 31095;

-- Terrifying Abomination: Level range 57-58 and set random movement to the same value for all creatures
UPDATE `creature_template` SET `minlevel` = 57 WHERE `entry` = 31098;
UPDATE `creature` SET `wander_distance` = 10 WHERE `id` = 31098 AND `MovementType` = 1;

-- Knight of the Ebon Blade: Level range 57-58 and remove unit flags (will be handled by the creature spawns)
UPDATE `creature_template` SET `minlevel` = 57, `unit_flags` = 0 WHERE `entry` = 31094;

-- Patchwerk: Decrease respawn time
UPDATE `creature` SET `spawntimesecs` = 120 WHERE `guid` = 130542;

-- Knight of the Ebon Blade: Add a few dead knights
DELETE FROM `creature` WHERE `guid` IN (200153,200154,200155,200156,200157);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(200153,31094,0,0,0,1,448,0,1,2425.68,-5617.98,420.644,1.325,360,0,15955,11445,0,0,537166592,32,0),
(200154,31094,0,0,0,1,448,0,1,2435.938,-5620.978,420.421,3.319,360,0,15955,11445,0,0,537166592,32,0),
(200155,31094,0,0,0,1,448,0,1,2415.195,-5601.245,420.643,0.833,360,0,15955,11445,0,0,537166592,32,0),
(200156,31094,0,0,0,1,448,0,1,2396.438,-5628.738,420.702,3.523,360,0,15955,11445,0,0,537166592,32,0),
(200157,31094,0,0,0,1,448,0,1,2403.937,-5642.425,420.678,0.478,360,0,15955,11445,0,0,537166592,32,0);

DELETE FROM `creature_addon` WHERE `guid` IN (200153,200154,200155,200156,200157);
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(200153,0,0,0,1,0,0,'29266'),
(200154,0,0,0,1,0,0,'29266'),
(200155,0,0,0,1,0,0,'29266'),
(200156,0,0,0,1,0,0,'29266'),
(200157,0,0,0,1,0,0,'29266');

-- Knight of the Ebon Blade: Adjust position of the 4 living knights
UPDATE `creature` SET `position_x` = 2410.179, `position_y` = -5621.223, `position_z` = 420.653 WHERE `guid` = 130488;
UPDATE `creature` SET `position_x` = 2411.769, `position_y` = -5624.546, `position_z` = 420.652 WHERE `guid` = 130485;
UPDATE `creature` SET `position_x` = 2413.665, `position_y` = -5627.342, `position_z` = 420.652 WHERE `guid` = 130487;
UPDATE `creature` SET `position_x` = 2415.735, `position_y` = -5629.859, `position_z` = 420.651 WHERE `guid` = 130486;

-- Patchwerk: Add frenzy emote
DELETE FROM `creature_text` WHERE `CreatureID` = 31099 AND `GroupID` = 0;
INSERT INTO `creature_text` (`CreatureID`, `GroupID`, `ID`, `Text`, `Type`, `Language`, `Probability`, `Emote`, `Duration`, `Sound`, `BroadcastTextId`, `TextRange`, `comment`)
VALUES
(31099,0,0,'%s goes into a frenzy!',41,0,100,0,0,0,38630,0,'Patchwerk Boss Emote - Ebon Hold');

-- Vigilant Gargoyle
UPDATE `creature_template` SET `InhabitType` = `InhabitType` | 4 WHERE `entry` = 29239; -- Enable flying
DELETE FROM `creature_addon` WHERE `guid` IN (125826,125828,125831,125832);             -- Remove submerged state
UPDATE `creature` SET `position_z` = 444.123 WHERE `guid` = 125827;                     -- Position submerged gargoyle on the ground
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(125828,0,0,9,1,0,0,NULL); -- Add submerged state

UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (31094,31099);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (31098,31094,31099) AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 3109800 AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `event_param5`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_param4`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`)
VALUES
(31098,0,0,0,26,0,100,1,0,35,0,0,1,80,3109800,1,0,0,0,0,1,0,0,0,0,0,0,0,0,'Terrifying Abomination - IC LOS (Player Only) - Call Timed Action List'),
(31098,0,1,0,0,0,80,0,0,0,7000,9000,0,11,15496,0,0,1,0,0,2,0,0,0,0,0,0,0,0,'Terrifying Abomination - IC - Cast ''Cleave'''),
(3109800,9,0,0,0,0,50,0,0,0,0,0,0,11,50335,1,0,0,0,0,7,0,0,0,0,0,0,0,0,'Terrifying Abomination - On Script - Cast ''Scourge Hook'' (No Repeat)'),

(31094,0,0,0,0,0,100,0,9250,14750,10250,15750,0,11,52372,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Knight of the Ebon Blade - IC - Cast Icy Touch'),
(31094,0,1,0,0,0,100,0,4500,6200,5500,7200,0,11,52374,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Knight of the Ebon Blade - IC - Cast Blood Strike'),
(31094,0,2,0,0,0,100,0,3500,9100,4500,11000,0,11,52373,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Knight of the Ebon Blade - IC - Cast Plague Strike'),
(31094,0,3,0,0,0,100,0,5200,15500,6200,17500,0,11,52375,2,0,0,0,0,2,0,0,0,0,0,0,0,0,'Knight of the Ebon Blade - IC - Cast Death Coil'),
(31094,0,4,0,6,0,100,0,0,0,0,0,0,70,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Knight of the Ebon Blade - On Death - Force Respawn'),

(31099,0,0,0,0,0,100,0,1000,2000,1500,1500,0,11,58412,0,0,0,0,0,2,0,0,0,0,0,0,0,0,'Patchwerk - In Combat - Cast ''Hateful Strike'''),
(31099,0,1,2,2,0,100,1,0,4,0,0,0,11,28131,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Patchwerk - On 5% HP - Cast ''Frenzy'''),
(31099,0,2,0,61,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,'Patchwerk - Linked - Say Line 0');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
