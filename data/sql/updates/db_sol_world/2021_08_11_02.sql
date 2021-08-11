-- DB update 2021_08_11_01 -> 2021_08_11_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_08_11_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_08_11_01 2021_08_11_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1628713065493790922'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1628713065493790922');

DELETE FROM `creature` WHERE `guid` = 152292;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(152292,1848,0,0,0,1,1,0,1,1123.73,-1714.49,62.33,0,72000,5,2915,2163,1,0,0,0,0);

DELETE FROM `pool_template` WHERE `entry` = 368;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(368,1,'Lord Maldazzar Spawns');

DELETE FROM `pool_creature` WHERE `pool_entry` = 368;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(52725,368,0,'Lord Maldazzar Spawn Crypt'),
(152292,368,0,'Lord Maldazzar Spawn Inn Sorrow hill');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
