-- DB update 2021_09_09_04 -> 2021_09_09_05
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_sol_world' AND COLUMN_NAME = '2021_09_09_04';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_sol_world CHANGE COLUMN 2021_09_09_04 2021_09_09_05 bit;
SELECT sql_rev INTO OK FROM version_db_sol_world WHERE sql_rev = '1631222164714535835'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--

INSERT INTO `version_db_sol_world` (`sql_rev`) VALUES ('1631222164714535835');

DELETE FROM `pool_template` WHERE `entry` = 507;
INSERT INTO `pool_template` (`entry`, `max_limit`, `description`)
VALUES
(507,1,'Water Barrel and Food Crate7');

DELETE FROM `pool_gameobject` WHERE `pool_entry` = 507;
INSERT INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`)
VALUES
(32287,507,0,'Water Barrel and Food Crate - Spawn 7'),
(32742,507,0,'Water Barrel and Food Crate - Spawn 7');

--
-- END UPDATING QUERIES
--
COMMIT;
END //
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
