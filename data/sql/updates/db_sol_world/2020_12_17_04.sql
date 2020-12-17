-- DB update 2020_12_17_03 -> 2020_12_17_04
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2020_12_17_03';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2020_12_17_03 2020_12_17_04 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1608230063183006506'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1608230063183006506');

UPDATE `creature` SET `position_x` = 3999.85, `position_y` = 151.828, `position_z` = 3.53713, `MovementType` = 1, `wander_distance` = 30 WHERE `guid` = 32884;
UPDATE `creature` SET `MovementType` = 1, `wander_distance` = 50 WHERE `guid` = 51885;

DELETE FROM `pool_template` WHERE `entry` = 32884;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(32884,1,'Mist Howler Spawn (1 out 2)');

DELETE FROM `pool_creature` WHERE `pool_entry` = 32884;
INSERT INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(32884,32884,0,'Mist Howler 1'),
(51885,32884,0,'Mist Howler 2');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
