-- DB update 2021_03_06_00 -> 2021_03_08_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_03_06_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_03_06_00 2021_03_08_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1615185672364548177'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1615185672364548177');

DELETE FROM `gameobject` WHERE `guid` BETWEEN 3008792 AND 3008796;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(3008792,3743,1,0,0,1,1,-1274.86,-3016.2,72.6146,1.63939,0,0,0.730938,0.682444,-1,100,1,0),
(3008793,3743,1,0,0,1,1,-1277.91,-3016.5,72.699,0.889334,0,0,0.430157,0.902754,-1,100,1,0),
(3008794,3743,1,0,0,1,1,-1279.63,-3014.32,71.7535,0.539832,0,0,0.26665,0.963793,-1,100,1,0),
(3008795,3743,1,0,0,1,1,-1275.4,-3006.46,72.5618,1.29382,0,0,0.602723,0.79795,-1,100,1,0),
(3008796,3743,1,0,0,1,1,-1278.97,-3008.1,72.0716,0.86185,0,0,0.417711,0.90858,-1,100,1,0);

DELETE FROM `event_scripts` WHERE `id` = 525;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`)
VALUES
(525,2,9,3008792,60,0,0,0,0,0),
(525,2,9,3008793,60,0,0,0,0,0),
(525,2,9,3008794,60,0,0,0,0,0),
(525,2,9,3008795,60,0,0,0,0,0),
(525,2,9,3008796,60,0,0,0,0,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
