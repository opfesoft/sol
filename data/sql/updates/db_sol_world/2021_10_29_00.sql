-- DB update 2021_10_28_01 -> 2021_10_29_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_28_01';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_28_01 2021_10_29_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1635498840005132387'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1635498840005132387');

DELETE FROM `creature` WHERE `guid` IN (945802,945803,3008925,3008926);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `wander_distance`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`, `VerifiedBuild`)
VALUES
(945802,10644,1,331,0,1,1,0,0,3823.67,52.756,10.9712,0,9900,20,1,0,1,0,0,0,0),
(945803,10644,1,331,0,1,1,0,0,3538.36,400.485,3.13275,0,9900,25,1,0,1,0,0,0,0),
(3008925,10644,1,331,0,1,1,0,0,3489.89,666.226,5.58574,0,9900,20,1,0,1,0,0,0,0),
(3008926,10644,1,331,0,1,1,0,0,3330.55,397.033,3.65949,0,9900,25,1,0,1,0,0,0,0);

UPDATE `creature` SET `spawntimesecs` = 9900 WHERE `guid` = 32884;

UPDATE `pool_template` SET `description` = 'Mist Howler Spawn (1 out of 6)' WHERE `entry` = 32884;

DELETE FROM `pool_creature` WHERE `guid` IN (945802,945803,3008925,3008926);
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(945802,32884,0,'Mist Howler 3'),
(945803,32884,0,'Mist Howler 4'),
(3008925,32884,0,'Mist Howler 5'),
(3008926,32884,0,'Mist Howler 6');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
