-- DB update 2021_04_22_06 -> 2021_04_29_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_04_22_06';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_04_22_06 2021_04_29_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1619729329405951572'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1619729329405951572');

-- Brote: Add spawn
DELETE FROM `creature` WHERE `guid` = 113636;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(113636,27198,571,0,0,1,1,0,0,3240.79,-724.326,174.892,4.15388,300,0,0,0,0,0,0,0,0);

DELETE FROM `creature_addon` WHERE `guid` = 113636;
INSERT INTO `creature_addon` (`guid`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `isLarge`, `auras`)
VALUES
(113636,0,0,1,0,0,0,NULL);

-- Skrotee: Disable random movement
UPDATE `creature` SET `wander_distance` = 0, `MovementType` = 0 WHERE `guid` = 100891;
UPDATE `creature_addon` SET `bytes2` = 0 WHERE `guid` = 100891;

-- Scrote's Clock: Adjust position and orientation
UPDATE `gameobject` SET `position_x` = 3242.25, `position_y` = -723.96, `position_z` = 176.1, `orientation` = -2.25 WHERE `guid` = 60031;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
