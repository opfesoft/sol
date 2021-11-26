-- DB update 2021_11_26_00 -> 2021_11_26_01
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_26_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_26_00 2021_11_26_01 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637965557274769141'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637965557274769141');

UPDATE `creature` SET `wander_distance` = 15, `MovementType` = 1 WHERE `guid` = 29213;

DELETE FROM `creature` WHERE `guid` = 16400;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(16400,5930,1,0,0,1,1,10875,0,692.471,1457.51,-13.0389,0,43200,15,2196,1512,1,0,0,0,0);

DELETE FROM `pool_template` WHERE `entry` = 203344;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(203344,1,'Sister Riven (1 out of 2)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 203344;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(29213,203344,0,'Sister Riven Spawn 1'),
(16400,203344,0,'Sister Riven Spawn 2');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
