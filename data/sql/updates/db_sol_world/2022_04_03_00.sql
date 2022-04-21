-- DB update 2022_04_02_00 -> 2022_04_03_00
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2022_04_02_00';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2022_04_02_00 2022_04_03_00 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1648995498637416842'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1648995498637416842');

UPDATE `creature_template_addon` SET `isLarge` = 0 WHERE `entry` = 832;
DELETE FROM `creature` WHERE `guid` = 48555;
UPDATE `creature` SET `wander_distance` = 30 WHERE `id` = 832;

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;