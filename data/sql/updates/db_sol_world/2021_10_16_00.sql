-- DB update 2021_10_15_04 -> 2021_10_16_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_10_15_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_10_15_04 2021_10_16_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1634395784048919526'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1634395784048919526');

UPDATE `creature` SET `wander_distance` = 3, `MovementType` = 1 WHERE `guid` IN (82050,82048,82049);
UPDATE `creature` SET `wander_distance` = 7, `MovementType` = 1 WHERE `guid` = 82083;
UPDATE `creature` SET `wander_distance` = 5, `MovementType` = 1 WHERE `guid` IN (82053,82054,82055,82084);
UPDATE `creature` SET `position_x` = 7637.04, `position_y` = -7408.28, `position_z` = 162.275, `wander_distance` = 3, `MovementType` = 1 WHERE `guid` = 82052;
UPDATE `creature` SET `position_x` = 7636.84, `position_y` = -7393.74, `position_z` = 161.973, `wander_distance` = 4, `MovementType` = 1 WHERE `guid` = 82051;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
