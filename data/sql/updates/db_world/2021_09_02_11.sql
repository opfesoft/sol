-- DB update 2021_09_02_10 -> 2021_09_02_11
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2021_09_02_10';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2021_09_02_10 2021_09_02_11 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1630227596211930942'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1630227596211930942');

-- Add new spawn
DELETE FROM `creature` WHERE `guid` = 138255;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`) VALUES
(138255, 8219, 0, 0, 0, 1, 1, 0, 1, -85.21, -2524.166, 120.508, 120.27, 72000, 10, 2059, 0, 1, 0, 0, 0, 0);

-- Add the new spawn to the same spawn pool so he can only be spawned once at a time
DELETE FROM `pool_template` WHERE `entry` = 372;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)  VALUES (372, 1, "Zul'arek Hatefowler Spawns");

DELETE FROM `pool_creature` WHERE `guid` IN (86257, 138255);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES 
(86257, 372, 0, "Zul'arek Hatefowler Spawn 1"),
(138255, 372, 0, "Zul'arek Hatefowler Spawn 2");

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
