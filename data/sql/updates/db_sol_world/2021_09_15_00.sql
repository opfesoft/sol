-- DB update 2021_09_14_00 -> 2021_09_15_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_14_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_14_00 2021_09_15_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631658180121823910'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631658180121823910');

DELETE FROM `gameobject` WHERE `guid` IN (20458,20459,31619);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `VerifiedBuild`)
VALUES
(20458,177200,0,0,0,1,1,-8337.72,519.845,122.939,0,-0.667571,-0.233126,-0.667571,0.23313,120,0,1,0),
(20459,177202,0,0,0,1,1,-8347.64,520.972,122.939,0,-0.307199,-0.636889,-0.307198,0.63689,120,0,1,0),
(31619,177201,0,0,0,1,1,-8338.9,509.8,122.931,0,-0.639516,0.309189,-0.633405,-0.306953,120,0,1,0);

DELETE FROM `gameobject_addon` WHERE `guid` IN (20458,20459,31619);
INSERT INTO `gameobject_addon` (`guid`, `invisibilityType`, `invisibilityValue`, `useRotation`)
VALUES
(20458,0,0,1),
(20459,0,0,1),
(31619,0,0,1);

DELETE FROM `game_event_gameobject` WHERE `guid` = 31619;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
