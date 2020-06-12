-- DB update 2020_06_12_00 -> 2020_06_12_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_06_12_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_06_12_00 2020_06_12_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1591952981603912917'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1591952981603912917');

-- Salt Flats Vulture: New position and enable random movement
UPDATE `creature` SET `position_x` = -6610.59, `position_y` = -3796.3, `position_z` = -58.7499, `orientation` = 5.41979, `MovementType` = 1, `wander_distance` = 30 WHERE `guid` = 21546;

-- Salt Flats Scavenger: Add new spawns
DELETE FROM `creature` WHERE `guid` BETWEEN 24172 AND 24176;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(24172,4154,1,0,0,1,1,2305,0,-5602.86,-4125.84,-58.75,0.514214,300,30,0,1050,0,1,0,0,0,0),
(24173,4154,1,0,0,1,1,2305,0,-5900.25,-4270.93,-58.7491,5.39803,300,10,0,1050,0,1,0,0,0,0),
(24174,4154,1,0,0,1,1,2305,0,-5911.06,-4291,-58.7492,5.86926,300,10,0,1050,0,1,0,0,0,0),
(24175,4154,1,0,0,1,1,2305,0,-5890.38,-4253.88,-58.7492,4.65818,300,10,0,1050,0,1,0,0,0,0),
(24176,4154,1,0,0,1,1,2305,0,-5878.83,-4328.04,-58.7493,1.89749,300,10,0,1050,0,1,0,0,0,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
