-- DB update 2021_10_06_01 -> 2021_10_06_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_06_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_06_01 2021_10_06_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1633501390314957821'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1633501390314957821');

DELETE FROM `creature` WHERE `guid` IN (301303,301304);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(301303,14343,1,0,0,1,1,0,0,6091.22,-1485.77,438.13,0,9900,15,1,0,1,0,0,0,0),
(301304,14343,1,0,0,1,1,0,0,6307.9,-1637.18,474.611,0,9900,15,1,0,1,0,0,0,0);

DELETE FROM `pool_template` WHERE `entry` = 365;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(365,1,'Olm the Wise Spawns (1 out of 3)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 365;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(51897,365,0,'Olm the Wise Spawn 1'),
(301303,365,0,'Olm the Wise Spawn 2'),
(301304,365,0,'Olm the Wise Spawn 3');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
