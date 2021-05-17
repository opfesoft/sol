-- DB update 2021_05_17_03 -> 2021_05_17_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_05_17_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_05_17_03 2021_05_17_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1621265233666634854'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1621265233666634854');

DELETE FROM `creature` WHERE `guid` IN (136250,136251,136252);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(136250,33575,603,0,0,3,1,0,0,2280.29,-103.281,437.704,0,180,0,1,0,0,0,0,0,0),
(136251,33575,603,0,0,3,1,0,0,2403.06,-123.937,437.558,0,180,0,1,0,0,0,0,0,0),
(136252,33575,603,0,0,3,1,0,0,2440.89,37.3463,441.636,0,180,0,1,0,0,0,0,0,0);

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
