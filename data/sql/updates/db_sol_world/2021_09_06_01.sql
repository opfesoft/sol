-- DB update 2021_09_06_00 -> 2021_09_06_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_06_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_06_00 2021_09_06_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1630880835589183377'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1630880835589183377');

UPDATE `gameobject` SET `spawntimesecs` = 60 WHERE `guid` = 46420;

DELETE FROM `gameobject` WHERE `guid` IN (100510,100511,100512,100513);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(100510,179908,0,0,0,1,1,323.533,-4133.47,119.93,0,0,0,0.996195,0.087156,60,100,1,0),
(100511,179908,0,0,0,1,1,217.35,-4318.79,117.73,0,0,0,0.996195,0.087156,60,100,1,0),
(100512,179908,0,0,0,1,1,108.72,-4365.94,120.63,0,0,0,0.996195,0.087156,60,100,1,0),
(100513,179908,0,0,0,1,1,456.74,-3628.45,120.03,0,0,0,0.996195,0.087156,60,100,1,0);

DELETE FROM `pool_template` WHERE `entry` = 371;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(371,1,'Slagtree''s Lost Tools Spawns');

DELETE FROM `pool_gameobject` WHERE `pool_entry` = 371;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(46420,371,0,'Slagtree''s Lost Tools Spawn 1'),
(100510,371,0,'Slagtree''s Lost Tools Spawn 2'),
(100511,371,0,'Slagtree''s Lost Tools Spawn 3'),
(100512,371,0,'Slagtree''s Lost Tools Spawn 4'),
(100513,371,0,'Slagtree''s Lost Tools Spawn 5');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
