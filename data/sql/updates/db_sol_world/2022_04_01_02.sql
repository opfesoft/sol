-- DB update 2022_04_01_01 -> 2022_04_01_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_01_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_01_01 2022_04_01_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648808802016067182'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648808802016067182');

-- Remove Reginald Windsor spawn
DELETE FROM `creature` WHERE `guid` = 86900;
DELETE FROM `creature_addon` WHERE `guid` = 86900;
DELETE FROM `waypoint_data` WHERE `id` = 869000;

-- Remove Underwater Construction Worker
DELETE FROM `creature` WHERE `guid` = 85178;
DELETE FROM `creature_addon` WHERE `guid` = 85178;
DELETE FROM `waypoint_data` WHERE `id` = 851780;
DELETE FROM `waypoint_scripts` WHERE `id` in (334,335);

-- Extend pool for Sewer Beast
DELETE FROM `creature` WHERE `guid` IN (300492,300493,300494,300495);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(300492,3581,0,0,0,1,1,0,0,-8479.08,709.373,85.894,3.7941,8400,0,17720,0,0,0,0,0,0),
(300493,3581,0,0,0,1,1,0,0,-8649,927.668,85.894,3.854,8400,0,17720,0,0,0,0,0,0),
(300494,3581,0,0,0,1,1,0,0,-8860.17,965.54,85.893,5.484,8400,0,17720,0,0,0,0,0,0),
(300495,3581,0,0,0,1,1,0,0,-8906.12,709.376,85.892,0.7132,8400,0,17720,0,0,0,0,0,0);

UPDATE `pool_template` SET `description` = 'Sewer Beast Spawn (1 out 6)' WHERE `entry` = 86300;

DELETE FROM `pool_creature` WHERE `guid` IN (300492,300493,300494,300495);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(300492,86300,0,'Sewer Beast 3'),
(300493,86300,0,'Sewer Beast 4'),
(300494,86300,0,'Sewer Beast 5'),
(300495,86300,0,'Sewer Beast 6');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
