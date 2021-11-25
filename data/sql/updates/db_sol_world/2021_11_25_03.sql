-- DB update 2021_11_25_02 -> 2021_11_25_03
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_11_25_02';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_11_25_02 2021_11_25_03 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1637881153619698169'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1637881153619698169');

UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` = 12596;

DELETE FROM `creature` WHERE `guid` = 12605;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(12605,7319,1,0,0,1,1,0,0,10993.6,1686.8,1291.2,0,120,5,230,249,1,0,0,0,0);

DELETE FROM `pool_template` WHERE `entry` = 1107;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(1107,1,'Lady Sathrah (1 out of 2)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 1107;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(12596,1107,0,'Lady Sathrah Spawn 1'),
(12605,1107,0,'Lady Sathrah Spawn 2');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
