-- DB update 2021_06_24_02 -> 2021_06_24_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_06_24_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_06_24_02 2021_06_24_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1624548887220585144'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1624548887220585144');

DELETE FROM `gameobject` WHERE `guid` IN (64811,64827,64837,64839,64843,64859);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(64811,180753,1,0,0,1,1,3636.93,-6091.65,0,0,0,0,0,0,3600,100,0,0),
(64827,180753,1,0,0,1,1,4020.01,-6045.53,0,0,0,0,0,0,3600,100,0,0),
(64837,180753,1,0,0,1,1,3990.05,-6295.1,0,0,0,0,0,0,3600,100,0,0),
(64839,180753,1,0,0,1,1,3517.37,-7286.96,0,0,0,0,0,0,3600,100,0,0),
(64843,180753,1,0,0,1,1,2907.51,-7090.72,0,0,0,0,0,0,3600,100,0,0),
(64859,180753,1,0,0,1,1,3031.25,-6676.11,0,0,0,0,0,0,3600,100,0,0);

DELETE FROM `pool_template` WHERE `entry` = 364;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(364,4,'Azshara - Patch of Elemental Water');

DELETE FROM `pool_gameobject` WHERE `pool_entry` = 364;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(64811,364,0,'1 - Patch of Elemental Water'),
(64827,364,0,'2 - Patch of Elemental Water'),
(64837,364,0,'3 - Patch of Elemental Water'),
(64839,364,0,'4 - Patch of Elemental Water'),
(64843,364,0,'5 - Patch of Elemental Water'),
(64859,364,0,'6 - Patch of Elemental Water');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
