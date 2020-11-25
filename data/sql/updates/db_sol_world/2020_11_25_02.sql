-- DB update 2020_11_25_01 -> 2020_11_25_02
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_11_25_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_11_25_01 2020_11_25_02 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1606328719286842564'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1606328719286842564');

-- Arcturis: Enable random movement
UPDATE `creature` SET `wander_distance` = 10, `MovementType` = 1 WHERE `guid` = 42158;

-- Skoll: Multiple spawn points & enable random movement
DELETE FROM `creature` WHERE `guid` IN (42159,3008775,3008776);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(42159,35189,571,0,0,1,1,0,0,7101.85,-1443.73,924.261,0.178631,39600,10,1,0,1,0,0,0,0),
(3008775,35189,571,0,0,1,1,0,0,7042.28,-316.819,785.23,5.95917,39600,10,1,0,1,0,0,0,0),
(3008776,35189,571,0,0,1,1,0,0,7725.98,-166.848,875.72,5.72354,39600,10,1,0,1,0,0,0,0);

DELETE FROM `pool_template` WHERE `entry` = 42159;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(42159,1,'Skoll (1 out 3)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 42159;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(42159,42159,0,'Skoll 1'),
(3008775,42159,0,'Skoll 2'),
(3008776,42159,0,'Skoll 3');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
