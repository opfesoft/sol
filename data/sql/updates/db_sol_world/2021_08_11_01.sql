-- DB update 2021_08_11_00 -> 2021_08_11_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_11_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_11_00 2021_08_11_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1628705745357116299'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1628705745357116299');

DELETE FROM `creature` WHERE `guid` IN (152290,152291);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(152290,14339,1,0,0,1,1,11412,0,4079.03,-1199.05,287.02,0,7200,5,2672,0,1,0,0,0,0),
(152291,14339,1,0,0,1,1,11412,0,3854.92,-1665.23,257.232,0,7200,5,2672,0,1,0,0,0,0);

DELETE FROM `pool_template` WHERE `entry` = 367;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(367,1,'Death Howl Spawns');

DELETE FROM `pool_creature` WHERE `pool_entry` = 367;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(40656,367,0,'Death Howl Spawn 1'),
(152290,367,0,'Death Howl Spawn 2'),
(152291,367,0,'Death Howl Spawn 3');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
